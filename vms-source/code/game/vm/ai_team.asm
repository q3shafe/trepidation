export BotValidTeamLeader
code
proc BotValidTeamLeader 8 4
file "../ai_team.c"
line 52
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:/*****************************************************************************
;5: * name:		ai_team.c
;6: *
;7: * desc:		Quake3 bot AI
;8: *
;9: * $Archive: /MissionPack/code/game/ai_team.c $
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
;30:#include "ai_vcmd.h"
;31:
;32:#include "match.h"
;33:
;34:// for the voice chats
;35:#include "../../ui/menudef.h"
;36:
;37://ctf task preferences for a client
;38:typedef struct bot_ctftaskpreference_s
;39:{
;40:	char		name[36];
;41:	int			preference;
;42:} bot_ctftaskpreference_t;
;43:
;44:bot_ctftaskpreference_t ctftaskpreferences[MAX_CLIENTS];
;45:
;46:
;47:/*
;48:==================
;49:BotValidTeamLeader
;50:==================
;51:*/
;52:int BotValidTeamLeader(bot_state_t *bs) {
line 53
;53:	if (!strlen(bs->teamleader)) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $57
CNSTI4 0
RETI4
ADDRGP4 $56
JUMPV
LABELV $57
line 54
;54:	if (ClientFromName(bs->teamleader) == -1) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 -1
NEI4 $59
CNSTI4 0
RETI4
ADDRGP4 $56
JUMPV
LABELV $59
line 55
;55:	return qtrue;
CNSTI4 1
RETI4
LABELV $56
endproc BotValidTeamLeader 8 4
bss
align 4
LABELV $62
skip 4
export BotNumTeamMates
code
proc BotNumTeamMates 1060 12
line 63
;56:}
;57:
;58:/*
;59:==================
;60:BotNumTeamMates
;61:==================
;62:*/
;63:int BotNumTeamMates(bot_state_t *bs) {
line 68
;64:	int i, numplayers;
;65:	char buf[MAX_INFO_STRING];
;66:	static int maxclients;
;67:
;68:	if (!maxclients)
ADDRGP4 $62
INDIRI4
CNSTI4 0
NEI4 $63
line 69
;69:		maxclients = trap_Cvar_VariableIntegerValue("sv_maxclients");
ADDRGP4 $65
ARGP4
ADDRLP4 1032
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 $62
ADDRLP4 1032
INDIRI4
ASGNI4
LABELV $63
line 71
;70:
;71:	numplayers = 0;
ADDRLP4 1028
CNSTI4 0
ASGNI4
line 72
;72:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $69
JUMPV
LABELV $66
line 73
;73:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
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
line 75
;74:		//if no config string or no name
;75:		if (!strlen(buf) || !strlen(Info_ValueForKey(buf, "n"))) continue;
ADDRLP4 4
ARGP4
ADDRLP4 1036
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
EQI4 $73
ADDRLP4 4
ARGP4
ADDRGP4 $72
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
NEI4 $70
LABELV $73
ADDRGP4 $67
JUMPV
LABELV $70
line 77
;76:		//skip spectators
;77:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR) continue;
ADDRLP4 4
ARGP4
ADDRGP4 $76
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
CNSTI4 3
NEI4 $74
ADDRGP4 $67
JUMPV
LABELV $74
line 79
;78:		//
;79:		if (BotSameTeam(bs, i)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1056
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
EQI4 $77
line 80
;80:			numplayers++;
ADDRLP4 1028
ADDRLP4 1028
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 81
;81:		}
LABELV $77
line 82
;82:	}
LABELV $67
line 72
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $69
ADDRLP4 0
INDIRI4
ADDRGP4 $62
INDIRI4
GEI4 $79
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $66
LABELV $79
line 83
;83:	return numplayers;
ADDRLP4 1028
INDIRI4
RETI4
LABELV $61
endproc BotNumTeamMates 1060 12
export BotClientTravelTimeToGoal
proc BotClientTravelTimeToGoal 480 16
line 91
;84:}
;85:
;86:/*
;87:==================
;88:BotClientTravelTimeToGoal
;89:==================
;90:*/
;91:int BotClientTravelTimeToGoal(int client, bot_goal_t *goal) {
line 95
;92:	playerState_t ps;
;93:	int areanum;
;94:
;95:	BotAI_GetClientState(client, &ps);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotAI_GetClientState
CALLI4
pop
line 96
;96:	areanum = BotPointAreaNum(ps.origin);
ADDRLP4 0+20
ARGP4
ADDRLP4 472
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 468
ADDRLP4 472
INDIRI4
ASGNI4
line 97
;97:	if (!areanum) return 1;
ADDRLP4 468
INDIRI4
CNSTI4 0
NEI4 $82
CNSTI4 1
RETI4
ADDRGP4 $80
JUMPV
LABELV $82
line 98
;98:	return trap_AAS_AreaTravelTimeToGoalArea(areanum, ps.origin, goal->areanum, TFL_DEFAULT);
ADDRLP4 468
INDIRI4
ARGI4
ADDRLP4 0+20
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 476
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 476
INDIRI4
RETI4
LABELV $80
endproc BotClientTravelTimeToGoal 480 16
bss
align 4
LABELV $86
skip 4
export BotSortTeamMatesByBaseTravelTime
code
proc BotSortTeamMatesByBaseTravelTime 1352 12
line 106
;99:}
;100:
;101:/*
;102:==================
;103:BotSortTeamMatesByBaseTravelTime
;104:==================
;105:*/
;106:int BotSortTeamMatesByBaseTravelTime(bot_state_t *bs, int *teammates, int maxteammates) {
line 112
;107:
;108:	int i, j, k, numteammates, traveltime;
;109:	char buf[MAX_INFO_STRING];
;110:	static int maxclients;
;111:	int traveltimes[MAX_CLIENTS];
;112:	bot_goal_t *goal = NULL;
ADDRLP4 1300
CNSTP4 0
ASGNP4
line 114
;113:
;114:	if (gametype == GT_CTF || gametype == GT_1FCTF) {
ADDRLP4 1304
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 1304
INDIRI4
CNSTI4 4
EQI4 $89
ADDRLP4 1304
INDIRI4
CNSTI4 5
NEI4 $87
LABELV $89
line 115
;115:		if (BotTeam(bs) == TEAM_RED)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1308
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 1308
INDIRI4
CNSTI4 1
NEI4 $90
line 116
;116:			goal = &ctf_redflag;
ADDRLP4 1300
ADDRGP4 ctf_redflag
ASGNP4
ADDRGP4 $91
JUMPV
LABELV $90
line 118
;117:		else
;118:			goal = &ctf_blueflag;
ADDRLP4 1300
ADDRGP4 ctf_blueflag
ASGNP4
LABELV $91
line 119
;119:	}
LABELV $87
line 128
;120:#ifdef MISSIONPACK
;121:	else {
;122:		if (BotTeam(bs) == TEAM_RED)
;123:			goal = &redobelisk;
;124:		else
;125:			goal = &blueobelisk;
;126:	}
;127:#endif
;128:	if (!maxclients)
ADDRGP4 $86
INDIRI4
CNSTI4 0
NEI4 $92
line 129
;129:		maxclients = trap_Cvar_VariableIntegerValue("sv_maxclients");
ADDRGP4 $65
ARGP4
ADDRLP4 1308
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 $86
ADDRLP4 1308
INDIRI4
ASGNI4
LABELV $92
line 131
;130:
;131:	numteammates = 0;
ADDRLP4 264
CNSTI4 0
ASGNI4
line 132
;132:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 268
CNSTI4 0
ASGNI4
ADDRGP4 $97
JUMPV
LABELV $94
line 133
;133:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
ADDRLP4 268
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 276
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 135
;134:		//if no config string or no name
;135:		if (!strlen(buf) || !strlen(Info_ValueForKey(buf, "n"))) continue;
ADDRLP4 276
ARGP4
ADDRLP4 1312
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1312
INDIRI4
CNSTI4 0
EQI4 $100
ADDRLP4 276
ARGP4
ADDRGP4 $72
ARGP4
ADDRLP4 1316
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1316
INDIRP4
ARGP4
ADDRLP4 1320
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1320
INDIRI4
CNSTI4 0
NEI4 $98
LABELV $100
ADDRGP4 $95
JUMPV
LABELV $98
line 137
;136:		//skip spectators
;137:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR) continue;
ADDRLP4 276
ARGP4
ADDRGP4 $76
ARGP4
ADDRLP4 1324
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1324
INDIRP4
ARGP4
ADDRLP4 1328
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1328
INDIRI4
CNSTI4 3
NEI4 $101
ADDRGP4 $95
JUMPV
LABELV $101
line 139
;138:		//
;139:		if (BotSameTeam(bs, i)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 268
INDIRI4
ARGI4
ADDRLP4 1332
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1332
INDIRI4
CNSTI4 0
EQI4 $103
line 141
;140:			//
;141:			traveltime = BotClientTravelTimeToGoal(i, goal);
ADDRLP4 268
INDIRI4
ARGI4
ADDRLP4 1300
INDIRP4
ARGP4
ADDRLP4 1336
ADDRGP4 BotClientTravelTimeToGoal
CALLI4
ASGNI4
ADDRLP4 272
ADDRLP4 1336
INDIRI4
ASGNI4
line 143
;142:			//
;143:			for (j = 0; j < numteammates; j++) {
ADDRLP4 260
CNSTI4 0
ASGNI4
ADDRGP4 $108
JUMPV
LABELV $105
line 144
;144:				if (traveltime < traveltimes[j]) {
ADDRLP4 272
INDIRI4
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
GEI4 $109
line 145
;145:					for (k = numteammates; k > j; k--) {
ADDRLP4 0
ADDRLP4 264
INDIRI4
ASGNI4
ADDRGP4 $114
JUMPV
LABELV $111
line 146
;146:						traveltimes[k] = traveltimes[k-1];
ADDRLP4 1340
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1340
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 1340
INDIRI4
ADDRLP4 4-4
ADDP4
INDIRI4
ASGNI4
line 147
;147:						teammates[k] = teammates[k-1];
ADDRLP4 1344
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1348
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1344
INDIRI4
ADDRLP4 1348
INDIRP4
ADDP4
ADDRLP4 1344
INDIRI4
CNSTI4 4
SUBI4
ADDRLP4 1348
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 148
;148:					}
LABELV $112
line 145
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $114
ADDRLP4 0
INDIRI4
ADDRLP4 260
INDIRI4
GTI4 $111
line 149
;149:					break;
ADDRGP4 $107
JUMPV
LABELV $109
line 151
;150:				}
;151:			}
LABELV $106
line 143
ADDRLP4 260
ADDRLP4 260
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $108
ADDRLP4 260
INDIRI4
ADDRLP4 264
INDIRI4
LTI4 $105
LABELV $107
line 152
;152:			traveltimes[j] = traveltime;
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 272
INDIRI4
ASGNI4
line 153
;153:			teammates[j] = i;
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ADDRLP4 268
INDIRI4
ASGNI4
line 154
;154:			numteammates++;
ADDRLP4 264
ADDRLP4 264
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 155
;155:			if (numteammates >= maxteammates) break;
ADDRLP4 264
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $116
ADDRGP4 $96
JUMPV
LABELV $116
line 156
;156:		}
LABELV $103
line 157
;157:	}
LABELV $95
line 132
ADDRLP4 268
ADDRLP4 268
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $97
ADDRLP4 268
INDIRI4
ADDRGP4 $86
INDIRI4
GEI4 $118
ADDRLP4 268
INDIRI4
CNSTI4 64
LTI4 $94
LABELV $118
LABELV $96
line 158
;158:	return numteammates;
ADDRLP4 264
INDIRI4
RETI4
LABELV $85
endproc BotSortTeamMatesByBaseTravelTime 1352 12
export BotSetTeamMateTaskPreference
proc BotSetTeamMateTaskPreference 36 12
line 166
;159:}
;160:
;161:/*
;162:==================
;163:BotSetTeamMateTaskPreference
;164:==================
;165:*/
;166:void BotSetTeamMateTaskPreference(bot_state_t *bs, int teammate, int preference) {
line 169
;167:	char teammatename[MAX_NETNAME];
;168:
;169:	ctftaskpreferences[teammate].preference = preference;
CNSTI4 40
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 ctftaskpreferences+36
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 170
;170:	ClientName(teammate, teammatename, sizeof(teammatename));
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 171
;171:	strcpy(ctftaskpreferences[teammate].name, teammatename);
CNSTI4 40
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 ctftaskpreferences
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 172
;172:}
LABELV $119
endproc BotSetTeamMateTaskPreference 36 12
export BotGetTeamMateTaskPreference
proc BotGetTeamMateTaskPreference 40 12
line 179
;173:
;174:/*
;175:==================
;176:BotGetTeamMateTaskPreference
;177:==================
;178:*/
;179:int BotGetTeamMateTaskPreference(bot_state_t *bs, int teammate) {
line 182
;180:	char teammatename[MAX_NETNAME];
;181:
;182:	if (!ctftaskpreferences[teammate].preference) return 0;
CNSTI4 40
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 ctftaskpreferences+36
ADDP4
INDIRI4
CNSTI4 0
NEI4 $122
CNSTI4 0
RETI4
ADDRGP4 $121
JUMPV
LABELV $122
line 183
;183:	ClientName(teammate, teammatename, sizeof(teammatename));
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 184
;184:	if (Q_stricmp(teammatename, ctftaskpreferences[teammate].name)) return 0;
ADDRLP4 0
ARGP4
CNSTI4 40
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 ctftaskpreferences
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $125
CNSTI4 0
RETI4
ADDRGP4 $121
JUMPV
LABELV $125
line 185
;185:	return ctftaskpreferences[teammate].preference;
CNSTI4 40
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 ctftaskpreferences+36
ADDP4
INDIRI4
RETI4
LABELV $121
endproc BotGetTeamMateTaskPreference 40 12
export BotSortTeamMatesByTaskPreference
proc BotSortTeamMatesByTaskPreference 804 12
line 193
;186:}
;187:
;188:/*
;189:==================
;190:BotSortTeamMatesByTaskPreference
;191:==================
;192:*/
;193:int BotSortTeamMatesByTaskPreference(bot_state_t *bs, int *teammates, int numteammates) {
line 199
;194:	int defenders[MAX_CLIENTS], numdefenders;
;195:	int attackers[MAX_CLIENTS], numattackers;
;196:	int roamers[MAX_CLIENTS], numroamers;
;197:	int i, preference;
;198:
;199:	numdefenders = numattackers = numroamers = 0;
ADDRLP4 788
CNSTI4 0
ASGNI4
ADDRLP4 272
ADDRLP4 788
INDIRI4
ASGNI4
ADDRLP4 268
ADDRLP4 788
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 788
INDIRI4
ASGNI4
line 200
;200:	for (i = 0; i < numteammates; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $132
JUMPV
LABELV $129
line 201
;201:		preference = BotGetTeamMateTaskPreference(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 792
ADDRGP4 BotGetTeamMateTaskPreference
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 792
INDIRI4
ASGNI4
line 202
;202:		if (preference & TEAMTP_DEFENDER) {
ADDRLP4 4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $133
line 203
;203:			defenders[numdefenders++] = teammates[i];
ADDRLP4 796
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 796
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 800
CNSTI4 2
ASGNI4
ADDRLP4 796
INDIRI4
ADDRLP4 800
INDIRI4
LSHI4
ADDRLP4 12
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 800
INDIRI4
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 204
;204:		}
ADDRGP4 $134
JUMPV
LABELV $133
line 205
;205:		else if (preference & TEAMTP_ATTACKER) {
ADDRLP4 4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $135
line 206
;206:			attackers[numattackers++] = teammates[i];
ADDRLP4 796
ADDRLP4 268
INDIRI4
ASGNI4
ADDRLP4 268
ADDRLP4 796
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 800
CNSTI4 2
ASGNI4
ADDRLP4 796
INDIRI4
ADDRLP4 800
INDIRI4
LSHI4
ADDRLP4 276
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 800
INDIRI4
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 207
;207:		}
ADDRGP4 $136
JUMPV
LABELV $135
line 208
;208:		else {
line 209
;209:			roamers[numroamers++] = teammates[i];
ADDRLP4 796
ADDRLP4 272
INDIRI4
ASGNI4
ADDRLP4 272
ADDRLP4 796
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 800
CNSTI4 2
ASGNI4
ADDRLP4 796
INDIRI4
ADDRLP4 800
INDIRI4
LSHI4
ADDRLP4 532
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 800
INDIRI4
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 210
;210:		}
LABELV $136
LABELV $134
line 211
;211:	}
LABELV $130
line 200
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $132
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $129
line 212
;212:	numteammates = 0;
ADDRFP4 8
CNSTI4 0
ASGNI4
line 214
;213:	//defenders at the front of the list
;214:	memcpy(&teammates[numteammates], defenders, numdefenders * sizeof(int));
ADDRLP4 792
CNSTI4 2
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 792
INDIRI4
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 8
INDIRI4
CVIU4 4
ADDRLP4 792
INDIRI4
LSHU4
CVUI4 4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 215
;215:	numteammates += numdefenders;
ADDRFP4 8
ADDRFP4 8
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 217
;216:	//roamers in the middle
;217:	memcpy(&teammates[numteammates], roamers, numroamers * sizeof(int));
ADDRLP4 796
CNSTI4 2
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 796
INDIRI4
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ARGP4
ADDRLP4 532
ARGP4
ADDRLP4 272
INDIRI4
CVIU4 4
ADDRLP4 796
INDIRI4
LSHU4
CVUI4 4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 218
;218:	numteammates += numroamers;
ADDRFP4 8
ADDRFP4 8
INDIRI4
ADDRLP4 272
INDIRI4
ADDI4
ASGNI4
line 220
;219:	//attacker in the back of the list
;220:	memcpy(&teammates[numteammates], attackers, numattackers * sizeof(int));
ADDRLP4 800
CNSTI4 2
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 800
INDIRI4
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ARGP4
ADDRLP4 276
ARGP4
ADDRLP4 268
INDIRI4
CVIU4 4
ADDRLP4 800
INDIRI4
LSHU4
CVUI4 4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 221
;221:	numteammates += numattackers;
ADDRFP4 8
ADDRFP4 8
INDIRI4
ADDRLP4 268
INDIRI4
ADDI4
ASGNI4
line 223
;222:
;223:	return numteammates;
ADDRFP4 8
INDIRI4
RETI4
LABELV $128
endproc BotSortTeamMatesByTaskPreference 804 12
export BotSayTeamOrderAlways
proc BotSayTeamOrderAlways 548 20
line 231
;224:}
;225:
;226:/*
;227:==================
;228:BotSayTeamOrders
;229:==================
;230:*/
;231:void BotSayTeamOrderAlways(bot_state_t *bs, int toclient) {
line 237
;232:	char teamchat[MAX_MESSAGE_SIZE];
;233:	char buf[MAX_MESSAGE_SIZE];
;234:	char name[MAX_NETNAME];
;235:
;236:	//if the bot is talking to itself
;237:	if (bs->client == toclient) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $138
line 239
;238:		//don't show the message just put it in the console message queue
;239:		trap_BotGetChatMessage(bs->cs, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 256
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGetChatMessage
CALLV
pop
line 240
;240:		ClientName(bs->client, name, sizeof(name));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 512
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 241
;241:		Com_sprintf(teamchat, sizeof(teamchat), EC"(%s"EC")"EC": %s", name, buf);
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $140
ARGP4
ADDRLP4 512
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 242
;242:		trap_BotQueueConsoleMessage(bs->cs, CMS_CHAT, teamchat);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotQueueConsoleMessage
CALLV
pop
line 243
;243:	}
ADDRGP4 $139
JUMPV
LABELV $138
line 244
;244:	else {
line 245
;245:		trap_BotEnterChat(bs->cs, toclient, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 246
;246:	}
LABELV $139
line 247
;247:}
LABELV $137
endproc BotSayTeamOrderAlways 548 20
export BotSayTeamOrder
proc BotSayTeamOrder 0 8
line 254
;248:
;249:/*
;250:==================
;251:BotSayTeamOrders
;252:==================
;253:*/
;254:void BotSayTeamOrder(bot_state_t *bs, int toclient) {
line 261
;255:#ifdef MISSIONPACK
;256:	// voice chats only
;257:	char buf[MAX_MESSAGE_SIZE];
;258:
;259:	trap_BotGetChatMessage(bs->cs, buf, sizeof(buf));
;260:#else
;261:	BotSayTeamOrderAlways(bs, toclient);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrderAlways
CALLV
pop
line 263
;262:#endif
;263:}
LABELV $141
endproc BotSayTeamOrder 0 8
export BotVoiceChat
proc BotVoiceChat 0 0
line 270
;264:
;265:/*
;266:==================
;267:BotVoiceChat
;268:==================
;269:*/
;270:void BotVoiceChat(bot_state_t *bs, int toclient, char *voicechat) {
line 279
;271:#ifdef MISSIONPACK
;272:	if (toclient == -1)
;273:		// voice only say team
;274:		trap_EA_Command(bs->client, va("vsay_team %s", voicechat));
;275:	else
;276:		// voice only tell single player
;277:		trap_EA_Command(bs->client, va("vtell %d %s", toclient, voicechat));
;278:#endif
;279:}
LABELV $142
endproc BotVoiceChat 0 0
export BotVoiceChatOnly
proc BotVoiceChatOnly 0 0
line 286
;280:
;281:/*
;282:==================
;283:BotVoiceChatOnly
;284:==================
;285:*/
;286:void BotVoiceChatOnly(bot_state_t *bs, int toclient, char *voicechat) {
line 295
;287:#ifdef MISSIONPACK
;288:	if (toclient == -1)
;289:		// voice only say team
;290:		trap_EA_Command(bs->client, va("vosay_team %s", voicechat));
;291:	else
;292:		// voice only tell single player
;293:		trap_EA_Command(bs->client, va("votell %d %s", toclient, voicechat));
;294:#endif
;295:}
LABELV $143
endproc BotVoiceChatOnly 0 0
export BotSayVoiceTeamOrder
proc BotSayVoiceTeamOrder 0 0
line 302
;296:
;297:/*
;298:==================
;299:BotSayVoiceTeamOrder
;300:==================
;301:*/
;302:void BotSayVoiceTeamOrder(bot_state_t *bs, int toclient, char *voicechat) {
line 306
;303:#ifdef MISSIONPACK
;304:	BotVoiceChat(bs, toclient, voicechat);
;305:#endif
;306:}
LABELV $144
endproc BotSayVoiceTeamOrder 0 0
export BotCTFOrders_BothFlagsNotAtBase
proc BotCTFOrders_BothFlagsNotAtBase 368 20
line 313
;307:
;308:/*
;309:==================
;310:BotCTFOrders
;311:==================
;312:*/
;313:void BotCTFOrders_BothFlagsNotAtBase(bot_state_t *bs) {
line 318
;314:	int numteammates, defenders, attackers, i, other;
;315:	int teammates[MAX_CLIENTS];
;316:	char name[MAX_NETNAME], carriername[MAX_NETNAME];
;317:
;318:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 348
ADDRGP4 BotSortTeamMatesByBaseTravelTime
CALLI4
ASGNI4
ADDRLP4 296
ADDRLP4 348
INDIRI4
ASGNI4
line 319
;319:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 296
INDIRI4
ARGI4
ADDRGP4 BotSortTeamMatesByTaskPreference
CALLI4
pop
line 321
;320:	//different orders based on the number of team mates
;321:	switch(bs->numteammates) {
ADDRLP4 352
ADDRFP4 0
INDIRP4
CNSTI4 6948
ADDP4
INDIRI4
ASGNI4
ADDRLP4 352
INDIRI4
CNSTI4 1
EQI4 $147
ADDRLP4 352
INDIRI4
CNSTI4 2
EQI4 $150
ADDRLP4 352
INDIRI4
CNSTI4 3
EQI4 $156
ADDRGP4 $146
JUMPV
line 322
;322:		case 1: break;
LABELV $150
line 324
;323:		case 2:
;324:		{
line 326
;325:			//tell the one not carrying the flag to attack the enemy base
;326:			if (teammates[0] != bs->flagcarrier) other = teammates[0];
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6972
ADDP4
INDIRI4
EQI4 $151
ADDRLP4 308
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $152
JUMPV
LABELV $151
line 327
;327:			else other = teammates[1];
ADDRLP4 308
ADDRLP4 4+4
INDIRI4
ASGNI4
LABELV $152
line 328
;328:			ClientName(other, name, sizeof(name));
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 329
;329:			BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 330
;330:			BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 331
;331:			BotSayVoiceTeamOrder(bs, other, VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 $155
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 332
;332:			break;
ADDRGP4 $147
JUMPV
LABELV $156
line 335
;333:		}
;334:		case 3:
;335:		{
line 337
;336:			//tell the one closest to the base not carrying the flag to accompany the flag carrier
;337:			if (teammates[0] != bs->flagcarrier) other = teammates[0];
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6972
ADDP4
INDIRI4
EQI4 $157
ADDRLP4 308
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $158
JUMPV
LABELV $157
line 338
;338:			else other = teammates[1];
ADDRLP4 308
ADDRLP4 4+4
INDIRI4
ASGNI4
LABELV $158
line 339
;339:			ClientName(other, name, sizeof(name));
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 340
;340:			if ( bs->flagcarrier != -1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 6972
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $160
line 341
;341:				ClientName(bs->flagcarrier, carriername, sizeof(carriername));
ADDRFP4 0
INDIRP4
CNSTI4 6972
ADDP4
INDIRI4
ARGI4
ADDRLP4 312
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 342
;342:				if (bs->flagcarrier == bs->client) {
ADDRLP4 360
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 360
INDIRP4
CNSTI4 6972
ADDP4
INDIRI4
ADDRLP4 360
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $162
line 343
;343:					BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $164
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 344
;344:					BotSayVoiceTeamOrder(bs, other, VOICECHAT_FOLLOWME);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 $165
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 345
;345:				}
ADDRGP4 $161
JUMPV
LABELV $162
line 346
;346:				else {
line 347
;347:					BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $166
ARGP4
ADDRLP4 260
ARGP4
ADDRLP4 312
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 348
;348:					BotSayVoiceTeamOrder(bs, other, VOICECHAT_FOLLOWFLAGCARRIER);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 $167
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 349
;349:				}
line 350
;350:			}
ADDRGP4 $161
JUMPV
LABELV $160
line 351
;351:			else {
line 353
;352:				//
;353:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 354
;354:				BotSayVoiceTeamOrder(bs, other, VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 $155
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 355
;355:			}
LABELV $161
line 356
;356:			BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 358
;357:			//tell the one furthest from the the base not carrying the flag to get the enemy flag
;358:			if (teammates[2] != bs->flagcarrier) other = teammates[2];
ADDRLP4 4+8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6972
ADDP4
INDIRI4
EQI4 $168
ADDRLP4 308
ADDRLP4 4+8
INDIRI4
ASGNI4
ADDRGP4 $169
JUMPV
LABELV $168
line 359
;359:			else other = teammates[1];
ADDRLP4 308
ADDRLP4 4+4
INDIRI4
ASGNI4
LABELV $169
line 360
;360:			ClientName(other, name, sizeof(name));
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 361
;361:			BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 362
;362:			BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 363
;363:			BotSayVoiceTeamOrder(bs, other, VOICECHAT_RETURNFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 $173
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 364
;364:			break;
ADDRGP4 $147
JUMPV
LABELV $146
line 367
;365:		}
;366:		default:
;367:		{
line 368
;368:			defenders = (int) (float) numteammates * 0.4 + 0.5;
ADDRLP4 300
CNSTF4 1053609165
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 369
;369:			if (defenders > 4) defenders = 4;
ADDRLP4 300
INDIRI4
CNSTI4 4
LEI4 $174
ADDRLP4 300
CNSTI4 4
ASGNI4
LABELV $174
line 370
;370:			attackers = (int) (float) numteammates * 0.5 + 0.5;
ADDRLP4 360
CNSTF4 1056964608
ASGNF4
ADDRLP4 304
ADDRLP4 360
INDIRF4
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
ADDRLP4 360
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 371
;371:			if (attackers > 5) attackers = 5;
ADDRLP4 304
INDIRI4
CNSTI4 5
LEI4 $176
ADDRLP4 304
CNSTI4 5
ASGNI4
LABELV $176
line 372
;372:			if (bs->flagcarrier != -1) {
ADDRFP4 0
INDIRP4
CNSTI4 6972
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $178
line 373
;373:				ClientName(bs->flagcarrier, carriername, sizeof(carriername));
ADDRFP4 0
INDIRP4
CNSTI4 6972
ADDP4
INDIRI4
ARGI4
ADDRLP4 312
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 374
;374:				for (i = 0; i < defenders; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $183
JUMPV
LABELV $180
line 376
;375:					//
;376:					if (teammates[i] == bs->flagcarrier) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6972
ADDP4
INDIRI4
NEI4 $184
line 377
;377:						continue;
ADDRGP4 $181
JUMPV
LABELV $184
line 380
;378:					}
;379:					//
;380:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
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
line 381
;381:					if (bs->flagcarrier == bs->client) {
ADDRLP4 364
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 364
INDIRP4
CNSTI4 6972
ADDP4
INDIRI4
ADDRLP4 364
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $186
line 382
;382:						BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $164
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 383
;383:						BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_FOLLOWME);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $165
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 384
;384:					}
ADDRGP4 $187
JUMPV
LABELV $186
line 385
;385:					else {
line 386
;386:						BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $166
ARGP4
ADDRLP4 260
ARGP4
ADDRLP4 312
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 387
;387:						BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_FOLLOWFLAGCARRIER);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $167
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 388
;388:					}
LABELV $187
line 389
;389:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 390
;390:				}
LABELV $181
line 374
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $183
ADDRLP4 0
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $180
line 391
;391:			}
ADDRGP4 $179
JUMPV
LABELV $178
line 392
;392:			else {
line 393
;393:				for (i = 0; i < defenders; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $191
JUMPV
LABELV $188
line 395
;394:					//
;395:					if (teammates[i] == bs->flagcarrier) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6972
ADDP4
INDIRI4
NEI4 $192
line 396
;396:						continue;
ADDRGP4 $189
JUMPV
LABELV $192
line 399
;397:					}
;398:					//
;399:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
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
line 400
;400:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 401
;401:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $155
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 402
;402:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 403
;403:				}
LABELV $189
line 393
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $191
ADDRLP4 0
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $188
line 404
;404:			}
LABELV $179
line 405
;405:			for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $197
JUMPV
LABELV $194
line 407
;406:				//
;407:				if (teammates[numteammates - i - 1] == bs->flagcarrier) {
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6972
ADDP4
INDIRI4
NEI4 $198
line 408
;408:					continue;
ADDRGP4 $195
JUMPV
LABELV $198
line 411
;409:				}
;410:				//
;411:				ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
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
line 412
;412:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 413
;413:				BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 414
;414:				BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_RETURNFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $173
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 415
;415:			}
LABELV $195
line 405
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $197
ADDRLP4 0
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $194
line 417
;416:			//
;417:			break;
LABELV $147
line 420
;418:		}
;419:	}
;420:}
LABELV $145
endproc BotCTFOrders_BothFlagsNotAtBase 368 20
export BotCTFOrders_FlagNotAtBase
proc BotCTFOrders_FlagNotAtBase 320 16
line 427
;421:
;422:/*
;423:==================
;424:BotCTFOrders
;425:==================
;426:*/
;427:void BotCTFOrders_FlagNotAtBase(bot_state_t *bs) {
line 432
;428:	int numteammates, defenders, attackers, i;
;429:	int teammates[MAX_CLIENTS];
;430:	char name[MAX_NETNAME];
;431:
;432:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 308
ADDRGP4 BotSortTeamMatesByBaseTravelTime
CALLI4
ASGNI4
ADDRLP4 296
ADDRLP4 308
INDIRI4
ASGNI4
line 433
;433:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 296
INDIRI4
ARGI4
ADDRGP4 BotSortTeamMatesByTaskPreference
CALLI4
pop
line 435
;434:	//passive strategy
;435:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $205
line 437
;436:		//different orders based on the number of team mates
;437:		switch(bs->numteammates) {
ADDRLP4 312
ADDRFP4 0
INDIRP4
CNSTI4 6948
ADDP4
INDIRI4
ASGNI4
ADDRLP4 312
INDIRI4
CNSTI4 1
EQI4 $206
ADDRLP4 312
INDIRI4
CNSTI4 2
EQI4 $211
ADDRLP4 312
INDIRI4
CNSTI4 3
EQI4 $216
ADDRGP4 $207
JUMPV
line 438
;438:			case 1: break;
LABELV $211
line 440
;439:			case 2:
;440:			{
line 442
;441:				//both will go for the enemy flag
;442:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 443
;443:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $212
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 444
;444:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 445
;445:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $155
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 447
;446:				//
;447:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 448
;448:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 449
;449:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 450
;450:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 $155
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 451
;451:				break;
ADDRGP4 $206
JUMPV
LABELV $216
line 454
;452:			}
;453:			case 3:
;454:			{
line 456
;455:				//keep one near the base for when the flag is returned
;456:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 457
;457:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $212
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 458
;458:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 459
;459:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $217
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 461
;460:				//the other two get the flag
;461:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 462
;462:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 463
;463:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 464
;464:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 $155
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 466
;465:				//
;466:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 467
;467:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 468
;468:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 469
;469:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 $155
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 470
;470:				break;
ADDRGP4 $206
JUMPV
LABELV $207
line 473
;471:			}
;472:			default:
;473:			{
line 475
;474:				//keep some people near the base for when the flag is returned
;475:				defenders = (int) (float) numteammates * 0.3 + 0.5;
ADDRLP4 300
CNSTF4 1050253722
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 476
;476:				if (defenders > 3) defenders = 3;
ADDRLP4 300
INDIRI4
CNSTI4 3
LEI4 $224
ADDRLP4 300
CNSTI4 3
ASGNI4
LABELV $224
line 477
;477:				attackers = (int) (float) numteammates * 0.7 + 0.5;
ADDRLP4 304
CNSTF4 1060320051
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 478
;478:				if (attackers > 6) attackers = 6;
ADDRLP4 304
INDIRI4
CNSTI4 6
LEI4 $226
ADDRLP4 304
CNSTI4 6
ASGNI4
LABELV $226
line 479
;479:				for (i = 0; i < defenders; i++) {
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRGP4 $231
JUMPV
LABELV $228
line 481
;480:					//
;481:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
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
line 482
;482:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $212
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 483
;483:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 484
;484:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 $217
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 485
;485:				}
LABELV $229
line 479
ADDRLP4 256
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $231
ADDRLP4 256
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $228
line 486
;486:				for (i = 0; i < attackers; i++) {
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRGP4 $235
JUMPV
LABELV $232
line 488
;487:					//
;488:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
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
line 489
;489:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 490
;490:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 491
;491:					BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $155
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 492
;492:				}
LABELV $233
line 486
ADDRLP4 256
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $235
ADDRLP4 256
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $232
line 494
;493:				//
;494:				break;
line 497
;495:			}
;496:		}
;497:	}
ADDRGP4 $206
JUMPV
LABELV $205
line 498
;498:	else {
line 500
;499:		//different orders based on the number of team mates
;500:		switch(bs->numteammates) {
ADDRLP4 312
ADDRFP4 0
INDIRP4
CNSTI4 6948
ADDP4
INDIRI4
ASGNI4
ADDRLP4 312
INDIRI4
CNSTI4 1
EQI4 $239
ADDRLP4 312
INDIRI4
CNSTI4 2
EQI4 $242
ADDRLP4 312
INDIRI4
CNSTI4 3
EQI4 $246
ADDRGP4 $238
JUMPV
line 501
;501:			case 1: break;
LABELV $242
line 503
;502:			case 2:
;503:			{
line 505
;504:				//both will go for the enemy flag
;505:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 506
;506:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 507
;507:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 508
;508:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $155
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 510
;509:				//
;510:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 511
;511:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 512
;512:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 513
;513:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 $155
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 514
;514:				break;
ADDRGP4 $239
JUMPV
LABELV $246
line 517
;515:			}
;516:			case 3:
;517:			{
line 519
;518:				//everyone go for the flag
;519:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 520
;520:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $212
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 521
;521:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 522
;522:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $155
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 524
;523:				//
;524:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 525
;525:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 526
;526:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 527
;527:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 $155
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 529
;528:				//
;529:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 530
;530:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 531
;531:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 532
;532:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 $155
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 533
;533:				break;
ADDRGP4 $239
JUMPV
LABELV $238
line 536
;534:			}
;535:			default:
;536:			{
line 538
;537:				//keep some people near the base for when the flag is returned
;538:				defenders = (int) (float) numteammates * 0.2 + 0.5;
ADDRLP4 300
CNSTF4 1045220557
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 539
;539:				if (defenders > 2) defenders = 2;
ADDRLP4 300
INDIRI4
CNSTI4 2
LEI4 $253
ADDRLP4 300
CNSTI4 2
ASGNI4
LABELV $253
line 540
;540:				attackers = (int) (float) numteammates * 0.7 + 0.5;
ADDRLP4 304
CNSTF4 1060320051
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 541
;541:				if (attackers > 7) attackers = 7;
ADDRLP4 304
INDIRI4
CNSTI4 7
LEI4 $255
ADDRLP4 304
CNSTI4 7
ASGNI4
LABELV $255
line 542
;542:				for (i = 0; i < defenders; i++) {
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRGP4 $260
JUMPV
LABELV $257
line 544
;543:					//
;544:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
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
line 545
;545:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $212
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 546
;546:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 547
;547:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 $217
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 548
;548:				}
LABELV $258
line 542
ADDRLP4 256
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $260
ADDRLP4 256
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $257
line 549
;549:				for (i = 0; i < attackers; i++) {
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRGP4 $264
JUMPV
LABELV $261
line 551
;550:					//
;551:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
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
line 552
;552:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 553
;553:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 554
;554:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $155
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 555
;555:				}
LABELV $262
line 549
ADDRLP4 256
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $264
ADDRLP4 256
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $261
line 557
;556:				//
;557:				break;
LABELV $239
line 560
;558:			}
;559:		}
;560:	}
LABELV $206
line 561
;561:}
LABELV $204
endproc BotCTFOrders_FlagNotAtBase 320 16
export BotCTFOrders_EnemyFlagNotAtBase
proc BotCTFOrders_EnemyFlagNotAtBase 360 20
line 568
;562:
;563:/*
;564:==================
;565:BotCTFOrders
;566:==================
;567:*/
;568:void BotCTFOrders_EnemyFlagNotAtBase(bot_state_t *bs) {
line 573
;569:	int numteammates, defenders, attackers, i, other;
;570:	int teammates[MAX_CLIENTS];
;571:	char name[MAX_NETNAME], carriername[MAX_NETNAME];
;572:
;573:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 348
ADDRGP4 BotSortTeamMatesByBaseTravelTime
CALLI4
ASGNI4
ADDRLP4 260
ADDRLP4 348
INDIRI4
ASGNI4
line 574
;574:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 260
INDIRI4
ARGI4
ADDRGP4 BotSortTeamMatesByTaskPreference
CALLI4
pop
line 576
;575:	//different orders based on the number of team mates
;576:	switch(numteammates) {
ADDRLP4 260
INDIRI4
CNSTI4 1
EQI4 $270
ADDRLP4 260
INDIRI4
CNSTI4 2
EQI4 $272
ADDRLP4 260
INDIRI4
CNSTI4 3
EQI4 $276
ADDRGP4 $269
JUMPV
line 577
;577:		case 1: break;
LABELV $272
line 579
;578:		case 2:
;579:		{
line 581
;580:			//tell the one not carrying the flag to defend the base
;581:			if (teammates[0] == bs->flagcarrier) other = teammates[1];
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6972
ADDP4
INDIRI4
NEI4 $273
ADDRLP4 308
ADDRLP4 4+4
INDIRI4
ASGNI4
ADDRGP4 $274
JUMPV
LABELV $273
line 582
;582:			else other = teammates[0];
ADDRLP4 308
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $274
line 583
;583:			ClientName(other, name, sizeof(name));
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 264
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 584
;584:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $212
ARGP4
ADDRLP4 264
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 585
;585:			BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 586
;586:			BotSayVoiceTeamOrder(bs, other, VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 $217
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 587
;587:			break;
ADDRGP4 $270
JUMPV
LABELV $276
line 590
;588:		}
;589:		case 3:
;590:		{
line 592
;591:			//tell the one closest to the base not carrying the flag to defend the base
;592:			if (teammates[0] != bs->flagcarrier) other = teammates[0];
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6972
ADDP4
INDIRI4
EQI4 $277
ADDRLP4 308
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $278
JUMPV
LABELV $277
line 593
;593:			else other = teammates[1];
ADDRLP4 308
ADDRLP4 4+4
INDIRI4
ASGNI4
LABELV $278
line 594
;594:			ClientName(other, name, sizeof(name));
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 264
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 595
;595:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $212
ARGP4
ADDRLP4 264
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 596
;596:			BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 597
;597:			BotSayVoiceTeamOrder(bs, other, VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 $217
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 599
;598:			//tell the other also to defend the base
;599:			if (teammates[2] != bs->flagcarrier) other = teammates[2];
ADDRLP4 4+8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6972
ADDP4
INDIRI4
EQI4 $280
ADDRLP4 308
ADDRLP4 4+8
INDIRI4
ASGNI4
ADDRGP4 $281
JUMPV
LABELV $280
line 600
;600:			else other = teammates[1];
ADDRLP4 308
ADDRLP4 4+4
INDIRI4
ASGNI4
LABELV $281
line 601
;601:			ClientName(other, name, sizeof(name));
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 264
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 602
;602:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $212
ARGP4
ADDRLP4 264
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 603
;603:			BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 604
;604:			BotSayVoiceTeamOrder(bs, other, VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 $217
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 605
;605:			break;
ADDRGP4 $270
JUMPV
LABELV $269
line 608
;606:		}
;607:		default:
;608:		{
line 610
;609:			//60% will defend the base
;610:			defenders = (int) (float) numteammates * 0.6 + 0.5;
ADDRLP4 300
CNSTF4 1058642330
ADDRLP4 260
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 611
;611:			if (defenders > 6) defenders = 6;
ADDRLP4 300
INDIRI4
CNSTI4 6
LEI4 $285
ADDRLP4 300
CNSTI4 6
ASGNI4
LABELV $285
line 613
;612:			//30% accompanies the flag carrier
;613:			attackers = (int) (float) numteammates * 0.3 + 0.5;
ADDRLP4 304
CNSTF4 1050253722
ADDRLP4 260
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 614
;614:			if (attackers > 3) attackers = 3;
ADDRLP4 304
INDIRI4
CNSTI4 3
LEI4 $287
ADDRLP4 304
CNSTI4 3
ASGNI4
LABELV $287
line 615
;615:			for (i = 0; i < defenders; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $292
JUMPV
LABELV $289
line 617
;616:				//
;617:				if (teammates[i] == bs->flagcarrier) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6972
ADDP4
INDIRI4
NEI4 $293
line 618
;618:					continue;
ADDRGP4 $290
JUMPV
LABELV $293
line 620
;619:				}
;620:				ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 264
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 621
;621:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $212
ARGP4
ADDRLP4 264
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 622
;622:				BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 623
;623:				BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $217
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 624
;624:			}
LABELV $290
line 615
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $292
ADDRLP4 0
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $289
line 626
;625:			// if we have a flag carrier
;626:			if ( bs->flagcarrier != -1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 6972
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $295
line 627
;627:				ClientName(bs->flagcarrier, carriername, sizeof(carriername));
ADDRFP4 0
INDIRP4
CNSTI4 6972
ADDP4
INDIRI4
ARGI4
ADDRLP4 312
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 628
;628:				for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $300
JUMPV
LABELV $297
line 630
;629:					//
;630:					if (teammates[numteammates - i - 1] == bs->flagcarrier) {
ADDRLP4 260
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6972
ADDP4
INDIRI4
NEI4 $301
line 631
;631:						continue;
ADDRGP4 $298
JUMPV
LABELV $301
line 634
;632:					}
;633:					//
;634:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 260
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 264
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 635
;635:					if (bs->flagcarrier == bs->client) {
ADDRLP4 356
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 356
INDIRP4
CNSTI4 6972
ADDP4
INDIRI4
ADDRLP4 356
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $305
line 636
;636:						BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $164
ARGP4
ADDRLP4 264
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 637
;637:						BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_FOLLOWME);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 260
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $165
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 638
;638:					}
ADDRGP4 $306
JUMPV
LABELV $305
line 639
;639:					else {
line 640
;640:						BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $166
ARGP4
ADDRLP4 264
ARGP4
ADDRLP4 312
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 641
;641:						BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_FOLLOWFLAGCARRIER);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 260
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $167
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 642
;642:					}
LABELV $306
line 643
;643:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 260
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 644
;644:				}
LABELV $298
line 628
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $300
ADDRLP4 0
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $297
line 645
;645:			}
ADDRGP4 $270
JUMPV
LABELV $295
line 646
;646:			else {
line 647
;647:				for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $313
JUMPV
LABELV $310
line 649
;648:					//
;649:					if (teammates[numteammates - i - 1] == bs->flagcarrier) {
ADDRLP4 260
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6972
ADDP4
INDIRI4
NEI4 $314
line 650
;650:						continue;
ADDRGP4 $311
JUMPV
LABELV $314
line 653
;651:					}
;652:					//
;653:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 260
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 264
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 654
;654:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 264
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 655
;655:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 260
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $155
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 656
;656:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 260
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 657
;657:				}
LABELV $311
line 647
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $313
ADDRLP4 0
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $310
line 658
;658:			}
line 660
;659:			//
;660:			break;
LABELV $270
line 663
;661:		}
;662:	}
;663:}
LABELV $268
endproc BotCTFOrders_EnemyFlagNotAtBase 360 20
export BotCTFOrders_BothFlagsAtBase
proc BotCTFOrders_BothFlagsAtBase 320 16
line 671
;664:
;665:
;666:/*
;667:==================
;668:BotCTFOrders
;669:==================
;670:*/
;671:void BotCTFOrders_BothFlagsAtBase(bot_state_t *bs) {
line 677
;672:	int numteammates, defenders, attackers, i;
;673:	int teammates[MAX_CLIENTS];
;674:	char name[MAX_NETNAME];
;675:
;676:	//sort team mates by travel time to base
;677:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 308
ADDRGP4 BotSortTeamMatesByBaseTravelTime
CALLI4
ASGNI4
ADDRLP4 296
ADDRLP4 308
INDIRI4
ASGNI4
line 679
;678:	//sort team mates by CTF preference
;679:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 296
INDIRI4
ARGI4
ADDRGP4 BotSortTeamMatesByTaskPreference
CALLI4
pop
line 681
;680:	//passive strategy
;681:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $321
line 683
;682:		//different orders based on the number of team mates
;683:		switch(numteammates) {
ADDRLP4 296
INDIRI4
CNSTI4 1
EQI4 $322
ADDRLP4 296
INDIRI4
CNSTI4 2
EQI4 $326
ADDRLP4 296
INDIRI4
CNSTI4 3
EQI4 $330
ADDRGP4 $323
JUMPV
line 684
;684:			case 1: break;
LABELV $326
line 686
;685:			case 2:
;686:			{
line 688
;687:				//the one closest to the base will defend the base
;688:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 689
;689:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $212
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 690
;690:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 691
;691:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $217
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 693
;692:				//the other will get the flag
;693:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 694
;694:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 695
;695:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 696
;696:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 $155
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 697
;697:				break;
ADDRGP4 $322
JUMPV
LABELV $330
line 700
;698:			}
;699:			case 3:
;700:			{
line 702
;701:				//the one closest to the base will defend the base
;702:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 703
;703:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $212
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 704
;704:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 705
;705:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $217
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 707
;706:				//the second one closest to the base will defend the base
;707:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 708
;708:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $212
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 709
;709:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 710
;710:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 $217
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 712
;711:				//the other will get the flag
;712:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 713
;713:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 714
;714:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 715
;715:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 $155
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 716
;716:				break;
ADDRGP4 $322
JUMPV
LABELV $323
line 719
;717:			}
;718:			default:
;719:			{
line 720
;720:				defenders = (int) (float) numteammates * 0.5 + 0.5;
ADDRLP4 316
CNSTF4 1056964608
ASGNF4
ADDRLP4 300
ADDRLP4 316
INDIRF4
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
ADDRLP4 316
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 721
;721:				if (defenders > 5) defenders = 5;
ADDRLP4 300
INDIRI4
CNSTI4 5
LEI4 $337
ADDRLP4 300
CNSTI4 5
ASGNI4
LABELV $337
line 722
;722:				attackers = (int) (float) numteammates * 0.4 + 0.5;
ADDRLP4 304
CNSTF4 1053609165
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 723
;723:				if (attackers > 4) attackers = 4;
ADDRLP4 304
INDIRI4
CNSTI4 4
LEI4 $339
ADDRLP4 304
CNSTI4 4
ASGNI4
LABELV $339
line 724
;724:				for (i = 0; i < defenders; i++) {
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRGP4 $344
JUMPV
LABELV $341
line 726
;725:					//
;726:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
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
line 727
;727:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $212
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 728
;728:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 729
;729:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 $217
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 730
;730:				}
LABELV $342
line 724
ADDRLP4 256
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $344
ADDRLP4 256
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $341
line 731
;731:				for (i = 0; i < attackers; i++) {
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRGP4 $348
JUMPV
LABELV $345
line 733
;732:					//
;733:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
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
line 734
;734:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 735
;735:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 736
;736:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $155
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 737
;737:				}
LABELV $346
line 731
ADDRLP4 256
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $348
ADDRLP4 256
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $345
line 739
;738:				//
;739:				break;
line 742
;740:			}
;741:		}
;742:	}
ADDRGP4 $322
JUMPV
LABELV $321
line 743
;743:	else {
line 745
;744:		//different orders based on the number of team mates
;745:		switch(numteammates) {
ADDRLP4 296
INDIRI4
CNSTI4 1
EQI4 $353
ADDRLP4 296
INDIRI4
CNSTI4 2
EQI4 $355
ADDRLP4 296
INDIRI4
CNSTI4 3
EQI4 $359
ADDRGP4 $352
JUMPV
line 746
;746:			case 1: break;
LABELV $355
line 748
;747:			case 2:
;748:			{
line 750
;749:				//the one closest to the base will defend the base
;750:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 751
;751:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $212
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 752
;752:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 753
;753:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $217
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 755
;754:				//the other will get the flag
;755:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 756
;756:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 757
;757:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 758
;758:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 $155
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 759
;759:				break;
ADDRGP4 $353
JUMPV
LABELV $359
line 762
;760:			}
;761:			case 3:
;762:			{
line 764
;763:				//the one closest to the base will defend the base
;764:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 765
;765:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $212
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 766
;766:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 767
;767:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $217
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 769
;768:				//the others should go for the enemy flag
;769:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 770
;770:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 771
;771:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 772
;772:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 $155
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 774
;773:				//
;774:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 775
;775:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 776
;776:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 777
;777:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 $155
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 778
;778:				break;
ADDRGP4 $353
JUMPV
LABELV $352
line 781
;779:			}
;780:			default:
;781:			{
line 782
;782:				defenders = (int) (float) numteammates * 0.4 + 0.5;
ADDRLP4 300
CNSTF4 1053609165
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 783
;783:				if (defenders > 4) defenders = 4;
ADDRLP4 300
INDIRI4
CNSTI4 4
LEI4 $366
ADDRLP4 300
CNSTI4 4
ASGNI4
LABELV $366
line 784
;784:				attackers = (int) (float) numteammates * 0.5 + 0.5;
ADDRLP4 316
CNSTF4 1056964608
ASGNF4
ADDRLP4 304
ADDRLP4 316
INDIRF4
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
ADDRLP4 316
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 785
;785:				if (attackers > 5) attackers = 5;
ADDRLP4 304
INDIRI4
CNSTI4 5
LEI4 $368
ADDRLP4 304
CNSTI4 5
ASGNI4
LABELV $368
line 786
;786:				for (i = 0; i < defenders; i++) {
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRGP4 $373
JUMPV
LABELV $370
line 788
;787:					//
;788:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
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
line 789
;789:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $212
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 790
;790:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 791
;791:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 $217
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 792
;792:				}
LABELV $371
line 786
ADDRLP4 256
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $373
ADDRLP4 256
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $370
line 793
;793:				for (i = 0; i < attackers; i++) {
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRGP4 $377
JUMPV
LABELV $374
line 795
;794:					//
;795:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
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
line 796
;796:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 797
;797:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 798
;798:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $155
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 799
;799:				}
LABELV $375
line 793
ADDRLP4 256
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $377
ADDRLP4 256
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $374
line 801
;800:				//
;801:				break;
LABELV $353
line 804
;802:			}
;803:		}
;804:	}
LABELV $322
line 805
;805:}
LABELV $320
endproc BotCTFOrders_BothFlagsAtBase 320 16
export BotCTFOrders
proc BotCTFOrders 20 4
line 812
;806:
;807:/*
;808:==================
;809:BotCTFOrders
;810:==================
;811:*/
;812:void BotCTFOrders(bot_state_t *bs) {
line 816
;813:	int flagstatus;
;814:
;815:	//
;816:	if (BotTeam(bs) == TEAM_RED) flagstatus = bs->redflagstatus * 2 + bs->blueflagstatus;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $382
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $383
JUMPV
LABELV $382
line 817
;817:	else flagstatus = bs->blueflagstatus * 2 + bs->redflagstatus;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
ADDI4
ASGNI4
LABELV $383
line 819
;818:	//
;819:	switch(flagstatus) {
ADDRLP4 16
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $384
ADDRLP4 16
INDIRI4
CNSTI4 3
GTI4 $384
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $390
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $390
address $386
address $387
address $388
address $389
code
LABELV $386
line 820
;820:		case 0: BotCTFOrders_BothFlagsAtBase(bs); break;
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFOrders_BothFlagsAtBase
CALLV
pop
ADDRGP4 $385
JUMPV
LABELV $387
line 821
;821:		case 1: BotCTFOrders_EnemyFlagNotAtBase(bs); break;
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFOrders_EnemyFlagNotAtBase
CALLV
pop
ADDRGP4 $385
JUMPV
LABELV $388
line 822
;822:		case 2: BotCTFOrders_FlagNotAtBase(bs); break;
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFOrders_FlagNotAtBase
CALLV
pop
ADDRGP4 $385
JUMPV
LABELV $389
line 823
;823:		case 3: BotCTFOrders_BothFlagsNotAtBase(bs); break;
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFOrders_BothFlagsNotAtBase
CALLV
pop
LABELV $384
LABELV $385
line 825
;824:	}
;825:}
LABELV $381
endproc BotCTFOrders 20 4
export BotCreateGroup
proc BotCreateGroup 76 20
line 833
;826:
;827:
;828:/*
;829:==================
;830:BotCreateGroup
;831:==================
;832:*/
;833:void BotCreateGroup(bot_state_t *bs, int *teammates, int groupsize) {
line 838
;834:	char name[MAX_NETNAME], leadername[MAX_NETNAME];
;835:	int i;
;836:
;837:	// the others in the group will follow the teammates[0]
;838:	ClientName(teammates[0], leadername, sizeof(leadername));
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 40
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 839
;839:	for (i = 1; i < groupsize; i++)
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $395
JUMPV
LABELV $392
line 840
;840:	{
line 841
;841:		ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 842
;842:		if (teammates[0] == bs->client) {
ADDRFP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $396
line 843
;843:			BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $164
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 844
;844:		}
ADDRGP4 $397
JUMPV
LABELV $396
line 845
;845:		else {
line 846
;846:			BotAI_BotInitialChat(bs, "cmd_accompany", name, leadername, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $166
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 40
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 847
;847:		}
LABELV $397
line 848
;848:		BotSayTeamOrderAlways(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrderAlways
CALLV
pop
line 849
;849:	}
LABELV $393
line 839
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $395
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $392
line 850
;850:}
LABELV $391
endproc BotCreateGroup 76 20
bss
align 4
LABELV $399
skip 4
export BotTeamOrders
code
proc BotTeamOrders 1316 12
line 859
;851:
;852:/*
;853:==================
;854:BotTeamOrders
;855:
;856:  FIXME: defend key areas?
;857:==================
;858:*/
;859:void BotTeamOrders(bot_state_t *bs) {
line 865
;860:	int teammates[MAX_CLIENTS];
;861:	int numteammates, i;
;862:	char buf[MAX_INFO_STRING];
;863:	static int maxclients;
;864:
;865:	if (!maxclients)
ADDRGP4 $399
INDIRI4
CNSTI4 0
NEI4 $400
line 866
;866:		maxclients = trap_Cvar_VariableIntegerValue("sv_maxclients");
ADDRGP4 $65
ARGP4
ADDRLP4 1288
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 $399
ADDRLP4 1288
INDIRI4
ASGNI4
LABELV $400
line 868
;867:
;868:	numteammates = 0;
ADDRLP4 1028
CNSTI4 0
ASGNI4
line 869
;869:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $405
JUMPV
LABELV $402
line 870
;870:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
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
line 872
;871:		//if no config string or no name
;872:		if (!strlen(buf) || !strlen(Info_ValueForKey(buf, "n"))) continue;
ADDRLP4 4
ARGP4
ADDRLP4 1292
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1292
INDIRI4
CNSTI4 0
EQI4 $408
ADDRLP4 4
ARGP4
ADDRGP4 $72
ARGP4
ADDRLP4 1296
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1296
INDIRP4
ARGP4
ADDRLP4 1300
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1300
INDIRI4
CNSTI4 0
NEI4 $406
LABELV $408
ADDRGP4 $403
JUMPV
LABELV $406
line 874
;873:		//skip spectators
;874:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR) continue;
ADDRLP4 4
ARGP4
ADDRGP4 $76
ARGP4
ADDRLP4 1304
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1304
INDIRP4
ARGP4
ADDRLP4 1308
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1308
INDIRI4
CNSTI4 3
NEI4 $409
ADDRGP4 $403
JUMPV
LABELV $409
line 876
;875:		//
;876:		if (BotSameTeam(bs, i)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1312
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1312
INDIRI4
CNSTI4 0
EQI4 $411
line 877
;877:			teammates[numteammates] = i;
ADDRLP4 1028
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1032
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 878
;878:			numteammates++;
ADDRLP4 1028
ADDRLP4 1028
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 879
;879:		}
LABELV $411
line 880
;880:	}
LABELV $403
line 869
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $405
ADDRLP4 0
INDIRI4
ADDRGP4 $399
INDIRI4
GEI4 $413
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $402
LABELV $413
line 882
;881:	//
;882:	switch(numteammates) {
ADDRLP4 1028
INDIRI4
CNSTI4 1
LTI4 $414
ADDRLP4 1028
INDIRI4
CNSTI4 5
GTI4 $414
ADDRLP4 1028
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $429-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $429
address $415
address $415
address $418
address $419
address $421
code
line 883
;883:		case 1: break;
line 885
;884:		case 2:
;885:		{
line 887
;886:			//nothing special
;887:			break;
LABELV $418
line 890
;888:		}
;889:		case 3:
;890:		{
line 892
;891:			//have one follow another and one free roaming
;892:			BotCreateGroup(bs, teammates, 2);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 BotCreateGroup
CALLV
pop
line 893
;893:			break;
ADDRGP4 $415
JUMPV
LABELV $419
line 896
;894:		}
;895:		case 4:
;896:		{
line 897
;897:			BotCreateGroup(bs, teammates, 2);		//a group of 2
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 BotCreateGroup
CALLV
pop
line 898
;898:			BotCreateGroup(bs, &teammates[2], 2);	//a group of 2
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032+8
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 BotCreateGroup
CALLV
pop
line 899
;899:			break;
ADDRGP4 $415
JUMPV
LABELV $421
line 902
;900:		}
;901:		case 5:
;902:		{
line 903
;903:			BotCreateGroup(bs, teammates, 2);		//a group of 2
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 BotCreateGroup
CALLV
pop
line 904
;904:			BotCreateGroup(bs, &teammates[2], 3);	//a group of 3
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032+8
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 BotCreateGroup
CALLV
pop
line 905
;905:			break;
ADDRGP4 $415
JUMPV
LABELV $414
line 908
;906:		}
;907:		default:
;908:		{
line 909
;909:			if (numteammates <= 10) {
ADDRLP4 1028
INDIRI4
CNSTI4 10
GTI4 $415
line 910
;910:				for (i = 0; i < numteammates / 2; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $428
JUMPV
LABELV $425
line 911
;911:					BotCreateGroup(bs, &teammates[i*2], 2);	//groups of 2
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1300
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 1300
INDIRI4
LSHI4
ADDRLP4 1032
ADDP4
ARGP4
ADDRLP4 1300
INDIRI4
ARGI4
ADDRGP4 BotCreateGroup
CALLV
pop
line 912
;912:				}
LABELV $426
line 910
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $428
ADDRLP4 0
INDIRI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
DIVI4
LTI4 $425
line 913
;913:			}
line 914
;914:			break;
LABELV $415
line 917
;915:		}
;916:	}
;917:}
LABELV $398
endproc BotTeamOrders 1316 12
export FindHumanTeamLeader
proc FindHumanTeamLeader 12 12
line 1879
;918:
;919:#ifdef MISSIONPACK
;920:
;921:/*
;922:==================
;923:Bot1FCTFOrders_FlagAtCenter
;924:
;925:  X% defend the base, Y% get the flag
;926:==================
;927:*/
;928:void Bot1FCTFOrders_FlagAtCenter(bot_state_t *bs) {
;929:	int numteammates, defenders, attackers, i;
;930:	int teammates[MAX_CLIENTS];
;931:	char name[MAX_NETNAME];
;932:
;933:	//sort team mates by travel time to base
;934:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
;935:	//sort team mates by CTF preference
;936:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
;937:	//passive strategy
;938:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
;939:		//different orders based on the number of team mates
;940:		switch(numteammates) {
;941:			case 1: break;
;942:			case 2:
;943:			{
;944:				//the one closest to the base will defend the base
;945:				ClientName(teammates[0], name, sizeof(name));
;946:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;947:				BotSayTeamOrder(bs, teammates[0]);
;948:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;949:				//the other will get the flag
;950:				ClientName(teammates[1], name, sizeof(name));
;951:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;952:				BotSayTeamOrder(bs, teammates[1]);
;953:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
;954:				break;
;955:			}
;956:			case 3:
;957:			{
;958:				//the one closest to the base will defend the base
;959:				ClientName(teammates[0], name, sizeof(name));
;960:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;961:				BotSayTeamOrder(bs, teammates[0]);
;962:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;963:				//the second one closest to the base will defend the base
;964:				ClientName(teammates[1], name, sizeof(name));
;965:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;966:				BotSayTeamOrder(bs, teammates[1]);
;967:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;968:				//the other will get the flag
;969:				ClientName(teammates[2], name, sizeof(name));
;970:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;971:				BotSayTeamOrder(bs, teammates[2]);
;972:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
;973:				break;
;974:			}
;975:			default:
;976:			{
;977:				//50% defend the base
;978:				defenders = (int) (float) numteammates * 0.5 + 0.5;
;979:				if (defenders > 5) defenders = 5;
;980:				//40% get the flag
;981:				attackers = (int) (float) numteammates * 0.4 + 0.5;
;982:				if (attackers > 4) attackers = 4;
;983:				for (i = 0; i < defenders; i++) {
;984:					//
;985:					ClientName(teammates[i], name, sizeof(name));
;986:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;987:					BotSayTeamOrder(bs, teammates[i]);
;988:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;989:				}
;990:				for (i = 0; i < attackers; i++) {
;991:					//
;992:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;993:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;994:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;995:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
;996:				}
;997:				//
;998:				break;
;999:			}
;1000:		}
;1001:	}
;1002:	else { //agressive
;1003:		//different orders based on the number of team mates
;1004:		switch(numteammates) {
;1005:			case 1: break;
;1006:			case 2:
;1007:			{
;1008:				//the one closest to the base will defend the base
;1009:				ClientName(teammates[0], name, sizeof(name));
;1010:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1011:				BotSayTeamOrder(bs, teammates[0]);
;1012:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1013:				//the other will get the flag
;1014:				ClientName(teammates[1], name, sizeof(name));
;1015:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1016:				BotSayTeamOrder(bs, teammates[1]);
;1017:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
;1018:				break;
;1019:			}
;1020:			case 3:
;1021:			{
;1022:				//the one closest to the base will defend the base
;1023:				ClientName(teammates[0], name, sizeof(name));
;1024:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1025:				BotSayTeamOrder(bs, teammates[0]);
;1026:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1027:				//the others should go for the enemy flag
;1028:				ClientName(teammates[1], name, sizeof(name));
;1029:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1030:				BotSayTeamOrder(bs, teammates[1]);
;1031:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
;1032:				//
;1033:				ClientName(teammates[2], name, sizeof(name));
;1034:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1035:				BotSayTeamOrder(bs, teammates[2]);
;1036:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
;1037:				break;
;1038:			}
;1039:			default:
;1040:			{
;1041:				//30% defend the base
;1042:				defenders = (int) (float) numteammates * 0.3 + 0.5;
;1043:				if (defenders > 3) defenders = 3;
;1044:				//60% get the flag
;1045:				attackers = (int) (float) numteammates * 0.6 + 0.5;
;1046:				if (attackers > 6) attackers = 6;
;1047:				for (i = 0; i < defenders; i++) {
;1048:					//
;1049:					ClientName(teammates[i], name, sizeof(name));
;1050:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1051:					BotSayTeamOrder(bs, teammates[i]);
;1052:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1053:				}
;1054:				for (i = 0; i < attackers; i++) {
;1055:					//
;1056:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1057:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1058:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1059:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
;1060:				}
;1061:				//
;1062:				break;
;1063:			}
;1064:		}
;1065:	}
;1066:}
;1067:
;1068:/*
;1069:==================
;1070:Bot1FCTFOrders_TeamHasFlag
;1071:
;1072:  X% towards neutral flag, Y% go towards enemy base and accompany flag carrier if visible
;1073:==================
;1074:*/
;1075:void Bot1FCTFOrders_TeamHasFlag(bot_state_t *bs) {
;1076:	int numteammates, defenders, attackers, i, other;
;1077:	int teammates[MAX_CLIENTS];
;1078:	char name[MAX_NETNAME], carriername[MAX_NETNAME];
;1079:
;1080:	//sort team mates by travel time to base
;1081:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
;1082:	//sort team mates by CTF preference
;1083:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
;1084:	//passive strategy
;1085:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
;1086:		//different orders based on the number of team mates
;1087:		switch(numteammates) {
;1088:			case 1: break;
;1089:			case 2:
;1090:			{
;1091:				//tell the one not carrying the flag to attack the enemy base
;1092:				if (teammates[0] == bs->flagcarrier) other = teammates[1];
;1093:				else other = teammates[0];
;1094:				ClientName(other, name, sizeof(name));
;1095:				BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
;1096:				BotSayTeamOrder(bs, other);
;1097:				BotSayVoiceTeamOrder(bs, other, VOICECHAT_OFFENSE);
;1098:				break;
;1099:			}
;1100:			case 3:
;1101:			{
;1102:				//tell the one closest to the base not carrying the flag to defend the base
;1103:				if (teammates[0] != bs->flagcarrier) other = teammates[0];
;1104:				else other = teammates[1];
;1105:				ClientName(other, name, sizeof(name));
;1106:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1107:				BotSayTeamOrder(bs, other);
;1108:				BotSayVoiceTeamOrder(bs, other, VOICECHAT_DEFEND);
;1109:				//tell the one furthest from the base not carrying the flag to accompany the flag carrier
;1110:				if (teammates[2] != bs->flagcarrier) other = teammates[2];
;1111:				else other = teammates[1];
;1112:				ClientName(other, name, sizeof(name));
;1113:				if ( bs->flagcarrier != -1 ) {
;1114:					ClientName(bs->flagcarrier, carriername, sizeof(carriername));
;1115:					if (bs->flagcarrier == bs->client) {
;1116:						BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
;1117:						BotSayVoiceTeamOrder(bs, other, VOICECHAT_FOLLOWME);
;1118:					}
;1119:					else {
;1120:						BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
;1121:						BotSayVoiceTeamOrder(bs, other, VOICECHAT_FOLLOWFLAGCARRIER);
;1122:					}
;1123:				}
;1124:				else {
;1125:					//
;1126:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1127:					BotSayVoiceTeamOrder(bs, other, VOICECHAT_GETFLAG);
;1128:				}
;1129:				BotSayTeamOrder(bs, other);
;1130:				break;
;1131:			}
;1132:			default:
;1133:			{
;1134:				//30% will defend the base
;1135:				defenders = (int) (float) numteammates * 0.3 + 0.5;
;1136:				if (defenders > 3) defenders = 3;
;1137:				//70% accompanies the flag carrier
;1138:				attackers = (int) (float) numteammates * 0.7 + 0.5;
;1139:				if (attackers > 7) attackers = 7;
;1140:				for (i = 0; i < defenders; i++) {
;1141:					//
;1142:					if (teammates[i] == bs->flagcarrier) {
;1143:						continue;
;1144:					}
;1145:					ClientName(teammates[i], name, sizeof(name));
;1146:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1147:					BotSayTeamOrder(bs, teammates[i]);
;1148:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1149:				}
;1150:				if (bs->flagcarrier != -1) {
;1151:					ClientName(bs->flagcarrier, carriername, sizeof(carriername));
;1152:					for (i = 0; i < attackers; i++) {
;1153:						//
;1154:						if (teammates[numteammates - i - 1] == bs->flagcarrier) {
;1155:							continue;
;1156:						}
;1157:						//
;1158:						ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1159:						if (bs->flagcarrier == bs->client) {
;1160:							BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
;1161:							BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_FOLLOWME);
;1162:						}
;1163:						else {
;1164:							BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
;1165:							BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_FOLLOWFLAGCARRIER);
;1166:						}
;1167:						BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1168:					}
;1169:				}
;1170:				else {
;1171:					for (i = 0; i < attackers; i++) {
;1172:						//
;1173:						if (teammates[numteammates - i - 1] == bs->flagcarrier) {
;1174:							continue;
;1175:						}
;1176:						//
;1177:						ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1178:						BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1179:						BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1180:						BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
;1181:					}
;1182:				}
;1183:				//
;1184:				break;
;1185:			}
;1186:		}
;1187:	}
;1188:	else { //agressive
;1189:		//different orders based on the number of team mates
;1190:		switch(numteammates) {
;1191:			case 1: break;
;1192:			case 2:
;1193:			{
;1194:				//tell the one not carrying the flag to defend the base
;1195:				if (teammates[0] == bs->flagcarrier) other = teammates[1];
;1196:				else other = teammates[0];
;1197:				ClientName(other, name, sizeof(name));
;1198:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1199:				BotSayTeamOrder(bs, other);
;1200:				BotSayVoiceTeamOrder(bs, other, VOICECHAT_DEFEND);
;1201:				break;
;1202:			}
;1203:			case 3:
;1204:			{
;1205:				//tell the one closest to the base not carrying the flag to defend the base
;1206:				if (teammates[0] != bs->flagcarrier) other = teammates[0];
;1207:				else other = teammates[1];
;1208:				ClientName(other, name, sizeof(name));
;1209:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1210:				BotSayTeamOrder(bs, other);
;1211:				BotSayVoiceTeamOrder(bs, other, VOICECHAT_DEFEND);
;1212:				//tell the one furthest from the base not carrying the flag to accompany the flag carrier
;1213:				if (teammates[2] != bs->flagcarrier) other = teammates[2];
;1214:				else other = teammates[1];
;1215:				ClientName(other, name, sizeof(name));
;1216:				ClientName(bs->flagcarrier, carriername, sizeof(carriername));
;1217:				if (bs->flagcarrier == bs->client) {
;1218:					BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
;1219:					BotSayVoiceTeamOrder(bs, other, VOICECHAT_FOLLOWME);
;1220:				}
;1221:				else {
;1222:					BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
;1223:					BotSayVoiceTeamOrder(bs, other, VOICECHAT_FOLLOWFLAGCARRIER);
;1224:				}
;1225:				BotSayTeamOrder(bs, other);
;1226:				break;
;1227:			}
;1228:			default:
;1229:			{
;1230:				//20% will defend the base
;1231:				defenders = (int) (float) numteammates * 0.2 + 0.5;
;1232:				if (defenders > 2) defenders = 2;
;1233:				//80% accompanies the flag carrier
;1234:				attackers = (int) (float) numteammates * 0.8 + 0.5;
;1235:				if (attackers > 8) attackers = 8;
;1236:				for (i = 0; i < defenders; i++) {
;1237:					//
;1238:					if (teammates[i] == bs->flagcarrier) {
;1239:						continue;
;1240:					}
;1241:					ClientName(teammates[i], name, sizeof(name));
;1242:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1243:					BotSayTeamOrder(bs, teammates[i]);
;1244:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1245:				}
;1246:				ClientName(bs->flagcarrier, carriername, sizeof(carriername));
;1247:				for (i = 0; i < attackers; i++) {
;1248:					//
;1249:					if (teammates[numteammates - i - 1] == bs->flagcarrier) {
;1250:						continue;
;1251:					}
;1252:					//
;1253:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1254:					if (bs->flagcarrier == bs->client) {
;1255:						BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
;1256:						BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_FOLLOWME);
;1257:					}
;1258:					else {
;1259:						BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
;1260:						BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_FOLLOWFLAGCARRIER);
;1261:					}
;1262:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1263:				}
;1264:				//
;1265:				break;
;1266:			}
;1267:		}
;1268:	}
;1269:}
;1270:
;1271:/*
;1272:==================
;1273:Bot1FCTFOrders_EnemyHasFlag
;1274:
;1275:  X% defend the base, Y% towards neutral flag
;1276:==================
;1277:*/
;1278:void Bot1FCTFOrders_EnemyHasFlag(bot_state_t *bs) {
;1279:	int numteammates, defenders, attackers, i;
;1280:	int teammates[MAX_CLIENTS];
;1281:	char name[MAX_NETNAME];
;1282:
;1283:	//sort team mates by travel time to base
;1284:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
;1285:	//sort team mates by CTF preference
;1286:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
;1287:	//passive strategy
;1288:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
;1289:		//different orders based on the number of team mates
;1290:		switch(numteammates) {
;1291:			case 1: break;
;1292:			case 2:
;1293:			{
;1294:				//both defend the base
;1295:				ClientName(teammates[0], name, sizeof(name));
;1296:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1297:				BotSayTeamOrder(bs, teammates[0]);
;1298:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1299:				//
;1300:				ClientName(teammates[1], name, sizeof(name));
;1301:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1302:				BotSayTeamOrder(bs, teammates[1]);
;1303:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_DEFEND);
;1304:				break;
;1305:			}
;1306:			case 3:
;1307:			{
;1308:				//the one closest to the base will defend the base
;1309:				ClientName(teammates[0], name, sizeof(name));
;1310:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1311:				BotSayTeamOrder(bs, teammates[0]);
;1312:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1313:				//the second one closest to the base will defend the base
;1314:				ClientName(teammates[1], name, sizeof(name));
;1315:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1316:				BotSayTeamOrder(bs, teammates[1]);
;1317:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_DEFEND);
;1318:				//the other will also defend the base
;1319:				ClientName(teammates[2], name, sizeof(name));
;1320:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1321:				BotSayTeamOrder(bs, teammates[2]);
;1322:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_DEFEND);
;1323:				break;
;1324:			}
;1325:			default:
;1326:			{
;1327:				//80% will defend the base
;1328:				defenders = (int) (float) numteammates * 0.8 + 0.5;
;1329:				if (defenders > 8) defenders = 8;
;1330:				//10% will try to return the flag
;1331:				attackers = (int) (float) numteammates * 0.1 + 0.5;
;1332:				if (attackers > 2) attackers = 2;
;1333:				for (i = 0; i < defenders; i++) {
;1334:					//
;1335:					ClientName(teammates[i], name, sizeof(name));
;1336:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1337:					BotSayTeamOrder(bs, teammates[i]);
;1338:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1339:				}
;1340:				for (i = 0; i < attackers; i++) {
;1341:					//
;1342:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1343:					BotAI_BotInitialChat(bs, "cmd_returnflag", name, NULL);
;1344:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1345:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
;1346:				}
;1347:				//
;1348:				break;
;1349:			}
;1350:		}
;1351:	}
;1352:	else { //agressive
;1353:		//different orders based on the number of team mates
;1354:		switch(numteammates) {
;1355:			case 1: break;
;1356:			case 2:
;1357:			{
;1358:				//the one closest to the base will defend the base
;1359:				ClientName(teammates[0], name, sizeof(name));
;1360:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1361:				BotSayTeamOrder(bs, teammates[0]);
;1362:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1363:				//the other will get the flag
;1364:				ClientName(teammates[1], name, sizeof(name));
;1365:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1366:				BotSayTeamOrder(bs, teammates[1]);
;1367:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_DEFEND);
;1368:				break;
;1369:			}
;1370:			case 3:
;1371:			{
;1372:				//the one closest to the base will defend the base
;1373:				ClientName(teammates[0], name, sizeof(name));
;1374:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1375:				BotSayTeamOrder(bs, teammates[0]);
;1376:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1377:				//the others should go for the enemy flag
;1378:				ClientName(teammates[1], name, sizeof(name));
;1379:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1380:				BotSayTeamOrder(bs, teammates[1]);
;1381:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_DEFEND);
;1382:				//
;1383:				ClientName(teammates[2], name, sizeof(name));
;1384:				BotAI_BotInitialChat(bs, "cmd_returnflag", name, NULL);
;1385:				BotSayTeamOrder(bs, teammates[2]);
;1386:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
;1387:				break;
;1388:			}
;1389:			default:
;1390:			{
;1391:				//70% defend the base
;1392:				defenders = (int) (float) numteammates * 0.7 + 0.5;
;1393:				if (defenders > 8) defenders = 8;
;1394:				//20% try to return the flag
;1395:				attackers = (int) (float) numteammates * 0.2 + 0.5;
;1396:				if (attackers > 2) attackers = 2;
;1397:				for (i = 0; i < defenders; i++) {
;1398:					//
;1399:					ClientName(teammates[i], name, sizeof(name));
;1400:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1401:					BotSayTeamOrder(bs, teammates[i]);
;1402:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1403:				}
;1404:				for (i = 0; i < attackers; i++) {
;1405:					//
;1406:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1407:					BotAI_BotInitialChat(bs, "cmd_returnflag", name, NULL);
;1408:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1409:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
;1410:				}
;1411:				//
;1412:				break;
;1413:			}
;1414:		}
;1415:	}
;1416:}
;1417:
;1418:/*
;1419:==================
;1420:Bot1FCTFOrders_EnemyDroppedFlag
;1421:
;1422:  X% defend the base, Y% get the flag
;1423:==================
;1424:*/
;1425:void Bot1FCTFOrders_EnemyDroppedFlag(bot_state_t *bs) {
;1426:	int numteammates, defenders, attackers, i;
;1427:	int teammates[MAX_CLIENTS];
;1428:	char name[MAX_NETNAME];
;1429:
;1430:	//sort team mates by travel time to base
;1431:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
;1432:	//sort team mates by CTF preference
;1433:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
;1434:	//passive strategy
;1435:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
;1436:		//different orders based on the number of team mates
;1437:		switch(numteammates) {
;1438:			case 1: break;
;1439:			case 2:
;1440:			{
;1441:				//the one closest to the base will defend the base
;1442:				ClientName(teammates[0], name, sizeof(name));
;1443:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1444:				BotSayTeamOrder(bs, teammates[0]);
;1445:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1446:				//the other will get the flag
;1447:				ClientName(teammates[1], name, sizeof(name));
;1448:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1449:				BotSayTeamOrder(bs, teammates[1]);
;1450:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
;1451:				break;
;1452:			}
;1453:			case 3:
;1454:			{
;1455:				//the one closest to the base will defend the base
;1456:				ClientName(teammates[0], name, sizeof(name));
;1457:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1458:				BotSayTeamOrder(bs, teammates[0]);
;1459:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1460:				//the second one closest to the base will defend the base
;1461:				ClientName(teammates[1], name, sizeof(name));
;1462:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1463:				BotSayTeamOrder(bs, teammates[1]);
;1464:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_DEFEND);
;1465:				//the other will get the flag
;1466:				ClientName(teammates[2], name, sizeof(name));
;1467:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1468:				BotSayTeamOrder(bs, teammates[2]);
;1469:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
;1470:				break;
;1471:			}
;1472:			default:
;1473:			{
;1474:				//50% defend the base
;1475:				defenders = (int) (float) numteammates * 0.5 + 0.5;
;1476:				if (defenders > 5) defenders = 5;
;1477:				//40% get the flag
;1478:				attackers = (int) (float) numteammates * 0.4 + 0.5;
;1479:				if (attackers > 4) attackers = 4;
;1480:				for (i = 0; i < defenders; i++) {
;1481:					//
;1482:					ClientName(teammates[i], name, sizeof(name));
;1483:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1484:					BotSayTeamOrder(bs, teammates[i]);
;1485:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1486:				}
;1487:				for (i = 0; i < attackers; i++) {
;1488:					//
;1489:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1490:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1491:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1492:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
;1493:				}
;1494:				//
;1495:				break;
;1496:			}
;1497:		}
;1498:	}
;1499:	else { //agressive
;1500:		//different orders based on the number of team mates
;1501:		switch(numteammates) {
;1502:			case 1: break;
;1503:			case 2:
;1504:			{
;1505:				//the one closest to the base will defend the base
;1506:				ClientName(teammates[0], name, sizeof(name));
;1507:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1508:				BotSayTeamOrder(bs, teammates[0]);
;1509:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1510:				//the other will get the flag
;1511:				ClientName(teammates[1], name, sizeof(name));
;1512:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1513:				BotSayTeamOrder(bs, teammates[1]);
;1514:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
;1515:				break;
;1516:			}
;1517:			case 3:
;1518:			{
;1519:				//the one closest to the base will defend the base
;1520:				ClientName(teammates[0], name, sizeof(name));
;1521:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1522:				BotSayTeamOrder(bs, teammates[0]);
;1523:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1524:				//the others should go for the enemy flag
;1525:				ClientName(teammates[1], name, sizeof(name));
;1526:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1527:				BotSayTeamOrder(bs, teammates[1]);
;1528:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
;1529:				//
;1530:				ClientName(teammates[2], name, sizeof(name));
;1531:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1532:				BotSayTeamOrder(bs, teammates[2]);
;1533:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
;1534:				break;
;1535:			}
;1536:			default:
;1537:			{
;1538:				//30% defend the base
;1539:				defenders = (int) (float) numteammates * 0.3 + 0.5;
;1540:				if (defenders > 3) defenders = 3;
;1541:				//60% get the flag
;1542:				attackers = (int) (float) numteammates * 0.6 + 0.5;
;1543:				if (attackers > 6) attackers = 6;
;1544:				for (i = 0; i < defenders; i++) {
;1545:					//
;1546:					ClientName(teammates[i], name, sizeof(name));
;1547:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1548:					BotSayTeamOrder(bs, teammates[i]);
;1549:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1550:				}
;1551:				for (i = 0; i < attackers; i++) {
;1552:					//
;1553:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1554:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1555:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1556:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_DEFEND);
;1557:				}
;1558:				//
;1559:				break;
;1560:			}
;1561:		}
;1562:	}
;1563:}
;1564:
;1565:/*
;1566:==================
;1567:Bot1FCTFOrders
;1568:==================
;1569:*/
;1570:void Bot1FCTFOrders(bot_state_t *bs) {
;1571:	switch(bs->neutralflagstatus) {
;1572:		case 0: Bot1FCTFOrders_FlagAtCenter(bs); break;
;1573:		case 1: Bot1FCTFOrders_TeamHasFlag(bs); break;
;1574:		case 2: Bot1FCTFOrders_EnemyHasFlag(bs); break;
;1575:		case 3: Bot1FCTFOrders_EnemyDroppedFlag(bs); break;
;1576:	}
;1577:}
;1578:
;1579:/*
;1580:==================
;1581:BotObeliskOrders
;1582:
;1583:  X% in defence Y% in offence
;1584:==================
;1585:*/
;1586:void BotObeliskOrders(bot_state_t *bs) {
;1587:	int numteammates, defenders, attackers, i;
;1588:	int teammates[MAX_CLIENTS];
;1589:	char name[MAX_NETNAME];
;1590:
;1591:	//sort team mates by travel time to base
;1592:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
;1593:	//sort team mates by CTF preference
;1594:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
;1595:	//passive strategy
;1596:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
;1597:		//different orders based on the number of team mates
;1598:		switch(numteammates) {
;1599:			case 1: break;
;1600:			case 2:
;1601:			{
;1602:				//the one closest to the base will defend the base
;1603:				ClientName(teammates[0], name, sizeof(name));
;1604:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1605:				BotSayTeamOrder(bs, teammates[0]);
;1606:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1607:				//the other will attack the enemy base
;1608:				ClientName(teammates[1], name, sizeof(name));
;1609:				BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
;1610:				BotSayTeamOrder(bs, teammates[1]);
;1611:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_OFFENSE);
;1612:				break;
;1613:			}
;1614:			case 3:
;1615:			{
;1616:				//the one closest to the base will defend the base
;1617:				ClientName(teammates[0], name, sizeof(name));
;1618:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1619:				BotSayTeamOrder(bs, teammates[0]);
;1620:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1621:				//the one second closest to the base also defends the base
;1622:				ClientName(teammates[1], name, sizeof(name));
;1623:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1624:				BotSayTeamOrder(bs, teammates[1]);
;1625:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_DEFEND);
;1626:				//the other one attacks the enemy base
;1627:				ClientName(teammates[2], name, sizeof(name));
;1628:				BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
;1629:				BotSayTeamOrder(bs, teammates[2]);
;1630:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_OFFENSE);
;1631:				break;
;1632:			}
;1633:			default:
;1634:			{
;1635:				//50% defend the base
;1636:				defenders = (int) (float) numteammates * 0.5 + 0.5;
;1637:				if (defenders > 5) defenders = 5;
;1638:				//40% attack the enemy base
;1639:				attackers = (int) (float) numteammates * 0.4 + 0.5;
;1640:				if (attackers > 4) attackers = 4;
;1641:				for (i = 0; i < defenders; i++) {
;1642:					//
;1643:					ClientName(teammates[i], name, sizeof(name));
;1644:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1645:					BotSayTeamOrder(bs, teammates[i]);
;1646:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1647:				}
;1648:				for (i = 0; i < attackers; i++) {
;1649:					//
;1650:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1651:					BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
;1652:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1653:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_OFFENSE);
;1654:				}
;1655:				//
;1656:				break;
;1657:			}
;1658:		}
;1659:	}
;1660:	else {
;1661:		//different orders based on the number of team mates
;1662:		switch(numteammates) {
;1663:			case 1: break;
;1664:			case 2:
;1665:			{
;1666:				//the one closest to the base will defend the base
;1667:				ClientName(teammates[0], name, sizeof(name));
;1668:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1669:				BotSayTeamOrder(bs, teammates[0]);
;1670:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1671:				//the other will attack the enemy base
;1672:				ClientName(teammates[1], name, sizeof(name));
;1673:				BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
;1674:				BotSayTeamOrder(bs, teammates[1]);
;1675:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_OFFENSE);
;1676:				break;
;1677:			}
;1678:			case 3:
;1679:			{
;1680:				//the one closest to the base will defend the base
;1681:				ClientName(teammates[0], name, sizeof(name));
;1682:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1683:				BotSayTeamOrder(bs, teammates[0]);
;1684:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1685:				//the others attack the enemy base
;1686:				ClientName(teammates[1], name, sizeof(name));
;1687:				BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
;1688:				BotSayTeamOrder(bs, teammates[1]);
;1689:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_OFFENSE);
;1690:				//
;1691:				ClientName(teammates[2], name, sizeof(name));
;1692:				BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
;1693:				BotSayTeamOrder(bs, teammates[2]);
;1694:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_OFFENSE);
;1695:				break;
;1696:			}
;1697:			default:
;1698:			{
;1699:				//30% defend the base
;1700:				defenders = (int) (float) numteammates * 0.3 + 0.5;
;1701:				if (defenders > 3) defenders = 3;
;1702:				//70% attack the enemy base
;1703:				attackers = (int) (float) numteammates * 0.7 + 0.5;
;1704:				if (attackers > 7) attackers = 7;
;1705:				for (i = 0; i < defenders; i++) {
;1706:					//
;1707:					ClientName(teammates[i], name, sizeof(name));
;1708:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1709:					BotSayTeamOrder(bs, teammates[i]);
;1710:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1711:				}
;1712:				for (i = 0; i < attackers; i++) {
;1713:					//
;1714:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1715:					BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
;1716:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1717:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_OFFENSE);
;1718:				}
;1719:				//
;1720:				break;
;1721:			}
;1722:		}
;1723:	}
;1724:}
;1725:
;1726:/*
;1727:==================
;1728:BotHarvesterOrders
;1729:
;1730:  X% defend the base, Y% harvest
;1731:==================
;1732:*/
;1733:void BotHarvesterOrders(bot_state_t *bs) {
;1734:	int numteammates, defenders, attackers, i;
;1735:	int teammates[MAX_CLIENTS];
;1736:	char name[MAX_NETNAME];
;1737:
;1738:	//sort team mates by travel time to base
;1739:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
;1740:	//sort team mates by CTF preference
;1741:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
;1742:	//passive strategy
;1743:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
;1744:		//different orders based on the number of team mates
;1745:		switch(numteammates) {
;1746:			case 1: break;
;1747:			case 2:
;1748:			{
;1749:				//the one closest to the base will defend the base
;1750:				ClientName(teammates[0], name, sizeof(name));
;1751:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1752:				BotSayTeamOrder(bs, teammates[0]);
;1753:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1754:				//the other will harvest
;1755:				ClientName(teammates[1], name, sizeof(name));
;1756:				BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
;1757:				BotSayTeamOrder(bs, teammates[1]);
;1758:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_OFFENSE);
;1759:				break;
;1760:			}
;1761:			case 3:
;1762:			{
;1763:				//the one closest to the base will defend the base
;1764:				ClientName(teammates[0], name, sizeof(name));
;1765:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1766:				BotSayTeamOrder(bs, teammates[0]);
;1767:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1768:				//the one second closest to the base also defends the base
;1769:				ClientName(teammates[1], name, sizeof(name));
;1770:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1771:				BotSayTeamOrder(bs, teammates[1]);
;1772:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_DEFEND);
;1773:				//the other one goes harvesting
;1774:				ClientName(teammates[2], name, sizeof(name));
;1775:				BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
;1776:				BotSayTeamOrder(bs, teammates[2]);
;1777:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_OFFENSE);
;1778:				break;
;1779:			}
;1780:			default:
;1781:			{
;1782:				//50% defend the base
;1783:				defenders = (int) (float) numteammates * 0.5 + 0.5;
;1784:				if (defenders > 5) defenders = 5;
;1785:				//40% goes harvesting
;1786:				attackers = (int) (float) numteammates * 0.4 + 0.5;
;1787:				if (attackers > 4) attackers = 4;
;1788:				for (i = 0; i < defenders; i++) {
;1789:					//
;1790:					ClientName(teammates[i], name, sizeof(name));
;1791:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1792:					BotSayTeamOrder(bs, teammates[i]);
;1793:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1794:				}
;1795:				for (i = 0; i < attackers; i++) {
;1796:					//
;1797:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1798:					BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
;1799:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1800:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_OFFENSE);
;1801:				}
;1802:				//
;1803:				break;
;1804:			}
;1805:		}
;1806:	}
;1807:	else {
;1808:		//different orders based on the number of team mates
;1809:		switch(numteammates) {
;1810:			case 1: break;
;1811:			case 2:
;1812:			{
;1813:				//the one closest to the base will defend the base
;1814:				ClientName(teammates[0], name, sizeof(name));
;1815:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1816:				BotSayTeamOrder(bs, teammates[0]);
;1817:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1818:				//the other will harvest
;1819:				ClientName(teammates[1], name, sizeof(name));
;1820:				BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
;1821:				BotSayTeamOrder(bs, teammates[1]);
;1822:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_OFFENSE);
;1823:				break;
;1824:			}
;1825:			case 3:
;1826:			{
;1827:				//the one closest to the base will defend the base
;1828:				ClientName(teammates[0], name, sizeof(name));
;1829:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1830:				BotSayTeamOrder(bs, teammates[0]);
;1831:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1832:				//the others go harvesting
;1833:				ClientName(teammates[1], name, sizeof(name));
;1834:				BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
;1835:				BotSayTeamOrder(bs, teammates[1]);
;1836:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_OFFENSE);
;1837:				//
;1838:				ClientName(teammates[2], name, sizeof(name));
;1839:				BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
;1840:				BotSayTeamOrder(bs, teammates[2]);
;1841:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_OFFENSE);
;1842:				break;
;1843:			}
;1844:			default:
;1845:			{
;1846:				//30% defend the base
;1847:				defenders = (int) (float) numteammates * 0.3 + 0.5;
;1848:				if (defenders > 3) defenders = 3;
;1849:				//70% go harvesting
;1850:				attackers = (int) (float) numteammates * 0.7 + 0.5;
;1851:				if (attackers > 7) attackers = 7;
;1852:				for (i = 0; i < defenders; i++) {
;1853:					//
;1854:					ClientName(teammates[i], name, sizeof(name));
;1855:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1856:					BotSayTeamOrder(bs, teammates[i]);
;1857:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1858:				}
;1859:				for (i = 0; i < attackers; i++) {
;1860:					//
;1861:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1862:					BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
;1863:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1864:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_OFFENSE);
;1865:				}
;1866:				//
;1867:				break;
;1868:			}
;1869:		}
;1870:	}
;1871:}
;1872:#endif
;1873:
;1874:/*
;1875:==================
;1876:FindHumanTeamLeader
;1877:==================
;1878:*/
;1879:int FindHumanTeamLeader(bot_state_t *bs) {
line 1882
;1880:	int i;
;1881:
;1882:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $432
line 1883
;1883:		if ( g_entities[i].inuse ) {
CNSTI4 824
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $436
line 1885
;1884:			// if this player is not a bot
;1885:			if ( !(g_entities[i].r.svFlags & SVF_BOT) ) {
CNSTI4 824
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+208+216
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $439
line 1887
;1886:				// if this player is ok with being the leader
;1887:				if (!notleader[i]) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 notleader
ADDP4
INDIRI4
CNSTI4 0
NEI4 $443
line 1889
;1888:					// if this player is on the same team
;1889:					if ( BotSameTeam(bs, i) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $445
line 1890
;1890:						ClientName(i, bs->teamleader, sizeof(bs->teamleader));
ADDRLP4 0
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
line 1892
;1891:						// if not yet ordered to do anything
;1892:						if ( !BotSetLastOrderedTask(bs) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotSetLastOrderedTask
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $447
line 1894
;1893:							// go on defense by default
;1894:							BotVoiceChat_Defend(bs, i, SAY_TELL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 BotVoiceChat_Defend
CALLV
pop
line 1895
;1895:						}
LABELV $447
line 1896
;1896:						return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $431
JUMPV
LABELV $445
line 1898
;1897:					}
;1898:				}
LABELV $443
line 1899
;1899:			}
LABELV $439
line 1900
;1900:		}
LABELV $436
line 1901
;1901:	}
LABELV $433
line 1882
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $432
line 1902
;1902:	return qfalse;
CNSTI4 0
RETI4
LABELV $431
endproc FindHumanTeamLeader 12 12
export BotTeamAI
proc BotTeamAI 72 12
line 1910
;1903:}
;1904:
;1905:/*
;1906:==================
;1907:BotTeamAI
;1908:==================
;1909:*/
;1910:void BotTeamAI(bot_state_t *bs) {
line 1915
;1911:	int numteammates;
;1912:	char netname[MAX_NETNAME];
;1913:
;1914:	//
;1915:	if ( gametype < GT_TEAM  )
ADDRGP4 gametype
INDIRI4
CNSTI4 3
GEI4 $450
line 1916
;1916:		return;
ADDRGP4 $449
JUMPV
LABELV $450
line 1918
;1917:	// make sure we've got a valid team leader
;1918:	if (!BotValidTeamLeader(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 BotValidTeamLeader
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $452
line 1920
;1919:		//
;1920:		if (!FindHumanTeamLeader(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 FindHumanTeamLeader
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $454
line 1922
;1921:			//
;1922:			if (!bs->askteamleader_time && !bs->becometeamleader_time) {
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
CNSTF4 0
ASGNF4
ADDRLP4 48
INDIRP4
CNSTI4 6932
ADDP4
INDIRF4
ADDRLP4 52
INDIRF4
NEF4 $456
ADDRLP4 48
INDIRP4
CNSTI4 6936
ADDP4
INDIRF4
ADDRLP4 52
INDIRF4
NEF4 $456
line 1923
;1923:				if (bs->entergame_time + 10 > FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6064
ADDP4
INDIRF4
CNSTF4 1092616192
ADDF4
ADDRGP4 floattime
INDIRF4
LEF4 $458
line 1924
;1924:					bs->askteamleader_time = FloatTime() + 5 + random() * 10;
ADDRLP4 56
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6932
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CNSTF4 1092616192
ADDRLP4 56
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 1925
;1925:				}
ADDRGP4 $459
JUMPV
LABELV $458
line 1926
;1926:				else {
line 1927
;1927:					bs->becometeamleader_time = FloatTime() + 5 + random() * 10;
ADDRLP4 56
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6936
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CNSTF4 1092616192
ADDRLP4 56
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 1928
;1928:				}
LABELV $459
line 1929
;1929:			}
LABELV $456
line 1930
;1930:			if (bs->askteamleader_time && bs->askteamleader_time < FloatTime()) {
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 6932
ADDP4
INDIRF4
ASGNF4
ADDRLP4 56
INDIRF4
CNSTF4 0
EQF4 $460
ADDRLP4 56
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $460
line 1932
;1931:				// if asked for a team leader and no response
;1932:				BotAI_BotInitialChat(bs, "whoisteamleader", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $462
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1933
;1933:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1934
;1934:				bs->askteamleader_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6932
ADDP4
CNSTF4 0
ASGNF4
line 1935
;1935:				bs->becometeamleader_time = FloatTime() + 8 + random() * 10;
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6936
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1090519040
ADDF4
CNSTF4 1092616192
ADDRLP4 60
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 1936
;1936:			}
LABELV $460
line 1937
;1937:			if (bs->becometeamleader_time && bs->becometeamleader_time < FloatTime()) {
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 6936
ADDP4
INDIRF4
ASGNF4
ADDRLP4 60
INDIRF4
CNSTF4 0
EQF4 $449
ADDRLP4 60
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $449
line 1938
;1938:				BotAI_BotInitialChat(bs, "iamteamleader", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $465
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1939
;1939:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1940
;1940:				BotSayVoiceTeamOrder(bs, -1, VOICECHAT_STARTLEADER);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 $466
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1941
;1941:				ClientName(bs->client, netname, sizeof(netname));
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
line 1942
;1942:				strncpy(bs->teamleader, netname, sizeof(bs->teamleader));
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
line 1943
;1943:				bs->teamleader[sizeof(bs->teamleader)] = '\0';
ADDRFP4 0
INDIRP4
CNSTI4 6900
CNSTU4 32
ADDI4
ADDP4
CNSTI1 0
ASGNI1
line 1944
;1944:				bs->becometeamleader_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6936
ADDP4
CNSTF4 0
ASGNF4
line 1945
;1945:			}
line 1946
;1946:			return;
ADDRGP4 $449
JUMPV
LABELV $454
line 1948
;1947:		}
;1948:	}
LABELV $452
line 1949
;1949:	bs->askteamleader_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6932
ADDP4
CNSTF4 0
ASGNF4
line 1950
;1950:	bs->becometeamleader_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6936
ADDP4
CNSTF4 0
ASGNF4
line 1953
;1951:
;1952:	//return if this bot is NOT the team leader
;1953:	ClientName(bs->client, netname, sizeof(netname));
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
line 1954
;1954:	if (Q_stricmp(netname, bs->teamleader) != 0) return;
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $467
ADDRGP4 $449
JUMPV
LABELV $467
line 1956
;1955:	//
;1956:	numteammates = BotNumTeamMates(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 BotNumTeamMates
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 48
INDIRI4
ASGNI4
line 1958
;1957:	//give orders
;1958:	switch(gametype) {
ADDRLP4 52
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 3
EQI4 $471
ADDRLP4 52
INDIRI4
CNSTI4 4
EQI4 $477
ADDRGP4 $469
JUMPV
LABELV $471
line 1960
;1959:		case GT_TEAM:
;1960:		{
line 1961
;1961:			if (bs->numteammates != numteammates || bs->forceorders) {
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 6948
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $474
ADDRLP4 56
INDIRP4
CNSTI4 6968
ADDP4
INDIRI4
CNSTI4 0
EQI4 $472
LABELV $474
line 1962
;1962:				bs->teamgiveorders_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6940
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1963
;1963:				bs->numteammates = numteammates;
ADDRFP4 0
INDIRP4
CNSTI4 6948
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 1964
;1964:				bs->forceorders = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 0
ASGNI4
line 1965
;1965:			}
LABELV $472
line 1967
;1966:			//if it's time to give orders
;1967:			if (bs->teamgiveorders_time && bs->teamgiveorders_time < FloatTime() - 5) {
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 6940
ADDP4
INDIRF4
ASGNF4
ADDRLP4 60
INDIRF4
CNSTF4 0
EQF4 $470
ADDRLP4 60
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
SUBF4
GEF4 $470
line 1968
;1968:				BotTeamOrders(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotTeamOrders
CALLV
pop
line 1970
;1969:				//give orders again after 120 seconds
;1970:				bs->teamgiveorders_time = FloatTime() + 120;
ADDRFP4 0
INDIRP4
CNSTI4 6940
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 1971
;1971:			}
line 1972
;1972:			break;
ADDRGP4 $470
JUMPV
LABELV $477
line 1975
;1973:		}
;1974:		case GT_CTF:
;1975:		{
line 1978
;1976:			//if the number of team mates changed or the flag status changed
;1977:			//or someone wants to know what to do
;1978:			if (bs->numteammates != numteammates || bs->flagstatuschanged || bs->forceorders) {
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 6948
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $481
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRP4
CNSTI4 6964
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $481
ADDRLP4 56
INDIRP4
CNSTI4 6968
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $478
LABELV $481
line 1979
;1979:				bs->teamgiveorders_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6940
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1980
;1980:				bs->numteammates = numteammates;
ADDRFP4 0
INDIRP4
CNSTI4 6948
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 1981
;1981:				bs->flagstatuschanged = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 0
ASGNI4
line 1982
;1982:				bs->forceorders = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 0
ASGNI4
line 1983
;1983:			}
LABELV $478
line 1985
;1984:			//if there were no flag captures the last 3 minutes
;1985:			if (bs->lastflagcapture_time < FloatTime() - 240) {
ADDRFP4 0
INDIRP4
CNSTI4 6944
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1131413504
SUBF4
GEF4 $482
line 1986
;1986:				bs->lastflagcapture_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6944
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1988
;1987:				//randomly change the CTF strategy
;1988:				if (random() < 0.4) {
ADDRLP4 64
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1053609165
GEF4 $484
line 1989
;1989:					bs->ctfstrategy ^= CTFS_AGRESSIVE;
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 1990
;1990:					bs->teamgiveorders_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6940
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1991
;1991:				}
LABELV $484
line 1992
;1992:			}
LABELV $482
line 1994
;1993:			//if it's time to give orders
;1994:			if (bs->teamgiveorders_time && bs->teamgiveorders_time < FloatTime() - 3) {
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 6940
ADDP4
INDIRF4
ASGNF4
ADDRLP4 64
INDIRF4
CNSTF4 0
EQF4 $470
ADDRLP4 64
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1077936128
SUBF4
GEF4 $470
line 1995
;1995:				BotCTFOrders(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFOrders
CALLV
pop
line 1997
;1996:				//
;1997:				bs->teamgiveorders_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6940
ADDP4
CNSTF4 0
ASGNF4
line 1998
;1998:			}
line 1999
;1999:			break;
LABELV $469
LABELV $470
line 2059
;2000:		}
;2001:#ifdef MISSIONPACK
;2002:		case GT_1FCTF:
;2003:		{
;2004:			if (bs->numteammates != numteammates || bs->flagstatuschanged || bs->forceorders) {
;2005:				bs->teamgiveorders_time = FloatTime();
;2006:				bs->numteammates = numteammates;
;2007:				bs->flagstatuschanged = qfalse;
;2008:				bs->forceorders = qfalse;
;2009:			}
;2010:			//if there were no flag captures the last 4 minutes
;2011:			if (bs->lastflagcapture_time < FloatTime() - 240) {
;2012:				bs->lastflagcapture_time = FloatTime();
;2013:				//randomly change the CTF strategy
;2014:				if (random() < 0.4) {
;2015:					bs->ctfstrategy ^= CTFS_AGRESSIVE;
;2016:					bs->teamgiveorders_time = FloatTime();
;2017:				}
;2018:			}
;2019:			//if it's time to give orders
;2020:			if (bs->teamgiveorders_time && bs->teamgiveorders_time < FloatTime() - 2) {
;2021:				Bot1FCTFOrders(bs);
;2022:				//
;2023:				bs->teamgiveorders_time = 0;
;2024:			}
;2025:			break;
;2026:		}
;2027:		case GT_OBELISK:
;2028:		{
;2029:			if (bs->numteammates != numteammates || bs->forceorders) {
;2030:				bs->teamgiveorders_time = FloatTime();
;2031:				bs->numteammates = numteammates;
;2032:				bs->forceorders = qfalse;
;2033:			}
;2034:			//if it's time to give orders
;2035:			if (bs->teamgiveorders_time && bs->teamgiveorders_time < FloatTime() - 5) {
;2036:				BotObeliskOrders(bs);
;2037:				//give orders again after 30 seconds
;2038:				bs->teamgiveorders_time = FloatTime() + 30;
;2039:			}
;2040:			break;
;2041:		}
;2042:		case GT_HARVESTER:
;2043:		{
;2044:			if (bs->numteammates != numteammates || bs->forceorders) {
;2045:				bs->teamgiveorders_time = FloatTime();
;2046:				bs->numteammates = numteammates;
;2047:				bs->forceorders = qfalse;
;2048:			}
;2049:			//if it's time to give orders
;2050:			if (bs->teamgiveorders_time && bs->teamgiveorders_time < FloatTime() - 5) {
;2051:				BotHarvesterOrders(bs);
;2052:				//give orders again after 30 seconds
;2053:				bs->teamgiveorders_time = FloatTime() + 30;
;2054:			}
;2055:			break;
;2056:		}
;2057:#endif
;2058:	}
;2059:}
LABELV $449
endproc BotTeamAI 72 12
bss
export ctftaskpreferences
align 4
LABELV ctftaskpreferences
skip 2560
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
import g_MultiJump
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
LABELV $466
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $465
byte 1 105
byte 1 97
byte 1 109
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $462
byte 1 119
byte 1 104
byte 1 111
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $217
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $212
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $173
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $167
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 99
byte 1 97
byte 1 114
byte 1 114
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $166
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 97
byte 1 99
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 110
byte 1 121
byte 1 0
align 1
LABELV $165
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $164
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 97
byte 1 99
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 110
byte 1 121
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $155
byte 1 103
byte 1 101
byte 1 116
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $154
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 103
byte 1 101
byte 1 116
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $140
byte 1 25
byte 1 40
byte 1 37
byte 1 115
byte 1 25
byte 1 41
byte 1 25
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $76
byte 1 116
byte 1 0
align 1
LABELV $72
byte 1 110
byte 1 0
align 1
LABELV $65
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
