export BotAI_Print
code
proc BotAI_Print 2056 12
file "../ai_main.c"
line 75
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:/*****************************************************************************
;5: * name:		ai_main.c
;6: *
;7: * desc:		Quake3 bot AI
;8: *
;9: * $Archive: /MissionPack/code/game/ai_main.c $
;10: *
;11: *****************************************************************************/
;12:
;13:
;14:#include "g_local.h"
;15:#include "q_shared.h"
;16:#include "botlib.h"		//bot lib interface
;17:#include "be_aas.h"
;18:#include "be_ea.h"
;19:#include "be_ai_char.h"
;20:#include "be_ai_chat.h"
;21:#include "be_ai_gen.h"
;22:#include "be_ai_goal.h"
;23:#include "be_ai_move.h"
;24:#include "be_ai_weap.h"
;25://
;26:#include "ai_main.h"
;27:#include "ai_dmq3.h"
;28:#include "ai_chat.h"
;29:#include "ai_cmd.h"
;30:#include "ai_dmnet.h"
;31:#include "ai_vcmd.h"
;32:
;33://
;34:#include "chars.h"
;35:#include "inv.h"
;36:#include "syn.h"
;37:
;38:#define MAX_PATH		144
;39:
;40:
;41://bot states
;42:bot_state_t	*botstates[MAX_CLIENTS];
;43://number of bots
;44:int numbots;
;45://floating point time
;46:float floattime;
;47://time to do a regular update
;48:float regularupdate_time;
;49://
;50:int bot_interbreed;
;51:int bot_interbreedmatchcount;
;52://
;53:vmCvar_t bot_thinktime;
;54:vmCvar_t bot_memorydump;
;55:vmCvar_t bot_saveroutingcache;
;56:vmCvar_t bot_pause;
;57:vmCvar_t bot_report;
;58:vmCvar_t bot_testsolid;
;59:vmCvar_t bot_testclusters;
;60:vmCvar_t bot_developer;
;61:vmCvar_t bot_interbreedchar;
;62:vmCvar_t bot_interbreedbots;
;63:vmCvar_t bot_interbreedcycle;
;64:vmCvar_t bot_interbreedwrite;
;65:
;66:
;67:void ExitLevel( void );
;68:
;69:
;70:/*
;71:==================
;72:BotAI_Print
;73:==================
;74:*/
;75:void QDECL BotAI_Print(int type, char *fmt, ...) {
line 79
;76:	char str[2048];
;77:	va_list ap;
;78:
;79:	va_start(ap, fmt);
ADDRLP4 0
ADDRFP4 4+4
ASGNP4
line 80
;80:	vsprintf(str, fmt, ap);
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 81
;81:	va_end(ap);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 83
;82:
;83:	switch(type) {
ADDRLP4 2052
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 2052
INDIRI4
CNSTI4 1
LTI4 $58
ADDRLP4 2052
INDIRI4
CNSTI4 5
GTI4 $58
ADDRLP4 2052
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $71-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $71
address $60
address $62
address $64
address $66
address $68
code
LABELV $60
line 84
;84:		case PRT_MESSAGE: {
line 85
;85:			G_Printf("%s", str);
ADDRGP4 $61
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 86
;86:			break;
ADDRGP4 $59
JUMPV
LABELV $62
line 88
;87:		}
;88:		case PRT_WARNING: {
line 89
;89:			G_Printf( S_COLOR_YELLOW "Warning: %s", str );
ADDRGP4 $63
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 90
;90:			break;
ADDRGP4 $59
JUMPV
LABELV $64
line 92
;91:		}
;92:		case PRT_ERROR: {
line 93
;93:			G_Printf( S_COLOR_RED "Error: %s", str );
ADDRGP4 $65
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 94
;94:			break;
ADDRGP4 $59
JUMPV
LABELV $66
line 96
;95:		}
;96:		case PRT_FATAL: {
line 97
;97:			G_Printf( S_COLOR_RED "Fatal: %s", str );
ADDRGP4 $67
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 98
;98:			break;
ADDRGP4 $59
JUMPV
LABELV $68
line 100
;99:		}
;100:		case PRT_EXIT: {
line 101
;101:			G_Error( S_COLOR_RED "Exit: %s", str );
ADDRGP4 $69
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 102
;102:			break;
ADDRGP4 $59
JUMPV
LABELV $58
line 104
;103:		}
;104:		default: {
line 105
;105:			G_Printf( "unknown print type\n" );
ADDRGP4 $70
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 106
;106:			break;
LABELV $59
line 109
;107:		}
;108:	}
;109:}
LABELV $56
endproc BotAI_Print 2056 12
export BotAI_Trace
proc BotAI_Trace 56 28
line 117
;110:
;111:
;112:/*
;113:==================
;114:BotAI_Trace
;115:==================
;116:*/
;117:void BotAI_Trace(bsp_trace_t *bsptrace, vec3_t start, vec3_t mins, vec3_t maxs, vec3_t end, int passent, int contentmask) {
line 120
;118:	trace_t trace;
;119:
;120:	trap_Trace(&trace, start, mins, maxs, end, passent, contentmask);
ADDRLP4 0
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
ADDRGP4 trap_Trace
CALLV
pop
line 122
;121:	//copy the trace information
;122:	bsptrace->allsolid = trace.allsolid;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 123
;123:	bsptrace->startsolid = trace.startsolid;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0+4
INDIRI4
ASGNI4
line 124
;124:	bsptrace->fraction = trace.fraction;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0+8
INDIRF4
ASGNF4
line 125
;125:	VectorCopy(trace.endpos, bsptrace->endpos);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 126
;126:	bsptrace->plane.dist = trace.plane.dist;
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0+24+12
INDIRF4
ASGNF4
line 127
;127:	VectorCopy(trace.plane.normal, bsptrace->plane.normal);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 128
;128:	bsptrace->plane.signbits = trace.plane.signbits;
ADDRFP4 0
INDIRP4
CNSTI4 41
ADDP4
ADDRLP4 0+24+17
INDIRU1
ASGNU1
line 129
;129:	bsptrace->plane.type = trace.plane.type;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0+24+16
INDIRU1
ASGNU1
line 130
;130:	bsptrace->surface.value = trace.surfaceFlags;
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 0+44
INDIRI4
ASGNI4
line 131
;131:	bsptrace->ent = trace.entityNum;
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 0+52
INDIRI4
ASGNI4
line 132
;132:	bsptrace->exp_dist = 0;
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 0
ASGNF4
line 133
;133:	bsptrace->sidenum = 0;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 134
;134:	bsptrace->contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
CNSTI4 0
ASGNI4
line 135
;135:}
LABELV $73
endproc BotAI_Trace 56 28
export BotAI_GetClientState
proc BotAI_GetClientState 4 12
line 142
;136:
;137:/*
;138:==================
;139:BotAI_GetClientState
;140:==================
;141:*/
;142:int BotAI_GetClientState( int clientNum, playerState_t *state ) {
line 145
;143:	gentity_t	*ent;
;144:
;145:	ent = &g_entities[clientNum];
ADDRLP4 0
CNSTI4 916
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 146
;146:	if ( !ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $87
line 147
;147:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $86
JUMPV
LABELV $87
line 149
;148:	}
;149:	if ( !ent->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $89
line 150
;150:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $86
JUMPV
LABELV $89
line 153
;151:	}
;152:
;153:	memcpy( state, &ent->client->ps, sizeof(playerState_t) );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
CNSTI4 468
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 154
;154:	return qtrue;
CNSTI4 1
RETI4
LABELV $86
endproc BotAI_GetClientState 4 12
export BotAI_GetEntityState
proc BotAI_GetEntityState 4 12
line 162
;155:}
;156:
;157:/*
;158:==================
;159:BotAI_GetEntityState
;160:==================
;161:*/
;162:int BotAI_GetEntityState( int entityNum, entityState_t *state ) {
line 165
;163:	gentity_t	*ent;
;164:
;165:	ent = &g_entities[entityNum];
ADDRLP4 0
CNSTI4 916
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 166
;166:	memset( state, 0, sizeof(entityState_t) );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 167
;167:	if (!ent->inuse) return qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $92
CNSTI4 0
RETI4
ADDRGP4 $91
JUMPV
LABELV $92
line 168
;168:	if (!ent->r.linked) return qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 0
NEI4 $94
CNSTI4 0
RETI4
ADDRGP4 $91
JUMPV
LABELV $94
line 169
;169:	if (ent->r.svFlags & SVF_NOCLIENT) return qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $96
CNSTI4 0
RETI4
ADDRGP4 $91
JUMPV
LABELV $96
line 170
;170:	memcpy( state, &ent->s, sizeof(entityState_t) );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 212
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 171
;171:	return qtrue;
CNSTI4 1
RETI4
LABELV $91
endproc BotAI_GetEntityState 4 12
export BotAI_GetSnapshotEntity
proc BotAI_GetSnapshotEntity 8 12
line 179
;172:}
;173:
;174:/*
;175:==================
;176:BotAI_GetSnapshotEntity
;177:==================
;178:*/
;179:int BotAI_GetSnapshotEntity( int clientNum, int sequence, entityState_t *state ) {
line 182
;180:	int		entNum;
;181:
;182:	entNum = trap_BotGetSnapshotEntity( clientNum, sequence );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 trap_BotGetSnapshotEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 183
;183:	if ( entNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $99
line 184
;184:		memset(state, 0, sizeof(entityState_t));
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 185
;185:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $98
JUMPV
LABELV $99
line 188
;186:	}
;187:
;188:	BotAI_GetEntityState( entNum, state );
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 BotAI_GetEntityState
CALLI4
pop
line 190
;189:
;190:	return sequence + 1;
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
RETI4
LABELV $98
endproc BotAI_GetSnapshotEntity 8 12
export BotAI_BotInitialChat
proc BotAI_BotInitialChat 56 44
line 198
;191:}
;192:
;193:/*
;194:==================
;195:BotAI_BotInitialChat
;196:==================
;197:*/
;198:void QDECL BotAI_BotInitialChat( bot_state_t *bs, char *type, ... ) {
line 204
;199:	int		i, mcontext;
;200:	va_list	ap;
;201:	char	*p;
;202:	char	*vars[MAX_MATCHVARIABLES];
;203:
;204:	memset(vars, 0, sizeof(vars));
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
CNSTI4 32
ARGI4
ADDRGP4 memset
CALLP4
pop
line 205
;205:	va_start(ap, type);
ADDRLP4 40
ADDRFP4 4+4
ASGNP4
line 206
;206:	p = va_arg(ap, char *);
ADDRLP4 48
ADDRLP4 40
INDIRP4
CNSTU4 4
ADDP4
ASGNP4
ADDRLP4 40
ADDRLP4 48
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 48
INDIRP4
CNSTI4 -4
ADDP4
INDIRP4
ASGNP4
line 207
;207:	for (i = 0; i < MAX_MATCHVARIABLES; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $103
line 208
;208:		if( !p ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $107
line 209
;209:			break;
ADDRGP4 $105
JUMPV
LABELV $107
line 211
;210:		}
;211:		vars[i] = p;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 212
;212:		p = va_arg(ap, char *);
ADDRLP4 52
ADDRLP4 40
INDIRP4
CNSTU4 4
ADDP4
ASGNP4
ADDRLP4 40
ADDRLP4 52
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 52
INDIRP4
CNSTI4 -4
ADDP4
INDIRP4
ASGNP4
line 213
;213:	}
LABELV $104
line 207
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $103
LABELV $105
line 214
;214:	va_end(ap);
ADDRLP4 40
CNSTP4 0
ASGNP4
line 216
;215:
;216:	mcontext = BotSynonymContext(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 BotSynonymContext
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 52
INDIRI4
ASGNI4
line 218
;217:
;218:	trap_BotInitialChat( bs->cs, type, mcontext, vars[0], vars[1], vars[2], vars[3], vars[4], vars[5], vars[6], vars[7] );
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8+4
INDIRP4
ARGP4
ADDRLP4 8+8
INDIRP4
ARGP4
ADDRLP4 8+12
INDIRP4
ARGP4
ADDRLP4 8+16
INDIRP4
ARGP4
ADDRLP4 8+20
INDIRP4
ARGP4
ADDRLP4 8+24
INDIRP4
ARGP4
ADDRLP4 8+28
INDIRP4
ARGP4
ADDRGP4 trap_BotInitialChat
CALLV
pop
line 219
;219:}
LABELV $101
endproc BotAI_BotInitialChat 56 44
export BotTestAAS
proc BotTestAAS 64 16
line 227
;220:
;221:
;222:/*
;223:==================
;224:BotTestAAS
;225:==================
;226:*/
;227:void BotTestAAS(vec3_t origin) {
line 231
;228:	int areanum;
;229:	aas_areainfo_t info;
;230:
;231:	trap_Cvar_Update(&bot_testsolid);
ADDRGP4 bot_testsolid
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 232
;232:	trap_Cvar_Update(&bot_testclusters);
ADDRGP4 bot_testclusters
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 233
;233:	if (bot_testsolid.integer) {
ADDRGP4 bot_testsolid+12
INDIRI4
CNSTI4 0
EQI4 $117
line 234
;234:		if (!trap_AAS_Initialized()) return;
ADDRLP4 56
ADDRGP4 trap_AAS_Initialized
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $120
ADDRGP4 $116
JUMPV
LABELV $120
line 235
;235:		areanum = BotPointAreaNum(origin);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 60
INDIRI4
ASGNI4
line 236
;236:		if (areanum) BotAI_Print(PRT_MESSAGE, "\remtpy area");
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $122
CNSTI4 1
ARGI4
ADDRGP4 $124
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
ADDRGP4 $118
JUMPV
LABELV $122
line 237
;237:		else BotAI_Print(PRT_MESSAGE, "\r^1SOLID area");
CNSTI4 1
ARGI4
ADDRGP4 $125
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 238
;238:	}
ADDRGP4 $118
JUMPV
LABELV $117
line 239
;239:	else if (bot_testclusters.integer) {
ADDRGP4 bot_testclusters+12
INDIRI4
CNSTI4 0
EQI4 $126
line 240
;240:		if (!trap_AAS_Initialized()) return;
ADDRLP4 56
ADDRGP4 trap_AAS_Initialized
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $129
ADDRGP4 $116
JUMPV
LABELV $129
line 241
;241:		areanum = BotPointAreaNum(origin);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 60
INDIRI4
ASGNI4
line 242
;242:		if (!areanum)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $131
line 243
;243:			BotAI_Print(PRT_MESSAGE, "\r^1Solid!                              ");
CNSTI4 1
ARGI4
ADDRGP4 $133
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
ADDRGP4 $132
JUMPV
LABELV $131
line 244
;244:		else {
line 245
;245:			trap_AAS_AreaInfo(areanum, &info);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_AAS_AreaInfo
CALLI4
pop
line 246
;246:			BotAI_Print(PRT_MESSAGE, "\rarea %d, cluster %d       ", areanum, info.cluster);
CNSTI4 1
ARGI4
ADDRGP4 $134
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4+12
INDIRI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 247
;247:		}
LABELV $132
line 248
;248:	}
LABELV $126
LABELV $118
line 249
;249:}
LABELV $116
endproc BotTestAAS 64 16
export BotReportStatus
proc BotReportStatus 560 24
line 256
;250:
;251:/*
;252:==================
;253:BotReportStatus
;254:==================
;255:*/
;256:void BotReportStatus(bot_state_t *bs) {
line 261
;257:	char goalname[MAX_MESSAGE_SIZE];
;258:	char netname[MAX_MESSAGE_SIZE];
;259:	char *leader, flagstatus[32];
;260:	//
;261:	ClientName(bs->client, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 262
;262:	if (Q_stricmp(netname, bs->teamleader) == 0) leader = "L";
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 548
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 548
INDIRI4
CNSTI4 0
NEI4 $137
ADDRLP4 288
ADDRGP4 $139
ASGNP4
ADDRGP4 $138
JUMPV
LABELV $137
line 263
;263:	else leader = " ";
ADDRLP4 288
ADDRGP4 $140
ASGNP4
LABELV $138
line 265
;264:
;265:	strcpy(flagstatus, "  ");
ADDRLP4 256
ARGP4
ADDRGP4 $141
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 266
;266:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $142
line 267
;267:		if (BotCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 552
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 552
INDIRI4
CNSTI4 0
EQI4 $144
line 268
;268:			if (BotTeam(bs) == TEAM_RED) strcpy(flagstatus, S_COLOR_RED"F ");
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 556
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 556
INDIRI4
CNSTI4 1
NEI4 $146
ADDRLP4 256
ARGP4
ADDRGP4 $148
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $147
JUMPV
LABELV $146
line 269
;269:			else strcpy(flagstatus, S_COLOR_BLUE"F ");
ADDRLP4 256
ARGP4
ADDRGP4 $149
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $147
line 270
;270:		}
LABELV $144
line 271
;271:	}
LABELV $142
line 287
;272:#ifdef MISSIONPACK
;273:	else if (gametype == GT_1FCTF) {
;274:		if (Bot1FCTFCarryingFlag(bs)) {
;275:			if (BotTeam(bs) == TEAM_RED) strcpy(flagstatus, S_COLOR_RED"F ");
;276:			else strcpy(flagstatus, S_COLOR_BLUE"F ");
;277:		}
;278:	}
;279:	else if (gametype == GT_HARVESTER) {
;280:		if (BotHarvesterCarryingCubes(bs)) {
;281:			if (BotTeam(bs) == TEAM_RED) Com_sprintf(flagstatus, sizeof(flagstatus), S_COLOR_RED"%2d", bs->inventory[INVENTORY_REDCUBE]);
;282:			else Com_sprintf(flagstatus, sizeof(flagstatus), S_COLOR_BLUE"%2d", bs->inventory[INVENTORY_BLUECUBE]);
;283:		}
;284:	}
;285:#endif
;286:
;287:	switch(bs->ltgtype) {
ADDRLP4 552
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
ASGNI4
ADDRLP4 552
INDIRI4
CNSTI4 1
LTI4 $150
ADDRLP4 552
INDIRI4
CNSTI4 13
GTI4 $150
ADDRLP4 552
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $178-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $178
address $153
address $155
address $157
address $167
address $169
address $171
address $163
address $163
address $165
address $159
address $161
address $175
address $173
code
LABELV $153
line 289
;288:		case LTG_TEAMHELP:
;289:		{
line 290
;290:			EasyClientName(bs->teammate, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 291
;291:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: helping %s\n", netname, leader, flagstatus, goalname);
CNSTI4 1
ARGI4
ADDRGP4 $154
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRLP4 292
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 292
;292:			break;
ADDRGP4 $151
JUMPV
LABELV $155
line 295
;293:		}
;294:		case LTG_TEAMACCOMPANY:
;295:		{
line 296
;296:			EasyClientName(bs->teammate, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 297
;297:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: accompanying %s\n", netname, leader, flagstatus, goalname);
CNSTI4 1
ARGI4
ADDRGP4 $156
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRLP4 292
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 298
;298:			break;
ADDRGP4 $151
JUMPV
LABELV $157
line 301
;299:		}
;300:		case LTG_DEFENDKEYAREA:
;301:		{
line 302
;302:			trap_BotGoalName(bs->teamgoal.number, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 303
;303:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: defending %s\n", netname, leader, flagstatus, goalname);
CNSTI4 1
ARGI4
ADDRGP4 $158
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRLP4 292
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 304
;304:			break;
ADDRGP4 $151
JUMPV
LABELV $159
line 307
;305:		}
;306:		case LTG_GETITEM:
;307:		{
line 308
;308:			trap_BotGoalName(bs->teamgoal.number, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 309
;309:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: getting item %s\n", netname, leader, flagstatus, goalname);
CNSTI4 1
ARGI4
ADDRGP4 $160
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRLP4 292
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 310
;310:			break;
ADDRGP4 $151
JUMPV
LABELV $161
line 313
;311:		}
;312:		case LTG_KILL:
;313:		{
line 314
;314:			ClientName(bs->teamgoal.entitynum, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 315
;315:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: killing %s\n", netname, leader, flagstatus, goalname);
CNSTI4 1
ARGI4
ADDRGP4 $162
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRLP4 292
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 316
;316:			break;
ADDRGP4 $151
JUMPV
LABELV $163
line 320
;317:		}
;318:		case LTG_CAMP:
;319:		case LTG_CAMPORDER:
;320:		{
line 321
;321:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: camping\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $164
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 322
;322:			break;
ADDRGP4 $151
JUMPV
LABELV $165
line 325
;323:		}
;324:		case LTG_PATROL:
;325:		{
line 326
;326:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: patrolling\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $166
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 327
;327:			break;
ADDRGP4 $151
JUMPV
LABELV $167
line 330
;328:		}
;329:		case LTG_GETFLAG:
;330:		{
line 331
;331:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: capturing flag\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $168
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 332
;332:			break;
ADDRGP4 $151
JUMPV
LABELV $169
line 335
;333:		}
;334:		case LTG_RUSHBASE:
;335:		{
line 336
;336:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: rushing base\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $170
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 337
;337:			break;
ADDRGP4 $151
JUMPV
LABELV $171
line 340
;338:		}
;339:		case LTG_RETURNFLAG:
;340:		{
line 341
;341:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: returning flag\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $172
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 342
;342:			break;
ADDRGP4 $151
JUMPV
LABELV $173
line 345
;343:		}
;344:		case LTG_ATTACKENEMYBASE:
;345:		{
line 346
;346:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: attacking the enemy base\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $174
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 347
;347:			break;
ADDRGP4 $151
JUMPV
LABELV $175
line 350
;348:		}
;349:		case LTG_HARVEST:
;350:		{
line 351
;351:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: harvesting\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $176
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 352
;352:			break;
ADDRGP4 $151
JUMPV
LABELV $150
line 355
;353:		}
;354:		default:
;355:		{
line 356
;356:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: roaming\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $177
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 357
;357:			break;
LABELV $151
line 360
;358:		}
;359:	}
;360:}
LABELV $136
endproc BotReportStatus 560 24
export BotTeamplayReport
proc BotTeamplayReport 1056 12
line 367
;361:
;362:/*
;363:==================
;364:BotTeamplayReport
;365:==================
;366:*/
;367:void BotTeamplayReport(void) {
line 371
;368:	int i;
;369:	char buf[MAX_INFO_STRING];
;370:
;371:	BotAI_Print(PRT_MESSAGE, S_COLOR_RED"RED\n");
CNSTI4 1
ARGI4
ADDRGP4 $181
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 372
;372:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $185
JUMPV
LABELV $182
line 374
;373:		//
;374:		if ( !botstates[i] || !botstates[i]->inuse ) continue;
ADDRLP4 1028
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1028
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $188
ADDRLP4 1028
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $186
LABELV $188
ADDRGP4 $183
JUMPV
LABELV $186
line 376
;375:		//
;376:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 378
;377:		//if no config string or no name
;378:		if (!strlen(buf) || !strlen(Info_ValueForKey(buf, "n"))) continue;
ADDRLP4 4
ARGP4
ADDRLP4 1032
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
EQI4 $192
ADDRLP4 4
ARGP4
ADDRGP4 $191
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $189
LABELV $192
ADDRGP4 $183
JUMPV
LABELV $189
line 380
;379:		//skip spectators
;380:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_RED) {
ADDRLP4 4
ARGP4
ADDRGP4 $195
ARGP4
ADDRLP4 1044
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 1
NEI4 $193
line 381
;381:			BotReportStatus(botstates[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotReportStatus
CALLV
pop
line 382
;382:		}
LABELV $193
line 383
;383:	}
LABELV $183
line 372
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $185
ADDRLP4 0
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $196
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $182
LABELV $196
line 384
;384:	BotAI_Print(PRT_MESSAGE, S_COLOR_BLUE"BLUE\n");
CNSTI4 1
ARGI4
ADDRGP4 $197
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 385
;385:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $201
JUMPV
LABELV $198
line 387
;386:		//
;387:		if ( !botstates[i] || !botstates[i]->inuse ) continue;
ADDRLP4 1032
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1032
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $204
ADDRLP4 1032
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $202
LABELV $204
ADDRGP4 $199
JUMPV
LABELV $202
line 389
;388:		//
;389:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 391
;390:		//if no config string or no name
;391:		if (!strlen(buf) || !strlen(Info_ValueForKey(buf, "n"))) continue;
ADDRLP4 4
ARGP4
ADDRLP4 1036
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
EQI4 $207
ADDRLP4 4
ARGP4
ADDRGP4 $191
ARGP4
ADDRLP4 1040
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $205
LABELV $207
ADDRGP4 $199
JUMPV
LABELV $205
line 393
;392:		//skip spectators
;393:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_BLUE) {
ADDRLP4 4
ARGP4
ADDRGP4 $195
ARGP4
ADDRLP4 1048
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRLP4 1052
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 2
NEI4 $208
line 394
;394:			BotReportStatus(botstates[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotReportStatus
CALLV
pop
line 395
;395:		}
LABELV $208
line 396
;396:	}
LABELV $199
line 385
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $201
ADDRLP4 0
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $210
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $198
LABELV $210
line 397
;397:}
LABELV $180
endproc BotTeamplayReport 1056 12
export BotSetInfoConfigString
proc BotSetInfoConfigString 880 16
line 404
;398:
;399:/*
;400:==================
;401:BotSetInfoConfigString
;402:==================
;403:*/
;404:void BotSetInfoConfigString(bot_state_t *bs) {
line 411
;405:	char goalname[MAX_MESSAGE_SIZE];
;406:	char netname[MAX_MESSAGE_SIZE];
;407:	char action[MAX_MESSAGE_SIZE];
;408:	char *leader, carrying[32], *cs;
;409:	bot_goal_t goal;
;410:	//
;411:	ClientName(bs->client, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 256
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 412
;412:	if (Q_stricmp(netname, bs->teamleader) == 0) leader = "L";
ADDRLP4 256
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 864
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 864
INDIRI4
CNSTI4 0
NEI4 $212
ADDRLP4 544
ADDRGP4 $139
ASGNP4
ADDRGP4 $213
JUMPV
LABELV $212
line 413
;413:	else leader = " ";
ADDRLP4 544
ADDRGP4 $140
ASGNP4
LABELV $213
line 415
;414:
;415:	strcpy(carrying, "  ");
ADDRLP4 512
ARGP4
ADDRGP4 $141
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 416
;416:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $214
line 417
;417:		if (BotCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 868
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 868
INDIRI4
CNSTI4 0
EQI4 $216
line 418
;418:			strcpy(carrying, "F ");
ADDRLP4 512
ARGP4
ADDRGP4 $218
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 419
;419:		}
LABELV $216
line 420
;420:	}
LABELV $214
line 435
;421:#ifdef MISSIONPACK
;422:	else if (gametype == GT_1FCTF) {
;423:		if (Bot1FCTFCarryingFlag(bs)) {
;424:			strcpy(carrying, "F ");
;425:		}
;426:	}
;427:	else if (gametype == GT_HARVESTER) {
;428:		if (BotHarvesterCarryingCubes(bs)) {
;429:			if (BotTeam(bs) == TEAM_RED) Com_sprintf(carrying, sizeof(carrying), "%2d", bs->inventory[INVENTORY_REDCUBE]);
;430:			else Com_sprintf(carrying, sizeof(carrying), "%2d", bs->inventory[INVENTORY_BLUECUBE]);
;431:		}
;432:	}
;433:#endif
;434:
;435:	switch(bs->ltgtype) {
ADDRLP4 868
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
ASGNI4
ADDRLP4 868
INDIRI4
CNSTI4 1
LTI4 $219
ADDRLP4 868
INDIRI4
CNSTI4 13
GTI4 $219
ADDRLP4 868
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $248-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $248
address $222
address $224
address $226
address $236
address $238
address $240
address $232
address $232
address $234
address $228
address $230
address $244
address $242
code
LABELV $222
line 437
;436:		case LTG_TEAMHELP:
;437:		{
line 438
;438:			EasyClientName(bs->teammate, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 552
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 439
;439:			Com_sprintf(action, sizeof(action), "helping %s", goalname);
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $223
ARGP4
ADDRLP4 552
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 440
;440:			break;
ADDRGP4 $220
JUMPV
LABELV $224
line 443
;441:		}
;442:		case LTG_TEAMACCOMPANY:
;443:		{
line 444
;444:			EasyClientName(bs->teammate, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 552
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 445
;445:			Com_sprintf(action, sizeof(action), "accompanying %s", goalname);
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $225
ARGP4
ADDRLP4 552
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 446
;446:			break;
ADDRGP4 $220
JUMPV
LABELV $226
line 449
;447:		}
;448:		case LTG_DEFENDKEYAREA:
;449:		{
line 450
;450:			trap_BotGoalName(bs->teamgoal.number, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ARGI4
ADDRLP4 552
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 451
;451:			Com_sprintf(action, sizeof(action), "defending %s", goalname);
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $227
ARGP4
ADDRLP4 552
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 452
;452:			break;
ADDRGP4 $220
JUMPV
LABELV $228
line 455
;453:		}
;454:		case LTG_GETITEM:
;455:		{
line 456
;456:			trap_BotGoalName(bs->teamgoal.number, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ARGI4
ADDRLP4 552
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 457
;457:			Com_sprintf(action, sizeof(action), "getting item %s", goalname);
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $229
ARGP4
ADDRLP4 552
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 458
;458:			break;
ADDRGP4 $220
JUMPV
LABELV $230
line 461
;459:		}
;460:		case LTG_KILL:
;461:		{
line 462
;462:			ClientName(bs->teamgoal.entitynum, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
INDIRI4
ARGI4
ADDRLP4 552
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 463
;463:			Com_sprintf(action, sizeof(action), "killing %s", goalname);
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $231
ARGP4
ADDRLP4 552
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 464
;464:			break;
ADDRGP4 $220
JUMPV
LABELV $232
line 468
;465:		}
;466:		case LTG_CAMP:
;467:		case LTG_CAMPORDER:
;468:		{
line 469
;469:			Com_sprintf(action, sizeof(action), "camping");
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $233
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 470
;470:			break;
ADDRGP4 $220
JUMPV
LABELV $234
line 473
;471:		}
;472:		case LTG_PATROL:
;473:		{
line 474
;474:			Com_sprintf(action, sizeof(action), "patrolling");
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $235
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 475
;475:			break;
ADDRGP4 $220
JUMPV
LABELV $236
line 478
;476:		}
;477:		case LTG_GETFLAG:
;478:		{
line 479
;479:			Com_sprintf(action, sizeof(action), "capturing flag");
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $237
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 480
;480:			break;
ADDRGP4 $220
JUMPV
LABELV $238
line 483
;481:		}
;482:		case LTG_RUSHBASE:
;483:		{
line 484
;484:			Com_sprintf(action, sizeof(action), "rushing base");
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $239
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 485
;485:			break;
ADDRGP4 $220
JUMPV
LABELV $240
line 488
;486:		}
;487:		case LTG_RETURNFLAG:
;488:		{
line 489
;489:			Com_sprintf(action, sizeof(action), "returning flag");
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $241
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 490
;490:			break;
ADDRGP4 $220
JUMPV
LABELV $242
line 493
;491:		}
;492:		case LTG_ATTACKENEMYBASE:
;493:		{
line 494
;494:			Com_sprintf(action, sizeof(action), "attacking the enemy base");
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $243
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 495
;495:			break;
ADDRGP4 $220
JUMPV
LABELV $244
line 498
;496:		}
;497:		case LTG_HARVEST:
;498:		{
line 499
;499:			Com_sprintf(action, sizeof(action), "harvesting");
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $245
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 500
;500:			break;
ADDRGP4 $220
JUMPV
LABELV $219
line 503
;501:		}
;502:		default:
;503:		{
line 504
;504:			trap_BotGetTopGoal(bs->gs, &goal);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 808
ARGP4
ADDRGP4 trap_BotGetTopGoal
CALLI4
pop
line 505
;505:			trap_BotGoalName(goal.number, goalname, sizeof(goalname));
ADDRLP4 808+44
INDIRI4
ARGI4
ADDRLP4 552
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 506
;506:			Com_sprintf(action, sizeof(action), "roaming %s", goalname);
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $247
ARGP4
ADDRLP4 552
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 507
;507:			break;
LABELV $220
line 510
;508:		}
;509:	}
;510:  	cs = va("l\\%s\\c\\%s\\a\\%s",
ADDRGP4 $250
ARGP4
ADDRLP4 544
INDIRP4
ARGP4
ADDRLP4 512
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 876
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 548
ADDRLP4 876
INDIRP4
ASGNP4
line 514
;511:				leader,
;512:				carrying,
;513:				action);
;514:  	trap_SetConfigstring (CS_BOTINFO + bs->client, cs);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 25
ADDI4
ARGI4
ADDRLP4 548
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 515
;515:}
LABELV $211
endproc BotSetInfoConfigString 880 16
export BotUpdateInfoConfigStrings
proc BotUpdateInfoConfigStrings 1044 12
line 522
;516:
;517:/*
;518:==============
;519:BotUpdateInfoConfigStrings
;520:==============
;521:*/
;522:void BotUpdateInfoConfigStrings(void) {
line 526
;523:	int i;
;524:	char buf[MAX_INFO_STRING];
;525:
;526:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $255
JUMPV
LABELV $252
line 528
;527:		//
;528:		if ( !botstates[i] || !botstates[i]->inuse )
ADDRLP4 1028
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1028
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $258
ADDRLP4 1028
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $256
LABELV $258
line 529
;529:			continue;
ADDRGP4 $253
JUMPV
LABELV $256
line 531
;530:		//
;531:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 533
;532:		//if no config string or no name
;533:		if (!strlen(buf) || !strlen(Info_ValueForKey(buf, "n")))
ADDRLP4 4
ARGP4
ADDRLP4 1032
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
EQI4 $261
ADDRLP4 4
ARGP4
ADDRGP4 $191
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $259
LABELV $261
line 534
;534:			continue;
ADDRGP4 $253
JUMPV
LABELV $259
line 535
;535:		BotSetInfoConfigString(botstates[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotSetInfoConfigString
CALLV
pop
line 536
;536:	}
LABELV $253
line 526
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $255
ADDRLP4 0
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $262
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $252
LABELV $262
line 537
;537:}
LABELV $251
endproc BotUpdateInfoConfigStrings 1044 12
export BotInterbreedBots
proc BotInterbreedBots 288 20
line 544
;538:
;539:/*
;540:==============
;541:BotInterbreedBots
;542:==============
;543:*/
;544:void BotInterbreedBots(void) {
line 550
;545:	float ranks[MAX_CLIENTS];
;546:	int parent1, parent2, child;
;547:	int i;
;548:
;549:	// get rankings for all the bots
;550:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $264
line 551
;551:		if ( botstates[i] && botstates[i]->inuse ) {
ADDRLP4 272
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 272
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $268
ADDRLP4 272
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $268
line 552
;552:			ranks[i] = botstates[i]->num_kills * 2 - botstates[i]->num_deaths;
ADDRLP4 276
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 280
ADDRLP4 276
INDIRI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 276
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 280
INDIRP4
CNSTI4 6032
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 280
INDIRP4
CNSTI4 6028
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 553
;553:		}
ADDRGP4 $269
JUMPV
LABELV $268
line 554
;554:		else {
line 555
;555:			ranks[i] = -1;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
CNSTF4 3212836864
ASGNF4
line 556
;556:		}
LABELV $269
line 557
;557:	}
LABELV $265
line 550
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $264
line 559
;558:
;559:	if (trap_GeneticParentsAndChildSelection(MAX_CLIENTS, ranks, &parent1, &parent2, &child)) {
CNSTI4 64
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 264
ARGP4
ADDRLP4 268
ARGP4
ADDRLP4 260
ARGP4
ADDRLP4 272
ADDRGP4 trap_GeneticParentsAndChildSelection
CALLI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 0
EQI4 $270
line 560
;560:		trap_BotInterbreedGoalFuzzyLogic(botstates[parent1]->gs, botstates[parent2]->gs, botstates[child]->gs);
ADDRLP4 276
CNSTI4 2
ASGNI4
ADDRLP4 280
ADDRGP4 botstates
ASGNP4
ADDRLP4 284
CNSTI4 6528
ASGNI4
ADDRLP4 264
INDIRI4
ADDRLP4 276
INDIRI4
LSHI4
ADDRLP4 280
INDIRP4
ADDP4
INDIRP4
ADDRLP4 284
INDIRI4
ADDP4
INDIRI4
ARGI4
ADDRLP4 268
INDIRI4
ADDRLP4 276
INDIRI4
LSHI4
ADDRLP4 280
INDIRP4
ADDP4
INDIRP4
ADDRLP4 284
INDIRI4
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
INDIRI4
ADDRLP4 276
INDIRI4
LSHI4
ADDRLP4 280
INDIRP4
ADDP4
INDIRP4
ADDRLP4 284
INDIRI4
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotInterbreedGoalFuzzyLogic
CALLV
pop
line 561
;561:		trap_BotMutateGoalFuzzyLogic(botstates[child]->gs, 1);
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_BotMutateGoalFuzzyLogic
CALLV
pop
line 562
;562:	}
LABELV $270
line 564
;563:	// reset the kills and deaths
;564:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $272
line 565
;565:		if (botstates[i] && botstates[i]->inuse) {
ADDRLP4 276
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 276
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $276
ADDRLP4 276
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $276
line 566
;566:			botstates[i]->num_kills = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 6032
ADDP4
CNSTI4 0
ASGNI4
line 567
;567:			botstates[i]->num_deaths = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 6028
ADDP4
CNSTI4 0
ASGNI4
line 568
;568:		}
LABELV $276
line 569
;569:	}
LABELV $273
line 564
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $272
line 570
;570:}
LABELV $263
endproc BotInterbreedBots 288 20
export BotWriteInterbreeded
proc BotWriteInterbreeded 24 8
line 577
;571:
;572:/*
;573:==============
;574:BotWriteInterbreeded
;575:==============
;576:*/
;577:void BotWriteInterbreeded(char *filename) {
line 581
;578:	float rank, bestrank;
;579:	int i, bestbot;
;580:
;581:	bestrank = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 582
;582:	bestbot = -1;
ADDRLP4 12
CNSTI4 -1
ASGNI4
line 584
;583:	// get the best bot
;584:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $279
line 585
;585:		if ( botstates[i] && botstates[i]->inuse ) {
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $283
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $283
line 586
;586:			rank = botstates[i]->num_kills * 2 - botstates[i]->num_deaths;
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
CNSTI4 6032
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 20
INDIRP4
CNSTI4 6028
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 587
;587:		}
ADDRGP4 $284
JUMPV
LABELV $283
line 588
;588:		else {
line 589
;589:			rank = -1;
ADDRLP4 4
CNSTF4 3212836864
ASGNF4
line 590
;590:		}
LABELV $284
line 591
;591:		if (rank > bestrank) {
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $285
line 592
;592:			bestrank = rank;
ADDRLP4 8
ADDRLP4 4
INDIRF4
ASGNF4
line 593
;593:			bestbot = i;
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
line 594
;594:		}
LABELV $285
line 595
;595:	}
LABELV $280
line 584
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $279
line 596
;596:	if (bestbot >= 0) {
ADDRLP4 12
INDIRI4
CNSTI4 0
LTI4 $287
line 598
;597:		//write out the new goal fuzzy logic
;598:		trap_BotSaveGoalFuzzyLogic(botstates[bestbot]->gs, filename);
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_BotSaveGoalFuzzyLogic
CALLV
pop
line 599
;599:	}
LABELV $287
line 600
;600:}
LABELV $278
endproc BotWriteInterbreeded 24 8
export BotInterbreedEndMatch
proc BotInterbreedEndMatch 8 8
line 609
;601:
;602:/*
;603:==============
;604:BotInterbreedEndMatch
;605:
;606:add link back into ExitLevel?
;607:==============
;608:*/
;609:void BotInterbreedEndMatch(void) {
line 611
;610:
;611:	if (!bot_interbreed) return;
ADDRGP4 bot_interbreed
INDIRI4
CNSTI4 0
NEI4 $290
ADDRGP4 $289
JUMPV
LABELV $290
line 612
;612:	bot_interbreedmatchcount++;
ADDRLP4 0
ADDRGP4 bot_interbreedmatchcount
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 613
;613:	if (bot_interbreedmatchcount >= bot_interbreedcycle.integer) {
ADDRGP4 bot_interbreedmatchcount
INDIRI4
ADDRGP4 bot_interbreedcycle+12
INDIRI4
LTI4 $292
line 614
;614:		bot_interbreedmatchcount = 0;
ADDRGP4 bot_interbreedmatchcount
CNSTI4 0
ASGNI4
line 616
;615:		//
;616:		trap_Cvar_Update(&bot_interbreedwrite);
ADDRGP4 bot_interbreedwrite
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 617
;617:		if (strlen(bot_interbreedwrite.string)) {
ADDRGP4 bot_interbreedwrite+16
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $295
line 618
;618:			BotWriteInterbreeded(bot_interbreedwrite.string);
ADDRGP4 bot_interbreedwrite+16
ARGP4
ADDRGP4 BotWriteInterbreeded
CALLV
pop
line 619
;619:			trap_Cvar_Set("bot_interbreedwrite", "");
ADDRGP4 $299
ARGP4
ADDRGP4 $300
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 620
;620:		}
LABELV $295
line 621
;621:		BotInterbreedBots();
ADDRGP4 BotInterbreedBots
CALLV
pop
line 622
;622:	}
LABELV $292
line 623
;623:}
LABELV $289
endproc BotInterbreedEndMatch 8 8
export BotInterbreeding
proc BotInterbreeding 16 20
line 630
;624:
;625:/*
;626:==============
;627:BotInterbreeding
;628:==============
;629:*/
;630:void BotInterbreeding(void) {
line 633
;631:	int i;
;632:
;633:	trap_Cvar_Update(&bot_interbreedchar);
ADDRGP4 bot_interbreedchar
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 634
;634:	if (!strlen(bot_interbreedchar.string)) return;
ADDRGP4 bot_interbreedchar+16
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $302
ADDRGP4 $301
JUMPV
LABELV $302
line 636
;635:	//make sure we are in tournament mode
;636:	if (gametype != GT_TOURNAMENT) {
ADDRGP4 gametype
INDIRI4
CNSTI4 1
EQI4 $305
line 637
;637:		trap_Cvar_Set("g_gametype", va("%d", GT_TOURNAMENT));
ADDRGP4 $308
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $307
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 638
;638:		ExitLevel();
ADDRGP4 ExitLevel
CALLV
pop
line 639
;639:		return;
ADDRGP4 $301
JUMPV
LABELV $305
line 642
;640:	}
;641:	//shutdown all the bots
;642:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $309
line 643
;643:		if (botstates[i] && botstates[i]->inuse) {
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $313
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $313
line 644
;644:			BotAIShutdownClient(botstates[i]->client, qfalse);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 BotAIShutdownClient
CALLI4
pop
line 645
;645:		}
LABELV $313
line 646
;646:	}
LABELV $310
line 642
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $309
line 648
;647:	//make sure all item weight configs are reloaded and Not shared
;648:	trap_BotLibVarSet("bot_reloadcharacters", "1");
ADDRGP4 $315
ARGP4
ADDRGP4 $316
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 650
;649:	//add a number of bots using the desired bot character
;650:	for (i = 0; i < bot_interbreedbots.integer; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $320
JUMPV
LABELV $317
line 651
;651:		trap_SendConsoleCommand( EXEC_INSERT, va("addbot %s 4 free %i %s%d\n",
ADDRGP4 $322
ARGP4
ADDRGP4 bot_interbreedchar+16
ARGP4
CNSTI4 50
ADDRLP4 0
INDIRI4
MULI4
ARGI4
ADDRGP4 bot_interbreedchar+16
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 653
;652:						bot_interbreedchar.string, i * 50, bot_interbreedchar.string, i) );
;653:	}
LABELV $318
line 650
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $320
ADDRLP4 0
INDIRI4
ADDRGP4 bot_interbreedbots+12
INDIRI4
LTI4 $317
line 655
;654:	//
;655:	trap_Cvar_Set("bot_interbreedchar", "");
ADDRGP4 $325
ARGP4
ADDRGP4 $300
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 656
;656:	bot_interbreed = qtrue;
ADDRGP4 bot_interbreed
CNSTI4 1
ASGNI4
line 657
;657:}
LABELV $301
endproc BotInterbreeding 16 20
export BotEntityInfo
proc BotEntityInfo 0 8
line 664
;658:
;659:/*
;660:==============
;661:BotEntityInfo
;662:==============
;663:*/
;664:void BotEntityInfo(int entnum, aas_entityinfo_t *info) {
line 665
;665:	trap_AAS_EntityInfo(entnum, info);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_AAS_EntityInfo
CALLV
pop
line 666
;666:}
LABELV $326
endproc BotEntityInfo 0 8
export NumBots
proc NumBots 0 0
line 673
;667:
;668:/*
;669:==============
;670:NumBots
;671:==============
;672:*/
;673:int NumBots(void) {
line 674
;674:	return numbots;
ADDRGP4 numbots
INDIRI4
RETI4
LABELV $327
endproc NumBots 0 0
export BotTeamLeader
proc BotTeamLeader 12 4
line 682
;675:}
;676:
;677:/*
;678:==============
;679:BotTeamLeader
;680:==============
;681:*/
;682:int BotTeamLeader(bot_state_t *bs) {
line 685
;683:	int leader;
;684:
;685:	leader = ClientFromName(bs->teamleader);
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 686
;686:	if (leader < 0) return qfalse;
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $329
CNSTI4 0
RETI4
ADDRGP4 $328
JUMPV
LABELV $329
line 687
;687:	if (!botstates[leader] || !botstates[leader]->inuse) return qfalse;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $333
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $331
LABELV $333
CNSTI4 0
RETI4
ADDRGP4 $328
JUMPV
LABELV $331
line 688
;688:	return qtrue;
CNSTI4 1
RETI4
LABELV $328
endproc BotTeamLeader 12 4
export AngleDifference
proc AngleDifference 4 0
line 696
;689:}
;690:
;691:/*
;692:==============
;693:AngleDifference
;694:==============
;695:*/
;696:float AngleDifference(float ang1, float ang2) {
line 699
;697:	float diff;
;698:
;699:	diff = ang1 - ang2;
ADDRLP4 0
ADDRFP4 0
INDIRF4
ADDRFP4 4
INDIRF4
SUBF4
ASGNF4
line 700
;700:	if (ang1 > ang2) {
ADDRFP4 0
INDIRF4
ADDRFP4 4
INDIRF4
LEF4 $335
line 701
;701:		if (diff > 180.0) diff -= 360.0;
ADDRLP4 0
INDIRF4
CNSTF4 1127481344
LEF4 $336
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 702
;702:	}
ADDRGP4 $336
JUMPV
LABELV $335
line 703
;703:	else {
line 704
;704:		if (diff < -180.0) diff += 360.0;
ADDRLP4 0
INDIRF4
CNSTF4 3274964992
GEF4 $339
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $339
line 705
;705:	}
LABELV $336
line 706
;706:	return diff;
ADDRLP4 0
INDIRF4
RETF4
LABELV $334
endproc AngleDifference 4 0
export BotChangeViewAngle
proc BotChangeViewAngle 16 4
line 714
;707:}
;708:
;709:/*
;710:==============
;711:BotChangeViewAngle
;712:==============
;713:*/
;714:float BotChangeViewAngle(float angle, float ideal_angle, float speed) {
line 717
;715:	float move;
;716:
;717:	angle = AngleMod(angle);
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 718
;718:	ideal_angle = AngleMod(ideal_angle);
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 4
ADDRLP4 8
INDIRF4
ASGNF4
line 719
;719:	if (angle == ideal_angle) return angle;
ADDRFP4 0
INDIRF4
ADDRFP4 4
INDIRF4
NEF4 $342
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $341
JUMPV
LABELV $342
line 720
;720:	move = ideal_angle - angle;
ADDRLP4 0
ADDRFP4 4
INDIRF4
ADDRFP4 0
INDIRF4
SUBF4
ASGNF4
line 721
;721:	if (ideal_angle > angle) {
ADDRFP4 4
INDIRF4
ADDRFP4 0
INDIRF4
LEF4 $344
line 722
;722:		if (move > 180.0) move -= 360.0;
ADDRLP4 0
INDIRF4
CNSTF4 1127481344
LEF4 $345
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 723
;723:	}
ADDRGP4 $345
JUMPV
LABELV $344
line 724
;724:	else {
line 725
;725:		if (move < -180.0) move += 360.0;
ADDRLP4 0
INDIRF4
CNSTF4 3274964992
GEF4 $348
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $348
line 726
;726:	}
LABELV $345
line 727
;727:	if (move > 0) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $350
line 728
;728:		if (move > speed) move = speed;
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
LEF4 $351
ADDRLP4 0
ADDRFP4 8
INDIRF4
ASGNF4
line 729
;729:	}
ADDRGP4 $351
JUMPV
LABELV $350
line 730
;730:	else {
line 731
;731:		if (move < -speed) move = -speed;
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
GEF4 $354
ADDRLP4 0
ADDRFP4 8
INDIRF4
NEGF4
ASGNF4
LABELV $354
line 732
;732:	}
LABELV $351
line 733
;733:	return AngleMod(angle + move);
ADDRFP4 0
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 12
INDIRF4
RETF4
LABELV $341
endproc BotChangeViewAngle 16 4
export BotChangeViewAngles
proc BotChangeViewAngles 80 16
line 741
;734:}
;735:
;736:/*
;737:==============
;738:BotChangeViewAngles
;739:==============
;740:*/
;741:void BotChangeViewAngles(bot_state_t *bs, float thinktime) {
line 745
;742:	float diff, factor, maxchange, anglespeed, disired_speed;
;743:	int i;
;744:
;745:	if (bs->ideal_viewangles[PITCH] > 180) bs->ideal_viewangles[PITCH] -= 360;
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
INDIRF4
CNSTF4 1127481344
LEF4 $357
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $357
line 747
;746:	//
;747:	if (bs->enemy >= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 0
LTI4 $359
line 748
;748:		factor = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_VIEW_FACTOR, 0.01f, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTF4 1008981770
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 28
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 28
INDIRF4
ASGNF4
line 749
;749:		maxchange = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_VIEW_MAXCHANGE, 1, 1800);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
CNSTF4 1065353216
ARGF4
CNSTF4 1155596288
ARGF4
ADDRLP4 32
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 32
INDIRF4
ASGNF4
line 750
;750:	}
ADDRGP4 $360
JUMPV
LABELV $359
line 751
;751:	else {
line 752
;752:		factor = 0.05f;
ADDRLP4 16
CNSTF4 1028443341
ASGNF4
line 753
;753:		maxchange = 360;
ADDRLP4 8
CNSTF4 1135869952
ASGNF4
line 754
;754:	}
LABELV $360
line 755
;755:	if (maxchange < 240) maxchange = 240;
ADDRLP4 8
INDIRF4
CNSTF4 1131413504
GEF4 $361
ADDRLP4 8
CNSTF4 1131413504
ASGNF4
LABELV $361
line 756
;756:	maxchange *= thinktime;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 757
;757:	for (i = 0; i < 2; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $363
line 759
;758:		//
;759:		if (bot_challenge.integer) {
ADDRGP4 bot_challenge+12
INDIRI4
CNSTI4 0
EQI4 $367
line 761
;760:			//smooth slowdown view model
;761:			diff = abs(AngleDifference(bs->viewangles[i], bs->ideal_viewangles[i]));
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 6576
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 AngleDifference
CALLF4
ASGNF4
ADDRLP4 36
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 40
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 40
INDIRI4
CVIF4 4
ASGNF4
line 762
;762:			anglespeed = diff * factor;
ADDRLP4 4
ADDRLP4 12
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 763
;763:			if (anglespeed > maxchange) anglespeed = maxchange;
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $370
ADDRLP4 4
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $370
line 764
;764:			bs->viewangles[i] = BotChangeViewAngle(bs->viewangles[i],
ADDRLP4 44
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
INDIRF4
ARGF4
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 6576
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 56
ADDRGP4 BotChangeViewAngle
CALLF4
ASGNF4
ADDRLP4 52
INDIRP4
ADDRLP4 56
INDIRF4
ASGNF4
line 766
;765:											bs->ideal_viewangles[i], anglespeed);
;766:		}
ADDRGP4 $368
JUMPV
LABELV $367
line 767
;767:		else {
line 769
;768:			//over reaction view model
;769:			bs->viewangles[i] = AngleMod(bs->viewangles[i]);
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRF4
ASGNF4
line 770
;770:			bs->ideal_viewangles[i] = AngleMod(bs->ideal_viewangles[i]);
ADDRLP4 36
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 36
INDIRP4
ADDRLP4 40
INDIRF4
ASGNF4
line 771
;771:			diff = AngleDifference(bs->viewangles[i], bs->ideal_viewangles[i]);
ADDRLP4 44
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 6576
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 52
ADDRGP4 AngleDifference
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 52
INDIRF4
ASGNF4
line 772
;772:			disired_speed = diff * factor;
ADDRLP4 20
ADDRLP4 12
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 773
;773:			bs->viewanglespeed[i] += (bs->viewanglespeed[i] - disired_speed);
ADDRLP4 56
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 6588
ADDP4
ADDP4
ASGNP4
ADDRLP4 60
ADDRLP4 56
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 56
INDIRP4
ADDRLP4 60
INDIRF4
ADDRLP4 60
INDIRF4
ADDRLP4 20
INDIRF4
SUBF4
ADDF4
ASGNF4
line 774
;774:			if (bs->viewanglespeed[i] > 180) bs->viewanglespeed[i] = maxchange;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 6588
ADDP4
ADDP4
INDIRF4
CNSTF4 1127481344
LEF4 $372
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 6588
ADDP4
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $372
line 775
;775:			if (bs->viewanglespeed[i] < -180) bs->viewanglespeed[i] = -maxchange;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 6588
ADDP4
ADDP4
INDIRF4
CNSTF4 3274964992
GEF4 $374
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 6588
ADDP4
ADDP4
ADDRLP4 8
INDIRF4
NEGF4
ASGNF4
LABELV $374
line 776
;776:			anglespeed = bs->viewanglespeed[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 6588
ADDP4
ADDP4
INDIRF4
ASGNF4
line 777
;777:			if (anglespeed > maxchange) anglespeed = maxchange;
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $376
ADDRLP4 4
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $376
line 778
;778:			if (anglespeed < -maxchange) anglespeed = -maxchange;
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
NEGF4
GEF4 $378
ADDRLP4 4
ADDRLP4 8
INDIRF4
NEGF4
ASGNF4
LABELV $378
line 779
;779:			bs->viewangles[i] += anglespeed;
ADDRLP4 64
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDF4
ASGNF4
line 780
;780:			bs->viewangles[i] = AngleMod(bs->viewangles[i]);
ADDRLP4 68
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 68
INDIRP4
ADDRLP4 72
INDIRF4
ASGNF4
line 782
;781:			//demping
;782:			bs->viewanglespeed[i] *= 0.45 * (1 - factor);
ADDRLP4 76
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 6588
ADDP4
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRF4
CNSTF4 1055286886
CNSTF4 1065353216
ADDRLP4 16
INDIRF4
SUBF4
MULF4
MULF4
ASGNF4
line 783
;783:		}
LABELV $368
line 786
;784:		//BotAI_Print(PRT_MESSAGE, "ideal_angles %f %f\n", bs->ideal_viewangles[0], bs->ideal_viewangles[1], bs->ideal_viewangles[2]);`
;785:		//bs->viewangles[i] = bs->ideal_viewangles[i];
;786:	}
LABELV $364
line 757
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $363
line 788
;787:	//bs->viewangles[PITCH] = 0;
;788:	if (bs->viewangles[PITCH] > 180) bs->viewangles[PITCH] -= 360;
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
INDIRF4
CNSTF4 1127481344
LEF4 $380
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $380
line 790
;789:	//elementary action: view
;790:	trap_EA_View(bs->client, bs->viewangles);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
ADDRGP4 trap_EA_View
CALLV
pop
line 791
;791:}
LABELV $356
endproc BotChangeViewAngles 80 16
export BotInputToUserCommand
proc BotInputToUserCommand 136 16
line 798
;792:
;793:/*
;794:==============
;795:BotInputToUserCommand
;796:==============
;797:*/
;798:void BotInputToUserCommand(bot_input_t *bi, usercmd_t *ucmd, int delta_angles[3], int time) {
line 804
;799:	vec3_t angles, forward, right;
;800:	short temp;
;801:	int j;
;802:
;803:	//clear the whole structure
;804:	memset(ucmd, 0, sizeof(usercmd_t));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 24
ARGI4
ADDRGP4 memset
CALLP4
pop
line 808
;805:	//
;806:	//Com_Printf("dir = %f %f %f speed = %f\n", bi->dir[0], bi->dir[1], bi->dir[2], bi->speed);
;807:	//the duration for the user command in milli seconds
;808:	ucmd->serverTime = time;
ADDRFP4 4
INDIRP4
ADDRFP4 12
INDIRI4
ASGNI4
line 810
;809:	//
;810:	if (bi->actionflags & ACTION_DELAYEDJUMP) {
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $383
line 811
;811:		bi->actionflags |= ACTION_JUMP;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 812
;812:		bi->actionflags &= ~ACTION_DELAYEDJUMP;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 -32769
BANDI4
ASGNI4
line 813
;813:	}
LABELV $383
line 815
;814:	//set the buttons
;815:	if (bi->actionflags & ACTION_RESPAWN) ucmd->buttons = BUTTON_ATTACK;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $385
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 1
ASGNI4
LABELV $385
line 816
;816:	if (bi->actionflags & ACTION_ATTACK) ucmd->buttons |= BUTTON_ATTACK;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $387
ADDRLP4 44
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
LABELV $387
line 817
;817:	if (bi->actionflags & ACTION_TALK) ucmd->buttons |= BUTTON_TALK;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 65536
BANDI4
CNSTI4 0
EQI4 $389
ADDRLP4 48
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
LABELV $389
line 818
;818:	if (bi->actionflags & ACTION_GESTURE) ucmd->buttons |= BUTTON_GESTURE;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 131072
BANDI4
CNSTI4 0
EQI4 $391
ADDRLP4 52
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
LABELV $391
line 819
;819:	if (bi->actionflags & ACTION_USE) ucmd->buttons |= BUTTON_USE_HOLDABLE;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $393
ADDRLP4 56
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
LABELV $393
line 820
;820:	if (bi->actionflags & ACTION_WALK) ucmd->buttons |= BUTTON_WALKING;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 524288
BANDI4
CNSTI4 0
EQI4 $395
ADDRLP4 60
CNSTI4 16
ASGNI4
ADDRLP4 64
ADDRFP4 4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
ADDRLP4 60
INDIRI4
BORI4
ASGNI4
LABELV $395
line 821
;821:	if (bi->actionflags & ACTION_AFFIRMATIVE) ucmd->buttons |= BUTTON_AFFIRMATIVE;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 1048576
BANDI4
CNSTI4 0
EQI4 $397
ADDRLP4 68
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
LABELV $397
line 822
;822:	if (bi->actionflags & ACTION_NEGATIVE) ucmd->buttons |= BUTTON_NEGATIVE;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 2097152
BANDI4
CNSTI4 0
EQI4 $399
ADDRLP4 72
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
LABELV $399
line 823
;823:	if (bi->actionflags & ACTION_GETFLAG) ucmd->buttons |= BUTTON_GETFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 8388608
BANDI4
CNSTI4 0
EQI4 $401
ADDRLP4 76
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
LABELV $401
line 824
;824:	if (bi->actionflags & ACTION_GUARDBASE) ucmd->buttons |= BUTTON_GUARDBASE;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 16777216
BANDI4
CNSTI4 0
EQI4 $403
ADDRLP4 80
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
LABELV $403
line 825
;825:	if (bi->actionflags & ACTION_PATROL) ucmd->buttons |= BUTTON_PATROL;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 33554432
BANDI4
CNSTI4 0
EQI4 $405
ADDRLP4 84
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
LABELV $405
line 826
;826:	if (bi->actionflags & ACTION_FOLLOWME) ucmd->buttons |= BUTTON_FOLLOWME;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 134217728
BANDI4
CNSTI4 0
EQI4 $407
ADDRLP4 88
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
LABELV $407
line 828
;827:	//
;828:	ucmd->weapon = bi->weapon;
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 831
;829:	//set the view angles
;830:	//NOTE: the ucmd->angles are the angles WITHOUT the delta angles
;831:	ucmd->angles[PITCH] = ANGLE2SHORT(bi->viewangles[PITCH]);
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1199570944
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 832
;832:	ucmd->angles[YAW] = ANGLE2SHORT(bi->viewangles[YAW]);
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1199570944
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 833
;833:	ucmd->angles[ROLL] = ANGLE2SHORT(bi->viewangles[ROLL]);
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1199570944
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 835
;834:	//subtract the delta angles
;835:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $409
line 836
;836:		temp = ucmd->angles[j] - delta_angles[j];
ADDRLP4 92
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4
ADDRLP4 92
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
INDIRI4
ADDRLP4 92
INDIRI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRI4
SUBI4
CVII2 4
ASGNI2
line 844
;837:		/*NOTE: disabled because temp should be mod first
;838:		if ( j == PITCH ) {
;839:			// don't let the player look up or down more than 90 degrees
;840:			if ( temp > 16000 ) temp = 16000;
;841:			else if ( temp < -16000 ) temp = -16000;
;842:		}
;843:		*/
;844:		ucmd->angles[j] = temp;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
ADDRLP4 4
INDIRI2
CVII4 2
ASGNI4
line 845
;845:	}
LABELV $410
line 835
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $409
line 849
;846:	//NOTE: movement is relative to the REAL view angles
;847:	//get the horizontal forward and right vector
;848:	//get the pitch in the range [-180, 180]
;849:	if (bi->dir[2]) angles[PITCH] = bi->viewangles[PITCH];
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CNSTF4 0
EQF4 $413
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $414
JUMPV
LABELV $413
line 850
;850:	else angles[PITCH] = 0;
ADDRLP4 20
CNSTF4 0
ASGNF4
LABELV $414
line 851
;851:	angles[YAW] = bi->viewangles[YAW];
ADDRLP4 20+4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 852
;852:	angles[ROLL] = 0;
ADDRLP4 20+8
CNSTF4 0
ASGNF4
line 853
;853:	AngleVectors(angles, forward, right, NULL);
ADDRLP4 20
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 32
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 855
;854:	//bot input speed is in the range [0, 400]
;855:	bi->speed = bi->speed * 127 / 400;
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTF4 1123942400
ADDRLP4 92
INDIRP4
INDIRF4
MULF4
CNSTF4 1137180672
DIVF4
ASGNF4
line 857
;856:	//set the view independent movement
;857:	ucmd->forwardmove = DotProduct(forward, bi->dir) * bi->speed;
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 21
ADDP4
ADDRLP4 8
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 8+4
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 8+8
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 96
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
MULF4
CVFI4 4
CVII1 4
ASGNI1
line 858
;858:	ucmd->rightmove = DotProduct(right, bi->dir) * bi->speed;
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 22
ADDP4
ADDRLP4 32
INDIRF4
ADDRLP4 100
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 32+4
INDIRF4
ADDRLP4 100
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 32+8
INDIRF4
ADDRLP4 100
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 100
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
MULF4
CVFI4 4
CVII1 4
ASGNI1
line 859
;859:	ucmd->upmove = abs(forward[2]) * bi->dir[2] * bi->speed;
ADDRLP4 8+8
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 104
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 23
ADDP4
ADDRLP4 104
INDIRI4
CVIF4 4
ADDRLP4 108
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ADDRLP4 108
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
MULF4
CVFI4 4
CVII1 4
ASGNI1
line 861
;860:	//normal keyboard movement
;861:	if (bi->actionflags & ACTION_MOVEFORWARD) ucmd->forwardmove += 127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $422
ADDRLP4 112
ADDRFP4 4
INDIRP4
CNSTI4 21
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
ADDI4
CVII1 4
ASGNI1
LABELV $422
line 862
;862:	if (bi->actionflags & ACTION_MOVEBACK) ucmd->forwardmove -= 127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $424
ADDRLP4 116
ADDRFP4 4
INDIRP4
CNSTI4 21
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
SUBI4
CVII1 4
ASGNI1
LABELV $424
line 863
;863:	if (bi->actionflags & ACTION_MOVELEFT) ucmd->rightmove -= 127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $426
ADDRLP4 120
ADDRFP4 4
INDIRP4
CNSTI4 22
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
SUBI4
CVII1 4
ASGNI1
LABELV $426
line 864
;864:	if (bi->actionflags & ACTION_MOVERIGHT) ucmd->rightmove += 127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $428
ADDRLP4 124
ADDRFP4 4
INDIRP4
CNSTI4 22
ADDP4
ASGNP4
ADDRLP4 124
INDIRP4
ADDRLP4 124
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
ADDI4
CVII1 4
ASGNI1
LABELV $428
line 866
;865:	//jump/moveup
;866:	if (bi->actionflags & ACTION_JUMP) ucmd->upmove += 127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $430
ADDRLP4 128
ADDRFP4 4
INDIRP4
CNSTI4 23
ADDP4
ASGNP4
ADDRLP4 128
INDIRP4
ADDRLP4 128
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
ADDI4
CVII1 4
ASGNI1
LABELV $430
line 868
;867:	//crouch/movedown
;868:	if (bi->actionflags & ACTION_CROUCH) ucmd->upmove -= 127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $432
ADDRLP4 132
ADDRFP4 4
INDIRP4
CNSTI4 23
ADDP4
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
SUBI4
CVII1 4
ASGNI1
LABELV $432
line 872
;869:	//
;870:	//Com_Printf("forward = %d right = %d up = %d\n", ucmd.forwardmove, ucmd.rightmove, ucmd.upmove);
;871:	//Com_Printf("ucmd->serverTime = %d\n", ucmd->serverTime);
;872:}
LABELV $382
endproc BotInputToUserCommand 136 16
export BotUpdateInput
proc BotUpdateInput 64 16
line 879
;873:
;874:/*
;875:==============
;876:BotUpdateInput
;877:==============
;878:*/
;879:void BotUpdateInput(bot_state_t *bs, int time, int elapsed_time) {
line 884
;880:	bot_input_t bi;
;881:	int j;
;882:
;883:	//add the delta angles to the bot's current view angles
;884:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $435
line 885
;885:		bs->viewangles[j] = AngleMod(bs->viewangles[j] + SHORT2ANGLE(bs->cur_ps.delta_angles[j]));
ADDRLP4 44
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
INDIRF4
CNSTF4 1001652224
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 72
ADDP4
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDF4
ARGF4
ADDRLP4 56
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 52
INDIRP4
ADDRLP4 56
INDIRF4
ASGNF4
line 886
;886:	}
LABELV $436
line 884
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $435
line 888
;887:	//change the bot view angles
;888:	BotChangeViewAngles(bs, (float) elapsed_time / 1000);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ARGF4
ADDRGP4 BotChangeViewAngles
CALLV
pop
line 890
;889:	//retrieve the bot input
;890:	trap_EA_GetInput(bs->client, (float) time / 1000, &bi);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ARGF4
ADDRLP4 4
ARGP4
ADDRGP4 trap_EA_GetInput
CALLV
pop
line 892
;891:	//respawn hack
;892:	if (bi.actionflags & ACTION_RESPAWN) {
ADDRLP4 4+32
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $439
line 893
;893:		if (bs->lastucmd.buttons & BUTTON_ATTACK) bi.actionflags &= ~(ACTION_RESPAWN|ACTION_ATTACK);
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $442
ADDRLP4 4+32
ADDRLP4 4+32
INDIRI4
CNSTI4 -10
BANDI4
ASGNI4
LABELV $442
line 894
;894:	}
LABELV $439
line 896
;895:	//convert the bot input to a usercmd
;896:	BotInputToUserCommand(&bi, &bs->lastucmd, bs->cur_ps.delta_angles, time);
ADDRLP4 4
ARGP4
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 72
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 BotInputToUserCommand
CALLV
pop
line 898
;897:	//subtract the delta angles
;898:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $445
line 899
;899:		bs->viewangles[j] = AngleMod(bs->viewangles[j] - SHORT2ANGLE(bs->cur_ps.delta_angles[j]));
ADDRLP4 48
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 48
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
INDIRF4
CNSTF4 1001652224
ADDRLP4 48
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 72
ADDP4
ADDP4
INDIRI4
CVIF4 4
MULF4
SUBF4
ARGF4
ADDRLP4 60
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 56
INDIRP4
ADDRLP4 60
INDIRF4
ASGNF4
line 900
;900:	}
LABELV $446
line 898
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $445
line 901
;901:}
LABELV $434
endproc BotUpdateInput 64 16
export BotAIRegularUpdate
proc BotAIRegularUpdate 0 0
line 908
;902:
;903:/*
;904:==============
;905:BotAIRegularUpdate
;906:==============
;907:*/
;908:void BotAIRegularUpdate(void) {
line 909
;909:	if (regularupdate_time < FloatTime()) {
ADDRGP4 regularupdate_time
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $450
line 910
;910:		trap_BotUpdateEntityItems();
ADDRGP4 trap_BotUpdateEntityItems
CALLV
pop
line 911
;911:		regularupdate_time = FloatTime() + 0.3;
ADDRGP4 regularupdate_time
ADDRGP4 floattime
INDIRF4
CNSTF4 1050253722
ADDF4
ASGNF4
line 912
;912:	}
LABELV $450
line 913
;913:}
LABELV $449
endproc BotAIRegularUpdate 0 0
export RemoveColorEscapeSequences
proc RemoveColorEscapeSequences 28 0
line 920
;914:
;915:/*
;916:==============
;917:RemoveColorEscapeSequences
;918:==============
;919:*/
;920:void RemoveColorEscapeSequences( char *text ) {
line 923
;921:	int i, l;
;922:
;923:	l = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 924
;924:	for ( i = 0; text[i]; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $456
JUMPV
LABELV $453
line 925
;925:		if (Q_IsColorString(&text[i])) {
ADDRLP4 8
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $457
ADDRLP4 12
CNSTI4 94
ASGNI4
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI4
NEI4 $457
ADDRLP4 16
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $457
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $457
line 926
;926:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 927
;927:			continue;
ADDRGP4 $454
JUMPV
LABELV $457
line 929
;928:		}
;929:		if (text[i] > 0x7E)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 126
LEI4 $459
line 930
;930:			continue;
ADDRGP4 $454
JUMPV
LABELV $459
line 931
;931:		text[l++] = text[i];
ADDRLP4 20
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 932
;932:	}
LABELV $454
line 924
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $456
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $453
line 933
;933:	text[l] = '\0';
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 934
;934:}
LABELV $452
endproc RemoveColorEscapeSequences 28 0
export BotAI
proc BotAI 1088 12
line 941
;935:
;936:/*
;937:==============
;938:BotAI
;939:==============
;940:*/
;941:int BotAI(int client, float thinktime) {
line 946
;942:	bot_state_t *bs;
;943:	char buf[1024], *args;
;944:	int j;
;945:
;946:	trap_EA_ResetInput(client);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_EA_ResetInput
CALLV
pop
line 948
;947:	//
;948:	bs = botstates[client];
ADDRLP4 4
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 949
;949:	if (!bs || !bs->inuse) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $464
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $462
LABELV $464
line 950
;950:		BotAI_Print(PRT_FATAL, "BotAI: client %d is not setup\n", client);
CNSTI4 4
ARGI4
ADDRGP4 $465
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 951
;951:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $461
JUMPV
LABELV $462
line 955
;952:	}
;953:
;954:	//retrieve the current client state
;955:	BotAI_GetClientState( client, &bs->cur_ps );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
ARGP4
ADDRGP4 BotAI_GetClientState
CALLI4
pop
ADDRGP4 $467
JUMPV
LABELV $466
line 958
;956:
;957:	//retrieve any waiting server commands
;958:	while( trap_BotGetServerCommand(client, buf, sizeof(buf)) ) {
line 960
;959:		//have buf point to the command and args to the command arguments
;960:		args = strchr( buf, ' ');
ADDRLP4 12
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 1040
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1040
INDIRP4
ASGNP4
line 961
;961:		if (!args) continue;
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $469
ADDRGP4 $467
JUMPV
LABELV $469
line 962
;962:		*args++ = '\0';
ADDRLP4 1044
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 1044
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 1044
INDIRP4
CNSTI1 0
ASGNI1
line 965
;963:
;964:		//remove color espace sequences from the arguments
;965:		RemoveColorEscapeSequences( args );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 RemoveColorEscapeSequences
CALLV
pop
line 967
;966:
;967:		if (!Q_stricmp(buf, "cp "))
ADDRLP4 12
ARGP4
ADDRGP4 $473
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $471
line 968
;968:			{ /*CenterPrintf*/ }
ADDRGP4 $472
JUMPV
LABELV $471
line 969
;969:		else if (!Q_stricmp(buf, "cs"))
ADDRLP4 12
ARGP4
ADDRGP4 $476
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $474
line 970
;970:			{ /*ConfigStringModified*/ }
ADDRGP4 $475
JUMPV
LABELV $474
line 971
;971:		else if (!Q_stricmp(buf, "print")) {
ADDRLP4 12
ARGP4
ADDRGP4 $479
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $477
line 973
;972:			//remove first and last quote from the chat message
;973:			memmove(args, args+1, strlen(args));
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1060
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 1060
INDIRI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 974
;974:			args[strlen(args)-1] = '\0';
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1068
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 975
;975:			trap_BotQueueConsoleMessage(bs->cs, CMS_NORMAL, args);
ADDRLP4 4
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_BotQueueConsoleMessage
CALLV
pop
line 976
;976:		}
ADDRGP4 $478
JUMPV
LABELV $477
line 977
;977:		else if (!Q_stricmp(buf, "chat")) {
ADDRLP4 12
ARGP4
ADDRGP4 $482
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $480
line 979
;978:			//remove first and last quote from the chat message
;979:			memmove(args, args+1, strlen(args));
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1064
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 1064
INDIRI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 980
;980:			args[strlen(args)-1] = '\0';
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1072
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 981
;981:			trap_BotQueueConsoleMessage(bs->cs, CMS_CHAT, args);
ADDRLP4 4
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_BotQueueConsoleMessage
CALLV
pop
line 982
;982:		}
ADDRGP4 $481
JUMPV
LABELV $480
line 983
;983:		else if (!Q_stricmp(buf, "tchat")) {
ADDRLP4 12
ARGP4
ADDRGP4 $485
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $483
line 985
;984:			//remove first and last quote from the chat message
;985:			memmove(args, args+1, strlen(args));
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1068
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 1068
INDIRI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 986
;986:			args[strlen(args)-1] = '\0';
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1076
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 987
;987:			trap_BotQueueConsoleMessage(bs->cs, CMS_CHAT, args);
ADDRLP4 4
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_BotQueueConsoleMessage
CALLV
pop
line 988
;988:		}
ADDRGP4 $484
JUMPV
LABELV $483
line 1000
;989:#ifdef MISSIONPACK
;990:		else if (!Q_stricmp(buf, "vchat")) {
;991:			BotVoiceChatCommand(bs, SAY_ALL, args);
;992:		}
;993:		else if (!Q_stricmp(buf, "vtchat")) {
;994:			BotVoiceChatCommand(bs, SAY_TEAM, args);
;995:		}
;996:		else if (!Q_stricmp(buf, "vtell")) {
;997:			BotVoiceChatCommand(bs, SAY_TELL, args);
;998:		}
;999:#endif
;1000:		else if (!Q_stricmp(buf, "scores"))
ADDRLP4 12
ARGP4
ADDRGP4 $488
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $486
line 1001
;1001:			{ /*FIXME: parse scores?*/ }
ADDRGP4 $487
JUMPV
LABELV $486
line 1002
;1002:		else if (!Q_stricmp(buf, "clientLevelShot"))
ADDRLP4 12
ARGP4
ADDRGP4 $491
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $489
line 1003
;1003:			{ /*ignore*/ }
LABELV $489
LABELV $487
LABELV $484
LABELV $481
LABELV $478
LABELV $475
LABELV $472
line 1004
;1004:	}
LABELV $467
line 958
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1040
ADDRGP4 trap_BotGetServerCommand
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $466
line 1006
;1005:	//add the delta angles to the bot's current view angles
;1006:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $492
line 1007
;1007:		bs->viewangles[j] = AngleMod(bs->viewangles[j] + SHORT2ANGLE(bs->cur_ps.delta_angles[j]));
ADDRLP4 1044
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1052
ADDRLP4 1044
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
ASGNP4
ADDRLP4 1052
INDIRP4
INDIRF4
CNSTF4 1001652224
ADDRLP4 1044
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 72
ADDP4
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDF4
ARGF4
ADDRLP4 1056
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 1052
INDIRP4
ADDRLP4 1056
INDIRF4
ASGNF4
line 1008
;1008:	}
LABELV $493
line 1006
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $492
line 1010
;1009:	//increase the local time of the bot
;1010:	bs->ltime += thinktime;
ADDRLP4 1044
ADDRLP4 4
INDIRP4
CNSTI4 6060
ADDP4
ASGNP4
ADDRLP4 1044
INDIRP4
ADDRLP4 1044
INDIRP4
INDIRF4
ADDRFP4 4
INDIRF4
ADDF4
ASGNF4
line 1012
;1011:	//
;1012:	bs->thinktime = thinktime;
ADDRLP4 4
INDIRP4
CNSTI4 4904
ADDP4
ADDRFP4 4
INDIRF4
ASGNF4
line 1014
;1013:	//origin of the bot
;1014:	VectorCopy(bs->cur_ps.origin, bs->origin);
ADDRLP4 4
INDIRP4
CNSTI4 4908
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1016
;1015:	//eye coordinates of the bot
;1016:	VectorCopy(bs->cur_ps.origin, bs->eye);
ADDRLP4 4
INDIRP4
CNSTI4 4936
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1017
;1017:	bs->eye[2] += bs->cur_ps.viewheight;
ADDRLP4 1060
ADDRLP4 4
INDIRP4
CNSTI4 4944
ADDP4
ASGNP4
ADDRLP4 1060
INDIRP4
ADDRLP4 1060
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1019
;1018:	//get the area the bot is in
;1019:	bs->areanum = BotPointAreaNum(bs->origin);
ADDRLP4 4
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 1068
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 4948
ADDP4
ADDRLP4 1068
INDIRI4
ASGNI4
line 1021
;1020:	//the real AI
;1021:	BotDeathmatchAI(bs, thinktime);
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRGP4 BotDeathmatchAI
CALLV
pop
line 1023
;1022:	//set the weapon selection every AI frame
;1023:	if (g_instagib.integer == 0) { // Shafe - Trep - Instagib Fix
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 0
NEI4 $496
line 1024
;1024:	trap_EA_SelectWeapon(bs->client, bs->weaponnum);
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_SelectWeapon
CALLV
pop
line 1025
;1025:	}
LABELV $496
line 1028
;1026:
;1027:	//subtract the delta angles
;1028:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $499
line 1029
;1029:		bs->viewangles[j] = AngleMod(bs->viewangles[j] - SHORT2ANGLE(bs->cur_ps.delta_angles[j]));
ADDRLP4 1072
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1080
ADDRLP4 1072
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
ASGNP4
ADDRLP4 1080
INDIRP4
INDIRF4
CNSTF4 1001652224
ADDRLP4 1072
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 72
ADDP4
ADDP4
INDIRI4
CVIF4 4
MULF4
SUBF4
ARGF4
ADDRLP4 1084
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 1080
INDIRP4
ADDRLP4 1084
INDIRF4
ASGNF4
line 1030
;1030:	}
LABELV $500
line 1028
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $499
line 1032
;1031:	//everything was ok
;1032:	return qtrue;
CNSTI4 1
RETI4
LABELV $461
endproc BotAI 1088 12
export BotScheduleBotThink
proc BotScheduleBotThink 12 0
line 1040
;1033:}
;1034:
;1035:/*
;1036:==================
;1037:BotScheduleBotThink
;1038:==================
;1039:*/
;1040:void BotScheduleBotThink(void) {
line 1043
;1041:	int i, botnum;
;1042:
;1043:	botnum = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1045
;1044:
;1045:	for( i = 0; i < MAX_CLIENTS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $504
line 1046
;1046:		if( !botstates[i] || !botstates[i]->inuse ) {
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $510
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $508
LABELV $510
line 1047
;1047:			continue;
ADDRGP4 $505
JUMPV
LABELV $508
line 1050
;1048:		}
;1049:		//initialize the bot think residual time
;1050:		botstates[i]->botthink_residual = bot_thinktime.integer * botnum / numbots;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 bot_thinktime+12
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 numbots
INDIRI4
DIVI4
ASGNI4
line 1051
;1051:		botnum++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1052
;1052:	}
LABELV $505
line 1045
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $504
line 1053
;1053:}
LABELV $503
endproc BotScheduleBotThink 12 0
export BotWriteSessionData
proc BotWriteSessionData 20 72
line 1060
;1054:
;1055:/*
;1056:==============
;1057:BotWriteSessionData
;1058:==============
;1059:*/
;1060:void BotWriteSessionData(bot_state_t *bs) {
line 1064
;1061:	const char	*s;
;1062:	const char	*var;
;1063:
;1064:	s = va(
ADDRGP4 $513
ARGP4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 6756
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 6764
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 6780
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 6808
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 6816
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 6820
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 6812
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 6768
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 6772
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 6776
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 6784
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 6788
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 6792
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 6796
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 6800
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 6804
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 1088
;1065:			"%i %i %i %i %i %i %i %i"
;1066:			" %f %f %f"
;1067:			" %f %f %f"
;1068:			" %f %f %f",
;1069:		bs->lastgoal_decisionmaker,
;1070:		bs->lastgoal_ltgtype,
;1071:		bs->lastgoal_teammate,
;1072:		bs->lastgoal_teamgoal.areanum,
;1073:		bs->lastgoal_teamgoal.entitynum,
;1074:		bs->lastgoal_teamgoal.flags,
;1075:		bs->lastgoal_teamgoal.iteminfo,
;1076:		bs->lastgoal_teamgoal.number,
;1077:		bs->lastgoal_teamgoal.origin[0],
;1078:		bs->lastgoal_teamgoal.origin[1],
;1079:		bs->lastgoal_teamgoal.origin[2],
;1080:		bs->lastgoal_teamgoal.mins[0],
;1081:		bs->lastgoal_teamgoal.mins[1],
;1082:		bs->lastgoal_teamgoal.mins[2],
;1083:		bs->lastgoal_teamgoal.maxs[0],
;1084:		bs->lastgoal_teamgoal.maxs[1],
;1085:		bs->lastgoal_teamgoal.maxs[2]
;1086:		);
;1087:
;1088:	var = va( "botsession%i", bs->client );
ADDRGP4 $514
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ASGNP4
line 1090
;1089:
;1090:	trap_Cvar_Set( var, s );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1091
;1091:}
LABELV $512
endproc BotWriteSessionData 20 72
export BotReadSessionData
proc BotReadSessionData 1036 76
line 1098
;1092:
;1093:/*
;1094:==============
;1095:BotReadSessionData
;1096:==============
;1097:*/
;1098:void BotReadSessionData(bot_state_t *bs) {
line 1102
;1099:	char	s[MAX_STRING_CHARS];
;1100:	const char	*var;
;1101:
;1102:	var = va( "botsession%i", bs->client );
ADDRGP4 $514
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1024
ADDRLP4 1028
INDIRP4
ASGNP4
line 1103
;1103:	trap_Cvar_VariableStringBuffer( var, s, sizeof(s) );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1105
;1104:
;1105:	sscanf(s,
ADDRLP4 0
ARGP4
ADDRGP4 $513
ARGP4
ADDRLP4 1032
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1032
INDIRP4
CNSTI4 6756
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6760
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6764
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6780
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6808
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6816
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6820
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6812
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6768
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6772
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6776
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6784
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6788
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6792
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6796
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6800
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6804
ADDP4
ARGP4
ADDRGP4 sscanf
CALLI4
pop
line 1128
;1106:			"%i %i %i %i %i %i %i %i"
;1107:			" %f %f %f"
;1108:			" %f %f %f"
;1109:			" %f %f %f",
;1110:		&bs->lastgoal_decisionmaker,
;1111:		&bs->lastgoal_ltgtype,
;1112:		&bs->lastgoal_teammate,
;1113:		&bs->lastgoal_teamgoal.areanum,
;1114:		&bs->lastgoal_teamgoal.entitynum,
;1115:		&bs->lastgoal_teamgoal.flags,
;1116:		&bs->lastgoal_teamgoal.iteminfo,
;1117:		&bs->lastgoal_teamgoal.number,
;1118:		&bs->lastgoal_teamgoal.origin[0],
;1119:		&bs->lastgoal_teamgoal.origin[1],
;1120:		&bs->lastgoal_teamgoal.origin[2],
;1121:		&bs->lastgoal_teamgoal.mins[0],
;1122:		&bs->lastgoal_teamgoal.mins[1],
;1123:		&bs->lastgoal_teamgoal.mins[2],
;1124:		&bs->lastgoal_teamgoal.maxs[0],
;1125:		&bs->lastgoal_teamgoal.maxs[1],
;1126:		&bs->lastgoal_teamgoal.maxs[2]
;1127:		);
;1128:}
LABELV $515
endproc BotReadSessionData 1036 76
export BotAISetupClient
proc BotAISetupClient 512 16
line 1135
;1129:
;1130:/*
;1131:==============
;1132:BotAISetupClient
;1133:==============
;1134:*/
;1135:int BotAISetupClient(int client, struct bot_settings_s *settings, qboolean restart) {
line 1140
;1136:	char filename[MAX_PATH], name[MAX_PATH], gender[MAX_PATH];
;1137:	bot_state_t *bs;
;1138:	int errnum;
;1139:
;1140:	if (!botstates[client]) botstates[client] = G_Alloc(sizeof(bot_state_t));
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $517
CNSTI4 9088
ARGI4
ADDRLP4 440
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
ADDRLP4 440
INDIRP4
ASGNP4
LABELV $517
line 1141
;1141:	bs = botstates[client];
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 1143
;1142:
;1143:	if (bs && bs->inuse) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $519
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $519
line 1144
;1144:		BotAI_Print(PRT_FATAL, "BotAISetupClient: client %d already setup\n", client);
CNSTI4 4
ARGI4
ADDRGP4 $521
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 1145
;1145:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $516
JUMPV
LABELV $519
line 1148
;1146:	}
;1147:
;1148:	if (!trap_AAS_Initialized()) {
ADDRLP4 448
ADDRGP4 trap_AAS_Initialized
CALLI4
ASGNI4
ADDRLP4 448
INDIRI4
CNSTI4 0
NEI4 $522
line 1149
;1149:		BotAI_Print(PRT_FATAL, "AAS not initialized\n");
CNSTI4 4
ARGI4
ADDRGP4 $524
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 1150
;1150:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $516
JUMPV
LABELV $522
line 1154
;1151:	}
;1152:
;1153:	//load the bot character
;1154:	bs->character = trap_BotLoadCharacter(settings->characterfile, settings->skill);
ADDRLP4 452
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 452
INDIRP4
ARGP4
ADDRLP4 452
INDIRP4
CNSTI4 144
ADDP4
INDIRF4
ARGF4
ADDRLP4 456
ADDRGP4 trap_BotLoadCharacter
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 6520
ADDP4
ADDRLP4 456
INDIRI4
ASGNI4
line 1155
;1155:	if (!bs->character) {
ADDRLP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $525
line 1156
;1156:		BotAI_Print(PRT_FATAL, "couldn't load skill %f from %s\n", settings->skill, settings->characterfile);
CNSTI4 4
ARGI4
ADDRGP4 $527
ARGP4
ADDRLP4 460
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 460
INDIRP4
CNSTI4 144
ADDP4
INDIRF4
ARGF4
ADDRLP4 460
INDIRP4
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 1157
;1157:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $516
JUMPV
LABELV $525
line 1160
;1158:	}
;1159:	//copy the settings
;1160:	memcpy(&bs->settings, settings, sizeof(bot_settings_t));
ADDRLP4 0
INDIRP4
CNSTI4 4608
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 292
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1162
;1161:	//allocate a goal state
;1162:	bs->gs = trap_BotAllocGoalState(client);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 460
ADDRGP4 trap_BotAllocGoalState
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 6528
ADDP4
ADDRLP4 460
INDIRI4
ASGNI4
line 1164
;1163:	//load the item weights
;1164:	trap_Characteristic_String(bs->character, CHARACTERISTIC_ITEMWEIGHTS, filename, MAX_PATH);
ADDRLP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 40
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Characteristic_String
CALLV
pop
line 1165
;1165:	errnum = trap_BotLoadItemWeights(bs->gs, filename);
ADDRLP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 464
ADDRGP4 trap_BotLoadItemWeights
CALLI4
ASGNI4
ADDRLP4 148
ADDRLP4 464
INDIRI4
ASGNI4
line 1166
;1166:	if (errnum != BLERR_NOERROR) {
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $528
line 1167
;1167:		trap_BotFreeGoalState(bs->gs);
ADDRLP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeGoalState
CALLV
pop
line 1168
;1168:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $516
JUMPV
LABELV $528
line 1171
;1169:	}
;1170:	//allocate a weapon state
;1171:	bs->ws = trap_BotAllocWeaponState();
ADDRLP4 468
ADDRGP4 trap_BotAllocWeaponState
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 6536
ADDP4
ADDRLP4 468
INDIRI4
ASGNI4
line 1173
;1172:	//load the weapon weights
;1173:	trap_Characteristic_String(bs->character, CHARACTERISTIC_WEAPONWEIGHTS, filename, MAX_PATH);
ADDRLP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Characteristic_String
CALLV
pop
line 1174
;1174:	errnum = trap_BotLoadWeaponWeights(bs->ws, filename);
ADDRLP4 0
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 472
ADDRGP4 trap_BotLoadWeaponWeights
CALLI4
ASGNI4
ADDRLP4 148
ADDRLP4 472
INDIRI4
ASGNI4
line 1175
;1175:	if (errnum != BLERR_NOERROR) {
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $530
line 1176
;1176:		trap_BotFreeGoalState(bs->gs);
ADDRLP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeGoalState
CALLV
pop
line 1177
;1177:		trap_BotFreeWeaponState(bs->ws);
ADDRLP4 0
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeWeaponState
CALLV
pop
line 1178
;1178:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $516
JUMPV
LABELV $530
line 1181
;1179:	}
;1180:	//allocate a chat state
;1181:	bs->cs = trap_BotAllocChatState();
ADDRLP4 476
ADDRGP4 trap_BotAllocChatState
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 6532
ADDP4
ADDRLP4 476
INDIRI4
ASGNI4
line 1183
;1182:	//load the chat file
;1183:	trap_Characteristic_String(bs->character, CHARACTERISTIC_CHAT_FILE, filename, MAX_PATH);
ADDRLP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 21
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Characteristic_String
CALLV
pop
line 1184
;1184:	trap_Characteristic_String(bs->character, CHARACTERISTIC_CHAT_NAME, name, MAX_PATH);
ADDRLP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 22
ARGI4
ADDRLP4 296
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Characteristic_String
CALLV
pop
line 1185
;1185:	errnum = trap_BotLoadChatFile(bs->cs, filename, name);
ADDRLP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 296
ARGP4
ADDRLP4 480
ADDRGP4 trap_BotLoadChatFile
CALLI4
ASGNI4
ADDRLP4 148
ADDRLP4 480
INDIRI4
ASGNI4
line 1186
;1186:	if (errnum != BLERR_NOERROR) {
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $532
line 1187
;1187:		trap_BotFreeChatState(bs->cs);
ADDRLP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeChatState
CALLV
pop
line 1188
;1188:		trap_BotFreeGoalState(bs->gs);
ADDRLP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeGoalState
CALLV
pop
line 1189
;1189:		trap_BotFreeWeaponState(bs->ws);
ADDRLP4 0
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeWeaponState
CALLV
pop
line 1190
;1190:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $516
JUMPV
LABELV $532
line 1193
;1191:	}
;1192:	//get the gender characteristic
;1193:	trap_Characteristic_String(bs->character, CHARACTERISTIC_GENDER, gender, MAX_PATH);
ADDRLP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 152
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Characteristic_String
CALLV
pop
line 1195
;1194:	//set the chat gender
;1195:	if (*gender == 'f' || *gender == 'F') trap_BotSetChatGender(bs->cs, CHAT_GENDERFEMALE);
ADDRLP4 484
ADDRLP4 152
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 484
INDIRI4
CNSTI4 102
EQI4 $536
ADDRLP4 484
INDIRI4
CNSTI4 70
NEI4 $534
LABELV $536
ADDRLP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotSetChatGender
CALLV
pop
ADDRGP4 $535
JUMPV
LABELV $534
line 1196
;1196:	else if (*gender == 'm' || *gender == 'M') trap_BotSetChatGender(bs->cs, CHAT_GENDERMALE);
ADDRLP4 488
ADDRLP4 152
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 488
INDIRI4
CNSTI4 109
EQI4 $539
ADDRLP4 488
INDIRI4
CNSTI4 77
NEI4 $537
LABELV $539
ADDRLP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotSetChatGender
CALLV
pop
ADDRGP4 $538
JUMPV
LABELV $537
line 1197
;1197:	else trap_BotSetChatGender(bs->cs, CHAT_GENDERLESS);
ADDRLP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotSetChatGender
CALLV
pop
LABELV $538
LABELV $535
line 1199
;1198:
;1199:	bs->inuse = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 1
ASGNI4
line 1200
;1200:	bs->client = client;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 1201
;1201:	bs->entitynum = client;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 1202
;1202:	bs->setupcount = 4;
ADDRLP4 0
INDIRP4
CNSTI4 6016
ADDP4
CNSTI4 4
ASGNI4
line 1203
;1203:	bs->entergame_time = FloatTime();
ADDRLP4 0
INDIRP4
CNSTI4 6064
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1204
;1204:	bs->ms = trap_BotAllocMoveState();
ADDRLP4 492
ADDRGP4 trap_BotAllocMoveState
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 6524
ADDP4
ADDRLP4 492
INDIRI4
ASGNI4
line 1205
;1205:	bs->walker = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_WALKER, 0, 1);
ADDRLP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 48
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 500
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 6056
ADDP4
ADDRLP4 500
INDIRF4
ASGNF4
line 1206
;1206:	numbots++;
ADDRLP4 504
ADDRGP4 numbots
ASGNP4
ADDRLP4 504
INDIRP4
ADDRLP4 504
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1208
;1207:
;1208:	if (trap_Cvar_VariableIntegerValue("bot_testichat")) {
ADDRGP4 $542
ARGP4
ADDRLP4 508
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 508
INDIRI4
CNSTI4 0
EQI4 $540
line 1209
;1209:		trap_BotLibVarSet("bot_testichat", "1");
ADDRGP4 $542
ARGP4
ADDRGP4 $316
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1210
;1210:		BotChatTest(bs);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 BotChatTest
CALLV
pop
line 1211
;1211:	}
LABELV $540
line 1213
;1212:	//NOTE: reschedule the bot thinking
;1213:	BotScheduleBotThink();
ADDRGP4 BotScheduleBotThink
CALLV
pop
line 1215
;1214:	//if interbreeding start with a mutation
;1215:	if (bot_interbreed) {
ADDRGP4 bot_interbreed
INDIRI4
CNSTI4 0
EQI4 $543
line 1216
;1216:		trap_BotMutateGoalFuzzyLogic(bs->gs, 1);
ADDRLP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_BotMutateGoalFuzzyLogic
CALLV
pop
line 1217
;1217:	}
LABELV $543
line 1219
;1218:	// if we kept the bot client
;1219:	if (restart) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $545
line 1220
;1220:		BotReadSessionData(bs);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 BotReadSessionData
CALLV
pop
line 1221
;1221:	}
LABELV $545
line 1223
;1222:	//bot has been setup succesfully
;1223:	return qtrue;
CNSTI4 1
RETI4
LABELV $516
endproc BotAISetupClient 512 16
export BotAIShutdownClient
proc BotAIShutdownClient 16 12
line 1231
;1224:}
;1225:
;1226:/*
;1227:==============
;1228:BotAIShutdownClient
;1229:==============
;1230:*/
;1231:int BotAIShutdownClient(int client, qboolean restart) {
line 1234
;1232:	bot_state_t *bs;
;1233:
;1234:	bs = botstates[client];
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 1235
;1235:	if (!bs || !bs->inuse) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $550
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $548
LABELV $550
line 1237
;1236:		//BotAI_Print(PRT_ERROR, "BotAIShutdownClient: client %d already shutdown\n", client);
;1237:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $547
JUMPV
LABELV $548
line 1240
;1238:	}
;1239:
;1240:	if (restart) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $551
line 1241
;1241:		BotWriteSessionData(bs);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 BotWriteSessionData
CALLV
pop
line 1242
;1242:	}
LABELV $551
line 1244
;1243:
;1244:	if (BotChat_ExitGame(bs)) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotChat_ExitGame
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $553
line 1245
;1245:		trap_BotEnterChat(bs->cs, bs->client, CHAT_ALL);
ADDRLP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1246
;1246:	}
LABELV $553
line 1248
;1247:
;1248:	trap_BotFreeMoveState(bs->ms);
ADDRLP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeMoveState
CALLV
pop
line 1250
;1249:	//free the goal state`			
;1250:	trap_BotFreeGoalState(bs->gs);
ADDRLP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeGoalState
CALLV
pop
line 1252
;1251:	//free the chat file
;1252:	trap_BotFreeChatState(bs->cs);
ADDRLP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeChatState
CALLV
pop
line 1254
;1253:	//free the weapon weights
;1254:	trap_BotFreeWeaponState(bs->ws);
ADDRLP4 0
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeWeaponState
CALLV
pop
line 1256
;1255:	//free the bot character
;1256:	trap_BotFreeCharacter(bs->character);
ADDRLP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeCharacter
CALLV
pop
line 1258
;1257:	//
;1258:	BotFreeWaypoints(bs->checkpoints);
ADDRLP4 0
INDIRP4
CNSTI4 9072
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotFreeWaypoints
CALLV
pop
line 1259
;1259:	BotFreeWaypoints(bs->patrolpoints);
ADDRLP4 0
INDIRP4
CNSTI4 9076
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotFreeWaypoints
CALLV
pop
line 1261
;1260:	//clear activate goal stack
;1261:	BotClearActivateGoalStack(bs);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 BotClearActivateGoalStack
CALLV
pop
line 1263
;1262:	//clear the bot state
;1263:	memset(bs, 0, sizeof(bot_state_t));
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 9088
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1265
;1264:	//set the inuse flag to qfalse
;1265:	bs->inuse = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 1267
;1266:	//there's one bot less
;1267:	numbots--;
ADDRLP4 12
ADDRGP4 numbots
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1269
;1268:	//everything went ok
;1269:	return qtrue;
CNSTI4 1
RETI4
LABELV $547
endproc BotAIShutdownClient 16 12
export BotResetState
proc BotResetState 796 12
line 1280
;1270:}
;1271:
;1272:/*
;1273:==============
;1274:BotResetState
;1275:
;1276:called when a bot enters the intermission or observer mode and
;1277:when the level is changed
;1278:==============
;1279:*/
;1280:void BotResetState(bot_state_t *bs) {
line 1289
;1281:	int client, entitynum, inuse;
;1282:	int movestate, goalstate, chatstate, weaponstate;
;1283:	bot_settings_t settings;
;1284:	int character;
;1285:	playerState_t ps;							//current player state
;1286:	float entergame_time;
;1287:
;1288:	//save some things that should not be reset here
;1289:	memcpy(&settings, &bs->settings, sizeof(bot_settings_t));
ADDRLP4 28
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4608
ADDP4
ARGP4
CNSTI4 292
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1290
;1290:	memcpy(&ps, &bs->cur_ps, sizeof(playerState_t));
ADDRLP4 324
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ARGP4
CNSTI4 468
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1291
;1291:	inuse = bs->inuse;
ADDRLP4 8
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1292
;1292:	client = bs->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1293
;1293:	entitynum = bs->entitynum;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1294
;1294:	character = bs->character;
ADDRLP4 320
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ASGNI4
line 1295
;1295:	movestate = bs->ms;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ASGNI4
line 1296
;1296:	goalstate = bs->gs;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ASGNI4
line 1297
;1297:	chatstate = bs->cs;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ASGNI4
line 1298
;1298:	weaponstate = bs->ws;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
ASGNI4
line 1299
;1299:	entergame_time = bs->entergame_time;
ADDRLP4 792
ADDRFP4 0
INDIRP4
CNSTI4 6064
ADDP4
INDIRF4
ASGNF4
line 1301
;1300:	//free checkpoints and patrol points
;1301:	BotFreeWaypoints(bs->checkpoints);
ADDRFP4 0
INDIRP4
CNSTI4 9072
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotFreeWaypoints
CALLV
pop
line 1302
;1302:	BotFreeWaypoints(bs->patrolpoints);
ADDRFP4 0
INDIRP4
CNSTI4 9076
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotFreeWaypoints
CALLV
pop
line 1304
;1303:	//reset the whole state
;1304:	memset(bs, 0, sizeof(bot_state_t));
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 9088
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1306
;1305:	//copy back some state stuff that should not be reset
;1306:	bs->ms = movestate;
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1307
;1307:	bs->gs = goalstate;
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1308
;1308:	bs->cs = chatstate;
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1309
;1309:	bs->ws = weaponstate;
ADDRFP4 0
INDIRP4
CNSTI4 6536
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 1310
;1310:	memcpy(&bs->cur_ps, &ps, sizeof(playerState_t));
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ARGP4
ADDRLP4 324
ARGP4
CNSTI4 468
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1311
;1311:	memcpy(&bs->settings, &settings, sizeof(bot_settings_t));
ADDRFP4 0
INDIRP4
CNSTI4 4608
ADDP4
ARGP4
ADDRLP4 28
ARGP4
CNSTI4 292
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1312
;1312:	bs->inuse = inuse;
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1313
;1313:	bs->client = client;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1314
;1314:	bs->entitynum = entitynum;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1315
;1315:	bs->character = character;
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
ADDRLP4 320
INDIRI4
ASGNI4
line 1316
;1316:	bs->entergame_time = entergame_time;
ADDRFP4 0
INDIRP4
CNSTI4 6064
ADDP4
ADDRLP4 792
INDIRF4
ASGNF4
line 1318
;1317:	//reset several states
;1318:	if (bs->ms) trap_BotResetMoveState(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
CNSTI4 0
EQI4 $556
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetMoveState
CALLV
pop
LABELV $556
line 1319
;1319:	if (bs->gs) trap_BotResetGoalState(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $558
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetGoalState
CALLV
pop
LABELV $558
line 1320
;1320:	if (bs->ws) trap_BotResetWeaponState(bs->ws);
ADDRFP4 0
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
CNSTI4 0
EQI4 $560
ADDRFP4 0
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetWeaponState
CALLV
pop
LABELV $560
line 1321
;1321:	if (bs->gs) trap_BotResetAvoidGoals(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $562
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidGoals
CALLV
pop
LABELV $562
line 1322
;1322:	if (bs->ms) trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
CNSTI4 0
EQI4 $564
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
LABELV $564
line 1323
;1323:}
LABELV $555
endproc BotResetState 796 12
export BotAILoadMap
proc BotAILoadMap 280 16
line 1330
;1324:
;1325:/*
;1326:==============
;1327:BotAILoadMap
;1328:==============
;1329:*/
;1330:int BotAILoadMap( int restart ) {
line 1334
;1331:	int			i;
;1332:	vmCvar_t	mapname;
;1333:
;1334:	if (!restart) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $567
line 1335
;1335:		trap_Cvar_Register( &mapname, "mapname", "", CVAR_SERVERINFO | CVAR_ROM );
ADDRLP4 4
ARGP4
ADDRGP4 $569
ARGP4
ADDRGP4 $300
ARGP4
CNSTI4 68
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1336
;1336:		trap_BotLibLoadMap( mapname.string );
ADDRLP4 4+16
ARGP4
ADDRGP4 trap_BotLibLoadMap
CALLI4
pop
line 1337
;1337:	}
LABELV $567
line 1339
;1338:
;1339:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $571
line 1340
;1340:		if (botstates[i] && botstates[i]->inuse) {
ADDRLP4 276
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 276
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $575
ADDRLP4 276
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $575
line 1341
;1341:			BotResetState( botstates[i] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotResetState
CALLV
pop
line 1342
;1342:			botstates[i]->setupcount = 4;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 6016
ADDP4
CNSTI4 4
ASGNI4
line 1343
;1343:		}
LABELV $575
line 1344
;1344:	}
LABELV $572
line 1339
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $571
line 1346
;1345:
;1346:	BotSetupDeathmatchAI();
ADDRGP4 BotSetupDeathmatchAI
CALLV
pop
line 1348
;1347:
;1348:	return qtrue;
CNSTI4 1
RETI4
LABELV $566
endproc BotAILoadMap 280 16
bss
align 4
LABELV $578
skip 4
align 4
LABELV $579
skip 4
align 4
LABELV $580
skip 4
export BotAIStartFrame
code
proc BotAIStartFrame 152 12
line 1360
;1349:}
;1350:
;1351:#ifdef MISSIONPACK
;1352:void ProximityMine_Trigger( gentity_t *trigger, gentity_t *other, trace_t *trace );
;1353:#endif
;1354:
;1355:/*
;1356:==================
;1357:BotAIStartFrame
;1358:==================
;1359:*/
;1360:int BotAIStartFrame(int time) {
line 1369
;1361:	int i;
;1362:	gentity_t	*ent;
;1363:	bot_entitystate_t state;
;1364:	int elapsed_time, thinktime;
;1365:	static int local_time;
;1366:	static int botlib_residual;
;1367:	static int lastbotthink_time;
;1368:
;1369:	G_CheckBotSpawn();
ADDRGP4 G_CheckBotSpawn
CALLV
pop
line 1371
;1370:
;1371:	trap_Cvar_Update(&bot_rocketjump);
ADDRGP4 bot_rocketjump
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1372
;1372:	trap_Cvar_Update(&bot_grapple);
ADDRGP4 bot_grapple
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1373
;1373:	trap_Cvar_Update(&bot_fastchat);
ADDRGP4 bot_fastchat
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1374
;1374:	trap_Cvar_Update(&bot_nochat);
ADDRGP4 bot_nochat
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1375
;1375:	trap_Cvar_Update(&bot_testrchat);
ADDRGP4 bot_testrchat
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1376
;1376:	trap_Cvar_Update(&bot_thinktime);
ADDRGP4 bot_thinktime
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1377
;1377:	trap_Cvar_Update(&bot_memorydump);
ADDRGP4 bot_memorydump
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1378
;1378:	trap_Cvar_Update(&bot_saveroutingcache);
ADDRGP4 bot_saveroutingcache
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1379
;1379:	trap_Cvar_Update(&bot_pause);
ADDRGP4 bot_pause
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1380
;1380:	trap_Cvar_Update(&bot_report);
ADDRGP4 bot_report
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1382
;1381:
;1382:	if (bot_report.integer) {
ADDRGP4 bot_report+12
INDIRI4
CNSTI4 0
EQI4 $581
line 1385
;1383://		BotTeamplayReport();
;1384://		trap_Cvar_Set("bot_report", "0");
;1385:		BotUpdateInfoConfigStrings();
ADDRGP4 BotUpdateInfoConfigStrings
CALLV
pop
line 1386
;1386:	}
LABELV $581
line 1388
;1387:
;1388:	if (bot_pause.integer) {
ADDRGP4 bot_pause+12
INDIRI4
CNSTI4 0
EQI4 $584
line 1390
;1389:		// execute bot user commands every frame
;1390:		for( i = 0; i < MAX_CLIENTS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $587
line 1391
;1391:			if( !botstates[i] || !botstates[i]->inuse ) {
ADDRLP4 128
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $593
ADDRLP4 128
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $591
LABELV $593
line 1392
;1392:				continue;
ADDRGP4 $588
JUMPV
LABELV $591
line 1394
;1393:			}
;1394:			if( g_entities[i].client->pers.connected != CON_CONNECTED ) {
CNSTI4 916
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+524
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $594
line 1395
;1395:				continue;
ADDRGP4 $588
JUMPV
LABELV $594
line 1397
;1396:			}
;1397:			botstates[i]->lastucmd.forwardmove = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 509
ADDP4
CNSTI1 0
ASGNI1
line 1398
;1398:			botstates[i]->lastucmd.rightmove = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 510
ADDP4
CNSTI1 0
ASGNI1
line 1399
;1399:			botstates[i]->lastucmd.upmove = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 511
ADDP4
CNSTI1 0
ASGNI1
line 1400
;1400:			botstates[i]->lastucmd.buttons = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 0
ASGNI4
line 1401
;1401:			botstates[i]->lastucmd.serverTime = time;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 488
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 1402
;1402:			trap_BotUserCommand(botstates[i]->client, &botstates[i]->lastucmd);
ADDRLP4 132
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 132
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 132
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRGP4 trap_BotUserCommand
CALLV
pop
line 1403
;1403:		}
LABELV $588
line 1390
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $587
line 1404
;1404:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $577
JUMPV
LABELV $584
line 1407
;1405:	}
;1406:
;1407:	if (bot_memorydump.integer) {
ADDRGP4 bot_memorydump+12
INDIRI4
CNSTI4 0
EQI4 $597
line 1408
;1408:		trap_BotLibVarSet("memorydump", "1");
ADDRGP4 $600
ARGP4
ADDRGP4 $316
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1409
;1409:		trap_Cvar_Set("bot_memorydump", "0");
ADDRGP4 $601
ARGP4
ADDRGP4 $602
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1410
;1410:	}
LABELV $597
line 1411
;1411:	if (bot_saveroutingcache.integer) {
ADDRGP4 bot_saveroutingcache+12
INDIRI4
CNSTI4 0
EQI4 $603
line 1412
;1412:		trap_BotLibVarSet("saveroutingcache", "1");
ADDRGP4 $606
ARGP4
ADDRGP4 $316
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1413
;1413:		trap_Cvar_Set("bot_saveroutingcache", "0");
ADDRGP4 $607
ARGP4
ADDRGP4 $602
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1414
;1414:	}
LABELV $603
line 1416
;1415:	//check if bot interbreeding is activated
;1416:	BotInterbreeding();
ADDRGP4 BotInterbreeding
CALLV
pop
line 1418
;1417:	//cap the bot think time
;1418:	if (bot_thinktime.integer > 200) {
ADDRGP4 bot_thinktime+12
INDIRI4
CNSTI4 200
LEI4 $608
line 1419
;1419:		trap_Cvar_Set("bot_thinktime", "200");
ADDRGP4 $611
ARGP4
ADDRGP4 $612
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1420
;1420:	}
LABELV $608
line 1422
;1421:	//if the bot think time changed we should reschedule the bots
;1422:	if (bot_thinktime.integer != lastbotthink_time) {
ADDRGP4 bot_thinktime+12
INDIRI4
ADDRGP4 $580
INDIRI4
EQI4 $613
line 1423
;1423:		lastbotthink_time = bot_thinktime.integer;
ADDRGP4 $580
ADDRGP4 bot_thinktime+12
INDIRI4
ASGNI4
line 1424
;1424:		BotScheduleBotThink();
ADDRGP4 BotScheduleBotThink
CALLV
pop
line 1425
;1425:	}
LABELV $613
line 1427
;1426:
;1427:	elapsed_time = time - local_time;
ADDRLP4 120
ADDRFP4 0
INDIRI4
ADDRGP4 $578
INDIRI4
SUBI4
ASGNI4
line 1428
;1428:	local_time = time;
ADDRGP4 $578
ADDRFP4 0
INDIRI4
ASGNI4
line 1430
;1429:
;1430:	botlib_residual += elapsed_time;
ADDRLP4 128
ADDRGP4 $579
ASGNP4
ADDRLP4 128
INDIRP4
ADDRLP4 128
INDIRP4
INDIRI4
ADDRLP4 120
INDIRI4
ADDI4
ASGNI4
line 1432
;1431:
;1432:	if (elapsed_time > bot_thinktime.integer) thinktime = elapsed_time;
ADDRLP4 120
INDIRI4
ADDRGP4 bot_thinktime+12
INDIRI4
LEI4 $617
ADDRLP4 124
ADDRLP4 120
INDIRI4
ASGNI4
ADDRGP4 $618
JUMPV
LABELV $617
line 1433
;1433:	else thinktime = bot_thinktime.integer;
ADDRLP4 124
ADDRGP4 bot_thinktime+12
INDIRI4
ASGNI4
LABELV $618
line 1436
;1434:
;1435:	// update the bot library
;1436:	if ( botlib_residual >= thinktime ) {
ADDRGP4 $579
INDIRI4
ADDRLP4 124
INDIRI4
LTI4 $621
line 1437
;1437:		botlib_residual -= thinktime;
ADDRLP4 132
ADDRGP4 $579
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRI4
ADDRLP4 124
INDIRI4
SUBI4
ASGNI4
line 1439
;1438:
;1439:		trap_BotLibStartFrame((float) time / 1000);
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ARGF4
ADDRGP4 trap_BotLibStartFrame
CALLI4
pop
line 1441
;1440:
;1441:		if (!trap_AAS_Initialized()) return qfalse;
ADDRLP4 136
ADDRGP4 trap_AAS_Initialized
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 0
NEI4 $623
CNSTI4 0
RETI4
ADDRGP4 $577
JUMPV
LABELV $623
line 1444
;1442:
;1443:		//update entities in the botlib
;1444:		for (i = 0; i < MAX_GENTITIES; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $625
line 1445
;1445:			ent = &g_entities[i];
ADDRLP4 4
CNSTI4 916
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1446
;1446:			if (!ent->inuse) {
ADDRLP4 4
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $629
line 1447
;1447:				trap_BotLibUpdateEntity(i, NULL);
ADDRLP4 0
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 trap_BotLibUpdateEntity
CALLI4
pop
line 1448
;1448:				continue;
ADDRGP4 $626
JUMPV
LABELV $629
line 1450
;1449:			}
;1450:			if (!ent->r.linked) {
ADDRLP4 4
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 0
NEI4 $631
line 1451
;1451:				trap_BotLibUpdateEntity(i, NULL);
ADDRLP4 0
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 trap_BotLibUpdateEntity
CALLI4
pop
line 1452
;1452:				continue;
ADDRGP4 $626
JUMPV
LABELV $631
line 1454
;1453:			}
;1454:			if (ent->r.svFlags & SVF_NOCLIENT) {
ADDRLP4 4
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $633
line 1455
;1455:				trap_BotLibUpdateEntity(i, NULL);
ADDRLP4 0
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 trap_BotLibUpdateEntity
CALLI4
pop
line 1456
;1456:				continue;
ADDRGP4 $626
JUMPV
LABELV $633
line 1459
;1457:			}
;1458:			// do not update missiles
;1459:			if (ent->s.eType == ET_MISSILE && ent->s.weapon != WP_GRAPPLING_HOOK) {
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $635
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 10
EQI4 $635
line 1460
;1460:				trap_BotLibUpdateEntity(i, NULL);
ADDRLP4 0
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 trap_BotLibUpdateEntity
CALLI4
pop
line 1461
;1461:				continue;
ADDRGP4 $626
JUMPV
LABELV $635
line 1464
;1462:			}
;1463:			// do not update event only entities
;1464:			if (ent->s.eType > ET_EVENTS) {
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 14
LEI4 $637
line 1465
;1465:				trap_BotLibUpdateEntity(i, NULL);
ADDRLP4 0
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 trap_BotLibUpdateEntity
CALLI4
pop
line 1466
;1466:				continue;
ADDRGP4 $626
JUMPV
LABELV $637
line 1478
;1467:			}
;1468:#ifdef MISSIONPACK
;1469:			// never link prox mine triggers
;1470:			if (ent->r.contents == CONTENTS_TRIGGER) {
;1471:				if (ent->touch == ProximityMine_Trigger) {
;1472:					trap_BotLibUpdateEntity(i, NULL);
;1473:					continue;
;1474:				}
;1475:			}
;1476:#endif
;1477:			//
;1478:			memset(&state, 0, sizeof(bot_entitystate_t));
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
CNSTI4 112
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1480
;1479:			//
;1480:			VectorCopy(ent->r.currentOrigin, state.origin);
ADDRLP4 8+8
ADDRLP4 4
INDIRP4
CNSTI4 496
ADDP4
INDIRB
ASGNB 12
line 1481
;1481:			if (i < MAX_CLIENTS) {
ADDRLP4 0
INDIRI4
CNSTI4 64
GEI4 $640
line 1482
;1482:				VectorCopy(ent->s.apos.trBase, state.angles);
ADDRLP4 8+20
ADDRLP4 4
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 1483
;1483:			} else {
ADDRGP4 $641
JUMPV
LABELV $640
line 1484
;1484:				VectorCopy(ent->r.currentAngles, state.angles);
ADDRLP4 8+20
ADDRLP4 4
INDIRP4
CNSTI4 508
ADDP4
INDIRB
ASGNB 12
line 1485
;1485:			}
LABELV $641
line 1486
;1486:			VectorCopy(ent->s.origin2, state.old_origin);
ADDRLP4 8+32
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 1487
;1487:			VectorCopy(ent->r.mins, state.mins);
ADDRLP4 8+44
ADDRLP4 4
INDIRP4
CNSTI4 444
ADDP4
INDIRB
ASGNB 12
line 1488
;1488:			VectorCopy(ent->r.maxs, state.maxs);
ADDRLP4 8+56
ADDRLP4 4
INDIRP4
CNSTI4 456
ADDP4
INDIRB
ASGNB 12
line 1489
;1489:			state.type = ent->s.eType;
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1490
;1490:			state.flags = ent->s.eFlags;
ADDRLP4 8+4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1491
;1491:			if (ent->r.bmodel) state.solid = SOLID_BSP;
ADDRLP4 4
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
CNSTI4 0
EQI4 $648
ADDRLP4 8+72
CNSTI4 3
ASGNI4
ADDRGP4 $649
JUMPV
LABELV $648
line 1492
;1492:			else state.solid = SOLID_BBOX;
ADDRLP4 8+72
CNSTI4 2
ASGNI4
LABELV $649
line 1493
;1493:			state.groundent = ent->s.groundEntityNum;
ADDRLP4 8+68
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
line 1494
;1494:			state.modelindex = ent->s.modelindex;
ADDRLP4 8+76
ADDRLP4 4
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
line 1495
;1495:			state.modelindex2 = ent->s.modelindex2;
ADDRLP4 8+80
ADDRLP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ASGNI4
line 1496
;1496:			state.frame = ent->s.frame;
ADDRLP4 8+84
ADDRLP4 4
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
line 1497
;1497:			state.event = ent->s.event;
ADDRLP4 8+88
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ASGNI4
line 1498
;1498:			state.eventParm = ent->s.eventParm;
ADDRLP4 8+92
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 1499
;1499:			state.powerups = ent->s.powerups;
ADDRLP4 8+96
ADDRLP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 1500
;1500:			state.legsAnim = ent->s.legsAnim;
ADDRLP4 8+104
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
line 1501
;1501:			state.torsoAnim = ent->s.torsoAnim;
ADDRLP4 8+108
ADDRLP4 4
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ASGNI4
line 1502
;1502:			state.weapon = ent->s.weapon;
ADDRLP4 8+100
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 1504
;1503:			//
;1504:			trap_BotLibUpdateEntity(i, &state);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 trap_BotLibUpdateEntity
CALLI4
pop
line 1505
;1505:		}
LABELV $626
line 1444
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $625
line 1507
;1506:
;1507:		BotAIRegularUpdate();
ADDRGP4 BotAIRegularUpdate
CALLV
pop
line 1508
;1508:	}
LABELV $621
line 1510
;1509:
;1510:	floattime = trap_AAS_Time();
ADDRLP4 132
ADDRGP4 trap_AAS_Time
CALLF4
ASGNF4
ADDRGP4 floattime
ADDRLP4 132
INDIRF4
ASGNF4
line 1513
;1511:
;1512:	// execute scheduled bot AI
;1513:	for( i = 0; i < MAX_CLIENTS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $662
line 1514
;1514:		if( !botstates[i] || !botstates[i]->inuse ) {
ADDRLP4 136
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 136
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $668
ADDRLP4 136
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $666
LABELV $668
line 1515
;1515:			continue;
ADDRGP4 $663
JUMPV
LABELV $666
line 1518
;1516:		}
;1517:		//
;1518:		botstates[i]->botthink_residual += elapsed_time;
ADDRLP4 140
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRI4
ADDRLP4 120
INDIRI4
ADDI4
ASGNI4
line 1520
;1519:		//
;1520:		if ( botstates[i]->botthink_residual >= thinktime ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 124
INDIRI4
LTI4 $669
line 1521
;1521:			botstates[i]->botthink_residual -= thinktime;
ADDRLP4 144
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRI4
ADDRLP4 124
INDIRI4
SUBI4
ASGNI4
line 1523
;1522:
;1523:			if (!trap_AAS_Initialized()) return qfalse;
ADDRLP4 148
ADDRGP4 trap_AAS_Initialized
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $671
CNSTI4 0
RETI4
ADDRGP4 $577
JUMPV
LABELV $671
line 1525
;1524:
;1525:			if (g_entities[i].client->pers.connected == CON_CONNECTED) {
CNSTI4 916
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+524
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
NEI4 $673
line 1526
;1526:				BotAI(i, (float) thinktime / 1000);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 124
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ARGF4
ADDRGP4 BotAI
CALLI4
pop
line 1527
;1527:			}
LABELV $673
line 1528
;1528:		}
LABELV $669
line 1529
;1529:	}
LABELV $663
line 1513
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $662
line 1533
;1530:
;1531:
;1532:	// execute bot user commands every frame
;1533:	for( i = 0; i < MAX_CLIENTS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $676
line 1534
;1534:		if( !botstates[i] || !botstates[i]->inuse ) {
ADDRLP4 136
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 136
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $682
ADDRLP4 136
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $680
LABELV $682
line 1535
;1535:			continue;
ADDRGP4 $677
JUMPV
LABELV $680
line 1537
;1536:		}
;1537:		if( g_entities[i].client->pers.connected != CON_CONNECTED ) {
CNSTI4 916
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+524
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $683
line 1538
;1538:			continue;
ADDRGP4 $677
JUMPV
LABELV $683
line 1541
;1539:		}
;1540:
;1541:		BotUpdateInput(botstates[i], time, elapsed_time);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 120
INDIRI4
ARGI4
ADDRGP4 BotUpdateInput
CALLV
pop
line 1542
;1542:		trap_BotUserCommand(botstates[i]->client, &botstates[i]->lastucmd);
ADDRLP4 140
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 140
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 140
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRGP4 trap_BotUserCommand
CALLV
pop
line 1543
;1543:	}
LABELV $677
line 1533
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $676
line 1545
;1544:
;1545:	return qtrue;
CNSTI4 1
RETI4
LABELV $577
endproc BotAIStartFrame 152 12
export BotInitLibrary
proc BotInitLibrary 212 16
line 1553
;1546:}
;1547:
;1548:/*
;1549:==============
;1550:BotInitLibrary
;1551:==============
;1552:*/
;1553:int BotInitLibrary(void) {
line 1557
;1554:	char buf[144];
;1555:
;1556:	//set the maxclients and maxentities library variables before calling BotSetupLibrary
;1557:	trap_Cvar_VariableStringBuffer("sv_maxclients", buf, sizeof(buf));
ADDRGP4 $687
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1558
;1558:	if (!strlen(buf)) strcpy(buf, "8");
ADDRLP4 0
ARGP4
ADDRLP4 144
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
NEI4 $688
ADDRLP4 0
ARGP4
ADDRGP4 $690
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $688
line 1559
;1559:	trap_BotLibVarSet("maxclients", buf);
ADDRGP4 $691
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1560
;1560:	Com_sprintf(buf, sizeof(buf), "%d", MAX_GENTITIES);
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 $308
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1561
;1561:	trap_BotLibVarSet("maxentities", buf);
ADDRGP4 $692
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1563
;1562:	//bsp checksum
;1563:	trap_Cvar_VariableStringBuffer("sv_mapChecksum", buf, sizeof(buf));
ADDRGP4 $693
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1564
;1564:	if (strlen(buf)) trap_BotLibVarSet("sv_mapChecksum", buf);
ADDRLP4 0
ARGP4
ADDRLP4 148
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $694
ADDRGP4 $693
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $694
line 1566
;1565:	//maximum number of aas links
;1566:	trap_Cvar_VariableStringBuffer("max_aaslinks", buf, sizeof(buf));
ADDRGP4 $696
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1567
;1567:	if (strlen(buf)) trap_BotLibVarSet("max_aaslinks", buf);
ADDRLP4 0
ARGP4
ADDRLP4 152
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $697
ADDRGP4 $696
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $697
line 1569
;1568:	//maximum number of items in a level
;1569:	trap_Cvar_VariableStringBuffer("max_levelitems", buf, sizeof(buf));
ADDRGP4 $699
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1570
;1570:	if (strlen(buf)) trap_BotLibVarSet("max_levelitems", buf);
ADDRLP4 0
ARGP4
ADDRLP4 156
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
EQI4 $700
ADDRGP4 $699
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $700
line 1572
;1571:	//game type
;1572:	trap_Cvar_VariableStringBuffer("g_gametype", buf, sizeof(buf));
ADDRGP4 $307
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1573
;1573:	if (!strlen(buf)) strcpy(buf, "0");
ADDRLP4 0
ARGP4
ADDRLP4 160
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
NEI4 $702
ADDRLP4 0
ARGP4
ADDRGP4 $602
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $702
line 1574
;1574:	trap_BotLibVarSet("g_gametype", buf);
ADDRGP4 $307
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1576
;1575:	//bot developer mode and log file
;1576:	trap_BotLibVarSet("bot_developer", bot_developer.string);
ADDRGP4 $704
ARGP4
ADDRGP4 bot_developer+16
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1577
;1577:	trap_BotLibVarSet("log", buf);
ADDRGP4 $706
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1579
;1578:	//no chatting
;1579:	trap_Cvar_VariableStringBuffer("bot_nochat", buf, sizeof(buf));
ADDRGP4 $707
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1580
;1580:	if (strlen(buf)) trap_BotLibVarSet("nochat", "0");
ADDRLP4 0
ARGP4
ADDRLP4 164
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
EQI4 $708
ADDRGP4 $710
ARGP4
ADDRGP4 $602
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $708
line 1582
;1581:	//visualize jump pads
;1582:	trap_Cvar_VariableStringBuffer("bot_visualizejumppads", buf, sizeof(buf));
ADDRGP4 $711
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1583
;1583:	if (strlen(buf)) trap_BotLibVarSet("bot_visualizejumppads", buf);
ADDRLP4 0
ARGP4
ADDRLP4 168
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 0
EQI4 $712
ADDRGP4 $711
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $712
line 1585
;1584:	//forced clustering calculations
;1585:	trap_Cvar_VariableStringBuffer("bot_forceclustering", buf, sizeof(buf));
ADDRGP4 $714
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1586
;1586:	if (strlen(buf)) trap_BotLibVarSet("forceclustering", buf);
ADDRLP4 0
ARGP4
ADDRLP4 172
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 0
EQI4 $715
ADDRGP4 $717
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $715
line 1588
;1587:	//forced reachability calculations
;1588:	trap_Cvar_VariableStringBuffer("bot_forcereachability", buf, sizeof(buf));
ADDRGP4 $718
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1589
;1589:	if (strlen(buf)) trap_BotLibVarSet("forcereachability", buf);
ADDRLP4 0
ARGP4
ADDRLP4 176
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 0
EQI4 $719
ADDRGP4 $721
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $719
line 1591
;1590:	//force writing of AAS to file
;1591:	trap_Cvar_VariableStringBuffer("bot_forcewrite", buf, sizeof(buf));
ADDRGP4 $722
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1592
;1592:	if (strlen(buf)) trap_BotLibVarSet("forcewrite", buf);
ADDRLP4 0
ARGP4
ADDRLP4 180
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 0
EQI4 $723
ADDRGP4 $725
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $723
line 1594
;1593:	//no AAS optimization
;1594:	trap_Cvar_VariableStringBuffer("bot_aasoptimize", buf, sizeof(buf));
ADDRGP4 $726
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1595
;1595:	if (strlen(buf)) trap_BotLibVarSet("aasoptimize", buf);
ADDRLP4 0
ARGP4
ADDRLP4 184
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 0
EQI4 $727
ADDRGP4 $729
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $727
line 1597
;1596:	//
;1597:	trap_Cvar_VariableStringBuffer("bot_saveroutingcache", buf, sizeof(buf));
ADDRGP4 $607
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1598
;1598:	if (strlen(buf)) trap_BotLibVarSet("saveroutingcache", buf);
ADDRLP4 0
ARGP4
ADDRLP4 188
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 0
EQI4 $730
ADDRGP4 $606
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $730
line 1600
;1599:	//reload instead of cache bot character files
;1600:	trap_Cvar_VariableStringBuffer("bot_reloadcharacters", buf, sizeof(buf));
ADDRGP4 $315
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1601
;1601:	if (!strlen(buf)) strcpy(buf, "0");
ADDRLP4 0
ARGP4
ADDRLP4 192
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 192
INDIRI4
CNSTI4 0
NEI4 $732
ADDRLP4 0
ARGP4
ADDRGP4 $602
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $732
line 1602
;1602:	trap_BotLibVarSet("bot_reloadcharacters", buf);
ADDRGP4 $315
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1604
;1603:	//base directory
;1604:	trap_Cvar_VariableStringBuffer("fs_basepath", buf, sizeof(buf));
ADDRGP4 $734
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1605
;1605:	if (strlen(buf)) trap_BotLibVarSet("basedir", buf);
ADDRLP4 0
ARGP4
ADDRLP4 196
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 196
INDIRI4
CNSTI4 0
EQI4 $735
ADDRGP4 $737
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $735
line 1607
;1606:	//game directory
;1607:	trap_Cvar_VariableStringBuffer("fs_game", buf, sizeof(buf));
ADDRGP4 $738
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1608
;1608:	if (strlen(buf)) trap_BotLibVarSet("gamedir", buf);
ADDRLP4 0
ARGP4
ADDRLP4 200
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 200
INDIRI4
CNSTI4 0
EQI4 $739
ADDRGP4 $741
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $739
line 1610
;1609:	//cd directory
;1610:	trap_Cvar_VariableStringBuffer("fs_cdpath", buf, sizeof(buf));
ADDRGP4 $742
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1611
;1611:	if (strlen(buf)) trap_BotLibVarSet("cddir", buf);
ADDRLP4 0
ARGP4
ADDRLP4 204
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 0
EQI4 $743
ADDRGP4 $745
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $743
line 1617
;1612:	//
;1613:#ifdef MISSIONPACK
;1614:	trap_BotLibDefine("MISSIONPACK");
;1615:#endif
;1616:	//setup the bot library
;1617:	return trap_BotLibSetup();
ADDRLP4 208
ADDRGP4 trap_BotLibSetup
CALLI4
ASGNI4
ADDRLP4 208
INDIRI4
RETI4
LABELV $686
endproc BotInitLibrary 212 16
export BotAISetup
proc BotAISetup 8 16
line 1625
;1618:}
;1619:
;1620:/*
;1621:==============
;1622:BotAISetup
;1623:==============
;1624:*/
;1625:int BotAISetup( int restart ) {
line 1628
;1626:	int			errnum;
;1627:
;1628:	trap_Cvar_Register(&bot_thinktime, "bot_thinktime", "100", CVAR_CHEAT);
ADDRGP4 bot_thinktime
ARGP4
ADDRGP4 $611
ARGP4
ADDRGP4 $747
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1629
;1629:	trap_Cvar_Register(&bot_memorydump, "bot_memorydump", "0", CVAR_CHEAT);
ADDRGP4 bot_memorydump
ARGP4
ADDRGP4 $601
ARGP4
ADDRGP4 $602
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1630
;1630:	trap_Cvar_Register(&bot_saveroutingcache, "bot_saveroutingcache", "0", CVAR_CHEAT);
ADDRGP4 bot_saveroutingcache
ARGP4
ADDRGP4 $607
ARGP4
ADDRGP4 $602
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1631
;1631:	trap_Cvar_Register(&bot_pause, "bot_pause", "0", CVAR_CHEAT);
ADDRGP4 bot_pause
ARGP4
ADDRGP4 $748
ARGP4
ADDRGP4 $602
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1632
;1632:	trap_Cvar_Register(&bot_report, "bot_report", "0", CVAR_CHEAT);
ADDRGP4 bot_report
ARGP4
ADDRGP4 $749
ARGP4
ADDRGP4 $602
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1633
;1633:	trap_Cvar_Register(&bot_testsolid, "bot_testsolid", "0", CVAR_CHEAT);
ADDRGP4 bot_testsolid
ARGP4
ADDRGP4 $750
ARGP4
ADDRGP4 $602
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1634
;1634:	trap_Cvar_Register(&bot_testclusters, "bot_testclusters", "0", CVAR_CHEAT);
ADDRGP4 bot_testclusters
ARGP4
ADDRGP4 $751
ARGP4
ADDRGP4 $602
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1635
;1635:	trap_Cvar_Register(&bot_developer, "bot_developer", "0", CVAR_CHEAT);
ADDRGP4 bot_developer
ARGP4
ADDRGP4 $704
ARGP4
ADDRGP4 $602
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1636
;1636:	trap_Cvar_Register(&bot_interbreedchar, "bot_interbreedchar", "", 0);
ADDRGP4 bot_interbreedchar
ARGP4
ADDRGP4 $325
ARGP4
ADDRGP4 $300
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1637
;1637:	trap_Cvar_Register(&bot_interbreedbots, "bot_interbreedbots", "10", 0);
ADDRGP4 bot_interbreedbots
ARGP4
ADDRGP4 $752
ARGP4
ADDRGP4 $753
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1638
;1638:	trap_Cvar_Register(&bot_interbreedcycle, "bot_interbreedcycle", "20", 0);
ADDRGP4 bot_interbreedcycle
ARGP4
ADDRGP4 $754
ARGP4
ADDRGP4 $755
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1639
;1639:	trap_Cvar_Register(&bot_interbreedwrite, "bot_interbreedwrite", "", 0);
ADDRGP4 bot_interbreedwrite
ARGP4
ADDRGP4 $299
ARGP4
ADDRGP4 $300
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1642
;1640:
;1641:	//if the game is restarted for a tournament
;1642:	if (restart) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $756
line 1643
;1643:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $746
JUMPV
LABELV $756
line 1647
;1644:	}
;1645:
;1646:	//initialize the bot states
;1647:	memset( botstates, 0, sizeof(botstates) );
ADDRGP4 botstates
ARGP4
CNSTI4 0
ARGI4
CNSTI4 256
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1649
;1648:
;1649:	errnum = BotInitLibrary();
ADDRLP4 4
ADDRGP4 BotInitLibrary
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1650
;1650:	if (errnum != BLERR_NOERROR) return qfalse;
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $758
CNSTI4 0
RETI4
ADDRGP4 $746
JUMPV
LABELV $758
line 1651
;1651:	return qtrue;
CNSTI4 1
RETI4
LABELV $746
endproc BotAISetup 8 16
export BotAIShutdown
proc BotAIShutdown 8 8
line 1659
;1652:}
;1653:
;1654:/*
;1655:==============
;1656:BotAIShutdown
;1657:==============
;1658:*/
;1659:int BotAIShutdown( int restart ) {
line 1664
;1660:
;1661:	int i;
;1662:
;1663:	//if the game is restarted for a tournament
;1664:	if ( restart ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $761
line 1666
;1665:		//shutdown all the bots in the botlib
;1666:		for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $763
line 1667
;1667:			if (botstates[i] && botstates[i]->inuse) {
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $767
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $767
line 1668
;1668:				BotAIShutdownClient(botstates[i]->client, restart);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 BotAIShutdownClient
CALLI4
pop
line 1669
;1669:			}
LABELV $767
line 1670
;1670:		}
LABELV $764
line 1666
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $763
line 1672
;1671:		//don't shutdown the bot library
;1672:	}
ADDRGP4 $762
JUMPV
LABELV $761
line 1673
;1673:	else {
line 1674
;1674:		trap_BotLibShutdown();
ADDRGP4 trap_BotLibShutdown
CALLI4
pop
line 1675
;1675:	}
LABELV $762
line 1676
;1676:	return qtrue;
CNSTI4 1
RETI4
LABELV $760
endproc BotAIShutdown 8 8
import ExitLevel
bss
export bot_interbreedwrite
align 4
LABELV bot_interbreedwrite
skip 272
export bot_interbreedcycle
align 4
LABELV bot_interbreedcycle
skip 272
export bot_interbreedbots
align 4
LABELV bot_interbreedbots
skip 272
export bot_interbreedchar
align 4
LABELV bot_interbreedchar
skip 272
export bot_developer
align 4
LABELV bot_developer
skip 272
export bot_testclusters
align 4
LABELV bot_testclusters
skip 272
export bot_testsolid
align 4
LABELV bot_testsolid
skip 272
export bot_report
align 4
LABELV bot_report
skip 272
export bot_pause
align 4
LABELV bot_pause
skip 272
export bot_saveroutingcache
align 4
LABELV bot_saveroutingcache
skip 272
export bot_memorydump
align 4
LABELV bot_memorydump
skip 272
export bot_thinktime
align 4
LABELV bot_thinktime
skip 272
export bot_interbreedmatchcount
align 4
LABELV bot_interbreedmatchcount
skip 4
export bot_interbreed
align 4
LABELV bot_interbreed
skip 4
export regularupdate_time
align 4
LABELV regularupdate_time
skip 4
export numbots
align 4
LABELV numbots
skip 4
export botstates
align 4
LABELV botstates
skip 256
import BotVoiceChat_Defend
import BotVoiceChatCommand
import BotDumpNodeSwitches
import BotResetNodeSwitches
import AINode_Battle_NBG
import AINode_Battle_Retreat
import AINode_Battle_Chase
import AINode_Battle_Fight
import AINode_Seek_LTG
import AINode_Seek_NBG
import AINode_Seek_ActivateEntity
import AINode_Stand
import AINode_Respawn
import AINode_Observer
import AINode_Intermission
import AIEnter_Battle_NBG
import AIEnter_Battle_Retreat
import AIEnter_Battle_Chase
import AIEnter_Battle_Fight
import AIEnter_Seek_Camp
import AIEnter_Seek_LTG
import AIEnter_Seek_NBG
import AIEnter_Seek_ActivateEntity
import AIEnter_Stand
import AIEnter_Respawn
import AIEnter_Observer
import AIEnter_Intermission
import BotPrintTeamGoal
import BotMatchMessage
import notleader
import BotChatTest
import BotValidChatPosition
import BotChatTime
import BotChat_Random
import BotChat_EnemySuicide
import BotChat_Kill
import BotChat_Death
import BotChat_HitNoKill
import BotChat_HitNoDeath
import BotChat_HitTalking
import BotChat_EndLevel
import BotChat_StartLevel
import BotChat_ExitGame
import BotChat_EnterGame
import ctf_blueflag
import ctf_redflag
import bot_challenge
import bot_testrchat
import bot_nochat
import bot_fastchat
import bot_rocketjump
import bot_grapple
import maxclients
import gametype
import BotMapScripts
import BotPointAreaNum
import ClientOnSameTeamFromName
import ClientFromName
import stristr
import BotFindWayPoint
import BotCreateWayPoint
import BotAlternateRoute
import BotGetAlternateRouteGoal
import BotCTFRetreatGoals
import BotCTFSeekGoals
import BotRememberLastOrderedTask
import BotCTFCarryingFlag
import BotOppositeTeam
import BotTeam
import BotClearActivateGoalStack
import BotPopFromActivateGoalStack
import BotEnableActivateGoalAreas
import BotAIPredictObstacles
import BotAIBlocked
import BotCheckAttack
import BotAimAtEnemy
import BotEntityVisible
import BotRoamGoal
import BotFindEnemy
import InFieldOfVision
import BotVisibleTeamMatesAndEnemies
import BotEnemyFlagCarrierVisible
import BotTeamFlagCarrierVisible
import BotTeamFlagCarrier
import TeamPlayIsOn
import BotSameTeam
import BotAttackMove
import BotWantsToCamp
import BotHasPersistantPowerupAndWeapon
import BotCanAndWantsToRocketJump
import BotWantsToHelp
import BotWantsToChase
import BotWantsToRetreat
import BotFeelingBad
import BotAggression
import BotTeamGoals
import BotSetLastOrderedTask
import BotSynonymContext
import ClientSkin
import EasyClientName
import ClientName
import BotSetTeamStatus
import BotSetUserInfo
import EntityIsShooting
import EntityIsInvisible
import EntityIsDead
import BotInLavaOrSlime
import BotIntermission
import BotIsObserver
import BotIsDead
import BotBattleUseItems
import BotUpdateBattleInventory
import BotUpdateInventory
import BotSetupForMovement
import BotChooseWeapon
import BotFreeWaypoints
import BotDeathmatchAI
import BotShutdownDeathmatchAI
import BotSetupDeathmatchAI
export floattime
align 4
LABELV floattime
skip 4
import BotResetWeaponState
import BotFreeWeaponState
import BotAllocWeaponState
import BotLoadWeaponWeights
import BotGetWeaponInfo
import BotChooseBestFightWeapon
import BotShutdownWeaponAI
import BotSetupWeaponAI
import BotShutdownMoveAI
import BotSetupMoveAI
import BotSetBrushModelTypes
import BotAddAvoidSpot
import BotInitMoveState
import BotFreeMoveState
import BotAllocMoveState
import BotPredictVisiblePosition
import BotMovementViewTarget
import BotReachabilityArea
import BotResetLastAvoidReach
import BotResetAvoidReach
import BotMoveInDirection
import BotMoveToGoal
import BotResetMoveState
import BotShutdownGoalAI
import BotSetupGoalAI
import BotFreeGoalState
import BotAllocGoalState
import BotFreeItemWeights
import BotLoadItemWeights
import BotMutateGoalFuzzyLogic
import BotSaveGoalFuzzyLogic
import BotInterbreedGoalFuzzyLogic
import BotUpdateEntityItems
import BotInitLevelItems
import BotSetAvoidGoalTime
import BotAvoidGoalTime
import BotGetMapLocationGoal
import BotGetNextCampSpotGoal
import BotGetLevelItemGoal
import BotItemGoalInVisButNotVisible
import BotTouchingGoal
import BotChooseNBGItem
import BotChooseLTGItem
import BotGetSecondGoal
import BotGetTopGoal
import BotGoalName
import BotDumpGoalStack
import BotDumpAvoidGoals
import BotEmptyGoalStack
import BotPopGoal
import BotPushGoal
import BotRemoveFromAvoidGoals
import BotResetAvoidGoals
import BotResetGoalState
import GeneticParentsAndChildSelection
import BotSetChatName
import BotSetChatGender
import BotLoadChatFile
import BotReplaceSynonyms
import UnifyWhiteSpaces
import BotMatchVariable
import BotFindMatch
import StringContains
import BotGetChatMessage
import BotEnterChat
import BotChatLength
import BotReplyChat
import BotNumInitialChats
import BotInitialChat
import BotNumConsoleMessages
import BotNextConsoleMessage
import BotRemoveConsoleMessage
import BotQueueConsoleMessage
import BotFreeChatState
import BotAllocChatState
import BotShutdownChatAI
import BotSetupChatAI
import BotShutdownCharacters
import Characteristic_String
import Characteristic_BInteger
import Characteristic_Integer
import Characteristic_BFloat
import Characteristic_Float
import BotFreeCharacter
import BotLoadCharacter
import EA_Shutdown
import EA_Setup
import EA_ResetInput
import EA_GetInput
import EA_EndRegular
import EA_View
import EA_Move
import EA_DelayedJump
import EA_Jump
import EA_SelectWeapon
import EA_Use
import EA_Gesture
import EA_Talk
import EA_Respawn
import EA_Attack
import EA_MoveRight
import EA_MoveLeft
import EA_MoveBack
import EA_MoveForward
import EA_MoveDown
import EA_MoveUp
import EA_Walk
import EA_Crouch
import EA_Action
import EA_Command
import EA_SayTeam
import EA_Say
import GetBotLibAPI
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
import trep_debug
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
LABELV $755
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $754
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 98
byte 1 114
byte 1 101
byte 1 101
byte 1 100
byte 1 99
byte 1 121
byte 1 99
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $753
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $752
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 98
byte 1 114
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $751
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 99
byte 1 108
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $750
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 115
byte 1 111
byte 1 108
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $749
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 114
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $748
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 112
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $747
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $745
byte 1 99
byte 1 100
byte 1 100
byte 1 105
byte 1 114
byte 1 0
align 1
LABELV $742
byte 1 102
byte 1 115
byte 1 95
byte 1 99
byte 1 100
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $741
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 105
byte 1 114
byte 1 0
align 1
LABELV $738
byte 1 102
byte 1 115
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $737
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 100
byte 1 105
byte 1 114
byte 1 0
align 1
LABELV $734
byte 1 102
byte 1 115
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $729
byte 1 97
byte 1 97
byte 1 115
byte 1 111
byte 1 112
byte 1 116
byte 1 105
byte 1 109
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $726
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 97
byte 1 97
byte 1 115
byte 1 111
byte 1 112
byte 1 116
byte 1 105
byte 1 109
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $725
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 119
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $722
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 119
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $721
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 114
byte 1 101
byte 1 97
byte 1 99
byte 1 104
byte 1 97
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $718
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 114
byte 1 101
byte 1 97
byte 1 99
byte 1 104
byte 1 97
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $717
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 99
byte 1 108
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $714
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 99
byte 1 108
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $711
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 118
byte 1 105
byte 1 115
byte 1 117
byte 1 97
byte 1 108
byte 1 105
byte 1 122
byte 1 101
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 112
byte 1 97
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $710
byte 1 110
byte 1 111
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $707
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 110
byte 1 111
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $706
byte 1 108
byte 1 111
byte 1 103
byte 1 0
align 1
LABELV $704
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 100
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 111
byte 1 112
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $699
byte 1 109
byte 1 97
byte 1 120
byte 1 95
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $696
byte 1 109
byte 1 97
byte 1 120
byte 1 95
byte 1 97
byte 1 97
byte 1 115
byte 1 108
byte 1 105
byte 1 110
byte 1 107
byte 1 115
byte 1 0
align 1
LABELV $693
byte 1 115
byte 1 118
byte 1 95
byte 1 109
byte 1 97
byte 1 112
byte 1 67
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 115
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $692
byte 1 109
byte 1 97
byte 1 120
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
LABELV $691
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
LABELV $690
byte 1 56
byte 1 0
align 1
LABELV $687
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
LABELV $612
byte 1 50
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $611
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 110
byte 1 107
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $607
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 114
byte 1 111
byte 1 117
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 99
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 0
align 1
LABELV $606
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 114
byte 1 111
byte 1 117
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 99
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 0
align 1
LABELV $602
byte 1 48
byte 1 0
align 1
LABELV $601
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 100
byte 1 117
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $600
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 100
byte 1 117
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $569
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $542
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $527
byte 1 99
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $524
byte 1 65
byte 1 65
byte 1 83
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 105
byte 1 110
byte 1 105
byte 1 116
byte 1 105
byte 1 97
byte 1 108
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $521
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
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 117
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $514
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $513
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
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 0
align 1
LABELV $491
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
LABELV $488
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $485
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $482
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $479
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $476
byte 1 99
byte 1 115
byte 1 0
align 1
LABELV $473
byte 1 99
byte 1 112
byte 1 32
byte 1 0
align 1
LABELV $465
byte 1 66
byte 1 111
byte 1 116
byte 1 65
byte 1 73
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 117
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $325
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 98
byte 1 114
byte 1 101
byte 1 101
byte 1 100
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $322
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
byte 1 52
byte 1 32
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $316
byte 1 49
byte 1 0
align 1
LABELV $315
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 114
byte 1 101
byte 1 108
byte 1 111
byte 1 97
byte 1 100
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
byte 1 0
align 1
LABELV $308
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $307
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
LABELV $300
byte 1 0
align 1
LABELV $299
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 98
byte 1 114
byte 1 101
byte 1 101
byte 1 100
byte 1 119
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $250
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 97
byte 1 92
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $247
byte 1 114
byte 1 111
byte 1 97
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $245
byte 1 104
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $243
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $241
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $239
byte 1 114
byte 1 117
byte 1 115
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $237
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $235
byte 1 112
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $233
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $231
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $229
byte 1 103
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $227
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $225
byte 1 97
byte 1 99
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 110
byte 1 121
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $223
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $218
byte 1 70
byte 1 32
byte 1 0
align 1
LABELV $197
byte 1 94
byte 1 52
byte 1 66
byte 1 76
byte 1 85
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $195
byte 1 116
byte 1 0
align 1
LABELV $191
byte 1 110
byte 1 0
align 1
LABELV $181
byte 1 94
byte 1 49
byte 1 82
byte 1 69
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $177
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 114
byte 1 111
byte 1 97
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $176
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 104
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $174
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $172
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $170
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 114
byte 1 117
byte 1 115
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $168
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $166
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 112
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $164
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $162
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $160
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 103
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $158
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $156
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 97
byte 1 99
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 110
byte 1 121
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $154
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $149
byte 1 94
byte 1 52
byte 1 70
byte 1 32
byte 1 0
align 1
LABELV $148
byte 1 94
byte 1 49
byte 1 70
byte 1 32
byte 1 0
align 1
LABELV $141
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $140
byte 1 32
byte 1 0
align 1
LABELV $139
byte 1 76
byte 1 0
align 1
LABELV $134
byte 1 13
byte 1 97
byte 1 114
byte 1 101
byte 1 97
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 99
byte 1 108
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $133
byte 1 13
byte 1 94
byte 1 49
byte 1 83
byte 1 111
byte 1 108
byte 1 105
byte 1 100
byte 1 33
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
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $125
byte 1 13
byte 1 94
byte 1 49
byte 1 83
byte 1 79
byte 1 76
byte 1 73
byte 1 68
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 97
byte 1 0
align 1
LABELV $124
byte 1 13
byte 1 101
byte 1 109
byte 1 116
byte 1 112
byte 1 121
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 97
byte 1 0
align 1
LABELV $70
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $69
byte 1 94
byte 1 49
byte 1 69
byte 1 120
byte 1 105
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $67
byte 1 94
byte 1 49
byte 1 70
byte 1 97
byte 1 116
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $65
byte 1 94
byte 1 49
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $63
byte 1 94
byte 1 51
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $61
byte 1 37
byte 1 115
byte 1 0
