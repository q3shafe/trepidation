export BotGetItemTeamGoal
code
proc BotGetItemTeamGoal 12 12
file "../ai_cmd.c"
line 139
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:/*****************************************************************************
;5: * name:		ai_cmd.c
;6: *
;7: * desc:		Quake3 bot AI
;8: *
;9: * $Archive: /MissionPack/code/game/ai_cmd.c $
;10: *
;11: *****************************************************************************/
;12:
;13:#include "g_local.h"
;14:#include "botlib.h"
;15:#include "be_aas.h"
;16:#include "be_ea.h"
;17:#include "be_ai_char.h"
;18:#include "be_ai_chat.h"
;19:#include "be_ai_gen.h"
;20:#include "be_ai_goal.h"
;21:#include "be_ai_move.h"
;22:#include "be_ai_weap.h"
;23://
;24:#include "ai_main.h"
;25:#include "ai_dmq3.h"
;26:#include "ai_chat.h"
;27:#include "ai_cmd.h"
;28:#include "ai_dmnet.h"
;29:#include "ai_team.h"
;30://
;31:#include "chars.h"				//characteristics
;32:#include "inv.h"				//indexes into the inventory
;33:#include "syn.h"				//synonyms
;34:#include "match.h"				//string matching types and vars
;35:
;36:// for the voice chats
;37:#include "../../ui/menudef.h"
;38:
;39:int notleader[MAX_CLIENTS];
;40:
;41:#ifdef DEBUG
;42:/*
;43:==================
;44:BotPrintTeamGoal
;45:==================
;46:*/
;47:void BotPrintTeamGoal(bot_state_t *bs) {
;48:	char netname[MAX_NETNAME];
;49:	float t;
;50:
;51:	ClientName(bs->client, netname, sizeof(netname));
;52:	t = bs->teamgoal_time - FloatTime();
;53:	switch(bs->ltgtype) {
;54:		case LTG_TEAMHELP:
;55:		{
;56:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna help a team mate for %1.0f secs\n", netname, t);
;57:			break;
;58:		}
;59:		case LTG_TEAMACCOMPANY:
;60:		{
;61:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna accompany a team mate for %1.0f secs\n", netname, t);
;62:			break;
;63:		}
;64:		case LTG_GETFLAG:
;65:		{
;66:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna get the flag for %1.0f secs\n", netname, t);
;67:			break;
;68:		}
;69:		case LTG_RUSHBASE:
;70:		{
;71:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna rush to the base for %1.0f secs\n", netname, t);
;72:			break;
;73:		}
;74:		case LTG_RETURNFLAG:
;75:		{
;76:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna try to return the flag for %1.0f secs\n", netname, t);
;77:			break;
;78:		}
;79:#ifdef MISSIONPACK
;80:		case LTG_ATTACKENEMYBASE:
;81:		{
;82:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna attack the enemy base for %1.0f secs\n", netname, t);
;83:			break;
;84:		}
;85:		case LTG_HARVEST:
;86:		{
;87:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna harvest for %1.0f secs\n", netname, t);
;88:			break;
;89:		}
;90:#endif
;91:		case LTG_DEFENDKEYAREA:
;92:		{
;93:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna defend a key area for %1.0f secs\n", netname, t);
;94:			break;
;95:		}
;96:		case LTG_GETITEM:
;97:		{
;98:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna get an item for %1.0f secs\n", netname, t);
;99:			break;
;100:		}
;101:		case LTG_KILL:
;102:		{
;103:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna kill someone for %1.0f secs\n", netname, t);
;104:			break;
;105:		}
;106:		case LTG_CAMP:
;107:		case LTG_CAMPORDER:
;108:		{
;109:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna camp for %1.0f secs\n", netname, t);
;110:			break;
;111:		}
;112:		case LTG_PATROL:
;113:		{
;114:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna patrol for %1.0f secs\n", netname, t);
;115:			break;
;116:		}
;117:		default:
;118:		{
;119:			if (bs->ctfroam_time > FloatTime()) {
;120:				t = bs->ctfroam_time - FloatTime();
;121:				BotAI_Print(PRT_MESSAGE, "%s: I'm gonna roam for %1.0f secs\n", netname, t);
;122:			}
;123:			else {
;124:				BotAI_Print(PRT_MESSAGE, "%s: I've got a regular goal\n", netname);
;125:			}
;126:		}
;127:	}
;128:}
;129:#endif //DEBUG
;130:
;131:/*
;132:==================
;133:BotGetItemTeamGoal
;134:
;135:FIXME: add stuff like "upper rocket launcher"
;136:"the rl near the railgun", "lower grenade launcher" etc.
;137:==================
;138:*/
;139:int BotGetItemTeamGoal(char *goalname, bot_goal_t *goal) {
line 142
;140:	int i;
;141:
;142:	if (!strlen(goalname)) return qfalse;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $57
CNSTI4 0
RETI4
ADDRGP4 $56
JUMPV
LABELV $57
line 143
;143:	i = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
LABELV $59
line 144
;144:	do {
line 145
;145:		i = trap_BotGetLevelItemGoal(i, goalname, goal);
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 146
;146:		if (i > 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $62
line 148
;147:			//do NOT defend dropped items
;148:			if (goal->flags & GFL_DROPPED)
ADDRFP4 4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $64
line 149
;149:				continue;
ADDRGP4 $60
JUMPV
LABELV $64
line 150
;150:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $56
JUMPV
LABELV $62
line 152
;151:		}
;152:	} while(i > 0);
LABELV $60
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $59
line 153
;153:	return qfalse;
CNSTI4 0
RETI4
LABELV $56
endproc BotGetItemTeamGoal 12 12
export BotGetMessageTeamGoal
proc BotGetMessageTeamGoal 12 12
line 161
;154:}
;155:
;156:/*
;157:==================
;158:BotGetMessageTeamGoal
;159:==================
;160:*/
;161:int BotGetMessageTeamGoal(bot_state_t *bs, char *goalname, bot_goal_t *goal) {
line 164
;162:	bot_waypoint_t *cp;
;163:
;164:	if (BotGetItemTeamGoal(goalname, goal)) return qtrue;
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotGetItemTeamGoal
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $67
CNSTI4 1
RETI4
ADDRGP4 $66
JUMPV
LABELV $67
line 166
;165:
;166:	cp = BotFindWayPoint(bs->checkpoints, goalname);
ADDRFP4 0
INDIRP4
CNSTI4 9072
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotFindWayPoint
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 167
;167:	if (cp) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $69
line 168
;168:		memcpy(goal, &cp->goal, sizeof(bot_goal_t));
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 169
;169:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $66
JUMPV
LABELV $69
line 171
;170:	}
;171:	return qfalse;
CNSTI4 0
RETI4
LABELV $66
endproc BotGetMessageTeamGoal 12 12
export BotGetTime
proc BotGetTime 600 16
line 179
;172:}
;173:
;174:/*
;175:==================
;176:BotGetTime
;177:==================
;178:*/
;179:float BotGetTime(bot_match_t *match) {
line 185
;180:	bot_match_t timematch;
;181:	char timestring[MAX_MESSAGE_SIZE];
;182:	float t;
;183:
;184:	//if the matched string has a time
;185:	if (match->subtype & ST_TIME) {
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $72
line 187
;186:		//get the time string
;187:		trap_BotMatchVariable(match, TIME, timestring, MAX_MESSAGE_SIZE);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 189
;188:		//match it to find out if the time is in seconds or minutes
;189:		if (trap_BotFindMatch(timestring, &timematch, MTCONTEXT_TIME)) {
ADDRLP4 0
ARGP4
ADDRLP4 256
ARGP4
CNSTU4 8
ARGU4
ADDRLP4 588
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 588
INDIRI4
CNSTI4 0
EQI4 $74
line 190
;190:			if (timematch.type == MSG_FOREVER) {
ADDRLP4 256+256
INDIRI4
CNSTI4 107
NEI4 $76
line 191
;191:				t = 99999999.0f;
ADDRLP4 584
CNSTF4 1287568416
ASGNF4
line 192
;192:			}
ADDRGP4 $77
JUMPV
LABELV $76
line 193
;193:			else if (timematch.type == MSG_FORAWHILE) {
ADDRLP4 256+256
INDIRI4
CNSTI4 109
NEI4 $79
line 194
;194:				t = 10 * 60; // 10 minutes
ADDRLP4 584
CNSTF4 1142292480
ASGNF4
line 195
;195:			}
ADDRGP4 $80
JUMPV
LABELV $79
line 196
;196:			else if (timematch.type == MSG_FORALONGTIME) {
ADDRLP4 256+256
INDIRI4
CNSTI4 108
NEI4 $82
line 197
;197:				t = 30 * 60; // 30 minutes
ADDRLP4 584
CNSTF4 1155596288
ASGNF4
line 198
;198:			}
ADDRGP4 $83
JUMPV
LABELV $82
line 199
;199:			else {
line 200
;200:				trap_BotMatchVariable(&timematch, TIME, timestring, MAX_MESSAGE_SIZE);
ADDRLP4 256
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 201
;201:				if (timematch.type == MSG_MINUTES) t = atof(timestring) * 60;
ADDRLP4 256+256
INDIRI4
CNSTI4 105
NEI4 $85
ADDRLP4 0
ARGP4
ADDRLP4 592
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 584
CNSTF4 1114636288
ADDRLP4 592
INDIRF4
MULF4
ASGNF4
ADDRGP4 $86
JUMPV
LABELV $85
line 202
;202:				else if (timematch.type == MSG_SECONDS) t = atof(timestring);
ADDRLP4 256+256
INDIRI4
CNSTI4 106
NEI4 $88
ADDRLP4 0
ARGP4
ADDRLP4 596
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 584
ADDRLP4 596
INDIRF4
ASGNF4
ADDRGP4 $89
JUMPV
LABELV $88
line 203
;203:				else t = 0;
ADDRLP4 584
CNSTF4 0
ASGNF4
LABELV $89
LABELV $86
line 204
;204:			}
LABELV $83
LABELV $80
LABELV $77
line 206
;205:			//if there's a valid time
;206:			if (t > 0) return FloatTime() + t;
ADDRLP4 584
INDIRF4
CNSTF4 0
LEF4 $91
ADDRGP4 floattime
INDIRF4
ADDRLP4 584
INDIRF4
ADDF4
RETF4
ADDRGP4 $71
JUMPV
LABELV $91
line 207
;207:		}
LABELV $74
line 208
;208:	}
LABELV $72
line 209
;209:	return 0;
CNSTF4 0
RETF4
LABELV $71
endproc BotGetTime 600 16
bss
align 4
LABELV $94
skip 4
export FindClientByName
code
proc FindClientByName 1040 12
line 217
;210:}
;211:
;212:/*
;213:==================
;214:FindClientByName
;215:==================
;216:*/
;217:int FindClientByName(char *name) {
line 222
;218:	int i;
;219:	char buf[MAX_INFO_STRING];
;220:	static int maxclients;
;221:
;222:	if (!maxclients)
ADDRGP4 $94
INDIRI4
CNSTI4 0
NEI4 $95
line 223
;223:		maxclients = trap_Cvar_VariableIntegerValue("sv_maxclients");
ADDRGP4 $97
ARGP4
ADDRLP4 1028
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 $94
ADDRLP4 1028
INDIRI4
ASGNI4
LABELV $95
line 224
;224:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $101
JUMPV
LABELV $98
line 225
;225:		ClientName(i, buf, sizeof(buf));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 226
;226:		if (!Q_stricmp(buf, name)) return i;
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $102
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $93
JUMPV
LABELV $102
line 227
;227:	}
LABELV $99
line 224
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $101
ADDRLP4 0
INDIRI4
ADDRGP4 $94
INDIRI4
GEI4 $104
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $98
LABELV $104
line 228
;228:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $108
JUMPV
LABELV $105
line 229
;229:		ClientName(i, buf, sizeof(buf));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 230
;230:		if (stristr(buf, name)) return i;
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 stristr
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $109
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $93
JUMPV
LABELV $109
line 231
;231:	}
LABELV $106
line 228
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $108
ADDRLP4 0
INDIRI4
ADDRGP4 $94
INDIRI4
GEI4 $111
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $105
LABELV $111
line 232
;232:	return -1;
CNSTI4 -1
RETI4
LABELV $93
endproc FindClientByName 1040 12
bss
align 4
LABELV $113
skip 4
export FindEnemyByName
code
proc FindEnemyByName 1044 12
line 240
;233:}
;234:
;235:/*
;236:==================
;237:FindEnemyByName
;238:==================
;239:*/
;240:int FindEnemyByName(bot_state_t *bs, char *name) {
line 245
;241:	int i;
;242:	char buf[MAX_INFO_STRING];
;243:	static int maxclients;
;244:
;245:	if (!maxclients)
ADDRGP4 $113
INDIRI4
CNSTI4 0
NEI4 $114
line 246
;246:		maxclients = trap_Cvar_VariableIntegerValue("sv_maxclients");
ADDRGP4 $97
ARGP4
ADDRLP4 1028
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 $113
ADDRLP4 1028
INDIRI4
ASGNI4
LABELV $114
line 247
;247:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $119
JUMPV
LABELV $116
line 248
;248:		if (BotSameTeam(bs, i)) continue;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1032
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
EQI4 $120
ADDRGP4 $117
JUMPV
LABELV $120
line 249
;249:		ClientName(i, buf, sizeof(buf));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 250
;250:		if (!Q_stricmp(buf, name)) return i;
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $122
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $112
JUMPV
LABELV $122
line 251
;251:	}
LABELV $117
line 247
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $119
ADDRLP4 0
INDIRI4
ADDRGP4 $113
INDIRI4
GEI4 $124
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $116
LABELV $124
line 252
;252:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $128
JUMPV
LABELV $125
line 253
;253:		if (BotSameTeam(bs, i)) continue;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1036
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
EQI4 $129
ADDRGP4 $126
JUMPV
LABELV $129
line 254
;254:		ClientName(i, buf, sizeof(buf));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 255
;255:		if (stristr(buf, name)) return i;
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 stristr
CALLP4
ASGNP4
ADDRLP4 1040
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $131
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $112
JUMPV
LABELV $131
line 256
;256:	}
LABELV $126
line 252
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $128
ADDRLP4 0
INDIRI4
ADDRGP4 $113
INDIRI4
GEI4 $133
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $125
LABELV $133
line 257
;257:	return -1;
CNSTI4 -1
RETI4
LABELV $112
endproc FindEnemyByName 1044 12
bss
align 4
LABELV $135
skip 4
export NumPlayersOnSameTeam
code
proc NumPlayersOnSameTeam 1044 12
line 265
;258:}
;259:
;260:/*
;261:==================
;262:NumPlayersOnSameTeam
;263:==================
;264:*/
;265:int NumPlayersOnSameTeam(bot_state_t *bs) {
line 270
;266:	int i, num;
;267:	char buf[MAX_INFO_STRING];
;268:	static int maxclients;
;269:
;270:	if (!maxclients)
ADDRGP4 $135
INDIRI4
CNSTI4 0
NEI4 $136
line 271
;271:		maxclients = trap_Cvar_VariableIntegerValue("sv_maxclients");
ADDRGP4 $97
ARGP4
ADDRLP4 1032
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 $135
ADDRLP4 1032
INDIRI4
ASGNI4
LABELV $136
line 273
;272:
;273:	num = 0;
ADDRLP4 1028
CNSTI4 0
ASGNI4
line 274
;274:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $141
JUMPV
LABELV $138
line 275
;275:		trap_GetConfigstring(CS_PLAYERS+i, buf, MAX_INFO_STRING);
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
line 276
;276:		if (strlen(buf)) {
ADDRLP4 4
ARGP4
ADDRLP4 1036
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
EQI4 $142
line 277
;277:			if (BotSameTeam(bs, i+1)) num++;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1040
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
EQI4 $144
ADDRLP4 1028
ADDRLP4 1028
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $144
line 278
;278:		}
LABELV $142
line 279
;279:	}
LABELV $139
line 274
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $141
ADDRLP4 0
INDIRI4
ADDRGP4 $135
INDIRI4
GEI4 $146
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $138
LABELV $146
line 280
;280:	return num;
ADDRLP4 1028
INDIRI4
RETI4
LABELV $134
endproc NumPlayersOnSameTeam 1044 12
export BotGetPatrolWaypoints
proc BotGetPatrolWaypoints 676 16
line 288
;281:}
;282:
;283:/*
;284:==================
;285:TeamPlayIsOn
;286:==================
;287:*/
;288:int BotGetPatrolWaypoints(bot_state_t *bs, bot_match_t *match) {
line 295
;289:	char keyarea[MAX_MESSAGE_SIZE];
;290:	int patrolflags;
;291:	bot_waypoint_t *wp, *newwp, *newpatrolpoints;
;292:	bot_match_t keyareamatch;
;293:	bot_goal_t goal;
;294:
;295:	newpatrolpoints = NULL;
ADDRLP4 592
CNSTP4 0
ASGNP4
line 296
;296:	patrolflags = 0;
ADDRLP4 652
CNSTI4 0
ASGNI4
line 298
;297:	//
;298:	trap_BotMatchVariable(match, KEYAREA, keyarea, MAX_MESSAGE_SIZE);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
ADDRGP4 $149
JUMPV
LABELV $148
line 300
;299:	//
;300:	while(1) {
line 301
;301:		if (!trap_BotFindMatch(keyarea, &keyareamatch, MTCONTEXT_PATROLKEYAREA)) {
ADDRLP4 8
ARGP4
ADDRLP4 264
ARGP4
CNSTU4 64
ARGU4
ADDRLP4 656
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 656
INDIRI4
CNSTI4 0
NEI4 $151
line 302
;302:			trap_EA_SayTeam(bs->client, "what do you say?");
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $153
ARGP4
ADDRGP4 trap_EA_SayTeam
CALLV
pop
line 303
;303:			BotFreeWaypoints(newpatrolpoints);
ADDRLP4 592
INDIRP4
ARGP4
ADDRGP4 BotFreeWaypoints
CALLV
pop
line 304
;304:			bs->patrolpoints = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 9076
ADDP4
CNSTP4 0
ASGNP4
line 305
;305:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $147
JUMPV
LABELV $151
line 307
;306:		}
;307:		trap_BotMatchVariable(&keyareamatch, KEYAREA, keyarea, MAX_MESSAGE_SIZE);
ADDRLP4 264
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 308
;308:		if (!BotGetMessageTeamGoal(bs, keyarea, &goal)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 596
ARGP4
ADDRLP4 660
ADDRGP4 BotGetMessageTeamGoal
CALLI4
ASGNI4
ADDRLP4 660
INDIRI4
CNSTI4 0
NEI4 $154
line 311
;309:			//BotAI_BotInitialChat(bs, "cannotfind", keyarea, NULL);
;310:			//trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
;311:			BotFreeWaypoints(newpatrolpoints);
ADDRLP4 592
INDIRP4
ARGP4
ADDRGP4 BotFreeWaypoints
CALLV
pop
line 312
;312:			bs->patrolpoints = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 9076
ADDP4
CNSTP4 0
ASGNP4
line 313
;313:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $147
JUMPV
LABELV $154
line 316
;314:		}
;315:		//create a new waypoint
;316:		newwp = BotCreateWayPoint(keyarea, goal.origin, goal.areanum);
ADDRLP4 8
ARGP4
ADDRLP4 596
ARGP4
ADDRLP4 596+12
INDIRI4
ARGI4
ADDRLP4 664
ADDRGP4 BotCreateWayPoint
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 664
INDIRP4
ASGNP4
line 317
;317:		if (!newwp)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $157
line 318
;318:			break;
ADDRGP4 $150
JUMPV
LABELV $157
line 320
;319:		//add the waypoint to the patrol points
;320:		newwp->next = NULL;
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
CNSTP4 0
ASGNP4
line 321
;321:		for (wp = newpatrolpoints; wp && wp->next; wp = wp->next);
ADDRLP4 0
ADDRLP4 592
INDIRP4
ASGNP4
ADDRGP4 $162
JUMPV
LABELV $159
LABELV $160
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ASGNP4
LABELV $162
ADDRLP4 672
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 672
INDIRU4
EQU4 $163
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 672
INDIRU4
NEU4 $159
LABELV $163
line 322
;322:		if (!wp) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $164
line 323
;323:			newpatrolpoints = newwp;
ADDRLP4 592
ADDRLP4 4
INDIRP4
ASGNP4
line 324
;324:			newwp->prev = NULL;
ADDRLP4 4
INDIRP4
CNSTI4 96
ADDP4
CNSTP4 0
ASGNP4
line 325
;325:		}
ADDRGP4 $165
JUMPV
LABELV $164
line 326
;326:		else {
line 327
;327:			wp->next = newwp;
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 328
;328:			newwp->prev = wp;
ADDRLP4 4
INDIRP4
CNSTI4 96
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 329
;329:		}
LABELV $165
line 331
;330:		//
;331:		if (keyareamatch.subtype & ST_BACK) {
ADDRLP4 264+260
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $166
line 332
;332:			patrolflags = PATROL_LOOP;
ADDRLP4 652
CNSTI4 1
ASGNI4
line 333
;333:			break;
ADDRGP4 $150
JUMPV
LABELV $166
line 335
;334:		}
;335:		else if (keyareamatch.subtype & ST_REVERSE) {
ADDRLP4 264+260
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $169
line 336
;336:			patrolflags = PATROL_REVERSE;
ADDRLP4 652
CNSTI4 2
ASGNI4
line 337
;337:			break;
ADDRGP4 $150
JUMPV
LABELV $169
line 339
;338:		}
;339:		else if (keyareamatch.subtype & ST_MORE) {
ADDRLP4 264+260
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $150
line 340
;340:			trap_BotMatchVariable(&keyareamatch, MORE, keyarea, MAX_MESSAGE_SIZE);
ADDRLP4 264
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 341
;341:		}
line 342
;342:		else {
line 343
;343:			break;
LABELV $173
line 345
;344:		}
;345:	}
LABELV $149
line 300
ADDRGP4 $148
JUMPV
LABELV $150
line 347
;346:	//
;347:	if (!newpatrolpoints || !newpatrolpoints->next) {
ADDRLP4 660
CNSTU4 0
ASGNU4
ADDRLP4 592
INDIRP4
CVPU4 4
ADDRLP4 660
INDIRU4
EQU4 $177
ADDRLP4 592
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 660
INDIRU4
NEU4 $175
LABELV $177
line 348
;348:		trap_EA_SayTeam(bs->client, "I need more key points to patrol\n");
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $178
ARGP4
ADDRGP4 trap_EA_SayTeam
CALLV
pop
line 349
;349:		BotFreeWaypoints(newpatrolpoints);
ADDRLP4 592
INDIRP4
ARGP4
ADDRGP4 BotFreeWaypoints
CALLV
pop
line 350
;350:		newpatrolpoints = NULL;
ADDRLP4 592
CNSTP4 0
ASGNP4
line 351
;351:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $147
JUMPV
LABELV $175
line 354
;352:	}
;353:	//
;354:	BotFreeWaypoints(bs->patrolpoints);
ADDRFP4 0
INDIRP4
CNSTI4 9076
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotFreeWaypoints
CALLV
pop
line 355
;355:	bs->patrolpoints = newpatrolpoints;
ADDRFP4 0
INDIRP4
CNSTI4 9076
ADDP4
ADDRLP4 592
INDIRP4
ASGNP4
line 357
;356:	//
;357:	bs->curpatrolpoint = bs->patrolpoints;
ADDRLP4 664
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 664
INDIRP4
CNSTI4 9080
ADDP4
ADDRLP4 664
INDIRP4
CNSTI4 9076
ADDP4
INDIRP4
ASGNP4
line 358
;358:	bs->patrolflags = patrolflags;
ADDRFP4 0
INDIRP4
CNSTI4 9084
ADDP4
ADDRLP4 652
INDIRI4
ASGNI4
line 360
;359:	//
;360:	return qtrue;
CNSTI4 1
RETI4
LABELV $147
endproc BotGetPatrolWaypoints 676 16
export BotAddressedToBot
proc BotAddressedToBot 1572 16
line 368
;361:}
;362:
;363:/*
;364:==================
;365:BotAddressedToBot
;366:==================
;367:*/
;368:int BotAddressedToBot(bot_state_t *bs, bot_match_t *match) {
line 376
;369:	char addressedto[MAX_MESSAGE_SIZE];
;370:	char netname[MAX_MESSAGE_SIZE];
;371:	char name[MAX_MESSAGE_SIZE];
;372:	char botname[128];
;373:	int client;
;374:	bot_match_t addresseematch;
;375:
;376:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 840
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 377
;377:	client = ClientOnSameTeamFromName(bs, netname);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 840
ARGP4
ADDRLP4 1228
ADDRGP4 ClientOnSameTeamFromName
CALLI4
ASGNI4
ADDRLP4 1096
ADDRLP4 1228
INDIRI4
ASGNI4
line 378
;378:	if (client < 0) return qfalse;
ADDRLP4 1096
INDIRI4
CNSTI4 0
GEI4 $180
CNSTI4 0
RETI4
ADDRGP4 $179
JUMPV
LABELV $180
line 380
;379:	//if the message is addressed to someone
;380:	if (match->subtype & ST_ADDRESSED) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $182
line 381
;381:		trap_BotMatchVariable(match, ADDRESSEE, addressedto, sizeof(addressedto));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 584
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 383
;382:		//the name of this bot
;383:		ClientName(bs->client, botname, 128);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 1100
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 ClientName
CALLP4
pop
ADDRGP4 $185
JUMPV
LABELV $184
line 385
;384:		//
;385:		while(trap_BotFindMatch(addressedto, &addresseematch, MTCONTEXT_ADDRESSEE)) {
line 386
;386:			if (addresseematch.type == MSG_EVERYONE) {
ADDRLP4 0+256
INDIRI4
CNSTI4 101
NEI4 $187
line 387
;387:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $179
JUMPV
LABELV $187
line 389
;388:			}
;389:			else if (addresseematch.type == MSG_MULTIPLENAMES) {
ADDRLP4 0+256
INDIRI4
CNSTI4 102
NEI4 $190
line 390
;390:				trap_BotMatchVariable(&addresseematch, TEAMMATE, name, sizeof(name));
ADDRLP4 0
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 328
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 391
;391:				if (strlen(name)) {
ADDRLP4 328
ARGP4
ADDRLP4 1232
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1232
INDIRI4
CNSTI4 0
EQI4 $193
line 392
;392:					if (stristr(botname, name)) return qtrue;
ADDRLP4 1100
ARGP4
ADDRLP4 328
ARGP4
ADDRLP4 1236
ADDRGP4 stristr
CALLP4
ASGNP4
ADDRLP4 1236
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $195
CNSTI4 1
RETI4
ADDRGP4 $179
JUMPV
LABELV $195
line 393
;393:					if (stristr(bs->subteam, name)) return qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6980
ADDP4
ARGP4
ADDRLP4 328
ARGP4
ADDRLP4 1240
ADDRGP4 stristr
CALLP4
ASGNP4
ADDRLP4 1240
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $197
CNSTI4 1
RETI4
ADDRGP4 $179
JUMPV
LABELV $197
line 394
;394:				}
LABELV $193
line 395
;395:				trap_BotMatchVariable(&addresseematch, MORE, addressedto, MAX_MESSAGE_SIZE);
ADDRLP4 0
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 584
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 396
;396:			}
ADDRGP4 $191
JUMPV
LABELV $190
line 397
;397:			else {
line 398
;398:				trap_BotMatchVariable(&addresseematch, TEAMMATE, name, MAX_MESSAGE_SIZE);
ADDRLP4 0
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 328
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 399
;399:				if (strlen(name)) {
ADDRLP4 328
ARGP4
ADDRLP4 1232
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1232
INDIRI4
CNSTI4 0
EQI4 $186
line 400
;400:					if (stristr(botname, name)) return qtrue;
ADDRLP4 1100
ARGP4
ADDRLP4 328
ARGP4
ADDRLP4 1236
ADDRGP4 stristr
CALLP4
ASGNP4
ADDRLP4 1236
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $201
CNSTI4 1
RETI4
ADDRGP4 $179
JUMPV
LABELV $201
line 401
;401:					if (stristr(bs->subteam, name)) return qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6980
ADDP4
ARGP4
ADDRLP4 328
ARGP4
ADDRLP4 1240
ADDRGP4 stristr
CALLP4
ASGNP4
ADDRLP4 1240
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $186
CNSTI4 1
RETI4
ADDRGP4 $179
JUMPV
line 402
;402:				}
line 403
;403:				break;
LABELV $191
line 405
;404:			}
;405:		}
LABELV $185
line 385
ADDRLP4 584
ARGP4
ADDRLP4 0
ARGP4
CNSTU4 32
ARGU4
ADDRLP4 1232
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 1232
INDIRI4
CNSTI4 0
NEI4 $184
LABELV $186
line 408
;406:		//Com_sprintf(buf, sizeof(buf), "not addressed to me but %s", addressedto);
;407:		//trap_EA_Say(bs->client, buf);
;408:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $179
JUMPV
LABELV $182
line 410
;409:	}
;410:	else {
line 413
;411:		bot_match_t tellmatch;
;412:
;413:		tellmatch.type = 0;
ADDRLP4 1232+256
CNSTI4 0
ASGNI4
line 415
;414:		//if this message wasn't directed solely to this bot
;415:		if (!trap_BotFindMatch(match->string, &tellmatch, MTCONTEXT_REPLYCHAT) ||
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1232
ARGP4
CNSTU4 128
ARGU4
ADDRLP4 1560
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 1560
INDIRI4
CNSTI4 0
EQI4 $209
ADDRLP4 1232+256
INDIRI4
CNSTI4 202
EQI4 $206
LABELV $209
line 416
;416:				tellmatch.type != MSG_CHATTELL) {
line 418
;417:			//make sure not everyone reacts to this message
;418:			if (random() > (float ) 1.0 / (NumPlayersOnSameTeam(bs)-1)) return qfalse;
ADDRLP4 1564
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1568
ADDRGP4 NumPlayersOnSameTeam
CALLI4
ASGNI4
ADDRLP4 1564
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1065353216
ADDRLP4 1568
INDIRI4
CNSTI4 1
SUBI4
CVIF4 4
DIVF4
LEF4 $210
CNSTI4 0
RETI4
ADDRGP4 $179
JUMPV
LABELV $210
line 419
;419:		}
LABELV $206
line 420
;420:	}
line 421
;421:	return qtrue;
CNSTI4 1
RETI4
LABELV $179
endproc BotAddressedToBot 1572 16
export BotGPSToPosition
proc BotGPSToPosition 20 12
line 429
;422:}
;423:
;424:/*
;425:==================
;426:BotGPSToPosition
;427:==================
;428:*/
;429:int BotGPSToPosition(char *buf, vec3_t position) {
line 430
;430:	int i, j = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 433
;431:	int num, sign;
;432:
;433:	for (i = 0; i < 3; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $213
line 434
;434:		num = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $218
JUMPV
LABELV $217
line 435
;435:		while(buf[j] == ' ') j++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $218
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $217
line 436
;436:		if (buf[j] == '-') {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 45
NEI4 $220
line 437
;437:			j++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 438
;438:			sign = -1;
ADDRLP4 12
CNSTI4 -1
ASGNI4
line 439
;439:		}
ADDRGP4 $223
JUMPV
LABELV $220
line 440
;440:		else {
line 441
;441:			sign = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 442
;442:		}
ADDRGP4 $223
JUMPV
LABELV $222
line 443
;443:		while (buf[j]) {
line 444
;444:			if (buf[j] >= '0' && buf[j] <= '9') {
ADDRLP4 16
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 48
LTI4 $225
ADDRLP4 16
INDIRI4
CNSTI4 57
GTI4 $225
line 445
;445:				num = num * 10 + buf[j] - '0';
ADDRLP4 4
CNSTI4 10
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDI4
CNSTI4 48
SUBI4
ASGNI4
line 446
;446:				j++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 447
;447:			}
ADDRGP4 $226
JUMPV
LABELV $225
line 448
;448:			else {
line 449
;449:				j++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 450
;450:				break;
ADDRGP4 $224
JUMPV
LABELV $226
line 452
;451:			}
;452:		}
LABELV $223
line 443
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $222
LABELV $224
line 453
;453:		BotAI_Print(PRT_MESSAGE, "%d\n", sign * num);
CNSTI4 1
ARGI4
ADDRGP4 $227
ARGP4
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 454
;454:		position[i] = (float) sign * num;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ADDRLP4 12
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 455
;455:	}
LABELV $214
line 433
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 3
LTI4 $213
line 456
;456:	return qtrue;
CNSTI4 1
RETI4
LABELV $212
endproc BotGPSToPosition 20 12
export BotMatch_HelpAccompany
proc BotMatch_HelpAccompany 1272 16
line 464
;457:}
;458:
;459:/*
;460:==================
;461:BotMatch_HelpAccompany
;462:==================
;463:*/
;464:void BotMatch_HelpAccompany(bot_state_t *bs, bot_match_t *match) {
line 472
;465:	int client, other, areanum;
;466:	char teammate[MAX_MESSAGE_SIZE];
;467:	char netname[MAX_MESSAGE_SIZE];
;468:	char itemname[MAX_MESSAGE_SIZE];
;469:	bot_match_t teammatematch;
;470:	aas_entityinfo_t entinfo;
;471:
;472:	if (!TeamPlayIsOn()) return;
ADDRLP4 1248
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 1248
INDIRI4
CNSTI4 0
NEI4 $229
ADDRGP4 $228
JUMPV
LABELV $229
line 474
;473:	//if not addressed to this bot
;474:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1252
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 1252
INDIRI4
CNSTI4 0
NEI4 $231
ADDRGP4 $228
JUMPV
LABELV $231
line 476
;475:	//get the team mate name
;476:	trap_BotMatchVariable(match, TEAMMATE, teammate, sizeof(teammate));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 478
;477:	//get the client to help
;478:	if (trap_BotFindMatch(teammate, &teammatematch, MTCONTEXT_TEAMMATE) &&
ADDRLP4 260
ARGP4
ADDRLP4 656
ARGP4
CNSTU4 16
ARGU4
ADDRLP4 1256
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 1256
INDIRI4
CNSTI4 0
EQI4 $233
ADDRLP4 656+256
INDIRI4
CNSTI4 100
NEI4 $233
line 480
;479:			//if someone asks for him or herself
;480:			teammatematch.type == MSG_ME) {
line 482
;481:		//get the netname
;482:		trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 483
;483:		client = ClientFromName(netname);
ADDRLP4 4
ARGP4
ADDRLP4 1260
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1260
INDIRI4
ASGNI4
line 484
;484:		other = qfalse;
ADDRLP4 984
CNSTI4 0
ASGNI4
line 485
;485:	}
ADDRGP4 $234
JUMPV
LABELV $233
line 486
;486:	else {
line 488
;487:		//asked for someone else
;488:		client = FindClientByName(teammate);
ADDRLP4 260
ARGP4
ADDRLP4 1260
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1260
INDIRI4
ASGNI4
line 490
;489:		//if this is the bot self
;490:		if (client == bs->client) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $236
line 491
;491:			other = qfalse;
ADDRLP4 984
CNSTI4 0
ASGNI4
line 492
;492:		}
ADDRGP4 $237
JUMPV
LABELV $236
line 493
;493:		else if (!BotSameTeam(bs, client)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1264
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1264
INDIRI4
CNSTI4 0
NEI4 $238
line 495
;494:			//FIXME: say "I don't help the enemy"
;495:			return;
ADDRGP4 $228
JUMPV
LABELV $238
line 497
;496:		}
;497:		else {
line 498
;498:			other = qtrue;
ADDRLP4 984
CNSTI4 1
ASGNI4
line 499
;499:		}
LABELV $237
line 500
;500:	}
LABELV $234
line 502
;501:	//if the bot doesn't know who to help (FindClientByName returned -1)
;502:	if (client < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $240
line 503
;503:		if (other) BotAI_BotInitialChat(bs, "whois", teammate, NULL);
ADDRLP4 984
INDIRI4
CNSTI4 0
EQI4 $242
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $244
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRGP4 $243
JUMPV
LABELV $242
line 504
;504:		else BotAI_BotInitialChat(bs, "whois", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $244
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
LABELV $243
line 505
;505:		client = ClientFromName(netname);
ADDRLP4 4
ARGP4
ADDRLP4 1260
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1260
INDIRI4
ASGNI4
line 506
;506:		trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 507
;507:		return;
ADDRGP4 $228
JUMPV
LABELV $240
line 510
;508:	}
;509:	//don't help or accompany yourself
;510:	if (client == bs->client) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $245
line 511
;511:		return;
ADDRGP4 $228
JUMPV
LABELV $245
line 514
;512:	}
;513:	//
;514:	bs->teamgoal.entitynum = -1;
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
CNSTI4 -1
ASGNI4
line 515
;515:	BotEntityInfo(client, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 516
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 517
;516:	//if info is valid (in PVS)
;517:	if (entinfo.valid) {
ADDRLP4 516
INDIRI4
CNSTI4 0
EQI4 $247
line 518
;518:		areanum = BotPointAreaNum(entinfo.origin);
ADDRLP4 516+24
ARGP4
ADDRLP4 1260
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 988
ADDRLP4 1260
INDIRI4
ASGNI4
line 519
;519:		if (areanum) {// && trap_AAS_AreaReachability(areanum)) {
ADDRLP4 988
INDIRI4
CNSTI4 0
EQI4 $250
line 520
;520:			bs->teamgoal.entitynum = client;
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 521
;521:			bs->teamgoal.areanum = areanum;
ADDRFP4 0
INDIRP4
CNSTI4 6636
ADDP4
ADDRLP4 988
INDIRI4
ASGNI4
line 522
;522:			VectorCopy(entinfo.origin, bs->teamgoal.origin);
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ADDRLP4 516+24
INDIRB
ASGNB 12
line 523
;523:			VectorSet(bs->teamgoal.mins, -8, -8, -8);
ADDRFP4 0
INDIRP4
CNSTI4 6640
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6644
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6648
ADDP4
CNSTF4 3238002688
ASGNF4
line 524
;524:			VectorSet(bs->teamgoal.maxs, 8, 8, 8);
ADDRFP4 0
INDIRP4
CNSTI4 6652
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6656
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6660
ADDP4
CNSTF4 1090519040
ASGNF4
line 525
;525:		}
LABELV $250
line 526
;526:	}
LABELV $247
line 528
;527:	//if no teamgoal yet
;528:	if (bs->teamgoal.entitynum < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
INDIRI4
CNSTI4 0
GEI4 $253
line 530
;529:		//if near an item
;530:		if (match->subtype & ST_NEARITEM) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $255
line 532
;531:			//get the match variable
;532:			trap_BotMatchVariable(match, ITEM, itemname, sizeof(itemname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 992
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 534
;533:			//
;534:			if (!BotGetMessageTeamGoal(bs, itemname, &bs->teamgoal)) {
ADDRLP4 1260
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1260
INDIRP4
ARGP4
ADDRLP4 992
ARGP4
ADDRLP4 1260
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRLP4 1264
ADDRGP4 BotGetMessageTeamGoal
CALLI4
ASGNI4
ADDRLP4 1264
INDIRI4
CNSTI4 0
NEI4 $257
line 537
;535:				//BotAI_BotInitialChat(bs, "cannotfind", itemname, NULL);
;536:				//trap_BotEnterChat(bs->cs, bs->client, CHAT_TEAM);
;537:				return;
ADDRGP4 $228
JUMPV
LABELV $257
line 539
;538:			}
;539:		}
LABELV $255
line 540
;540:	}
LABELV $253
line 542
;541:	//
;542:	if (bs->teamgoal.entitynum < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
INDIRI4
CNSTI4 0
GEI4 $259
line 543
;543:		if (other) BotAI_BotInitialChat(bs, "whereis", teammate, NULL);
ADDRLP4 984
INDIRI4
CNSTI4 0
EQI4 $261
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $263
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRGP4 $262
JUMPV
LABELV $261
line 544
;544:		else BotAI_BotInitialChat(bs, "whereareyou", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $264
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
LABELV $262
line 545
;545:		client = ClientFromName(netname);
ADDRLP4 4
ARGP4
ADDRLP4 1260
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1260
INDIRI4
ASGNI4
line 546
;546:		trap_BotEnterChat(bs->cs, client, CHAT_TEAM);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 547
;547:		return;
ADDRGP4 $228
JUMPV
LABELV $259
line 550
;548:	}
;549:	//the team mate
;550:	bs->teammate = client;
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 552
;551:	//
;552:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 554
;553:	//
;554:	client = ClientFromName(netname);
ADDRLP4 4
ARGP4
ADDRLP4 1260
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1260
INDIRI4
ASGNI4
line 556
;555:	//the team mate who ordered
;556:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 557
;557:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 558
;558:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 560
;559:	//last time the team mate was assumed visible
;560:	bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6748
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 562
;561:	//set the time to send a message to the team mates
;562:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 1264
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 1264
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 564
;563:	//get the team goal time
;564:	bs->teamgoal_time = BotGetTime(match);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1268
ADDRGP4 BotGetTime
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRLP4 1268
INDIRF4
ASGNF4
line 566
;565:	//set the ltg type
;566:	if (match->type == MSG_HELP) {
ADDRFP4 4
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 3
NEI4 $265
line 567
;567:		bs->ltgtype = LTG_TEAMHELP;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 1
ASGNI4
line 568
;568:		if (!bs->teamgoal_time) bs->teamgoal_time = FloatTime() + TEAM_HELP_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
CNSTF4 0
NEF4 $266
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 569
;569:	}
ADDRGP4 $266
JUMPV
LABELV $265
line 570
;570:	else {
line 571
;571:		bs->ltgtype = LTG_TEAMACCOMPANY;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 2
ASGNI4
line 572
;572:		if (!bs->teamgoal_time) bs->teamgoal_time = FloatTime() + TEAM_ACCOMPANY_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
CNSTF4 0
NEF4 $269
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
LABELV $269
line 573
;573:		bs->formation_dist = 3.5 * 32;		//3.5 meter
ADDRFP4 0
INDIRP4
CNSTI4 7012
ADDP4
CNSTF4 1121976320
ASGNF4
line 574
;574:		bs->arrive_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
CNSTF4 0
ASGNF4
line 576
;575:		//
;576:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 578
;577:		// remember last ordered task
;578:		BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 579
;579:	}
LABELV $266
line 583
;580:#ifdef DEBUG
;581:	BotPrintTeamGoal(bs);
;582:#endif //DEBUG
;583:}
LABELV $228
endproc BotMatch_HelpAccompany 1272 16
export BotMatch_DefendKeyArea
proc BotMatch_DefendKeyArea 544 16
line 590
;584:
;585:/*
;586:==================
;587:BotMatch_DefendKeyArea
;588:==================
;589:*/
;590:void BotMatch_DefendKeyArea(bot_state_t *bs, bot_match_t *match) {
line 595
;591:	char itemname[MAX_MESSAGE_SIZE];
;592:	char netname[MAX_MESSAGE_SIZE];
;593:	int client;
;594:
;595:	if (!TeamPlayIsOn()) return;
ADDRLP4 516
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 516
INDIRI4
CNSTI4 0
NEI4 $272
ADDRGP4 $271
JUMPV
LABELV $272
line 597
;596:	//if not addressed to this bot
;597:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 520
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 520
INDIRI4
CNSTI4 0
NEI4 $274
ADDRGP4 $271
JUMPV
LABELV $274
line 599
;598:	//get the match variable
;599:	trap_BotMatchVariable(match, KEYAREA, itemname, sizeof(itemname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 601
;600:	//
;601:	if (!BotGetMessageTeamGoal(bs, itemname, &bs->teamgoal)) {
ADDRLP4 524
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 524
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 524
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRLP4 528
ADDRGP4 BotGetMessageTeamGoal
CALLI4
ASGNI4
ADDRLP4 528
INDIRI4
CNSTI4 0
NEI4 $276
line 604
;602:		//BotAI_BotInitialChat(bs, "cannotfind", itemname, NULL);
;603:		//trap_BotEnterChat(bs->cs, bs->client, CHAT_TEAM);
;604:		return;
ADDRGP4 $271
JUMPV
LABELV $276
line 607
;605:	}
;606:	//
;607:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 256
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 609
;608:	//
;609:	client = ClientFromName(netname);
ADDRLP4 256
ARGP4
ADDRLP4 532
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 512
ADDRLP4 532
INDIRI4
ASGNI4
line 611
;610:	//the team mate who ordered
;611:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 512
INDIRI4
ASGNI4
line 612
;612:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 613
;613:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 615
;614:	//set the time to send a message to the team mates
;615:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 536
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 536
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 617
;616:	//set the ltg type
;617:	bs->ltgtype = LTG_DEFENDKEYAREA;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 3
ASGNI4
line 619
;618:	//get the team goal time
;619:	bs->teamgoal_time = BotGetTime(match);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 540
ADDRGP4 BotGetTime
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRLP4 540
INDIRF4
ASGNF4
line 621
;620:	//set the team goal time
;621:	if (!bs->teamgoal_time) bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
CNSTF4 0
NEF4 $278
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
LABELV $278
line 623
;622:	//away from defending
;623:	bs->defendaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6144
ADDP4
CNSTF4 0
ASGNF4
line 625
;624:	//
;625:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 627
;626:	// remember last ordered task
;627:	BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 631
;628:#ifdef DEBUG
;629:	BotPrintTeamGoal(bs);
;630:#endif //DEBUG
;631:}
LABELV $271
endproc BotMatch_DefendKeyArea 544 16
export BotMatch_GetItem
proc BotMatch_GetItem 540 16
line 638
;632:
;633:/*
;634:==================
;635:BotMatch_GetItem
;636:==================
;637:*/
;638:void BotMatch_GetItem(bot_state_t *bs, bot_match_t *match) {
line 643
;639:	char itemname[MAX_MESSAGE_SIZE];
;640:	char netname[MAX_MESSAGE_SIZE];
;641:	int client;
;642:
;643:	if (!TeamPlayIsOn()) return;
ADDRLP4 516
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 516
INDIRI4
CNSTI4 0
NEI4 $281
ADDRGP4 $280
JUMPV
LABELV $281
line 645
;644:	//if not addressed to this bot
;645:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 520
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 520
INDIRI4
CNSTI4 0
NEI4 $283
ADDRGP4 $280
JUMPV
LABELV $283
line 647
;646:	//get the match variable
;647:	trap_BotMatchVariable(match, ITEM, itemname, sizeof(itemname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 649
;648:	//
;649:	if (!BotGetMessageTeamGoal(bs, itemname, &bs->teamgoal)) {
ADDRLP4 524
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 524
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 524
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRLP4 528
ADDRGP4 BotGetMessageTeamGoal
CALLI4
ASGNI4
ADDRLP4 528
INDIRI4
CNSTI4 0
NEI4 $285
line 652
;650:		//BotAI_BotInitialChat(bs, "cannotfind", itemname, NULL);
;651:		//trap_BotEnterChat(bs->cs, bs->client, CHAT_TEAM);
;652:		return;
ADDRGP4 $280
JUMPV
LABELV $285
line 654
;653:	}
;654:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 256
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 655
;655:	client = ClientOnSameTeamFromName(bs, netname);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRLP4 532
ADDRGP4 ClientOnSameTeamFromName
CALLI4
ASGNI4
ADDRLP4 512
ADDRLP4 532
INDIRI4
ASGNI4
line 657
;656:	//
;657:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 512
INDIRI4
ASGNI4
line 658
;658:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 659
;659:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 661
;660:	//set the time to send a message to the team mates
;661:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 536
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 536
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 663
;662:	//set the ltg type
;663:	bs->ltgtype = LTG_GETITEM;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 10
ASGNI4
line 665
;664:	//set the team goal time
;665:	bs->teamgoal_time = FloatTime() + TEAM_GETITEM_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 667
;666:	//
;667:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 671
;668:#ifdef DEBUG
;669:	BotPrintTeamGoal(bs);
;670:#endif //DEBUG
;671:}
LABELV $280
endproc BotMatch_GetItem 540 16
export BotMatch_Camp
proc BotMatch_Camp 688 16
line 678
;672:
;673:/*
;674:==================
;675:BotMatch_Camp
;676:==================
;677:*/
;678:void BotMatch_Camp(bot_state_t *bs, bot_match_t *match) {
line 684
;679:	int client, areanum;
;680:	char netname[MAX_MESSAGE_SIZE];
;681:	char itemname[MAX_MESSAGE_SIZE];
;682:	aas_entityinfo_t entinfo;
;683:
;684:	if (!TeamPlayIsOn()) return;
ADDRLP4 660
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 660
INDIRI4
CNSTI4 0
NEI4 $288
ADDRGP4 $287
JUMPV
LABELV $288
line 686
;685:	//if not addressed to this bot
;686:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 664
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 664
INDIRI4
CNSTI4 0
NEI4 $290
ADDRGP4 $287
JUMPV
LABELV $290
line 688
;687:	//
;688:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 690
;689:	//asked for someone else
;690:	client = FindClientByName(netname);
ADDRLP4 4
ARGP4
ADDRLP4 668
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 668
INDIRI4
ASGNI4
line 692
;691:	//if there's no valid client with this name
;692:	if (client < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $292
line 693
;693:		BotAI_BotInitialChat(bs, "whois", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $244
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 694
;694:		trap_BotEnterChat(bs->cs, bs->client, CHAT_TEAM);
ADDRLP4 672
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 672
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 672
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 695
;695:		return;
ADDRGP4 $287
JUMPV
LABELV $292
line 698
;696:	}
;697:	//get the match variable
;698:	trap_BotMatchVariable(match, KEYAREA, itemname, sizeof(itemname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 700
;699:	//in CTF it could be the base
;700:	if (match->subtype & ST_THERE) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $294
line 702
;701:		//camp at the spot the bot is currently standing
;702:		bs->teamgoal.entitynum = bs->entitynum;
ADDRLP4 672
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 672
INDIRP4
CNSTI4 6664
ADDP4
ADDRLP4 672
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 703
;703:		bs->teamgoal.areanum = bs->areanum;
ADDRLP4 676
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 676
INDIRP4
CNSTI4 6636
ADDP4
ADDRLP4 676
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ASGNI4
line 704
;704:		VectorCopy(bs->origin, bs->teamgoal.origin);
ADDRLP4 680
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 680
INDIRP4
CNSTI4 6624
ADDP4
ADDRLP4 680
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 705
;705:		VectorSet(bs->teamgoal.mins, -8, -8, -8);
ADDRFP4 0
INDIRP4
CNSTI4 6640
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6644
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6648
ADDP4
CNSTF4 3238002688
ASGNF4
line 706
;706:		VectorSet(bs->teamgoal.maxs, 8, 8, 8);
ADDRFP4 0
INDIRP4
CNSTI4 6652
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6656
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6660
ADDP4
CNSTF4 1090519040
ASGNF4
line 707
;707:	}
ADDRGP4 $295
JUMPV
LABELV $294
line 708
;708:	else if (match->subtype & ST_HERE) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $296
line 710
;709:		//if this is the bot self
;710:		if (client == bs->client) return;
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $298
ADDRGP4 $287
JUMPV
LABELV $298
line 712
;711:		//
;712:		bs->teamgoal.entitynum = -1;
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
CNSTI4 -1
ASGNI4
line 713
;713:		BotEntityInfo(client, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 516
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 715
;714:		//if info is valid (in PVS)
;715:		if (entinfo.valid) {
ADDRLP4 516
INDIRI4
CNSTI4 0
EQI4 $300
line 716
;716:			areanum = BotPointAreaNum(entinfo.origin);
ADDRLP4 516+24
ARGP4
ADDRLP4 672
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 656
ADDRLP4 672
INDIRI4
ASGNI4
line 717
;717:			if (areanum) {// && trap_AAS_AreaReachability(areanum)) {
ADDRLP4 656
INDIRI4
CNSTI4 0
EQI4 $303
line 720
;718:				//NOTE: just assume the bot knows where the person is
;719:				//if (BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, client)) {
;720:					bs->teamgoal.entitynum = client;
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 721
;721:					bs->teamgoal.areanum = areanum;
ADDRFP4 0
INDIRP4
CNSTI4 6636
ADDP4
ADDRLP4 656
INDIRI4
ASGNI4
line 722
;722:					VectorCopy(entinfo.origin, bs->teamgoal.origin);
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ADDRLP4 516+24
INDIRB
ASGNB 12
line 723
;723:					VectorSet(bs->teamgoal.mins, -8, -8, -8);
ADDRFP4 0
INDIRP4
CNSTI4 6640
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6644
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6648
ADDP4
CNSTF4 3238002688
ASGNF4
line 724
;724:					VectorSet(bs->teamgoal.maxs, 8, 8, 8);
ADDRFP4 0
INDIRP4
CNSTI4 6652
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6656
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6660
ADDP4
CNSTF4 1090519040
ASGNF4
line 726
;725:				//}
;726:			}
LABELV $303
line 727
;727:		}
LABELV $300
line 729
;728:		//if the other is not visible
;729:		if (bs->teamgoal.entitynum < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
INDIRI4
CNSTI4 0
GEI4 $297
line 730
;730:			BotAI_BotInitialChat(bs, "whereareyou", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $264
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 731
;731:			client = ClientFromName(netname);
ADDRLP4 4
ARGP4
ADDRLP4 672
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 672
INDIRI4
ASGNI4
line 732
;732:			trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 733
;733:			return;
ADDRGP4 $287
JUMPV
line 735
;734:		}
;735:	}
LABELV $296
line 736
;736:	else if (!BotGetMessageTeamGoal(bs, itemname, &bs->teamgoal)) {
ADDRLP4 672
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 672
INDIRP4
ARGP4
ADDRLP4 260
ARGP4
ADDRLP4 672
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRLP4 676
ADDRGP4 BotGetMessageTeamGoal
CALLI4
ASGNI4
ADDRLP4 676
INDIRI4
CNSTI4 0
NEI4 $308
line 740
;737:		//BotAI_BotInitialChat(bs, "cannotfind", itemname, NULL);
;738:		//client = ClientFromName(netname);
;739:		//trap_BotEnterChat(bs->cs, client, CHAT_TELL);
;740:		return;
ADDRGP4 $287
JUMPV
LABELV $308
LABELV $297
LABELV $295
line 743
;741:	}
;742:	//
;743:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 744
;744:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 745
;745:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 747
;746:	//set the time to send a message to the team mates
;747:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 680
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 680
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 749
;748:	//set the ltg type
;749:	bs->ltgtype = LTG_CAMPORDER;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 8
ASGNI4
line 751
;750:	//get the team goal time
;751:	bs->teamgoal_time = BotGetTime(match);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 684
ADDRGP4 BotGetTime
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRLP4 684
INDIRF4
ASGNF4
line 753
;752:	//set the team goal time
;753:	if (!bs->teamgoal_time) bs->teamgoal_time = FloatTime() + TEAM_CAMP_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
CNSTF4 0
NEF4 $310
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
LABELV $310
line 755
;754:	//not arrived yet
;755:	bs->arrive_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
CNSTF4 0
ASGNF4
line 757
;756:	//
;757:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 759
;758:	// remember last ordered task
;759:	BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 763
;760:#ifdef DEBUG
;761:	BotPrintTeamGoal(bs);
;762:#endif //DEBUG
;763:}
LABELV $287
endproc BotMatch_Camp 688 16
export BotMatch_Patrol
proc BotMatch_Patrol 284 16
line 770
;764:
;765:/*
;766:==================
;767:BotMatch_Patrol
;768:==================
;769:*/
;770:void BotMatch_Patrol(bot_state_t *bs, bot_match_t *match) {
line 774
;771:	char netname[MAX_MESSAGE_SIZE];
;772:	int client;
;773:
;774:	if (!TeamPlayIsOn()) return;
ADDRLP4 260
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $313
ADDRGP4 $312
JUMPV
LABELV $313
line 776
;775:	//if not addressed to this bot
;776:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $315
ADDRGP4 $312
JUMPV
LABELV $315
line 778
;777:	//get the patrol waypoints
;778:	if (!BotGetPatrolWaypoints(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 268
ADDRGP4 BotGetPatrolWaypoints
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
NEI4 $317
ADDRGP4 $312
JUMPV
LABELV $317
line 780
;779:	//
;780:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 782
;781:	//
;782:	client = FindClientByName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 272
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 272
INDIRI4
ASGNI4
line 784
;783:	//
;784:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 256
INDIRI4
ASGNI4
line 785
;785:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 786
;786:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 788
;787:	//set the time to send a message to the team mates
;788:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 276
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 276
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 790
;789:	//set the ltg type
;790:	bs->ltgtype = LTG_PATROL;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 9
ASGNI4
line 792
;791:	//get the team goal time
;792:	bs->teamgoal_time = BotGetTime(match);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 280
ADDRGP4 BotGetTime
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRLP4 280
INDIRF4
ASGNF4
line 794
;793:	//set the team goal time if not set already
;794:	if (!bs->teamgoal_time) bs->teamgoal_time = FloatTime() + TEAM_PATROL_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
CNSTF4 0
NEF4 $319
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
LABELV $319
line 796
;795:	//
;796:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 798
;797:	// remember last ordered task
;798:	BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 802
;799:#ifdef DEBUG
;800:	BotPrintTeamGoal(bs);
;801:#endif //DEBUG
;802:}
LABELV $312
endproc BotMatch_Patrol 284 16
export BotMatch_GetFlag
proc BotMatch_GetFlag 276 16
line 809
;803:
;804:/*
;805:==================
;806:BotMatch_GetFlag
;807:==================
;808:*/
;809:void BotMatch_GetFlag(bot_state_t *bs, bot_match_t *match) {
line 813
;810:	char netname[MAX_MESSAGE_SIZE];
;811:	int client;
;812:
;813:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $322
line 814
;814:		if (!ctf_redflag.areanum || !ctf_blueflag.areanum)
ADDRLP4 260
CNSTI4 0
ASGNI4
ADDRGP4 ctf_redflag+12
INDIRI4
ADDRLP4 260
INDIRI4
EQI4 $328
ADDRGP4 ctf_blueflag+12
INDIRI4
ADDRLP4 260
INDIRI4
NEI4 $323
LABELV $328
line 815
;815:			return;
ADDRGP4 $321
JUMPV
line 816
;816:	}
LABELV $322
line 818
;817:#ifdef MISSIONPACK
;818:	else if (gametype == GT_1FCTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 5
NEI4 $321
line 819
;819:		if (!ctf_neutralflag.areanum || !ctf_redflag.areanum || !ctf_blueflag.areanum)
ADDRLP4 260
CNSTI4 0
ASGNI4
ADDRGP4 ctf_neutralflag+12
INDIRI4
ADDRLP4 260
INDIRI4
EQI4 $337
ADDRGP4 ctf_redflag+12
INDIRI4
ADDRLP4 260
INDIRI4
EQI4 $337
ADDRGP4 ctf_blueflag+12
INDIRI4
ADDRLP4 260
INDIRI4
NEI4 $330
LABELV $337
line 820
;820:			return;
ADDRGP4 $321
JUMPV
line 821
;821:	}
line 823
;822:#endif
;823:	else {
line 824
;824:		return;
LABELV $330
LABELV $323
line 827
;825:	}
;826:	//if not addressed to this bot
;827:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 260
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $338
ADDRGP4 $321
JUMPV
LABELV $338
line 829
;828:	//
;829:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 831
;830:	//
;831:	client = FindClientByName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 264
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 264
INDIRI4
ASGNI4
line 833
;832:	//
;833:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 256
INDIRI4
ASGNI4
line 834
;834:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 835
;835:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 837
;836:	//set the time to send a message to the team mates
;837:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 268
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 268
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 839
;838:	//set the ltg type
;839:	bs->ltgtype = LTG_GETFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 4
ASGNI4
line 841
;840:	//set the team goal time
;841:	bs->teamgoal_time = FloatTime() + CTF_GETFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 843
;842:	// get an alternate route in ctf
;843:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $340
line 845
;844:		//get an alternative route goal towards the enemy base
;845:		BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 272
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 272
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 846
;846:	}
LABELV $340
line 848
;847:	//
;848:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 850
;849:	// remember last ordered task
;850:	BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 854
;851:#ifdef DEBUG
;852:	BotPrintTeamGoal(bs);
;853:#endif //DEBUG
;854:}
LABELV $321
endproc BotMatch_GetFlag 276 16
export BotMatch_AttackEnemyBase
proc BotMatch_AttackEnemyBase 276 16
line 861
;855:
;856:/*
;857:==================
;858:BotMatch_AttackEnemyBase
;859:==================
;860:*/
;861:void BotMatch_AttackEnemyBase(bot_state_t *bs, bot_match_t *match) {
line 865
;862:	char netname[MAX_MESSAGE_SIZE];
;863:	int client;
;864:
;865:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $343
line 866
;866:		BotMatch_GetFlag(bs, match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotMatch_GetFlag
CALLV
pop
line 867
;867:	}
ADDRGP4 $344
JUMPV
LABELV $343
line 869
;868:#ifdef MISSIONPACK
;869:	else if (gametype == GT_1FCTF || gametype == GT_OBELISK || gametype == GT_HARVESTER) {
ADDRLP4 260
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 5
EQI4 $348
ADDRLP4 260
INDIRI4
CNSTI4 6
EQI4 $348
ADDRLP4 260
INDIRI4
CNSTI4 7
NEI4 $342
LABELV $348
line 870
;870:		if (!redobelisk.areanum || !blueobelisk.areanum)
ADDRLP4 264
CNSTI4 0
ASGNI4
ADDRGP4 redobelisk+12
INDIRI4
ADDRLP4 264
INDIRI4
EQI4 $353
ADDRGP4 blueobelisk+12
INDIRI4
ADDRLP4 264
INDIRI4
NEI4 $346
LABELV $353
line 871
;871:			return;
ADDRGP4 $342
JUMPV
line 872
;872:	}
line 874
;873:#endif
;874:	else {
line 875
;875:		return;
LABELV $346
LABELV $344
line 878
;876:	}
;877:	//if not addressed to this bot
;878:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $354
ADDRGP4 $342
JUMPV
LABELV $354
line 880
;879:	//
;880:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 882
;881:	//
;882:	client = FindClientByName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 268
INDIRI4
ASGNI4
line 884
;883:	//
;884:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 256
INDIRI4
ASGNI4
line 885
;885:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 886
;886:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 888
;887:	//set the time to send a message to the team mates
;888:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 272
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 272
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 890
;889:	//set the ltg type
;890:	bs->ltgtype = LTG_ATTACKENEMYBASE;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 13
ASGNI4
line 892
;891:	//set the team goal time
;892:	bs->teamgoal_time = FloatTime() + TEAM_ATTACKENEMYBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 893
;893:	bs->attackaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6156
ADDP4
CNSTF4 0
ASGNF4
line 895
;894:	//
;895:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 897
;896:	// remember last ordered task
;897:	BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 901
;898:#ifdef DEBUG
;899:	BotPrintTeamGoal(bs);
;900:#endif //DEBUG
;901:}
LABELV $342
endproc BotMatch_AttackEnemyBase 276 16
export BotMatch_Harvest
proc BotMatch_Harvest 272 16
line 909
;902:
;903:#ifdef MISSIONPACK
;904:/*
;905:==================
;906:BotMatch_Harvest
;907:==================
;908:*/
;909:void BotMatch_Harvest(bot_state_t *bs, bot_match_t *match) {
line 913
;910:	char netname[MAX_MESSAGE_SIZE];
;911:	int client;
;912:
;913:	if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $356
line 914
;914:		if (!neutralobelisk.areanum || !redobelisk.areanum || !blueobelisk.areanum)
ADDRLP4 260
CNSTI4 0
ASGNI4
ADDRGP4 neutralobelisk+12
INDIRI4
ADDRLP4 260
INDIRI4
EQI4 $365
ADDRGP4 redobelisk+12
INDIRI4
ADDRLP4 260
INDIRI4
EQI4 $365
ADDRGP4 blueobelisk+12
INDIRI4
ADDRLP4 260
INDIRI4
NEI4 $358
LABELV $365
line 915
;915:			return;
ADDRGP4 $356
JUMPV
line 916
;916:	}
line 917
;917:	else {
line 918
;918:		return;
LABELV $358
line 921
;919:	}
;920:	//if not addressed to this bot
;921:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 260
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $366
ADDRGP4 $356
JUMPV
LABELV $366
line 923
;922:	//
;923:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 925
;924:	//
;925:	client = FindClientByName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 264
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 264
INDIRI4
ASGNI4
line 927
;926:	//
;927:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 256
INDIRI4
ASGNI4
line 928
;928:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 929
;929:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 931
;930:	//set the time to send a message to the team mates
;931:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 268
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 268
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 933
;932:	//set the ltg type
;933:	bs->ltgtype = LTG_HARVEST;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 12
ASGNI4
line 935
;934:	//set the team goal time
;935:	bs->teamgoal_time = FloatTime() + TEAM_HARVEST_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 936
;936:	bs->harvestaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6160
ADDP4
CNSTF4 0
ASGNF4
line 938
;937:	//
;938:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 940
;939:	// remember last ordered task
;940:	BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 944
;941:#ifdef DEBUG
;942:	BotPrintTeamGoal(bs);
;943:#endif //DEBUG
;944:}
LABELV $356
endproc BotMatch_Harvest 272 16
export BotMatch_RushBase
proc BotMatch_RushBase 276 16
line 952
;945:#endif
;946:
;947:/*
;948:==================
;949:BotMatch_RushBase
;950:==================
;951:*/
;952:void BotMatch_RushBase(bot_state_t *bs, bot_match_t *match) {
line 956
;953:	char netname[MAX_MESSAGE_SIZE];
;954:	int client;
;955:
;956:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $369
line 957
;957:		if (!ctf_redflag.areanum || !ctf_blueflag.areanum)
ADDRLP4 260
CNSTI4 0
ASGNI4
ADDRGP4 ctf_redflag+12
INDIRI4
ADDRLP4 260
INDIRI4
EQI4 $375
ADDRGP4 ctf_blueflag+12
INDIRI4
ADDRLP4 260
INDIRI4
NEI4 $370
LABELV $375
line 958
;958:			return;
ADDRGP4 $368
JUMPV
line 959
;959:	}
LABELV $369
line 961
;960:#ifdef MISSIONPACK
;961:	else if (gametype == GT_1FCTF || gametype == GT_HARVESTER) {
ADDRLP4 260
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 5
EQI4 $378
ADDRLP4 260
INDIRI4
CNSTI4 7
NEI4 $368
LABELV $378
line 962
;962:		if (!redobelisk.areanum || !blueobelisk.areanum)
ADDRLP4 264
CNSTI4 0
ASGNI4
ADDRGP4 redobelisk+12
INDIRI4
ADDRLP4 264
INDIRI4
EQI4 $383
ADDRGP4 blueobelisk+12
INDIRI4
ADDRLP4 264
INDIRI4
NEI4 $377
LABELV $383
line 963
;963:			return;
ADDRGP4 $368
JUMPV
line 964
;964:	}
line 966
;965:#endif
;966:	else {
line 967
;967:		return;
LABELV $377
LABELV $370
line 970
;968:	}
;969:	//if not addressed to this bot
;970:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $384
ADDRGP4 $368
JUMPV
LABELV $384
line 972
;971:	//
;972:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 974
;973:	//
;974:	client = FindClientByName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 268
INDIRI4
ASGNI4
line 976
;975:	//
;976:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 256
INDIRI4
ASGNI4
line 977
;977:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 978
;978:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 980
;979:	//set the time to send a message to the team mates
;980:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 272
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 272
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 982
;981:	//set the ltg type
;982:	bs->ltgtype = LTG_RUSHBASE;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 5
ASGNI4
line 984
;983:	//set the team goal time
;984:	bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 985
;985:	bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
CNSTF4 0
ASGNF4
line 987
;986:	//
;987:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 991
;988:#ifdef DEBUG
;989:	BotPrintTeamGoal(bs);
;990:#endif //DEBUG
;991:}
LABELV $368
endproc BotMatch_RushBase 276 16
export BotMatch_TaskPreference
proc BotMatch_TaskPreference 320 16
line 998
;992:
;993:/*
;994:==================
;995:BotMatch_TaskPreference
;996:==================
;997:*/
;998:void BotMatch_TaskPreference(bot_state_t *bs, bot_match_t *match) {
line 1003
;999:	char netname[MAX_NETNAME];
;1000:	char teammatename[MAX_MESSAGE_SIZE];
;1001:	int teammate, preference;
;1002:
;1003:	ClientName(bs->client, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1004
;1004:	if (Q_stricmp(netname, bs->teamleader) != 0) return;
ADDRLP4 260
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 300
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 300
INDIRI4
CNSTI4 0
EQI4 $387
ADDRGP4 $386
JUMPV
LABELV $387
line 1006
;1005:
;1006:	trap_BotMatchVariable(match, NETNAME, teammatename, sizeof(teammatename));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1007
;1007:	teammate = ClientFromName(teammatename);
ADDRLP4 4
ARGP4
ADDRLP4 304
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 304
INDIRI4
ASGNI4
line 1008
;1008:	if (teammate < 0) return;
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $389
ADDRGP4 $386
JUMPV
LABELV $389
line 1010
;1009:
;1010:	preference = BotGetTeamMateTaskPreference(bs, teammate);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 308
ADDRGP4 BotGetTeamMateTaskPreference
CALLI4
ASGNI4
ADDRLP4 296
ADDRLP4 308
INDIRI4
ASGNI4
line 1011
;1011:	switch(match->subtype)
ADDRLP4 312
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
ASGNI4
ADDRLP4 312
INDIRI4
CNSTI4 1
EQI4 $394
ADDRLP4 312
INDIRI4
CNSTI4 2
EQI4 $395
ADDRLP4 312
INDIRI4
CNSTI4 4
EQI4 $396
ADDRGP4 $391
JUMPV
line 1012
;1012:	{
LABELV $394
line 1014
;1013:		case ST_DEFENDER:
;1014:		{
line 1015
;1015:			preference &= ~TEAMTP_ATTACKER;
ADDRLP4 296
ADDRLP4 296
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 1016
;1016:			preference |= TEAMTP_DEFENDER;
ADDRLP4 296
ADDRLP4 296
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1017
;1017:			break;
ADDRGP4 $392
JUMPV
LABELV $395
line 1020
;1018:		}
;1019:		case ST_ATTACKER:
;1020:		{
line 1021
;1021:			preference &= ~TEAMTP_DEFENDER;
ADDRLP4 296
ADDRLP4 296
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 1022
;1022:			preference |= TEAMTP_ATTACKER;
ADDRLP4 296
ADDRLP4 296
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1023
;1023:			break;
ADDRGP4 $392
JUMPV
LABELV $396
line 1026
;1024:		}
;1025:		case ST_ROAMER:
;1026:		{
line 1027
;1027:			preference &= ~(TEAMTP_ATTACKER|TEAMTP_DEFENDER);
ADDRLP4 296
ADDRLP4 296
INDIRI4
CNSTI4 -4
BANDI4
ASGNI4
line 1028
;1028:			break;
LABELV $391
LABELV $392
line 1031
;1029:		}
;1030:	}
;1031:	BotSetTeamMateTaskPreference(bs, teammate, preference);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 296
INDIRI4
ARGI4
ADDRGP4 BotSetTeamMateTaskPreference
CALLV
pop
line 1033
;1032:	//
;1033:	EasyClientName(teammate, teammatename, sizeof(teammatename));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 1034
;1034:	BotAI_BotInitialChat(bs, "keepinmind", teammatename, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $397
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1035
;1035:	trap_BotEnterChat(bs->cs, teammate, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1036
;1036:	BotVoiceChatOnly(bs, teammate, VOICECHAT_YES);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $398
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
line 1037
;1037:	trap_EA_Action(bs->client, ACTION_AFFIRMATIVE);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1048576
ARGI4
ADDRGP4 trap_EA_Action
CALLV
pop
line 1038
;1038:}
LABELV $386
endproc BotMatch_TaskPreference 320 16
export BotMatch_ReturnFlag
proc BotMatch_ReturnFlag 276 16
line 1045
;1039:
;1040:/*
;1041:==================
;1042:BotMatch_ReturnFlag
;1043:==================
;1044:*/
;1045:void BotMatch_ReturnFlag(bot_state_t *bs, bot_match_t *match) {
line 1051
;1046:	char netname[MAX_MESSAGE_SIZE];
;1047:	int client;
;1048:
;1049:	//if not in CTF mode
;1050:	if (
;1051:		gametype != GT_CTF
ADDRLP4 260
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 4
EQI4 $400
ADDRLP4 260
INDIRI4
CNSTI4 5
EQI4 $400
line 1056
;1052:#ifdef MISSIONPACK
;1053:		&& gametype != GT_1FCTF
;1054:#endif
;1055:		)
;1056:		return;
ADDRGP4 $399
JUMPV
LABELV $400
line 1058
;1057:	//if not addressed to this bot
;1058:	if (!BotAddressedToBot(bs, match))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $402
line 1059
;1059:		return;
ADDRGP4 $399
JUMPV
LABELV $402
line 1061
;1060:	//
;1061:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1063
;1062:	//
;1063:	client = FindClientByName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 268
INDIRI4
ASGNI4
line 1065
;1064:	//
;1065:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 256
INDIRI4
ASGNI4
line 1066
;1066:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 1067
;1067:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1069
;1068:	//set the time to send a message to the team mates
;1069:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 272
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 272
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 1071
;1070:	//set the ltg type
;1071:	bs->ltgtype = LTG_RETURNFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 6
ASGNI4
line 1073
;1072:	//set the team goal time
;1073:	bs->teamgoal_time = FloatTime() + CTF_RETURNFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 1074
;1074:	bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
CNSTF4 0
ASGNF4
line 1076
;1075:	//
;1076:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1080
;1077:#ifdef DEBUG
;1078:	BotPrintTeamGoal(bs);
;1079:#endif //DEBUG
;1080:}
LABELV $399
endproc BotMatch_ReturnFlag 276 16
export BotMatch_JoinSubteam
proc BotMatch_JoinSubteam 528 16
line 1087
;1081:
;1082:/*
;1083:==================
;1084:BotMatch_JoinSubteam
;1085:==================
;1086:*/
;1087:void BotMatch_JoinSubteam(bot_state_t *bs, bot_match_t *match) {
line 1092
;1088:	char teammate[MAX_MESSAGE_SIZE];
;1089:	char netname[MAX_MESSAGE_SIZE];
;1090:	int client;
;1091:
;1092:	if (!TeamPlayIsOn()) return;
ADDRLP4 516
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 516
INDIRI4
CNSTI4 0
NEI4 $405
ADDRGP4 $404
JUMPV
LABELV $405
line 1094
;1093:	//if not addressed to this bot
;1094:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 520
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 520
INDIRI4
CNSTI4 0
NEI4 $407
ADDRGP4 $404
JUMPV
LABELV $407
line 1096
;1095:	//get the sub team name
;1096:	trap_BotMatchVariable(match, TEAMNAME, teammate, sizeof(teammate));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1098
;1097:	//set the sub team name
;1098:	strncpy(bs->subteam, teammate, 32);
ADDRFP4 0
INDIRP4
CNSTI4 6980
ADDP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 1099
;1099:	bs->subteam[31] = '\0';
ADDRFP4 0
INDIRP4
CNSTI4 7011
ADDP4
CNSTI1 0
ASGNI1
line 1101
;1100:	//
;1101:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 256
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1102
;1102:	BotAI_BotInitialChat(bs, "joinedteam", teammate, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $409
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1103
;1103:	client = ClientFromName(netname);
ADDRLP4 256
ARGP4
ADDRLP4 524
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 512
ADDRLP4 524
INDIRI4
ASGNI4
line 1104
;1104:	trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 512
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1105
;1105:}
LABELV $404
endproc BotMatch_JoinSubteam 528 16
export BotMatch_LeaveSubteam
proc BotMatch_LeaveSubteam 280 16
line 1112
;1106:
;1107:/*
;1108:==================
;1109:BotMatch_LeaveSubteam
;1110:==================
;1111:*/
;1112:void BotMatch_LeaveSubteam(bot_state_t *bs, bot_match_t *match) {
line 1116
;1113:	char netname[MAX_MESSAGE_SIZE];
;1114:	int client;
;1115:
;1116:	if (!TeamPlayIsOn()) return;
ADDRLP4 260
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $411
ADDRGP4 $410
JUMPV
LABELV $411
line 1118
;1117:	//if not addressed to this bot
;1118:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $413
ADDRGP4 $410
JUMPV
LABELV $413
line 1120
;1119:	//
;1120:	if (strlen(bs->subteam))
ADDRFP4 0
INDIRP4
CNSTI4 6980
ADDP4
ARGP4
ADDRLP4 268
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
EQI4 $415
line 1121
;1121:	{
line 1122
;1122:		BotAI_BotInitialChat(bs, "leftteam", bs->subteam, NULL);
ADDRLP4 272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 272
INDIRP4
ARGP4
ADDRGP4 $417
ARGP4
ADDRLP4 272
INDIRP4
CNSTI4 6980
ADDP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1123
;1123:		trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1124
;1124:		client = ClientFromName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 276
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 276
INDIRI4
ASGNI4
line 1125
;1125:		trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 256
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1126
;1126:	} //end if
LABELV $415
line 1127
;1127:	strcpy(bs->subteam, "");
ADDRFP4 0
INDIRP4
CNSTI4 6980
ADDP4
ARGP4
ADDRGP4 $418
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1128
;1128:}
LABELV $410
endproc BotMatch_LeaveSubteam 280 16
export BotMatch_WhichTeam
proc BotMatch_WhichTeam 16 16
line 1135
;1129:
;1130:/*
;1131:==================
;1132:BotMatch_LeaveSubteam
;1133:==================
;1134:*/
;1135:void BotMatch_WhichTeam(bot_state_t *bs, bot_match_t *match) {
line 1136
;1136:	if (!TeamPlayIsOn()) return;
ADDRLP4 0
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $420
ADDRGP4 $419
JUMPV
LABELV $420
line 1138
;1137:	//if not addressed to this bot
;1138:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $422
ADDRGP4 $419
JUMPV
LABELV $422
line 1140
;1139:	//
;1140:	if (strlen(bs->subteam)) {
ADDRFP4 0
INDIRP4
CNSTI4 6980
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $424
line 1141
;1141:		BotAI_BotInitialChat(bs, "inteam", bs->subteam, NULL);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $426
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 6980
ADDP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1142
;1142:	}
ADDRGP4 $425
JUMPV
LABELV $424
line 1143
;1143:	else {
line 1144
;1144:		BotAI_BotInitialChat(bs, "noteam", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $427
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1145
;1145:	}
LABELV $425
line 1146
;1146:	trap_BotEnterChat(bs->cs, bs->client, CHAT_TEAM);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1147
;1147:}
LABELV $419
endproc BotMatch_WhichTeam 16 16
export BotMatch_CheckPoint
proc BotMatch_CheckPoint 572 24
line 1154
;1148:
;1149:/*
;1150:==================
;1151:BotMatch_CheckPoint
;1152:==================
;1153:*/
;1154:void BotMatch_CheckPoint(bot_state_t *bs, bot_match_t *match) {
line 1161
;1155:	int areanum, client;
;1156:	char buf[MAX_MESSAGE_SIZE];
;1157:	char netname[MAX_MESSAGE_SIZE];
;1158:	vec3_t position;
;1159:	bot_waypoint_t *cp;
;1160:
;1161:	if (!TeamPlayIsOn()) return;
ADDRLP4 536
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 536
INDIRI4
CNSTI4 0
NEI4 $429
ADDRGP4 $428
JUMPV
LABELV $429
line 1163
;1162:	//
;1163:	trap_BotMatchVariable(match, POSITION, buf, MAX_MESSAGE_SIZE);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1164
;1164:	VectorClear(position);
ADDRLP4 540
CNSTF4 0
ASGNF4
ADDRLP4 4+8
ADDRLP4 540
INDIRF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 540
INDIRF4
ASGNF4
ADDRLP4 4
ADDRLP4 540
INDIRF4
ASGNF4
line 1166
;1165:	//
;1166:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 276
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1167
;1167:	client = ClientFromName(netname);
ADDRLP4 276
ARGP4
ADDRLP4 544
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 532
ADDRLP4 544
INDIRI4
ASGNI4
line 1169
;1168:	//BotGPSToPosition(buf, position);
;1169:	sscanf(buf, "%f %f %f", &position[0], &position[1], &position[2]);
ADDRLP4 16
ARGP4
ADDRGP4 $433
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 4+4
ARGP4
ADDRLP4 4+8
ARGP4
ADDRGP4 sscanf
CALLI4
pop
line 1170
;1170:	position[2] += 0.5;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 1171
;1171:	areanum = BotPointAreaNum(position);
ADDRLP4 4
ARGP4
ADDRLP4 548
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 272
ADDRLP4 548
INDIRI4
ASGNI4
line 1172
;1172:	if (!areanum) {
ADDRLP4 272
INDIRI4
CNSTI4 0
NEI4 $437
line 1173
;1173:		if (BotAddressedToBot(bs, match)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 552
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 552
INDIRI4
CNSTI4 0
EQI4 $428
line 1174
;1174:			BotAI_BotInitialChat(bs, "checkpoint_invalid", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $441
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1175
;1175:			trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 532
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1176
;1176:		}
line 1177
;1177:		return;
ADDRGP4 $428
JUMPV
LABELV $437
line 1180
;1178:	}
;1179:	//
;1180:	trap_BotMatchVariable(match, NAME, buf, MAX_MESSAGE_SIZE);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1182
;1181:	//check if there already exists a checkpoint with this name
;1182:	cp = BotFindWayPoint(bs->checkpoints, buf);
ADDRFP4 0
INDIRP4
CNSTI4 9072
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 552
ADDRGP4 BotFindWayPoint
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 552
INDIRP4
ASGNP4
line 1183
;1183:	if (cp) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $442
line 1184
;1184:		if (cp->next) cp->next->prev = cp->prev;
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $444
ADDRLP4 560
CNSTI4 96
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ADDRLP4 560
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 560
INDIRI4
ADDP4
INDIRP4
ASGNP4
LABELV $444
line 1185
;1185:		if (cp->prev) cp->prev->next = cp->next;
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $446
ADDRLP4 568
CNSTI4 92
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
ADDRLP4 568
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 568
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $447
JUMPV
LABELV $446
line 1186
;1186:		else bs->checkpoints = cp->next;
ADDRFP4 0
INDIRP4
CNSTI4 9072
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ASGNP4
LABELV $447
line 1187
;1187:		cp->inuse = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 1188
;1188:	}
LABELV $442
line 1190
;1189:	//create a new check point
;1190:	cp = BotCreateWayPoint(buf, position, areanum);
ADDRLP4 16
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 272
INDIRI4
ARGI4
ADDRLP4 556
ADDRGP4 BotCreateWayPoint
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 556
INDIRP4
ASGNP4
line 1192
;1191:	//add the check point to the bot's known chech points
;1192:	cp->next = bs->checkpoints;
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 9072
ADDP4
INDIRP4
ASGNP4
line 1193
;1193:	if (bs->checkpoints) bs->checkpoints->prev = cp;
ADDRFP4 0
INDIRP4
CNSTI4 9072
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $448
ADDRFP4 0
INDIRP4
CNSTI4 9072
ADDP4
INDIRP4
CNSTI4 96
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $448
line 1194
;1194:	bs->checkpoints = cp;
ADDRFP4 0
INDIRP4
CNSTI4 9072
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1196
;1195:	//
;1196:	if (BotAddressedToBot(bs, match)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 560
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 560
INDIRI4
CNSTI4 0
EQI4 $450
line 1197
;1197:		Com_sprintf(buf, sizeof(buf), "%1.0f %1.0f %1.0f", cp->goal.origin[0],
ADDRLP4 16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $452
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
ARGF4
ADDRGP4 Com_sprintf
CALLV
pop
line 1201
;1198:													cp->goal.origin[1],
;1199:													cp->goal.origin[2]);
;1200:
;1201:		BotAI_BotInitialChat(bs, "checkpoint_confirm", cp->name, buf, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $453
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 16
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1202
;1202:		trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 532
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1203
;1203:	}
LABELV $450
line 1204
;1204:}
LABELV $428
endproc BotMatch_CheckPoint 572 24
export BotMatch_FormationSpace
proc BotMatch_FormationSpace 280 16
line 1211
;1205:
;1206:/*
;1207:==================
;1208:BotMatch_FormationSpace
;1209:==================
;1210:*/
;1211:void BotMatch_FormationSpace(bot_state_t *bs, bot_match_t *match) {
line 1215
;1212:	char buf[MAX_MESSAGE_SIZE];
;1213:	float space;
;1214:
;1215:	if (!TeamPlayIsOn()) return;
ADDRLP4 260
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $455
ADDRGP4 $454
JUMPV
LABELV $455
line 1217
;1216:	//if not addressed to this bot
;1217:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $457
ADDRGP4 $454
JUMPV
LABELV $457
line 1219
;1218:	//
;1219:	trap_BotMatchVariable(match, NUMBER, buf, MAX_MESSAGE_SIZE);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1221
;1220:	//if it's the distance in feet
;1221:	if (match->subtype & ST_FEET) space = 0.3048 * 32 * atof(buf);
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $459
ADDRLP4 4
ARGP4
ADDRLP4 268
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
CNSTF4 1092357823
ADDRLP4 268
INDIRF4
MULF4
ASGNF4
ADDRGP4 $460
JUMPV
LABELV $459
line 1223
;1222:	//else it's in meters
;1223:	else space = 32 * atof(buf);
ADDRLP4 4
ARGP4
ADDRLP4 272
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
CNSTF4 1107296256
ADDRLP4 272
INDIRF4
MULF4
ASGNF4
LABELV $460
line 1225
;1224:	//check if the formation intervening space is valid
;1225:	if (space < 48 || space > 500) space = 100;
ADDRLP4 0
INDIRF4
CNSTF4 1111490560
LTF4 $463
ADDRLP4 0
INDIRF4
CNSTF4 1140457472
LEF4 $461
LABELV $463
ADDRLP4 0
CNSTF4 1120403456
ASGNF4
LABELV $461
line 1226
;1226:	bs->formation_dist = space;
ADDRFP4 0
INDIRP4
CNSTI4 7012
ADDP4
ADDRLP4 0
INDIRF4
ASGNF4
line 1227
;1227:}
LABELV $454
endproc BotMatch_FormationSpace 280 16
export BotMatch_Dismiss
proc BotMatch_Dismiss 272 16
line 1234
;1228:
;1229:/*
;1230:==================
;1231:BotMatch_Dismiss
;1232:==================
;1233:*/
;1234:void BotMatch_Dismiss(bot_state_t *bs, bot_match_t *match) {
line 1238
;1235:	char netname[MAX_MESSAGE_SIZE];
;1236:	int client;
;1237:
;1238:	if (!TeamPlayIsOn()) return;
ADDRLP4 260
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $465
ADDRGP4 $464
JUMPV
LABELV $465
line 1240
;1239:	//if not addressed to this bot
;1240:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $467
ADDRGP4 $464
JUMPV
LABELV $467
line 1241
;1241:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1242
;1242:	client = ClientFromName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 268
INDIRI4
ASGNI4
line 1244
;1243:	//
;1244:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 256
INDIRI4
ASGNI4
line 1246
;1245:	//
;1246:	bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 1247
;1247:	bs->lead_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6884
ADDP4
CNSTF4 0
ASGNF4
line 1248
;1248:	bs->lastgoal_ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
CNSTI4 0
ASGNI4
line 1250
;1249:	//
;1250:	BotAI_BotInitialChat(bs, "dismissed", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $469
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1251
;1251:	trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 256
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1252
;1252:}
LABELV $464
endproc BotMatch_Dismiss 272 16
export BotMatch_Suicide
proc BotMatch_Suicide 272 16
line 1259
;1253:
;1254:/*
;1255:==================
;1256:BotMatch_Suicide
;1257:==================
;1258:*/
;1259:void BotMatch_Suicide(bot_state_t *bs, bot_match_t *match) {
line 1263
;1260:	char netname[MAX_MESSAGE_SIZE];
;1261:	int client;
;1262:
;1263:	if (!TeamPlayIsOn()) return;
ADDRLP4 260
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $471
ADDRGP4 $470
JUMPV
LABELV $471
line 1265
;1264:	//if not addressed to this bot
;1265:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $473
ADDRGP4 $470
JUMPV
LABELV $473
line 1267
;1266:	//
;1267:	trap_EA_Command(bs->client, "kill");
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $475
ARGP4
ADDRGP4 trap_EA_Command
CALLV
pop
line 1269
;1268:	//
;1269:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1270
;1270:	client = ClientFromName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 268
INDIRI4
ASGNI4
line 1272
;1271:	//
;1272:	BotVoiceChat(bs, client, VOICECHAT_TAUNT);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
INDIRI4
ARGI4
ADDRGP4 $476
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 1273
;1273:	trap_EA_Action(bs->client, ACTION_AFFIRMATIVE);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1048576
ARGI4
ADDRGP4 trap_EA_Action
CALLV
pop
line 1274
;1274:}
LABELV $470
endproc BotMatch_Suicide 272 16
export BotMatch_StartTeamLeaderShip
proc BotMatch_StartTeamLeaderShip 268 16
line 1281
;1275:
;1276:/*
;1277:==================
;1278:BotMatch_StartTeamLeaderShip
;1279:==================
;1280:*/
;1281:void BotMatch_StartTeamLeaderShip(bot_state_t *bs, bot_match_t *match) {
line 1285
;1282:	int client;
;1283:	char teammate[MAX_MESSAGE_SIZE];
;1284:
;1285:	if (!TeamPlayIsOn()) return;
ADDRLP4 260
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $478
ADDRGP4 $477
JUMPV
LABELV $478
line 1287
;1286:	//if chats for him or herself
;1287:	if (match->subtype & ST_I) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $480
line 1289
;1288:		//get the team mate that will be the team leader
;1289:		trap_BotMatchVariable(match, NETNAME, teammate, sizeof(teammate));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1290
;1290:		strncpy(bs->teamleader, teammate, sizeof(bs->teamleader));
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 1291
;1291:		bs->teamleader[sizeof(bs->teamleader)] = '\0';
ADDRFP4 0
INDIRP4
CNSTI4 6900
CNSTU4 32
ADDI4
ADDP4
CNSTI1 0
ASGNI1
line 1292
;1292:	}
ADDRGP4 $481
JUMPV
LABELV $480
line 1294
;1293:	//chats for someone else
;1294:	else {
line 1296
;1295:		//get the team mate that will be the team leader
;1296:		trap_BotMatchVariable(match, TEAMMATE, teammate, sizeof(teammate));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1297
;1297:		client = FindClientByName(teammate);
ADDRLP4 0
ARGP4
ADDRLP4 264
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 264
INDIRI4
ASGNI4
line 1298
;1298:		if (client >= 0) ClientName(client, bs->teamleader, sizeof(bs->teamleader));
ADDRLP4 256
INDIRI4
CNSTI4 0
LTI4 $482
ADDRLP4 256
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 ClientName
CALLP4
pop
LABELV $482
line 1299
;1299:	}
LABELV $481
line 1300
;1300:}
LABELV $477
endproc BotMatch_StartTeamLeaderShip 268 16
export BotMatch_StopTeamLeaderShip
proc BotMatch_StopTeamLeaderShip 528 16
line 1307
;1301:
;1302:/*
;1303:==================
;1304:BotMatch_StopTeamLeaderShip
;1305:==================
;1306:*/
;1307:void BotMatch_StopTeamLeaderShip(bot_state_t *bs, bot_match_t *match) {
line 1312
;1308:	int client;
;1309:	char teammate[MAX_MESSAGE_SIZE];
;1310:	char netname[MAX_MESSAGE_SIZE];
;1311:
;1312:	if (!TeamPlayIsOn()) return;
ADDRLP4 516
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 516
INDIRI4
CNSTI4 0
NEI4 $485
ADDRGP4 $484
JUMPV
LABELV $485
line 1314
;1313:	//get the team mate that stops being the team leader
;1314:	trap_BotMatchVariable(match, TEAMMATE, teammate, sizeof(teammate));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1316
;1315:	//if chats for him or herself
;1316:	if (match->subtype & ST_I) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $487
line 1317
;1317:		trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1318
;1318:		client = FindClientByName(netname);
ADDRLP4 260
ARGP4
ADDRLP4 520
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 520
INDIRI4
ASGNI4
line 1319
;1319:	}
ADDRGP4 $488
JUMPV
LABELV $487
line 1321
;1320:	//chats for someone else
;1321:	else {
line 1322
;1322:		client = FindClientByName(teammate);
ADDRLP4 4
ARGP4
ADDRLP4 520
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 520
INDIRI4
ASGNI4
line 1323
;1323:	} //end else
LABELV $488
line 1324
;1324:	if (client >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $489
line 1325
;1325:		if (!Q_stricmp(bs->teamleader, ClientName(client, netname, sizeof(netname)))) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 520
ADDRGP4 ClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 520
INDIRP4
ARGP4
ADDRLP4 524
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 524
INDIRI4
CNSTI4 0
NEI4 $491
line 1326
;1326:			bs->teamleader[0] = '\0';
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
CNSTI1 0
ASGNI1
line 1327
;1327:			notleader[client] = qtrue;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 notleader
ADDP4
CNSTI4 1
ASGNI4
line 1328
;1328:		}
LABELV $491
line 1329
;1329:	}
LABELV $489
line 1330
;1330:}
LABELV $484
endproc BotMatch_StopTeamLeaderShip 528 16
export BotMatch_WhoIsTeamLeader
proc BotMatch_WhoIsTeamLeader 264 12
line 1337
;1331:
;1332:/*
;1333:==================
;1334:BotMatch_WhoIsTeamLeader
;1335:==================
;1336:*/
;1337:void BotMatch_WhoIsTeamLeader(bot_state_t *bs, bot_match_t *match) {
line 1340
;1338:	char netname[MAX_MESSAGE_SIZE];
;1339:
;1340:	if (!TeamPlayIsOn()) return;
ADDRLP4 256
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 0
NEI4 $494
ADDRGP4 $493
JUMPV
LABELV $494
line 1342
;1341:
;1342:	ClientName(bs->client, netname, sizeof(netname));
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
line 1344
;1343:	//if this bot IS the team leader
;1344:	if (!Q_stricmp(netname, bs->teamleader)) {
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 260
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $496
line 1345
;1345:		trap_EA_SayTeam(bs->client, "I'm the team leader\n");
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $498
ARGP4
ADDRGP4 trap_EA_SayTeam
CALLV
pop
line 1346
;1346:	}
LABELV $496
line 1347
;1347:}
LABELV $493
endproc BotMatch_WhoIsTeamLeader 264 12
export BotMatch_WhatAreYouDoing
proc BotMatch_WhatAreYouDoing 532 16
line 1354
;1348:
;1349:/*
;1350:==================
;1351:BotMatch_WhatAreYouDoing
;1352:==================
;1353:*/
;1354:void BotMatch_WhatAreYouDoing(bot_state_t *bs, bot_match_t *match) {
line 1360
;1355:	char netname[MAX_MESSAGE_SIZE];
;1356:	char goalname[MAX_MESSAGE_SIZE];
;1357:	int client;
;1358:
;1359:	//if not addressed to this bot
;1360:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 516
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 516
INDIRI4
CNSTI4 0
NEI4 $500
ADDRGP4 $499
JUMPV
LABELV $500
line 1362
;1361:	//
;1362:	switch(bs->ltgtype) {
ADDRLP4 520
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
ASGNI4
ADDRLP4 520
INDIRI4
CNSTI4 1
LTI4 $502
ADDRLP4 520
INDIRI4
CNSTI4 13
GTI4 $502
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $530-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $530
address $505
address $507
address $509
address $519
address $521
address $523
address $515
address $515
address $517
address $511
address $513
address $527
address $525
code
LABELV $505
line 1364
;1363:		case LTG_TEAMHELP:
;1364:		{
line 1365
;1365:			EasyClientName(bs->teammate, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 1366
;1366:			BotAI_BotInitialChat(bs, "helping", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $506
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1367
;1367:			break;
ADDRGP4 $503
JUMPV
LABELV $507
line 1370
;1368:		}
;1369:		case LTG_TEAMACCOMPANY:
;1370:		{
line 1371
;1371:			EasyClientName(bs->teammate, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 1372
;1372:			BotAI_BotInitialChat(bs, "accompanying", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $508
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1373
;1373:			break;
ADDRGP4 $503
JUMPV
LABELV $509
line 1376
;1374:		}
;1375:		case LTG_DEFENDKEYAREA:
;1376:		{
line 1377
;1377:			trap_BotGoalName(bs->teamgoal.number, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 1378
;1378:			BotAI_BotInitialChat(bs, "defending", goalname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $510
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1379
;1379:			break;
ADDRGP4 $503
JUMPV
LABELV $511
line 1382
;1380:		}
;1381:		case LTG_GETITEM:
;1382:		{
line 1383
;1383:			trap_BotGoalName(bs->teamgoal.number, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 1384
;1384:			BotAI_BotInitialChat(bs, "gettingitem", goalname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $512
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1385
;1385:			break;
ADDRGP4 $503
JUMPV
LABELV $513
line 1388
;1386:		}
;1387:		case LTG_KILL:
;1388:		{
line 1389
;1389:			ClientName(bs->teamgoal.entitynum, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 6664
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
line 1390
;1390:			BotAI_BotInitialChat(bs, "killing", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $514
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1391
;1391:			break;
ADDRGP4 $503
JUMPV
LABELV $515
line 1395
;1392:		}
;1393:		case LTG_CAMP:
;1394:		case LTG_CAMPORDER:
;1395:		{
line 1396
;1396:			BotAI_BotInitialChat(bs, "camping", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $516
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1397
;1397:			break;
ADDRGP4 $503
JUMPV
LABELV $517
line 1400
;1398:		}
;1399:		case LTG_PATROL:
;1400:		{
line 1401
;1401:			BotAI_BotInitialChat(bs, "patrolling", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $518
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1402
;1402:			break;
ADDRGP4 $503
JUMPV
LABELV $519
line 1405
;1403:		}
;1404:		case LTG_GETFLAG:
;1405:		{
line 1406
;1406:			BotAI_BotInitialChat(bs, "capturingflag", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $520
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1407
;1407:			break;
ADDRGP4 $503
JUMPV
LABELV $521
line 1410
;1408:		}
;1409:		case LTG_RUSHBASE:
;1410:		{
line 1411
;1411:			BotAI_BotInitialChat(bs, "rushingbase", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $522
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1412
;1412:			break;
ADDRGP4 $503
JUMPV
LABELV $523
line 1415
;1413:		}
;1414:		case LTG_RETURNFLAG:
;1415:		{
line 1416
;1416:			BotAI_BotInitialChat(bs, "returningflag", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $524
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1417
;1417:			break;
ADDRGP4 $503
JUMPV
LABELV $525
line 1421
;1418:		}
;1419:#ifdef MISSIONPACK
;1420:		case LTG_ATTACKENEMYBASE:
;1421:		{
line 1422
;1422:			BotAI_BotInitialChat(bs, "attackingenemybase", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $526
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1423
;1423:			break;
ADDRGP4 $503
JUMPV
LABELV $527
line 1426
;1424:		}
;1425:		case LTG_HARVEST:
;1426:		{
line 1427
;1427:			BotAI_BotInitialChat(bs, "harvesting", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $528
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1428
;1428:			break;
ADDRGP4 $503
JUMPV
LABELV $502
line 1432
;1429:		}
;1430:#endif
;1431:		default:
;1432:		{
line 1433
;1433:			BotAI_BotInitialChat(bs, "roaming", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $529
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1434
;1434:			break;
LABELV $503
line 1438
;1435:		}
;1436:	}
;1437:	//chat what the bot is doing
;1438:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1439
;1439:	client = ClientFromName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 528
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 528
INDIRI4
ASGNI4
line 1440
;1440:	trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 256
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1441
;1441:}
LABELV $499
endproc BotMatch_WhatAreYouDoing 532 16
export BotMatch_WhatIsMyCommand
proc BotMatch_WhatIsMyCommand 40 12
line 1448
;1442:
;1443:/*
;1444:==================
;1445:BotMatch_WhatIsMyCommand
;1446:==================
;1447:*/
;1448:void BotMatch_WhatIsMyCommand(bot_state_t *bs, bot_match_t *match) {
line 1451
;1449:	char netname[MAX_NETNAME];
;1450:
;1451:	ClientName(bs->client, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1452
;1452:	if (Q_stricmp(netname, bs->teamleader) != 0) return;
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $533
ADDRGP4 $532
JUMPV
LABELV $533
line 1453
;1453:	bs->forceorders = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 1
ASGNI4
line 1454
;1454:}
LABELV $532
endproc BotMatch_WhatIsMyCommand 40 12
export BotNearestVisibleItem
proc BotNearestVisibleItem 252 28
line 1461
;1455:
;1456:/*
;1457:==================
;1458:BotNearestVisibleItem
;1459:==================
;1460:*/
;1461:float BotNearestVisibleItem(bot_state_t *bs, char *itemname, bot_goal_t *goal) {
line 1469
;1462:	int i;
;1463:	char name[64];
;1464:	bot_goal_t tmpgoal;
;1465:	float dist, bestdist;
;1466:	vec3_t dir;
;1467:	bsp_trace_t trace;
;1468:
;1469:	bestdist = 999999;
ADDRLP4 140
CNSTF4 1232348144
ASGNF4
line 1470
;1470:	i = -1;
ADDRLP4 68
CNSTI4 -1
ASGNI4
LABELV $536
line 1471
;1471:	do {
line 1472
;1472:		i = trap_BotGetLevelItemGoal(i, itemname, &tmpgoal);
ADDRLP4 68
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 228
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 228
INDIRI4
ASGNI4
line 1473
;1473:		trap_BotGoalName(tmpgoal.number, name, sizeof(name));
ADDRLP4 0+44
INDIRI4
ARGI4
ADDRLP4 72
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 1474
;1474:		if (Q_stricmp(itemname, name) != 0)
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 232
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 232
INDIRI4
CNSTI4 0
EQI4 $540
line 1475
;1475:			continue;
ADDRGP4 $537
JUMPV
LABELV $540
line 1476
;1476:		VectorSubtract(tmpgoal.origin, bs->origin, dir);
ADDRLP4 236
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 0
INDIRF4
ADDRLP4 236
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 236
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56+8
ADDRLP4 0+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1477
;1477:		dist = VectorLength(dir);
ADDRLP4 56
ARGP4
ADDRLP4 240
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 136
ADDRLP4 240
INDIRF4
ASGNF4
line 1478
;1478:		if (dist < bestdist) {
ADDRLP4 136
INDIRF4
ADDRLP4 140
INDIRF4
GEF4 $546
line 1480
;1479:			//trace from start to end
;1480:			BotAI_Trace(&trace, bs->eye, NULL, NULL, tmpgoal.origin, bs->client, CONTENTS_SOLID|CONTENTS_PLAYERCLIP);
ADDRLP4 144
ARGP4
ADDRLP4 244
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 244
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 248
CNSTP4 0
ASGNP4
ADDRLP4 248
INDIRP4
ARGP4
ADDRLP4 248
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 244
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 65537
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 1481
;1481:			if (trace.fraction >= 1.0) {
ADDRLP4 144+8
INDIRF4
CNSTF4 1065353216
LTF4 $548
line 1482
;1482:				bestdist = dist;
ADDRLP4 140
ADDRLP4 136
INDIRF4
ASGNF4
line 1483
;1483:				memcpy(goal, &tmpgoal, sizeof(bot_goal_t));
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1484
;1484:			}
LABELV $548
line 1485
;1485:		}
LABELV $546
line 1486
;1486:	} while(i > 0);
LABELV $537
ADDRLP4 68
INDIRI4
CNSTI4 0
GTI4 $536
line 1487
;1487:	return bestdist;
ADDRLP4 140
INDIRF4
RETF4
LABELV $535
endproc BotNearestVisibleItem 252 28
lit
align 4
LABELV $552
address $553
address $554
address $555
address $556
address $557
address $558
address $559
address $560
address $561
address $562
address $563
address $564
address $565
address $566
address $567
address $568
address $569
address $570
address $571
address $572
address $573
address $574
address $575
address $576
address $577
address $578
address $579
address $580
byte 4 0
export BotMatch_WhereAreYou
code
proc BotMatch_WhereAreYou 496 20
line 1495
;1488:}
;1489:
;1490:/*
;1491:==================
;1492:BotMatch_WhereAreYou
;1493:==================
;1494:*/
;1495:void BotMatch_WhereAreYou(bot_state_t *bs, bot_match_t *match) {
line 1500
;1496:	float dist, bestdist;
;1497:	int i, bestitem, redtt, bluett, client;
;1498:	bot_goal_t goal;
;1499:	char netname[MAX_MESSAGE_SIZE];
;1500:	char *nearbyitems[] = {
ADDRLP4 8
ADDRGP4 $552
INDIRB
ASGNB 116
line 1534
;1501:		"Shotgun",
;1502:		"Grenade Launcher",
;1503:		"Singularity Cannon",
;1504:		"Gata Gun",
;1505:		"M42 Gauss Rifle",
;1506:		"Flame Thrower",
;1507:		"Devastator",
;1508:		"Quad Damage",
;1509:		"Regeneration",
;1510:		"Battle Suit",
;1511:		"Speed",
;1512:		"Invisibility",
;1513:		"Flight",
;1514:		"Armor",
;1515:		"Heavy Armor",
;1516:		"Red Flag",
;1517:		"Blue Flag",
;1518:#ifdef MISSIONPACK
;1519:		"Nailgun",
;1520:		"Prox Launcher",
;1521:		"Chaingun",
;1522:		"Scout",
;1523:		"Guard",
;1524:		"Doubler",
;1525:		"Ammo Regen",
;1526:		"Neutral Flag",
;1527:		"Red Obelisk",
;1528:		"Blue Obelisk",
;1529:		"Neutral Obelisk",
;1530:#endif
;1531:		NULL
;1532:	};
;1533:	//
;1534:	if (!TeamPlayIsOn())
ADDRLP4 456
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 456
INDIRI4
CNSTI4 0
NEI4 $581
line 1535
;1535:		return;
ADDRGP4 $551
JUMPV
LABELV $581
line 1537
;1536:	//if not addressed to this bot
;1537:	if (!BotAddressedToBot(bs, match))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 460
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 460
INDIRI4
CNSTI4 0
NEI4 $583
line 1538
;1538:		return;
ADDRGP4 $551
JUMPV
LABELV $583
line 1540
;1539:
;1540:	bestitem = -1;
ADDRLP4 184
CNSTI4 -1
ASGNI4
line 1541
;1541:	bestdist = 999999;
ADDRLP4 124
CNSTF4 1232348144
ASGNF4
line 1542
;1542:	for (i = 0; nearbyitems[i]; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $588
JUMPV
LABELV $585
line 1543
;1543:		dist = BotNearestVisibleItem(bs, nearbyitems[i], &goal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
ARGP4
ADDRLP4 128
ARGP4
ADDRLP4 464
ADDRGP4 BotNearestVisibleItem
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 464
INDIRF4
ASGNF4
line 1544
;1544:		if (dist < bestdist) {
ADDRLP4 4
INDIRF4
ADDRLP4 124
INDIRF4
GEF4 $589
line 1545
;1545:			bestdist = dist;
ADDRLP4 124
ADDRLP4 4
INDIRF4
ASGNF4
line 1546
;1546:			bestitem = i;
ADDRLP4 184
ADDRLP4 0
INDIRI4
ASGNI4
line 1547
;1547:		}
LABELV $589
line 1548
;1548:	}
LABELV $586
line 1542
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $588
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $585
line 1549
;1549:	if (bestitem != -1) {
ADDRLP4 184
INDIRI4
CNSTI4 -1
EQI4 $591
line 1550
;1550:		if (gametype == GT_CTF
ADDRLP4 464
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 464
INDIRI4
CNSTI4 4
EQI4 $595
ADDRLP4 464
INDIRI4
CNSTI4 5
NEI4 $593
LABELV $595
line 1554
;1551:#ifdef MISSIONPACK
;1552:			|| gametype == GT_1FCTF
;1553:#endif
;1554:			) {
line 1555
;1555:			redtt = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, ctf_redflag.areanum, TFL_DEFAULT);
ADDRLP4 468
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 468
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 468
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRGP4 ctf_redflag+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 472
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 444
ADDRLP4 472
INDIRI4
ASGNI4
line 1556
;1556:			bluett = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, ctf_blueflag.areanum, TFL_DEFAULT);
ADDRLP4 476
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 476
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 476
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRGP4 ctf_blueflag+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 480
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 448
ADDRLP4 480
INDIRI4
ASGNI4
line 1557
;1557:			if (redtt < (redtt + bluett) * 0.4) {
ADDRLP4 484
ADDRLP4 444
INDIRI4
ASGNI4
ADDRLP4 484
INDIRI4
CVIF4 4
CNSTF4 1053609165
ADDRLP4 484
INDIRI4
ADDRLP4 448
INDIRI4
ADDI4
CVIF4 4
MULF4
GEF4 $598
line 1558
;1558:				BotAI_BotInitialChat(bs, "teamlocation", nearbyitems[bestitem], "red", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $600
ARGP4
ADDRLP4 184
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
ARGP4
ADDRGP4 $601
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1559
;1559:			}
ADDRGP4 $594
JUMPV
LABELV $598
line 1560
;1560:			else if (bluett < (redtt + bluett) * 0.4) {
ADDRLP4 488
ADDRLP4 448
INDIRI4
ASGNI4
ADDRLP4 488
INDIRI4
CVIF4 4
CNSTF4 1053609165
ADDRLP4 444
INDIRI4
ADDRLP4 488
INDIRI4
ADDI4
CVIF4 4
MULF4
GEF4 $602
line 1561
;1561:				BotAI_BotInitialChat(bs, "teamlocation", nearbyitems[bestitem], "blue", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $600
ARGP4
ADDRLP4 184
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
ARGP4
ADDRGP4 $604
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1562
;1562:			}
ADDRGP4 $594
JUMPV
LABELV $602
line 1563
;1563:			else {
line 1564
;1564:				BotAI_BotInitialChat(bs, "location", nearbyitems[bestitem], NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $605
ARGP4
ADDRLP4 184
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1565
;1565:			}
line 1566
;1566:		}
ADDRGP4 $594
JUMPV
LABELV $593
line 1568
;1567:#ifdef MISSIONPACK
;1568:		else if (gametype == GT_OBELISK || gametype == GT_HARVESTER) {
ADDRLP4 468
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 468
INDIRI4
CNSTI4 6
EQI4 $608
ADDRLP4 468
INDIRI4
CNSTI4 7
NEI4 $606
LABELV $608
line 1569
;1569:			redtt = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, redobelisk.areanum, TFL_DEFAULT);
ADDRLP4 472
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 472
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 472
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRGP4 redobelisk+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 476
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 444
ADDRLP4 476
INDIRI4
ASGNI4
line 1570
;1570:			bluett = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, blueobelisk.areanum, TFL_DEFAULT);
ADDRLP4 480
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 480
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 480
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRGP4 blueobelisk+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 484
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 448
ADDRLP4 484
INDIRI4
ASGNI4
line 1571
;1571:			if (redtt < (redtt + bluett) * 0.4) {
ADDRLP4 488
ADDRLP4 444
INDIRI4
ASGNI4
ADDRLP4 488
INDIRI4
CVIF4 4
CNSTF4 1053609165
ADDRLP4 488
INDIRI4
ADDRLP4 448
INDIRI4
ADDI4
CVIF4 4
MULF4
GEF4 $611
line 1572
;1572:				BotAI_BotInitialChat(bs, "teamlocation", nearbyitems[bestitem], "red", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $600
ARGP4
ADDRLP4 184
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
ARGP4
ADDRGP4 $601
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1573
;1573:			}
ADDRGP4 $607
JUMPV
LABELV $611
line 1574
;1574:			else if (bluett < (redtt + bluett) * 0.4) {
ADDRLP4 492
ADDRLP4 448
INDIRI4
ASGNI4
ADDRLP4 492
INDIRI4
CVIF4 4
CNSTF4 1053609165
ADDRLP4 444
INDIRI4
ADDRLP4 492
INDIRI4
ADDI4
CVIF4 4
MULF4
GEF4 $613
line 1575
;1575:				BotAI_BotInitialChat(bs, "teamlocation", nearbyitems[bestitem], "blue", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $600
ARGP4
ADDRLP4 184
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
ARGP4
ADDRGP4 $604
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1576
;1576:			}
ADDRGP4 $607
JUMPV
LABELV $613
line 1577
;1577:			else {
line 1578
;1578:				BotAI_BotInitialChat(bs, "location", nearbyitems[bestitem], NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $605
ARGP4
ADDRLP4 184
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1579
;1579:			}
line 1580
;1580:		}
ADDRGP4 $607
JUMPV
LABELV $606
line 1582
;1581:#endif
;1582:		else {
line 1583
;1583:			BotAI_BotInitialChat(bs, "location", nearbyitems[bestitem], NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $605
ARGP4
ADDRLP4 184
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1584
;1584:		}
LABELV $607
LABELV $594
line 1585
;1585:		trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 188
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1586
;1586:		client = ClientFromName(netname);
ADDRLP4 188
ARGP4
ADDRLP4 472
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 452
ADDRLP4 472
INDIRI4
ASGNI4
line 1587
;1587:		trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 452
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1588
;1588:	}
LABELV $591
line 1589
;1589:}
LABELV $551
endproc BotMatch_WhereAreYou 496 20
export BotMatch_LeadTheWay
proc BotMatch_LeadTheWay 680 16
line 1596
;1590:
;1591:/*
;1592:==================
;1593:BotMatch_LeadTheWay
;1594:==================
;1595:*/
;1596:void BotMatch_LeadTheWay(bot_state_t *bs, bot_match_t *match) {
line 1601
;1597:	aas_entityinfo_t entinfo;
;1598:	char netname[MAX_MESSAGE_SIZE], teammate[MAX_MESSAGE_SIZE];
;1599:	int client, areanum, other;
;1600:
;1601:	if (!TeamPlayIsOn()) return;
ADDRLP4 664
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 664
INDIRI4
CNSTI4 0
NEI4 $616
ADDRGP4 $615
JUMPV
LABELV $616
line 1603
;1602:	//if not addressed to this bot
;1603:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 668
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 668
INDIRI4
CNSTI4 0
NEI4 $618
ADDRGP4 $615
JUMPV
LABELV $618
line 1605
;1604:	//if someone asks for someone else
;1605:	if (match->subtype & ST_SOMEONE) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $620
line 1607
;1606:		//get the team mate name
;1607:		trap_BotMatchVariable(match, TEAMMATE, teammate, sizeof(teammate));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 400
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1608
;1608:		client = FindClientByName(teammate);
ADDRLP4 400
ARGP4
ADDRLP4 672
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 672
INDIRI4
ASGNI4
line 1610
;1609:		//if this is the bot self
;1610:		if (client == bs->client) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $622
line 1611
;1611:			other = qfalse;
ADDRLP4 656
CNSTI4 0
ASGNI4
line 1612
;1612:		}
ADDRGP4 $621
JUMPV
LABELV $622
line 1613
;1613:		else if (!BotSameTeam(bs, client)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 676
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 676
INDIRI4
CNSTI4 0
NEI4 $624
line 1615
;1614:			//FIXME: say "I don't help the enemy"
;1615:			return;
ADDRGP4 $615
JUMPV
LABELV $624
line 1617
;1616:		}
;1617:		else {
line 1618
;1618:			other = qtrue;
ADDRLP4 656
CNSTI4 1
ASGNI4
line 1619
;1619:		}
line 1620
;1620:	}
ADDRGP4 $621
JUMPV
LABELV $620
line 1621
;1621:	else {
line 1623
;1622:		//get the netname
;1623:		trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 144
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1624
;1624:		client = ClientFromName(netname);
ADDRLP4 144
ARGP4
ADDRLP4 672
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 672
INDIRI4
ASGNI4
line 1625
;1625:		other = qfalse;
ADDRLP4 656
CNSTI4 0
ASGNI4
line 1626
;1626:	}
LABELV $621
line 1628
;1627:	//if the bot doesn't know who to help (FindClientByName returned -1)
;1628:	if (client < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $626
line 1629
;1629:		BotAI_BotInitialChat(bs, "whois", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $244
ARGP4
ADDRLP4 144
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1630
;1630:		trap_BotEnterChat(bs->cs, bs->client, CHAT_TEAM);
ADDRLP4 672
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 672
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 672
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1631
;1631:		return;
ADDRGP4 $615
JUMPV
LABELV $626
line 1634
;1632:	}
;1633:	//
;1634:	bs->lead_teamgoal.entitynum = -1;
ADDRFP4 0
INDIRP4
CNSTI4 6868
ADDP4
CNSTI4 -1
ASGNI4
line 1635
;1635:	BotEntityInfo(client, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1637
;1636:	//if info is valid (in PVS)
;1637:	if (entinfo.valid) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $628
line 1638
;1638:		areanum = BotPointAreaNum(entinfo.origin);
ADDRLP4 4+24
ARGP4
ADDRLP4 672
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 660
ADDRLP4 672
INDIRI4
ASGNI4
line 1639
;1639:		if (areanum) { // && trap_AAS_AreaReachability(areanum)) {
ADDRLP4 660
INDIRI4
CNSTI4 0
EQI4 $631
line 1640
;1640:			bs->lead_teamgoal.entitynum = client;
ADDRFP4 0
INDIRP4
CNSTI4 6868
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1641
;1641:			bs->lead_teamgoal.areanum = areanum;
ADDRFP4 0
INDIRP4
CNSTI4 6840
ADDP4
ADDRLP4 660
INDIRI4
ASGNI4
line 1642
;1642:			VectorCopy(entinfo.origin, bs->lead_teamgoal.origin);
ADDRFP4 0
INDIRP4
CNSTI4 6828
ADDP4
ADDRLP4 4+24
INDIRB
ASGNB 12
line 1643
;1643:			VectorSet(bs->lead_teamgoal.mins, -8, -8, -8);
ADDRFP4 0
INDIRP4
CNSTI4 6844
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6848
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6852
ADDP4
CNSTF4 3238002688
ASGNF4
line 1644
;1644:			VectorSet(bs->lead_teamgoal.maxs, 8, 8, 8);
ADDRFP4 0
INDIRP4
CNSTI4 6856
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6860
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6864
ADDP4
CNSTF4 1090519040
ASGNF4
line 1645
;1645:		}
LABELV $631
line 1646
;1646:	}
LABELV $628
line 1648
;1647:
;1648:	if (bs->teamgoal.entitynum < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
INDIRI4
CNSTI4 0
GEI4 $634
line 1649
;1649:		if (other) BotAI_BotInitialChat(bs, "whereis", teammate, NULL);
ADDRLP4 656
INDIRI4
CNSTI4 0
EQI4 $636
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $263
ARGP4
ADDRLP4 400
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRGP4 $637
JUMPV
LABELV $636
line 1650
;1650:		else BotAI_BotInitialChat(bs, "whereareyou", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $264
ARGP4
ADDRLP4 144
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
LABELV $637
line 1651
;1651:		trap_BotEnterChat(bs->cs, bs->client, CHAT_TEAM);
ADDRLP4 672
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 672
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 672
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1652
;1652:		return;
ADDRGP4 $615
JUMPV
LABELV $634
line 1654
;1653:	}
;1654:	bs->lead_teammate = client;
ADDRFP4 0
INDIRP4
CNSTI4 6824
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1655
;1655:	bs->lead_time = FloatTime() + TEAM_LEAD_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6884
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 1656
;1656:	bs->leadvisible_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6888
ADDP4
CNSTF4 0
ASGNF4
line 1657
;1657:	bs->leadmessage_time = -(FloatTime() + 2 * random());
ADDRLP4 672
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6892
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 672
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
NEGF4
ASGNF4
line 1658
;1658:}
LABELV $615
endproc BotMatch_LeadTheWay 680 16
export BotMatch_Kill
proc BotMatch_Kill 532 16
line 1665
;1659:
;1660:/*
;1661:==================
;1662:BotMatch_Kill
;1663:==================
;1664:*/
;1665:void BotMatch_Kill(bot_state_t *bs, bot_match_t *match) {
line 1670
;1666:	char enemy[MAX_MESSAGE_SIZE];
;1667:	char netname[MAX_MESSAGE_SIZE];
;1668:	int client;
;1669:
;1670:	if (!TeamPlayIsOn()) return;
ADDRLP4 516
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 516
INDIRI4
CNSTI4 0
NEI4 $639
ADDRGP4 $638
JUMPV
LABELV $639
line 1672
;1671:	//if not addressed to this bot
;1672:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 520
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 520
INDIRI4
CNSTI4 0
NEI4 $641
ADDRGP4 $638
JUMPV
LABELV $641
line 1674
;1673:
;1674:	trap_BotMatchVariable(match, ENEMY, enemy, sizeof(enemy));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1676
;1675:	//
;1676:	client = FindEnemyByName(bs, enemy);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 524
ADDRGP4 FindEnemyByName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 524
INDIRI4
ASGNI4
line 1677
;1677:	if (client < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $643
line 1678
;1678:		BotAI_BotInitialChat(bs, "whois", enemy, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $244
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1679
;1679:		trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1680
;1680:		client = ClientFromName(netname);
ADDRLP4 260
ARGP4
ADDRLP4 528
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 528
INDIRI4
ASGNI4
line 1681
;1681:		trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1682
;1682:		return;
ADDRGP4 $638
JUMPV
LABELV $643
line 1684
;1683:	}
;1684:	bs->teamgoal.entitynum = client;
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1686
;1685:	//set the time to send a message to the team mates
;1686:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 528
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 528
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 1688
;1687:	//set the ltg type
;1688:	bs->ltgtype = LTG_KILL;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 11
ASGNI4
line 1690
;1689:	//set the team goal time
;1690:	bs->teamgoal_time = FloatTime() + TEAM_KILL_SOMEONE;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 1692
;1691:	//
;1692:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1696
;1693:#ifdef DEBUG
;1694:	BotPrintTeamGoal(bs);
;1695:#endif //DEBUG
;1696:}
LABELV $638
endproc BotMatch_Kill 532 16
export BotMatch_CTF
proc BotMatch_CTF 176 16
line 1703
;1697:
;1698:/*
;1699:==================
;1700:BotMatch_CTF
;1701:==================
;1702:*/
;1703:void BotMatch_CTF(bot_state_t *bs, bot_match_t *match) {
line 1707
;1704:
;1705:	char flag[128], netname[MAX_NETNAME];
;1706:
;1707:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $646
line 1708
;1708:		trap_BotMatchVariable(match, FLAG, flag, sizeof(flag));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1709
;1709:		if (match->subtype & ST_GOTFLAG) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $648
line 1710
;1710:			if (!Q_stricmp(flag, "red")) {
ADDRLP4 0
ARGP4
ADDRGP4 $601
ARGP4
ADDRLP4 164
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
NEI4 $650
line 1711
;1711:				bs->redflagstatus = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
CNSTI4 1
ASGNI4
line 1712
;1712:				if (BotTeam(bs) == TEAM_BLUE) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 168
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 2
NEI4 $651
line 1713
;1713:					trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 128
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1714
;1714:					bs->flagcarrier = ClientFromName(netname);
ADDRLP4 128
ARGP4
ADDRLP4 172
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6972
ADDP4
ADDRLP4 172
INDIRI4
ASGNI4
line 1715
;1715:				}
line 1716
;1716:			}
ADDRGP4 $651
JUMPV
LABELV $650
line 1717
;1717:			else {
line 1718
;1718:				bs->blueflagstatus = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 1
ASGNI4
line 1719
;1719:				if (BotTeam(bs) == TEAM_RED) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 168
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 1
NEI4 $654
line 1720
;1720:					trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 128
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1721
;1721:					bs->flagcarrier = ClientFromName(netname);
ADDRLP4 128
ARGP4
ADDRLP4 172
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6972
ADDP4
ADDRLP4 172
INDIRI4
ASGNI4
line 1722
;1722:				}
LABELV $654
line 1723
;1723:			}
LABELV $651
line 1724
;1724:			bs->flagstatuschanged = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 1
ASGNI4
line 1725
;1725:			bs->lastflagcapture_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6944
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1726
;1726:		}
ADDRGP4 $647
JUMPV
LABELV $648
line 1727
;1727:		else if (match->subtype & ST_CAPTUREDFLAG) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $656
line 1728
;1728:			bs->redflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
CNSTI4 0
ASGNI4
line 1729
;1729:			bs->blueflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 0
ASGNI4
line 1730
;1730:			bs->flagcarrier = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6972
ADDP4
CNSTI4 0
ASGNI4
line 1731
;1731:			bs->flagstatuschanged = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 1
ASGNI4
line 1732
;1732:		}
ADDRGP4 $647
JUMPV
LABELV $656
line 1733
;1733:		else if (match->subtype & ST_RETURNEDFLAG) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $647
line 1734
;1734:			if (!Q_stricmp(flag, "red")) bs->redflagstatus = 0;
ADDRLP4 0
ARGP4
ADDRGP4 $601
ARGP4
ADDRLP4 164
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
NEI4 $660
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $661
JUMPV
LABELV $660
line 1735
;1735:			else bs->blueflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 0
ASGNI4
LABELV $661
line 1736
;1736:			bs->flagstatuschanged = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 1
ASGNI4
line 1737
;1737:		}
line 1738
;1738:	}
ADDRGP4 $647
JUMPV
LABELV $646
line 1740
;1739:#ifdef MISSIONPACK
;1740:	else if (gametype == GT_1FCTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 5
NEI4 $662
line 1741
;1741:		if (match->subtype & ST_1FCTFGOTFLAG) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 65535
BANDI4
CNSTI4 0
EQI4 $664
line 1742
;1742:			trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 128
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1743
;1743:			bs->flagcarrier = ClientFromName(netname);
ADDRLP4 128
ARGP4
ADDRLP4 164
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6972
ADDP4
ADDRLP4 164
INDIRI4
ASGNI4
line 1744
;1744:		}
LABELV $664
line 1745
;1745:	}
LABELV $662
LABELV $647
line 1747
;1746:#endif
;1747:}
LABELV $645
endproc BotMatch_CTF 176 16
export BotMatch_EnterGame
proc BotMatch_EnterGame 44 16
line 1749
;1748:
;1749:void BotMatch_EnterGame(bot_state_t *bs, bot_match_t *match) {
line 1753
;1750:	int client;
;1751:	char netname[MAX_NETNAME];
;1752:
;1753:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1754
;1754:	client = FindClientByName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 40
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 40
INDIRI4
ASGNI4
line 1755
;1755:	if (client >= 0) {
ADDRLP4 36
INDIRI4
CNSTI4 0
LTI4 $667
line 1756
;1756:		notleader[client] = qfalse;
ADDRLP4 36
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 notleader
ADDP4
CNSTI4 0
ASGNI4
line 1757
;1757:	}
LABELV $667
line 1761
;1758:	//NOTE: eliza chats will catch this
;1759:	//Com_sprintf(buf, sizeof(buf), "heya %s", netname);
;1760:	//EA_Say(bs->client, buf);
;1761:}
LABELV $666
endproc BotMatch_EnterGame 44 16
export BotMatch_NewLeader
proc BotMatch_NewLeader 48 16
line 1763
;1762:
;1763:void BotMatch_NewLeader(bot_state_t *bs, bot_match_t *match) {
line 1767
;1764:	int client;
;1765:	char netname[MAX_NETNAME];
;1766:
;1767:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1768
;1768:	client = FindClientByName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 40
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 40
INDIRI4
ASGNI4
line 1769
;1769:	if (!BotSameTeam(bs, client))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $670
line 1770
;1770:		return;
ADDRGP4 $669
JUMPV
LABELV $670
line 1771
;1771:	Q_strncpyz(bs->teamleader, netname, sizeof(bs->teamleader));
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1772
;1772:}
LABELV $669
endproc BotMatch_NewLeader 48 16
export BotMatchMessage
proc BotMatchMessage 336 12
line 1779
;1773:
;1774:/*
;1775:==================
;1776:BotMatchMessage
;1777:==================
;1778:*/
;1779:int BotMatchMessage(bot_state_t *bs, char *message) {
line 1782
;1780:	bot_match_t match;
;1781:
;1782:	match.type = 0;
ADDRLP4 0+256
CNSTI4 0
ASGNI4
line 1784
;1783:	//if it is an unknown message
;1784:	if (!trap_BotFindMatch(message, &match, MTCONTEXT_MISC
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTU4 262
ARGU4
ADDRLP4 328
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 328
INDIRI4
CNSTI4 0
NEI4 $674
line 1786
;1785:											|MTCONTEXT_INITIALTEAMCHAT
;1786:											|MTCONTEXT_CTF)) {
line 1787
;1787:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $672
JUMPV
LABELV $674
line 1790
;1788:	}
;1789:	//react to the found message
;1790:	switch(match.type)
ADDRLP4 332
ADDRLP4 0+256
INDIRI4
ASGNI4
ADDRLP4 332
INDIRI4
CNSTI4 1
LTI4 $676
ADDRLP4 332
INDIRI4
CNSTI4 33
GTI4 $714
ADDRLP4 332
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $715-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $715
address $710
address $709
address $679
address $679
address $680
address $686
address $683
address $701
address $702
address $703
address $677
address $704
address $691
address $692
address $695
address $697
address $698
address $677
address $700
address $681
address $694
address $682
address $707
address $690
address $708
address $706
address $687
address $705
address $693
address $688
address $684
address $685
address $712
code
LABELV $714
ADDRLP4 0+256
INDIRI4
CNSTI4 300
EQI4 $689
ADDRGP4 $676
JUMPV
line 1791
;1791:	{
LABELV $679
line 1794
;1792:		case MSG_HELP:					//someone calling for help
;1793:		case MSG_ACCOMPANY:				//someone calling for company
;1794:		{
line 1795
;1795:			BotMatch_HelpAccompany(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_HelpAccompany
CALLV
pop
line 1796
;1796:			break;
ADDRGP4 $677
JUMPV
LABELV $680
line 1799
;1797:		}
;1798:		case MSG_DEFENDKEYAREA:			//teamplay defend a key area
;1799:		{
line 1800
;1800:			BotMatch_DefendKeyArea(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_DefendKeyArea
CALLV
pop
line 1801
;1801:			break;
ADDRGP4 $677
JUMPV
LABELV $681
line 1804
;1802:		}
;1803:		case MSG_CAMP:					//camp somewhere
;1804:		{
line 1805
;1805:			BotMatch_Camp(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_Camp
CALLV
pop
line 1806
;1806:			break;
ADDRGP4 $677
JUMPV
LABELV $682
line 1809
;1807:		}
;1808:		case MSG_PATROL:				//patrol between several key areas
;1809:		{
line 1810
;1810:			BotMatch_Patrol(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_Patrol
CALLV
pop
line 1811
;1811:			break;
ADDRGP4 $677
JUMPV
LABELV $683
line 1815
;1812:		}
;1813:		//CTF & 1FCTF
;1814:		case MSG_GETFLAG:				//ctf get the enemy flag
;1815:		{
line 1816
;1816:			BotMatch_GetFlag(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_GetFlag
CALLV
pop
line 1817
;1817:			break;
ADDRGP4 $677
JUMPV
LABELV $684
line 1822
;1818:		}
;1819:#ifdef MISSIONPACK
;1820:		//CTF & 1FCTF & Obelisk & Harvester
;1821:		case MSG_ATTACKENEMYBASE:
;1822:		{
line 1823
;1823:			BotMatch_AttackEnemyBase(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_AttackEnemyBase
CALLV
pop
line 1824
;1824:			break;
ADDRGP4 $677
JUMPV
LABELV $685
line 1828
;1825:		}
;1826:		//Harvester
;1827:		case MSG_HARVEST:
;1828:		{
line 1829
;1829:			BotMatch_Harvest(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_Harvest
CALLV
pop
line 1830
;1830:			break;
ADDRGP4 $677
JUMPV
LABELV $686
line 1835
;1831:		}
;1832:#endif
;1833:		//CTF & 1FCTF & Harvester
;1834:		case MSG_RUSHBASE:				//ctf rush to the base
;1835:		{
line 1836
;1836:			BotMatch_RushBase(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_RushBase
CALLV
pop
line 1837
;1837:			break;
ADDRGP4 $677
JUMPV
LABELV $687
line 1841
;1838:		}
;1839:		//CTF & 1FCTF
;1840:		case MSG_RETURNFLAG:
;1841:		{
line 1842
;1842:			BotMatch_ReturnFlag(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_ReturnFlag
CALLV
pop
line 1843
;1843:			break;
ADDRGP4 $677
JUMPV
LABELV $688
line 1847
;1844:		}
;1845:		//CTF & 1FCTF & Obelisk & Harvester
;1846:		case MSG_TASKPREFERENCE:
;1847:		{
line 1848
;1848:			BotMatch_TaskPreference(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_TaskPreference
CALLV
pop
line 1849
;1849:			break;
ADDRGP4 $677
JUMPV
LABELV $689
line 1853
;1850:		}
;1851:		//CTF & 1FCTF
;1852:		case MSG_CTF:
;1853:		{
line 1854
;1854:			BotMatch_CTF(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_CTF
CALLV
pop
line 1855
;1855:			break;
ADDRGP4 $677
JUMPV
LABELV $690
line 1858
;1856:		}
;1857:		case MSG_GETITEM:
;1858:		{
line 1859
;1859:			BotMatch_GetItem(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_GetItem
CALLV
pop
line 1860
;1860:			break;
ADDRGP4 $677
JUMPV
LABELV $691
line 1863
;1861:		}
;1862:		case MSG_JOINSUBTEAM:			//join a sub team
;1863:		{
line 1864
;1864:			BotMatch_JoinSubteam(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_JoinSubteam
CALLV
pop
line 1865
;1865:			break;
ADDRGP4 $677
JUMPV
LABELV $692
line 1868
;1866:		}
;1867:		case MSG_LEAVESUBTEAM:			//leave a sub team
;1868:		{
line 1869
;1869:			BotMatch_LeaveSubteam(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_LeaveSubteam
CALLV
pop
line 1870
;1870:			break;
ADDRGP4 $677
JUMPV
LABELV $693
line 1873
;1871:		}
;1872:		case MSG_WHICHTEAM:
;1873:		{
line 1874
;1874:			BotMatch_WhichTeam(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_WhichTeam
CALLV
pop
line 1875
;1875:			break;
ADDRGP4 $677
JUMPV
LABELV $694
line 1878
;1876:		}
;1877:		case MSG_CHECKPOINT:			//remember a check point
;1878:		{
line 1879
;1879:			BotMatch_CheckPoint(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_CheckPoint
CALLV
pop
line 1880
;1880:			break;
ADDRGP4 $677
JUMPV
LABELV $695
line 1883
;1881:		}
;1882:		case MSG_CREATENEWFORMATION:	//start the creation of a new formation
;1883:		{
line 1884
;1884:			trap_EA_SayTeam(bs->client, "the part of my brain to create formations has been damaged");
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $696
ARGP4
ADDRGP4 trap_EA_SayTeam
CALLV
pop
line 1885
;1885:			break;
ADDRGP4 $677
JUMPV
LABELV $697
line 1888
;1886:		}
;1887:		case MSG_FORMATIONPOSITION:		//tell someone his/her position in the formation
;1888:		{
line 1889
;1889:			trap_EA_SayTeam(bs->client, "the part of my brain to create formations has been damaged");
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $696
ARGP4
ADDRGP4 trap_EA_SayTeam
CALLV
pop
line 1890
;1890:			break;
ADDRGP4 $677
JUMPV
LABELV $698
line 1893
;1891:		}
;1892:		case MSG_FORMATIONSPACE:		//set the formation space
;1893:		{
line 1894
;1894:			BotMatch_FormationSpace(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_FormationSpace
CALLV
pop
line 1895
;1895:			break;
ADDRGP4 $677
JUMPV
line 1898
;1896:		}
;1897:		case MSG_DOFORMATION:			//form a certain formation
;1898:		{
line 1899
;1899:			break;
LABELV $700
line 1902
;1900:		}
;1901:		case MSG_DISMISS:				//dismiss someone
;1902:		{
line 1903
;1903:			BotMatch_Dismiss(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_Dismiss
CALLV
pop
line 1904
;1904:			break;
ADDRGP4 $677
JUMPV
LABELV $701
line 1907
;1905:		}
;1906:		case MSG_STARTTEAMLEADERSHIP:	//someone will become the team leader
;1907:		{
line 1908
;1908:			BotMatch_StartTeamLeaderShip(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_StartTeamLeaderShip
CALLV
pop
line 1909
;1909:			break;
ADDRGP4 $677
JUMPV
LABELV $702
line 1912
;1910:		}
;1911:		case MSG_STOPTEAMLEADERSHIP:	//someone will stop being the team leader
;1912:		{
line 1913
;1913:			BotMatch_StopTeamLeaderShip(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_StopTeamLeaderShip
CALLV
pop
line 1914
;1914:			break;
ADDRGP4 $677
JUMPV
LABELV $703
line 1917
;1915:		}
;1916:		case MSG_WHOISTEAMLAEDER:
;1917:		{
line 1918
;1918:			BotMatch_WhoIsTeamLeader(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_WhoIsTeamLeader
CALLV
pop
line 1919
;1919:			break;
ADDRGP4 $677
JUMPV
LABELV $704
line 1922
;1920:		}
;1921:		case MSG_WHATAREYOUDOING:		//ask a bot what he/she is doing
;1922:		{
line 1923
;1923:			BotMatch_WhatAreYouDoing(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_WhatAreYouDoing
CALLV
pop
line 1924
;1924:			break;
ADDRGP4 $677
JUMPV
LABELV $705
line 1927
;1925:		}
;1926:		case MSG_WHATISMYCOMMAND:
;1927:		{
line 1928
;1928:			BotMatch_WhatIsMyCommand(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_WhatIsMyCommand
CALLV
pop
line 1929
;1929:			break;
ADDRGP4 $677
JUMPV
LABELV $706
line 1932
;1930:		}
;1931:		case MSG_WHEREAREYOU:
;1932:		{
line 1933
;1933:			BotMatch_WhereAreYou(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_WhereAreYou
CALLV
pop
line 1934
;1934:			break;
ADDRGP4 $677
JUMPV
LABELV $707
line 1937
;1935:		}
;1936:		case MSG_LEADTHEWAY:
;1937:		{
line 1938
;1938:			BotMatch_LeadTheWay(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_LeadTheWay
CALLV
pop
line 1939
;1939:			break;
ADDRGP4 $677
JUMPV
LABELV $708
line 1942
;1940:		}
;1941:		case MSG_KILL:
;1942:		{
line 1943
;1943:			BotMatch_Kill(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_Kill
CALLV
pop
line 1944
;1944:			break;
ADDRGP4 $677
JUMPV
LABELV $709
line 1947
;1945:		}
;1946:		case MSG_ENTERGAME:				//someone entered the game
;1947:		{
line 1948
;1948:			BotMatch_EnterGame(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_EnterGame
CALLV
pop
line 1949
;1949:			break;
ADDRGP4 $677
JUMPV
LABELV $710
line 1952
;1950:		}
;1951:		case MSG_NEWLEADER:
;1952:		{
line 1953
;1953:			BotMatch_NewLeader(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_NewLeader
CALLV
pop
line 1954
;1954:			break;
ADDRGP4 $677
JUMPV
line 1957
;1955:		}
;1956:		case MSG_WAIT:
;1957:		{
line 1958
;1958:			break;
LABELV $712
line 1961
;1959:		}
;1960:		case MSG_SUICIDE:
;1961:		{
line 1962
;1962:			BotMatch_Suicide(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_Suicide
CALLV
pop
line 1963
;1963:			break;
ADDRGP4 $677
JUMPV
LABELV $676
line 1966
;1964:		}
;1965:		default:
;1966:		{
line 1967
;1967:			BotAI_Print(PRT_MESSAGE, "unknown match type\n");
CNSTI4 1
ARGI4
ADDRGP4 $713
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 1968
;1968:			break;
LABELV $677
line 1971
;1969:		}
;1970:	}
;1971:	return qtrue;
CNSTI4 1
RETI4
LABELV $672
endproc BotMatchMessage 336 12
import BotVoiceChatOnly
import BotVoiceChat
import BotSetTeamMateTaskPreference
import BotGetTeamMateTaskPreference
import BotTeamAI
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
bss
export notleader
align 4
LABELV notleader
skip 256
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
import neutralobelisk
import blueobelisk
import redobelisk
import ctf_neutralflag
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
import BotEnemyCubeCarrierVisible
import BotTeamCubeCarrierVisible
import BotHarvesterRetreatGoals
import BotHarvesterSeekGoals
import BotGoHarvest
import BotObeliskRetreatGoals
import BotObeliskSeekGoals
import Bot1FCTFRetreatGoals
import Bot1FCTFSeekGoals
import BotHarvesterCarryingCubes
import Bot1FCTFCarryingFlag
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
import EntityHasKamikaze
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
import BotTeamLeader
import BotAI_GetSnapshotEntity
import BotAI_GetEntityState
import BotAI_GetClientState
import BotAI_Trace
import BotAI_BotInitialChat
import BotAI_Print
import floattime
import BotEntityInfo
import NumBots
import BotResetState
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
import G_StartKamikaze
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
import DropPortalDestination
import DropPortalSource
import TeleportPlayer
import trigger_teleporter_touch
import Touch_DoorTrigger
import G_RunMover
import fire_prox
import fire_nail
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
import TossClientPersistantPowerups
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
LABELV $713
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $696
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 109
byte 1 121
byte 1 32
byte 1 98
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $605
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
LABELV $604
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $601
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $600
byte 1 116
byte 1 101
byte 1 97
byte 1 109
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
LABELV $580
byte 1 78
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 32
byte 1 79
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $579
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 79
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $578
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 79
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $577
byte 1 78
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $576
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 32
byte 1 82
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $575
byte 1 68
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $574
byte 1 71
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $573
byte 1 83
byte 1 99
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $572
byte 1 67
byte 1 104
byte 1 97
byte 1 105
byte 1 110
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $571
byte 1 80
byte 1 114
byte 1 111
byte 1 120
byte 1 32
byte 1 76
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $570
byte 1 78
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $569
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $568
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $567
byte 1 72
byte 1 101
byte 1 97
byte 1 118
byte 1 121
byte 1 32
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $566
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $565
byte 1 70
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $564
byte 1 73
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $563
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $562
byte 1 66
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 83
byte 1 117
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $561
byte 1 82
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $560
byte 1 81
byte 1 117
byte 1 97
byte 1 100
byte 1 32
byte 1 68
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $559
byte 1 68
byte 1 101
byte 1 118
byte 1 97
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $558
byte 1 70
byte 1 108
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 84
byte 1 104
byte 1 114
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $557
byte 1 77
byte 1 52
byte 1 50
byte 1 32
byte 1 71
byte 1 97
byte 1 117
byte 1 115
byte 1 115
byte 1 32
byte 1 82
byte 1 105
byte 1 102
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $556
byte 1 71
byte 1 97
byte 1 116
byte 1 97
byte 1 32
byte 1 71
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $555
byte 1 83
byte 1 105
byte 1 110
byte 1 103
byte 1 117
byte 1 108
byte 1 97
byte 1 114
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 67
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $554
byte 1 71
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 32
byte 1 76
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $553
byte 1 83
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $529
byte 1 114
byte 1 111
byte 1 97
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $528
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
LABELV $526
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $524
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $522
byte 1 114
byte 1 117
byte 1 115
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $520
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $518
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
LABELV $516
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $514
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $512
byte 1 103
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 0
align 1
LABELV $510
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $508
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
byte 1 0
align 1
LABELV $506
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $498
byte 1 73
byte 1 39
byte 1 109
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $476
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $475
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $469
byte 1 100
byte 1 105
byte 1 115
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $453
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 95
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 114
byte 1 109
byte 1 0
align 1
LABELV $452
byte 1 37
byte 1 49
byte 1 46
byte 1 48
byte 1 102
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 48
byte 1 102
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 48
byte 1 102
byte 1 0
align 1
LABELV $441
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 95
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $433
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
LABELV $427
byte 1 110
byte 1 111
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $426
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $418
byte 1 0
align 1
LABELV $417
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $409
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $398
byte 1 121
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $397
byte 1 107
byte 1 101
byte 1 101
byte 1 112
byte 1 105
byte 1 110
byte 1 109
byte 1 105
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $264
byte 1 119
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 97
byte 1 114
byte 1 101
byte 1 121
byte 1 111
byte 1 117
byte 1 0
align 1
LABELV $263
byte 1 119
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 105
byte 1 115
byte 1 0
align 1
LABELV $244
byte 1 119
byte 1 104
byte 1 111
byte 1 105
byte 1 115
byte 1 0
align 1
LABELV $227
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $178
byte 1 73
byte 1 32
byte 1 110
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 112
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 10
byte 1 0
align 1
LABELV $153
byte 1 119
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 100
byte 1 111
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 115
byte 1 97
byte 1 121
byte 1 63
byte 1 0
align 1
LABELV $97
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
