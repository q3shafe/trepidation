export BotSetUserInfo
code
proc BotSetUserInfo 1024 12
file "../ai_dmq3.c"
line 100
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:/*****************************************************************************
;5: * name:		ai_dmq3.c
;6: *
;7: * desc:		Quake3 bot AI
;8: *
;9: * $Archive: /MissionPack/code/game/ai_dmq3.c $
;10: * $Author: Zaphod $ 
;11: * $Revision: 85 $
;12: * $Modtime: 5/16/01 2:53p $
;13: * $Date: 5/16/01 2:53p $
;14: *
;15: *****************************************************************************/
;16:
;17:
;18:#include "g_local.h"
;19:#include "botlib.h"
;20:#include "be_aas.h"
;21:#include "be_ea.h"
;22:#include "be_ai_char.h"
;23:#include "be_ai_chat.h"
;24:#include "be_ai_gen.h"
;25:#include "be_ai_goal.h"
;26:#include "be_ai_move.h"
;27:#include "be_ai_weap.h"
;28://
;29:#include "ai_main.h"
;30:#include "ai_dmq3.h"
;31:#include "ai_chat.h"
;32:#include "ai_cmd.h"
;33:#include "ai_dmnet.h"
;34:#include "ai_team.h"
;35://
;36:#include "chars.h"				//characteristics
;37:#include "inv.h"				//indexes into the inventory
;38:#include "syn.h"				//synonyms
;39:#include "match.h"				//string matching types and vars
;40:
;41:// for the voice chats
;42:#include "../../ui/menudef.h" // sos001205 - for q3_ui also
;43:
;44:// from aasfile.h
;45:#define AREACONTENTS_MOVER				1024
;46:#define AREACONTENTS_MODELNUMSHIFT		24
;47:#define AREACONTENTS_MAXMODELNUM		0xFF
;48:#define AREACONTENTS_MODELNUM			(AREACONTENTS_MAXMODELNUM << AREACONTENTS_MODELNUMSHIFT)
;49:
;50:#define IDEAL_ATTACKDIST			140
;51:
;52:#define MAX_WAYPOINTS		128
;53://
;54:bot_waypoint_t botai_waypoints[MAX_WAYPOINTS];
;55:bot_waypoint_t *botai_freewaypoints;
;56:
;57://NOTE: not using a cvars which can be updated because the game should be reloaded anyway
;58:int gametype;		//game type
;59:int maxclients;		//maximum number of clients
;60:
;61:vmCvar_t bot_grapple;
;62:vmCvar_t bot_rocketjump;
;63:vmCvar_t bot_fastchat;
;64:vmCvar_t bot_nochat;
;65:vmCvar_t bot_testrchat;
;66:vmCvar_t bot_challenge;
;67:vmCvar_t bot_predictobstacles;
;68:vmCvar_t g_spSkill;
;69:
;70:extern vmCvar_t bot_developer;
;71:
;72:vec3_t lastteleport_origin;		//last teleport event origin
;73:float lastteleport_time;		//last teleport event time
;74:int max_bspmodelindex;			//maximum BSP model index
;75:
;76://CTF flag goals
;77:bot_goal_t ctf_redflag;
;78:bot_goal_t ctf_blueflag;
;79:#ifdef MISSIONPACK
;80:bot_goal_t ctf_neutralflag;
;81:bot_goal_t redobelisk;
;82:bot_goal_t blueobelisk;
;83:bot_goal_t neutralobelisk;
;84:#endif
;85:
;86:#define MAX_ALTROUTEGOALS		32
;87:
;88:int altroutegoals_setup;
;89:aas_altroutegoal_t red_altroutegoals[MAX_ALTROUTEGOALS];
;90:int red_numaltroutegoals;
;91:aas_altroutegoal_t blue_altroutegoals[MAX_ALTROUTEGOALS];
;92:int blue_numaltroutegoals;
;93:
;94:
;95:/*
;96:==================
;97:BotSetUserInfo
;98:==================
;99:*/
;100:void BotSetUserInfo(bot_state_t *bs, char *key, char *value) {
line 103
;101:	char userinfo[MAX_INFO_STRING];
;102:
;103:	trap_GetUserinfo(bs->client, userinfo, sizeof(userinfo));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 104
;104:	Info_SetValueForKey(userinfo, key, value);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 105
;105:	trap_SetUserinfo(bs->client, userinfo);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 106
;106:	ClientUserinfoChanged( bs->client );
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 107
;107:}
LABELV $56
endproc BotSetUserInfo 1024 12
export BotCTFCarryingFlag
proc BotCTFCarryingFlag 0 0
line 114
;108:
;109:/*
;110:==================
;111:BotCTFCarryingFlag
;112:==================
;113:*/
;114:int BotCTFCarryingFlag(bot_state_t *bs) {
line 115
;115:	if (gametype != GT_CTF) return CTF_FLAG_NONE;
ADDRGP4 gametype
INDIRI4
CNSTI4 4
EQI4 $58
CNSTI4 0
RETI4
ADDRGP4 $57
JUMPV
LABELV $58
line 117
;116:
;117:	if (bs->inventory[INVENTORY_REDFLAG] > 0) return CTF_FLAG_RED;
ADDRFP4 0
INDIRP4
CNSTI4 5132
ADDP4
INDIRI4
CNSTI4 0
LEI4 $60
CNSTI4 1
RETI4
ADDRGP4 $57
JUMPV
LABELV $60
line 118
;118:	else if (bs->inventory[INVENTORY_BLUEFLAG] > 0) return CTF_FLAG_BLUE;
ADDRFP4 0
INDIRP4
CNSTI4 5136
ADDP4
INDIRI4
CNSTI4 0
LEI4 $62
CNSTI4 2
RETI4
ADDRGP4 $57
JUMPV
LABELV $62
line 119
;119:	return CTF_FLAG_NONE;
CNSTI4 0
RETI4
LABELV $57
endproc BotCTFCarryingFlag 0 0
export BotTeam
proc BotTeam 1044 12
line 127
;120:}
;121:
;122:/*
;123:==================
;124:BotTeam
;125:==================
;126:*/
;127:int BotTeam(bot_state_t *bs) {
line 130
;128:	char info[1024];
;129:
;130:	if (bs->client < 0 || bs->client >= MAX_CLIENTS) {
ADDRLP4 1024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 0
LTI4 $67
ADDRLP4 1024
INDIRI4
CNSTI4 64
LTI4 $65
LABELV $67
line 132
;131:		//BotAI_Print(PRT_ERROR, "BotCTFTeam: client out of range\n");
;132:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $64
JUMPV
LABELV $65
line 134
;133:	}
;134:	trap_GetConfigstring(CS_PLAYERS+bs->client, info, sizeof(info));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 136
;135:	//
;136:	if (atoi(Info_ValueForKey(info, "t")) == TEAM_RED) return TEAM_RED;
ADDRLP4 0
ARGP4
ADDRGP4 $70
ARGP4
ADDRLP4 1028
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 1032
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 1
NEI4 $68
CNSTI4 1
RETI4
ADDRGP4 $64
JUMPV
LABELV $68
line 137
;137:	else if (atoi(Info_ValueForKey(info, "t")) == TEAM_BLUE) return TEAM_BLUE;
ADDRLP4 0
ARGP4
ADDRGP4 $70
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 2
NEI4 $71
CNSTI4 2
RETI4
ADDRGP4 $64
JUMPV
LABELV $71
line 138
;138:	return TEAM_FREE;
CNSTI4 0
RETI4
LABELV $64
endproc BotTeam 1044 12
export BotOppositeTeam
proc BotOppositeTeam 12 4
line 146
;139:}
;140:
;141:/*
;142:==================
;143:BotOppositeTeam
;144:==================
;145:*/
;146:int BotOppositeTeam(bot_state_t *bs) {
line 147
;147:	switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $77
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $78
ADDRGP4 $74
JUMPV
LABELV $77
line 148
;148:		case TEAM_RED: return TEAM_BLUE;
CNSTI4 2
RETI4
ADDRGP4 $73
JUMPV
LABELV $78
line 149
;149:		case TEAM_BLUE: return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $73
JUMPV
LABELV $74
line 150
;150:		default: return TEAM_FREE;
CNSTI4 0
RETI4
LABELV $73
endproc BotOppositeTeam 12 4
export BotEnemyFlag
proc BotEnemyFlag 4 4
line 159
;151:	}
;152:}
;153:
;154:/*
;155:==================
;156:BotEnemyFlag
;157:==================
;158:*/
;159:bot_goal_t *BotEnemyFlag(bot_state_t *bs) {
line 160
;160:	if (BotTeam(bs) == TEAM_RED) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $80
line 161
;161:		return &ctf_blueflag;
ADDRGP4 ctf_blueflag
RETP4
ADDRGP4 $79
JUMPV
LABELV $80
line 163
;162:	}
;163:	else {
line 164
;164:		return &ctf_redflag;
ADDRGP4 ctf_redflag
RETP4
LABELV $79
endproc BotEnemyFlag 4 4
export BotTeamFlag
proc BotTeamFlag 4 4
line 173
;165:	}
;166:}
;167:
;168:/*
;169:==================
;170:BotTeamFlag
;171:==================
;172:*/
;173:bot_goal_t *BotTeamFlag(bot_state_t *bs) {
line 174
;174:	if (BotTeam(bs) == TEAM_RED) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $83
line 175
;175:		return &ctf_redflag;
ADDRGP4 ctf_redflag
RETP4
ADDRGP4 $82
JUMPV
LABELV $83
line 177
;176:	}
;177:	else {
line 178
;178:		return &ctf_blueflag;
ADDRGP4 ctf_blueflag
RETP4
LABELV $82
endproc BotTeamFlag 4 4
export EntityIsDead
proc EntityIsDead 472 8
line 188
;179:	}
;180:}
;181:
;182:
;183:/*
;184:==================
;185:EntityIsDead
;186:==================
;187:*/
;188:qboolean EntityIsDead(aas_entityinfo_t *entinfo) {
line 191
;189:	playerState_t ps;
;190:
;191:	if (entinfo->number >= 0 && entinfo->number < MAX_CLIENTS) {
ADDRLP4 468
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
ADDRLP4 468
INDIRI4
CNSTI4 0
LTI4 $86
ADDRLP4 468
INDIRI4
CNSTI4 64
GEI4 $86
line 193
;192:		//retrieve the current client state
;193:		BotAI_GetClientState( entinfo->number, &ps );
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotAI_GetClientState
CALLI4
pop
line 194
;194:		if (ps.pm_type != PM_NORMAL) return qtrue;
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $88
CNSTI4 1
RETI4
ADDRGP4 $85
JUMPV
LABELV $88
line 195
;195:	}
LABELV $86
line 196
;196:	return qfalse;
CNSTI4 0
RETI4
LABELV $85
endproc EntityIsDead 472 8
export EntityCarriesFlag
proc EntityCarriesFlag 0 0
line 204
;197:}
;198:
;199:/*
;200:==================
;201:EntityCarriesFlag
;202:==================
;203:*/
;204:qboolean EntityCarriesFlag(aas_entityinfo_t *entinfo) {
line 205
;205:	if ( entinfo->powerups & ( 1 << PW_REDFLAG ) )
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $92
line 206
;206:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $91
JUMPV
LABELV $92
line 207
;207:	if ( entinfo->powerups & ( 1 << PW_BLUEFLAG ) )
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $94
line 208
;208:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $91
JUMPV
LABELV $94
line 210
;209:#ifdef MISSIONPACK
;210:	if ( entinfo->powerups & ( 1 << PW_NEUTRALFLAG ) )
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $96
line 211
;211:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $91
JUMPV
LABELV $96
line 213
;212:#endif
;213:	return qfalse;
CNSTI4 0
RETI4
LABELV $91
endproc EntityCarriesFlag 0 0
export EntityIsInvisible
proc EntityIsInvisible 4 4
line 221
;214:}
;215:
;216:/*
;217:==================
;218:EntityIsInvisible
;219:==================
;220:*/
;221:qboolean EntityIsInvisible(aas_entityinfo_t *entinfo) {
line 223
;222:	// the flag is always visible
;223:	if (EntityCarriesFlag(entinfo)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $99
line 224
;224:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $98
JUMPV
LABELV $99
line 226
;225:	}
;226:	if (entinfo->powerups & (1 << PW_INVIS)) {
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $101
line 227
;227:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $98
JUMPV
LABELV $101
line 229
;228:	}
;229:	return qfalse;
CNSTI4 0
RETI4
LABELV $98
endproc EntityIsInvisible 4 4
export EntityIsShooting
proc EntityIsShooting 0 0
line 237
;230:}
;231:
;232:/*
;233:==================
;234:EntityIsShooting
;235:==================
;236:*/
;237:qboolean EntityIsShooting(aas_entityinfo_t *entinfo) {
line 238
;238:	if (entinfo->flags & EF_FIRING) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $104
line 239
;239:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $103
JUMPV
LABELV $104
line 241
;240:	}
;241:	return qfalse;
CNSTI4 0
RETI4
LABELV $103
endproc EntityIsShooting 0 0
export EntityIsChatting
proc EntityIsChatting 0 0
line 249
;242:}
;243:
;244:/*
;245:==================
;246:EntityIsChatting
;247:==================
;248:*/
;249:qboolean EntityIsChatting(aas_entityinfo_t *entinfo) {
line 250
;250:	if (entinfo->flags & EF_TALK) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $107
line 251
;251:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $106
JUMPV
LABELV $107
line 253
;252:	}
;253:	return qfalse;
CNSTI4 0
RETI4
LABELV $106
endproc EntityIsChatting 0 0
export EntityHasQuad
proc EntityHasQuad 0 0
line 261
;254:}
;255:
;256:/*
;257:==================
;258:EntityHasQuad
;259:==================
;260:*/
;261:qboolean EntityHasQuad(aas_entityinfo_t *entinfo) {
line 262
;262:	if (entinfo->powerups & (1 << PW_QUAD)) {
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $110
line 263
;263:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $109
JUMPV
LABELV $110
line 265
;264:	}
;265:	return qfalse;
CNSTI4 0
RETI4
LABELV $109
endproc EntityHasQuad 0 0
export EntityHasKamikaze
proc EntityHasKamikaze 0 0
line 274
;266:}
;267:
;268:#ifdef MISSIONPACK
;269:/*
;270:==================
;271:EntityHasKamikze
;272:==================
;273:*/
;274:qboolean EntityHasKamikaze(aas_entityinfo_t *entinfo) {
line 275
;275:	if (entinfo->flags & EF_KAMIKAZE) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $113
line 276
;276:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $112
JUMPV
LABELV $113
line 278
;277:	}
;278:	return qfalse;
CNSTI4 0
RETI4
LABELV $112
endproc EntityHasKamikaze 0 0
export EntityCarriesCubes
proc EntityCarriesCubes 208 8
line 286
;279:}
;280:
;281:/*
;282:==================
;283:EntityCarriesCubes
;284:==================
;285:*/
;286:qboolean EntityCarriesCubes(aas_entityinfo_t *entinfo) {
line 289
;287:	entityState_t state;
;288:
;289:	if (gametype != GT_HARVESTER)
ADDRGP4 gametype
INDIRI4
CNSTI4 7
EQI4 $116
line 290
;290:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $115
JUMPV
LABELV $116
line 292
;291:	//FIXME: get this info from the aas_entityinfo_t ?
;292:	BotAI_GetEntityState(entinfo->number, &state);
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotAI_GetEntityState
CALLI4
pop
line 293
;293:	if (state.generic1 > 0)
ADDRLP4 0+204
INDIRI4
CNSTI4 0
LEI4 $118
line 294
;294:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $115
JUMPV
LABELV $118
line 295
;295:	return qfalse;
CNSTI4 0
RETI4
LABELV $115
endproc EntityCarriesCubes 208 8
export Bot1FCTFCarryingFlag
proc Bot1FCTFCarryingFlag 0 0
line 303
;296:}
;297:
;298:/*
;299:==================
;300:Bot1FCTFCarryingFlag
;301:==================
;302:*/
;303:int Bot1FCTFCarryingFlag(bot_state_t *bs) {
line 304
;304:	if (gametype != GT_1FCTF) return qfalse;
ADDRGP4 gametype
INDIRI4
CNSTI4 5
EQI4 $122
CNSTI4 0
RETI4
ADDRGP4 $121
JUMPV
LABELV $122
line 306
;305:
;306:	if (bs->inventory[INVENTORY_NEUTRALFLAG] > 0) return qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 5140
ADDP4
INDIRI4
CNSTI4 0
LEI4 $124
CNSTI4 1
RETI4
ADDRGP4 $121
JUMPV
LABELV $124
line 307
;307:	return qfalse;
CNSTI4 0
RETI4
LABELV $121
endproc Bot1FCTFCarryingFlag 0 0
export BotHarvesterCarryingCubes
proc BotHarvesterCarryingCubes 0 0
line 315
;308:}
;309:
;310:/*
;311:==================
;312:BotHarvesterCarryingCubes
;313:==================
;314:*/
;315:int BotHarvesterCarryingCubes(bot_state_t *bs) {
line 316
;316:	if (gametype != GT_HARVESTER) return qfalse;
ADDRGP4 gametype
INDIRI4
CNSTI4 7
EQI4 $127
CNSTI4 0
RETI4
ADDRGP4 $126
JUMPV
LABELV $127
line 318
;317:
;318:	if (bs->inventory[INVENTORY_REDCUBE] > 0) return qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 5144
ADDP4
INDIRI4
CNSTI4 0
LEI4 $129
CNSTI4 1
RETI4
ADDRGP4 $126
JUMPV
LABELV $129
line 319
;319:	if (bs->inventory[INVENTORY_BLUECUBE] > 0) return qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 5148
ADDP4
INDIRI4
CNSTI4 0
LEI4 $131
CNSTI4 1
RETI4
ADDRGP4 $126
JUMPV
LABELV $131
line 320
;320:	return qfalse;
CNSTI4 0
RETI4
LABELV $126
endproc BotHarvesterCarryingCubes 0 0
export BotRememberLastOrderedTask
proc BotRememberLastOrderedTask 16 12
line 329
;321:}
;322:#endif
;323:
;324:/*
;325:==================
;326:BotRememberLastOrderedTask
;327:==================
;328:*/
;329:void BotRememberLastOrderedTask(bot_state_t *bs) {
line 330
;330:	if (!bs->ordered) {
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $134
line 331
;331:		return;
ADDRGP4 $133
JUMPV
LABELV $134
line 333
;332:	}
;333:	bs->lastgoal_decisionmaker = bs->decisionmaker;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 6756
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ASGNI4
line 334
;334:	bs->lastgoal_ltgtype = bs->ltgtype;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 6760
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
ASGNI4
line 335
;335:	memcpy(&bs->lastgoal_teamgoal, &bs->teamgoal, sizeof(bot_goal_t));
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 6768
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 336
;336:	bs->lastgoal_teammate = bs->teammate;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 6764
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ASGNI4
line 337
;337:}
LABELV $133
endproc BotRememberLastOrderedTask 16 12
export BotSetTeamStatus
proc BotSetTeamStatus 164 12
line 344
;338:
;339:/*
;340:==================
;341:BotSetTeamStatus
;342:==================
;343:*/
;344:void BotSetTeamStatus(bot_state_t *bs) {
line 349
;345:#ifdef MISSIONPACK
;346:	int teamtask;
;347:	aas_entityinfo_t entinfo;
;348:
;349:	teamtask = TEAMTASK_PATROL;
ADDRLP4 0
CNSTI4 3
ASGNI4
line 351
;350:
;351:	switch(bs->ltgtype) {
ADDRLP4 144
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 1
LTI4 $137
ADDRLP4 144
INDIRI4
CNSTI4 13
GTI4 $137
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $157-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $157
address $138
address $141
address $147
address $148
address $149
address $150
address $151
address $151
address $152
address $153
address $154
address $155
address $156
code
line 353
;352:		case LTG_TEAMHELP:
;353:			break;
LABELV $141
line 355
;354:		case LTG_TEAMACCOMPANY:
;355:			BotEntityInfo(bs->teammate, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 356
;356:			if ( ( (gametype == GT_CTF || gametype == GT_1FCTF) && EntityCarriesFlag(&entinfo))
ADDRLP4 152
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 4
EQI4 $146
ADDRLP4 152
INDIRI4
CNSTI4 5
NEI4 $145
LABELV $146
ADDRLP4 4
ARGP4
ADDRLP4 156
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
NEI4 $144
LABELV $145
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $142
ADDRLP4 4
ARGP4
ADDRLP4 160
ADDRGP4 EntityCarriesCubes
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
EQI4 $142
LABELV $144
line 357
;357:				|| ( gametype == GT_HARVESTER && EntityCarriesCubes(&entinfo)) ) {
line 358
;358:				teamtask = TEAMTASK_ESCORT;
ADDRLP4 0
CNSTI4 6
ASGNI4
line 359
;359:			}
ADDRGP4 $138
JUMPV
LABELV $142
line 360
;360:			else {
line 361
;361:				teamtask = TEAMTASK_FOLLOW;
ADDRLP4 0
CNSTI4 4
ASGNI4
line 362
;362:			}
line 363
;363:			break;
ADDRGP4 $138
JUMPV
LABELV $147
line 365
;364:		case LTG_DEFENDKEYAREA:
;365:			teamtask = TEAMTASK_DEFENSE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 366
;366:			break;
ADDRGP4 $138
JUMPV
LABELV $148
line 368
;367:		case LTG_GETFLAG:
;368:			teamtask = TEAMTASK_OFFENSE;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 369
;369:			break;
ADDRGP4 $138
JUMPV
LABELV $149
line 371
;370:		case LTG_RUSHBASE:
;371:			teamtask = TEAMTASK_DEFENSE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 372
;372:			break;
ADDRGP4 $138
JUMPV
LABELV $150
line 374
;373:		case LTG_RETURNFLAG:
;374:			teamtask = TEAMTASK_RETRIEVE;
ADDRLP4 0
CNSTI4 5
ASGNI4
line 375
;375:			break;
ADDRGP4 $138
JUMPV
LABELV $151
line 378
;376:		case LTG_CAMP:
;377:		case LTG_CAMPORDER:
;378:			teamtask = TEAMTASK_CAMP;
ADDRLP4 0
CNSTI4 7
ASGNI4
line 379
;379:			break;
ADDRGP4 $138
JUMPV
LABELV $152
line 381
;380:		case LTG_PATROL:
;381:			teamtask = TEAMTASK_PATROL;
ADDRLP4 0
CNSTI4 3
ASGNI4
line 382
;382:			break;
ADDRGP4 $138
JUMPV
LABELV $153
line 384
;383:		case LTG_GETITEM:
;384:			teamtask = TEAMTASK_PATROL;
ADDRLP4 0
CNSTI4 3
ASGNI4
line 385
;385:			break;
ADDRGP4 $138
JUMPV
LABELV $154
line 387
;386:		case LTG_KILL:
;387:			teamtask = TEAMTASK_PATROL;
ADDRLP4 0
CNSTI4 3
ASGNI4
line 388
;388:			break;
ADDRGP4 $138
JUMPV
LABELV $155
line 390
;389:		case LTG_HARVEST:
;390:			teamtask = TEAMTASK_OFFENSE;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 391
;391:			break;
ADDRGP4 $138
JUMPV
LABELV $156
line 393
;392:		case LTG_ATTACKENEMYBASE:
;393:			teamtask = TEAMTASK_OFFENSE;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 394
;394:			break;
ADDRGP4 $138
JUMPV
LABELV $137
line 396
;395:		default:
;396:			teamtask = TEAMTASK_PATROL;
ADDRLP4 0
CNSTI4 3
ASGNI4
line 397
;397:			break;
LABELV $138
line 399
;398:	}
;399:	BotSetUserInfo(bs, "teamtask", va("%d", teamtask));
ADDRGP4 $160
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 152
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $159
ARGP4
ADDRLP4 152
INDIRP4
ARGP4
ADDRGP4 BotSetUserInfo
CALLV
pop
line 401
;400:#endif
;401:}
LABELV $136
endproc BotSetTeamStatus 164 12
export BotSetLastOrderedTask
proc BotSetLastOrderedTask 60 16
line 408
;402:
;403:/*
;404:==================
;405:BotSetLastOrderedTask
;406:==================
;407:*/
;408:int BotSetLastOrderedTask(bot_state_t *bs) {
line 410
;409:
;410:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $162
line 412
;411:		// don't go back to returning the flag if it's at the base
;412:		if ( bs->lastgoal_ltgtype == LTG_RETURNFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
CNSTI4 6
NEI4 $164
line 413
;413:			if ( BotTeam(bs) == TEAM_RED ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $166
line 414
;414:				if ( bs->redflagstatus == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
CNSTI4 0
NEI4 $167
line 415
;415:					bs->lastgoal_ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
CNSTI4 0
ASGNI4
line 416
;416:				}
line 417
;417:			}
ADDRGP4 $167
JUMPV
LABELV $166
line 418
;418:			else {
line 419
;419:				if ( bs->blueflagstatus == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
CNSTI4 0
NEI4 $170
line 420
;420:					bs->lastgoal_ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
CNSTI4 0
ASGNI4
line 421
;421:				}
LABELV $170
line 422
;422:			}
LABELV $167
line 423
;423:		}
LABELV $164
line 424
;424:	}
LABELV $162
line 426
;425:
;426:	if ( bs->lastgoal_ltgtype ) {
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $172
line 427
;427:		bs->decisionmaker = bs->lastgoal_decisionmaker;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 6756
ADDP4
INDIRI4
ASGNI4
line 428
;428:		bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 429
;429:		bs->ltgtype = bs->lastgoal_ltgtype;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 6600
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
ASGNI4
line 430
;430:		memcpy(&bs->teamgoal, &bs->lastgoal_teamgoal, sizeof(bot_goal_t));
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 6768
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 431
;431:		bs->teammate = bs->lastgoal_teammate;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 6604
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 6764
ADDP4
INDIRI4
ASGNI4
line 432
;432:		bs->teamgoal_time = FloatTime() + 300;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1133903872
ADDF4
ASGNF4
line 433
;433:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 435
;434:		//
;435:		if ( gametype == GT_CTF ) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $174
line 436
;436:			if ( bs->ltgtype == LTG_GETFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
NEI4 $176
line 440
;437:				bot_goal_t *tb, *eb;
;438:				int tt, et;
;439:
;440:				tb = BotTeamFlag(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 BotTeamFlag
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 441
;441:				eb = BotEnemyFlag(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 BotEnemyFlag
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 36
INDIRP4
ASGNP4
line 442
;442:				tt = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, tb->areanum, TFL_DEFAULT);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 44
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 44
INDIRI4
ASGNI4
line 443
;443:				et = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, eb->areanum, TFL_DEFAULT);
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 52
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 52
INDIRI4
ASGNI4
line 445
;444:				// if the travel time towards the enemy base is larger than towards our base
;445:				if (et > tt) {
ADDRLP4 28
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $178
line 447
;446:					//get an alternative route goal towards the enemy base
;447:					BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 448
;448:				}
LABELV $178
line 449
;449:			}
LABELV $176
line 450
;450:		}
LABELV $174
line 451
;451:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $161
JUMPV
LABELV $172
line 453
;452:	}
;453:	return qfalse;
CNSTI4 0
RETI4
LABELV $161
endproc BotSetLastOrderedTask 60 16
export BotRefuseOrder
proc BotRefuseOrder 8 12
line 461
;454:}
;455:
;456:/*
;457:==================
;458:BotRefuseOrder
;459:==================
;460:*/
;461:void BotRefuseOrder(bot_state_t *bs) {
line 462
;462:	if (!bs->ordered)
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $181
line 463
;463:		return;
ADDRGP4 $180
JUMPV
LABELV $181
line 465
;464:	// if the bot was ordered to do something
;465:	if ( bs->order_time && bs->order_time > FloatTime() - 10 ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 0
EQF4 $183
ADDRLP4 0
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1092616192
SUBF4
LEF4 $183
line 466
;466:		trap_EA_Action(bs->client, ACTION_NEGATIVE);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 2097152
ARGI4
ADDRGP4 trap_EA_Action
CALLV
pop
line 467
;467:		BotVoiceChat(bs, bs->decisionmaker, VOICECHAT_NO);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
ADDRGP4 $185
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 468
;468:		bs->order_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
CNSTF4 0
ASGNF4
line 469
;469:	}
LABELV $183
line 470
;470:}
LABELV $180
endproc BotRefuseOrder 8 12
export BotCTFSeekGoals
proc BotCTFSeekGoals 240 12
line 477
;471:
;472:/*
;473:==================
;474:BotCTFSeekGoals
;475:==================
;476:*/
;477:void BotCTFSeekGoals(bot_state_t *bs) {
line 484
;478:	float rnd, l1, l2;
;479:	int flagstatus, c;
;480:	vec3_t dir;
;481:	aas_entityinfo_t entinfo;
;482:
;483:	//when carrying a flag in ctf the bot should rush to the base
;484:	if (BotCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 172
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 0
EQI4 $187
line 486
;485:		//if not already rushing to the base
;486:		if (bs->ltgtype != LTG_RUSHBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
EQI4 $189
line 487
;487:			BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 488
;488:			bs->ltgtype = LTG_RUSHBASE;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 5
ASGNI4
line 489
;489:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 490
;490:			bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
CNSTF4 0
ASGNF4
line 491
;491:			bs->decisionmaker = bs->client;
ADDRLP4 176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 176
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 176
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 492
;492:			bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 494
;493:			//
;494:			switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 184
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 180
ADDRLP4 184
INDIRI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 1
EQI4 $194
ADDRLP4 180
INDIRI4
CNSTI4 2
EQI4 $199
ADDRGP4 $191
JUMPV
LABELV $194
line 495
;495:				case TEAM_RED: VectorSubtract(bs->origin, ctf_blueflag.origin, dir); break;
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 160
ADDRLP4 192
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRGP4 ctf_blueflag
INDIRF4
SUBF4
ASGNF4
ADDRLP4 160+4
ADDRLP4 192
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRGP4 ctf_blueflag+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 160+8
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRGP4 ctf_blueflag+8
INDIRF4
SUBF4
ASGNF4
ADDRGP4 $192
JUMPV
LABELV $199
line 496
;496:				case TEAM_BLUE: VectorSubtract(bs->origin, ctf_redflag.origin, dir); break;
ADDRLP4 196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 160
ADDRLP4 196
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRGP4 ctf_redflag
INDIRF4
SUBF4
ASGNF4
ADDRLP4 160+4
ADDRLP4 196
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRGP4 ctf_redflag+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 160+8
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRGP4 ctf_redflag+8
INDIRF4
SUBF4
ASGNF4
ADDRGP4 $192
JUMPV
LABELV $191
line 497
;497:				default: VectorSet(dir, 999, 999, 999); break;
ADDRLP4 200
CNSTF4 1148829696
ASGNF4
ADDRLP4 160
ADDRLP4 200
INDIRF4
ASGNF4
ADDRLP4 160+4
ADDRLP4 200
INDIRF4
ASGNF4
ADDRLP4 160+8
CNSTF4 1148829696
ASGNF4
LABELV $192
line 500
;498:			}
;499:			// if the bot picked up the flag very close to the enemy base
;500:			if ( VectorLength(dir) < 128 ) {
ADDRLP4 160
ARGP4
ADDRLP4 192
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 192
INDIRF4
CNSTF4 1124073472
GEF4 $206
line 502
;501:				// get an alternative route goal through the enemy base
;502:				BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 196
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 196
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 503
;503:			} else {
ADDRGP4 $207
JUMPV
LABELV $206
line 505
;504:				// don't use any alt route goal, just get the hell out of the base
;505:				bs->altroutegoal.areanum = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6692
ADDP4
CNSTI4 0
ASGNI4
line 506
;506:			}
LABELV $207
line 507
;507:			BotSetUserInfo(bs, "teamtask", va("%d", TEAMTASK_OFFENSE));
ADDRGP4 $160
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 196
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $159
ARGP4
ADDRLP4 196
INDIRP4
ARGP4
ADDRGP4 BotSetUserInfo
CALLV
pop
line 508
;508:			BotVoiceChat(bs, -1, VOICECHAT_IHAVEFLAG);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 $208
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 509
;509:		}
ADDRGP4 $186
JUMPV
LABELV $189
line 510
;510:		else if (bs->rushbaseaway_time > FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $186
line 511
;511:			if (BotTeam(bs) == TEAM_RED) flagstatus = bs->redflagstatus;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 176
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 1
NEI4 $211
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $212
JUMPV
LABELV $211
line 512
;512:			else flagstatus = bs->blueflagstatus;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
ASGNI4
LABELV $212
line 514
;513:			//if the flag is back
;514:			if (flagstatus == 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $186
line 515
;515:				bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
CNSTF4 0
ASGNF4
line 516
;516:			}
line 517
;517:		}
line 518
;518:		return;
ADDRGP4 $186
JUMPV
LABELV $187
line 521
;519:	}
;520:	// if the bot decided to follow someone
;521:	if ( bs->ltgtype == LTG_TEAMACCOMPANY && !bs->ordered ) {
ADDRLP4 176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 176
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
NEI4 $215
ADDRLP4 176
INDIRP4
CNSTI4 6612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $215
line 523
;522:		// if the team mate being accompanied no longer carries the flag
;523:		BotEntityInfo(bs->teammate, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 524
;524:		if (!EntityCarriesFlag(&entinfo)) {
ADDRLP4 16
ARGP4
ADDRLP4 180
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 0
NEI4 $217
line 525
;525:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 526
;526:		}
LABELV $217
line 527
;527:	}
LABELV $215
line 529
;528:	//
;529:	if (BotTeam(bs) == TEAM_RED) flagstatus = bs->redflagstatus * 2 + bs->blueflagstatus;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 180
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 1
NEI4 $219
ADDRLP4 184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 184
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 184
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $220
JUMPV
LABELV $219
line 530
;530:	else flagstatus = bs->blueflagstatus * 2 + bs->redflagstatus;
ADDRLP4 188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 188
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 188
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
ADDI4
ASGNI4
LABELV $220
line 532
;531:	//if our team has the enemy flag and our flag is at the base
;532:	if (flagstatus == 1) {
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $221
line 534
;533:		//
;534:		if (bs->owndecision_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
GEF4 $186
line 536
;535:			//if Not defending the base already
;536:			if (!(bs->ltgtype == LTG_DEFENDKEYAREA &&
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 192
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 3
NEI4 $229
ADDRLP4 196
ADDRLP4 192
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ASGNI4
ADDRLP4 196
INDIRI4
ADDRGP4 ctf_redflag+44
INDIRI4
EQI4 $186
ADDRLP4 196
INDIRI4
ADDRGP4 ctf_blueflag+44
INDIRI4
EQI4 $186
LABELV $229
line 538
;537:					(bs->teamgoal.number == ctf_redflag.number ||
;538:					bs->teamgoal.number == ctf_blueflag.number))) {
line 540
;539:				//if there is a visible team mate flag carrier
;540:				c = BotTeamFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 200
ADDRGP4 BotTeamFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 156
ADDRLP4 200
INDIRI4
ASGNI4
line 541
;541:				if (c >= 0 &&
ADDRLP4 204
ADDRLP4 156
INDIRI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 0
LTI4 $186
ADDRLP4 208
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 208
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
NEI4 $232
ADDRLP4 208
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ADDRLP4 204
INDIRI4
EQI4 $186
LABELV $232
line 543
;542:						// and not already following the team mate flag carrier
;543:						(bs->ltgtype != LTG_TEAMACCOMPANY || bs->teammate != c)) {
line 545
;544:					//
;545:					BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 547
;546:					//follow the flag carrier
;547:					bs->decisionmaker = bs->client;
ADDRLP4 212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 212
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 212
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 548
;548:					bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 550
;549:					//the team mate
;550:					bs->teammate = c;
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
ADDRLP4 156
INDIRI4
ASGNI4
line 552
;551:					//last time the team mate was visible
;552:					bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6748
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 554
;553:					//no message
;554:					bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 556
;555:					//no arrive message
;556:					bs->arrive_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
CNSTF4 1065353216
ASGNF4
line 558
;557:					//
;558:					BotVoiceChat(bs, bs->teammate, VOICECHAT_ONFOLLOW);
ADDRLP4 216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 216
INDIRP4
ARGP4
ADDRLP4 216
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRGP4 $233
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 560
;559:					//get the team goal time
;560:					bs->teamgoal_time = FloatTime() + TEAM_ACCOMPANY_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 561
;561:					bs->ltgtype = LTG_TEAMACCOMPANY;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 2
ASGNI4
line 562
;562:					bs->formation_dist = 3.5 * 32;		//3.5 meter
ADDRFP4 0
INDIRP4
CNSTI4 7012
ADDP4
CNSTF4 1121976320
ASGNF4
line 563
;563:					BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 564
;564:					bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 565
;565:				}
line 566
;566:			}
line 567
;567:		}
line 568
;568:		return;
ADDRGP4 $186
JUMPV
LABELV $221
line 571
;569:	}
;570:	//if the enemy has our flag
;571:	else if (flagstatus == 2) {
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $234
line 573
;572:		//
;573:		if (bs->owndecision_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
GEF4 $186
line 575
;574:			//if enemy flag carrier is visible
;575:			c = BotEnemyFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 192
ADDRGP4 BotEnemyFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 156
ADDRLP4 192
INDIRI4
ASGNI4
line 576
;576:			if (c >= 0) {
ADDRLP4 156
INDIRI4
CNSTI4 0
LTI4 $238
line 578
;577:				//FIXME: fight enemy flag carrier
;578:			}
LABELV $238
line 580
;579:			//if not already doing something important
;580:			if (bs->ltgtype != LTG_GETFLAG &&
ADDRLP4 196
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
ASGNI4
ADDRLP4 196
INDIRI4
CNSTI4 4
EQI4 $186
ADDRLP4 196
INDIRI4
CNSTI4 6
EQI4 $186
ADDRLP4 196
INDIRI4
CNSTI4 1
EQI4 $186
ADDRLP4 196
INDIRI4
CNSTI4 2
EQI4 $186
ADDRLP4 196
INDIRI4
CNSTI4 8
EQI4 $186
ADDRLP4 196
INDIRI4
CNSTI4 9
EQI4 $186
ADDRLP4 196
INDIRI4
CNSTI4 10
EQI4 $186
line 586
;581:				bs->ltgtype != LTG_RETURNFLAG &&
;582:				bs->ltgtype != LTG_TEAMHELP &&
;583:				bs->ltgtype != LTG_TEAMACCOMPANY &&
;584:				bs->ltgtype != LTG_CAMPORDER &&
;585:				bs->ltgtype != LTG_PATROL &&
;586:				bs->ltgtype != LTG_GETITEM) {
line 588
;587:
;588:				BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 589
;589:				bs->decisionmaker = bs->client;
ADDRLP4 200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 200
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 200
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 590
;590:				bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 592
;591:				//
;592:				if (random() < 0.5) {
ADDRLP4 204
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
GEF4 $242
line 594
;593:					//go for the enemy flag
;594:					bs->ltgtype = LTG_GETFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 4
ASGNI4
line 595
;595:				}
ADDRGP4 $243
JUMPV
LABELV $242
line 596
;596:				else {
line 597
;597:					bs->ltgtype = LTG_RETURNFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 6
ASGNI4
line 598
;598:				}
LABELV $243
line 600
;599:				//no team message
;600:				bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 602
;601:				//set the time the bot will stop getting the flag
;602:				bs->teamgoal_time = FloatTime() + CTF_GETFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 604
;603:				//get an alternative route goal towards the enemy base
;604:				BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 208
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 208
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 606
;605:				//
;606:				BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 607
;607:				bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 608
;608:			}
line 609
;609:		}
line 610
;610:		return;
ADDRGP4 $186
JUMPV
LABELV $234
line 613
;611:	}
;612:	//if both flags Not at their bases
;613:	else if (flagstatus == 3) {
ADDRLP4 0
INDIRI4
CNSTI4 3
NEI4 $244
line 615
;614:		//
;615:		if (bs->owndecision_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
GEF4 $186
line 617
;616:			// if not trying to return the flag and not following the team flag carrier
;617:			if ( bs->ltgtype != LTG_RETURNFLAG && bs->ltgtype != LTG_TEAMACCOMPANY ) {
ADDRLP4 192
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
ASGNI4
ADDRLP4 192
INDIRI4
CNSTI4 6
EQI4 $186
ADDRLP4 192
INDIRI4
CNSTI4 2
EQI4 $186
line 619
;618:				//
;619:				c = BotTeamFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 196
ADDRGP4 BotTeamFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 156
ADDRLP4 196
INDIRI4
ASGNI4
line 621
;620:				// if there is a visible team mate flag carrier
;621:				if (c >= 0) {
ADDRLP4 156
INDIRI4
CNSTI4 0
LTI4 $250
line 622
;622:					BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 624
;623:					//follow the flag carrier
;624:					bs->decisionmaker = bs->client;
ADDRLP4 200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 200
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 200
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 625
;625:					bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 627
;626:					//the team mate
;627:					bs->teammate = c;
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
ADDRLP4 156
INDIRI4
ASGNI4
line 629
;628:					//last time the team mate was visible
;629:					bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6748
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 631
;630:					//no message
;631:					bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 633
;632:					//no arrive message
;633:					bs->arrive_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
CNSTF4 1065353216
ASGNF4
line 635
;634:					//
;635:					BotVoiceChat(bs, bs->teammate, VOICECHAT_ONFOLLOW);
ADDRLP4 204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 204
INDIRP4
ARGP4
ADDRLP4 204
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRGP4 $233
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 637
;636:					//get the team goal time
;637:					bs->teamgoal_time = FloatTime() + TEAM_ACCOMPANY_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 638
;638:					bs->ltgtype = LTG_TEAMACCOMPANY;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 2
ASGNI4
line 639
;639:					bs->formation_dist = 3.5 * 32;		//3.5 meter
ADDRFP4 0
INDIRP4
CNSTI4 7012
ADDP4
CNSTF4 1121976320
ASGNF4
line 641
;640:					//
;641:					BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 642
;642:					bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 643
;643:				}
ADDRGP4 $186
JUMPV
LABELV $250
line 644
;644:				else {
line 645
;645:					BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 646
;646:					bs->decisionmaker = bs->client;
ADDRLP4 200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 200
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 200
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 647
;647:					bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 649
;648:					//get the enemy flag
;649:					bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 204
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
ADDRLP4 204
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 651
;650:					//get the flag
;651:					bs->ltgtype = LTG_RETURNFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 6
ASGNI4
line 653
;652:					//set the time the bot will stop getting the flag
;653:					bs->teamgoal_time = FloatTime() + CTF_RETURNFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 655
;654:					//get an alternative route goal towards the enemy base
;655:					BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 208
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 208
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 657
;656:					//
;657:					BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 658
;658:					bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 659
;659:				}
line 660
;660:			}
line 661
;661:		}
line 662
;662:		return;
ADDRGP4 $186
JUMPV
LABELV $244
line 665
;663:	}
;664:	// don't just do something wait for the bot team leader to give orders
;665:	if (BotTeamLeader(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 192
ADDRGP4 BotTeamLeader
CALLI4
ASGNI4
ADDRLP4 192
INDIRI4
CNSTI4 0
EQI4 $252
line 666
;666:		return;
ADDRGP4 $186
JUMPV
LABELV $252
line 669
;667:	}
;668:	// if the bot is ordered to do something
;669:	if ( bs->lastgoal_ltgtype ) {
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $254
line 670
;670:		bs->teamgoal_time += 60;
ADDRLP4 196
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ASGNP4
ADDRLP4 196
INDIRP4
ADDRLP4 196
INDIRP4
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 671
;671:	}
LABELV $254
line 673
;672:	// if the bot decided to do something on it's own and has a last ordered goal
;673:	if ( !bs->ordered && bs->lastgoal_ltgtype ) {
ADDRLP4 196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 200
CNSTI4 0
ASGNI4
ADDRLP4 196
INDIRP4
CNSTI4 6612
ADDP4
INDIRI4
ADDRLP4 200
INDIRI4
NEI4 $256
ADDRLP4 196
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
ADDRLP4 200
INDIRI4
EQI4 $256
line 674
;674:		bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 675
;675:	}
LABELV $256
line 677
;676:	//if already a CTF or team goal
;677:	if (bs->ltgtype == LTG_TEAMHELP ||
ADDRLP4 204
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 1
EQI4 $269
ADDRLP4 204
INDIRI4
CNSTI4 2
EQI4 $269
ADDRLP4 204
INDIRI4
CNSTI4 3
EQI4 $269
ADDRLP4 204
INDIRI4
CNSTI4 4
EQI4 $269
ADDRLP4 204
INDIRI4
CNSTI4 5
EQI4 $269
ADDRLP4 204
INDIRI4
CNSTI4 6
EQI4 $269
ADDRLP4 204
INDIRI4
CNSTI4 8
EQI4 $269
ADDRLP4 204
INDIRI4
CNSTI4 9
EQI4 $269
ADDRLP4 204
INDIRI4
CNSTI4 10
EQI4 $269
ADDRLP4 204
INDIRI4
CNSTI4 14
EQI4 $269
ADDRLP4 204
INDIRI4
CNSTI4 15
NEI4 $258
LABELV $269
line 687
;678:			bs->ltgtype == LTG_TEAMACCOMPANY ||
;679:			bs->ltgtype == LTG_DEFENDKEYAREA ||
;680:			bs->ltgtype == LTG_GETFLAG ||
;681:			bs->ltgtype == LTG_RUSHBASE ||
;682:			bs->ltgtype == LTG_RETURNFLAG ||
;683:			bs->ltgtype == LTG_CAMPORDER ||
;684:			bs->ltgtype == LTG_PATROL ||
;685:			bs->ltgtype == LTG_GETITEM ||
;686:			bs->ltgtype == LTG_MAKELOVE_UNDER ||
;687:			bs->ltgtype == LTG_MAKELOVE_ONTOP) {
line 688
;688:		return;
ADDRGP4 $186
JUMPV
LABELV $258
line 691
;689:	}
;690:	//
;691:	if (BotSetLastOrderedTask(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 208
ADDRGP4 BotSetLastOrderedTask
CALLI4
ASGNI4
ADDRLP4 208
INDIRI4
CNSTI4 0
EQI4 $270
line 692
;692:		return;
ADDRGP4 $186
JUMPV
LABELV $270
line 694
;693:	//
;694:	if (bs->owndecision_time > FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
LEF4 $272
line 695
;695:		return;;
ADDRGP4 $186
JUMPV
LABELV $272
line 697
;696:	//if the bot is roaming
;697:	if (bs->ctfroam_time > FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 6164
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $274
line 698
;698:		return;
ADDRGP4 $186
JUMPV
LABELV $274
line 700
;699:	//if the bot has anough aggression to decide what to do
;700:	if (BotAggression(bs) < 50)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 212
ADDRGP4 BotAggression
CALLF4
ASGNF4
ADDRLP4 212
INDIRF4
CNSTF4 1112014848
GEF4 $276
line 701
;701:		return;
ADDRGP4 $186
JUMPV
LABELV $276
line 703
;702:	//set the time to send a message to the team mates
;703:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 216
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
ADDRLP4 216
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 705
;704:	//
;705:	if (bs->teamtaskpreference & (TEAMTP_ATTACKER|TEAMTP_DEFENDER)) {
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $278
line 706
;706:		if (bs->teamtaskpreference & TEAMTP_ATTACKER) {
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $280
line 707
;707:			l1 = 0.7f;
ADDRLP4 8
CNSTF4 1060320051
ASGNF4
line 708
;708:		}
ADDRGP4 $281
JUMPV
LABELV $280
line 709
;709:		else {
line 710
;710:			l1 = 0.2f;
ADDRLP4 8
CNSTF4 1045220557
ASGNF4
line 711
;711:		}
LABELV $281
line 712
;712:		l2 = 0.9f;
ADDRLP4 12
CNSTF4 1063675494
ASGNF4
line 713
;713:	}
ADDRGP4 $279
JUMPV
LABELV $278
line 714
;714:	else {
line 715
;715:		l1 = 0.4f;
ADDRLP4 8
CNSTF4 1053609165
ASGNF4
line 716
;716:		l2 = 0.7f;
ADDRLP4 12
CNSTF4 1060320051
ASGNF4
line 717
;717:	}
LABELV $279
line 719
;718:	//get the flag or defend the base
;719:	rnd = random();
ADDRLP4 220
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 220
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ASGNF4
line 720
;720:	if (rnd < l1 && ctf_redflag.areanum && ctf_blueflag.areanum) {
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
GEF4 $282
ADDRLP4 224
CNSTI4 0
ASGNI4
ADDRGP4 ctf_redflag+12
INDIRI4
ADDRLP4 224
INDIRI4
EQI4 $282
ADDRGP4 ctf_blueflag+12
INDIRI4
ADDRLP4 224
INDIRI4
EQI4 $282
line 721
;721:		bs->decisionmaker = bs->client;
ADDRLP4 228
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 228
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 228
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 722
;722:		bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 723
;723:		bs->ltgtype = LTG_GETFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 4
ASGNI4
line 725
;724:		//set the time the bot will stop getting the flag
;725:		bs->teamgoal_time = FloatTime() + CTF_GETFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 727
;726:		//get an alternative route goal towards the enemy base
;727:		BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 232
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 232
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 728
;728:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 729
;729:	}
ADDRGP4 $283
JUMPV
LABELV $282
line 730
;730:	else if (rnd < l2 && ctf_redflag.areanum && ctf_blueflag.areanum) {
ADDRLP4 4
INDIRF4
ADDRLP4 12
INDIRF4
GEF4 $286
ADDRLP4 228
CNSTI4 0
ASGNI4
ADDRGP4 ctf_redflag+12
INDIRI4
ADDRLP4 228
INDIRI4
EQI4 $286
ADDRGP4 ctf_blueflag+12
INDIRI4
ADDRLP4 228
INDIRI4
EQI4 $286
line 731
;731:		bs->decisionmaker = bs->client;
ADDRLP4 232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 232
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 232
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 732
;732:		bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 734
;733:		//
;734:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 236
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 236
INDIRI4
CNSTI4 1
NEI4 $290
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 ctf_redflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $291
JUMPV
LABELV $290
line 735
;735:		else memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
LABELV $291
line 737
;736:		//set the ltg type
;737:		bs->ltgtype = LTG_DEFENDKEYAREA;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 3
ASGNI4
line 739
;738:		//set the time the bot stops defending the base
;739:		bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 740
;740:		bs->defendaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6144
ADDP4
CNSTF4 0
ASGNF4
line 741
;741:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 742
;742:	}
ADDRGP4 $287
JUMPV
LABELV $286
line 743
;743:	else {
line 744
;744:		bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 746
;745:		//set the time the bot will stop roaming
;746:		bs->ctfroam_time = FloatTime() + CTF_ROAM_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6164
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 747
;747:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 748
;748:	}
LABELV $287
LABELV $283
line 749
;749:	bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 753
;750:#ifdef DEBUG
;751:	BotPrintTeamGoal(bs);
;752:#endif //DEBUG
;753:}
LABELV $186
endproc BotCTFSeekGoals 240 12
export BotCTFRetreatGoals
proc BotCTFRetreatGoals 8 4
line 760
;754:
;755:/*
;756:==================
;757:BotCTFRetreatGoals
;758:==================
;759:*/
;760:void BotCTFRetreatGoals(bot_state_t *bs) {
line 762
;761:	//when carrying a flag in ctf the bot should rush to the base
;762:	if (BotCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $293
line 764
;763:		//if not already rushing to the base
;764:		if (bs->ltgtype != LTG_RUSHBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
EQI4 $295
line 765
;765:			BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 766
;766:			bs->ltgtype = LTG_RUSHBASE;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 5
ASGNI4
line 767
;767:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 768
;768:			bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
CNSTF4 0
ASGNF4
line 769
;769:			bs->decisionmaker = bs->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 770
;770:			bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 771
;771:			BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 772
;772:		}
LABELV $295
line 773
;773:	}
LABELV $293
line 774
;774:}
LABELV $292
endproc BotCTFRetreatGoals 8 4
export Bot1FCTFSeekGoals
proc Bot1FCTFSeekGoals 208 12
line 782
;775:
;776:#ifdef MISSIONPACK
;777:/*
;778:==================
;779:Bot1FCTFSeekGoals
;780:==================
;781:*/
;782:void Bot1FCTFSeekGoals(bot_state_t *bs) {
line 788
;783:	aas_entityinfo_t entinfo;
;784:	float rnd, l1, l2;
;785:	int c;
;786:
;787:	//when carrying a flag in ctf the bot should rush to the base
;788:	if (Bot1FCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 156
ADDRGP4 Bot1FCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
EQI4 $298
line 790
;789:		//if not already rushing to the base
;790:		if (bs->ltgtype != LTG_RUSHBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
EQI4 $297
line 791
;791:			BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 792
;792:			bs->ltgtype = LTG_RUSHBASE;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 5
ASGNI4
line 793
;793:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 794
;794:			bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
CNSTF4 0
ASGNF4
line 795
;795:			bs->decisionmaker = bs->client;
ADDRLP4 160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 160
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 160
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 796
;796:			bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 798
;797:			//get an alternative route goal towards the enemy base
;798:			BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 164
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 800
;799:			//
;800:			BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 801
;801:			BotVoiceChat(bs, -1, VOICECHAT_IHAVEFLAG);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 $208
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 802
;802:		}
line 803
;803:		return;
ADDRGP4 $297
JUMPV
LABELV $298
line 806
;804:	}
;805:	// if the bot decided to follow someone
;806:	if ( bs->ltgtype == LTG_TEAMACCOMPANY && !bs->ordered ) {
ADDRLP4 160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 160
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
NEI4 $302
ADDRLP4 160
INDIRP4
CNSTI4 6612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $302
line 808
;807:		// if the team mate being accompanied no longer carries the flag
;808:		BotEntityInfo(bs->teammate, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 809
;809:		if (!EntityCarriesFlag(&entinfo)) {
ADDRLP4 12
ARGP4
ADDRLP4 164
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
NEI4 $304
line 810
;810:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 811
;811:		}
LABELV $304
line 812
;812:	}
LABELV $302
line 814
;813:	//our team has the flag
;814:	if (bs->neutralflagstatus == 1) {
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
INDIRI4
CNSTI4 1
NEI4 $306
line 815
;815:		if (bs->owndecision_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
GEF4 $297
line 817
;816:			// if not already following someone
;817:			if (bs->ltgtype != LTG_TEAMACCOMPANY) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
EQI4 $310
line 819
;818:				//if there is a visible team mate flag carrier
;819:				c = BotTeamFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 BotTeamFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 152
ADDRLP4 164
INDIRI4
ASGNI4
line 820
;820:				if (c >= 0) {
ADDRLP4 152
INDIRI4
CNSTI4 0
LTI4 $312
line 821
;821:					BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 823
;822:					//follow the flag carrier
;823:					bs->decisionmaker = bs->client;
ADDRLP4 168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 168
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 168
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 824
;824:					bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 826
;825:					//the team mate
;826:					bs->teammate = c;
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
ADDRLP4 152
INDIRI4
ASGNI4
line 828
;827:					//last time the team mate was visible
;828:					bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6748
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 830
;829:					//no message
;830:					bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 832
;831:					//no arrive message
;832:					bs->arrive_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
CNSTF4 1065353216
ASGNF4
line 834
;833:					//
;834:					BotVoiceChat(bs, bs->teammate, VOICECHAT_ONFOLLOW);
ADDRLP4 172
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 172
INDIRP4
ARGP4
ADDRLP4 172
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRGP4 $233
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 836
;835:					//get the team goal time
;836:					bs->teamgoal_time = FloatTime() + TEAM_ACCOMPANY_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 837
;837:					bs->ltgtype = LTG_TEAMACCOMPANY;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 2
ASGNI4
line 838
;838:					bs->formation_dist = 3.5 * 32;		//3.5 meter
ADDRFP4 0
INDIRP4
CNSTI4 7012
ADDP4
CNSTF4 1121976320
ASGNF4
line 839
;839:					BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 840
;840:					bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 841
;841:					return;
ADDRGP4 $297
JUMPV
LABELV $312
line 843
;842:				}
;843:			}
LABELV $310
line 845
;844:			//if already a CTF or team goal
;845:			if (bs->ltgtype == LTG_TEAMHELP ||
ADDRLP4 164
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 1
EQI4 $325
ADDRLP4 164
INDIRI4
CNSTI4 2
EQI4 $325
ADDRLP4 164
INDIRI4
CNSTI4 3
EQI4 $325
ADDRLP4 164
INDIRI4
CNSTI4 4
EQI4 $325
ADDRLP4 164
INDIRI4
CNSTI4 5
EQI4 $325
ADDRLP4 164
INDIRI4
CNSTI4 8
EQI4 $325
ADDRLP4 164
INDIRI4
CNSTI4 9
EQI4 $325
ADDRLP4 164
INDIRI4
CNSTI4 13
EQI4 $325
ADDRLP4 164
INDIRI4
CNSTI4 10
EQI4 $325
ADDRLP4 164
INDIRI4
CNSTI4 14
EQI4 $325
ADDRLP4 164
INDIRI4
CNSTI4 15
NEI4 $314
LABELV $325
line 855
;846:					bs->ltgtype == LTG_TEAMACCOMPANY ||
;847:					bs->ltgtype == LTG_DEFENDKEYAREA ||
;848:					bs->ltgtype == LTG_GETFLAG ||
;849:					bs->ltgtype == LTG_RUSHBASE ||
;850:					bs->ltgtype == LTG_CAMPORDER ||
;851:					bs->ltgtype == LTG_PATROL ||
;852:					bs->ltgtype == LTG_ATTACKENEMYBASE ||
;853:					bs->ltgtype == LTG_GETITEM ||
;854:					bs->ltgtype == LTG_MAKELOVE_UNDER ||
;855:					bs->ltgtype == LTG_MAKELOVE_ONTOP) {
line 856
;856:				return;
ADDRGP4 $297
JUMPV
LABELV $314
line 859
;857:			}
;858:			//if not already attacking the enemy base
;859:			if (bs->ltgtype != LTG_ATTACKENEMYBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 13
EQI4 $297
line 860
;860:				BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 861
;861:				bs->decisionmaker = bs->client;
ADDRLP4 168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 168
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 168
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 862
;862:				bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 864
;863:				//
;864:				if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 172
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 1
NEI4 $328
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $329
JUMPV
LABELV $328
line 865
;865:				else memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 ctf_redflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
LABELV $329
line 867
;866:				//set the ltg type
;867:				bs->ltgtype = LTG_ATTACKENEMYBASE;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 13
ASGNI4
line 869
;868:				//set the time the bot will stop getting the flag
;869:				bs->teamgoal_time = FloatTime() + TEAM_ATTACKENEMYBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 870
;870:				BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 871
;871:				bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 872
;872:			}
line 873
;873:		}
line 874
;874:		return;
ADDRGP4 $297
JUMPV
LABELV $306
line 877
;875:	}
;876:	//enemy team has the flag
;877:	else if (bs->neutralflagstatus == 2) {
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
INDIRI4
CNSTI4 2
NEI4 $330
line 878
;878:		if (bs->owndecision_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
GEF4 $297
line 879
;879:			c = BotEnemyFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 BotEnemyFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 152
ADDRLP4 164
INDIRI4
ASGNI4
line 880
;880:			if (c >= 0) {
ADDRLP4 152
INDIRI4
CNSTI4 0
LTI4 $334
line 882
;881:				//FIXME: attack enemy flag carrier
;882:			}
LABELV $334
line 884
;883:			//if already a CTF or team goal
;884:			if (bs->ltgtype == LTG_TEAMHELP ||
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 1
EQI4 $341
ADDRLP4 168
INDIRI4
CNSTI4 2
EQI4 $341
ADDRLP4 168
INDIRI4
CNSTI4 8
EQI4 $341
ADDRLP4 168
INDIRI4
CNSTI4 9
EQI4 $341
ADDRLP4 168
INDIRI4
CNSTI4 10
NEI4 $336
LABELV $341
line 888
;885:					bs->ltgtype == LTG_TEAMACCOMPANY ||
;886:					bs->ltgtype == LTG_CAMPORDER ||
;887:					bs->ltgtype == LTG_PATROL ||
;888:					bs->ltgtype == LTG_GETITEM) {
line 889
;889:				return;
ADDRGP4 $297
JUMPV
LABELV $336
line 892
;890:			}
;891:			// if not already defending the base
;892:			if (bs->ltgtype != LTG_DEFENDKEYAREA) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 3
EQI4 $297
line 893
;893:				BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 894
;894:				bs->decisionmaker = bs->client;
ADDRLP4 172
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 172
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 172
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 895
;895:				bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 897
;896:				//
;897:				if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 176
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 1
NEI4 $344
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 ctf_redflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $345
JUMPV
LABELV $344
line 898
;898:				else memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
LABELV $345
line 900
;899:				//set the ltg type
;900:				bs->ltgtype = LTG_DEFENDKEYAREA;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 3
ASGNI4
line 902
;901:				//set the time the bot stops defending the base
;902:				bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 903
;903:				bs->defendaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6144
ADDP4
CNSTF4 0
ASGNF4
line 904
;904:				BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 905
;905:				bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 906
;906:			}
line 907
;907:		}
line 908
;908:		return;
ADDRGP4 $297
JUMPV
LABELV $330
line 911
;909:	}
;910:	// don't just do something wait for the bot team leader to give orders
;911:	if (BotTeamLeader(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 BotTeamLeader
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
EQI4 $346
line 912
;912:		return;
ADDRGP4 $297
JUMPV
LABELV $346
line 915
;913:	}
;914:	// if the bot is ordered to do something
;915:	if ( bs->lastgoal_ltgtype ) {
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $348
line 916
;916:		bs->teamgoal_time += 60;
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 917
;917:	}
LABELV $348
line 919
;918:	// if the bot decided to do something on it's own and has a last ordered goal
;919:	if ( !bs->ordered && bs->lastgoal_ltgtype ) {
ADDRLP4 168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 172
CNSTI4 0
ASGNI4
ADDRLP4 168
INDIRP4
CNSTI4 6612
ADDP4
INDIRI4
ADDRLP4 172
INDIRI4
NEI4 $350
ADDRLP4 168
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
ADDRLP4 172
INDIRI4
EQI4 $350
line 920
;920:		bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 921
;921:	}
LABELV $350
line 923
;922:	//if already a CTF or team goal
;923:	if (bs->ltgtype == LTG_TEAMHELP ||
ADDRLP4 176
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 1
EQI4 $364
ADDRLP4 176
INDIRI4
CNSTI4 2
EQI4 $364
ADDRLP4 176
INDIRI4
CNSTI4 3
EQI4 $364
ADDRLP4 176
INDIRI4
CNSTI4 4
EQI4 $364
ADDRLP4 176
INDIRI4
CNSTI4 5
EQI4 $364
ADDRLP4 176
INDIRI4
CNSTI4 6
EQI4 $364
ADDRLP4 176
INDIRI4
CNSTI4 8
EQI4 $364
ADDRLP4 176
INDIRI4
CNSTI4 9
EQI4 $364
ADDRLP4 176
INDIRI4
CNSTI4 13
EQI4 $364
ADDRLP4 176
INDIRI4
CNSTI4 10
EQI4 $364
ADDRLP4 176
INDIRI4
CNSTI4 14
EQI4 $364
ADDRLP4 176
INDIRI4
CNSTI4 15
NEI4 $352
LABELV $364
line 934
;924:			bs->ltgtype == LTG_TEAMACCOMPANY ||
;925:			bs->ltgtype == LTG_DEFENDKEYAREA ||
;926:			bs->ltgtype == LTG_GETFLAG ||
;927:			bs->ltgtype == LTG_RUSHBASE ||
;928:			bs->ltgtype == LTG_RETURNFLAG ||
;929:			bs->ltgtype == LTG_CAMPORDER ||
;930:			bs->ltgtype == LTG_PATROL ||
;931:			bs->ltgtype == LTG_ATTACKENEMYBASE ||
;932:			bs->ltgtype == LTG_GETITEM ||
;933:			bs->ltgtype == LTG_MAKELOVE_UNDER ||
;934:			bs->ltgtype == LTG_MAKELOVE_ONTOP) {
line 935
;935:		return;
ADDRGP4 $297
JUMPV
LABELV $352
line 938
;936:	}
;937:	//
;938:	if (BotSetLastOrderedTask(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 180
ADDRGP4 BotSetLastOrderedTask
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 0
EQI4 $365
line 939
;939:		return;
ADDRGP4 $297
JUMPV
LABELV $365
line 941
;940:	//
;941:	if (bs->owndecision_time > FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
LEF4 $367
line 942
;942:		return;;
ADDRGP4 $297
JUMPV
LABELV $367
line 944
;943:	//if the bot is roaming
;944:	if (bs->ctfroam_time > FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 6164
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $369
line 945
;945:		return;
ADDRGP4 $297
JUMPV
LABELV $369
line 947
;946:	//if the bot has anough aggression to decide what to do
;947:	if (BotAggression(bs) < 50)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 184
ADDRGP4 BotAggression
CALLF4
ASGNF4
ADDRLP4 184
INDIRF4
CNSTF4 1112014848
GEF4 $371
line 948
;948:		return;
ADDRGP4 $297
JUMPV
LABELV $371
line 950
;949:	//set the time to send a message to the team mates
;950:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 188
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
ADDRLP4 188
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 952
;951:	//
;952:	if (bs->teamtaskpreference & (TEAMTP_ATTACKER|TEAMTP_DEFENDER)) {
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $373
line 953
;953:		if (bs->teamtaskpreference & TEAMTP_ATTACKER) {
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $375
line 954
;954:			l1 = 0.7f;
ADDRLP4 4
CNSTF4 1060320051
ASGNF4
line 955
;955:		}
ADDRGP4 $376
JUMPV
LABELV $375
line 956
;956:		else {
line 957
;957:			l1 = 0.2f;
ADDRLP4 4
CNSTF4 1045220557
ASGNF4
line 958
;958:		}
LABELV $376
line 959
;959:		l2 = 0.9f;
ADDRLP4 8
CNSTF4 1063675494
ASGNF4
line 960
;960:	}
ADDRGP4 $374
JUMPV
LABELV $373
line 961
;961:	else {
line 962
;962:		l1 = 0.4f;
ADDRLP4 4
CNSTF4 1053609165
ASGNF4
line 963
;963:		l2 = 0.7f;
ADDRLP4 8
CNSTF4 1060320051
ASGNF4
line 964
;964:	}
LABELV $374
line 966
;965:	//get the flag or defend the base
;966:	rnd = random();
ADDRLP4 192
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 192
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ASGNF4
line 967
;967:	if (rnd < l1 && ctf_neutralflag.areanum) {
ADDRLP4 0
INDIRF4
ADDRLP4 4
INDIRF4
GEF4 $377
ADDRGP4 ctf_neutralflag+12
INDIRI4
CNSTI4 0
EQI4 $377
line 968
;968:		bs->decisionmaker = bs->client;
ADDRLP4 196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 196
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 196
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 969
;969:		bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 970
;970:		bs->ltgtype = LTG_GETFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 4
ASGNI4
line 972
;971:		//set the time the bot will stop getting the flag
;972:		bs->teamgoal_time = FloatTime() + CTF_GETFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 973
;973:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 974
;974:	}
ADDRGP4 $378
JUMPV
LABELV $377
line 975
;975:	else if (rnd < l2 && ctf_redflag.areanum && ctf_blueflag.areanum) {
ADDRLP4 0
INDIRF4
ADDRLP4 8
INDIRF4
GEF4 $380
ADDRLP4 196
CNSTI4 0
ASGNI4
ADDRGP4 ctf_redflag+12
INDIRI4
ADDRLP4 196
INDIRI4
EQI4 $380
ADDRGP4 ctf_blueflag+12
INDIRI4
ADDRLP4 196
INDIRI4
EQI4 $380
line 976
;976:		bs->decisionmaker = bs->client;
ADDRLP4 200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 200
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 200
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 977
;977:		bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 979
;978:		//
;979:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 204
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 1
NEI4 $384
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 ctf_redflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $385
JUMPV
LABELV $384
line 980
;980:		else memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
LABELV $385
line 982
;981:		//set the ltg type
;982:		bs->ltgtype = LTG_DEFENDKEYAREA;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 3
ASGNI4
line 984
;983:		//set the time the bot stops defending the base
;984:		bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 985
;985:		bs->defendaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6144
ADDP4
CNSTF4 0
ASGNF4
line 986
;986:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 987
;987:	}
ADDRGP4 $381
JUMPV
LABELV $380
line 988
;988:	else {
line 989
;989:		bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 991
;990:		//set the time the bot will stop roaming
;991:		bs->ctfroam_time = FloatTime() + CTF_ROAM_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6164
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 992
;992:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 993
;993:	}
LABELV $381
LABELV $378
line 994
;994:	bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 998
;995:#ifdef DEBUG
;996:	BotPrintTeamGoal(bs);
;997:#endif //DEBUG
;998:}
LABELV $297
endproc Bot1FCTFSeekGoals 208 12
export Bot1FCTFRetreatGoals
proc Bot1FCTFRetreatGoals 12 8
line 1005
;999:
;1000:/*
;1001:==================
;1002:Bot1FCTFRetreatGoals
;1003:==================
;1004:*/
;1005:void Bot1FCTFRetreatGoals(bot_state_t *bs) {
line 1007
;1006:	//when carrying a flag in ctf the bot should rush to the enemy base
;1007:	if (Bot1FCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 Bot1FCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $387
line 1009
;1008:		//if not already rushing to the base
;1009:		if (bs->ltgtype != LTG_RUSHBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
EQI4 $389
line 1010
;1010:			BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 1011
;1011:			bs->ltgtype = LTG_RUSHBASE;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 5
ASGNI4
line 1012
;1012:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 1013
;1013:			bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
CNSTF4 0
ASGNF4
line 1014
;1014:			bs->decisionmaker = bs->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1015
;1015:			bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 1017
;1016:			//get an alternative route goal towards the enemy base
;1017:			BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 1018
;1018:			BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1019
;1019:		}
LABELV $389
line 1020
;1020:	}
LABELV $387
line 1021
;1021:}
LABELV $386
endproc Bot1FCTFRetreatGoals 12 8
export BotObeliskSeekGoals
proc BotObeliskSeekGoals 52 12
line 1028
;1022:
;1023:/*
;1024:==================
;1025:BotObeliskSeekGoals
;1026:==================
;1027:*/
;1028:void BotObeliskSeekGoals(bot_state_t *bs) {
line 1032
;1029:	float rnd, l1, l2;
;1030:
;1031:	// don't just do something wait for the bot team leader to give orders
;1032:	if (BotTeamLeader(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 BotTeamLeader
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $392
line 1033
;1033:		return;
ADDRGP4 $391
JUMPV
LABELV $392
line 1036
;1034:	}
;1035:	// if the bot is ordered to do something
;1036:	if ( bs->lastgoal_ltgtype ) {
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $394
line 1037
;1037:		bs->teamgoal_time += 60;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 1038
;1038:	}
LABELV $394
line 1040
;1039:	//if already a team goal
;1040:	if (bs->ltgtype == LTG_TEAMHELP ||
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
EQI4 $408
ADDRLP4 16
INDIRI4
CNSTI4 2
EQI4 $408
ADDRLP4 16
INDIRI4
CNSTI4 3
EQI4 $408
ADDRLP4 16
INDIRI4
CNSTI4 4
EQI4 $408
ADDRLP4 16
INDIRI4
CNSTI4 5
EQI4 $408
ADDRLP4 16
INDIRI4
CNSTI4 6
EQI4 $408
ADDRLP4 16
INDIRI4
CNSTI4 8
EQI4 $408
ADDRLP4 16
INDIRI4
CNSTI4 9
EQI4 $408
ADDRLP4 16
INDIRI4
CNSTI4 13
EQI4 $408
ADDRLP4 16
INDIRI4
CNSTI4 10
EQI4 $408
ADDRLP4 16
INDIRI4
CNSTI4 14
EQI4 $408
ADDRLP4 16
INDIRI4
CNSTI4 15
NEI4 $396
LABELV $408
line 1051
;1041:			bs->ltgtype == LTG_TEAMACCOMPANY ||
;1042:			bs->ltgtype == LTG_DEFENDKEYAREA ||
;1043:			bs->ltgtype == LTG_GETFLAG ||
;1044:			bs->ltgtype == LTG_RUSHBASE ||
;1045:			bs->ltgtype == LTG_RETURNFLAG ||
;1046:			bs->ltgtype == LTG_CAMPORDER ||
;1047:			bs->ltgtype == LTG_PATROL ||
;1048:			bs->ltgtype == LTG_ATTACKENEMYBASE ||
;1049:			bs->ltgtype == LTG_GETITEM ||
;1050:			bs->ltgtype == LTG_MAKELOVE_UNDER ||
;1051:			bs->ltgtype == LTG_MAKELOVE_ONTOP) {
line 1052
;1052:		return;
ADDRGP4 $391
JUMPV
LABELV $396
line 1055
;1053:	}
;1054:	//
;1055:	if (BotSetLastOrderedTask(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 BotSetLastOrderedTask
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $409
line 1056
;1056:		return;
ADDRGP4 $391
JUMPV
LABELV $409
line 1058
;1057:	//if the bot is roaming
;1058:	if (bs->ctfroam_time > FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 6164
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $411
line 1059
;1059:		return;
ADDRGP4 $391
JUMPV
LABELV $411
line 1061
;1060:	//if the bot has anough aggression to decide what to do
;1061:	if (BotAggression(bs) < 50)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 BotAggression
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
CNSTF4 1112014848
GEF4 $413
line 1062
;1062:		return;
ADDRGP4 $391
JUMPV
LABELV $413
line 1064
;1063:	//set the time to send a message to the team mates
;1064:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 28
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
ADDRLP4 28
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 1066
;1065:	//
;1066:	if (bs->teamtaskpreference & (TEAMTP_ATTACKER|TEAMTP_DEFENDER)) {
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $415
line 1067
;1067:		if (bs->teamtaskpreference & TEAMTP_ATTACKER) {
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $417
line 1068
;1068:			l1 = 0.7f;
ADDRLP4 4
CNSTF4 1060320051
ASGNF4
line 1069
;1069:		}
ADDRGP4 $418
JUMPV
LABELV $417
line 1070
;1070:		else {
line 1071
;1071:			l1 = 0.2f;
ADDRLP4 4
CNSTF4 1045220557
ASGNF4
line 1072
;1072:		}
LABELV $418
line 1073
;1073:		l2 = 0.9f;
ADDRLP4 8
CNSTF4 1063675494
ASGNF4
line 1074
;1074:	}
ADDRGP4 $416
JUMPV
LABELV $415
line 1075
;1075:	else {
line 1076
;1076:		l1 = 0.4f;
ADDRLP4 4
CNSTF4 1053609165
ASGNF4
line 1077
;1077:		l2 = 0.7f;
ADDRLP4 8
CNSTF4 1060320051
ASGNF4
line 1078
;1078:	}
LABELV $416
line 1080
;1079:	//get the flag or defend the base
;1080:	rnd = random();
ADDRLP4 32
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 32
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ASGNF4
line 1081
;1081:	if (rnd < l1 && redobelisk.areanum && blueobelisk.areanum) {
ADDRLP4 0
INDIRF4
ADDRLP4 4
INDIRF4
GEF4 $419
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRGP4 redobelisk+12
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $419
ADDRGP4 blueobelisk+12
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $419
line 1082
;1082:		bs->decisionmaker = bs->client;
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1083
;1083:		bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 1085
;1084:		//
;1085:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &blueobelisk, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $423
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 blueobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $424
JUMPV
LABELV $423
line 1086
;1086:		else memcpy(&bs->teamgoal, &redobelisk, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 redobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
LABELV $424
line 1088
;1087:		//set the ltg type
;1088:		bs->ltgtype = LTG_ATTACKENEMYBASE;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 13
ASGNI4
line 1090
;1089:		//set the time the bot will stop attacking the enemy base
;1090:		bs->teamgoal_time = FloatTime() + TEAM_ATTACKENEMYBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 1092
;1091:		//get an alternate route goal towards the enemy base
;1092:		BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 1093
;1093:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1094
;1094:	}
ADDRGP4 $420
JUMPV
LABELV $419
line 1095
;1095:	else if (rnd < l2 && redobelisk.areanum && blueobelisk.areanum) {
ADDRLP4 0
INDIRF4
ADDRLP4 8
INDIRF4
GEF4 $425
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRGP4 redobelisk+12
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $425
ADDRGP4 blueobelisk+12
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $425
line 1096
;1096:		bs->decisionmaker = bs->client;
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1097
;1097:		bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 1099
;1098:		//
;1099:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &redobelisk, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 1
NEI4 $429
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 redobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $430
JUMPV
LABELV $429
line 1100
;1100:		else memcpy(&bs->teamgoal, &blueobelisk, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 blueobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
LABELV $430
line 1102
;1101:		//set the ltg type
;1102:		bs->ltgtype = LTG_DEFENDKEYAREA;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 3
ASGNI4
line 1104
;1103:		//set the time the bot stops defending the base
;1104:		bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 1105
;1105:		bs->defendaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6144
ADDP4
CNSTF4 0
ASGNF4
line 1106
;1106:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1107
;1107:	}
ADDRGP4 $426
JUMPV
LABELV $425
line 1108
;1108:	else {
line 1109
;1109:		bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 1111
;1110:		//set the time the bot will stop roaming
;1111:		bs->ctfroam_time = FloatTime() + CTF_ROAM_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6164
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 1112
;1112:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1113
;1113:	}
LABELV $426
LABELV $420
line 1114
;1114:}
LABELV $391
endproc BotObeliskSeekGoals 52 12
export BotGoHarvest
proc BotGoHarvest 4 12
line 1121
;1115:
;1116:/*
;1117:==================
;1118:BotGoHarvest
;1119:==================
;1120:*/
;1121:void BotGoHarvest(bot_state_t *bs) {
line 1123
;1122:	//
;1123:	if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &blueobelisk, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $432
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 blueobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $433
JUMPV
LABELV $432
line 1124
;1124:	else memcpy(&bs->teamgoal, &redobelisk, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 redobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
LABELV $433
line 1126
;1125:	//set the ltg type
;1126:	bs->ltgtype = LTG_HARVEST;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 12
ASGNI4
line 1128
;1127:	//set the time the bot will stop harvesting
;1128:	bs->teamgoal_time = FloatTime() + TEAM_HARVEST_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 1129
;1129:	bs->harvestaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6160
ADDP4
CNSTF4 0
ASGNF4
line 1130
;1130:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1131
;1131:}
LABELV $431
endproc BotGoHarvest 4 12
export BotObeliskRetreatGoals
proc BotObeliskRetreatGoals 0 0
line 1138
;1132:
;1133:/*
;1134:==================
;1135:BotObeliskRetreatGoals
;1136:==================
;1137:*/
;1138:void BotObeliskRetreatGoals(bot_state_t *bs) {
line 1140
;1139:	//nothing special
;1140:}
LABELV $434
endproc BotObeliskRetreatGoals 0 0
export BotHarvesterSeekGoals
proc BotHarvesterSeekGoals 208 12
line 1147
;1141:
;1142:/*
;1143:==================
;1144:BotHarvesterSeekGoals
;1145:==================
;1146:*/
;1147:void BotHarvesterSeekGoals(bot_state_t *bs) {
line 1153
;1148:	aas_entityinfo_t entinfo;
;1149:	float rnd, l1, l2;
;1150:	int c;
;1151:
;1152:	//when carrying cubes in harvester the bot should rush to the base
;1153:	if (BotHarvesterCarryingCubes(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 156
ADDRGP4 BotHarvesterCarryingCubes
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
EQI4 $436
line 1155
;1154:		//if not already rushing to the base
;1155:		if (bs->ltgtype != LTG_RUSHBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
EQI4 $435
line 1156
;1156:			BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 1157
;1157:			bs->ltgtype = LTG_RUSHBASE;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 5
ASGNI4
line 1158
;1158:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 1159
;1159:			bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
CNSTF4 0
ASGNF4
line 1160
;1160:			bs->decisionmaker = bs->client;
ADDRLP4 160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 160
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 160
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1161
;1161:			bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 1163
;1162:			//get an alternative route goal towards the enemy base
;1163:			BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 164
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 1165
;1164:			//
;1165:			BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1166
;1166:		}
line 1167
;1167:		return;
ADDRGP4 $435
JUMPV
LABELV $436
line 1170
;1168:	}
;1169:	// don't just do something wait for the bot team leader to give orders
;1170:	if (BotTeamLeader(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 160
ADDRGP4 BotTeamLeader
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
EQI4 $440
line 1171
;1171:		return;
ADDRGP4 $435
JUMPV
LABELV $440
line 1174
;1172:	}
;1173:	// if the bot decided to follow someone
;1174:	if ( bs->ltgtype == LTG_TEAMACCOMPANY && !bs->ordered ) {
ADDRLP4 164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 164
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
NEI4 $442
ADDRLP4 164
INDIRP4
CNSTI4 6612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $442
line 1176
;1175:		// if the team mate being accompanied no longer carries the flag
;1176:		BotEntityInfo(bs->teammate, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1177
;1177:		if (!EntityCarriesCubes(&entinfo)) {
ADDRLP4 16
ARGP4
ADDRLP4 168
ADDRGP4 EntityCarriesCubes
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 0
NEI4 $444
line 1178
;1178:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 1179
;1179:		}
LABELV $444
line 1180
;1180:	}
LABELV $442
line 1182
;1181:	// if the bot is ordered to do something
;1182:	if ( bs->lastgoal_ltgtype ) {
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $446
line 1183
;1183:		bs->teamgoal_time += 60;
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 1184
;1184:	}
LABELV $446
line 1186
;1185:	//if not yet doing something
;1186:	if (bs->ltgtype == LTG_TEAMHELP ||
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 1
EQI4 $459
ADDRLP4 168
INDIRI4
CNSTI4 2
EQI4 $459
ADDRLP4 168
INDIRI4
CNSTI4 3
EQI4 $459
ADDRLP4 168
INDIRI4
CNSTI4 4
EQI4 $459
ADDRLP4 168
INDIRI4
CNSTI4 8
EQI4 $459
ADDRLP4 168
INDIRI4
CNSTI4 9
EQI4 $459
ADDRLP4 168
INDIRI4
CNSTI4 13
EQI4 $459
ADDRLP4 168
INDIRI4
CNSTI4 12
EQI4 $459
ADDRLP4 168
INDIRI4
CNSTI4 10
EQI4 $459
ADDRLP4 168
INDIRI4
CNSTI4 14
EQI4 $459
ADDRLP4 168
INDIRI4
CNSTI4 15
NEI4 $448
LABELV $459
line 1196
;1187:			bs->ltgtype == LTG_TEAMACCOMPANY ||
;1188:			bs->ltgtype == LTG_DEFENDKEYAREA ||
;1189:			bs->ltgtype == LTG_GETFLAG ||
;1190:			bs->ltgtype == LTG_CAMPORDER ||
;1191:			bs->ltgtype == LTG_PATROL ||
;1192:			bs->ltgtype == LTG_ATTACKENEMYBASE ||
;1193:			bs->ltgtype == LTG_HARVEST ||
;1194:			bs->ltgtype == LTG_GETITEM ||
;1195:			bs->ltgtype == LTG_MAKELOVE_UNDER ||
;1196:			bs->ltgtype == LTG_MAKELOVE_ONTOP) {
line 1197
;1197:		return;
ADDRGP4 $435
JUMPV
LABELV $448
line 1200
;1198:	}
;1199:	//
;1200:	if (BotSetLastOrderedTask(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 172
ADDRGP4 BotSetLastOrderedTask
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 0
EQI4 $460
line 1201
;1201:		return;
ADDRGP4 $435
JUMPV
LABELV $460
line 1203
;1202:	//if the bot is roaming
;1203:	if (bs->ctfroam_time > FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 6164
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $462
line 1204
;1204:		return;
ADDRGP4 $435
JUMPV
LABELV $462
line 1206
;1205:	//if the bot has anough aggression to decide what to do
;1206:	if (BotAggression(bs) < 50)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 176
ADDRGP4 BotAggression
CALLF4
ASGNF4
ADDRLP4 176
INDIRF4
CNSTF4 1112014848
GEF4 $464
line 1207
;1207:		return;
ADDRGP4 $435
JUMPV
LABELV $464
line 1209
;1208:	//set the time to send a message to the team mates
;1209:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 180
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
ADDRLP4 180
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 1211
;1210:	//
;1211:	c = BotEnemyCubeCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 184
ADDRGP4 BotEnemyCubeCarrierVisible
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 184
INDIRI4
ASGNI4
line 1212
;1212:	if (c >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $466
line 1214
;1213:		//FIXME: attack enemy cube carrier
;1214:	}
LABELV $466
line 1215
;1215:	if (bs->ltgtype != LTG_TEAMACCOMPANY) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
EQI4 $468
line 1217
;1216:		//if there is a visible team mate carrying cubes
;1217:		c = BotTeamCubeCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 188
ADDRGP4 BotTeamCubeCarrierVisible
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 188
INDIRI4
ASGNI4
line 1218
;1218:		if (c >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $470
line 1220
;1219:			//follow the team mate carrying cubes
;1220:			bs->decisionmaker = bs->client;
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 192
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 192
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1221
;1221:			bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 1223
;1222:			//the team mate
;1223:			bs->teammate = c;
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1225
;1224:			//last time the team mate was visible
;1225:			bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6748
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1227
;1226:			//no message
;1227:			bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 1229
;1228:			//no arrive message
;1229:			bs->arrive_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
CNSTF4 1065353216
ASGNF4
line 1231
;1230:			//
;1231:			BotVoiceChat(bs, bs->teammate, VOICECHAT_ONFOLLOW);
ADDRLP4 196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 196
INDIRP4
ARGP4
ADDRLP4 196
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRGP4 $233
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 1233
;1232:			//get the team goal time
;1233:			bs->teamgoal_time = FloatTime() + TEAM_ACCOMPANY_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 1234
;1234:			bs->ltgtype = LTG_TEAMACCOMPANY;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 2
ASGNI4
line 1235
;1235:			bs->formation_dist = 3.5 * 32;		//3.5 meter
ADDRFP4 0
INDIRP4
CNSTI4 7012
ADDP4
CNSTF4 1121976320
ASGNF4
line 1236
;1236:			BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1237
;1237:			return;
ADDRGP4 $435
JUMPV
LABELV $470
line 1239
;1238:		}
;1239:	}
LABELV $468
line 1241
;1240:	//
;1241:	if (bs->teamtaskpreference & (TEAMTP_ATTACKER|TEAMTP_DEFENDER)) {
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $472
line 1242
;1242:		if (bs->teamtaskpreference & TEAMTP_ATTACKER) {
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $474
line 1243
;1243:			l1 = 0.7f;
ADDRLP4 8
CNSTF4 1060320051
ASGNF4
line 1244
;1244:		}
ADDRGP4 $475
JUMPV
LABELV $474
line 1245
;1245:		else {
line 1246
;1246:			l1 = 0.2f;
ADDRLP4 8
CNSTF4 1045220557
ASGNF4
line 1247
;1247:		}
LABELV $475
line 1248
;1248:		l2 = 0.9f;
ADDRLP4 12
CNSTF4 1063675494
ASGNF4
line 1249
;1249:	}
ADDRGP4 $473
JUMPV
LABELV $472
line 1250
;1250:	else {
line 1251
;1251:		l1 = 0.4f;
ADDRLP4 8
CNSTF4 1053609165
ASGNF4
line 1252
;1252:		l2 = 0.7f;
ADDRLP4 12
CNSTF4 1060320051
ASGNF4
line 1253
;1253:	}
LABELV $473
line 1255
;1254:	//
;1255:	rnd = random();
ADDRLP4 188
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 188
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ASGNF4
line 1256
;1256:	if (rnd < l1 && redobelisk.areanum && blueobelisk.areanum) {
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
GEF4 $476
ADDRLP4 192
CNSTI4 0
ASGNI4
ADDRGP4 redobelisk+12
INDIRI4
ADDRLP4 192
INDIRI4
EQI4 $476
ADDRGP4 blueobelisk+12
INDIRI4
ADDRLP4 192
INDIRI4
EQI4 $476
line 1257
;1257:		bs->decisionmaker = bs->client;
ADDRLP4 196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 196
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 196
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1258
;1258:		bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 1259
;1259:		BotGoHarvest(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotGoHarvest
CALLV
pop
line 1260
;1260:	}
ADDRGP4 $477
JUMPV
LABELV $476
line 1261
;1261:	else if (rnd < l2 && redobelisk.areanum && blueobelisk.areanum) {
ADDRLP4 4
INDIRF4
ADDRLP4 12
INDIRF4
GEF4 $480
ADDRLP4 196
CNSTI4 0
ASGNI4
ADDRGP4 redobelisk+12
INDIRI4
ADDRLP4 196
INDIRI4
EQI4 $480
ADDRGP4 blueobelisk+12
INDIRI4
ADDRLP4 196
INDIRI4
EQI4 $480
line 1262
;1262:		bs->decisionmaker = bs->client;
ADDRLP4 200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 200
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 200
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1263
;1263:		bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 1265
;1264:		//
;1265:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &redobelisk, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 204
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 1
NEI4 $484
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 redobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $485
JUMPV
LABELV $484
line 1266
;1266:		else memcpy(&bs->teamgoal, &blueobelisk, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 blueobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
LABELV $485
line 1268
;1267:		//set the ltg type
;1268:		bs->ltgtype = LTG_DEFENDKEYAREA;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 3
ASGNI4
line 1270
;1269:		//set the time the bot stops defending the base
;1270:		bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 1271
;1271:		bs->defendaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6144
ADDP4
CNSTF4 0
ASGNF4
line 1272
;1272:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1273
;1273:	}
ADDRGP4 $481
JUMPV
LABELV $480
line 1274
;1274:	else {
line 1275
;1275:		bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 1277
;1276:		//set the time the bot will stop roaming
;1277:		bs->ctfroam_time = FloatTime() + CTF_ROAM_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6164
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 1278
;1278:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1279
;1279:	}
LABELV $481
LABELV $477
line 1280
;1280:}
LABELV $435
endproc BotHarvesterSeekGoals 208 12
export BotHarvesterRetreatGoals
proc BotHarvesterRetreatGoals 8 4
line 1287
;1281:
;1282:/*
;1283:==================
;1284:BotHarvesterRetreatGoals
;1285:==================
;1286:*/
;1287:void BotHarvesterRetreatGoals(bot_state_t *bs) {
line 1289
;1288:	//when carrying cubes in harvester the bot should rush to the base
;1289:	if (BotHarvesterCarryingCubes(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotHarvesterCarryingCubes
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $487
line 1291
;1290:		//if not already rushing to the base
;1291:		if (bs->ltgtype != LTG_RUSHBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
EQI4 $486
line 1292
;1292:			BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 1293
;1293:			bs->ltgtype = LTG_RUSHBASE;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 5
ASGNI4
line 1294
;1294:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 1295
;1295:			bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
CNSTF4 0
ASGNF4
line 1296
;1296:			bs->decisionmaker = bs->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1297
;1297:			bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 1298
;1298:			BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1299
;1299:		}
line 1300
;1300:		return;
LABELV $487
line 1302
;1301:	}
;1302:}
LABELV $486
endproc BotHarvesterRetreatGoals 8 4
export BotTeamGoals
proc BotTeamGoals 0 4
line 1310
;1303:#endif
;1304:
;1305:/*
;1306:==================
;1307:BotTeamGoals
;1308:==================
;1309:*/
;1310:void BotTeamGoals(bot_state_t *bs, int retreat) {
line 1312
;1311:
;1312:	if ( retreat ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $492
line 1313
;1313:		if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $494
line 1314
;1314:			BotCTFRetreatGoals(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFRetreatGoals
CALLV
pop
line 1315
;1315:		}
ADDRGP4 $493
JUMPV
LABELV $494
line 1317
;1316:#ifdef MISSIONPACK
;1317:		else if (gametype == GT_1FCTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 5
NEI4 $496
line 1318
;1318:			Bot1FCTFRetreatGoals(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Bot1FCTFRetreatGoals
CALLV
pop
line 1319
;1319:		}
ADDRGP4 $493
JUMPV
LABELV $496
line 1320
;1320:		else if (gametype == GT_OBELISK) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $498
line 1321
;1321:			BotObeliskRetreatGoals(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotObeliskRetreatGoals
CALLV
pop
line 1322
;1322:		}
ADDRGP4 $493
JUMPV
LABELV $498
line 1323
;1323:		else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $493
line 1324
;1324:			BotHarvesterRetreatGoals(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotHarvesterRetreatGoals
CALLV
pop
line 1325
;1325:		}
line 1327
;1326:#endif
;1327:	}
ADDRGP4 $493
JUMPV
LABELV $492
line 1328
;1328:	else {
line 1329
;1329:		if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $502
line 1331
;1330:			//decide what to do in CTF mode
;1331:			BotCTFSeekGoals(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFSeekGoals
CALLV
pop
line 1332
;1332:		}
ADDRGP4 $503
JUMPV
LABELV $502
line 1334
;1333:#ifdef MISSIONPACK
;1334:		else if (gametype == GT_1FCTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 5
NEI4 $504
line 1335
;1335:			Bot1FCTFSeekGoals(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Bot1FCTFSeekGoals
CALLV
pop
line 1336
;1336:		}
ADDRGP4 $505
JUMPV
LABELV $504
line 1337
;1337:		else if (gametype == GT_OBELISK) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $506
line 1338
;1338:			BotObeliskSeekGoals(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotObeliskSeekGoals
CALLV
pop
line 1339
;1339:		}
ADDRGP4 $507
JUMPV
LABELV $506
line 1340
;1340:		else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $508
line 1341
;1341:			BotHarvesterSeekGoals(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotHarvesterSeekGoals
CALLV
pop
line 1342
;1342:		}
LABELV $508
LABELV $507
LABELV $505
LABELV $503
line 1344
;1343:#endif
;1344:	}
LABELV $493
line 1347
;1345:	// reset the order time which is used to see if
;1346:	// we decided to refuse an order
;1347:	bs->order_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
CNSTF4 0
ASGNF4
line 1348
;1348:}
LABELV $491
endproc BotTeamGoals 0 4
export BotPointAreaNum
proc BotPointAreaNum 68 20
line 1355
;1349:
;1350:/*
;1351:==================
;1352:BotPointAreaNum
;1353:==================
;1354:*/
;1355:int BotPointAreaNum(vec3_t origin) {
line 1359
;1356:	int areanum, numareas, areas[10];
;1357:	vec3_t end;
;1358:
;1359:	areanum = trap_AAS_PointAreaNum(origin);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 trap_AAS_PointAreaNum
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 60
INDIRI4
ASGNI4
line 1360
;1360:	if (areanum) return areanum;
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $511
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $510
JUMPV
LABELV $511
line 1361
;1361:	VectorCopy(origin, end);
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 1362
;1362:	end[2] += 10;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1092616192
ADDF4
ASGNF4
line 1363
;1363:	numareas = trap_AAS_TraceAreas(origin, end, areas, NULL, 10);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 20
ARGP4
CNSTP4 0
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 64
ADDRGP4 trap_AAS_TraceAreas
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 64
INDIRI4
ASGNI4
line 1364
;1364:	if (numareas > 0) return areas[0];
ADDRLP4 16
INDIRI4
CNSTI4 0
LEI4 $514
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $510
JUMPV
LABELV $514
line 1365
;1365:	return 0;
CNSTI4 0
RETI4
LABELV $510
endproc BotPointAreaNum 68 20
export ClientName
proc ClientName 1032 12
line 1373
;1366:}
;1367:
;1368:/*
;1369:==================
;1370:ClientName
;1371:==================
;1372:*/
;1373:char *ClientName(int client, char *name, int size) {
line 1376
;1374:	char buf[MAX_INFO_STRING];
;1375:
;1376:	if (client < 0 || client >= MAX_CLIENTS) {
ADDRLP4 1024
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 0
LTI4 $519
ADDRLP4 1024
INDIRI4
CNSTI4 64
LTI4 $517
LABELV $519
line 1377
;1377:		BotAI_Print(PRT_ERROR, "ClientName: client out of range\n");
CNSTI4 3
ARGI4
ADDRGP4 $520
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 1378
;1378:		return "[client out of range]";
ADDRGP4 $521
RETP4
ADDRGP4 $516
JUMPV
LABELV $517
line 1380
;1379:	}
;1380:	trap_GetConfigstring(CS_PLAYERS+client, buf, sizeof(buf));
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 1381
;1381:	strncpy(name, Info_ValueForKey(buf, "n"), size-1);
ADDRLP4 0
ARGP4
ADDRGP4 $522
ARGP4
ADDRLP4 1028
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 1382
;1382:	name[size-1] = '\0';
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 1383
;1383:	Q_CleanStr( name );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1384
;1384:	return name;
ADDRFP4 4
INDIRP4
RETP4
LABELV $516
endproc ClientName 1032 12
export ClientSkin
proc ClientSkin 1032 12
line 1392
;1385:}
;1386:
;1387:/*
;1388:==================
;1389:ClientSkin
;1390:==================
;1391:*/
;1392:char *ClientSkin(int client, char *skin, int size) {
line 1395
;1393:	char buf[MAX_INFO_STRING];
;1394:
;1395:	if (client < 0 || client >= MAX_CLIENTS) {
ADDRLP4 1024
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 0
LTI4 $526
ADDRLP4 1024
INDIRI4
CNSTI4 64
LTI4 $524
LABELV $526
line 1396
;1396:		BotAI_Print(PRT_ERROR, "ClientSkin: client out of range\n");
CNSTI4 3
ARGI4
ADDRGP4 $527
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 1397
;1397:		return "[client out of range]";
ADDRGP4 $521
RETP4
ADDRGP4 $523
JUMPV
LABELV $524
line 1399
;1398:	}
;1399:	trap_GetConfigstring(CS_PLAYERS+client, buf, sizeof(buf));
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 1400
;1400:	strncpy(skin, Info_ValueForKey(buf, "model"), size-1);
ADDRLP4 0
ARGP4
ADDRGP4 $528
ARGP4
ADDRLP4 1028
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 1401
;1401:	skin[size-1] = '\0';
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 1402
;1402:	return skin;
ADDRFP4 4
INDIRP4
RETP4
LABELV $523
endproc ClientSkin 1032 12
bss
align 4
LABELV $530
skip 4
export ClientFromName
code
proc ClientFromName 1040 12
line 1410
;1403:}
;1404:
;1405:/*
;1406:==================
;1407:ClientFromName
;1408:==================
;1409:*/
;1410:int ClientFromName(char *name) {
line 1415
;1411:	int i;
;1412:	char buf[MAX_INFO_STRING];
;1413:	static int maxclients;
;1414:
;1415:	if (!maxclients)
ADDRGP4 $530
INDIRI4
CNSTI4 0
NEI4 $531
line 1416
;1416:		maxclients = trap_Cvar_VariableIntegerValue("sv_maxclients");
ADDRGP4 $533
ARGP4
ADDRLP4 1028
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 $530
ADDRLP4 1028
INDIRI4
ASGNI4
LABELV $531
line 1417
;1417:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $537
JUMPV
LABELV $534
line 1418
;1418:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
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
line 1419
;1419:		Q_CleanStr( buf );
ADDRLP4 4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1420
;1420:		if (!Q_stricmp(Info_ValueForKey(buf, "n"), name)) return i;
ADDRLP4 4
ARGP4
ADDRGP4 $522
ARGP4
ADDRLP4 1032
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $538
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $529
JUMPV
LABELV $538
line 1421
;1421:	}
LABELV $535
line 1417
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $537
ADDRLP4 0
INDIRI4
ADDRGP4 $530
INDIRI4
GEI4 $540
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $534
LABELV $540
line 1422
;1422:	return -1;
CNSTI4 -1
RETI4
LABELV $529
endproc ClientFromName 1040 12
bss
align 4
LABELV $542
skip 4
export ClientOnSameTeamFromName
code
proc ClientOnSameTeamFromName 1044 12
line 1430
;1423:}
;1424:
;1425:/*
;1426:==================
;1427:ClientOnSameTeamFromName
;1428:==================
;1429:*/
;1430:int ClientOnSameTeamFromName(bot_state_t *bs, char *name) {
line 1435
;1431:	int i;
;1432:	char buf[MAX_INFO_STRING];
;1433:	static int maxclients;
;1434:
;1435:	if (!maxclients)
ADDRGP4 $542
INDIRI4
CNSTI4 0
NEI4 $543
line 1436
;1436:		maxclients = trap_Cvar_VariableIntegerValue("sv_maxclients");
ADDRGP4 $533
ARGP4
ADDRLP4 1028
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 $542
ADDRLP4 1028
INDIRI4
ASGNI4
LABELV $543
line 1437
;1437:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $548
JUMPV
LABELV $545
line 1438
;1438:		if (!BotSameTeam(bs, i))
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
NEI4 $549
line 1439
;1439:			continue;
ADDRGP4 $546
JUMPV
LABELV $549
line 1440
;1440:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
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
line 1441
;1441:		Q_CleanStr( buf );
ADDRLP4 4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1442
;1442:		if (!Q_stricmp(Info_ValueForKey(buf, "n"), name)) return i;
ADDRLP4 4
ARGP4
ADDRGP4 $522
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $551
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $541
JUMPV
LABELV $551
line 1443
;1443:	}
LABELV $546
line 1437
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $548
ADDRLP4 0
INDIRI4
ADDRGP4 $542
INDIRI4
GEI4 $553
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $545
LABELV $553
line 1444
;1444:	return -1;
CNSTI4 -1
RETI4
LABELV $541
endproc ClientOnSameTeamFromName 1044 12
export stristr
proc stristr 12 4
line 1452
;1445:}
;1446:
;1447:/*
;1448:==================
;1449:stristr
;1450:==================
;1451:*/
;1452:char *stristr(char *str, char *charset) {
ADDRGP4 $556
JUMPV
LABELV $555
line 1455
;1453:	int i;
;1454:
;1455:	while(*str) {
line 1456
;1456:		for (i = 0; charset[i] && str[i]; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $561
JUMPV
LABELV $558
line 1457
;1457:			if (toupper(charset[i]) != toupper(str[i])) break;
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 4
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $562
ADDRGP4 $560
JUMPV
LABELV $562
line 1458
;1458:		}
LABELV $559
line 1456
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $561
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDRLP4 8
INDIRI4
EQI4 $564
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDRLP4 8
INDIRI4
NEI4 $558
LABELV $564
LABELV $560
line 1459
;1459:		if (!charset[i]) return str;
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $565
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $554
JUMPV
LABELV $565
line 1460
;1460:		str++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1461
;1461:	}
LABELV $556
line 1455
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $555
line 1462
;1462:	return NULL;
CNSTP4 0
RETP4
LABELV $554
endproc stristr 12 4
export EasyClientName
proc EasyClientName 204 12
line 1470
;1463:}
;1464:
;1465:/*
;1466:==================
;1467:EasyClientName
;1468:==================
;1469:*/
;1470:char *EasyClientName(int client, char *buf, int size) {
line 1475
;1471:	int i;
;1472:	char *str1, *str2, *ptr, c;
;1473:	char name[128];
;1474:
;1475:	strcpy(name, ClientName(client, name, sizeof(name)));
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 5
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 148
ADDRGP4 ClientName
CALLP4
ASGNP4
ADDRLP4 5
ARGP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1476
;1476:	for (i = 0; name[i]; i++) name[i] &= 127;
ADDRLP4 136
CNSTI4 0
ASGNI4
ADDRGP4 $571
JUMPV
LABELV $568
ADDRLP4 152
ADDRLP4 136
INDIRI4
ADDRLP4 5
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
BANDI4
CVII1 4
ASGNI1
LABELV $569
ADDRLP4 136
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $571
ADDRLP4 136
INDIRI4
ADDRLP4 5
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $568
line 1478
;1477:	//remove all spaces
;1478:	for (ptr = strstr(name, " "); ptr; ptr = strstr(name, " ")) {
ADDRLP4 5
ARGP4
ADDRGP4 $576
ARGP4
ADDRLP4 156
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 156
INDIRP4
ASGNP4
ADDRGP4 $575
JUMPV
LABELV $572
line 1479
;1479:		memmove(ptr, ptr+1, strlen(ptr+1)+1);
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 160
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 168
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 168
INDIRI4
ADDP4
ARGP4
ADDRLP4 160
INDIRI4
ADDRLP4 168
INDIRI4
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 1480
;1480:	}
LABELV $573
line 1478
ADDRLP4 5
ARGP4
ADDRGP4 $576
ARGP4
ADDRLP4 160
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 160
INDIRP4
ASGNP4
LABELV $575
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $572
line 1482
;1481:	//check for [x] and ]x[ clan names
;1482:	str1 = strstr(name, "[");
ADDRLP4 5
ARGP4
ADDRGP4 $577
ARGP4
ADDRLP4 164
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 140
ADDRLP4 164
INDIRP4
ASGNP4
line 1483
;1483:	str2 = strstr(name, "]");
ADDRLP4 5
ARGP4
ADDRGP4 $578
ARGP4
ADDRLP4 168
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 144
ADDRLP4 168
INDIRP4
ASGNP4
line 1484
;1484:	if (str1 && str2) {
ADDRLP4 172
CNSTU4 0
ASGNU4
ADDRLP4 140
INDIRP4
CVPU4 4
ADDRLP4 172
INDIRU4
EQU4 $579
ADDRLP4 144
INDIRP4
CVPU4 4
ADDRLP4 172
INDIRU4
EQU4 $579
line 1485
;1485:		if (str2 > str1) memmove(str1, str2+1, strlen(str2+1)+1);
ADDRLP4 144
INDIRP4
CVPU4 4
ADDRLP4 140
INDIRP4
CVPU4 4
LEU4 $581
ADDRLP4 144
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 176
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 140
INDIRP4
ARGP4
ADDRLP4 180
CNSTI4 1
ASGNI4
ADDRLP4 144
INDIRP4
ADDRLP4 180
INDIRI4
ADDP4
ARGP4
ADDRLP4 176
INDIRI4
ADDRLP4 180
INDIRI4
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
ADDRGP4 $582
JUMPV
LABELV $581
line 1486
;1486:		else memmove(str2, str1+1, strlen(str1+1)+1);
ADDRLP4 140
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 184
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 144
INDIRP4
ARGP4
ADDRLP4 188
CNSTI4 1
ASGNI4
ADDRLP4 140
INDIRP4
ADDRLP4 188
INDIRI4
ADDP4
ARGP4
ADDRLP4 184
INDIRI4
ADDRLP4 188
INDIRI4
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
LABELV $582
line 1487
;1487:	}
LABELV $579
line 1489
;1488:	//remove Mr prefix
;1489:	if ((name[0] == 'm' || name[0] == 'M') &&
ADDRLP4 176
ADDRLP4 5
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 109
EQI4 $587
ADDRLP4 176
INDIRI4
CNSTI4 77
NEI4 $583
LABELV $587
ADDRLP4 5+1
INDIRI1
CVII4 1
CNSTI4 114
EQI4 $588
ADDRLP4 5+1
INDIRI1
CVII4 1
CNSTI4 82
NEI4 $583
LABELV $588
line 1490
;1490:			(name[1] == 'r' || name[1] == 'R')) {
line 1491
;1491:		memmove(name, name+2, strlen(name+2)+1);
ADDRLP4 5+2
ARGP4
ADDRLP4 180
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 5
ARGP4
ADDRLP4 5+2
ARGP4
ADDRLP4 180
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 1492
;1492:	}
LABELV $583
line 1494
;1493:	//only allow lower case alphabet characters
;1494:	ptr = name;
ADDRLP4 0
ADDRLP4 5
ASGNP4
ADDRGP4 $592
JUMPV
LABELV $591
line 1495
;1495:	while(*ptr) {
line 1496
;1496:		c = *ptr;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
line 1497
;1497:		if ((c >= 'a' && c <= 'z') ||
ADDRLP4 180
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 97
LTI4 $597
ADDRLP4 180
INDIRI4
CNSTI4 122
LEI4 $598
LABELV $597
ADDRLP4 184
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 48
LTI4 $599
ADDRLP4 184
INDIRI4
CNSTI4 57
LEI4 $598
LABELV $599
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 95
NEI4 $594
LABELV $598
line 1498
;1498:				(c >= '0' && c <= '9') || c == '_') {
line 1499
;1499:			ptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1500
;1500:		}
ADDRGP4 $595
JUMPV
LABELV $594
line 1501
;1501:		else if (c >= 'A' && c <= 'Z') {
ADDRLP4 188
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 65
LTI4 $600
ADDRLP4 188
INDIRI4
CNSTI4 90
GTI4 $600
line 1502
;1502:			*ptr += 'a' - 'A';
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
ADDI4
CVII1 4
ASGNI1
line 1503
;1503:			ptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1504
;1504:		}
ADDRGP4 $601
JUMPV
LABELV $600
line 1505
;1505:		else {
line 1506
;1506:			memmove(ptr, ptr+1, strlen(ptr + 1)+1);
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 192
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 200
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 200
INDIRI4
ADDP4
ARGP4
ADDRLP4 192
INDIRI4
ADDRLP4 200
INDIRI4
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 1507
;1507:		}
LABELV $601
LABELV $595
line 1508
;1508:	}
LABELV $592
line 1495
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $591
line 1509
;1509:	strncpy(buf, name, size-1);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 5
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 1510
;1510:	buf[size-1] = '\0';
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 1511
;1511:	return buf;
ADDRFP4 4
INDIRP4
RETP4
LABELV $567
endproc EasyClientName 204 12
export BotSynonymContext
proc BotSynonymContext 12 4
line 1519
;1512:}
;1513:
;1514:/*
;1515:==================
;1516:BotSynonymContext
;1517:==================
;1518:*/
;1519:int BotSynonymContext(bot_state_t *bs) {
line 1522
;1520:	int context;
;1521:
;1522:	context = CONTEXT_NORMAL|CONTEXT_NEARBYITEM|CONTEXT_NAMES;
ADDRLP4 0
CNSTI4 1027
ASGNI4
line 1524
;1523:	//
;1524:	if (gametype == GT_CTF
ADDRLP4 4
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 4
EQI4 $605
ADDRLP4 4
INDIRI4
CNSTI4 5
NEI4 $603
LABELV $605
line 1528
;1525:#ifdef MISSIONPACK
;1526:		|| gametype == GT_1FCTF
;1527:#endif
;1528:		) {
line 1529
;1529:		if (BotTeam(bs) == TEAM_RED) context |= CONTEXT_CTFREDTEAM;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $606
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 4
BORI4
ASGNI4
ADDRGP4 $604
JUMPV
LABELV $606
line 1530
;1530:		else context |= CONTEXT_CTFBLUETEAM;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1531
;1531:	}
ADDRGP4 $604
JUMPV
LABELV $603
line 1533
;1532:#ifdef MISSIONPACK
;1533:	else if (gametype == GT_OBELISK) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $608
line 1534
;1534:		if (BotTeam(bs) == TEAM_RED) context |= CONTEXT_OBELISKREDTEAM;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $610
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 32
BORI4
ASGNI4
ADDRGP4 $609
JUMPV
LABELV $610
line 1535
;1535:		else context |= CONTEXT_OBELISKBLUETEAM;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 1536
;1536:	}
ADDRGP4 $609
JUMPV
LABELV $608
line 1537
;1537:	else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $612
line 1538
;1538:		if (BotTeam(bs) == TEAM_RED) context |= CONTEXT_HARVESTERREDTEAM;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $614
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 128
BORI4
ASGNI4
ADDRGP4 $615
JUMPV
LABELV $614
line 1539
;1539:		else context |= CONTEXT_HARVESTERBLUETEAM;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 256
BORI4
ASGNI4
LABELV $615
line 1540
;1540:	}
LABELV $612
LABELV $609
LABELV $604
line 1542
;1541:#endif
;1542:	return context;
ADDRLP4 0
INDIRI4
RETI4
LABELV $602
endproc BotSynonymContext 12 4
export BotChooseWeapon
proc BotChooseWeapon 20 8
line 1550
;1543:}
;1544:
;1545:/*
;1546:==================
;1547:BotChooseWeapon
;1548:==================
;1549:*/
;1550:void BotChooseWeapon(bot_state_t *bs) {
line 1554
;1551:	int newweaponnum;
;1552:
;1553:	
;1554:		if (bs->cur_ps.weaponstate == WEAPON_RAISING ||
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $619
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $617
LABELV $619
line 1555
;1555:				bs->cur_ps.weaponstate == WEAPON_DROPPING) {
line 1556
;1556:			trap_EA_SelectWeapon(bs->client, bs->weaponnum);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_SelectWeapon
CALLV
pop
line 1557
;1557:		}
ADDRGP4 $618
JUMPV
LABELV $617
line 1558
;1558:		else {
line 1559
;1559:			newweaponnum = trap_BotChooseBestFightWeapon(bs->ws, bs->inventory);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 4952
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 trap_BotChooseBestFightWeapon
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 1560
;1560:			if (bs->weaponnum != newweaponnum) bs->weaponchange_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $620
ADDRFP4 0
INDIRP4
CNSTI4 6192
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
LABELV $620
line 1561
;1561:			bs->weaponnum = newweaponnum;
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1563
;1562:			//BotAI_Print(PRT_MESSAGE, "bs->weaponnum = %d\n", bs->weaponnum);
;1563:			trap_EA_SelectWeapon(bs->client, bs->weaponnum);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_SelectWeapon
CALLV
pop
line 1564
;1564:		}
LABELV $618
line 1566
;1565:
;1566:}
LABELV $616
endproc BotChooseWeapon 20 8
export BotSetupForMovement
proc BotSetupForMovement 88 12
line 1573
;1567:
;1568:/*
;1569:==================
;1570:BotSetupForMovement
;1571:==================
;1572:*/
;1573:void BotSetupForMovement(bot_state_t *bs) {
line 1576
;1574:	bot_initmove_t initmove;
;1575:
;1576:	memset(&initmove, 0, sizeof(bot_initmove_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 68
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1577
;1577:	VectorCopy(bs->cur_ps.origin, initmove.origin);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1578
;1578:	VectorCopy(bs->cur_ps.velocity, initmove.velocity);
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRB
ASGNB 12
line 1579
;1579:	VectorClear(initmove.viewoffset);
ADDRLP4 68
CNSTF4 0
ASGNF4
ADDRLP4 0+24+8
ADDRLP4 68
INDIRF4
ASGNF4
ADDRLP4 0+24+4
ADDRLP4 68
INDIRF4
ASGNF4
ADDRLP4 0+24
ADDRLP4 68
INDIRF4
ASGNF4
line 1580
;1580:	initmove.viewoffset[2] += bs->cur_ps.viewheight;
ADDRLP4 0+24+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1581
;1581:	initmove.entitynum = bs->entitynum;
ADDRLP4 0+36
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1582
;1582:	initmove.client = bs->client;
ADDRLP4 0+40
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1583
;1583:	initmove.thinktime = bs->thinktime;
ADDRLP4 0+44
ADDRFP4 0
INDIRP4
CNSTI4 4904
ADDP4
INDIRF4
ASGNF4
line 1585
;1584:	//set the onground flag
;1585:	if (bs->cur_ps.groundEntityNum != ENTITYNUM_NONE) initmove.or_moveflags |= MFL_ONGROUND;
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $634
ADDRLP4 0+64
ADDRLP4 0+64
INDIRI4
CNSTI4 2
BORI4
ASGNI4
LABELV $634
line 1587
;1586:	//set the teleported flag
;1587:	if ((bs->cur_ps.pm_flags & PMF_TIME_KNOCKBACK) && (bs->cur_ps.pm_time > 0)) {
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 64
BANDI4
ADDRLP4 76
INDIRI4
EQI4 $637
ADDRLP4 72
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 76
INDIRI4
LEI4 $637
line 1588
;1588:		initmove.or_moveflags |= MFL_TELEPORTED;
ADDRLP4 0+64
ADDRLP4 0+64
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 1589
;1589:	}
LABELV $637
line 1591
;1590:	//set the waterjump flag
;1591:	if ((bs->cur_ps.pm_flags & PMF_TIME_WATERJUMP) && (bs->cur_ps.pm_time > 0)) {
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRLP4 80
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 256
BANDI4
ADDRLP4 84
INDIRI4
EQI4 $640
ADDRLP4 80
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 84
INDIRI4
LEI4 $640
line 1592
;1592:		initmove.or_moveflags |= MFL_WATERJUMP;
ADDRLP4 0+64
ADDRLP4 0+64
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 1593
;1593:	}
LABELV $640
line 1595
;1594:	//set presence type
;1595:	if (bs->cur_ps.pm_flags & PMF_DUCKED) initmove.presencetype = PRESENCE_CROUCH;
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $643
ADDRLP4 0+48
CNSTI4 4
ASGNI4
ADDRGP4 $644
JUMPV
LABELV $643
line 1596
;1596:	else initmove.presencetype = PRESENCE_NORMAL;
ADDRLP4 0+48
CNSTI4 2
ASGNI4
LABELV $644
line 1598
;1597:	//
;1598:	if (bs->walker > 0.5) initmove.or_moveflags |= MFL_WALK;
ADDRFP4 0
INDIRP4
CNSTI4 6056
ADDP4
INDIRF4
CNSTF4 1056964608
LEF4 $647
ADDRLP4 0+64
ADDRLP4 0+64
INDIRI4
CNSTI4 512
BORI4
ASGNI4
LABELV $647
line 1600
;1599:	//
;1600:	VectorCopy(bs->viewangles, initmove.viewangles);
ADDRLP4 0+52
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
INDIRB
ASGNB 12
line 1602
;1601:	//
;1602:	trap_BotInitMoveState(bs->ms, &initmove);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotInitMoveState
CALLV
pop
line 1603
;1603:}
LABELV $622
endproc BotSetupForMovement 88 12
export BotCheckItemPickup
proc BotCheckItemPickup 36 12
line 1610
;1604:
;1605:/*
;1606:==================
;1607:BotCheckItemPickup
;1608:==================
;1609:*/
;1610:void BotCheckItemPickup(bot_state_t *bs, int *oldinventory) {
line 1614
;1611:#ifdef MISSIONPACK
;1612:	int offence, leader;
;1613:
;1614:	if (gametype <= GT_TEAM)
ADDRGP4 gametype
INDIRI4
CNSTI4 3
GTI4 $652
line 1615
;1615:		return;
ADDRGP4 $651
JUMPV
LABELV $652
line 1617
;1616:
;1617:	offence = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 1619
;1618:	// go into offence if picked up the kamikaze or invulnerability
;1619:	if (!oldinventory[INVENTORY_KAMIKAZE] && bs->inventory[INVENTORY_KAMIKAZE] >= 1) {
ADDRFP4 4
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
CNSTI4 0
NEI4 $654
ADDRFP4 0
INDIRP4
CNSTI4 5080
ADDP4
INDIRI4
CNSTI4 1
LTI4 $654
line 1620
;1620:		offence = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1621
;1621:	}
LABELV $654
line 1622
;1622:	if (!oldinventory[INVENTORY_INVULNERABILITY] && bs->inventory[INVENTORY_INVULNERABILITY] >= 1) {
ADDRFP4 4
INDIRP4
CNSTI4 136
ADDP4
INDIRI4
CNSTI4 0
NEI4 $656
ADDRFP4 0
INDIRP4
CNSTI4 5088
ADDP4
INDIRI4
CNSTI4 1
LTI4 $656
line 1623
;1623:		offence = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1624
;1624:	}
LABELV $656
line 1626
;1625:	// if not already wearing the kamikaze or invulnerability
;1626:	if (!bs->inventory[INVENTORY_KAMIKAZE] && !bs->inventory[INVENTORY_INVULNERABILITY]) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 5080
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $658
ADDRLP4 8
INDIRP4
CNSTI4 5088
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $658
line 1627
;1627:		if (!oldinventory[INVENTORY_SCOUT] && bs->inventory[INVENTORY_SCOUT] >= 1) {
ADDRFP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 0
NEI4 $660
ADDRFP4 0
INDIRP4
CNSTI4 5116
ADDP4
INDIRI4
CNSTI4 1
LTI4 $660
line 1628
;1628:			offence = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1629
;1629:		}
LABELV $660
line 1630
;1630:		if (!oldinventory[INVENTORY_GUARD] && bs->inventory[INVENTORY_GUARD] >= 1) {
ADDRFP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 0
NEI4 $662
ADDRFP4 0
INDIRP4
CNSTI4 5120
ADDP4
INDIRI4
CNSTI4 1
LTI4 $662
line 1631
;1631:			offence = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1632
;1632:		}
LABELV $662
line 1633
;1633:		if (!oldinventory[INVENTORY_DOUBLER] && bs->inventory[INVENTORY_DOUBLER] >= 1) {
ADDRFP4 4
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 0
NEI4 $664
ADDRFP4 0
INDIRP4
CNSTI4 5124
ADDP4
INDIRI4
CNSTI4 1
LTI4 $664
line 1634
;1634:			offence = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1635
;1635:		}
LABELV $664
line 1636
;1636:		if (!oldinventory[INVENTORY_AMMOREGEN] && bs->inventory[INVENTORY_AMMOREGEN] >= 1) {
ADDRFP4 4
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 0
NEI4 $666
ADDRFP4 0
INDIRP4
CNSTI4 5128
ADDP4
INDIRI4
CNSTI4 1
LTI4 $666
line 1637
;1637:			offence = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1638
;1638:		}
LABELV $666
line 1639
;1639:	}
LABELV $658
line 1641
;1640:
;1641:	if (offence >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $668
line 1642
;1642:		leader = ClientFromName(bs->teamleader);
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 1643
;1643:		if (offence) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $670
line 1644
;1644:			if (!(bs->teamtaskpreference & TEAMTP_ATTACKER)) {
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $672
line 1646
;1645:				// if we have a bot team leader
;1646:				if (BotTeamLeader(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 BotTeamLeader
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $674
line 1648
;1647:					// tell the leader we want to be on offence
;1648:					BotVoiceChat(bs, leader, VOICECHAT_WANTONOFFENSE);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 $676
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 1651
;1649:					//BotAI_BotInitialChat(bs, "wantoffence", NULL);
;1650:					//trap_BotEnterChat(bs->cs, leader, CHAT_TELL);
;1651:				}
ADDRGP4 $675
JUMPV
LABELV $674
line 1652
;1652:				else if (g_spSkill.integer <= 3) {
ADDRGP4 g_spSkill+12
INDIRI4
CNSTI4 3
GTI4 $677
line 1653
;1653:					if ( bs->ltgtype != LTG_GETFLAG &&
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 4
EQI4 $680
ADDRLP4 24
INDIRI4
CNSTI4 13
EQI4 $680
ADDRLP4 24
INDIRI4
CNSTI4 12
EQI4 $680
line 1655
;1654:						 bs->ltgtype != LTG_ATTACKENEMYBASE &&
;1655:						 bs->ltgtype != LTG_HARVEST ) {
line 1657
;1656:						//
;1657:						if ((gametype != GT_CTF || (bs->redflagstatus == 0 && bs->blueflagstatus == 0)) &&
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $684
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $682
ADDRLP4 28
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $682
LABELV $684
ADDRGP4 gametype
INDIRI4
CNSTI4 5
NEI4 $685
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
INDIRI4
CNSTI4 0
NEI4 $682
LABELV $685
line 1658
;1658:							(gametype != GT_1FCTF || bs->neutralflagstatus == 0) ) {
line 1660
;1659:							// tell the leader we want to be on offence
;1660:							BotVoiceChat(bs, leader, VOICECHAT_WANTONOFFENSE);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 $676
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 1663
;1661:							//BotAI_BotInitialChat(bs, "wantoffence", NULL);
;1662:							//trap_BotEnterChat(bs->cs, leader, CHAT_TELL);
;1663:						}
LABELV $682
line 1664
;1664:					}
LABELV $680
line 1665
;1665:					bs->teamtaskpreference |= TEAMTP_ATTACKER;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1666
;1666:				}
LABELV $677
LABELV $675
line 1667
;1667:			}
LABELV $672
line 1668
;1668:			bs->teamtaskpreference &= ~TEAMTP_DEFENDER;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 1669
;1669:		}
ADDRGP4 $671
JUMPV
LABELV $670
line 1670
;1670:		else {
line 1671
;1671:			if (!(bs->teamtaskpreference & TEAMTP_DEFENDER)) {
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $686
line 1673
;1672:				// if we have a bot team leader
;1673:				if (BotTeamLeader(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 BotTeamLeader
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $688
line 1675
;1674:					// tell the leader we want to be on defense
;1675:					BotVoiceChat(bs, -1, VOICECHAT_WANTONDEFENSE);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 $690
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 1678
;1676:					//BotAI_BotInitialChat(bs, "wantdefence", NULL);
;1677:					//trap_BotEnterChat(bs->cs, leader, CHAT_TELL);
;1678:				}
ADDRGP4 $689
JUMPV
LABELV $688
line 1679
;1679:				else if (g_spSkill.integer <= 3) {
ADDRGP4 g_spSkill+12
INDIRI4
CNSTI4 3
GTI4 $691
line 1680
;1680:					if ( bs->ltgtype != LTG_DEFENDKEYAREA ) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 3
EQI4 $694
line 1682
;1681:						//
;1682:						if ((gametype != GT_CTF || (bs->redflagstatus == 0 && bs->blueflagstatus == 0)) &&
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $698
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $696
ADDRLP4 24
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $696
LABELV $698
ADDRGP4 gametype
INDIRI4
CNSTI4 5
NEI4 $699
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
INDIRI4
CNSTI4 0
NEI4 $696
LABELV $699
line 1683
;1683:							(gametype != GT_1FCTF || bs->neutralflagstatus == 0) ) {
line 1685
;1684:							// tell the leader we want to be on defense
;1685:							BotVoiceChat(bs, -1, VOICECHAT_WANTONDEFENSE);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 $690
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 1688
;1686:							//BotAI_BotInitialChat(bs, "wantdefence", NULL);
;1687:							//trap_BotEnterChat(bs->cs, leader, CHAT_TELL);
;1688:						}
LABELV $696
line 1689
;1689:					}
LABELV $694
line 1690
;1690:				}
LABELV $691
LABELV $689
line 1691
;1691:				bs->teamtaskpreference |= TEAMTP_DEFENDER;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1692
;1692:			}
LABELV $686
line 1693
;1693:			bs->teamtaskpreference &= ~TEAMTP_ATTACKER;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 1694
;1694:		}
LABELV $671
line 1695
;1695:	}
LABELV $668
line 1697
;1696:#endif
;1697:}
LABELV $651
endproc BotCheckItemPickup 36 12
export BotUpdateInventory
proc BotUpdateInventory 1332 12
line 1704
;1698:
;1699:/*
;1700:==================
;1701:BotUpdateInventory
;1702:==================
;1703:*/
;1704:void BotUpdateInventory(bot_state_t *bs) {
line 1707
;1705:	int oldinventory[MAX_ITEMS];
;1706:
;1707:	memcpy(oldinventory, bs->inventory, sizeof(oldinventory));
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4952
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1709
;1708:	//armor
;1709:	bs->inventory[INVENTORY_ARMOR] = bs->cur_ps.stats[STAT_ARMOR];
ADDRLP4 1024
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1024
INDIRP4
CNSTI4 4956
ADDP4
ADDRLP4 1024
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
line 1711
;1710:	//weapons
;1711:	bs->inventory[INVENTORY_GAUNTLET] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_GAUNTLET)) != 0;
ADDRLP4 1032
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1032
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $702
ADDRLP4 1028
CNSTI4 1
ASGNI4
ADDRGP4 $703
JUMPV
LABELV $702
ADDRLP4 1028
CNSTI4 0
ASGNI4
LABELV $703
ADDRLP4 1032
INDIRP4
CNSTI4 4968
ADDP4
ADDRLP4 1028
INDIRI4
ASGNI4
line 1712
;1712:	bs->inventory[INVENTORY_SHOTGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_SHOTGUN)) != 0;
ADDRLP4 1040
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1040
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $705
ADDRLP4 1036
CNSTI4 1
ASGNI4
ADDRGP4 $706
JUMPV
LABELV $705
ADDRLP4 1036
CNSTI4 0
ASGNI4
LABELV $706
ADDRLP4 1040
INDIRP4
CNSTI4 4972
ADDP4
ADDRLP4 1036
INDIRI4
ASGNI4
line 1713
;1713:	bs->inventory[INVENTORY_MACHINEGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_MACHINEGUN)) != 0;
ADDRLP4 1048
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1048
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $708
ADDRLP4 1044
CNSTI4 1
ASGNI4
ADDRGP4 $709
JUMPV
LABELV $708
ADDRLP4 1044
CNSTI4 0
ASGNI4
LABELV $709
ADDRLP4 1048
INDIRP4
CNSTI4 4976
ADDP4
ADDRLP4 1044
INDIRI4
ASGNI4
line 1714
;1714:	bs->inventory[INVENTORY_GRENADELAUNCHER] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_GRENADE_LAUNCHER)) != 0;
ADDRLP4 1056
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1056
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $711
ADDRLP4 1052
CNSTI4 1
ASGNI4
ADDRGP4 $712
JUMPV
LABELV $711
ADDRLP4 1052
CNSTI4 0
ASGNI4
LABELV $712
ADDRLP4 1056
INDIRP4
CNSTI4 4980
ADDP4
ADDRLP4 1052
INDIRI4
ASGNI4
line 1715
;1715:	bs->inventory[INVENTORY_ROCKETLAUNCHER] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_ROCKET_LAUNCHER)) != 0;
ADDRLP4 1064
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1064
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $714
ADDRLP4 1060
CNSTI4 1
ASGNI4
ADDRGP4 $715
JUMPV
LABELV $714
ADDRLP4 1060
CNSTI4 0
ASGNI4
LABELV $715
ADDRLP4 1064
INDIRP4
CNSTI4 4984
ADDP4
ADDRLP4 1060
INDIRI4
ASGNI4
line 1716
;1716:	bs->inventory[INVENTORY_LIGHTNING] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_LIGHTNING)) != 0;
ADDRLP4 1072
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1072
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $717
ADDRLP4 1068
CNSTI4 1
ASGNI4
ADDRGP4 $718
JUMPV
LABELV $717
ADDRLP4 1068
CNSTI4 0
ASGNI4
LABELV $718
ADDRLP4 1072
INDIRP4
CNSTI4 4988
ADDP4
ADDRLP4 1068
INDIRI4
ASGNI4
line 1717
;1717:	bs->inventory[INVENTORY_RAILGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_RAILGUN)) != 0;
ADDRLP4 1080
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1080
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $720
ADDRLP4 1076
CNSTI4 1
ASGNI4
ADDRGP4 $721
JUMPV
LABELV $720
ADDRLP4 1076
CNSTI4 0
ASGNI4
LABELV $721
ADDRLP4 1080
INDIRP4
CNSTI4 4992
ADDP4
ADDRLP4 1076
INDIRI4
ASGNI4
line 1718
;1718:	bs->inventory[INVENTORY_PLASMAGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_PLASMAGUN)) != 0;
ADDRLP4 1088
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1088
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $723
ADDRLP4 1084
CNSTI4 1
ASGNI4
ADDRGP4 $724
JUMPV
LABELV $723
ADDRLP4 1084
CNSTI4 0
ASGNI4
LABELV $724
ADDRLP4 1088
INDIRP4
CNSTI4 4996
ADDP4
ADDRLP4 1084
INDIRI4
ASGNI4
line 1719
;1719:	bs->inventory[INVENTORY_BFG10K] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_BFG)) != 0;
ADDRLP4 1096
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1096
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $726
ADDRLP4 1092
CNSTI4 1
ASGNI4
ADDRGP4 $727
JUMPV
LABELV $726
ADDRLP4 1092
CNSTI4 0
ASGNI4
LABELV $727
ADDRLP4 1096
INDIRP4
CNSTI4 5004
ADDP4
ADDRLP4 1092
INDIRI4
ASGNI4
line 1720
;1720:	bs->inventory[INVENTORY_GRAPPLINGHOOK] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_GRAPPLING_HOOK)) != 0;
ADDRLP4 1104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1104
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $729
ADDRLP4 1100
CNSTI4 1
ASGNI4
ADDRGP4 $730
JUMPV
LABELV $729
ADDRLP4 1100
CNSTI4 0
ASGNI4
LABELV $730
ADDRLP4 1104
INDIRP4
CNSTI4 5008
ADDP4
ADDRLP4 1100
INDIRI4
ASGNI4
line 1722
;1721:#ifdef MISSIONPACK
;1722:	bs->inventory[INVENTORY_NAILGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_NAILGUN)) != 0;;
ADDRLP4 1112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1112
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $732
ADDRLP4 1108
CNSTI4 1
ASGNI4
ADDRGP4 $733
JUMPV
LABELV $732
ADDRLP4 1108
CNSTI4 0
ASGNI4
LABELV $733
ADDRLP4 1112
INDIRP4
CNSTI4 5012
ADDP4
ADDRLP4 1108
INDIRI4
ASGNI4
line 1723
;1723:	bs->inventory[INVENTORY_PROXLAUNCHER] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_PROX_LAUNCHER)) != 0;;
ADDRLP4 1120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1120
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $735
ADDRLP4 1116
CNSTI4 1
ASGNI4
ADDRGP4 $736
JUMPV
LABELV $735
ADDRLP4 1116
CNSTI4 0
ASGNI4
LABELV $736
ADDRLP4 1120
INDIRP4
CNSTI4 5016
ADDP4
ADDRLP4 1116
INDIRI4
ASGNI4
line 1724
;1724:	bs->inventory[INVENTORY_CHAINGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_CHAINGUN)) != 0;;
ADDRLP4 1128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $738
ADDRLP4 1124
CNSTI4 1
ASGNI4
ADDRGP4 $739
JUMPV
LABELV $738
ADDRLP4 1124
CNSTI4 0
ASGNI4
LABELV $739
ADDRLP4 1128
INDIRP4
CNSTI4 5020
ADDP4
ADDRLP4 1124
INDIRI4
ASGNI4
line 1727
;1725:#endif
;1726:	//ammo
;1727:	bs->inventory[INVENTORY_SHELLS] = bs->cur_ps.ammo[WP_SHOTGUN];
ADDRLP4 1132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1132
INDIRP4
CNSTI4 5024
ADDP4
ADDRLP4 1132
INDIRP4
CNSTI4 404
ADDP4
INDIRI4
ASGNI4
line 1728
;1728:	bs->inventory[INVENTORY_BULLETS] = bs->cur_ps.ammo[WP_MACHINEGUN];
ADDRLP4 1136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1136
INDIRP4
CNSTI4 5028
ADDP4
ADDRLP4 1136
INDIRP4
CNSTI4 400
ADDP4
INDIRI4
ASGNI4
line 1729
;1729:	bs->inventory[INVENTORY_GRENADES] = bs->cur_ps.ammo[WP_GRENADE_LAUNCHER];
ADDRLP4 1140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140
INDIRP4
CNSTI4 5032
ADDP4
ADDRLP4 1140
INDIRP4
CNSTI4 408
ADDP4
INDIRI4
ASGNI4
line 1730
;1730:	bs->inventory[INVENTORY_CELLS] = bs->cur_ps.ammo[WP_PLASMAGUN];
ADDRLP4 1144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1144
INDIRP4
CNSTI4 5036
ADDP4
ADDRLP4 1144
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
ASGNI4
line 1731
;1731:	bs->inventory[INVENTORY_LIGHTNINGAMMO] = bs->cur_ps.ammo[WP_LIGHTNING];
ADDRLP4 1148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1148
INDIRP4
CNSTI4 5040
ADDP4
ADDRLP4 1148
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
ASGNI4
line 1732
;1732:	bs->inventory[INVENTORY_ROCKETS] = bs->cur_ps.ammo[WP_ROCKET_LAUNCHER];
ADDRLP4 1152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1152
INDIRP4
CNSTI4 5044
ADDP4
ADDRLP4 1152
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ASGNI4
line 1733
;1733:	bs->inventory[INVENTORY_SLUGS] = bs->cur_ps.ammo[WP_RAILGUN];
ADDRLP4 1156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1156
INDIRP4
CNSTI4 5048
ADDP4
ADDRLP4 1156
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ASGNI4
line 1734
;1734:	bs->inventory[INVENTORY_BFGAMMO] = bs->cur_ps.ammo[WP_BFG];
ADDRLP4 1160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1160
INDIRP4
CNSTI4 5052
ADDP4
ADDRLP4 1160
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
ASGNI4
line 1736
;1735:#ifdef MISSIONPACK
;1736:	bs->inventory[INVENTORY_NAILS] = bs->cur_ps.ammo[WP_NAILGUN];
ADDRLP4 1164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1164
INDIRP4
CNSTI4 5056
ADDP4
ADDRLP4 1164
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
ASGNI4
line 1737
;1737:	bs->inventory[INVENTORY_MINES] = bs->cur_ps.ammo[WP_PROX_LAUNCHER];
ADDRLP4 1168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1168
INDIRP4
CNSTI4 5060
ADDP4
ADDRLP4 1168
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
ASGNI4
line 1738
;1738:	bs->inventory[INVENTORY_BELT] = bs->cur_ps.ammo[WP_CHAINGUN];
ADDRLP4 1172
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1172
INDIRP4
CNSTI4 5064
ADDP4
ADDRLP4 1172
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
ASGNI4
line 1741
;1739:#endif
;1740:	//powerups
;1741:	bs->inventory[INVENTORY_HEALTH] = bs->cur_ps.stats[STAT_HEALTH];
ADDRLP4 1176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1176
INDIRP4
CNSTI4 5068
ADDP4
ADDRLP4 1176
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ASGNI4
line 1742
;1742:	bs->inventory[INVENTORY_TELEPORTER] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_TELEPORTER;
ADDRLP4 1184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1184
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 26
NEI4 $741
ADDRLP4 1180
CNSTI4 1
ASGNI4
ADDRGP4 $742
JUMPV
LABELV $741
ADDRLP4 1180
CNSTI4 0
ASGNI4
LABELV $742
ADDRLP4 1184
INDIRP4
CNSTI4 5072
ADDP4
ADDRLP4 1180
INDIRI4
ASGNI4
line 1743
;1743:	bs->inventory[INVENTORY_MEDKIT] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_MEDKIT;
ADDRLP4 1192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1192
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 27
NEI4 $744
ADDRLP4 1188
CNSTI4 1
ASGNI4
ADDRGP4 $745
JUMPV
LABELV $744
ADDRLP4 1188
CNSTI4 0
ASGNI4
LABELV $745
ADDRLP4 1192
INDIRP4
CNSTI4 5076
ADDP4
ADDRLP4 1188
INDIRI4
ASGNI4
line 1745
;1744:#ifdef MISSIONPACK
;1745:	bs->inventory[INVENTORY_KAMIKAZE] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_KAMIKAZE;
ADDRLP4 1200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1200
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 36
NEI4 $747
ADDRLP4 1196
CNSTI4 1
ASGNI4
ADDRGP4 $748
JUMPV
LABELV $747
ADDRLP4 1196
CNSTI4 0
ASGNI4
LABELV $748
ADDRLP4 1200
INDIRP4
CNSTI4 5080
ADDP4
ADDRLP4 1196
INDIRI4
ASGNI4
line 1746
;1746:	bs->inventory[INVENTORY_PORTAL] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_PORTAL;
ADDRLP4 1208
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1208
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 37
NEI4 $750
ADDRLP4 1204
CNSTI4 1
ASGNI4
ADDRGP4 $751
JUMPV
LABELV $750
ADDRLP4 1204
CNSTI4 0
ASGNI4
LABELV $751
ADDRLP4 1208
INDIRP4
CNSTI4 5084
ADDP4
ADDRLP4 1204
INDIRI4
ASGNI4
line 1747
;1747:	bs->inventory[INVENTORY_INVULNERABILITY] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_INVULNERABILITY;
ADDRLP4 1216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1216
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 38
NEI4 $753
ADDRLP4 1212
CNSTI4 1
ASGNI4
ADDRGP4 $754
JUMPV
LABELV $753
ADDRLP4 1212
CNSTI4 0
ASGNI4
LABELV $754
ADDRLP4 1216
INDIRP4
CNSTI4 5088
ADDP4
ADDRLP4 1212
INDIRI4
ASGNI4
line 1749
;1748:#endif
;1749:	bs->inventory[INVENTORY_QUAD] = bs->cur_ps.powerups[PW_QUAD] != 0;
ADDRLP4 1224
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1224
INDIRP4
CNSTI4 332
ADDP4
INDIRI4
CNSTI4 0
EQI4 $756
ADDRLP4 1220
CNSTI4 1
ASGNI4
ADDRGP4 $757
JUMPV
LABELV $756
ADDRLP4 1220
CNSTI4 0
ASGNI4
LABELV $757
ADDRLP4 1224
INDIRP4
CNSTI4 5092
ADDP4
ADDRLP4 1220
INDIRI4
ASGNI4
line 1750
;1750:	bs->inventory[INVENTORY_ENVIRONMENTSUIT] = bs->cur_ps.powerups[PW_BATTLESUIT] != 0;
ADDRLP4 1232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1232
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $759
ADDRLP4 1228
CNSTI4 1
ASGNI4
ADDRGP4 $760
JUMPV
LABELV $759
ADDRLP4 1228
CNSTI4 0
ASGNI4
LABELV $760
ADDRLP4 1232
INDIRP4
CNSTI4 5096
ADDP4
ADDRLP4 1228
INDIRI4
ASGNI4
line 1751
;1751:	bs->inventory[INVENTORY_HASTE] = bs->cur_ps.powerups[PW_HASTE] != 0;
ADDRLP4 1240
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1240
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $762
ADDRLP4 1236
CNSTI4 1
ASGNI4
ADDRGP4 $763
JUMPV
LABELV $762
ADDRLP4 1236
CNSTI4 0
ASGNI4
LABELV $763
ADDRLP4 1240
INDIRP4
CNSTI4 5100
ADDP4
ADDRLP4 1236
INDIRI4
ASGNI4
line 1752
;1752:	bs->inventory[INVENTORY_INVISIBILITY] = bs->cur_ps.powerups[PW_INVIS] != 0;
ADDRLP4 1248
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1248
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $765
ADDRLP4 1244
CNSTI4 1
ASGNI4
ADDRGP4 $766
JUMPV
LABELV $765
ADDRLP4 1244
CNSTI4 0
ASGNI4
LABELV $766
ADDRLP4 1248
INDIRP4
CNSTI4 5104
ADDP4
ADDRLP4 1244
INDIRI4
ASGNI4
line 1753
;1753:	bs->inventory[INVENTORY_REGEN] = bs->cur_ps.powerups[PW_REGEN] != 0;
ADDRLP4 1256
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1256
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $768
ADDRLP4 1252
CNSTI4 1
ASGNI4
ADDRGP4 $769
JUMPV
LABELV $768
ADDRLP4 1252
CNSTI4 0
ASGNI4
LABELV $769
ADDRLP4 1256
INDIRP4
CNSTI4 5108
ADDP4
ADDRLP4 1252
INDIRI4
ASGNI4
line 1754
;1754:	bs->inventory[INVENTORY_FLIGHT] = bs->cur_ps.powerups[PW_FLIGHT] != 0;
ADDRLP4 1264
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1264
INDIRP4
CNSTI4 352
ADDP4
INDIRI4
CNSTI4 0
EQI4 $771
ADDRLP4 1260
CNSTI4 1
ASGNI4
ADDRGP4 $772
JUMPV
LABELV $771
ADDRLP4 1260
CNSTI4 0
ASGNI4
LABELV $772
ADDRLP4 1264
INDIRP4
CNSTI4 5112
ADDP4
ADDRLP4 1260
INDIRI4
ASGNI4
line 1756
;1755:#ifdef MISSIONPACK
;1756:	bs->inventory[INVENTORY_SCOUT] = bs->cur_ps.stats[STAT_PERSISTANT_POWERUP] == MODELINDEX_SCOUT;
ADDRLP4 1272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1272
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 42
NEI4 $774
ADDRLP4 1268
CNSTI4 1
ASGNI4
ADDRGP4 $775
JUMPV
LABELV $774
ADDRLP4 1268
CNSTI4 0
ASGNI4
LABELV $775
ADDRLP4 1272
INDIRP4
CNSTI4 5116
ADDP4
ADDRLP4 1268
INDIRI4
ASGNI4
line 1757
;1757:	bs->inventory[INVENTORY_GUARD] = bs->cur_ps.stats[STAT_PERSISTANT_POWERUP] == MODELINDEX_GUARD;
ADDRLP4 1280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1280
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 43
NEI4 $777
ADDRLP4 1276
CNSTI4 1
ASGNI4
ADDRGP4 $778
JUMPV
LABELV $777
ADDRLP4 1276
CNSTI4 0
ASGNI4
LABELV $778
ADDRLP4 1280
INDIRP4
CNSTI4 5120
ADDP4
ADDRLP4 1276
INDIRI4
ASGNI4
line 1758
;1758:	bs->inventory[INVENTORY_DOUBLER] = bs->cur_ps.stats[STAT_PERSISTANT_POWERUP] == MODELINDEX_DOUBLER;
ADDRLP4 1288
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1288
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 44
NEI4 $780
ADDRLP4 1284
CNSTI4 1
ASGNI4
ADDRGP4 $781
JUMPV
LABELV $780
ADDRLP4 1284
CNSTI4 0
ASGNI4
LABELV $781
ADDRLP4 1288
INDIRP4
CNSTI4 5124
ADDP4
ADDRLP4 1284
INDIRI4
ASGNI4
line 1759
;1759:	bs->inventory[INVENTORY_AMMOREGEN] = bs->cur_ps.stats[STAT_PERSISTANT_POWERUP] == MODELINDEX_AMMOREGEN;
ADDRLP4 1296
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1296
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 45
NEI4 $783
ADDRLP4 1292
CNSTI4 1
ASGNI4
ADDRGP4 $784
JUMPV
LABELV $783
ADDRLP4 1292
CNSTI4 0
ASGNI4
LABELV $784
ADDRLP4 1296
INDIRP4
CNSTI4 5128
ADDP4
ADDRLP4 1292
INDIRI4
ASGNI4
line 1761
;1760:#endif
;1761:	bs->inventory[INVENTORY_REDFLAG] = bs->cur_ps.powerups[PW_REDFLAG] != 0;
ADDRLP4 1304
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1304
INDIRP4
CNSTI4 356
ADDP4
INDIRI4
CNSTI4 0
EQI4 $786
ADDRLP4 1300
CNSTI4 1
ASGNI4
ADDRGP4 $787
JUMPV
LABELV $786
ADDRLP4 1300
CNSTI4 0
ASGNI4
LABELV $787
ADDRLP4 1304
INDIRP4
CNSTI4 5132
ADDP4
ADDRLP4 1300
INDIRI4
ASGNI4
line 1762
;1762:	bs->inventory[INVENTORY_BLUEFLAG] = bs->cur_ps.powerups[PW_BLUEFLAG] != 0;
ADDRLP4 1312
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1312
INDIRP4
CNSTI4 360
ADDP4
INDIRI4
CNSTI4 0
EQI4 $789
ADDRLP4 1308
CNSTI4 1
ASGNI4
ADDRGP4 $790
JUMPV
LABELV $789
ADDRLP4 1308
CNSTI4 0
ASGNI4
LABELV $790
ADDRLP4 1312
INDIRP4
CNSTI4 5136
ADDP4
ADDRLP4 1308
INDIRI4
ASGNI4
line 1764
;1763:#ifdef MISSIONPACK
;1764:	bs->inventory[INVENTORY_NEUTRALFLAG] = bs->cur_ps.powerups[PW_NEUTRALFLAG] != 0;
ADDRLP4 1320
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1320
INDIRP4
CNSTI4 364
ADDP4
INDIRI4
CNSTI4 0
EQI4 $792
ADDRLP4 1316
CNSTI4 1
ASGNI4
ADDRGP4 $793
JUMPV
LABELV $792
ADDRLP4 1316
CNSTI4 0
ASGNI4
LABELV $793
ADDRLP4 1320
INDIRP4
CNSTI4 5140
ADDP4
ADDRLP4 1316
INDIRI4
ASGNI4
line 1765
;1765:	if (BotTeam(bs) == TEAM_RED) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1324
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 1324
INDIRI4
CNSTI4 1
NEI4 $794
line 1766
;1766:		bs->inventory[INVENTORY_REDCUBE] = bs->cur_ps.generic1;
ADDRLP4 1328
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1328
INDIRP4
CNSTI4 5144
ADDP4
ADDRLP4 1328
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
ASGNI4
line 1767
;1767:		bs->inventory[INVENTORY_BLUECUBE] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 5148
ADDP4
CNSTI4 0
ASGNI4
line 1768
;1768:	}
ADDRGP4 $795
JUMPV
LABELV $794
line 1769
;1769:	else {
line 1770
;1770:		bs->inventory[INVENTORY_REDCUBE] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 5144
ADDP4
CNSTI4 0
ASGNI4
line 1771
;1771:		bs->inventory[INVENTORY_BLUECUBE] = bs->cur_ps.generic1;
ADDRLP4 1328
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1328
INDIRP4
CNSTI4 5148
ADDP4
ADDRLP4 1328
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
ASGNI4
line 1772
;1772:	}
LABELV $795
line 1774
;1773:#endif
;1774:	BotCheckItemPickup(bs, oldinventory);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckItemPickup
CALLV
pop
line 1775
;1775:}
LABELV $700
endproc BotUpdateInventory 1332 12
export BotUpdateBattleInventory
proc BotUpdateBattleInventory 160 8
line 1782
;1776:
;1777:/*
;1778:==================
;1779:BotUpdateBattleInventory
;1780:==================
;1781:*/
;1782:void BotUpdateBattleInventory(bot_state_t *bs, int enemy) {
line 1786
;1783:	vec3_t dir;
;1784:	aas_entityinfo_t entinfo;
;1785:
;1786:	BotEntityInfo(enemy, &entinfo);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1787
;1787:	VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12+24
INDIRF4
ADDRLP4 152
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 12+24+4
INDIRF4
ADDRLP4 152
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 12+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1788
;1788:	bs->inventory[ENEMY_HEIGHT] = (int) dir[2];
ADDRFP4 0
INDIRP4
CNSTI4 5756
ADDP4
ADDRLP4 0+8
INDIRF4
CVFI4 4
ASGNI4
line 1789
;1789:	dir[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1790
;1790:	bs->inventory[ENEMY_HORIZONTAL_DIST] = (int) VectorLength(dir);
ADDRLP4 0
ARGP4
ADDRLP4 156
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 5752
ADDP4
ADDRLP4 156
INDIRF4
CVFI4 4
ASGNI4
line 1792
;1791:	//FIXME: add num visible enemies and num visible team mates to the inventory
;1792:}
LABELV $796
endproc BotUpdateBattleInventory 160 8
export BotUseKamikaze
proc BotUseKamikaze 288 28
line 1802
;1793:
;1794:#ifdef MISSIONPACK
;1795:/*
;1796:==================
;1797:BotUseKamikaze
;1798:==================
;1799:*/
;1800:#define KAMIKAZE_DIST		1024
;1801:
;1802:void BotUseKamikaze(bot_state_t *bs) {
line 1810
;1803:	int c, teammates, enemies;
;1804:	aas_entityinfo_t entinfo;
;1805:	vec3_t dir, target;
;1806:	bot_goal_t *goal;
;1807:	bsp_trace_t trace;
;1808:
;1809:	//if the bot has no kamikaze
;1810:	if (bs->inventory[INVENTORY_KAMIKAZE] <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 5080
ADDP4
INDIRI4
CNSTI4 0
GTI4 $807
line 1811
;1811:		return;
ADDRGP4 $806
JUMPV
LABELV $807
line 1812
;1812:	if (bs->kamikaze_time > FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 6104
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $809
line 1813
;1813:		return;
ADDRGP4 $806
JUMPV
LABELV $809
line 1814
;1814:	bs->kamikaze_time = FloatTime() + 0.2;
ADDRFP4 0
INDIRP4
CNSTI4 6104
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1045220557
ADDF4
ASGNF4
line 1815
;1815:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $811
line 1817
;1816:		//never use kamikaze if the team flag carrier is visible
;1817:		if (BotCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
EQI4 $813
line 1818
;1818:			return;
ADDRGP4 $806
JUMPV
LABELV $813
line 1819
;1819:		c = BotTeamFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 268
ADDRGP4 BotTeamFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 268
INDIRI4
ASGNI4
line 1820
;1820:		if (c >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $815
line 1821
;1821:			BotEntityInfo(c, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1822
;1822:			VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16+24
INDIRF4
ADDRLP4 272
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 16+24+4
INDIRF4
ADDRLP4 272
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 16+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1823
;1823:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST))
ADDRLP4 4
ARGP4
ADDRLP4 276
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 276
INDIRF4
CNSTF4 1233125376
GEF4 $824
line 1824
;1824:				return;
ADDRGP4 $806
JUMPV
LABELV $824
line 1825
;1825:		}
LABELV $815
line 1826
;1826:		c = BotEnemyFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 272
ADDRGP4 BotEnemyFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 272
INDIRI4
ASGNI4
line 1827
;1827:		if (c >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $812
line 1828
;1828:			BotEntityInfo(c, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1829
;1829:			VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16+24
INDIRF4
ADDRLP4 276
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 16+24+4
INDIRF4
ADDRLP4 276
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 16+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1830
;1830:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST)) {
ADDRLP4 4
ARGP4
ADDRLP4 280
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 280
INDIRF4
CNSTF4 1233125376
GEF4 $812
line 1831
;1831:				trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 1832
;1832:				return;
ADDRGP4 $806
JUMPV
line 1834
;1833:			}
;1834:		}
line 1835
;1835:	}
LABELV $811
line 1836
;1836:	else if (gametype == GT_1FCTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 5
NEI4 $837
line 1838
;1837:		//never use kamikaze if the team flag carrier is visible
;1838:		if (Bot1FCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 Bot1FCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
EQI4 $839
line 1839
;1839:			return;
ADDRGP4 $806
JUMPV
LABELV $839
line 1840
;1840:		c = BotTeamFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 268
ADDRGP4 BotTeamFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 268
INDIRI4
ASGNI4
line 1841
;1841:		if (c >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $841
line 1842
;1842:			BotEntityInfo(c, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1843
;1843:			VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16+24
INDIRF4
ADDRLP4 272
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 16+24+4
INDIRF4
ADDRLP4 272
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 16+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1844
;1844:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST))
ADDRLP4 4
ARGP4
ADDRLP4 276
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 276
INDIRF4
CNSTF4 1233125376
GEF4 $850
line 1845
;1845:				return;
ADDRGP4 $806
JUMPV
LABELV $850
line 1846
;1846:		}
LABELV $841
line 1847
;1847:		c = BotEnemyFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 272
ADDRGP4 BotEnemyFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 272
INDIRI4
ASGNI4
line 1848
;1848:		if (c >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $838
line 1849
;1849:			BotEntityInfo(c, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1850
;1850:			VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16+24
INDIRF4
ADDRLP4 276
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 16+24+4
INDIRF4
ADDRLP4 276
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 16+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1851
;1851:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST)) {
ADDRLP4 4
ARGP4
ADDRLP4 280
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 280
INDIRF4
CNSTF4 1233125376
GEF4 $838
line 1852
;1852:				trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 1853
;1853:				return;
ADDRGP4 $806
JUMPV
line 1855
;1854:			}
;1855:		}
line 1856
;1856:	}
LABELV $837
line 1857
;1857:	else if (gametype == GT_OBELISK) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $863
line 1858
;1858:		switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 268
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 264
ADDRLP4 268
INDIRI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 1
EQI4 $868
ADDRGP4 $865
JUMPV
LABELV $868
line 1859
;1859:			case TEAM_RED: goal = &blueobelisk; break;
ADDRLP4 176
ADDRGP4 blueobelisk
ASGNP4
ADDRGP4 $866
JUMPV
LABELV $865
line 1860
;1860:			default: goal = &redobelisk; break;
ADDRLP4 176
ADDRGP4 redobelisk
ASGNP4
LABELV $866
line 1863
;1861:		}
;1862:		//if the obelisk is visible
;1863:		VectorCopy(goal->origin, target);
ADDRLP4 164
ADDRLP4 176
INDIRP4
INDIRB
ASGNB 12
line 1864
;1864:		target[2] += 1;
ADDRLP4 164+8
ADDRLP4 164+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1865
;1865:		VectorSubtract(bs->origin, target, dir);
ADDRLP4 272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 272
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRLP4 164
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 272
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRLP4 164+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRLP4 164+8
INDIRF4
SUBF4
ASGNF4
line 1866
;1866:		if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST * 0.9)) {
ADDRLP4 4
ARGP4
ADDRLP4 276
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 276
INDIRF4
CNSTF4 1229937705
GEF4 $864
line 1867
;1867:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
ADDRLP4 180
ARGP4
ADDRLP4 280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 280
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 284
CNSTP4 0
ASGNP4
ADDRLP4 284
INDIRP4
ARGP4
ADDRLP4 284
INDIRP4
ARGP4
ADDRLP4 164
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 1868
;1868:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
ADDRLP4 180+8
INDIRF4
CNSTF4 1065353216
GEF4 $880
ADDRLP4 180+80
INDIRI4
ADDRLP4 176
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $864
LABELV $880
line 1869
;1869:				trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 1870
;1870:				return;
ADDRGP4 $806
JUMPV
line 1872
;1871:			}
;1872:		}
line 1873
;1873:	}
LABELV $863
line 1874
;1874:	else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $881
line 1876
;1875:		//
;1876:		if (BotHarvesterCarryingCubes(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotHarvesterCarryingCubes
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
EQI4 $883
line 1877
;1877:			return;
ADDRGP4 $806
JUMPV
LABELV $883
line 1879
;1878:		//never use kamikaze if a team mate carrying cubes is visible
;1879:		c = BotTeamCubeCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 268
ADDRGP4 BotTeamCubeCarrierVisible
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 268
INDIRI4
ASGNI4
line 1880
;1880:		if (c >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $885
line 1881
;1881:			BotEntityInfo(c, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1882
;1882:			VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16+24
INDIRF4
ADDRLP4 272
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 16+24+4
INDIRF4
ADDRLP4 272
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 16+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1883
;1883:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST))
ADDRLP4 4
ARGP4
ADDRLP4 276
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 276
INDIRF4
CNSTF4 1233125376
GEF4 $894
line 1884
;1884:				return;
ADDRGP4 $806
JUMPV
LABELV $894
line 1885
;1885:		}
LABELV $885
line 1886
;1886:		c = BotEnemyCubeCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 272
ADDRGP4 BotEnemyCubeCarrierVisible
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 272
INDIRI4
ASGNI4
line 1887
;1887:		if (c >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $896
line 1888
;1888:			BotEntityInfo(c, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1889
;1889:			VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16+24
INDIRF4
ADDRLP4 276
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 16+24+4
INDIRF4
ADDRLP4 276
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 16+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1890
;1890:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST)) {
ADDRLP4 4
ARGP4
ADDRLP4 280
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 280
INDIRF4
CNSTF4 1233125376
GEF4 $905
line 1891
;1891:				trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 1892
;1892:				return;
ADDRGP4 $806
JUMPV
LABELV $905
line 1894
;1893:			}
;1894:		}
LABELV $896
line 1895
;1895:	}
LABELV $881
LABELV $864
LABELV $838
LABELV $812
line 1897
;1896:	//
;1897:	BotVisibleTeamMatesAndEnemies(bs, &teammates, &enemies, KAMIKAZE_DIST);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 160
ARGP4
ADDRLP4 156
ARGP4
CNSTF4 1149239296
ARGF4
ADDRGP4 BotVisibleTeamMatesAndEnemies
CALLV
pop
line 1899
;1898:	//
;1899:	if (enemies > 2 && enemies > teammates+1) {
ADDRLP4 264
ADDRLP4 156
INDIRI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 2
LEI4 $907
ADDRLP4 264
INDIRI4
ADDRLP4 160
INDIRI4
CNSTI4 1
ADDI4
LEI4 $907
line 1900
;1900:		trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 1901
;1901:		return;
LABELV $907
line 1903
;1902:	}
;1903:}
LABELV $806
endproc BotUseKamikaze 288 28
export BotUseInvulnerability
proc BotUseInvulnerability 148 28
line 1910
;1904:
;1905:/*
;1906:==================
;1907:BotUseInvulnerability
;1908:==================
;1909:*/
;1910:void BotUseInvulnerability(bot_state_t *bs) {
line 1917
;1911:	int c;
;1912:	vec3_t dir, target;
;1913:	bot_goal_t *goal;
;1914:	bsp_trace_t trace;
;1915:
;1916:	//if the bot has no invulnerability
;1917:	if (bs->inventory[INVENTORY_INVULNERABILITY] <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 5088
ADDP4
INDIRI4
CNSTI4 0
GTI4 $910
line 1918
;1918:		return;
ADDRGP4 $909
JUMPV
LABELV $910
line 1919
;1919:	if (bs->invulnerability_time > FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 6108
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $912
line 1920
;1920:		return;
ADDRGP4 $909
JUMPV
LABELV $912
line 1921
;1921:	bs->invulnerability_time = FloatTime() + 0.2;
ADDRFP4 0
INDIRP4
CNSTI4 6108
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1045220557
ADDF4
ASGNF4
line 1922
;1922:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $914
line 1924
;1923:		//never use kamikaze if the team flag carrier is visible
;1924:		if (BotCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
EQI4 $916
line 1925
;1925:			return;
ADDRGP4 $909
JUMPV
LABELV $916
line 1926
;1926:		c = BotEnemyFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 BotEnemyFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 120
INDIRI4
ASGNI4
line 1927
;1927:		if (c >= 0)
ADDRLP4 24
INDIRI4
CNSTI4 0
LTI4 $918
line 1928
;1928:			return;
ADDRGP4 $909
JUMPV
LABELV $918
line 1930
;1929:		//if near enemy flag and the flag is visible
;1930:		switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 124
ADDRLP4 128
INDIRI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 1
EQI4 $923
ADDRGP4 $920
JUMPV
LABELV $923
line 1931
;1931:			case TEAM_RED: goal = &ctf_blueflag; break;
ADDRLP4 28
ADDRGP4 ctf_blueflag
ASGNP4
ADDRGP4 $921
JUMPV
LABELV $920
line 1932
;1932:			default: goal = &ctf_redflag; break;
ADDRLP4 28
ADDRGP4 ctf_redflag
ASGNP4
LABELV $921
line 1935
;1933:		}
;1934:		//if the obelisk is visible
;1935:		VectorCopy(goal->origin, target);
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRB
ASGNB 12
line 1936
;1936:		target[2] += 1;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1937
;1937:		VectorSubtract(bs->origin, target, dir);
ADDRLP4 132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 132
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 132
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 1938
;1938:		if (VectorLengthSquared(dir) < Square(200)) {
ADDRLP4 12
ARGP4
ADDRLP4 136
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 136
INDIRF4
CNSTF4 1193033728
GEF4 $915
line 1939
;1939:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
ADDRLP4 32
ARGP4
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 144
CNSTP4 0
ASGNP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 1940
;1940:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
ADDRLP4 32+8
INDIRF4
CNSTF4 1065353216
GEF4 $935
ADDRLP4 32+80
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $915
LABELV $935
line 1941
;1941:				trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 1942
;1942:				return;
ADDRGP4 $909
JUMPV
line 1944
;1943:			}
;1944:		}
line 1945
;1945:	}
LABELV $914
line 1946
;1946:	else if (gametype == GT_1FCTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 5
NEI4 $936
line 1948
;1947:		//never use kamikaze if the team flag carrier is visible
;1948:		if (Bot1FCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 Bot1FCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
EQI4 $938
line 1949
;1949:			return;
ADDRGP4 $909
JUMPV
LABELV $938
line 1950
;1950:		c = BotEnemyFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 BotEnemyFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 120
INDIRI4
ASGNI4
line 1951
;1951:		if (c >= 0)
ADDRLP4 24
INDIRI4
CNSTI4 0
LTI4 $940
line 1952
;1952:			return;
ADDRGP4 $909
JUMPV
LABELV $940
line 1954
;1953:		//if near enemy flag and the flag is visible
;1954:		switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 124
ADDRLP4 128
INDIRI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 1
EQI4 $945
ADDRGP4 $942
JUMPV
LABELV $945
line 1955
;1955:			case TEAM_RED: goal = &ctf_blueflag; break;
ADDRLP4 28
ADDRGP4 ctf_blueflag
ASGNP4
ADDRGP4 $943
JUMPV
LABELV $942
line 1956
;1956:			default: goal = &ctf_redflag; break;
ADDRLP4 28
ADDRGP4 ctf_redflag
ASGNP4
LABELV $943
line 1959
;1957:		}
;1958:		//if the obelisk is visible
;1959:		VectorCopy(goal->origin, target);
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRB
ASGNB 12
line 1960
;1960:		target[2] += 1;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1961
;1961:		VectorSubtract(bs->origin, target, dir);
ADDRLP4 132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 132
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 132
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 1962
;1962:		if (VectorLengthSquared(dir) < Square(200)) {
ADDRLP4 12
ARGP4
ADDRLP4 136
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 136
INDIRF4
CNSTF4 1193033728
GEF4 $937
line 1963
;1963:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
ADDRLP4 32
ARGP4
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 144
CNSTP4 0
ASGNP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 1964
;1964:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
ADDRLP4 32+8
INDIRF4
CNSTF4 1065353216
GEF4 $957
ADDRLP4 32+80
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $937
LABELV $957
line 1965
;1965:				trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 1966
;1966:				return;
ADDRGP4 $909
JUMPV
line 1968
;1967:			}
;1968:		}
line 1969
;1969:	}
LABELV $936
line 1970
;1970:	else if (gametype == GT_OBELISK) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $958
line 1971
;1971:		switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 116
ADDRLP4 120
INDIRI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 1
EQI4 $963
ADDRGP4 $960
JUMPV
LABELV $963
line 1972
;1972:			case TEAM_RED: goal = &blueobelisk; break;
ADDRLP4 28
ADDRGP4 blueobelisk
ASGNP4
ADDRGP4 $961
JUMPV
LABELV $960
line 1973
;1973:			default: goal = &redobelisk; break;
ADDRLP4 28
ADDRGP4 redobelisk
ASGNP4
LABELV $961
line 1976
;1974:		}
;1975:		//if the obelisk is visible
;1976:		VectorCopy(goal->origin, target);
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRB
ASGNB 12
line 1977
;1977:		target[2] += 1;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1978
;1978:		VectorSubtract(bs->origin, target, dir);
ADDRLP4 124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 124
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 124
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 1979
;1979:		if (VectorLengthSquared(dir) < Square(300)) {
ADDRLP4 12
ARGP4
ADDRLP4 128
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 128
INDIRF4
CNSTF4 1202702336
GEF4 $959
line 1980
;1980:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
ADDRLP4 32
ARGP4
ADDRLP4 132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 132
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 136
CNSTP4 0
ASGNP4
ADDRLP4 136
INDIRP4
ARGP4
ADDRLP4 136
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 132
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 1981
;1981:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
ADDRLP4 32+8
INDIRF4
CNSTF4 1065353216
GEF4 $975
ADDRLP4 32+80
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $959
LABELV $975
line 1982
;1982:				trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 1983
;1983:				return;
ADDRGP4 $909
JUMPV
line 1985
;1984:			}
;1985:		}
line 1986
;1986:	}
LABELV $958
line 1987
;1987:	else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $976
line 1989
;1988:		//
;1989:		if (BotHarvesterCarryingCubes(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 BotHarvesterCarryingCubes
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
EQI4 $978
line 1990
;1990:			return;
ADDRGP4 $909
JUMPV
LABELV $978
line 1991
;1991:		c = BotEnemyCubeCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 BotEnemyCubeCarrierVisible
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 120
INDIRI4
ASGNI4
line 1992
;1992:		if (c >= 0)
ADDRLP4 24
INDIRI4
CNSTI4 0
LTI4 $980
line 1993
;1993:			return;
ADDRGP4 $909
JUMPV
LABELV $980
line 1995
;1994:		//if near enemy base and enemy base is visible
;1995:		switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 124
ADDRLP4 128
INDIRI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 1
EQI4 $985
ADDRGP4 $982
JUMPV
LABELV $985
line 1996
;1996:			case TEAM_RED: goal = &blueobelisk; break;
ADDRLP4 28
ADDRGP4 blueobelisk
ASGNP4
ADDRGP4 $983
JUMPV
LABELV $982
line 1997
;1997:			default: goal = &redobelisk; break;
ADDRLP4 28
ADDRGP4 redobelisk
ASGNP4
LABELV $983
line 2000
;1998:		}
;1999:		//if the obelisk is visible
;2000:		VectorCopy(goal->origin, target);
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRB
ASGNB 12
line 2001
;2001:		target[2] += 1;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2002
;2002:		VectorSubtract(bs->origin, target, dir);
ADDRLP4 132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 132
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 132
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 2003
;2003:		if (VectorLengthSquared(dir) < Square(200)) {
ADDRLP4 12
ARGP4
ADDRLP4 136
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 136
INDIRF4
CNSTF4 1193033728
GEF4 $991
line 2004
;2004:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
ADDRLP4 32
ARGP4
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 144
CNSTP4 0
ASGNP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2005
;2005:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
ADDRLP4 32+8
INDIRF4
CNSTF4 1065353216
GEF4 $997
ADDRLP4 32+80
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $993
LABELV $997
line 2006
;2006:				trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 2007
;2007:				return;
LABELV $993
line 2009
;2008:			}
;2009:		}
LABELV $991
line 2010
;2010:	}
LABELV $976
LABELV $959
LABELV $937
LABELV $915
line 2011
;2011:}
LABELV $909
endproc BotUseInvulnerability 148 28
export BotBattleUseItems
proc BotBattleUseItems 12 4
line 2019
;2012:#endif
;2013:
;2014:/*
;2015:==================
;2016:BotBattleUseItems
;2017:==================
;2018:*/
;2019:void BotBattleUseItems(bot_state_t *bs) {
line 2020
;2020:	if (bs->inventory[INVENTORY_HEALTH] < 40) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 40
GEI4 $999
line 2021
;2021:		if (bs->inventory[INVENTORY_TELEPORTER] > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 5072
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1001
line 2022
;2022:			if (!BotCTFCarryingFlag(bs)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1003
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Bot1FCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1003
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotHarvesterCarryingCubes
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $1003
line 2027
;2023:#ifdef MISSIONPACK
;2024:				&& !Bot1FCTFCarryingFlag(bs)
;2025:				&& !BotHarvesterCarryingCubes(bs)
;2026:#endif
;2027:				) {
line 2028
;2028:				trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 2029
;2029:			}
LABELV $1003
line 2030
;2030:		}
LABELV $1001
line 2031
;2031:	}
LABELV $999
line 2032
;2032:	if (bs->inventory[INVENTORY_HEALTH] < 60) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $1005
line 2033
;2033:		if (bs->inventory[INVENTORY_MEDKIT] > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 5076
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1007
line 2034
;2034:			trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 2035
;2035:		}
LABELV $1007
line 2036
;2036:	}
LABELV $1005
line 2038
;2037:#ifdef MISSIONPACK
;2038:	BotUseKamikaze(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotUseKamikaze
CALLV
pop
line 2039
;2039:	BotUseInvulnerability(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotUseInvulnerability
CALLV
pop
line 2041
;2040:#endif
;2041:}
LABELV $998
endproc BotBattleUseItems 12 4
export BotSetTeleportTime
proc BotSetTeleportTime 8 0
line 2048
;2042:
;2043:/*
;2044:==================
;2045:BotSetTeleportTime
;2046:==================
;2047:*/
;2048:void BotSetTeleportTime(bot_state_t *bs) {
line 2049
;2049:	if ((bs->cur_ps.eFlags ^ bs->last_eFlags) & EF_TELEPORT_BIT) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
BXORI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1010
line 2050
;2050:		bs->teleport_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6180
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2051
;2051:	}
LABELV $1010
line 2052
;2052:	bs->last_eFlags = bs->cur_ps.eFlags;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 484
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
ASGNI4
line 2053
;2053:}
LABELV $1009
endproc BotSetTeleportTime 8 0
export BotIsDead
proc BotIsDead 4 0
line 2060
;2054:
;2055:/*
;2056:==================
;2057:BotIsDead
;2058:==================
;2059:*/
;2060:qboolean BotIsDead(bot_state_t *bs) {
line 2061
;2061:	return (bs->cur_ps.pm_type == PM_DEAD);
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1014
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $1015
JUMPV
LABELV $1014
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1015
ADDRLP4 0
INDIRI4
RETI4
LABELV $1012
endproc BotIsDead 4 0
export BotIsObserver
proc BotIsObserver 1032 12
line 2069
;2062:}
;2063:
;2064:/*
;2065:==================
;2066:BotIsObserver
;2067:==================
;2068:*/
;2069:qboolean BotIsObserver(bot_state_t *bs) {
line 2071
;2070:	char buf[MAX_INFO_STRING];
;2071:	if (bs->cur_ps.pm_type == PM_SPECTATOR) return qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1017
CNSTI4 1
RETI4
ADDRGP4 $1016
JUMPV
LABELV $1017
line 2072
;2072:	trap_GetConfigstring(CS_PLAYERS+bs->client, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 2073
;2073:	if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR) return qtrue;
ADDRLP4 0
ARGP4
ADDRGP4 $70
ARGP4
ADDRLP4 1024
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1028
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 3
NEI4 $1019
CNSTI4 1
RETI4
ADDRGP4 $1016
JUMPV
LABELV $1019
line 2074
;2074:	return qfalse;
CNSTI4 0
RETI4
LABELV $1016
endproc BotIsObserver 1032 12
export BotIntermission
proc BotIntermission 8 0
line 2082
;2075:}
;2076:
;2077:/*
;2078:==================
;2079:BotIntermission
;2080:==================
;2081:*/
;2082:qboolean BotIntermission(bot_state_t *bs) {
line 2084
;2083:	//NOTE: we shouldn't be looking at the game code...
;2084:	if (level.intermissiontime) return qtrue;
ADDRGP4 level+9132
INDIRI4
CNSTI4 0
EQI4 $1022
CNSTI4 1
RETI4
ADDRGP4 $1021
JUMPV
LABELV $1022
line 2085
;2085:	return (bs->cur_ps.pm_type == PM_FREEZE || bs->cur_ps.pm_type == PM_INTERMISSION);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 4
EQI4 $1028
ADDRLP4 4
INDIRI4
CNSTI4 5
NEI4 $1026
LABELV $1028
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $1027
JUMPV
LABELV $1026
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1027
ADDRLP4 0
INDIRI4
RETI4
LABELV $1021
endproc BotIntermission 8 0
export BotInLavaOrSlime
proc BotInLavaOrSlime 16 4
line 2094
;2086:	
;2087:}
;2088:
;2089:/*
;2090:==================
;2091:BotInLavaOrSlime
;2092:==================
;2093:*/
;2094:qboolean BotInLavaOrSlime(bot_state_t *bs) {
line 2097
;2095:	vec3_t feet;
;2096:
;2097:	VectorCopy(bs->origin, feet);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 2098
;2098:	feet[2] -= 23;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1102577664
SUBF4
ASGNF4
line 2099
;2099:	return (trap_AAS_PointContents(feet) & (CONTENTS_LAVA|CONTENTS_SLIME));
ADDRLP4 0
ARGP4
ADDRLP4 12
ADDRGP4 trap_AAS_PointContents
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 24
BANDI4
RETI4
LABELV $1029
endproc BotInLavaOrSlime 16 4
lit
align 4
LABELV $1032
byte 4 3238002688
byte 4 3238002688
byte 4 3238002688
align 4
LABELV $1033
byte 4 1090519040
byte 4 1090519040
byte 4 1090519040
export BotCreateWayPoint
code
proc BotCreateWayPoint 32 12
line 2107
;2100:}
;2101:
;2102:/*
;2103:==================
;2104:BotCreateWayPoint
;2105:==================
;2106:*/
;2107:bot_waypoint_t *BotCreateWayPoint(char *name, vec3_t origin, int areanum) {
line 2109
;2108:	bot_waypoint_t *wp;
;2109:	vec3_t waypointmins = {-8, -8, -8}, waypointmaxs = {8, 8, 8};
ADDRLP4 4
ADDRGP4 $1032
INDIRB
ASGNB 12
ADDRLP4 16
ADDRGP4 $1033
INDIRB
ASGNB 12
line 2111
;2110:
;2111:	wp = botai_freewaypoints;
ADDRLP4 0
ADDRGP4 botai_freewaypoints
INDIRP4
ASGNP4
line 2112
;2112:	if ( !wp ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1034
line 2113
;2113:		BotAI_Print( PRT_WARNING, "BotCreateWayPoint: Out of waypoints\n" );
CNSTI4 2
ARGI4
ADDRGP4 $1036
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 2114
;2114:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $1031
JUMPV
LABELV $1034
line 2116
;2115:	}
;2116:	botai_freewaypoints = botai_freewaypoints->next;
ADDRLP4 28
ADDRGP4 botai_freewaypoints
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ASGNP4
line 2118
;2117:
;2118:	Q_strncpyz( wp->name, name, sizeof(wp->name) );
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2119
;2119:	VectorCopy(origin, wp->goal.origin);
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2120
;2120:	VectorCopy(waypointmins, wp->goal.mins);
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 2121
;2121:	VectorCopy(waypointmaxs, wp->goal.maxs);
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 2122
;2122:	wp->goal.areanum = areanum;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 2123
;2123:	wp->next = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
CNSTP4 0
ASGNP4
line 2124
;2124:	wp->prev = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
CNSTP4 0
ASGNP4
line 2125
;2125:	return wp;
ADDRLP4 0
INDIRP4
RETP4
LABELV $1031
endproc BotCreateWayPoint 32 12
export BotFindWayPoint
proc BotFindWayPoint 8 8
line 2133
;2126:}
;2127:
;2128:/*
;2129:==================
;2130:BotFindWayPoint
;2131:==================
;2132:*/
;2133:bot_waypoint_t *BotFindWayPoint(bot_waypoint_t *waypoints, char *name) {
line 2136
;2134:	bot_waypoint_t *wp;
;2135:
;2136:	for (wp = waypoints; wp; wp = wp->next) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $1041
JUMPV
LABELV $1038
line 2137
;2137:		if (!Q_stricmp(wp->name, name)) return wp;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1042
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $1037
JUMPV
LABELV $1042
line 2138
;2138:	}
LABELV $1039
line 2136
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ASGNP4
LABELV $1041
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1038
line 2139
;2139:	return NULL;
CNSTP4 0
RETP4
LABELV $1037
endproc BotFindWayPoint 8 8
export BotFreeWaypoints
proc BotFreeWaypoints 4 0
line 2147
;2140:}
;2141:
;2142:/*
;2143:==================
;2144:BotFreeWaypoints
;2145:==================
;2146:*/
;2147:void BotFreeWaypoints(bot_waypoint_t *wp) {
line 2150
;2148:	bot_waypoint_t *nextwp;
;2149:
;2150:	for (; wp; wp = nextwp) {
ADDRGP4 $1048
JUMPV
LABELV $1045
line 2151
;2151:		nextwp = wp->next;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ASGNP4
line 2152
;2152:		wp->next = botai_freewaypoints;
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRGP4 botai_freewaypoints
INDIRP4
ASGNP4
line 2153
;2153:		botai_freewaypoints = wp;
ADDRGP4 botai_freewaypoints
ADDRFP4 0
INDIRP4
ASGNP4
line 2154
;2154:	}
LABELV $1046
line 2150
ADDRFP4 0
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $1048
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1045
line 2155
;2155:}
LABELV $1044
endproc BotFreeWaypoints 4 0
export BotInitWaypoints
proc BotInitWaypoints 4 0
line 2162
;2156:
;2157:/*
;2158:==================
;2159:BotInitWaypoints
;2160:==================
;2161:*/
;2162:void BotInitWaypoints(void) {
line 2165
;2163:	int i;
;2164:
;2165:	botai_freewaypoints = NULL;
ADDRGP4 botai_freewaypoints
CNSTP4 0
ASGNP4
line 2166
;2166:	for (i = 0; i < MAX_WAYPOINTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1050
line 2167
;2167:		botai_waypoints[i].next = botai_freewaypoints;
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botai_waypoints+92
ADDP4
ADDRGP4 botai_freewaypoints
INDIRP4
ASGNP4
line 2168
;2168:		botai_freewaypoints = &botai_waypoints[i];
ADDRGP4 botai_freewaypoints
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botai_waypoints
ADDP4
ASGNP4
line 2169
;2169:	}
LABELV $1051
line 2166
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 128
LTI4 $1050
line 2170
;2170:}
LABELV $1049
endproc BotInitWaypoints 4 0
export TeamPlayIsOn
proc TeamPlayIsOn 4 0
line 2177
;2171:
;2172:/*
;2173:==================
;2174:TeamPlayIsOn
;2175:==================
;2176:*/
;2177:int TeamPlayIsOn(void) {
line 2178
;2178:	return ( gametype >= GT_TEAM );
ADDRGP4 gametype
INDIRI4
CNSTI4 3
LTI4 $1057
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $1058
JUMPV
LABELV $1057
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1058
ADDRLP4 0
INDIRI4
RETI4
LABELV $1055
endproc TeamPlayIsOn 4 0
export BotAggression
proc BotAggression 28 0
line 2186
;2179:}
;2180:
;2181:/*
;2182:==================
;2183:BotAggression
;2184:==================
;2185:*/
;2186:float BotAggression(bot_state_t *bs) {
line 2188
;2187:	//if the bot has quad
;2188:	if (bs->inventory[INVENTORY_QUAD]) {
ADDRFP4 0
INDIRP4
CNSTI4 5092
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1060
line 2190
;2189:		//if the bot is not holding the gauntlet or the enemy is really nearby
;2190:		if (bs->weaponnum != WP_GAUNTLET ||
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1064
ADDRLP4 0
INDIRP4
CNSTI4 5752
ADDP4
INDIRI4
CNSTI4 80
GEI4 $1062
LABELV $1064
line 2191
;2191:			bs->inventory[ENEMY_HORIZONTAL_DIST] < 80) {
line 2192
;2192:			return 70;
CNSTF4 1116471296
RETF4
ADDRGP4 $1059
JUMPV
LABELV $1062
line 2194
;2193:		}
;2194:	}
LABELV $1060
line 2196
;2195:	//if the enemy is located way higher than the bot
;2196:	if (bs->inventory[ENEMY_HEIGHT] > 200) return 0;
ADDRFP4 0
INDIRP4
CNSTI4 5756
ADDP4
INDIRI4
CNSTI4 200
LEI4 $1065
CNSTF4 0
RETF4
ADDRGP4 $1059
JUMPV
LABELV $1065
line 2198
;2197:	//if the bot is very low on health
;2198:	if (bs->inventory[INVENTORY_HEALTH] < 60) return 0;
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $1067
CNSTF4 0
RETF4
ADDRGP4 $1059
JUMPV
LABELV $1067
line 2200
;2199:	//if the bot is low on health
;2200:	if (bs->inventory[INVENTORY_HEALTH] < 80) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 80
GEI4 $1069
line 2202
;2201:		//if the bot has insufficient armor
;2202:		if (bs->inventory[INVENTORY_ARMOR] < 40) return 0;
ADDRFP4 0
INDIRP4
CNSTI4 4956
ADDP4
INDIRI4
CNSTI4 40
GEI4 $1071
CNSTF4 0
RETF4
ADDRGP4 $1059
JUMPV
LABELV $1071
line 2203
;2203:	}
LABELV $1069
line 2205
;2204:	//if the bot can use the bfg
;2205:	if (bs->inventory[INVENTORY_BFG10K] > 0 &&
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 5004
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1073
ADDRLP4 0
INDIRP4
CNSTI4 5052
ADDP4
INDIRI4
CNSTI4 7
LEI4 $1073
line 2206
;2206:			bs->inventory[INVENTORY_BFGAMMO] > 7) return 100;
CNSTF4 1120403456
RETF4
ADDRGP4 $1059
JUMPV
LABELV $1073
line 2208
;2207:	//if the bot can use the railgun
;2208:	if (bs->inventory[INVENTORY_RAILGUN] > 0 &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 4992
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1075
ADDRLP4 4
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
CNSTI4 5
LEI4 $1075
line 2209
;2209:			bs->inventory[INVENTORY_SLUGS] > 5) return 95;
CNSTF4 1119748096
RETF4
ADDRGP4 $1059
JUMPV
LABELV $1075
line 2211
;2210:	//if the bot can use the lightning gun
;2211:	if (bs->inventory[INVENTORY_LIGHTNING] > 0 &&
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 4988
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1077
ADDRLP4 8
INDIRP4
CNSTI4 5040
ADDP4
INDIRI4
CNSTI4 50
LEI4 $1077
line 2212
;2212:			bs->inventory[INVENTORY_LIGHTNINGAMMO] > 50) return 90;
CNSTF4 1119092736
RETF4
ADDRGP4 $1059
JUMPV
LABELV $1077
line 2214
;2213:	//if the bot can use the rocketlauncher
;2214:	if (bs->inventory[INVENTORY_ROCKETLAUNCHER] > 0 &&
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 4984
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1079
ADDRLP4 12
INDIRP4
CNSTI4 5044
ADDP4
INDIRI4
CNSTI4 5
LEI4 $1079
line 2215
;2215:			bs->inventory[INVENTORY_ROCKETS] > 5) return 90;
CNSTF4 1119092736
RETF4
ADDRGP4 $1059
JUMPV
LABELV $1079
line 2217
;2216:	//if the bot can use the plasmagun
;2217:	if (bs->inventory[INVENTORY_PLASMAGUN] > 0 &&
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 4996
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1081
ADDRLP4 16
INDIRP4
CNSTI4 5036
ADDP4
INDIRI4
CNSTI4 40
LEI4 $1081
line 2218
;2218:			bs->inventory[INVENTORY_CELLS] > 40) return 85;
CNSTF4 1118437376
RETF4
ADDRGP4 $1059
JUMPV
LABELV $1081
line 2220
;2219:	//if the bot can use the grenade launcher
;2220:	if (bs->inventory[INVENTORY_GRENADELAUNCHER] > 0 &&
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 4980
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1083
ADDRLP4 20
INDIRP4
CNSTI4 5032
ADDP4
INDIRI4
CNSTI4 10
LEI4 $1083
line 2221
;2221:			bs->inventory[INVENTORY_GRENADES] > 10) return 80;
CNSTF4 1117782016
RETF4
ADDRGP4 $1059
JUMPV
LABELV $1083
line 2223
;2222:	//if the bot can use the shotgun
;2223:	if (bs->inventory[INVENTORY_SHOTGUN] > 0 &&
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 4972
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1085
ADDRLP4 24
INDIRP4
CNSTI4 5024
ADDP4
INDIRI4
CNSTI4 10
LEI4 $1085
line 2224
;2224:			bs->inventory[INVENTORY_SHELLS] > 10) return 50;
CNSTF4 1112014848
RETF4
ADDRGP4 $1059
JUMPV
LABELV $1085
line 2226
;2225:	//otherwise the bot is not feeling too good
;2226:	return 0;
CNSTF4 0
RETF4
LABELV $1059
endproc BotAggression 28 0
export BotFeelingBad
proc BotFeelingBad 0 0
line 2234
;2227:}
;2228:
;2229:/*
;2230:==================
;2231:BotFeelingBad
;2232:==================
;2233:*/
;2234:float BotFeelingBad(bot_state_t *bs) {
line 2236
;2235:
;2236:	if (g_instagib.integer == 0) {  // Shafe - Grrr... Instagib
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 0
NEI4 $1088
line 2238
;2237:	
;2238:		if (bs->weaponnum == WP_GAUNTLET) {
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1091
line 2239
;2239:			return 100;
CNSTF4 1120403456
RETF4
ADDRGP4 $1087
JUMPV
LABELV $1091
line 2241
;2240:		}
;2241:		if (bs->inventory[INVENTORY_HEALTH] < 40) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 40
GEI4 $1093
line 2242
;2242:			return 100;
CNSTF4 1120403456
RETF4
ADDRGP4 $1087
JUMPV
LABELV $1093
line 2244
;2243:		}
;2244:		if (bs->weaponnum == WP_MACHINEGUN) {
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1095
line 2245
;2245:			return 90;
CNSTF4 1119092736
RETF4
ADDRGP4 $1087
JUMPV
LABELV $1095
line 2247
;2246:		}
;2247:		if (bs->inventory[INVENTORY_HEALTH] < 60) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $1097
line 2248
;2248:			return 80;
CNSTF4 1117782016
RETF4
ADDRGP4 $1087
JUMPV
LABELV $1097
line 2250
;2249:		}
;2250:	} // End Shafe
LABELV $1088
line 2251
;2251:	return 0;
CNSTF4 0
RETF4
LABELV $1087
endproc BotFeelingBad 0 0
export BotWantsToRetreat
proc BotWantsToRetreat 144 8
line 2259
;2252:}
;2253:
;2254:/*
;2255:==================
;2256:BotWantsToRetreat
;2257:==================
;2258:*/
;2259:int BotWantsToRetreat(bot_state_t *bs) {
line 2262
;2260:	aas_entityinfo_t entinfo;
;2261:
;2262:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $1100
line 2264
;2263:		//always retreat when carrying a CTF flag
;2264:		if (BotCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $1101
line 2265
;2265:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1099
JUMPV
line 2266
;2266:	}
LABELV $1100
line 2268
;2267:#ifdef MISSIONPACK
;2268:	else if (gametype == GT_1FCTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 5
NEI4 $1104
line 2270
;2269:		//if carrying the flag then always retreat
;2270:		if (Bot1FCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 Bot1FCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $1105
line 2271
;2271:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1099
JUMPV
line 2272
;2272:	}
LABELV $1104
line 2273
;2273:	else if (gametype == GT_OBELISK) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $1108
line 2275
;2274:		//the bots should be dedicated to attacking the enemy obelisk
;2275:		if (bs->ltgtype == LTG_ATTACKENEMYBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 13
NEI4 $1110
line 2276
;2276:			if (bs->enemy != redobelisk.entitynum ||
ADDRLP4 140
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ASGNI4
ADDRLP4 140
INDIRI4
ADDRGP4 redobelisk+40
INDIRI4
NEI4 $1116
ADDRLP4 140
INDIRI4
ADDRGP4 blueobelisk+40
INDIRI4
EQI4 $1112
LABELV $1116
line 2277
;2277:						bs->enemy != blueobelisk.entitynum) {
line 2278
;2278:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1099
JUMPV
LABELV $1112
line 2280
;2279:			}
;2280:		}
LABELV $1110
line 2281
;2281:		if (BotFeelingBad(bs) > 50) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotFeelingBad
CALLF4
ASGNF4
ADDRLP4 140
INDIRF4
CNSTF4 1112014848
LEF4 $1117
line 2282
;2282:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1099
JUMPV
LABELV $1117
line 2284
;2283:		}
;2284:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1099
JUMPV
LABELV $1108
line 2286
;2285:	}
;2286:	else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $1119
line 2288
;2287:		//if carrying cubes then always retreat
;2288:		if (BotHarvesterCarryingCubes(bs)) return qtrue;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotHarvesterCarryingCubes
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $1121
CNSTI4 1
RETI4
ADDRGP4 $1099
JUMPV
LABELV $1121
line 2289
;2289:	}
LABELV $1119
LABELV $1105
LABELV $1101
line 2292
;2290:#endif
;2291:	//
;2292:	if (bs->enemy >= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 0
LTI4 $1123
line 2294
;2293:		//if the enemy is carrying a flag
;2294:		BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2295
;2295:		if (EntityCarriesFlag(&entinfo))
ADDRLP4 0
ARGP4
ADDRLP4 140
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $1125
line 2296
;2296:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1099
JUMPV
LABELV $1125
line 2297
;2297:	}
LABELV $1123
line 2299
;2298:	//if the bot is getting the flag
;2299:	if (bs->ltgtype == LTG_GETFLAG)
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
NEI4 $1127
line 2300
;2300:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1099
JUMPV
LABELV $1127
line 2302
;2301:	//
;2302:	if (BotAggression(bs) < 50)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotAggression
CALLF4
ASGNF4
ADDRLP4 140
INDIRF4
CNSTF4 1112014848
GEF4 $1129
line 2303
;2303:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1099
JUMPV
LABELV $1129
line 2304
;2304:	return qfalse;
CNSTI4 0
RETI4
LABELV $1099
endproc BotWantsToRetreat 144 8
export BotWantsToChase
proc BotWantsToChase 148 8
line 2312
;2305:}
;2306:
;2307:/*
;2308:==================
;2309:BotWantsToChase
;2310:==================
;2311:*/
;2312:int BotWantsToChase(bot_state_t *bs) {
line 2315
;2313:	aas_entityinfo_t entinfo;
;2314:
;2315:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $1132
line 2317
;2316:		//never chase when carrying a CTF flag
;2317:		if (BotCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $1134
line 2318
;2318:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1131
JUMPV
LABELV $1134
line 2320
;2319:		//always chase if the enemy is carrying a flag
;2320:		BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2321
;2321:		if (EntityCarriesFlag(&entinfo))
ADDRLP4 0
ARGP4
ADDRLP4 144
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $1133
line 2322
;2322:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1131
JUMPV
line 2323
;2323:	}
LABELV $1132
line 2325
;2324:#ifdef MISSIONPACK
;2325:	else if (gametype == GT_1FCTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 5
NEI4 $1138
line 2327
;2326:		//never chase if carrying the flag
;2327:		if (Bot1FCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 Bot1FCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $1140
line 2328
;2328:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1131
JUMPV
LABELV $1140
line 2330
;2329:		//always chase if the enemy is carrying a flag
;2330:		BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2331
;2331:		if (EntityCarriesFlag(&entinfo))
ADDRLP4 0
ARGP4
ADDRLP4 144
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $1139
line 2332
;2332:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1131
JUMPV
line 2333
;2333:	}
LABELV $1138
line 2334
;2334:	else if (gametype == GT_OBELISK) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $1144
line 2336
;2335:		//the bots should be dedicated to attacking the enemy obelisk
;2336:		if (bs->ltgtype == LTG_ATTACKENEMYBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 13
NEI4 $1145
line 2337
;2337:			if (bs->enemy != redobelisk.entitynum ||
ADDRLP4 140
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ASGNI4
ADDRLP4 140
INDIRI4
ADDRGP4 redobelisk+40
INDIRI4
NEI4 $1152
ADDRLP4 140
INDIRI4
ADDRGP4 blueobelisk+40
INDIRI4
EQI4 $1145
LABELV $1152
line 2338
;2338:						bs->enemy != blueobelisk.entitynum) {
line 2339
;2339:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1131
JUMPV
line 2341
;2340:			}
;2341:		}
line 2342
;2342:	}
LABELV $1144
line 2343
;2343:	else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $1153
line 2345
;2344:		//never chase if carrying cubes
;2345:		if (BotHarvesterCarryingCubes(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotHarvesterCarryingCubes
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $1155
line 2346
;2346:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1131
JUMPV
LABELV $1155
line 2347
;2347:	}
LABELV $1153
LABELV $1145
LABELV $1139
LABELV $1133
line 2350
;2348:#endif
;2349:	//if the bot is getting the flag
;2350:	if (bs->ltgtype == LTG_GETFLAG)
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
NEI4 $1157
line 2351
;2351:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1131
JUMPV
LABELV $1157
line 2353
;2352:	//
;2353:	if (BotAggression(bs) > 50)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotAggression
CALLF4
ASGNF4
ADDRLP4 140
INDIRF4
CNSTF4 1112014848
LEF4 $1159
line 2354
;2354:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1131
JUMPV
LABELV $1159
line 2355
;2355:	return qfalse;
CNSTI4 0
RETI4
LABELV $1131
endproc BotWantsToChase 148 8
export BotWantsToHelp
proc BotWantsToHelp 0 0
line 2363
;2356:}
;2357:
;2358:/*
;2359:==================
;2360:BotWantsToHelp
;2361:==================
;2362:*/
;2363:int BotWantsToHelp(bot_state_t *bs) {
line 2364
;2364:	return qtrue;
CNSTI4 1
RETI4
LABELV $1161
endproc BotWantsToHelp 0 0
export BotCanAndWantsToRocketJump
proc BotCanAndWantsToRocketJump 8 16
line 2372
;2365:}
;2366:
;2367:/*
;2368:==================
;2369:BotCanAndWantsToRocketJump
;2370:==================
;2371:*/
;2372:int BotCanAndWantsToRocketJump(bot_state_t *bs) {
line 2376
;2373:	float rocketjumper;
;2374:
;2375:	//if rocket jumping is disabled
;2376:	if (!bot_rocketjump.integer) return qfalse;
ADDRGP4 bot_rocketjump+12
INDIRI4
CNSTI4 0
NEI4 $1163
CNSTI4 0
RETI4
ADDRGP4 $1162
JUMPV
LABELV $1163
line 2378
;2377:	//if no rocket launcher
;2378:	if (bs->inventory[INVENTORY_ROCKETLAUNCHER] <= 0) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 4984
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1166
CNSTI4 0
RETI4
ADDRGP4 $1162
JUMPV
LABELV $1166
line 2380
;2379:	//if low on rockets
;2380:	if (bs->inventory[INVENTORY_ROCKETS] < 3) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 5044
ADDP4
INDIRI4
CNSTI4 3
GEI4 $1168
CNSTI4 0
RETI4
ADDRGP4 $1162
JUMPV
LABELV $1168
line 2382
;2381:	//never rocket jump with the Quad
;2382:	if (bs->inventory[INVENTORY_QUAD]) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 5092
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1170
CNSTI4 0
RETI4
ADDRGP4 $1162
JUMPV
LABELV $1170
line 2384
;2383:	//if low on health
;2384:	if (bs->inventory[INVENTORY_HEALTH] < 60) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $1172
CNSTI4 0
RETI4
ADDRGP4 $1162
JUMPV
LABELV $1172
line 2386
;2385:	//if not full health
;2386:	if (bs->inventory[INVENTORY_HEALTH] < 90) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 90
GEI4 $1174
line 2388
;2387:		//if the bot has insufficient armor
;2388:		if (bs->inventory[INVENTORY_ARMOR] < 40) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 4956
ADDP4
INDIRI4
CNSTI4 40
GEI4 $1176
CNSTI4 0
RETI4
ADDRGP4 $1162
JUMPV
LABELV $1176
line 2389
;2389:	}
LABELV $1174
line 2390
;2390:	rocketjumper = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_WEAPONJUMPING, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 38
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 4
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 2391
;2391:	if (rocketjumper < 0.5) return qfalse;
ADDRLP4 0
INDIRF4
CNSTF4 1056964608
GEF4 $1178
CNSTI4 0
RETI4
ADDRGP4 $1162
JUMPV
LABELV $1178
line 2392
;2392:	return qtrue;
CNSTI4 1
RETI4
LABELV $1162
endproc BotCanAndWantsToRocketJump 8 16
export BotHasPersistantPowerupAndWeapon
proc BotHasPersistantPowerupAndWeapon 40 0
line 2400
;2393:}
;2394:
;2395:/*
;2396:==================
;2397:BotHasPersistantPowerupAndWeapon
;2398:==================
;2399:*/
;2400:int BotHasPersistantPowerupAndWeapon(bot_state_t *bs) {
line 2403
;2401:#ifdef MISSIONPACK
;2402:	// if the bot does not have a persistant powerup
;2403:	if (!bs->inventory[INVENTORY_SCOUT] &&
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 5116
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $1181
ADDRLP4 0
INDIRP4
CNSTI4 5120
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $1181
ADDRLP4 0
INDIRP4
CNSTI4 5124
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $1181
ADDRLP4 0
INDIRP4
CNSTI4 5128
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $1181
line 2406
;2404:		!bs->inventory[INVENTORY_GUARD] &&
;2405:		!bs->inventory[INVENTORY_DOUBLER] &&
;2406:		!bs->inventory[INVENTORY_AMMOREGEN] ) {
line 2407
;2407:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1180
JUMPV
LABELV $1181
line 2411
;2408:	}
;2409:#endif
;2410:	//if the bot is very low on health
;2411:	if (bs->inventory[INVENTORY_HEALTH] < 60) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $1183
CNSTI4 0
RETI4
ADDRGP4 $1180
JUMPV
LABELV $1183
line 2413
;2412:	//if the bot is low on health
;2413:	if (bs->inventory[INVENTORY_HEALTH] < 80) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 80
GEI4 $1185
line 2415
;2414:		//if the bot has insufficient armor
;2415:		if (bs->inventory[INVENTORY_ARMOR] < 40) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 4956
ADDP4
INDIRI4
CNSTI4 40
GEI4 $1187
CNSTI4 0
RETI4
ADDRGP4 $1180
JUMPV
LABELV $1187
line 2416
;2416:	}
LABELV $1185
line 2418
;2417:	//if the bot can use the bfg
;2418:	if (bs->inventory[INVENTORY_BFG10K] > 0 &&
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 5004
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1189
ADDRLP4 8
INDIRP4
CNSTI4 5052
ADDP4
INDIRI4
CNSTI4 7
LEI4 $1189
line 2419
;2419:			bs->inventory[INVENTORY_BFGAMMO] > 7) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1180
JUMPV
LABELV $1189
line 2421
;2420:	//if the bot can use the railgun
;2421:	if (bs->inventory[INVENTORY_RAILGUN] > 0 &&
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 4992
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1191
ADDRLP4 12
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
CNSTI4 5
LEI4 $1191
line 2422
;2422:			bs->inventory[INVENTORY_SLUGS] > 5) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1180
JUMPV
LABELV $1191
line 2424
;2423:	//if the bot can use the lightning gun
;2424:	if (bs->inventory[INVENTORY_LIGHTNING] > 0 &&
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 4988
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1193
ADDRLP4 16
INDIRP4
CNSTI4 5040
ADDP4
INDIRI4
CNSTI4 50
LEI4 $1193
line 2425
;2425:			bs->inventory[INVENTORY_LIGHTNINGAMMO] > 50) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1180
JUMPV
LABELV $1193
line 2427
;2426:	//if the bot can use the rocketlauncher
;2427:	if (bs->inventory[INVENTORY_ROCKETLAUNCHER] > 0 &&
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 4984
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1195
ADDRLP4 20
INDIRP4
CNSTI4 5044
ADDP4
INDIRI4
CNSTI4 5
LEI4 $1195
line 2428
;2428:			bs->inventory[INVENTORY_ROCKETS] > 5) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1180
JUMPV
LABELV $1195
line 2430
;2429:	//
;2430:	if (bs->inventory[INVENTORY_NAILGUN] > 0 &&
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 5012
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1197
ADDRLP4 24
INDIRP4
CNSTI4 5056
ADDP4
INDIRI4
CNSTI4 5
LEI4 $1197
line 2431
;2431:			bs->inventory[INVENTORY_NAILS] > 5) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1180
JUMPV
LABELV $1197
line 2433
;2432:	//
;2433:	if (bs->inventory[INVENTORY_PROXLAUNCHER] > 0 &&
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 5016
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1199
ADDRLP4 28
INDIRP4
CNSTI4 5060
ADDP4
INDIRI4
CNSTI4 5
LEI4 $1199
line 2434
;2434:			bs->inventory[INVENTORY_MINES] > 5) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1180
JUMPV
LABELV $1199
line 2436
;2435:	//
;2436:	if (bs->inventory[INVENTORY_CHAINGUN] > 0 &&
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 5020
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1201
ADDRLP4 32
INDIRP4
CNSTI4 5064
ADDP4
INDIRI4
CNSTI4 40
LEI4 $1201
line 2437
;2437:			bs->inventory[INVENTORY_BELT] > 40) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1180
JUMPV
LABELV $1201
line 2439
;2438:	//if the bot can use the plasmagun
;2439:	if (bs->inventory[INVENTORY_PLASMAGUN] > 0 &&
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 4996
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1203
ADDRLP4 36
INDIRP4
CNSTI4 5036
ADDP4
INDIRI4
CNSTI4 20
LEI4 $1203
line 2440
;2440:			bs->inventory[INVENTORY_CELLS] > 20) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1180
JUMPV
LABELV $1203
line 2441
;2441:	return qfalse;
CNSTI4 0
RETI4
LABELV $1180
endproc BotHasPersistantPowerupAndWeapon 40 0
export BotGoCamp
proc BotGoCamp 16 16
line 2449
;2442:}
;2443:
;2444:/*
;2445:==================
;2446:BotGoCamp
;2447:==================
;2448:*/
;2449:void BotGoCamp(bot_state_t *bs, bot_goal_t *goal) {
line 2452
;2450:	float camper;
;2451:
;2452:	bs->decisionmaker = bs->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 2454
;2453:	//set message time to zero so bot will NOT show any message
;2454:	bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 2456
;2455:	//set the ltg type
;2456:	bs->ltgtype = LTG_CAMP;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 7
ASGNI4
line 2458
;2457:	//set the team goal
;2458:	memcpy(&bs->teamgoal, goal, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2460
;2459:	//get the team goal time
;2460:	camper = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CAMPER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 44
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 8
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 2461
;2461:	if (camper > 0.99) bs->teamgoal_time = FloatTime() + 99999;
ADDRLP4 0
INDIRF4
CNSTF4 1065185444
LEF4 $1206
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1203982208
ADDF4
ASGNF4
ADDRGP4 $1207
JUMPV
LABELV $1206
line 2462
;2462:	else bs->teamgoal_time = FloatTime() + 120 + 180 * camper + random() * 15;
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
CNSTF4 1127481344
ADDRLP4 0
INDIRF4
MULF4
ADDF4
CNSTF4 1097859072
ADDRLP4 12
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
LABELV $1207
line 2464
;2463:	//set the last time the bot started camping
;2464:	bs->camp_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6184
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2466
;2465:	//the teammate that requested the camping
;2466:	bs->teammate = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
CNSTI4 0
ASGNI4
line 2468
;2467:	//do NOT type arrive message
;2468:	bs->arrive_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
CNSTF4 1065353216
ASGNF4
line 2469
;2469:}
LABELV $1205
endproc BotGoCamp 16 16
export BotWantsToCamp
proc BotWantsToCamp 176 16
line 2476
;2470:
;2471:/*
;2472:==================
;2473:BotWantsToCamp
;2474:==================
;2475:*/
;2476:int BotWantsToCamp(bot_state_t *bs) {
line 2481
;2477:	float camper;
;2478:	int cs, traveltime, besttraveltime;
;2479:	bot_goal_t goal, bestgoal;
;2480:
;2481:	camper = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CAMPER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 44
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 128
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 124
ADDRLP4 128
INDIRF4
ASGNF4
line 2482
;2482:	if (camper < 0.1) return qfalse;
ADDRLP4 124
INDIRF4
CNSTF4 1036831949
GEF4 $1209
CNSTI4 0
RETI4
ADDRGP4 $1208
JUMPV
LABELV $1209
line 2484
;2483:	//if the bot has a team goal
;2484:	if (bs->ltgtype == LTG_TEAMHELP ||
ADDRLP4 132
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 1
EQI4 $1219
ADDRLP4 132
INDIRI4
CNSTI4 2
EQI4 $1219
ADDRLP4 132
INDIRI4
CNSTI4 3
EQI4 $1219
ADDRLP4 132
INDIRI4
CNSTI4 4
EQI4 $1219
ADDRLP4 132
INDIRI4
CNSTI4 5
EQI4 $1219
ADDRLP4 132
INDIRI4
CNSTI4 7
EQI4 $1219
ADDRLP4 132
INDIRI4
CNSTI4 8
EQI4 $1219
ADDRLP4 132
INDIRI4
CNSTI4 9
NEI4 $1211
LABELV $1219
line 2491
;2485:			bs->ltgtype == LTG_TEAMACCOMPANY ||
;2486:			bs->ltgtype == LTG_DEFENDKEYAREA ||
;2487:			bs->ltgtype == LTG_GETFLAG ||
;2488:			bs->ltgtype == LTG_RUSHBASE ||
;2489:			bs->ltgtype == LTG_CAMP ||
;2490:			bs->ltgtype == LTG_CAMPORDER ||
;2491:			bs->ltgtype == LTG_PATROL) {
line 2492
;2492:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1208
JUMPV
LABELV $1211
line 2495
;2493:	}
;2494:	//if camped recently
;2495:	if (bs->camp_time > FloatTime() - 60 + 300 * (1-camper)) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6184
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1114636288
SUBF4
CNSTF4 1133903872
CNSTF4 1065353216
ADDRLP4 124
INDIRF4
SUBF4
MULF4
ADDF4
LEF4 $1220
CNSTI4 0
RETI4
ADDRGP4 $1208
JUMPV
LABELV $1220
line 2497
;2496:	//
;2497:	if (random() > camper) {
ADDRLP4 136
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 124
INDIRF4
LEF4 $1222
line 2498
;2498:		bs->camp_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6184
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2499
;2499:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1208
JUMPV
LABELV $1222
line 2502
;2500:	}
;2501:	//if the bot isn't healthy anough
;2502:	if (BotAggression(bs) < 50) return qfalse;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotAggression
CALLF4
ASGNF4
ADDRLP4 140
INDIRF4
CNSTF4 1112014848
GEF4 $1224
CNSTI4 0
RETI4
ADDRGP4 $1208
JUMPV
LABELV $1224
line 2504
;2503:	//the bot should have at least have the rocket launcher, the railgun or the bfg10k with some ammo
;2504:	if ((bs->inventory[INVENTORY_ROCKETLAUNCHER] <= 0 || bs->inventory[INVENTORY_ROCKETS < 10]) &&
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
CNSTI4 0
ASGNI4
ADDRLP4 144
INDIRP4
CNSTI4 4984
ADDP4
INDIRI4
ADDRLP4 148
INDIRI4
LEI4 $1228
ADDRLP4 144
INDIRP4
CNSTI4 4952
ADDP4
INDIRI4
ADDRLP4 148
INDIRI4
EQI4 $1226
LABELV $1228
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
CNSTI4 4992
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1229
ADDRLP4 152
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
CNSTI4 10
GEI4 $1226
LABELV $1229
ADDRLP4 156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 156
INDIRP4
CNSTI4 5004
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1230
ADDRLP4 156
INDIRP4
CNSTI4 5052
ADDP4
INDIRI4
CNSTI4 10
GEI4 $1226
LABELV $1230
line 2506
;2505:		(bs->inventory[INVENTORY_RAILGUN] <= 0 || bs->inventory[INVENTORY_SLUGS] < 10) &&
;2506:		(bs->inventory[INVENTORY_BFG10K] <= 0 || bs->inventory[INVENTORY_BFGAMMO] < 10)) {
line 2507
;2507:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1208
JUMPV
LABELV $1226
line 2510
;2508:	}
;2509:	//find the closest camp spot
;2510:	besttraveltime = 99999;
ADDRLP4 64
CNSTI4 99999
ASGNI4
line 2511
;2511:	for (cs = trap_BotGetNextCampSpotGoal(0, &goal); cs; cs = trap_BotGetNextCampSpotGoal(cs, &goal)) {
CNSTI4 0
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 160
ADDRGP4 trap_BotGetNextCampSpotGoal
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 160
INDIRI4
ASGNI4
ADDRGP4 $1234
JUMPV
LABELV $1231
line 2512
;2512:		traveltime = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, goal.areanum, TFL_DEFAULT);
ADDRLP4 164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 164
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 164
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 8+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 168
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 168
INDIRI4
ASGNI4
line 2513
;2513:		if (traveltime && traveltime < besttraveltime) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1236
ADDRLP4 0
INDIRI4
ADDRLP4 64
INDIRI4
GEI4 $1236
line 2514
;2514:			besttraveltime = traveltime;
ADDRLP4 64
ADDRLP4 0
INDIRI4
ASGNI4
line 2515
;2515:			memcpy(&bestgoal, &goal, sizeof(bot_goal_t));
ADDRLP4 68
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2516
;2516:		}
LABELV $1236
line 2517
;2517:	}
LABELV $1232
line 2511
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 164
ADDRGP4 trap_BotGetNextCampSpotGoal
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 164
INDIRI4
ASGNI4
LABELV $1234
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1231
line 2518
;2518:	if (besttraveltime > 150) return qfalse;
ADDRLP4 64
INDIRI4
CNSTI4 150
LEI4 $1238
CNSTI4 0
RETI4
ADDRGP4 $1208
JUMPV
LABELV $1238
line 2520
;2519:	//ok found a camp spot, go camp there
;2520:	BotGoCamp(bs, &bestgoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 BotGoCamp
CALLV
pop
line 2521
;2521:	bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 2523
;2522:	//
;2523:	return qtrue;
CNSTI4 1
RETI4
LABELV $1208
endproc BotWantsToCamp 176 16
export BotDontAvoid
proc BotDontAvoid 68 12
line 2531
;2524:}
;2525:
;2526:/*
;2527:==================
;2528:BotDontAvoid
;2529:==================
;2530:*/
;2531:void BotDontAvoid(bot_state_t *bs, char *itemname) {
line 2535
;2532:	bot_goal_t goal;
;2533:	int num;
;2534:
;2535:	num = trap_BotGetLevelItemGoal(-1, itemname, &goal);
CNSTI4 -1
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 60
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 60
INDIRI4
ASGNI4
ADDRGP4 $1242
JUMPV
LABELV $1241
line 2536
;2536:	while(num >= 0) {
line 2537
;2537:		trap_BotRemoveFromAvoidGoals(bs->gs, goal.number);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 4+44
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveFromAvoidGoals
CALLV
pop
line 2538
;2538:		num = trap_BotGetLevelItemGoal(num, itemname, &goal);
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 64
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 64
INDIRI4
ASGNI4
line 2539
;2539:	}
LABELV $1242
line 2536
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1241
line 2540
;2540:}
LABELV $1240
endproc BotDontAvoid 68 12
export BotGoForPowerups
proc BotGoForPowerups 0 8
line 2547
;2541:
;2542:/*
;2543:==================
;2544:BotGoForPowerups
;2545:==================
;2546:*/
;2547:void BotGoForPowerups(bot_state_t *bs) {
line 2550
;2548:
;2549:	//don't avoid any of the powerups anymore
;2550:	BotDontAvoid(bs, "Quad Damage");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1246
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2551
;2551:	BotDontAvoid(bs, "Regeneration");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1247
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2552
;2552:	BotDontAvoid(bs, "Battle Suit");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1248
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2553
;2553:	BotDontAvoid(bs, "Speed");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1249
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2554
;2554:	BotDontAvoid(bs, "Invisibility");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1250
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2558
;2555:	//BotDontAvoid(bs, "Flight");
;2556:	//reset the long term goal time so the bot will go for the powerup
;2557:	//NOTE: the long term goal type doesn't change
;2558:	bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6068
ADDP4
CNSTF4 0
ASGNF4
line 2559
;2559:}
LABELV $1245
endproc BotGoForPowerups 0 8
export BotRoamGoal
proc BotRoamGoal 180 28
line 2566
;2560:
;2561:/*
;2562:==================
;2563:BotRoamGoal
;2564:==================
;2565:*/
;2566:void BotRoamGoal(bot_state_t *bs, vec3_t goal) {
line 2572
;2567:	int pc, i;
;2568:	float len, rnd;
;2569:	vec3_t dir, bestorg, belowbestorg;
;2570:	bsp_trace_t trace;
;2571:
;2572:	for (i = 0; i < 10; i++) {
ADDRLP4 116
CNSTI4 0
ASGNI4
LABELV $1252
line 2574
;2573:		//start at the bot origin
;2574:		VectorCopy(bs->origin, bestorg);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 2575
;2575:		rnd = random();
ADDRLP4 136
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 112
ADDRLP4 136
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ASGNF4
line 2576
;2576:		if (rnd > 0.25) {
ADDRLP4 112
INDIRF4
CNSTF4 1048576000
LEF4 $1256
line 2578
;2577:			//add a random value to the x-coordinate
;2578:			if (random() < 0.5) bestorg[0] -= 800 * random() + 100;
ADDRLP4 140
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
GEF4 $1258
ADDRLP4 144
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 12
INDIRF4
CNSTF4 1145569280
ADDRLP4 144
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1120403456
ADDF4
SUBF4
ASGNF4
ADDRGP4 $1259
JUMPV
LABELV $1258
line 2579
;2579:			else bestorg[0] += 800 * random() + 100;
ADDRLP4 148
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 12
INDIRF4
CNSTF4 1145569280
ADDRLP4 148
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1120403456
ADDF4
ADDF4
ASGNF4
LABELV $1259
line 2580
;2580:		}
LABELV $1256
line 2581
;2581:		if (rnd < 0.75) {
ADDRLP4 112
INDIRF4
CNSTF4 1061158912
GEF4 $1260
line 2583
;2582:			//add a random value to the y-coordinate
;2583:			if (random() < 0.5) bestorg[1] -= 800 * random() + 100;
ADDRLP4 140
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
GEF4 $1262
ADDRLP4 144
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
CNSTF4 1145569280
ADDRLP4 144
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1120403456
ADDF4
SUBF4
ASGNF4
ADDRGP4 $1263
JUMPV
LABELV $1262
line 2584
;2584:			else bestorg[1] += 800 * random() + 100;
ADDRLP4 148
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
CNSTF4 1145569280
ADDRLP4 148
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1120403456
ADDF4
ADDF4
ASGNF4
LABELV $1263
line 2585
;2585:		}
LABELV $1260
line 2587
;2586:		//add a random value to the z-coordinate (NOTE: 48 = maxjump?)
;2587:		bestorg[2] += 2 * 48 * crandom();
ADDRLP4 140
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1119879168
CNSTF4 1073741824
ADDRLP4 140
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 2589
;2588:		//trace a line from the origin to the roam target
;2589:		BotAI_Trace(&trace, bs->origin, NULL, NULL, bestorg, bs->entitynum, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 148
CNSTP4 0
ASGNP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2591
;2590:		//direction and length towards the roam target
;2591:		VectorSubtract(trace.endpos, bs->origin, dir);
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 24+12
INDIRF4
ADDRLP4 152
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 24+12+4
INDIRF4
ADDRLP4 152
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 24+12+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2592
;2592:		len = VectorNormalize(dir);
ADDRLP4 0
ARGP4
ADDRLP4 156
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 108
ADDRLP4 156
INDIRF4
ASGNF4
line 2594
;2593:		//if the roam target is far away anough
;2594:		if (len > 200) {
ADDRLP4 108
INDIRF4
CNSTF4 1128792064
LEF4 $1274
line 2596
;2595:			//the roam target is in the given direction before walls
;2596:			VectorScale(dir, len * trace.fraction - 40, dir);
ADDRLP4 164
CNSTF4 1109393408
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
ADDRLP4 164
INDIRF4
SUBF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
ADDRLP4 164
INDIRF4
SUBF4
MULF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
CNSTF4 1109393408
SUBF4
MULF4
ASGNF4
line 2597
;2597:			VectorAdd(bs->origin, dir, bestorg);
ADDRLP4 168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 168
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 168
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDF4
ASGNF4
line 2599
;2598:			//get the coordinates of the floor below the roam target
;2599:			belowbestorg[0] = bestorg[0];
ADDRLP4 120
ADDRLP4 12
INDIRF4
ASGNF4
line 2600
;2600:			belowbestorg[1] = bestorg[1];
ADDRLP4 120+4
ADDRLP4 12+4
INDIRF4
ASGNF4
line 2601
;2601:			belowbestorg[2] = bestorg[2] - 800;
ADDRLP4 120+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1145569280
SUBF4
ASGNF4
line 2602
;2602:			BotAI_Trace(&trace, bestorg, NULL, NULL, belowbestorg, bs->entitynum, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 172
CNSTP4 0
ASGNP4
ADDRLP4 172
INDIRP4
ARGP4
ADDRLP4 172
INDIRP4
ARGP4
ADDRLP4 120
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2604
;2603:			//
;2604:			if (!trace.startsolid) {
ADDRLP4 24+4
INDIRI4
CNSTI4 0
NEI4 $1291
line 2605
;2605:				trace.endpos[2]++;
ADDRLP4 24+12+8
ADDRLP4 24+12+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2606
;2606:				pc = trap_PointContents(trace.endpos, bs->entitynum);
ADDRLP4 24+12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 176
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 132
ADDRLP4 176
INDIRI4
ASGNI4
line 2607
;2607:				if (!(pc & (CONTENTS_LAVA | CONTENTS_SLIME))) {
ADDRLP4 132
INDIRI4
CNSTI4 24
BANDI4
CNSTI4 0
NEI4 $1297
line 2608
;2608:					VectorCopy(bestorg, goal);
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRB
ASGNB 12
line 2609
;2609:					return;
ADDRGP4 $1251
JUMPV
LABELV $1297
line 2611
;2610:				}
;2611:			}
LABELV $1291
line 2612
;2612:		}
LABELV $1274
line 2613
;2613:	}
LABELV $1253
line 2572
ADDRLP4 116
ADDRLP4 116
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 10
LTI4 $1252
line 2614
;2614:	VectorCopy(bestorg, goal);
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRB
ASGNB 12
line 2615
;2615:}
LABELV $1251
endproc BotRoamGoal 180 28
lit
align 4
LABELV $1301
byte 4 0
byte 4 0
byte 4 1065353216
export BotAttackMove
code
proc BotAttackMove 392 16
line 2622
;2616:
;2617:/*
;2618:==================
;2619:BotAttackMove
;2620:==================
;2621:*/
;2622:bot_moveresult_t BotAttackMove(bot_state_t *bs, int tfl) {
line 2626
;2623:	int movetype, i, attackentity;
;2624:	float attack_skill, jumper, croucher, dist, strafechange_time;
;2625:	float attack_dist, attack_range;
;2626:	vec3_t forward, backward, sideward, hordir, up = {0, 0, 1};
ADDRLP4 56
ADDRGP4 $1301
INDIRB
ASGNB 12
line 2631
;2627:	aas_entityinfo_t entinfo;
;2628:	bot_moveresult_t moveresult;
;2629:	bot_goal_t goal;
;2630:
;2631:	attackentity = bs->enemy;
ADDRLP4 332
ADDRFP4 4
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ASGNI4
line 2633
;2632:	//
;2633:	if (bs->attackchase_time > FloatTime()) {
ADDRFP4 4
INDIRP4
CNSTI4 6124
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $1302
line 2635
;2634:		//create the chase goal
;2635:		goal.entitynum = attackentity;
ADDRLP4 136+40
ADDRLP4 332
INDIRI4
ASGNI4
line 2636
;2636:		goal.areanum = bs->lastenemyareanum;
ADDRLP4 136+12
ADDRFP4 4
INDIRP4
CNSTI4 6544
ADDP4
INDIRI4
ASGNI4
line 2637
;2637:		VectorCopy(bs->lastenemyorigin, goal.origin);
ADDRLP4 136
ADDRFP4 4
INDIRP4
CNSTI4 6548
ADDP4
INDIRB
ASGNB 12
line 2638
;2638:		VectorSet(goal.mins, -8, -8, -8);
ADDRLP4 136+16
CNSTF4 3238002688
ASGNF4
ADDRLP4 136+16+4
CNSTF4 3238002688
ASGNF4
ADDRLP4 136+16+8
CNSTF4 3238002688
ASGNF4
line 2639
;2639:		VectorSet(goal.maxs, 8, 8, 8);
ADDRLP4 136+28
CNSTF4 1090519040
ASGNF4
ADDRLP4 136+28+4
CNSTF4 1090519040
ASGNF4
ADDRLP4 136+28+8
CNSTF4 1090519040
ASGNF4
line 2641
;2640:		//initialize the movement state
;2641:		BotSetupForMovement(bs);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 2643
;2642:		//move towards the goal
;2643:		trap_BotMoveToGoal(&moveresult, bs->ms, &goal, tfl);
ADDRLP4 80
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 136
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 trap_BotMoveToGoal
CALLV
pop
line 2644
;2644:		return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $1299
JUMPV
LABELV $1302
line 2647
;2645:	}
;2646:	//
;2647:	memset(&moveresult, 0, sizeof(bot_moveresult_t));
ADDRLP4 80
ARGP4
CNSTI4 0
ARGI4
CNSTI4 52
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2649
;2648:	//
;2649:	attack_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_ATTACK_SKILL, 0, 1);
ADDRFP4 4
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 348
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 132
ADDRLP4 348
INDIRF4
ASGNF4
line 2650
;2650:	jumper = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_JUMPER, 0, 1);
ADDRFP4 4
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 37
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 352
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 340
ADDRLP4 352
INDIRF4
ASGNF4
line 2651
;2651:	croucher = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CROUCHER, 0, 1);
ADDRFP4 4
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 36
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 356
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 344
ADDRLP4 356
INDIRF4
ASGNF4
line 2653
;2652:	//if the bot is really stupid
;2653:	if (attack_skill < 0.2) return moveresult;
ADDRLP4 132
INDIRF4
CNSTF4 1045220557
GEF4 $1316
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $1299
JUMPV
LABELV $1316
line 2655
;2654:	//initialize the movement state
;2655:	BotSetupForMovement(bs);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 2657
;2656:	//get the enemy entity info
;2657:	BotEntityInfo(attackentity, &entinfo);
ADDRLP4 332
INDIRI4
ARGI4
ADDRLP4 192
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2659
;2658:	//direction towards the enemy
;2659:	VectorSubtract(entinfo.origin, bs->origin, forward);
ADDRLP4 360
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 192+24
INDIRF4
ADDRLP4 360
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 192+24+4
INDIRF4
ADDRLP4 360
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 192+24+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2661
;2660:	//the distance towards the enemy
;2661:	dist = VectorNormalize(forward);
ADDRLP4 24
ARGP4
ADDRLP4 364
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 68
ADDRLP4 364
INDIRF4
ASGNF4
line 2662
;2662:	VectorNegate(forward, backward);
ADDRLP4 36
ADDRLP4 24
INDIRF4
NEGF4
ASGNF4
ADDRLP4 36+4
ADDRLP4 24+4
INDIRF4
NEGF4
ASGNF4
ADDRLP4 36+8
ADDRLP4 24+8
INDIRF4
NEGF4
ASGNF4
line 2664
;2663:	//walk, crouch or jump
;2664:	movetype = MOVE_WALK;
ADDRLP4 52
CNSTI4 1
ASGNI4
line 2666
;2665:	//
;2666:	if (bs->attackcrouch_time < FloatTime() - 1) {
ADDRFP4 4
INDIRP4
CNSTI4 6120
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
GEF4 $1329
line 2667
;2667:		if (random() < jumper) {
ADDRLP4 368
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 340
INDIRF4
GEF4 $1331
line 2668
;2668:			movetype = MOVE_JUMP;
ADDRLP4 52
CNSTI4 4
ASGNI4
line 2669
;2669:		}
ADDRGP4 $1332
JUMPV
LABELV $1331
line 2671
;2670:		//wait at least one second before crouching again
;2671:		else if (bs->attackcrouch_time < FloatTime() - 1 && random() < croucher) {
ADDRFP4 4
INDIRP4
CNSTI4 6120
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
GEF4 $1333
ADDRLP4 372
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 372
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 344
INDIRF4
GEF4 $1333
line 2672
;2672:			bs->attackcrouch_time = FloatTime() + croucher * 5;
ADDRFP4 4
INDIRP4
CNSTI4 6120
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDRLP4 344
INDIRF4
MULF4
ADDF4
ASGNF4
line 2673
;2673:		}
LABELV $1333
LABELV $1332
line 2674
;2674:	}
LABELV $1329
line 2675
;2675:	if (bs->attackcrouch_time > FloatTime()) movetype = MOVE_CROUCH;
ADDRFP4 4
INDIRP4
CNSTI4 6120
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $1335
ADDRLP4 52
CNSTI4 2
ASGNI4
LABELV $1335
line 2677
;2676:	//if the bot should jump
;2677:	if (movetype == MOVE_JUMP) {
ADDRLP4 52
INDIRI4
CNSTI4 4
NEI4 $1337
line 2679
;2678:		//if jumped last frame
;2679:		if (bs->attackjump_time > FloatTime()) {
ADDRFP4 4
INDIRP4
CNSTI4 6128
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $1339
line 2680
;2680:			movetype = MOVE_WALK;
ADDRLP4 52
CNSTI4 1
ASGNI4
line 2681
;2681:		}
ADDRGP4 $1340
JUMPV
LABELV $1339
line 2682
;2682:		else {
line 2683
;2683:			bs->attackjump_time = FloatTime() + 1;
ADDRFP4 4
INDIRP4
CNSTI4 6128
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2684
;2684:		}
LABELV $1340
line 2685
;2685:	}
LABELV $1337
line 2686
;2686:	if (bs->cur_ps.weapon == WP_GAUNTLET) {
ADDRFP4 4
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1341
line 2687
;2687:		attack_dist = 0;
ADDRLP4 72
CNSTF4 0
ASGNF4
line 2688
;2688:		attack_range = 0;
ADDRLP4 76
CNSTF4 0
ASGNF4
line 2689
;2689:	}
ADDRGP4 $1342
JUMPV
LABELV $1341
line 2690
;2690:	else {
line 2691
;2691:		attack_dist = IDEAL_ATTACKDIST;
ADDRLP4 72
CNSTF4 1124859904
ASGNF4
line 2692
;2692:		attack_range = 40;
ADDRLP4 76
CNSTF4 1109393408
ASGNF4
line 2693
;2693:	}
LABELV $1342
line 2695
;2694:	//if the bot is stupid
;2695:	if (attack_skill <= 0.4) {
ADDRLP4 132
INDIRF4
CNSTF4 1053609165
GTF4 $1343
line 2697
;2696:		//just walk to or away from the enemy
;2697:		if (dist > attack_dist + attack_range) {
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
LEF4 $1345
line 2698
;2698:			if (trap_BotMoveInDirection(bs->ms, forward, 400, movetype)) return moveresult;
ADDRFP4 4
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 368
ADDRGP4 trap_BotMoveInDirection
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 0
EQI4 $1347
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $1299
JUMPV
LABELV $1347
line 2699
;2699:		}
LABELV $1345
line 2700
;2700:		if (dist < attack_dist - attack_range) {
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRF4
SUBF4
GEF4 $1349
line 2701
;2701:			if (trap_BotMoveInDirection(bs->ms, backward, 400, movetype)) return moveresult;
ADDRFP4 4
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 368
ADDRGP4 trap_BotMoveInDirection
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 0
EQI4 $1351
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $1299
JUMPV
LABELV $1351
line 2702
;2702:		}
LABELV $1349
line 2703
;2703:		return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $1299
JUMPV
LABELV $1343
line 2706
;2704:	}
;2705:	//increase the strafe time
;2706:	bs->attackstrafe_time += bs->thinktime;
ADDRLP4 368
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 372
ADDRLP4 368
INDIRP4
CNSTI4 6116
ADDP4
ASGNP4
ADDRLP4 372
INDIRP4
ADDRLP4 372
INDIRP4
INDIRF4
ADDRLP4 368
INDIRP4
CNSTI4 4904
ADDP4
INDIRF4
ADDF4
ASGNF4
line 2708
;2707:	//get the strafe change time
;2708:	strafechange_time = 0.4 + (1 - attack_skill) * 0.2;
ADDRLP4 336
CNSTF4 1045220557
CNSTF4 1065353216
ADDRLP4 132
INDIRF4
SUBF4
MULF4
CNSTF4 1053609165
ADDF4
ASGNF4
line 2709
;2709:	if (attack_skill > 0.7) strafechange_time += crandom() * 0.2;
ADDRLP4 132
INDIRF4
CNSTF4 1060320051
LEF4 $1353
ADDRLP4 376
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 336
ADDRLP4 336
INDIRF4
CNSTF4 1045220557
CNSTF4 1073741824
ADDRLP4 376
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
LABELV $1353
line 2711
;2710:	//if the strafe direction should be changed
;2711:	if (bs->attackstrafe_time > strafechange_time) {
ADDRFP4 4
INDIRP4
CNSTI4 6116
ADDP4
INDIRF4
ADDRLP4 336
INDIRF4
LEF4 $1355
line 2713
;2712:		//some magic number :)
;2713:		if (random() > 0.935) {
ADDRLP4 380
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 380
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1064262697
LEF4 $1357
line 2715
;2714:			//flip the strafe direction
;2715:			bs->flags ^= BFL_STRAFERIGHT;
ADDRLP4 384
ADDRFP4 4
INDIRP4
CNSTI4 5980
ADDP4
ASGNP4
ADDRLP4 384
INDIRP4
ADDRLP4 384
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 2716
;2716:			bs->attackstrafe_time = 0;
ADDRFP4 4
INDIRP4
CNSTI4 6116
ADDP4
CNSTF4 0
ASGNF4
line 2717
;2717:		}
LABELV $1357
line 2718
;2718:	}
LABELV $1355
line 2720
;2719:	//
;2720:	for (i = 0; i < 2; i++) {
ADDRLP4 48
CNSTI4 0
ASGNI4
LABELV $1359
line 2721
;2721:		hordir[0] = forward[0];
ADDRLP4 12
ADDRLP4 24
INDIRF4
ASGNF4
line 2722
;2722:		hordir[1] = forward[1];
ADDRLP4 12+4
ADDRLP4 24+4
INDIRF4
ASGNF4
line 2723
;2723:		hordir[2] = 0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 2724
;2724:		VectorNormalize(hordir);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2726
;2725:		//get the sideward vector
;2726:		CrossProduct(hordir, up, sideward);
ADDRLP4 12
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 2728
;2727:		//reverse the vector depending on the strafe direction
;2728:		if (bs->flags & BFL_STRAFERIGHT) VectorNegate(sideward, sideward);
ADDRFP4 4
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1366
ADDRLP4 0
ADDRLP4 0
INDIRF4
NEGF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
NEGF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
NEGF4
ASGNF4
LABELV $1366
line 2730
;2729:		//randomly go back a little
;2730:		if (random() > 0.9) {
ADDRLP4 380
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 380
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1063675494
LEF4 $1372
line 2731
;2731:			VectorAdd(sideward, backward, sideward);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDF4
ASGNF4
line 2732
;2732:		}
ADDRGP4 $1373
JUMPV
LABELV $1372
line 2733
;2733:		else {
line 2735
;2734:			//walk forward or backward to get at the ideal attack distance
;2735:			if (dist > attack_dist + attack_range) {
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
LEF4 $1380
line 2736
;2736:				VectorAdd(sideward, forward, sideward);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 24+8
INDIRF4
ADDF4
ASGNF4
line 2737
;2737:			}
ADDRGP4 $1381
JUMPV
LABELV $1380
line 2738
;2738:			else if (dist < attack_dist - attack_range) {
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRF4
SUBF4
GEF4 $1388
line 2739
;2739:				VectorAdd(sideward, backward, sideward);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDF4
ASGNF4
line 2740
;2740:			}
LABELV $1388
LABELV $1381
line 2741
;2741:		}
LABELV $1373
line 2743
;2742:		//perform the movement
;2743:		if (trap_BotMoveInDirection(bs->ms, sideward, 400, movetype))
ADDRFP4 4
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 384
ADDRGP4 trap_BotMoveInDirection
CALLI4
ASGNI4
ADDRLP4 384
INDIRI4
CNSTI4 0
EQI4 $1396
line 2744
;2744:			return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $1299
JUMPV
LABELV $1396
line 2746
;2745:		//movement failed, flip the strafe direction
;2746:		bs->flags ^= BFL_STRAFERIGHT;
ADDRLP4 388
ADDRFP4 4
INDIRP4
CNSTI4 5980
ADDP4
ASGNP4
ADDRLP4 388
INDIRP4
ADDRLP4 388
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 2747
;2747:		bs->attackstrafe_time = 0;
ADDRFP4 4
INDIRP4
CNSTI4 6116
ADDP4
CNSTF4 0
ASGNF4
line 2748
;2748:	}
LABELV $1360
line 2720
ADDRLP4 48
ADDRLP4 48
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 2
LTI4 $1359
line 2751
;2749:	//bot couldn't do any usefull movement
;2750://	bs->attackchase_time = AAS_Time() + 6;
;2751:	return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
LABELV $1299
endproc BotAttackMove 392 16
export BotSameTeam
proc BotSameTeam 2072 12
line 2759
;2752:}
;2753:
;2754:/*
;2755:==================
;2756:BotSameTeam
;2757:==================
;2758:*/
;2759:int BotSameTeam(bot_state_t *bs, int entnum) {
line 2762
;2760:	char info1[1024], info2[1024];
;2761:
;2762:	if (bs->client < 0 || bs->client >= MAX_CLIENTS) {
ADDRLP4 2048
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 2048
INDIRI4
CNSTI4 0
LTI4 $1401
ADDRLP4 2048
INDIRI4
CNSTI4 64
LTI4 $1399
LABELV $1401
line 2764
;2763:		//BotAI_Print(PRT_ERROR, "BotSameTeam: client out of range\n");
;2764:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1398
JUMPV
LABELV $1399
line 2766
;2765:	}
;2766:	if (entnum < 0 || entnum >= MAX_CLIENTS) {
ADDRLP4 2052
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 2052
INDIRI4
CNSTI4 0
LTI4 $1404
ADDRLP4 2052
INDIRI4
CNSTI4 64
LTI4 $1402
LABELV $1404
line 2768
;2767:		//BotAI_Print(PRT_ERROR, "BotSameTeam: client out of range\n");
;2768:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1398
JUMPV
LABELV $1402
line 2770
;2769:	}
;2770:	if ( gametype >= GT_TEAM ) {
ADDRGP4 gametype
INDIRI4
CNSTI4 3
LTI4 $1405
line 2771
;2771:		trap_GetConfigstring(CS_PLAYERS+bs->client, info1, sizeof(info1));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 2772
;2772:		trap_GetConfigstring(CS_PLAYERS+entnum, info2, sizeof(info2));
ADDRFP4 4
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 2774
;2773:		//
;2774:		if (atoi(Info_ValueForKey(info1, "t")) == atoi(Info_ValueForKey(info2, "t"))) return qtrue;
ADDRLP4 0
ARGP4
ADDRGP4 $70
ARGP4
ADDRLP4 2056
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2056
INDIRP4
ARGP4
ADDRLP4 2060
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
ARGP4
ADDRGP4 $70
ARGP4
ADDRLP4 2064
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2064
INDIRP4
ARGP4
ADDRLP4 2068
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2060
INDIRI4
ADDRLP4 2068
INDIRI4
NEI4 $1407
CNSTI4 1
RETI4
ADDRGP4 $1398
JUMPV
LABELV $1407
line 2775
;2775:	}
LABELV $1405
line 2776
;2776:	return qfalse;
CNSTI4 0
RETI4
LABELV $1398
endproc BotSameTeam 2072 12
export InFieldOfVision
proc InFieldOfVision 24 4
line 2785
;2777:}
;2778:
;2779:/*
;2780:==================
;2781:InFieldOfVision
;2782:==================
;2783:*/
;2784:qboolean InFieldOfVision(vec3_t viewangles, float fov, vec3_t angles)
;2785:{
line 2789
;2786:	int i;
;2787:	float diff, angle;
;2788:
;2789:	for (i = 0; i < 2; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1410
line 2790
;2790:		angle = AngleMod(viewangles[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 12
INDIRF4
ASGNF4
line 2791
;2791:		angles[i] = AngleMod(angles[i]);
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRF4
ASGNF4
line 2792
;2792:		diff = angles[i] - angle;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ASGNF4
line 2793
;2793:		if (angles[i] > angle) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $1414
line 2794
;2794:			if (diff > 180.0) diff -= 360.0;
ADDRLP4 4
INDIRF4
CNSTF4 1127481344
LEF4 $1415
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 2795
;2795:		}
ADDRGP4 $1415
JUMPV
LABELV $1414
line 2796
;2796:		else {
line 2797
;2797:			if (diff < -180.0) diff += 360.0;
ADDRLP4 4
INDIRF4
CNSTF4 3274964992
GEF4 $1418
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $1418
line 2798
;2798:		}
LABELV $1415
line 2799
;2799:		if (diff > 0) {
ADDRLP4 4
INDIRF4
CNSTF4 0
LEF4 $1420
line 2800
;2800:			if (diff > fov * 0.5) return qfalse;
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRFP4 4
INDIRF4
MULF4
LEF4 $1421
CNSTI4 0
RETI4
ADDRGP4 $1409
JUMPV
line 2801
;2801:		}
LABELV $1420
line 2802
;2802:		else {
line 2803
;2803:			if (diff < -fov * 0.5) return qfalse;
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRFP4 4
INDIRF4
NEGF4
MULF4
GEF4 $1424
CNSTI4 0
RETI4
ADDRGP4 $1409
JUMPV
LABELV $1424
line 2804
;2804:		}
LABELV $1421
line 2805
;2805:	}
LABELV $1411
line 2789
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $1410
line 2806
;2806:	return qtrue;
CNSTI4 1
RETI4
LABELV $1409
endproc InFieldOfVision 24 4
export BotEntityVisible
proc BotEntityVisible 376 28
line 2816
;2807:}
;2808:
;2809:/*
;2810:==================
;2811:BotEntityVisible
;2812:
;2813:returns visibility in the range [0, 1] taking fog and water surfaces into account
;2814:==================
;2815:*/
;2816:float BotEntityVisible(int viewer, vec3_t eye, vec3_t viewangles, float fov, int ent) {
line 2824
;2817:	int i, contents_mask, passent, hitent, infog, inwater, otherinfog, pc;
;2818:	float squaredfogdist, waterfactor, vis, bestvis;
;2819:	bsp_trace_t trace;
;2820:	aas_entityinfo_t entinfo;
;2821:	vec3_t dir, entangles, start, end, middle;
;2822:
;2823:	//calculate middle of bounding box
;2824:	BotEntityInfo(ent, &entinfo);
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 148
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2825
;2825:	VectorAdd(entinfo.mins, entinfo.maxs, middle);
ADDRLP4 84
ADDRLP4 148+72
INDIRF4
ADDRLP4 148+84
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84+4
ADDRLP4 148+72+4
INDIRF4
ADDRLP4 148+84+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84+8
ADDRLP4 148+72+8
INDIRF4
ADDRLP4 148+84+8
INDIRF4
ADDF4
ASGNF4
line 2826
;2826:	VectorScale(middle, 0.5, middle);
ADDRLP4 332
CNSTF4 1056964608
ASGNF4
ADDRLP4 84
ADDRLP4 332
INDIRF4
ADDRLP4 84
INDIRF4
MULF4
ASGNF4
ADDRLP4 84+4
ADDRLP4 332
INDIRF4
ADDRLP4 84+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 84+8
CNSTF4 1056964608
ADDRLP4 84+8
INDIRF4
MULF4
ASGNF4
line 2827
;2827:	VectorAdd(entinfo.origin, middle, middle);
ADDRLP4 84
ADDRLP4 148+24
INDIRF4
ADDRLP4 84
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84+4
ADDRLP4 148+24+4
INDIRF4
ADDRLP4 84+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84+8
ADDRLP4 148+24+8
INDIRF4
ADDRLP4 84+8
INDIRF4
ADDF4
ASGNF4
line 2829
;2828:	//check if entity is within field of vision
;2829:	VectorSubtract(middle, eye, dir);
ADDRLP4 336
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 136
ADDRLP4 84
INDIRF4
ADDRLP4 336
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+4
ADDRLP4 84+4
INDIRF4
ADDRLP4 336
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+8
ADDRLP4 84+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2830
;2830:	vectoangles(dir, entangles);
ADDRLP4 136
ARGP4
ADDRLP4 320
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2831
;2831:	if (!InFieldOfVision(viewangles, fov, entangles)) return 0;
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 320
ARGP4
ADDRLP4 340
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 340
INDIRI4
CNSTI4 0
NEI4 $1456
CNSTF4 0
RETF4
ADDRGP4 $1426
JUMPV
LABELV $1456
line 2833
;2832:	//
;2833:	pc = trap_AAS_PointContents(eye);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 344
ADDRGP4 trap_AAS_PointContents
CALLI4
ASGNI4
ADDRLP4 316
ADDRLP4 344
INDIRI4
ASGNI4
line 2834
;2834:	infog = (pc & CONTENTS_FOG);
ADDRLP4 312
ADDRLP4 316
INDIRI4
CNSTI4 64
BANDI4
ASGNI4
line 2835
;2835:	inwater = (pc & (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER));
ADDRLP4 308
ADDRLP4 316
INDIRI4
CNSTI4 56
BANDI4
ASGNI4
line 2837
;2836:	//
;2837:	bestvis = 0;
ADDRLP4 296
CNSTF4 0
ASGNF4
line 2838
;2838:	for (i = 0; i < 3; i++) {
ADDRLP4 100
CNSTI4 0
ASGNI4
LABELV $1458
line 2842
;2839:		//if the point is not in potential visible sight
;2840:		//if (!AAS_inPVS(eye, middle)) continue;
;2841:		//
;2842:		contents_mask = CONTENTS_SOLID|CONTENTS_PLAYERCLIP;
ADDRLP4 96
CNSTI4 65537
ASGNI4
line 2843
;2843:		passent = viewer;
ADDRLP4 116
ADDRFP4 0
INDIRI4
ASGNI4
line 2844
;2844:		hitent = ent;
ADDRLP4 132
ADDRFP4 16
INDIRI4
ASGNI4
line 2845
;2845:		VectorCopy(eye, start);
ADDRLP4 120
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2846
;2846:		VectorCopy(middle, end);
ADDRLP4 104
ADDRLP4 84
INDIRB
ASGNB 12
line 2848
;2847:		//if the entity is in water, lava or slime
;2848:		if (trap_AAS_PointContents(middle) & (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER)) {
ADDRLP4 84
ARGP4
ADDRLP4 348
ADDRGP4 trap_AAS_PointContents
CALLI4
ASGNI4
ADDRLP4 348
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $1462
line 2849
;2849:			contents_mask |= (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER);
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 56
BORI4
ASGNI4
line 2850
;2850:		}
LABELV $1462
line 2852
;2851:		//if eye is in water, lava or slime
;2852:		if (inwater) {
ADDRLP4 308
INDIRI4
CNSTI4 0
EQI4 $1464
line 2853
;2853:			if (!(contents_mask & (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER))) {
ADDRLP4 96
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
NEI4 $1466
line 2854
;2854:				passent = ent;
ADDRLP4 116
ADDRFP4 16
INDIRI4
ASGNI4
line 2855
;2855:				hitent = viewer;
ADDRLP4 132
ADDRFP4 0
INDIRI4
ASGNI4
line 2856
;2856:				VectorCopy(middle, start);
ADDRLP4 120
ADDRLP4 84
INDIRB
ASGNB 12
line 2857
;2857:				VectorCopy(eye, end);
ADDRLP4 104
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2858
;2858:			}
LABELV $1466
line 2859
;2859:			contents_mask ^= (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER);
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 56
BXORI4
ASGNI4
line 2860
;2860:		}
LABELV $1464
line 2862
;2861:		//trace from start to end
;2862:		BotAI_Trace(&trace, start, NULL, NULL, end, passent, contents_mask);
ADDRLP4 0
ARGP4
ADDRLP4 120
ARGP4
ADDRLP4 352
CNSTP4 0
ASGNP4
ADDRLP4 352
INDIRP4
ARGP4
ADDRLP4 352
INDIRP4
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 116
INDIRI4
ARGI4
ADDRLP4 96
INDIRI4
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2864
;2863:		//if water was hit
;2864:		waterfactor = 1.0;
ADDRLP4 288
CNSTF4 1065353216
ASGNF4
line 2865
;2865:		if (trace.contents & (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER)) {
ADDRLP4 0+76
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $1468
line 2867
;2866:			//if the water surface is translucent
;2867:			if (1) {
line 2869
;2868:				//trace through the water
;2869:				contents_mask &= ~(CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER);
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 -57
BANDI4
ASGNI4
line 2870
;2870:				BotAI_Trace(&trace, trace.endpos, NULL, NULL, end, passent, contents_mask);
ADDRLP4 0
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 356
CNSTP4 0
ASGNP4
ADDRLP4 356
INDIRP4
ARGP4
ADDRLP4 356
INDIRP4
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 116
INDIRI4
ARGI4
ADDRLP4 96
INDIRI4
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2871
;2871:				waterfactor = 0.5;
ADDRLP4 288
CNSTF4 1056964608
ASGNF4
line 2872
;2872:			}
LABELV $1471
line 2873
;2873:		}
LABELV $1468
line 2875
;2874:		//if a full trace or the hitent was hit
;2875:		if (trace.fraction >= 1 || trace.ent == hitent) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $1478
ADDRLP4 0+80
INDIRI4
ADDRLP4 132
INDIRI4
NEI4 $1474
LABELV $1478
line 2878
;2876:			//check for fog, assuming there's only one fog brush where
;2877:			//either the viewer or the entity is in or both are in
;2878:			otherinfog = (trap_AAS_PointContents(middle) & CONTENTS_FOG);
ADDRLP4 84
ARGP4
ADDRLP4 356
ADDRGP4 trap_AAS_PointContents
CALLI4
ASGNI4
ADDRLP4 304
ADDRLP4 356
INDIRI4
CNSTI4 64
BANDI4
ASGNI4
line 2879
;2879:			if (infog && otherinfog) {
ADDRLP4 360
CNSTI4 0
ASGNI4
ADDRLP4 312
INDIRI4
ADDRLP4 360
INDIRI4
EQI4 $1479
ADDRLP4 304
INDIRI4
ADDRLP4 360
INDIRI4
EQI4 $1479
line 2880
;2880:				VectorSubtract(trace.endpos, eye, dir);
ADDRLP4 364
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 136
ADDRLP4 0+12
INDIRF4
ADDRLP4 364
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+4
ADDRLP4 0+12+4
INDIRF4
ADDRLP4 364
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+8
ADDRLP4 0+12+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2881
;2881:				squaredfogdist = VectorLengthSquared(dir);
ADDRLP4 136
ARGP4
ADDRLP4 368
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 300
ADDRLP4 368
INDIRF4
ASGNF4
line 2882
;2882:			}
ADDRGP4 $1480
JUMPV
LABELV $1479
line 2883
;2883:			else if (infog) {
ADDRLP4 312
INDIRI4
CNSTI4 0
EQI4 $1488
line 2884
;2884:				VectorCopy(trace.endpos, start);
ADDRLP4 120
ADDRLP4 0+12
INDIRB
ASGNB 12
line 2885
;2885:				BotAI_Trace(&trace, start, NULL, NULL, eye, viewer, CONTENTS_FOG);
ADDRLP4 0
ARGP4
ADDRLP4 120
ARGP4
ADDRLP4 364
CNSTP4 0
ASGNP4
ADDRLP4 364
INDIRP4
ARGP4
ADDRLP4 364
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2886
;2886:				VectorSubtract(eye, trace.endpos, dir);
ADDRLP4 368
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 136
ADDRLP4 368
INDIRP4
INDIRF4
ADDRLP4 0+12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+4
ADDRLP4 368
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0+12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0+12+8
INDIRF4
SUBF4
ASGNF4
line 2887
;2887:				squaredfogdist = VectorLengthSquared(dir);
ADDRLP4 136
ARGP4
ADDRLP4 372
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 300
ADDRLP4 372
INDIRF4
ASGNF4
line 2888
;2888:			}
ADDRGP4 $1489
JUMPV
LABELV $1488
line 2889
;2889:			else if (otherinfog) {
ADDRLP4 304
INDIRI4
CNSTI4 0
EQI4 $1498
line 2890
;2890:				VectorCopy(trace.endpos, end);
ADDRLP4 104
ADDRLP4 0+12
INDIRB
ASGNB 12
line 2891
;2891:				BotAI_Trace(&trace, eye, NULL, NULL, end, viewer, CONTENTS_FOG);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 364
CNSTP4 0
ASGNP4
ADDRLP4 364
INDIRP4
ARGP4
ADDRLP4 364
INDIRP4
ARGP4
ADDRLP4 104
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2892
;2892:				VectorSubtract(end, trace.endpos, dir);
ADDRLP4 136
ADDRLP4 104
INDIRF4
ADDRLP4 0+12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+4
ADDRLP4 104+4
INDIRF4
ADDRLP4 0+12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+8
ADDRLP4 104+8
INDIRF4
ADDRLP4 0+12+8
INDIRF4
SUBF4
ASGNF4
line 2893
;2893:				squaredfogdist = VectorLengthSquared(dir);
ADDRLP4 136
ARGP4
ADDRLP4 368
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 300
ADDRLP4 368
INDIRF4
ASGNF4
line 2894
;2894:			}
ADDRGP4 $1499
JUMPV
LABELV $1498
line 2895
;2895:			else {
line 2897
;2896:				//if the entity and the viewer are not in fog assume there's no fog in between
;2897:				squaredfogdist = 0;
ADDRLP4 300
CNSTF4 0
ASGNF4
line 2898
;2898:			}
LABELV $1499
LABELV $1489
LABELV $1480
line 2900
;2899:			//decrease visibility with the view distance through fog
;2900:			vis = 1 / ((squaredfogdist * 0.001) < 1 ? 1 : (squaredfogdist * 0.001));
ADDRLP4 368
CNSTF4 1065353216
ASGNF4
CNSTF4 981668463
ADDRLP4 300
INDIRF4
MULF4
ADDRLP4 368
INDIRF4
GEF4 $1511
ADDRLP4 364
CNSTF4 1065353216
ASGNF4
ADDRGP4 $1512
JUMPV
LABELV $1511
ADDRLP4 364
CNSTF4 981668463
ADDRLP4 300
INDIRF4
MULF4
ASGNF4
LABELV $1512
ADDRLP4 292
ADDRLP4 368
INDIRF4
ADDRLP4 364
INDIRF4
DIVF4
ASGNF4
line 2902
;2901:			//if entering water visibility is reduced
;2902:			vis *= waterfactor;
ADDRLP4 292
ADDRLP4 292
INDIRF4
ADDRLP4 288
INDIRF4
MULF4
ASGNF4
line 2904
;2903:			//
;2904:			if (vis > bestvis) bestvis = vis;
ADDRLP4 292
INDIRF4
ADDRLP4 296
INDIRF4
LEF4 $1513
ADDRLP4 296
ADDRLP4 292
INDIRF4
ASGNF4
LABELV $1513
line 2906
;2905:			//if pretty much no fog
;2906:			if (bestvis >= 0.95) return bestvis;
ADDRLP4 296
INDIRF4
CNSTF4 1064514355
LTF4 $1515
ADDRLP4 296
INDIRF4
RETF4
ADDRGP4 $1426
JUMPV
LABELV $1515
line 2907
;2907:		}
LABELV $1474
line 2909
;2908:		//check bottom and top of bounding box as well
;2909:		if (i == 0) middle[2] += entinfo.mins[2];
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $1517
ADDRLP4 84+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 148+72+8
INDIRF4
ADDF4
ASGNF4
ADDRGP4 $1518
JUMPV
LABELV $1517
line 2910
;2910:		else if (i == 1) middle[2] += entinfo.maxs[2] - entinfo.mins[2];
ADDRLP4 100
INDIRI4
CNSTI4 1
NEI4 $1522
ADDRLP4 84+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 148+84+8
INDIRF4
ADDRLP4 148+72+8
INDIRF4
SUBF4
ADDF4
ASGNF4
LABELV $1522
LABELV $1518
line 2911
;2911:	}
LABELV $1459
line 2838
ADDRLP4 100
ADDRLP4 100
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 3
LTI4 $1458
line 2912
;2912:	return bestvis;
ADDRLP4 296
INDIRF4
RETF4
LABELV $1426
endproc BotEntityVisible 376 28
export BotFindEnemy
proc BotFindEnemy 468 28
line 2920
;2913:}
;2914:
;2915:/*
;2916:==================
;2917:BotFindEnemy
;2918:==================
;2919:*/
;2920:int BotFindEnemy(bot_state_t *bs, int curenemy) {
line 2927
;2921:	int i, healthdecrease;
;2922:	float f, alertness, easyfragger, vis;
;2923:	float squaredist, cursquaredist;
;2924:	aas_entityinfo_t entinfo, curenemyinfo;
;2925:	vec3_t dir, angles;
;2926:
;2927:	alertness = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_ALERTNESS, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 46
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 336
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 164
ADDRLP4 336
INDIRF4
ASGNF4
line 2928
;2928:	easyfragger = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_EASY_FRAGGER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 45
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 340
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 176
ADDRLP4 340
INDIRF4
ASGNF4
line 2930
;2929:	//check if the health decreased
;2930:	healthdecrease = bs->lasthealth > bs->inventory[INVENTORY_HEALTH];
ADDRLP4 348
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 348
INDIRP4
CNSTI4 5988
ADDP4
INDIRI4
ADDRLP4 348
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
LEI4 $1531
ADDRLP4 344
CNSTI4 1
ASGNI4
ADDRGP4 $1532
JUMPV
LABELV $1531
ADDRLP4 344
CNSTI4 0
ASGNI4
LABELV $1532
ADDRLP4 160
ADDRLP4 344
INDIRI4
ASGNI4
line 2932
;2931:	//remember the current health value
;2932:	bs->lasthealth = bs->inventory[INVENTORY_HEALTH];
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 352
INDIRP4
CNSTI4 5988
ADDP4
ADDRLP4 352
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
ASGNI4
line 2934
;2933:	//
;2934:	if (curenemy >= 0) {
ADDRFP4 4
INDIRI4
CNSTI4 0
LTI4 $1533
line 2935
;2935:		BotEntityInfo(curenemy, &curenemyinfo);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 196
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2936
;2936:		if (EntityCarriesFlag(&curenemyinfo)) return qfalse;
ADDRLP4 196
ARGP4
ADDRLP4 356
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 356
INDIRI4
CNSTI4 0
EQI4 $1535
CNSTI4 0
RETI4
ADDRGP4 $1529
JUMPV
LABELV $1535
line 2937
;2937:		VectorSubtract(curenemyinfo.origin, bs->origin, dir);
ADDRLP4 360
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
ADDRLP4 196+24
INDIRF4
ADDRLP4 360
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+4
ADDRLP4 196+24+4
INDIRF4
ADDRLP4 360
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+8
ADDRLP4 196+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2938
;2938:		cursquaredist = VectorLengthSquared(dir);
ADDRLP4 144
ARGP4
ADDRLP4 364
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 192
ADDRLP4 364
INDIRF4
ASGNF4
line 2939
;2939:	}
ADDRGP4 $1534
JUMPV
LABELV $1533
line 2940
;2940:	else {
line 2941
;2941:		cursquaredist = 0;
ADDRLP4 192
CNSTF4 0
ASGNF4
line 2942
;2942:	}
LABELV $1534
line 2944
;2943:#ifdef MISSIONPACK
;2944:	if (gametype == GT_OBELISK) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $1544
line 2949
;2945:		vec3_t target;
;2946:		bot_goal_t *goal;
;2947:		bsp_trace_t trace;
;2948:
;2949:		if (BotTeam(bs) == TEAM_RED)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 456
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 456
INDIRI4
CNSTI4 1
NEI4 $1546
line 2950
;2950:			goal = &blueobelisk;
ADDRLP4 356
ADDRGP4 blueobelisk
ASGNP4
ADDRGP4 $1547
JUMPV
LABELV $1546
line 2952
;2951:		else
;2952:			goal = &redobelisk;
ADDRLP4 356
ADDRGP4 redobelisk
ASGNP4
LABELV $1547
line 2954
;2953:		//if the obelisk is visible
;2954:		VectorCopy(goal->origin, target);
ADDRLP4 360
ADDRLP4 356
INDIRP4
INDIRB
ASGNB 12
line 2955
;2955:		target[2] += 1;
ADDRLP4 360+8
ADDRLP4 360+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2956
;2956:		BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
ADDRLP4 372
ARGP4
ADDRLP4 460
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 460
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 464
CNSTP4 0
ASGNP4
ADDRLP4 464
INDIRP4
ARGP4
ADDRLP4 464
INDIRP4
ARGP4
ADDRLP4 360
ARGP4
ADDRLP4 460
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2957
;2957:		if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
ADDRLP4 372+8
INDIRF4
CNSTF4 1065353216
GEF4 $1553
ADDRLP4 372+80
INDIRI4
ADDRLP4 356
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $1549
LABELV $1553
line 2958
;2958:			if (goal->entitynum == bs->enemy) {
ADDRLP4 356
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
NEI4 $1554
line 2959
;2959:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1529
JUMPV
LABELV $1554
line 2961
;2960:			}
;2961:			bs->enemy = goal->entitynum;
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
ADDRLP4 356
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
line 2962
;2962:			bs->enemysight_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6132
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2963
;2963:			bs->enemysuicide = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6012
ADDP4
CNSTI4 0
ASGNI4
line 2964
;2964:			bs->enemydeath_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6136
ADDP4
CNSTF4 0
ASGNF4
line 2965
;2965:			bs->enemyvisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6088
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2966
;2966:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1529
JUMPV
LABELV $1549
line 2968
;2967:		}
;2968:	}
LABELV $1544
line 2971
;2969:#endif
;2970:	//
;2971:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 140
CNSTI4 0
ASGNI4
ADDRGP4 $1559
JUMPV
LABELV $1556
line 2973
;2972:
;2973:		if (i == bs->client) continue;
ADDRLP4 140
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1560
ADDRGP4 $1557
JUMPV
LABELV $1560
line 2975
;2974:		//if it's the current enemy
;2975:		if (i == curenemy) continue;
ADDRLP4 140
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $1562
ADDRGP4 $1557
JUMPV
LABELV $1562
line 2977
;2976:		//
;2977:		BotEntityInfo(i, &entinfo);
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2979
;2978:		//
;2979:		if (!entinfo.valid) continue;
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1564
ADDRGP4 $1557
JUMPV
LABELV $1564
line 2981
;2980:		//if the enemy isn't dead and the enemy isn't the bot self
;2981:		if (EntityIsDead(&entinfo) || entinfo.number == bs->entitynum) continue;
ADDRLP4 0
ARGP4
ADDRLP4 356
ADDRGP4 EntityIsDead
CALLI4
ASGNI4
ADDRLP4 356
INDIRI4
CNSTI4 0
NEI4 $1569
ADDRLP4 0+20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
NEI4 $1566
LABELV $1569
ADDRGP4 $1557
JUMPV
LABELV $1566
line 2983
;2982:		//if the enemy is invisible and not shooting
;2983:		if (EntityIsInvisible(&entinfo) && !EntityIsShooting(&entinfo)) {
ADDRLP4 0
ARGP4
ADDRLP4 360
ADDRGP4 EntityIsInvisible
CALLI4
ASGNI4
ADDRLP4 360
INDIRI4
CNSTI4 0
EQI4 $1570
ADDRLP4 0
ARGP4
ADDRLP4 364
ADDRGP4 EntityIsShooting
CALLI4
ASGNI4
ADDRLP4 364
INDIRI4
CNSTI4 0
NEI4 $1570
line 2984
;2984:			continue;
ADDRGP4 $1557
JUMPV
LABELV $1570
line 2988
;2985:		}
;2986://unlagged - misc
;2987:		// this has nothing to do with lag compensation, but it's great for testing
;2988:		if ( g_entities[i].flags & FL_NOTARGET ) continue;
CNSTI4 868
ADDRLP4 140
INDIRI4
MULI4
ADDRGP4 g_entities+536
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $1572
ADDRGP4 $1557
JUMPV
LABELV $1572
line 2991
;2989://unlagged - misc
;2990:		//if not an easy fragger don't shoot at chatting players
;2991:		if (easyfragger < 0.5 && EntityIsChatting(&entinfo)) continue;
ADDRLP4 176
INDIRF4
CNSTF4 1056964608
GEF4 $1575
ADDRLP4 0
ARGP4
ADDRLP4 368
ADDRGP4 EntityIsChatting
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 0
EQI4 $1575
ADDRGP4 $1557
JUMPV
LABELV $1575
line 2993
;2992:		//
;2993:		if (lastteleport_time > FloatTime() - 3) {
ADDRGP4 lastteleport_time
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1077936128
SUBF4
LEF4 $1577
line 2994
;2994:			VectorSubtract(entinfo.origin, lastteleport_origin, dir);
ADDRLP4 144
ADDRLP4 0+24
INDIRF4
ADDRGP4 lastteleport_origin
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+4
ADDRLP4 0+24+4
INDIRF4
ADDRGP4 lastteleport_origin+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+8
ADDRLP4 0+24+8
INDIRF4
ADDRGP4 lastteleport_origin+8
INDIRF4
SUBF4
ASGNF4
line 2995
;2995:			if (VectorLengthSquared(dir) < Square(70)) continue;
ADDRLP4 144
ARGP4
ADDRLP4 372
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 372
INDIRF4
CNSTF4 1167663104
GEF4 $1588
ADDRGP4 $1557
JUMPV
LABELV $1588
line 2996
;2996:		}
LABELV $1577
line 2998
;2997:		//calculate the distance towards the enemy
;2998:		VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 372
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
ADDRLP4 0+24
INDIRF4
ADDRLP4 372
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 372
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2999
;2999:		squaredist = VectorLengthSquared(dir);
ADDRLP4 144
ARGP4
ADDRLP4 376
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 376
INDIRF4
ASGNF4
line 3001
;3000:		//if this entity is not carrying a flag
;3001:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 0
ARGP4
ADDRLP4 380
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 380
INDIRI4
CNSTI4 0
NEI4 $1597
line 3002
;3002:		{
line 3004
;3003:			//if this enemy is further away than the current one
;3004:			if (curenemy >= 0 && squaredist > cursquaredist) continue;
ADDRFP4 4
INDIRI4
CNSTI4 0
LTI4 $1599
ADDRLP4 156
INDIRF4
ADDRLP4 192
INDIRF4
LEF4 $1599
ADDRGP4 $1557
JUMPV
LABELV $1599
line 3005
;3005:		} //end if
LABELV $1597
line 3007
;3006:		//if the bot has no
;3007:		if (squaredist > Square(900.0 + alertness * 4000.0)) continue;
ADDRLP4 384
CNSTF4 1165623296
ADDRLP4 164
INDIRF4
MULF4
CNSTF4 1147207680
ADDF4
ASGNF4
ADDRLP4 156
INDIRF4
ADDRLP4 384
INDIRF4
ADDRLP4 384
INDIRF4
MULF4
LEF4 $1601
ADDRGP4 $1557
JUMPV
LABELV $1601
line 3009
;3008:		//if on the same team
;3009:		if (BotSameTeam(bs, i)) continue;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 388
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 388
INDIRI4
CNSTI4 0
EQI4 $1603
ADDRGP4 $1557
JUMPV
LABELV $1603
line 3011
;3010:		//if the bot's health decreased or the enemy is shooting
;3011:		if (curenemy < 0 && (healthdecrease || EntityIsShooting(&entinfo)))
ADDRLP4 392
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 392
INDIRI4
GEI4 $1605
ADDRLP4 160
INDIRI4
ADDRLP4 392
INDIRI4
NEI4 $1607
ADDRLP4 0
ARGP4
ADDRLP4 396
ADDRGP4 EntityIsShooting
CALLI4
ASGNI4
ADDRLP4 396
INDIRI4
CNSTI4 0
EQI4 $1605
LABELV $1607
line 3012
;3012:			f = 360;
ADDRLP4 168
CNSTF4 1135869952
ASGNF4
ADDRGP4 $1606
JUMPV
LABELV $1605
line 3014
;3013:		else
;3014:			f = 90 + 90 - (90 - (squaredist > Square(810) ? Square(810) : squaredist) / (810 * 9));
ADDRLP4 156
INDIRF4
CNSTF4 1226845760
LEF4 $1609
ADDRLP4 400
CNSTF4 1226845760
ASGNF4
ADDRGP4 $1610
JUMPV
LABELV $1609
ADDRLP4 400
ADDRLP4 156
INDIRF4
ASGNF4
LABELV $1610
ADDRLP4 168
CNSTF4 1127481344
CNSTF4 1119092736
ADDRLP4 400
INDIRF4
CNSTF4 1172557824
DIVF4
SUBF4
SUBF4
ASGNF4
LABELV $1606
line 3016
;3015:		//check if the enemy is visible
;3016:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, f, i);
ADDRLP4 404
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 404
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 404
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 404
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
ADDRLP4 168
INDIRF4
ARGF4
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 408
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 172
ADDRLP4 408
INDIRF4
ASGNF4
line 3017
;3017:		if (vis <= 0) continue;
ADDRLP4 172
INDIRF4
CNSTF4 0
GTF4 $1611
ADDRGP4 $1557
JUMPV
LABELV $1611
line 3019
;3018:		//if the enemy is quite far away, not shooting and the bot is not damaged
;3019:		if (curenemy < 0 && squaredist > Square(100) && !healthdecrease && !EntityIsShooting(&entinfo))
ADDRLP4 412
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 412
INDIRI4
GEI4 $1613
ADDRLP4 156
INDIRF4
CNSTF4 1176256512
LEF4 $1613
ADDRLP4 160
INDIRI4
ADDRLP4 412
INDIRI4
NEI4 $1613
ADDRLP4 0
ARGP4
ADDRLP4 416
ADDRGP4 EntityIsShooting
CALLI4
ASGNI4
ADDRLP4 416
INDIRI4
CNSTI4 0
NEI4 $1613
line 3020
;3020:		{
line 3022
;3021:			//check if we can avoid this enemy
;3022:			VectorSubtract(bs->origin, entinfo.origin, dir);
ADDRLP4 420
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
ADDRLP4 420
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRLP4 0+24
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+4
ADDRLP4 420
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRLP4 0+24+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+8
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRLP4 0+24+8
INDIRF4
SUBF4
ASGNF4
line 3023
;3023:			vectoangles(dir, angles);
ADDRLP4 144
ARGP4
ADDRLP4 180
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3025
;3024:			//if the bot isn't in the fov of the enemy
;3025:			if (!InFieldOfVision(entinfo.angles, 90, angles)) {
ADDRLP4 0+36
ARGP4
CNSTF4 1119092736
ARGF4
ADDRLP4 180
ARGP4
ADDRLP4 424
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 424
INDIRI4
CNSTI4 0
NEI4 $1622
line 3027
;3026:				//update some stuff for this enemy
;3027:				BotUpdateBattleInventory(bs, i);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
INDIRI4
ARGI4
ADDRGP4 BotUpdateBattleInventory
CALLV
pop
line 3029
;3028:				//if the bot doesn't really want to fight
;3029:				if (BotWantsToRetreat(bs)) continue;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 428
ADDRGP4 BotWantsToRetreat
CALLI4
ASGNI4
ADDRLP4 428
INDIRI4
CNSTI4 0
EQI4 $1625
ADDRGP4 $1557
JUMPV
LABELV $1625
line 3030
;3030:			}
LABELV $1622
line 3031
;3031:		}
LABELV $1613
line 3033
;3032:		//found an enemy
;3033:		bs->enemy = entinfo.number;
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
ADDRLP4 0+20
INDIRI4
ASGNI4
line 3034
;3034:		if (curenemy >= 0) bs->enemysight_time = FloatTime() - 2;
ADDRFP4 4
INDIRI4
CNSTI4 0
LTI4 $1628
ADDRFP4 0
INDIRP4
CNSTI4 6132
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
SUBF4
ASGNF4
ADDRGP4 $1629
JUMPV
LABELV $1628
line 3035
;3035:		else bs->enemysight_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6132
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
LABELV $1629
line 3036
;3036:		bs->enemysuicide = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6012
ADDP4
CNSTI4 0
ASGNI4
line 3037
;3037:		bs->enemydeath_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6136
ADDP4
CNSTF4 0
ASGNF4
line 3038
;3038:		bs->enemyvisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6088
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 3039
;3039:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1529
JUMPV
LABELV $1557
line 2971
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1559
ADDRLP4 140
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $1630
ADDRLP4 140
INDIRI4
CNSTI4 64
LTI4 $1556
LABELV $1630
line 3041
;3040:	}
;3041:	return qfalse;
CNSTI4 0
RETI4
LABELV $1529
endproc BotFindEnemy 468 28
export BotTeamFlagCarrierVisible
proc BotTeamFlagCarrierVisible 164 20
line 3049
;3042:}
;3043:
;3044:/*
;3045:==================
;3046:BotTeamFlagCarrierVisible
;3047:==================
;3048:*/
;3049:int BotTeamFlagCarrierVisible(bot_state_t *bs) {
line 3054
;3050:	int i;
;3051:	float vis;
;3052:	aas_entityinfo_t entinfo;
;3053:
;3054:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1635
JUMPV
LABELV $1632
line 3055
;3055:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1636
line 3056
;3056:			continue;
ADDRGP4 $1633
JUMPV
LABELV $1636
line 3058
;3057:		//
;3058:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3060
;3059:		//if this player is active
;3060:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1638
line 3061
;3061:			continue;
ADDRGP4 $1633
JUMPV
LABELV $1638
line 3063
;3062:		//if this player is carrying a flag
;3063:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 4
ARGP4
ADDRLP4 148
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $1640
line 3064
;3064:			continue;
ADDRGP4 $1633
JUMPV
LABELV $1640
line 3066
;3065:		//if the flag carrier is not on the same team
;3066:		if (!BotSameTeam(bs, i))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 152
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
NEI4 $1642
line 3067
;3067:			continue;
ADDRGP4 $1633
JUMPV
LABELV $1642
line 3069
;3068:		//if the flag carrier is not visible
;3069:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
ADDRLP4 156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 156
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 156
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 156
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 160
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 144
ADDRLP4 160
INDIRF4
ASGNF4
line 3070
;3070:		if (vis <= 0)
ADDRLP4 144
INDIRF4
CNSTF4 0
GTF4 $1644
line 3071
;3071:			continue;
ADDRGP4 $1633
JUMPV
LABELV $1644
line 3073
;3072:		//
;3073:		return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1631
JUMPV
LABELV $1633
line 3054
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1635
ADDRLP4 0
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $1646
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $1632
LABELV $1646
line 3075
;3074:	}
;3075:	return -1;
CNSTI4 -1
RETI4
LABELV $1631
endproc BotTeamFlagCarrierVisible 164 20
export BotTeamFlagCarrier
proc BotTeamFlagCarrier 152 8
line 3083
;3076:}
;3077:
;3078:/*
;3079:==================
;3080:BotTeamFlagCarrier
;3081:==================
;3082:*/
;3083:int BotTeamFlagCarrier(bot_state_t *bs) {
line 3087
;3084:	int i;
;3085:	aas_entityinfo_t entinfo;
;3086:
;3087:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1651
JUMPV
LABELV $1648
line 3088
;3088:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1652
line 3089
;3089:			continue;
ADDRGP4 $1649
JUMPV
LABELV $1652
line 3091
;3090:		//
;3091:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3093
;3092:		//if this player is active
;3093:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1654
line 3094
;3094:			continue;
ADDRGP4 $1649
JUMPV
LABELV $1654
line 3096
;3095:		//if this player is carrying a flag
;3096:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 4
ARGP4
ADDRLP4 144
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
NEI4 $1656
line 3097
;3097:			continue;
ADDRGP4 $1649
JUMPV
LABELV $1656
line 3099
;3098:		//if the flag carrier is not on the same team
;3099:		if (!BotSameTeam(bs, i))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 148
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $1658
line 3100
;3100:			continue;
ADDRGP4 $1649
JUMPV
LABELV $1658
line 3102
;3101:		//
;3102:		return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1647
JUMPV
LABELV $1649
line 3087
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1651
ADDRLP4 0
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $1660
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $1648
LABELV $1660
line 3104
;3103:	}
;3104:	return -1;
CNSTI4 -1
RETI4
LABELV $1647
endproc BotTeamFlagCarrier 152 8
export BotEnemyFlagCarrierVisible
proc BotEnemyFlagCarrierVisible 164 20
line 3112
;3105:}
;3106:
;3107:/*
;3108:==================
;3109:BotEnemyFlagCarrierVisible
;3110:==================
;3111:*/
;3112:int BotEnemyFlagCarrierVisible(bot_state_t *bs) {
line 3117
;3113:	int i;
;3114:	float vis;
;3115:	aas_entityinfo_t entinfo;
;3116:
;3117:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1665
JUMPV
LABELV $1662
line 3118
;3118:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1666
line 3119
;3119:			continue;
ADDRGP4 $1663
JUMPV
LABELV $1666
line 3121
;3120:		//
;3121:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3123
;3122:		//if this player is active
;3123:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1668
line 3124
;3124:			continue;
ADDRGP4 $1663
JUMPV
LABELV $1668
line 3126
;3125:		//if this player is carrying a flag
;3126:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 4
ARGP4
ADDRLP4 148
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $1670
line 3127
;3127:			continue;
ADDRGP4 $1663
JUMPV
LABELV $1670
line 3129
;3128:		//if the flag carrier is on the same team
;3129:		if (BotSameTeam(bs, i))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 152
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $1672
line 3130
;3130:			continue;
ADDRGP4 $1663
JUMPV
LABELV $1672
line 3132
;3131:		//if the flag carrier is not visible
;3132:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
ADDRLP4 156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 156
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 156
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 156
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 160
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 144
ADDRLP4 160
INDIRF4
ASGNF4
line 3133
;3133:		if (vis <= 0)
ADDRLP4 144
INDIRF4
CNSTF4 0
GTF4 $1674
line 3134
;3134:			continue;
ADDRGP4 $1663
JUMPV
LABELV $1674
line 3136
;3135:		//
;3136:		return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1661
JUMPV
LABELV $1663
line 3117
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1665
ADDRLP4 0
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $1676
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $1662
LABELV $1676
line 3138
;3137:	}
;3138:	return -1;
CNSTI4 -1
RETI4
LABELV $1661
endproc BotEnemyFlagCarrierVisible 164 20
export BotVisibleTeamMatesAndEnemies
proc BotVisibleTeamMatesAndEnemies 192 20
line 3146
;3139:}
;3140:
;3141:/*
;3142:==================
;3143:BotVisibleTeamMatesAndEnemies
;3144:==================
;3145:*/
;3146:void BotVisibleTeamMatesAndEnemies(bot_state_t *bs, int *teammates, int *enemies, float range) {
line 3152
;3147:	int i;
;3148:	float vis;
;3149:	aas_entityinfo_t entinfo;
;3150:	vec3_t dir;
;3151:
;3152:	if (teammates)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1678
line 3153
;3153:		*teammates = 0;
ADDRFP4 4
INDIRP4
CNSTI4 0
ASGNI4
LABELV $1678
line 3154
;3154:	if (enemies)
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1680
line 3155
;3155:		*enemies = 0;
ADDRFP4 8
INDIRP4
CNSTI4 0
ASGNI4
LABELV $1680
line 3156
;3156:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1685
JUMPV
LABELV $1682
line 3157
;3157:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1686
line 3158
;3158:			continue;
ADDRGP4 $1683
JUMPV
LABELV $1686
line 3160
;3159:		//
;3160:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3162
;3161:		//if this player is active
;3162:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1688
line 3163
;3163:			continue;
ADDRGP4 $1683
JUMPV
LABELV $1688
line 3165
;3164:		//if this player is carrying a flag
;3165:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 4
ARGP4
ADDRLP4 160
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
NEI4 $1690
line 3166
;3166:			continue;
ADDRGP4 $1683
JUMPV
LABELV $1690
line 3168
;3167:		//if not within range
;3168:		VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
ADDRLP4 4+24
INDIRF4
ADDRLP4 164
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+4
ADDRLP4 4+24+4
INDIRF4
ADDRLP4 164
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+8
ADDRLP4 4+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3169
;3169:		if (VectorLengthSquared(dir) > Square(range))
ADDRLP4 144
ARGP4
ADDRLP4 168
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 172
ADDRFP4 12
INDIRF4
ASGNF4
ADDRLP4 168
INDIRF4
ADDRLP4 172
INDIRF4
ADDRLP4 172
INDIRF4
MULF4
LEF4 $1699
line 3170
;3170:			continue;
ADDRGP4 $1683
JUMPV
LABELV $1699
line 3172
;3171:		//if the flag carrier is not visible
;3172:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
ADDRLP4 176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 176
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 176
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 176
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 180
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 180
INDIRF4
ASGNF4
line 3173
;3173:		if (vis <= 0)
ADDRLP4 156
INDIRF4
CNSTF4 0
GTF4 $1701
line 3174
;3174:			continue;
ADDRGP4 $1683
JUMPV
LABELV $1701
line 3176
;3175:		//if the flag carrier is on the same team
;3176:		if (BotSameTeam(bs, i)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 184
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 0
EQI4 $1703
line 3177
;3177:			if (teammates)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1704
line 3178
;3178:				(*teammates)++;
ADDRLP4 188
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 188
INDIRP4
ADDRLP4 188
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3179
;3179:		}
ADDRGP4 $1704
JUMPV
LABELV $1703
line 3180
;3180:		else {
line 3181
;3181:			if (enemies)
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1707
line 3182
;3182:				(*enemies)++;
ADDRLP4 188
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 188
INDIRP4
ADDRLP4 188
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1707
line 3183
;3183:		}
LABELV $1704
line 3184
;3184:	}
LABELV $1683
line 3156
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1685
ADDRLP4 0
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $1709
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $1682
LABELV $1709
line 3185
;3185:}
LABELV $1677
endproc BotVisibleTeamMatesAndEnemies 192 20
export BotTeamCubeCarrierVisible
proc BotTeamCubeCarrierVisible 164 20
line 3193
;3186:
;3187:#ifdef MISSIONPACK
;3188:/*
;3189:==================
;3190:BotTeamCubeCarrierVisible
;3191:==================
;3192:*/
;3193:int BotTeamCubeCarrierVisible(bot_state_t *bs) {
line 3198
;3194:	int i;
;3195:	float vis;
;3196:	aas_entityinfo_t entinfo;
;3197:
;3198:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1714
JUMPV
LABELV $1711
line 3199
;3199:		if (i == bs->client) continue;
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1715
ADDRGP4 $1712
JUMPV
LABELV $1715
line 3201
;3200:		//
;3201:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3203
;3202:		//if this player is active
;3203:		if (!entinfo.valid) continue;
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1717
ADDRGP4 $1712
JUMPV
LABELV $1717
line 3205
;3204:		//if this player is carrying a flag
;3205:		if (!EntityCarriesCubes(&entinfo)) continue;
ADDRLP4 4
ARGP4
ADDRLP4 148
ADDRGP4 EntityCarriesCubes
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $1719
ADDRGP4 $1712
JUMPV
LABELV $1719
line 3207
;3206:		//if the flag carrier is not on the same team
;3207:		if (!BotSameTeam(bs, i)) continue;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 152
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
NEI4 $1721
ADDRGP4 $1712
JUMPV
LABELV $1721
line 3209
;3208:		//if the flag carrier is not visible
;3209:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
ADDRLP4 156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 156
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 156
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 156
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 160
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 144
ADDRLP4 160
INDIRF4
ASGNF4
line 3210
;3210:		if (vis <= 0) continue;
ADDRLP4 144
INDIRF4
CNSTF4 0
GTF4 $1723
ADDRGP4 $1712
JUMPV
LABELV $1723
line 3212
;3211:		//
;3212:		return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1710
JUMPV
LABELV $1712
line 3198
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1714
ADDRLP4 0
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $1725
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $1711
LABELV $1725
line 3214
;3213:	}
;3214:	return -1;
CNSTI4 -1
RETI4
LABELV $1710
endproc BotTeamCubeCarrierVisible 164 20
export BotEnemyCubeCarrierVisible
proc BotEnemyCubeCarrierVisible 164 20
line 3222
;3215:}
;3216:
;3217:/*
;3218:==================
;3219:BotEnemyCubeCarrierVisible
;3220:==================
;3221:*/
;3222:int BotEnemyCubeCarrierVisible(bot_state_t *bs) {
line 3227
;3223:	int i;
;3224:	float vis;
;3225:	aas_entityinfo_t entinfo;
;3226:
;3227:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1730
JUMPV
LABELV $1727
line 3228
;3228:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1731
line 3229
;3229:			continue;
ADDRGP4 $1728
JUMPV
LABELV $1731
line 3231
;3230:		//
;3231:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3233
;3232:		//if this player is active
;3233:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1733
line 3234
;3234:			continue;
ADDRGP4 $1728
JUMPV
LABELV $1733
line 3236
;3235:		//if this player is carrying a flag
;3236:		if (!EntityCarriesCubes(&entinfo)) continue;
ADDRLP4 4
ARGP4
ADDRLP4 148
ADDRGP4 EntityCarriesCubes
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $1735
ADDRGP4 $1728
JUMPV
LABELV $1735
line 3238
;3237:		//if the flag carrier is on the same team
;3238:		if (BotSameTeam(bs, i))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 152
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $1737
line 3239
;3239:			continue;
ADDRGP4 $1728
JUMPV
LABELV $1737
line 3241
;3240:		//if the flag carrier is not visible
;3241:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
ADDRLP4 156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 156
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 156
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 156
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 160
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 144
ADDRLP4 160
INDIRF4
ASGNF4
line 3242
;3242:		if (vis <= 0)
ADDRLP4 144
INDIRF4
CNSTF4 0
GTF4 $1739
line 3243
;3243:			continue;
ADDRGP4 $1728
JUMPV
LABELV $1739
line 3245
;3244:		//
;3245:		return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1726
JUMPV
LABELV $1728
line 3227
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1730
ADDRLP4 0
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $1741
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $1727
LABELV $1741
line 3247
;3246:	}
;3247:	return -1;
CNSTI4 -1
RETI4
LABELV $1726
endproc BotEnemyCubeCarrierVisible 164 20
lit
align 4
LABELV $1743
byte 4 3229614080
byte 4 3229614080
byte 4 3229614080
align 4
LABELV $1744
byte 4 1082130432
byte 4 1082130432
byte 4 1082130432
export BotAimAtEnemy
code
proc BotAimAtEnemy 1144 52
line 3256
;3248:}
;3249:#endif
;3250:
;3251:/*
;3252:==================
;3253:BotAimAtEnemy
;3254:==================
;3255:*/
;3256:void BotAimAtEnemy(bot_state_t *bs) {
line 3260
;3257:	int i, enemyvisible;
;3258:	float dist, f, aim_skill, aim_accuracy, speed, reactiontime;
;3259:	vec3_t dir, bestorigin, end, start, groundtarget, cmdmove, enemyvelocity;
;3260:	vec3_t mins = {-4,-4,-4}, maxs = {4, 4, 4};
ADDRLP4 860
ADDRGP4 $1743
INDIRB
ASGNB 12
ADDRLP4 872
ADDRGP4 $1744
INDIRB
ASGNB 12
line 3268
;3261:	weaponinfo_t wi;
;3262:	aas_entityinfo_t entinfo;
;3263:	bot_goal_t goal;
;3264:	bsp_trace_t trace;
;3265:	vec3_t target;
;3266:
;3267:	//if the bot has no enemy
;3268:	if (bs->enemy < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1745
line 3269
;3269:		return;
ADDRGP4 $1742
JUMPV
LABELV $1745
line 3272
;3270:	}
;3271:	//get the enemy entity information
;3272:	BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3274
;3273:	//if this is not a player (should be an obelisk)
;3274:	if (bs->enemy >= MAX_CLIENTS) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 64
LTI4 $1747
line 3276
;3275:		//if the obelisk is visible
;3276:		VectorCopy(entinfo.origin, target);
ADDRLP4 824
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3279
;3277:#ifdef MISSIONPACK
;3278:		// if attacking an obelisk
;3279:		if ( bs->enemy == redobelisk.entitynum ||
ADDRLP4 984
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ASGNI4
ADDRLP4 984
INDIRI4
ADDRGP4 redobelisk+40
INDIRI4
EQI4 $1754
ADDRLP4 984
INDIRI4
ADDRGP4 blueobelisk+40
INDIRI4
NEI4 $1750
LABELV $1754
line 3280
;3280:			bs->enemy == blueobelisk.entitynum ) {
line 3281
;3281:			target[2] += 32;
ADDRLP4 824+8
ADDRLP4 824+8
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 3282
;3282:		}
LABELV $1750
line 3285
;3283:#endif
;3284:		//aim at the obelisk
;3285:		VectorSubtract(target, bs->eye, dir);
ADDRLP4 988
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 824
INDIRF4
ADDRLP4 988
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 824+4
INDIRF4
ADDRLP4 988
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 824+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3286
;3286:		vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 140
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3288
;3287:		//set the aim target before trying to attack
;3288:		VectorCopy(target, bs->aimtarget);
ADDRFP4 0
INDIRP4
CNSTI4 6220
ADDP4
ADDRLP4 824
INDIRB
ASGNB 12
line 3289
;3289:		return;
ADDRGP4 $1742
JUMPV
LABELV $1747
line 3294
;3290:	}
;3291:	//
;3292:	//BotAI_Print(PRT_MESSAGE, "client %d: aiming at client %d\n", bs->entitynum, bs->enemy);
;3293:	//
;3294:	aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 16
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 984
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 736
ADDRLP4 984
INDIRF4
ASGNF4
line 3295
;3295:	aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 7
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 988
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 988
INDIRF4
ASGNF4
line 3297
;3296:	//
;3297:	if (aim_skill > 0.95) {
ADDRLP4 736
INDIRF4
CNSTF4 1064514355
LEF4 $1760
line 3299
;3298:		//don't aim too early
;3299:		reactiontime = 0.5 * trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_REACTIONTIME, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 6
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 992
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 856
CNSTF4 1056964608
ADDRLP4 992
INDIRF4
MULF4
ASGNF4
line 3300
;3300:		if (bs->enemysight_time > FloatTime() - reactiontime) return;
ADDRFP4 0
INDIRP4
CNSTI4 6132
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
ADDRLP4 856
INDIRF4
SUBF4
LEF4 $1762
ADDRGP4 $1742
JUMPV
LABELV $1762
line 3301
;3301:		if (bs->teleport_time > FloatTime() - reactiontime) return;
ADDRFP4 0
INDIRP4
CNSTI4 6180
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
ADDRLP4 856
INDIRF4
SUBF4
LEF4 $1764
ADDRGP4 $1742
JUMPV
LABELV $1764
line 3302
;3302:	}
LABELV $1760
line 3305
;3303:
;3304:	//get the weapon information
;3305:	trap_BotGetWeaponInfo(bs->ws, bs->weaponnum, &wi);
ADDRLP4 992
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 992
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
ARGI4
ADDRLP4 992
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
ARGI4
ADDRLP4 160
ARGP4
ADDRGP4 trap_BotGetWeaponInfo
CALLV
pop
line 3307
;3306:	//get the weapon specific aim accuracy and or aim skill
;3307:	if (wi.number == WP_MACHINEGUN) {
ADDRLP4 160+4
INDIRI4
CNSTI4 2
NEI4 $1766
line 3308
;3308:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_MACHINEGUN, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 8
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3309
;3309:	}
ADDRGP4 $1767
JUMPV
LABELV $1766
line 3310
;3310:	else if (wi.number == WP_SHOTGUN) {
ADDRLP4 160+4
INDIRI4
CNSTI4 3
NEI4 $1769
line 3311
;3311:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_SHOTGUN, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 9
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3312
;3312:	}
ADDRGP4 $1770
JUMPV
LABELV $1769
line 3313
;3313:	else if (wi.number == WP_GRENADE_LAUNCHER) {
ADDRLP4 160+4
INDIRI4
CNSTI4 4
NEI4 $1772
line 3314
;3314:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_GRENADELAUNCHER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 11
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3315
;3315:		aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL_GRENADELAUNCHER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 18
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1000
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 736
ADDRLP4 1000
INDIRF4
ASGNF4
line 3316
;3316:	}
ADDRGP4 $1773
JUMPV
LABELV $1772
line 3317
;3317:	else if (wi.number == WP_ROCKET_LAUNCHER) {
ADDRLP4 160+4
INDIRI4
CNSTI4 5
NEI4 $1775
line 3318
;3318:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_ROCKETLAUNCHER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 10
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3319
;3319:		aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL_ROCKETLAUNCHER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 17
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1000
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 736
ADDRLP4 1000
INDIRF4
ASGNF4
line 3320
;3320:	}
ADDRGP4 $1776
JUMPV
LABELV $1775
line 3321
;3321:	else if (wi.number == WP_LIGHTNING) {
ADDRLP4 160+4
INDIRI4
CNSTI4 6
NEI4 $1778
line 3322
;3322:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_LIGHTNING, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 12
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3323
;3323:	}
ADDRGP4 $1779
JUMPV
LABELV $1778
line 3324
;3324:	else if (wi.number == WP_RAILGUN) {
ADDRLP4 160+4
INDIRI4
CNSTI4 7
NEI4 $1781
line 3325
;3325:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_RAILGUN, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 14
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3326
;3326:	}
ADDRGP4 $1782
JUMPV
LABELV $1781
line 3327
;3327:	else if (wi.number == WP_PLASMAGUN) {
ADDRLP4 160+4
INDIRI4
CNSTI4 8
NEI4 $1784
line 3328
;3328:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_PLASMAGUN, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 13
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3329
;3329:		aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL_PLASMAGUN, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 19
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1000
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 736
ADDRLP4 1000
INDIRF4
ASGNF4
line 3330
;3330:	}
ADDRGP4 $1785
JUMPV
LABELV $1784
line 3331
;3331:	else if (wi.number == WP_BFG) {
ADDRLP4 160+4
INDIRI4
CNSTI4 9
NEI4 $1787
line 3332
;3332:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_BFG10K, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 15
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3333
;3333:		aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL_BFG10K, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 20
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1000
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 736
ADDRLP4 1000
INDIRF4
ASGNF4
line 3334
;3334:	}
LABELV $1787
LABELV $1785
LABELV $1782
LABELV $1779
LABELV $1776
LABELV $1773
LABELV $1770
LABELV $1767
line 3336
;3335:	//
;3336:	if (aim_accuracy <= 0) aim_accuracy = 0.0001f;
ADDRLP4 156
INDIRF4
CNSTF4 0
GTF4 $1790
ADDRLP4 156
CNSTF4 953267991
ASGNF4
LABELV $1790
line 3338
;3337:	//get the enemy entity information
;3338:	BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3340
;3339:	//if the enemy is invisible then shoot crappy most of the time
;3340:	if (EntityIsInvisible(&entinfo)) {
ADDRLP4 0
ARGP4
ADDRLP4 996
ADDRGP4 EntityIsInvisible
CALLI4
ASGNI4
ADDRLP4 996
INDIRI4
CNSTI4 0
EQI4 $1792
line 3341
;3341:		if (random() > 0.1) aim_accuracy *= 0.4f;
ADDRLP4 1000
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1000
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1036831949
LEF4 $1794
ADDRLP4 156
CNSTF4 1053609165
ADDRLP4 156
INDIRF4
MULF4
ASGNF4
LABELV $1794
line 3342
;3342:	}
LABELV $1792
line 3344
;3343:	//
;3344:	VectorSubtract(entinfo.origin, entinfo.lastvisorigin, enemyvelocity);
ADDRLP4 712
ADDRLP4 0+24
INDIRF4
ADDRLP4 0+60
INDIRF4
SUBF4
ASGNF4
ADDRLP4 712+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 0+60+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 712+8
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 0+60+8
INDIRF4
SUBF4
ASGNF4
line 3345
;3345:	VectorScale(enemyvelocity, 1 / entinfo.update_time, enemyvelocity);
ADDRLP4 1000
CNSTF4 1065353216
ASGNF4
ADDRLP4 712
ADDRLP4 712
INDIRF4
ADDRLP4 1000
INDIRF4
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 712+4
ADDRLP4 712+4
INDIRF4
ADDRLP4 1000
INDIRF4
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 712+8
ADDRLP4 712+8
INDIRF4
CNSTF4 1065353216
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
line 3347
;3346:	//enemy origin and velocity is remembered every 0.5 seconds
;3347:	if (bs->enemyposition_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6140
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $1815
line 3349
;3348:		//
;3349:		bs->enemyposition_time = FloatTime() + 0.5;
ADDRFP4 0
INDIRP4
CNSTI4 6140
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 3350
;3350:		VectorCopy(enemyvelocity, bs->enemyvelocity);
ADDRFP4 0
INDIRP4
CNSTI4 6232
ADDP4
ADDRLP4 712
INDIRB
ASGNB 12
line 3351
;3351:		VectorCopy(entinfo.origin, bs->enemyorigin);
ADDRFP4 0
INDIRP4
CNSTI4 6244
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3352
;3352:	}
LABELV $1815
line 3354
;3353:	//if not extremely skilled
;3354:	if (aim_skill < 0.9) {
ADDRLP4 736
INDIRF4
CNSTF4 1063675494
GEF4 $1818
line 3355
;3355:		VectorSubtract(entinfo.origin, bs->enemyorigin, dir);
ADDRLP4 1004
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 1004
INDIRP4
CNSTI4 6244
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1004
INDIRP4
CNSTI4 6248
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 6252
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3357
;3356:		//if the enemy moved a bit
;3357:		if (VectorLengthSquared(dir) > Square(48)) {
ADDRLP4 140
ARGP4
ADDRLP4 1008
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1008
INDIRF4
CNSTF4 1158676480
LEF4 $1827
line 3359
;3358:			//if the enemy changed direction
;3359:			if (DotProduct(bs->enemyvelocity, enemyvelocity) < 0) {
ADDRLP4 1012
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1012
INDIRP4
CNSTI4 6232
ADDP4
INDIRF4
ADDRLP4 712
INDIRF4
MULF4
ADDRLP4 1012
INDIRP4
CNSTI4 6236
ADDP4
INDIRF4
ADDRLP4 712+4
INDIRF4
MULF4
ADDF4
ADDRLP4 1012
INDIRP4
CNSTI4 6240
ADDP4
INDIRF4
ADDRLP4 712+8
INDIRF4
MULF4
ADDF4
CNSTF4 0
GEF4 $1829
line 3361
;3360:				//aim accuracy should be worse now
;3361:				aim_accuracy *= 0.7f;
ADDRLP4 156
CNSTF4 1060320051
ADDRLP4 156
INDIRF4
MULF4
ASGNF4
line 3362
;3362:			}
LABELV $1829
line 3363
;3363:		}
LABELV $1827
line 3364
;3364:	}
LABELV $1818
line 3366
;3365:	//check visibility of enemy
;3366:	enemyvisible = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, bs->enemy);
ADDRLP4 1004
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1004
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 1004
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 1004
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 1004
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 1008
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 836
ADDRLP4 1008
INDIRF4
CVFI4 4
ASGNI4
line 3368
;3367:	//if the enemy is visible
;3368:	if (enemyvisible) {
ADDRLP4 836
INDIRI4
CNSTI4 0
EQI4 $1833
line 3370
;3369:		//
;3370:		VectorCopy(entinfo.origin, bestorigin);
ADDRLP4 724
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3371
;3371:		bestorigin[2] += 8;
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 3374
;3372:		//get the start point shooting from
;3373:		//NOTE: the x and y projectile start offsets are ignored
;3374:		VectorCopy(bs->origin, start);
ADDRLP4 844
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 3375
;3375:		start[2] += bs->cur_ps.viewheight;
ADDRLP4 844+8
ADDRLP4 844+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 3376
;3376:		start[2] += wi.offset[2];
ADDRLP4 844+8
ADDRLP4 844+8
INDIRF4
ADDRLP4 160+292+8
INDIRF4
ADDF4
ASGNF4
line 3378
;3377:		//
;3378:		BotAI_Trace(&trace, start, mins, maxs, bestorigin, bs->entitynum, MASK_SHOT);
ADDRLP4 740
ARGP4
ADDRLP4 844
ARGP4
ADDRLP4 860
ARGP4
ADDRLP4 872
ARGP4
ADDRLP4 724
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 100664321
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3380
;3379:		//if the enemy is NOT hit
;3380:		if (trace.fraction <= 1 && trace.ent != entinfo.number) {
ADDRLP4 740+8
INDIRF4
CNSTF4 1065353216
GTF4 $1841
ADDRLP4 740+80
INDIRI4
ADDRLP4 0+20
INDIRI4
EQI4 $1841
line 3381
;3381:			bestorigin[2] += 16;
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 3382
;3382:		}
LABELV $1841
line 3384
;3383:		//if it is not an instant hit weapon the bot might want to predict the enemy
;3384:		if (wi.speed) {
ADDRLP4 160+272
INDIRF4
CNSTF4 0
EQF4 $1847
line 3386
;3385:			//
;3386:			VectorSubtract(bestorigin, bs->origin, dir);
ADDRLP4 1012
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 724
INDIRF4
ADDRLP4 1012
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 724+4
INDIRF4
ADDRLP4 1012
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 724+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3387
;3387:			dist = VectorLength(dir);
ADDRLP4 140
ARGP4
ADDRLP4 1016
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 840
ADDRLP4 1016
INDIRF4
ASGNF4
line 3388
;3388:			VectorSubtract(entinfo.origin, bs->enemyorigin, dir);
ADDRLP4 1020
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 1020
INDIRP4
CNSTI4 6244
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1020
INDIRP4
CNSTI4 6248
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 6252
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3390
;3389:			//if the enemy is NOT pretty far away and strafing just small steps left and right
;3390:			if (!(dist > 100 && VectorLengthSquared(dir) < Square(32))) {
ADDRLP4 840
INDIRF4
CNSTF4 1120403456
LEF4 $1863
ADDRLP4 140
ARGP4
ADDRLP4 1024
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1024
INDIRF4
CNSTF4 1149239296
LTF4 $1861
LABELV $1863
line 3392
;3391:				//if skilled anough do exact prediction
;3392:				if (aim_skill > 0.8 &&
ADDRLP4 736
INDIRF4
CNSTF4 1061997773
LEF4 $1864
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1864
line 3394
;3393:						//if the weapon is ready to fire
;3394:						bs->cur_ps.weaponstate == WEAPON_READY) {
line 3398
;3395:					aas_clientmove_t move;
;3396:					vec3_t origin;
;3397:
;3398:					VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 1124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 1124
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1124
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3400
;3399:					//distance towards the enemy
;3400:					dist = VectorLength(dir);
ADDRLP4 140
ARGP4
ADDRLP4 1128
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 840
ADDRLP4 1128
INDIRF4
ASGNF4
line 3402
;3401:					//direction the enemy is moving in
;3402:					VectorSubtract(entinfo.origin, entinfo.lastvisorigin, dir);
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 0+60
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 0+60+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 0+60+8
INDIRF4
SUBF4
ASGNF4
line 3404
;3403:					//
;3404:					VectorScale(dir, 1 / entinfo.update_time, dir);
ADDRLP4 1132
CNSTF4 1065353216
ASGNF4
ADDRLP4 140
ADDRLP4 140
INDIRF4
ADDRLP4 1132
INDIRF4
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 140+4
INDIRF4
ADDRLP4 1132
INDIRF4
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 140+8
INDIRF4
CNSTF4 1065353216
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
line 3406
;3405:					//
;3406:					VectorCopy(entinfo.origin, origin);
ADDRLP4 1028
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3407
;3407:					origin[2] += 1;
ADDRLP4 1028+8
ADDRLP4 1028+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 3409
;3408:					//
;3409:					VectorClear(cmdmove);
ADDRLP4 1136
CNSTF4 0
ASGNF4
ADDRLP4 968+8
ADDRLP4 1136
INDIRF4
ASGNF4
ADDRLP4 968+4
ADDRLP4 1136
INDIRF4
ASGNF4
ADDRLP4 968
ADDRLP4 1136
INDIRF4
ASGNF4
line 3411
;3410:					//AAS_ClearShownDebugLines();
;3411:					trap_AAS_PredictClientMovement(&move, bs->enemy, origin,
ADDRLP4 1040
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 1140
CNSTI4 0
ASGNI4
ADDRLP4 1140
INDIRI4
ARGI4
ADDRLP4 140
ARGP4
ADDRLP4 968
ARGP4
ADDRLP4 1140
INDIRI4
ARGI4
CNSTF4 1092616192
ADDRLP4 840
INDIRF4
MULF4
ADDRLP4 160+272
INDIRF4
DIVF4
CVFI4 4
ARGI4
CNSTF4 1036831949
ARGF4
ADDRLP4 1140
INDIRI4
ARGI4
ADDRLP4 1140
INDIRI4
ARGI4
ADDRLP4 1140
INDIRI4
ARGI4
ADDRGP4 trap_AAS_PredictClientMovement
CALLI4
pop
line 3415
;3412:														PRESENCE_CROUCH, qfalse,
;3413:														dir, cmdmove, 0,
;3414:														dist * 10 / wi.speed, 0.1f, 0, 0, qfalse);
;3415:					VectorCopy(move.endpos, bestorigin);
ADDRLP4 724
ADDRLP4 1040
INDIRB
ASGNB 12
line 3417
;3416:					//BotAI_Print(PRT_MESSAGE, "%1.1f predicted speed = %f, frames = %f\n", FloatTime(), VectorLength(dir), dist * 10 / wi.speed);
;3417:				}
ADDRGP4 $1865
JUMPV
LABELV $1864
line 3419
;3418:				//if not that skilled do linear prediction
;3419:				else if (aim_skill > 0.4) {
ADDRLP4 736
INDIRF4
CNSTF4 1053609165
LEF4 $1897
line 3420
;3420:					VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 1028
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 1028
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1028
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3422
;3421:					//distance towards the enemy
;3422:					dist = VectorLength(dir);
ADDRLP4 140
ARGP4
ADDRLP4 1032
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 840
ADDRLP4 1032
INDIRF4
ASGNF4
line 3424
;3423:					//direction the enemy is moving in
;3424:					VectorSubtract(entinfo.origin, entinfo.lastvisorigin, dir);
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 0+60
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 0+60+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 0+60+8
INDIRF4
SUBF4
ASGNF4
line 3425
;3425:					dir[2] = 0;
ADDRLP4 140+8
CNSTF4 0
ASGNF4
line 3427
;3426:					//
;3427:					speed = VectorNormalize(dir) / entinfo.update_time;
ADDRLP4 140
ARGP4
ADDRLP4 1036
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 980
ADDRLP4 1036
INDIRF4
ADDRLP4 0+16
INDIRF4
DIVF4
ASGNF4
line 3430
;3428:					//botimport.Print(PRT_MESSAGE, "speed = %f, wi->speed = %f\n", speed, wi->speed);
;3429:					//best spot to aim at
;3430:					VectorMA(entinfo.origin, (dist / wi.speed) * speed, dir, bestorigin);
ADDRLP4 1040
ADDRLP4 840
INDIRF4
ASGNF4
ADDRLP4 1044
ADDRLP4 980
INDIRF4
ASGNF4
ADDRLP4 724
ADDRLP4 0+24
INDIRF4
ADDRLP4 140
INDIRF4
ADDRLP4 1040
INDIRF4
ADDRLP4 160+272
INDIRF4
DIVF4
ADDRLP4 1044
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 724+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 140+4
INDIRF4
ADDRLP4 1040
INDIRF4
ADDRLP4 160+272
INDIRF4
DIVF4
ADDRLP4 1044
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 724+8
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 140+8
INDIRF4
ADDRLP4 840
INDIRF4
ADDRLP4 160+272
INDIRF4
DIVF4
ADDRLP4 980
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 3431
;3431:				}
LABELV $1897
LABELV $1865
line 3432
;3432:			}
LABELV $1861
line 3433
;3433:		}
LABELV $1847
line 3435
;3434:		//if the projectile does radial damage
;3435:		if (aim_skill > 0.6 && wi.proj.damagetype & DAMAGETYPE_RADIAL) {
ADDRLP4 736
INDIRF4
CNSTF4 1058642330
LEF4 $1932
ADDRLP4 160+344+180
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1932
line 3437
;3436:			//if the enemy isn't standing significantly higher than the bot
;3437:			if (entinfo.origin[2] < bs->origin[2] + 16) {
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
CNSTF4 1098907648
ADDF4
GEF4 $1936
line 3439
;3438:				//try to aim at the ground in front of the enemy
;3439:				VectorCopy(entinfo.origin, end);
ADDRLP4 956
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3440
;3440:				end[2] -= 64;
ADDRLP4 956+8
ADDRLP4 956+8
INDIRF4
CNSTF4 1115684864
SUBF4
ASGNF4
line 3441
;3441:				BotAI_Trace(&trace, entinfo.origin, NULL, NULL, end, entinfo.number, MASK_SHOT);
ADDRLP4 740
ARGP4
ADDRLP4 0+24
ARGP4
ADDRLP4 1012
CNSTP4 0
ASGNP4
ADDRLP4 1012
INDIRP4
ARGP4
ADDRLP4 1012
INDIRP4
ARGP4
ADDRLP4 956
ARGP4
ADDRLP4 0+20
INDIRI4
ARGI4
CNSTI4 100664321
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3443
;3442:				//
;3443:				VectorCopy(bestorigin, groundtarget);
ADDRLP4 944
ADDRLP4 724
INDIRB
ASGNB 12
line 3444
;3444:				if (trace.startsolid) groundtarget[2] = entinfo.origin[2] - 16;
ADDRLP4 740+4
INDIRI4
CNSTI4 0
EQI4 $1944
ADDRLP4 944+8
ADDRLP4 0+24+8
INDIRF4
CNSTF4 1098907648
SUBF4
ASGNF4
ADDRGP4 $1945
JUMPV
LABELV $1944
line 3445
;3445:				else groundtarget[2] = trace.endpos[2] - 8;
ADDRLP4 944+8
ADDRLP4 740+12+8
INDIRF4
CNSTF4 1090519040
SUBF4
ASGNF4
LABELV $1945
line 3447
;3446:				//trace a line from projectile start to ground target
;3447:				BotAI_Trace(&trace, start, NULL, NULL, groundtarget, bs->entitynum, MASK_SHOT);
ADDRLP4 740
ARGP4
ADDRLP4 844
ARGP4
ADDRLP4 1016
CNSTP4 0
ASGNP4
ADDRLP4 1016
INDIRP4
ARGP4
ADDRLP4 1016
INDIRP4
ARGP4
ADDRLP4 944
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 100664321
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3449
;3448:				//if hitpoint is not vertically too far from the ground target
;3449:				if (fabs(trace.endpos[2] - groundtarget[2]) < 50) {
ADDRLP4 740+12+8
INDIRF4
ADDRLP4 944+8
INDIRF4
SUBF4
ARGF4
ADDRLP4 1020
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 1020
INDIRF4
CNSTF4 1112014848
GEF4 $1953
line 3450
;3450:					VectorSubtract(trace.endpos, groundtarget, dir);
ADDRLP4 140
ADDRLP4 740+12
INDIRF4
ADDRLP4 944
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 740+12+4
INDIRF4
ADDRLP4 944+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 740+12+8
INDIRF4
ADDRLP4 944+8
INDIRF4
SUBF4
ASGNF4
line 3452
;3451:					//if the hitpoint is near anough the ground target
;3452:					if (VectorLengthSquared(dir) < Square(60)) {
ADDRLP4 140
ARGP4
ADDRLP4 1024
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1024
INDIRF4
CNSTF4 1163984896
GEF4 $1967
line 3453
;3453:						VectorSubtract(trace.endpos, start, dir);
ADDRLP4 140
ADDRLP4 740+12
INDIRF4
ADDRLP4 844
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 740+12+4
INDIRF4
ADDRLP4 844+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 740+12+8
INDIRF4
ADDRLP4 844+8
INDIRF4
SUBF4
ASGNF4
line 3455
;3454:						//if the hitpoint is far anough from the bot
;3455:						if (VectorLengthSquared(dir) > Square(100)) {
ADDRLP4 140
ARGP4
ADDRLP4 1028
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1028
INDIRF4
CNSTF4 1176256512
LEF4 $1978
line 3457
;3456:							//check if the bot is visible from the ground target
;3457:							trace.endpos[2] += 1;
ADDRLP4 740+12+8
ADDRLP4 740+12+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 3458
;3458:							BotAI_Trace(&trace, trace.endpos, NULL, NULL, entinfo.origin, entinfo.number, MASK_SHOT);
ADDRLP4 740
ARGP4
ADDRLP4 740+12
ARGP4
ADDRLP4 1032
CNSTP4 0
ASGNP4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 0+24
ARGP4
ADDRLP4 0+20
INDIRI4
ARGI4
CNSTI4 100664321
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3459
;3459:							if (trace.fraction >= 1) {
ADDRLP4 740+8
INDIRF4
CNSTF4 1065353216
LTF4 $1985
line 3461
;3460:								//botimport.Print(PRT_MESSAGE, "%1.1f aiming at ground\n", AAS_Time());
;3461:								VectorCopy(groundtarget, bestorigin);
ADDRLP4 724
ADDRLP4 944
INDIRB
ASGNB 12
line 3462
;3462:							}
LABELV $1985
line 3463
;3463:						}
LABELV $1978
line 3464
;3464:					}
LABELV $1967
line 3465
;3465:				}
LABELV $1953
line 3466
;3466:			}
LABELV $1936
line 3467
;3467:		}
LABELV $1932
line 3468
;3468:		bestorigin[0] += 20 * crandom() * (1 - aim_accuracy);
ADDRLP4 1012
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 724
ADDRLP4 724
INDIRF4
CNSTF4 1101004800
CNSTF4 1073741824
ADDRLP4 1012
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3469
;3469:		bestorigin[1] += 20 * crandom() * (1 - aim_accuracy);
ADDRLP4 1016
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 724+4
ADDRLP4 724+4
INDIRF4
CNSTF4 1101004800
CNSTF4 1073741824
ADDRLP4 1016
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3470
;3470:		bestorigin[2] += 10 * crandom() * (1 - aim_accuracy);
ADDRLP4 1020
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1092616192
CNSTF4 1073741824
ADDRLP4 1020
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3471
;3471:	}
ADDRGP4 $1834
JUMPV
LABELV $1833
line 3472
;3472:	else {
line 3474
;3473:		//
;3474:		VectorCopy(bs->lastenemyorigin, bestorigin);
ADDRLP4 724
ADDRFP4 0
INDIRP4
CNSTI4 6548
ADDP4
INDIRB
ASGNB 12
line 3475
;3475:		bestorigin[2] += 8;
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 3477
;3476:		//if the bot is skilled anough
;3477:		if (aim_skill > 0.5) {
ADDRLP4 736
INDIRF4
CNSTF4 1056964608
LEF4 $1991
line 3479
;3478:			//do prediction shots around corners
;3479:			if (wi.number == WP_BFG ||
ADDRLP4 160+4
INDIRI4
CNSTI4 9
EQI4 $1999
ADDRLP4 160+4
INDIRI4
CNSTI4 5
EQI4 $1999
ADDRLP4 160+4
INDIRI4
CNSTI4 4
NEI4 $1993
LABELV $1999
line 3481
;3480:				wi.number == WP_ROCKET_LAUNCHER ||
;3481:				wi.number == WP_GRENADE_LAUNCHER) {
line 3483
;3482:				//create the chase goal
;3483:				goal.entitynum = bs->client;
ADDRLP4 884+40
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 3484
;3484:				goal.areanum = bs->areanum;
ADDRLP4 884+12
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ASGNI4
line 3485
;3485:				VectorCopy(bs->eye, goal.origin);
ADDRLP4 884
ADDRFP4 0
INDIRP4
CNSTI4 4936
ADDP4
INDIRB
ASGNB 12
line 3486
;3486:				VectorSet(goal.mins, -8, -8, -8);
ADDRLP4 884+16
CNSTF4 3238002688
ASGNF4
ADDRLP4 884+16+4
CNSTF4 3238002688
ASGNF4
ADDRLP4 884+16+8
CNSTF4 3238002688
ASGNF4
line 3487
;3487:				VectorSet(goal.maxs, 8, 8, 8);
ADDRLP4 884+28
CNSTF4 1090519040
ASGNF4
ADDRLP4 884+28+4
CNSTF4 1090519040
ASGNF4
ADDRLP4 884+28+8
CNSTF4 1090519040
ASGNF4
line 3489
;3488:				//
;3489:				if (trap_BotPredictVisiblePosition(bs->lastenemyorigin, bs->lastenemyareanum, &goal, TFL_DEFAULT, target)) {
ADDRLP4 1012
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1012
INDIRP4
CNSTI4 6548
ADDP4
ARGP4
ADDRLP4 1012
INDIRP4
CNSTI4 6544
ADDP4
INDIRI4
ARGI4
ADDRLP4 884
ARGP4
CNSTI4 18616254
ARGI4
ADDRLP4 824
ARGP4
ADDRLP4 1016
ADDRGP4 trap_BotPredictVisiblePosition
CALLI4
ASGNI4
ADDRLP4 1016
INDIRI4
CNSTI4 0
EQI4 $2012
line 3490
;3490:					VectorSubtract(target, bs->eye, dir);
ADDRLP4 1020
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 824
INDIRF4
ADDRLP4 1020
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 824+4
INDIRF4
ADDRLP4 1020
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 824+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3491
;3491:					if (VectorLengthSquared(dir) > Square(80)) {
ADDRLP4 140
ARGP4
ADDRLP4 1024
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1024
INDIRF4
CNSTF4 1170735104
LEF4 $2018
line 3492
;3492:						VectorCopy(target, bestorigin);
ADDRLP4 724
ADDRLP4 824
INDIRB
ASGNB 12
line 3493
;3493:						bestorigin[2] -= 20;
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1101004800
SUBF4
ASGNF4
line 3494
;3494:					}
LABELV $2018
line 3495
;3495:				}
LABELV $2012
line 3496
;3496:				aim_accuracy = 1;
ADDRLP4 156
CNSTF4 1065353216
ASGNF4
line 3497
;3497:			}
LABELV $1993
line 3498
;3498:		}
LABELV $1991
line 3499
;3499:	}
LABELV $1834
line 3501
;3500:	//
;3501:	if (enemyvisible) {
ADDRLP4 836
INDIRI4
CNSTI4 0
EQI4 $2021
line 3502
;3502:		BotAI_Trace(&trace, bs->eye, NULL, NULL, bestorigin, bs->entitynum, MASK_SHOT);
ADDRLP4 740
ARGP4
ADDRLP4 1012
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1012
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 1016
CNSTP4 0
ASGNP4
ADDRLP4 1016
INDIRP4
ARGP4
ADDRLP4 1016
INDIRP4
ARGP4
ADDRLP4 724
ARGP4
ADDRLP4 1012
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 100664321
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3503
;3503:		VectorCopy(trace.endpos, bs->aimtarget);
ADDRFP4 0
INDIRP4
CNSTI4 6220
ADDP4
ADDRLP4 740+12
INDIRB
ASGNB 12
line 3504
;3504:	}
ADDRGP4 $2022
JUMPV
LABELV $2021
line 3505
;3505:	else {
line 3506
;3506:		VectorCopy(bestorigin, bs->aimtarget);
ADDRFP4 0
INDIRP4
CNSTI4 6220
ADDP4
ADDRLP4 724
INDIRB
ASGNB 12
line 3507
;3507:	}
LABELV $2022
line 3509
;3508:	//get aim direction
;3509:	VectorSubtract(bestorigin, bs->eye, dir);
ADDRLP4 1012
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 724
INDIRF4
ADDRLP4 1012
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 724+4
INDIRF4
ADDRLP4 1012
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 724+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3511
;3510:	//
;3511:	if (wi.number == WP_MACHINEGUN ||
ADDRLP4 160+4
INDIRI4
CNSTI4 2
EQI4 $2036
ADDRLP4 160+4
INDIRI4
CNSTI4 3
EQI4 $2036
ADDRLP4 160+4
INDIRI4
CNSTI4 6
EQI4 $2036
ADDRLP4 160+4
INDIRI4
CNSTI4 7
NEI4 $2028
LABELV $2036
line 3514
;3512:		wi.number == WP_SHOTGUN ||
;3513:		wi.number == WP_LIGHTNING ||
;3514:		wi.number == WP_RAILGUN) {
line 3516
;3515:		//distance towards the enemy
;3516:		dist = VectorLength(dir);
ADDRLP4 140
ARGP4
ADDRLP4 1016
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 840
ADDRLP4 1016
INDIRF4
ASGNF4
line 3517
;3517:		if (dist > 150) dist = 150;
ADDRLP4 840
INDIRF4
CNSTF4 1125515264
LEF4 $2037
ADDRLP4 840
CNSTF4 1125515264
ASGNF4
LABELV $2037
line 3518
;3518:		f = 0.6 + dist / 150 * 0.4;
ADDRLP4 940
CNSTF4 1053609165
ADDRLP4 840
INDIRF4
CNSTF4 1125515264
DIVF4
MULF4
CNSTF4 1058642330
ADDF4
ASGNF4
line 3519
;3519:		aim_accuracy *= f;
ADDRLP4 156
ADDRLP4 156
INDIRF4
ADDRLP4 940
INDIRF4
MULF4
ASGNF4
line 3520
;3520:	}
LABELV $2028
line 3522
;3521:	//add some random stuff to the aim direction depending on the aim accuracy
;3522:	if (aim_accuracy < 0.8) {
ADDRLP4 156
INDIRF4
CNSTF4 1061997773
GEF4 $2039
line 3523
;3523:		VectorNormalize(dir);
ADDRLP4 140
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3524
;3524:		for (i = 0; i < 3; i++) dir[i] += 0.3 * crandom() * (1 - aim_accuracy);
ADDRLP4 152
CNSTI4 0
ASGNI4
LABELV $2041
ADDRLP4 1016
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1020
ADDRLP4 152
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 140
ADDP4
ASGNP4
ADDRLP4 1020
INDIRP4
ADDRLP4 1020
INDIRP4
INDIRF4
CNSTF4 1050253722
CNSTF4 1073741824
ADDRLP4 1016
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
LABELV $2042
ADDRLP4 152
ADDRLP4 152
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 3
LTI4 $2041
line 3525
;3525:	}
LABELV $2039
line 3527
;3526:	//set the ideal view angles
;3527:	vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 140
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3529
;3528:	//take the weapon spread into account for lower skilled bots
;3529:	bs->ideal_viewangles[PITCH] += 6 * wi.vspread * crandom() * (1 - aim_accuracy);
ADDRLP4 1016
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1020
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ASGNP4
ADDRLP4 1020
INDIRP4
ADDRLP4 1020
INDIRP4
INDIRF4
CNSTF4 1086324736
ADDRLP4 160+268
INDIRF4
MULF4
CNSTF4 1073741824
ADDRLP4 1016
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3530
;3530:	bs->ideal_viewangles[PITCH] = AngleMod(bs->ideal_viewangles[PITCH]);
ADDRLP4 1024
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ASGNP4
ADDRLP4 1024
INDIRP4
INDIRF4
ARGF4
ADDRLP4 1028
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 1024
INDIRP4
ADDRLP4 1028
INDIRF4
ASGNF4
line 3531
;3531:	bs->ideal_viewangles[YAW] += 6 * wi.hspread * crandom() * (1 - aim_accuracy);
ADDRLP4 1032
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1036
ADDRFP4 0
INDIRP4
CNSTI4 6580
ADDP4
ASGNP4
ADDRLP4 1036
INDIRP4
ADDRLP4 1036
INDIRP4
INDIRF4
CNSTF4 1086324736
ADDRLP4 160+264
INDIRF4
MULF4
CNSTF4 1073741824
ADDRLP4 1032
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3532
;3532:	bs->ideal_viewangles[YAW] = AngleMod(bs->ideal_viewangles[YAW]);
ADDRLP4 1040
ADDRFP4 0
INDIRP4
CNSTI4 6580
ADDP4
ASGNP4
ADDRLP4 1040
INDIRP4
INDIRF4
ARGF4
ADDRLP4 1044
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 1040
INDIRP4
ADDRLP4 1044
INDIRF4
ASGNF4
line 3534
;3533:	//if the bots should be really challenging
;3534:	if (bot_challenge.integer) {
ADDRGP4 bot_challenge+12
INDIRI4
CNSTI4 0
EQI4 $2047
line 3536
;3535:		//if the bot is really accurate and has the enemy in view for some time
;3536:		if (aim_accuracy > 0.9 && bs->enemysight_time < FloatTime() - 1) {
ADDRLP4 156
INDIRF4
CNSTF4 1063675494
LEF4 $2050
ADDRFP4 0
INDIRP4
CNSTI4 6132
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
GEF4 $2050
line 3538
;3537:			//set the view angles directly
;3538:			if (bs->ideal_viewangles[PITCH] > 180) bs->ideal_viewangles[PITCH] -= 360;
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
INDIRF4
CNSTF4 1127481344
LEF4 $2052
ADDRLP4 1048
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ASGNP4
ADDRLP4 1048
INDIRP4
ADDRLP4 1048
INDIRP4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $2052
line 3539
;3539:			VectorCopy(bs->ideal_viewangles, bs->viewangles);
ADDRLP4 1052
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1052
INDIRP4
CNSTI4 6564
ADDP4
ADDRLP4 1052
INDIRP4
CNSTI4 6576
ADDP4
INDIRB
ASGNB 12
line 3540
;3540:			trap_EA_View(bs->client, bs->viewangles);
ADDRLP4 1056
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1056
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 1056
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
ADDRGP4 trap_EA_View
CALLV
pop
line 3541
;3541:		}
LABELV $2050
line 3542
;3542:	}
LABELV $2047
line 3543
;3543:}
LABELV $1742
endproc BotAimAtEnemy 1144 52
lit
align 4
LABELV $2055
byte 4 3238002688
byte 4 3238002688
byte 4 3238002688
align 4
LABELV $2056
byte 4 1090519040
byte 4 1090519040
byte 4 1090519040
export BotCheckAttack
code
proc BotCheckAttack 1028 28
line 3550
;3544:
;3545:/*
;3546:==================
;3547:BotCheckAttack
;3548:==================
;3549:*/
;3550:void BotCheckAttack(bot_state_t *bs) {
line 3559
;3551:	float points, reactiontime, fov, firethrottle;
;3552:	int attackentity;
;3553:	bsp_trace_t bsptrace;
;3554:	//float selfpreservation;
;3555:	vec3_t forward, right, start, end, dir, angles;
;3556:	weaponinfo_t wi;
;3557:	bsp_trace_t trace;
;3558:	aas_entityinfo_t entinfo;
;3559:	vec3_t mins = {-8, -8, -8}, maxs = {8, 8, 8};
ADDRLP4 948
ADDRGP4 $2055
INDIRB
ASGNB 12
ADDRLP4 960
ADDRGP4 $2056
INDIRB
ASGNB 12
line 3561
;3560:
;3561:	attackentity = bs->enemy;
ADDRLP4 576
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ASGNI4
line 3563
;3562:	//
;3563:	BotEntityInfo(attackentity, &entinfo);
ADDRLP4 576
INDIRI4
ARGI4
ADDRLP4 788
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3565
;3564:	// if not attacking a player
;3565:	if (attackentity >= MAX_CLIENTS) {
ADDRLP4 576
INDIRI4
CNSTI4 64
LTI4 $2057
line 3568
;3566:#ifdef MISSIONPACK
;3567:		// if attacking an obelisk
;3568:		if ( entinfo.number == redobelisk.entitynum ||
ADDRLP4 788+20
INDIRI4
ADDRGP4 redobelisk+40
INDIRI4
EQI4 $2065
ADDRLP4 788+20
INDIRI4
ADDRGP4 blueobelisk+40
INDIRI4
NEI4 $2059
LABELV $2065
line 3569
;3569:			entinfo.number == blueobelisk.entitynum ) {
line 3571
;3570:			// if obelisk is respawning return
;3571:			if ( g_entities[entinfo.number].activator &&
ADDRLP4 976
CNSTI4 868
ASGNI4
ADDRLP4 976
INDIRI4
ADDRLP4 788+20
INDIRI4
MULI4
ADDRGP4 g_entities+780
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2066
ADDRLP4 976
INDIRI4
ADDRLP4 788+20
INDIRI4
MULI4
ADDRGP4 g_entities+780
ADDP4
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2066
line 3572
;3572:				g_entities[entinfo.number].activator->s.frame == 2 ) {
line 3573
;3573:				return;
ADDRGP4 $2054
JUMPV
LABELV $2066
line 3575
;3574:			}
;3575:		}
LABELV $2059
line 3577
;3576:#endif
;3577:	}
LABELV $2057
line 3579
;3578:	//
;3579:	reactiontime = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_REACTIONTIME, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 6
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 976
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 700
ADDRLP4 976
INDIRF4
ASGNF4
line 3580
;3580:	if (bs->enemysight_time > FloatTime() - reactiontime) return;
ADDRFP4 0
INDIRP4
CNSTI4 6132
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
ADDRLP4 700
INDIRF4
SUBF4
LEF4 $2072
ADDRGP4 $2054
JUMPV
LABELV $2072
line 3581
;3581:	if (bs->teleport_time > FloatTime() - reactiontime) return;
ADDRFP4 0
INDIRP4
CNSTI4 6180
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
ADDRLP4 700
INDIRF4
SUBF4
LEF4 $2074
ADDRGP4 $2054
JUMPV
LABELV $2074
line 3583
;3582:	//if changing weapons
;3583:	if (bs->weaponchange_time > FloatTime() - 0.1) return;
ADDRFP4 0
INDIRP4
CNSTI4 6192
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1036831949
SUBF4
LEF4 $2076
ADDRGP4 $2054
JUMPV
LABELV $2076
line 3585
;3584:	//check fire throttle characteristic
;3585:	if (bs->firethrottlewait_time > FloatTime()) return;
ADDRFP4 0
INDIRP4
CNSTI4 6196
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $2078
ADDRGP4 $2054
JUMPV
LABELV $2078
line 3586
;3586:	firethrottle = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_FIRETHROTTLE, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 47
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 980
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 932
ADDRLP4 980
INDIRF4
ASGNF4
line 3587
;3587:	if (bs->firethrottleshoot_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6200
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $2080
line 3588
;3588:		if (random() > firethrottle) {
ADDRLP4 984
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 984
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 932
INDIRF4
LEF4 $2082
line 3589
;3589:			bs->firethrottlewait_time = FloatTime() + firethrottle;
ADDRFP4 0
INDIRP4
CNSTI4 6196
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 932
INDIRF4
ADDF4
ASGNF4
line 3590
;3590:			bs->firethrottleshoot_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6200
ADDP4
CNSTF4 0
ASGNF4
line 3591
;3591:		}
ADDRGP4 $2083
JUMPV
LABELV $2082
line 3592
;3592:		else {
line 3593
;3593:			bs->firethrottleshoot_time = FloatTime() + 1 - firethrottle;
ADDRFP4 0
INDIRP4
CNSTI4 6200
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
ADDF4
ADDRLP4 932
INDIRF4
SUBF4
ASGNF4
line 3594
;3594:			bs->firethrottlewait_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6196
ADDP4
CNSTF4 0
ASGNF4
line 3595
;3595:		}
LABELV $2083
line 3596
;3596:	}
LABELV $2080
line 3599
;3597:	//
;3598:	//
;3599:	VectorSubtract(bs->aimtarget, bs->eye, dir);
ADDRLP4 984
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 580
ADDRLP4 984
INDIRP4
CNSTI4 6220
ADDP4
INDIRF4
ADDRLP4 984
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 580+4
ADDRLP4 984
INDIRP4
CNSTI4 6224
ADDP4
INDIRF4
ADDRLP4 984
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 988
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 580+8
ADDRLP4 988
INDIRP4
CNSTI4 6228
ADDP4
INDIRF4
ADDRLP4 988
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3601
;3600:	//
;3601:	if (bs->weaponnum == WP_GAUNTLET) {
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2086
line 3602
;3602:		if (VectorLengthSquared(dir) > Square(60)) {
ADDRLP4 580
ARGP4
ADDRLP4 992
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 992
INDIRF4
CNSTF4 1163984896
LEF4 $2088
line 3603
;3603:			return;
ADDRGP4 $2054
JUMPV
LABELV $2088
line 3605
;3604:		}
;3605:	}
LABELV $2086
line 3606
;3606:	if (VectorLengthSquared(dir) < Square(100))
ADDRLP4 580
ARGP4
ADDRLP4 992
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 992
INDIRF4
CNSTF4 1176256512
GEF4 $2090
line 3607
;3607:		fov = 120;
ADDRLP4 928
CNSTF4 1123024896
ASGNF4
ADDRGP4 $2091
JUMPV
LABELV $2090
line 3609
;3608:	else
;3609:		fov = 50;
ADDRLP4 928
CNSTF4 1112014848
ASGNF4
LABELV $2091
line 3611
;3610:	//
;3611:	vectoangles(dir, angles);
ADDRLP4 580
ARGP4
ADDRLP4 936
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3612
;3612:	if (!InFieldOfVision(bs->viewangles, fov, angles))
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
ADDRLP4 928
INDIRF4
ARGF4
ADDRLP4 936
ARGP4
ADDRLP4 996
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 996
INDIRI4
CNSTI4 0
NEI4 $2092
line 3613
;3613:		return;
ADDRGP4 $2054
JUMPV
LABELV $2092
line 3614
;3614:	BotAI_Trace(&bsptrace, bs->eye, NULL, NULL, bs->aimtarget, bs->client, CONTENTS_SOLID|CONTENTS_PLAYERCLIP);
ADDRLP4 704
ARGP4
ADDRLP4 1000
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1000
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 1004
CNSTP4 0
ASGNP4
ADDRLP4 1004
INDIRP4
ARGP4
ADDRLP4 1004
INDIRP4
ARGP4
ADDRLP4 1000
INDIRP4
CNSTI4 6220
ADDP4
ARGP4
ADDRLP4 1000
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
line 3615
;3615:	if (bsptrace.fraction < 1 && bsptrace.ent != attackentity)
ADDRLP4 704+8
INDIRF4
CNSTF4 1065353216
GEF4 $2094
ADDRLP4 704+80
INDIRI4
ADDRLP4 576
INDIRI4
EQI4 $2094
line 3616
;3616:		return;
ADDRGP4 $2054
JUMPV
LABELV $2094
line 3619
;3617:
;3618:	//get the weapon info
;3619:	trap_BotGetWeaponInfo(bs->ws, bs->weaponnum, &wi);
ADDRLP4 1008
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1008
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
ARGI4
ADDRLP4 1008
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRGP4 trap_BotGetWeaponInfo
CALLV
pop
line 3621
;3620:	//get the start point shooting from
;3621:	VectorCopy(bs->origin, start);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 3622
;3622:	start[2] += bs->cur_ps.viewheight;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 3623
;3623:	AngleVectors(bs->viewangles, forward, right, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 676
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3624
;3624:	start[0] += forward[0] * wi.offset[0] + right[0] * wi.offset[1];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 24+292
INDIRF4
MULF4
ADDRLP4 676
INDIRF4
ADDRLP4 24+292+4
INDIRF4
MULF4
ADDF4
ADDF4
ASGNF4
line 3625
;3625:	start[1] += forward[1] * wi.offset[0] + right[1] * wi.offset[1];
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 24+292
INDIRF4
MULF4
ADDRLP4 676+4
INDIRF4
ADDRLP4 24+292+4
INDIRF4
MULF4
ADDF4
ADDF4
ASGNF4
line 3626
;3626:	start[2] += forward[2] * wi.offset[0] + right[2] * wi.offset[1] + wi.offset[2];
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
ADDRLP4 24+292
INDIRF4
MULF4
ADDRLP4 676+8
INDIRF4
ADDRLP4 24+292+4
INDIRF4
MULF4
ADDF4
ADDRLP4 24+292+8
INDIRF4
ADDF4
ADDF4
ASGNF4
line 3628
;3627:	//end point aiming at
;3628:	VectorMA(start, 1000, forward, end);
ADDRLP4 1012
CNSTF4 1148846080
ASGNF4
ADDRLP4 688
ADDRLP4 0
INDIRF4
ADDRLP4 1012
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 688+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 1012
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 688+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1148846080
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3630
;3629:	//a little back to make sure not inside a very close enemy
;3630:	VectorMA(start, -12, forward, start);
ADDRLP4 1016
CNSTF4 3242196992
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 1016
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 1016
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 3242196992
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3631
;3631:	BotAI_Trace(&trace, start, mins, maxs, end, bs->entitynum, MASK_SHOT);
ADDRLP4 592
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 948
ARGP4
ADDRLP4 960
ARGP4
ADDRLP4 688
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 100664321
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3633
;3632:	//if the entity is a client
;3633:	if (trace.ent > 0 && trace.ent <= MAX_CLIENTS) {
ADDRLP4 592+80
INDIRI4
CNSTI4 0
LEI4 $2128
ADDRLP4 592+80
INDIRI4
CNSTI4 64
GTI4 $2128
line 3634
;3634:		if (trace.ent != attackentity) {
ADDRLP4 592+80
INDIRI4
ADDRLP4 576
INDIRI4
EQI4 $2132
line 3636
;3635:			//if a teammate is hit
;3636:			if (BotSameTeam(bs, trace.ent))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 592+80
INDIRI4
ARGI4
ADDRLP4 1020
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1020
INDIRI4
CNSTI4 0
EQI4 $2135
line 3637
;3637:				return;
ADDRGP4 $2054
JUMPV
LABELV $2135
line 3638
;3638:		}
LABELV $2132
line 3639
;3639:	}
LABELV $2128
line 3641
;3640:	//if won't hit the enemy or not attacking a player (obelisk)
;3641:	if (trace.ent != attackentity || attackentity >= MAX_CLIENTS) {
ADDRLP4 592+80
INDIRI4
ADDRLP4 576
INDIRI4
NEI4 $2141
ADDRLP4 576
INDIRI4
CNSTI4 64
LTI4 $2138
LABELV $2141
line 3643
;3642:		//if the projectile does radial damage
;3643:		if (wi.proj.damagetype & DAMAGETYPE_RADIAL) {
ADDRLP4 24+344+180
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $2142
line 3644
;3644:			if (trace.fraction * 1000 < wi.proj.radius) {
CNSTF4 1148846080
ADDRLP4 592+8
INDIRF4
MULF4
ADDRLP4 24+344+172
INDIRF4
GEF4 $2146
line 3645
;3645:				points = (wi.proj.damage - 0.5 * trace.fraction * 1000) * 0.5;
ADDRLP4 1024
CNSTF4 1056964608
ASGNF4
ADDRLP4 972
ADDRLP4 1024
INDIRF4
ADDRLP4 24+344+168
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 1024
INDIRF4
ADDRLP4 592+8
INDIRF4
MULF4
MULF4
SUBF4
MULF4
ASGNF4
line 3646
;3646:				if (points > 0) {
ADDRLP4 972
INDIRF4
CNSTF4 0
LEF4 $2154
line 3647
;3647:					return;
ADDRGP4 $2054
JUMPV
LABELV $2154
line 3649
;3648:				}
;3649:			}
LABELV $2146
line 3651
;3650:			//FIXME: check if a teammate gets radial damage
;3651:		}
LABELV $2142
line 3652
;3652:	}
LABELV $2138
line 3654
;3653:	//if fire has to be release to activate weapon
;3654:	if (wi.flags & WFL_FIRERELEASED) {
ADDRLP4 24+176
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $2156
line 3655
;3655:		if (bs->flags & BFL_ATTACKED) {
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $2157
line 3656
;3656:			trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 3657
;3657:		}
line 3658
;3658:	}
ADDRGP4 $2157
JUMPV
LABELV $2156
line 3659
;3659:	else {
line 3660
;3660:		trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 3661
;3661:	}
LABELV $2157
line 3662
;3662:	bs->flags ^= BFL_ATTACKED;
ADDRLP4 1024
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
ASGNP4
ADDRLP4 1024
INDIRP4
ADDRLP4 1024
INDIRP4
INDIRI4
CNSTI4 2
BXORI4
ASGNI4
line 3663
;3663:}
LABELV $2054
endproc BotCheckAttack 1028 28
lit
align 4
LABELV $2167
byte 4 1143930880
byte 4 1129054208
byte 4 1143472128
align 4
LABELV $2168
byte 4 1148256256
byte 4 1139408896
byte 4 1143603200
align 4
LABELV $2169
byte 4 1134034944
byte 4 1135607808
byte 4 1147535360
export BotMapScripts
code
proc BotMapScripts 1424 16
line 3670
;3664:
;3665:/*
;3666:==================
;3667:BotMapScripts
;3668:==================
;3669:*/
;3670:void BotMapScripts(bot_state_t *bs) {
line 3678
;3671:	char info[1024];
;3672:	char mapname[128];
;3673:	int i, shootbutton;
;3674:	float aim_accuracy;
;3675:	aas_entityinfo_t entinfo;
;3676:	vec3_t dir;
;3677:
;3678:	trap_GetServerinfo(info, sizeof(info));
ADDRLP4 272
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetServerinfo
CALLV
pop
line 3680
;3679:
;3680:	strncpy(mapname, Info_ValueForKey( info, "mapname" ), sizeof(mapname)-1);
ADDRLP4 272
ARGP4
ADDRGP4 $2162
ARGP4
ADDRLP4 1316
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 144
ARGP4
ADDRLP4 1316
INDIRP4
ARGP4
CNSTI4 127
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 3681
;3681:	mapname[sizeof(mapname)-1] = '\0';
ADDRLP4 144+127
CNSTI1 0
ASGNI1
line 3683
;3682:
;3683:	if (!Q_stricmp(mapname, "q3tourney6")) {
ADDRLP4 144
ARGP4
ADDRGP4 $2166
ARGP4
ADDRLP4 1320
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1320
INDIRI4
CNSTI4 0
NEI4 $2164
line 3684
;3684:		vec3_t mins = {700, 204, 672}, maxs = {964, 468, 680};
ADDRLP4 1324
ADDRGP4 $2167
INDIRB
ASGNB 12
ADDRLP4 1336
ADDRGP4 $2168
INDIRB
ASGNB 12
line 3685
;3685:		vec3_t buttonorg = {304, 352, 920};
ADDRLP4 1348
ADDRGP4 $2169
INDIRB
ASGNB 12
line 3687
;3686:		//NOTE: NEVER use the func_bobbing in q3tourney6
;3687:		bs->tfl &= ~TFL_FUNCBOB;
ADDRLP4 1360
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 1360
INDIRP4
ADDRLP4 1360
INDIRP4
INDIRI4
CNSTI4 -16777217
BANDI4
ASGNI4
line 3689
;3688:		//if the bot is below the bounding box
;3689:		if (bs->origin[0] > mins[0] && bs->origin[0] < maxs[0]) {
ADDRLP4 1364
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1364
INDIRF4
ADDRLP4 1324
INDIRF4
LEF4 $2170
ADDRLP4 1364
INDIRF4
ADDRLP4 1336
INDIRF4
GEF4 $2170
line 3690
;3690:			if (bs->origin[1] > mins[1] && bs->origin[1] < maxs[1]) {
ADDRLP4 1368
ADDRFP4 0
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1368
INDIRF4
ADDRLP4 1324+4
INDIRF4
LEF4 $2172
ADDRLP4 1368
INDIRF4
ADDRLP4 1336+4
INDIRF4
GEF4 $2172
line 3691
;3691:				if (bs->origin[2] < mins[2]) {
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRLP4 1324+8
INDIRF4
GEF4 $2176
line 3692
;3692:					return;
ADDRGP4 $2161
JUMPV
LABELV $2176
line 3694
;3693:				}
;3694:			}
LABELV $2172
line 3695
;3695:		}
LABELV $2170
line 3696
;3696:		shootbutton = qfalse;
ADDRLP4 1296
CNSTI4 0
ASGNI4
line 3698
;3697:		//if an enemy is below this bounding box then shoot the button
;3698:		for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 140
CNSTI4 0
ASGNI4
ADDRGP4 $2182
JUMPV
LABELV $2179
line 3700
;3699:
;3700:			if (i == bs->client) continue;
ADDRLP4 140
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2183
ADDRGP4 $2180
JUMPV
LABELV $2183
line 3702
;3701:			//
;3702:			BotEntityInfo(i, &entinfo);
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3704
;3703:			//
;3704:			if (!entinfo.valid) continue;
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2185
ADDRGP4 $2180
JUMPV
LABELV $2185
line 3706
;3705:			//if the enemy isn't dead and the enemy isn't the bot self
;3706:			if (EntityIsDead(&entinfo) || entinfo.number == bs->entitynum) continue;
ADDRLP4 0
ARGP4
ADDRLP4 1368
ADDRGP4 EntityIsDead
CALLI4
ASGNI4
ADDRLP4 1368
INDIRI4
CNSTI4 0
NEI4 $2190
ADDRLP4 0+20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
NEI4 $2187
LABELV $2190
ADDRGP4 $2180
JUMPV
LABELV $2187
line 3708
;3707:			//
;3708:			if (entinfo.origin[0] > mins[0] && entinfo.origin[0] < maxs[0]) {
ADDRLP4 0+24
INDIRF4
ADDRLP4 1324
INDIRF4
LEF4 $2191
ADDRLP4 0+24
INDIRF4
ADDRLP4 1336
INDIRF4
GEF4 $2191
line 3709
;3709:				if (entinfo.origin[1] > mins[1] && entinfo.origin[1] < maxs[1]) {
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1324+4
INDIRF4
LEF4 $2195
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1336+4
INDIRF4
GEF4 $2195
line 3710
;3710:					if (entinfo.origin[2] < mins[2]) {
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 1324+8
INDIRF4
GEF4 $2203
line 3712
;3711:						//if there's a team mate below the crusher
;3712:						if (BotSameTeam(bs, i)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 1372
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1372
INDIRI4
CNSTI4 0
EQI4 $2208
line 3713
;3713:							shootbutton = qfalse;
ADDRLP4 1296
CNSTI4 0
ASGNI4
line 3714
;3714:							break;
ADDRGP4 $2181
JUMPV
LABELV $2208
line 3716
;3715:						}
;3716:						else {
line 3717
;3717:							shootbutton = qtrue;
ADDRLP4 1296
CNSTI4 1
ASGNI4
line 3718
;3718:						}
line 3719
;3719:					}
LABELV $2203
line 3720
;3720:				}
LABELV $2195
line 3721
;3721:			}
LABELV $2191
line 3722
;3722:		}
LABELV $2180
line 3698
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2182
ADDRLP4 140
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $2210
ADDRLP4 140
INDIRI4
CNSTI4 64
LTI4 $2179
LABELV $2210
LABELV $2181
line 3723
;3723:		if (shootbutton) {
ADDRLP4 1296
INDIRI4
CNSTI4 0
EQI4 $2165
line 3724
;3724:			bs->flags |= BFL_IDEALVIEWSET;
ADDRLP4 1372
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
ASGNP4
ADDRLP4 1372
INDIRP4
ADDRLP4 1372
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 3725
;3725:			VectorSubtract(buttonorg, bs->eye, dir);
ADDRLP4 1376
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1300
ADDRLP4 1348
INDIRF4
ADDRLP4 1376
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1300+4
ADDRLP4 1348+4
INDIRF4
ADDRLP4 1376
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1300+8
ADDRLP4 1348+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3726
;3726:			vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 1300
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3727
;3727:			aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 7
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1380
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 1312
ADDRLP4 1380
INDIRF4
ASGNF4
line 3728
;3728:			bs->ideal_viewangles[PITCH] += 8 * crandom() * (1 - aim_accuracy);
ADDRLP4 1384
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1388
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ASGNP4
ADDRLP4 1388
INDIRP4
ADDRLP4 1388
INDIRP4
INDIRF4
CNSTF4 1090519040
CNSTF4 1073741824
ADDRLP4 1384
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
CNSTF4 1065353216
ADDRLP4 1312
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3729
;3729:			bs->ideal_viewangles[PITCH] = AngleMod(bs->ideal_viewangles[PITCH]);
ADDRLP4 1392
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ASGNP4
ADDRLP4 1392
INDIRP4
INDIRF4
ARGF4
ADDRLP4 1396
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 1392
INDIRP4
ADDRLP4 1396
INDIRF4
ASGNF4
line 3730
;3730:			bs->ideal_viewangles[YAW] += 8 * crandom() * (1 - aim_accuracy);
ADDRLP4 1400
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1404
ADDRFP4 0
INDIRP4
CNSTI4 6580
ADDP4
ASGNP4
ADDRLP4 1404
INDIRP4
ADDRLP4 1404
INDIRP4
INDIRF4
CNSTF4 1090519040
CNSTF4 1073741824
ADDRLP4 1400
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
CNSTF4 1065353216
ADDRLP4 1312
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3731
;3731:			bs->ideal_viewangles[YAW] = AngleMod(bs->ideal_viewangles[YAW]);
ADDRLP4 1408
ADDRFP4 0
INDIRP4
CNSTI4 6580
ADDP4
ASGNP4
ADDRLP4 1408
INDIRP4
INDIRF4
ARGF4
ADDRLP4 1412
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 1408
INDIRP4
ADDRLP4 1412
INDIRF4
ASGNF4
line 3733
;3732:			//
;3733:			if (InFieldOfVision(bs->viewangles, 20, bs->ideal_viewangles)) {
ADDRLP4 1416
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1416
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1101004800
ARGF4
ADDRLP4 1416
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRLP4 1420
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 1420
INDIRI4
CNSTI4 0
EQI4 $2165
line 3734
;3734:				trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 3735
;3735:			}
line 3736
;3736:		}
line 3737
;3737:	}
ADDRGP4 $2165
JUMPV
LABELV $2164
line 3738
;3738:	else if (!Q_stricmp(mapname, "mpq3tourney6")) {
ADDRLP4 144
ARGP4
ADDRGP4 $2221
ARGP4
ADDRLP4 1324
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1324
INDIRI4
CNSTI4 0
NEI4 $2219
line 3740
;3739:		//NOTE: NEVER use the func_bobbing in mpq3tourney6
;3740:		bs->tfl &= ~TFL_FUNCBOB;
ADDRLP4 1328
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 1328
INDIRP4
ADDRLP4 1328
INDIRP4
INDIRI4
CNSTI4 -16777217
BANDI4
ASGNI4
line 3741
;3741:	}
LABELV $2219
LABELV $2165
line 3742
;3742:}
LABELV $2161
endproc BotMapScripts 1424 16
data
align 4
LABELV VEC_UP
byte 4 0
byte 4 3212836864
byte 4 0
align 4
LABELV MOVEDIR_UP
byte 4 0
byte 4 0
byte 4 1065353216
align 4
LABELV VEC_DOWN
byte 4 0
byte 4 3221225472
byte 4 0
align 4
LABELV MOVEDIR_DOWN
byte 4 0
byte 4 0
byte 4 3212836864
export BotSetMovedir
code
proc BotSetMovedir 12 16
line 3755
;3743:
;3744:/*
;3745:==================
;3746:BotSetMovedir
;3747:==================
;3748:*/
;3749:// bk001205 - made these static
;3750:static vec3_t VEC_UP		= {0, -1,  0};
;3751:static vec3_t MOVEDIR_UP	= {0,  0,  1};
;3752:static vec3_t VEC_DOWN		= {0, -2,  0};
;3753:static vec3_t MOVEDIR_DOWN	= {0,  0, -1};
;3754:
;3755:void BotSetMovedir(vec3_t angles, vec3_t movedir) {
line 3756
;3756:	if (VectorCompare(angles, VEC_UP)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 VEC_UP
ARGP4
ADDRLP4 0
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $2223
line 3757
;3757:		VectorCopy(MOVEDIR_UP, movedir);
ADDRFP4 4
INDIRP4
ADDRGP4 MOVEDIR_UP
INDIRB
ASGNB 12
line 3758
;3758:	}
ADDRGP4 $2224
JUMPV
LABELV $2223
line 3759
;3759:	else if (VectorCompare(angles, VEC_DOWN)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 VEC_DOWN
ARGP4
ADDRLP4 4
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $2225
line 3760
;3760:		VectorCopy(MOVEDIR_DOWN, movedir);
ADDRFP4 4
INDIRP4
ADDRGP4 MOVEDIR_DOWN
INDIRB
ASGNB 12
line 3761
;3761:	}
ADDRGP4 $2226
JUMPV
LABELV $2225
line 3762
;3762:	else {
line 3763
;3763:		AngleVectors(angles, movedir, NULL, NULL);
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
line 3764
;3764:	}
LABELV $2226
LABELV $2224
line 3765
;3765:}
LABELV $2222
endproc BotSetMovedir 12 16
export BotModelMinsMaxs
proc BotModelMinsMaxs 40 0
line 3774
;3766:
;3767:/*
;3768:==================
;3769:BotModelMinsMaxs
;3770:
;3771:this is ugly
;3772:==================
;3773:*/
;3774:int BotModelMinsMaxs(int modelindex, int eType, int contents, vec3_t mins, vec3_t maxs) {
line 3778
;3775:	gentity_t *ent;
;3776:	int i;
;3777:
;3778:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 3779
;3779:	for (i = 0; i < level.num_entities; i++, ent++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2231
JUMPV
LABELV $2228
line 3780
;3780:		if ( !ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2233
line 3781
;3781:			continue;
ADDRGP4 $2229
JUMPV
LABELV $2233
line 3783
;3782:		}
;3783:		if ( eType && ent->s.eType != eType) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $2235
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $2235
line 3784
;3784:			continue;
ADDRGP4 $2229
JUMPV
LABELV $2235
line 3786
;3785:		}
;3786:		if ( contents && ent->r.contents != contents) {
ADDRLP4 12
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $2237
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $2237
line 3787
;3787:			continue;
ADDRGP4 $2229
JUMPV
LABELV $2237
line 3789
;3788:		}
;3789:		if (ent->s.modelindex == modelindex) {
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $2239
line 3790
;3790:			if (mins)
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2241
line 3791
;3791:				VectorAdd(ent->r.currentOrigin, ent->r.mins, mins);
ADDRFP4 12
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ADDF4
ASGNF4
LABELV $2241
line 3792
;3792:			if (maxs)
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2243
line 3793
;3793:				VectorAdd(ent->r.currentOrigin, ent->r.maxs, maxs);
ADDRFP4 16
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDF4
ASGNF4
LABELV $2243
line 3794
;3794:			return i;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $2227
JUMPV
LABELV $2239
line 3796
;3795:		}
;3796:	}
LABELV $2229
line 3779
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 868
ADDP4
ASGNP4
LABELV $2231
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $2228
line 3797
;3797:	if (mins)
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2245
line 3798
;3798:		VectorClear(mins);
ADDRLP4 8
ADDRFP4 12
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
LABELV $2245
line 3799
;3799:	if (maxs)
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2247
line 3800
;3800:		VectorClear(maxs);
ADDRLP4 16
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRF4
ASGNF4
LABELV $2247
line 3801
;3801:	return 0;
CNSTI4 0
RETI4
LABELV $2227
endproc BotModelMinsMaxs 40 0
lit
align 4
LABELV $2250
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
align 4
LABELV $2251
byte 4 3212836864
byte 4 3212836864
byte 4 3212836864
export BotFuncButtonActivateGoal
code
proc BotFuncButtonActivateGoal 648 28
line 3809
;3802:}
;3803:
;3804:/*
;3805:==================
;3806:BotFuncButtonGoal
;3807:==================
;3808:*/
;3809:int BotFuncButtonActivateGoal(bot_state_t *bs, int bspent, bot_activategoal_t *activategoal) {
line 3815
;3810:	int i, areas[10], numareas, modelindex, entitynum;
;3811:	char model[128];
;3812:	float lip, dist, health, angle;
;3813:	vec3_t size, start, end, mins, maxs, angles, points[10];
;3814:	vec3_t movedir, origin, goalorigin, bboxmins, bboxmaxs;
;3815:	vec3_t extramins = {1, 1, 1}, extramaxs = {-1, -1, -1};
ADDRLP4 304
ADDRGP4 $2250
INDIRB
ASGNB 12
ADDRLP4 316
ADDRGP4 $2251
INDIRB
ASGNB 12
line 3818
;3816:	bsp_trace_t bsptrace;
;3817:
;3818:	activategoal->shoot = qfalse;
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
line 3819
;3819:	VectorClear(activategoal->target);
ADDRLP4 560
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 564
CNSTF4 0
ASGNF4
ADDRLP4 560
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 564
INDIRF4
ASGNF4
ADDRLP4 560
INDIRP4
CNSTI4 84
ADDP4
ADDRLP4 564
INDIRF4
ASGNF4
ADDRLP4 560
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 564
INDIRF4
ASGNF4
line 3821
;3820:	//create a bot goal towards the button
;3821:	trap_AAS_ValueForBSPEpairKey(bspent, "model", model, sizeof(model));
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $528
ARGP4
ADDRLP4 160
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 3822
;3822:	if (!*model)
ADDRLP4 160
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2252
line 3823
;3823:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2249
JUMPV
LABELV $2252
line 3824
;3824:	modelindex = atoi(model+1);
ADDRLP4 160+1
ARGP4
ADDRLP4 568
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 288
ADDRLP4 568
INDIRI4
ASGNI4
line 3825
;3825:	if (!modelindex)
ADDRLP4 288
INDIRI4
CNSTI4 0
NEI4 $2255
line 3826
;3826:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2249
JUMPV
LABELV $2255
line 3827
;3827:	VectorClear(angles);
ADDRLP4 572
CNSTF4 0
ASGNF4
ADDRLP4 96+8
ADDRLP4 572
INDIRF4
ASGNF4
ADDRLP4 96+4
ADDRLP4 572
INDIRF4
ASGNF4
ADDRLP4 96
ADDRLP4 572
INDIRF4
ASGNF4
line 3828
;3828:	entitynum = BotModelMinsMaxs(modelindex, ET_MOVER, 0, mins, maxs);
ADDRLP4 288
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 72
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 576
ADDRGP4 BotModelMinsMaxs
CALLI4
ASGNI4
ADDRLP4 344
ADDRLP4 576
INDIRI4
ASGNI4
line 3830
;3829:	//get the lip of the button
;3830:	trap_AAS_FloatForBSPEpairKey(bspent, "lip", &lip);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $2259
ARGP4
ADDRLP4 328
ARGP4
ADDRGP4 trap_AAS_FloatForBSPEpairKey
CALLI4
pop
line 3831
;3831:	if (!lip) lip = 4;
ADDRLP4 328
INDIRF4
CNSTF4 0
NEF4 $2260
ADDRLP4 328
CNSTF4 1082130432
ASGNF4
LABELV $2260
line 3833
;3832:	//get the move direction from the angle
;3833:	trap_AAS_FloatForBSPEpairKey(bspent, "angle", &angle);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $2262
ARGP4
ADDRLP4 352
ARGP4
ADDRGP4 trap_AAS_FloatForBSPEpairKey
CALLI4
pop
line 3834
;3834:	VectorSet(angles, 0, angle, 0);
ADDRLP4 96
CNSTF4 0
ASGNF4
ADDRLP4 96+4
ADDRLP4 352
INDIRF4
ASGNF4
ADDRLP4 96+8
CNSTF4 0
ASGNF4
line 3835
;3835:	BotSetMovedir(angles, movedir);
ADDRLP4 96
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 BotSetMovedir
CALLV
pop
line 3837
;3836:	//button size
;3837:	VectorSubtract(maxs, mins, size);
ADDRLP4 112
ADDRLP4 84
INDIRF4
ADDRLP4 72
INDIRF4
SUBF4
ASGNF4
ADDRLP4 112+4
ADDRLP4 84+4
INDIRF4
ADDRLP4 72+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 112+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 72+8
INDIRF4
SUBF4
ASGNF4
line 3839
;3838:	//button origin
;3839:	VectorAdd(mins, maxs, origin);
ADDRLP4 16
ADDRLP4 72
INDIRF4
ADDRLP4 84
INDIRF4
ADDF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 72+4
INDIRF4
ADDRLP4 84+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 72+8
INDIRF4
ADDRLP4 84+8
INDIRF4
ADDF4
ASGNF4
line 3840
;3840:	VectorScale(origin, 0.5, origin);
ADDRLP4 580
CNSTF4 1056964608
ASGNF4
ADDRLP4 16
ADDRLP4 580
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 580
INDIRF4
ADDRLP4 16+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 16+8
CNSTF4 1056964608
ADDRLP4 16+8
INDIRF4
MULF4
ASGNF4
line 3842
;3841:	//touch distance of the button
;3842:	dist = fabs(movedir[0]) * size[0] + fabs(movedir[1]) * size[1] + fabs(movedir[2]) * size[2];
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 584
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4+4
INDIRF4
ARGF4
ADDRLP4 588
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4+8
INDIRF4
ARGF4
ADDRLP4 592
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 584
INDIRF4
ADDRLP4 112
INDIRF4
MULF4
ADDRLP4 588
INDIRF4
ADDRLP4 112+4
INDIRF4
MULF4
ADDF4
ADDRLP4 592
INDIRF4
ADDRLP4 112+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3843
;3843:	dist *= 0.5;
ADDRLP4 28
CNSTF4 1056964608
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 3845
;3844:	//
;3845:	trap_AAS_FloatForBSPEpairKey(bspent, "health", &health);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $2285
ARGP4
ADDRLP4 348
ARGP4
ADDRGP4 trap_AAS_FloatForBSPEpairKey
CALLI4
pop
line 3847
;3846:	//if the button is shootable
;3847:	if (health) {
ADDRLP4 348
INDIRF4
CNSTF4 0
EQF4 $2286
line 3849
;3848:		//calculate the shoot target
;3849:		VectorMA(origin, -dist, movedir, goalorigin);
ADDRLP4 596
ADDRLP4 28
INDIRF4
NEGF4
ASGNF4
ADDRLP4 124
ADDRLP4 16
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 596
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 16+4
INDIRF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 596
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 16+8
INDIRF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 28
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 3851
;3850:		//
;3851:		VectorCopy(goalorigin, activategoal->target);
ADDRFP4 8
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 124
INDIRB
ASGNB 12
line 3852
;3852:		activategoal->shoot = qtrue;
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 1
ASGNI4
line 3854
;3853:		//
;3854:		BotAI_Trace(&bsptrace, bs->eye, NULL, NULL, goalorigin, bs->entitynum, MASK_SHOT);
ADDRLP4 356
ARGP4
ADDRLP4 600
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 600
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 604
CNSTP4 0
ASGNP4
ADDRLP4 604
INDIRP4
ARGP4
ADDRLP4 604
INDIRP4
ARGP4
ADDRLP4 124
ARGP4
ADDRLP4 600
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 100664321
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3856
;3855:		// if the button is visible from the current position
;3856:		if (bsptrace.fraction >= 1.0 || bsptrace.ent == entitynum) {
ADDRLP4 356+8
INDIRF4
CNSTF4 1065353216
GEF4 $2298
ADDRLP4 356+80
INDIRI4
ADDRLP4 344
INDIRI4
NEI4 $2294
LABELV $2298
line 3858
;3857:			//
;3858:			activategoal->goal.entitynum = entitynum; //NOTE: this is the entity number of the shootable button
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 344
INDIRI4
ASGNI4
line 3859
;3859:			activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 3860
;3860:			activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 3861
;3861:			VectorCopy(bs->origin, activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 3862
;3862:			activategoal->goal.areanum = bs->areanum;
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ASGNI4
line 3863
;3863:			VectorSet(activategoal->goal.mins, -8, -8, -8);
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 28
ADDP4
CNSTF4 3238002688
ASGNF4
line 3864
;3864:			VectorSet(activategoal->goal.maxs, 8, 8, 8);
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1090519040
ASGNF4
line 3866
;3865:			//
;3866:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2249
JUMPV
LABELV $2294
line 3868
;3867:		}
;3868:		else {
line 3871
;3869:			//create a goal from where the button is visible and shoot at the button from there
;3870:			//add bounding box size to the dist
;3871:			trap_AAS_PresenceTypeBoundingBox(PRESENCE_CROUCH, bboxmins, bboxmaxs);
CNSTI4 4
ARGI4
ADDRLP4 136
ARGP4
ADDRLP4 148
ARGP4
ADDRGP4 trap_AAS_PresenceTypeBoundingBox
CALLV
pop
line 3872
;3872:			for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2299
line 3873
;3873:				if (movedir[i] < 0) dist += fabs(movedir[i]) * fabs(bboxmaxs[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $2303
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 608
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 148
ADDP4
INDIRF4
ARGF4
ADDRLP4 612
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 608
INDIRF4
ADDRLP4 612
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $2304
JUMPV
LABELV $2303
line 3874
;3874:				else dist += fabs(movedir[i]) * fabs(bboxmins[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 616
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 136
ADDP4
INDIRF4
ARGF4
ADDRLP4 620
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 616
INDIRF4
ADDRLP4 620
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $2304
line 3875
;3875:			}
LABELV $2300
line 3872
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $2299
line 3877
;3876:			//calculate the goal origin
;3877:			VectorMA(origin, -dist, movedir, goalorigin);
ADDRLP4 608
ADDRLP4 28
INDIRF4
NEGF4
ASGNF4
ADDRLP4 124
ADDRLP4 16
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 608
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 16+4
INDIRF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 608
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 16+8
INDIRF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 28
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 3879
;3878:			//
;3879:			VectorCopy(goalorigin, start);
ADDRLP4 292
ADDRLP4 124
INDIRB
ASGNB 12
line 3880
;3880:			start[2] += 24;
ADDRLP4 292+8
ADDRLP4 292+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 3881
;3881:			VectorCopy(start, end);
ADDRLP4 332
ADDRLP4 292
INDIRB
ASGNB 12
line 3882
;3882:			end[2] -= 512;
ADDRLP4 332+8
ADDRLP4 332+8
INDIRF4
CNSTF4 1140850688
SUBF4
ASGNF4
line 3883
;3883:			numareas = trap_AAS_TraceAreas(start, end, areas, points, 10);
ADDRLP4 292
ARGP4
ADDRLP4 332
ARGP4
ADDRLP4 32
ARGP4
ADDRLP4 440
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 612
ADDRGP4 trap_AAS_TraceAreas
CALLI4
ASGNI4
ADDRLP4 108
ADDRLP4 612
INDIRI4
ASGNI4
line 3885
;3884:			//
;3885:			for (i = numareas-1; i >= 0; i--) {
ADDRLP4 0
ADDRLP4 108
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $2316
JUMPV
LABELV $2313
line 3886
;3886:				if (trap_AAS_AreaReachability(areas[i])) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
ADDP4
INDIRI4
ARGI4
ADDRLP4 616
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 616
INDIRI4
CNSTI4 0
EQI4 $2317
line 3887
;3887:					break;
ADDRGP4 $2315
JUMPV
LABELV $2317
line 3889
;3888:				}
;3889:			}
LABELV $2314
line 3885
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $2316
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $2313
LABELV $2315
line 3890
;3890:			if (i < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $2319
line 3892
;3891:				// FIXME: trace forward and maybe in other directions to find a valid area
;3892:			}
LABELV $2319
line 3893
;3893:			if (i >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $2321
line 3895
;3894:				//
;3895:				VectorCopy(points[i], activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 440
ADDP4
INDIRB
ASGNB 12
line 3896
;3896:				activategoal->goal.areanum = areas[i];
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
ADDP4
INDIRI4
ASGNI4
line 3897
;3897:				VectorSet(activategoal->goal.mins, 8, 8, 8);
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 28
ADDP4
CNSTF4 1090519040
ASGNF4
line 3898
;3898:				VectorSet(activategoal->goal.maxs, -8, -8, -8);
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 3238002688
ASGNF4
line 3900
;3899:				//
;3900:				for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2323
line 3901
;3901:				{
line 3902
;3902:					if (movedir[i] < 0) activategoal->goal.maxs[i] += fabs(movedir[i]) * fabs(extramaxs[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $2327
ADDRLP4 616
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 616
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 620
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 316
ADDP4
INDIRF4
ARGF4
ADDRLP4 624
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 628
ADDRLP4 616
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ASGNP4
ADDRLP4 628
INDIRP4
ADDRLP4 628
INDIRP4
INDIRF4
ADDRLP4 620
INDIRF4
ADDRLP4 624
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $2328
JUMPV
LABELV $2327
line 3903
;3903:					else activategoal->goal.mins[i] += fabs(movedir[i]) * fabs(extramins[i]);
ADDRLP4 632
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 632
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 636
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 304
ADDP4
INDIRF4
ARGF4
ADDRLP4 640
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 644
ADDRLP4 632
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
ADDP4
ASGNP4
ADDRLP4 644
INDIRP4
ADDRLP4 644
INDIRP4
INDIRF4
ADDRLP4 636
INDIRF4
ADDRLP4 640
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $2328
line 3904
;3904:				} //end for
LABELV $2324
line 3900
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $2323
line 3906
;3905:				//
;3906:				activategoal->goal.entitynum = entitynum;
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 344
INDIRI4
ASGNI4
line 3907
;3907:				activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 3908
;3908:				activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 3909
;3909:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2249
JUMPV
LABELV $2321
line 3911
;3910:			}
;3911:		}
line 3912
;3912:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2249
JUMPV
LABELV $2286
line 3914
;3913:	}
;3914:	else {
line 3916
;3915:		//add bounding box size to the dist
;3916:		trap_AAS_PresenceTypeBoundingBox(PRESENCE_CROUCH, bboxmins, bboxmaxs);
CNSTI4 4
ARGI4
ADDRLP4 136
ARGP4
ADDRLP4 148
ARGP4
ADDRGP4 trap_AAS_PresenceTypeBoundingBox
CALLV
pop
line 3917
;3917:		for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2329
line 3918
;3918:			if (movedir[i] < 0) dist += fabs(movedir[i]) * fabs(bboxmaxs[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $2333
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 596
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 148
ADDP4
INDIRF4
ARGF4
ADDRLP4 600
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 596
INDIRF4
ADDRLP4 600
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $2334
JUMPV
LABELV $2333
line 3919
;3919:			else dist += fabs(movedir[i]) * fabs(bboxmins[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 604
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 136
ADDP4
INDIRF4
ARGF4
ADDRLP4 608
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 604
INDIRF4
ADDRLP4 608
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $2334
line 3920
;3920:		}
LABELV $2330
line 3917
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $2329
line 3922
;3921:		//calculate the goal origin
;3922:		VectorMA(origin, -dist, movedir, goalorigin);
ADDRLP4 596
ADDRLP4 28
INDIRF4
NEGF4
ASGNF4
ADDRLP4 124
ADDRLP4 16
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 596
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 16+4
INDIRF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 596
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 16+8
INDIRF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 28
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 3924
;3923:		//
;3924:		VectorCopy(goalorigin, start);
ADDRLP4 292
ADDRLP4 124
INDIRB
ASGNB 12
line 3925
;3925:		start[2] += 24;
ADDRLP4 292+8
ADDRLP4 292+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 3926
;3926:		VectorCopy(start, end);
ADDRLP4 332
ADDRLP4 292
INDIRB
ASGNB 12
line 3927
;3927:		end[2] -= 100;
ADDRLP4 332+8
ADDRLP4 332+8
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 3928
;3928:		numareas = trap_AAS_TraceAreas(start, end, areas, NULL, 10);
ADDRLP4 292
ARGP4
ADDRLP4 332
ARGP4
ADDRLP4 32
ARGP4
CNSTP4 0
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 600
ADDRGP4 trap_AAS_TraceAreas
CALLI4
ASGNI4
ADDRLP4 108
ADDRLP4 600
INDIRI4
ASGNI4
line 3930
;3929:		//
;3930:		for (i = 0; i < numareas; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2346
JUMPV
LABELV $2343
line 3931
;3931:			if (trap_AAS_AreaReachability(areas[i])) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
ADDP4
INDIRI4
ARGI4
ADDRLP4 604
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 604
INDIRI4
CNSTI4 0
EQI4 $2347
line 3932
;3932:				break;
ADDRGP4 $2345
JUMPV
LABELV $2347
line 3934
;3933:			}
;3934:		}
LABELV $2344
line 3930
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2346
ADDRLP4 0
INDIRI4
ADDRLP4 108
INDIRI4
LTI4 $2343
LABELV $2345
line 3935
;3935:		if (i < numareas) {
ADDRLP4 0
INDIRI4
ADDRLP4 108
INDIRI4
GEI4 $2349
line 3937
;3936:			//
;3937:			VectorCopy(origin, activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 3938
;3938:			activategoal->goal.areanum = areas[i];
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
ADDP4
INDIRI4
ASGNI4
line 3939
;3939:			VectorSubtract(mins, origin, activategoal->goal.mins);
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 72
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 72+4
INDIRF4
ADDRLP4 16+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 72+8
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
ASGNF4
line 3940
;3940:			VectorSubtract(maxs, origin, activategoal->goal.maxs);
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 84
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 84+4
INDIRF4
ADDRLP4 16+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 84+8
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
ASGNF4
line 3942
;3941:			//
;3942:			for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2359
line 3943
;3943:			{
line 3944
;3944:				if (movedir[i] < 0) activategoal->goal.maxs[i] += fabs(movedir[i]) * fabs(extramaxs[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $2363
ADDRLP4 604
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 604
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 608
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 316
ADDP4
INDIRF4
ARGF4
ADDRLP4 612
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 616
ADDRLP4 604
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ASGNP4
ADDRLP4 616
INDIRP4
ADDRLP4 616
INDIRP4
INDIRF4
ADDRLP4 608
INDIRF4
ADDRLP4 612
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $2364
JUMPV
LABELV $2363
line 3945
;3945:				else activategoal->goal.mins[i] += fabs(movedir[i]) * fabs(extramins[i]);
ADDRLP4 620
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 620
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 624
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 304
ADDP4
INDIRF4
ARGF4
ADDRLP4 628
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 632
ADDRLP4 620
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
ADDP4
ASGNP4
ADDRLP4 632
INDIRP4
ADDRLP4 632
INDIRP4
INDIRF4
ADDRLP4 624
INDIRF4
ADDRLP4 628
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $2364
line 3946
;3946:			} //end for
LABELV $2360
line 3942
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $2359
line 3948
;3947:			//
;3948:			activategoal->goal.entitynum = entitynum;
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 344
INDIRI4
ASGNI4
line 3949
;3949:			activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 3950
;3950:			activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 3951
;3951:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2249
JUMPV
LABELV $2349
line 3953
;3952:		}
;3953:	}
line 3954
;3954:	return qfalse;
CNSTI4 0
RETI4
LABELV $2249
endproc BotFuncButtonActivateGoal 648 28
export BotFuncDoorActivateGoal
proc BotFuncDoorActivateGoal 1096 20
line 3962
;3955:}
;3956:
;3957:/*
;3958:==================
;3959:BotFuncDoorGoal
;3960:==================
;3961:*/
;3962:int BotFuncDoorActivateGoal(bot_state_t *bs, int bspent, bot_activategoal_t *activategoal) {
line 3968
;3963:	int modelindex, entitynum;
;3964:	char model[MAX_INFO_STRING];
;3965:	vec3_t mins, maxs, origin, angles;
;3966:
;3967:	//shoot at the shootable door
;3968:	trap_AAS_ValueForBSPEpairKey(bspent, "model", model, sizeof(model));
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $528
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 3969
;3969:	if (!*model)
ADDRLP4 12
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2366
line 3970
;3970:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2365
JUMPV
LABELV $2366
line 3971
;3971:	modelindex = atoi(model+1);
ADDRLP4 12+1
ARGP4
ADDRLP4 1080
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1060
ADDRLP4 1080
INDIRI4
ASGNI4
line 3972
;3972:	if (!modelindex)
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $2369
line 3973
;3973:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2365
JUMPV
LABELV $2369
line 3974
;3974:	VectorClear(angles);
ADDRLP4 1084
CNSTF4 0
ASGNF4
ADDRLP4 1064+8
ADDRLP4 1084
INDIRF4
ASGNF4
ADDRLP4 1064+4
ADDRLP4 1084
INDIRF4
ASGNF4
ADDRLP4 1064
ADDRLP4 1084
INDIRF4
ASGNF4
line 3975
;3975:	entitynum = BotModelMinsMaxs(modelindex, ET_MOVER, 0, mins, maxs);
ADDRLP4 1060
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 1036
ARGP4
ADDRLP4 1048
ARGP4
ADDRLP4 1088
ADDRGP4 BotModelMinsMaxs
CALLI4
ASGNI4
ADDRLP4 1076
ADDRLP4 1088
INDIRI4
ASGNI4
line 3977
;3976:	//door origin
;3977:	VectorAdd(mins, maxs, origin);
ADDRLP4 0
ADDRLP4 1036
INDIRF4
ADDRLP4 1048
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 1036+4
INDIRF4
ADDRLP4 1048+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 1036+8
INDIRF4
ADDRLP4 1048+8
INDIRF4
ADDF4
ASGNF4
line 3978
;3978:	VectorScale(origin, 0.5, origin);
ADDRLP4 1092
CNSTF4 1056964608
ASGNF4
ADDRLP4 0
ADDRLP4 1092
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 1092
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1056964608
ADDRLP4 0+8
INDIRF4
MULF4
ASGNF4
line 3979
;3979:	VectorCopy(origin, activategoal->target);
ADDRFP4 8
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 3980
;3980:	activategoal->shoot = qtrue;
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 1
ASGNI4
line 3982
;3981:	//
;3982:	activategoal->goal.entitynum = entitynum; //NOTE: this is the entity number of the shootable door
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 1076
INDIRI4
ASGNI4
line 3983
;3983:	activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 3984
;3984:	activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 3985
;3985:	VectorCopy(bs->origin, activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 3986
;3986:	activategoal->goal.areanum = bs->areanum;
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ASGNI4
line 3987
;3987:	VectorSet(activategoal->goal.mins, -8, -8, -8);
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 28
ADDP4
CNSTF4 3238002688
ASGNF4
line 3988
;3988:	VectorSet(activategoal->goal.maxs, 8, 8, 8);
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1090519040
ASGNF4
line 3989
;3989:	return qtrue;
CNSTI4 1
RETI4
LABELV $2365
endproc BotFuncDoorActivateGoal 1096 20
export BotTriggerMultipleActivateGoal
proc BotTriggerMultipleActivateGoal 300 20
line 3997
;3990:}
;3991:
;3992:/*
;3993:==================
;3994:BotTriggerMultipleGoal
;3995:==================
;3996:*/
;3997:int BotTriggerMultipleActivateGoal(bot_state_t *bs, int bspent, bot_activategoal_t *activategoal) {
line 4003
;3998:	int i, areas[10], numareas, modelindex, entitynum;
;3999:	char model[128];
;4000:	vec3_t start, end, mins, maxs, angles;
;4001:	vec3_t origin, goalorigin;
;4002:
;4003:	activategoal->shoot = qfalse;
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
line 4004
;4004:	VectorClear(activategoal->target);
ADDRLP4 268
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 272
CNSTF4 0
ASGNF4
ADDRLP4 268
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 272
INDIRF4
ASGNF4
ADDRLP4 268
INDIRP4
CNSTI4 84
ADDP4
ADDRLP4 272
INDIRF4
ASGNF4
ADDRLP4 268
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 272
INDIRF4
ASGNF4
line 4006
;4005:	//create a bot goal towards the trigger
;4006:	trap_AAS_ValueForBSPEpairKey(bspent, "model", model, sizeof(model));
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $528
ARGP4
ADDRLP4 84
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4007
;4007:	if (!*model)
ADDRLP4 84
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2384
line 4008
;4008:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2383
JUMPV
LABELV $2384
line 4009
;4009:	modelindex = atoi(model+1);
ADDRLP4 84+1
ARGP4
ADDRLP4 276
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 224
ADDRLP4 276
INDIRI4
ASGNI4
line 4010
;4010:	if (!modelindex)
ADDRLP4 224
INDIRI4
CNSTI4 0
NEI4 $2387
line 4011
;4011:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2383
JUMPV
LABELV $2387
line 4012
;4012:	VectorClear(angles);
ADDRLP4 280
CNSTF4 0
ASGNF4
ADDRLP4 240+8
ADDRLP4 280
INDIRF4
ASGNF4
ADDRLP4 240+4
ADDRLP4 280
INDIRF4
ASGNF4
ADDRLP4 240
ADDRLP4 280
INDIRF4
ASGNF4
line 4013
;4013:	entitynum = BotModelMinsMaxs(modelindex, 0, CONTENTS_TRIGGER, mins, maxs);
ADDRLP4 224
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1073741824
ARGI4
ADDRLP4 60
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 284
ADDRGP4 BotModelMinsMaxs
CALLI4
ASGNI4
ADDRLP4 264
ADDRLP4 284
INDIRI4
ASGNI4
line 4015
;4014:	//trigger origin
;4015:	VectorAdd(mins, maxs, origin);
ADDRLP4 4
ADDRLP4 60
INDIRF4
ADDRLP4 72
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 60+4
INDIRF4
ADDRLP4 72+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 60+8
INDIRF4
ADDRLP4 72+8
INDIRF4
ADDF4
ASGNF4
line 4016
;4016:	VectorScale(origin, 0.5, origin);
ADDRLP4 288
CNSTF4 1056964608
ASGNF4
ADDRLP4 4
ADDRLP4 288
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 288
INDIRF4
ADDRLP4 4+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4+8
CNSTF4 1056964608
ADDRLP4 4+8
INDIRF4
MULF4
ASGNF4
line 4017
;4017:	VectorCopy(origin, goalorigin);
ADDRLP4 252
ADDRLP4 4
INDIRB
ASGNB 12
line 4019
;4018:	//
;4019:	VectorCopy(goalorigin, start);
ADDRLP4 212
ADDRLP4 252
INDIRB
ASGNB 12
line 4020
;4020:	start[2] += 24;
ADDRLP4 212+8
ADDRLP4 212+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 4021
;4021:	VectorCopy(start, end);
ADDRLP4 228
ADDRLP4 212
INDIRB
ASGNB 12
line 4022
;4022:	end[2] -= 100;
ADDRLP4 228+8
ADDRLP4 228+8
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 4023
;4023:	numareas = trap_AAS_TraceAreas(start, end, areas, NULL, 10);
ADDRLP4 212
ARGP4
ADDRLP4 228
ARGP4
ADDRLP4 20
ARGP4
CNSTP4 0
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 292
ADDRGP4 trap_AAS_TraceAreas
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 292
INDIRI4
ASGNI4
line 4025
;4024:	//
;4025:	for (i = 0; i < numareas; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2406
JUMPV
LABELV $2403
line 4026
;4026:		if (trap_AAS_AreaReachability(areas[i])) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
ADDP4
INDIRI4
ARGI4
ADDRLP4 296
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
EQI4 $2407
line 4027
;4027:			break;
ADDRGP4 $2405
JUMPV
LABELV $2407
line 4029
;4028:		}
;4029:	}
LABELV $2404
line 4025
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2406
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $2403
LABELV $2405
line 4030
;4030:	if (i < numareas) {
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
GEI4 $2409
line 4031
;4031:		VectorCopy(origin, activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 4032
;4032:		activategoal->goal.areanum = areas[i];
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
ADDP4
INDIRI4
ASGNI4
line 4033
;4033:		VectorSubtract(mins, origin, activategoal->goal.mins);
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 60
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 60+4
INDIRF4
ADDRLP4 4+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 60+8
INDIRF4
ADDRLP4 4+8
INDIRF4
SUBF4
ASGNF4
line 4034
;4034:		VectorSubtract(maxs, origin, activategoal->goal.maxs);
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 72
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 72+4
INDIRF4
ADDRLP4 4+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 72+8
INDIRF4
ADDRLP4 4+8
INDIRF4
SUBF4
ASGNF4
line 4036
;4035:		//
;4036:		activategoal->goal.entitynum = entitynum;
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 264
INDIRI4
ASGNI4
line 4037
;4037:		activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 4038
;4038:		activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 4039
;4039:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2383
JUMPV
LABELV $2409
line 4041
;4040:	}
;4041:	return qfalse;
CNSTI4 0
RETI4
LABELV $2383
endproc BotTriggerMultipleActivateGoal 300 20
export BotPopFromActivateGoalStack
proc BotPopFromActivateGoalStack 4 8
line 4049
;4042:}
;4043:
;4044:/*
;4045:==================
;4046:BotPopFromActivateGoalStack
;4047:==================
;4048:*/
;4049:int BotPopFromActivateGoalStack(bot_state_t *bs) {
line 4050
;4050:	if (!bs->activatestack)
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2420
line 4051
;4051:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2419
JUMPV
LABELV $2420
line 4052
;4052:	BotEnableActivateGoalAreas(bs->activatestack, qtrue);
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4053
;4053:	bs->activatestack->inuse = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CNSTI4 0
ASGNI4
line 4054
;4054:	bs->activatestack->justused_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CNSTI4 68
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4055
;4055:	bs->activatestack = bs->activatestack->next;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
ASGNP4
line 4056
;4056:	return qtrue;
CNSTI4 1
RETI4
LABELV $2419
endproc BotPopFromActivateGoalStack 4 8
export BotPushOntoActivateGoalStack
proc BotPushOntoActivateGoalStack 24 12
line 4064
;4057:}
;4058:
;4059:/*
;4060:==================
;4061:BotPushOntoActivateGoalStack
;4062:==================
;4063:*/
;4064:int BotPushOntoActivateGoalStack(bot_state_t *bs, bot_activategoal_t *activategoal) {
line 4068
;4065:	int i, best;
;4066:	float besttime;
;4067:
;4068:	best = -1;
ADDRLP4 8
CNSTI4 -1
ASGNI4
line 4069
;4069:	besttime = FloatTime() + 9999;
ADDRLP4 4
ADDRGP4 floattime
INDIRF4
CNSTF4 1176255488
ADDF4
ASGNF4
line 4071
;4070:	//
;4071:	for (i = 0; i < MAX_ACTIVATESTACK; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2423
line 4072
;4072:		if (!bs->activategoalheap[i].inuse) {
CNSTI4 244
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2427
line 4073
;4073:			if (bs->activategoalheap[i].justused_time < besttime) {
CNSTI4 244
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
ADDP4
CNSTI4 68
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
GEF4 $2429
line 4074
;4074:				besttime = bs->activategoalheap[i].justused_time;
ADDRLP4 4
CNSTI4 244
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
ADDP4
CNSTI4 68
ADDP4
INDIRF4
ASGNF4
line 4075
;4075:				best = i;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 4076
;4076:			}
LABELV $2429
line 4077
;4077:		}
LABELV $2427
line 4078
;4078:	}
LABELV $2424
line 4071
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $2423
line 4079
;4079:	if (best != -1) {
ADDRLP4 8
INDIRI4
CNSTI4 -1
EQI4 $2431
line 4080
;4080:		memcpy(&bs->activategoalheap[best], activategoal, sizeof(bot_activategoal_t));
ADDRLP4 12
CNSTI4 244
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 4081
;4081:		bs->activategoalheap[best].inuse = qtrue;
CNSTI4 244
ADDRLP4 8
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
ADDP4
CNSTI4 1
ASGNI4
line 4082
;4082:		bs->activategoalheap[best].next = bs->activatestack;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 244
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 16
INDIRP4
CNSTI4 7120
ADDP4
ADDP4
CNSTI4 240
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
ASGNP4
line 4083
;4083:		bs->activatestack = &bs->activategoalheap[best];
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 7116
ADDP4
CNSTI4 244
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 20
INDIRP4
CNSTI4 7120
ADDP4
ADDP4
ASGNP4
line 4084
;4084:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2422
JUMPV
LABELV $2431
line 4086
;4085:	}
;4086:	return qfalse;
CNSTI4 0
RETI4
LABELV $2422
endproc BotPushOntoActivateGoalStack 24 12
export BotClearActivateGoalStack
proc BotClearActivateGoalStack 0 4
line 4094
;4087:}
;4088:
;4089:/*
;4090:==================
;4091:BotClearActivateGoalStack
;4092:==================
;4093:*/
;4094:void BotClearActivateGoalStack(bot_state_t *bs) {
ADDRGP4 $2435
JUMPV
LABELV $2434
line 4096
;4095:	while(bs->activatestack)
;4096:		BotPopFromActivateGoalStack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotPopFromActivateGoalStack
CALLI4
pop
LABELV $2435
line 4095
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2434
line 4097
;4097:}
LABELV $2433
endproc BotClearActivateGoalStack 0 4
export BotEnableActivateGoalAreas
proc BotEnableActivateGoalAreas 12 8
line 4104
;4098:
;4099:/*
;4100:==================
;4101:BotEnableActivateGoalAreas
;4102:==================
;4103:*/
;4104:void BotEnableActivateGoalAreas(bot_activategoal_t *activategoal, int enable) {
line 4107
;4105:	int i;
;4106:
;4107:	if (activategoal->areasdisabled == !enable)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $2441
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $2442
JUMPV
LABELV $2441
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $2442
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $2438
line 4108
;4108:		return;
ADDRGP4 $2437
JUMPV
LABELV $2438
line 4109
;4109:	for (i = 0; i < activategoal->numareas; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2446
JUMPV
LABELV $2443
line 4110
;4110:		trap_AAS_EnableRoutingArea( activategoal->areas[i], enable );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 trap_AAS_EnableRoutingArea
CALLI4
pop
LABELV $2444
line 4109
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2446
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
LTI4 $2443
line 4111
;4111:	activategoal->areasdisabled = !enable;
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $2448
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $2449
JUMPV
LABELV $2448
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $2449
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 4112
;4112:}
LABELV $2437
endproc BotEnableActivateGoalAreas 12 8
export BotIsGoingToActivateEntity
proc BotIsGoingToActivateEntity 8 0
line 4119
;4113:
;4114:/*
;4115:==================
;4116:BotIsGoingToActivateEntity
;4117:==================
;4118:*/
;4119:int BotIsGoingToActivateEntity(bot_state_t *bs, int entitynum) {
line 4123
;4120:	bot_activategoal_t *a;
;4121:	int i;
;4122:
;4123:	for (a = bs->activatestack; a; a = a->next) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $2454
JUMPV
LABELV $2451
line 4124
;4124:		if (a->time < FloatTime())
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $2455
line 4125
;4125:			continue;
ADDRGP4 $2452
JUMPV
LABELV $2455
line 4126
;4126:		if (a->goal.entitynum == entitynum)
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $2457
line 4127
;4127:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2450
JUMPV
LABELV $2457
line 4128
;4128:	}
LABELV $2452
line 4123
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
ASGNP4
LABELV $2454
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2451
line 4129
;4129:	for (i = 0; i < MAX_ACTIVATESTACK; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $2459
line 4130
;4130:		if (bs->activategoalheap[i].inuse)
CNSTI4 244
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2463
line 4131
;4131:			continue;
ADDRGP4 $2460
JUMPV
LABELV $2463
line 4133
;4132:		//
;4133:		if (bs->activategoalheap[i].goal.entitynum == entitynum) {
CNSTI4 244
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
ADDP4
CNSTI4 44
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $2465
line 4135
;4134:			// if the bot went for this goal less than 2 seconds ago
;4135:			if (bs->activategoalheap[i].justused_time > FloatTime() - 2)
CNSTI4 244
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
ADDP4
CNSTI4 68
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
SUBF4
LEF4 $2467
line 4136
;4136:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2450
JUMPV
LABELV $2467
line 4137
;4137:		}
LABELV $2465
line 4138
;4138:	}
LABELV $2460
line 4129
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 8
LTI4 $2459
line 4139
;4139:	return qfalse;
CNSTI4 0
RETI4
LABELV $2450
endproc BotIsGoingToActivateEntity 8 0
export BotGetActivateGoal
proc BotGetActivateGoal 3320 20
line 4152
;4140:}
;4141:
;4142:/*
;4143:==================
;4144:BotGetActivateGoal
;4145:
;4146:  returns the number of the bsp entity to activate
;4147:  goal->entitynum will be set to the game entity to activate
;4148:==================
;4149:*/
;4150://#define OBSTACLEDEBUG
;4151:
;4152:int BotGetActivateGoal(bot_state_t *bs, int entitynum, bot_activategoal_t *activategoal) {
line 4162
;4153:	int i, ent, cur_entities[10], spawnflags, modelindex, areas[MAX_ACTIVATEAREAS*2], numareas, t;
;4154:	char model[MAX_INFO_STRING], tmpmodel[128];
;4155:	char target[128], classname[128];
;4156:	float health;
;4157:	char targetname[10][128];
;4158:	aas_entityinfo_t entinfo;
;4159:	aas_areainfo_t areainfo;
;4160:	vec3_t origin, angles, absmins, absmaxs;
;4161:
;4162:	memset(activategoal, 0, sizeof(bot_activategoal_t));
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 244
ARGI4
ADDRGP4 memset
CALLP4
pop
line 4163
;4163:	BotEntityInfo(entitynum, &entinfo);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 3052
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 4164
;4164:	Com_sprintf(model, sizeof( model ), "*%d", entinfo.modelindex);
ADDRLP4 1712
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2470
ARGP4
ADDRLP4 3052+104
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 4165
;4165:	for (ent = trap_AAS_NextBSPEntity(0); ent; ent = trap_AAS_NextBSPEntity(ent)) {
CNSTI4 0
ARGI4
ADDRLP4 3252
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 3252
INDIRI4
ASGNI4
ADDRGP4 $2475
JUMPV
LABELV $2472
line 4166
;4166:		if (!trap_AAS_ValueForBSPEpairKey(ent, "model", tmpmodel, sizeof(tmpmodel))) continue;
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $528
ARGP4
ADDRLP4 1584
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 3256
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3256
INDIRI4
CNSTI4 0
NEI4 $2476
ADDRGP4 $2473
JUMPV
LABELV $2476
line 4167
;4167:		if (!strcmp(model, tmpmodel)) break;
ADDRLP4 1712
ARGP4
ADDRLP4 1584
ARGP4
ADDRLP4 3260
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3260
INDIRI4
CNSTI4 0
NEI4 $2478
ADDRGP4 $2474
JUMPV
LABELV $2478
line 4168
;4168:	}
LABELV $2473
line 4165
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 3256
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 3256
INDIRI4
ASGNI4
LABELV $2475
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2472
LABELV $2474
line 4169
;4169:	if (!ent) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2480
line 4170
;4170:		BotAI_Print(PRT_ERROR, "BotGetActivateGoal: no entity found with model %s\n", model);
CNSTI4 3
ARGI4
ADDRGP4 $2482
ARGP4
ADDRLP4 1712
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4171
;4171:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2469
JUMPV
LABELV $2480
line 4173
;4172:	}
;4173:	trap_AAS_ValueForBSPEpairKey(ent, "classname", classname, sizeof(classname));
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $2483
ARGP4
ADDRLP4 1456
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4174
;4174:	if (!classname) {
ADDRLP4 1456
CVPU4 4
CNSTU4 0
NEU4 $2484
line 4175
;4175:		BotAI_Print(PRT_ERROR, "BotGetActivateGoal: entity with model %s has no classname\n", model);
CNSTI4 3
ARGI4
ADDRGP4 $2486
ARGP4
ADDRLP4 1712
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4176
;4176:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2469
JUMPV
LABELV $2484
line 4179
;4177:	}
;4178:	//if it is a door
;4179:	if (!strcmp(classname, "func_door")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $2489
ARGP4
ADDRLP4 3260
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3260
INDIRI4
CNSTI4 0
NEI4 $2487
line 4180
;4180:		if (trap_AAS_FloatForBSPEpairKey(ent, "health", &health)) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $2285
ARGP4
ADDRLP4 3208
ARGP4
ADDRLP4 3264
ADDRGP4 trap_AAS_FloatForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3264
INDIRI4
CNSTI4 0
EQI4 $2490
line 4182
;4181:			//if the door has health then the door must be shot to open
;4182:			if (health) {
ADDRLP4 3208
INDIRF4
CNSTF4 0
EQF4 $2492
line 4183
;4183:				BotFuncDoorActivateGoal(bs, ent, activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 BotFuncDoorActivateGoal
CALLI4
pop
line 4184
;4184:				return ent;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $2469
JUMPV
LABELV $2492
line 4186
;4185:			}
;4186:		}
LABELV $2490
line 4188
;4187:		//
;4188:		trap_AAS_IntForBSPEpairKey(ent, "spawnflags", &spawnflags);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $2494
ARGP4
ADDRLP4 3204
ARGP4
ADDRGP4 trap_AAS_IntForBSPEpairKey
CALLI4
pop
line 4190
;4189:		// if the door starts open then just wait for the door to return
;4190:		if ( spawnflags & 1 )
ADDRLP4 3204
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $2495
line 4191
;4191:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $2469
JUMPV
LABELV $2495
line 4193
;4192:		//get the door origin
;4193:		if (!trap_AAS_VectorForBSPEpairKey(ent, "origin", origin)) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $2499
ARGP4
ADDRLP4 3192
ARGP4
ADDRLP4 3268
ADDRGP4 trap_AAS_VectorForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3268
INDIRI4
CNSTI4 0
NEI4 $2497
line 4194
;4194:			VectorClear(origin);
ADDRLP4 3272
CNSTF4 0
ASGNF4
ADDRLP4 3192+8
ADDRLP4 3272
INDIRF4
ASGNF4
ADDRLP4 3192+4
ADDRLP4 3272
INDIRF4
ASGNF4
ADDRLP4 3192
ADDRLP4 3272
INDIRF4
ASGNF4
line 4195
;4195:		}
LABELV $2497
line 4197
;4196:		//if the door is open or opening already
;4197:		if (!VectorCompare(origin, entinfo.origin))
ADDRLP4 3192
ARGP4
ADDRLP4 3052+24
ARGP4
ADDRLP4 3272
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 3272
INDIRI4
CNSTI4 0
NEI4 $2502
line 4198
;4198:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $2469
JUMPV
LABELV $2502
line 4200
;4199:		// store all the areas the door is in
;4200:		trap_AAS_ValueForBSPEpairKey(ent, "model", model, sizeof(model));
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $528
ARGP4
ADDRLP4 1712
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4201
;4201:		if (*model) {
ADDRLP4 1712
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $2505
line 4202
;4202:			modelindex = atoi(model+1);
ADDRLP4 1712+1
ARGP4
ADDRLP4 3276
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 3212
ADDRLP4 3276
INDIRI4
ASGNI4
line 4203
;4203:			if (modelindex) {
ADDRLP4 3212
INDIRI4
CNSTI4 0
EQI4 $2508
line 4204
;4204:				VectorClear(angles);
ADDRLP4 3280
CNSTF4 0
ASGNF4
ADDRLP4 3216+8
ADDRLP4 3280
INDIRF4
ASGNF4
ADDRLP4 3216+4
ADDRLP4 3280
INDIRF4
ASGNF4
ADDRLP4 3216
ADDRLP4 3280
INDIRF4
ASGNF4
line 4205
;4205:				BotModelMinsMaxs(modelindex, ET_MOVER, 0, absmins, absmaxs);
ADDRLP4 3212
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 3228
ARGP4
ADDRLP4 3240
ARGP4
ADDRGP4 BotModelMinsMaxs
CALLI4
pop
line 4207
;4206:				//
;4207:				numareas = trap_AAS_BBoxAreas(absmins, absmaxs, areas, MAX_ACTIVATEAREAS*2);
ADDRLP4 3228
ARGP4
ADDRLP4 3240
ARGP4
ADDRLP4 2740
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 3284
ADDRGP4 trap_AAS_BBoxAreas
CALLI4
ASGNI4
ADDRLP4 3048
ADDRLP4 3284
INDIRI4
ASGNI4
line 4209
;4208:				// store the areas with reachabilities first
;4209:				for (i = 0; i < numareas; i++) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $2515
JUMPV
LABELV $2512
line 4210
;4210:					if (activategoal->numareas >= MAX_ACTIVATEAREAS)
ADDRFP4 8
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 32
LTI4 $2516
line 4211
;4211:						break;
ADDRGP4 $2514
JUMPV
LABELV $2516
line 4212
;4212:					if ( !trap_AAS_AreaReachability(areas[i]) ) {
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ARGI4
ADDRLP4 3288
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 3288
INDIRI4
CNSTI4 0
NEI4 $2518
line 4213
;4213:						continue;
ADDRGP4 $2513
JUMPV
LABELV $2518
line 4215
;4214:					}
;4215:					trap_AAS_AreaInfo(areas[i], &areainfo);
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ARGI4
ADDRLP4 2996
ARGP4
ADDRGP4 trap_AAS_AreaInfo
CALLI4
pop
line 4216
;4216:					if (areainfo.contents & AREACONTENTS_MOVER) {
ADDRLP4 2996
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $2520
line 4217
;4217:						activategoal->areas[activategoal->numareas++] = areas[i];
ADDRLP4 3296
ADDRFP4 8
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 3292
ADDRLP4 3296
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 3296
INDIRP4
ADDRLP4 3292
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 3300
CNSTI4 2
ASGNI4
ADDRLP4 3292
INDIRI4
ADDRLP4 3300
INDIRI4
LSHI4
ADDRFP4 8
INDIRP4
CNSTI4 104
ADDP4
ADDP4
ADDRLP4 132
INDIRI4
ADDRLP4 3300
INDIRI4
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ASGNI4
line 4218
;4218:					}
LABELV $2520
line 4219
;4219:				}
LABELV $2513
line 4209
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2515
ADDRLP4 132
INDIRI4
ADDRLP4 3048
INDIRI4
LTI4 $2512
LABELV $2514
line 4221
;4220:				// store any remaining areas
;4221:				for (i = 0; i < numareas; i++) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $2525
JUMPV
LABELV $2522
line 4222
;4222:					if (activategoal->numareas >= MAX_ACTIVATEAREAS)
ADDRFP4 8
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 32
LTI4 $2526
line 4223
;4223:						break;
ADDRGP4 $2524
JUMPV
LABELV $2526
line 4224
;4224:					if ( trap_AAS_AreaReachability(areas[i]) ) {
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ARGI4
ADDRLP4 3288
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 3288
INDIRI4
CNSTI4 0
EQI4 $2528
line 4225
;4225:						continue;
ADDRGP4 $2523
JUMPV
LABELV $2528
line 4227
;4226:					}
;4227:					trap_AAS_AreaInfo(areas[i], &areainfo);
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ARGI4
ADDRLP4 2996
ARGP4
ADDRGP4 trap_AAS_AreaInfo
CALLI4
pop
line 4228
;4228:					if (areainfo.contents & AREACONTENTS_MOVER) {
ADDRLP4 2996
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $2530
line 4229
;4229:						activategoal->areas[activategoal->numareas++] = areas[i];
ADDRLP4 3296
ADDRFP4 8
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 3292
ADDRLP4 3296
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 3296
INDIRP4
ADDRLP4 3292
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 3300
CNSTI4 2
ASGNI4
ADDRLP4 3292
INDIRI4
ADDRLP4 3300
INDIRI4
LSHI4
ADDRFP4 8
INDIRP4
CNSTI4 104
ADDP4
ADDP4
ADDRLP4 132
INDIRI4
ADDRLP4 3300
INDIRI4
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ASGNI4
line 4230
;4230:					}
LABELV $2530
line 4231
;4231:				}
LABELV $2523
line 4221
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2525
ADDRLP4 132
INDIRI4
ADDRLP4 3048
INDIRI4
LTI4 $2522
LABELV $2524
line 4232
;4232:			}
LABELV $2508
line 4233
;4233:		}
LABELV $2505
line 4234
;4234:	}
LABELV $2487
line 4236
;4235:	// if the bot is blocked by or standing on top of a button
;4236:	if (!strcmp(classname, "func_button")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $2534
ARGP4
ADDRLP4 3264
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3264
INDIRI4
CNSTI4 0
NEI4 $2532
line 4237
;4237:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2469
JUMPV
LABELV $2532
line 4240
;4238:	}
;4239:	// get the targetname so we can find an entity with a matching target
;4240:	if (!trap_AAS_ValueForBSPEpairKey(ent, "targetname", targetname[0], sizeof(targetname[0]))) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $2537
ARGP4
ADDRLP4 136
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 3268
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3268
INDIRI4
CNSTI4 0
NEI4 $2535
line 4241
;4241:		if (bot_developer.integer) {
ADDRGP4 bot_developer+12
INDIRI4
CNSTI4 0
EQI4 $2538
line 4242
;4242:			BotAI_Print(PRT_ERROR, "BotGetActivateGoal: entity with model \"%s\" has no targetname\n", model);
CNSTI4 3
ARGI4
ADDRGP4 $2541
ARGP4
ADDRLP4 1712
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4243
;4243:		}
LABELV $2538
line 4244
;4244:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2469
JUMPV
LABELV $2535
line 4247
;4245:	}
;4246:	// allow tree-like activation
;4247:	cur_entities[0] = trap_AAS_NextBSPEntity(0);
CNSTI4 0
ARGI4
ADDRLP4 3272
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 1416
ADDRLP4 3272
INDIRI4
ASGNI4
line 4248
;4248:	for (i = 0; i >= 0 && i < 10;) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $2545
JUMPV
LABELV $2542
line 4249
;4249:		for (ent = cur_entities[i]; ent; ent = trap_AAS_NextBSPEntity(ent)) {
ADDRLP4 0
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1416
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $2549
JUMPV
LABELV $2546
line 4250
;4250:			if (!trap_AAS_ValueForBSPEpairKey(ent, "target", target, sizeof(target))) continue;
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $2552
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 3276
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3276
INDIRI4
CNSTI4 0
NEI4 $2550
ADDRGP4 $2547
JUMPV
LABELV $2550
line 4251
;4251:			if (!strcmp(targetname[i], target)) {
ADDRLP4 132
INDIRI4
CNSTI4 7
LSHI4
ADDRLP4 136
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 3280
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3280
INDIRI4
CNSTI4 0
NEI4 $2553
line 4252
;4252:				cur_entities[i] = trap_AAS_NextBSPEntity(ent);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 3284
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1416
ADDP4
ADDRLP4 3284
INDIRI4
ASGNI4
line 4253
;4253:				break;
ADDRGP4 $2548
JUMPV
LABELV $2553
line 4255
;4254:			}
;4255:		}
LABELV $2547
line 4249
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 3276
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 3276
INDIRI4
ASGNI4
LABELV $2549
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2546
LABELV $2548
line 4256
;4256:		if (!ent) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2555
line 4257
;4257:			if (bot_developer.integer) {
ADDRGP4 bot_developer+12
INDIRI4
CNSTI4 0
EQI4 $2557
line 4258
;4258:				BotAI_Print(PRT_ERROR, "BotGetActivateGoal: no entity with target \"%s\"\n", targetname[i]);
CNSTI4 3
ARGI4
ADDRGP4 $2560
ARGP4
ADDRLP4 132
INDIRI4
CNSTI4 7
LSHI4
ADDRLP4 136
ADDP4
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4259
;4259:			}
LABELV $2557
line 4260
;4260:			i--;
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4261
;4261:			continue;
ADDRGP4 $2543
JUMPV
LABELV $2555
line 4263
;4262:		}
;4263:		if (!trap_AAS_ValueForBSPEpairKey(ent, "classname", classname, sizeof(classname))) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $2483
ARGP4
ADDRLP4 1456
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 3280
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3280
INDIRI4
CNSTI4 0
NEI4 $2561
line 4264
;4264:			if (bot_developer.integer) {
ADDRGP4 bot_developer+12
INDIRI4
CNSTI4 0
EQI4 $2543
line 4265
;4265:				BotAI_Print(PRT_ERROR, "BotGetActivateGoal: entity with target \"%s\" has no classname\n", targetname[i]);
CNSTI4 3
ARGI4
ADDRGP4 $2566
ARGP4
ADDRLP4 132
INDIRI4
CNSTI4 7
LSHI4
ADDRLP4 136
ADDP4
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4266
;4266:			}
line 4267
;4267:			continue;
ADDRGP4 $2543
JUMPV
LABELV $2561
line 4270
;4268:		}
;4269:		// BSP button model
;4270:		if (!strcmp(classname, "func_button")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $2534
ARGP4
ADDRLP4 3284
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3284
INDIRI4
CNSTI4 0
NEI4 $2567
line 4272
;4271:			//
;4272:			if (!BotFuncButtonActivateGoal(bs, ent, activategoal))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 3288
ADDRGP4 BotFuncButtonActivateGoal
CALLI4
ASGNI4
ADDRLP4 3288
INDIRI4
CNSTI4 0
NEI4 $2569
line 4273
;4273:				continue;
ADDRGP4 $2543
JUMPV
LABELV $2569
line 4275
;4274:			// if the bot tries to activate this button already
;4275:			if ( bs->activatestack && bs->activatestack->inuse &&
ADDRLP4 3292
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
ASGNP4
ADDRLP4 3292
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2571
ADDRLP4 3292
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $2571
ADDRLP4 3296
CNSTI4 44
ASGNI4
ADDRLP4 3292
INDIRP4
ADDRLP4 3296
INDIRI4
ADDP4
INDIRI4
ADDRFP4 8
INDIRP4
ADDRLP4 3296
INDIRI4
ADDP4
INDIRI4
NEI4 $2571
ADDRLP4 3300
ADDRGP4 floattime
INDIRF4
ASGNF4
ADDRLP4 3292
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ADDRLP4 3300
INDIRF4
LEF4 $2571
ADDRLP4 3292
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ADDRLP4 3300
INDIRF4
CNSTF4 1073741824
SUBF4
GEF4 $2571
line 4279
;4276:				 bs->activatestack->goal.entitynum == activategoal->goal.entitynum &&
;4277:				 bs->activatestack->time > FloatTime() &&
;4278:				 bs->activatestack->start_time < FloatTime() - 2)
;4279:				continue;
ADDRGP4 $2543
JUMPV
LABELV $2571
line 4281
;4280:			// if the bot is in a reachability area
;4281:			if ( trap_AAS_AreaReachability(bs->areanum) ) {
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 3304
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 3304
INDIRI4
CNSTI4 0
EQI4 $2573
line 4283
;4282:				// disable all areas the blocking entity is in
;4283:				BotEnableActivateGoalAreas( activategoal, qfalse );
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4285
;4284:				//
;4285:				t = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, activategoal->goal.areanum, bs->tfl);
ADDRLP4 3308
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 3308
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 3308
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 3308
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRLP4 3312
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 2736
ADDRLP4 3312
INDIRI4
ASGNI4
line 4287
;4286:				// if the button is not reachable
;4287:				if (!t) {
ADDRLP4 2736
INDIRI4
CNSTI4 0
NEI4 $2575
line 4288
;4288:					continue;
ADDRGP4 $2543
JUMPV
LABELV $2575
line 4290
;4289:				}
;4290:				activategoal->time = FloatTime() + t * 0.01 + 5;
ADDRFP4 8
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1008981770
ADDRLP4 2736
INDIRI4
CVIF4 4
MULF4
ADDF4
CNSTF4 1084227584
ADDF4
ASGNF4
line 4291
;4291:			}
LABELV $2573
line 4292
;4292:			return ent;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $2469
JUMPV
LABELV $2567
line 4295
;4293:		}
;4294:		// invisible trigger multiple box
;4295:		else if (!strcmp(classname, "trigger_multiple")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $2579
ARGP4
ADDRLP4 3288
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3288
INDIRI4
CNSTI4 0
NEI4 $2577
line 4297
;4296:			//
;4297:			if (!BotTriggerMultipleActivateGoal(bs, ent, activategoal))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 3292
ADDRGP4 BotTriggerMultipleActivateGoal
CALLI4
ASGNI4
ADDRLP4 3292
INDIRI4
CNSTI4 0
NEI4 $2580
line 4298
;4298:				continue;
ADDRGP4 $2543
JUMPV
LABELV $2580
line 4300
;4299:			// if the bot tries to activate this trigger already
;4300:			if ( bs->activatestack && bs->activatestack->inuse &&
ADDRLP4 3296
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
ASGNP4
ADDRLP4 3296
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2582
ADDRLP4 3296
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $2582
ADDRLP4 3300
CNSTI4 44
ASGNI4
ADDRLP4 3296
INDIRP4
ADDRLP4 3300
INDIRI4
ADDP4
INDIRI4
ADDRFP4 8
INDIRP4
ADDRLP4 3300
INDIRI4
ADDP4
INDIRI4
NEI4 $2582
ADDRLP4 3304
ADDRGP4 floattime
INDIRF4
ASGNF4
ADDRLP4 3296
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ADDRLP4 3304
INDIRF4
LEF4 $2582
ADDRLP4 3296
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ADDRLP4 3304
INDIRF4
CNSTF4 1073741824
SUBF4
GEF4 $2582
line 4304
;4301:				 bs->activatestack->goal.entitynum == activategoal->goal.entitynum &&
;4302:				 bs->activatestack->time > FloatTime() &&
;4303:				 bs->activatestack->start_time < FloatTime() - 2)
;4304:				continue;
ADDRGP4 $2543
JUMPV
LABELV $2582
line 4306
;4305:			// if the bot is in a reachability area
;4306:			if ( trap_AAS_AreaReachability(bs->areanum) ) {
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 3308
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 3308
INDIRI4
CNSTI4 0
EQI4 $2584
line 4308
;4307:				// disable all areas the blocking entity is in
;4308:				BotEnableActivateGoalAreas( activategoal, qfalse );
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4310
;4309:				//
;4310:				t = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, activategoal->goal.areanum, bs->tfl);
ADDRLP4 3312
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 3312
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 3312
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 3312
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRLP4 3316
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 2736
ADDRLP4 3316
INDIRI4
ASGNI4
line 4312
;4311:				// if the trigger is not reachable
;4312:				if (!t) {
ADDRLP4 2736
INDIRI4
CNSTI4 0
NEI4 $2586
line 4313
;4313:					continue;
ADDRGP4 $2543
JUMPV
LABELV $2586
line 4315
;4314:				}
;4315:				activategoal->time = FloatTime() + t * 0.01 + 5;
ADDRFP4 8
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1008981770
ADDRLP4 2736
INDIRI4
CVIF4 4
MULF4
ADDF4
CNSTF4 1084227584
ADDF4
ASGNF4
line 4316
;4316:			}
LABELV $2584
line 4317
;4317:			return ent;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $2469
JUMPV
LABELV $2577
line 4319
;4318:		}
;4319:		else if (!strcmp(classname, "func_timer")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $2590
ARGP4
ADDRLP4 3292
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3292
INDIRI4
CNSTI4 0
NEI4 $2588
line 4321
;4320:			// just skip the func_timer
;4321:			continue;
ADDRGP4 $2543
JUMPV
LABELV $2588
line 4324
;4322:		}
;4323:		// the actual button or trigger might be linked through a target_relay or target_delay
;4324:		else if (!strcmp(classname, "target_relay") || !strcmp(classname, "target_delay")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $2593
ARGP4
ADDRLP4 3296
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3296
INDIRI4
CNSTI4 0
EQI4 $2595
ADDRLP4 1456
ARGP4
ADDRGP4 $2594
ARGP4
ADDRLP4 3300
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3300
INDIRI4
CNSTI4 0
NEI4 $2591
LABELV $2595
line 4325
;4325:			if (trap_AAS_ValueForBSPEpairKey(ent, "targetname", targetname[i+1], sizeof(targetname[0]))) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $2537
ARGP4
ADDRLP4 132
INDIRI4
CNSTI4 7
LSHI4
ADDRLP4 136+128
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 3304
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3304
INDIRI4
CNSTI4 0
EQI4 $2596
line 4326
;4326:				i++;
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4327
;4327:				cur_entities[i] = trap_AAS_NextBSPEntity(0);
CNSTI4 0
ARGI4
ADDRLP4 3308
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1416
ADDP4
ADDRLP4 3308
INDIRI4
ASGNI4
line 4328
;4328:			}
LABELV $2596
line 4329
;4329:		}
LABELV $2591
line 4330
;4330:	}
LABELV $2543
line 4248
LABELV $2545
ADDRLP4 132
INDIRI4
CNSTI4 0
LTI4 $2599
ADDRLP4 132
INDIRI4
CNSTI4 10
LTI4 $2542
LABELV $2599
line 4334
;4331:#ifdef OBSTACLEDEBUG
;4332:	BotAI_Print(PRT_ERROR, "BotGetActivateGoal: no valid activator for entity with target \"%s\"\n", targetname[0]);
;4333:#endif
;4334:	return 0;
CNSTI4 0
RETI4
LABELV $2469
endproc BotGetActivateGoal 3320 20
export BotGoForActivateGoal
proc BotGoForActivateGoal 144 8
line 4342
;4335:}
;4336:
;4337:/*
;4338:==================
;4339:BotGoForActivateGoal
;4340:==================
;4341:*/
;4342:int BotGoForActivateGoal(bot_state_t *bs, bot_activategoal_t *activategoal) {
line 4345
;4343:	aas_entityinfo_t activateinfo;
;4344:
;4345:	activategoal->inuse = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 1
ASGNI4
line 4346
;4346:	if (!activategoal->time)
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
CNSTF4 0
NEF4 $2601
line 4347
;4347:		activategoal->time = FloatTime() + 10;
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1092616192
ADDF4
ASGNF4
LABELV $2601
line 4348
;4348:	activategoal->start_time = FloatTime();
ADDRFP4 4
INDIRP4
CNSTI4 64
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4349
;4349:	BotEntityInfo(activategoal->goal.entitynum, &activateinfo);
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 4350
;4350:	VectorCopy(activateinfo.origin, activategoal->origin);
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 4352
;4351:	//
;4352:	if (BotPushOntoActivateGoalStack(bs, activategoal)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotPushOntoActivateGoalStack
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $2604
line 4354
;4353:		// enter the activate entity AI node
;4354:		AIEnter_Seek_ActivateEntity(bs, "BotGoForActivateGoal");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2606
ARGP4
ADDRGP4 AIEnter_Seek_ActivateEntity
CALLV
pop
line 4355
;4355:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2600
JUMPV
LABELV $2604
line 4357
;4356:	}
;4357:	else {
line 4359
;4358:		// enable any routing areas that were disabled
;4359:		BotEnableActivateGoalAreas(activategoal, qtrue);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4360
;4360:		return qfalse;
CNSTI4 0
RETI4
LABELV $2600
endproc BotGoForActivateGoal 144 8
export BotPrintActivateGoalInfo
proc BotPrintActivateGoalInfo 296 36
line 4369
;4361:	}
;4362:}
;4363:
;4364:/*
;4365:==================
;4366:BotPrintActivateGoalInfo
;4367:==================
;4368:*/
;4369:void BotPrintActivateGoalInfo(bot_state_t *bs, bot_activategoal_t *activategoal, int bspent) {
line 4374
;4370:	char netname[MAX_NETNAME];
;4371:	char classname[128];
;4372:	char buf[128];
;4373:
;4374:	ClientName(bs->client, netname, sizeof(netname));
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
line 4375
;4375:	trap_AAS_ValueForBSPEpairKey(bspent, "classname", classname, sizeof(classname));
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $2483
ARGP4
ADDRLP4 36
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4376
;4376:	if (activategoal->shoot) {
ADDRFP4 4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2608
line 4377
;4377:		Com_sprintf(buf, sizeof(buf), "%s: I have to shoot at a %s from %1.1f %1.1f %1.1f in area %d\n",
ADDRLP4 164
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $2610
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 292
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 292
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 4383
;4378:						netname, classname,
;4379:						activategoal->goal.origin[0],
;4380:						activategoal->goal.origin[1],
;4381:						activategoal->goal.origin[2],
;4382:						activategoal->goal.areanum);
;4383:	}
ADDRGP4 $2609
JUMPV
LABELV $2608
line 4384
;4384:	else {
line 4385
;4385:		Com_sprintf(buf, sizeof(buf), "%s: I have to activate a %s at %1.1f %1.1f %1.1f in area %d\n",
ADDRLP4 164
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $2611
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 292
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 292
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 4391
;4386:						netname, classname,
;4387:						activategoal->goal.origin[0],
;4388:						activategoal->goal.origin[1],
;4389:						activategoal->goal.origin[2],
;4390:						activategoal->goal.areanum);
;4391:	}
LABELV $2609
line 4392
;4392:	trap_EA_Say(bs->client, buf);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 164
ARGP4
ADDRGP4 trap_EA_Say
CALLV
pop
line 4393
;4393:}
LABELV $2607
endproc BotPrintActivateGoalInfo 296 36
export BotRandomMove
proc BotRandomMove 32 16
line 4400
;4394:
;4395:/*
;4396:==================
;4397:BotRandomMove
;4398:==================
;4399:*/
;4400:void BotRandomMove(bot_state_t *bs, bot_moveresult_t *moveresult) {
line 4403
;4401:	vec3_t dir, angles;
;4402:
;4403:	angles[0] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 4404
;4404:	angles[1] = random() * 360;
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+4
CNSTF4 1135869952
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ASGNF4
line 4405
;4405:	angles[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 4406
;4406:	AngleVectors(angles, dir, NULL, NULL);
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 28
CNSTP4 0
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 4408
;4407:
;4408:	trap_BotMoveInDirection(bs->ms, dir, 400, MOVE_WALK);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTF4 1137180672
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotMoveInDirection
CALLI4
pop
line 4410
;4409:
;4410:	moveresult->failure = qfalse;
ADDRFP4 4
INDIRP4
CNSTI4 0
ASGNI4
line 4411
;4411:	VectorCopy(dir, moveresult->movedir);
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 12
INDIRB
ASGNB 12
line 4412
;4412:}
LABELV $2612
endproc BotRandomMove 32 16
lit
align 4
LABELV $2616
byte 4 0
byte 4 0
byte 4 1065353216
export BotAIBlocked
code
proc BotAIBlocked 528 16
line 4425
;4413:
;4414:/*
;4415:==================
;4416:BotAIBlocked
;4417:
;4418:Very basic handling of bots being blocked by other entities.
;4419:Check what kind of entity is blocking the bot and try to activate
;4420:it. If that's not an option then try to walk around or over the entity.
;4421:Before the bot ends in this part of the AI it should predict which doors to
;4422:open, which buttons to activate etc.
;4423:==================
;4424:*/
;4425:void BotAIBlocked(bot_state_t *bs, bot_moveresult_t *moveresult, int activate) {
line 4427
;4426:	int movetype, bspent;
;4427:	vec3_t hordir, start, end, mins, maxs, sideward, angles, up = {0, 0, 1};
ADDRLP4 228
ADDRGP4 $2616
INDIRB
ASGNB 12
line 4432
;4428:	aas_entityinfo_t entinfo;
;4429:	bot_activategoal_t activategoal;
;4430:
;4431:	// if the bot is not blocked by anything
;4432:	if (!moveresult->blocked) {
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2617
line 4433
;4433:		bs->notblocked_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6204
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4434
;4434:		return;
ADDRGP4 $2615
JUMPV
LABELV $2617
line 4437
;4435:	}
;4436:	// if stuck in a solid area
;4437:	if ( moveresult->type == RESULTTYPE_INSOLIDAREA ) {
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 8
NEI4 $2619
line 4439
;4438:		// move in a random direction in the hope to get out
;4439:		BotRandomMove(bs, moveresult);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRandomMove
CALLV
pop
line 4441
;4440:		//
;4441:		return;
ADDRGP4 $2615
JUMPV
LABELV $2619
line 4444
;4442:	}
;4443:	// get info for the entity that is blocking the bot
;4444:	BotEntityInfo(moveresult->blockentity, &entinfo);
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 4450
;4445:#ifdef OBSTACLEDEBUG
;4446:	ClientName(bs->client, netname, sizeof(netname));
;4447:	BotAI_Print(PRT_MESSAGE, "%s: I'm blocked by model %d\n", netname, entinfo.modelindex);
;4448:#endif OBSTACLEDEBUG
;4449:	// if blocked by a bsp model and the bot wants to activate it
;4450:	if (activate && entinfo.modelindex > 0 && entinfo.modelindex <= max_bspmodelindex) {
ADDRLP4 488
CNSTI4 0
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 488
INDIRI4
EQI4 $2621
ADDRLP4 40+104
INDIRI4
ADDRLP4 488
INDIRI4
LEI4 $2621
ADDRLP4 40+104
INDIRI4
ADDRGP4 max_bspmodelindex
INDIRI4
GTI4 $2621
line 4452
;4451:		// find the bsp entity which should be activated in order to get the blocking entity out of the way
;4452:		bspent = BotGetActivateGoal(bs, entinfo.number, &activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40+20
INDIRI4
ARGI4
ADDRLP4 240
ARGP4
ADDRLP4 492
ADDRGP4 BotGetActivateGoal
CALLI4
ASGNI4
ADDRLP4 484
ADDRLP4 492
INDIRI4
ASGNI4
line 4453
;4453:		if (bspent) {
ADDRLP4 484
INDIRI4
CNSTI4 0
EQI4 $2626
line 4455
;4454:			//
;4455:			if (bs->activatestack && !bs->activatestack->inuse)
ADDRLP4 496
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
ASGNP4
ADDRLP4 496
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2628
ADDRLP4 496
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $2628
line 4456
;4456:				bs->activatestack = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
CNSTP4 0
ASGNP4
LABELV $2628
line 4458
;4457:			// if not already trying to activate this entity
;4458:			if (!BotIsGoingToActivateEntity(bs, activategoal.goal.entitynum)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 240+4+40
INDIRI4
ARGI4
ADDRLP4 500
ADDRGP4 BotIsGoingToActivateEntity
CALLI4
ASGNI4
ADDRLP4 500
INDIRI4
CNSTI4 0
NEI4 $2630
line 4460
;4459:				//
;4460:				BotGoForActivateGoal(bs, &activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 240
ARGP4
ADDRGP4 BotGoForActivateGoal
CALLI4
pop
line 4461
;4461:			}
LABELV $2630
line 4465
;4462:			// if ontop of an obstacle or
;4463:			// if the bot is not in a reachability area it'll still
;4464:			// need some dynamic obstacle avoidance, otherwise return
;4465:			if (!(moveresult->flags & MOVERESULT_ONTOPOFOBSTACLE) &&
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $2627
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 504
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 504
INDIRI4
CNSTI4 0
EQI4 $2627
line 4467
;4466:				trap_AAS_AreaReachability(bs->areanum))
;4467:				return;
ADDRGP4 $2615
JUMPV
line 4468
;4468:		}
LABELV $2626
line 4469
;4469:		else {
line 4471
;4470:			// enable any routing areas that were disabled
;4471:			BotEnableActivateGoalAreas(&activategoal, qtrue);
ADDRLP4 240
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4472
;4472:		}
LABELV $2627
line 4473
;4473:	}
LABELV $2621
line 4475
;4474:	// just some basic dynamic obstacle avoidance code
;4475:	hordir[0] = moveresult->movedir[0];
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ASGNF4
line 4476
;4476:	hordir[1] = moveresult->movedir[1];
ADDRLP4 0+4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ASGNF4
line 4477
;4477:	hordir[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 4479
;4478:	// if no direction just take a random direction
;4479:	if (VectorNormalize(hordir) < 0.1) {
ADDRLP4 0
ARGP4
ADDRLP4 492
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 492
INDIRF4
CNSTF4 1036831949
GEF4 $2638
line 4480
;4480:		VectorSet(angles, 0, 360 * random(), 0);
ADDRLP4 216
CNSTF4 0
ASGNF4
ADDRLP4 496
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 216+4
CNSTF4 1135869952
ADDRLP4 496
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ASGNF4
ADDRLP4 216+8
CNSTF4 0
ASGNF4
line 4481
;4481:		AngleVectors(angles, hordir, NULL, NULL);
ADDRLP4 216
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 500
CNSTP4 0
ASGNP4
ADDRLP4 500
INDIRP4
ARGP4
ADDRLP4 500
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 4482
;4482:	}
LABELV $2638
line 4486
;4483:	//
;4484:	//if (moveresult->flags & MOVERESULT_ONTOPOFOBSTACLE) movetype = MOVE_JUMP;
;4485:	//else
;4486:	movetype = MOVE_WALK;
ADDRLP4 36
CNSTI4 1
ASGNI4
line 4489
;4487:	// if there's an obstacle at the bot's feet and head then
;4488:	// the bot might be able to crouch through
;4489:	VectorCopy(bs->origin, start);
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 4490
;4490:	start[2] += 18;
ADDRLP4 24+8
ADDRLP4 24+8
INDIRF4
CNSTF4 1099956224
ADDF4
ASGNF4
line 4491
;4491:	VectorMA(start, 5, hordir, end);
ADDRLP4 496
CNSTF4 1084227584
ASGNF4
ADDRLP4 180
ADDRLP4 24
INDIRF4
ADDRLP4 496
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 180+4
ADDRLP4 24+4
INDIRF4
ADDRLP4 496
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 180+8
ADDRLP4 24+8
INDIRF4
CNSTF4 1084227584
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 4492
;4492:	VectorSet(mins, -16, -16, -24);
ADDRLP4 500
CNSTF4 3246391296
ASGNF4
ADDRLP4 192
ADDRLP4 500
INDIRF4
ASGNF4
ADDRLP4 192+4
ADDRLP4 500
INDIRF4
ASGNF4
ADDRLP4 192+8
CNSTF4 3250585600
ASGNF4
line 4493
;4493:	VectorSet(maxs, 16, 16, 4);
ADDRLP4 504
CNSTF4 1098907648
ASGNF4
ADDRLP4 204
ADDRLP4 504
INDIRF4
ASGNF4
ADDRLP4 204+4
ADDRLP4 504
INDIRF4
ASGNF4
ADDRLP4 204+8
CNSTF4 1082130432
ASGNF4
line 4498
;4494:	//
;4495:	//bsptrace = AAS_Trace(start, mins, maxs, end, bs->entitynum, MASK_PLAYERSOLID);
;4496:	//if (bsptrace.fraction >= 1) movetype = MOVE_CROUCH;
;4497:	// get the sideward vector
;4498:	CrossProduct(hordir, up, sideward);
ADDRLP4 0
ARGP4
ADDRLP4 228
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 4500
;4499:	//
;4500:	if (bs->flags & BFL_AVOIDRIGHT) VectorNegate(sideward, sideward);
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $2653
ADDRLP4 12
ADDRLP4 12
INDIRF4
NEGF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
NEGF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
NEGF4
ASGNF4
LABELV $2653
line 4502
;4501:	// try to crouch straight forward?
;4502:	if (movetype != MOVE_CROUCH || !trap_BotMoveInDirection(bs->ms, hordir, 400, movetype)) {
ADDRLP4 36
INDIRI4
CNSTI4 2
NEI4 $2661
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 512
ADDRGP4 trap_BotMoveInDirection
CALLI4
ASGNI4
ADDRLP4 512
INDIRI4
CNSTI4 0
NEI4 $2659
LABELV $2661
line 4504
;4503:		// perform the movement
;4504:		if (!trap_BotMoveInDirection(bs->ms, sideward, 400, movetype)) {
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 516
ADDRGP4 trap_BotMoveInDirection
CALLI4
ASGNI4
ADDRLP4 516
INDIRI4
CNSTI4 0
NEI4 $2662
line 4506
;4505:			// flip the avoid direction flag
;4506:			bs->flags ^= BFL_AVOIDRIGHT;
ADDRLP4 520
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
ASGNP4
ADDRLP4 520
INDIRP4
ADDRLP4 520
INDIRP4
INDIRI4
CNSTI4 16
BXORI4
ASGNI4
line 4509
;4507:			// flip the direction
;4508:			// VectorNegate(sideward, sideward);
;4509:			VectorMA(sideward, -1, hordir, sideward);
ADDRLP4 524
CNSTF4 3212836864
ASGNF4
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 524
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 524
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 3212836864
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 4511
;4510:			// move in the other direction
;4511:			trap_BotMoveInDirection(bs->ms, sideward, 400, movetype);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 trap_BotMoveInDirection
CALLI4
pop
line 4512
;4512:		}
LABELV $2662
line 4513
;4513:	}
LABELV $2659
line 4515
;4514:	//
;4515:	if (bs->notblocked_time < FloatTime() - 0.4) {
ADDRFP4 0
INDIRP4
CNSTI4 6204
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1053609165
SUBF4
GEF4 $2670
line 4518
;4516:		// just reset goals and hope the bot will go into another direction?
;4517:		// is this still needed??
;4518:		if (bs->ainode == AINode_Seek_NBG) bs->nbg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 AINode_Seek_NBG
CVPU4 4
NEU4 $2672
ADDRFP4 0
INDIRP4
CNSTI4 6072
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 $2673
JUMPV
LABELV $2672
line 4519
;4519:		else if (bs->ainode == AINode_Seek_LTG) bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 AINode_Seek_LTG
CVPU4 4
NEU4 $2674
ADDRFP4 0
INDIRP4
CNSTI4 6068
ADDP4
CNSTF4 0
ASGNF4
LABELV $2674
LABELV $2673
line 4520
;4520:	}
LABELV $2670
line 4521
;4521:}
LABELV $2615
endproc BotAIBlocked 528 16
export BotAIPredictObstacles
proc BotAIPredictObstacles 324 44
line 4533
;4522:
;4523:/*
;4524:==================
;4525:BotAIPredictObstacles
;4526:
;4527:Predict the route towards the goal and check if the bot
;4528:will be blocked by certain obstacles. When the bot has obstacles
;4529:on it's path the bot should figure out if they can be removed
;4530:by activating certain entities.
;4531:==================
;4532:*/
;4533:int BotAIPredictObstacles(bot_state_t *bs, bot_goal_t *goal) {
line 4538
;4534:	int modelnum, entitynum, bspent;
;4535:	bot_activategoal_t activategoal;
;4536:	aas_predictroute_t route;
;4537:
;4538:	if (!bot_predictobstacles.integer)
ADDRGP4 bot_predictobstacles+12
INDIRI4
CNSTI4 0
NEI4 $2677
line 4539
;4539:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2676
JUMPV
LABELV $2677
line 4542
;4540:
;4541:	// always predict when the goal change or at regular intervals
;4542:	if (bs->predictobstacles_goalareanum == goal->areanum &&
ADDRLP4 292
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 292
INDIRP4
CNSTI4 6216
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
NEI4 $2680
ADDRLP4 292
INDIRP4
CNSTI4 6212
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1086324736
SUBF4
LEF4 $2680
line 4543
;4543:		bs->predictobstacles_time > FloatTime() - 6) {
line 4544
;4544:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2676
JUMPV
LABELV $2680
line 4546
;4545:	}
;4546:	bs->predictobstacles_goalareanum = goal->areanum;
ADDRFP4 0
INDIRP4
CNSTI4 6216
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 4547
;4547:	bs->predictobstacles_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6212
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4550
;4548:
;4549:	// predict at most 100 areas or 10 seconds ahead
;4550:	trap_AAS_PredictRoute(&route, bs->areanum, bs->origin,
ADDRLP4 0
ARGP4
ADDRLP4 296
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 296
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 296
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 296
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
CNSTI4 100
ARGI4
CNSTI4 1000
ARGI4
CNSTI4 6
ARGI4
CNSTI4 1024
ARGI4
CNSTI4 67108864
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_AAS_PredictRoute
CALLI4
pop
line 4555
;4551:							goal->areanum, bs->tfl, 100, 1000,
;4552:							RSE_USETRAVELTYPE|RSE_ENTERCONTENTS,
;4553:							AREACONTENTS_MOVER, TFL_BRIDGE, 0);
;4554:	// if bot has to travel through an area with a mover
;4555:	if (route.stopevent & RSE_ENTERCONTENTS) {
ADDRLP4 0+16
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $2682
line 4557
;4556:		// if the bot will run into a mover
;4557:		if (route.endcontents & AREACONTENTS_MOVER) {
ADDRLP4 0+20
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $2683
line 4559
;4558:			//NOTE: this only works with bspc 2.1 or higher
;4559:			modelnum = (route.endcontents & AREACONTENTS_MODELNUM) >> AREACONTENTS_MODELNUMSHIFT;
ADDRLP4 300
CNSTI4 24
ASGNI4
ADDRLP4 36
ADDRLP4 0+20
INDIRI4
CNSTI4 255
ADDRLP4 300
INDIRI4
LSHI4
BANDI4
ADDRLP4 300
INDIRI4
RSHI4
ASGNI4
line 4560
;4560:			if (modelnum) {
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $2683
line 4562
;4561:				//
;4562:				entitynum = BotModelMinsMaxs(modelnum, ET_MOVER, 0, NULL, NULL);
ADDRLP4 36
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 304
CNSTP4 0
ASGNP4
ADDRLP4 304
INDIRP4
ARGP4
ADDRLP4 304
INDIRP4
ARGP4
ADDRLP4 308
ADDRGP4 BotModelMinsMaxs
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 308
INDIRI4
ASGNI4
line 4563
;4563:				if (entitynum) {
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $2683
line 4565
;4564:					//NOTE: BotGetActivateGoal already checks if the door is open or not
;4565:					bspent = BotGetActivateGoal(bs, entitynum, &activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 48
ARGP4
ADDRLP4 312
ADDRGP4 BotGetActivateGoal
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 312
INDIRI4
ASGNI4
line 4566
;4566:					if (bspent) {
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $2683
line 4568
;4567:						//
;4568:						if (bs->activatestack && !bs->activatestack->inuse)
ADDRLP4 316
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
ASGNP4
ADDRLP4 316
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2695
ADDRLP4 316
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $2695
line 4569
;4569:							bs->activatestack = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
CNSTP4 0
ASGNP4
LABELV $2695
line 4571
;4570:						// if not already trying to activate this entity
;4571:						if (!BotIsGoingToActivateEntity(bs, activategoal.goal.entitynum)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48+4+40
INDIRI4
ARGI4
ADDRLP4 320
ADDRGP4 BotIsGoingToActivateEntity
CALLI4
ASGNI4
ADDRLP4 320
INDIRI4
CNSTI4 0
NEI4 $2697
line 4575
;4572:							//
;4573:							//BotAI_Print(PRT_MESSAGE, "blocked by mover model %d, entity %d ?\n", modelnum, entitynum);
;4574:							//
;4575:							BotGoForActivateGoal(bs, &activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 BotGoForActivateGoal
CALLI4
pop
line 4576
;4576:							return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2676
JUMPV
LABELV $2697
line 4578
;4577:						}
;4578:						else {
line 4580
;4579:							// enable any routing areas that were disabled
;4580:							BotEnableActivateGoalAreas(&activategoal, qtrue);
ADDRLP4 48
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4581
;4581:						}
line 4582
;4582:					}
line 4583
;4583:				}
line 4584
;4584:			}
line 4585
;4585:		}
line 4586
;4586:	}
ADDRGP4 $2683
JUMPV
LABELV $2682
line 4587
;4587:	else if (route.stopevent & RSE_USETRAVELTYPE) {
ADDRLP4 0+16
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $2701
line 4588
;4588:		if (route.endtravelflags & TFL_BRIDGE) {
ADDRLP4 0+24
INDIRI4
CNSTI4 67108864
BANDI4
CNSTI4 0
EQI4 $2704
line 4590
;4589:			//FIXME: check if the bridge is available to travel over
;4590:		}
LABELV $2704
line 4591
;4591:	}
LABELV $2701
LABELV $2683
line 4592
;4592:	return qfalse;
CNSTI4 0
RETI4
LABELV $2676
endproc BotAIPredictObstacles 324 44
export BotCheckConsoleMessages
proc BotCheckConsoleMessages 1012 48
line 4600
;4593:}
;4594:
;4595:/*
;4596:==================
;4597:BotCheckConsoleMessages
;4598:==================
;4599:*/
;4600:void BotCheckConsoleMessages(bot_state_t *bs) {
line 4608
;4601:	char botname[MAX_NETNAME], message[MAX_MESSAGE_SIZE], netname[MAX_NETNAME], *ptr;
;4602:	float chat_reply;
;4603:	int context, handle;
;4604:	bot_consolemessage_t m;
;4605:	bot_match_t match;
;4606:
;4607:	//the name of this bot
;4608:	ClientName(bs->client, botname, sizeof(botname));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 908
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
ADDRGP4 $2709
JUMPV
LABELV $2708
line 4610
;4609:	//
;4610:	while((handle = trap_BotNextConsoleMessage(bs->cs, &m)) != 0) {
line 4612
;4611:		//if the chat state is flooded with messages the bot will read them quickly
;4612:		if (trap_BotNumConsoleMessages(bs->cs) < 10) {
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 948
ADDRGP4 trap_BotNumConsoleMessages
CALLI4
ASGNI4
ADDRLP4 948
INDIRI4
CNSTI4 10
GEI4 $2711
line 4614
;4613:			//if it is a chat message the bot needs some time to read it
;4614:			if (m.type == CMS_CHAT && m.time > FloatTime() - (1 + random())) break;
ADDRLP4 0+8
INDIRI4
CNSTI4 1
NEI4 $2713
ADDRLP4 952
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+4
INDIRF4
ADDRGP4 floattime
INDIRF4
ADDRLP4 952
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1065353216
ADDF4
SUBF4
LEF4 $2713
ADDRGP4 $2710
JUMPV
LABELV $2713
line 4615
;4615:		}
LABELV $2711
line 4617
;4616:		//
;4617:		ptr = m.message;
ADDRLP4 276
ADDRLP4 0+12
ASGNP4
line 4620
;4618:		//if it is a chat message then don't unify white spaces and don't
;4619:		//replace synonyms in the netname
;4620:		if (m.type == CMS_CHAT) {
ADDRLP4 0+8
INDIRI4
CNSTI4 1
NEI4 $2718
line 4622
;4621:			//
;4622:			if (trap_BotFindMatch(m.message, &match, MTCONTEXT_REPLYCHAT)) {
ADDRLP4 0+12
ARGP4
ADDRLP4 288
ARGP4
CNSTU4 128
ARGU4
ADDRLP4 952
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 952
INDIRI4
CNSTI4 0
EQI4 $2721
line 4623
;4623:				ptr = m.message + match.variables[MESSAGE].offset;
ADDRLP4 276
ADDRLP4 288+264+16
INDIRI1
CVII4 1
ADDRLP4 0+12
ADDP4
ASGNP4
line 4624
;4624:			}
LABELV $2721
line 4625
;4625:		}
LABELV $2718
line 4627
;4626:		//unify the white spaces in the message
;4627:		trap_UnifyWhiteSpaces(ptr);
ADDRLP4 276
INDIRP4
ARGP4
ADDRGP4 trap_UnifyWhiteSpaces
CALLV
pop
line 4629
;4628:		//replace synonyms in the right context
;4629:		context = BotSynonymContext(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 952
ADDRGP4 BotSynonymContext
CALLI4
ASGNI4
ADDRLP4 284
ADDRLP4 952
INDIRI4
ASGNI4
line 4630
;4630:		trap_BotReplaceSynonyms(ptr, context);
ADDRLP4 276
INDIRP4
ARGP4
ADDRLP4 284
INDIRI4
CVIU4 4
ARGU4
ADDRGP4 trap_BotReplaceSynonyms
CALLV
pop
line 4632
;4631:		//if there's no match
;4632:		if (!BotMatchMessage(bs, m.message)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 956
ADDRGP4 BotMatchMessage
CALLI4
ASGNI4
ADDRLP4 956
INDIRI4
CNSTI4 0
NEI4 $2727
line 4634
;4633:			//if it is a chat message
;4634:			if (m.type == CMS_CHAT && !bot_nochat.integer) {
ADDRLP4 0+8
INDIRI4
CNSTI4 1
NEI4 $2730
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 0
NEI4 $2730
line 4636
;4635:				//
;4636:				if (!trap_BotFindMatch(m.message, &match, MTCONTEXT_REPLYCHAT)) {
ADDRLP4 0+12
ARGP4
ADDRLP4 288
ARGP4
CNSTU4 128
ARGU4
ADDRLP4 960
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 960
INDIRI4
CNSTI4 0
NEI4 $2734
line 4637
;4637:					trap_BotRemoveConsoleMessage(bs->cs, handle);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveConsoleMessage
CALLV
pop
line 4638
;4638:					continue;
ADDRGP4 $2709
JUMPV
LABELV $2734
line 4641
;4639:				}
;4640:				//don't use eliza chats with team messages
;4641:				if (match.subtype & ST_TEAM) {
ADDRLP4 288+260
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $2737
line 4642
;4642:					trap_BotRemoveConsoleMessage(bs->cs, handle);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveConsoleMessage
CALLV
pop
line 4643
;4643:					continue;
ADDRGP4 $2709
JUMPV
LABELV $2737
line 4646
;4644:				}
;4645:				//
;4646:				trap_BotMatchVariable(&match, NETNAME, netname, sizeof(netname));
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 872
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 4647
;4647:				trap_BotMatchVariable(&match, MESSAGE, message, sizeof(message));
ADDRLP4 288
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 616
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 4649
;4648:				//if this is a message from the bot self
;4649:				if (bs->client == ClientFromName(netname)) {
ADDRLP4 872
ARGP4
ADDRLP4 964
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 964
INDIRI4
NEI4 $2740
line 4650
;4650:					trap_BotRemoveConsoleMessage(bs->cs, handle);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveConsoleMessage
CALLV
pop
line 4651
;4651:					continue;
ADDRGP4 $2709
JUMPV
LABELV $2740
line 4654
;4652:				}
;4653:				//unify the message
;4654:				trap_UnifyWhiteSpaces(message);
ADDRLP4 616
ARGP4
ADDRGP4 trap_UnifyWhiteSpaces
CALLV
pop
line 4656
;4655:				//
;4656:				trap_Cvar_Update(&bot_testrchat);
ADDRGP4 bot_testrchat
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 4657
;4657:				if (bot_testrchat.integer) {
ADDRGP4 bot_testrchat+12
INDIRI4
CNSTI4 0
EQI4 $2742
line 4659
;4658:					//
;4659:					trap_BotLibVarSet("bot_testrchat", "1");
ADDRGP4 $2745
ARGP4
ADDRGP4 $2746
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 4661
;4660:					//if bot replies with a chat message
;4661:					if (trap_BotReplyChat(bs->cs, message, context, CONTEXT_REPLY,
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 616
ARGP4
ADDRLP4 284
INDIRI4
ARGI4
CNSTI4 16
ARGI4
ADDRLP4 968
CNSTP4 0
ASGNP4
ADDRLP4 968
INDIRP4
ARGP4
ADDRLP4 968
INDIRP4
ARGP4
ADDRLP4 968
INDIRP4
ARGP4
ADDRLP4 968
INDIRP4
ARGP4
ADDRLP4 968
INDIRP4
ARGP4
ADDRLP4 968
INDIRP4
ARGP4
ADDRLP4 908
ARGP4
ADDRLP4 872
ARGP4
ADDRLP4 972
ADDRGP4 trap_BotReplyChat
CALLI4
ASGNI4
ADDRLP4 972
INDIRI4
CNSTI4 0
EQI4 $2747
line 4665
;4662:															NULL, NULL,
;4663:															NULL, NULL,
;4664:															NULL, NULL,
;4665:															botname, netname)) {
line 4666
;4666:						BotAI_Print(PRT_MESSAGE, "------------------------\n");
CNSTI4 1
ARGI4
ADDRGP4 $2749
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4667
;4667:					}
ADDRGP4 $2743
JUMPV
LABELV $2747
line 4668
;4668:					else {
line 4669
;4669:						BotAI_Print(PRT_MESSAGE, "**** no valid reply ****\n");
CNSTI4 1
ARGI4
ADDRGP4 $2750
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4670
;4670:					}
line 4671
;4671:				}
ADDRGP4 $2743
JUMPV
LABELV $2742
line 4673
;4672:				//if at a valid chat position and not chatting already and not in teamplay
;4673:				else if (bs->ainode != AINode_Stand && BotValidChatPosition(bs) && !TeamPlayIsOn()) {
ADDRLP4 968
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 968
INDIRP4
CNSTI4 4900
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 AINode_Stand
CVPU4 4
EQU4 $2751
ADDRLP4 968
INDIRP4
ARGP4
ADDRLP4 972
ADDRGP4 BotValidChatPosition
CALLI4
ASGNI4
ADDRLP4 972
INDIRI4
CNSTI4 0
EQI4 $2751
ADDRLP4 976
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 976
INDIRI4
CNSTI4 0
NEI4 $2751
line 4674
;4674:					chat_reply = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_REPLY, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 35
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 980
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 944
ADDRLP4 980
INDIRF4
ASGNF4
line 4675
;4675:					if (random() < 1.5 / (NumBots()+1) && random() < chat_reply) {
ADDRLP4 984
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 988
ADDRGP4 NumBots
CALLI4
ASGNI4
ADDRLP4 984
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1069547520
ADDRLP4 988
INDIRI4
CNSTI4 1
ADDI4
CVIF4 4
DIVF4
GEF4 $2753
ADDRLP4 992
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 992
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 944
INDIRF4
GEF4 $2753
line 4677
;4676:						//if bot replies with a chat message
;4677:						if (trap_BotReplyChat(bs->cs, message, context, CONTEXT_REPLY,
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 616
ARGP4
ADDRLP4 284
INDIRI4
ARGI4
CNSTI4 16
ARGI4
ADDRLP4 996
CNSTP4 0
ASGNP4
ADDRLP4 996
INDIRP4
ARGP4
ADDRLP4 996
INDIRP4
ARGP4
ADDRLP4 996
INDIRP4
ARGP4
ADDRLP4 996
INDIRP4
ARGP4
ADDRLP4 996
INDIRP4
ARGP4
ADDRLP4 996
INDIRP4
ARGP4
ADDRLP4 908
ARGP4
ADDRLP4 872
ARGP4
ADDRLP4 1000
ADDRGP4 trap_BotReplyChat
CALLI4
ASGNI4
ADDRLP4 1000
INDIRI4
CNSTI4 0
EQI4 $2755
line 4681
;4678:																NULL, NULL,
;4679:																NULL, NULL,
;4680:																NULL, NULL,
;4681:																botname, netname)) {
line 4683
;4682:							//remove the console message
;4683:							trap_BotRemoveConsoleMessage(bs->cs, handle);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveConsoleMessage
CALLV
pop
line 4684
;4684:							bs->stand_time = FloatTime() + BotChatTime(bs);
ADDRLP4 1004
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1004
INDIRP4
ARGP4
ADDRLP4 1008
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 1004
INDIRP4
CNSTI4 6096
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 1008
INDIRF4
ADDF4
ASGNF4
line 4685
;4685:							AIEnter_Stand(bs, "BotCheckConsoleMessages: reply chat");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2757
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 4687
;4686:							//EA_Say(bs->client, bs->cs.chatmessage);
;4687:							break;
ADDRGP4 $2710
JUMPV
LABELV $2755
line 4689
;4688:						}
;4689:					}
LABELV $2753
line 4690
;4690:				}
LABELV $2751
LABELV $2743
line 4691
;4691:			}
LABELV $2730
line 4692
;4692:		}
LABELV $2727
line 4694
;4693:		//remove the console message
;4694:		trap_BotRemoveConsoleMessage(bs->cs, handle);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveConsoleMessage
CALLV
pop
line 4695
;4695:	}
LABELV $2709
line 4610
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 948
ADDRGP4 trap_BotNextConsoleMessage
CALLI4
ASGNI4
ADDRLP4 280
ADDRLP4 948
INDIRI4
ASGNI4
ADDRLP4 948
INDIRI4
CNSTI4 0
NEI4 $2708
LABELV $2710
line 4696
;4696:}
LABELV $2707
endproc BotCheckConsoleMessages 1012 48
export BotCheckForGrenades
proc BotCheckForGrenades 8 16
line 4703
;4697:
;4698:/*
;4699:==================
;4700:BotCheckEvents
;4701:==================
;4702:*/
;4703:void BotCheckForGrenades(bot_state_t *bs, entityState_t *state) {
line 4705
;4704:	// if this is not a grenade
;4705:	if (state->eType != ET_MISSILE || state->weapon != WP_GRENADE_LAUNCHER)
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $2761
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $2759
LABELV $2761
line 4706
;4706:		return;
ADDRGP4 $2758
JUMPV
LABELV $2759
line 4708
;4707:	// try to avoid the grenade
;4708:	trap_BotAddAvoidSpot(bs->ms, state->pos.trBase, 160, AVOID_ALWAYS);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTF4 1126170624
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotAddAvoidSpot
CALLV
pop
line 4709
;4709:}
LABELV $2758
endproc BotCheckForGrenades 8 16
export BotCheckForProxMines
proc BotCheckForProxMines 40 16
line 4717
;4710:
;4711:#ifdef MISSIONPACK
;4712:/*
;4713:==================
;4714:BotCheckForProxMines
;4715:==================
;4716:*/
;4717:void BotCheckForProxMines(bot_state_t *bs, entityState_t *state) {
line 4719
;4718:	// if this is not a prox mine
;4719:	if (state->eType != ET_MISSILE || state->weapon != WP_PROX_LAUNCHER)
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $2765
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 12
EQI4 $2763
LABELV $2765
line 4720
;4720:		return;
ADDRGP4 $2762
JUMPV
LABELV $2763
line 4722
;4721:	// if this prox mine is from someone on our own team
;4722:	if (state->generic1 == BotTeam(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $2766
line 4723
;4723:		return;
ADDRGP4 $2762
JUMPV
LABELV $2766
line 4725
;4724:	// if the bot doesn't have a weapon to deactivate the mine
;4725:	if (!(bs->inventory[INVENTORY_PLASMAGUN] > 0 && bs->inventory[INVENTORY_CELLS] > 0) &&
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 4996
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $2770
ADDRLP4 8
INDIRP4
CNSTI4 5036
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
GTI4 $2768
LABELV $2770
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 4984
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
LEI4 $2771
ADDRLP4 16
INDIRP4
CNSTI4 5044
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
GTI4 $2768
LABELV $2771
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRP4
CNSTI4 5004
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
LEI4 $2772
ADDRLP4 24
INDIRP4
CNSTI4 5052
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
GTI4 $2768
LABELV $2772
line 4727
;4726:		!(bs->inventory[INVENTORY_ROCKETLAUNCHER] > 0 && bs->inventory[INVENTORY_ROCKETS] > 0) &&
;4727:		!(bs->inventory[INVENTORY_BFG10K] > 0 && bs->inventory[INVENTORY_BFGAMMO] > 0) ) {
line 4728
;4728:		return;
ADDRGP4 $2762
JUMPV
LABELV $2768
line 4731
;4729:	}
;4730:	// try to avoid the prox mine
;4731:	trap_BotAddAvoidSpot(bs->ms, state->pos.trBase, 160, AVOID_ALWAYS);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTF4 1126170624
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotAddAvoidSpot
CALLV
pop
line 4733
;4732:	//
;4733:	if (bs->numproxmines >= MAX_PROXMINES)
ADDRFP4 0
INDIRP4
CNSTI4 6516
ADDP4
INDIRI4
CNSTI4 64
LTI4 $2773
line 4734
;4734:		return;
ADDRGP4 $2762
JUMPV
LABELV $2773
line 4735
;4735:	bs->proxmines[bs->numproxmines] = state->number;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 6516
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
INDIRP4
CNSTI4 6260
ADDP4
ADDP4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 4736
;4736:	bs->numproxmines++;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 6516
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4737
;4737:}
LABELV $2762
endproc BotCheckForProxMines 40 16
export BotCheckForKamikazeBody
proc BotCheckForKamikazeBody 0 0
line 4744
;4738:
;4739:/*
;4740:==================
;4741:BotCheckForKamikazeBody
;4742:==================
;4743:*/
;4744:void BotCheckForKamikazeBody(bot_state_t *bs, entityState_t *state) {
line 4746
;4745:	// if this entity is not wearing the kamikaze
;4746:	if (!(state->eFlags & EF_KAMIKAZE))
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
NEI4 $2776
line 4747
;4747:		return;
ADDRGP4 $2775
JUMPV
LABELV $2776
line 4749
;4748:	// if this entity isn't dead
;4749:	if (!(state->eFlags & EF_DEAD))
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $2778
line 4750
;4750:		return;
ADDRGP4 $2775
JUMPV
LABELV $2778
line 4752
;4751:	//remember this kamikaze body
;4752:	bs->kamikazebody = state->number;
ADDRFP4 0
INDIRP4
CNSTI4 6256
ADDP4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 4753
;4753:}
LABELV $2775
endproc BotCheckForKamikazeBody 0 0
export BotCheckEvents
proc BotCheckEvents 316 12
line 4761
;4754:#endif
;4755:
;4756:/*
;4757:==================
;4758:BotCheckEvents
;4759:==================
;4760:*/
;4761:void BotCheckEvents(bot_state_t *bs, entityState_t *state) {
line 4770
;4762:	int event;
;4763:	char buf[128];
;4764:#ifdef MISSIONPACK
;4765:	aas_entityinfo_t entinfo;
;4766:#endif
;4767:
;4768:	//NOTE: this sucks, we're accessing the gentity_t directly
;4769:	//but there's no other fast way to do it right now
;4770:	if (bs->entityeventTime[state->number] == g_entities[state->number].eventTime) {
ADDRLP4 272
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDP4
INDIRI4
CNSTI4 868
ADDRLP4 272
INDIRI4
MULI4
ADDRGP4 g_entities+552
ADDP4
INDIRI4
NEI4 $2781
line 4771
;4771:		return;
ADDRGP4 $2780
JUMPV
LABELV $2781
line 4773
;4772:	}
;4773:	bs->entityeventTime[state->number] = g_entities[state->number].eventTime;
ADDRLP4 276
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDP4
CNSTI4 868
ADDRLP4 276
INDIRI4
MULI4
ADDRGP4 g_entities+552
ADDP4
INDIRI4
ASGNI4
line 4775
;4774:	//if it's an event only entity
;4775:	if (state->eType > ET_EVENTS) {
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 14
LEI4 $2785
line 4776
;4776:		event = (state->eType - ET_EVENTS) & ~EV_EVENT_BITS;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 14
SUBI4
CNSTI4 -769
BANDI4
ASGNI4
line 4777
;4777:	}
ADDRGP4 $2786
JUMPV
LABELV $2785
line 4778
;4778:	else {
line 4779
;4779:		event = state->event & ~EV_EVENT_BITS;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
ASGNI4
line 4780
;4780:	}
LABELV $2786
line 4782
;4781:	//
;4782:	switch(event) {
ADDRLP4 280
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 1
LTI4 $2787
ADDRLP4 280
INDIRI4
CNSTI4 80
GTI4 $2787
ADDRLP4 280
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2865-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2865
address $2788
address $2788
address $2788
address $2788
address $2788
address $2788
address $2788
address $2788
address $2788
address $2788
address $2788
address $2788
address $2788
address $2788
address $2788
address $2788
address $2788
address $2788
address $2788
address $2788
address $2788
address $2788
address $2788
address $2787
address $2788
address $2788
address $2788
address $2788
address $2788
address $2788
address $2788
address $2788
address $2788
address $2788
address $2788
address $2788
address $2788
address $2788
address $2788
address $2787
address $2787
address $2787
address $2850
address $2787
address $2787
address $2787
address $2851
address $2807
address $2819
address $2787
address $2787
address $2787
address $2787
address $2787
address $2787
address $2787
address $2787
address $2787
address $2787
address $2787
address $2787
address $2789
address $2787
address $2787
address $2787
address $2787
address $2787
address $2787
address $2787
address $2787
address $2787
address $2787
address $2787
address $2787
address $2787
address $2787
address $2787
address $2787
address $2787
address $2788
code
LABELV $2789
line 4785
;4783:		//client obituary event
;4784:		case EV_OBITUARY:
;4785:		{
line 4788
;4786:			int target, attacker, mod;
;4787:
;4788:			target = state->otherEntityNum;
ADDRLP4 284
ADDRFP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 4789
;4789:			attacker = state->otherEntityNum2;
ADDRLP4 288
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 4790
;4790:			mod = state->eventParm;
ADDRLP4 292
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 4792
;4791:			//
;4792:			if (target == bs->client) {
ADDRLP4 284
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2790
line 4793
;4793:				bs->botdeathtype = mod;
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
ADDRLP4 292
INDIRI4
ASGNI4
line 4794
;4794:				bs->lastkilledby = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 5996
ADDP4
ADDRLP4 288
INDIRI4
ASGNI4
line 4796
;4795:				//
;4796:				if (target == attacker ||
ADDRLP4 296
ADDRLP4 284
INDIRI4
ASGNI4
ADDRLP4 296
INDIRI4
ADDRLP4 288
INDIRI4
EQI4 $2795
ADDRLP4 296
INDIRI4
CNSTI4 1023
EQI4 $2795
ADDRLP4 296
INDIRI4
CNSTI4 1022
NEI4 $2792
LABELV $2795
line 4798
;4797:					target == ENTITYNUM_NONE ||
;4798:					target == ENTITYNUM_WORLD) bs->botsuicide = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6008
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $2793
JUMPV
LABELV $2792
line 4799
;4799:				else bs->botsuicide = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6008
ADDP4
CNSTI4 0
ASGNI4
LABELV $2793
line 4801
;4800:				//
;4801:				bs->num_deaths++;
ADDRLP4 300
ADDRFP4 0
INDIRP4
CNSTI4 6028
ADDP4
ASGNP4
ADDRLP4 300
INDIRP4
ADDRLP4 300
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4802
;4802:			}
ADDRGP4 $2791
JUMPV
LABELV $2790
line 4804
;4803:			//else if this client was killed by the bot
;4804:			else if (attacker == bs->client) {
ADDRLP4 288
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2796
line 4805
;4805:				bs->enemydeathtype = mod;
ADDRFP4 0
INDIRP4
CNSTI4 6004
ADDP4
ADDRLP4 292
INDIRI4
ASGNI4
line 4806
;4806:				bs->lastkilledplayer = target;
ADDRFP4 0
INDIRP4
CNSTI4 5992
ADDP4
ADDRLP4 284
INDIRI4
ASGNI4
line 4807
;4807:				bs->killedenemy_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6168
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4809
;4808:				//
;4809:				bs->num_kills++;
ADDRLP4 296
ADDRFP4 0
INDIRP4
CNSTI4 6032
ADDP4
ASGNP4
ADDRLP4 296
INDIRP4
ADDRLP4 296
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4810
;4810:			}
ADDRGP4 $2797
JUMPV
LABELV $2796
line 4811
;4811:			else if (attacker == bs->enemy && target == attacker) {
ADDRLP4 296
ADDRLP4 288
INDIRI4
ASGNI4
ADDRLP4 296
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
NEI4 $2798
ADDRLP4 284
INDIRI4
ADDRLP4 296
INDIRI4
NEI4 $2798
line 4812
;4812:				bs->enemysuicide = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6012
ADDP4
CNSTI4 1
ASGNI4
line 4813
;4813:			}
LABELV $2798
LABELV $2797
LABELV $2791
line 4816
;4814:			//
;4815:#ifdef MISSIONPACK			
;4816:			if (gametype == GT_1FCTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 5
NEI4 $2788
line 4818
;4817:				//
;4818:				BotEntityInfo(target, &entinfo);
ADDRLP4 284
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 4819
;4819:				if ( entinfo.powerups & ( 1 << PW_NEUTRALFLAG ) ) {
ADDRLP4 132+124
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $2788
line 4820
;4820:					if (!BotSameTeam(bs, target)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 284
INDIRI4
ARGI4
ADDRLP4 300
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 300
INDIRI4
CNSTI4 0
NEI4 $2788
line 4821
;4821:						bs->neutralflagstatus = 3;	//enemy dropped the flag
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
CNSTI4 3
ASGNI4
line 4822
;4822:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 1
ASGNI4
line 4823
;4823:					}
line 4824
;4824:				}
line 4825
;4825:			}
line 4827
;4826:#endif
;4827:			break;
ADDRGP4 $2788
JUMPV
LABELV $2807
line 4830
;4828:		}
;4829:		case EV_GLOBAL_SOUND:
;4830:		{
line 4831
;4831:			if (state->eventParm < 0 || state->eventParm > MAX_SOUNDS) {
ADDRLP4 284
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
LTI4 $2810
ADDRLP4 284
INDIRI4
CNSTI4 256
LEI4 $2808
LABELV $2810
line 4832
;4832:				BotAI_Print(PRT_ERROR, "EV_GLOBAL_SOUND: eventParm (%d) out of range\n", state->eventParm);
CNSTI4 3
ARGI4
ADDRGP4 $2811
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 4833
;4833:				break;
ADDRGP4 $2788
JUMPV
LABELV $2808
line 4835
;4834:			}
;4835:			trap_GetConfigstring(CS_SOUNDS + state->eventParm, buf, sizeof(buf));
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 4849
;4836:			/*
;4837:			if (!strcmp(buf, "sound/teamplay/flagret_red.wav")) {
;4838:				//red flag is returned
;4839:				bs->redflagstatus = 0;
;4840:				bs->flagstatuschanged = qtrue;
;4841:			}
;4842:			else if (!strcmp(buf, "sound/teamplay/flagret_blu.wav")) {
;4843:				//blue flag is returned
;4844:				bs->blueflagstatus = 0;
;4845:				bs->flagstatuschanged = qtrue;
;4846:			}
;4847:			else*/
;4848:#ifdef MISSIONPACK
;4849:			if (!strcmp(buf, "sound/items/kamikazerespawn.wav" )) {
ADDRLP4 4
ARGP4
ADDRGP4 $2814
ARGP4
ADDRLP4 288
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
NEI4 $2812
line 4851
;4850:				//the kamikaze respawned so dont avoid it
;4851:				BotDontAvoid(bs, "Kamikaze");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2815
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 4852
;4852:			}
ADDRGP4 $2788
JUMPV
LABELV $2812
line 4855
;4853:			else
;4854:#endif
;4855:				if (!strcmp(buf, "sound/items/poweruprespawn.wav")) {
ADDRLP4 4
ARGP4
ADDRGP4 $2818
ARGP4
ADDRLP4 292
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
NEI4 $2788
line 4857
;4856:				//powerup respawned... go get it
;4857:				BotGoForPowerups(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotGoForPowerups
CALLV
pop
line 4858
;4858:			}
line 4859
;4859:			break;
ADDRGP4 $2788
JUMPV
LABELV $2819
line 4862
;4860:		}
;4861:		case EV_GLOBAL_TEAM_SOUND:
;4862:		{
line 4863
;4863:			if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $2820
line 4864
;4864:				switch(state->eventParm) {
ADDRLP4 284
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
LTI4 $2788
ADDRLP4 284
INDIRI4
CNSTI4 5
GTI4 $2788
ADDRLP4 284
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2831
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2831
address $2825
address $2826
address $2827
address $2828
address $2829
address $2830
code
LABELV $2825
line 4866
;4865:					case GTS_RED_CAPTURE:
;4866:						bs->blueflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 0
ASGNI4
line 4867
;4867:						bs->redflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
CNSTI4 0
ASGNI4
line 4868
;4868:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 1
ASGNI4
line 4869
;4869:						break; //see BotMatch_CTF
ADDRGP4 $2788
JUMPV
LABELV $2826
line 4871
;4870:					case GTS_BLUE_CAPTURE:
;4871:						bs->blueflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 0
ASGNI4
line 4872
;4872:						bs->redflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
CNSTI4 0
ASGNI4
line 4873
;4873:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 1
ASGNI4
line 4874
;4874:						break; //see BotMatch_CTF
ADDRGP4 $2788
JUMPV
LABELV $2827
line 4877
;4875:					case GTS_RED_RETURN:
;4876:						//blue flag is returned
;4877:						bs->blueflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 0
ASGNI4
line 4878
;4878:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 1
ASGNI4
line 4879
;4879:						break;
ADDRGP4 $2788
JUMPV
LABELV $2828
line 4882
;4880:					case GTS_BLUE_RETURN:
;4881:						//red flag is returned
;4882:						bs->redflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
CNSTI4 0
ASGNI4
line 4883
;4883:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 1
ASGNI4
line 4884
;4884:						break;
ADDRGP4 $2788
JUMPV
LABELV $2829
line 4887
;4885:					case GTS_RED_TAKEN:
;4886:						//blue flag is taken
;4887:						bs->blueflagstatus = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 1
ASGNI4
line 4888
;4888:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 1
ASGNI4
line 4889
;4889:						break; //see BotMatch_CTF
ADDRGP4 $2788
JUMPV
LABELV $2830
line 4892
;4890:					case GTS_BLUE_TAKEN:
;4891:						//red flag is taken
;4892:						bs->redflagstatus = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
CNSTI4 1
ASGNI4
line 4893
;4893:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 1
ASGNI4
line 4894
;4894:						break; //see BotMatch_CTF
line 4896
;4895:				}
;4896:			}
ADDRGP4 $2788
JUMPV
LABELV $2820
line 4898
;4897:#ifdef MISSIONPACK
;4898:			else if (gametype == GT_1FCTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 5
NEI4 $2788
line 4899
;4899:				switch(state->eventParm) {
ADDRLP4 284
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
LTI4 $2788
ADDRLP4 284
INDIRI4
CNSTI4 5
GTI4 $2788
ADDRLP4 284
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2849
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2849
address $2837
address $2838
address $2839
address $2840
address $2841
address $2845
code
LABELV $2837
line 4901
;4900:					case GTS_RED_CAPTURE:
;4901:						bs->neutralflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
CNSTI4 0
ASGNI4
line 4902
;4902:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 1
ASGNI4
line 4903
;4903:						break;
ADDRGP4 $2788
JUMPV
LABELV $2838
line 4905
;4904:					case GTS_BLUE_CAPTURE:
;4905:						bs->neutralflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
CNSTI4 0
ASGNI4
line 4906
;4906:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 1
ASGNI4
line 4907
;4907:						break;
ADDRGP4 $2788
JUMPV
LABELV $2839
line 4910
;4908:					case GTS_RED_RETURN:
;4909:						//flag has returned
;4910:						bs->neutralflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
CNSTI4 0
ASGNI4
line 4911
;4911:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 1
ASGNI4
line 4912
;4912:						break;
ADDRGP4 $2788
JUMPV
LABELV $2840
line 4915
;4913:					case GTS_BLUE_RETURN:
;4914:						//flag has returned
;4915:						bs->neutralflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
CNSTI4 0
ASGNI4
line 4916
;4916:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 1
ASGNI4
line 4917
;4917:						break;
ADDRGP4 $2788
JUMPV
LABELV $2841
line 4919
;4918:					case GTS_RED_TAKEN:
;4919:						bs->neutralflagstatus = BotTeam(bs) == TEAM_RED ? 2 : 1; //FIXME: check Team_TakeFlagSound in g_team.c
ADDRLP4 296
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 296
INDIRP4
ARGP4
ADDRLP4 300
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 300
INDIRI4
CNSTI4 1
NEI4 $2843
ADDRLP4 292
CNSTI4 2
ASGNI4
ADDRGP4 $2844
JUMPV
LABELV $2843
ADDRLP4 292
CNSTI4 1
ASGNI4
LABELV $2844
ADDRLP4 296
INDIRP4
CNSTI4 6960
ADDP4
ADDRLP4 292
INDIRI4
ASGNI4
line 4920
;4920:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 1
ASGNI4
line 4921
;4921:						break;
ADDRGP4 $2788
JUMPV
LABELV $2845
line 4923
;4922:					case GTS_BLUE_TAKEN:
;4923:						bs->neutralflagstatus = BotTeam(bs) == TEAM_BLUE ? 2 : 1; //FIXME: check Team_TakeFlagSound in g_team.c
ADDRLP4 308
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 308
INDIRP4
ARGP4
ADDRLP4 312
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 312
INDIRI4
CNSTI4 2
NEI4 $2847
ADDRLP4 304
CNSTI4 2
ASGNI4
ADDRGP4 $2848
JUMPV
LABELV $2847
ADDRLP4 304
CNSTI4 1
ASGNI4
LABELV $2848
ADDRLP4 308
INDIRP4
CNSTI4 6960
ADDP4
ADDRLP4 304
INDIRI4
ASGNI4
line 4924
;4924:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 1
ASGNI4
line 4925
;4925:						break;
line 4927
;4926:				}
;4927:			}
line 4929
;4928:#endif
;4929:			break;
ADDRGP4 $2788
JUMPV
LABELV $2850
line 4932
;4930:		}
;4931:		case EV_PLAYER_TELEPORT_IN:
;4932:		{
line 4933
;4933:			VectorCopy(state->origin, lastteleport_origin);
ADDRGP4 lastteleport_origin
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 4934
;4934:			lastteleport_time = FloatTime();
ADDRGP4 lastteleport_time
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4935
;4935:			break;
ADDRGP4 $2788
JUMPV
LABELV $2851
line 4938
;4936:		}
;4937:		case EV_GENERAL_SOUND:
;4938:		{
line 4940
;4939:			//if this sound is played on the bot
;4940:			if (state->number == bs->client) {
ADDRFP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2788
line 4941
;4941:				if (state->eventParm < 0 || state->eventParm > MAX_SOUNDS) {
ADDRLP4 284
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
LTI4 $2856
ADDRLP4 284
INDIRI4
CNSTI4 256
LEI4 $2854
LABELV $2856
line 4942
;4942:					BotAI_Print(PRT_ERROR, "EV_GENERAL_SOUND: eventParm (%d) out of range\n", state->eventParm);
CNSTI4 3
ARGI4
ADDRGP4 $2857
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 4943
;4943:					break;
ADDRGP4 $2788
JUMPV
LABELV $2854
line 4946
;4944:				}
;4945:				//check out the sound
;4946:				trap_GetConfigstring(CS_SOUNDS + state->eventParm, buf, sizeof(buf));
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 4948
;4947:				//if falling into a death pit
;4948:				if (!strcmp(buf, "*falling1.wav")) {
ADDRLP4 4
ARGP4
ADDRGP4 $2860
ARGP4
ADDRLP4 288
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
NEI4 $2788
line 4950
;4949:					//if the bot has a personal teleporter
;4950:					if (bs->inventory[INVENTORY_TELEPORTER] > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 5072
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2788
line 4952
;4951:						//use the holdable item
;4952:						trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 4953
;4953:					}
line 4954
;4954:				}
line 4955
;4955:			}
line 4956
;4956:			break;
line 4983
;4957:		}
;4958:		case EV_FOOTSTEP:
;4959:		case EV_FOOTSTEP_METAL:
;4960:		case EV_FOOTSPLASH:
;4961:		case EV_FOOTWADE:
;4962:		case EV_SWIM:
;4963:		case EV_FALL_SHORT:
;4964:		case EV_FALL_MEDIUM:
;4965:		case EV_FALL_FAR:
;4966:		case EV_STEP_4:
;4967:		case EV_STEP_8:
;4968:		case EV_STEP_12:
;4969:		case EV_STEP_16:
;4970:		case EV_JUMP_PAD:
;4971:		case EV_JUMP:
;4972:		case EV_TAUNT:
;4973:		case EV_WATER_TOUCH:
;4974:		case EV_WATER_LEAVE:
;4975:		case EV_WATER_UNDER:
;4976:		case EV_WATER_CLEAR:
;4977:		case EV_ITEM_PICKUP:
;4978:		case EV_GLOBAL_ITEM_PICKUP:
;4979:		case EV_NOAMMO:
;4980:		case EV_CHANGE_WEAPON:
;4981:		case EV_FIRE_WEAPON:
;4982:			//FIXME: either add to sound queue or mark player as someone making noise
;4983:			break;
line 4999
;4984:		case EV_USE_ITEM0:
;4985:		case EV_USE_ITEM1:
;4986:		case EV_USE_ITEM2:
;4987:		case EV_USE_ITEM3:
;4988:		case EV_USE_ITEM4:
;4989:		case EV_USE_ITEM5:
;4990:		case EV_USE_ITEM6:
;4991:		case EV_USE_ITEM7:
;4992:		case EV_USE_ITEM8:
;4993:		case EV_USE_ITEM9:
;4994:		case EV_USE_ITEM10:
;4995:		case EV_USE_ITEM11:
;4996:		case EV_USE_ITEM12:
;4997:		case EV_USE_ITEM13:
;4998:		case EV_USE_ITEM14:
;4999:			break;
LABELV $2787
LABELV $2788
line 5001
;5000:	}
;5001:}
LABELV $2780
endproc BotCheckEvents 316 12
export BotCheckSnapshot
proc BotCheckSnapshot 216 16
line 5008
;5002:
;5003:/*
;5004:==================
;5005:BotCheckSnapshot
;5006:==================
;5007:*/
;5008:void BotCheckSnapshot(bot_state_t *bs) {
line 5013
;5009:	int ent;
;5010:	entityState_t state;
;5011:
;5012:	//remove all avoid spots
;5013:	trap_BotAddAvoidSpot(bs->ms, vec3_origin, 0, AVOID_CLEAR);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 vec3_origin
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotAddAvoidSpot
CALLV
pop
line 5015
;5014:	//reset kamikaze body
;5015:	bs->kamikazebody = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6256
ADDP4
CNSTI4 0
ASGNI4
line 5017
;5016:	//reset number of proxmines
;5017:	bs->numproxmines = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6516
ADDP4
CNSTI4 0
ASGNI4
line 5019
;5018:	//
;5019:	ent = 0;
ADDRLP4 208
CNSTI4 0
ASGNI4
ADDRGP4 $2869
JUMPV
LABELV $2868
line 5020
;5020:	while( ( ent = BotAI_GetSnapshotEntity( bs->client, ent, &state ) ) != -1 ) {
line 5022
;5021:		//check the entity state for events
;5022:		BotCheckEvents(bs, &state);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckEvents
CALLV
pop
line 5024
;5023:		//check for grenades the bot should avoid
;5024:		BotCheckForGrenades(bs, &state);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckForGrenades
CALLV
pop
line 5028
;5025:		//
;5026:#ifdef MISSIONPACK
;5027:		//check for proximity mines which the bot should deactivate
;5028:		BotCheckForProxMines(bs, &state);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckForProxMines
CALLV
pop
line 5030
;5029:		//check for dead bodies with the kamikaze effect which should be gibbed
;5030:		BotCheckForKamikazeBody(bs, &state);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckForKamikazeBody
CALLV
pop
line 5032
;5031:#endif
;5032:	}
LABELV $2869
line 5020
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 208
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 212
ADDRGP4 BotAI_GetSnapshotEntity
CALLI4
ASGNI4
ADDRLP4 208
ADDRLP4 212
INDIRI4
ASGNI4
ADDRLP4 212
INDIRI4
CNSTI4 -1
NEI4 $2868
line 5034
;5033:	//check the player state for events
;5034:	BotAI_GetEntityState(bs->client, &state);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotAI_GetEntityState
CALLI4
pop
line 5036
;5035:	//copy the player state events to the entity state
;5036:	state.event = bs->cur_ps.externalEvent;
ADDRLP4 0+180
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 5037
;5037:	state.eventParm = bs->cur_ps.externalEventParm;
ADDRLP4 0+184
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
line 5039
;5038:	//
;5039:	BotCheckEvents(bs, &state);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckEvents
CALLV
pop
line 5040
;5040:}
LABELV $2867
endproc BotCheckSnapshot 216 16
export BotCheckAir
proc BotCheckAir 4 4
line 5047
;5041:
;5042:/*
;5043:==================
;5044:BotCheckAir
;5045:==================
;5046:*/
;5047:void BotCheckAir(bot_state_t *bs) {
line 5048
;5048:	if (bs->inventory[INVENTORY_ENVIRONMENTSUIT] <= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 5096
ADDP4
INDIRI4
CNSTI4 0
GTI4 $2874
line 5049
;5049:		if (trap_AAS_PointContents(bs->eye) & (CONTENTS_WATER|CONTENTS_SLIME|CONTENTS_LAVA)) {
ADDRFP4 0
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 trap_AAS_PointContents
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $2876
line 5050
;5050:			return;
ADDRGP4 $2873
JUMPV
LABELV $2876
line 5052
;5051:		}
;5052:	}
LABELV $2874
line 5053
;5053:	bs->lastair_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6176
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 5054
;5054:}
LABELV $2873
endproc BotCheckAir 4 4
export BotAlternateRoute
proc BotAlternateRoute 16 16
line 5061
;5055:
;5056:/*
;5057:==================
;5058:BotAlternateRoute
;5059:==================
;5060:*/
;5061:bot_goal_t *BotAlternateRoute(bot_state_t *bs, bot_goal_t *goal) {
line 5065
;5062:	int t;
;5063:
;5064:	// if the bot has an alternative route goal
;5065:	if (bs->altroutegoal.areanum) {
ADDRFP4 0
INDIRP4
CNSTI4 6692
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2879
line 5067
;5066:		//
;5067:		if (bs->reachedaltroutegoal_time)
ADDRFP4 0
INDIRP4
CNSTI4 6736
ADDP4
INDIRF4
CNSTF4 0
EQF4 $2881
line 5068
;5068:			return goal;
ADDRFP4 4
INDIRP4
RETP4
ADDRGP4 $2878
JUMPV
LABELV $2881
line 5070
;5069:		// travel time towards alternative route goal
;5070:		t = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, bs->altroutegoal.areanum, bs->tfl);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 6692
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 5071
;5071:		if (t && t < 20) {
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $2883
ADDRLP4 12
INDIRI4
CNSTI4 20
GEI4 $2883
line 5073
;5072:			//BotAI_Print(PRT_MESSAGE, "reached alternate route goal\n");
;5073:			bs->reachedaltroutegoal_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6736
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 5074
;5074:		}
LABELV $2883
line 5075
;5075:		memcpy(goal, &bs->altroutegoal, sizeof(bot_goal_t));
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6680
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 5076
;5076:		return &bs->altroutegoal;
ADDRFP4 0
INDIRP4
CNSTI4 6680
ADDP4
RETP4
ADDRGP4 $2878
JUMPV
LABELV $2879
line 5078
;5077:	}
;5078:	return goal;
ADDRFP4 4
INDIRP4
RETP4
LABELV $2878
endproc BotAlternateRoute 16 16
export BotGetAlternateRouteGoal
proc BotGetAlternateRouteGoal 24 0
line 5086
;5079:}
;5080:
;5081:/*
;5082:==================
;5083:BotGetAlternateRouteGoal
;5084:==================
;5085:*/
;5086:int BotGetAlternateRouteGoal(bot_state_t *bs, int base) {
line 5091
;5087:	aas_altroutegoal_t *altroutegoals;
;5088:	bot_goal_t *goal;
;5089:	int numaltroutegoals, rnd;
;5090:
;5091:	if (base == TEAM_RED) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $2886
line 5092
;5092:		altroutegoals = red_altroutegoals;
ADDRLP4 12
ADDRGP4 red_altroutegoals
ASGNP4
line 5093
;5093:		numaltroutegoals = red_numaltroutegoals;
ADDRLP4 4
ADDRGP4 red_numaltroutegoals
INDIRI4
ASGNI4
line 5094
;5094:	}
ADDRGP4 $2887
JUMPV
LABELV $2886
line 5095
;5095:	else {
line 5096
;5096:		altroutegoals = blue_altroutegoals;
ADDRLP4 12
ADDRGP4 blue_altroutegoals
ASGNP4
line 5097
;5097:		numaltroutegoals = blue_numaltroutegoals;
ADDRLP4 4
ADDRGP4 blue_numaltroutegoals
INDIRI4
ASGNI4
line 5098
;5098:	}
LABELV $2887
line 5099
;5099:	if (!numaltroutegoals)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2888
line 5100
;5100:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2885
JUMPV
LABELV $2888
line 5101
;5101:	rnd = (float) random() * numaltroutegoals;
ADDRLP4 16
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 5102
;5102:	if (rnd >= numaltroutegoals)
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $2890
line 5103
;5103:		rnd = numaltroutegoals-1;
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $2890
line 5104
;5104:	goal = &bs->altroutegoal;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 6680
ADDP4
ASGNP4
line 5105
;5105:	goal->areanum = altroutegoals[rnd].areanum;
ADDRLP4 20
CNSTI4 12
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
CNSTI4 24
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 12
INDIRP4
ADDP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 5106
;5106:	VectorCopy(altroutegoals[rnd].origin, goal->origin);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 12
INDIRP4
ADDP4
INDIRB
ASGNB 12
line 5107
;5107:	VectorSet(goal->mins, -8, -8, -8);
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
CNSTF4 3238002688
ASGNF4
line 5108
;5108:	VectorSet(goal->maxs, 8, 8, 8);
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1090519040
ASGNF4
line 5109
;5109:	goal->entitynum = 0;
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTI4 0
ASGNI4
line 5110
;5110:	goal->iteminfo = 0;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 5111
;5111:	goal->number = 0;
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 5112
;5112:	goal->flags = 0;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 5114
;5113:	//
;5114:	bs->reachedaltroutegoal_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6736
ADDP4
CNSTF4 0
ASGNF4
line 5115
;5115:	return qtrue;
CNSTI4 1
RETI4
LABELV $2885
endproc BotGetAlternateRouteGoal 24 0
export BotSetupAlternativeRouteGoals
proc BotSetupAlternativeRouteGoals 12 32
line 5123
;5116:}
;5117:
;5118:/*
;5119:==================
;5120:BotSetupAlternateRouteGoals
;5121:==================
;5122:*/
;5123:void BotSetupAlternativeRouteGoals(void) {
line 5125
;5124:
;5125:	if (altroutegoals_setup)
ADDRGP4 altroutegoals_setup
INDIRI4
CNSTI4 0
EQI4 $2893
line 5126
;5126:		return;
ADDRGP4 $2892
JUMPV
LABELV $2893
line 5128
;5127:#ifdef MISSIONPACK
;5128:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $2895
line 5129
;5129:		if (trap_BotGetLevelItemGoal(-1, "Neutral Flag", &ctf_neutralflag) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $2899
ARGP4
ADDRGP4 ctf_neutralflag
ARGP4
ADDRLP4 0
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $2897
line 5130
;5130:			BotAI_Print(PRT_WARNING, "no alt routes without Neutral Flag\n");
CNSTI4 2
ARGI4
ADDRGP4 $2900
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $2897
line 5131
;5131:		if (ctf_neutralflag.areanum) {
ADDRGP4 ctf_neutralflag+12
INDIRI4
CNSTI4 0
EQI4 $2896
line 5133
;5132:			//
;5133:			red_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
ADDRGP4 ctf_neutralflag
ARGP4
ADDRGP4 ctf_neutralflag+12
INDIRI4
ARGI4
ADDRGP4 ctf_redflag
ARGP4
ADDRGP4 ctf_redflag+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRGP4 red_altroutegoals
ARGP4
CNSTI4 32
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 4
ADDRGP4 trap_AAS_AlternativeRouteGoals
CALLI4
ASGNI4
ADDRGP4 red_numaltroutegoals
ADDRLP4 4
INDIRI4
ASGNI4
line 5139
;5134:										ctf_neutralflag.origin, ctf_neutralflag.areanum,
;5135:										ctf_redflag.origin, ctf_redflag.areanum, TFL_DEFAULT,
;5136:										red_altroutegoals, MAX_ALTROUTEGOALS,
;5137:										ALTROUTEGOAL_CLUSTERPORTALS|
;5138:										ALTROUTEGOAL_VIEWPORTALS);
;5139:			blue_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
ADDRGP4 ctf_neutralflag
ARGP4
ADDRGP4 ctf_neutralflag+12
INDIRI4
ARGI4
ADDRGP4 ctf_blueflag
ARGP4
ADDRGP4 ctf_blueflag+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRGP4 blue_altroutegoals
ARGP4
CNSTI4 32
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 8
ADDRGP4 trap_AAS_AlternativeRouteGoals
CALLI4
ASGNI4
ADDRGP4 blue_numaltroutegoals
ADDRLP4 8
INDIRI4
ASGNI4
line 5145
;5140:										ctf_neutralflag.origin, ctf_neutralflag.areanum,
;5141:										ctf_blueflag.origin, ctf_blueflag.areanum, TFL_DEFAULT,
;5142:										blue_altroutegoals, MAX_ALTROUTEGOALS,
;5143:										ALTROUTEGOAL_CLUSTERPORTALS|
;5144:										ALTROUTEGOAL_VIEWPORTALS);
;5145:		}
line 5146
;5146:	}
ADDRGP4 $2896
JUMPV
LABELV $2895
line 5147
;5147:	else if (gametype == GT_1FCTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 5
NEI4 $2908
line 5149
;5148:		//
;5149:		red_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
ADDRGP4 ctf_neutralflag
ARGP4
ADDRGP4 ctf_neutralflag+12
INDIRI4
ARGI4
ADDRGP4 ctf_redflag
ARGP4
ADDRGP4 ctf_redflag+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRGP4 red_altroutegoals
ARGP4
CNSTI4 32
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 0
ADDRGP4 trap_AAS_AlternativeRouteGoals
CALLI4
ASGNI4
ADDRGP4 red_numaltroutegoals
ADDRLP4 0
INDIRI4
ASGNI4
line 5155
;5150:									ctf_neutralflag.origin, ctf_neutralflag.areanum,
;5151:									ctf_redflag.origin, ctf_redflag.areanum, TFL_DEFAULT,
;5152:									red_altroutegoals, MAX_ALTROUTEGOALS,
;5153:									ALTROUTEGOAL_CLUSTERPORTALS|
;5154:									ALTROUTEGOAL_VIEWPORTALS);
;5155:		blue_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
ADDRGP4 ctf_neutralflag
ARGP4
ADDRGP4 ctf_neutralflag+12
INDIRI4
ARGI4
ADDRGP4 ctf_blueflag
ARGP4
ADDRGP4 ctf_blueflag+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRGP4 blue_altroutegoals
ARGP4
CNSTI4 32
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 4
ADDRGP4 trap_AAS_AlternativeRouteGoals
CALLI4
ASGNI4
ADDRGP4 blue_numaltroutegoals
ADDRLP4 4
INDIRI4
ASGNI4
line 5161
;5156:									ctf_neutralflag.origin, ctf_neutralflag.areanum,
;5157:									ctf_blueflag.origin, ctf_blueflag.areanum, TFL_DEFAULT,
;5158:									blue_altroutegoals, MAX_ALTROUTEGOALS,
;5159:									ALTROUTEGOAL_CLUSTERPORTALS|
;5160:									ALTROUTEGOAL_VIEWPORTALS);
;5161:	}
ADDRGP4 $2909
JUMPV
LABELV $2908
line 5162
;5162:	else if (gametype == GT_OBELISK) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $2914
line 5163
;5163:		if (trap_BotGetLevelItemGoal(-1, "Neutral Obelisk", &neutralobelisk) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $2918
ARGP4
ADDRGP4 neutralobelisk
ARGP4
ADDRLP4 0
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $2916
line 5164
;5164:			BotAI_Print(PRT_WARNING, "Harvester without neutral obelisk\n");
CNSTI4 2
ARGI4
ADDRGP4 $2919
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $2916
line 5166
;5165:		//
;5166:		red_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
ADDRGP4 neutralobelisk
ARGP4
ADDRGP4 neutralobelisk+12
INDIRI4
ARGI4
ADDRGP4 redobelisk
ARGP4
ADDRGP4 redobelisk+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRGP4 red_altroutegoals
ARGP4
CNSTI4 32
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 4
ADDRGP4 trap_AAS_AlternativeRouteGoals
CALLI4
ASGNI4
ADDRGP4 red_numaltroutegoals
ADDRLP4 4
INDIRI4
ASGNI4
line 5172
;5167:									neutralobelisk.origin, neutralobelisk.areanum,
;5168:									redobelisk.origin, redobelisk.areanum, TFL_DEFAULT,
;5169:									red_altroutegoals, MAX_ALTROUTEGOALS,
;5170:									ALTROUTEGOAL_CLUSTERPORTALS|
;5171:									ALTROUTEGOAL_VIEWPORTALS);
;5172:		blue_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
ADDRGP4 neutralobelisk
ARGP4
ADDRGP4 neutralobelisk+12
INDIRI4
ARGI4
ADDRGP4 blueobelisk
ARGP4
ADDRGP4 blueobelisk+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRGP4 blue_altroutegoals
ARGP4
CNSTI4 32
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 8
ADDRGP4 trap_AAS_AlternativeRouteGoals
CALLI4
ASGNI4
ADDRGP4 blue_numaltroutegoals
ADDRLP4 8
INDIRI4
ASGNI4
line 5178
;5173:									neutralobelisk.origin, neutralobelisk.areanum,
;5174:									blueobelisk.origin, blueobelisk.areanum, TFL_DEFAULT,
;5175:									blue_altroutegoals, MAX_ALTROUTEGOALS,
;5176:									ALTROUTEGOAL_CLUSTERPORTALS|
;5177:									ALTROUTEGOAL_VIEWPORTALS);
;5178:	}
ADDRGP4 $2915
JUMPV
LABELV $2914
line 5179
;5179:	else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $2924
line 5181
;5180:		//
;5181:		red_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
ADDRGP4 neutralobelisk
ARGP4
ADDRGP4 neutralobelisk+12
INDIRI4
ARGI4
ADDRGP4 redobelisk
ARGP4
ADDRGP4 redobelisk+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRGP4 red_altroutegoals
ARGP4
CNSTI4 32
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 0
ADDRGP4 trap_AAS_AlternativeRouteGoals
CALLI4
ASGNI4
ADDRGP4 red_numaltroutegoals
ADDRLP4 0
INDIRI4
ASGNI4
line 5187
;5182:									neutralobelisk.origin, neutralobelisk.areanum,
;5183:									redobelisk.origin, redobelisk.areanum, TFL_DEFAULT,
;5184:									red_altroutegoals, MAX_ALTROUTEGOALS,
;5185:									ALTROUTEGOAL_CLUSTERPORTALS|
;5186:									ALTROUTEGOAL_VIEWPORTALS);
;5187:		blue_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
ADDRGP4 neutralobelisk
ARGP4
ADDRGP4 neutralobelisk+12
INDIRI4
ARGI4
ADDRGP4 blueobelisk
ARGP4
ADDRGP4 blueobelisk+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRGP4 blue_altroutegoals
ARGP4
CNSTI4 32
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 4
ADDRGP4 trap_AAS_AlternativeRouteGoals
CALLI4
ASGNI4
ADDRGP4 blue_numaltroutegoals
ADDRLP4 4
INDIRI4
ASGNI4
line 5193
;5188:									neutralobelisk.origin, neutralobelisk.areanum,
;5189:									blueobelisk.origin, blueobelisk.areanum, TFL_DEFAULT,
;5190:									blue_altroutegoals, MAX_ALTROUTEGOALS,
;5191:									ALTROUTEGOAL_CLUSTERPORTALS|
;5192:									ALTROUTEGOAL_VIEWPORTALS);
;5193:	}
LABELV $2924
LABELV $2915
LABELV $2909
LABELV $2896
line 5195
;5194:#endif
;5195:	altroutegoals_setup = qtrue;
ADDRGP4 altroutegoals_setup
CNSTI4 1
ASGNI4
line 5196
;5196:}
LABELV $2892
endproc BotSetupAlternativeRouteGoals 12 32
export BotDeathmatchAI
proc BotDeathmatchAI 1492 20
line 5203
;5197:
;5198:/*
;5199:==================
;5200:BotDeathmatchAI
;5201:==================
;5202:*/
;5203:void BotDeathmatchAI(bot_state_t *bs, float thinktime) {
line 5209
;5204:	char gender[144], name[144], buf[144];
;5205:	char userinfo[MAX_INFO_STRING];
;5206:	int i;
;5207:
;5208:	//if the bot has just been setup
;5209:	if (bs->setupcount > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6016
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2931
line 5210
;5210:		bs->setupcount--;
ADDRLP4 1460
ADDRFP4 0
INDIRP4
CNSTI4 6016
ADDP4
ASGNP4
ADDRLP4 1460
INDIRP4
ADDRLP4 1460
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 5211
;5211:		if (bs->setupcount > 0) return;
ADDRFP4 0
INDIRP4
CNSTI4 6016
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2933
ADDRGP4 $2930
JUMPV
LABELV $2933
line 5213
;5212:		//get the gender characteristic
;5213:		trap_Characteristic_String(bs->character, CHARACTERISTIC_GENDER, gender, sizeof(gender));
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 148
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Characteristic_String
CALLV
pop
line 5215
;5214:		//set the bot gender
;5215:		trap_GetUserinfo(bs->client, userinfo, sizeof(userinfo));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 5216
;5216:		Info_SetValueForKey(userinfo, "sex", gender);
ADDRLP4 292
ARGP4
ADDRGP4 $2935
ARGP4
ADDRLP4 148
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 5217
;5217:		trap_SetUserinfo(bs->client, userinfo);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 5219
;5218:		//set the team
;5219:		if ( !bs->map_restart && g_gametype.integer != GT_TOURNAMENT ) {
ADDRFP4 0
INDIRP4
CNSTI4 6020
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2936
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
EQI4 $2936
line 5220
;5220:			Com_sprintf(buf, sizeof(buf), "team %s", bs->settings.team);
ADDRLP4 1316
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 $2939
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4756
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 5221
;5221:			trap_EA_Command(bs->client, buf);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 1316
ARGP4
ADDRGP4 trap_EA_Command
CALLV
pop
line 5222
;5222:		}
LABELV $2936
line 5224
;5223:		//set the chat gender
;5224:		if (gender[0] == 'm') trap_BotSetChatGender(bs->cs, CHAT_GENDERMALE);
ADDRLP4 148
INDIRI1
CVII4 1
CNSTI4 109
NEI4 $2940
ADDRFP4 0
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
ADDRGP4 $2941
JUMPV
LABELV $2940
line 5225
;5225:		else if (gender[0] == 'f')  trap_BotSetChatGender(bs->cs, CHAT_GENDERFEMALE);
ADDRLP4 148
INDIRI1
CVII4 1
CNSTI4 102
NEI4 $2942
ADDRFP4 0
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
ADDRGP4 $2943
JUMPV
LABELV $2942
line 5226
;5226:		else  trap_BotSetChatGender(bs->cs, CHAT_GENDERLESS);
ADDRFP4 0
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
LABELV $2943
LABELV $2941
line 5228
;5227:		//set the chat name
;5228:		ClientName(bs->client, name, sizeof(name));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 5229
;5229:		trap_BotSetChatName(bs->cs, name, bs->client);
ADDRLP4 1464
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1464
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 1464
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotSetChatName
CALLV
pop
line 5231
;5230:		//
;5231:		bs->lastframe_health = bs->inventory[INVENTORY_HEALTH];
ADDRLP4 1468
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1468
INDIRP4
CNSTI4 6044
ADDP4
ADDRLP4 1468
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
ASGNI4
line 5232
;5232:		bs->lasthitcount = bs->cur_ps.persistant[PERS_HITS];
ADDRLP4 1472
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1472
INDIRP4
CNSTI4 6048
ADDP4
ADDRLP4 1472
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
ASGNI4
line 5234
;5233:		//
;5234:		bs->setupcount = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6016
ADDP4
CNSTI4 0
ASGNI4
line 5236
;5235:		//
;5236:		BotSetupAlternativeRouteGoals();
ADDRGP4 BotSetupAlternativeRouteGoals
CALLV
pop
line 5237
;5237:	}
LABELV $2931
line 5239
;5238:	//no ideal view set
;5239:	bs->flags &= ~BFL_IDEALVIEWSET;
ADDRLP4 1460
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
ASGNP4
ADDRLP4 1460
INDIRP4
ADDRLP4 1460
INDIRP4
INDIRI4
CNSTI4 -33
BANDI4
ASGNI4
line 5241
;5240:	//
;5241:	if (!BotIntermission(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1464
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 1464
INDIRI4
CNSTI4 0
NEI4 $2944
line 5243
;5242:		//set the teleport time
;5243:		BotSetTeleportTime(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeleportTime
CALLV
pop
line 5245
;5244:		//update some inventory values
;5245:		BotUpdateInventory(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotUpdateInventory
CALLV
pop
line 5247
;5246:		//check out the snapshot
;5247:		BotCheckSnapshot(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckSnapshot
CALLV
pop
line 5249
;5248:		//check for air
;5249:		BotCheckAir(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckAir
CALLV
pop
line 5250
;5250:	}
LABELV $2944
line 5252
;5251:	//check the console messages
;5252:	BotCheckConsoleMessages(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckConsoleMessages
CALLV
pop
line 5254
;5253:	//if not in the intermission and not in observer mode
;5254:	if (!BotIntermission(bs) && !BotIsObserver(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1468
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 1468
INDIRI4
CNSTI4 0
NEI4 $2946
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1472
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 1472
INDIRI4
CNSTI4 0
NEI4 $2946
line 5256
;5255:		//do team AI
;5256:		BotTeamAI(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotTeamAI
CALLV
pop
line 5257
;5257:	}
LABELV $2946
line 5259
;5258:	//if the bot has no ai node
;5259:	if (!bs->ainode) {
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2948
line 5260
;5260:		AIEnter_Seek_LTG(bs, "BotDeathmatchAI: no ai node");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2950
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 5261
;5261:	}
LABELV $2948
line 5263
;5262:	//if the bot entered the game less than 8 seconds ago
;5263:	if (!bs->entergamechat && bs->entergame_time > FloatTime() - 8) {
ADDRLP4 1476
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1476
INDIRP4
CNSTI4 6024
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2951
ADDRLP4 1476
INDIRP4
CNSTI4 6064
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1090519040
SUBF4
LEF4 $2951
line 5264
;5264:		if (BotChat_EnterGame(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1480
ADDRGP4 BotChat_EnterGame
CALLI4
ASGNI4
ADDRLP4 1480
INDIRI4
CNSTI4 0
EQI4 $2953
line 5265
;5265:			bs->stand_time = FloatTime() + BotChatTime(bs);
ADDRLP4 1484
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1484
INDIRP4
ARGP4
ADDRLP4 1488
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 1484
INDIRP4
CNSTI4 6096
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 1488
INDIRF4
ADDF4
ASGNF4
line 5266
;5266:			AIEnter_Stand(bs, "BotDeathmatchAI: chat enter game");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2955
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 5267
;5267:		}
LABELV $2953
line 5268
;5268:		bs->entergamechat = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6024
ADDP4
CNSTI4 1
ASGNI4
line 5269
;5269:	}
LABELV $2951
line 5271
;5270:	//reset the node switches from the previous frame
;5271:	BotResetNodeSwitches();
ADDRGP4 BotResetNodeSwitches
CALLV
pop
line 5273
;5272:	//execute AI nodes
;5273:	for (i = 0; i < MAX_NODESWITCHES; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2956
line 5274
;5274:		if (bs->ainode(bs)) break;
ADDRLP4 1480
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1480
INDIRP4
ARGP4
ADDRLP4 1484
ADDRLP4 1480
INDIRP4
CNSTI4 4900
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 1484
INDIRI4
CNSTI4 0
EQI4 $2960
ADDRGP4 $2958
JUMPV
LABELV $2960
line 5275
;5275:	}
LABELV $2957
line 5273
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 50
LTI4 $2956
LABELV $2958
line 5277
;5276:	//if the bot removed itself :)
;5277:	if (!bs->inuse) return;
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $2962
ADDRGP4 $2930
JUMPV
LABELV $2962
line 5279
;5278:	//if the bot executed too many AI nodes
;5279:	if (i >= MAX_NODESWITCHES) {
ADDRLP4 0
INDIRI4
CNSTI4 50
LTI4 $2964
line 5280
;5280:		trap_BotDumpGoalStack(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotDumpGoalStack
CALLV
pop
line 5281
;5281:		trap_BotDumpAvoidGoals(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotDumpAvoidGoals
CALLV
pop
line 5282
;5282:		BotDumpNodeSwitches(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotDumpNodeSwitches
CALLV
pop
line 5283
;5283:		ClientName(bs->client, name, sizeof(name));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 5284
;5284:		BotAI_Print(PRT_ERROR, "%s at %1.1f switched more than %d AI nodes\n", name, FloatTime(), MAX_NODESWITCHES);
CNSTI4 3
ARGI4
ADDRGP4 $2966
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 floattime
INDIRF4
ARGF4
CNSTI4 50
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 5285
;5285:	}
LABELV $2964
line 5287
;5286:	//
;5287:	bs->lastframe_health = bs->inventory[INVENTORY_HEALTH];
ADDRLP4 1480
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1480
INDIRP4
CNSTI4 6044
ADDP4
ADDRLP4 1480
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
ASGNI4
line 5288
;5288:	bs->lasthitcount = bs->cur_ps.persistant[PERS_HITS];
ADDRLP4 1484
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1484
INDIRP4
CNSTI4 6048
ADDP4
ADDRLP4 1484
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
ASGNI4
line 5289
;5289:}
LABELV $2930
endproc BotDeathmatchAI 1492 20
export BotSetEntityNumForGoalWithModel
proc BotSetEntityNumForGoalWithModel 44 4
line 5296
;5290:
;5291:/*
;5292:==================
;5293:BotSetEntityNumForGoalWithModel
;5294:==================
;5295:*/
;5296:void BotSetEntityNumForGoalWithModel(bot_goal_t *goal, int eType, char *modelname) {
line 5301
;5297:	gentity_t *ent;
;5298:	int i, modelindex;
;5299:	vec3_t dir;
;5300:
;5301:	modelindex = G_ModelIndex( modelname );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 24
INDIRI4
ASGNI4
line 5302
;5302:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 5303
;5303:	for (i = 0; i < level.num_entities; i++, ent++) {
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $2971
JUMPV
LABELV $2968
line 5304
;5304:		if ( !ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2973
line 5305
;5305:			continue;
ADDRGP4 $2969
JUMPV
LABELV $2973
line 5307
;5306:		}
;5307:		if ( eType && ent->s.eType != eType) {
ADDRLP4 28
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $2975
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $2975
line 5308
;5308:			continue;
ADDRGP4 $2969
JUMPV
LABELV $2975
line 5310
;5309:		}
;5310:		if (ent->s.modelindex != modelindex) {
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $2977
line 5311
;5311:			continue;
ADDRGP4 $2969
JUMPV
LABELV $2977
line 5313
;5312:		}
;5313:		VectorSubtract(goal->origin, ent->s.origin, dir);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 5314
;5314:		if (VectorLengthSquared(dir) < Square(10)) {
ADDRLP4 4
ARGP4
ADDRLP4 40
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 40
INDIRF4
CNSTF4 1120403456
GEF4 $2981
line 5315
;5315:			goal->entitynum = i;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 5316
;5316:			return;
ADDRGP4 $2967
JUMPV
LABELV $2981
line 5318
;5317:		}
;5318:	}
LABELV $2969
line 5303
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 868
ADDP4
ASGNP4
LABELV $2971
ADDRLP4 16
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $2968
line 5319
;5319:}
LABELV $2967
endproc BotSetEntityNumForGoalWithModel 44 4
export BotSetEntityNumForGoal
proc BotSetEntityNumForGoal 36 8
line 5326
;5320:
;5321:/*
;5322:==================
;5323:BotSetEntityNumForGoal
;5324:==================
;5325:*/
;5326:void BotSetEntityNumForGoal(bot_goal_t *goal, char *classname) {
line 5331
;5327:	gentity_t *ent;
;5328:	int i;
;5329:	vec3_t dir;
;5330:
;5331:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 5332
;5332:	for (i = 0; i < level.num_entities; i++, ent++) {
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $2987
JUMPV
LABELV $2984
line 5333
;5333:		if ( !ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2989
line 5334
;5334:			continue;
ADDRGP4 $2985
JUMPV
LABELV $2989
line 5336
;5335:		}
;5336:		if ( !Q_stricmp(ent->classname, classname) ) {
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $2991
line 5337
;5337:			continue;
ADDRGP4 $2985
JUMPV
LABELV $2991
line 5339
;5338:		}
;5339:		VectorSubtract(goal->origin, ent->s.origin, dir);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 5340
;5340:		if (VectorLengthSquared(dir) < Square(10)) {
ADDRLP4 4
ARGP4
ADDRLP4 32
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 32
INDIRF4
CNSTF4 1120403456
GEF4 $2995
line 5341
;5341:			goal->entitynum = i;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 5342
;5342:			return;
ADDRGP4 $2983
JUMPV
LABELV $2995
line 5344
;5343:		}
;5344:	}
LABELV $2985
line 5332
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 868
ADDP4
ASGNP4
LABELV $2987
ADDRLP4 16
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $2984
line 5345
;5345:}
LABELV $2983
endproc BotSetEntityNumForGoal 36 8
export BotGoalForBSPEntity
proc BotGoalForBSPEntity 1128 20
line 5352
;5346:
;5347:/*
;5348:==================
;5349:BotGoalForBSPEntity
;5350:==================
;5351:*/
;5352:int BotGoalForBSPEntity( char *classname, bot_goal_t *goal ) {
line 5357
;5353:	char value[MAX_INFO_STRING];
;5354:	vec3_t origin, start, end;
;5355:	int ent, numareas, areas[10];
;5356:
;5357:	memset(goal, 0, sizeof(bot_goal_t));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 memset
CALLP4
pop
line 5358
;5358:	for (ent = trap_AAS_NextBSPEntity(0); ent; ent = trap_AAS_NextBSPEntity(ent)) {
CNSTI4 0
ARGI4
ADDRLP4 1108
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1108
INDIRI4
ASGNI4
ADDRGP4 $3001
JUMPV
LABELV $2998
line 5359
;5359:		if (!trap_AAS_ValueForBSPEpairKey(ent, "classname", value, sizeof(value)))
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $2483
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1112
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $3002
line 5360
;5360:			continue;
ADDRGP4 $2999
JUMPV
LABELV $3002
line 5361
;5361:		if (!strcmp(value, classname)) {
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1116
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $3004
line 5362
;5362:			if (!trap_AAS_VectorForBSPEpairKey(ent, "origin", origin))
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $2499
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 1120
ADDRGP4 trap_AAS_VectorForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $3006
line 5363
;5363:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2997
JUMPV
LABELV $3006
line 5364
;5364:			VectorCopy(origin, goal->origin);
ADDRFP4 4
INDIRP4
ADDRLP4 1028
INDIRB
ASGNB 12
line 5365
;5365:			VectorCopy(origin, start);
ADDRLP4 1040
ADDRLP4 1028
INDIRB
ASGNB 12
line 5366
;5366:			start[2] -= 32;
ADDRLP4 1040+8
ADDRLP4 1040+8
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 5367
;5367:			VectorCopy(origin, end);
ADDRLP4 1052
ADDRLP4 1028
INDIRB
ASGNB 12
line 5368
;5368:			end[2] += 32;
ADDRLP4 1052+8
ADDRLP4 1052+8
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 5369
;5369:			numareas = trap_AAS_TraceAreas(start, end, areas, NULL, 10);
ADDRLP4 1040
ARGP4
ADDRLP4 1052
ARGP4
ADDRLP4 1068
ARGP4
CNSTP4 0
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 1124
ADDRGP4 trap_AAS_TraceAreas
CALLI4
ASGNI4
ADDRLP4 1064
ADDRLP4 1124
INDIRI4
ASGNI4
line 5370
;5370:			if (!numareas)
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $3010
line 5371
;5371:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2997
JUMPV
LABELV $3010
line 5372
;5372:			goal->areanum = areas[0];
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 1068
INDIRI4
ASGNI4
line 5373
;5373:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2997
JUMPV
LABELV $3004
line 5375
;5374:		}
;5375:	}
LABELV $2999
line 5358
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1112
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1112
INDIRI4
ASGNI4
LABELV $3001
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2998
line 5376
;5376:	return qfalse;
CNSTI4 0
RETI4
LABELV $2997
endproc BotGoalForBSPEntity 1128 20
export BotSetupDeathmatchAI
proc BotSetupDeathmatchAI 156 16
line 5384
;5377:}
;5378:
;5379:/*
;5380:==================
;5381:BotSetupDeathmatchAI
;5382:==================
;5383:*/
;5384:void BotSetupDeathmatchAI(void) {
line 5388
;5385:	int ent, modelnum;
;5386:	char model[128];
;5387:
;5388:	gametype = trap_Cvar_VariableIntegerValue("g_gametype");
ADDRGP4 $3013
ARGP4
ADDRLP4 136
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 gametype
ADDRLP4 136
INDIRI4
ASGNI4
line 5389
;5389:	maxclients = trap_Cvar_VariableIntegerValue("sv_maxclients");
ADDRGP4 $533
ARGP4
ADDRLP4 140
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 maxclients
ADDRLP4 140
INDIRI4
ASGNI4
line 5391
;5390:
;5391:	trap_Cvar_Register(&bot_rocketjump, "bot_rocketjump", "1", 0);
ADDRGP4 bot_rocketjump
ARGP4
ADDRGP4 $3014
ARGP4
ADDRGP4 $2746
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5392
;5392:	trap_Cvar_Register(&bot_grapple, "bot_grapple", "0", 0);
ADDRGP4 bot_grapple
ARGP4
ADDRGP4 $3015
ARGP4
ADDRGP4 $3016
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5393
;5393:	trap_Cvar_Register(&bot_fastchat, "bot_fastchat", "0", 0);
ADDRGP4 bot_fastchat
ARGP4
ADDRGP4 $3017
ARGP4
ADDRGP4 $3016
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5394
;5394:	trap_Cvar_Register(&bot_nochat, "bot_nochat", "0", 0);
ADDRGP4 bot_nochat
ARGP4
ADDRGP4 $3018
ARGP4
ADDRGP4 $3016
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5395
;5395:	trap_Cvar_Register(&bot_testrchat, "bot_testrchat", "0", 0);
ADDRGP4 bot_testrchat
ARGP4
ADDRGP4 $2745
ARGP4
ADDRGP4 $3016
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5396
;5396:	trap_Cvar_Register(&bot_challenge, "bot_challenge", "0", 0);
ADDRGP4 bot_challenge
ARGP4
ADDRGP4 $3019
ARGP4
ADDRGP4 $3016
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5397
;5397:	trap_Cvar_Register(&bot_predictobstacles, "bot_predictobstacles", "1", 0);
ADDRGP4 bot_predictobstacles
ARGP4
ADDRGP4 $3020
ARGP4
ADDRGP4 $2746
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5398
;5398:	trap_Cvar_Register(&g_spSkill, "g_spSkill", "2", 0);
ADDRGP4 g_spSkill
ARGP4
ADDRGP4 $3021
ARGP4
ADDRGP4 $3022
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5400
;5399:	//
;5400:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $3023
line 5401
;5401:		if (trap_BotGetLevelItemGoal(-1, "Red Flag", &ctf_redflag) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $3027
ARGP4
ADDRGP4 ctf_redflag
ARGP4
ADDRLP4 144
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
GEI4 $3025
line 5402
;5402:			BotAI_Print(PRT_WARNING, "CTF without Red Flag\n");
CNSTI4 2
ARGI4
ADDRGP4 $3028
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $3025
line 5403
;5403:		if (trap_BotGetLevelItemGoal(-1, "Blue Flag", &ctf_blueflag) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $3031
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
ADDRLP4 148
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
GEI4 $3024
line 5404
;5404:			BotAI_Print(PRT_WARNING, "CTF without Blue Flag\n");
CNSTI4 2
ARGI4
ADDRGP4 $3032
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 5405
;5405:	}
ADDRGP4 $3024
JUMPV
LABELV $3023
line 5407
;5406:#ifdef MISSIONPACK
;5407:	else if (gametype == GT_1FCTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 5
NEI4 $3033
line 5408
;5408:		if (trap_BotGetLevelItemGoal(-1, "Neutral Flag", &ctf_neutralflag) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $2899
ARGP4
ADDRGP4 ctf_neutralflag
ARGP4
ADDRLP4 144
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
GEI4 $3035
line 5409
;5409:			BotAI_Print(PRT_WARNING, "One Flag CTF without Neutral Flag\n");
CNSTI4 2
ARGI4
ADDRGP4 $3037
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $3035
line 5410
;5410:		if (trap_BotGetLevelItemGoal(-1, "Red Flag", &ctf_redflag) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $3027
ARGP4
ADDRGP4 ctf_redflag
ARGP4
ADDRLP4 148
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
GEI4 $3038
line 5411
;5411:			BotAI_Print(PRT_WARNING, "CTF without Red Flag\n");
CNSTI4 2
ARGI4
ADDRGP4 $3028
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $3038
line 5412
;5412:		if (trap_BotGetLevelItemGoal(-1, "Blue Flag", &ctf_blueflag) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $3031
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
ADDRLP4 152
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
GEI4 $3034
line 5413
;5413:			BotAI_Print(PRT_WARNING, "CTF without Blue Flag\n");
CNSTI4 2
ARGI4
ADDRGP4 $3032
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 5414
;5414:	}
ADDRGP4 $3034
JUMPV
LABELV $3033
line 5415
;5415:	else if (gametype == GT_OBELISK) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $3042
line 5416
;5416:		if (trap_BotGetLevelItemGoal(-1, "Red Obelisk", &redobelisk) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $3046
ARGP4
ADDRGP4 redobelisk
ARGP4
ADDRLP4 144
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
GEI4 $3044
line 5417
;5417:			BotAI_Print(PRT_WARNING, "Obelisk without red obelisk\n");
CNSTI4 2
ARGI4
ADDRGP4 $3047
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $3044
line 5418
;5418:		BotSetEntityNumForGoal(&redobelisk, "team_redobelisk");
ADDRGP4 redobelisk
ARGP4
ADDRGP4 $3048
ARGP4
ADDRGP4 BotSetEntityNumForGoal
CALLV
pop
line 5419
;5419:		if (trap_BotGetLevelItemGoal(-1, "Blue Obelisk", &blueobelisk) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $3051
ARGP4
ADDRGP4 blueobelisk
ARGP4
ADDRLP4 148
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
GEI4 $3049
line 5420
;5420:			BotAI_Print(PRT_WARNING, "Obelisk without blue obelisk\n");
CNSTI4 2
ARGI4
ADDRGP4 $3052
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $3049
line 5421
;5421:		BotSetEntityNumForGoal(&blueobelisk, "team_blueobelisk");
ADDRGP4 blueobelisk
ARGP4
ADDRGP4 $3053
ARGP4
ADDRGP4 BotSetEntityNumForGoal
CALLV
pop
line 5422
;5422:	}
ADDRGP4 $3043
JUMPV
LABELV $3042
line 5423
;5423:	else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $3054
line 5424
;5424:		if (trap_BotGetLevelItemGoal(-1, "Red Obelisk", &redobelisk) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $3046
ARGP4
ADDRGP4 redobelisk
ARGP4
ADDRLP4 144
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
GEI4 $3056
line 5425
;5425:			BotAI_Print(PRT_WARNING, "Harvester without red obelisk\n");
CNSTI4 2
ARGI4
ADDRGP4 $3058
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $3056
line 5426
;5426:		BotSetEntityNumForGoal(&redobelisk, "team_redobelisk");
ADDRGP4 redobelisk
ARGP4
ADDRGP4 $3048
ARGP4
ADDRGP4 BotSetEntityNumForGoal
CALLV
pop
line 5427
;5427:		if (trap_BotGetLevelItemGoal(-1, "Blue Obelisk", &blueobelisk) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $3051
ARGP4
ADDRGP4 blueobelisk
ARGP4
ADDRLP4 148
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
GEI4 $3059
line 5428
;5428:			BotAI_Print(PRT_WARNING, "Harvester without blue obelisk\n");
CNSTI4 2
ARGI4
ADDRGP4 $3061
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $3059
line 5429
;5429:		BotSetEntityNumForGoal(&blueobelisk, "team_blueobelisk");
ADDRGP4 blueobelisk
ARGP4
ADDRGP4 $3053
ARGP4
ADDRGP4 BotSetEntityNumForGoal
CALLV
pop
line 5430
;5430:		if (trap_BotGetLevelItemGoal(-1, "Neutral Obelisk", &neutralobelisk) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $2918
ARGP4
ADDRGP4 neutralobelisk
ARGP4
ADDRLP4 152
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
GEI4 $3062
line 5431
;5431:			BotAI_Print(PRT_WARNING, "Harvester without neutral obelisk\n");
CNSTI4 2
ARGI4
ADDRGP4 $2919
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $3062
line 5432
;5432:		BotSetEntityNumForGoal(&neutralobelisk, "team_neutralobelisk");
ADDRGP4 neutralobelisk
ARGP4
ADDRGP4 $3064
ARGP4
ADDRGP4 BotSetEntityNumForGoal
CALLV
pop
line 5433
;5433:	}
LABELV $3054
LABELV $3043
LABELV $3034
LABELV $3024
line 5436
;5434:#endif
;5435:
;5436:	max_bspmodelindex = 0;
ADDRGP4 max_bspmodelindex
CNSTI4 0
ASGNI4
line 5437
;5437:	for (ent = trap_AAS_NextBSPEntity(0); ent; ent = trap_AAS_NextBSPEntity(ent)) {
CNSTI4 0
ARGI4
ADDRLP4 144
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 144
INDIRI4
ASGNI4
ADDRGP4 $3068
JUMPV
LABELV $3065
line 5438
;5438:		if (!trap_AAS_ValueForBSPEpairKey(ent, "model", model, sizeof(model))) continue;
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $528
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 148
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $3069
ADDRGP4 $3066
JUMPV
LABELV $3069
line 5439
;5439:		if (model[0] == '*') {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $3071
line 5440
;5440:			modelnum = atoi(model+1);
ADDRLP4 4+1
ARGP4
ADDRLP4 152
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 132
ADDRLP4 152
INDIRI4
ASGNI4
line 5441
;5441:			if (modelnum > max_bspmodelindex)
ADDRLP4 132
INDIRI4
ADDRGP4 max_bspmodelindex
INDIRI4
LEI4 $3074
line 5442
;5442:				max_bspmodelindex = modelnum;
ADDRGP4 max_bspmodelindex
ADDRLP4 132
INDIRI4
ASGNI4
LABELV $3074
line 5443
;5443:		}
LABELV $3071
line 5444
;5444:	}
LABELV $3066
line 5437
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 148
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 148
INDIRI4
ASGNI4
LABELV $3068
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $3065
line 5446
;5445:	//initialize the waypoint heap
;5446:	BotInitWaypoints();
ADDRGP4 BotInitWaypoints
CALLV
pop
line 5447
;5447:}
LABELV $3012
endproc BotSetupDeathmatchAI 156 16
export BotShutdownDeathmatchAI
proc BotShutdownDeathmatchAI 0 0
line 5454
;5448:
;5449:/*
;5450:==================
;5451:BotShutdownDeathmatchAI
;5452:==================
;5453:*/
;5454:void BotShutdownDeathmatchAI(void) {
line 5455
;5455:	altroutegoals_setup = qfalse;
ADDRGP4 altroutegoals_setup
CNSTI4 0
ASGNI4
line 5456
;5456:}
LABELV $3076
endproc BotShutdownDeathmatchAI 0 0
bss
export blue_numaltroutegoals
align 4
LABELV blue_numaltroutegoals
skip 4
export blue_altroutegoals
align 4
LABELV blue_altroutegoals
skip 768
export red_numaltroutegoals
align 4
LABELV red_numaltroutegoals
skip 4
export red_altroutegoals
align 4
LABELV red_altroutegoals
skip 768
export altroutegoals_setup
align 4
LABELV altroutegoals_setup
skip 4
export max_bspmodelindex
align 4
LABELV max_bspmodelindex
skip 4
export lastteleport_time
align 4
LABELV lastteleport_time
skip 4
export lastteleport_origin
align 4
LABELV lastteleport_origin
skip 12
import bot_developer
export g_spSkill
align 4
LABELV g_spSkill
skip 272
export bot_predictobstacles
align 4
LABELV bot_predictobstacles
skip 272
export botai_freewaypoints
align 4
LABELV botai_freewaypoints
skip 4
export botai_waypoints
align 4
LABELV botai_waypoints
skip 12800
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
export neutralobelisk
align 4
LABELV neutralobelisk
skip 56
export blueobelisk
align 4
LABELV blueobelisk
skip 56
export redobelisk
align 4
LABELV redobelisk
skip 56
export ctf_neutralflag
align 4
LABELV ctf_neutralflag
skip 56
export ctf_blueflag
align 4
LABELV ctf_blueflag
skip 56
export ctf_redflag
align 4
LABELV ctf_redflag
skip 56
export bot_challenge
align 4
LABELV bot_challenge
skip 272
export bot_testrchat
align 4
LABELV bot_testrchat
skip 272
export bot_nochat
align 4
LABELV bot_nochat
skip 272
export bot_fastchat
align 4
LABELV bot_fastchat
skip 272
export bot_rocketjump
align 4
LABELV bot_rocketjump
skip 272
export bot_grapple
align 4
LABELV bot_grapple
skip 272
export maxclients
align 4
LABELV maxclients
skip 4
export gametype
align 4
LABELV gametype
skip 4
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
LABELV $3064
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 110
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $3061
byte 1 72
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 10
byte 1 0
align 1
LABELV $3058
byte 1 72
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 10
byte 1 0
align 1
LABELV $3053
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $3052
byte 1 79
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 10
byte 1 0
align 1
LABELV $3051
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
LABELV $3048
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $3047
byte 1 79
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 10
byte 1 0
align 1
LABELV $3046
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
LABELV $3037
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
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
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
byte 1 10
byte 1 0
align 1
LABELV $3032
byte 1 67
byte 1 84
byte 1 70
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $3031
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
LABELV $3028
byte 1 67
byte 1 84
byte 1 70
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $3027
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
LABELV $3022
byte 1 50
byte 1 0
align 1
LABELV $3021
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
LABELV $3020
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 111
byte 1 98
byte 1 115
byte 1 116
byte 1 97
byte 1 99
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $3019
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $3018
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
LABELV $3017
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 102
byte 1 97
byte 1 115
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $3016
byte 1 48
byte 1 0
align 1
LABELV $3015
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 112
byte 1 112
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $3014
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $3013
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
LABELV $2966
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 101
byte 1 100
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
byte 1 37
byte 1 100
byte 1 32
byte 1 65
byte 1 73
byte 1 32
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2955
byte 1 66
byte 1 111
byte 1 116
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
byte 1 65
byte 1 73
byte 1 58
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2950
byte 1 66
byte 1 111
byte 1 116
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
byte 1 65
byte 1 73
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 97
byte 1 105
byte 1 32
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $2939
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $2935
byte 1 115
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $2919
byte 1 72
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 110
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 32
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 10
byte 1 0
align 1
LABELV $2918
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
LABELV $2900
byte 1 110
byte 1 111
byte 1 32
byte 1 97
byte 1 108
byte 1 116
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 116
byte 1 101
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
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
byte 1 10
byte 1 0
align 1
LABELV $2899
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
LABELV $2860
byte 1 42
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $2857
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 69
byte 1 78
byte 1 69
byte 1 82
byte 1 65
byte 1 76
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 58
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 80
byte 1 97
byte 1 114
byte 1 109
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 41
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $2818
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $2815
byte 1 75
byte 1 97
byte 1 109
byte 1 105
byte 1 107
byte 1 97
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $2814
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 107
byte 1 97
byte 1 109
byte 1 105
byte 1 107
byte 1 97
byte 1 122
byte 1 101
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $2811
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 76
byte 1 79
byte 1 66
byte 1 65
byte 1 76
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 58
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 80
byte 1 97
byte 1 114
byte 1 109
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 41
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $2757
byte 1 66
byte 1 111
byte 1 116
byte 1 67
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 67
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 77
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 115
byte 1 58
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 121
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $2750
byte 1 42
byte 1 42
byte 1 42
byte 1 42
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 121
byte 1 32
byte 1 42
byte 1 42
byte 1 42
byte 1 42
byte 1 10
byte 1 0
align 1
LABELV $2749
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 10
byte 1 0
align 1
LABELV $2746
byte 1 49
byte 1 0
align 1
LABELV $2745
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $2611
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 73
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 97
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $2610
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 73
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 97
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $2606
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 111
byte 1 70
byte 1 111
byte 1 114
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $2594
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $2593
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 114
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $2590
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2579
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 109
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 112
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $2566
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $2560
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $2552
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $2541
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 111
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
LABELV $2537
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
byte 1 0
align 1
LABELV $2534
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $2499
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $2494
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $2489
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $2486
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $2483
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2482
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2470
byte 1 42
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $2285
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $2262
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $2259
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $2221
byte 1 109
byte 1 112
byte 1 113
byte 1 51
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 54
byte 1 0
align 1
LABELV $2166
byte 1 113
byte 1 51
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 54
byte 1 0
align 1
LABELV $2162
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1250
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
LABELV $1249
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1248
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
LABELV $1247
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
LABELV $1246
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
LABELV $1036
byte 1 66
byte 1 111
byte 1 116
byte 1 67
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 87
byte 1 97
byte 1 121
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 79
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 119
byte 1 97
byte 1 121
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $690
byte 1 119
byte 1 97
byte 1 110
byte 1 116
byte 1 111
byte 1 110
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $676
byte 1 119
byte 1 97
byte 1 110
byte 1 116
byte 1 111
byte 1 110
byte 1 111
byte 1 102
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $578
byte 1 93
byte 1 0
align 1
LABELV $577
byte 1 91
byte 1 0
align 1
LABELV $576
byte 1 32
byte 1 0
align 1
LABELV $533
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
LABELV $528
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $527
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 83
byte 1 107
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $522
byte 1 110
byte 1 0
align 1
LABELV $521
byte 1 91
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 93
byte 1 0
align 1
LABELV $520
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $233
byte 1 111
byte 1 110
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $208
byte 1 105
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $185
byte 1 110
byte 1 111
byte 1 0
align 1
LABELV $160
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $159
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
LABELV $70
byte 1 116
byte 1 0
