export DeathmatchScoreboardMessage
code
proc DeathmatchScoreboardMessage 2484 68
file "../g_cmds.c"
line 16
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:
;5:#include "../../ui/menudef.h"			// for the voice chats
;6:
;7:extern void Team_ReturnFlagSound( gentity_t *ent, int team ); // Shafe
;8:extern void Team_ResetFlags( void ); // Shafe
;9:
;10:/*
;11:==================
;12:DeathmatchScoreboardMessage
;13:
;14:==================
;15:*/
;16:void DeathmatchScoreboardMessage( gentity_t *ent ) {
line 26
;17:	char		entry[1024];
;18:	char		string[1400];
;19:	int			stringlength;
;20:	int			i, j;
;21:	gclient_t	*cl;
;22:	int			numSorted, scoreFlags, accuracy, perfect;
;23:	
;24:
;25:	// send the latest information on all clients
;26:	string[0] = 0;
ADDRLP4 1048
CNSTI1 0
ASGNI1
line 27
;27:	stringlength = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
line 28
;28:	scoreFlags = 0;
ADDRLP4 2452
CNSTI4 0
ASGNI4
line 30
;29:
;30:	numSorted = level.numConnectedClients;
ADDRLP4 2448
ADDRGP4 level+76
INDIRI4
ASGNI4
line 32
;31:	
;32:	for (i=0 ; i < numSorted ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $60
JUMPV
LABELV $57
line 35
;33:		int		ping;
;34:
;35:		cl = &level.clients[level.sortedClients[i]];
ADDRLP4 0
CNSTI4 3392
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 37
;36:
;37:		if ( cl->pers.connected == CON_CONNECTING ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 1
NEI4 $62
line 38
;38:			ping = -1;
ADDRLP4 2456
CNSTI4 -1
ASGNI4
line 39
;39:		} else {
ADDRGP4 $63
JUMPV
LABELV $62
line 42
;40://unlagged - true ping
;41:			//ping = cl->ps.ping < 999 ? cl->ps.ping : 999;
;42:			ping = cl->pers.realPing < 999 ? cl->pers.realPing : 999;
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
INDIRI4
CNSTI4 999
GEI4 $65
ADDRLP4 2460
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $66
JUMPV
LABELV $65
ADDRLP4 2460
CNSTI4 999
ASGNI4
LABELV $66
ADDRLP4 2456
ADDRLP4 2460
INDIRI4
ASGNI4
line 44
;43://unlagged - true ping
;44:		}
LABELV $63
line 47
;45:
;46:
;47:		if( cl->accuracy_shots ) {
ADDRLP4 0
INDIRP4
CNSTI4 2584
ADDP4
INDIRI4
CNSTI4 0
EQI4 $67
line 48
;48:			accuracy = cl->accuracy_hits * 100 / cl->accuracy_shots;
ADDRLP4 1040
CNSTI4 100
ADDRLP4 0
INDIRP4
CNSTI4 2588
ADDP4
INDIRI4
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 2584
ADDP4
INDIRI4
DIVI4
ASGNI4
line 49
;49:		}
ADDRGP4 $68
JUMPV
LABELV $67
line 50
;50:		else {
line 51
;51:			accuracy = 0;
ADDRLP4 1040
CNSTI4 0
ASGNI4
line 52
;52:		}
LABELV $68
line 53
;53:		perfect = ( cl->ps.persistant[PERS_RANK] == 0 && cl->ps.persistant[PERS_KILLED] == 0 ) ? 1 : 0;
ADDRLP4 2468
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ADDRLP4 2468
INDIRI4
NEI4 $70
ADDRLP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ADDRLP4 2468
INDIRI4
NEI4 $70
ADDRLP4 2460
CNSTI4 1
ASGNI4
ADDRGP4 $71
JUMPV
LABELV $70
ADDRLP4 2460
CNSTI4 0
ASGNI4
LABELV $71
ADDRLP4 1044
ADDRLP4 2460
INDIRI4
ASGNI4
line 56
;54:
;55:		// Changed cl->ps.persistant[PERS_SCORE] to .truescore
;56:		Com_sprintf (entry, sizeof(entry),
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $72
ARGP4
ADDRLP4 2472
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 2472
INDIRI4
ADDRGP4 level+88
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 2488
ADDP4
INDIRI4
ARGI4
ADDRLP4 2456
INDIRI4
ARGI4
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
SUBI4
CNSTI4 60000
DIVI4
ARGI4
ADDRLP4 2452
INDIRI4
ARGI4
CNSTI4 836
ADDRLP4 2472
INDIRI4
ADDRGP4 level+88
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+188
ADDP4
INDIRI4
ARGI4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ARGI4
ADDRLP4 1044
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 70
;57:			" %i %i %i %i %i %i %i %i %i %i %i %i %i %i", level.sortedClients[i],
;58:			
;59:			cl->pers.TrueScore, ping, (level.time - cl->pers.enterTime)/60000,
;60:			
;61:
;62:			scoreFlags, g_entities[level.sortedClients[i]].s.powerups, accuracy, 
;63:			cl->ps.persistant[PERS_IMPRESSIVE_COUNT],
;64:			cl->ps.persistant[PERS_EXCELLENT_COUNT],
;65:			cl->ps.persistant[PERS_GAUNTLET_FRAG_COUNT], 
;66:			cl->ps.persistant[PERS_DEFEND_COUNT], 
;67:			cl->ps.persistant[PERS_ASSIST_COUNT], 
;68:			perfect,
;69:			cl->ps.persistant[PERS_CAPTURES]);
;70:		j = strlen(entry);
ADDRLP4 8
ARGP4
ADDRLP4 2480
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 2480
INDIRI4
ASGNI4
line 71
;71:		if (stringlength + j > 1024)
ADDRLP4 1032
INDIRI4
ADDRLP4 1036
INDIRI4
ADDI4
CNSTI4 1024
LEI4 $77
line 72
;72:			break;
ADDRGP4 $59
JUMPV
LABELV $77
line 73
;73:		strcpy (string + stringlength, entry);
ADDRLP4 1032
INDIRI4
ADDRLP4 1048
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 74
;74:		stringlength += j;
ADDRLP4 1032
ADDRLP4 1032
INDIRI4
ADDRLP4 1036
INDIRI4
ADDI4
ASGNI4
line 75
;75:	}
LABELV $58
line 32
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $60
ADDRLP4 4
INDIRI4
ADDRLP4 2448
INDIRI4
LTI4 $57
LABELV $59
line 77
;76:
;77:	trap_SendServerCommand( ent-g_entities, va("scores %i %i %i%s", i, 
ADDRGP4 $79
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 level+44+4
INDIRI4
ARGI4
ADDRGP4 level+44+8
INDIRI4
ARGI4
ADDRLP4 1048
ARGP4
ADDRLP4 2456
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRLP4 2456
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 80
;78:		level.teamScores[TEAM_RED], level.teamScores[TEAM_BLUE],
;79:		string ) );
;80:}
LABELV $55
endproc DeathmatchScoreboardMessage 2484 68
export Cmd_TeleGren_f
proc Cmd_TeleGren_f 12 4
line 92
;81:
;82:
;83:/*
;84:
;85:=================
;86:
;87:Cmd_TeleGren_f
;88:Shafe - Trep - PDG
;89:=================
;90:*/
;91:
;92:void Cmd_TeleGren_f (gentity_t *ent) {
line 94
;93:
;94:    if ( ent->istelepoint == 1 ) 
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRI4
CNSTI4 1
NEI4 $85
line 95
;95:	{
line 99
;96:		// Shafe The old way was just to drop it now we return flags to base if you try to teleport with one
;97:		//Team_ReturnFlagSound(Team_ResetFlag(ent->client->sess.sessionTeam), ent->client->sess.sessionTeam); // Maybe we should check to see if they have one before we try to drop it?
;98:		//Team_ResetFlag(ent->client->sess.sessionTeam)
;99:		Team_DropFlags( ent );  // Old Way
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Team_DropFlags
CALLV
pop
line 101
;100:		
;101:		VectorCopy( ent->teleloc, ent->client->ps.origin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRB
ASGNB 12
line 102
;102:		ent->istelepoint = 0;
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
CNSTI4 0
ASGNI4
line 103
;103:		VectorClear( ent->teleloc );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 820
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 816
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 812
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 105
;104:
;105:	} else {
ADDRGP4 $86
JUMPV
LABELV $85
line 106
;106:        G_Printf( S_COLOR_GREEN "PDG Lock Not Established\n" );
ADDRGP4 $87
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 108
;107:
;108:	}
LABELV $86
line 110
;109:
;110:}
LABELV $84
endproc Cmd_TeleGren_f 12 4
export Cmd_DropFlag_f
proc Cmd_DropFlag_f 0 4
line 121
;111:
;112:/*
;113:
;114:=================
;115:
;116:Cmd_DropFlag_f
;117:Shafe - Trep - PDG
;118:=================
;119:*/
;120:
;121:void Cmd_DropFlag_f (gentity_t *ent) {
line 123
;122:
;123:	Team_DropFlags( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Team_DropFlags
CALLV
pop
line 125
;124:
;125:}
LABELV $88
endproc Cmd_DropFlag_f 0 4
export Cmd_Score_f
proc Cmd_Score_f 0 4
line 135
;126:
;127:
;128:/*
;129:==================
;130:Cmd_Score_f
;131:
;132:Request current scoreboard information
;133:==================
;134:*/
;135:void Cmd_Score_f( gentity_t *ent ) {
line 136
;136:	DeathmatchScoreboardMessage( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 DeathmatchScoreboardMessage
CALLV
pop
line 137
;137:}
LABELV $89
endproc Cmd_Score_f 0 4
export CheatsOk
proc CheatsOk 4 8
line 146
;138:
;139:
;140:
;141:/*
;142:==================
;143:CheatsOk
;144:==================
;145:*/
;146:qboolean	CheatsOk( gentity_t *ent ) {
line 147
;147:	if ( !g_cheats.integer ) {
ADDRGP4 g_cheats+12
INDIRI4
CNSTI4 0
NEI4 $91
line 148
;148:		trap_SendServerCommand( ent-g_entities, va("print \"Cheats are not enabled on this server.\n\""));
ADDRGP4 $94
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 149
;149:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $90
JUMPV
LABELV $91
line 151
;150:	}
;151:	if ( ent->health <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 0
GTI4 $95
line 152
;152:		trap_SendServerCommand( ent-g_entities, va("print \"You must be alive to use this command.\n\""));
ADDRGP4 $97
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 153
;153:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $90
JUMPV
LABELV $95
line 155
;154:	}
;155:	return qtrue;
CNSTI4 1
RETI4
LABELV $90
endproc CheatsOk 4 8
bss
align 1
LABELV $99
skip 1024
export ConcatArgs
code
proc ConcatArgs 1048 12
line 164
;156:}
;157:
;158:
;159:/*
;160:==================
;161:ConcatArgs
;162:==================
;163:*/
;164:char	*ConcatArgs( int start ) {
line 170
;165:	int		i, c, tlen;
;166:	static char	line[MAX_STRING_CHARS];
;167:	int		len;
;168:	char	arg[MAX_STRING_CHARS];
;169:
;170:	len = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 171
;171:	c = trap_Argc();
ADDRLP4 1040
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1040
INDIRI4
ASGNI4
line 172
;172:	for ( i = start ; i < c ; i++ ) {
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRGP4 $103
JUMPV
LABELV $100
line 173
;173:		trap_Argv( i, arg, sizeof( arg ) );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 174
;174:		tlen = strlen( arg );
ADDRLP4 12
ARGP4
ADDRLP4 1044
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1044
INDIRI4
ASGNI4
line 175
;175:		if ( len + tlen >= MAX_STRING_CHARS - 1 ) {
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
CNSTI4 1023
LTI4 $104
line 176
;176:			break;
ADDRGP4 $102
JUMPV
LABELV $104
line 178
;177:		}
;178:		memcpy( line + len, arg, tlen );
ADDRLP4 0
INDIRI4
ADDRGP4 $99
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 179
;179:		len += tlen;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 180
;180:		if ( i != c - 1 ) {
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
CNSTI4 1
SUBI4
EQI4 $106
line 181
;181:			line[len] = ' ';
ADDRLP4 0
INDIRI4
ADDRGP4 $99
ADDP4
CNSTI1 32
ASGNI1
line 182
;182:			len++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 183
;183:		}
LABELV $106
line 184
;184:	}
LABELV $101
line 172
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $103
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
LTI4 $100
LABELV $102
line 186
;185:
;186:	line[len] = 0;
ADDRLP4 0
INDIRI4
ADDRGP4 $99
ADDP4
CNSTI1 0
ASGNI1
line 188
;187:
;188:	return line;
ADDRGP4 $99
RETP4
LABELV $98
endproc ConcatArgs 1048 12
export SanitizeString
proc SanitizeString 16 4
line 198
;189:}
;190:
;191:/*
;192:==================
;193:SanitizeString
;194:
;195:Remove case and control characters
;196:==================
;197:*/
;198:void SanitizeString( char *in, char *out ) {
ADDRGP4 $110
JUMPV
LABELV $109
line 199
;199:	while ( *in ) {
line 200
;200:		if ( *in == 27 ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 27
NEI4 $112
line 201
;201:			in += 2;		// skip color code
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 202
;202:			continue;
ADDRGP4 $110
JUMPV
LABELV $112
line 204
;203:		}
;204:		if ( *in < 32 ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
GEI4 $114
line 205
;205:			in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 206
;206:			continue;
ADDRGP4 $110
JUMPV
LABELV $114
line 208
;207:		}
;208:		*out++ = tolower( *in++ );
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRFP4 4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 12
ADDRGP4 tolower
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 12
INDIRI4
CVII1 4
ASGNI1
line 209
;209:	}
LABELV $110
line 199
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $109
line 211
;210:
;211:	*out = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 212
;212:}
LABELV $108
endproc SanitizeString 16 4
export ClientNumberFromString
proc ClientNumberFromString 2072 8
line 222
;213:
;214:/*
;215:==================
;216:ClientNumberFromString
;217:
;218:Returns a player number for either a number or name string
;219:Returns -1 if invalid
;220:==================
;221:*/
;222:int ClientNumberFromString( gentity_t *to, char *s ) {
line 229
;223:	gclient_t	*cl;
;224:	int			idnum;
;225:	char		s2[MAX_STRING_CHARS];
;226:	char		n2[MAX_STRING_CHARS];
;227:
;228:	// numeric values are just slot numbers
;229:	if (s[0] >= '0' && s[0] <= '9') {
ADDRLP4 2056
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 48
LTI4 $117
ADDRLP4 2056
INDIRI4
CNSTI4 57
GTI4 $117
line 230
;230:		idnum = atoi( s );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 2060
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 2060
INDIRI4
ASGNI4
line 231
;231:		if ( idnum < 0 || idnum >= level.maxclients ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $122
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $119
LABELV $122
line 232
;232:			trap_SendServerCommand( to-g_entities, va("print \"Bad client slot: %i\n\"", idnum));
ADDRGP4 $123
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 2068
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRLP4 2068
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 233
;233:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $116
JUMPV
LABELV $119
line 236
;234:		}
;235:
;236:		cl = &level.clients[idnum];
ADDRLP4 0
CNSTI4 3392
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 237
;237:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $124
line 238
;238:			trap_SendServerCommand( to-g_entities, va("print \"Client %i is not active\n\"", idnum));
ADDRGP4 $126
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 2068
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRLP4 2068
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 239
;239:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $116
JUMPV
LABELV $124
line 241
;240:		}
;241:		return idnum;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $116
JUMPV
LABELV $117
line 245
;242:	}
;243:
;244:	// check for a name match
;245:	SanitizeString( s, s2 );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
ADDRGP4 SanitizeString
CALLV
pop
line 246
;246:	for ( idnum=0,cl=level.clients ; idnum < level.maxclients ; idnum++,cl++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 level
INDIRP4
ASGNP4
ADDRGP4 $130
JUMPV
LABELV $127
line 247
;247:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $132
line 248
;248:			continue;
ADDRGP4 $128
JUMPV
LABELV $132
line 250
;249:		}
;250:		SanitizeString( cl->pers.netname, n2 );
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 SanitizeString
CALLV
pop
line 251
;251:		if ( !strcmp( n2, s2 ) ) {
ADDRLP4 8
ARGP4
ADDRLP4 1032
ARGP4
ADDRLP4 2060
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2060
INDIRI4
CNSTI4 0
NEI4 $134
line 252
;252:			return idnum;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $116
JUMPV
LABELV $134
line 254
;253:		}
;254:	}
LABELV $128
line 246
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 3392
ADDP4
ASGNP4
LABELV $130
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $127
line 256
;255:
;256:	trap_SendServerCommand( to-g_entities, va("print \"User %s is not on the server\n\"", s));
ADDRGP4 $136
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 2060
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRLP4 2060
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 257
;257:	return -1;
CNSTI4 -1
RETI4
LABELV $116
endproc ClientNumberFromString 2072 8
export Cmd_Give_f
proc Cmd_Give_f 132 12
line 268
;258:}
;259:
;260:/*
;261:==================
;262:Cmd_Give_f
;263:
;264:Give items to a client
;265:==================
;266:*/
;267:void Cmd_Give_f (gentity_t *ent)
;268:{
line 276
;269:	char		*name;
;270:	gitem_t		*it;
;271:	int			i;
;272:	qboolean	give_all;
;273:	gentity_t		*it_ent;
;274:	trace_t		trace;
;275:
;276:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $138
line 277
;277:		return;
ADDRGP4 $137
JUMPV
LABELV $138
line 280
;278:	}
;279:
;280:	name = ConcatArgs( 1 );
CNSTI4 1
ARGI4
ADDRLP4 80
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 80
INDIRP4
ASGNP4
line 282
;281:
;282:	if (Q_stricmp(name, "all") == 0)
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $142
ARGP4
ADDRLP4 84
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $140
line 283
;283:		give_all = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $141
JUMPV
LABELV $140
line 285
;284:	else
;285:		give_all = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $141
line 287
;286:
;287:	if (give_all || Q_stricmp( name, "health") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $146
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 88
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $143
LABELV $146
line 288
;288:	{
line 289
;289:		ent->health = ent->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 740
ADDP4
ADDRLP4 92
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ASGNI4
line 290
;290:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $147
line 291
;291:			return;
ADDRGP4 $137
JUMPV
LABELV $147
line 292
;292:	}
LABELV $143
line 294
;293:
;294:	if (give_all || Q_stricmp(name, "weapons") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $152
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $151
ARGP4
ADDRLP4 92
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $149
LABELV $152
line 295
;295:	{
line 296
;296:		ent->client->ps.stats[STAT_WEAPONS] = (1 << WP_NUM_WEAPONS) - 1 - 
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 1022
ASGNI4
line 298
;297:			( 1 << WP_GRAPPLING_HOOK ) - ( 1 << WP_NONE );
;298:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $153
line 299
;299:			return;
ADDRGP4 $137
JUMPV
LABELV $153
line 300
;300:	}
LABELV $149
line 302
;301:
;302:	if (give_all || Q_stricmp(name, "ammo") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $158
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $157
ARGP4
ADDRLP4 96
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
NEI4 $155
LABELV $158
line 303
;303:	{
line 304
;304:		for ( i = 0 ; i < MAX_WEAPONS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $159
line 305
;305:			ent->client->ps.ammo[i] = 999;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
CNSTI4 999
ASGNI4
line 306
;306:		}
LABELV $160
line 304
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $159
line 307
;307:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $163
line 308
;308:			return;
ADDRGP4 $137
JUMPV
LABELV $163
line 309
;309:	}
LABELV $155
line 311
;310:
;311:	if (give_all || Q_stricmp(name, "armor") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $168
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $167
ARGP4
ADDRLP4 100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $165
LABELV $168
line 312
;312:	{
line 313
;313:		ent->client->ps.stats[STAT_ARMOR] = 200;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 200
ASGNI4
line 315
;314:
;315:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $169
line 316
;316:			return;
ADDRGP4 $137
JUMPV
LABELV $169
line 317
;317:	}
LABELV $165
line 319
;318:
;319:	if (Q_stricmp(name, "excellent") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $173
ARGP4
ADDRLP4 104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
NEI4 $171
line 320
;320:		ent->client->ps.persistant[PERS_EXCELLENT_COUNT]++;
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 288
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 321
;321:		return;
ADDRGP4 $137
JUMPV
LABELV $171
line 323
;322:	}
;323:	if (Q_stricmp(name, "impressive") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $176
ARGP4
ADDRLP4 108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $174
line 324
;324:		ent->client->ps.persistant[PERS_IMPRESSIVE_COUNT]++;
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 284
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 325
;325:		return;
ADDRGP4 $137
JUMPV
LABELV $174
line 327
;326:	}
;327:	if (Q_stricmp(name, "gauntletaward") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $179
ARGP4
ADDRLP4 112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
NEI4 $177
line 328
;328:		ent->client->ps.persistant[PERS_GAUNTLET_FRAG_COUNT]++;
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 300
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 329
;329:		return;
ADDRGP4 $137
JUMPV
LABELV $177
line 331
;330:	}
;331:	if (Q_stricmp(name, "defend") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $182
ARGP4
ADDRLP4 116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
NEI4 $180
line 332
;332:		ent->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 292
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 333
;333:		return;
ADDRGP4 $137
JUMPV
LABELV $180
line 335
;334:	}
;335:	if (Q_stricmp(name, "assist") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $185
ARGP4
ADDRLP4 120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
NEI4 $183
line 336
;336:		ent->client->ps.persistant[PERS_ASSIST_COUNT]++;
ADDRLP4 124
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 296
ADDP4
ASGNP4
ADDRLP4 124
INDIRP4
ADDRLP4 124
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 337
;337:		return;
ADDRGP4 $137
JUMPV
LABELV $183
line 341
;338:	}
;339:
;340:	// spawn a specific item right on the player
;341:	if ( !give_all ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $186
line 342
;342:		it = BG_FindItem (name);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 124
INDIRP4
ASGNP4
line 343
;343:		if (!it) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $188
line 344
;344:			return;
ADDRGP4 $137
JUMPV
LABELV $188
line 347
;345:		}
;346:
;347:		it_ent = G_Spawn();
ADDRLP4 128
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 128
INDIRP4
ASGNP4
line 348
;348:		VectorCopy( ent->r.currentOrigin, it_ent->s.origin );
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 349
;349:		it_ent->classname = it->classname;
ADDRLP4 12
INDIRP4
CNSTI4 524
ADDP4
ADDRLP4 16
INDIRP4
INDIRP4
ASGNP4
line 350
;350:		G_SpawnItem (it_ent, it);
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 G_SpawnItem
CALLV
pop
line 351
;351:		FinishSpawningItem(it_ent );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 FinishSpawningItem
CALLV
pop
line 352
;352:		memset( &trace, 0, sizeof( trace ) );
ADDRLP4 20
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 memset
CALLP4
pop
line 353
;353:		Touch_Item (it_ent, ent, &trace);
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 Touch_Item
CALLV
pop
line 354
;354:		if (it_ent->inuse) {
ADDRLP4 12
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $190
line 355
;355:			G_FreeEntity( it_ent );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 356
;356:		}
LABELV $190
line 357
;357:	}
LABELV $186
line 358
;358:}
LABELV $137
endproc Cmd_Give_f 132 12
export Cmd_God_f
proc Cmd_God_f 16 8
line 371
;359:
;360:
;361:/*
;362:==================
;363:Cmd_God_f
;364:
;365:Sets client to godmode
;366:
;367:argv(0) god
;368:==================
;369:*/
;370:void Cmd_God_f (gentity_t *ent)
;371:{
line 374
;372:	char	*msg;
;373:
;374:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $193
line 375
;375:		return;
ADDRGP4 $192
JUMPV
LABELV $193
line 378
;376:	}
;377:
;378:	ent->flags ^= FL_GODMODE;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 16
BXORI4
ASGNI4
line 379
;379:	if (!(ent->flags & FL_GODMODE) )
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $195
line 380
;380:		msg = "godmode OFF\n";
ADDRLP4 0
ADDRGP4 $197
ASGNP4
ADDRGP4 $196
JUMPV
LABELV $195
line 382
;381:	else
;382:		msg = "godmode ON\n";
ADDRLP4 0
ADDRGP4 $198
ASGNP4
LABELV $196
line 384
;383:
;384:	trap_SendServerCommand( ent-g_entities, va("print \"%s\"", msg));
ADDRGP4 $199
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 385
;385:}
LABELV $192
endproc Cmd_God_f 16 8
export Cmd_Notarget_f
proc Cmd_Notarget_f 16 8
line 397
;386:
;387:
;388:/*
;389:==================
;390:Cmd_Notarget_f
;391:
;392:Sets client to notarget
;393:
;394:argv(0) notarget
;395:==================
;396:*/
;397:void Cmd_Notarget_f( gentity_t *ent ) {
line 400
;398:	char	*msg;
;399:
;400:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $201
line 401
;401:		return;
ADDRGP4 $200
JUMPV
LABELV $201
line 404
;402:	}
;403:
;404:	ent->flags ^= FL_NOTARGET;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BXORI4
ASGNI4
line 405
;405:	if (!(ent->flags & FL_NOTARGET) )
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $203
line 406
;406:		msg = "notarget OFF\n";
ADDRLP4 0
ADDRGP4 $205
ASGNP4
ADDRGP4 $204
JUMPV
LABELV $203
line 408
;407:	else
;408:		msg = "notarget ON\n";
ADDRLP4 0
ADDRGP4 $206
ASGNP4
LABELV $204
line 410
;409:
;410:	trap_SendServerCommand( ent-g_entities, va("print \"%s\"", msg));
ADDRGP4 $199
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 411
;411:}
LABELV $200
endproc Cmd_Notarget_f 16 8
export Cmd_Noclip_f
proc Cmd_Noclip_f 20 8
line 421
;412:
;413:
;414:/*
;415:==================
;416:Cmd_Noclip_f
;417:
;418:argv(0) noclip
;419:==================
;420:*/
;421:void Cmd_Noclip_f( gentity_t *ent ) {
line 424
;422:	char	*msg;
;423:
;424:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $208
line 425
;425:		return;
ADDRGP4 $207
JUMPV
LABELV $208
line 428
;426:	}
;427:
;428:	if ( ent->client->noclip ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2524
ADDP4
INDIRI4
CNSTI4 0
EQI4 $210
line 429
;429:		msg = "noclip OFF\n";
ADDRLP4 0
ADDRGP4 $212
ASGNP4
line 430
;430:	} else {
ADDRGP4 $211
JUMPV
LABELV $210
line 431
;431:		msg = "noclip ON\n";
ADDRLP4 0
ADDRGP4 $213
ASGNP4
line 432
;432:	}
LABELV $211
line 433
;433:	ent->client->noclip = !ent->client->noclip;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2524
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $215
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $216
JUMPV
LABELV $215
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $216
ADDRLP4 12
INDIRP4
ADDRLP4 8
INDIRI4
ASGNI4
line 435
;434:
;435:	trap_SendServerCommand( ent-g_entities, va("print \"%s\"", msg));
ADDRGP4 $199
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 436
;436:}
LABELV $207
endproc Cmd_Noclip_f 20 8
export Cmd_LevelShot_f
proc Cmd_LevelShot_f 4 8
line 449
;437:
;438:
;439:/*
;440:==================
;441:Cmd_LevelShot_f
;442:
;443:This is just to help generate the level pictures
;444:for the menus.  It goes to the intermission immediately
;445:and sends over a command to the client to resize the view,
;446:hide the scoreboard, and take a special screenshot
;447:==================
;448:*/
;449:void Cmd_LevelShot_f( gentity_t *ent ) {
line 450
;450:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $218
line 451
;451:		return;
ADDRGP4 $217
JUMPV
LABELV $218
line 455
;452:	}
;453:
;454:	// doesn't work in single player
;455:	if ( g_gametype.integer != 0 ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
EQI4 $220
line 456
;456:		trap_SendServerCommand( ent-g_entities, 
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRGP4 $223
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 458
;457:			"print \"Must be in g_gametype 0 for levelshot\n\"" );
;458:		return;
ADDRGP4 $217
JUMPV
LABELV $220
line 461
;459:	}
;460:
;461:	BeginIntermission();
ADDRGP4 BeginIntermission
CALLV
pop
line 462
;462:	trap_SendServerCommand( ent-g_entities, "clientLevelShot" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRGP4 $224
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 463
;463:}
LABELV $217
endproc Cmd_LevelShot_f 4 8
export Cmd_TeamTask_f
proc Cmd_TeamTask_f 2068 12
line 476
;464:
;465:
;466:/*
;467:==================
;468:Cmd_LevelShot_f
;469:
;470:This is just to help generate the level pictures
;471:for the menus.  It goes to the intermission immediately
;472:and sends over a command to the client to resize the view,
;473:hide the scoreboard, and take a special screenshot
;474:==================
;475:*/
;476:void Cmd_TeamTask_f( gentity_t *ent ) {
line 480
;477:	char userinfo[MAX_INFO_STRING];
;478:	char		arg[MAX_TOKEN_CHARS];
;479:	int task;
;480:	int client = ent->client - level.clients;
ADDRLP4 1024
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3392
DIVI4
ASGNI4
line 482
;481:
;482:	if ( trap_Argc() != 2 ) {
ADDRLP4 2056
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 2
EQI4 $226
line 483
;483:		return;
ADDRGP4 $225
JUMPV
LABELV $226
line 485
;484:	}
;485:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 486
;486:	task = atoi( arg );
ADDRLP4 1028
ARGP4
ADDRLP4 2060
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2052
ADDRLP4 2060
INDIRI4
ASGNI4
line 488
;487:
;488:	trap_GetUserinfo(client, userinfo, sizeof(userinfo));
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 489
;489:	Info_SetValueForKey(userinfo, "teamtask", va("%d", task));
ADDRGP4 $229
ARGP4
ADDRLP4 2052
INDIRI4
ARGI4
ADDRLP4 2064
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $228
ARGP4
ADDRLP4 2064
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 490
;490:	trap_SetUserinfo(client, userinfo);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 491
;491:	ClientUserinfoChanged(client);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 492
;492:}
LABELV $225
endproc Cmd_TeamTask_f 2068 12
export Cmd_Kill_f
proc Cmd_Kill_f 16 20
line 501
;493:
;494:
;495:
;496:/*
;497:=================
;498:Cmd_Kill_f
;499:=================
;500:*/
;501:void Cmd_Kill_f( gentity_t *ent ) {
line 502
;502:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 3
NEI4 $231
line 503
;503:		return;
ADDRGP4 $230
JUMPV
LABELV $231
line 505
;504:	}
;505:	if (ent->health <= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 0
GTI4 $233
line 506
;506:		return;
ADDRGP4 $230
JUMPV
LABELV $233
line 508
;507:	}
;508:	ent->flags &= ~FL_GODMODE;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 509
;509:	ent->client->ps.stats[STAT_HEALTH] = ent->health = -999;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 -999
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 740
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 510
;510:	player_die (ent, ent, ent, 100000, MOD_SUICIDE);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 player_die
CALLV
pop
line 511
;511:}
LABELV $230
endproc Cmd_Kill_f 16 20
export BroadcastTeamChange
proc BroadcastTeamChange 8 8
line 521
;512:
;513:/*
;514:=================
;515:BroadCastTeamChange
;516:
;517:Let everyone know about a team change
;518:=================
;519:*/
;520:void BroadcastTeamChange( gclient_t *client, int oldTeam )
;521:{
line 522
;522:	if ( client->sess.sessionTeam == TEAM_RED ) {
ADDRFP4 0
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 1
NEI4 $236
line 523
;523:		trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " joined the red team.\n\"",
ADDRGP4 $238
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 525
;524:			client->pers.netname) );
;525:	} else if ( client->sess.sessionTeam == TEAM_BLUE ) {
ADDRGP4 $237
JUMPV
LABELV $236
ADDRFP4 0
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 2
NEI4 $239
line 526
;526:		trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " joined the blue team.\n\"",
ADDRGP4 $241
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 528
;527:		client->pers.netname));
;528:	} else if ( client->sess.sessionTeam == TEAM_SPECTATOR && oldTeam != TEAM_SPECTATOR ) {
ADDRGP4 $240
JUMPV
LABELV $239
ADDRLP4 0
CNSTI4 3
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $242
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $242
line 530
;529:		
;530:		if (client->pers.Eliminated) 
ADDRFP4 0
INDIRP4
CNSTI4 2484
ADDP4
INDIRI4
CNSTI4 0
EQI4 $244
line 531
;531:		{
line 533
;532:		
;533:			if (g_GameMode.integer == 1) 
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
NEI4 $246
line 534
;534:			{
line 535
;535:				trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE "'s Arsenal Is Empty.\n\"", client->pers.netname));
ADDRGP4 $249
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 536
;536:			}
LABELV $246
line 537
;537:			if (g_GameMode.integer == 2) 
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
NEI4 $243
line 538
;538:			{
line 539
;539:				trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " Has Been Eliminated!.\n\"", client->pers.netname));
ADDRGP4 $253
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 540
;540:			}
line 541
;541:		} 
ADDRGP4 $243
JUMPV
LABELV $244
line 544
;542:
;543:		else 
;544:		{
line 545
;545:			trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " joined the spectators.\n\"", client->pers.netname));
ADDRGP4 $254
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 546
;546:		}
line 548
;547:
;548:	} else if ( client->sess.sessionTeam == TEAM_FREE ) {
ADDRGP4 $243
JUMPV
LABELV $242
ADDRFP4 0
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 0
NEI4 $255
line 549
;549:		trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " joined the battle.\n\"",
ADDRGP4 $257
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 551
;550:		client->pers.netname));
;551:	}
LABELV $255
LABELV $243
LABELV $240
LABELV $237
line 552
;552:}
LABELV $235
endproc BroadcastTeamChange 8 8
export SetTeam
proc SetTeam 96 20
line 559
;553:
;554:/*
;555:=================
;556:SetTeam
;557:=================
;558:*/
;559:void SetTeam( gentity_t *ent, char *s ) {
line 570
;560:	int					team, oldTeam;
;561:	gclient_t			*client;
;562:	int					clientNum;
;563:	spectatorState_t	specState;
;564:	int					specClient;
;565:	int					teamLeader;
;566:
;567:	//
;568:	// see what change is requested
;569:	//
;570:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 572
;571:
;572:	clientNum = client - level.clients;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3392
DIVI4
ASGNI4
line 573
;573:	specClient = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 574
;574:	specState = SPECTATOR_NOT;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 575
;575:	if ( !Q_stricmp( s, "scoreboard" ) || !Q_stricmp( s, "score" )  ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $261
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $263
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $262
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $259
LABELV $263
line 576
;576:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 577
;577:		specState = SPECTATOR_SCOREBOARD;
ADDRLP4 16
CNSTI4 3
ASGNI4
line 578
;578:	} else if ( !Q_stricmp( s, "follow1" ) ) {
ADDRGP4 $260
JUMPV
LABELV $259
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $266
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $264
line 579
;579:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 580
;580:		specState = SPECTATOR_FOLLOW;
ADDRLP4 16
CNSTI4 2
ASGNI4
line 581
;581:		specClient = -1;
ADDRLP4 20
CNSTI4 -1
ASGNI4
line 582
;582:	} else if ( !Q_stricmp( s, "follow2" ) ) {
ADDRGP4 $265
JUMPV
LABELV $264
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $269
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $267
line 583
;583:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 584
;584:		specState = SPECTATOR_FOLLOW;
ADDRLP4 16
CNSTI4 2
ASGNI4
line 585
;585:		specClient = -2;
ADDRLP4 20
CNSTI4 -2
ASGNI4
line 586
;586:	} else if ( !Q_stricmp( s, "spectator" ) || !Q_stricmp( s, "s" ) ) {
ADDRGP4 $268
JUMPV
LABELV $267
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $272
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $274
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $273
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $270
LABELV $274
line 587
;587:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 588
;588:		specState = SPECTATOR_FREE;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 589
;589:	} else if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 $271
JUMPV
LABELV $270
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $275
line 591
;590:		// if running a team game, assign player to one of the teams
;591:		specState = SPECTATOR_NOT;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 592
;592:		if ( !Q_stricmp( s, "red" ) || !Q_stricmp( s, "r" ) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $280
ARGP4
ADDRLP4 52
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $282
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $281
ARGP4
ADDRLP4 56
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $278
LABELV $282
line 593
;593:			team = TEAM_RED;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 594
;594:		} else if ( !Q_stricmp( s, "blue" ) || !Q_stricmp( s, "b" ) ) {
ADDRGP4 $279
JUMPV
LABELV $278
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $285
ARGP4
ADDRLP4 60
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $287
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $286
ARGP4
ADDRLP4 64
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $283
LABELV $287
line 595
;595:			team = TEAM_BLUE;
ADDRLP4 4
CNSTI4 2
ASGNI4
line 596
;596:		} else {
ADDRGP4 $284
JUMPV
LABELV $283
line 598
;597:			// pick the team with the least number of players
;598:			team = PickTeam( clientNum );
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 PickTeam
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 68
INDIRI4
ASGNI4
line 599
;599:		}
LABELV $284
LABELV $279
line 601
;600:
;601:		if ( g_teamForceBalance.integer  ) {
ADDRGP4 g_teamForceBalance+12
INDIRI4
CNSTI4 0
EQI4 $276
line 604
;602:			int		counts[TEAM_NUM_TEAMS];
;603:
;604:			counts[TEAM_BLUE] = TeamCount( ent->client->ps.clientNum, TEAM_BLUE );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 84
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 68+8
ADDRLP4 84
INDIRI4
ASGNI4
line 605
;605:			counts[TEAM_RED] = TeamCount( ent->client->ps.clientNum, TEAM_RED );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 88
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 68+4
ADDRLP4 88
INDIRI4
ASGNI4
line 608
;606:
;607:			// We allow a spread of two
;608:			if ( team == TEAM_RED && counts[TEAM_RED] - counts[TEAM_BLUE] > 1 ) {
ADDRLP4 92
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 92
INDIRI4
NEI4 $293
ADDRLP4 68+4
INDIRI4
ADDRLP4 68+8
INDIRI4
SUBI4
ADDRLP4 92
INDIRI4
LEI4 $293
line 609
;609:				trap_SendServerCommand( ent->client->ps.clientNum, 
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 $297
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 611
;610:					"cp \"Red team has too many players.\n\"" );
;611:				return; // ignore the request
ADDRGP4 $258
JUMPV
LABELV $293
line 613
;612:			}
;613:			if ( team == TEAM_BLUE && counts[TEAM_BLUE] - counts[TEAM_RED] > 1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $276
ADDRLP4 68+8
INDIRI4
ADDRLP4 68+4
INDIRI4
SUBI4
CNSTI4 1
LEI4 $276
line 614
;614:				trap_SendServerCommand( ent->client->ps.clientNum, 
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 $302
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 616
;615:					"cp \"Blue team has too many players.\n\"" );
;616:				return; // ignore the request
ADDRGP4 $258
JUMPV
line 620
;617:			}
;618:
;619:			// It's ok, the team we are switching to has less or same number of players
;620:		}
line 622
;621:
;622:	} else {
LABELV $275
line 624
;623:		// force them to spectators if there aren't any spots free
;624:		team = TEAM_FREE;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 625
;625:	}
LABELV $276
LABELV $271
LABELV $268
LABELV $265
LABELV $260
line 628
;626:
;627:	// override decision if limiting the players
;628:	if ( (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $303
ADDRGP4 level+80
INDIRI4
CNSTI4 2
LTI4 $303
line 629
;629:		&& level.numNonSpectatorClients >= 2 ) {
line 630
;630:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 631
;631:	} else if ( g_maxGameClients.integer > 0 && 
ADDRGP4 $304
JUMPV
LABELV $303
ADDRGP4 g_maxGameClients+12
INDIRI4
CNSTI4 0
LEI4 $307
ADDRGP4 level+80
INDIRI4
ADDRGP4 g_maxGameClients+12
INDIRI4
LTI4 $307
line 632
;632:		level.numNonSpectatorClients >= g_maxGameClients.integer ) {
line 633
;633:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 634
;634:	}
LABELV $307
LABELV $304
line 639
;635:
;636:	//
;637:	// decide if we will allow the change
;638:	//
;639:	oldTeam = client->sess.sessionTeam;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
ASGNI4
line 640
;640:	if ( team == oldTeam && team != TEAM_SPECTATOR ) {
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $312
ADDRLP4 4
INDIRI4
CNSTI4 3
EQI4 $312
line 641
;641:		return;
ADDRGP4 $258
JUMPV
LABELV $312
line 649
;642:	}
;643:
;644:	//
;645:	// execute the team change
;646:	//
;647:
;648:	// if the player was dead leave the body
;649:	if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $314
line 650
;650:		CopyToBodyQue(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CopyToBodyQue
CALLV
pop
line 651
;651:	}
LABELV $314
line 654
;652:
;653:	// he starts at 'base'
;654:	client->pers.teamState.state = TEAM_BEGIN;
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 0
ASGNI4
line 655
;655:	if ( oldTeam != TEAM_SPECTATOR ) {
ADDRLP4 8
INDIRI4
CNSTI4 3
EQI4 $316
line 657
;656:		// Kill him (makes sure he loses flags, etc)
;657:		ent->flags &= ~FL_GODMODE;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 658
;658:		ent->client->ps.stats[STAT_HEALTH] = ent->health = 0;
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 740
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
line 659
;659:		player_die (ent, ent, ent, 100000, MOD_SUICIDE);
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 player_die
CALLV
pop
line 661
;660:
;661:	}
LABELV $316
line 663
;662:	// they go to the end of the line for tournements
;663:	if ( team == TEAM_SPECTATOR ) {
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $318
line 664
;664:		client->sess.spectatorTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 2496
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 665
;665:	}
LABELV $318
line 667
;666:
;667:	client->sess.sessionTeam = team;
ADDRLP4 0
INDIRP4
CNSTI4 2492
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 668
;668:	client->sess.spectatorState = specState;
ADDRLP4 0
INDIRP4
CNSTI4 2500
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 669
;669:	client->sess.spectatorClient = specClient;
ADDRLP4 0
INDIRP4
CNSTI4 2504
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 671
;670:
;671:	client->sess.teamLeader = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 2516
ADDP4
CNSTI4 0
ASGNI4
line 672
;672:	if ( team == TEAM_RED || team == TEAM_BLUE ) {
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $323
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $321
LABELV $323
line 673
;673:		teamLeader = TeamLeader( team );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 TeamLeader
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 60
INDIRI4
ASGNI4
line 675
;674:		// if there is no team leader or the team leader is a bot and this client is not a bot
;675:		if ( teamLeader == -1 || ( !(g_entities[clientNum].r.svFlags & SVF_BOT) && (g_entities[teamLeader].r.svFlags & SVF_BOT) ) ) {
ADDRLP4 64
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 -1
EQI4 $330
ADDRLP4 68
CNSTI4 836
ASGNI4
ADDRLP4 72
CNSTI4 8
ASGNI4
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 68
INDIRI4
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 g_entities+208+216
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
BANDI4
ADDRLP4 76
INDIRI4
NEI4 $324
ADDRLP4 68
INDIRI4
ADDRLP4 64
INDIRI4
MULI4
ADDRGP4 g_entities+208+216
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
BANDI4
ADDRLP4 76
INDIRI4
EQI4 $324
LABELV $330
line 676
;676:			SetLeader( team, clientNum );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 SetLeader
CALLV
pop
line 677
;677:		}
LABELV $324
line 678
;678:	}
LABELV $321
line 680
;679:	// make sure there is a team leader on the team the player came from
;680:	if ( oldTeam == TEAM_RED || oldTeam == TEAM_BLUE ) {
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $333
ADDRLP4 8
INDIRI4
CNSTI4 2
NEI4 $331
LABELV $333
line 681
;681:		CheckTeamLeader( oldTeam );
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CheckTeamLeader
CALLV
pop
line 682
;682:	}
LABELV $331
line 684
;683:
;684:	BroadcastTeamChange( client, oldTeam );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 BroadcastTeamChange
CALLV
pop
line 687
;685:
;686:	// get and distribute relevent paramters
;687:	ClientUserinfoChanged( clientNum );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 689
;688:
;689:	ClientBegin( clientNum );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 690
;690:}
LABELV $258
endproc SetTeam 96 20
export StopFollowing
proc StopFollowing 12 0
line 700
;691:
;692:/*
;693:=================
;694:StopFollowing
;695:
;696:If the client being followed leaves the game, or you just want to drop
;697:to free floating spectator mode
;698:=================
;699:*/
;700:void StopFollowing( gentity_t *ent ) {
line 701
;701:	ent->client->ps.persistant[ PERS_TEAM ] = TEAM_SPECTATOR;	
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 260
ADDP4
CNSTI4 3
ASGNI4
line 702
;702:	ent->client->sess.sessionTeam = TEAM_SPECTATOR;	
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
CNSTI4 3
ASGNI4
line 703
;703:	ent->client->sess.spectatorState = SPECTATOR_FREE;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2500
ADDP4
CNSTI4 1
ASGNI4
line 704
;704:	ent->client->ps.pm_flags &= ~PMF_FOLLOW;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
line 705
;705:	ent->r.svFlags &= ~SVF_BOT;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 706
;706:	ent->client->ps.clientNum = ent - g_entities;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ASGNI4
line 707
;707:}
LABELV $334
endproc StopFollowing 12 0
export Cmd_Team_f
proc Cmd_Team_f 1036 12
line 714
;708:
;709:/*
;710:=================
;711:Cmd_Team_f
;712:=================
;713:*/
;714:void Cmd_Team_f( gentity_t *ent ) {
line 718
;715:	int			oldTeam;
;716:	char		s[MAX_TOKEN_CHARS];
;717:
;718:	if ( trap_Argc() != 2 ) {
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $336
line 719
;719:		oldTeam = ent->client->sess.sessionTeam;
ADDRLP4 1024
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
ASGNI4
line 720
;720:		switch ( oldTeam ) {
ADDRLP4 1032
ADDRLP4 1024
INDIRI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
LTI4 $335
ADDRLP4 1032
INDIRI4
CNSTI4 3
GTI4 $335
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $348
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $348
address $344
address $342
address $340
address $346
code
LABELV $340
line 722
;721:		case TEAM_BLUE:
;722:			trap_SendServerCommand( ent-g_entities, "print \"Blue team\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRGP4 $341
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 723
;723:			break;
ADDRGP4 $335
JUMPV
LABELV $342
line 725
;724:		case TEAM_RED:
;725:			trap_SendServerCommand( ent-g_entities, "print \"Red team\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRGP4 $343
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 726
;726:			break;
ADDRGP4 $335
JUMPV
LABELV $344
line 728
;727:		case TEAM_FREE:
;728:			trap_SendServerCommand( ent-g_entities, "print \"Free team\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRGP4 $345
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 729
;729:			break;
ADDRGP4 $335
JUMPV
LABELV $346
line 731
;730:		case TEAM_SPECTATOR:
;731:			trap_SendServerCommand( ent-g_entities, "print \"Spectator team\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRGP4 $347
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 732
;732:			break;
line 734
;733:		}
;734:		return;
ADDRGP4 $335
JUMPV
LABELV $336
line 737
;735:	}
;736:
;737:	if (( ent->client->switchTeamTime > level.time ) && (g_gametype.integer != GT_FFA)) 
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2640
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $349
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
EQI4 $349
line 738
;738:	{
line 740
;739:
;740:		trap_SendServerCommand( ent-g_entities, "print \"May not switch teams more than once per 5 seconds.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRGP4 $353
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 741
;741:		return;
ADDRGP4 $335
JUMPV
LABELV $349
line 759
;742:	}
;743:
;744:	/* This is the old way that had issues
;745:	if ((g_Arsenal.integer != 0) && (!level.warmupTime))
;746:	{
;747:				
;748:		if ((ent->client->pers.Eliminated == qtrue) || (level.firstStrike == qtrue))
;749:		{
;750:			if (ent->client->sess.sessionTeam == TEAM_SPECTATOR)
;751:			{
;752:				trap_SendServerCommand( ent-g_entities, "cp \"You Must Wait Until Next Round To Join\"" );
;753:				return;
;754:			}
;755:
;756:		}
;757:	}
;758:	*/ 
;759:	if (!level.warmupTime)
ADDRGP4 level+16
INDIRI4
CNSTI4 0
NEI4 $354
line 760
;760:	{
line 761
;761:		if ((g_GameMode.integer == 1) || (g_GameMode.integer == 2))
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
EQI4 $361
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
NEI4 $357
LABELV $361
line 762
;762:		{
line 764
;763:		
;764:			if (ent->client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 3
NEI4 $362
line 765
;765:			{
line 767
;766:				
;767:				if (ent->client->pers.Eliminated == qtrue) 
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2484
ADDP4
INDIRI4
CNSTI4 1
NEI4 $364
line 768
;768:				{
line 769
;769:					trap_SendServerCommand( ent-g_entities, "cp \"You Are Eliminated Until Next Round.\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRGP4 $366
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 770
;770:					return;
ADDRGP4 $335
JUMPV
LABELV $364
line 772
;771:				}
;772:				if (level.firstStrike == qtrue)
ADDRGP4 level+9228
INDIRI4
CNSTI4 1
NEI4 $367
line 773
;773:				{
line 774
;774:					trap_SendServerCommand( ent-g_entities, "cp \"You Must Wait Until Next Round To Join.\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRGP4 $370
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 775
;775:					return;
ADDRGP4 $335
JUMPV
LABELV $367
line 778
;776:				}
;777:
;778:			}
LABELV $362
line 779
;779:		}
LABELV $357
line 782
;780:
;781:
;782:	}
LABELV $354
line 789
;783:
;784:
;785:	
;786:
;787:
;788:	// if they are playing a tournement game, count as a loss
;789:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $371
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 0
NEI4 $371
line 790
;790:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 791
;791:		ent->client->sess.losses++;
ADDRLP4 1032
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2512
ADDP4
ASGNP4
ADDRLP4 1032
INDIRP4
ADDRLP4 1032
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 792
;792:	}
LABELV $371
line 794
;793:
;794:	trap_Argv( 1, s, sizeof( s ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 796
;795:
;796:	SetTeam( ent, s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 798
;797:
;798:	ent->client->switchTeamTime = level.time + 5000;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2640
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 799
;799:}
LABELV $335
endproc Cmd_Team_f 1036 12
export Cmd_Follow_f
proc Cmd_Follow_f 1040 12
line 807
;800:
;801:
;802:/*
;803:=================
;804:Cmd_Follow_f
;805:=================
;806:*/
;807:void Cmd_Follow_f( gentity_t *ent ) {
line 811
;808:	int		i;
;809:	char	arg[MAX_TOKEN_CHARS];
;810:
;811:	if ( trap_Argc() != 2 ) {
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $376
line 812
;812:		if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2500
ADDP4
INDIRI4
CNSTI4 2
NEI4 $375
line 813
;813:			StopFollowing( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 StopFollowing
CALLV
pop
line 814
;814:		}
line 815
;815:		return;
ADDRGP4 $375
JUMPV
LABELV $376
line 818
;816:	}
;817:
;818:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 819
;819:	i = ClientNumberFromString( ent, arg );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1032
ADDRGP4 ClientNumberFromString
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1032
INDIRI4
ASGNI4
line 820
;820:	if ( i == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $380
line 821
;821:		return;
ADDRGP4 $375
JUMPV
LABELV $380
line 825
;822:	}
;823:
;824:	// can't follow self
;825:	if ( &level.clients[ i ] == ent->client ) {
CNSTI4 3392
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CVPU4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
NEU4 $382
line 826
;826:		return;
ADDRGP4 $375
JUMPV
LABELV $382
line 830
;827:	}
;828:
;829:	// can't follow another spectator
;830:	if ( level.clients[ i ].sess.sessionTeam == TEAM_SPECTATOR ) {
CNSTI4 3392
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 3
NEI4 $384
line 831
;831:		return;
ADDRGP4 $375
JUMPV
LABELV $384
line 835
;832:	}
;833:
;834:	// if they are playing a tournement game, count as a loss
;835:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $386
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 0
NEI4 $386
line 836
;836:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 837
;837:		ent->client->sess.losses++;
ADDRLP4 1036
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2512
ADDP4
ASGNP4
ADDRLP4 1036
INDIRP4
ADDRLP4 1036
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 838
;838:	}
LABELV $386
line 841
;839:
;840:	// first set them to spectator
;841:	if ( ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 3
EQI4 $389
line 842
;842:		SetTeam( ent, "spectator" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $272
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 843
;843:	}
LABELV $389
line 845
;844:
;845:	ent->client->sess.spectatorState = SPECTATOR_FOLLOW;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2500
ADDP4
CNSTI4 2
ASGNI4
line 846
;846:	ent->client->sess.spectatorClient = i;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2504
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 847
;847:}
LABELV $375
endproc Cmd_Follow_f 1040 12
export Cmd_FollowCycle_f
proc Cmd_FollowCycle_f 12 8
line 854
;848:
;849:/*
;850:=================
;851:Cmd_FollowCycle_f
;852:=================
;853:*/
;854:void Cmd_FollowCycle_f( gentity_t *ent, int dir ) {
line 859
;855:	int		clientnum;
;856:	int		original;
;857:
;858:	// if they are playing a tournement game, count as a loss
;859:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $392
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 0
NEI4 $392
line 860
;860:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 861
;861:		ent->client->sess.losses++;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2512
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 862
;862:	}
LABELV $392
line 864
;863:	// first set them to spectator
;864:	if ( ent->client->sess.spectatorState == SPECTATOR_NOT ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2500
ADDP4
INDIRI4
CNSTI4 0
NEI4 $395
line 865
;865:		SetTeam( ent, "spectator" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $272
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 866
;866:	}
LABELV $395
line 868
;867:
;868:	if ( dir != 1 && dir != -1 ) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $397
ADDRLP4 8
INDIRI4
CNSTI4 -1
EQI4 $397
line 869
;869:		G_Error( "Cmd_FollowCycle_f: bad dir %i", dir );
ADDRGP4 $399
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_Error
CALLV
pop
line 870
;870:	}
LABELV $397
line 872
;871:
;872:	clientnum = ent->client->sess.spectatorClient;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2504
ADDP4
INDIRI4
ASGNI4
line 873
;873:	original = clientnum;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
LABELV $400
line 874
;874:	do {
line 875
;875:		clientnum += dir;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 876
;876:		if ( clientnum >= level.maxclients ) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $403
line 877
;877:			clientnum = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 878
;878:		}
LABELV $403
line 879
;879:		if ( clientnum < 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $406
line 880
;880:			clientnum = level.maxclients - 1;
ADDRLP4 0
ADDRGP4 level+24
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 881
;881:		}
LABELV $406
line 884
;882:
;883:		// can only follow connected clients
;884:		if ( level.clients[ clientnum ].pers.connected != CON_CONNECTED ) {
CNSTI4 3392
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
EQI4 $409
line 885
;885:			continue;
ADDRGP4 $401
JUMPV
LABELV $409
line 889
;886:		}
;887:
;888:		// can't follow another spectator
;889:		if ( level.clients[ clientnum ].sess.sessionTeam == TEAM_SPECTATOR ) {
CNSTI4 3392
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 3
NEI4 $411
line 890
;890:			continue;
ADDRGP4 $401
JUMPV
LABELV $411
line 894
;891:		}
;892:
;893:		// this is good, we can use it
;894:		ent->client->sess.spectatorClient = clientnum;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2504
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 895
;895:		ent->client->sess.spectatorState = SPECTATOR_FOLLOW;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2500
ADDP4
CNSTI4 2
ASGNI4
line 896
;896:		return;
ADDRGP4 $391
JUMPV
LABELV $401
line 897
;897:	} while ( clientnum != original );
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $400
line 900
;898:
;899:	// leave it where it was
;900:}
LABELV $391
endproc Cmd_FollowCycle_f 12 8
proc G_SayTo 24 24
line 909
;901:
;902:
;903:/*
;904:==================
;905:G_Say
;906:==================
;907:*/
;908:
;909:static void G_SayTo( gentity_t *ent, gentity_t *other, int mode, int color, const char *name, const char *message ) {
line 910
;910:	if (!other) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $414
line 911
;911:		return;
ADDRGP4 $413
JUMPV
LABELV $414
line 913
;912:	}
;913:	if (!other->inuse) {
ADDRFP4 4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $416
line 914
;914:		return;
ADDRGP4 $413
JUMPV
LABELV $416
line 916
;915:	}
;916:	if (!other->client) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $418
line 917
;917:		return;
ADDRGP4 $413
JUMPV
LABELV $418
line 919
;918:	}
;919:	if ( other->client->pers.connected != CON_CONNECTED ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $420
line 920
;920:		return;
ADDRGP4 $413
JUMPV
LABELV $420
line 922
;921:	}
;922:	if ( mode == SAY_TEAM  && !OnSameTeam(ent, other) ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $422
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $422
line 923
;923:		return;
ADDRGP4 $413
JUMPV
LABELV $422
line 926
;924:	}
;925:	// no chatting to players in tournements
;926:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $424
ADDRLP4 4
CNSTI4 516
ASGNI4
ADDRLP4 8
CNSTI4 2492
ASGNI4
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $424
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $424
line 928
;927:		&& other->client->sess.sessionTeam == TEAM_FREE
;928:		&& ent->client->sess.sessionTeam != TEAM_FREE ) {
line 929
;929:		return;
ADDRGP4 $413
JUMPV
LABELV $424
line 932
;930:	}
;931:
;932:	trap_SendServerCommand( other-g_entities, va("%s \"%s%c%c%s\"", 
ADDRGP4 $427
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $431
ADDRLP4 16
ADDRGP4 $428
ASGNP4
ADDRGP4 $432
JUMPV
LABELV $431
ADDRLP4 16
ADDRGP4 $429
ASGNP4
LABELV $432
ADDRLP4 16
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
CNSTI4 94
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 935
;933:		mode == SAY_TEAM ? "tchat" : "chat",
;934:		name, Q_COLOR_ESCAPE, color, message));
;935:}
LABELV $413
endproc G_SayTo 24 24
export G_Say
proc G_Say 320 28
line 939
;936:
;937:#define EC		"\x19"
;938:
;939:void G_Say( gentity_t *ent, gentity_t *target, int mode, const char *chatText ) {
line 948
;940:	int			j;
;941:	gentity_t	*other;
;942:	int			color;
;943:	char		name[64];
;944:	// don't let text be too long for malicious reasons
;945:	char		text[MAX_SAY_TEXT];
;946:	char		location[64];
;947:
;948:	if ( g_gametype.integer < GT_TEAM && mode == SAY_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
GEI4 $434
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $434
line 949
;949:		mode = SAY_ALL;
ADDRFP4 8
CNSTI4 0
ASGNI4
line 950
;950:	}
LABELV $434
line 952
;951:
;952:	switch ( mode ) {
ADDRLP4 292
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
EQI4 $439
ADDRLP4 292
INDIRI4
CNSTI4 1
EQI4 $442
ADDRLP4 292
INDIRI4
CNSTI4 2
EQI4 $448
ADDRGP4 $437
JUMPV
LABELV $437
LABELV $439
line 955
;953:	default:
;954:	case SAY_ALL:
;955:		G_LogPrintf( "say: %s: %s\n", ent->client->pers.netname, chatText );
ADDRGP4 $440
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 956
;956:		Com_sprintf (name, sizeof(name), "%s%c%c"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $441
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 957
;957:		color = COLOR_GREEN;
ADDRLP4 224
CNSTI4 50
ASGNI4
line 958
;958:		break;
ADDRGP4 $438
JUMPV
LABELV $442
line 960
;959:	case SAY_TEAM:
;960:		G_LogPrintf( "sayteam: %s: %s\n", ent->client->pers.netname, chatText );
ADDRGP4 $443
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 961
;961:		if (Team_GetLocationMsg(ent, location, sizeof(location)))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 228
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 296
ADDRGP4 Team_GetLocationMsg
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
EQI4 $444
line 962
;962:			Com_sprintf (name, sizeof(name), EC"(%s%c%c"EC") (%s)"EC": ", 
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $446
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRLP4 228
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $445
JUMPV
LABELV $444
line 965
;963:				ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE, location);
;964:		else
;965:			Com_sprintf (name, sizeof(name), EC"(%s%c%c"EC")"EC": ", 
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $447
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $445
line 967
;966:				ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
;967:		color = COLOR_CYAN;
ADDRLP4 224
CNSTI4 53
ASGNI4
line 968
;968:		break;
ADDRGP4 $438
JUMPV
LABELV $448
line 970
;969:	case SAY_TELL:
;970:		if (target && g_gametype.integer >= GT_TEAM &&
ADDRLP4 300
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 300
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $449
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $449
ADDRLP4 304
CNSTI4 516
ASGNI4
ADDRLP4 308
CNSTI4 2492
ASGNI4
ADDRLP4 312
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 300
INDIRP4
ADDRLP4 304
INDIRI4
ADDP4
INDIRP4
ADDRLP4 308
INDIRI4
ADDP4
INDIRI4
ADDRLP4 312
INDIRP4
ADDRLP4 304
INDIRI4
ADDP4
INDIRP4
ADDRLP4 308
INDIRI4
ADDP4
INDIRI4
NEI4 $449
ADDRLP4 312
INDIRP4
ARGP4
ADDRLP4 228
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 316
ADDRGP4 Team_GetLocationMsg
CALLI4
ASGNI4
ADDRLP4 316
INDIRI4
CNSTI4 0
EQI4 $449
line 973
;971:			target->client->sess.sessionTeam == ent->client->sess.sessionTeam &&
;972:			Team_GetLocationMsg(ent, location, sizeof(location)))
;973:			Com_sprintf (name, sizeof(name), EC"[%s%c%c"EC"] (%s)"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE, location );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $452
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRLP4 228
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $450
JUMPV
LABELV $449
line 975
;974:		else
;975:			Com_sprintf (name, sizeof(name), EC"[%s%c%c"EC"]"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $453
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $450
line 976
;976:		color = COLOR_MAGENTA;
ADDRLP4 224
CNSTI4 54
ASGNI4
line 977
;977:		break;
LABELV $438
line 980
;978:	}
;979:
;980:	Q_strncpyz( text, chatText, sizeof(text) );
ADDRLP4 8
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 150
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 982
;981:
;982:	if ( target ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $454
line 983
;983:		G_SayTo( ent, target, mode, color, name, text );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 224
INDIRI4
ARGI4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_SayTo
CALLV
pop
line 984
;984:		return;
ADDRGP4 $433
JUMPV
LABELV $454
line 988
;985:	}
;986:
;987:	// echo the text to the console
;988:	if ( g_dedicated.integer ) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $456
line 989
;989:		G_Printf( "%s%s\n", name, text);
ADDRGP4 $459
ARGP4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 990
;990:	}
LABELV $456
line 993
;991:
;992:	// send it to all the apropriate clients
;993:	for (j = 0; j < level.maxclients; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $463
JUMPV
LABELV $460
line 994
;994:		other = &g_entities[j];
ADDRLP4 4
CNSTI4 836
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 995
;995:		G_SayTo( ent, other, mode, color, name, text );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 224
INDIRI4
ARGI4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_SayTo
CALLV
pop
line 996
;996:	}
LABELV $461
line 993
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $463
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $460
line 997
;997:}
LABELV $433
endproc G_Say 320 28
proc Cmd_Say_f 12 16
line 1005
;998:
;999:
;1000:/*
;1001:==================
;1002:Cmd_Say_f
;1003:==================
;1004:*/
;1005:static void Cmd_Say_f( gentity_t *ent, int mode, qboolean arg0 ) {
line 1008
;1006:	char		*p;
;1007:
;1008:	if ( trap_Argc () < 2 && !arg0 ) {
ADDRLP4 4
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
GEI4 $466
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $466
line 1009
;1009:		return;
ADDRGP4 $465
JUMPV
LABELV $466
line 1012
;1010:	}
;1011:
;1012:	if (arg0)
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $468
line 1013
;1013:	{
line 1014
;1014:		p = ConcatArgs( 0 );
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1015
;1015:	}
ADDRGP4 $469
JUMPV
LABELV $468
line 1017
;1016:	else
;1017:	{
line 1018
;1018:		p = ConcatArgs( 1 );
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1019
;1019:	}
LABELV $469
line 1021
;1020:
;1021:	G_Say( ent, NULL, mode, p );
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1022
;1022:}
LABELV $465
endproc Cmd_Say_f 12 16
proc Cmd_Tell_f 1076 16
line 1029
;1023:
;1024:/*
;1025:==================
;1026:Cmd_Tell_f
;1027:==================
;1028:*/
;1029:static void Cmd_Tell_f( gentity_t *ent ) {
line 1035
;1030:	int			targetNum;
;1031:	gentity_t	*target;
;1032:	char		*p;
;1033:	char		arg[MAX_TOKEN_CHARS];
;1034:
;1035:	if ( trap_Argc () < 2 ) {
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 2
GEI4 $471
line 1036
;1036:		return;
ADDRGP4 $470
JUMPV
LABELV $471
line 1039
;1037:	}
;1038:
;1039:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1040
;1040:	targetNum = atoi( arg );
ADDRLP4 12
ARGP4
ADDRLP4 1040
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1040
INDIRI4
ASGNI4
line 1041
;1041:	if ( targetNum < 0 || targetNum >= level.maxclients ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $476
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $473
LABELV $476
line 1042
;1042:		return;
ADDRGP4 $470
JUMPV
LABELV $473
line 1045
;1043:	}
;1044:
;1045:	target = &g_entities[targetNum];
ADDRLP4 0
CNSTI4 836
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1046
;1046:	if ( !target || !target->inuse || !target->client ) {
ADDRLP4 1052
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
EQU4 $480
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $480
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
NEU4 $477
LABELV $480
line 1047
;1047:		return;
ADDRGP4 $470
JUMPV
LABELV $477
line 1050
;1048:	}
;1049:
;1050:	p = ConcatArgs( 2 );
CNSTI4 2
ARGI4
ADDRLP4 1056
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1056
INDIRP4
ASGNP4
line 1052
;1051:
;1052:	G_LogPrintf( "tell: %s to %s: %s\n", ent->client->pers.netname, target->client->pers.netname, p );
ADDRGP4 $481
ARGP4
ADDRLP4 1060
CNSTI4 516
ASGNI4
ADDRLP4 1064
CNSTI4 512
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 1060
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1064
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 1060
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1064
INDIRI4
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1053
;1053:	G_Say( ent, target, SAY_TELL, p );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1056
;1054:	// don't tell to the player self if it was already directed to this player
;1055:	// also don't send the chat back to a bot
;1056:	if ( ent != target && !(ent->r.svFlags & SVF_BOT)) {
ADDRLP4 1068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1068
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRP4
CVPU4 4
EQU4 $482
ADDRLP4 1068
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $482
line 1057
;1057:		G_Say( ent, ent, SAY_TELL, p );
ADDRLP4 1072
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1072
INDIRP4
ARGP4
ADDRLP4 1072
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1058
;1058:	}
LABELV $482
line 1059
;1059:}
LABELV $470
endproc Cmd_Tell_f 1076 16
proc G_VoiceTo 16 24
line 1062
;1060:
;1061:
;1062:static void G_VoiceTo( gentity_t *ent, gentity_t *other, int mode, const char *id, qboolean voiceonly ) {
line 1066
;1063:	int color;
;1064:	char *cmd;
;1065:
;1066:	if (!other) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $485
line 1067
;1067:		return;
ADDRGP4 $484
JUMPV
LABELV $485
line 1069
;1068:	}
;1069:	if (!other->inuse) {
ADDRFP4 4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $487
line 1070
;1070:		return;
ADDRGP4 $484
JUMPV
LABELV $487
line 1072
;1071:	}
;1072:	if (!other->client) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $489
line 1073
;1073:		return;
ADDRGP4 $484
JUMPV
LABELV $489
line 1075
;1074:	}
;1075:	if ( mode == SAY_TEAM && !OnSameTeam(ent, other) ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $491
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $491
line 1076
;1076:		return;
ADDRGP4 $484
JUMPV
LABELV $491
line 1079
;1077:	}
;1078:	// no chatting to players in tournements
;1079:	if ( (g_gametype.integer == GT_TOURNAMENT )) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $493
line 1080
;1080:		return;
ADDRGP4 $484
JUMPV
LABELV $493
line 1083
;1081:	}
;1082:
;1083:	if (mode == SAY_TEAM) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $496
line 1084
;1084:		color = COLOR_CYAN;
ADDRLP4 0
CNSTI4 53
ASGNI4
line 1085
;1085:		cmd = "vtchat";
ADDRLP4 4
ADDRGP4 $498
ASGNP4
line 1086
;1086:	}
ADDRGP4 $497
JUMPV
LABELV $496
line 1087
;1087:	else if (mode == SAY_TELL) {
ADDRFP4 8
INDIRI4
CNSTI4 2
NEI4 $499
line 1088
;1088:		color = COLOR_MAGENTA;
ADDRLP4 0
CNSTI4 54
ASGNI4
line 1089
;1089:		cmd = "vtell";
ADDRLP4 4
ADDRGP4 $501
ASGNP4
line 1090
;1090:	}
ADDRGP4 $500
JUMPV
LABELV $499
line 1091
;1091:	else {
line 1092
;1092:		color = COLOR_GREEN;
ADDRLP4 0
CNSTI4 50
ASGNI4
line 1093
;1093:		cmd = "vchat";
ADDRLP4 4
ADDRGP4 $502
ASGNP4
line 1094
;1094:	}
LABELV $500
LABELV $497
line 1096
;1095:
;1096:	trap_SendServerCommand( other-g_entities, va("%s %d %d %d %s", cmd, voiceonly, ent->s.number, color, id));
ADDRGP4 $503
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1097
;1097:}
LABELV $484
endproc G_VoiceTo 16 24
export G_Voice
proc G_Voice 8 20
line 1099
;1098:
;1099:void G_Voice( gentity_t *ent, gentity_t *target, int mode, const char *id, qboolean voiceonly ) {
line 1103
;1100:	int			j;
;1101:	gentity_t	*other;
;1102:
;1103:	if ( g_gametype.integer < GT_TEAM && mode == SAY_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
GEI4 $505
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $505
line 1104
;1104:		mode = SAY_ALL;
ADDRFP4 8
CNSTI4 0
ASGNI4
line 1105
;1105:	}
LABELV $505
line 1107
;1106:
;1107:	if ( target ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $508
line 1108
;1108:		G_VoiceTo( ent, target, mode, id, voiceonly );
ADDRFP4 0
INDIRP4
ARGP4
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
INDIRI4
ARGI4
ADDRGP4 G_VoiceTo
CALLV
pop
line 1109
;1109:		return;
ADDRGP4 $504
JUMPV
LABELV $508
line 1113
;1110:	}
;1111:
;1112:	// echo the text to the console
;1113:	if ( g_dedicated.integer ) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $510
line 1114
;1114:		G_Printf( "voice: %s %s\n", ent->client->pers.netname, id);
ADDRGP4 $513
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1115
;1115:	}
LABELV $510
line 1118
;1116:
;1117:	// send it to all the apropriate clients
;1118:	for (j = 0; j < level.maxclients; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $517
JUMPV
LABELV $514
line 1119
;1119:		other = &g_entities[j];
ADDRLP4 4
CNSTI4 836
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1120
;1120:		G_VoiceTo( ent, other, mode, id, voiceonly );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 G_VoiceTo
CALLV
pop
line 1121
;1121:	}
LABELV $515
line 1118
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $517
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $514
line 1122
;1122:}
LABELV $504
endproc G_Voice 8 20
proc Cmd_Voice_f 12 20
line 1129
;1123:
;1124:/*
;1125:==================
;1126:Cmd_Voice_f
;1127:==================
;1128:*/
;1129:static void Cmd_Voice_f( gentity_t *ent, int mode, qboolean arg0, qboolean voiceonly ) {
line 1132
;1130:	char		*p;
;1131:
;1132:	if ( trap_Argc () < 2 && !arg0 ) {
ADDRLP4 4
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
GEI4 $520
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $520
line 1133
;1133:		return;
ADDRGP4 $519
JUMPV
LABELV $520
line 1136
;1134:	}
;1135:
;1136:	if (arg0)
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $522
line 1137
;1137:	{
line 1138
;1138:		p = ConcatArgs( 0 );
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1139
;1139:	}
ADDRGP4 $523
JUMPV
LABELV $522
line 1141
;1140:	else
;1141:	{
line 1142
;1142:		p = ConcatArgs( 1 );
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1143
;1143:	}
LABELV $523
line 1145
;1144:
;1145:	G_Voice( ent, NULL, mode, p, voiceonly );
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1146
;1146:}
LABELV $519
endproc Cmd_Voice_f 12 20
proc Cmd_VoiceTell_f 1076 20
line 1153
;1147:
;1148:/*
;1149:==================
;1150:Cmd_VoiceTell_f
;1151:==================
;1152:*/
;1153:static void Cmd_VoiceTell_f( gentity_t *ent, qboolean voiceonly ) {
line 1159
;1154:	int			targetNum;
;1155:	gentity_t	*target;
;1156:	char		*id;
;1157:	char		arg[MAX_TOKEN_CHARS];
;1158:
;1159:	if ( trap_Argc () < 2 ) {
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 2
GEI4 $525
line 1160
;1160:		return;
ADDRGP4 $524
JUMPV
LABELV $525
line 1163
;1161:	}
;1162:
;1163:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1164
;1164:	targetNum = atoi( arg );
ADDRLP4 12
ARGP4
ADDRLP4 1040
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1040
INDIRI4
ASGNI4
line 1165
;1165:	if ( targetNum < 0 || targetNum >= level.maxclients ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $530
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $527
LABELV $530
line 1166
;1166:		return;
ADDRGP4 $524
JUMPV
LABELV $527
line 1169
;1167:	}
;1168:
;1169:	target = &g_entities[targetNum];
ADDRLP4 0
CNSTI4 836
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1170
;1170:	if ( !target || !target->inuse || !target->client ) {
ADDRLP4 1052
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
EQU4 $534
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $534
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
NEU4 $531
LABELV $534
line 1171
;1171:		return;
ADDRGP4 $524
JUMPV
LABELV $531
line 1174
;1172:	}
;1173:
;1174:	id = ConcatArgs( 2 );
CNSTI4 2
ARGI4
ADDRLP4 1056
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1056
INDIRP4
ASGNP4
line 1176
;1175:
;1176:	G_LogPrintf( "vtell: %s to %s: %s\n", ent->client->pers.netname, target->client->pers.netname, id );
ADDRGP4 $535
ARGP4
ADDRLP4 1060
CNSTI4 516
ASGNI4
ADDRLP4 1064
CNSTI4 512
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 1060
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1064
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 1060
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1064
INDIRI4
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1177
;1177:	G_Voice( ent, target, SAY_TELL, id, voiceonly );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1180
;1178:	// don't tell to the player self if it was already directed to this player
;1179:	// also don't send the chat back to a bot
;1180:	if ( ent != target && !(ent->r.svFlags & SVF_BOT)) {
ADDRLP4 1068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1068
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRP4
CVPU4 4
EQU4 $536
ADDRLP4 1068
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $536
line 1181
;1181:		G_Voice( ent, ent, SAY_TELL, id, voiceonly );
ADDRLP4 1072
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1072
INDIRP4
ARGP4
ADDRLP4 1072
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1182
;1182:	}
LABELV $536
line 1183
;1183:}
LABELV $524
endproc Cmd_VoiceTell_f 1076 20
proc Cmd_VoiceTaunt_f 56 20
line 1191
;1184:
;1185:
;1186:/*
;1187:==================
;1188:Cmd_VoiceTaunt_f
;1189:==================
;1190:*/
;1191:static void Cmd_VoiceTaunt_f( gentity_t *ent ) {
line 1195
;1192:	gentity_t *who;
;1193:	int i;
;1194:
;1195:	if (!ent->client) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $539
line 1196
;1196:		return;
ADDRGP4 $538
JUMPV
LABELV $539
line 1200
;1197:	}
;1198:
;1199:	// insult someone who just killed you
;1200:	if (ent->enemy && ent->enemy->client && ent->enemy->client->lastkilled_client == ent->s.number) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 776
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTU4 0
ASGNU4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $541
ADDRLP4 20
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $541
ADDRLP4 20
INDIRP4
CNSTI4 2592
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
INDIRI4
NEI4 $541
line 1202
;1201:		// i am a dead corpse
;1202:		if (!(ent->enemy->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $543
line 1203
;1203:			G_Voice( ent, ent->enemy, SAY_TELL, VOICECHAT_DEATHINSULT, qfalse );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 776
ADDP4
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $545
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1204
;1204:		}
LABELV $543
line 1205
;1205:		if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $546
line 1206
;1206:			G_Voice( ent, ent,        SAY_TELL, VOICECHAT_DEATHINSULT, qfalse );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $545
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1207
;1207:		}
LABELV $546
line 1208
;1208:		ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTP4 0
ASGNP4
line 1209
;1209:		return;
ADDRGP4 $538
JUMPV
LABELV $541
line 1212
;1210:	}
;1211:	// insult someone you just killed
;1212:	if (ent->client->lastkilled_client >= 0 && ent->client->lastkilled_client != ent->s.number) {
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2592
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $548
ADDRLP4 28
INDIRI4
ADDRLP4 24
INDIRP4
INDIRI4
EQI4 $548
line 1213
;1213:		who = g_entities + ent->client->lastkilled_client;
ADDRLP4 0
CNSTI4 836
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2592
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1214
;1214:		if (who->client) {
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $550
line 1216
;1215:			// who is the person I just killed
;1216:			if (who->client->lasthurt_mod == MOD_GAUNTLET) {
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2600
ADDP4
INDIRI4
CNSTI4 2
NEI4 $552
line 1217
;1217:				if (!(who->r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $554
line 1218
;1218:					G_Voice( ent, who, SAY_TELL, VOICECHAT_KILLGAUNTLET, qfalse );	// and I killed them with a gauntlet
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $556
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1219
;1219:				}
LABELV $554
line 1220
;1220:				if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $553
line 1221
;1221:					G_Voice( ent, ent, SAY_TELL, VOICECHAT_KILLGAUNTLET, qfalse );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $556
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1222
;1222:				}
line 1223
;1223:			} else {
ADDRGP4 $553
JUMPV
LABELV $552
line 1224
;1224:				if (!(who->r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $559
line 1225
;1225:					G_Voice( ent, who, SAY_TELL, VOICECHAT_KILLINSULT, qfalse );	// and I killed them with something else
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $561
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1226
;1226:				}
LABELV $559
line 1227
;1227:				if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $562
line 1228
;1228:					G_Voice( ent, ent, SAY_TELL, VOICECHAT_KILLINSULT, qfalse );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $561
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1229
;1229:				}
LABELV $562
line 1230
;1230:			}
LABELV $553
line 1231
;1231:			ent->client->lastkilled_client = -1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2592
ADDP4
CNSTI4 -1
ASGNI4
line 1232
;1232:			return;
ADDRGP4 $538
JUMPV
LABELV $550
line 1234
;1233:		}
;1234:	}
LABELV $548
line 1236
;1235:
;1236:	if (g_gametype.integer >= GT_TEAM) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $564
line 1238
;1237:		// praise a team mate who just got a reward
;1238:		for(i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $567
line 1239
;1239:			who = g_entities + i;
ADDRLP4 0
CNSTI4 836
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1240
;1240:			if (who->client && who != ent && who->client->sess.sessionTeam == ent->client->sess.sessionTeam) {
ADDRLP4 36
CNSTI4 516
ASGNI4
ADDRLP4 40
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $571
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 44
INDIRP4
CVPU4 4
EQU4 $571
ADDRLP4 48
CNSTI4 2492
ASGNI4
ADDRLP4 40
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
ADDRLP4 44
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
NEI4 $571
line 1241
;1241:				if (who->client->rewardTime > level.time) {
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2616
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $573
line 1242
;1242:					if (!(who->r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $576
line 1243
;1243:						G_Voice( ent, who, SAY_TELL, VOICECHAT_PRAISE, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $578
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1244
;1244:					}
LABELV $576
line 1245
;1245:					if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $538
line 1246
;1246:						G_Voice( ent, ent, SAY_TELL, VOICECHAT_PRAISE, qfalse );
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $578
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1247
;1247:					}
line 1248
;1248:					return;
ADDRGP4 $538
JUMPV
LABELV $573
line 1250
;1249:				}
;1250:			}
LABELV $571
line 1251
;1251:		}
LABELV $568
line 1238
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $567
line 1252
;1252:	}
LABELV $564
line 1255
;1253:
;1254:	// just say something
;1255:	G_Voice( ent, NULL, SAY_ALL, VOICECHAT_TAUNT, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 $581
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1256
;1256:}
LABELV $538
endproc Cmd_VoiceTaunt_f 56 20
data
align 4
LABELV gc_orders
address $582
address $583
address $584
address $585
address $586
address $587
address $588
export Cmd_GameCommand_f
code
proc Cmd_GameCommand_f 1060 16
line 1270
;1257:
;1258:
;1259:
;1260:static char	*gc_orders[] = {
;1261:	"hold your position",
;1262:	"hold this position",
;1263:	"come here",
;1264:	"cover me",
;1265:	"guard location",
;1266:	"search and destroy",
;1267:	"report"
;1268:};
;1269:
;1270:void Cmd_GameCommand_f( gentity_t *ent ) {
line 1275
;1271:	int		player;
;1272:	int		order;
;1273:	char	str[MAX_TOKEN_CHARS];
;1274:
;1275:	trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1276
;1276:	player = atoi( str );
ADDRLP4 0
ARGP4
ADDRLP4 1032
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1032
INDIRI4
ASGNI4
line 1277
;1277:	trap_Argv( 2, str, sizeof( str ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1278
;1278:	order = atoi( str );
ADDRLP4 0
ARGP4
ADDRLP4 1036
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
ADDRLP4 1036
INDIRI4
ASGNI4
line 1280
;1279:
;1280:	if ( player < 0 || player >= MAX_CLIENTS ) {
ADDRLP4 1028
INDIRI4
CNSTI4 0
LTI4 $592
ADDRLP4 1028
INDIRI4
CNSTI4 64
LTI4 $590
LABELV $592
line 1281
;1281:		return;
ADDRGP4 $589
JUMPV
LABELV $590
line 1283
;1282:	}
;1283:	if ( order < 0 || order > sizeof(gc_orders)/sizeof(char *) ) {
ADDRLP4 1024
INDIRI4
CNSTI4 0
LTI4 $595
ADDRLP4 1024
INDIRI4
CVIU4 4
CNSTU4 7
LEU4 $593
LABELV $595
line 1284
;1284:		return;
ADDRGP4 $589
JUMPV
LABELV $593
line 1286
;1285:	}
;1286:	G_Say( ent, &g_entities[player], SAY_TELL, gc_orders[order] );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 836
ADDRLP4 1028
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1048
CNSTI4 2
ASGNI4
ADDRLP4 1048
INDIRI4
ARGI4
ADDRLP4 1024
INDIRI4
ADDRLP4 1048
INDIRI4
LSHI4
ADDRGP4 gc_orders
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1287
;1287:	G_Say( ent, ent, SAY_TELL, gc_orders[order] );
ADDRLP4 1052
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRLP4 1056
CNSTI4 2
ASGNI4
ADDRLP4 1056
INDIRI4
ARGI4
ADDRLP4 1024
INDIRI4
ADDRLP4 1056
INDIRI4
LSHI4
ADDRGP4 gc_orders
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1288
;1288:}
LABELV $589
endproc Cmd_GameCommand_f 1060 16
export Cmd_Where_f
proc Cmd_Where_f 8 8
line 1295
;1289:
;1290:/*
;1291:==================
;1292:Cmd_Where_f
;1293:==================
;1294:*/
;1295:void Cmd_Where_f( gentity_t *ent ) {
line 1296
;1296:	trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", vtos( ent->s.origin ) ) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $597
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1297
;1297:}
LABELV $596
endproc Cmd_Where_f 8 8
data
align 4
LABELV gameNames
address $598
address $599
address $600
address $601
address $602
address $603
address $604
address $605
export Cmd_CallVote_f
code
proc Cmd_CallVote_f 3132 24
line 1315
;1298:
;1299:static const char *gameNames[] = {
;1300:	"Free For All",
;1301:	"Tournament",
;1302:	"Single Player",
;1303:	"Team Deathmatch",
;1304:	"Capture the Flag",
;1305:	"One Flag CTF",
;1306:	"Overload",
;1307:	"Harvester"
;1308:};
;1309:
;1310:/*
;1311:==================
;1312:Cmd_CallVote_f
;1313:==================
;1314:*/
;1315:void Cmd_CallVote_f( gentity_t *ent ) {
line 1320
;1316:	int		i;
;1317:	char	arg1[MAX_STRING_TOKENS];
;1318:	char	arg2[MAX_STRING_TOKENS];
;1319:
;1320:	if ( !g_allowVote.integer ) {
ADDRGP4 g_allowVote+12
INDIRI4
CNSTI4 0
NEI4 $607
line 1321
;1321:		trap_SendServerCommand( ent-g_entities, "print \"Voting not allowed here.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRGP4 $610
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1322
;1322:		return;
ADDRGP4 $606
JUMPV
LABELV $607
line 1325
;1323:	}
;1324:
;1325:	if ( level.voteTime ) {
ADDRGP4 level+2408
INDIRI4
CNSTI4 0
EQI4 $611
line 1326
;1326:		trap_SendServerCommand( ent-g_entities, "print \"A vote is already in progress.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRGP4 $614
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1327
;1327:		return;
ADDRGP4 $606
JUMPV
LABELV $611
line 1329
;1328:	}
;1329:	if ( ent->client->pers.voteCount >= MAX_VOTE_COUNT ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 3
LTI4 $615
line 1330
;1330:		trap_SendServerCommand( ent-g_entities, "print \"You have called the maximum number of votes.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRGP4 $617
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1331
;1331:		return;
ADDRGP4 $606
JUMPV
LABELV $615
line 1333
;1332:	}
;1333:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 3
NEI4 $618
line 1334
;1334:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to call a vote as spectator.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRGP4 $620
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1335
;1335:		return;
ADDRGP4 $606
JUMPV
LABELV $618
line 1339
;1336:	}
;1337:
;1338:	// make sure it is a valid command to vote on
;1339:	trap_Argv( 1, arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1340
;1340:	trap_Argv( 2, arg2, sizeof( arg2 ) );
CNSTI4 2
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1342
;1341:
;1342:	if( strchr( arg1, ';' ) || strchr( arg2, ';' ) ) {
ADDRLP4 4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 2052
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2052
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $623
ADDRLP4 1028
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 2056
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2056
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $621
LABELV $623
line 1343
;1343:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRGP4 $624
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1344
;1344:		return;
ADDRGP4 $606
JUMPV
LABELV $621
line 1347
;1345:	}
;1346:
;1347:	if ( !Q_stricmp( arg1, "map_restart" ) ) {
ADDRLP4 4
ARGP4
ADDRGP4 $627
ARGP4
ADDRLP4 2060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2060
INDIRI4
CNSTI4 0
NEI4 $625
line 1348
;1348:	} else if ( !Q_stricmp( arg1, "nextmap" ) ) {
ADDRGP4 $626
JUMPV
LABELV $625
ADDRLP4 4
ARGP4
ADDRGP4 $630
ARGP4
ADDRLP4 2064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2064
INDIRI4
CNSTI4 0
NEI4 $628
line 1349
;1349:	} else if ( !Q_stricmp( arg1, "map" ) ) {
ADDRGP4 $629
JUMPV
LABELV $628
ADDRLP4 4
ARGP4
ADDRGP4 $633
ARGP4
ADDRLP4 2068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2068
INDIRI4
CNSTI4 0
NEI4 $631
line 1350
;1350:	} else if ( !Q_stricmp( arg1, "g_gametype" ) ) {
ADDRGP4 $632
JUMPV
LABELV $631
ADDRLP4 4
ARGP4
ADDRGP4 $636
ARGP4
ADDRLP4 2072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2072
INDIRI4
CNSTI4 0
NEI4 $634
line 1351
;1351:	} else if ( !Q_stricmp( arg1, "kick" ) ) {
ADDRGP4 $635
JUMPV
LABELV $634
ADDRLP4 4
ARGP4
ADDRGP4 $639
ARGP4
ADDRLP4 2076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2076
INDIRI4
CNSTI4 0
NEI4 $637
line 1352
;1352:	} else if ( !Q_stricmp( arg1, "clientkick" ) ) {
ADDRGP4 $638
JUMPV
LABELV $637
ADDRLP4 4
ARGP4
ADDRGP4 $642
ARGP4
ADDRLP4 2080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2080
INDIRI4
CNSTI4 0
NEI4 $640
line 1353
;1353:	} else if ( !Q_stricmp( arg1, "g_doWarmup" ) ) {
ADDRGP4 $641
JUMPV
LABELV $640
ADDRLP4 4
ARGP4
ADDRGP4 $645
ARGP4
ADDRLP4 2084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2084
INDIRI4
CNSTI4 0
NEI4 $643
line 1354
;1354:	} else if ( !Q_stricmp( arg1, "timelimit" ) ) {
ADDRGP4 $644
JUMPV
LABELV $643
ADDRLP4 4
ARGP4
ADDRGP4 $648
ARGP4
ADDRLP4 2088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2088
INDIRI4
CNSTI4 0
NEI4 $646
line 1355
;1355:	} else if ( !Q_stricmp( arg1, "fraglimit" ) ) {
ADDRGP4 $647
JUMPV
LABELV $646
ADDRLP4 4
ARGP4
ADDRGP4 $651
ARGP4
ADDRLP4 2092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2092
INDIRI4
CNSTI4 0
NEI4 $649
line 1356
;1356:	} else {
ADDRGP4 $650
JUMPV
LABELV $649
line 1357
;1357:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRGP4 $624
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1358
;1358:		trap_SendServerCommand( ent-g_entities, "print \"Vote commands are: map_restart, nextmap, map <mapname>, g_gametype <n>, kick <player>, clientkick <clientnum>, g_doWarmup, timelimit <time>, fraglimit <frags>.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRGP4 $652
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1359
;1359:		return;
ADDRGP4 $606
JUMPV
LABELV $650
LABELV $647
LABELV $644
LABELV $641
LABELV $638
LABELV $635
LABELV $632
LABELV $629
LABELV $626
line 1363
;1360:	}
;1361:
;1362:	// if there is still a vote to be executed
;1363:	if ( level.voteExecuteTime ) {
ADDRGP4 level+2412
INDIRI4
CNSTI4 0
EQI4 $653
line 1364
;1364:		level.voteExecuteTime = 0;
ADDRGP4 level+2412
CNSTI4 0
ASGNI4
line 1365
;1365:		trap_SendConsoleCommand( EXEC_APPEND, va("%s\n", level.voteString ) );
ADDRGP4 $657
ARGP4
ADDRGP4 level+360
ARGP4
ADDRLP4 2096
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 2096
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1366
;1366:	}
LABELV $653
line 1369
;1367:
;1368:	// special case for g_gametype, check for bad values
;1369:	if ( !Q_stricmp( arg1, "g_gametype" ) ) {
ADDRLP4 4
ARGP4
ADDRGP4 $636
ARGP4
ADDRLP4 2096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2096
INDIRI4
CNSTI4 0
NEI4 $659
line 1370
;1370:		i = atoi( arg2 );
ADDRLP4 1028
ARGP4
ADDRLP4 2100
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 2100
INDIRI4
ASGNI4
line 1371
;1371:		if( i == GT_SINGLE_PLAYER || i < GT_FFA || i >= GT_MAX_GAME_TYPE) {
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $664
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $664
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $661
LABELV $664
line 1372
;1372:			trap_SendServerCommand( ent-g_entities, "print \"Invalid gametype.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRGP4 $665
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1373
;1373:			return;
ADDRGP4 $606
JUMPV
LABELV $661
line 1376
;1374:		}
;1375:
;1376:		Com_sprintf( level.voteString, sizeof( level.voteString ), "%s %d", arg1, i );
ADDRGP4 level+360
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $668
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1377
;1377:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s %s", arg1, gameNames[i] );
ADDRGP4 level+1384
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $671
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gameNames
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1378
;1378:	} else if ( !Q_stricmp( arg1, "map" ) ) {
ADDRGP4 $660
JUMPV
LABELV $659
ADDRLP4 4
ARGP4
ADDRGP4 $633
ARGP4
ADDRLP4 2100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2100
INDIRI4
CNSTI4 0
NEI4 $672
line 1383
;1379:		// special case for map changes, we want to reset the nextmap setting
;1380:		// this allows a player to change maps, but not upset the map rotation
;1381:		char	s[MAX_STRING_CHARS];
;1382:
;1383:		trap_Cvar_VariableStringBuffer( "nextmap", s, sizeof(s) );
ADDRGP4 $630
ARGP4
ADDRLP4 2104
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1384
;1384:		if (*s) {
ADDRLP4 2104
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $674
line 1385
;1385:			Com_sprintf( level.voteString, sizeof( level.voteString ), "%s %s; set nextmap \"%s\"", arg1, arg2, s );
ADDRGP4 level+360
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $678
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 2104
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1386
;1386:		} else {
ADDRGP4 $675
JUMPV
LABELV $674
line 1387
;1387:			Com_sprintf( level.voteString, sizeof( level.voteString ), "%s %s", arg1, arg2 );
ADDRGP4 level+360
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $671
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1388
;1388:		}
LABELV $675
line 1389
;1389:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", level.voteString );
ADDRGP4 level+1384
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $683
ARGP4
ADDRGP4 level+360
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1390
;1390:	} else if ( !Q_stricmp( arg1, "nextmap" ) ) {
ADDRGP4 $673
JUMPV
LABELV $672
ADDRLP4 4
ARGP4
ADDRGP4 $630
ARGP4
ADDRLP4 2104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2104
INDIRI4
CNSTI4 0
NEI4 $685
line 1393
;1391:		char	s[MAX_STRING_CHARS];
;1392:
;1393:		trap_Cvar_VariableStringBuffer( "nextmap", s, sizeof(s) );
ADDRGP4 $630
ARGP4
ADDRLP4 2108
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1394
;1394:		if (!*s) {
ADDRLP4 2108
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $687
line 1395
;1395:			trap_SendServerCommand( ent-g_entities, "print \"nextmap not set.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRGP4 $689
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1396
;1396:			return;
ADDRGP4 $606
JUMPV
LABELV $687
line 1398
;1397:		}
;1398:		Com_sprintf( level.voteString, sizeof( level.voteString ), "vstr nextmap");
ADDRGP4 level+360
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $692
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1399
;1399:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", level.voteString );
ADDRGP4 level+1384
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $683
ARGP4
ADDRGP4 level+360
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1400
;1400:	} else {
ADDRGP4 $686
JUMPV
LABELV $685
line 1401
;1401:		Com_sprintf( level.voteString, sizeof( level.voteString ), "%s \"%s\"", arg1, arg2 );
ADDRGP4 level+360
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $698
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1402
;1402:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", level.voteString );
ADDRGP4 level+1384
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $683
ARGP4
ADDRGP4 level+360
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1403
;1403:	}
LABELV $686
LABELV $673
LABELV $660
line 1405
;1404:
;1405:	trap_SendServerCommand( -1, va("print \"%s called a vote.\n\"", ent->client->pers.netname ) );
ADDRGP4 $702
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 2108
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2108
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1408
;1406:
;1407:	// start the voting, the caller autoamtically votes yes
;1408:	level.voteTime = level.time;
ADDRGP4 level+2408
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1409
;1409:	level.voteYes = 1;
ADDRGP4 level+2416
CNSTI4 1
ASGNI4
line 1410
;1410:	level.voteNo = 0;
ADDRGP4 level+2420
CNSTI4 0
ASGNI4
line 1412
;1411:
;1412:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $710
JUMPV
LABELV $707
line 1413
;1413:		level.clients[i].ps.eFlags &= ~EF_VOTED;
ADDRLP4 2112
CNSTI4 3392
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 2112
INDIRP4
ADDRLP4 2112
INDIRP4
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 1414
;1414:	}
LABELV $708
line 1412
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $710
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $707
line 1415
;1415:	ent->client->ps.eFlags |= EF_VOTED;
ADDRLP4 2112
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 2112
INDIRP4
ADDRLP4 2112
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 1417
;1416:
;1417:	trap_SetConfigstring( CS_VOTE_TIME, va("%i", level.voteTime ) );
ADDRGP4 $712
ARGP4
ADDRGP4 level+2408
INDIRI4
ARGI4
ADDRLP4 2116
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 8
ARGI4
ADDRLP4 2116
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1418
;1418:	trap_SetConfigstring( CS_VOTE_STRING, level.voteDisplayString );	
CNSTI4 9
ARGI4
ADDRGP4 level+1384
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1419
;1419:	trap_SetConfigstring( CS_VOTE_YES, va("%i", level.voteYes ) );
ADDRGP4 $712
ARGP4
ADDRGP4 level+2416
INDIRI4
ARGI4
ADDRLP4 2120
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 10
ARGI4
ADDRLP4 2120
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1420
;1420:	trap_SetConfigstring( CS_VOTE_NO, va("%i", level.voteNo ) );	
ADDRGP4 $712
ARGP4
ADDRGP4 level+2420
INDIRI4
ARGI4
ADDRLP4 2124
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 11
ARGI4
ADDRLP4 2124
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1421
;1421:}
LABELV $606
endproc Cmd_CallVote_f 3132 24
export Cmd_Vote_f
proc Cmd_Vote_f 76 12
line 1428
;1422:
;1423:/*
;1424:==================
;1425:Cmd_Vote_f
;1426:==================
;1427:*/
;1428:void Cmd_Vote_f( gentity_t *ent ) {
line 1431
;1429:	char		msg[64];
;1430:
;1431:	if ( !level.voteTime ) {
ADDRGP4 level+2408
INDIRI4
CNSTI4 0
NEI4 $718
line 1432
;1432:		trap_SendServerCommand( ent-g_entities, "print \"No vote in progress.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRGP4 $721
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1433
;1433:		return;
ADDRGP4 $717
JUMPV
LABELV $718
line 1435
;1434:	}
;1435:	if ( ent->client->ps.eFlags & EF_VOTED ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $722
line 1436
;1436:		trap_SendServerCommand( ent-g_entities, "print \"Vote already cast.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRGP4 $724
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1437
;1437:		return;
ADDRGP4 $717
JUMPV
LABELV $722
line 1439
;1438:	}
;1439:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 3
NEI4 $725
line 1440
;1440:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to vote as spectator.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRGP4 $727
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1441
;1441:		return;
ADDRGP4 $717
JUMPV
LABELV $725
line 1444
;1442:	}
;1443:
;1444:	trap_SendServerCommand( ent-g_entities, "print \"Vote cast.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRGP4 $728
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1446
;1445:
;1446:	ent->client->ps.eFlags |= EF_VOTED;
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 1448
;1447:
;1448:	trap_Argv( 1, msg, sizeof( msg ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1450
;1449:
;1450:	if ( msg[0] == 'y' || msg[1] == 'Y' || msg[1] == '1' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 121
EQI4 $734
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 89
EQI4 $734
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 49
NEI4 $729
LABELV $734
line 1451
;1451:		level.voteYes++;
ADDRLP4 68
ADDRGP4 level+2416
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1452
;1452:		trap_SetConfigstring( CS_VOTE_YES, va("%i", level.voteYes ) );
ADDRGP4 $712
ARGP4
ADDRGP4 level+2416
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 10
ARGI4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1453
;1453:	} else {
ADDRGP4 $730
JUMPV
LABELV $729
line 1454
;1454:		level.voteNo++;
ADDRLP4 68
ADDRGP4 level+2420
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1455
;1455:		trap_SetConfigstring( CS_VOTE_NO, va("%i", level.voteNo ) );	
ADDRGP4 $712
ARGP4
ADDRGP4 level+2420
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 11
ARGI4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1456
;1456:	}
LABELV $730
line 1460
;1457:
;1458:	// a majority will be determined in CheckVote, which will also account
;1459:	// for players entering or leaving
;1460:}
LABELV $717
endproc Cmd_Vote_f 76 12
export Cmd_CallTeamVote_f
proc Cmd_CallTeamVote_f 2164 20
line 1467
;1461:
;1462:/*
;1463:==================
;1464:Cmd_CallTeamVote_f
;1465:==================
;1466:*/
;1467:void Cmd_CallTeamVote_f( gentity_t *ent ) {
line 1472
;1468:	int		i, team, cs_offset;
;1469:	char	arg1[MAX_STRING_TOKENS];
;1470:	char	arg2[MAX_STRING_TOKENS];
;1471:
;1472:	team = ent->client->sess.sessionTeam;
ADDRLP4 1028
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
ASGNI4
line 1473
;1473:	if ( team == TEAM_RED )
ADDRLP4 1028
INDIRI4
CNSTI4 1
NEI4 $740
line 1474
;1474:		cs_offset = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
ADDRGP4 $741
JUMPV
LABELV $740
line 1475
;1475:	else if ( team == TEAM_BLUE )
ADDRLP4 1028
INDIRI4
CNSTI4 2
NEI4 $739
line 1476
;1476:		cs_offset = 1;
ADDRLP4 1032
CNSTI4 1
ASGNI4
line 1478
;1477:	else
;1478:		return;
LABELV $743
LABELV $741
line 1480
;1479:
;1480:	if ( !g_allowVote.integer ) {
ADDRGP4 g_allowVote+12
INDIRI4
CNSTI4 0
NEI4 $744
line 1481
;1481:		trap_SendServerCommand( ent-g_entities, "print \"Voting not allowed here.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRGP4 $610
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1482
;1482:		return;
ADDRGP4 $739
JUMPV
LABELV $744
line 1485
;1483:	}
;1484:
;1485:	if ( level.teamVoteTime[cs_offset] ) {
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4476
ADDP4
INDIRI4
CNSTI4 0
EQI4 $747
line 1486
;1486:		trap_SendServerCommand( ent-g_entities, "print \"A team vote is already in progress.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRGP4 $750
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1487
;1487:		return;
ADDRGP4 $739
JUMPV
LABELV $747
line 1489
;1488:	}
;1489:	if ( ent->client->pers.teamVoteCount >= MAX_VOTE_COUNT ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 608
ADDP4
INDIRI4
CNSTI4 3
LTI4 $751
line 1490
;1490:		trap_SendServerCommand( ent-g_entities, "print \"You have called the maximum number of team votes.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRGP4 $753
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1491
;1491:		return;
ADDRGP4 $739
JUMPV
LABELV $751
line 1493
;1492:	}
;1493:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 3
NEI4 $754
line 1494
;1494:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to call a vote as spectator.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRGP4 $620
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1495
;1495:		return;
ADDRGP4 $739
JUMPV
LABELV $754
line 1499
;1496:	}
;1497:
;1498:	// make sure it is a valid command to vote on
;1499:	trap_Argv( 1, arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 1036
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1500
;1500:	arg2[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 1501
;1501:	for ( i = 2; i < trap_Argc(); i++ ) {
ADDRLP4 0
CNSTI4 2
ASGNI4
ADDRGP4 $759
JUMPV
LABELV $756
line 1502
;1502:		if (i > 2)
ADDRLP4 0
INDIRI4
CNSTI4 2
LEI4 $760
line 1503
;1503:			strcat(arg2, " ");
ADDRLP4 4
ARGP4
ADDRGP4 $762
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $760
line 1504
;1504:		trap_Argv( i, &arg2[strlen(arg2)], sizeof( arg2 ) - strlen(arg2) );
ADDRLP4 4
ARGP4
ADDRLP4 2060
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ARGP4
ADDRLP4 2064
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2060
INDIRI4
ADDRLP4 4
ADDP4
ARGP4
CNSTU4 1024
ADDRLP4 2064
INDIRI4
CVIU4 4
SUBU4
CVUI4 4
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1505
;1505:	}
LABELV $757
line 1501
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $759
ADDRLP4 2060
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 2060
INDIRI4
LTI4 $756
line 1507
;1506:
;1507:	if( strchr( arg1, ';' ) || strchr( arg2, ';' ) ) {
ADDRLP4 1036
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 2064
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2064
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $765
ADDRLP4 4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 2068
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2068
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $763
LABELV $765
line 1508
;1508:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRGP4 $624
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1509
;1509:		return;
ADDRGP4 $739
JUMPV
LABELV $763
line 1512
;1510:	}
;1511:
;1512:	if ( !Q_stricmp( arg1, "leader" ) ) {
ADDRLP4 1036
ARGP4
ADDRGP4 $768
ARGP4
ADDRLP4 2072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2072
INDIRI4
CNSTI4 0
NEI4 $766
line 1515
;1513:		char netname[MAX_NETNAME], leader[MAX_NETNAME];
;1514:
;1515:		if ( !arg2[0] ) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $769
line 1516
;1516:			i = ent->client->ps.clientNum;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 1517
;1517:		}
ADDRGP4 $770
JUMPV
LABELV $769
line 1518
;1518:		else {
line 1520
;1519:			// numeric values are just slot numbers
;1520:			for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $771
line 1521
;1521:				if ( !arg2[i] || arg2[i] < '0' || arg2[i] > '9' )
ADDRLP4 2148
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2148
INDIRI4
CNSTI4 0
EQI4 $778
ADDRLP4 2148
INDIRI4
CNSTI4 48
LTI4 $778
ADDRLP4 2148
INDIRI4
CNSTI4 57
LEI4 $775
LABELV $778
line 1522
;1522:					break;
ADDRGP4 $773
JUMPV
LABELV $775
line 1523
;1523:			}
LABELV $772
line 1520
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $771
LABELV $773
line 1524
;1524:			if ( i >= 3 || !arg2[i]) {
ADDRLP4 0
INDIRI4
CNSTI4 3
GEI4 $781
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $779
LABELV $781
line 1525
;1525:				i = atoi( arg2 );
ADDRLP4 4
ARGP4
ADDRLP4 2152
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 2152
INDIRI4
ASGNI4
line 1526
;1526:				if ( i < 0 || i >= level.maxclients ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $785
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $782
LABELV $785
line 1527
;1527:					trap_SendServerCommand( ent-g_entities, va("print \"Bad client slot: %i\n\"", i) );
ADDRGP4 $123
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2160
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRLP4 2160
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1528
;1528:					return;
ADDRGP4 $739
JUMPV
LABELV $782
line 1531
;1529:				}
;1530:
;1531:				if ( !g_entities[i].inuse ) {
CNSTI4 836
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $780
line 1532
;1532:					trap_SendServerCommand( ent-g_entities, va("print \"Client %i is not active\n\"", i) );
ADDRGP4 $126
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2160
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRLP4 2160
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1533
;1533:					return;
ADDRGP4 $739
JUMPV
line 1535
;1534:				}
;1535:			}
LABELV $779
line 1536
;1536:			else {
line 1537
;1537:				Q_strncpyz(leader, arg2, sizeof(leader));
ADDRLP4 2112
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1538
;1538:				Q_CleanStr(leader);
ADDRLP4 2112
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1539
;1539:				for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $792
JUMPV
LABELV $789
line 1540
;1540:					if ( level.clients[i].pers.connected == CON_DISCONNECTED )
CNSTI4 3392
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $794
line 1541
;1541:						continue;
ADDRGP4 $790
JUMPV
LABELV $794
line 1542
;1542:					if (level.clients[i].sess.sessionTeam != team)
CNSTI4 3392
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2492
ADDP4
INDIRI4
ADDRLP4 1028
INDIRI4
EQI4 $796
line 1543
;1543:						continue;
ADDRGP4 $790
JUMPV
LABELV $796
line 1544
;1544:					Q_strncpyz(netname, level.clients[i].pers.netname, sizeof(netname));
ADDRLP4 2076
ARGP4
CNSTI4 3392
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 512
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1545
;1545:					Q_CleanStr(netname);
ADDRLP4 2076
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1546
;1546:					if ( !Q_stricmp(netname, leader) ) {
ADDRLP4 2076
ARGP4
ADDRLP4 2112
ARGP4
ADDRLP4 2152
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2152
INDIRI4
CNSTI4 0
NEI4 $798
line 1547
;1547:						break;
ADDRGP4 $791
JUMPV
LABELV $798
line 1549
;1548:					}
;1549:				}
LABELV $790
line 1539
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $792
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $789
LABELV $791
line 1550
;1550:				if ( i >= level.maxclients ) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $800
line 1551
;1551:					trap_SendServerCommand( ent-g_entities, va("print \"%s is not a valid player on your team.\n\"", arg2) );
ADDRGP4 $803
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2152
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRLP4 2152
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1552
;1552:					return;
ADDRGP4 $739
JUMPV
LABELV $800
line 1554
;1553:				}
;1554:			}
LABELV $780
line 1555
;1555:		}
LABELV $770
line 1556
;1556:		Com_sprintf(arg2, sizeof(arg2), "%d", i);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $229
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1557
;1557:	} else {
ADDRGP4 $767
JUMPV
LABELV $766
line 1558
;1558:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRGP4 $624
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1559
;1559:		trap_SendServerCommand( ent-g_entities, "print \"Team vote commands are: leader <player>.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRGP4 $804
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1560
;1560:		return;
ADDRGP4 $739
JUMPV
LABELV $767
line 1563
;1561:	}
;1562:
;1563:	Com_sprintf( level.teamVoteString[cs_offset], sizeof( level.teamVoteString[cs_offset] ), "%s %s", arg1, arg2 );
ADDRLP4 1032
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+2428
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $671
ARGP4
ADDRLP4 1036
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1565
;1564:
;1565:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $810
JUMPV
LABELV $807
line 1566
;1566:		if ( level.clients[i].pers.connected == CON_DISCONNECTED )
CNSTI4 3392
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $812
line 1567
;1567:			continue;
ADDRGP4 $808
JUMPV
LABELV $812
line 1568
;1568:		if (level.clients[i].sess.sessionTeam == team)
CNSTI4 3392
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2492
ADDP4
INDIRI4
ADDRLP4 1028
INDIRI4
NEI4 $814
line 1569
;1569:			trap_SendServerCommand( i, va("print \"%s called a team vote.\n\"", ent->client->pers.netname ) );
ADDRGP4 $816
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 2076
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2076
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $814
line 1570
;1570:	}
LABELV $808
line 1565
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $810
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $807
line 1573
;1571:
;1572:	// start the voting, the caller autoamtically votes yes
;1573:	level.teamVoteTime[cs_offset] = level.time;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4476
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1574
;1574:	level.teamVoteYes[cs_offset] = 1;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4484
ADDP4
CNSTI4 1
ASGNI4
line 1575
;1575:	level.teamVoteNo[cs_offset] = 0;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4492
ADDP4
CNSTI4 0
ASGNI4
line 1577
;1576:
;1577:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $824
JUMPV
LABELV $821
line 1578
;1578:		if (level.clients[i].sess.sessionTeam == team)
CNSTI4 3392
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2492
ADDP4
INDIRI4
ADDRLP4 1028
INDIRI4
NEI4 $826
line 1579
;1579:			level.clients[i].ps.eFlags &= ~EF_TEAMVOTED;
ADDRLP4 2076
CNSTI4 3392
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 2076
INDIRP4
ADDRLP4 2076
INDIRP4
INDIRI4
CNSTI4 -524289
BANDI4
ASGNI4
LABELV $826
line 1580
;1580:	}
LABELV $822
line 1577
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $824
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $821
line 1581
;1581:	ent->client->ps.eFlags |= EF_TEAMVOTED;
ADDRLP4 2076
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 2076
INDIRP4
ADDRLP4 2076
INDIRP4
INDIRI4
CNSTI4 524288
BORI4
ASGNI4
line 1583
;1582:
;1583:	trap_SetConfigstring( CS_TEAMVOTE_TIME + cs_offset, va("%i", level.teamVoteTime[cs_offset] ) );
ADDRGP4 $712
ARGP4
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4476
ADDP4
INDIRI4
ARGI4
ADDRLP4 2080
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRI4
CNSTI4 12
ADDI4
ARGI4
ADDRLP4 2080
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1584
;1584:	trap_SetConfigstring( CS_TEAMVOTE_STRING + cs_offset, level.teamVoteString[cs_offset] );
ADDRLP4 1032
INDIRI4
CNSTI4 14
ADDI4
ARGI4
ADDRLP4 1032
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+2428
ADDP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1585
;1585:	trap_SetConfigstring( CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[cs_offset] ) );
ADDRGP4 $712
ARGP4
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4484
ADDP4
INDIRI4
ARGI4
ADDRLP4 2088
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRLP4 2088
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1586
;1586:	trap_SetConfigstring( CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[cs_offset] ) );
ADDRGP4 $712
ARGP4
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4492
ADDP4
INDIRI4
ARGI4
ADDRLP4 2092
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRI4
CNSTI4 18
ADDI4
ARGI4
ADDRLP4 2092
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1587
;1587:}
LABELV $739
endproc Cmd_CallTeamVote_f 2164 20
export Cmd_TeamVote_f
proc Cmd_TeamVote_f 84 12
line 1594
;1588:
;1589:/*
;1590:==================
;1591:Cmd_TeamVote_f
;1592:==================
;1593:*/
;1594:void Cmd_TeamVote_f( gentity_t *ent ) {
line 1598
;1595:	int			team, cs_offset;
;1596:	char		msg[64];
;1597:
;1598:	team = ent->client->sess.sessionTeam;
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
ASGNI4
line 1599
;1599:	if ( team == TEAM_RED )
ADDRLP4 68
INDIRI4
CNSTI4 1
NEI4 $833
line 1600
;1600:		cs_offset = 0;
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 $834
JUMPV
LABELV $833
line 1601
;1601:	else if ( team == TEAM_BLUE )
ADDRLP4 68
INDIRI4
CNSTI4 2
NEI4 $832
line 1602
;1602:		cs_offset = 1;
ADDRLP4 64
CNSTI4 1
ASGNI4
line 1604
;1603:	else
;1604:		return;
LABELV $836
LABELV $834
line 1606
;1605:
;1606:	if ( !level.teamVoteTime[cs_offset] ) {
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4476
ADDP4
INDIRI4
CNSTI4 0
NEI4 $837
line 1607
;1607:		trap_SendServerCommand( ent-g_entities, "print \"No team vote in progress.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRGP4 $840
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1608
;1608:		return;
ADDRGP4 $832
JUMPV
LABELV $837
line 1610
;1609:	}
;1610:	if ( ent->client->ps.eFlags & EF_TEAMVOTED ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 524288
BANDI4
CNSTI4 0
EQI4 $841
line 1611
;1611:		trap_SendServerCommand( ent-g_entities, "print \"Team vote already cast.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRGP4 $843
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1612
;1612:		return;
ADDRGP4 $832
JUMPV
LABELV $841
line 1614
;1613:	}
;1614:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 3
NEI4 $844
line 1615
;1615:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to vote as spectator.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRGP4 $727
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1616
;1616:		return;
ADDRGP4 $832
JUMPV
LABELV $844
line 1619
;1617:	}
;1618:
;1619:	trap_SendServerCommand( ent-g_entities, "print \"Team vote cast.\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRGP4 $846
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1621
;1620:
;1621:	ent->client->ps.eFlags |= EF_TEAMVOTED;
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 524288
BORI4
ASGNI4
line 1623
;1622:
;1623:	trap_Argv( 1, msg, sizeof( msg ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1625
;1624:
;1625:	if ( msg[0] == 'y' || msg[1] == 'Y' || msg[1] == '1' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 121
EQI4 $852
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 89
EQI4 $852
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 49
NEI4 $847
LABELV $852
line 1626
;1626:		level.teamVoteYes[cs_offset]++;
ADDRLP4 76
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4484
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1627
;1627:		trap_SetConfigstring( CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[cs_offset] ) );
ADDRGP4 $712
ARGP4
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4484
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1628
;1628:	} else {
ADDRGP4 $848
JUMPV
LABELV $847
line 1629
;1629:		level.teamVoteNo[cs_offset]++;
ADDRLP4 76
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4492
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1630
;1630:		trap_SetConfigstring( CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[cs_offset] ) );	
ADDRGP4 $712
ARGP4
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4492
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRI4
CNSTI4 18
ADDI4
ARGI4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1631
;1631:	}
LABELV $848
line 1635
;1632:
;1633:	// a majority will be determined in TeamCheckVote, which will also account
;1634:	// for players entering or leaving
;1635:}
LABELV $832
endproc Cmd_TeamVote_f 84 12
export Cmd_SetViewpos_f
proc Cmd_SetViewpos_f 1064 12
line 1643
;1636:
;1637:
;1638:/*
;1639:=================
;1640:Cmd_SetViewpos_f
;1641:=================
;1642:*/
;1643:void Cmd_SetViewpos_f( gentity_t *ent ) {
line 1648
;1644:	vec3_t		origin, angles;
;1645:	char		buffer[MAX_TOKEN_CHARS];
;1646:	int			i;
;1647:
;1648:	if ( !g_cheats.integer ) {
ADDRGP4 g_cheats+12
INDIRI4
CNSTI4 0
NEI4 $858
line 1649
;1649:		trap_SendServerCommand( ent-g_entities, va("print \"Cheats are not enabled on this server.\n\""));
ADDRGP4 $94
ARGP4
ADDRLP4 1052
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1650
;1650:		return;
ADDRGP4 $857
JUMPV
LABELV $858
line 1652
;1651:	}
;1652:	if ( trap_Argc() != 5 ) {
ADDRLP4 1052
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 5
EQI4 $861
line 1653
;1653:		trap_SendServerCommand( ent-g_entities, va("print \"usage: setviewpos x y z yaw\n\""));
ADDRGP4 $863
ARGP4
ADDRLP4 1056
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1654
;1654:		return;
ADDRGP4 $857
JUMPV
LABELV $861
line 1657
;1655:	}
;1656:
;1657:	VectorClear( angles );
ADDRLP4 1056
CNSTF4 0
ASGNF4
ADDRLP4 1040+8
ADDRLP4 1056
INDIRF4
ASGNF4
ADDRLP4 1040+4
ADDRLP4 1056
INDIRF4
ASGNF4
ADDRLP4 1040
ADDRLP4 1056
INDIRF4
ASGNF4
line 1658
;1658:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $866
line 1659
;1659:		trap_Argv( i + 1, buffer, sizeof( buffer ) );
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1660
;1660:		origin[i] = atof( buffer );
ADDRLP4 4
ARGP4
ADDRLP4 1060
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1028
ADDP4
ADDRLP4 1060
INDIRF4
ASGNF4
line 1661
;1661:	}
LABELV $867
line 1658
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $866
line 1663
;1662:
;1663:	trap_Argv( 4, buffer, sizeof( buffer ) );
CNSTI4 4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1664
;1664:	angles[YAW] = atof( buffer );
ADDRLP4 4
ARGP4
ADDRLP4 1060
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 1040+4
ADDRLP4 1060
INDIRF4
ASGNF4
line 1666
;1665:
;1666:	TeleportPlayer( ent, origin, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 1040
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 1667
;1667:}
LABELV $857
endproc Cmd_SetViewpos_f 1064 12
export Cmd_Stats_f
proc Cmd_Stats_f 0 0
line 1676
;1668:
;1669:
;1670:
;1671:/*
;1672:=================
;1673:Cmd_Stats_f
;1674:=================
;1675:*/
;1676:void Cmd_Stats_f( gentity_t *ent ) {
line 1691
;1677:/*
;1678:	int max, n, i;
;1679:
;1680:	max = trap_AAS_PointReachabilityAreaIndex( NULL );
;1681:
;1682:	n = 0;
;1683:	for ( i = 0; i < max; i++ ) {
;1684:		if ( ent->client->areabits[i >> 3] & (1 << (i & 7)) )
;1685:			n++;
;1686:	}
;1687:
;1688:	//trap_SendServerCommand( ent-g_entities, va("print \"visited %d of %d areas\n\"", n, max));
;1689:	trap_SendServerCommand( ent-g_entities, va("print \"%d%% level coverage\n\"", n * 100 / max));
;1690:*/
;1691:}
LABELV $871
endproc Cmd_Stats_f 0 0
export ClientCommand
proc ClientCommand 1160 16
line 1698
;1692:
;1693:/*
;1694:=================
;1695:ClientCommand
;1696:=================
;1697:*/
;1698:void ClientCommand( int clientNum ) {
line 1702
;1699:	gentity_t *ent;
;1700:	char	cmd[MAX_TOKEN_CHARS];
;1701:
;1702:	ent = g_entities + clientNum;
ADDRLP4 1024
CNSTI4 836
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1703
;1703:	if ( !ent->client ) {
ADDRLP4 1024
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $873
line 1704
;1704:		return;		// not fully in game yet
ADDRGP4 $872
JUMPV
LABELV $873
line 1708
;1705:	}
;1706:
;1707:
;1708:	trap_Argv( 0, cmd, sizeof( cmd ) );
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1710
;1709:
;1710:	if (Q_stricmp (cmd, "say") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $877
ARGP4
ADDRLP4 1028
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $875
line 1711
;1711:		Cmd_Say_f (ent, SAY_ALL, qfalse);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1032
CNSTI4 0
ASGNI4
ADDRLP4 1032
INDIRI4
ARGI4
ADDRLP4 1032
INDIRI4
ARGI4
ADDRGP4 Cmd_Say_f
CALLV
pop
line 1712
;1712:		return;
ADDRGP4 $872
JUMPV
LABELV $875
line 1714
;1713:	}
;1714:	if (Q_stricmp (cmd, "say_team") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $880
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $878
line 1715
;1715:		Cmd_Say_f (ent, SAY_TEAM, qfalse);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Cmd_Say_f
CALLV
pop
line 1716
;1716:		return;
ADDRGP4 $872
JUMPV
LABELV $878
line 1718
;1717:	}
;1718:	if (Q_stricmp (cmd, "tell") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $883
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $881
line 1719
;1719:		Cmd_Tell_f ( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Tell_f
CALLV
pop
line 1720
;1720:		return;
ADDRGP4 $872
JUMPV
LABELV $881
line 1722
;1721:	}
;1722:	if (Q_stricmp (cmd, "vsay") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $886
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $884
line 1723
;1723:		Cmd_Voice_f (ent, SAY_ALL, qfalse, qfalse);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1044
CNSTI4 0
ASGNI4
ADDRLP4 1044
INDIRI4
ARGI4
ADDRLP4 1044
INDIRI4
ARGI4
ADDRLP4 1044
INDIRI4
ARGI4
ADDRGP4 Cmd_Voice_f
CALLV
pop
line 1724
;1724:		return;
ADDRGP4 $872
JUMPV
LABELV $884
line 1726
;1725:	}
;1726:	if (Q_stricmp (cmd, "vsay_team") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $889
ARGP4
ADDRLP4 1044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $887
line 1727
;1727:		Cmd_Voice_f (ent, SAY_TEAM, qfalse, qfalse);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1048
CNSTI4 0
ASGNI4
ADDRLP4 1048
INDIRI4
ARGI4
ADDRLP4 1048
INDIRI4
ARGI4
ADDRGP4 Cmd_Voice_f
CALLV
pop
line 1728
;1728:		return;
ADDRGP4 $872
JUMPV
LABELV $887
line 1730
;1729:	}
;1730:	if (Q_stricmp (cmd, "vtell") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $501
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $890
line 1731
;1731:		Cmd_VoiceTell_f ( ent, qfalse );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Cmd_VoiceTell_f
CALLV
pop
line 1732
;1732:		return;
ADDRGP4 $872
JUMPV
LABELV $890
line 1734
;1733:	}
;1734:	if (Q_stricmp (cmd, "vosay") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $894
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $892
line 1735
;1735:		Cmd_Voice_f (ent, SAY_ALL, qfalse, qtrue);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1056
CNSTI4 0
ASGNI4
ADDRLP4 1056
INDIRI4
ARGI4
ADDRLP4 1056
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_Voice_f
CALLV
pop
line 1736
;1736:		return;
ADDRGP4 $872
JUMPV
LABELV $892
line 1738
;1737:	}
;1738:	if (Q_stricmp (cmd, "vosay_team") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $897
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $895
line 1739
;1739:		Cmd_Voice_f (ent, SAY_TEAM, qfalse, qtrue);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1060
CNSTI4 1
ASGNI4
ADDRLP4 1060
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 1060
INDIRI4
ARGI4
ADDRGP4 Cmd_Voice_f
CALLV
pop
line 1740
;1740:		return;
ADDRGP4 $872
JUMPV
LABELV $895
line 1742
;1741:	}
;1742:	if (Q_stricmp (cmd, "votell") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $900
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $898
line 1743
;1743:		Cmd_VoiceTell_f ( ent, qtrue );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_VoiceTell_f
CALLV
pop
line 1744
;1744:		return;
ADDRGP4 $872
JUMPV
LABELV $898
line 1746
;1745:	}
;1746:	if (Q_stricmp (cmd, "vtaunt") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $903
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $901
line 1747
;1747:		Cmd_VoiceTaunt_f ( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_VoiceTaunt_f
CALLV
pop
line 1748
;1748:		return;
ADDRGP4 $872
JUMPV
LABELV $901
line 1750
;1749:	}
;1750:	if (Q_stricmp (cmd, "score") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $262
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $904
line 1751
;1751:		Cmd_Score_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 1752
;1752:		return;
ADDRGP4 $872
JUMPV
LABELV $904
line 1756
;1753:	}
;1754:
;1755:	// ignore all other commands when at intermission
;1756:	if (level.intermissiontime) {
ADDRGP4 level+9132
INDIRI4
CNSTI4 0
EQI4 $906
line 1757
;1757:		Cmd_Say_f (ent, qfalse, qtrue);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_Say_f
CALLV
pop
line 1758
;1758:		return;
ADDRGP4 $872
JUMPV
LABELV $906
line 1761
;1759:	}
;1760:
;1761:	if (Q_stricmp (cmd, "give") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $911
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $909
line 1762
;1762:		Cmd_Give_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Give_f
CALLV
pop
ADDRGP4 $910
JUMPV
LABELV $909
line 1763
;1763:	else if (Q_stricmp (cmd, "god") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $914
ARGP4
ADDRLP4 1076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $912
line 1764
;1764:		Cmd_God_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_God_f
CALLV
pop
ADDRGP4 $913
JUMPV
LABELV $912
line 1765
;1765:	else if (Q_stricmp (cmd, "notarget") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $917
ARGP4
ADDRLP4 1080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $915
line 1766
;1766:		Cmd_Notarget_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Notarget_f
CALLV
pop
ADDRGP4 $916
JUMPV
LABELV $915
line 1767
;1767:	else if (Q_stricmp (cmd, "noclip") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $920
ARGP4
ADDRLP4 1084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $918
line 1768
;1768:		Cmd_Noclip_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Noclip_f
CALLV
pop
ADDRGP4 $919
JUMPV
LABELV $918
line 1769
;1769:	else if (Q_stricmp (cmd, "kill") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $923
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $921
line 1770
;1770:		Cmd_Kill_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Kill_f
CALLV
pop
ADDRGP4 $922
JUMPV
LABELV $921
line 1771
;1771:	else if (Q_stricmp (cmd, "teamtask") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $228
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $924
line 1772
;1772:		Cmd_TeamTask_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_TeamTask_f
CALLV
pop
ADDRGP4 $925
JUMPV
LABELV $924
line 1773
;1773:	else if (Q_stricmp (cmd, "levelshot") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $928
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $926
line 1774
;1774:		Cmd_LevelShot_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_LevelShot_f
CALLV
pop
ADDRGP4 $927
JUMPV
LABELV $926
line 1775
;1775:	else if (Q_stricmp (cmd, "follow") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $931
ARGP4
ADDRLP4 1100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $929
line 1776
;1776:		Cmd_Follow_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Follow_f
CALLV
pop
ADDRGP4 $930
JUMPV
LABELV $929
line 1777
;1777:	else if (Q_stricmp (cmd, "follownext") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $934
ARGP4
ADDRLP4 1104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $932
line 1778
;1778:		Cmd_FollowCycle_f (ent, 1);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
ADDRGP4 $933
JUMPV
LABELV $932
line 1779
;1779:	else if (Q_stricmp (cmd, "followprev") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $937
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $935
line 1780
;1780:		Cmd_FollowCycle_f (ent, -1);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
ADDRGP4 $936
JUMPV
LABELV $935
line 1781
;1781:	else if (Q_stricmp (cmd, "team") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $940
ARGP4
ADDRLP4 1112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $938
line 1782
;1782:		Cmd_Team_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Team_f
CALLV
pop
ADDRGP4 $939
JUMPV
LABELV $938
line 1783
;1783:	else if (Q_stricmp (cmd, "where") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $943
ARGP4
ADDRLP4 1116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $941
line 1784
;1784:		Cmd_Where_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Where_f
CALLV
pop
ADDRGP4 $942
JUMPV
LABELV $941
line 1785
;1785:	else if (Q_stricmp (cmd, "callvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $946
ARGP4
ADDRLP4 1120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $944
line 1786
;1786:		Cmd_CallVote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_CallVote_f
CALLV
pop
ADDRGP4 $945
JUMPV
LABELV $944
line 1787
;1787:	else if (Q_stricmp (cmd, "vote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $949
ARGP4
ADDRLP4 1124
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1124
INDIRI4
CNSTI4 0
NEI4 $947
line 1788
;1788:		Cmd_Vote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Vote_f
CALLV
pop
ADDRGP4 $948
JUMPV
LABELV $947
line 1789
;1789:	else if (Q_stricmp (cmd, "callteamvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $952
ARGP4
ADDRLP4 1128
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1128
INDIRI4
CNSTI4 0
NEI4 $950
line 1790
;1790:		Cmd_CallTeamVote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_CallTeamVote_f
CALLV
pop
ADDRGP4 $951
JUMPV
LABELV $950
line 1791
;1791:	else if (Q_stricmp (cmd, "teamvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $955
ARGP4
ADDRLP4 1132
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1132
INDIRI4
CNSTI4 0
NEI4 $953
line 1792
;1792:		Cmd_TeamVote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_TeamVote_f
CALLV
pop
ADDRGP4 $954
JUMPV
LABELV $953
line 1793
;1793:	else if (Q_stricmp (cmd, "gc") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $958
ARGP4
ADDRLP4 1136
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1136
INDIRI4
CNSTI4 0
NEI4 $956
line 1794
;1794:		Cmd_GameCommand_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_GameCommand_f
CALLV
pop
ADDRGP4 $957
JUMPV
LABELV $956
line 1795
;1795:	else if (Q_stricmp (cmd, "setviewpos") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $961
ARGP4
ADDRLP4 1140
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1140
INDIRI4
CNSTI4 0
NEI4 $959
line 1796
;1796:		Cmd_SetViewpos_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_SetViewpos_f
CALLV
pop
ADDRGP4 $960
JUMPV
LABELV $959
line 1797
;1797:	else if (Q_stricmp (cmd, "stats") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $964
ARGP4
ADDRLP4 1144
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1144
INDIRI4
CNSTI4 0
NEI4 $962
line 1798
;1798:		Cmd_Stats_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Stats_f
CALLV
pop
ADDRGP4 $963
JUMPV
LABELV $962
line 1799
;1799:	else if (Q_stricmp (cmd, "pdg") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $967
ARGP4
ADDRLP4 1148
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1148
INDIRI4
CNSTI4 0
NEI4 $965
line 1800
;1800:		Cmd_TeleGren_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_TeleGren_f
CALLV
pop
ADDRGP4 $966
JUMPV
LABELV $965
line 1801
;1801:	else if (Q_stricmp (cmd, "dropflag") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $970
ARGP4
ADDRLP4 1152
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1152
INDIRI4
CNSTI4 0
NEI4 $968
line 1802
;1802:		Cmd_DropFlag_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_DropFlag_f
CALLV
pop
ADDRGP4 $969
JUMPV
LABELV $968
line 1804
;1803:	else
;1804:		trap_SendServerCommand( clientNum, va("print \"unknown cmd %s\n\"", cmd ) );
ADDRGP4 $971
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1156
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1156
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $969
LABELV $966
LABELV $963
LABELV $960
LABELV $957
LABELV $954
LABELV $951
LABELV $948
LABELV $945
LABELV $942
LABELV $939
LABELV $936
LABELV $933
LABELV $930
LABELV $927
LABELV $925
LABELV $922
LABELV $919
LABELV $916
LABELV $913
LABELV $910
line 1805
;1805:}
LABELV $872
endproc ClientCommand 1160 16
export G_SendCommandToClient
proc G_SendCommandToClient 0 8
line 1815
;1806:
;1807:/*
;1808:============================
;1809:G_SendCommandToClient
;1810:Send the given command to the specified (or all) clients
;1811:Shafe - Trep - This is for the Radar
;1812:============================
;1813:*/
;1814:void G_SendCommandToClient (gentity_t *to, char *cmd)
;1815:{
line 1816
;1816:	if (to == NULL) 
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $973
line 1817
;1817:	{
line 1819
;1818:		// send to all clients 
;1819:	trap_SendServerCommand ( -1, cmd );
CNSTI4 -1
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1820
;1820:	} else {
ADDRGP4 $974
JUMPV
LABELV $973
line 1822
;1821:    // send to specified client
;1822:    trap_SendServerCommand ( to-g_entities, cmd);
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 836
DIVI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1823
;1823:	}
LABELV $974
line 1824
;1824:}
LABELV $972
endproc G_SendCommandToClient 0 8
import Team_ResetFlags
import Team_ReturnFlagSound
import CheckPlayerPostions
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
LABELV $971
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $970
byte 1 100
byte 1 114
byte 1 111
byte 1 112
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $967
byte 1 112
byte 1 100
byte 1 103
byte 1 0
align 1
LABELV $964
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $961
byte 1 115
byte 1 101
byte 1 116
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 112
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $958
byte 1 103
byte 1 99
byte 1 0
align 1
LABELV $955
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $952
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $949
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $946
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $943
byte 1 119
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $940
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $937
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 0
align 1
LABELV $934
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $931
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $928
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $923
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $920
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $917
byte 1 110
byte 1 111
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $914
byte 1 103
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $911
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $903
byte 1 118
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $900
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $897
byte 1 118
byte 1 111
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $894
byte 1 118
byte 1 111
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $889
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $886
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $883
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $880
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $877
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $863
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 112
byte 1 111
byte 1 115
byte 1 32
byte 1 120
byte 1 32
byte 1 121
byte 1 32
byte 1 122
byte 1 32
byte 1 121
byte 1 97
byte 1 119
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $846
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $843
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $840
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $816
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $804
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 32
byte 1 60
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 62
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $803
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $768
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $762
byte 1 32
byte 1 0
align 1
LABELV $753
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 105
byte 1 109
byte 1 117
byte 1 109
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $750
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 65
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $728
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $727
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $724
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $721
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $712
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $702
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $698
byte 1 37
byte 1 115
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $692
byte 1 118
byte 1 115
byte 1 116
byte 1 114
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $689
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $683
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $678
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 59
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $671
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $668
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $665
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $657
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $652
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 44
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 44
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 60
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 62
byte 1 44
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 60
byte 1 110
byte 1 62
byte 1 44
byte 1 32
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 60
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 62
byte 1 44
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 60
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 110
byte 1 117
byte 1 109
byte 1 62
byte 1 44
byte 1 32
byte 1 103
byte 1 95
byte 1 100
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 44
byte 1 32
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
byte 1 60
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 62
byte 1 44
byte 1 32
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
byte 1 60
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 62
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $651
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
LABELV $648
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
LABELV $645
byte 1 103
byte 1 95
byte 1 100
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $642
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $639
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $636
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $633
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $630
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $627
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $624
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $620
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $617
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 105
byte 1 109
byte 1 117
byte 1 109
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $614
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 65
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $610
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $605
byte 1 72
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $604
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $603
byte 1 79
byte 1 110
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 67
byte 1 84
byte 1 70
byte 1 0
align 1
LABELV $602
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
LABELV $601
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
LABELV $600
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
LABELV $599
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
LABELV $598
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
LABELV $597
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $588
byte 1 114
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $587
byte 1 115
byte 1 101
byte 1 97
byte 1 114
byte 1 99
byte 1 104
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 0
align 1
LABELV $586
byte 1 103
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 32
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $585
byte 1 99
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $584
byte 1 99
byte 1 111
byte 1 109
byte 1 101
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $583
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 112
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $582
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 112
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $581
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $578
byte 1 112
byte 1 114
byte 1 97
byte 1 105
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $561
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 95
byte 1 105
byte 1 110
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $556
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 95
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $545
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 105
byte 1 110
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $535
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $513
byte 1 118
byte 1 111
byte 1 105
byte 1 99
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $503
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $502
byte 1 118
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $501
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $498
byte 1 118
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $481
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $459
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $453
byte 1 25
byte 1 91
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 93
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $452
byte 1 25
byte 1 91
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 93
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $447
byte 1 25
byte 1 40
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 41
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $446
byte 1 25
byte 1 40
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 41
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $443
byte 1 115
byte 1 97
byte 1 121
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $441
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $440
byte 1 115
byte 1 97
byte 1 121
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $429
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $428
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $427
byte 1 37
byte 1 115
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $399
byte 1 67
byte 1 109
byte 1 100
byte 1 95
byte 1 70
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 67
byte 1 121
byte 1 99
byte 1 108
byte 1 101
byte 1 95
byte 1 102
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 100
byte 1 105
byte 1 114
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $370
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 77
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 87
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 85
byte 1 110
byte 1 116
byte 1 105
byte 1 108
byte 1 32
byte 1 78
byte 1 101
byte 1 120
byte 1 116
byte 1 32
byte 1 82
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 84
byte 1 111
byte 1 32
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 46
byte 1 34
byte 1 0
align 1
LABELV $366
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 65
byte 1 114
byte 1 101
byte 1 32
byte 1 69
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 85
byte 1 110
byte 1 116
byte 1 105
byte 1 108
byte 1 32
byte 1 78
byte 1 101
byte 1 120
byte 1 116
byte 1 32
byte 1 82
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 34
byte 1 0
align 1
LABELV $353
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 77
byte 1 97
byte 1 121
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 32
byte 1 53
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $347
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 83
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $345
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 70
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $343
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $341
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $302
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $297
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $286
byte 1 98
byte 1 0
align 1
LABELV $285
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $281
byte 1 114
byte 1 0
align 1
LABELV $280
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $273
byte 1 115
byte 1 0
align 1
LABELV $272
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $269
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 50
byte 1 0
align 1
LABELV $266
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 49
byte 1 0
align 1
LABELV $262
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $261
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $257
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $254
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $253
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 72
byte 1 97
byte 1 115
byte 1 32
byte 1 66
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 69
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 33
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $249
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 39
byte 1 115
byte 1 32
byte 1 65
byte 1 114
byte 1 115
byte 1 101
byte 1 110
byte 1 97
byte 1 108
byte 1 32
byte 1 73
byte 1 115
byte 1 32
byte 1 69
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $241
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $238
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $229
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $228
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $224
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 76
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 83
byte 1 104
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $223
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 77
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 48
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $213
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 32
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $212
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 32
byte 1 79
byte 1 70
byte 1 70
byte 1 10
byte 1 0
align 1
LABELV $206
byte 1 110
byte 1 111
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $205
byte 1 110
byte 1 111
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 79
byte 1 70
byte 1 70
byte 1 10
byte 1 0
align 1
LABELV $199
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $198
byte 1 103
byte 1 111
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $197
byte 1 103
byte 1 111
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 79
byte 1 70
byte 1 70
byte 1 10
byte 1 0
align 1
LABELV $185
byte 1 97
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $182
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $179
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 97
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $176
byte 1 105
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $173
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $167
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $157
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $151
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $145
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $142
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $136
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 85
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $126
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $123
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $97
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $94
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 104
byte 1 101
byte 1 97
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $87
byte 1 94
byte 1 50
byte 1 80
byte 1 68
byte 1 71
byte 1 32
byte 1 76
byte 1 111
byte 1 99
byte 1 107
byte 1 32
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 69
byte 1 115
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 105
byte 1 115
byte 1 104
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $79
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $72
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
