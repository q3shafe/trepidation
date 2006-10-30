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
line 213
;209:#ifdef MISSIONPACK
;210:	if ( entinfo->powerups & ( 1 << PW_NEUTRALFLAG ) )
;211:		return qtrue;
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
EQI4 $97
line 224
;224:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $96
JUMPV
LABELV $97
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
EQI4 $99
line 227
;227:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $96
JUMPV
LABELV $99
line 229
;228:	}
;229:	return qfalse;
CNSTI4 0
RETI4
LABELV $96
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
EQI4 $102
line 239
;239:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $101
JUMPV
LABELV $102
line 241
;240:	}
;241:	return qfalse;
CNSTI4 0
RETI4
LABELV $101
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
EQI4 $105
line 251
;251:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $104
JUMPV
LABELV $105
line 253
;252:	}
;253:	return qfalse;
CNSTI4 0
RETI4
LABELV $104
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
EQI4 $108
line 263
;263:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $107
JUMPV
LABELV $108
line 265
;264:	}
;265:	return qfalse;
CNSTI4 0
RETI4
LABELV $107
endproc EntityHasQuad 0 0
export BotRememberLastOrderedTask
proc BotRememberLastOrderedTask 16 12
line 329
;266:}
;267:
;268:#ifdef MISSIONPACK
;269:/*
;270:==================
;271:EntityHasKamikze
;272:==================
;273:*/
;274:qboolean EntityHasKamikaze(aas_entityinfo_t *entinfo) {
;275:	if (entinfo->flags & EF_KAMIKAZE) {
;276:		return qtrue;
;277:	}
;278:	return qfalse;
;279:}
;280:
;281:/*
;282:==================
;283:EntityCarriesCubes
;284:==================
;285:*/
;286:qboolean EntityCarriesCubes(aas_entityinfo_t *entinfo) {
;287:	entityState_t state;
;288:
;289:	if (gametype != GT_HARVESTER)
;290:		return qfalse;
;291:	//FIXME: get this info from the aas_entityinfo_t ?
;292:	BotAI_GetEntityState(entinfo->number, &state);
;293:	if (state.generic1 > 0)
;294:		return qtrue;
;295:	return qfalse;
;296:}
;297:
;298:/*
;299:==================
;300:Bot1FCTFCarryingFlag
;301:==================
;302:*/
;303:int Bot1FCTFCarryingFlag(bot_state_t *bs) {
;304:	if (gametype != GT_1FCTF) return qfalse;
;305:
;306:	if (bs->inventory[INVENTORY_NEUTRALFLAG] > 0) return qtrue;
;307:	return qfalse;
;308:}
;309:
;310:/*
;311:==================
;312:BotHarvesterCarryingCubes
;313:==================
;314:*/
;315:int BotHarvesterCarryingCubes(bot_state_t *bs) {
;316:	if (gametype != GT_HARVESTER) return qfalse;
;317:
;318:	if (bs->inventory[INVENTORY_REDCUBE] > 0) return qtrue;
;319:	if (bs->inventory[INVENTORY_BLUECUBE] > 0) return qtrue;
;320:	return qfalse;
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
NEI4 $111
line 331
;331:		return;
ADDRGP4 $110
JUMPV
LABELV $111
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
LABELV $110
endproc BotRememberLastOrderedTask 16 12
export BotSetTeamStatus
proc BotSetTeamStatus 0 0
line 344
;338:
;339:/*
;340:==================
;341:BotSetTeamStatus
;342:==================
;343:*/
;344:void BotSetTeamStatus(bot_state_t *bs) {
line 401
;345:#ifdef MISSIONPACK
;346:	int teamtask;
;347:	aas_entityinfo_t entinfo;
;348:
;349:	teamtask = TEAMTASK_PATROL;
;350:
;351:	switch(bs->ltgtype) {
;352:		case LTG_TEAMHELP:
;353:			break;
;354:		case LTG_TEAMACCOMPANY:
;355:			BotEntityInfo(bs->teammate, &entinfo);
;356:			if ( ( (gametype == GT_CTF || gametype == GT_1FCTF) && EntityCarriesFlag(&entinfo))
;357:				|| ( gametype == GT_HARVESTER && EntityCarriesCubes(&entinfo)) ) {
;358:				teamtask = TEAMTASK_ESCORT;
;359:			}
;360:			else {
;361:				teamtask = TEAMTASK_FOLLOW;
;362:			}
;363:			break;
;364:		case LTG_DEFENDKEYAREA:
;365:			teamtask = TEAMTASK_DEFENSE;
;366:			break;
;367:		case LTG_GETFLAG:
;368:			teamtask = TEAMTASK_OFFENSE;
;369:			break;
;370:		case LTG_RUSHBASE:
;371:			teamtask = TEAMTASK_DEFENSE;
;372:			break;
;373:		case LTG_RETURNFLAG:
;374:			teamtask = TEAMTASK_RETRIEVE;
;375:			break;
;376:		case LTG_CAMP:
;377:		case LTG_CAMPORDER:
;378:			teamtask = TEAMTASK_CAMP;
;379:			break;
;380:		case LTG_PATROL:
;381:			teamtask = TEAMTASK_PATROL;
;382:			break;
;383:		case LTG_GETITEM:
;384:			teamtask = TEAMTASK_PATROL;
;385:			break;
;386:		case LTG_KILL:
;387:			teamtask = TEAMTASK_PATROL;
;388:			break;
;389:		case LTG_HARVEST:
;390:			teamtask = TEAMTASK_OFFENSE;
;391:			break;
;392:		case LTG_ATTACKENEMYBASE:
;393:			teamtask = TEAMTASK_OFFENSE;
;394:			break;
;395:		default:
;396:			teamtask = TEAMTASK_PATROL;
;397:			break;
;398:	}
;399:	BotSetUserInfo(bs, "teamtask", va("%d", teamtask));
;400:#endif
;401:}
LABELV $113
endproc BotSetTeamStatus 0 0
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
NEI4 $115
line 412
;411:		// don't go back to returning the flag if it's at the base
;412:		if ( bs->lastgoal_ltgtype == LTG_RETURNFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
CNSTI4 6
NEI4 $117
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
NEI4 $119
line 414
;414:				if ( bs->redflagstatus == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
CNSTI4 0
NEI4 $120
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
ADDRGP4 $120
JUMPV
LABELV $119
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
NEI4 $123
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
LABELV $123
line 422
;422:			}
LABELV $120
line 423
;423:		}
LABELV $117
line 424
;424:	}
LABELV $115
line 426
;425:
;426:	if ( bs->lastgoal_ltgtype ) {
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $125
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
NEI4 $127
line 436
;436:			if ( bs->ltgtype == LTG_GETFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
NEI4 $129
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
LEI4 $131
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
LABELV $131
line 449
;449:			}
LABELV $129
line 450
;450:		}
LABELV $127
line 451
;451:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $114
JUMPV
LABELV $125
line 453
;452:	}
;453:	return qfalse;
CNSTI4 0
RETI4
LABELV $114
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
NEI4 $134
line 463
;463:		return;
ADDRGP4 $133
JUMPV
LABELV $134
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
EQF4 $136
ADDRLP4 0
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1092616192
SUBF4
LEF4 $136
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
ADDRGP4 $138
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
LABELV $136
line 470
;470:}
LABELV $133
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
EQI4 $140
line 486
;485:		//if not already rushing to the base
;486:		if (bs->ltgtype != LTG_RUSHBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
EQI4 $142
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
EQI4 $147
ADDRLP4 180
INDIRI4
CNSTI4 2
EQI4 $152
ADDRGP4 $144
JUMPV
LABELV $147
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
ADDRGP4 $145
JUMPV
LABELV $152
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
ADDRGP4 $145
JUMPV
LABELV $144
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
LABELV $145
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
GEF4 $159
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
ADDRGP4 $160
JUMPV
LABELV $159
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
LABELV $160
line 507
;507:			BotSetUserInfo(bs, "teamtask", va("%d", TEAMTASK_OFFENSE));
ADDRGP4 $162
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
ADDRGP4 $161
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
ADDRGP4 $163
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 509
;509:		}
ADDRGP4 $139
JUMPV
LABELV $142
line 510
;510:		else if (bs->rushbaseaway_time > FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $139
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
NEI4 $166
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $167
JUMPV
LABELV $166
line 512
;512:			else flagstatus = bs->blueflagstatus;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
ASGNI4
LABELV $167
line 514
;513:			//if the flag is back
;514:			if (flagstatus == 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $139
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
ADDRGP4 $139
JUMPV
LABELV $140
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
NEI4 $170
ADDRLP4 176
INDIRP4
CNSTI4 6612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $170
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
NEI4 $172
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
LABELV $172
line 527
;527:	}
LABELV $170
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
NEI4 $174
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
ADDRGP4 $175
JUMPV
LABELV $174
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
LABELV $175
line 532
;531:	//if our team has the enemy flag and our flag is at the base
;532:	if (flagstatus == 1) {
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $176
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
GEF4 $139
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
NEI4 $184
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
EQI4 $139
ADDRLP4 196
INDIRI4
ADDRGP4 ctf_blueflag+44
INDIRI4
EQI4 $139
LABELV $184
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
LTI4 $139
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
NEI4 $187
ADDRLP4 208
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ADDRLP4 204
INDIRI4
EQI4 $139
LABELV $187
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
ADDRGP4 $188
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
ADDRGP4 $139
JUMPV
LABELV $176
line 571
;569:	}
;570:	//if the enemy has our flag
;571:	else if (flagstatus == 2) {
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $189
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
GEF4 $139
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
LTI4 $193
line 578
;577:				//FIXME: fight enemy flag carrier
;578:			}
LABELV $193
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
EQI4 $139
ADDRLP4 196
INDIRI4
CNSTI4 6
EQI4 $139
ADDRLP4 196
INDIRI4
CNSTI4 1
EQI4 $139
ADDRLP4 196
INDIRI4
CNSTI4 2
EQI4 $139
ADDRLP4 196
INDIRI4
CNSTI4 8
EQI4 $139
ADDRLP4 196
INDIRI4
CNSTI4 9
EQI4 $139
ADDRLP4 196
INDIRI4
CNSTI4 10
EQI4 $139
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
GEF4 $197
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
ADDRGP4 $198
JUMPV
LABELV $197
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
LABELV $198
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
ADDRGP4 $139
JUMPV
LABELV $189
line 613
;611:	}
;612:	//if both flags Not at their bases
;613:	else if (flagstatus == 3) {
ADDRLP4 0
INDIRI4
CNSTI4 3
NEI4 $199
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
GEF4 $139
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
EQI4 $139
ADDRLP4 192
INDIRI4
CNSTI4 2
EQI4 $139
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
LTI4 $205
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
ADDRGP4 $188
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
ADDRGP4 $139
JUMPV
LABELV $205
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
ADDRGP4 $139
JUMPV
LABELV $199
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
EQI4 $207
line 666
;666:		return;
ADDRGP4 $139
JUMPV
LABELV $207
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
EQI4 $209
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
LABELV $209
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
NEI4 $211
ADDRLP4 196
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
ADDRLP4 200
INDIRI4
EQI4 $211
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
LABELV $211
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
EQI4 $224
ADDRLP4 204
INDIRI4
CNSTI4 2
EQI4 $224
ADDRLP4 204
INDIRI4
CNSTI4 3
EQI4 $224
ADDRLP4 204
INDIRI4
CNSTI4 4
EQI4 $224
ADDRLP4 204
INDIRI4
CNSTI4 5
EQI4 $224
ADDRLP4 204
INDIRI4
CNSTI4 6
EQI4 $224
ADDRLP4 204
INDIRI4
CNSTI4 8
EQI4 $224
ADDRLP4 204
INDIRI4
CNSTI4 9
EQI4 $224
ADDRLP4 204
INDIRI4
CNSTI4 10
EQI4 $224
ADDRLP4 204
INDIRI4
CNSTI4 14
EQI4 $224
ADDRLP4 204
INDIRI4
CNSTI4 15
NEI4 $213
LABELV $224
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
ADDRGP4 $139
JUMPV
LABELV $213
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
EQI4 $225
line 692
;692:		return;
ADDRGP4 $139
JUMPV
LABELV $225
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
LEF4 $227
line 695
;695:		return;;
ADDRGP4 $139
JUMPV
LABELV $227
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
LEF4 $229
line 698
;698:		return;
ADDRGP4 $139
JUMPV
LABELV $229
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
GEF4 $231
line 701
;701:		return;
ADDRGP4 $139
JUMPV
LABELV $231
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
EQI4 $233
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
EQI4 $235
line 707
;707:			l1 = 0.7f;
ADDRLP4 8
CNSTF4 1060320051
ASGNF4
line 708
;708:		}
ADDRGP4 $236
JUMPV
LABELV $235
line 709
;709:		else {
line 710
;710:			l1 = 0.2f;
ADDRLP4 8
CNSTF4 1045220557
ASGNF4
line 711
;711:		}
LABELV $236
line 712
;712:		l2 = 0.9f;
ADDRLP4 12
CNSTF4 1063675494
ASGNF4
line 713
;713:	}
ADDRGP4 $234
JUMPV
LABELV $233
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
LABELV $234
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
GEF4 $237
ADDRLP4 224
CNSTI4 0
ASGNI4
ADDRGP4 ctf_redflag+12
INDIRI4
ADDRLP4 224
INDIRI4
EQI4 $237
ADDRGP4 ctf_blueflag+12
INDIRI4
ADDRLP4 224
INDIRI4
EQI4 $237
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
ADDRGP4 $238
JUMPV
LABELV $237
line 730
;730:	else if (rnd < l2 && ctf_redflag.areanum && ctf_blueflag.areanum) {
ADDRLP4 4
INDIRF4
ADDRLP4 12
INDIRF4
GEF4 $241
ADDRLP4 228
CNSTI4 0
ASGNI4
ADDRGP4 ctf_redflag+12
INDIRI4
ADDRLP4 228
INDIRI4
EQI4 $241
ADDRGP4 ctf_blueflag+12
INDIRI4
ADDRLP4 228
INDIRI4
EQI4 $241
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
NEI4 $245
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
ADDRGP4 $246
JUMPV
LABELV $245
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
LABELV $246
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
ADDRGP4 $242
JUMPV
LABELV $241
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
LABELV $242
LABELV $238
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
LABELV $139
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
EQI4 $248
line 764
;763:		//if not already rushing to the base
;764:		if (bs->ltgtype != LTG_RUSHBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
EQI4 $250
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
LABELV $250
line 773
;773:	}
LABELV $248
line 774
;774:}
LABELV $247
endproc BotCTFRetreatGoals 8 4
export BotTeamGoals
proc BotTeamGoals 0 4
line 1310
;775:
;776:#ifdef MISSIONPACK
;777:/*
;778:==================
;779:Bot1FCTFSeekGoals
;780:==================
;781:*/
;782:void Bot1FCTFSeekGoals(bot_state_t *bs) {
;783:	aas_entityinfo_t entinfo;
;784:	float rnd, l1, l2;
;785:	int c;
;786:
;787:	//when carrying a flag in ctf the bot should rush to the base
;788:	if (Bot1FCTFCarryingFlag(bs)) {
;789:		//if not already rushing to the base
;790:		if (bs->ltgtype != LTG_RUSHBASE) {
;791:			BotRefuseOrder(bs);
;792:			bs->ltgtype = LTG_RUSHBASE;
;793:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
;794:			bs->rushbaseaway_time = 0;
;795:			bs->decisionmaker = bs->client;
;796:			bs->ordered = qfalse;
;797:			//get an alternative route goal towards the enemy base
;798:			BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
;799:			//
;800:			BotSetTeamStatus(bs);
;801:			BotVoiceChat(bs, -1, VOICECHAT_IHAVEFLAG);
;802:		}
;803:		return;
;804:	}
;805:	// if the bot decided to follow someone
;806:	if ( bs->ltgtype == LTG_TEAMACCOMPANY && !bs->ordered ) {
;807:		// if the team mate being accompanied no longer carries the flag
;808:		BotEntityInfo(bs->teammate, &entinfo);
;809:		if (!EntityCarriesFlag(&entinfo)) {
;810:			bs->ltgtype = 0;
;811:		}
;812:	}
;813:	//our team has the flag
;814:	if (bs->neutralflagstatus == 1) {
;815:		if (bs->owndecision_time < FloatTime()) {
;816:			// if not already following someone
;817:			if (bs->ltgtype != LTG_TEAMACCOMPANY) {
;818:				//if there is a visible team mate flag carrier
;819:				c = BotTeamFlagCarrierVisible(bs);
;820:				if (c >= 0) {
;821:					BotRefuseOrder(bs);
;822:					//follow the flag carrier
;823:					bs->decisionmaker = bs->client;
;824:					bs->ordered = qfalse;
;825:					//the team mate
;826:					bs->teammate = c;
;827:					//last time the team mate was visible
;828:					bs->teammatevisible_time = FloatTime();
;829:					//no message
;830:					bs->teammessage_time = 0;
;831:					//no arrive message
;832:					bs->arrive_time = 1;
;833:					//
;834:					BotVoiceChat(bs, bs->teammate, VOICECHAT_ONFOLLOW);
;835:					//get the team goal time
;836:					bs->teamgoal_time = FloatTime() + TEAM_ACCOMPANY_TIME;
;837:					bs->ltgtype = LTG_TEAMACCOMPANY;
;838:					bs->formation_dist = 3.5 * 32;		//3.5 meter
;839:					BotSetTeamStatus(bs);
;840:					bs->owndecision_time = FloatTime() + 5;
;841:					return;
;842:				}
;843:			}
;844:			//if already a CTF or team goal
;845:			if (bs->ltgtype == LTG_TEAMHELP ||
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
;856:				return;
;857:			}
;858:			//if not already attacking the enemy base
;859:			if (bs->ltgtype != LTG_ATTACKENEMYBASE) {
;860:				BotRefuseOrder(bs);
;861:				bs->decisionmaker = bs->client;
;862:				bs->ordered = qfalse;
;863:				//
;864:				if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t));
;865:				else memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t));
;866:				//set the ltg type
;867:				bs->ltgtype = LTG_ATTACKENEMYBASE;
;868:				//set the time the bot will stop getting the flag
;869:				bs->teamgoal_time = FloatTime() + TEAM_ATTACKENEMYBASE_TIME;
;870:				BotSetTeamStatus(bs);
;871:				bs->owndecision_time = FloatTime() + 5;
;872:			}
;873:		}
;874:		return;
;875:	}
;876:	//enemy team has the flag
;877:	else if (bs->neutralflagstatus == 2) {
;878:		if (bs->owndecision_time < FloatTime()) {
;879:			c = BotEnemyFlagCarrierVisible(bs);
;880:			if (c >= 0) {
;881:				//FIXME: attack enemy flag carrier
;882:			}
;883:			//if already a CTF or team goal
;884:			if (bs->ltgtype == LTG_TEAMHELP ||
;885:					bs->ltgtype == LTG_TEAMACCOMPANY ||
;886:					bs->ltgtype == LTG_CAMPORDER ||
;887:					bs->ltgtype == LTG_PATROL ||
;888:					bs->ltgtype == LTG_GETITEM) {
;889:				return;
;890:			}
;891:			// if not already defending the base
;892:			if (bs->ltgtype != LTG_DEFENDKEYAREA) {
;893:				BotRefuseOrder(bs);
;894:				bs->decisionmaker = bs->client;
;895:				bs->ordered = qfalse;
;896:				//
;897:				if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t));
;898:				else memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t));
;899:				//set the ltg type
;900:				bs->ltgtype = LTG_DEFENDKEYAREA;
;901:				//set the time the bot stops defending the base
;902:				bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
;903:				bs->defendaway_time = 0;
;904:				BotSetTeamStatus(bs);
;905:				bs->owndecision_time = FloatTime() + 5;
;906:			}
;907:		}
;908:		return;
;909:	}
;910:	// don't just do something wait for the bot team leader to give orders
;911:	if (BotTeamLeader(bs)) {
;912:		return;
;913:	}
;914:	// if the bot is ordered to do something
;915:	if ( bs->lastgoal_ltgtype ) {
;916:		bs->teamgoal_time += 60;
;917:	}
;918:	// if the bot decided to do something on it's own and has a last ordered goal
;919:	if ( !bs->ordered && bs->lastgoal_ltgtype ) {
;920:		bs->ltgtype = 0;
;921:	}
;922:	//if already a CTF or team goal
;923:	if (bs->ltgtype == LTG_TEAMHELP ||
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
;935:		return;
;936:	}
;937:	//
;938:	if (BotSetLastOrderedTask(bs))
;939:		return;
;940:	//
;941:	if (bs->owndecision_time > FloatTime())
;942:		return;;
;943:	//if the bot is roaming
;944:	if (bs->ctfroam_time > FloatTime())
;945:		return;
;946:	//if the bot has anough aggression to decide what to do
;947:	if (BotAggression(bs) < 50)
;948:		return;
;949:	//set the time to send a message to the team mates
;950:	bs->teammessage_time = FloatTime() + 2 * random();
;951:	//
;952:	if (bs->teamtaskpreference & (TEAMTP_ATTACKER|TEAMTP_DEFENDER)) {
;953:		if (bs->teamtaskpreference & TEAMTP_ATTACKER) {
;954:			l1 = 0.7f;
;955:		}
;956:		else {
;957:			l1 = 0.2f;
;958:		}
;959:		l2 = 0.9f;
;960:	}
;961:	else {
;962:		l1 = 0.4f;
;963:		l2 = 0.7f;
;964:	}
;965:	//get the flag or defend the base
;966:	rnd = random();
;967:	if (rnd < l1 && ctf_neutralflag.areanum) {
;968:		bs->decisionmaker = bs->client;
;969:		bs->ordered = qfalse;
;970:		bs->ltgtype = LTG_GETFLAG;
;971:		//set the time the bot will stop getting the flag
;972:		bs->teamgoal_time = FloatTime() + CTF_GETFLAG_TIME;
;973:		BotSetTeamStatus(bs);
;974:	}
;975:	else if (rnd < l2 && ctf_redflag.areanum && ctf_blueflag.areanum) {
;976:		bs->decisionmaker = bs->client;
;977:		bs->ordered = qfalse;
;978:		//
;979:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t));
;980:		else memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t));
;981:		//set the ltg type
;982:		bs->ltgtype = LTG_DEFENDKEYAREA;
;983:		//set the time the bot stops defending the base
;984:		bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
;985:		bs->defendaway_time = 0;
;986:		BotSetTeamStatus(bs);
;987:	}
;988:	else {
;989:		bs->ltgtype = 0;
;990:		//set the time the bot will stop roaming
;991:		bs->ctfroam_time = FloatTime() + CTF_ROAM_TIME;
;992:		BotSetTeamStatus(bs);
;993:	}
;994:	bs->owndecision_time = FloatTime() + 5;
;995:#ifdef DEBUG
;996:	BotPrintTeamGoal(bs);
;997:#endif //DEBUG
;998:}
;999:
;1000:/*
;1001:==================
;1002:Bot1FCTFRetreatGoals
;1003:==================
;1004:*/
;1005:void Bot1FCTFRetreatGoals(bot_state_t *bs) {
;1006:	//when carrying a flag in ctf the bot should rush to the enemy base
;1007:	if (Bot1FCTFCarryingFlag(bs)) {
;1008:		//if not already rushing to the base
;1009:		if (bs->ltgtype != LTG_RUSHBASE) {
;1010:			BotRefuseOrder(bs);
;1011:			bs->ltgtype = LTG_RUSHBASE;
;1012:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
;1013:			bs->rushbaseaway_time = 0;
;1014:			bs->decisionmaker = bs->client;
;1015:			bs->ordered = qfalse;
;1016:			//get an alternative route goal towards the enemy base
;1017:			BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
;1018:			BotSetTeamStatus(bs);
;1019:		}
;1020:	}
;1021:}
;1022:
;1023:/*
;1024:==================
;1025:BotObeliskSeekGoals
;1026:==================
;1027:*/
;1028:void BotObeliskSeekGoals(bot_state_t *bs) {
;1029:	float rnd, l1, l2;
;1030:
;1031:	// don't just do something wait for the bot team leader to give orders
;1032:	if (BotTeamLeader(bs)) {
;1033:		return;
;1034:	}
;1035:	// if the bot is ordered to do something
;1036:	if ( bs->lastgoal_ltgtype ) {
;1037:		bs->teamgoal_time += 60;
;1038:	}
;1039:	//if already a team goal
;1040:	if (bs->ltgtype == LTG_TEAMHELP ||
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
;1052:		return;
;1053:	}
;1054:	//
;1055:	if (BotSetLastOrderedTask(bs))
;1056:		return;
;1057:	//if the bot is roaming
;1058:	if (bs->ctfroam_time > FloatTime())
;1059:		return;
;1060:	//if the bot has anough aggression to decide what to do
;1061:	if (BotAggression(bs) < 50)
;1062:		return;
;1063:	//set the time to send a message to the team mates
;1064:	bs->teammessage_time = FloatTime() + 2 * random();
;1065:	//
;1066:	if (bs->teamtaskpreference & (TEAMTP_ATTACKER|TEAMTP_DEFENDER)) {
;1067:		if (bs->teamtaskpreference & TEAMTP_ATTACKER) {
;1068:			l1 = 0.7f;
;1069:		}
;1070:		else {
;1071:			l1 = 0.2f;
;1072:		}
;1073:		l2 = 0.9f;
;1074:	}
;1075:	else {
;1076:		l1 = 0.4f;
;1077:		l2 = 0.7f;
;1078:	}
;1079:	//get the flag or defend the base
;1080:	rnd = random();
;1081:	if (rnd < l1 && redobelisk.areanum && blueobelisk.areanum) {
;1082:		bs->decisionmaker = bs->client;
;1083:		bs->ordered = qfalse;
;1084:		//
;1085:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &blueobelisk, sizeof(bot_goal_t));
;1086:		else memcpy(&bs->teamgoal, &redobelisk, sizeof(bot_goal_t));
;1087:		//set the ltg type
;1088:		bs->ltgtype = LTG_ATTACKENEMYBASE;
;1089:		//set the time the bot will stop attacking the enemy base
;1090:		bs->teamgoal_time = FloatTime() + TEAM_ATTACKENEMYBASE_TIME;
;1091:		//get an alternate route goal towards the enemy base
;1092:		BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
;1093:		BotSetTeamStatus(bs);
;1094:	}
;1095:	else if (rnd < l2 && redobelisk.areanum && blueobelisk.areanum) {
;1096:		bs->decisionmaker = bs->client;
;1097:		bs->ordered = qfalse;
;1098:		//
;1099:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &redobelisk, sizeof(bot_goal_t));
;1100:		else memcpy(&bs->teamgoal, &blueobelisk, sizeof(bot_goal_t));
;1101:		//set the ltg type
;1102:		bs->ltgtype = LTG_DEFENDKEYAREA;
;1103:		//set the time the bot stops defending the base
;1104:		bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
;1105:		bs->defendaway_time = 0;
;1106:		BotSetTeamStatus(bs);
;1107:	}
;1108:	else {
;1109:		bs->ltgtype = 0;
;1110:		//set the time the bot will stop roaming
;1111:		bs->ctfroam_time = FloatTime() + CTF_ROAM_TIME;
;1112:		BotSetTeamStatus(bs);
;1113:	}
;1114:}
;1115:
;1116:/*
;1117:==================
;1118:BotGoHarvest
;1119:==================
;1120:*/
;1121:void BotGoHarvest(bot_state_t *bs) {
;1122:	//
;1123:	if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &blueobelisk, sizeof(bot_goal_t));
;1124:	else memcpy(&bs->teamgoal, &redobelisk, sizeof(bot_goal_t));
;1125:	//set the ltg type
;1126:	bs->ltgtype = LTG_HARVEST;
;1127:	//set the time the bot will stop harvesting
;1128:	bs->teamgoal_time = FloatTime() + TEAM_HARVEST_TIME;
;1129:	bs->harvestaway_time = 0;
;1130:	BotSetTeamStatus(bs);
;1131:}
;1132:
;1133:/*
;1134:==================
;1135:BotObeliskRetreatGoals
;1136:==================
;1137:*/
;1138:void BotObeliskRetreatGoals(bot_state_t *bs) {
;1139:	//nothing special
;1140:}
;1141:
;1142:/*
;1143:==================
;1144:BotHarvesterSeekGoals
;1145:==================
;1146:*/
;1147:void BotHarvesterSeekGoals(bot_state_t *bs) {
;1148:	aas_entityinfo_t entinfo;
;1149:	float rnd, l1, l2;
;1150:	int c;
;1151:
;1152:	//when carrying cubes in harvester the bot should rush to the base
;1153:	if (BotHarvesterCarryingCubes(bs)) {
;1154:		//if not already rushing to the base
;1155:		if (bs->ltgtype != LTG_RUSHBASE) {
;1156:			BotRefuseOrder(bs);
;1157:			bs->ltgtype = LTG_RUSHBASE;
;1158:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
;1159:			bs->rushbaseaway_time = 0;
;1160:			bs->decisionmaker = bs->client;
;1161:			bs->ordered = qfalse;
;1162:			//get an alternative route goal towards the enemy base
;1163:			BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
;1164:			//
;1165:			BotSetTeamStatus(bs);
;1166:		}
;1167:		return;
;1168:	}
;1169:	// don't just do something wait for the bot team leader to give orders
;1170:	if (BotTeamLeader(bs)) {
;1171:		return;
;1172:	}
;1173:	// if the bot decided to follow someone
;1174:	if ( bs->ltgtype == LTG_TEAMACCOMPANY && !bs->ordered ) {
;1175:		// if the team mate being accompanied no longer carries the flag
;1176:		BotEntityInfo(bs->teammate, &entinfo);
;1177:		if (!EntityCarriesCubes(&entinfo)) {
;1178:			bs->ltgtype = 0;
;1179:		}
;1180:	}
;1181:	// if the bot is ordered to do something
;1182:	if ( bs->lastgoal_ltgtype ) {
;1183:		bs->teamgoal_time += 60;
;1184:	}
;1185:	//if not yet doing something
;1186:	if (bs->ltgtype == LTG_TEAMHELP ||
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
;1197:		return;
;1198:	}
;1199:	//
;1200:	if (BotSetLastOrderedTask(bs))
;1201:		return;
;1202:	//if the bot is roaming
;1203:	if (bs->ctfroam_time > FloatTime())
;1204:		return;
;1205:	//if the bot has anough aggression to decide what to do
;1206:	if (BotAggression(bs) < 50)
;1207:		return;
;1208:	//set the time to send a message to the team mates
;1209:	bs->teammessage_time = FloatTime() + 2 * random();
;1210:	//
;1211:	c = BotEnemyCubeCarrierVisible(bs);
;1212:	if (c >= 0) {
;1213:		//FIXME: attack enemy cube carrier
;1214:	}
;1215:	if (bs->ltgtype != LTG_TEAMACCOMPANY) {
;1216:		//if there is a visible team mate carrying cubes
;1217:		c = BotTeamCubeCarrierVisible(bs);
;1218:		if (c >= 0) {
;1219:			//follow the team mate carrying cubes
;1220:			bs->decisionmaker = bs->client;
;1221:			bs->ordered = qfalse;
;1222:			//the team mate
;1223:			bs->teammate = c;
;1224:			//last time the team mate was visible
;1225:			bs->teammatevisible_time = FloatTime();
;1226:			//no message
;1227:			bs->teammessage_time = 0;
;1228:			//no arrive message
;1229:			bs->arrive_time = 1;
;1230:			//
;1231:			BotVoiceChat(bs, bs->teammate, VOICECHAT_ONFOLLOW);
;1232:			//get the team goal time
;1233:			bs->teamgoal_time = FloatTime() + TEAM_ACCOMPANY_TIME;
;1234:			bs->ltgtype = LTG_TEAMACCOMPANY;
;1235:			bs->formation_dist = 3.5 * 32;		//3.5 meter
;1236:			BotSetTeamStatus(bs);
;1237:			return;
;1238:		}
;1239:	}
;1240:	//
;1241:	if (bs->teamtaskpreference & (TEAMTP_ATTACKER|TEAMTP_DEFENDER)) {
;1242:		if (bs->teamtaskpreference & TEAMTP_ATTACKER) {
;1243:			l1 = 0.7f;
;1244:		}
;1245:		else {
;1246:			l1 = 0.2f;
;1247:		}
;1248:		l2 = 0.9f;
;1249:	}
;1250:	else {
;1251:		l1 = 0.4f;
;1252:		l2 = 0.7f;
;1253:	}
;1254:	//
;1255:	rnd = random();
;1256:	if (rnd < l1 && redobelisk.areanum && blueobelisk.areanum) {
;1257:		bs->decisionmaker = bs->client;
;1258:		bs->ordered = qfalse;
;1259:		BotGoHarvest(bs);
;1260:	}
;1261:	else if (rnd < l2 && redobelisk.areanum && blueobelisk.areanum) {
;1262:		bs->decisionmaker = bs->client;
;1263:		bs->ordered = qfalse;
;1264:		//
;1265:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &redobelisk, sizeof(bot_goal_t));
;1266:		else memcpy(&bs->teamgoal, &blueobelisk, sizeof(bot_goal_t));
;1267:		//set the ltg type
;1268:		bs->ltgtype = LTG_DEFENDKEYAREA;
;1269:		//set the time the bot stops defending the base
;1270:		bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
;1271:		bs->defendaway_time = 0;
;1272:		BotSetTeamStatus(bs);
;1273:	}
;1274:	else {
;1275:		bs->ltgtype = 0;
;1276:		//set the time the bot will stop roaming
;1277:		bs->ctfroam_time = FloatTime() + CTF_ROAM_TIME;
;1278:		BotSetTeamStatus(bs);
;1279:	}
;1280:}
;1281:
;1282:/*
;1283:==================
;1284:BotHarvesterRetreatGoals
;1285:==================
;1286:*/
;1287:void BotHarvesterRetreatGoals(bot_state_t *bs) {
;1288:	//when carrying cubes in harvester the bot should rush to the base
;1289:	if (BotHarvesterCarryingCubes(bs)) {
;1290:		//if not already rushing to the base
;1291:		if (bs->ltgtype != LTG_RUSHBASE) {
;1292:			BotRefuseOrder(bs);
;1293:			bs->ltgtype = LTG_RUSHBASE;
;1294:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
;1295:			bs->rushbaseaway_time = 0;
;1296:			bs->decisionmaker = bs->client;
;1297:			bs->ordered = qfalse;
;1298:			BotSetTeamStatus(bs);
;1299:		}
;1300:		return;
;1301:	}
;1302:}
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
EQI4 $253
line 1313
;1313:		if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $254
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
line 1327
;1316:#ifdef MISSIONPACK
;1317:		else if (gametype == GT_1FCTF) {
;1318:			Bot1FCTFRetreatGoals(bs);
;1319:		}
;1320:		else if (gametype == GT_OBELISK) {
;1321:			BotObeliskRetreatGoals(bs);
;1322:		}
;1323:		else if (gametype == GT_HARVESTER) {
;1324:			BotHarvesterRetreatGoals(bs);
;1325:		}
;1326:#endif
;1327:	}
ADDRGP4 $254
JUMPV
LABELV $253
line 1328
;1328:	else {
line 1329
;1329:		if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $257
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
LABELV $257
line 1344
;1333:#ifdef MISSIONPACK
;1334:		else if (gametype == GT_1FCTF) {
;1335:			Bot1FCTFSeekGoals(bs);
;1336:		}
;1337:		else if (gametype == GT_OBELISK) {
;1338:			BotObeliskSeekGoals(bs);
;1339:		}
;1340:		else if (gametype == GT_HARVESTER) {
;1341:			BotHarvesterSeekGoals(bs);
;1342:		}
;1343:#endif
;1344:	}
LABELV $254
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
LABELV $252
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
EQI4 $260
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $259
JUMPV
LABELV $260
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
LEI4 $263
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $259
JUMPV
LABELV $263
line 1365
;1365:	return 0;
CNSTI4 0
RETI4
LABELV $259
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
LTI4 $268
ADDRLP4 1024
INDIRI4
CNSTI4 64
LTI4 $266
LABELV $268
line 1377
;1377:		BotAI_Print(PRT_ERROR, "ClientName: client out of range\n");
CNSTI4 3
ARGI4
ADDRGP4 $269
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 1378
;1378:		return "[client out of range]";
ADDRGP4 $270
RETP4
ADDRGP4 $265
JUMPV
LABELV $266
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
ADDRGP4 $271
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
LABELV $265
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
LTI4 $275
ADDRLP4 1024
INDIRI4
CNSTI4 64
LTI4 $273
LABELV $275
line 1396
;1396:		BotAI_Print(PRT_ERROR, "ClientSkin: client out of range\n");
CNSTI4 3
ARGI4
ADDRGP4 $276
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 1397
;1397:		return "[client out of range]";
ADDRGP4 $270
RETP4
ADDRGP4 $272
JUMPV
LABELV $273
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
ADDRGP4 $277
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
LABELV $272
endproc ClientSkin 1032 12
bss
align 4
LABELV $279
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
ADDRGP4 $279
INDIRI4
CNSTI4 0
NEI4 $280
line 1416
;1416:		maxclients = trap_Cvar_VariableIntegerValue("sv_maxclients");
ADDRGP4 $282
ARGP4
ADDRLP4 1028
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 $279
ADDRLP4 1028
INDIRI4
ASGNI4
LABELV $280
line 1417
;1417:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $286
JUMPV
LABELV $283
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
ADDRGP4 $271
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
NEI4 $287
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $278
JUMPV
LABELV $287
line 1421
;1421:	}
LABELV $284
line 1417
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $286
ADDRLP4 0
INDIRI4
ADDRGP4 $279
INDIRI4
GEI4 $289
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $283
LABELV $289
line 1422
;1422:	return -1;
CNSTI4 -1
RETI4
LABELV $278
endproc ClientFromName 1040 12
bss
align 4
LABELV $291
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
ADDRGP4 $291
INDIRI4
CNSTI4 0
NEI4 $292
line 1436
;1436:		maxclients = trap_Cvar_VariableIntegerValue("sv_maxclients");
ADDRGP4 $282
ARGP4
ADDRLP4 1028
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 $291
ADDRLP4 1028
INDIRI4
ASGNI4
LABELV $292
line 1437
;1437:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $297
JUMPV
LABELV $294
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
NEI4 $298
line 1439
;1439:			continue;
ADDRGP4 $295
JUMPV
LABELV $298
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
ADDRGP4 $271
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
NEI4 $300
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $290
JUMPV
LABELV $300
line 1443
;1443:	}
LABELV $295
line 1437
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $297
ADDRLP4 0
INDIRI4
ADDRGP4 $291
INDIRI4
GEI4 $302
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $294
LABELV $302
line 1444
;1444:	return -1;
CNSTI4 -1
RETI4
LABELV $290
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
ADDRGP4 $305
JUMPV
LABELV $304
line 1455
;1453:	int i;
;1454:
;1455:	while(*str) {
line 1456
;1456:		for (i = 0; charset[i] && str[i]; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $310
JUMPV
LABELV $307
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
EQI4 $311
ADDRGP4 $309
JUMPV
LABELV $311
line 1458
;1458:		}
LABELV $308
line 1456
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $310
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
EQI4 $313
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDRLP4 8
INDIRI4
NEI4 $307
LABELV $313
LABELV $309
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
NEI4 $314
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $303
JUMPV
LABELV $314
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
LABELV $305
line 1455
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $304
line 1462
;1462:	return NULL;
CNSTP4 0
RETP4
LABELV $303
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
ADDRGP4 $320
JUMPV
LABELV $317
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
LABELV $318
ADDRLP4 136
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $320
ADDRLP4 136
INDIRI4
ADDRLP4 5
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $317
line 1478
;1477:	//remove all spaces
;1478:	for (ptr = strstr(name, " "); ptr; ptr = strstr(name, " ")) {
ADDRLP4 5
ARGP4
ADDRGP4 $325
ARGP4
ADDRLP4 156
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 156
INDIRP4
ASGNP4
ADDRGP4 $324
JUMPV
LABELV $321
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
LABELV $322
line 1478
ADDRLP4 5
ARGP4
ADDRGP4 $325
ARGP4
ADDRLP4 160
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 160
INDIRP4
ASGNP4
LABELV $324
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $321
line 1482
;1481:	//check for [x] and ]x[ clan names
;1482:	str1 = strstr(name, "[");
ADDRLP4 5
ARGP4
ADDRGP4 $326
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
ADDRGP4 $327
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
EQU4 $328
ADDRLP4 144
INDIRP4
CVPU4 4
ADDRLP4 172
INDIRU4
EQU4 $328
line 1485
;1485:		if (str2 > str1) memmove(str1, str2+1, strlen(str2+1)+1);
ADDRLP4 144
INDIRP4
CVPU4 4
ADDRLP4 140
INDIRP4
CVPU4 4
LEU4 $330
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
ADDRGP4 $331
JUMPV
LABELV $330
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
LABELV $331
line 1487
;1487:	}
LABELV $328
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
EQI4 $336
ADDRLP4 176
INDIRI4
CNSTI4 77
NEI4 $332
LABELV $336
ADDRLP4 5+1
INDIRI1
CVII4 1
CNSTI4 114
EQI4 $337
ADDRLP4 5+1
INDIRI1
CVII4 1
CNSTI4 82
NEI4 $332
LABELV $337
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
LABELV $332
line 1494
;1493:	//only allow lower case alphabet characters
;1494:	ptr = name;
ADDRLP4 0
ADDRLP4 5
ASGNP4
ADDRGP4 $341
JUMPV
LABELV $340
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
LTI4 $346
ADDRLP4 180
INDIRI4
CNSTI4 122
LEI4 $347
LABELV $346
ADDRLP4 184
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 48
LTI4 $348
ADDRLP4 184
INDIRI4
CNSTI4 57
LEI4 $347
LABELV $348
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 95
NEI4 $343
LABELV $347
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
ADDRGP4 $344
JUMPV
LABELV $343
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
LTI4 $349
ADDRLP4 188
INDIRI4
CNSTI4 90
GTI4 $349
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
ADDRGP4 $350
JUMPV
LABELV $349
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
LABELV $350
LABELV $344
line 1508
;1508:	}
LABELV $341
line 1495
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $340
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
LABELV $316
endproc EasyClientName 204 12
export BotSynonymContext
proc BotSynonymContext 8 4
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
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $352
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
ADDRLP4 4
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $354
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 4
BORI4
ASGNI4
ADDRGP4 $355
JUMPV
LABELV $354
line 1530
;1530:		else context |= CONTEXT_CTFBLUETEAM;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 8
BORI4
ASGNI4
LABELV $355
line 1531
;1531:	}
LABELV $352
line 1542
;1532:#ifdef MISSIONPACK
;1533:	else if (gametype == GT_OBELISK) {
;1534:		if (BotTeam(bs) == TEAM_RED) context |= CONTEXT_OBELISKREDTEAM;
;1535:		else context |= CONTEXT_OBELISKBLUETEAM;
;1536:	}
;1537:	else if (gametype == GT_HARVESTER) {
;1538:		if (BotTeam(bs) == TEAM_RED) context |= CONTEXT_HARVESTERREDTEAM;
;1539:		else context |= CONTEXT_HARVESTERBLUETEAM;
;1540:	}
;1541:#endif
;1542:	return context;
ADDRLP4 0
INDIRI4
RETI4
LABELV $351
endproc BotSynonymContext 8 4
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
EQI4 $359
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $357
LABELV $359
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
ADDRGP4 $358
JUMPV
LABELV $357
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
EQI4 $360
ADDRFP4 0
INDIRP4
CNSTI4 6192
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
LABELV $360
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
LABELV $358
line 1566
;1565:
;1566:}
LABELV $356
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
EQI4 $374
ADDRLP4 0+64
ADDRLP4 0+64
INDIRI4
CNSTI4 2
BORI4
ASGNI4
LABELV $374
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
EQI4 $377
ADDRLP4 72
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 76
INDIRI4
LEI4 $377
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
LABELV $377
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
EQI4 $380
ADDRLP4 80
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 84
INDIRI4
LEI4 $380
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
LABELV $380
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
EQI4 $383
ADDRLP4 0+48
CNSTI4 4
ASGNI4
ADDRGP4 $384
JUMPV
LABELV $383
line 1596
;1596:	else initmove.presencetype = PRESENCE_NORMAL;
ADDRLP4 0+48
CNSTI4 2
ASGNI4
LABELV $384
line 1598
;1597:	//
;1598:	if (bs->walker > 0.5) initmove.or_moveflags |= MFL_WALK;
ADDRFP4 0
INDIRP4
CNSTI4 6056
ADDP4
INDIRF4
CNSTF4 1056964608
LEF4 $387
ADDRLP4 0+64
ADDRLP4 0+64
INDIRI4
CNSTI4 512
BORI4
ASGNI4
LABELV $387
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
LABELV $362
endproc BotSetupForMovement 88 12
export BotCheckItemPickup
proc BotCheckItemPickup 0 0
line 1610
;1604:
;1605:/*
;1606:==================
;1607:BotCheckItemPickup
;1608:==================
;1609:*/
;1610:void BotCheckItemPickup(bot_state_t *bs, int *oldinventory) {
line 1697
;1611:#ifdef MISSIONPACK
;1612:	int offence, leader;
;1613:
;1614:	if (gametype <= GT_TEAM)
;1615:		return;
;1616:
;1617:	offence = -1;
;1618:	// go into offence if picked up the kamikaze or invulnerability
;1619:	if (!oldinventory[INVENTORY_KAMIKAZE] && bs->inventory[INVENTORY_KAMIKAZE] >= 1) {
;1620:		offence = qtrue;
;1621:	}
;1622:	if (!oldinventory[INVENTORY_INVULNERABILITY] && bs->inventory[INVENTORY_INVULNERABILITY] >= 1) {
;1623:		offence = qtrue;
;1624:	}
;1625:	// if not already wearing the kamikaze or invulnerability
;1626:	if (!bs->inventory[INVENTORY_KAMIKAZE] && !bs->inventory[INVENTORY_INVULNERABILITY]) {
;1627:		if (!oldinventory[INVENTORY_SCOUT] && bs->inventory[INVENTORY_SCOUT] >= 1) {
;1628:			offence = qtrue;
;1629:		}
;1630:		if (!oldinventory[INVENTORY_GUARD] && bs->inventory[INVENTORY_GUARD] >= 1) {
;1631:			offence = qtrue;
;1632:		}
;1633:		if (!oldinventory[INVENTORY_DOUBLER] && bs->inventory[INVENTORY_DOUBLER] >= 1) {
;1634:			offence = qfalse;
;1635:		}
;1636:		if (!oldinventory[INVENTORY_AMMOREGEN] && bs->inventory[INVENTORY_AMMOREGEN] >= 1) {
;1637:			offence = qfalse;
;1638:		}
;1639:	}
;1640:
;1641:	if (offence >= 0) {
;1642:		leader = ClientFromName(bs->teamleader);
;1643:		if (offence) {
;1644:			if (!(bs->teamtaskpreference & TEAMTP_ATTACKER)) {
;1645:				// if we have a bot team leader
;1646:				if (BotTeamLeader(bs)) {
;1647:					// tell the leader we want to be on offence
;1648:					BotVoiceChat(bs, leader, VOICECHAT_WANTONOFFENSE);
;1649:					//BotAI_BotInitialChat(bs, "wantoffence", NULL);
;1650:					//trap_BotEnterChat(bs->cs, leader, CHAT_TELL);
;1651:				}
;1652:				else if (g_spSkill.integer <= 3) {
;1653:					if ( bs->ltgtype != LTG_GETFLAG &&
;1654:						 bs->ltgtype != LTG_ATTACKENEMYBASE &&
;1655:						 bs->ltgtype != LTG_HARVEST ) {
;1656:						//
;1657:						if ((gametype != GT_CTF || (bs->redflagstatus == 0 && bs->blueflagstatus == 0)) &&
;1658:							(gametype != GT_1FCTF || bs->neutralflagstatus == 0) ) {
;1659:							// tell the leader we want to be on offence
;1660:							BotVoiceChat(bs, leader, VOICECHAT_WANTONOFFENSE);
;1661:							//BotAI_BotInitialChat(bs, "wantoffence", NULL);
;1662:							//trap_BotEnterChat(bs->cs, leader, CHAT_TELL);
;1663:						}
;1664:					}
;1665:					bs->teamtaskpreference |= TEAMTP_ATTACKER;
;1666:				}
;1667:			}
;1668:			bs->teamtaskpreference &= ~TEAMTP_DEFENDER;
;1669:		}
;1670:		else {
;1671:			if (!(bs->teamtaskpreference & TEAMTP_DEFENDER)) {
;1672:				// if we have a bot team leader
;1673:				if (BotTeamLeader(bs)) {
;1674:					// tell the leader we want to be on defense
;1675:					BotVoiceChat(bs, -1, VOICECHAT_WANTONDEFENSE);
;1676:					//BotAI_BotInitialChat(bs, "wantdefence", NULL);
;1677:					//trap_BotEnterChat(bs->cs, leader, CHAT_TELL);
;1678:				}
;1679:				else if (g_spSkill.integer <= 3) {
;1680:					if ( bs->ltgtype != LTG_DEFENDKEYAREA ) {
;1681:						//
;1682:						if ((gametype != GT_CTF || (bs->redflagstatus == 0 && bs->blueflagstatus == 0)) &&
;1683:							(gametype != GT_1FCTF || bs->neutralflagstatus == 0) ) {
;1684:							// tell the leader we want to be on defense
;1685:							BotVoiceChat(bs, -1, VOICECHAT_WANTONDEFENSE);
;1686:							//BotAI_BotInitialChat(bs, "wantdefence", NULL);
;1687:							//trap_BotEnterChat(bs->cs, leader, CHAT_TELL);
;1688:						}
;1689:					}
;1690:				}
;1691:				bs->teamtaskpreference |= TEAMTP_DEFENDER;
;1692:			}
;1693:			bs->teamtaskpreference &= ~TEAMTP_ATTACKER;
;1694:		}
;1695:	}
;1696:#endif
;1697:}
LABELV $391
endproc BotCheckItemPickup 0 0
export BotUpdateInventory
proc BotUpdateInventory 1224 12
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
CNSTI4 212
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
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $394
ADDRLP4 1028
CNSTI4 1
ASGNI4
ADDRGP4 $395
JUMPV
LABELV $394
ADDRLP4 1028
CNSTI4 0
ASGNI4
LABELV $395
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
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $397
ADDRLP4 1036
CNSTI4 1
ASGNI4
ADDRGP4 $398
JUMPV
LABELV $397
ADDRLP4 1036
CNSTI4 0
ASGNI4
LABELV $398
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
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $400
ADDRLP4 1044
CNSTI4 1
ASGNI4
ADDRGP4 $401
JUMPV
LABELV $400
ADDRLP4 1044
CNSTI4 0
ASGNI4
LABELV $401
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
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $403
ADDRLP4 1052
CNSTI4 1
ASGNI4
ADDRGP4 $404
JUMPV
LABELV $403
ADDRLP4 1052
CNSTI4 0
ASGNI4
LABELV $404
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
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $406
ADDRLP4 1060
CNSTI4 1
ASGNI4
ADDRGP4 $407
JUMPV
LABELV $406
ADDRLP4 1060
CNSTI4 0
ASGNI4
LABELV $407
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
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $409
ADDRLP4 1068
CNSTI4 1
ASGNI4
ADDRGP4 $410
JUMPV
LABELV $409
ADDRLP4 1068
CNSTI4 0
ASGNI4
LABELV $410
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
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $412
ADDRLP4 1076
CNSTI4 1
ASGNI4
ADDRGP4 $413
JUMPV
LABELV $412
ADDRLP4 1076
CNSTI4 0
ASGNI4
LABELV $413
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
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $415
ADDRLP4 1084
CNSTI4 1
ASGNI4
ADDRGP4 $416
JUMPV
LABELV $415
ADDRLP4 1084
CNSTI4 0
ASGNI4
LABELV $416
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
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $418
ADDRLP4 1092
CNSTI4 1
ASGNI4
ADDRGP4 $419
JUMPV
LABELV $418
ADDRLP4 1092
CNSTI4 0
ASGNI4
LABELV $419
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
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $421
ADDRLP4 1100
CNSTI4 1
ASGNI4
ADDRGP4 $422
JUMPV
LABELV $421
ADDRLP4 1100
CNSTI4 0
ASGNI4
LABELV $422
ADDRLP4 1104
INDIRP4
CNSTI4 5008
ADDP4
ADDRLP4 1100
INDIRI4
ASGNI4
line 1727
;1721:#ifdef MISSIONPACK
;1722:	bs->inventory[INVENTORY_NAILGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_NAILGUN)) != 0;;
;1723:	bs->inventory[INVENTORY_PROXLAUNCHER] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_PROX_LAUNCHER)) != 0;;
;1724:	bs->inventory[INVENTORY_CHAINGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_CHAINGUN)) != 0;;
;1725:#endif
;1726:	//ammo
;1727:	bs->inventory[INVENTORY_SHELLS] = bs->cur_ps.ammo[WP_SHOTGUN];
ADDRLP4 1108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1108
INDIRP4
CNSTI4 5024
ADDP4
ADDRLP4 1108
INDIRP4
CNSTI4 404
ADDP4
INDIRI4
ASGNI4
line 1728
;1728:	bs->inventory[INVENTORY_BULLETS] = bs->cur_ps.ammo[WP_MACHINEGUN];
ADDRLP4 1112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1112
INDIRP4
CNSTI4 5028
ADDP4
ADDRLP4 1112
INDIRP4
CNSTI4 400
ADDP4
INDIRI4
ASGNI4
line 1729
;1729:	bs->inventory[INVENTORY_GRENADES] = bs->cur_ps.ammo[WP_GRENADE_LAUNCHER];
ADDRLP4 1116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1116
INDIRP4
CNSTI4 5032
ADDP4
ADDRLP4 1116
INDIRP4
CNSTI4 408
ADDP4
INDIRI4
ASGNI4
line 1730
;1730:	bs->inventory[INVENTORY_CELLS] = bs->cur_ps.ammo[WP_PLASMAGUN];
ADDRLP4 1120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1120
INDIRP4
CNSTI4 5036
ADDP4
ADDRLP4 1120
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
ASGNI4
line 1731
;1731:	bs->inventory[INVENTORY_LIGHTNINGAMMO] = bs->cur_ps.ammo[WP_LIGHTNING];
ADDRLP4 1124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1124
INDIRP4
CNSTI4 5040
ADDP4
ADDRLP4 1124
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
ASGNI4
line 1732
;1732:	bs->inventory[INVENTORY_ROCKETS] = bs->cur_ps.ammo[WP_ROCKET_LAUNCHER];
ADDRLP4 1128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
CNSTI4 5044
ADDP4
ADDRLP4 1128
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ASGNI4
line 1733
;1733:	bs->inventory[INVENTORY_SLUGS] = bs->cur_ps.ammo[WP_RAILGUN];
ADDRLP4 1132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1132
INDIRP4
CNSTI4 5048
ADDP4
ADDRLP4 1132
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ASGNI4
line 1734
;1734:	bs->inventory[INVENTORY_BFGAMMO] = bs->cur_ps.ammo[WP_BFG];
ADDRLP4 1136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1136
INDIRP4
CNSTI4 5052
ADDP4
ADDRLP4 1136
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
ASGNI4
line 1741
;1735:#ifdef MISSIONPACK
;1736:	bs->inventory[INVENTORY_NAILS] = bs->cur_ps.ammo[WP_NAILGUN];
;1737:	bs->inventory[INVENTORY_MINES] = bs->cur_ps.ammo[WP_PROX_LAUNCHER];
;1738:	bs->inventory[INVENTORY_BELT] = bs->cur_ps.ammo[WP_CHAINGUN];
;1739:#endif
;1740:	//powerups
;1741:	bs->inventory[INVENTORY_HEALTH] = bs->cur_ps.stats[STAT_HEALTH];
ADDRLP4 1140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140
INDIRP4
CNSTI4 5068
ADDP4
ADDRLP4 1140
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ASGNI4
line 1742
;1742:	bs->inventory[INVENTORY_TELEPORTER] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_TELEPORTER;
ADDRLP4 1148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1148
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 26
NEI4 $424
ADDRLP4 1144
CNSTI4 1
ASGNI4
ADDRGP4 $425
JUMPV
LABELV $424
ADDRLP4 1144
CNSTI4 0
ASGNI4
LABELV $425
ADDRLP4 1148
INDIRP4
CNSTI4 5072
ADDP4
ADDRLP4 1144
INDIRI4
ASGNI4
line 1743
;1743:	bs->inventory[INVENTORY_MEDKIT] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_MEDKIT;
ADDRLP4 1156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1156
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 27
NEI4 $427
ADDRLP4 1152
CNSTI4 1
ASGNI4
ADDRGP4 $428
JUMPV
LABELV $427
ADDRLP4 1152
CNSTI4 0
ASGNI4
LABELV $428
ADDRLP4 1156
INDIRP4
CNSTI4 5076
ADDP4
ADDRLP4 1152
INDIRI4
ASGNI4
line 1749
;1744:#ifdef MISSIONPACK
;1745:	bs->inventory[INVENTORY_KAMIKAZE] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_KAMIKAZE;
;1746:	bs->inventory[INVENTORY_PORTAL] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_PORTAL;
;1747:	bs->inventory[INVENTORY_INVULNERABILITY] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_INVULNERABILITY;
;1748:#endif
;1749:	bs->inventory[INVENTORY_QUAD] = bs->cur_ps.powerups[PW_QUAD] != 0;
ADDRLP4 1164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1164
INDIRP4
CNSTI4 332
ADDP4
INDIRI4
CNSTI4 0
EQI4 $430
ADDRLP4 1160
CNSTI4 1
ASGNI4
ADDRGP4 $431
JUMPV
LABELV $430
ADDRLP4 1160
CNSTI4 0
ASGNI4
LABELV $431
ADDRLP4 1164
INDIRP4
CNSTI4 5092
ADDP4
ADDRLP4 1160
INDIRI4
ASGNI4
line 1750
;1750:	bs->inventory[INVENTORY_ENVIRONMENTSUIT] = bs->cur_ps.powerups[PW_BATTLESUIT] != 0;
ADDRLP4 1172
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1172
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $433
ADDRLP4 1168
CNSTI4 1
ASGNI4
ADDRGP4 $434
JUMPV
LABELV $433
ADDRLP4 1168
CNSTI4 0
ASGNI4
LABELV $434
ADDRLP4 1172
INDIRP4
CNSTI4 5096
ADDP4
ADDRLP4 1168
INDIRI4
ASGNI4
line 1751
;1751:	bs->inventory[INVENTORY_HASTE] = bs->cur_ps.powerups[PW_HASTE] != 0;
ADDRLP4 1180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1180
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $436
ADDRLP4 1176
CNSTI4 1
ASGNI4
ADDRGP4 $437
JUMPV
LABELV $436
ADDRLP4 1176
CNSTI4 0
ASGNI4
LABELV $437
ADDRLP4 1180
INDIRP4
CNSTI4 5100
ADDP4
ADDRLP4 1176
INDIRI4
ASGNI4
line 1752
;1752:	bs->inventory[INVENTORY_INVISIBILITY] = bs->cur_ps.powerups[PW_INVIS] != 0;
ADDRLP4 1188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1188
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $439
ADDRLP4 1184
CNSTI4 1
ASGNI4
ADDRGP4 $440
JUMPV
LABELV $439
ADDRLP4 1184
CNSTI4 0
ASGNI4
LABELV $440
ADDRLP4 1188
INDIRP4
CNSTI4 5104
ADDP4
ADDRLP4 1184
INDIRI4
ASGNI4
line 1753
;1753:	bs->inventory[INVENTORY_REGEN] = bs->cur_ps.powerups[PW_REGEN] != 0;
ADDRLP4 1196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1196
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $442
ADDRLP4 1192
CNSTI4 1
ASGNI4
ADDRGP4 $443
JUMPV
LABELV $442
ADDRLP4 1192
CNSTI4 0
ASGNI4
LABELV $443
ADDRLP4 1196
INDIRP4
CNSTI4 5108
ADDP4
ADDRLP4 1192
INDIRI4
ASGNI4
line 1754
;1754:	bs->inventory[INVENTORY_FLIGHT] = bs->cur_ps.powerups[PW_FLIGHT] != 0;
ADDRLP4 1204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1204
INDIRP4
CNSTI4 352
ADDP4
INDIRI4
CNSTI4 0
EQI4 $445
ADDRLP4 1200
CNSTI4 1
ASGNI4
ADDRGP4 $446
JUMPV
LABELV $445
ADDRLP4 1200
CNSTI4 0
ASGNI4
LABELV $446
ADDRLP4 1204
INDIRP4
CNSTI4 5112
ADDP4
ADDRLP4 1200
INDIRI4
ASGNI4
line 1761
;1755:#ifdef MISSIONPACK
;1756:	bs->inventory[INVENTORY_SCOUT] = bs->cur_ps.stats[STAT_PERSISTANT_POWERUP] == MODELINDEX_SCOUT;
;1757:	bs->inventory[INVENTORY_GUARD] = bs->cur_ps.stats[STAT_PERSISTANT_POWERUP] == MODELINDEX_GUARD;
;1758:	bs->inventory[INVENTORY_DOUBLER] = bs->cur_ps.stats[STAT_PERSISTANT_POWERUP] == MODELINDEX_DOUBLER;
;1759:	bs->inventory[INVENTORY_AMMOREGEN] = bs->cur_ps.stats[STAT_PERSISTANT_POWERUP] == MODELINDEX_AMMOREGEN;
;1760:#endif
;1761:	bs->inventory[INVENTORY_REDFLAG] = bs->cur_ps.powerups[PW_REDFLAG] != 0;
ADDRLP4 1212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1212
INDIRP4
CNSTI4 356
ADDP4
INDIRI4
CNSTI4 0
EQI4 $448
ADDRLP4 1208
CNSTI4 1
ASGNI4
ADDRGP4 $449
JUMPV
LABELV $448
ADDRLP4 1208
CNSTI4 0
ASGNI4
LABELV $449
ADDRLP4 1212
INDIRP4
CNSTI4 5132
ADDP4
ADDRLP4 1208
INDIRI4
ASGNI4
line 1762
;1762:	bs->inventory[INVENTORY_BLUEFLAG] = bs->cur_ps.powerups[PW_BLUEFLAG] != 0;
ADDRLP4 1220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1220
INDIRP4
CNSTI4 360
ADDP4
INDIRI4
CNSTI4 0
EQI4 $451
ADDRLP4 1216
CNSTI4 1
ASGNI4
ADDRGP4 $452
JUMPV
LABELV $451
ADDRLP4 1216
CNSTI4 0
ASGNI4
LABELV $452
ADDRLP4 1220
INDIRP4
CNSTI4 5136
ADDP4
ADDRLP4 1216
INDIRI4
ASGNI4
line 1774
;1763:#ifdef MISSIONPACK
;1764:	bs->inventory[INVENTORY_NEUTRALFLAG] = bs->cur_ps.powerups[PW_NEUTRALFLAG] != 0;
;1765:	if (BotTeam(bs) == TEAM_RED) {
;1766:		bs->inventory[INVENTORY_REDCUBE] = bs->cur_ps.generic1;
;1767:		bs->inventory[INVENTORY_BLUECUBE] = 0;
;1768:	}
;1769:	else {
;1770:		bs->inventory[INVENTORY_REDCUBE] = 0;
;1771:		bs->inventory[INVENTORY_BLUECUBE] = bs->cur_ps.generic1;
;1772:	}
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
LABELV $392
endproc BotUpdateInventory 1224 12
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
LABELV $453
endproc BotUpdateBattleInventory 160 8
export BotBattleUseItems
proc BotBattleUseItems 4 4
line 2019
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
;1803:	int c, teammates, enemies;
;1804:	aas_entityinfo_t entinfo;
;1805:	vec3_t dir, target;
;1806:	bot_goal_t *goal;
;1807:	bsp_trace_t trace;
;1808:
;1809:	//if the bot has no kamikaze
;1810:	if (bs->inventory[INVENTORY_KAMIKAZE] <= 0)
;1811:		return;
;1812:	if (bs->kamikaze_time > FloatTime())
;1813:		return;
;1814:	bs->kamikaze_time = FloatTime() + 0.2;
;1815:	if (gametype == GT_CTF) {
;1816:		//never use kamikaze if the team flag carrier is visible
;1817:		if (BotCTFCarryingFlag(bs))
;1818:			return;
;1819:		c = BotTeamFlagCarrierVisible(bs);
;1820:		if (c >= 0) {
;1821:			BotEntityInfo(c, &entinfo);
;1822:			VectorSubtract(entinfo.origin, bs->origin, dir);
;1823:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST))
;1824:				return;
;1825:		}
;1826:		c = BotEnemyFlagCarrierVisible(bs);
;1827:		if (c >= 0) {
;1828:			BotEntityInfo(c, &entinfo);
;1829:			VectorSubtract(entinfo.origin, bs->origin, dir);
;1830:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST)) {
;1831:				trap_EA_Use(bs->client);
;1832:				return;
;1833:			}
;1834:		}
;1835:	}
;1836:	else if (gametype == GT_1FCTF) {
;1837:		//never use kamikaze if the team flag carrier is visible
;1838:		if (Bot1FCTFCarryingFlag(bs))
;1839:			return;
;1840:		c = BotTeamFlagCarrierVisible(bs);
;1841:		if (c >= 0) {
;1842:			BotEntityInfo(c, &entinfo);
;1843:			VectorSubtract(entinfo.origin, bs->origin, dir);
;1844:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST))
;1845:				return;
;1846:		}
;1847:		c = BotEnemyFlagCarrierVisible(bs);
;1848:		if (c >= 0) {
;1849:			BotEntityInfo(c, &entinfo);
;1850:			VectorSubtract(entinfo.origin, bs->origin, dir);
;1851:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST)) {
;1852:				trap_EA_Use(bs->client);
;1853:				return;
;1854:			}
;1855:		}
;1856:	}
;1857:	else if (gametype == GT_OBELISK) {
;1858:		switch(BotTeam(bs)) {
;1859:			case TEAM_RED: goal = &blueobelisk; break;
;1860:			default: goal = &redobelisk; break;
;1861:		}
;1862:		//if the obelisk is visible
;1863:		VectorCopy(goal->origin, target);
;1864:		target[2] += 1;
;1865:		VectorSubtract(bs->origin, target, dir);
;1866:		if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST * 0.9)) {
;1867:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
;1868:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
;1869:				trap_EA_Use(bs->client);
;1870:				return;
;1871:			}
;1872:		}
;1873:	}
;1874:	else if (gametype == GT_HARVESTER) {
;1875:		//
;1876:		if (BotHarvesterCarryingCubes(bs))
;1877:			return;
;1878:		//never use kamikaze if a team mate carrying cubes is visible
;1879:		c = BotTeamCubeCarrierVisible(bs);
;1880:		if (c >= 0) {
;1881:			BotEntityInfo(c, &entinfo);
;1882:			VectorSubtract(entinfo.origin, bs->origin, dir);
;1883:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST))
;1884:				return;
;1885:		}
;1886:		c = BotEnemyCubeCarrierVisible(bs);
;1887:		if (c >= 0) {
;1888:			BotEntityInfo(c, &entinfo);
;1889:			VectorSubtract(entinfo.origin, bs->origin, dir);
;1890:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST)) {
;1891:				trap_EA_Use(bs->client);
;1892:				return;
;1893:			}
;1894:		}
;1895:	}
;1896:	//
;1897:	BotVisibleTeamMatesAndEnemies(bs, &teammates, &enemies, KAMIKAZE_DIST);
;1898:	//
;1899:	if (enemies > 2 && enemies > teammates+1) {
;1900:		trap_EA_Use(bs->client);
;1901:		return;
;1902:	}
;1903:}
;1904:
;1905:/*
;1906:==================
;1907:BotUseInvulnerability
;1908:==================
;1909:*/
;1910:void BotUseInvulnerability(bot_state_t *bs) {
;1911:	int c;
;1912:	vec3_t dir, target;
;1913:	bot_goal_t *goal;
;1914:	bsp_trace_t trace;
;1915:
;1916:	//if the bot has no invulnerability
;1917:	if (bs->inventory[INVENTORY_INVULNERABILITY] <= 0)
;1918:		return;
;1919:	if (bs->invulnerability_time > FloatTime())
;1920:		return;
;1921:	bs->invulnerability_time = FloatTime() + 0.2;
;1922:	if (gametype == GT_CTF) {
;1923:		//never use kamikaze if the team flag carrier is visible
;1924:		if (BotCTFCarryingFlag(bs))
;1925:			return;
;1926:		c = BotEnemyFlagCarrierVisible(bs);
;1927:		if (c >= 0)
;1928:			return;
;1929:		//if near enemy flag and the flag is visible
;1930:		switch(BotTeam(bs)) {
;1931:			case TEAM_RED: goal = &ctf_blueflag; break;
;1932:			default: goal = &ctf_redflag; break;
;1933:		}
;1934:		//if the obelisk is visible
;1935:		VectorCopy(goal->origin, target);
;1936:		target[2] += 1;
;1937:		VectorSubtract(bs->origin, target, dir);
;1938:		if (VectorLengthSquared(dir) < Square(200)) {
;1939:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
;1940:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
;1941:				trap_EA_Use(bs->client);
;1942:				return;
;1943:			}
;1944:		}
;1945:	}
;1946:	else if (gametype == GT_1FCTF) {
;1947:		//never use kamikaze if the team flag carrier is visible
;1948:		if (Bot1FCTFCarryingFlag(bs))
;1949:			return;
;1950:		c = BotEnemyFlagCarrierVisible(bs);
;1951:		if (c >= 0)
;1952:			return;
;1953:		//if near enemy flag and the flag is visible
;1954:		switch(BotTeam(bs)) {
;1955:			case TEAM_RED: goal = &ctf_blueflag; break;
;1956:			default: goal = &ctf_redflag; break;
;1957:		}
;1958:		//if the obelisk is visible
;1959:		VectorCopy(goal->origin, target);
;1960:		target[2] += 1;
;1961:		VectorSubtract(bs->origin, target, dir);
;1962:		if (VectorLengthSquared(dir) < Square(200)) {
;1963:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
;1964:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
;1965:				trap_EA_Use(bs->client);
;1966:				return;
;1967:			}
;1968:		}
;1969:	}
;1970:	else if (gametype == GT_OBELISK) {
;1971:		switch(BotTeam(bs)) {
;1972:			case TEAM_RED: goal = &blueobelisk; break;
;1973:			default: goal = &redobelisk; break;
;1974:		}
;1975:		//if the obelisk is visible
;1976:		VectorCopy(goal->origin, target);
;1977:		target[2] += 1;
;1978:		VectorSubtract(bs->origin, target, dir);
;1979:		if (VectorLengthSquared(dir) < Square(300)) {
;1980:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
;1981:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
;1982:				trap_EA_Use(bs->client);
;1983:				return;
;1984:			}
;1985:		}
;1986:	}
;1987:	else if (gametype == GT_HARVESTER) {
;1988:		//
;1989:		if (BotHarvesterCarryingCubes(bs))
;1990:			return;
;1991:		c = BotEnemyCubeCarrierVisible(bs);
;1992:		if (c >= 0)
;1993:			return;
;1994:		//if near enemy base and enemy base is visible
;1995:		switch(BotTeam(bs)) {
;1996:			case TEAM_RED: goal = &blueobelisk; break;
;1997:			default: goal = &redobelisk; break;
;1998:		}
;1999:		//if the obelisk is visible
;2000:		VectorCopy(goal->origin, target);
;2001:		target[2] += 1;
;2002:		VectorSubtract(bs->origin, target, dir);
;2003:		if (VectorLengthSquared(dir) < Square(200)) {
;2004:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
;2005:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
;2006:				trap_EA_Use(bs->client);
;2007:				return;
;2008:			}
;2009:		}
;2010:	}
;2011:}
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
GEI4 $464
line 2021
;2021:		if (bs->inventory[INVENTORY_TELEPORTER] > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 5072
ADDP4
INDIRI4
CNSTI4 0
LEI4 $466
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
NEI4 $468
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
LABELV $468
line 2030
;2030:		}
LABELV $466
line 2031
;2031:	}
LABELV $464
line 2032
;2032:	if (bs->inventory[INVENTORY_HEALTH] < 60) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $470
line 2033
;2033:		if (bs->inventory[INVENTORY_MEDKIT] > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 5076
ADDP4
INDIRI4
CNSTI4 0
LEI4 $472
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
LABELV $472
line 2036
;2036:	}
LABELV $470
line 2041
;2037:#ifdef MISSIONPACK
;2038:	BotUseKamikaze(bs);
;2039:	BotUseInvulnerability(bs);
;2040:#endif
;2041:}
LABELV $463
endproc BotBattleUseItems 4 4
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
EQI4 $475
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
LABELV $475
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
LABELV $474
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
NEI4 $479
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $480
JUMPV
LABELV $479
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $480
ADDRLP4 0
INDIRI4
RETI4
LABELV $477
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
NEI4 $482
CNSTI4 1
RETI4
ADDRGP4 $481
JUMPV
LABELV $482
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
NEI4 $484
CNSTI4 1
RETI4
ADDRGP4 $481
JUMPV
LABELV $484
line 2074
;2074:	return qfalse;
CNSTI4 0
RETI4
LABELV $481
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
ADDRGP4 level+9140
INDIRI4
CNSTI4 0
EQI4 $487
CNSTI4 1
RETI4
ADDRGP4 $486
JUMPV
LABELV $487
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
EQI4 $493
ADDRLP4 4
INDIRI4
CNSTI4 5
NEI4 $491
LABELV $493
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $492
JUMPV
LABELV $491
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $492
ADDRLP4 0
INDIRI4
RETI4
LABELV $486
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
LABELV $494
endproc BotInLavaOrSlime 16 4
lit
align 4
LABELV $497
byte 4 3238002688
byte 4 3238002688
byte 4 3238002688
align 4
LABELV $498
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
ADDRGP4 $497
INDIRB
ASGNB 12
ADDRLP4 16
ADDRGP4 $498
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
NEU4 $499
line 2113
;2113:		BotAI_Print( PRT_WARNING, "BotCreateWayPoint: Out of waypoints\n" );
CNSTI4 2
ARGI4
ADDRGP4 $501
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 2114
;2114:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $496
JUMPV
LABELV $499
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
LABELV $496
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
ADDRGP4 $506
JUMPV
LABELV $503
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
NEI4 $507
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $502
JUMPV
LABELV $507
line 2138
;2138:	}
LABELV $504
line 2136
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ASGNP4
LABELV $506
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $503
line 2139
;2139:	return NULL;
CNSTP4 0
RETP4
LABELV $502
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
ADDRGP4 $513
JUMPV
LABELV $510
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
LABELV $511
line 2150
ADDRFP4 0
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $513
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $510
line 2155
;2155:}
LABELV $509
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
LABELV $515
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
LABELV $516
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
LTI4 $515
line 2170
;2170:}
LABELV $514
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
LTI4 $522
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $523
JUMPV
LABELV $522
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $523
ADDRLP4 0
INDIRI4
RETI4
LABELV $520
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
EQI4 $525
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
NEI4 $529
ADDRLP4 0
INDIRP4
CNSTI4 5752
ADDP4
INDIRI4
CNSTI4 80
GEI4 $527
LABELV $529
line 2191
;2191:			bs->inventory[ENEMY_HORIZONTAL_DIST] < 80) {
line 2192
;2192:			return 70;
CNSTF4 1116471296
RETF4
ADDRGP4 $524
JUMPV
LABELV $527
line 2194
;2193:		}
;2194:	}
LABELV $525
line 2196
;2195:	//if the enemy is located way higher than the bot
;2196:	if (bs->inventory[ENEMY_HEIGHT] > 200) return 0;
ADDRFP4 0
INDIRP4
CNSTI4 5756
ADDP4
INDIRI4
CNSTI4 200
LEI4 $530
CNSTF4 0
RETF4
ADDRGP4 $524
JUMPV
LABELV $530
line 2198
;2197:	//if the bot is very low on health
;2198:	if (bs->inventory[INVENTORY_HEALTH] < 60) return 0;
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $532
CNSTF4 0
RETF4
ADDRGP4 $524
JUMPV
LABELV $532
line 2200
;2199:	//if the bot is low on health
;2200:	if (bs->inventory[INVENTORY_HEALTH] < 80) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 80
GEI4 $534
line 2202
;2201:		//if the bot has insufficient armor
;2202:		if (bs->inventory[INVENTORY_ARMOR] < 40) return 0;
ADDRFP4 0
INDIRP4
CNSTI4 4956
ADDP4
INDIRI4
CNSTI4 40
GEI4 $536
CNSTF4 0
RETF4
ADDRGP4 $524
JUMPV
LABELV $536
line 2203
;2203:	}
LABELV $534
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
LEI4 $538
ADDRLP4 0
INDIRP4
CNSTI4 5052
ADDP4
INDIRI4
CNSTI4 7
LEI4 $538
line 2206
;2206:			bs->inventory[INVENTORY_BFGAMMO] > 7) return 100;
CNSTF4 1120403456
RETF4
ADDRGP4 $524
JUMPV
LABELV $538
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
LEI4 $540
ADDRLP4 4
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
CNSTI4 5
LEI4 $540
line 2209
;2209:			bs->inventory[INVENTORY_SLUGS] > 5) return 95;
CNSTF4 1119748096
RETF4
ADDRGP4 $524
JUMPV
LABELV $540
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
LEI4 $542
ADDRLP4 8
INDIRP4
CNSTI4 5040
ADDP4
INDIRI4
CNSTI4 50
LEI4 $542
line 2212
;2212:			bs->inventory[INVENTORY_LIGHTNINGAMMO] > 50) return 90;
CNSTF4 1119092736
RETF4
ADDRGP4 $524
JUMPV
LABELV $542
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
LEI4 $544
ADDRLP4 12
INDIRP4
CNSTI4 5044
ADDP4
INDIRI4
CNSTI4 5
LEI4 $544
line 2215
;2215:			bs->inventory[INVENTORY_ROCKETS] > 5) return 90;
CNSTF4 1119092736
RETF4
ADDRGP4 $524
JUMPV
LABELV $544
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
LEI4 $546
ADDRLP4 16
INDIRP4
CNSTI4 5036
ADDP4
INDIRI4
CNSTI4 40
LEI4 $546
line 2218
;2218:			bs->inventory[INVENTORY_CELLS] > 40) return 85;
CNSTF4 1118437376
RETF4
ADDRGP4 $524
JUMPV
LABELV $546
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
LEI4 $548
ADDRLP4 20
INDIRP4
CNSTI4 5032
ADDP4
INDIRI4
CNSTI4 10
LEI4 $548
line 2221
;2221:			bs->inventory[INVENTORY_GRENADES] > 10) return 80;
CNSTF4 1117782016
RETF4
ADDRGP4 $524
JUMPV
LABELV $548
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
LEI4 $550
ADDRLP4 24
INDIRP4
CNSTI4 5024
ADDP4
INDIRI4
CNSTI4 10
LEI4 $550
line 2224
;2224:			bs->inventory[INVENTORY_SHELLS] > 10) return 50;
CNSTF4 1112014848
RETF4
ADDRGP4 $524
JUMPV
LABELV $550
line 2226
;2225:	//otherwise the bot is not feeling too good
;2226:	return 0;
CNSTF4 0
RETF4
LABELV $524
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
NEI4 $553
line 2238
;2237:	
;2238:		if (bs->weaponnum == WP_GAUNTLET) {
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
CNSTI4 1
NEI4 $556
line 2239
;2239:			return 100;
CNSTF4 1120403456
RETF4
ADDRGP4 $552
JUMPV
LABELV $556
line 2241
;2240:		}
;2241:		if (bs->inventory[INVENTORY_HEALTH] < 40) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 40
GEI4 $558
line 2242
;2242:			return 100;
CNSTF4 1120403456
RETF4
ADDRGP4 $552
JUMPV
LABELV $558
line 2244
;2243:		}
;2244:		if (bs->weaponnum == WP_MACHINEGUN) {
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
CNSTI4 2
NEI4 $560
line 2245
;2245:			return 90;
CNSTF4 1119092736
RETF4
ADDRGP4 $552
JUMPV
LABELV $560
line 2247
;2246:		}
;2247:		if (bs->inventory[INVENTORY_HEALTH] < 60) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $562
line 2248
;2248:			return 80;
CNSTF4 1117782016
RETF4
ADDRGP4 $552
JUMPV
LABELV $562
line 2250
;2249:		}
;2250:	} // End Shafe
LABELV $553
line 2251
;2251:	return 0;
CNSTF4 0
RETF4
LABELV $552
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
NEI4 $565
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
EQI4 $567
line 2265
;2265:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $564
JUMPV
LABELV $567
line 2266
;2266:	}
LABELV $565
line 2292
;2267:#ifdef MISSIONPACK
;2268:	else if (gametype == GT_1FCTF) {
;2269:		//if carrying the flag then always retreat
;2270:		if (Bot1FCTFCarryingFlag(bs))
;2271:			return qtrue;
;2272:	}
;2273:	else if (gametype == GT_OBELISK) {
;2274:		//the bots should be dedicated to attacking the enemy obelisk
;2275:		if (bs->ltgtype == LTG_ATTACKENEMYBASE) {
;2276:			if (bs->enemy != redobelisk.entitynum ||
;2277:						bs->enemy != blueobelisk.entitynum) {
;2278:				return qtrue;
;2279:			}
;2280:		}
;2281:		if (BotFeelingBad(bs) > 50) {
;2282:			return qtrue;
;2283:		}
;2284:		return qfalse;
;2285:	}
;2286:	else if (gametype == GT_HARVESTER) {
;2287:		//if carrying cubes then always retreat
;2288:		if (BotHarvesterCarryingCubes(bs)) return qtrue;
;2289:	}
;2290:#endif
;2291:	//
;2292:	if (bs->enemy >= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 0
LTI4 $569
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
EQI4 $571
line 2296
;2296:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $564
JUMPV
LABELV $571
line 2297
;2297:	}
LABELV $569
line 2299
;2298:	//if the bot is getting the flag
;2299:	if (bs->ltgtype == LTG_GETFLAG)
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
NEI4 $573
line 2300
;2300:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $564
JUMPV
LABELV $573
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
GEF4 $575
line 2303
;2303:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $564
JUMPV
LABELV $575
line 2304
;2304:	return qfalse;
CNSTI4 0
RETI4
LABELV $564
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
NEI4 $578
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
EQI4 $580
line 2318
;2318:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $577
JUMPV
LABELV $580
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
EQI4 $582
line 2322
;2322:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $577
JUMPV
LABELV $582
line 2323
;2323:	}
LABELV $578
line 2350
;2324:#ifdef MISSIONPACK
;2325:	else if (gametype == GT_1FCTF) {
;2326:		//never chase if carrying the flag
;2327:		if (Bot1FCTFCarryingFlag(bs))
;2328:			return qfalse;
;2329:		//always chase if the enemy is carrying a flag
;2330:		BotEntityInfo(bs->enemy, &entinfo);
;2331:		if (EntityCarriesFlag(&entinfo))
;2332:			return qtrue;
;2333:	}
;2334:	else if (gametype == GT_OBELISK) {
;2335:		//the bots should be dedicated to attacking the enemy obelisk
;2336:		if (bs->ltgtype == LTG_ATTACKENEMYBASE) {
;2337:			if (bs->enemy != redobelisk.entitynum ||
;2338:						bs->enemy != blueobelisk.entitynum) {
;2339:				return qfalse;
;2340:			}
;2341:		}
;2342:	}
;2343:	else if (gametype == GT_HARVESTER) {
;2344:		//never chase if carrying cubes
;2345:		if (BotHarvesterCarryingCubes(bs))
;2346:			return qfalse;
;2347:	}
;2348:#endif
;2349:	//if the bot is getting the flag
;2350:	if (bs->ltgtype == LTG_GETFLAG)
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
NEI4 $584
line 2351
;2351:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $577
JUMPV
LABELV $584
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
LEF4 $586
line 2354
;2354:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $577
JUMPV
LABELV $586
line 2355
;2355:	return qfalse;
CNSTI4 0
RETI4
LABELV $577
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
LABELV $588
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
NEI4 $590
CNSTI4 0
RETI4
ADDRGP4 $589
JUMPV
LABELV $590
line 2379
;2377:	
;2378:	//if no rocket launcher
;2379:	if (bs->inventory[INVENTORY_ROCKETLAUNCHER] <= 0) 
ADDRFP4 0
INDIRP4
CNSTI4 4984
ADDP4
INDIRI4
CNSTI4 0
GTI4 $593
line 2380
;2380:	{
line 2382
;2381:		// Try Grenade here
;2382:		if (bs->inventory[INVENTORY_GRENADELAUNCHER] <= 0) 
ADDRFP4 0
INDIRP4
CNSTI4 4980
ADDP4
INDIRI4
CNSTI4 0
GTI4 $594
line 2383
;2383:		{
line 2384
;2384:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $589
JUMPV
line 2386
;2385:		}
;2386:	} 
LABELV $593
line 2388
;2387:	else 
;2388:	{
line 2390
;2389:		//if low on rockets
;2390:		if (bs->inventory[INVENTORY_ROCKETS] < 2) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 5044
ADDP4
INDIRI4
CNSTI4 2
GEI4 $597
CNSTI4 0
RETI4
ADDRGP4 $589
JUMPV
LABELV $597
line 2391
;2391:	}
LABELV $594
line 2395
;2392:	
;2393:	
;2394:	//never rocket jump with the Quad
;2395:	if (bs->inventory[INVENTORY_QUAD]) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 5092
ADDP4
INDIRI4
CNSTI4 0
EQI4 $599
CNSTI4 0
RETI4
ADDRGP4 $589
JUMPV
LABELV $599
line 2397
;2396:	//if low on health
;2397:	if (bs->inventory[INVENTORY_HEALTH] < 60) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $601
CNSTI4 0
RETI4
ADDRGP4 $589
JUMPV
LABELV $601
line 2399
;2398:	//if not full health
;2399:	if (bs->inventory[INVENTORY_HEALTH] < 70) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 70
GEI4 $603
line 2401
;2400:		//if the bot has insufficient armor
;2401:		if (bs->inventory[INVENTORY_ARMOR] < 10) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 4956
ADDP4
INDIRI4
CNSTI4 10
GEI4 $605
CNSTI4 0
RETI4
ADDRGP4 $589
JUMPV
LABELV $605
line 2402
;2402:	}
LABELV $603
line 2403
;2403:	rocketjumper = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_WEAPONJUMPING, 0, 1);
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
line 2404
;2404:	if (rocketjumper < 0.5) return qfalse;
ADDRLP4 0
INDIRF4
CNSTF4 1056964608
GEF4 $607
CNSTI4 0
RETI4
ADDRGP4 $589
JUMPV
LABELV $607
line 2405
;2405:	return qtrue;
CNSTI4 1
RETI4
LABELV $589
endproc BotCanAndWantsToRocketJump 8 16
export BotHasPersistantPowerupAndWeapon
proc BotHasPersistantPowerupAndWeapon 32 0
line 2413
;2406:}
;2407:
;2408:/*
;2409:==================
;2410:BotHasPersistantPowerupAndWeapon
;2411:==================
;2412:*/
;2413:int BotHasPersistantPowerupAndWeapon(bot_state_t *bs) {
line 2424
;2414:#ifdef MISSIONPACK
;2415:	// if the bot does not have a persistant powerup
;2416:	if (!bs->inventory[INVENTORY_SCOUT] &&
;2417:		!bs->inventory[INVENTORY_GUARD] &&
;2418:		!bs->inventory[INVENTORY_DOUBLER] &&
;2419:		!bs->inventory[INVENTORY_AMMOREGEN] ) {
;2420:		return qfalse;
;2421:	}
;2422:#endif
;2423:	//if the bot is very low on health
;2424:	if (bs->inventory[INVENTORY_HEALTH] < 60) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $610
CNSTI4 0
RETI4
ADDRGP4 $609
JUMPV
LABELV $610
line 2426
;2425:	//if the bot is low on health
;2426:	if (bs->inventory[INVENTORY_HEALTH] < 80) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 80
GEI4 $612
line 2428
;2427:		//if the bot has insufficient armor
;2428:		if (bs->inventory[INVENTORY_ARMOR] < 40) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 4956
ADDP4
INDIRI4
CNSTI4 40
GEI4 $614
CNSTI4 0
RETI4
ADDRGP4 $609
JUMPV
LABELV $614
line 2429
;2429:	}
LABELV $612
line 2431
;2430:	//if the bot can use the bfg
;2431:	if (bs->inventory[INVENTORY_BFG10K] > 0 &&
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
LEI4 $616
ADDRLP4 0
INDIRP4
CNSTI4 5052
ADDP4
INDIRI4
CNSTI4 7
LEI4 $616
line 2432
;2432:			bs->inventory[INVENTORY_BFGAMMO] > 7) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $609
JUMPV
LABELV $616
line 2434
;2433:	//if the bot can use the railgun
;2434:	if (bs->inventory[INVENTORY_RAILGUN] > 0 &&
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
LEI4 $618
ADDRLP4 4
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
CNSTI4 5
LEI4 $618
line 2435
;2435:			bs->inventory[INVENTORY_SLUGS] > 5) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $609
JUMPV
LABELV $618
line 2437
;2436:	//if the bot can use the lightning gun
;2437:	if (bs->inventory[INVENTORY_LIGHTNING] > 0 &&
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
LEI4 $620
ADDRLP4 8
INDIRP4
CNSTI4 5040
ADDP4
INDIRI4
CNSTI4 50
LEI4 $620
line 2438
;2438:			bs->inventory[INVENTORY_LIGHTNINGAMMO] > 50) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $609
JUMPV
LABELV $620
line 2440
;2439:	//if the bot can use the rocketlauncher
;2440:	if (bs->inventory[INVENTORY_ROCKETLAUNCHER] > 0 &&
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
LEI4 $622
ADDRLP4 12
INDIRP4
CNSTI4 5044
ADDP4
INDIRI4
CNSTI4 5
LEI4 $622
line 2441
;2441:			bs->inventory[INVENTORY_ROCKETS] > 5) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $609
JUMPV
LABELV $622
line 2443
;2442:	//
;2443:	if (bs->inventory[INVENTORY_NAILGUN] > 0 &&
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 5012
ADDP4
INDIRI4
CNSTI4 0
LEI4 $624
ADDRLP4 16
INDIRP4
CNSTI4 5056
ADDP4
INDIRI4
CNSTI4 5
LEI4 $624
line 2444
;2444:			bs->inventory[INVENTORY_NAILS] > 5) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $609
JUMPV
LABELV $624
line 2446
;2445:	//
;2446:	if (bs->inventory[INVENTORY_PROXLAUNCHER] > 0 &&
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 5016
ADDP4
INDIRI4
CNSTI4 0
LEI4 $626
ADDRLP4 20
INDIRP4
CNSTI4 5060
ADDP4
INDIRI4
CNSTI4 5
LEI4 $626
line 2447
;2447:			bs->inventory[INVENTORY_MINES] > 5) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $609
JUMPV
LABELV $626
line 2449
;2448:	//
;2449:	if (bs->inventory[INVENTORY_CHAINGUN] > 0 &&
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 5020
ADDP4
INDIRI4
CNSTI4 0
LEI4 $628
ADDRLP4 24
INDIRP4
CNSTI4 5064
ADDP4
INDIRI4
CNSTI4 40
LEI4 $628
line 2450
;2450:			bs->inventory[INVENTORY_BELT] > 40) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $609
JUMPV
LABELV $628
line 2452
;2451:	//if the bot can use the plasmagun
;2452:	if (bs->inventory[INVENTORY_PLASMAGUN] > 0 &&
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 4996
ADDP4
INDIRI4
CNSTI4 0
LEI4 $630
ADDRLP4 28
INDIRP4
CNSTI4 5036
ADDP4
INDIRI4
CNSTI4 20
LEI4 $630
line 2453
;2453:			bs->inventory[INVENTORY_CELLS] > 20) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $609
JUMPV
LABELV $630
line 2454
;2454:	return qfalse;
CNSTI4 0
RETI4
LABELV $609
endproc BotHasPersistantPowerupAndWeapon 32 0
export BotGoCamp
proc BotGoCamp 16 16
line 2462
;2455:}
;2456:
;2457:/*
;2458:==================
;2459:BotGoCamp
;2460:==================
;2461:*/
;2462:void BotGoCamp(bot_state_t *bs, bot_goal_t *goal) {
line 2465
;2463:	float camper;
;2464:
;2465:	bs->decisionmaker = bs->client;
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
line 2467
;2466:	//set message time to zero so bot will NOT show any message
;2467:	bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 2469
;2468:	//set the ltg type
;2469:	bs->ltgtype = LTG_CAMP;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 7
ASGNI4
line 2471
;2470:	//set the team goal
;2471:	memcpy(&bs->teamgoal, goal, sizeof(bot_goal_t));
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
line 2473
;2472:	//get the team goal time
;2473:	camper = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CAMPER, 0, 1);
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
line 2474
;2474:	if (camper > 0.99) bs->teamgoal_time = FloatTime() + 99999;
ADDRLP4 0
INDIRF4
CNSTF4 1065185444
LEF4 $633
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1203982208
ADDF4
ASGNF4
ADDRGP4 $634
JUMPV
LABELV $633
line 2475
;2475:	else bs->teamgoal_time = FloatTime() + 120 + 180 * camper + random() * 15;
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
LABELV $634
line 2477
;2476:	//set the last time the bot started camping
;2477:	bs->camp_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6184
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2479
;2478:	//the teammate that requested the camping
;2479:	bs->teammate = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
CNSTI4 0
ASGNI4
line 2481
;2480:	//do NOT type arrive message
;2481:	bs->arrive_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
CNSTF4 1065353216
ASGNF4
line 2482
;2482:}
LABELV $632
endproc BotGoCamp 16 16
export BotWantsToCamp
proc BotWantsToCamp 176 16
line 2489
;2483:
;2484:/*
;2485:==================
;2486:BotWantsToCamp
;2487:==================
;2488:*/
;2489:int BotWantsToCamp(bot_state_t *bs) {
line 2494
;2490:	float camper;
;2491:	int cs, traveltime, besttraveltime;
;2492:	bot_goal_t goal, bestgoal;
;2493:
;2494:	camper = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CAMPER, 0, 1);
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
line 2495
;2495:	if (camper < 0.1) return qfalse;
ADDRLP4 124
INDIRF4
CNSTF4 1036831949
GEF4 $636
CNSTI4 0
RETI4
ADDRGP4 $635
JUMPV
LABELV $636
line 2497
;2496:	//if the bot has a team goal
;2497:	if (bs->ltgtype == LTG_TEAMHELP ||
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
EQI4 $646
ADDRLP4 132
INDIRI4
CNSTI4 2
EQI4 $646
ADDRLP4 132
INDIRI4
CNSTI4 3
EQI4 $646
ADDRLP4 132
INDIRI4
CNSTI4 4
EQI4 $646
ADDRLP4 132
INDIRI4
CNSTI4 5
EQI4 $646
ADDRLP4 132
INDIRI4
CNSTI4 7
EQI4 $646
ADDRLP4 132
INDIRI4
CNSTI4 8
EQI4 $646
ADDRLP4 132
INDIRI4
CNSTI4 9
NEI4 $638
LABELV $646
line 2504
;2498:			bs->ltgtype == LTG_TEAMACCOMPANY ||
;2499:			bs->ltgtype == LTG_DEFENDKEYAREA ||
;2500:			bs->ltgtype == LTG_GETFLAG ||
;2501:			bs->ltgtype == LTG_RUSHBASE ||
;2502:			bs->ltgtype == LTG_CAMP ||
;2503:			bs->ltgtype == LTG_CAMPORDER ||
;2504:			bs->ltgtype == LTG_PATROL) {
line 2505
;2505:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $635
JUMPV
LABELV $638
line 2508
;2506:	}
;2507:	//if camped recently
;2508:	if (bs->camp_time > FloatTime() - 60 + 300 * (1-camper)) return qfalse;
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
LEF4 $647
CNSTI4 0
RETI4
ADDRGP4 $635
JUMPV
LABELV $647
line 2510
;2509:	//
;2510:	if (random() > camper) {
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
LEF4 $649
line 2511
;2511:		bs->camp_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6184
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2512
;2512:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $635
JUMPV
LABELV $649
line 2515
;2513:	}
;2514:	//if the bot isn't healthy anough
;2515:	if (BotAggression(bs) < 50) return qfalse;
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
GEF4 $651
CNSTI4 0
RETI4
ADDRGP4 $635
JUMPV
LABELV $651
line 2517
;2516:	//the bot should have at least have the rocket launcher, the railgun or the bfg10k with some ammo
;2517:	if ((bs->inventory[INVENTORY_ROCKETLAUNCHER] <= 0 || bs->inventory[INVENTORY_ROCKETS < 10]) &&
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
LEI4 $655
ADDRLP4 144
INDIRP4
CNSTI4 4952
ADDP4
INDIRI4
ADDRLP4 148
INDIRI4
EQI4 $653
LABELV $655
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
LEI4 $656
ADDRLP4 152
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
CNSTI4 10
GEI4 $653
LABELV $656
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
LEI4 $657
ADDRLP4 156
INDIRP4
CNSTI4 5052
ADDP4
INDIRI4
CNSTI4 10
GEI4 $653
LABELV $657
line 2519
;2518:		(bs->inventory[INVENTORY_RAILGUN] <= 0 || bs->inventory[INVENTORY_SLUGS] < 10) &&
;2519:		(bs->inventory[INVENTORY_BFG10K] <= 0 || bs->inventory[INVENTORY_BFGAMMO] < 10)) {
line 2520
;2520:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $635
JUMPV
LABELV $653
line 2523
;2521:	}
;2522:	//find the closest camp spot
;2523:	besttraveltime = 99999;
ADDRLP4 64
CNSTI4 99999
ASGNI4
line 2524
;2524:	for (cs = trap_BotGetNextCampSpotGoal(0, &goal); cs; cs = trap_BotGetNextCampSpotGoal(cs, &goal)) {
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
ADDRGP4 $661
JUMPV
LABELV $658
line 2525
;2525:		traveltime = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, goal.areanum, TFL_DEFAULT);
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
line 2526
;2526:		if (traveltime && traveltime < besttraveltime) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $663
ADDRLP4 0
INDIRI4
ADDRLP4 64
INDIRI4
GEI4 $663
line 2527
;2527:			besttraveltime = traveltime;
ADDRLP4 64
ADDRLP4 0
INDIRI4
ASGNI4
line 2528
;2528:			memcpy(&bestgoal, &goal, sizeof(bot_goal_t));
ADDRLP4 68
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2529
;2529:		}
LABELV $663
line 2530
;2530:	}
LABELV $659
line 2524
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
LABELV $661
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $658
line 2531
;2531:	if (besttraveltime > 150) return qfalse;
ADDRLP4 64
INDIRI4
CNSTI4 150
LEI4 $665
CNSTI4 0
RETI4
ADDRGP4 $635
JUMPV
LABELV $665
line 2533
;2532:	//ok found a camp spot, go camp there
;2533:	BotGoCamp(bs, &bestgoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 BotGoCamp
CALLV
pop
line 2534
;2534:	bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 2536
;2535:	//
;2536:	return qtrue;
CNSTI4 1
RETI4
LABELV $635
endproc BotWantsToCamp 176 16
export BotDontAvoid
proc BotDontAvoid 68 12
line 2544
;2537:}
;2538:
;2539:/*
;2540:==================
;2541:BotDontAvoid
;2542:==================
;2543:*/
;2544:void BotDontAvoid(bot_state_t *bs, char *itemname) {
line 2548
;2545:	bot_goal_t goal;
;2546:	int num;
;2547:
;2548:	num = trap_BotGetLevelItemGoal(-1, itemname, &goal);
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
ADDRGP4 $669
JUMPV
LABELV $668
line 2549
;2549:	while(num >= 0) {
line 2550
;2550:		trap_BotRemoveFromAvoidGoals(bs->gs, goal.number);
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
line 2551
;2551:		num = trap_BotGetLevelItemGoal(num, itemname, &goal);
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
line 2552
;2552:	}
LABELV $669
line 2549
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $668
line 2553
;2553:}
LABELV $667
endproc BotDontAvoid 68 12
export BotGoForPowerups
proc BotGoForPowerups 0 8
line 2560
;2554:
;2555:/*
;2556:==================
;2557:BotGoForPowerups
;2558:==================
;2559:*/
;2560:void BotGoForPowerups(bot_state_t *bs) {
line 2563
;2561:
;2562:	//don't avoid any of the powerups anymore
;2563:	BotDontAvoid(bs, "Quad Damage");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $673
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2564
;2564:	BotDontAvoid(bs, "Regeneration");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $674
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2565
;2565:	BotDontAvoid(bs, "Battle Suit");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $675
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2566
;2566:	BotDontAvoid(bs, "Speed");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $676
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2567
;2567:	BotDontAvoid(bs, "Invisibility");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $677
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2568
;2568:	BotDontAvoid(bs, "Flight"); // Not sure about this one
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $678
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2571
;2569:	//reset the long term goal time so the bot will go for the powerup
;2570:	//NOTE: the long term goal type doesn't change
;2571:	bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6068
ADDP4
CNSTF4 0
ASGNF4
line 2572
;2572:}
LABELV $672
endproc BotGoForPowerups 0 8
export BotRoamGoal
proc BotRoamGoal 180 28
line 2579
;2573:
;2574:/*
;2575:==================
;2576:BotRoamGoal
;2577:==================
;2578:*/
;2579:void BotRoamGoal(bot_state_t *bs, vec3_t goal) {
line 2585
;2580:	int pc, i;
;2581:	float len, rnd;
;2582:	vec3_t dir, bestorg, belowbestorg;
;2583:	bsp_trace_t trace;
;2584:
;2585:	for (i = 0; i < 10; i++) {
ADDRLP4 116
CNSTI4 0
ASGNI4
LABELV $680
line 2587
;2586:		//start at the bot origin
;2587:		VectorCopy(bs->origin, bestorg);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 2588
;2588:		rnd = random();
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
line 2589
;2589:		if (rnd > 0.25) {
ADDRLP4 112
INDIRF4
CNSTF4 1048576000
LEF4 $684
line 2591
;2590:			//add a random value to the x-coordinate
;2591:			if (random() < 0.5) bestorg[0] -= 800 * random() + 100;
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
GEF4 $686
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
ADDRGP4 $687
JUMPV
LABELV $686
line 2592
;2592:			else bestorg[0] += 800 * random() + 100;
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
LABELV $687
line 2593
;2593:		}
LABELV $684
line 2594
;2594:		if (rnd < 0.75) {
ADDRLP4 112
INDIRF4
CNSTF4 1061158912
GEF4 $688
line 2596
;2595:			//add a random value to the y-coordinate
;2596:			if (random() < 0.5) bestorg[1] -= 800 * random() + 100;
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
GEF4 $690
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
ADDRGP4 $691
JUMPV
LABELV $690
line 2597
;2597:			else bestorg[1] += 800 * random() + 100;
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
LABELV $691
line 2598
;2598:		}
LABELV $688
line 2600
;2599:		//add a random value to the z-coordinate (NOTE: 48 = maxjump?)
;2600:		bestorg[2] += 2 * 48 * crandom();
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
line 2602
;2601:		//trace a line from the origin to the roam target
;2602:		BotAI_Trace(&trace, bs->origin, NULL, NULL, bestorg, bs->entitynum, MASK_SOLID);
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
line 2604
;2603:		//direction and length towards the roam target
;2604:		VectorSubtract(trace.endpos, bs->origin, dir);
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
line 2605
;2605:		len = VectorNormalize(dir);
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
line 2607
;2606:		//if the roam target is far away anough
;2607:		if (len > 200) {
ADDRLP4 108
INDIRF4
CNSTF4 1128792064
LEF4 $702
line 2609
;2608:			//the roam target is in the given direction before walls
;2609:			VectorScale(dir, len * trace.fraction - 40, dir);
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
line 2610
;2610:			VectorAdd(bs->origin, dir, bestorg);
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
line 2612
;2611:			//get the coordinates of the floor below the roam target
;2612:			belowbestorg[0] = bestorg[0];
ADDRLP4 120
ADDRLP4 12
INDIRF4
ASGNF4
line 2613
;2613:			belowbestorg[1] = bestorg[1];
ADDRLP4 120+4
ADDRLP4 12+4
INDIRF4
ASGNF4
line 2614
;2614:			belowbestorg[2] = bestorg[2] - 800;
ADDRLP4 120+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1145569280
SUBF4
ASGNF4
line 2615
;2615:			BotAI_Trace(&trace, bestorg, NULL, NULL, belowbestorg, bs->entitynum, MASK_SOLID);
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
line 2617
;2616:			//
;2617:			if (!trace.startsolid) {
ADDRLP4 24+4
INDIRI4
CNSTI4 0
NEI4 $719
line 2618
;2618:				trace.endpos[2]++;
ADDRLP4 24+12+8
ADDRLP4 24+12+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2619
;2619:				pc = trap_PointContents(trace.endpos, bs->entitynum);
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
line 2620
;2620:				if (!(pc & (CONTENTS_LAVA | CONTENTS_SLIME))) {
ADDRLP4 132
INDIRI4
CNSTI4 24
BANDI4
CNSTI4 0
NEI4 $725
line 2621
;2621:					VectorCopy(bestorg, goal);
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRB
ASGNB 12
line 2622
;2622:					return;
ADDRGP4 $679
JUMPV
LABELV $725
line 2624
;2623:				}
;2624:			}
LABELV $719
line 2625
;2625:		}
LABELV $702
line 2626
;2626:	}
LABELV $681
line 2585
ADDRLP4 116
ADDRLP4 116
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 10
LTI4 $680
line 2627
;2627:	VectorCopy(bestorg, goal);
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRB
ASGNB 12
line 2628
;2628:}
LABELV $679
endproc BotRoamGoal 180 28
lit
align 4
LABELV $729
byte 4 0
byte 4 0
byte 4 1065353216
export BotAttackMove
code
proc BotAttackMove 392 16
line 2635
;2629:
;2630:/*
;2631:==================
;2632:BotAttackMove
;2633:==================
;2634:*/
;2635:bot_moveresult_t BotAttackMove(bot_state_t *bs, int tfl) {
line 2639
;2636:	int movetype, i, attackentity;
;2637:	float attack_skill, jumper, croucher, dist, strafechange_time;
;2638:	float attack_dist, attack_range;
;2639:	vec3_t forward, backward, sideward, hordir, up = {0, 0, 1};
ADDRLP4 56
ADDRGP4 $729
INDIRB
ASGNB 12
line 2644
;2640:	aas_entityinfo_t entinfo;
;2641:	bot_moveresult_t moveresult;
;2642:	bot_goal_t goal;
;2643:
;2644:	attackentity = bs->enemy;
ADDRLP4 332
ADDRFP4 4
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ASGNI4
line 2646
;2645:	//
;2646:	if (bs->attackchase_time > FloatTime()) {
ADDRFP4 4
INDIRP4
CNSTI4 6124
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $730
line 2648
;2647:		//create the chase goal
;2648:		goal.entitynum = attackentity;
ADDRLP4 136+40
ADDRLP4 332
INDIRI4
ASGNI4
line 2649
;2649:		goal.areanum = bs->lastenemyareanum;
ADDRLP4 136+12
ADDRFP4 4
INDIRP4
CNSTI4 6544
ADDP4
INDIRI4
ASGNI4
line 2650
;2650:		VectorCopy(bs->lastenemyorigin, goal.origin);
ADDRLP4 136
ADDRFP4 4
INDIRP4
CNSTI4 6548
ADDP4
INDIRB
ASGNB 12
line 2651
;2651:		VectorSet(goal.mins, -8, -8, -8);
ADDRLP4 136+16
CNSTF4 3238002688
ASGNF4
ADDRLP4 136+16+4
CNSTF4 3238002688
ASGNF4
ADDRLP4 136+16+8
CNSTF4 3238002688
ASGNF4
line 2652
;2652:		VectorSet(goal.maxs, 8, 8, 8);
ADDRLP4 136+28
CNSTF4 1090519040
ASGNF4
ADDRLP4 136+28+4
CNSTF4 1090519040
ASGNF4
ADDRLP4 136+28+8
CNSTF4 1090519040
ASGNF4
line 2654
;2653:		//initialize the movement state
;2654:		BotSetupForMovement(bs);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 2656
;2655:		//move towards the goal
;2656:		trap_BotMoveToGoal(&moveresult, bs->ms, &goal, tfl);
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
line 2657
;2657:		return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $727
JUMPV
LABELV $730
line 2660
;2658:	}
;2659:	//
;2660:	memset(&moveresult, 0, sizeof(bot_moveresult_t));
ADDRLP4 80
ARGP4
CNSTI4 0
ARGI4
CNSTI4 52
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2662
;2661:	//
;2662:	attack_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_ATTACK_SKILL, 0, 1);
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
line 2663
;2663:	jumper = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_JUMPER, 0, 1);
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
line 2664
;2664:	croucher = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CROUCHER, 0, 1);
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
line 2666
;2665:	//if the bot is really stupid
;2666:	if (attack_skill < 0.2) return moveresult;
ADDRLP4 132
INDIRF4
CNSTF4 1045220557
GEF4 $744
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $727
JUMPV
LABELV $744
line 2668
;2667:	//initialize the movement state
;2668:	BotSetupForMovement(bs);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 2670
;2669:	//get the enemy entity info
;2670:	BotEntityInfo(attackentity, &entinfo);
ADDRLP4 332
INDIRI4
ARGI4
ADDRLP4 192
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2672
;2671:	//direction towards the enemy
;2672:	VectorSubtract(entinfo.origin, bs->origin, forward);
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
line 2674
;2673:	//the distance towards the enemy
;2674:	dist = VectorNormalize(forward);
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
line 2675
;2675:	VectorNegate(forward, backward);
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
line 2677
;2676:	//walk, crouch or jump
;2677:	movetype = MOVE_WALK;
ADDRLP4 52
CNSTI4 1
ASGNI4
line 2679
;2678:	//
;2679:	if (bs->attackcrouch_time < FloatTime() - 1) {
ADDRFP4 4
INDIRP4
CNSTI4 6120
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
GEF4 $757
line 2680
;2680:		if (random() < jumper) {
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
GEF4 $759
line 2681
;2681:			movetype = MOVE_JUMP;
ADDRLP4 52
CNSTI4 4
ASGNI4
line 2682
;2682:		}
ADDRGP4 $760
JUMPV
LABELV $759
line 2684
;2683:		//wait at least one second before crouching again
;2684:		else if (bs->attackcrouch_time < FloatTime() - 1 && random() < croucher) {
ADDRFP4 4
INDIRP4
CNSTI4 6120
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
GEF4 $761
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
GEF4 $761
line 2685
;2685:			bs->attackcrouch_time = FloatTime() + croucher * 5;
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
line 2686
;2686:		}
LABELV $761
LABELV $760
line 2687
;2687:	}
LABELV $757
line 2688
;2688:	if (bs->attackcrouch_time > FloatTime()) movetype = MOVE_CROUCH;
ADDRFP4 4
INDIRP4
CNSTI4 6120
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $763
ADDRLP4 52
CNSTI4 2
ASGNI4
LABELV $763
line 2690
;2689:	//if the bot should jump
;2690:	if (movetype == MOVE_JUMP) {
ADDRLP4 52
INDIRI4
CNSTI4 4
NEI4 $765
line 2692
;2691:		//if jumped last frame
;2692:		if (bs->attackjump_time > FloatTime()) {
ADDRFP4 4
INDIRP4
CNSTI4 6128
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $767
line 2693
;2693:			movetype = MOVE_WALK;
ADDRLP4 52
CNSTI4 1
ASGNI4
line 2694
;2694:		}
ADDRGP4 $768
JUMPV
LABELV $767
line 2695
;2695:		else {
line 2696
;2696:			bs->attackjump_time = FloatTime() + 1;
ADDRFP4 4
INDIRP4
CNSTI4 6128
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2697
;2697:		}
LABELV $768
line 2698
;2698:	}
LABELV $765
line 2699
;2699:	if (bs->cur_ps.weapon == WP_GAUNTLET) {
ADDRFP4 4
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 1
NEI4 $769
line 2700
;2700:		attack_dist = 0;
ADDRLP4 72
CNSTF4 0
ASGNF4
line 2701
;2701:		attack_range = 0;
ADDRLP4 76
CNSTF4 0
ASGNF4
line 2702
;2702:	}
ADDRGP4 $770
JUMPV
LABELV $769
line 2703
;2703:	else {
line 2704
;2704:		attack_dist = IDEAL_ATTACKDIST;
ADDRLP4 72
CNSTF4 1124859904
ASGNF4
line 2705
;2705:		attack_range = 40;
ADDRLP4 76
CNSTF4 1109393408
ASGNF4
line 2706
;2706:	}
LABELV $770
line 2708
;2707:	//if the bot is stupid
;2708:	if (attack_skill <= 0.4) {
ADDRLP4 132
INDIRF4
CNSTF4 1053609165
GTF4 $771
line 2710
;2709:		//just walk to or away from the enemy
;2710:		if (dist > attack_dist + attack_range) {
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
LEF4 $773
line 2711
;2711:			if (trap_BotMoveInDirection(bs->ms, forward, 400, movetype)) return moveresult;
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
EQI4 $775
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $727
JUMPV
LABELV $775
line 2712
;2712:		}
LABELV $773
line 2713
;2713:		if (dist < attack_dist - attack_range) {
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRF4
SUBF4
GEF4 $777
line 2714
;2714:			if (trap_BotMoveInDirection(bs->ms, backward, 400, movetype)) return moveresult;
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
EQI4 $779
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $727
JUMPV
LABELV $779
line 2715
;2715:		}
LABELV $777
line 2716
;2716:		return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $727
JUMPV
LABELV $771
line 2719
;2717:	}
;2718:	//increase the strafe time
;2719:	bs->attackstrafe_time += bs->thinktime;
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
line 2721
;2720:	//get the strafe change time
;2721:	strafechange_time = 0.4 + (1 - attack_skill) * 0.2;
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
line 2722
;2722:	if (attack_skill > 0.7) strafechange_time += crandom() * 0.2;
ADDRLP4 132
INDIRF4
CNSTF4 1060320051
LEF4 $781
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
LABELV $781
line 2724
;2723:	//if the strafe direction should be changed
;2724:	if (bs->attackstrafe_time > strafechange_time) {
ADDRFP4 4
INDIRP4
CNSTI4 6116
ADDP4
INDIRF4
ADDRLP4 336
INDIRF4
LEF4 $783
line 2726
;2725:		//some magic number :)
;2726:		if (random() > 0.935) {
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
LEF4 $785
line 2728
;2727:			//flip the strafe direction
;2728:			bs->flags ^= BFL_STRAFERIGHT;
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
line 2729
;2729:			bs->attackstrafe_time = 0;
ADDRFP4 4
INDIRP4
CNSTI4 6116
ADDP4
CNSTF4 0
ASGNF4
line 2730
;2730:		}
LABELV $785
line 2731
;2731:	}
LABELV $783
line 2733
;2732:	//
;2733:	for (i = 0; i < 2; i++) {
ADDRLP4 48
CNSTI4 0
ASGNI4
LABELV $787
line 2734
;2734:		hordir[0] = forward[0];
ADDRLP4 12
ADDRLP4 24
INDIRF4
ASGNF4
line 2735
;2735:		hordir[1] = forward[1];
ADDRLP4 12+4
ADDRLP4 24+4
INDIRF4
ASGNF4
line 2736
;2736:		hordir[2] = 0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 2737
;2737:		VectorNormalize(hordir);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2739
;2738:		//get the sideward vector
;2739:		CrossProduct(hordir, up, sideward);
ADDRLP4 12
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 2741
;2740:		//reverse the vector depending on the strafe direction
;2741:		if (bs->flags & BFL_STRAFERIGHT) VectorNegate(sideward, sideward);
ADDRFP4 4
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $794
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
LABELV $794
line 2743
;2742:		//randomly go back a little
;2743:		if (random() > 0.9) {
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
LEF4 $800
line 2744
;2744:			VectorAdd(sideward, backward, sideward);
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
line 2745
;2745:		}
ADDRGP4 $801
JUMPV
LABELV $800
line 2746
;2746:		else {
line 2748
;2747:			//walk forward or backward to get at the ideal attack distance
;2748:			if (dist > attack_dist + attack_range) {
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
LEF4 $808
line 2749
;2749:				VectorAdd(sideward, forward, sideward);
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
line 2750
;2750:			}
ADDRGP4 $809
JUMPV
LABELV $808
line 2751
;2751:			else if (dist < attack_dist - attack_range) {
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRF4
SUBF4
GEF4 $816
line 2752
;2752:				VectorAdd(sideward, backward, sideward);
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
line 2753
;2753:			}
LABELV $816
LABELV $809
line 2754
;2754:		}
LABELV $801
line 2756
;2755:		//perform the movement
;2756:		if (trap_BotMoveInDirection(bs->ms, sideward, 400, movetype))
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
EQI4 $824
line 2757
;2757:			return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $727
JUMPV
LABELV $824
line 2759
;2758:		//movement failed, flip the strafe direction
;2759:		bs->flags ^= BFL_STRAFERIGHT;
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
line 2760
;2760:		bs->attackstrafe_time = 0;
ADDRFP4 4
INDIRP4
CNSTI4 6116
ADDP4
CNSTF4 0
ASGNF4
line 2761
;2761:	}
LABELV $788
line 2733
ADDRLP4 48
ADDRLP4 48
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 2
LTI4 $787
line 2764
;2762:	//bot couldn't do any usefull movement
;2763://	bs->attackchase_time = AAS_Time() + 6;
;2764:	return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
LABELV $727
endproc BotAttackMove 392 16
export BotSameTeam
proc BotSameTeam 2072 12
line 2772
;2765:}
;2766:
;2767:/*
;2768:==================
;2769:BotSameTeam
;2770:==================
;2771:*/
;2772:int BotSameTeam(bot_state_t *bs, int entnum) {
line 2775
;2773:	char info1[1024], info2[1024];
;2774:
;2775:	if (bs->client < 0 || bs->client >= MAX_CLIENTS) {
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
LTI4 $829
ADDRLP4 2048
INDIRI4
CNSTI4 64
LTI4 $827
LABELV $829
line 2777
;2776:		//BotAI_Print(PRT_ERROR, "BotSameTeam: client out of range\n");
;2777:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $826
JUMPV
LABELV $827
line 2779
;2778:	}
;2779:	if (entnum < 0 || entnum >= MAX_CLIENTS) {
ADDRLP4 2052
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 2052
INDIRI4
CNSTI4 0
LTI4 $832
ADDRLP4 2052
INDIRI4
CNSTI4 64
LTI4 $830
LABELV $832
line 2781
;2780:		//BotAI_Print(PRT_ERROR, "BotSameTeam: client out of range\n");
;2781:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $826
JUMPV
LABELV $830
line 2783
;2782:	}
;2783:	if ( gametype >= GT_TEAM ) {
ADDRGP4 gametype
INDIRI4
CNSTI4 3
LTI4 $833
line 2784
;2784:		trap_GetConfigstring(CS_PLAYERS+bs->client, info1, sizeof(info1));
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
line 2785
;2785:		trap_GetConfigstring(CS_PLAYERS+entnum, info2, sizeof(info2));
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
line 2787
;2786:		//
;2787:		if (atoi(Info_ValueForKey(info1, "t")) == atoi(Info_ValueForKey(info2, "t"))) return qtrue;
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
NEI4 $835
CNSTI4 1
RETI4
ADDRGP4 $826
JUMPV
LABELV $835
line 2788
;2788:	}
LABELV $833
line 2789
;2789:	return qfalse;
CNSTI4 0
RETI4
LABELV $826
endproc BotSameTeam 2072 12
export InFieldOfVision
proc InFieldOfVision 24 4
line 2798
;2790:}
;2791:
;2792:/*
;2793:==================
;2794:InFieldOfVision
;2795:==================
;2796:*/
;2797:qboolean InFieldOfVision(vec3_t viewangles, float fov, vec3_t angles)
;2798:{
line 2802
;2799:	int i;
;2800:	float diff, angle;
;2801:
;2802:	for (i = 0; i < 2; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $838
line 2803
;2803:		angle = AngleMod(viewangles[i]);
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
line 2804
;2804:		angles[i] = AngleMod(angles[i]);
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
line 2805
;2805:		diff = angles[i] - angle;
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
line 2806
;2806:		if (angles[i] > angle) {
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
LEF4 $842
line 2807
;2807:			if (diff > 180.0) diff -= 360.0;
ADDRLP4 4
INDIRF4
CNSTF4 1127481344
LEF4 $843
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 2808
;2808:		}
ADDRGP4 $843
JUMPV
LABELV $842
line 2809
;2809:		else {
line 2810
;2810:			if (diff < -180.0) diff += 360.0;
ADDRLP4 4
INDIRF4
CNSTF4 3274964992
GEF4 $846
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $846
line 2811
;2811:		}
LABELV $843
line 2812
;2812:		if (diff > 0) {
ADDRLP4 4
INDIRF4
CNSTF4 0
LEF4 $848
line 2813
;2813:			if (diff > fov * 0.5) return qfalse;
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRFP4 4
INDIRF4
MULF4
LEF4 $849
CNSTI4 0
RETI4
ADDRGP4 $837
JUMPV
line 2814
;2814:		}
LABELV $848
line 2815
;2815:		else {
line 2816
;2816:			if (diff < -fov * 0.5) return qfalse;
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRFP4 4
INDIRF4
NEGF4
MULF4
GEF4 $852
CNSTI4 0
RETI4
ADDRGP4 $837
JUMPV
LABELV $852
line 2817
;2817:		}
LABELV $849
line 2818
;2818:	}
LABELV $839
line 2802
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $838
line 2819
;2819:	return qtrue;
CNSTI4 1
RETI4
LABELV $837
endproc InFieldOfVision 24 4
export BotEntityVisible
proc BotEntityVisible 376 28
line 2829
;2820:}
;2821:
;2822:/*
;2823:==================
;2824:BotEntityVisible
;2825:
;2826:returns visibility in the range [0, 1] taking fog and water surfaces into account
;2827:==================
;2828:*/
;2829:float BotEntityVisible(int viewer, vec3_t eye, vec3_t viewangles, float fov, int ent) {
line 2837
;2830:	int i, contents_mask, passent, hitent, infog, inwater, otherinfog, pc;
;2831:	float squaredfogdist, waterfactor, vis, bestvis;
;2832:	bsp_trace_t trace;
;2833:	aas_entityinfo_t entinfo;
;2834:	vec3_t dir, entangles, start, end, middle;
;2835:
;2836:	//calculate middle of bounding box
;2837:	BotEntityInfo(ent, &entinfo);
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 148
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2838
;2838:	VectorAdd(entinfo.mins, entinfo.maxs, middle);
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
line 2839
;2839:	VectorScale(middle, 0.5, middle);
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
line 2840
;2840:	VectorAdd(entinfo.origin, middle, middle);
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
line 2842
;2841:	//check if entity is within field of vision
;2842:	VectorSubtract(middle, eye, dir);
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
line 2843
;2843:	vectoangles(dir, entangles);
ADDRLP4 136
ARGP4
ADDRLP4 320
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2844
;2844:	if (!InFieldOfVision(viewangles, fov, entangles)) return 0;
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
NEI4 $884
CNSTF4 0
RETF4
ADDRGP4 $854
JUMPV
LABELV $884
line 2846
;2845:	//
;2846:	pc = trap_AAS_PointContents(eye);
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
line 2847
;2847:	infog = (pc & CONTENTS_FOG);
ADDRLP4 312
ADDRLP4 316
INDIRI4
CNSTI4 64
BANDI4
ASGNI4
line 2848
;2848:	inwater = (pc & (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER));
ADDRLP4 308
ADDRLP4 316
INDIRI4
CNSTI4 56
BANDI4
ASGNI4
line 2850
;2849:	//
;2850:	bestvis = 0;
ADDRLP4 296
CNSTF4 0
ASGNF4
line 2851
;2851:	for (i = 0; i < 3; i++) {
ADDRLP4 100
CNSTI4 0
ASGNI4
LABELV $886
line 2855
;2852:		//if the point is not in potential visible sight
;2853:		//if (!AAS_inPVS(eye, middle)) continue;
;2854:		//
;2855:		contents_mask = CONTENTS_SOLID|CONTENTS_PLAYERCLIP;
ADDRLP4 96
CNSTI4 65537
ASGNI4
line 2856
;2856:		passent = viewer;
ADDRLP4 116
ADDRFP4 0
INDIRI4
ASGNI4
line 2857
;2857:		hitent = ent;
ADDRLP4 132
ADDRFP4 16
INDIRI4
ASGNI4
line 2858
;2858:		VectorCopy(eye, start);
ADDRLP4 120
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2859
;2859:		VectorCopy(middle, end);
ADDRLP4 104
ADDRLP4 84
INDIRB
ASGNB 12
line 2861
;2860:		//if the entity is in water, lava or slime
;2861:		if (trap_AAS_PointContents(middle) & (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER)) {
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
EQI4 $890
line 2862
;2862:			contents_mask |= (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER);
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 56
BORI4
ASGNI4
line 2863
;2863:		}
LABELV $890
line 2865
;2864:		//if eye is in water, lava or slime
;2865:		if (inwater) {
ADDRLP4 308
INDIRI4
CNSTI4 0
EQI4 $892
line 2866
;2866:			if (!(contents_mask & (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER))) {
ADDRLP4 96
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
NEI4 $894
line 2867
;2867:				passent = ent;
ADDRLP4 116
ADDRFP4 16
INDIRI4
ASGNI4
line 2868
;2868:				hitent = viewer;
ADDRLP4 132
ADDRFP4 0
INDIRI4
ASGNI4
line 2869
;2869:				VectorCopy(middle, start);
ADDRLP4 120
ADDRLP4 84
INDIRB
ASGNB 12
line 2870
;2870:				VectorCopy(eye, end);
ADDRLP4 104
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2871
;2871:			}
LABELV $894
line 2872
;2872:			contents_mask ^= (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER);
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 56
BXORI4
ASGNI4
line 2873
;2873:		}
LABELV $892
line 2875
;2874:		//trace from start to end
;2875:		BotAI_Trace(&trace, start, NULL, NULL, end, passent, contents_mask);
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
line 2877
;2876:		//if water was hit
;2877:		waterfactor = 1.0;
ADDRLP4 288
CNSTF4 1065353216
ASGNF4
line 2878
;2878:		if (trace.contents & (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER)) {
ADDRLP4 0+76
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $896
line 2880
;2879:			//if the water surface is translucent
;2880:			if (1) {
line 2882
;2881:				//trace through the water
;2882:				contents_mask &= ~(CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER);
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 -57
BANDI4
ASGNI4
line 2883
;2883:				BotAI_Trace(&trace, trace.endpos, NULL, NULL, end, passent, contents_mask);
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
line 2884
;2884:				waterfactor = 0.5;
ADDRLP4 288
CNSTF4 1056964608
ASGNF4
line 2885
;2885:			}
LABELV $899
line 2886
;2886:		}
LABELV $896
line 2888
;2887:		//if a full trace or the hitent was hit
;2888:		if (trace.fraction >= 1 || trace.ent == hitent) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $906
ADDRLP4 0+80
INDIRI4
ADDRLP4 132
INDIRI4
NEI4 $902
LABELV $906
line 2891
;2889:			//check for fog, assuming there's only one fog brush where
;2890:			//either the viewer or the entity is in or both are in
;2891:			otherinfog = (trap_AAS_PointContents(middle) & CONTENTS_FOG);
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
line 2892
;2892:			if (infog && otherinfog) {
ADDRLP4 360
CNSTI4 0
ASGNI4
ADDRLP4 312
INDIRI4
ADDRLP4 360
INDIRI4
EQI4 $907
ADDRLP4 304
INDIRI4
ADDRLP4 360
INDIRI4
EQI4 $907
line 2893
;2893:				VectorSubtract(trace.endpos, eye, dir);
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
line 2894
;2894:				squaredfogdist = VectorLengthSquared(dir);
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
line 2895
;2895:			}
ADDRGP4 $908
JUMPV
LABELV $907
line 2896
;2896:			else if (infog) {
ADDRLP4 312
INDIRI4
CNSTI4 0
EQI4 $916
line 2897
;2897:				VectorCopy(trace.endpos, start);
ADDRLP4 120
ADDRLP4 0+12
INDIRB
ASGNB 12
line 2898
;2898:				BotAI_Trace(&trace, start, NULL, NULL, eye, viewer, CONTENTS_FOG);
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
line 2899
;2899:				VectorSubtract(eye, trace.endpos, dir);
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
line 2900
;2900:				squaredfogdist = VectorLengthSquared(dir);
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
line 2901
;2901:			}
ADDRGP4 $917
JUMPV
LABELV $916
line 2902
;2902:			else if (otherinfog) {
ADDRLP4 304
INDIRI4
CNSTI4 0
EQI4 $926
line 2903
;2903:				VectorCopy(trace.endpos, end);
ADDRLP4 104
ADDRLP4 0+12
INDIRB
ASGNB 12
line 2904
;2904:				BotAI_Trace(&trace, eye, NULL, NULL, end, viewer, CONTENTS_FOG);
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
line 2905
;2905:				VectorSubtract(end, trace.endpos, dir);
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
line 2906
;2906:				squaredfogdist = VectorLengthSquared(dir);
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
line 2907
;2907:			}
ADDRGP4 $927
JUMPV
LABELV $926
line 2908
;2908:			else {
line 2910
;2909:				//if the entity and the viewer are not in fog assume there's no fog in between
;2910:				squaredfogdist = 0;
ADDRLP4 300
CNSTF4 0
ASGNF4
line 2911
;2911:			}
LABELV $927
LABELV $917
LABELV $908
line 2913
;2912:			//decrease visibility with the view distance through fog
;2913:			vis = 1 / ((squaredfogdist * 0.001) < 1 ? 1 : (squaredfogdist * 0.001));
ADDRLP4 368
CNSTF4 1065353216
ASGNF4
CNSTF4 981668463
ADDRLP4 300
INDIRF4
MULF4
ADDRLP4 368
INDIRF4
GEF4 $939
ADDRLP4 364
CNSTF4 1065353216
ASGNF4
ADDRGP4 $940
JUMPV
LABELV $939
ADDRLP4 364
CNSTF4 981668463
ADDRLP4 300
INDIRF4
MULF4
ASGNF4
LABELV $940
ADDRLP4 292
ADDRLP4 368
INDIRF4
ADDRLP4 364
INDIRF4
DIVF4
ASGNF4
line 2915
;2914:			//if entering water visibility is reduced
;2915:			vis *= waterfactor;
ADDRLP4 292
ADDRLP4 292
INDIRF4
ADDRLP4 288
INDIRF4
MULF4
ASGNF4
line 2917
;2916:			//
;2917:			if (vis > bestvis) bestvis = vis;
ADDRLP4 292
INDIRF4
ADDRLP4 296
INDIRF4
LEF4 $941
ADDRLP4 296
ADDRLP4 292
INDIRF4
ASGNF4
LABELV $941
line 2919
;2918:			//if pretty much no fog
;2919:			if (bestvis >= 0.95) return bestvis;
ADDRLP4 296
INDIRF4
CNSTF4 1064514355
LTF4 $943
ADDRLP4 296
INDIRF4
RETF4
ADDRGP4 $854
JUMPV
LABELV $943
line 2920
;2920:		}
LABELV $902
line 2922
;2921:		//check bottom and top of bounding box as well
;2922:		if (i == 0) middle[2] += entinfo.mins[2];
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $945
ADDRLP4 84+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 148+72+8
INDIRF4
ADDF4
ASGNF4
ADDRGP4 $946
JUMPV
LABELV $945
line 2923
;2923:		else if (i == 1) middle[2] += entinfo.maxs[2] - entinfo.mins[2];
ADDRLP4 100
INDIRI4
CNSTI4 1
NEI4 $950
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
LABELV $950
LABELV $946
line 2924
;2924:	}
LABELV $887
line 2851
ADDRLP4 100
ADDRLP4 100
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 3
LTI4 $886
line 2925
;2925:	return bestvis;
ADDRLP4 296
INDIRF4
RETF4
LABELV $854
endproc BotEntityVisible 376 28
export BotFindEnemy
proc BotFindEnemy 432 20
line 2933
;2926:}
;2927:
;2928:/*
;2929:==================
;2930:BotFindEnemy
;2931:==================
;2932:*/
;2933:int BotFindEnemy(bot_state_t *bs, int curenemy) {
line 2940
;2934:	int i, healthdecrease;
;2935:	float f, alertness, easyfragger, vis;
;2936:	float squaredist, cursquaredist;
;2937:	aas_entityinfo_t entinfo, curenemyinfo;
;2938:	vec3_t dir, angles;
;2939:
;2940:	alertness = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_ALERTNESS, 0, 1);
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
line 2941
;2941:	easyfragger = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_EASY_FRAGGER, 0, 1);
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
line 2943
;2942:	//check if the health decreased
;2943:	healthdecrease = bs->lasthealth > bs->inventory[INVENTORY_HEALTH];
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
LEI4 $959
ADDRLP4 344
CNSTI4 1
ASGNI4
ADDRGP4 $960
JUMPV
LABELV $959
ADDRLP4 344
CNSTI4 0
ASGNI4
LABELV $960
ADDRLP4 160
ADDRLP4 344
INDIRI4
ASGNI4
line 2945
;2944:	//remember the current health value
;2945:	bs->lasthealth = bs->inventory[INVENTORY_HEALTH];
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
line 2947
;2946:	//
;2947:	if (curenemy >= 0) {
ADDRFP4 4
INDIRI4
CNSTI4 0
LTI4 $961
line 2948
;2948:		BotEntityInfo(curenemy, &curenemyinfo);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 196
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2949
;2949:		if (EntityCarriesFlag(&curenemyinfo)) return qfalse;
ADDRLP4 196
ARGP4
ADDRLP4 356
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 356
INDIRI4
CNSTI4 0
EQI4 $963
CNSTI4 0
RETI4
ADDRGP4 $957
JUMPV
LABELV $963
line 2950
;2950:		VectorSubtract(curenemyinfo.origin, bs->origin, dir);
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
line 2951
;2951:		cursquaredist = VectorLengthSquared(dir);
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
line 2952
;2952:	}
ADDRGP4 $962
JUMPV
LABELV $961
line 2953
;2953:	else {
line 2954
;2954:		cursquaredist = 0;
ADDRLP4 192
CNSTF4 0
ASGNF4
line 2955
;2955:	}
LABELV $962
line 2984
;2956:#ifdef MISSIONPACK
;2957:	if (gametype == GT_OBELISK) {
;2958:		vec3_t target;
;2959:		bot_goal_t *goal;
;2960:		bsp_trace_t trace;
;2961:
;2962:		if (BotTeam(bs) == TEAM_RED)
;2963:			goal = &blueobelisk;
;2964:		else
;2965:			goal = &redobelisk;
;2966:		//if the obelisk is visible
;2967:		VectorCopy(goal->origin, target);
;2968:		target[2] += 1;
;2969:		BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
;2970:		if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
;2971:			if (goal->entitynum == bs->enemy) {
;2972:				return qfalse;
;2973:			}
;2974:			bs->enemy = goal->entitynum;
;2975:			bs->enemysight_time = FloatTime();
;2976:			bs->enemysuicide = qfalse;
;2977:			bs->enemydeath_time = 0;
;2978:			bs->enemyvisible_time = FloatTime();
;2979:			return qtrue;
;2980:		}
;2981:	}
;2982:#endif
;2983:	//
;2984:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 140
CNSTI4 0
ASGNI4
ADDRGP4 $975
JUMPV
LABELV $972
line 2986
;2985:
;2986:		if (i == bs->client) continue;
ADDRLP4 140
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $976
ADDRGP4 $973
JUMPV
LABELV $976
line 2988
;2987:		//if it's the current enemy
;2988:		if (i == curenemy) continue;
ADDRLP4 140
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $978
ADDRGP4 $973
JUMPV
LABELV $978
line 2990
;2989:		//
;2990:		BotEntityInfo(i, &entinfo);
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2992
;2991:		//
;2992:		if (!entinfo.valid) continue;
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $980
ADDRGP4 $973
JUMPV
LABELV $980
line 2994
;2993:		//if the enemy isn't dead and the enemy isn't the bot self
;2994:		if (EntityIsDead(&entinfo) || entinfo.number == bs->entitynum) continue;
ADDRLP4 0
ARGP4
ADDRLP4 356
ADDRGP4 EntityIsDead
CALLI4
ASGNI4
ADDRLP4 356
INDIRI4
CNSTI4 0
NEI4 $985
ADDRLP4 0+20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
NEI4 $982
LABELV $985
ADDRGP4 $973
JUMPV
LABELV $982
line 2996
;2995:		//if the enemy is invisible and not shooting
;2996:		if (EntityIsInvisible(&entinfo) && !EntityIsShooting(&entinfo)) {
ADDRLP4 0
ARGP4
ADDRLP4 360
ADDRGP4 EntityIsInvisible
CALLI4
ASGNI4
ADDRLP4 360
INDIRI4
CNSTI4 0
EQI4 $986
ADDRLP4 0
ARGP4
ADDRLP4 364
ADDRGP4 EntityIsShooting
CALLI4
ASGNI4
ADDRLP4 364
INDIRI4
CNSTI4 0
NEI4 $986
line 2997
;2997:			continue;
ADDRGP4 $973
JUMPV
LABELV $986
line 3001
;2998:		}
;2999://unlagged - misc
;3000:		// this has nothing to do with lag compensation, but it's great for testing
;3001:		if ( g_entities[i].flags & FL_NOTARGET ) continue;
CNSTI4 916
ADDRLP4 140
INDIRI4
MULI4
ADDRGP4 g_entities+544
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $988
ADDRGP4 $973
JUMPV
LABELV $988
line 3004
;3002://unlagged - misc
;3003:		//if not an easy fragger don't shoot at chatting players
;3004:		if (easyfragger < 0.5 && EntityIsChatting(&entinfo)) continue;
ADDRLP4 176
INDIRF4
CNSTF4 1056964608
GEF4 $991
ADDRLP4 0
ARGP4
ADDRLP4 368
ADDRGP4 EntityIsChatting
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 0
EQI4 $991
ADDRGP4 $973
JUMPV
LABELV $991
line 3006
;3005:		//
;3006:		if (lastteleport_time > FloatTime() - 3) {
ADDRGP4 lastteleport_time
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1077936128
SUBF4
LEF4 $993
line 3007
;3007:			VectorSubtract(entinfo.origin, lastteleport_origin, dir);
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
line 3008
;3008:			if (VectorLengthSquared(dir) < Square(70)) continue;
ADDRLP4 144
ARGP4
ADDRLP4 372
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 372
INDIRF4
CNSTF4 1167663104
GEF4 $1004
ADDRGP4 $973
JUMPV
LABELV $1004
line 3009
;3009:		}
LABELV $993
line 3011
;3010:		//calculate the distance towards the enemy
;3011:		VectorSubtract(entinfo.origin, bs->origin, dir);
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
line 3012
;3012:		squaredist = VectorLengthSquared(dir);
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
line 3014
;3013:		//if this entity is not carrying a flag
;3014:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 0
ARGP4
ADDRLP4 380
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 380
INDIRI4
CNSTI4 0
NEI4 $1013
line 3015
;3015:		{
line 3017
;3016:			//if this enemy is further away than the current one
;3017:			if (curenemy >= 0 && squaredist > cursquaredist) continue;
ADDRFP4 4
INDIRI4
CNSTI4 0
LTI4 $1015
ADDRLP4 156
INDIRF4
ADDRLP4 192
INDIRF4
LEF4 $1015
ADDRGP4 $973
JUMPV
LABELV $1015
line 3018
;3018:		} //end if
LABELV $1013
line 3020
;3019:		//if the bot has no
;3020:		if (squaredist > Square(900.0 + alertness * 4000.0)) continue;
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
LEF4 $1017
ADDRGP4 $973
JUMPV
LABELV $1017
line 3022
;3021:		//if on the same team
;3022:		if (BotSameTeam(bs, i)) continue;
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
EQI4 $1019
ADDRGP4 $973
JUMPV
LABELV $1019
line 3024
;3023:		//if the bot's health decreased or the enemy is shooting
;3024:		if (curenemy < 0 && (healthdecrease || EntityIsShooting(&entinfo)))
ADDRLP4 392
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 392
INDIRI4
GEI4 $1021
ADDRLP4 160
INDIRI4
ADDRLP4 392
INDIRI4
NEI4 $1023
ADDRLP4 0
ARGP4
ADDRLP4 396
ADDRGP4 EntityIsShooting
CALLI4
ASGNI4
ADDRLP4 396
INDIRI4
CNSTI4 0
EQI4 $1021
LABELV $1023
line 3025
;3025:			f = 360;
ADDRLP4 168
CNSTF4 1135869952
ASGNF4
ADDRGP4 $1022
JUMPV
LABELV $1021
line 3027
;3026:		else
;3027:			f = 90 + 90 - (90 - (squaredist > Square(810) ? Square(810) : squaredist) / (810 * 9));
ADDRLP4 156
INDIRF4
CNSTF4 1226845760
LEF4 $1025
ADDRLP4 400
CNSTF4 1226845760
ASGNF4
ADDRGP4 $1026
JUMPV
LABELV $1025
ADDRLP4 400
ADDRLP4 156
INDIRF4
ASGNF4
LABELV $1026
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
LABELV $1022
line 3029
;3028:		//check if the enemy is visible
;3029:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, f, i);
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
line 3030
;3030:		if (vis <= 0) continue;
ADDRLP4 172
INDIRF4
CNSTF4 0
GTF4 $1027
ADDRGP4 $973
JUMPV
LABELV $1027
line 3032
;3031:		//if the enemy is quite far away, not shooting and the bot is not damaged
;3032:		if (curenemy < 0 && squaredist > Square(100) && !healthdecrease && !EntityIsShooting(&entinfo))
ADDRLP4 412
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 412
INDIRI4
GEI4 $1029
ADDRLP4 156
INDIRF4
CNSTF4 1176256512
LEF4 $1029
ADDRLP4 160
INDIRI4
ADDRLP4 412
INDIRI4
NEI4 $1029
ADDRLP4 0
ARGP4
ADDRLP4 416
ADDRGP4 EntityIsShooting
CALLI4
ASGNI4
ADDRLP4 416
INDIRI4
CNSTI4 0
NEI4 $1029
line 3033
;3033:		{
line 3035
;3034:			//check if we can avoid this enemy
;3035:			VectorSubtract(bs->origin, entinfo.origin, dir);
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
line 3036
;3036:			vectoangles(dir, angles);
ADDRLP4 144
ARGP4
ADDRLP4 180
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3038
;3037:			//if the bot isn't in the fov of the enemy
;3038:			if (!InFieldOfVision(entinfo.angles, 90, angles)) {
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
NEI4 $1038
line 3040
;3039:				//update some stuff for this enemy
;3040:				BotUpdateBattleInventory(bs, i);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
INDIRI4
ARGI4
ADDRGP4 BotUpdateBattleInventory
CALLV
pop
line 3042
;3041:				//if the bot doesn't really want to fight
;3042:				if (BotWantsToRetreat(bs)) continue;
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
EQI4 $1041
ADDRGP4 $973
JUMPV
LABELV $1041
line 3043
;3043:			}
LABELV $1038
line 3044
;3044:		}
LABELV $1029
line 3046
;3045:		//found an enemy
;3046:		bs->enemy = entinfo.number;
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
ADDRLP4 0+20
INDIRI4
ASGNI4
line 3047
;3047:		if (curenemy >= 0) bs->enemysight_time = FloatTime() - 2;
ADDRFP4 4
INDIRI4
CNSTI4 0
LTI4 $1044
ADDRFP4 0
INDIRP4
CNSTI4 6132
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
SUBF4
ASGNF4
ADDRGP4 $1045
JUMPV
LABELV $1044
line 3048
;3048:		else bs->enemysight_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6132
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
LABELV $1045
line 3049
;3049:		bs->enemysuicide = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6012
ADDP4
CNSTI4 0
ASGNI4
line 3050
;3050:		bs->enemydeath_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6136
ADDP4
CNSTF4 0
ASGNF4
line 3051
;3051:		bs->enemyvisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6088
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 3052
;3052:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $957
JUMPV
LABELV $973
line 2984
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $975
ADDRLP4 140
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $1046
ADDRLP4 140
INDIRI4
CNSTI4 64
LTI4 $972
LABELV $1046
line 3054
;3053:	}
;3054:	return qfalse;
CNSTI4 0
RETI4
LABELV $957
endproc BotFindEnemy 432 20
export BotTeamFlagCarrierVisible
proc BotTeamFlagCarrierVisible 164 20
line 3062
;3055:}
;3056:
;3057:/*
;3058:==================
;3059:BotTeamFlagCarrierVisible
;3060:==================
;3061:*/
;3062:int BotTeamFlagCarrierVisible(bot_state_t *bs) {
line 3067
;3063:	int i;
;3064:	float vis;
;3065:	aas_entityinfo_t entinfo;
;3066:
;3067:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1051
JUMPV
LABELV $1048
line 3068
;3068:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1052
line 3069
;3069:			continue;
ADDRGP4 $1049
JUMPV
LABELV $1052
line 3071
;3070:		//
;3071:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3073
;3072:		//if this player is active
;3073:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1054
line 3074
;3074:			continue;
ADDRGP4 $1049
JUMPV
LABELV $1054
line 3076
;3075:		//if this player is carrying a flag
;3076:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 4
ARGP4
ADDRLP4 148
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $1056
line 3077
;3077:			continue;
ADDRGP4 $1049
JUMPV
LABELV $1056
line 3079
;3078:		//if the flag carrier is not on the same team
;3079:		if (!BotSameTeam(bs, i))
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
NEI4 $1058
line 3080
;3080:			continue;
ADDRGP4 $1049
JUMPV
LABELV $1058
line 3082
;3081:		//if the flag carrier is not visible
;3082:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
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
line 3083
;3083:		if (vis <= 0)
ADDRLP4 144
INDIRF4
CNSTF4 0
GTF4 $1060
line 3084
;3084:			continue;
ADDRGP4 $1049
JUMPV
LABELV $1060
line 3086
;3085:		//
;3086:		return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1047
JUMPV
LABELV $1049
line 3067
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1051
ADDRLP4 0
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $1062
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $1048
LABELV $1062
line 3088
;3087:	}
;3088:	return -1;
CNSTI4 -1
RETI4
LABELV $1047
endproc BotTeamFlagCarrierVisible 164 20
export BotTeamFlagCarrier
proc BotTeamFlagCarrier 152 8
line 3096
;3089:}
;3090:
;3091:/*
;3092:==================
;3093:BotTeamFlagCarrier
;3094:==================
;3095:*/
;3096:int BotTeamFlagCarrier(bot_state_t *bs) {
line 3100
;3097:	int i;
;3098:	aas_entityinfo_t entinfo;
;3099:
;3100:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1067
JUMPV
LABELV $1064
line 3101
;3101:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1068
line 3102
;3102:			continue;
ADDRGP4 $1065
JUMPV
LABELV $1068
line 3104
;3103:		//
;3104:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3106
;3105:		//if this player is active
;3106:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1070
line 3107
;3107:			continue;
ADDRGP4 $1065
JUMPV
LABELV $1070
line 3109
;3108:		//if this player is carrying a flag
;3109:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 4
ARGP4
ADDRLP4 144
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
NEI4 $1072
line 3110
;3110:			continue;
ADDRGP4 $1065
JUMPV
LABELV $1072
line 3112
;3111:		//if the flag carrier is not on the same team
;3112:		if (!BotSameTeam(bs, i))
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
NEI4 $1074
line 3113
;3113:			continue;
ADDRGP4 $1065
JUMPV
LABELV $1074
line 3115
;3114:		//
;3115:		return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1063
JUMPV
LABELV $1065
line 3100
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1067
ADDRLP4 0
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $1076
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $1064
LABELV $1076
line 3117
;3116:	}
;3117:	return -1;
CNSTI4 -1
RETI4
LABELV $1063
endproc BotTeamFlagCarrier 152 8
export BotEnemyFlagCarrierVisible
proc BotEnemyFlagCarrierVisible 164 20
line 3125
;3118:}
;3119:
;3120:/*
;3121:==================
;3122:BotEnemyFlagCarrierVisible
;3123:==================
;3124:*/
;3125:int BotEnemyFlagCarrierVisible(bot_state_t *bs) {
line 3130
;3126:	int i;
;3127:	float vis;
;3128:	aas_entityinfo_t entinfo;
;3129:
;3130:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1081
JUMPV
LABELV $1078
line 3131
;3131:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1082
line 3132
;3132:			continue;
ADDRGP4 $1079
JUMPV
LABELV $1082
line 3134
;3133:		//
;3134:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3136
;3135:		//if this player is active
;3136:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1084
line 3137
;3137:			continue;
ADDRGP4 $1079
JUMPV
LABELV $1084
line 3139
;3138:		//if this player is carrying a flag
;3139:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 4
ARGP4
ADDRLP4 148
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $1086
line 3140
;3140:			continue;
ADDRGP4 $1079
JUMPV
LABELV $1086
line 3142
;3141:		//if the flag carrier is on the same team
;3142:		if (BotSameTeam(bs, i))
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
EQI4 $1088
line 3143
;3143:			continue;
ADDRGP4 $1079
JUMPV
LABELV $1088
line 3145
;3144:		//if the flag carrier is not visible
;3145:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
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
line 3146
;3146:		if (vis <= 0)
ADDRLP4 144
INDIRF4
CNSTF4 0
GTF4 $1090
line 3147
;3147:			continue;
ADDRGP4 $1079
JUMPV
LABELV $1090
line 3149
;3148:		//
;3149:		return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1077
JUMPV
LABELV $1079
line 3130
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1081
ADDRLP4 0
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $1092
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $1078
LABELV $1092
line 3151
;3150:	}
;3151:	return -1;
CNSTI4 -1
RETI4
LABELV $1077
endproc BotEnemyFlagCarrierVisible 164 20
export BotVisibleTeamMatesAndEnemies
proc BotVisibleTeamMatesAndEnemies 192 20
line 3159
;3152:}
;3153:
;3154:/*
;3155:==================
;3156:BotVisibleTeamMatesAndEnemies
;3157:==================
;3158:*/
;3159:void BotVisibleTeamMatesAndEnemies(bot_state_t *bs, int *teammates, int *enemies, float range) {
line 3165
;3160:	int i;
;3161:	float vis;
;3162:	aas_entityinfo_t entinfo;
;3163:	vec3_t dir;
;3164:
;3165:	if (teammates)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1094
line 3166
;3166:		*teammates = 0;
ADDRFP4 4
INDIRP4
CNSTI4 0
ASGNI4
LABELV $1094
line 3167
;3167:	if (enemies)
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1096
line 3168
;3168:		*enemies = 0;
ADDRFP4 8
INDIRP4
CNSTI4 0
ASGNI4
LABELV $1096
line 3169
;3169:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1101
JUMPV
LABELV $1098
line 3170
;3170:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1102
line 3171
;3171:			continue;
ADDRGP4 $1099
JUMPV
LABELV $1102
line 3173
;3172:		//
;3173:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3175
;3174:		//if this player is active
;3175:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1104
line 3176
;3176:			continue;
ADDRGP4 $1099
JUMPV
LABELV $1104
line 3178
;3177:		//if this player is carrying a flag
;3178:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 4
ARGP4
ADDRLP4 160
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
NEI4 $1106
line 3179
;3179:			continue;
ADDRGP4 $1099
JUMPV
LABELV $1106
line 3181
;3180:		//if not within range
;3181:		VectorSubtract(entinfo.origin, bs->origin, dir);
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
line 3182
;3182:		if (VectorLengthSquared(dir) > Square(range))
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
LEF4 $1115
line 3183
;3183:			continue;
ADDRGP4 $1099
JUMPV
LABELV $1115
line 3185
;3184:		//if the flag carrier is not visible
;3185:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
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
line 3186
;3186:		if (vis <= 0)
ADDRLP4 156
INDIRF4
CNSTF4 0
GTF4 $1117
line 3187
;3187:			continue;
ADDRGP4 $1099
JUMPV
LABELV $1117
line 3189
;3188:		//if the flag carrier is on the same team
;3189:		if (BotSameTeam(bs, i)) {
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
EQI4 $1119
line 3190
;3190:			if (teammates)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1120
line 3191
;3191:				(*teammates)++;
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
line 3192
;3192:		}
ADDRGP4 $1120
JUMPV
LABELV $1119
line 3193
;3193:		else {
line 3194
;3194:			if (enemies)
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1123
line 3195
;3195:				(*enemies)++;
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
LABELV $1123
line 3196
;3196:		}
LABELV $1120
line 3197
;3197:	}
LABELV $1099
line 3169
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1101
ADDRLP4 0
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $1125
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $1098
LABELV $1125
line 3198
;3198:}
LABELV $1093
endproc BotVisibleTeamMatesAndEnemies 192 20
lit
align 4
LABELV $1127
byte 4 3229614080
byte 4 3229614080
byte 4 3229614080
align 4
LABELV $1128
byte 4 1082130432
byte 4 1082130432
byte 4 1082130432
export BotAimAtEnemy
code
proc BotAimAtEnemy 1144 52
line 3269
;3199:
;3200:#ifdef MISSIONPACK
;3201:/*
;3202:==================
;3203:BotTeamCubeCarrierVisible
;3204:==================
;3205:*/
;3206:int BotTeamCubeCarrierVisible(bot_state_t *bs) {
;3207:	int i;
;3208:	float vis;
;3209:	aas_entityinfo_t entinfo;
;3210:
;3211:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
;3212:		if (i == bs->client) continue;
;3213:		//
;3214:		BotEntityInfo(i, &entinfo);
;3215:		//if this player is active
;3216:		if (!entinfo.valid) continue;
;3217:		//if this player is carrying a flag
;3218:		if (!EntityCarriesCubes(&entinfo)) continue;
;3219:		//if the flag carrier is not on the same team
;3220:		if (!BotSameTeam(bs, i)) continue;
;3221:		//if the flag carrier is not visible
;3222:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
;3223:		if (vis <= 0) continue;
;3224:		//
;3225:		return i;
;3226:	}
;3227:	return -1;
;3228:}
;3229:
;3230:/*
;3231:==================
;3232:BotEnemyCubeCarrierVisible
;3233:==================
;3234:*/
;3235:int BotEnemyCubeCarrierVisible(bot_state_t *bs) {
;3236:	int i;
;3237:	float vis;
;3238:	aas_entityinfo_t entinfo;
;3239:
;3240:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
;3241:		if (i == bs->client)
;3242:			continue;
;3243:		//
;3244:		BotEntityInfo(i, &entinfo);
;3245:		//if this player is active
;3246:		if (!entinfo.valid)
;3247:			continue;
;3248:		//if this player is carrying a flag
;3249:		if (!EntityCarriesCubes(&entinfo)) continue;
;3250:		//if the flag carrier is on the same team
;3251:		if (BotSameTeam(bs, i))
;3252:			continue;
;3253:		//if the flag carrier is not visible
;3254:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
;3255:		if (vis <= 0)
;3256:			continue;
;3257:		//
;3258:		return i;
;3259:	}
;3260:	return -1;
;3261:}
;3262:#endif
;3263:
;3264:/*
;3265:==================
;3266:BotAimAtEnemy
;3267:==================
;3268:*/
;3269:void BotAimAtEnemy(bot_state_t *bs) {
line 3273
;3270:	int i, enemyvisible;
;3271:	float dist, f, aim_skill, aim_accuracy, speed, reactiontime;
;3272:	vec3_t dir, bestorigin, end, start, groundtarget, cmdmove, enemyvelocity;
;3273:	vec3_t mins = {-4,-4,-4}, maxs = {4, 4, 4};
ADDRLP4 860
ADDRGP4 $1127
INDIRB
ASGNB 12
ADDRLP4 872
ADDRGP4 $1128
INDIRB
ASGNB 12
line 3281
;3274:	weaponinfo_t wi;
;3275:	aas_entityinfo_t entinfo;
;3276:	bot_goal_t goal;
;3277:	bsp_trace_t trace;
;3278:	vec3_t target;
;3279:
;3280:	//if the bot has no enemy
;3281:	if (bs->enemy < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1129
line 3282
;3282:		return;
ADDRGP4 $1126
JUMPV
LABELV $1129
line 3285
;3283:	}
;3284:	//get the enemy entity information
;3285:	BotEntityInfo(bs->enemy, &entinfo);
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
line 3287
;3286:	//if this is not a player (should be an obelisk)
;3287:	if (bs->enemy >= MAX_CLIENTS) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 64
LTI4 $1131
line 3289
;3288:		//if the obelisk is visible
;3289:		VectorCopy(entinfo.origin, target);
ADDRLP4 828
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3298
;3290:#ifdef MISSIONPACK
;3291:		// if attacking an obelisk
;3292:		if ( bs->enemy == redobelisk.entitynum ||
;3293:			bs->enemy == blueobelisk.entitynum ) {
;3294:			target[2] += 32;
;3295:		}
;3296:#endif
;3297:		//aim at the obelisk
;3298:		VectorSubtract(target, bs->eye, dir);
ADDRLP4 984
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 828
INDIRF4
ADDRLP4 984
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 828+4
INDIRF4
ADDRLP4 984
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 828+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3299
;3299:		vectoangles(dir, bs->ideal_viewangles);
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
line 3301
;3300:		//set the aim target before trying to attack
;3301:		VectorCopy(target, bs->aimtarget);
ADDRFP4 0
INDIRP4
CNSTI4 6220
ADDP4
ADDRLP4 828
INDIRB
ASGNB 12
line 3302
;3302:		return;
ADDRGP4 $1126
JUMPV
LABELV $1131
line 3307
;3303:	}
;3304:	//
;3305:	//BotAI_Print(PRT_MESSAGE, "client %d: aiming at client %d\n", bs->entitynum, bs->enemy);
;3306:	//
;3307:	aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL, 0, 1);
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
line 3308
;3308:	aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY, 0, 1);
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
line 3310
;3309:	//
;3310:	if (aim_skill > 0.95) {
ADDRLP4 736
INDIRF4
CNSTF4 1064514355
LEF4 $1138
line 3312
;3311:		//don't aim too early
;3312:		reactiontime = 0.5 * trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_REACTIONTIME, 0, 1);
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
line 3313
;3313:		if (bs->enemysight_time > FloatTime() - reactiontime) return;
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
LEF4 $1140
ADDRGP4 $1126
JUMPV
LABELV $1140
line 3314
;3314:		if (bs->teleport_time > FloatTime() - reactiontime) return;
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
LEF4 $1142
ADDRGP4 $1126
JUMPV
LABELV $1142
line 3315
;3315:	}
LABELV $1138
line 3318
;3316:
;3317:	//get the weapon information
;3318:	trap_BotGetWeaponInfo(bs->ws, bs->weaponnum, &wi);
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
line 3320
;3319:	//get the weapon specific aim accuracy and or aim skill
;3320:	if (wi.number == WP_MACHINEGUN) {
ADDRLP4 160+4
INDIRI4
CNSTI4 2
NEI4 $1144
line 3321
;3321:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_MACHINEGUN, 0, 1);
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
line 3322
;3322:	}
ADDRGP4 $1145
JUMPV
LABELV $1144
line 3323
;3323:	else if (wi.number == WP_SHOTGUN) {
ADDRLP4 160+4
INDIRI4
CNSTI4 3
NEI4 $1147
line 3324
;3324:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_SHOTGUN, 0, 1);
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
line 3325
;3325:	}
ADDRGP4 $1148
JUMPV
LABELV $1147
line 3326
;3326:	else if (wi.number == WP_GRENADE_LAUNCHER) {
ADDRLP4 160+4
INDIRI4
CNSTI4 4
NEI4 $1150
line 3327
;3327:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_GRENADELAUNCHER, 0, 1);
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
line 3328
;3328:		aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL_GRENADELAUNCHER, 0, 1);
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
line 3329
;3329:	}
ADDRGP4 $1151
JUMPV
LABELV $1150
line 3330
;3330:	else if (wi.number == WP_ROCKET_LAUNCHER) {
ADDRLP4 160+4
INDIRI4
CNSTI4 5
NEI4 $1153
line 3331
;3331:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_ROCKETLAUNCHER, 0, 1);
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
line 3332
;3332:		aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL_ROCKETLAUNCHER, 0, 1);
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
line 3333
;3333:	}
ADDRGP4 $1154
JUMPV
LABELV $1153
line 3334
;3334:	else if (wi.number == WP_LIGHTNING) {
ADDRLP4 160+4
INDIRI4
CNSTI4 6
NEI4 $1156
line 3335
;3335:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_LIGHTNING, 0, 1);
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
line 3336
;3336:	}
ADDRGP4 $1157
JUMPV
LABELV $1156
line 3337
;3337:	else if (wi.number == WP_RAILGUN) {
ADDRLP4 160+4
INDIRI4
CNSTI4 7
NEI4 $1159
line 3338
;3338:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_RAILGUN, 0, 1);
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
line 3339
;3339:	}
ADDRGP4 $1160
JUMPV
LABELV $1159
line 3340
;3340:	else if (wi.number == WP_PLASMAGUN) {
ADDRLP4 160+4
INDIRI4
CNSTI4 8
NEI4 $1162
line 3341
;3341:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_PLASMAGUN, 0, 1);
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
line 3342
;3342:		aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL_PLASMAGUN, 0, 1);
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
line 3343
;3343:	}
ADDRGP4 $1163
JUMPV
LABELV $1162
line 3344
;3344:	else if (wi.number == WP_BFG) {
ADDRLP4 160+4
INDIRI4
CNSTI4 9
NEI4 $1165
line 3345
;3345:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_BFG10K, 0, 1);
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
line 3346
;3346:		aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL_BFG10K, 0, 1);
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
line 3347
;3347:	}
LABELV $1165
LABELV $1163
LABELV $1160
LABELV $1157
LABELV $1154
LABELV $1151
LABELV $1148
LABELV $1145
line 3349
;3348:	//
;3349:	if (aim_accuracy <= 0) aim_accuracy = 0.0001f;
ADDRLP4 156
INDIRF4
CNSTF4 0
GTF4 $1168
ADDRLP4 156
CNSTF4 953267991
ASGNF4
LABELV $1168
line 3351
;3350:	//get the enemy entity information
;3351:	BotEntityInfo(bs->enemy, &entinfo);
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
line 3353
;3352:	//if the enemy is invisible then shoot crappy most of the time
;3353:	if (EntityIsInvisible(&entinfo)) {
ADDRLP4 0
ARGP4
ADDRLP4 996
ADDRGP4 EntityIsInvisible
CALLI4
ASGNI4
ADDRLP4 996
INDIRI4
CNSTI4 0
EQI4 $1170
line 3354
;3354:		if (random() > 0.1) aim_accuracy *= 0.4f;
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
LEF4 $1172
ADDRLP4 156
CNSTF4 1053609165
ADDRLP4 156
INDIRF4
MULF4
ASGNF4
LABELV $1172
line 3355
;3355:	}
LABELV $1170
line 3357
;3356:	//
;3357:	VectorSubtract(entinfo.origin, entinfo.lastvisorigin, enemyvelocity);
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
line 3358
;3358:	VectorScale(enemyvelocity, 1 / entinfo.update_time, enemyvelocity);
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
line 3360
;3359:	//enemy origin and velocity is remembered every 0.5 seconds
;3360:	if (bs->enemyposition_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6140
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $1193
line 3362
;3361:		//
;3362:		bs->enemyposition_time = FloatTime() + 0.5;
ADDRFP4 0
INDIRP4
CNSTI4 6140
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 3363
;3363:		VectorCopy(enemyvelocity, bs->enemyvelocity);
ADDRFP4 0
INDIRP4
CNSTI4 6232
ADDP4
ADDRLP4 712
INDIRB
ASGNB 12
line 3364
;3364:		VectorCopy(entinfo.origin, bs->enemyorigin);
ADDRFP4 0
INDIRP4
CNSTI4 6244
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3365
;3365:	}
LABELV $1193
line 3367
;3366:	//if not extremely skilled
;3367:	if (aim_skill < 0.9) {
ADDRLP4 736
INDIRF4
CNSTF4 1063675494
GEF4 $1196
line 3368
;3368:		VectorSubtract(entinfo.origin, bs->enemyorigin, dir);
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
line 3370
;3369:		//if the enemy moved a bit
;3370:		if (VectorLengthSquared(dir) > Square(48)) {
ADDRLP4 140
ARGP4
ADDRLP4 1008
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1008
INDIRF4
CNSTF4 1158676480
LEF4 $1205
line 3372
;3371:			//if the enemy changed direction
;3372:			if (DotProduct(bs->enemyvelocity, enemyvelocity) < 0) {
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
GEF4 $1207
line 3374
;3373:				//aim accuracy should be worse now
;3374:				aim_accuracy *= 0.7f;
ADDRLP4 156
CNSTF4 1060320051
ADDRLP4 156
INDIRF4
MULF4
ASGNF4
line 3375
;3375:			}
LABELV $1207
line 3376
;3376:		}
LABELV $1205
line 3377
;3377:	}
LABELV $1196
line 3379
;3378:	//check visibility of enemy
;3379:	enemyvisible = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, bs->enemy);
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
ADDRLP4 824
ADDRLP4 1008
INDIRF4
CVFI4 4
ASGNI4
line 3381
;3380:	//if the enemy is visible
;3381:	if (enemyvisible) {
ADDRLP4 824
INDIRI4
CNSTI4 0
EQI4 $1211
line 3383
;3382:		//
;3383:		VectorCopy(entinfo.origin, bestorigin);
ADDRLP4 724
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3384
;3384:		bestorigin[2] += 8;
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 3387
;3385:		//get the start point shooting from
;3386:		//NOTE: the x and y projectile start offsets are ignored
;3387:		VectorCopy(bs->origin, start);
ADDRLP4 844
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 3388
;3388:		start[2] += bs->cur_ps.viewheight;
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
line 3389
;3389:		start[2] += wi.offset[2];
ADDRLP4 844+8
ADDRLP4 844+8
INDIRF4
ADDRLP4 160+292+8
INDIRF4
ADDF4
ASGNF4
line 3391
;3390:		//
;3391:		BotAI_Trace(&trace, start, mins, maxs, bestorigin, bs->entitynum, MASK_SHOT);
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
line 3393
;3392:		//if the enemy is NOT hit
;3393:		if (trace.fraction <= 1 && trace.ent != entinfo.number) {
ADDRLP4 740+8
INDIRF4
CNSTF4 1065353216
GTF4 $1219
ADDRLP4 740+80
INDIRI4
ADDRLP4 0+20
INDIRI4
EQI4 $1219
line 3394
;3394:			bestorigin[2] += 16;
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 3395
;3395:		}
LABELV $1219
line 3397
;3396:		//if it is not an instant hit weapon the bot might want to predict the enemy
;3397:		if (wi.speed) {
ADDRLP4 160+272
INDIRF4
CNSTF4 0
EQF4 $1225
line 3399
;3398:			//
;3399:			VectorSubtract(bestorigin, bs->origin, dir);
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
line 3400
;3400:			dist = VectorLength(dir);
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
line 3401
;3401:			VectorSubtract(entinfo.origin, bs->enemyorigin, dir);
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
line 3403
;3402:			//if the enemy is NOT pretty far away and strafing just small steps left and right
;3403:			if (!(dist > 100 && VectorLengthSquared(dir) < Square(32))) {
ADDRLP4 840
INDIRF4
CNSTF4 1120403456
LEF4 $1241
ADDRLP4 140
ARGP4
ADDRLP4 1024
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1024
INDIRF4
CNSTF4 1149239296
LTF4 $1239
LABELV $1241
line 3405
;3404:				//if skilled anough do exact prediction
;3405:				if (aim_skill > 0.8 &&
ADDRLP4 736
INDIRF4
CNSTF4 1061997773
LEF4 $1242
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1242
line 3407
;3406:						//if the weapon is ready to fire
;3407:						bs->cur_ps.weaponstate == WEAPON_READY) {
line 3411
;3408:					aas_clientmove_t move;
;3409:					vec3_t origin;
;3410:
;3411:					VectorSubtract(entinfo.origin, bs->origin, dir);
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
line 3413
;3412:					//distance towards the enemy
;3413:					dist = VectorLength(dir);
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
line 3415
;3414:					//direction the enemy is moving in
;3415:					VectorSubtract(entinfo.origin, entinfo.lastvisorigin, dir);
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
line 3417
;3416:					//
;3417:					VectorScale(dir, 1 / entinfo.update_time, dir);
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
line 3419
;3418:					//
;3419:					VectorCopy(entinfo.origin, origin);
ADDRLP4 1028
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3420
;3420:					origin[2] += 1;
ADDRLP4 1028+8
ADDRLP4 1028+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 3422
;3421:					//
;3422:					VectorClear(cmdmove);
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
line 3424
;3423:					//AAS_ClearShownDebugLines();
;3424:					trap_AAS_PredictClientMovement(&move, bs->enemy, origin,
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
line 3428
;3425:														PRESENCE_CROUCH, qfalse,
;3426:														dir, cmdmove, 0,
;3427:														dist * 10 / wi.speed, 0.1f, 0, 0, qfalse);
;3428:					VectorCopy(move.endpos, bestorigin);
ADDRLP4 724
ADDRLP4 1040
INDIRB
ASGNB 12
line 3430
;3429:					//BotAI_Print(PRT_MESSAGE, "%1.1f predicted speed = %f, frames = %f\n", FloatTime(), VectorLength(dir), dist * 10 / wi.speed);
;3430:				}
ADDRGP4 $1243
JUMPV
LABELV $1242
line 3432
;3431:				//if not that skilled do linear prediction
;3432:				else if (aim_skill > 0.4) {
ADDRLP4 736
INDIRF4
CNSTF4 1053609165
LEF4 $1275
line 3433
;3433:					VectorSubtract(entinfo.origin, bs->origin, dir);
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
line 3435
;3434:					//distance towards the enemy
;3435:					dist = VectorLength(dir);
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
line 3437
;3436:					//direction the enemy is moving in
;3437:					VectorSubtract(entinfo.origin, entinfo.lastvisorigin, dir);
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
line 3438
;3438:					dir[2] = 0;
ADDRLP4 140+8
CNSTF4 0
ASGNF4
line 3440
;3439:					//
;3440:					speed = VectorNormalize(dir) / entinfo.update_time;
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
line 3443
;3441:					//botimport.Print(PRT_MESSAGE, "speed = %f, wi->speed = %f\n", speed, wi->speed);
;3442:					//best spot to aim at
;3443:					VectorMA(entinfo.origin, (dist / wi.speed) * speed, dir, bestorigin);
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
line 3444
;3444:				}
LABELV $1275
LABELV $1243
line 3445
;3445:			}
LABELV $1239
line 3446
;3446:		}
LABELV $1225
line 3448
;3447:		//if the projectile does radial damage
;3448:		if (aim_skill > 0.6 && wi.proj.damagetype & DAMAGETYPE_RADIAL) {
ADDRLP4 736
INDIRF4
CNSTF4 1058642330
LEF4 $1310
ADDRLP4 160+344+180
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1310
line 3450
;3449:			//if the enemy isn't standing significantly higher than the bot
;3450:			if (entinfo.origin[2] < bs->origin[2] + 16) {
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
CNSTF4 1098907648
ADDF4
GEF4 $1314
line 3452
;3451:				//try to aim at the ground in front of the enemy
;3452:				VectorCopy(entinfo.origin, end);
ADDRLP4 956
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3453
;3453:				end[2] -= 64;
ADDRLP4 956+8
ADDRLP4 956+8
INDIRF4
CNSTF4 1115684864
SUBF4
ASGNF4
line 3454
;3454:				BotAI_Trace(&trace, entinfo.origin, NULL, NULL, end, entinfo.number, MASK_SHOT);
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
line 3456
;3455:				//
;3456:				VectorCopy(bestorigin, groundtarget);
ADDRLP4 944
ADDRLP4 724
INDIRB
ASGNB 12
line 3457
;3457:				if (trace.startsolid) groundtarget[2] = entinfo.origin[2] - 16;
ADDRLP4 740+4
INDIRI4
CNSTI4 0
EQI4 $1322
ADDRLP4 944+8
ADDRLP4 0+24+8
INDIRF4
CNSTF4 1098907648
SUBF4
ASGNF4
ADDRGP4 $1323
JUMPV
LABELV $1322
line 3458
;3458:				else groundtarget[2] = trace.endpos[2] - 8;
ADDRLP4 944+8
ADDRLP4 740+12+8
INDIRF4
CNSTF4 1090519040
SUBF4
ASGNF4
LABELV $1323
line 3460
;3459:				//trace a line from projectile start to ground target
;3460:				BotAI_Trace(&trace, start, NULL, NULL, groundtarget, bs->entitynum, MASK_SHOT);
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
line 3462
;3461:				//if hitpoint is not vertically too far from the ground target
;3462:				if (fabs(trace.endpos[2] - groundtarget[2]) < 50) {
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
GEF4 $1331
line 3463
;3463:					VectorSubtract(trace.endpos, groundtarget, dir);
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
line 3465
;3464:					//if the hitpoint is near anough the ground target
;3465:					if (VectorLengthSquared(dir) < Square(60)) {
ADDRLP4 140
ARGP4
ADDRLP4 1024
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1024
INDIRF4
CNSTF4 1163984896
GEF4 $1345
line 3466
;3466:						VectorSubtract(trace.endpos, start, dir);
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
line 3468
;3467:						//if the hitpoint is far anough from the bot
;3468:						if (VectorLengthSquared(dir) > Square(100)) {
ADDRLP4 140
ARGP4
ADDRLP4 1028
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1028
INDIRF4
CNSTF4 1176256512
LEF4 $1356
line 3470
;3469:							//check if the bot is visible from the ground target
;3470:							trace.endpos[2] += 1;
ADDRLP4 740+12+8
ADDRLP4 740+12+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 3471
;3471:							BotAI_Trace(&trace, trace.endpos, NULL, NULL, entinfo.origin, entinfo.number, MASK_SHOT);
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
line 3472
;3472:							if (trace.fraction >= 1) {
ADDRLP4 740+8
INDIRF4
CNSTF4 1065353216
LTF4 $1363
line 3474
;3473:								//botimport.Print(PRT_MESSAGE, "%1.1f aiming at ground\n", AAS_Time());
;3474:								VectorCopy(groundtarget, bestorigin);
ADDRLP4 724
ADDRLP4 944
INDIRB
ASGNB 12
line 3475
;3475:							}
LABELV $1363
line 3476
;3476:						}
LABELV $1356
line 3477
;3477:					}
LABELV $1345
line 3478
;3478:				}
LABELV $1331
line 3479
;3479:			}
LABELV $1314
line 3480
;3480:		}
LABELV $1310
line 3481
;3481:		bestorigin[0] += 20 * crandom() * (1 - aim_accuracy);
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
line 3482
;3482:		bestorigin[1] += 20 * crandom() * (1 - aim_accuracy);
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
line 3483
;3483:		bestorigin[2] += 10 * crandom() * (1 - aim_accuracy);
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
line 3484
;3484:	}
ADDRGP4 $1212
JUMPV
LABELV $1211
line 3485
;3485:	else {
line 3487
;3486:		//
;3487:		VectorCopy(bs->lastenemyorigin, bestorigin);
ADDRLP4 724
ADDRFP4 0
INDIRP4
CNSTI4 6548
ADDP4
INDIRB
ASGNB 12
line 3488
;3488:		bestorigin[2] += 8;
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 3490
;3489:		//if the bot is skilled anough
;3490:		if (aim_skill > 0.5) {
ADDRLP4 736
INDIRF4
CNSTF4 1056964608
LEF4 $1369
line 3492
;3491:			//do prediction shots around corners
;3492:			if (wi.number == WP_BFG ||
ADDRLP4 160+4
INDIRI4
CNSTI4 9
EQI4 $1377
ADDRLP4 160+4
INDIRI4
CNSTI4 5
EQI4 $1377
ADDRLP4 160+4
INDIRI4
CNSTI4 4
NEI4 $1371
LABELV $1377
line 3494
;3493:				wi.number == WP_ROCKET_LAUNCHER ||
;3494:				wi.number == WP_GRENADE_LAUNCHER) {
line 3496
;3495:				//create the chase goal
;3496:				goal.entitynum = bs->client;
ADDRLP4 884+40
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 3497
;3497:				goal.areanum = bs->areanum;
ADDRLP4 884+12
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ASGNI4
line 3498
;3498:				VectorCopy(bs->eye, goal.origin);
ADDRLP4 884
ADDRFP4 0
INDIRP4
CNSTI4 4936
ADDP4
INDIRB
ASGNB 12
line 3499
;3499:				VectorSet(goal.mins, -8, -8, -8);
ADDRLP4 884+16
CNSTF4 3238002688
ASGNF4
ADDRLP4 884+16+4
CNSTF4 3238002688
ASGNF4
ADDRLP4 884+16+8
CNSTF4 3238002688
ASGNF4
line 3500
;3500:				VectorSet(goal.maxs, 8, 8, 8);
ADDRLP4 884+28
CNSTF4 1090519040
ASGNF4
ADDRLP4 884+28+4
CNSTF4 1090519040
ASGNF4
ADDRLP4 884+28+8
CNSTF4 1090519040
ASGNF4
line 3502
;3501:				//
;3502:				if (trap_BotPredictVisiblePosition(bs->lastenemyorigin, bs->lastenemyareanum, &goal, TFL_DEFAULT, target)) {
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
ADDRLP4 828
ARGP4
ADDRLP4 1016
ADDRGP4 trap_BotPredictVisiblePosition
CALLI4
ASGNI4
ADDRLP4 1016
INDIRI4
CNSTI4 0
EQI4 $1390
line 3503
;3503:					VectorSubtract(target, bs->eye, dir);
ADDRLP4 1020
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 828
INDIRF4
ADDRLP4 1020
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 828+4
INDIRF4
ADDRLP4 1020
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 828+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3504
;3504:					if (VectorLengthSquared(dir) > Square(80)) {
ADDRLP4 140
ARGP4
ADDRLP4 1024
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1024
INDIRF4
CNSTF4 1170735104
LEF4 $1396
line 3505
;3505:						VectorCopy(target, bestorigin);
ADDRLP4 724
ADDRLP4 828
INDIRB
ASGNB 12
line 3506
;3506:						bestorigin[2] -= 20;
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1101004800
SUBF4
ASGNF4
line 3507
;3507:					}
LABELV $1396
line 3508
;3508:				}
LABELV $1390
line 3509
;3509:				aim_accuracy = 1;
ADDRLP4 156
CNSTF4 1065353216
ASGNF4
line 3510
;3510:			}
LABELV $1371
line 3511
;3511:		}
LABELV $1369
line 3512
;3512:	}
LABELV $1212
line 3514
;3513:	//
;3514:	if (enemyvisible) {
ADDRLP4 824
INDIRI4
CNSTI4 0
EQI4 $1399
line 3515
;3515:		BotAI_Trace(&trace, bs->eye, NULL, NULL, bestorigin, bs->entitynum, MASK_SHOT);
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
line 3516
;3516:		VectorCopy(trace.endpos, bs->aimtarget);
ADDRFP4 0
INDIRP4
CNSTI4 6220
ADDP4
ADDRLP4 740+12
INDIRB
ASGNB 12
line 3517
;3517:	}
ADDRGP4 $1400
JUMPV
LABELV $1399
line 3518
;3518:	else {
line 3519
;3519:		VectorCopy(bestorigin, bs->aimtarget);
ADDRFP4 0
INDIRP4
CNSTI4 6220
ADDP4
ADDRLP4 724
INDIRB
ASGNB 12
line 3520
;3520:	}
LABELV $1400
line 3522
;3521:	//get aim direction
;3522:	VectorSubtract(bestorigin, bs->eye, dir);
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
line 3524
;3523:	//
;3524:	if (wi.number == WP_MACHINEGUN ||
ADDRLP4 160+4
INDIRI4
CNSTI4 2
EQI4 $1414
ADDRLP4 160+4
INDIRI4
CNSTI4 3
EQI4 $1414
ADDRLP4 160+4
INDIRI4
CNSTI4 6
EQI4 $1414
ADDRLP4 160+4
INDIRI4
CNSTI4 7
NEI4 $1406
LABELV $1414
line 3527
;3525:		wi.number == WP_SHOTGUN ||
;3526:		wi.number == WP_LIGHTNING ||
;3527:		wi.number == WP_RAILGUN) {
line 3529
;3528:		//distance towards the enemy
;3529:		dist = VectorLength(dir);
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
line 3530
;3530:		if (dist > 150) dist = 150;
ADDRLP4 840
INDIRF4
CNSTF4 1125515264
LEF4 $1415
ADDRLP4 840
CNSTF4 1125515264
ASGNF4
LABELV $1415
line 3531
;3531:		f = 0.6 + dist / 150 * 0.4;
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
line 3532
;3532:		aim_accuracy *= f;
ADDRLP4 156
ADDRLP4 156
INDIRF4
ADDRLP4 940
INDIRF4
MULF4
ASGNF4
line 3533
;3533:	}
LABELV $1406
line 3535
;3534:	//add some random stuff to the aim direction depending on the aim accuracy
;3535:	if (aim_accuracy < 0.8) {
ADDRLP4 156
INDIRF4
CNSTF4 1061997773
GEF4 $1417
line 3536
;3536:		VectorNormalize(dir);
ADDRLP4 140
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3537
;3537:		for (i = 0; i < 3; i++) dir[i] += 0.3 * crandom() * (1 - aim_accuracy);
ADDRLP4 152
CNSTI4 0
ASGNI4
LABELV $1419
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
LABELV $1420
ADDRLP4 152
ADDRLP4 152
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 3
LTI4 $1419
line 3538
;3538:	}
LABELV $1417
line 3540
;3539:	//set the ideal view angles
;3540:	vectoangles(dir, bs->ideal_viewangles);
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
line 3542
;3541:	//take the weapon spread into account for lower skilled bots
;3542:	bs->ideal_viewangles[PITCH] += 6 * wi.vspread * crandom() * (1 - aim_accuracy);
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
line 3543
;3543:	bs->ideal_viewangles[PITCH] = AngleMod(bs->ideal_viewangles[PITCH]);
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
line 3544
;3544:	bs->ideal_viewangles[YAW] += 6 * wi.hspread * crandom() * (1 - aim_accuracy);
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
line 3545
;3545:	bs->ideal_viewangles[YAW] = AngleMod(bs->ideal_viewangles[YAW]);
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
line 3547
;3546:	//if the bots should be really challenging
;3547:	if (bot_challenge.integer) {
ADDRGP4 bot_challenge+12
INDIRI4
CNSTI4 0
EQI4 $1425
line 3549
;3548:		//if the bot is really accurate and has the enemy in view for some time
;3549:		if (aim_accuracy > 0.9 && bs->enemysight_time < FloatTime() - 1) {
ADDRLP4 156
INDIRF4
CNSTF4 1063675494
LEF4 $1428
ADDRFP4 0
INDIRP4
CNSTI4 6132
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
GEF4 $1428
line 3551
;3550:			//set the view angles directly
;3551:			if (bs->ideal_viewangles[PITCH] > 180) bs->ideal_viewangles[PITCH] -= 360;
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
INDIRF4
CNSTF4 1127481344
LEF4 $1430
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
LABELV $1430
line 3552
;3552:			VectorCopy(bs->ideal_viewangles, bs->viewangles);
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
line 3553
;3553:			trap_EA_View(bs->client, bs->viewangles);
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
line 3554
;3554:		}
LABELV $1428
line 3555
;3555:	}
LABELV $1425
line 3556
;3556:}
LABELV $1126
endproc BotAimAtEnemy 1144 52
lit
align 4
LABELV $1433
byte 4 3238002688
byte 4 3238002688
byte 4 3238002688
align 4
LABELV $1434
byte 4 1090519040
byte 4 1090519040
byte 4 1090519040
export BotCheckAttack
code
proc BotCheckAttack 1028 28
line 3563
;3557:
;3558:/*
;3559:==================
;3560:BotCheckAttack
;3561:==================
;3562:*/
;3563:void BotCheckAttack(bot_state_t *bs) {
line 3572
;3564:	float points, reactiontime, fov, firethrottle;
;3565:	int attackentity;
;3566:	bsp_trace_t bsptrace;
;3567:	//float selfpreservation;
;3568:	vec3_t forward, right, start, end, dir, angles;
;3569:	weaponinfo_t wi;
;3570:	bsp_trace_t trace;
;3571:	aas_entityinfo_t entinfo;
;3572:	vec3_t mins = {-8, -8, -8}, maxs = {8, 8, 8};
ADDRLP4 808
ADDRGP4 $1433
INDIRB
ASGNB 12
ADDRLP4 820
ADDRGP4 $1434
INDIRB
ASGNB 12
line 3574
;3573:
;3574:	attackentity = bs->enemy;
ADDRLP4 576
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ASGNI4
line 3576
;3575:	//
;3576:	BotEntityInfo(attackentity, &entinfo);
ADDRLP4 576
INDIRI4
ARGI4
ADDRLP4 832
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3578
;3577:	// if not attacking a player
;3578:	if (attackentity >= MAX_CLIENTS) {
ADDRLP4 576
INDIRI4
CNSTI4 64
LTI4 $1435
line 3590
;3579:#ifdef MISSIONPACK
;3580:		// if attacking an obelisk
;3581:		if ( entinfo.number == redobelisk.entitynum ||
;3582:			entinfo.number == blueobelisk.entitynum ) {
;3583:			// if obelisk is respawning return
;3584:			if ( g_entities[entinfo.number].activator &&
;3585:				g_entities[entinfo.number].activator->s.frame == 2 ) {
;3586:				return;
;3587:			}
;3588:		}
;3589:#endif
;3590:	}
LABELV $1435
line 3592
;3591:	//
;3592:	reactiontime = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_REACTIONTIME, 0, 1);
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
line 3593
;3593:	if (bs->enemysight_time > FloatTime() - reactiontime) return;
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
LEF4 $1437
ADDRGP4 $1432
JUMPV
LABELV $1437
line 3594
;3594:	if (bs->teleport_time > FloatTime() - reactiontime) return;
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
LEF4 $1439
ADDRGP4 $1432
JUMPV
LABELV $1439
line 3596
;3595:	//if changing weapons
;3596:	if (bs->weaponchange_time > FloatTime() - 0.1) return;
ADDRFP4 0
INDIRP4
CNSTI4 6192
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1036831949
SUBF4
LEF4 $1441
ADDRGP4 $1432
JUMPV
LABELV $1441
line 3598
;3597:	//check fire throttle characteristic
;3598:	if (bs->firethrottlewait_time > FloatTime()) return;
ADDRFP4 0
INDIRP4
CNSTI4 6196
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $1443
ADDRGP4 $1432
JUMPV
LABELV $1443
line 3599
;3599:	firethrottle = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_FIRETHROTTLE, 0, 1);
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
ADDRLP4 792
ADDRLP4 980
INDIRF4
ASGNF4
line 3600
;3600:	if (bs->firethrottleshoot_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6200
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $1445
line 3601
;3601:		if (random() > firethrottle) {
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
ADDRLP4 792
INDIRF4
LEF4 $1447
line 3602
;3602:			bs->firethrottlewait_time = FloatTime() + firethrottle;
ADDRFP4 0
INDIRP4
CNSTI4 6196
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 792
INDIRF4
ADDF4
ASGNF4
line 3603
;3603:			bs->firethrottleshoot_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6200
ADDP4
CNSTF4 0
ASGNF4
line 3604
;3604:		}
ADDRGP4 $1448
JUMPV
LABELV $1447
line 3605
;3605:		else {
line 3606
;3606:			bs->firethrottleshoot_time = FloatTime() + 1 - firethrottle;
ADDRFP4 0
INDIRP4
CNSTI4 6200
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
ADDF4
ADDRLP4 792
INDIRF4
SUBF4
ASGNF4
line 3607
;3607:			bs->firethrottlewait_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6196
ADDP4
CNSTF4 0
ASGNF4
line 3608
;3608:		}
LABELV $1448
line 3609
;3609:	}
LABELV $1445
line 3612
;3610:	//
;3611:	//
;3612:	VectorSubtract(bs->aimtarget, bs->eye, dir);
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
line 3614
;3613:	//
;3614:	if (bs->weaponnum == WP_GAUNTLET) {
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1451
line 3615
;3615:		if (VectorLengthSquared(dir) > Square(60)) {
ADDRLP4 580
ARGP4
ADDRLP4 992
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 992
INDIRF4
CNSTF4 1163984896
LEF4 $1453
line 3616
;3616:			return;
ADDRGP4 $1432
JUMPV
LABELV $1453
line 3618
;3617:		}
;3618:	}
LABELV $1451
line 3619
;3619:	if (VectorLengthSquared(dir) < Square(100))
ADDRLP4 580
ARGP4
ADDRLP4 992
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 992
INDIRF4
CNSTF4 1176256512
GEF4 $1455
line 3620
;3620:		fov = 120;
ADDRLP4 788
CNSTF4 1123024896
ASGNF4
ADDRGP4 $1456
JUMPV
LABELV $1455
line 3622
;3621:	else
;3622:		fov = 50;
ADDRLP4 788
CNSTF4 1112014848
ASGNF4
LABELV $1456
line 3624
;3623:	//
;3624:	vectoangles(dir, angles);
ADDRLP4 580
ARGP4
ADDRLP4 796
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3625
;3625:	if (!InFieldOfVision(bs->viewangles, fov, angles))
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
ADDRLP4 788
INDIRF4
ARGF4
ADDRLP4 796
ARGP4
ADDRLP4 996
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 996
INDIRI4
CNSTI4 0
NEI4 $1457
line 3626
;3626:		return;
ADDRGP4 $1432
JUMPV
LABELV $1457
line 3627
;3627:	BotAI_Trace(&bsptrace, bs->eye, NULL, NULL, bs->aimtarget, bs->client, CONTENTS_SOLID|CONTENTS_PLAYERCLIP);
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
line 3628
;3628:	if (bsptrace.fraction < 1 && bsptrace.ent != attackentity)
ADDRLP4 704+8
INDIRF4
CNSTF4 1065353216
GEF4 $1459
ADDRLP4 704+80
INDIRI4
ADDRLP4 576
INDIRI4
EQI4 $1459
line 3629
;3629:		return;
ADDRGP4 $1432
JUMPV
LABELV $1459
line 3632
;3630:
;3631:	//get the weapon info
;3632:	trap_BotGetWeaponInfo(bs->ws, bs->weaponnum, &wi);
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
line 3634
;3633:	//get the start point shooting from
;3634:	VectorCopy(bs->origin, start);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 3635
;3635:	start[2] += bs->cur_ps.viewheight;
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
line 3636
;3636:	AngleVectors(bs->viewangles, forward, right, NULL);
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
line 3637
;3637:	start[0] += forward[0] * wi.offset[0] + right[0] * wi.offset[1];
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
line 3638
;3638:	start[1] += forward[1] * wi.offset[0] + right[1] * wi.offset[1];
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
line 3639
;3639:	start[2] += forward[2] * wi.offset[0] + right[2] * wi.offset[1] + wi.offset[2];
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
line 3641
;3640:	//end point aiming at
;3641:	VectorMA(start, 1000, forward, end);
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
line 3643
;3642:	//a little back to make sure not inside a very close enemy
;3643:	VectorMA(start, -12, forward, start);
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
line 3644
;3644:	BotAI_Trace(&trace, start, mins, maxs, end, bs->entitynum, MASK_SHOT);
ADDRLP4 592
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 808
ARGP4
ADDRLP4 820
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
line 3646
;3645:	//if the entity is a client
;3646:	if (trace.ent > 0 && trace.ent <= MAX_CLIENTS) {
ADDRLP4 592+80
INDIRI4
CNSTI4 0
LEI4 $1493
ADDRLP4 592+80
INDIRI4
CNSTI4 64
GTI4 $1493
line 3647
;3647:		if (trace.ent != attackentity) {
ADDRLP4 592+80
INDIRI4
ADDRLP4 576
INDIRI4
EQI4 $1497
line 3649
;3648:			//if a teammate is hit
;3649:			if (BotSameTeam(bs, trace.ent))
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
EQI4 $1500
line 3650
;3650:				return;
ADDRGP4 $1432
JUMPV
LABELV $1500
line 3651
;3651:		}
LABELV $1497
line 3652
;3652:	}
LABELV $1493
line 3654
;3653:	//if won't hit the enemy or not attacking a player (obelisk)
;3654:	if (trace.ent != attackentity || attackentity >= MAX_CLIENTS) {
ADDRLP4 592+80
INDIRI4
ADDRLP4 576
INDIRI4
NEI4 $1506
ADDRLP4 576
INDIRI4
CNSTI4 64
LTI4 $1503
LABELV $1506
line 3656
;3655:		//if the projectile does radial damage
;3656:		if (wi.proj.damagetype & DAMAGETYPE_RADIAL) {
ADDRLP4 24+344+180
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1507
line 3657
;3657:			if (trace.fraction * 1000 < wi.proj.radius) {
CNSTF4 1148846080
ADDRLP4 592+8
INDIRF4
MULF4
ADDRLP4 24+344+172
INDIRF4
GEF4 $1511
line 3658
;3658:				points = (wi.proj.damage - 0.5 * trace.fraction * 1000) * 0.5;
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
line 3659
;3659:				if (points > 0) {
ADDRLP4 972
INDIRF4
CNSTF4 0
LEF4 $1519
line 3660
;3660:					return;
ADDRGP4 $1432
JUMPV
LABELV $1519
line 3662
;3661:				}
;3662:			}
LABELV $1511
line 3664
;3663:			//FIXME: check if a teammate gets radial damage
;3664:		}
LABELV $1507
line 3665
;3665:	}
LABELV $1503
line 3667
;3666:	//if fire has to be release to activate weapon
;3667:	if (wi.flags & WFL_FIRERELEASED) {
ADDRLP4 24+176
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1521
line 3668
;3668:		if (bs->flags & BFL_ATTACKED) {
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1522
line 3669
;3669:			trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 3670
;3670:		}
line 3671
;3671:	}
ADDRGP4 $1522
JUMPV
LABELV $1521
line 3672
;3672:	else {
line 3673
;3673:		trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 3674
;3674:	}
LABELV $1522
line 3675
;3675:	bs->flags ^= BFL_ATTACKED;
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
line 3676
;3676:}
LABELV $1432
endproc BotCheckAttack 1028 28
lit
align 4
LABELV $1532
byte 4 1143930880
byte 4 1129054208
byte 4 1143472128
align 4
LABELV $1533
byte 4 1148256256
byte 4 1139408896
byte 4 1143603200
align 4
LABELV $1534
byte 4 1134034944
byte 4 1135607808
byte 4 1147535360
export BotMapScripts
code
proc BotMapScripts 1424 16
line 3683
;3677:
;3678:/*
;3679:==================
;3680:BotMapScripts
;3681:==================
;3682:*/
;3683:void BotMapScripts(bot_state_t *bs) {
line 3691
;3684:	char info[1024];
;3685:	char mapname[128];
;3686:	int i, shootbutton;
;3687:	float aim_accuracy;
;3688:	aas_entityinfo_t entinfo;
;3689:	vec3_t dir;
;3690:
;3691:	trap_GetServerinfo(info, sizeof(info));
ADDRLP4 272
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetServerinfo
CALLV
pop
line 3693
;3692:
;3693:	strncpy(mapname, Info_ValueForKey( info, "mapname" ), sizeof(mapname)-1);
ADDRLP4 272
ARGP4
ADDRGP4 $1527
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
line 3694
;3694:	mapname[sizeof(mapname)-1] = '\0';
ADDRLP4 144+127
CNSTI1 0
ASGNI1
line 3696
;3695:
;3696:	if (!Q_stricmp(mapname, "q3tourney6")) {
ADDRLP4 144
ARGP4
ADDRGP4 $1531
ARGP4
ADDRLP4 1320
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1320
INDIRI4
CNSTI4 0
NEI4 $1529
line 3697
;3697:		vec3_t mins = {700, 204, 672}, maxs = {964, 468, 680};
ADDRLP4 1324
ADDRGP4 $1532
INDIRB
ASGNB 12
ADDRLP4 1336
ADDRGP4 $1533
INDIRB
ASGNB 12
line 3698
;3698:		vec3_t buttonorg = {304, 352, 920};
ADDRLP4 1348
ADDRGP4 $1534
INDIRB
ASGNB 12
line 3700
;3699:		//NOTE: NEVER use the func_bobbing in q3tourney6
;3700:		bs->tfl &= ~TFL_FUNCBOB;
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
line 3702
;3701:		//if the bot is below the bounding box
;3702:		if (bs->origin[0] > mins[0] && bs->origin[0] < maxs[0]) {
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
LEF4 $1535
ADDRLP4 1364
INDIRF4
ADDRLP4 1336
INDIRF4
GEF4 $1535
line 3703
;3703:			if (bs->origin[1] > mins[1] && bs->origin[1] < maxs[1]) {
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
LEF4 $1537
ADDRLP4 1368
INDIRF4
ADDRLP4 1336+4
INDIRF4
GEF4 $1537
line 3704
;3704:				if (bs->origin[2] < mins[2]) {
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRLP4 1324+8
INDIRF4
GEF4 $1541
line 3705
;3705:					return;
ADDRGP4 $1526
JUMPV
LABELV $1541
line 3707
;3706:				}
;3707:			}
LABELV $1537
line 3708
;3708:		}
LABELV $1535
line 3709
;3709:		shootbutton = qfalse;
ADDRLP4 1296
CNSTI4 0
ASGNI4
line 3711
;3710:		//if an enemy is below this bounding box then shoot the button
;3711:		for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 140
CNSTI4 0
ASGNI4
ADDRGP4 $1547
JUMPV
LABELV $1544
line 3713
;3712:
;3713:			if (i == bs->client) continue;
ADDRLP4 140
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1548
ADDRGP4 $1545
JUMPV
LABELV $1548
line 3715
;3714:			//
;3715:			BotEntityInfo(i, &entinfo);
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3717
;3716:			//
;3717:			if (!entinfo.valid) continue;
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1550
ADDRGP4 $1545
JUMPV
LABELV $1550
line 3719
;3718:			//if the enemy isn't dead and the enemy isn't the bot self
;3719:			if (EntityIsDead(&entinfo) || entinfo.number == bs->entitynum) continue;
ADDRLP4 0
ARGP4
ADDRLP4 1368
ADDRGP4 EntityIsDead
CALLI4
ASGNI4
ADDRLP4 1368
INDIRI4
CNSTI4 0
NEI4 $1555
ADDRLP4 0+20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
NEI4 $1552
LABELV $1555
ADDRGP4 $1545
JUMPV
LABELV $1552
line 3721
;3720:			//
;3721:			if (entinfo.origin[0] > mins[0] && entinfo.origin[0] < maxs[0]) {
ADDRLP4 0+24
INDIRF4
ADDRLP4 1324
INDIRF4
LEF4 $1556
ADDRLP4 0+24
INDIRF4
ADDRLP4 1336
INDIRF4
GEF4 $1556
line 3722
;3722:				if (entinfo.origin[1] > mins[1] && entinfo.origin[1] < maxs[1]) {
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1324+4
INDIRF4
LEF4 $1560
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1336+4
INDIRF4
GEF4 $1560
line 3723
;3723:					if (entinfo.origin[2] < mins[2]) {
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 1324+8
INDIRF4
GEF4 $1568
line 3725
;3724:						//if there's a team mate below the crusher
;3725:						if (BotSameTeam(bs, i)) {
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
EQI4 $1573
line 3726
;3726:							shootbutton = qfalse;
ADDRLP4 1296
CNSTI4 0
ASGNI4
line 3727
;3727:							break;
ADDRGP4 $1546
JUMPV
LABELV $1573
line 3729
;3728:						}
;3729:						else {
line 3730
;3730:							shootbutton = qtrue;
ADDRLP4 1296
CNSTI4 1
ASGNI4
line 3731
;3731:						}
line 3732
;3732:					}
LABELV $1568
line 3733
;3733:				}
LABELV $1560
line 3734
;3734:			}
LABELV $1556
line 3735
;3735:		}
LABELV $1545
line 3711
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1547
ADDRLP4 140
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $1575
ADDRLP4 140
INDIRI4
CNSTI4 64
LTI4 $1544
LABELV $1575
LABELV $1546
line 3736
;3736:		if (shootbutton) {
ADDRLP4 1296
INDIRI4
CNSTI4 0
EQI4 $1530
line 3737
;3737:			bs->flags |= BFL_IDEALVIEWSET;
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
line 3738
;3738:			VectorSubtract(buttonorg, bs->eye, dir);
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
line 3739
;3739:			vectoangles(dir, bs->ideal_viewangles);
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
line 3740
;3740:			aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY, 0, 1);
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
line 3741
;3741:			bs->ideal_viewangles[PITCH] += 8 * crandom() * (1 - aim_accuracy);
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
line 3742
;3742:			bs->ideal_viewangles[PITCH] = AngleMod(bs->ideal_viewangles[PITCH]);
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
line 3743
;3743:			bs->ideal_viewangles[YAW] += 8 * crandom() * (1 - aim_accuracy);
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
line 3744
;3744:			bs->ideal_viewangles[YAW] = AngleMod(bs->ideal_viewangles[YAW]);
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
line 3746
;3745:			//
;3746:			if (InFieldOfVision(bs->viewangles, 20, bs->ideal_viewangles)) {
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
EQI4 $1530
line 3747
;3747:				trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 3748
;3748:			}
line 3749
;3749:		}
line 3750
;3750:	}
ADDRGP4 $1530
JUMPV
LABELV $1529
line 3751
;3751:	else if (!Q_stricmp(mapname, "mpq3tourney6")) {
ADDRLP4 144
ARGP4
ADDRGP4 $1586
ARGP4
ADDRLP4 1324
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1324
INDIRI4
CNSTI4 0
NEI4 $1584
line 3753
;3752:		//NOTE: NEVER use the func_bobbing in mpq3tourney6
;3753:		bs->tfl &= ~TFL_FUNCBOB;
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
line 3754
;3754:	}
LABELV $1584
LABELV $1530
line 3755
;3755:}
LABELV $1526
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
line 3768
;3756:
;3757:/*
;3758:==================
;3759:BotSetMovedir
;3760:==================
;3761:*/
;3762:// bk001205 - made these static
;3763:static vec3_t VEC_UP		= {0, -1,  0};
;3764:static vec3_t MOVEDIR_UP	= {0,  0,  1};
;3765:static vec3_t VEC_DOWN		= {0, -2,  0};
;3766:static vec3_t MOVEDIR_DOWN	= {0,  0, -1};
;3767:
;3768:void BotSetMovedir(vec3_t angles, vec3_t movedir) {
line 3769
;3769:	if (VectorCompare(angles, VEC_UP)) {
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
EQI4 $1588
line 3770
;3770:		VectorCopy(MOVEDIR_UP, movedir);
ADDRFP4 4
INDIRP4
ADDRGP4 MOVEDIR_UP
INDIRB
ASGNB 12
line 3771
;3771:	}
ADDRGP4 $1589
JUMPV
LABELV $1588
line 3772
;3772:	else if (VectorCompare(angles, VEC_DOWN)) {
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
EQI4 $1590
line 3773
;3773:		VectorCopy(MOVEDIR_DOWN, movedir);
ADDRFP4 4
INDIRP4
ADDRGP4 MOVEDIR_DOWN
INDIRB
ASGNB 12
line 3774
;3774:	}
ADDRGP4 $1591
JUMPV
LABELV $1590
line 3775
;3775:	else {
line 3776
;3776:		AngleVectors(angles, movedir, NULL, NULL);
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
line 3777
;3777:	}
LABELV $1591
LABELV $1589
line 3778
;3778:}
LABELV $1587
endproc BotSetMovedir 12 16
export BotModelMinsMaxs
proc BotModelMinsMaxs 40 0
line 3787
;3779:
;3780:/*
;3781:==================
;3782:BotModelMinsMaxs
;3783:
;3784:this is ugly
;3785:==================
;3786:*/
;3787:int BotModelMinsMaxs(int modelindex, int eType, int contents, vec3_t mins, vec3_t maxs) {
line 3791
;3788:	gentity_t *ent;
;3789:	int i;
;3790:
;3791:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 3792
;3792:	for (i = 0; i < level.num_entities; i++, ent++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1596
JUMPV
LABELV $1593
line 3793
;3793:		if ( !ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1598
line 3794
;3794:			continue;
ADDRGP4 $1594
JUMPV
LABELV $1598
line 3796
;3795:		}
;3796:		if ( eType && ent->s.eType != eType) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $1600
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $1600
line 3797
;3797:			continue;
ADDRGP4 $1594
JUMPV
LABELV $1600
line 3799
;3798:		}
;3799:		if ( contents && ent->r.contents != contents) {
ADDRLP4 12
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $1602
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $1602
line 3800
;3800:			continue;
ADDRGP4 $1594
JUMPV
LABELV $1602
line 3802
;3801:		}
;3802:		if (ent->s.modelindex == modelindex) {
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $1604
line 3803
;3803:			if (mins)
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1606
line 3804
;3804:				VectorAdd(ent->r.currentOrigin, ent->r.mins, mins);
ADDRFP4 12
INDIRP4
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
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 500
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 448
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
CNSTI4 504
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDF4
ASGNF4
LABELV $1606
line 3805
;3805:			if (maxs)
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1608
line 3806
;3806:				VectorAdd(ent->r.currentOrigin, ent->r.maxs, maxs);
ADDRFP4 16
INDIRP4
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
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 500
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 460
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
CNSTI4 504
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRF4
ADDF4
ASGNF4
LABELV $1608
line 3807
;3807:			return i;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $1592
JUMPV
LABELV $1604
line 3809
;3808:		}
;3809:	}
LABELV $1594
line 3792
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
LABELV $1596
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $1593
line 3810
;3810:	if (mins)
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1610
line 3811
;3811:		VectorClear(mins);
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
LABELV $1610
line 3812
;3812:	if (maxs)
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1612
line 3813
;3813:		VectorClear(maxs);
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
LABELV $1612
line 3814
;3814:	return 0;
CNSTI4 0
RETI4
LABELV $1592
endproc BotModelMinsMaxs 40 0
lit
align 4
LABELV $1615
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
align 4
LABELV $1616
byte 4 3212836864
byte 4 3212836864
byte 4 3212836864
export BotFuncButtonActivateGoal
code
proc BotFuncButtonActivateGoal 648 28
line 3822
;3815:}
;3816:
;3817:/*
;3818:==================
;3819:BotFuncButtonGoal
;3820:==================
;3821:*/
;3822:int BotFuncButtonActivateGoal(bot_state_t *bs, int bspent, bot_activategoal_t *activategoal) {
line 3828
;3823:	int i, areas[10], numareas, modelindex, entitynum;
;3824:	char model[128];
;3825:	float lip, dist, health, angle;
;3826:	vec3_t size, start, end, mins, maxs, angles, points[10];
;3827:	vec3_t movedir, origin, goalorigin, bboxmins, bboxmaxs;
;3828:	vec3_t extramins = {1, 1, 1}, extramaxs = {-1, -1, -1};
ADDRLP4 304
ADDRGP4 $1615
INDIRB
ASGNB 12
ADDRLP4 316
ADDRGP4 $1616
INDIRB
ASGNB 12
line 3831
;3829:	bsp_trace_t bsptrace;
;3830:
;3831:	activategoal->shoot = qfalse;
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
line 3832
;3832:	VectorClear(activategoal->target);
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
line 3834
;3833:	//create a bot goal towards the button
;3834:	trap_AAS_ValueForBSPEpairKey(bspent, "model", model, sizeof(model));
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $277
ARGP4
ADDRLP4 160
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 3835
;3835:	if (!*model)
ADDRLP4 160
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1617
line 3836
;3836:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1614
JUMPV
LABELV $1617
line 3837
;3837:	modelindex = atoi(model+1);
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
line 3838
;3838:	if (!modelindex)
ADDRLP4 288
INDIRI4
CNSTI4 0
NEI4 $1620
line 3839
;3839:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1614
JUMPV
LABELV $1620
line 3840
;3840:	VectorClear(angles);
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
line 3841
;3841:	entitynum = BotModelMinsMaxs(modelindex, ET_MOVER, 0, mins, maxs);
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
line 3843
;3842:	//get the lip of the button
;3843:	trap_AAS_FloatForBSPEpairKey(bspent, "lip", &lip);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $1624
ARGP4
ADDRLP4 328
ARGP4
ADDRGP4 trap_AAS_FloatForBSPEpairKey
CALLI4
pop
line 3844
;3844:	if (!lip) lip = 4;
ADDRLP4 328
INDIRF4
CNSTF4 0
NEF4 $1625
ADDRLP4 328
CNSTF4 1082130432
ASGNF4
LABELV $1625
line 3846
;3845:	//get the move direction from the angle
;3846:	trap_AAS_FloatForBSPEpairKey(bspent, "angle", &angle);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $1627
ARGP4
ADDRLP4 352
ARGP4
ADDRGP4 trap_AAS_FloatForBSPEpairKey
CALLI4
pop
line 3847
;3847:	VectorSet(angles, 0, angle, 0);
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
line 3848
;3848:	BotSetMovedir(angles, movedir);
ADDRLP4 96
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 BotSetMovedir
CALLV
pop
line 3850
;3849:	//button size
;3850:	VectorSubtract(maxs, mins, size);
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
line 3852
;3851:	//button origin
;3852:	VectorAdd(mins, maxs, origin);
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
line 3853
;3853:	VectorScale(origin, 0.5, origin);
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
line 3855
;3854:	//touch distance of the button
;3855:	dist = fabs(movedir[0]) * size[0] + fabs(movedir[1]) * size[1] + fabs(movedir[2]) * size[2];
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
line 3856
;3856:	dist *= 0.5;
ADDRLP4 28
CNSTF4 1056964608
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 3858
;3857:	//
;3858:	trap_AAS_FloatForBSPEpairKey(bspent, "health", &health);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $1650
ARGP4
ADDRLP4 348
ARGP4
ADDRGP4 trap_AAS_FloatForBSPEpairKey
CALLI4
pop
line 3860
;3859:	//if the button is shootable
;3860:	if (health) {
ADDRLP4 348
INDIRF4
CNSTF4 0
EQF4 $1651
line 3862
;3861:		//calculate the shoot target
;3862:		VectorMA(origin, -dist, movedir, goalorigin);
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
line 3864
;3863:		//
;3864:		VectorCopy(goalorigin, activategoal->target);
ADDRFP4 8
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 124
INDIRB
ASGNB 12
line 3865
;3865:		activategoal->shoot = qtrue;
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 1
ASGNI4
line 3867
;3866:		//
;3867:		BotAI_Trace(&bsptrace, bs->eye, NULL, NULL, goalorigin, bs->entitynum, MASK_SHOT);
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
line 3869
;3868:		// if the button is visible from the current position
;3869:		if (bsptrace.fraction >= 1.0 || bsptrace.ent == entitynum) {
ADDRLP4 356+8
INDIRF4
CNSTF4 1065353216
GEF4 $1663
ADDRLP4 356+80
INDIRI4
ADDRLP4 344
INDIRI4
NEI4 $1659
LABELV $1663
line 3871
;3870:			//
;3871:			activategoal->goal.entitynum = entitynum; //NOTE: this is the entity number of the shootable button
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 344
INDIRI4
ASGNI4
line 3872
;3872:			activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 3873
;3873:			activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 3874
;3874:			VectorCopy(bs->origin, activategoal->goal.origin);
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
line 3875
;3875:			activategoal->goal.areanum = bs->areanum;
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
line 3876
;3876:			VectorSet(activategoal->goal.mins, -8, -8, -8);
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
line 3877
;3877:			VectorSet(activategoal->goal.maxs, 8, 8, 8);
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
line 3879
;3878:			//
;3879:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1614
JUMPV
LABELV $1659
line 3881
;3880:		}
;3881:		else {
line 3884
;3882:			//create a goal from where the button is visible and shoot at the button from there
;3883:			//add bounding box size to the dist
;3884:			trap_AAS_PresenceTypeBoundingBox(PRESENCE_CROUCH, bboxmins, bboxmaxs);
CNSTI4 4
ARGI4
ADDRLP4 136
ARGP4
ADDRLP4 148
ARGP4
ADDRGP4 trap_AAS_PresenceTypeBoundingBox
CALLV
pop
line 3885
;3885:			for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1664
line 3886
;3886:				if (movedir[i] < 0) dist += fabs(movedir[i]) * fabs(bboxmaxs[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1668
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
ADDRGP4 $1669
JUMPV
LABELV $1668
line 3887
;3887:				else dist += fabs(movedir[i]) * fabs(bboxmins[i]);
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
LABELV $1669
line 3888
;3888:			}
LABELV $1665
line 3885
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1664
line 3890
;3889:			//calculate the goal origin
;3890:			VectorMA(origin, -dist, movedir, goalorigin);
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
line 3892
;3891:			//
;3892:			VectorCopy(goalorigin, start);
ADDRLP4 292
ADDRLP4 124
INDIRB
ASGNB 12
line 3893
;3893:			start[2] += 24;
ADDRLP4 292+8
ADDRLP4 292+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 3894
;3894:			VectorCopy(start, end);
ADDRLP4 332
ADDRLP4 292
INDIRB
ASGNB 12
line 3895
;3895:			end[2] -= 512;
ADDRLP4 332+8
ADDRLP4 332+8
INDIRF4
CNSTF4 1140850688
SUBF4
ASGNF4
line 3896
;3896:			numareas = trap_AAS_TraceAreas(start, end, areas, points, 10);
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
line 3898
;3897:			//
;3898:			for (i = numareas-1; i >= 0; i--) {
ADDRLP4 0
ADDRLP4 108
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $1681
JUMPV
LABELV $1678
line 3899
;3899:				if (trap_AAS_AreaReachability(areas[i])) {
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
EQI4 $1682
line 3900
;3900:					break;
ADDRGP4 $1680
JUMPV
LABELV $1682
line 3902
;3901:				}
;3902:			}
LABELV $1679
line 3898
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $1681
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1678
LABELV $1680
line 3903
;3903:			if (i < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1684
line 3905
;3904:				// FIXME: trace forward and maybe in other directions to find a valid area
;3905:			}
LABELV $1684
line 3906
;3906:			if (i >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1686
line 3908
;3907:				//
;3908:				VectorCopy(points[i], activategoal->goal.origin);
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
line 3909
;3909:				activategoal->goal.areanum = areas[i];
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
line 3910
;3910:				VectorSet(activategoal->goal.mins, 8, 8, 8);
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
line 3911
;3911:				VectorSet(activategoal->goal.maxs, -8, -8, -8);
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
line 3913
;3912:				//
;3913:				for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1688
line 3914
;3914:				{
line 3915
;3915:					if (movedir[i] < 0) activategoal->goal.maxs[i] += fabs(movedir[i]) * fabs(extramaxs[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1692
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
ADDRGP4 $1693
JUMPV
LABELV $1692
line 3916
;3916:					else activategoal->goal.mins[i] += fabs(movedir[i]) * fabs(extramins[i]);
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
LABELV $1693
line 3917
;3917:				} //end for
LABELV $1689
line 3913
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1688
line 3919
;3918:				//
;3919:				activategoal->goal.entitynum = entitynum;
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 344
INDIRI4
ASGNI4
line 3920
;3920:				activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 3921
;3921:				activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 3922
;3922:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1614
JUMPV
LABELV $1686
line 3924
;3923:			}
;3924:		}
line 3925
;3925:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1614
JUMPV
LABELV $1651
line 3927
;3926:	}
;3927:	else {
line 3929
;3928:		//add bounding box size to the dist
;3929:		trap_AAS_PresenceTypeBoundingBox(PRESENCE_CROUCH, bboxmins, bboxmaxs);
CNSTI4 4
ARGI4
ADDRLP4 136
ARGP4
ADDRLP4 148
ARGP4
ADDRGP4 trap_AAS_PresenceTypeBoundingBox
CALLV
pop
line 3930
;3930:		for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1694
line 3931
;3931:			if (movedir[i] < 0) dist += fabs(movedir[i]) * fabs(bboxmaxs[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1698
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
ADDRGP4 $1699
JUMPV
LABELV $1698
line 3932
;3932:			else dist += fabs(movedir[i]) * fabs(bboxmins[i]);
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
LABELV $1699
line 3933
;3933:		}
LABELV $1695
line 3930
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1694
line 3935
;3934:		//calculate the goal origin
;3935:		VectorMA(origin, -dist, movedir, goalorigin);
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
line 3937
;3936:		//
;3937:		VectorCopy(goalorigin, start);
ADDRLP4 292
ADDRLP4 124
INDIRB
ASGNB 12
line 3938
;3938:		start[2] += 24;
ADDRLP4 292+8
ADDRLP4 292+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 3939
;3939:		VectorCopy(start, end);
ADDRLP4 332
ADDRLP4 292
INDIRB
ASGNB 12
line 3940
;3940:		end[2] -= 100;
ADDRLP4 332+8
ADDRLP4 332+8
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 3941
;3941:		numareas = trap_AAS_TraceAreas(start, end, areas, NULL, 10);
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
line 3943
;3942:		//
;3943:		for (i = 0; i < numareas; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1711
JUMPV
LABELV $1708
line 3944
;3944:			if (trap_AAS_AreaReachability(areas[i])) {
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
EQI4 $1712
line 3945
;3945:				break;
ADDRGP4 $1710
JUMPV
LABELV $1712
line 3947
;3946:			}
;3947:		}
LABELV $1709
line 3943
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1711
ADDRLP4 0
INDIRI4
ADDRLP4 108
INDIRI4
LTI4 $1708
LABELV $1710
line 3948
;3948:		if (i < numareas) {
ADDRLP4 0
INDIRI4
ADDRLP4 108
INDIRI4
GEI4 $1714
line 3950
;3949:			//
;3950:			VectorCopy(origin, activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 3951
;3951:			activategoal->goal.areanum = areas[i];
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
line 3952
;3952:			VectorSubtract(mins, origin, activategoal->goal.mins);
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
line 3953
;3953:			VectorSubtract(maxs, origin, activategoal->goal.maxs);
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
line 3955
;3954:			//
;3955:			for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1724
line 3956
;3956:			{
line 3957
;3957:				if (movedir[i] < 0) activategoal->goal.maxs[i] += fabs(movedir[i]) * fabs(extramaxs[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1728
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
ADDRGP4 $1729
JUMPV
LABELV $1728
line 3958
;3958:				else activategoal->goal.mins[i] += fabs(movedir[i]) * fabs(extramins[i]);
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
LABELV $1729
line 3959
;3959:			} //end for
LABELV $1725
line 3955
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1724
line 3961
;3960:			//
;3961:			activategoal->goal.entitynum = entitynum;
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 344
INDIRI4
ASGNI4
line 3962
;3962:			activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 3963
;3963:			activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 3964
;3964:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1614
JUMPV
LABELV $1714
line 3966
;3965:		}
;3966:	}
line 3967
;3967:	return qfalse;
CNSTI4 0
RETI4
LABELV $1614
endproc BotFuncButtonActivateGoal 648 28
export BotFuncDoorActivateGoal
proc BotFuncDoorActivateGoal 1096 20
line 3975
;3968:}
;3969:
;3970:/*
;3971:==================
;3972:BotFuncDoorGoal
;3973:==================
;3974:*/
;3975:int BotFuncDoorActivateGoal(bot_state_t *bs, int bspent, bot_activategoal_t *activategoal) {
line 3981
;3976:	int modelindex, entitynum;
;3977:	char model[MAX_INFO_STRING];
;3978:	vec3_t mins, maxs, origin, angles;
;3979:
;3980:	//shoot at the shootable door
;3981:	trap_AAS_ValueForBSPEpairKey(bspent, "model", model, sizeof(model));
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $277
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 3982
;3982:	if (!*model)
ADDRLP4 12
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1731
line 3983
;3983:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1730
JUMPV
LABELV $1731
line 3984
;3984:	modelindex = atoi(model+1);
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
line 3985
;3985:	if (!modelindex)
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $1734
line 3986
;3986:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1730
JUMPV
LABELV $1734
line 3987
;3987:	VectorClear(angles);
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
line 3988
;3988:	entitynum = BotModelMinsMaxs(modelindex, ET_MOVER, 0, mins, maxs);
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
line 3990
;3989:	//door origin
;3990:	VectorAdd(mins, maxs, origin);
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
line 3991
;3991:	VectorScale(origin, 0.5, origin);
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
line 3992
;3992:	VectorCopy(origin, activategoal->target);
ADDRFP4 8
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 3993
;3993:	activategoal->shoot = qtrue;
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 1
ASGNI4
line 3995
;3994:	//
;3995:	activategoal->goal.entitynum = entitynum; //NOTE: this is the entity number of the shootable door
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 1076
INDIRI4
ASGNI4
line 3996
;3996:	activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 3997
;3997:	activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 3998
;3998:	VectorCopy(bs->origin, activategoal->goal.origin);
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
line 3999
;3999:	activategoal->goal.areanum = bs->areanum;
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
line 4000
;4000:	VectorSet(activategoal->goal.mins, -8, -8, -8);
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
line 4001
;4001:	VectorSet(activategoal->goal.maxs, 8, 8, 8);
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
line 4002
;4002:	return qtrue;
CNSTI4 1
RETI4
LABELV $1730
endproc BotFuncDoorActivateGoal 1096 20
export BotTriggerMultipleActivateGoal
proc BotTriggerMultipleActivateGoal 300 20
line 4010
;4003:	} 
;4004:
;4005:/*
;4006:==================
;4007:BotTriggerMultipleGoal
;4008:==================
;4009:*/
;4010:int BotTriggerMultipleActivateGoal(bot_state_t *bs, int bspent, bot_activategoal_t *activategoal) {
line 4016
;4011:	int i, areas[10], numareas, modelindex, entitynum;
;4012:	char model[128];
;4013:	vec3_t start, end, mins, maxs, angles;
;4014:	vec3_t origin, goalorigin;
;4015:
;4016:	activategoal->shoot = qfalse;
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
line 4017
;4017:	VectorClear(activategoal->target);
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
line 4019
;4018:	//create a bot goal towards the trigger
;4019:	trap_AAS_ValueForBSPEpairKey(bspent, "model", model, sizeof(model));
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $277
ARGP4
ADDRLP4 84
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4020
;4020:	if (!*model)
ADDRLP4 84
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1749
line 4021
;4021:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1748
JUMPV
LABELV $1749
line 4022
;4022:	modelindex = atoi(model+1);
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
line 4023
;4023:	if (!modelindex)
ADDRLP4 224
INDIRI4
CNSTI4 0
NEI4 $1752
line 4024
;4024:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1748
JUMPV
LABELV $1752
line 4025
;4025:	VectorClear(angles);
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
line 4026
;4026:	entitynum = BotModelMinsMaxs(modelindex, 0, CONTENTS_TRIGGER, mins, maxs);
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
line 4028
;4027:	//trigger origin
;4028:	VectorAdd(mins, maxs, origin);
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
line 4029
;4029:	VectorScale(origin, 0.5, origin);
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
line 4030
;4030:	VectorCopy(origin, goalorigin);
ADDRLP4 252
ADDRLP4 4
INDIRB
ASGNB 12
line 4032
;4031:	//
;4032:	VectorCopy(goalorigin, start);
ADDRLP4 212
ADDRLP4 252
INDIRB
ASGNB 12
line 4033
;4033:	start[2] += 24;
ADDRLP4 212+8
ADDRLP4 212+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 4034
;4034:	VectorCopy(start, end);
ADDRLP4 228
ADDRLP4 212
INDIRB
ASGNB 12
line 4035
;4035:	end[2] -= 100;
ADDRLP4 228+8
ADDRLP4 228+8
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 4036
;4036:	numareas = trap_AAS_TraceAreas(start, end, areas, NULL, 10);
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
line 4038
;4037:	//
;4038:	for (i = 0; i < numareas; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1771
JUMPV
LABELV $1768
line 4039
;4039:		if (trap_AAS_AreaReachability(areas[i])) {
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
EQI4 $1772
line 4040
;4040:			break;
ADDRGP4 $1770
JUMPV
LABELV $1772
line 4042
;4041:		}
;4042:	}
LABELV $1769
line 4038
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1771
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $1768
LABELV $1770
line 4043
;4043:	if (i < numareas) {
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
GEI4 $1774
line 4044
;4044:		VectorCopy(origin, activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 4045
;4045:		activategoal->goal.areanum = areas[i];
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
line 4046
;4046:		VectorSubtract(mins, origin, activategoal->goal.mins);
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
line 4047
;4047:		VectorSubtract(maxs, origin, activategoal->goal.maxs);
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
line 4049
;4048:		//
;4049:		activategoal->goal.entitynum = entitynum;
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 264
INDIRI4
ASGNI4
line 4050
;4050:		activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 4051
;4051:		activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 4052
;4052:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1748
JUMPV
LABELV $1774
line 4054
;4053:	}
;4054:	return qfalse;
CNSTI4 0
RETI4
LABELV $1748
endproc BotTriggerMultipleActivateGoal 300 20
export BotPopFromActivateGoalStack
proc BotPopFromActivateGoalStack 4 8
line 4062
;4055:}
;4056:
;4057:/*
;4058:==================
;4059:BotPopFromActivateGoalStack
;4060:==================
;4061:*/
;4062:int BotPopFromActivateGoalStack(bot_state_t *bs) {
line 4063
;4063:	if (!bs->activatestack)
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1785
line 4064
;4064:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1784
JUMPV
LABELV $1785
line 4065
;4065:	BotEnableActivateGoalAreas(bs->activatestack, qtrue);
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
line 4066
;4066:	bs->activatestack->inuse = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CNSTI4 0
ASGNI4
line 4067
;4067:	bs->activatestack->justused_time = FloatTime();
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
line 4068
;4068:	bs->activatestack = bs->activatestack->next;
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
line 4069
;4069:	return qtrue;
CNSTI4 1
RETI4
LABELV $1784
endproc BotPopFromActivateGoalStack 4 8
export BotPushOntoActivateGoalStack
proc BotPushOntoActivateGoalStack 24 12
line 4077
;4070:}
;4071:
;4072:/*
;4073:==================
;4074:BotPushOntoActivateGoalStack
;4075:==================
;4076:*/
;4077:int BotPushOntoActivateGoalStack(bot_state_t *bs, bot_activategoal_t *activategoal) {
line 4081
;4078:	int i, best;
;4079:	float besttime;
;4080:
;4081:	best = -1;
ADDRLP4 8
CNSTI4 -1
ASGNI4
line 4082
;4082:	besttime = FloatTime() + 9999;
ADDRLP4 4
ADDRGP4 floattime
INDIRF4
CNSTF4 1176255488
ADDF4
ASGNF4
line 4084
;4083:	//
;4084:	for (i = 0; i < MAX_ACTIVATESTACK; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1788
line 4085
;4085:		if (!bs->activategoalheap[i].inuse) {
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
NEI4 $1792
line 4086
;4086:			if (bs->activategoalheap[i].justused_time < besttime) {
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
GEF4 $1794
line 4087
;4087:				besttime = bs->activategoalheap[i].justused_time;
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
line 4088
;4088:				best = i;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 4089
;4089:			}
LABELV $1794
line 4090
;4090:		}
LABELV $1792
line 4091
;4091:	}
LABELV $1789
line 4084
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $1788
line 4092
;4092:	if (best != -1) {
ADDRLP4 8
INDIRI4
CNSTI4 -1
EQI4 $1796
line 4093
;4093:		memcpy(&bs->activategoalheap[best], activategoal, sizeof(bot_activategoal_t));
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
line 4094
;4094:		bs->activategoalheap[best].inuse = qtrue;
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
line 4095
;4095:		bs->activategoalheap[best].next = bs->activatestack;
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
line 4096
;4096:		bs->activatestack = &bs->activategoalheap[best];
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
line 4097
;4097:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1787
JUMPV
LABELV $1796
line 4099
;4098:	}
;4099:	return qfalse;
CNSTI4 0
RETI4
LABELV $1787
endproc BotPushOntoActivateGoalStack 24 12
export BotClearActivateGoalStack
proc BotClearActivateGoalStack 0 4
line 4107
;4100:}
;4101:
;4102:/*
;4103:==================
;4104:BotClearActivateGoalStack
;4105:==================
;4106:*/
;4107:void BotClearActivateGoalStack(bot_state_t *bs) {
ADDRGP4 $1800
JUMPV
LABELV $1799
line 4109
;4108:	while(bs->activatestack)
;4109:		BotPopFromActivateGoalStack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotPopFromActivateGoalStack
CALLI4
pop
LABELV $1800
line 4108
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1799
line 4110
;4110:}
LABELV $1798
endproc BotClearActivateGoalStack 0 4
export BotEnableActivateGoalAreas
proc BotEnableActivateGoalAreas 12 8
line 4117
;4111:
;4112:/*
;4113:==================
;4114:BotEnableActivateGoalAreas
;4115:==================
;4116:*/
;4117:void BotEnableActivateGoalAreas(bot_activategoal_t *activategoal, int enable) {
line 4120
;4118:	int i;
;4119:
;4120:	if (activategoal->areasdisabled == !enable)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $1806
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $1807
JUMPV
LABELV $1806
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $1807
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $1803
line 4121
;4121:		return;
ADDRGP4 $1802
JUMPV
LABELV $1803
line 4122
;4122:	for (i = 0; i < activategoal->numareas; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1811
JUMPV
LABELV $1808
line 4123
;4123:		trap_AAS_EnableRoutingArea( activategoal->areas[i], enable );
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
LABELV $1809
line 4122
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1811
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
LTI4 $1808
line 4124
;4124:	activategoal->areasdisabled = !enable;
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $1813
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $1814
JUMPV
LABELV $1813
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $1814
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 4125
;4125:}
LABELV $1802
endproc BotEnableActivateGoalAreas 12 8
export BotIsGoingToActivateEntity
proc BotIsGoingToActivateEntity 8 0
line 4132
;4126:
;4127:/*
;4128:==================
;4129:BotIsGoingToActivateEntity
;4130:==================
;4131:*/
;4132:int BotIsGoingToActivateEntity(bot_state_t *bs, int entitynum) {
line 4136
;4133:	bot_activategoal_t *a;
;4134:	int i;
;4135:
;4136:	for (a = bs->activatestack; a; a = a->next) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $1819
JUMPV
LABELV $1816
line 4137
;4137:		if (a->time < FloatTime())
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $1820
line 4138
;4138:			continue;
ADDRGP4 $1817
JUMPV
LABELV $1820
line 4139
;4139:		if (a->goal.entitynum == entitynum)
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $1822
line 4140
;4140:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1815
JUMPV
LABELV $1822
line 4141
;4141:	}
LABELV $1817
line 4136
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
ASGNP4
LABELV $1819
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1816
line 4142
;4142:	for (i = 0; i < MAX_ACTIVATESTACK; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $1824
line 4143
;4143:		if (bs->activategoalheap[i].inuse)
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
EQI4 $1828
line 4144
;4144:			continue;
ADDRGP4 $1825
JUMPV
LABELV $1828
line 4146
;4145:		//
;4146:		if (bs->activategoalheap[i].goal.entitynum == entitynum) {
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
NEI4 $1830
line 4148
;4147:			// if the bot went for this goal less than 2 seconds ago
;4148:			if (bs->activategoalheap[i].justused_time > FloatTime() - 2)
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
LEF4 $1832
line 4149
;4149:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1815
JUMPV
LABELV $1832
line 4150
;4150:		}
LABELV $1830
line 4151
;4151:	}
LABELV $1825
line 4142
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 8
LTI4 $1824
line 4152
;4152:	return qfalse;
CNSTI4 0
RETI4
LABELV $1815
endproc BotIsGoingToActivateEntity 8 0
export BotGetActivateGoal
proc BotGetActivateGoal 3320 20
line 4165
;4153:}
;4154:
;4155:/*
;4156:==================
;4157:BotGetActivateGoal
;4158:
;4159:  returns the number of the bsp entity to activate
;4160:  goal->entitynum will be set to the game entity to activate
;4161:==================
;4162:*/
;4163://#define OBSTACLEDEBUG
;4164:
;4165:int BotGetActivateGoal(bot_state_t *bs, int entitynum, bot_activategoal_t *activategoal) {
line 4175
;4166:	int i, ent, cur_entities[10], spawnflags, modelindex, areas[MAX_ACTIVATEAREAS*2], numareas, t;
;4167:	char model[MAX_INFO_STRING], tmpmodel[128];
;4168:	char target[128], classname[128];
;4169:	float health;
;4170:	char targetname[10][128];
;4171:	aas_entityinfo_t entinfo;
;4172:	aas_areainfo_t areainfo;
;4173:	vec3_t origin, angles, absmins, absmaxs;
;4174:
;4175:	memset(activategoal, 0, sizeof(bot_activategoal_t));
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
line 4176
;4176:	BotEntityInfo(entitynum, &entinfo);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 3052
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 4177
;4177:	Com_sprintf(model, sizeof( model ), "*%d", entinfo.modelindex);
ADDRLP4 1712
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1835
ARGP4
ADDRLP4 3052+104
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 4178
;4178:	for (ent = trap_AAS_NextBSPEntity(0); ent; ent = trap_AAS_NextBSPEntity(ent)) {
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
ADDRGP4 $1840
JUMPV
LABELV $1837
line 4179
;4179:		if (!trap_AAS_ValueForBSPEpairKey(ent, "model", tmpmodel, sizeof(tmpmodel))) continue;
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $277
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
NEI4 $1841
ADDRGP4 $1838
JUMPV
LABELV $1841
line 4180
;4180:		if (!strcmp(model, tmpmodel)) break;
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
NEI4 $1843
ADDRGP4 $1839
JUMPV
LABELV $1843
line 4181
;4181:	}
LABELV $1838
line 4178
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
LABELV $1840
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1837
LABELV $1839
line 4182
;4182:	if (!ent) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1845
line 4183
;4183:		BotAI_Print(PRT_ERROR, "BotGetActivateGoal: no entity found with model %s\n", model);
CNSTI4 3
ARGI4
ADDRGP4 $1847
ARGP4
ADDRLP4 1712
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4184
;4184:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1834
JUMPV
LABELV $1845
line 4186
;4185:	}
;4186:	trap_AAS_ValueForBSPEpairKey(ent, "classname", classname, sizeof(classname));
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1848
ARGP4
ADDRLP4 1456
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4187
;4187:	if (!classname) {
ADDRLP4 1456
CVPU4 4
CNSTU4 0
NEU4 $1849
line 4188
;4188:		BotAI_Print(PRT_ERROR, "BotGetActivateGoal: entity with model %s has no classname\n", model);
CNSTI4 3
ARGI4
ADDRGP4 $1851
ARGP4
ADDRLP4 1712
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4189
;4189:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1834
JUMPV
LABELV $1849
line 4192
;4190:	}
;4191:	//if it is a door
;4192:	if (!strcmp(classname, "func_door")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $1854
ARGP4
ADDRLP4 3260
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3260
INDIRI4
CNSTI4 0
NEI4 $1852
line 4193
;4193:		if (trap_AAS_FloatForBSPEpairKey(ent, "health", &health)) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1650
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
EQI4 $1855
line 4195
;4194:			//if the door has health then the door must be shot to open
;4195:			if (health) {
ADDRLP4 3208
INDIRF4
CNSTF4 0
EQF4 $1857
line 4196
;4196:				BotFuncDoorActivateGoal(bs, ent, activategoal);
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
line 4197
;4197:				return ent;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1834
JUMPV
LABELV $1857
line 4199
;4198:			}
;4199:		}
LABELV $1855
line 4202
;4200:
;4201:	//if it is some glass
;4202: 	if (!strcmp(classname, "func_breakable")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $1861
ARGP4
ADDRLP4 3268
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3268
INDIRI4
CNSTI4 0
NEI4 $1859
line 4203
;4203: 		return ent;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1834
JUMPV
LABELV $1859
line 4207
;4204: 	}
;4205:	
;4206:		//
;4207:		trap_AAS_IntForBSPEpairKey(ent, "spawnflags", &spawnflags);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1862
ARGP4
ADDRLP4 3204
ARGP4
ADDRGP4 trap_AAS_IntForBSPEpairKey
CALLI4
pop
line 4209
;4208:		// if the door starts open then just wait for the door to return
;4209:		if ( spawnflags & 1 )
ADDRLP4 3204
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1863
line 4210
;4210:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $1834
JUMPV
LABELV $1863
line 4212
;4211:		//get the door origin
;4212:		if (!trap_AAS_VectorForBSPEpairKey(ent, "origin", origin)) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1867
ARGP4
ADDRLP4 3192
ARGP4
ADDRLP4 3272
ADDRGP4 trap_AAS_VectorForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3272
INDIRI4
CNSTI4 0
NEI4 $1865
line 4213
;4213:			VectorClear(origin);
ADDRLP4 3276
CNSTF4 0
ASGNF4
ADDRLP4 3192+8
ADDRLP4 3276
INDIRF4
ASGNF4
ADDRLP4 3192+4
ADDRLP4 3276
INDIRF4
ASGNF4
ADDRLP4 3192
ADDRLP4 3276
INDIRF4
ASGNF4
line 4214
;4214:		}
LABELV $1865
line 4216
;4215:		//if the door is open or opening already
;4216:		if (!VectorCompare(origin, entinfo.origin))
ADDRLP4 3192
ARGP4
ADDRLP4 3052+24
ARGP4
ADDRLP4 3276
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 3276
INDIRI4
CNSTI4 0
NEI4 $1870
line 4217
;4217:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $1834
JUMPV
LABELV $1870
line 4219
;4218:		// store all the areas the door is in
;4219:		trap_AAS_ValueForBSPEpairKey(ent, "model", model, sizeof(model));
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $277
ARGP4
ADDRLP4 1712
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4220
;4220:		if (*model) {
ADDRLP4 1712
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1873
line 4221
;4221:			modelindex = atoi(model+1);
ADDRLP4 1712+1
ARGP4
ADDRLP4 3280
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 3212
ADDRLP4 3280
INDIRI4
ASGNI4
line 4222
;4222:			if (modelindex) {
ADDRLP4 3212
INDIRI4
CNSTI4 0
EQI4 $1876
line 4223
;4223:				VectorClear(angles);
ADDRLP4 3284
CNSTF4 0
ASGNF4
ADDRLP4 3216+8
ADDRLP4 3284
INDIRF4
ASGNF4
ADDRLP4 3216+4
ADDRLP4 3284
INDIRF4
ASGNF4
ADDRLP4 3216
ADDRLP4 3284
INDIRF4
ASGNF4
line 4224
;4224:				BotModelMinsMaxs(modelindex, ET_MOVER, 0, absmins, absmaxs);
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
line 4226
;4225:				//
;4226:				numareas = trap_AAS_BBoxAreas(absmins, absmaxs, areas, MAX_ACTIVATEAREAS*2);
ADDRLP4 3228
ARGP4
ADDRLP4 3240
ARGP4
ADDRLP4 2740
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 3288
ADDRGP4 trap_AAS_BBoxAreas
CALLI4
ASGNI4
ADDRLP4 3048
ADDRLP4 3288
INDIRI4
ASGNI4
line 4228
;4227:				// store the areas with reachabilities first
;4228:				for (i = 0; i < numareas; i++) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $1883
JUMPV
LABELV $1880
line 4229
;4229:					if (activategoal->numareas >= MAX_ACTIVATEAREAS)
ADDRFP4 8
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 32
LTI4 $1884
line 4230
;4230:						break;
ADDRGP4 $1882
JUMPV
LABELV $1884
line 4231
;4231:					if ( !trap_AAS_AreaReachability(areas[i]) ) {
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ARGI4
ADDRLP4 3292
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 3292
INDIRI4
CNSTI4 0
NEI4 $1886
line 4232
;4232:						continue;
ADDRGP4 $1881
JUMPV
LABELV $1886
line 4234
;4233:					}
;4234:					trap_AAS_AreaInfo(areas[i], &areainfo);
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
line 4235
;4235:					if (areainfo.contents & AREACONTENTS_MOVER) {
ADDRLP4 2996
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $1888
line 4236
;4236:						activategoal->areas[activategoal->numareas++] = areas[i];
ADDRLP4 3300
ADDRFP4 8
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 3296
ADDRLP4 3300
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 3300
INDIRP4
ADDRLP4 3296
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 3304
CNSTI4 2
ASGNI4
ADDRLP4 3296
INDIRI4
ADDRLP4 3304
INDIRI4
LSHI4
ADDRFP4 8
INDIRP4
CNSTI4 104
ADDP4
ADDP4
ADDRLP4 132
INDIRI4
ADDRLP4 3304
INDIRI4
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ASGNI4
line 4237
;4237:					}
LABELV $1888
line 4238
;4238:				}
LABELV $1881
line 4228
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1883
ADDRLP4 132
INDIRI4
ADDRLP4 3048
INDIRI4
LTI4 $1880
LABELV $1882
line 4240
;4239:				// store any remaining areas
;4240:				for (i = 0; i < numareas; i++) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $1893
JUMPV
LABELV $1890
line 4241
;4241:					if (activategoal->numareas >= MAX_ACTIVATEAREAS)
ADDRFP4 8
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 32
LTI4 $1894
line 4242
;4242:						break;
ADDRGP4 $1892
JUMPV
LABELV $1894
line 4243
;4243:					if ( trap_AAS_AreaReachability(areas[i]) ) {
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ARGI4
ADDRLP4 3292
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 3292
INDIRI4
CNSTI4 0
EQI4 $1896
line 4244
;4244:						continue;
ADDRGP4 $1891
JUMPV
LABELV $1896
line 4246
;4245:					}
;4246:					trap_AAS_AreaInfo(areas[i], &areainfo);
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
line 4247
;4247:					if (areainfo.contents & AREACONTENTS_MOVER) {
ADDRLP4 2996
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $1898
line 4248
;4248:						activategoal->areas[activategoal->numareas++] = areas[i];
ADDRLP4 3300
ADDRFP4 8
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 3296
ADDRLP4 3300
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 3300
INDIRP4
ADDRLP4 3296
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 3304
CNSTI4 2
ASGNI4
ADDRLP4 3296
INDIRI4
ADDRLP4 3304
INDIRI4
LSHI4
ADDRFP4 8
INDIRP4
CNSTI4 104
ADDP4
ADDP4
ADDRLP4 132
INDIRI4
ADDRLP4 3304
INDIRI4
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ASGNI4
line 4249
;4249:					}
LABELV $1898
line 4250
;4250:				}
LABELV $1891
line 4240
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1893
ADDRLP4 132
INDIRI4
ADDRLP4 3048
INDIRI4
LTI4 $1890
LABELV $1892
line 4251
;4251:			}
LABELV $1876
line 4252
;4252:		}
LABELV $1873
line 4253
;4253:	}
LABELV $1852
line 4255
;4254:	// if the bot is blocked by or standing on top of a button
;4255:	if (!strcmp(classname, "func_button")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $1902
ARGP4
ADDRLP4 3264
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3264
INDIRI4
CNSTI4 0
NEI4 $1900
line 4256
;4256:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1834
JUMPV
LABELV $1900
line 4259
;4257:	}
;4258:	// get the targetname so we can find an entity with a matching target
;4259:	if (!trap_AAS_ValueForBSPEpairKey(ent, "targetname", targetname[0], sizeof(targetname[0]))) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1905
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
NEI4 $1903
line 4260
;4260:		if (bot_developer.integer) {
ADDRGP4 bot_developer+12
INDIRI4
CNSTI4 0
EQI4 $1906
line 4261
;4261:			BotAI_Print(PRT_ERROR, "BotGetActivateGoal: entity with model \"%s\" has no targetname\n", model);
CNSTI4 3
ARGI4
ADDRGP4 $1909
ARGP4
ADDRLP4 1712
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4262
;4262:		}
LABELV $1906
line 4263
;4263:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1834
JUMPV
LABELV $1903
line 4266
;4264:	}
;4265:	// allow tree-like activation
;4266:	cur_entities[0] = trap_AAS_NextBSPEntity(0);
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
line 4267
;4267:	for (i = 0; i >= 0 && i < 10;) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $1913
JUMPV
LABELV $1910
line 4268
;4268:		for (ent = cur_entities[i]; ent; ent = trap_AAS_NextBSPEntity(ent)) {
ADDRLP4 0
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1416
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1917
JUMPV
LABELV $1914
line 4269
;4269:			if (!trap_AAS_ValueForBSPEpairKey(ent, "target", target, sizeof(target))) continue;
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1920
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
NEI4 $1918
ADDRGP4 $1915
JUMPV
LABELV $1918
line 4270
;4270:			if (!strcmp(targetname[i], target)) {
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
NEI4 $1921
line 4271
;4271:				cur_entities[i] = trap_AAS_NextBSPEntity(ent);
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
line 4272
;4272:				break;
ADDRGP4 $1916
JUMPV
LABELV $1921
line 4274
;4273:			}
;4274:		}
LABELV $1915
line 4268
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
LABELV $1917
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1914
LABELV $1916
line 4275
;4275:		if (!ent) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1923
line 4276
;4276:			if (bot_developer.integer) {
ADDRGP4 bot_developer+12
INDIRI4
CNSTI4 0
EQI4 $1925
line 4277
;4277:				BotAI_Print(PRT_ERROR, "BotGetActivateGoal: no entity with target \"%s\"\n", targetname[i]);
CNSTI4 3
ARGI4
ADDRGP4 $1928
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
line 4278
;4278:			}
LABELV $1925
line 4279
;4279:			i--;
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4280
;4280:			continue;
ADDRGP4 $1911
JUMPV
LABELV $1923
line 4282
;4281:		}
;4282:		if (!trap_AAS_ValueForBSPEpairKey(ent, "classname", classname, sizeof(classname))) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1848
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
NEI4 $1929
line 4283
;4283:			if (bot_developer.integer) {
ADDRGP4 bot_developer+12
INDIRI4
CNSTI4 0
EQI4 $1911
line 4284
;4284:				BotAI_Print(PRT_ERROR, "BotGetActivateGoal: entity with target \"%s\" has no classname\n", targetname[i]);
CNSTI4 3
ARGI4
ADDRGP4 $1934
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
line 4285
;4285:			}
line 4286
;4286:			continue;
ADDRGP4 $1911
JUMPV
LABELV $1929
line 4289
;4287:		}
;4288:		// BSP button model
;4289:		if (!strcmp(classname, "func_button")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $1902
ARGP4
ADDRLP4 3284
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3284
INDIRI4
CNSTI4 0
NEI4 $1935
line 4291
;4290:			//
;4291:			if (!BotFuncButtonActivateGoal(bs, ent, activategoal))
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
NEI4 $1937
line 4292
;4292:				continue;
ADDRGP4 $1911
JUMPV
LABELV $1937
line 4294
;4293:			// if the bot tries to activate this button already
;4294:			if ( bs->activatestack && bs->activatestack->inuse &&
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
EQU4 $1939
ADDRLP4 3292
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $1939
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
NEI4 $1939
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
LEF4 $1939
ADDRLP4 3292
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ADDRLP4 3300
INDIRF4
CNSTF4 1073741824
SUBF4
GEF4 $1939
line 4298
;4295:				 bs->activatestack->goal.entitynum == activategoal->goal.entitynum &&
;4296:				 bs->activatestack->time > FloatTime() &&
;4297:				 bs->activatestack->start_time < FloatTime() - 2)
;4298:				continue;
ADDRGP4 $1911
JUMPV
LABELV $1939
line 4300
;4299:			// if the bot is in a reachability area
;4300:			if ( trap_AAS_AreaReachability(bs->areanum) ) {
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
EQI4 $1941
line 4302
;4301:				// disable all areas the blocking entity is in
;4302:				BotEnableActivateGoalAreas( activategoal, qfalse );
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4304
;4303:				//
;4304:				t = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, activategoal->goal.areanum, bs->tfl);
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
line 4306
;4305:				// if the button is not reachable
;4306:				if (!t) {
ADDRLP4 2736
INDIRI4
CNSTI4 0
NEI4 $1943
line 4307
;4307:					continue;
ADDRGP4 $1911
JUMPV
LABELV $1943
line 4309
;4308:				}
;4309:				activategoal->time = FloatTime() + t * 0.01 + 5;
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
line 4310
;4310:			}
LABELV $1941
line 4311
;4311:			return ent;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1834
JUMPV
LABELV $1935
line 4314
;4312:		}
;4313:		// invisible trigger multiple box
;4314:		else if (!strcmp(classname, "trigger_multiple")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $1947
ARGP4
ADDRLP4 3288
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3288
INDIRI4
CNSTI4 0
NEI4 $1945
line 4316
;4315:			//
;4316:			if (!BotTriggerMultipleActivateGoal(bs, ent, activategoal))
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
NEI4 $1948
line 4317
;4317:				continue;
ADDRGP4 $1911
JUMPV
LABELV $1948
line 4319
;4318:			// if the bot tries to activate this trigger already
;4319:			if ( bs->activatestack && bs->activatestack->inuse &&
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
EQU4 $1950
ADDRLP4 3296
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $1950
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
NEI4 $1950
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
LEF4 $1950
ADDRLP4 3296
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ADDRLP4 3304
INDIRF4
CNSTF4 1073741824
SUBF4
GEF4 $1950
line 4323
;4320:				 bs->activatestack->goal.entitynum == activategoal->goal.entitynum &&
;4321:				 bs->activatestack->time > FloatTime() &&
;4322:				 bs->activatestack->start_time < FloatTime() - 2)
;4323:				continue;
ADDRGP4 $1911
JUMPV
LABELV $1950
line 4325
;4324:			// if the bot is in a reachability area
;4325:			if ( trap_AAS_AreaReachability(bs->areanum) ) {
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
EQI4 $1952
line 4327
;4326:				// disable all areas the blocking entity is in
;4327:				BotEnableActivateGoalAreas( activategoal, qfalse );
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4329
;4328:				//
;4329:				t = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, activategoal->goal.areanum, bs->tfl);
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
line 4331
;4330:				// if the trigger is not reachable
;4331:				if (!t) {
ADDRLP4 2736
INDIRI4
CNSTI4 0
NEI4 $1954
line 4332
;4332:					continue;
ADDRGP4 $1911
JUMPV
LABELV $1954
line 4334
;4333:				}
;4334:				activategoal->time = FloatTime() + t * 0.01 + 5;
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
line 4335
;4335:			}
LABELV $1952
line 4336
;4336:			return ent;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1834
JUMPV
LABELV $1945
line 4338
;4337:		}
;4338:		else if (!strcmp(classname, "func_timer")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $1958
ARGP4
ADDRLP4 3292
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3292
INDIRI4
CNSTI4 0
NEI4 $1956
line 4340
;4339:			// just skip the func_timer
;4340:			continue;
ADDRGP4 $1911
JUMPV
LABELV $1956
line 4343
;4341:		}
;4342:		// the actual button or trigger might be linked through a target_relay or target_delay
;4343:		else if (!strcmp(classname, "target_relay") || !strcmp(classname, "target_delay")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $1961
ARGP4
ADDRLP4 3296
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3296
INDIRI4
CNSTI4 0
EQI4 $1963
ADDRLP4 1456
ARGP4
ADDRGP4 $1962
ARGP4
ADDRLP4 3300
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3300
INDIRI4
CNSTI4 0
NEI4 $1959
LABELV $1963
line 4344
;4344:			if (trap_AAS_ValueForBSPEpairKey(ent, "targetname", targetname[i+1], sizeof(targetname[0]))) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1905
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
EQI4 $1964
line 4345
;4345:				i++;
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4346
;4346:				cur_entities[i] = trap_AAS_NextBSPEntity(0);
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
line 4347
;4347:			}
LABELV $1964
line 4348
;4348:		}
LABELV $1959
line 4349
;4349:	}
LABELV $1911
line 4267
LABELV $1913
ADDRLP4 132
INDIRI4
CNSTI4 0
LTI4 $1967
ADDRLP4 132
INDIRI4
CNSTI4 10
LTI4 $1910
LABELV $1967
line 4353
;4350:#ifdef OBSTACLEDEBUG
;4351:	BotAI_Print(PRT_ERROR, "BotGetActivateGoal: no valid activator for entity with target \"%s\"\n", targetname[0]);
;4352:#endif
;4353:	return 0;
CNSTI4 0
RETI4
LABELV $1834
endproc BotGetActivateGoal 3320 20
export BotGoForActivateGoal
proc BotGoForActivateGoal 144 8
line 4361
;4354:}
;4355:
;4356:/*
;4357:==================
;4358:BotGoForActivateGoal
;4359:==================
;4360:*/
;4361:int BotGoForActivateGoal(bot_state_t *bs, bot_activategoal_t *activategoal) {
line 4364
;4362:	aas_entityinfo_t activateinfo;
;4363:
;4364:	activategoal->inuse = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 1
ASGNI4
line 4365
;4365:	if (!activategoal->time)
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
CNSTF4 0
NEF4 $1969
line 4366
;4366:		activategoal->time = FloatTime() + 10;
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1092616192
ADDF4
ASGNF4
LABELV $1969
line 4367
;4367:	activategoal->start_time = FloatTime();
ADDRFP4 4
INDIRP4
CNSTI4 64
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4368
;4368:	BotEntityInfo(activategoal->goal.entitynum, &activateinfo);
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
line 4369
;4369:	VectorCopy(activateinfo.origin, activategoal->origin);
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 4371
;4370:	//
;4371:	if (BotPushOntoActivateGoalStack(bs, activategoal)) {
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
EQI4 $1972
line 4373
;4372:		// enter the activate entity AI node
;4373:		AIEnter_Seek_ActivateEntity(bs, "BotGoForActivateGoal");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1974
ARGP4
ADDRGP4 AIEnter_Seek_ActivateEntity
CALLV
pop
line 4374
;4374:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1968
JUMPV
LABELV $1972
line 4376
;4375:	}
;4376:	else {
line 4378
;4377:		// enable any routing areas that were disabled
;4378:		BotEnableActivateGoalAreas(activategoal, qtrue);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4379
;4379:		return qfalse;
CNSTI4 0
RETI4
LABELV $1968
endproc BotGoForActivateGoal 144 8
export BotPrintActivateGoalInfo
proc BotPrintActivateGoalInfo 296 36
line 4388
;4380:	}
;4381:}
;4382:
;4383:/*
;4384:==================
;4385:BotPrintActivateGoalInfo
;4386:==================
;4387:*/
;4388:void BotPrintActivateGoalInfo(bot_state_t *bs, bot_activategoal_t *activategoal, int bspent) {
line 4393
;4389:	char netname[MAX_NETNAME];
;4390:	char classname[128];
;4391:	char buf[128];
;4392:
;4393:	ClientName(bs->client, netname, sizeof(netname));
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
line 4394
;4394:	trap_AAS_ValueForBSPEpairKey(bspent, "classname", classname, sizeof(classname));
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $1848
ARGP4
ADDRLP4 36
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4395
;4395:	if (activategoal->shoot) {
ADDRFP4 4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1976
line 4396
;4396:		Com_sprintf(buf, sizeof(buf), "%s: I have to shoot at a %s from %1.1f %1.1f %1.1f in area %d\n",
ADDRLP4 164
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $1978
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
line 4402
;4397:						netname, classname,
;4398:						activategoal->goal.origin[0],
;4399:						activategoal->goal.origin[1],
;4400:						activategoal->goal.origin[2],
;4401:						activategoal->goal.areanum);
;4402:	}
ADDRGP4 $1977
JUMPV
LABELV $1976
line 4403
;4403:	else {
line 4404
;4404:		Com_sprintf(buf, sizeof(buf), "%s: I have to activate a %s at %1.1f %1.1f %1.1f in area %d\n",
ADDRLP4 164
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $1979
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
line 4410
;4405:						netname, classname,
;4406:						activategoal->goal.origin[0],
;4407:						activategoal->goal.origin[1],
;4408:						activategoal->goal.origin[2],
;4409:						activategoal->goal.areanum);
;4410:	}
LABELV $1977
line 4411
;4411:	trap_EA_Say(bs->client, buf);
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
line 4412
;4412:}
LABELV $1975
endproc BotPrintActivateGoalInfo 296 36
export BotRandomMove
proc BotRandomMove 32 16
line 4419
;4413:
;4414:/*
;4415:==================
;4416:BotRandomMove
;4417:==================
;4418:*/
;4419:void BotRandomMove(bot_state_t *bs, bot_moveresult_t *moveresult) {
line 4422
;4420:	vec3_t dir, angles;
;4421:
;4422:	angles[0] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 4423
;4423:	angles[1] = random() * 360;
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
line 4424
;4424:	angles[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 4425
;4425:	AngleVectors(angles, dir, NULL, NULL);
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
line 4427
;4426:
;4427:	trap_BotMoveInDirection(bs->ms, dir, 400, MOVE_WALK);
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
line 4429
;4428:
;4429:	moveresult->failure = qfalse;
ADDRFP4 4
INDIRP4
CNSTI4 0
ASGNI4
line 4430
;4430:	VectorCopy(dir, moveresult->movedir);
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 12
INDIRB
ASGNB 12
line 4431
;4431:}
LABELV $1980
endproc BotRandomMove 32 16
lit
align 4
LABELV $1984
byte 4 0
byte 4 0
byte 4 1065353216
export BotAIBlocked
code
proc BotAIBlocked 528 16
line 4444
;4432:
;4433:/*
;4434:==================
;4435:BotAIBlocked
;4436:
;4437:Very basic handling of bots being blocked by other entities.
;4438:Check what kind of entity is blocking the bot and try to activate
;4439:it. If that's not an option then try to walk around or over the entity.
;4440:Before the bot ends in this part of the AI it should predict which doors to
;4441:open, which buttons to activate etc.
;4442:==================
;4443:*/
;4444:void BotAIBlocked(bot_state_t *bs, bot_moveresult_t *moveresult, int activate) {
line 4446
;4445:	int movetype, bspent;
;4446:	vec3_t hordir, start, end, mins, maxs, sideward, angles, up = {0, 0, 1};
ADDRLP4 228
ADDRGP4 $1984
INDIRB
ASGNB 12
line 4451
;4447:	aas_entityinfo_t entinfo;
;4448:	bot_activategoal_t activategoal;
;4449:
;4450:	// if the bot is not blocked by anything
;4451:	if (!moveresult->blocked) {
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1985
line 4452
;4452:		bs->notblocked_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6204
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4453
;4453:		return;
ADDRGP4 $1983
JUMPV
LABELV $1985
line 4456
;4454:	}
;4455:	// if stuck in a solid area
;4456:	if ( moveresult->type == RESULTTYPE_INSOLIDAREA ) {
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 8
NEI4 $1987
line 4458
;4457:		// move in a random direction in the hope to get out
;4458:		BotRandomMove(bs, moveresult);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRandomMove
CALLV
pop
line 4460
;4459:		//
;4460:		return;
ADDRGP4 $1983
JUMPV
LABELV $1987
line 4463
;4461:	}
;4462:	// get info for the entity that is blocking the bot
;4463:	BotEntityInfo(moveresult->blockentity, &entinfo);
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
line 4469
;4464:#ifdef OBSTACLEDEBUG
;4465:	ClientName(bs->client, netname, sizeof(netname));
;4466:	BotAI_Print(PRT_MESSAGE, "%s: I'm blocked by model %d\n", netname, entinfo.modelindex);
;4467:#endif OBSTACLEDEBUG
;4468:	// if blocked by a bsp model and the bot wants to activate it
;4469:	if (activate && entinfo.modelindex > 0 && entinfo.modelindex <= max_bspmodelindex) {
ADDRLP4 488
CNSTI4 0
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 488
INDIRI4
EQI4 $1989
ADDRLP4 40+104
INDIRI4
ADDRLP4 488
INDIRI4
LEI4 $1989
ADDRLP4 40+104
INDIRI4
ADDRGP4 max_bspmodelindex
INDIRI4
GTI4 $1989
line 4471
;4470:		// find the bsp entity which should be activated in order to get the blocking entity out of the way
;4471:		bspent = BotGetActivateGoal(bs, entinfo.number, &activategoal);
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
line 4472
;4472:		if (bspent) {
ADDRLP4 484
INDIRI4
CNSTI4 0
EQI4 $1994
line 4474
;4473:			//
;4474:			if (bs->activatestack && !bs->activatestack->inuse)
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
EQU4 $1996
ADDRLP4 496
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $1996
line 4475
;4475:				bs->activatestack = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
CNSTP4 0
ASGNP4
LABELV $1996
line 4477
;4476:			// if not already trying to activate this entity
;4477:			if (!BotIsGoingToActivateEntity(bs, activategoal.goal.entitynum)) {
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
NEI4 $1998
line 4479
;4478:				//
;4479:				BotGoForActivateGoal(bs, &activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 240
ARGP4
ADDRGP4 BotGoForActivateGoal
CALLI4
pop
line 4480
;4480:			}
LABELV $1998
line 4484
;4481:			// if ontop of an obstacle or
;4482:			// if the bot is not in a reachability area it'll still
;4483:			// need some dynamic obstacle avoidance, otherwise return
;4484:			if (!(moveresult->flags & MOVERESULT_ONTOPOFOBSTACLE) &&
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $1995
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
EQI4 $1995
line 4486
;4485:				trap_AAS_AreaReachability(bs->areanum))
;4486:				return;
ADDRGP4 $1983
JUMPV
line 4487
;4487:		}
LABELV $1994
line 4488
;4488:		else {
line 4490
;4489:			// enable any routing areas that were disabled
;4490:			BotEnableActivateGoalAreas(&activategoal, qtrue);
ADDRLP4 240
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4491
;4491:		}
LABELV $1995
line 4492
;4492:	}
LABELV $1989
line 4494
;4493:	// just some basic dynamic obstacle avoidance code
;4494:	hordir[0] = moveresult->movedir[0];
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ASGNF4
line 4495
;4495:	hordir[1] = moveresult->movedir[1];
ADDRLP4 0+4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ASGNF4
line 4496
;4496:	hordir[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 4498
;4497:	// if no direction just take a random direction
;4498:	if (VectorNormalize(hordir) < 0.1) {
ADDRLP4 0
ARGP4
ADDRLP4 492
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 492
INDIRF4
CNSTF4 1036831949
GEF4 $2006
line 4499
;4499:		VectorSet(angles, 0, 360 * random(), 0);
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
line 4500
;4500:		AngleVectors(angles, hordir, NULL, NULL);
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
line 4501
;4501:	}
LABELV $2006
line 4505
;4502:	//
;4503:	//if (moveresult->flags & MOVERESULT_ONTOPOFOBSTACLE) movetype = MOVE_JUMP;
;4504:	//else
;4505:	movetype = MOVE_WALK;
ADDRLP4 36
CNSTI4 1
ASGNI4
line 4508
;4506:	// if there's an obstacle at the bot's feet and head then
;4507:	// the bot might be able to crouch through
;4508:	VectorCopy(bs->origin, start);
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 4509
;4509:	start[2] += 18;
ADDRLP4 24+8
ADDRLP4 24+8
INDIRF4
CNSTF4 1099956224
ADDF4
ASGNF4
line 4510
;4510:	VectorMA(start, 5, hordir, end);
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
line 4511
;4511:	VectorSet(mins, -16, -16, -24);
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
line 4512
;4512:	VectorSet(maxs, 16, 16, 4);
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
line 4517
;4513:	//
;4514:	//bsptrace = AAS_Trace(start, mins, maxs, end, bs->entitynum, MASK_PLAYERSOLID);
;4515:	//if (bsptrace.fraction >= 1) movetype = MOVE_CROUCH;
;4516:	// get the sideward vector
;4517:	CrossProduct(hordir, up, sideward);
ADDRLP4 0
ARGP4
ADDRLP4 228
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 4519
;4518:	//
;4519:	if (bs->flags & BFL_AVOIDRIGHT) VectorNegate(sideward, sideward);
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $2021
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
LABELV $2021
line 4521
;4520:	// try to crouch straight forward?
;4521:	if (movetype != MOVE_CROUCH || !trap_BotMoveInDirection(bs->ms, hordir, 400, movetype)) {
ADDRLP4 36
INDIRI4
CNSTI4 2
NEI4 $2029
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
NEI4 $2027
LABELV $2029
line 4523
;4522:		// perform the movement
;4523:		if (!trap_BotMoveInDirection(bs->ms, sideward, 400, movetype)) {
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
NEI4 $2030
line 4525
;4524:			// flip the avoid direction flag
;4525:			bs->flags ^= BFL_AVOIDRIGHT;
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
line 4528
;4526:			// flip the direction
;4527:			// VectorNegate(sideward, sideward);
;4528:			VectorMA(sideward, -1, hordir, sideward);
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
line 4530
;4529:			// move in the other direction
;4530:			trap_BotMoveInDirection(bs->ms, sideward, 400, movetype);
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
line 4531
;4531:		}
LABELV $2030
line 4532
;4532:	}
LABELV $2027
line 4534
;4533:	//
;4534:	if (bs->notblocked_time < FloatTime() - 0.4) {
ADDRFP4 0
INDIRP4
CNSTI4 6204
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1053609165
SUBF4
GEF4 $2038
line 4537
;4535:		// just reset goals and hope the bot will go into another direction?
;4536:		// is this still needed??
;4537:		if (bs->ainode == AINode_Seek_NBG) bs->nbg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 AINode_Seek_NBG
CVPU4 4
NEU4 $2040
ADDRFP4 0
INDIRP4
CNSTI4 6072
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 $2041
JUMPV
LABELV $2040
line 4538
;4538:		else if (bs->ainode == AINode_Seek_LTG) bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 AINode_Seek_LTG
CVPU4 4
NEU4 $2042
ADDRFP4 0
INDIRP4
CNSTI4 6068
ADDP4
CNSTF4 0
ASGNF4
LABELV $2042
LABELV $2041
line 4539
;4539:	}
LABELV $2038
line 4540
;4540:}
LABELV $1983
endproc BotAIBlocked 528 16
export BotAIPredictObstacles
proc BotAIPredictObstacles 324 44
line 4552
;4541:
;4542:/*
;4543:==================
;4544:BotAIPredictObstacles
;4545:
;4546:Predict the route towards the goal and check if the bot
;4547:will be blocked by certain obstacles. When the bot has obstacles
;4548:on it's path the bot should figure out if they can be removed
;4549:by activating certain entities.
;4550:==================
;4551:*/
;4552:int BotAIPredictObstacles(bot_state_t *bs, bot_goal_t *goal) {
line 4557
;4553:	int modelnum, entitynum, bspent;
;4554:	bot_activategoal_t activategoal;
;4555:	aas_predictroute_t route;
;4556:
;4557:	if (!bot_predictobstacles.integer)
ADDRGP4 bot_predictobstacles+12
INDIRI4
CNSTI4 0
NEI4 $2045
line 4558
;4558:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2044
JUMPV
LABELV $2045
line 4561
;4559:
;4560:	// always predict when the goal change or at regular intervals
;4561:	if (bs->predictobstacles_goalareanum == goal->areanum &&
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
NEI4 $2048
ADDRLP4 292
INDIRP4
CNSTI4 6212
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1086324736
SUBF4
LEF4 $2048
line 4562
;4562:		bs->predictobstacles_time > FloatTime() - 6) {
line 4563
;4563:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2044
JUMPV
LABELV $2048
line 4565
;4564:	}
;4565:	bs->predictobstacles_goalareanum = goal->areanum;
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
line 4566
;4566:	bs->predictobstacles_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6212
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4569
;4567:
;4568:	// predict at most 100 areas or 10 seconds ahead
;4569:	trap_AAS_PredictRoute(&route, bs->areanum, bs->origin,
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
line 4574
;4570:							goal->areanum, bs->tfl, 100, 1000,
;4571:							RSE_USETRAVELTYPE|RSE_ENTERCONTENTS,
;4572:							AREACONTENTS_MOVER, TFL_BRIDGE, 0);
;4573:	// if bot has to travel through an area with a mover
;4574:	if (route.stopevent & RSE_ENTERCONTENTS) {
ADDRLP4 0+16
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $2050
line 4576
;4575:		// if the bot will run into a mover
;4576:		if (route.endcontents & AREACONTENTS_MOVER) {
ADDRLP4 0+20
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $2051
line 4578
;4577:			//NOTE: this only works with bspc 2.1 or higher
;4578:			modelnum = (route.endcontents & AREACONTENTS_MODELNUM) >> AREACONTENTS_MODELNUMSHIFT;
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
line 4579
;4579:			if (modelnum) {
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $2051
line 4581
;4580:				//
;4581:				entitynum = BotModelMinsMaxs(modelnum, ET_MOVER, 0, NULL, NULL);
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
line 4582
;4582:				if (entitynum) {
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $2051
line 4584
;4583:					//NOTE: BotGetActivateGoal already checks if the door is open or not
;4584:					bspent = BotGetActivateGoal(bs, entitynum, &activategoal);
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
line 4585
;4585:					if (bspent) {
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $2051
line 4587
;4586:						//
;4587:						if (bs->activatestack && !bs->activatestack->inuse)
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
EQU4 $2063
ADDRLP4 316
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $2063
line 4588
;4588:							bs->activatestack = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
CNSTP4 0
ASGNP4
LABELV $2063
line 4590
;4589:						// if not already trying to activate this entity
;4590:						if (!BotIsGoingToActivateEntity(bs, activategoal.goal.entitynum)) {
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
NEI4 $2065
line 4594
;4591:							//
;4592:							//BotAI_Print(PRT_MESSAGE, "blocked by mover model %d, entity %d ?\n", modelnum, entitynum);
;4593:							//
;4594:							BotGoForActivateGoal(bs, &activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 BotGoForActivateGoal
CALLI4
pop
line 4595
;4595:							return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2044
JUMPV
LABELV $2065
line 4597
;4596:						}
;4597:						else {
line 4599
;4598:							// enable any routing areas that were disabled
;4599:							BotEnableActivateGoalAreas(&activategoal, qtrue);
ADDRLP4 48
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4600
;4600:						}
line 4601
;4601:					}
line 4602
;4602:				}
line 4603
;4603:			}
line 4604
;4604:		}
line 4605
;4605:	}
ADDRGP4 $2051
JUMPV
LABELV $2050
line 4606
;4606:	else if (route.stopevent & RSE_USETRAVELTYPE) {
ADDRLP4 0+16
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $2069
line 4607
;4607:		if (route.endtravelflags & TFL_BRIDGE) {
ADDRLP4 0+24
INDIRI4
CNSTI4 67108864
BANDI4
CNSTI4 0
EQI4 $2072
line 4609
;4608:			//FIXME: check if the bridge is available to travel over
;4609:		}
LABELV $2072
line 4610
;4610:	}
LABELV $2069
LABELV $2051
line 4611
;4611:	return qfalse;
CNSTI4 0
RETI4
LABELV $2044
endproc BotAIPredictObstacles 324 44
export BotCheckConsoleMessages
proc BotCheckConsoleMessages 1012 48
line 4619
;4612:}
;4613:
;4614:/*
;4615:==================
;4616:BotCheckConsoleMessages
;4617:==================
;4618:*/
;4619:void BotCheckConsoleMessages(bot_state_t *bs) {
line 4627
;4620:	char botname[MAX_NETNAME], message[MAX_MESSAGE_SIZE], netname[MAX_NETNAME], *ptr;
;4621:	float chat_reply;
;4622:	int context, handle;
;4623:	bot_consolemessage_t m;
;4624:	bot_match_t match;
;4625:
;4626:	//the name of this bot
;4627:	ClientName(bs->client, botname, sizeof(botname));
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
ADDRGP4 $2077
JUMPV
LABELV $2076
line 4629
;4628:	//
;4629:	while((handle = trap_BotNextConsoleMessage(bs->cs, &m)) != 0) {
line 4631
;4630:		//if the chat state is flooded with messages the bot will read them quickly
;4631:		if (trap_BotNumConsoleMessages(bs->cs) < 10) {
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
GEI4 $2079
line 4633
;4632:			//if it is a chat message the bot needs some time to read it
;4633:			if (m.type == CMS_CHAT && m.time > FloatTime() - (1 + random())) break;
ADDRLP4 0+8
INDIRI4
CNSTI4 1
NEI4 $2081
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
LEF4 $2081
ADDRGP4 $2078
JUMPV
LABELV $2081
line 4634
;4634:		}
LABELV $2079
line 4636
;4635:		//
;4636:		ptr = m.message;
ADDRLP4 276
ADDRLP4 0+12
ASGNP4
line 4639
;4637:		//if it is a chat message then don't unify white spaces and don't
;4638:		//replace synonyms in the netname
;4639:		if (m.type == CMS_CHAT) {
ADDRLP4 0+8
INDIRI4
CNSTI4 1
NEI4 $2086
line 4641
;4640:			//
;4641:			if (trap_BotFindMatch(m.message, &match, MTCONTEXT_REPLYCHAT)) {
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
EQI4 $2089
line 4642
;4642:				ptr = m.message + match.variables[MESSAGE].offset;
ADDRLP4 276
ADDRLP4 288+264+16
INDIRI1
CVII4 1
ADDRLP4 0+12
ADDP4
ASGNP4
line 4643
;4643:			}
LABELV $2089
line 4644
;4644:		}
LABELV $2086
line 4646
;4645:		//unify the white spaces in the message
;4646:		trap_UnifyWhiteSpaces(ptr);
ADDRLP4 276
INDIRP4
ARGP4
ADDRGP4 trap_UnifyWhiteSpaces
CALLV
pop
line 4648
;4647:		//replace synonyms in the right context
;4648:		context = BotSynonymContext(bs);
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
line 4649
;4649:		trap_BotReplaceSynonyms(ptr, context);
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
line 4651
;4650:		//if there's no match
;4651:		if (!BotMatchMessage(bs, m.message)) {
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
NEI4 $2095
line 4653
;4652:			//if it is a chat message
;4653:			if (m.type == CMS_CHAT && !bot_nochat.integer) {
ADDRLP4 0+8
INDIRI4
CNSTI4 1
NEI4 $2098
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 0
NEI4 $2098
line 4655
;4654:				//
;4655:				if (!trap_BotFindMatch(m.message, &match, MTCONTEXT_REPLYCHAT)) {
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
NEI4 $2102
line 4656
;4656:					trap_BotRemoveConsoleMessage(bs->cs, handle);
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
line 4657
;4657:					continue;
ADDRGP4 $2077
JUMPV
LABELV $2102
line 4660
;4658:				}
;4659:				//don't use eliza chats with team messages
;4660:				if (match.subtype & ST_TEAM) {
ADDRLP4 288+260
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $2105
line 4661
;4661:					trap_BotRemoveConsoleMessage(bs->cs, handle);
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
line 4662
;4662:					continue;
ADDRGP4 $2077
JUMPV
LABELV $2105
line 4665
;4663:				}
;4664:				//
;4665:				trap_BotMatchVariable(&match, NETNAME, netname, sizeof(netname));
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
line 4666
;4666:				trap_BotMatchVariable(&match, MESSAGE, message, sizeof(message));
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
line 4668
;4667:				//if this is a message from the bot self
;4668:				if (bs->client == ClientFromName(netname)) {
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
NEI4 $2108
line 4669
;4669:					trap_BotRemoveConsoleMessage(bs->cs, handle);
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
line 4670
;4670:					continue;
ADDRGP4 $2077
JUMPV
LABELV $2108
line 4673
;4671:				}
;4672:				//unify the message
;4673:				trap_UnifyWhiteSpaces(message);
ADDRLP4 616
ARGP4
ADDRGP4 trap_UnifyWhiteSpaces
CALLV
pop
line 4675
;4674:				//
;4675:				trap_Cvar_Update(&bot_testrchat);
ADDRGP4 bot_testrchat
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 4676
;4676:				if (bot_testrchat.integer) {
ADDRGP4 bot_testrchat+12
INDIRI4
CNSTI4 0
EQI4 $2110
line 4678
;4677:					//
;4678:					trap_BotLibVarSet("bot_testrchat", "1");
ADDRGP4 $2113
ARGP4
ADDRGP4 $2114
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 4680
;4679:					//if bot replies with a chat message
;4680:					if (trap_BotReplyChat(bs->cs, message, context, CONTEXT_REPLY,
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
EQI4 $2115
line 4684
;4681:															NULL, NULL,
;4682:															NULL, NULL,
;4683:															NULL, NULL,
;4684:															botname, netname)) {
line 4685
;4685:						BotAI_Print(PRT_MESSAGE, "------------------------\n");
CNSTI4 1
ARGI4
ADDRGP4 $2117
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4686
;4686:					}
ADDRGP4 $2111
JUMPV
LABELV $2115
line 4687
;4687:					else {
line 4688
;4688:						BotAI_Print(PRT_MESSAGE, "**** no valid reply ****\n");
CNSTI4 1
ARGI4
ADDRGP4 $2118
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4689
;4689:					}
line 4690
;4690:				}
ADDRGP4 $2111
JUMPV
LABELV $2110
line 4692
;4691:				//if at a valid chat position and not chatting already and not in teamplay
;4692:				else if (bs->ainode != AINode_Stand && BotValidChatPosition(bs) && !TeamPlayIsOn()) {
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
EQU4 $2119
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
EQI4 $2119
ADDRLP4 976
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 976
INDIRI4
CNSTI4 0
NEI4 $2119
line 4693
;4693:					chat_reply = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_REPLY, 0, 1);
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
line 4694
;4694:					if (random() < 1.5 / (NumBots()+1) && random() < chat_reply) {
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
GEF4 $2121
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
GEF4 $2121
line 4696
;4695:						//if bot replies with a chat message
;4696:						if (trap_BotReplyChat(bs->cs, message, context, CONTEXT_REPLY,
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
EQI4 $2123
line 4700
;4697:																NULL, NULL,
;4698:																NULL, NULL,
;4699:																NULL, NULL,
;4700:																botname, netname)) {
line 4702
;4701:							//remove the console message
;4702:							trap_BotRemoveConsoleMessage(bs->cs, handle);
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
line 4703
;4703:							bs->stand_time = FloatTime() + BotChatTime(bs);
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
line 4704
;4704:							AIEnter_Stand(bs, "BotCheckConsoleMessages: reply chat");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2125
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 4706
;4705:							//EA_Say(bs->client, bs->cs.chatmessage);
;4706:							break;
ADDRGP4 $2078
JUMPV
LABELV $2123
line 4708
;4707:						}
;4708:					}
LABELV $2121
line 4709
;4709:				}
LABELV $2119
LABELV $2111
line 4710
;4710:			}
LABELV $2098
line 4711
;4711:		}
LABELV $2095
line 4713
;4712:		//remove the console message
;4713:		trap_BotRemoveConsoleMessage(bs->cs, handle);
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
line 4714
;4714:	}
LABELV $2077
line 4629
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
NEI4 $2076
LABELV $2078
line 4715
;4715:}
LABELV $2075
endproc BotCheckConsoleMessages 1012 48
export BotCheckForGrenades
proc BotCheckForGrenades 8 16
line 4722
;4716:
;4717:/*
;4718:==================
;4719:BotCheckEvents
;4720:==================
;4721:*/
;4722:void BotCheckForGrenades(bot_state_t *bs, entityState_t *state) {
line 4724
;4723:	// if this is not a grenade
;4724:	if (state->eType != ET_MISSILE || state->weapon != WP_GRENADE_LAUNCHER)
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
NEI4 $2129
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $2127
LABELV $2129
line 4725
;4725:		return;
ADDRGP4 $2126
JUMPV
LABELV $2127
line 4727
;4726:	// try to avoid the grenade
;4727:	trap_BotAddAvoidSpot(bs->ms, state->pos.trBase, 160, AVOID_ALWAYS);
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
line 4728
;4728:}
LABELV $2126
endproc BotCheckForGrenades 8 16
export BotCheckEvents
proc BotCheckEvents 164 12
line 4780
;4729:
;4730:#ifdef MISSIONPACK
;4731:/*
;4732:==================
;4733:BotCheckForProxMines
;4734:==================
;4735:*/
;4736:void BotCheckForProxMines(bot_state_t *bs, entityState_t *state) {
;4737:	// if this is not a prox mine
;4738:	if (state->eType != ET_MISSILE || state->weapon != WP_PROX_LAUNCHER)
;4739:		return;
;4740:	// if this prox mine is from someone on our own team
;4741:	if (state->generic1 == BotTeam(bs))
;4742:		return;
;4743:	// if the bot doesn't have a weapon to deactivate the mine
;4744:	if (!(bs->inventory[INVENTORY_PLASMAGUN] > 0 && bs->inventory[INVENTORY_CELLS] > 0) &&
;4745:		!(bs->inventory[INVENTORY_ROCKETLAUNCHER] > 0 && bs->inventory[INVENTORY_ROCKETS] > 0) &&
;4746:		!(bs->inventory[INVENTORY_BFG10K] > 0 && bs->inventory[INVENTORY_BFGAMMO] > 0) ) {
;4747:		return;
;4748:	}
;4749:	// try to avoid the prox mine
;4750:	trap_BotAddAvoidSpot(bs->ms, state->pos.trBase, 160, AVOID_ALWAYS);
;4751:	//
;4752:	if (bs->numproxmines >= MAX_PROXMINES)
;4753:		return;
;4754:	bs->proxmines[bs->numproxmines] = state->number;
;4755:	bs->numproxmines++;
;4756:}
;4757:
;4758:/*
;4759:==================
;4760:BotCheckForKamikazeBody
;4761:==================
;4762:*/
;4763:void BotCheckForKamikazeBody(bot_state_t *bs, entityState_t *state) {
;4764:	// if this entity is not wearing the kamikaze
;4765:	if (!(state->eFlags & EF_KAMIKAZE))
;4766:		return;
;4767:	// if this entity isn't dead
;4768:	if (!(state->eFlags & EF_DEAD))
;4769:		return;
;4770:	//remember this kamikaze body
;4771:	bs->kamikazebody = state->number;
;4772:}
;4773:#endif
;4774:
;4775:/*
;4776:==================
;4777:BotCheckEvents
;4778:==================
;4779:*/
;4780:void BotCheckEvents(bot_state_t *bs, entityState_t *state) {
line 4789
;4781:	int event;
;4782:	char buf[128];
;4783:#ifdef MISSIONPACK
;4784:	aas_entityinfo_t entinfo;
;4785:#endif
;4786:
;4787:	//NOTE: this sucks, we're accessing the gentity_t directly
;4788:	//but there's no other fast way to do it right now
;4789:	if (bs->entityeventTime[state->number] == g_entities[state->number].eventTime) {
ADDRLP4 132
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDP4
INDIRI4
CNSTI4 916
ADDRLP4 132
INDIRI4
MULI4
ADDRGP4 g_entities+560
ADDP4
INDIRI4
NEI4 $2131
line 4790
;4790:		return;
ADDRGP4 $2130
JUMPV
LABELV $2131
line 4792
;4791:	}
;4792:	bs->entityeventTime[state->number] = g_entities[state->number].eventTime;
ADDRLP4 136
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDP4
CNSTI4 916
ADDRLP4 136
INDIRI4
MULI4
ADDRGP4 g_entities+560
ADDP4
INDIRI4
ASGNI4
line 4794
;4793:	//if it's an event only entity
;4794:	if (state->eType > ET_EVENTS) {
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 14
LEI4 $2135
line 4795
;4795:		event = (state->eType - ET_EVENTS) & ~EV_EVENT_BITS;
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
line 4796
;4796:	}
ADDRGP4 $2136
JUMPV
LABELV $2135
line 4797
;4797:	else {
line 4798
;4798:		event = state->event & ~EV_EVENT_BITS;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
ASGNI4
line 4799
;4799:	}
LABELV $2136
line 4801
;4800:	//
;4801:	switch(event) {
ADDRLP4 140
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 1
LTI4 $2137
ADDRLP4 140
INDIRI4
CNSTI4 75
GTI4 $2137
ADDRLP4 140
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2186-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2186
address $2138
address $2138
address $2138
address $2138
address $2138
address $2138
address $2138
address $2138
address $2138
address $2138
address $2138
address $2138
address $2138
address $2138
address $2138
address $2138
address $2138
address $2138
address $2138
address $2138
address $2138
address $2138
address $2138
address $2137
address $2138
address $2138
address $2138
address $2138
address $2138
address $2138
address $2138
address $2138
address $2138
address $2138
address $2138
address $2138
address $2138
address $2138
address $2138
address $2137
address $2137
address $2137
address $2171
address $2137
address $2137
address $2137
address $2172
address $2150
address $2158
address $2137
address $2137
address $2137
address $2137
address $2137
address $2137
address $2137
address $2137
address $2137
address $2137
address $2137
address $2137
address $2139
address $2137
address $2137
address $2137
address $2137
address $2137
address $2137
address $2137
address $2137
address $2137
address $2137
address $2137
address $2137
address $2138
code
LABELV $2139
line 4804
;4802:		//client obituary event
;4803:		case EV_OBITUARY:
;4804:		{
line 4807
;4805:			int target, attacker, mod;
;4806:
;4807:			target = state->otherEntityNum;
ADDRLP4 144
ADDRFP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 4808
;4808:			attacker = state->otherEntityNum2;
ADDRLP4 148
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 4809
;4809:			mod = state->eventParm;
ADDRLP4 152
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 4811
;4810:			//
;4811:			if (target == bs->client) {
ADDRLP4 144
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2140
line 4812
;4812:				bs->botdeathtype = mod;
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
ADDRLP4 152
INDIRI4
ASGNI4
line 4813
;4813:				bs->lastkilledby = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 5996
ADDP4
ADDRLP4 148
INDIRI4
ASGNI4
line 4815
;4814:				//
;4815:				if (target == attacker ||
ADDRLP4 156
ADDRLP4 144
INDIRI4
ASGNI4
ADDRLP4 156
INDIRI4
ADDRLP4 148
INDIRI4
EQI4 $2145
ADDRLP4 156
INDIRI4
CNSTI4 1023
EQI4 $2145
ADDRLP4 156
INDIRI4
CNSTI4 1022
NEI4 $2142
LABELV $2145
line 4817
;4816:					target == ENTITYNUM_NONE ||
;4817:					target == ENTITYNUM_WORLD) bs->botsuicide = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6008
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $2143
JUMPV
LABELV $2142
line 4818
;4818:				else bs->botsuicide = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6008
ADDP4
CNSTI4 0
ASGNI4
LABELV $2143
line 4820
;4819:				//
;4820:				bs->num_deaths++;
ADDRLP4 160
ADDRFP4 0
INDIRP4
CNSTI4 6028
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4821
;4821:			}
ADDRGP4 $2138
JUMPV
LABELV $2140
line 4823
;4822:			//else if this client was killed by the bot
;4823:			else if (attacker == bs->client) {
ADDRLP4 148
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2146
line 4824
;4824:				bs->enemydeathtype = mod;
ADDRFP4 0
INDIRP4
CNSTI4 6004
ADDP4
ADDRLP4 152
INDIRI4
ASGNI4
line 4825
;4825:				bs->lastkilledplayer = target;
ADDRFP4 0
INDIRP4
CNSTI4 5992
ADDP4
ADDRLP4 144
INDIRI4
ASGNI4
line 4826
;4826:				bs->killedenemy_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6168
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4828
;4827:				//
;4828:				bs->num_kills++;
ADDRLP4 156
ADDRFP4 0
INDIRP4
CNSTI4 6032
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4829
;4829:			}
ADDRGP4 $2138
JUMPV
LABELV $2146
line 4830
;4830:			else if (attacker == bs->enemy && target == attacker) {
ADDRLP4 156
ADDRLP4 148
INDIRI4
ASGNI4
ADDRLP4 156
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
NEI4 $2138
ADDRLP4 144
INDIRI4
ADDRLP4 156
INDIRI4
NEI4 $2138
line 4831
;4831:				bs->enemysuicide = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6012
ADDP4
CNSTI4 1
ASGNI4
line 4832
;4832:			}
line 4846
;4833:			//
;4834:#ifdef MISSIONPACK			
;4835:			if (gametype == GT_1FCTF) {
;4836:				//
;4837:				BotEntityInfo(target, &entinfo);
;4838:				if ( entinfo.powerups & ( 1 << PW_NEUTRALFLAG ) ) {
;4839:					if (!BotSameTeam(bs, target)) {
;4840:						bs->neutralflagstatus = 3;	//enemy dropped the flag
;4841:						bs->flagstatuschanged = qtrue;
;4842:					}
;4843:				}
;4844:			}
;4845:#endif
;4846:			break;
ADDRGP4 $2138
JUMPV
LABELV $2150
line 4849
;4847:		}
;4848:		case EV_GLOBAL_SOUND:
;4849:		{
line 4850
;4850:			if (state->eventParm < 0 || state->eventParm > MAX_SOUNDS) {
ADDRLP4 144
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
LTI4 $2153
ADDRLP4 144
INDIRI4
CNSTI4 256
LEI4 $2151
LABELV $2153
line 4851
;4851:				BotAI_Print(PRT_ERROR, "EV_GLOBAL_SOUND: eventParm (%d) out of range\n", state->eventParm);
CNSTI4 3
ARGI4
ADDRGP4 $2154
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
line 4852
;4852:				break;
ADDRGP4 $2138
JUMPV
LABELV $2151
line 4854
;4853:			}
;4854:			trap_GetConfigstring(CS_SOUNDS + state->eventParm, buf, sizeof(buf));
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
line 4874
;4855:			/*
;4856:			if (!strcmp(buf, "sound/teamplay/flagret_red.wav")) {
;4857:				//red flag is returned
;4858:				bs->redflagstatus = 0;
;4859:				bs->flagstatuschanged = qtrue;
;4860:			}
;4861:			else if (!strcmp(buf, "sound/teamplay/flagret_blu.wav")) {
;4862:				//blue flag is returned
;4863:				bs->blueflagstatus = 0;
;4864:				bs->flagstatuschanged = qtrue;
;4865:			}
;4866:			else*/
;4867:#ifdef MISSIONPACK
;4868:			if (!strcmp(buf, "sound/items/kamikazerespawn.wav" )) {
;4869:				//the kamikaze respawned so dont avoid it
;4870:				BotDontAvoid(bs, "Kamikaze");
;4871:			}
;4872:			else
;4873:#endif
;4874:				if (!strcmp(buf, "sound/items/poweruprespawn.wav")) {
ADDRLP4 4
ARGP4
ADDRGP4 $2157
ARGP4
ADDRLP4 148
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $2138
line 4876
;4875:				//powerup respawned... go get it
;4876:				BotGoForPowerups(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotGoForPowerups
CALLV
pop
line 4877
;4877:			}
line 4878
;4878:			break;
ADDRGP4 $2138
JUMPV
LABELV $2158
line 4881
;4879:		}
;4880:		case EV_GLOBAL_TEAM_SOUND:
;4881:		{
line 4882
;4882:			if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $2138
line 4883
;4883:				switch(state->eventParm) {
ADDRLP4 144
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
LTI4 $2138
ADDRLP4 144
INDIRI4
CNSTI4 5
GTI4 $2138
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2170
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2170
address $2164
address $2165
address $2166
address $2167
address $2168
address $2169
code
LABELV $2164
line 4885
;4884:					case GTS_RED_CAPTURE:
;4885:						bs->blueflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 0
ASGNI4
line 4886
;4886:						bs->redflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
CNSTI4 0
ASGNI4
line 4887
;4887:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 1
ASGNI4
line 4888
;4888:						break; //see BotMatch_CTF
ADDRGP4 $2138
JUMPV
LABELV $2165
line 4890
;4889:					case GTS_BLUE_CAPTURE:
;4890:						bs->blueflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 0
ASGNI4
line 4891
;4891:						bs->redflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
CNSTI4 0
ASGNI4
line 4892
;4892:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 1
ASGNI4
line 4893
;4893:						break; //see BotMatch_CTF
ADDRGP4 $2138
JUMPV
LABELV $2166
line 4896
;4894:					case GTS_RED_RETURN:
;4895:						//blue flag is returned
;4896:						bs->blueflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 0
ASGNI4
line 4897
;4897:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 1
ASGNI4
line 4898
;4898:						break;
ADDRGP4 $2138
JUMPV
LABELV $2167
line 4901
;4899:					case GTS_BLUE_RETURN:
;4900:						//red flag is returned
;4901:						bs->redflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6952
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
ADDRGP4 $2138
JUMPV
LABELV $2168
line 4906
;4904:					case GTS_RED_TAKEN:
;4905:						//blue flag is taken
;4906:						bs->blueflagstatus = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 1
ASGNI4
line 4907
;4907:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 1
ASGNI4
line 4908
;4908:						break; //see BotMatch_CTF
ADDRGP4 $2138
JUMPV
LABELV $2169
line 4911
;4909:					case GTS_BLUE_TAKEN:
;4910:						//red flag is taken
;4911:						bs->redflagstatus = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
CNSTI4 1
ASGNI4
line 4912
;4912:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 1
ASGNI4
line 4913
;4913:						break; //see BotMatch_CTF
line 4915
;4914:				}
;4915:			}
line 4948
;4916:#ifdef MISSIONPACK
;4917:			else if (gametype == GT_1FCTF) {
;4918:				switch(state->eventParm) {
;4919:					case GTS_RED_CAPTURE:
;4920:						bs->neutralflagstatus = 0;
;4921:						bs->flagstatuschanged = qtrue;
;4922:						break;
;4923:					case GTS_BLUE_CAPTURE:
;4924:						bs->neutralflagstatus = 0;
;4925:						bs->flagstatuschanged = qtrue;
;4926:						break;
;4927:					case GTS_RED_RETURN:
;4928:						//flag has returned
;4929:						bs->neutralflagstatus = 0;
;4930:						bs->flagstatuschanged = qtrue;
;4931:						break;
;4932:					case GTS_BLUE_RETURN:
;4933:						//flag has returned
;4934:						bs->neutralflagstatus = 0;
;4935:						bs->flagstatuschanged = qtrue;
;4936:						break;
;4937:					case GTS_RED_TAKEN:
;4938:						bs->neutralflagstatus = BotTeam(bs) == TEAM_RED ? 2 : 1; //FIXME: check Team_TakeFlagSound in g_team.c
;4939:						bs->flagstatuschanged = qtrue;
;4940:						break;
;4941:					case GTS_BLUE_TAKEN:
;4942:						bs->neutralflagstatus = BotTeam(bs) == TEAM_BLUE ? 2 : 1; //FIXME: check Team_TakeFlagSound in g_team.c
;4943:						bs->flagstatuschanged = qtrue;
;4944:						break;
;4945:				}
;4946:			}
;4947:#endif
;4948:			break;
ADDRGP4 $2138
JUMPV
LABELV $2171
line 4951
;4949:		}
;4950:		case EV_PLAYER_TELEPORT_IN:
;4951:		{
line 4952
;4952:			VectorCopy(state->origin, lastteleport_origin);
ADDRGP4 lastteleport_origin
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 4953
;4953:			lastteleport_time = FloatTime();
ADDRGP4 lastteleport_time
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4954
;4954:			break;
ADDRGP4 $2138
JUMPV
LABELV $2172
line 4957
;4955:		}
;4956:		case EV_GENERAL_SOUND:
;4957:		{
line 4959
;4958:			//if this sound is played on the bot
;4959:			if (state->number == bs->client) {
ADDRFP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2138
line 4960
;4960:				if (state->eventParm < 0 || state->eventParm > MAX_SOUNDS) {
ADDRLP4 144
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
LTI4 $2177
ADDRLP4 144
INDIRI4
CNSTI4 256
LEI4 $2175
LABELV $2177
line 4961
;4961:					BotAI_Print(PRT_ERROR, "EV_GENERAL_SOUND: eventParm (%d) out of range\n", state->eventParm);
CNSTI4 3
ARGI4
ADDRGP4 $2178
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
line 4962
;4962:					break;
ADDRGP4 $2138
JUMPV
LABELV $2175
line 4965
;4963:				}
;4964:				//check out the sound
;4965:				trap_GetConfigstring(CS_SOUNDS + state->eventParm, buf, sizeof(buf));
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
line 4967
;4966:				//if falling into a death pit
;4967:				if (!strcmp(buf, "*falling1.wav")) {
ADDRLP4 4
ARGP4
ADDRGP4 $2181
ARGP4
ADDRLP4 148
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $2138
line 4969
;4968:					//if the bot has a personal teleporter
;4969:					if (bs->inventory[INVENTORY_TELEPORTER] > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 5072
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2138
line 4971
;4970:						//use the holdable item
;4971:						trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 4972
;4972:					}
line 4973
;4973:				}
line 4974
;4974:			}
line 4975
;4975:			break;
line 5002
;4976:		}
;4977:		case EV_FOOTSTEP:
;4978:		case EV_FOOTSTEP_METAL:
;4979:		case EV_FOOTSPLASH:
;4980:		case EV_FOOTWADE:
;4981:		case EV_SWIM:
;4982:		case EV_FALL_SHORT:
;4983:		case EV_FALL_MEDIUM:
;4984:		case EV_FALL_FAR:
;4985:		case EV_STEP_4:
;4986:		case EV_STEP_8:
;4987:		case EV_STEP_12:
;4988:		case EV_STEP_16:
;4989:		case EV_JUMP_PAD:
;4990:		case EV_JUMP:
;4991:		case EV_TAUNT:
;4992:		case EV_WATER_TOUCH:
;4993:		case EV_WATER_LEAVE:
;4994:		case EV_WATER_UNDER:
;4995:		case EV_WATER_CLEAR:
;4996:		case EV_ITEM_PICKUP:
;4997:		case EV_GLOBAL_ITEM_PICKUP:
;4998:		case EV_NOAMMO:
;4999:		case EV_CHANGE_WEAPON:
;5000:		case EV_FIRE_WEAPON:
;5001:			//FIXME: either add to sound queue or mark player as someone making noise
;5002:			break;
line 5018
;5003:		case EV_USE_ITEM0:
;5004:		case EV_USE_ITEM1:
;5005:		case EV_USE_ITEM2:
;5006:		case EV_USE_ITEM3:
;5007:		case EV_USE_ITEM4:
;5008:		case EV_USE_ITEM5:
;5009:		case EV_USE_ITEM6:
;5010:		case EV_USE_ITEM7:
;5011:		case EV_USE_ITEM8:
;5012:		case EV_USE_ITEM9:
;5013:		case EV_USE_ITEM10:
;5014:		case EV_USE_ITEM11:
;5015:		case EV_USE_ITEM12:
;5016:		case EV_USE_ITEM13:
;5017:		case EV_USE_ITEM14:
;5018:			break;
LABELV $2137
LABELV $2138
line 5020
;5019:	}
;5020:}
LABELV $2130
endproc BotCheckEvents 164 12
export BotCheckSnapshot
proc BotCheckSnapshot 220 16
line 5027
;5021:
;5022:/*
;5023:==================
;5024:BotCheckSnapshot
;5025:==================
;5026:*/
;5027:void BotCheckSnapshot(bot_state_t *bs) {
line 5032
;5028:	int ent;
;5029:	entityState_t state;
;5030:
;5031:	//remove all avoid spots
;5032:	trap_BotAddAvoidSpot(bs->ms, vec3_origin, 0, AVOID_CLEAR);
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
line 5034
;5033:	//reset kamikaze body
;5034:	bs->kamikazebody = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6256
ADDP4
CNSTI4 0
ASGNI4
line 5036
;5035:	//reset number of proxmines
;5036:	bs->numproxmines = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6516
ADDP4
CNSTI4 0
ASGNI4
line 5038
;5037:	//
;5038:	ent = 0;
ADDRLP4 212
CNSTI4 0
ASGNI4
ADDRGP4 $2190
JUMPV
LABELV $2189
line 5039
;5039:	while( ( ent = BotAI_GetSnapshotEntity( bs->client, ent, &state ) ) != -1 ) {
line 5041
;5040:		//check the entity state for events
;5041:		BotCheckEvents(bs, &state);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckEvents
CALLV
pop
line 5043
;5042:		//check for grenades the bot should avoid
;5043:		BotCheckForGrenades(bs, &state);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckForGrenades
CALLV
pop
line 5051
;5044:		//
;5045:#ifdef MISSIONPACK
;5046:		//check for proximity mines which the bot should deactivate
;5047:		BotCheckForProxMines(bs, &state);
;5048:		//check for dead bodies with the kamikaze effect which should be gibbed
;5049:		BotCheckForKamikazeBody(bs, &state);
;5050:#endif
;5051:	}
LABELV $2190
line 5039
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 212
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 216
ADDRGP4 BotAI_GetSnapshotEntity
CALLI4
ASGNI4
ADDRLP4 212
ADDRLP4 216
INDIRI4
ASGNI4
ADDRLP4 216
INDIRI4
CNSTI4 -1
NEI4 $2189
line 5053
;5052:	//check the player state for events
;5053:	BotAI_GetEntityState(bs->client, &state);
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
line 5055
;5054:	//copy the player state events to the entity state
;5055:	state.event = bs->cur_ps.externalEvent;
ADDRLP4 0+180
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 5056
;5056:	state.eventParm = bs->cur_ps.externalEventParm;
ADDRLP4 0+184
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
line 5058
;5057:	//
;5058:	BotCheckEvents(bs, &state);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckEvents
CALLV
pop
line 5059
;5059:}
LABELV $2188
endproc BotCheckSnapshot 220 16
export BotCheckAir
proc BotCheckAir 4 4
line 5066
;5060:
;5061:/*
;5062:==================
;5063:BotCheckAir
;5064:==================
;5065:*/
;5066:void BotCheckAir(bot_state_t *bs) {
line 5067
;5067:	if (bs->inventory[INVENTORY_ENVIRONMENTSUIT] <= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 5096
ADDP4
INDIRI4
CNSTI4 0
GTI4 $2195
line 5068
;5068:		if (trap_AAS_PointContents(bs->eye) & (CONTENTS_WATER|CONTENTS_SLIME|CONTENTS_LAVA)) {
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
EQI4 $2197
line 5069
;5069:			return;
ADDRGP4 $2194
JUMPV
LABELV $2197
line 5071
;5070:		}
;5071:	}
LABELV $2195
line 5072
;5072:	bs->lastair_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6176
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 5073
;5073:}
LABELV $2194
endproc BotCheckAir 4 4
export BotAlternateRoute
proc BotAlternateRoute 16 16
line 5080
;5074:
;5075:/*
;5076:==================
;5077:BotAlternateRoute
;5078:==================
;5079:*/
;5080:bot_goal_t *BotAlternateRoute(bot_state_t *bs, bot_goal_t *goal) {
line 5084
;5081:	int t;
;5082:
;5083:	// if the bot has an alternative route goal
;5084:	if (bs->altroutegoal.areanum) {
ADDRFP4 0
INDIRP4
CNSTI4 6692
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2200
line 5086
;5085:		//
;5086:		if (bs->reachedaltroutegoal_time)
ADDRFP4 0
INDIRP4
CNSTI4 6736
ADDP4
INDIRF4
CNSTF4 0
EQF4 $2202
line 5087
;5087:			return goal;
ADDRFP4 4
INDIRP4
RETP4
ADDRGP4 $2199
JUMPV
LABELV $2202
line 5089
;5088:		// travel time towards alternative route goal
;5089:		t = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, bs->altroutegoal.areanum, bs->tfl);
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
line 5090
;5090:		if (t && t < 20) {
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $2204
ADDRLP4 12
INDIRI4
CNSTI4 20
GEI4 $2204
line 5092
;5091:			//BotAI_Print(PRT_MESSAGE, "reached alternate route goal\n");
;5092:			bs->reachedaltroutegoal_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6736
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 5093
;5093:		}
LABELV $2204
line 5094
;5094:		memcpy(goal, &bs->altroutegoal, sizeof(bot_goal_t));
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
line 5095
;5095:		return &bs->altroutegoal;
ADDRFP4 0
INDIRP4
CNSTI4 6680
ADDP4
RETP4
ADDRGP4 $2199
JUMPV
LABELV $2200
line 5097
;5096:	}
;5097:	return goal;
ADDRFP4 4
INDIRP4
RETP4
LABELV $2199
endproc BotAlternateRoute 16 16
export BotGetAlternateRouteGoal
proc BotGetAlternateRouteGoal 24 0
line 5105
;5098:}
;5099:
;5100:/*
;5101:==================
;5102:BotGetAlternateRouteGoal
;5103:==================
;5104:*/
;5105:int BotGetAlternateRouteGoal(bot_state_t *bs, int base) {
line 5110
;5106:	aas_altroutegoal_t *altroutegoals;
;5107:	bot_goal_t *goal;
;5108:	int numaltroutegoals, rnd;
;5109:
;5110:	if (base == TEAM_RED) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $2207
line 5111
;5111:		altroutegoals = red_altroutegoals;
ADDRLP4 12
ADDRGP4 red_altroutegoals
ASGNP4
line 5112
;5112:		numaltroutegoals = red_numaltroutegoals;
ADDRLP4 4
ADDRGP4 red_numaltroutegoals
INDIRI4
ASGNI4
line 5113
;5113:	}
ADDRGP4 $2208
JUMPV
LABELV $2207
line 5114
;5114:	else {
line 5115
;5115:		altroutegoals = blue_altroutegoals;
ADDRLP4 12
ADDRGP4 blue_altroutegoals
ASGNP4
line 5116
;5116:		numaltroutegoals = blue_numaltroutegoals;
ADDRLP4 4
ADDRGP4 blue_numaltroutegoals
INDIRI4
ASGNI4
line 5117
;5117:	}
LABELV $2208
line 5118
;5118:	if (!numaltroutegoals)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2209
line 5119
;5119:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2206
JUMPV
LABELV $2209
line 5120
;5120:	rnd = (float) random() * numaltroutegoals;
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
line 5121
;5121:	if (rnd >= numaltroutegoals)
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $2211
line 5122
;5122:		rnd = numaltroutegoals-1;
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $2211
line 5123
;5123:	goal = &bs->altroutegoal;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 6680
ADDP4
ASGNP4
line 5124
;5124:	goal->areanum = altroutegoals[rnd].areanum;
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
line 5125
;5125:	VectorCopy(altroutegoals[rnd].origin, goal->origin);
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
line 5126
;5126:	VectorSet(goal->mins, -8, -8, -8);
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
line 5127
;5127:	VectorSet(goal->maxs, 8, 8, 8);
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
line 5128
;5128:	goal->entitynum = 0;
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTI4 0
ASGNI4
line 5129
;5129:	goal->iteminfo = 0;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 5130
;5130:	goal->number = 0;
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 5131
;5131:	goal->flags = 0;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 5133
;5132:	//
;5133:	bs->reachedaltroutegoal_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6736
ADDP4
CNSTF4 0
ASGNF4
line 5134
;5134:	return qtrue;
CNSTI4 1
RETI4
LABELV $2206
endproc BotGetAlternateRouteGoal 24 0
export BotSetupAlternativeRouteGoals
proc BotSetupAlternativeRouteGoals 0 0
line 5142
;5135:}
;5136:
;5137:/*
;5138:==================
;5139:BotSetupAlternateRouteGoals
;5140:==================
;5141:*/
;5142:void BotSetupAlternativeRouteGoals(void) {
line 5144
;5143:
;5144:	if (altroutegoals_setup)
ADDRGP4 altroutegoals_setup
INDIRI4
CNSTI4 0
EQI4 $2214
line 5145
;5145:		return;
ADDRGP4 $2213
JUMPV
LABELV $2214
line 5214
;5146:#ifdef MISSIONPACK
;5147:	if (gametype == GT_CTF) {
;5148:		if (trap_BotGetLevelItemGoal(-1, "Neutral Flag", &ctf_neutralflag) < 0)
;5149:			BotAI_Print(PRT_WARNING, "no alt routes without Neutral Flag\n");
;5150:		if (ctf_neutralflag.areanum) {
;5151:			//
;5152:			red_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5153:										ctf_neutralflag.origin, ctf_neutralflag.areanum,
;5154:										ctf_redflag.origin, ctf_redflag.areanum, TFL_DEFAULT,
;5155:										red_altroutegoals, MAX_ALTROUTEGOALS,
;5156:										ALTROUTEGOAL_CLUSTERPORTALS|
;5157:										ALTROUTEGOAL_VIEWPORTALS);
;5158:			blue_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5159:										ctf_neutralflag.origin, ctf_neutralflag.areanum,
;5160:										ctf_blueflag.origin, ctf_blueflag.areanum, TFL_DEFAULT,
;5161:										blue_altroutegoals, MAX_ALTROUTEGOALS,
;5162:										ALTROUTEGOAL_CLUSTERPORTALS|
;5163:										ALTROUTEGOAL_VIEWPORTALS);
;5164:		}
;5165:	}
;5166:	else if (gametype == GT_1FCTF) {
;5167:		//
;5168:		red_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5169:									ctf_neutralflag.origin, ctf_neutralflag.areanum,
;5170:									ctf_redflag.origin, ctf_redflag.areanum, TFL_DEFAULT,
;5171:									red_altroutegoals, MAX_ALTROUTEGOALS,
;5172:									ALTROUTEGOAL_CLUSTERPORTALS|
;5173:									ALTROUTEGOAL_VIEWPORTALS);
;5174:		blue_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5175:									ctf_neutralflag.origin, ctf_neutralflag.areanum,
;5176:									ctf_blueflag.origin, ctf_blueflag.areanum, TFL_DEFAULT,
;5177:									blue_altroutegoals, MAX_ALTROUTEGOALS,
;5178:									ALTROUTEGOAL_CLUSTERPORTALS|
;5179:									ALTROUTEGOAL_VIEWPORTALS);
;5180:	}
;5181:	else if (gametype == GT_OBELISK) {
;5182:		if (trap_BotGetLevelItemGoal(-1, "Neutral Obelisk", &neutralobelisk) < 0)
;5183:			BotAI_Print(PRT_WARNING, "Harvester without neutral obelisk\n");
;5184:		//
;5185:		red_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5186:									neutralobelisk.origin, neutralobelisk.areanum,
;5187:									redobelisk.origin, redobelisk.areanum, TFL_DEFAULT,
;5188:									red_altroutegoals, MAX_ALTROUTEGOALS,
;5189:									ALTROUTEGOAL_CLUSTERPORTALS|
;5190:									ALTROUTEGOAL_VIEWPORTALS);
;5191:		blue_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5192:									neutralobelisk.origin, neutralobelisk.areanum,
;5193:									blueobelisk.origin, blueobelisk.areanum, TFL_DEFAULT,
;5194:									blue_altroutegoals, MAX_ALTROUTEGOALS,
;5195:									ALTROUTEGOAL_CLUSTERPORTALS|
;5196:									ALTROUTEGOAL_VIEWPORTALS);
;5197:	}
;5198:	else if (gametype == GT_HARVESTER) {
;5199:		//
;5200:		red_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5201:									neutralobelisk.origin, neutralobelisk.areanum,
;5202:									redobelisk.origin, redobelisk.areanum, TFL_DEFAULT,
;5203:									red_altroutegoals, MAX_ALTROUTEGOALS,
;5204:									ALTROUTEGOAL_CLUSTERPORTALS|
;5205:									ALTROUTEGOAL_VIEWPORTALS);
;5206:		blue_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5207:									neutralobelisk.origin, neutralobelisk.areanum,
;5208:									blueobelisk.origin, blueobelisk.areanum, TFL_DEFAULT,
;5209:									blue_altroutegoals, MAX_ALTROUTEGOALS,
;5210:									ALTROUTEGOAL_CLUSTERPORTALS|
;5211:									ALTROUTEGOAL_VIEWPORTALS);
;5212:	}
;5213:#endif
;5214:	altroutegoals_setup = qtrue;
ADDRGP4 altroutegoals_setup
CNSTI4 1
ASGNI4
line 5215
;5215:}
LABELV $2213
endproc BotSetupAlternativeRouteGoals 0 0
export BotDeathmatchAI
proc BotDeathmatchAI 1492 20
line 5222
;5216:
;5217:/*
;5218:==================
;5219:BotDeathmatchAI
;5220:==================
;5221:*/
;5222:void BotDeathmatchAI(bot_state_t *bs, float thinktime) {
line 5228
;5223:	char gender[144], name[144], buf[144];
;5224:	char userinfo[MAX_INFO_STRING];
;5225:	int i;
;5226:
;5227:	//if the bot has just been setup
;5228:	if (bs->setupcount > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6016
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2217
line 5229
;5229:		bs->setupcount--;
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
line 5230
;5230:		if (bs->setupcount > 0) return;
ADDRFP4 0
INDIRP4
CNSTI4 6016
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2219
ADDRGP4 $2216
JUMPV
LABELV $2219
line 5232
;5231:		//get the gender characteristic
;5232:		trap_Characteristic_String(bs->character, CHARACTERISTIC_GENDER, gender, sizeof(gender));
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
line 5234
;5233:		//set the bot gender
;5234:		trap_GetUserinfo(bs->client, userinfo, sizeof(userinfo));
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
line 5235
;5235:		Info_SetValueForKey(userinfo, "sex", gender);
ADDRLP4 292
ARGP4
ADDRGP4 $2221
ARGP4
ADDRLP4 148
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 5236
;5236:		trap_SetUserinfo(bs->client, userinfo);
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
line 5238
;5237:		//set the team
;5238:		if ( !bs->map_restart && g_gametype.integer != GT_TOURNAMENT ) {
ADDRFP4 0
INDIRP4
CNSTI4 6020
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2222
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
EQI4 $2222
line 5239
;5239:			Com_sprintf(buf, sizeof(buf), "team %s", bs->settings.team);
ADDRLP4 1316
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 $2225
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4756
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 5240
;5240:			trap_EA_Command(bs->client, buf);
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
line 5241
;5241:		}
LABELV $2222
line 5243
;5242:		//set the chat gender
;5243:		if (gender[0] == 'm') trap_BotSetChatGender(bs->cs, CHAT_GENDERMALE);
ADDRLP4 148
INDIRI1
CVII4 1
CNSTI4 109
NEI4 $2226
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
ADDRGP4 $2227
JUMPV
LABELV $2226
line 5244
;5244:		else if (gender[0] == 'f')  trap_BotSetChatGender(bs->cs, CHAT_GENDERFEMALE);
ADDRLP4 148
INDIRI1
CVII4 1
CNSTI4 102
NEI4 $2228
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
ADDRGP4 $2229
JUMPV
LABELV $2228
line 5245
;5245:		else  trap_BotSetChatGender(bs->cs, CHAT_GENDERLESS);
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
LABELV $2229
LABELV $2227
line 5247
;5246:		//set the chat name
;5247:		ClientName(bs->client, name, sizeof(name));
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
line 5248
;5248:		trap_BotSetChatName(bs->cs, name, bs->client);
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
line 5250
;5249:		//
;5250:		bs->lastframe_health = bs->inventory[INVENTORY_HEALTH];
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
line 5251
;5251:		bs->lasthitcount = bs->cur_ps.persistant[PERS_HITS];
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
line 5253
;5252:		//
;5253:		bs->setupcount = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6016
ADDP4
CNSTI4 0
ASGNI4
line 5255
;5254:		//
;5255:		BotSetupAlternativeRouteGoals();
ADDRGP4 BotSetupAlternativeRouteGoals
CALLV
pop
line 5256
;5256:	}
LABELV $2217
line 5258
;5257:	//no ideal view set
;5258:	bs->flags &= ~BFL_IDEALVIEWSET;
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
line 5260
;5259:	//
;5260:	if (!BotIntermission(bs)) {
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
NEI4 $2230
line 5262
;5261:		//set the teleport time
;5262:		BotSetTeleportTime(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeleportTime
CALLV
pop
line 5264
;5263:		//update some inventory values
;5264:		BotUpdateInventory(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotUpdateInventory
CALLV
pop
line 5266
;5265:		//check out the snapshot
;5266:		BotCheckSnapshot(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckSnapshot
CALLV
pop
line 5268
;5267:		//check for air
;5268:		BotCheckAir(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckAir
CALLV
pop
line 5269
;5269:	}
LABELV $2230
line 5271
;5270:	//check the console messages
;5271:	BotCheckConsoleMessages(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckConsoleMessages
CALLV
pop
line 5273
;5272:	//if not in the intermission and not in observer mode
;5273:	if (!BotIntermission(bs) && !BotIsObserver(bs)) {
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
NEI4 $2232
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
NEI4 $2232
line 5275
;5274:		//do team AI
;5275:		BotTeamAI(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotTeamAI
CALLV
pop
line 5276
;5276:	}
LABELV $2232
line 5278
;5277:	//if the bot has no ai node
;5278:	if (!bs->ainode) {
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2234
line 5279
;5279:		AIEnter_Seek_LTG(bs, "BotDeathmatchAI: no ai node");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2236
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 5280
;5280:	}
LABELV $2234
line 5282
;5281:	//if the bot entered the game less than 8 seconds ago
;5282:	if (!bs->entergamechat && bs->entergame_time > FloatTime() - 8) {
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
NEI4 $2237
ADDRLP4 1476
INDIRP4
CNSTI4 6064
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1090519040
SUBF4
LEF4 $2237
line 5283
;5283:		if (BotChat_EnterGame(bs)) {
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
EQI4 $2239
line 5284
;5284:			bs->stand_time = FloatTime() + BotChatTime(bs);
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
line 5285
;5285:			AIEnter_Stand(bs, "BotDeathmatchAI: chat enter game");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2241
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 5286
;5286:		}
LABELV $2239
line 5287
;5287:		bs->entergamechat = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6024
ADDP4
CNSTI4 1
ASGNI4
line 5288
;5288:	}
LABELV $2237
line 5290
;5289:	//reset the node switches from the previous frame
;5290:	BotResetNodeSwitches();
ADDRGP4 BotResetNodeSwitches
CALLV
pop
line 5292
;5291:	//execute AI nodes
;5292:	for (i = 0; i < MAX_NODESWITCHES; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2242
line 5293
;5293:		if (bs->ainode(bs)) break;
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
EQI4 $2246
ADDRGP4 $2244
JUMPV
LABELV $2246
line 5294
;5294:	}
LABELV $2243
line 5292
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 50
LTI4 $2242
LABELV $2244
line 5296
;5295:	//if the bot removed itself :)
;5296:	if (!bs->inuse) return;
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $2248
ADDRGP4 $2216
JUMPV
LABELV $2248
line 5298
;5297:	//if the bot executed too many AI nodes
;5298:	if (i >= MAX_NODESWITCHES) {
ADDRLP4 0
INDIRI4
CNSTI4 50
LTI4 $2250
line 5299
;5299:		trap_BotDumpGoalStack(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotDumpGoalStack
CALLV
pop
line 5300
;5300:		trap_BotDumpAvoidGoals(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotDumpAvoidGoals
CALLV
pop
line 5301
;5301:		BotDumpNodeSwitches(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotDumpNodeSwitches
CALLV
pop
line 5302
;5302:		ClientName(bs->client, name, sizeof(name));
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
line 5303
;5303:		BotAI_Print(PRT_ERROR, "%s at %1.1f switched more than %d AI nodes\n", name, FloatTime(), MAX_NODESWITCHES);
CNSTI4 3
ARGI4
ADDRGP4 $2252
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
line 5304
;5304:	}
LABELV $2250
line 5306
;5305:	//
;5306:	bs->lastframe_health = bs->inventory[INVENTORY_HEALTH];
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
line 5307
;5307:	bs->lasthitcount = bs->cur_ps.persistant[PERS_HITS];
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
line 5308
;5308:}
LABELV $2216
endproc BotDeathmatchAI 1492 20
export BotSetEntityNumForGoalWithModel
proc BotSetEntityNumForGoalWithModel 44 4
line 5315
;5309:
;5310:/*
;5311:==================
;5312:BotSetEntityNumForGoalWithModel
;5313:==================
;5314:*/
;5315:void BotSetEntityNumForGoalWithModel(bot_goal_t *goal, int eType, char *modelname) {
line 5320
;5316:	gentity_t *ent;
;5317:	int i, modelindex;
;5318:	vec3_t dir;
;5319:
;5320:	modelindex = G_ModelIndex( modelname );
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
line 5321
;5321:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 5322
;5322:	for (i = 0; i < level.num_entities; i++, ent++) {
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $2257
JUMPV
LABELV $2254
line 5323
;5323:		if ( !ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2259
line 5324
;5324:			continue;
ADDRGP4 $2255
JUMPV
LABELV $2259
line 5326
;5325:		}
;5326:		if ( eType && ent->s.eType != eType) {
ADDRLP4 28
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $2261
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $2261
line 5327
;5327:			continue;
ADDRGP4 $2255
JUMPV
LABELV $2261
line 5329
;5328:		}
;5329:		if (ent->s.modelindex != modelindex) {
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $2263
line 5330
;5330:			continue;
ADDRGP4 $2255
JUMPV
LABELV $2263
line 5332
;5331:		}
;5332:		VectorSubtract(goal->origin, ent->s.origin, dir);
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
line 5333
;5333:		if (VectorLengthSquared(dir) < Square(10)) {
ADDRLP4 4
ARGP4
ADDRLP4 40
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 40
INDIRF4
CNSTF4 1120403456
GEF4 $2267
line 5334
;5334:			goal->entitynum = i;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 5335
;5335:			return;
ADDRGP4 $2253
JUMPV
LABELV $2267
line 5337
;5336:		}
;5337:	}
LABELV $2255
line 5322
ADDRLP4 16
ADDRLP4 16
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
LABELV $2257
ADDRLP4 16
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $2254
line 5338
;5338:}
LABELV $2253
endproc BotSetEntityNumForGoalWithModel 44 4
export BotSetEntityNumForGoal
proc BotSetEntityNumForGoal 36 8
line 5345
;5339:
;5340:/*
;5341:==================
;5342:BotSetEntityNumForGoal
;5343:==================
;5344:*/
;5345:void BotSetEntityNumForGoal(bot_goal_t *goal, char *classname) {
line 5350
;5346:	gentity_t *ent;
;5347:	int i;
;5348:	vec3_t dir;
;5349:
;5350:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 5351
;5351:	for (i = 0; i < level.num_entities; i++, ent++) {
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $2273
JUMPV
LABELV $2270
line 5352
;5352:		if ( !ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2275
line 5353
;5353:			continue;
ADDRGP4 $2271
JUMPV
LABELV $2275
line 5355
;5354:		}
;5355:		if ( !Q_stricmp(ent->classname, classname) ) {
ADDRLP4 0
INDIRP4
CNSTI4 532
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
NEI4 $2277
line 5356
;5356:			continue;
ADDRGP4 $2271
JUMPV
LABELV $2277
line 5358
;5357:		}
;5358:		VectorSubtract(goal->origin, ent->s.origin, dir);
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
line 5359
;5359:		if (VectorLengthSquared(dir) < Square(10)) {
ADDRLP4 4
ARGP4
ADDRLP4 32
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 32
INDIRF4
CNSTF4 1120403456
GEF4 $2281
line 5360
;5360:			goal->entitynum = i;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 5361
;5361:			return;
ADDRGP4 $2269
JUMPV
LABELV $2281
line 5363
;5362:		}
;5363:	}
LABELV $2271
line 5351
ADDRLP4 16
ADDRLP4 16
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
LABELV $2273
ADDRLP4 16
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $2270
line 5364
;5364:}
LABELV $2269
endproc BotSetEntityNumForGoal 36 8
export BotGoalForBSPEntity
proc BotGoalForBSPEntity 1128 20
line 5371
;5365:
;5366:/*
;5367:==================
;5368:BotGoalForBSPEntity
;5369:==================
;5370:*/
;5371:int BotGoalForBSPEntity( char *classname, bot_goal_t *goal ) {
line 5376
;5372:	char value[MAX_INFO_STRING];
;5373:	vec3_t origin, start, end;
;5374:	int ent, numareas, areas[10];
;5375:
;5376:	memset(goal, 0, sizeof(bot_goal_t));
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
line 5377
;5377:	for (ent = trap_AAS_NextBSPEntity(0); ent; ent = trap_AAS_NextBSPEntity(ent)) {
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
ADDRGP4 $2287
JUMPV
LABELV $2284
line 5378
;5378:		if (!trap_AAS_ValueForBSPEpairKey(ent, "classname", value, sizeof(value)))
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1848
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
NEI4 $2288
line 5379
;5379:			continue;
ADDRGP4 $2285
JUMPV
LABELV $2288
line 5380
;5380:		if (!strcmp(value, classname)) {
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
NEI4 $2290
line 5381
;5381:			if (!trap_AAS_VectorForBSPEpairKey(ent, "origin", origin))
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1867
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
NEI4 $2292
line 5382
;5382:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2283
JUMPV
LABELV $2292
line 5383
;5383:			VectorCopy(origin, goal->origin);
ADDRFP4 4
INDIRP4
ADDRLP4 1028
INDIRB
ASGNB 12
line 5384
;5384:			VectorCopy(origin, start);
ADDRLP4 1040
ADDRLP4 1028
INDIRB
ASGNB 12
line 5385
;5385:			start[2] -= 32;
ADDRLP4 1040+8
ADDRLP4 1040+8
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 5386
;5386:			VectorCopy(origin, end);
ADDRLP4 1052
ADDRLP4 1028
INDIRB
ASGNB 12
line 5387
;5387:			end[2] += 32;
ADDRLP4 1052+8
ADDRLP4 1052+8
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 5388
;5388:			numareas = trap_AAS_TraceAreas(start, end, areas, NULL, 10);
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
line 5389
;5389:			if (!numareas)
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $2296
line 5390
;5390:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2283
JUMPV
LABELV $2296
line 5391
;5391:			goal->areanum = areas[0];
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 1068
INDIRI4
ASGNI4
line 5392
;5392:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2283
JUMPV
LABELV $2290
line 5394
;5393:		}
;5394:	}
LABELV $2285
line 5377
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
LABELV $2287
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2284
line 5395
;5395:	return qfalse;
CNSTI4 0
RETI4
LABELV $2283
endproc BotGoalForBSPEntity 1128 20
export BotSetupDeathmatchAI
proc BotSetupDeathmatchAI 156 16
line 5403
;5396:}
;5397:
;5398:/*
;5399:==================
;5400:BotSetupDeathmatchAI
;5401:==================
;5402:*/
;5403:void BotSetupDeathmatchAI(void) {
line 5407
;5404:	int ent, modelnum;
;5405:	char model[128];
;5406:
;5407:	gametype = trap_Cvar_VariableIntegerValue("g_gametype");
ADDRGP4 $2299
ARGP4
ADDRLP4 136
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 gametype
ADDRLP4 136
INDIRI4
ASGNI4
line 5408
;5408:	maxclients = trap_Cvar_VariableIntegerValue("sv_maxclients");
ADDRGP4 $282
ARGP4
ADDRLP4 140
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 maxclients
ADDRLP4 140
INDIRI4
ASGNI4
line 5410
;5409:
;5410:	trap_Cvar_Register(&bot_rocketjump, "bot_rocketjump", "1", 0);
ADDRGP4 bot_rocketjump
ARGP4
ADDRGP4 $2300
ARGP4
ADDRGP4 $2114
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5411
;5411:	trap_Cvar_Register(&bot_grapple, "bot_grapple", "0", 0);
ADDRGP4 bot_grapple
ARGP4
ADDRGP4 $2301
ARGP4
ADDRGP4 $2302
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5412
;5412:	trap_Cvar_Register(&bot_fastchat, "bot_fastchat", "0", 0);
ADDRGP4 bot_fastchat
ARGP4
ADDRGP4 $2303
ARGP4
ADDRGP4 $2302
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5413
;5413:	trap_Cvar_Register(&bot_nochat, "bot_nochat", "0", 0);
ADDRGP4 bot_nochat
ARGP4
ADDRGP4 $2304
ARGP4
ADDRGP4 $2302
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5414
;5414:	trap_Cvar_Register(&bot_testrchat, "bot_testrchat", "0", 0);
ADDRGP4 bot_testrchat
ARGP4
ADDRGP4 $2113
ARGP4
ADDRGP4 $2302
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5415
;5415:	trap_Cvar_Register(&bot_challenge, "bot_challenge", "0", 0);
ADDRGP4 bot_challenge
ARGP4
ADDRGP4 $2305
ARGP4
ADDRGP4 $2302
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5416
;5416:	trap_Cvar_Register(&bot_predictobstacles, "bot_predictobstacles", "1", 0);
ADDRGP4 bot_predictobstacles
ARGP4
ADDRGP4 $2306
ARGP4
ADDRGP4 $2114
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5417
;5417:	trap_Cvar_Register(&g_spSkill, "g_spSkill", "2", 0);
ADDRGP4 g_spSkill
ARGP4
ADDRGP4 $2307
ARGP4
ADDRGP4 $2308
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5419
;5418:	//
;5419:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $2309
line 5420
;5420:		if (trap_BotGetLevelItemGoal(-1, "Red Flag", &ctf_redflag) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $2313
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
GEI4 $2311
line 5421
;5421:			BotAI_Print(PRT_WARNING, "CTF without Red Flag\n");
CNSTI4 2
ARGI4
ADDRGP4 $2314
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $2311
line 5422
;5422:		if (trap_BotGetLevelItemGoal(-1, "Blue Flag", &ctf_blueflag) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $2317
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
GEI4 $2315
line 5423
;5423:			BotAI_Print(PRT_WARNING, "CTF without Blue Flag\n");
CNSTI4 2
ARGI4
ADDRGP4 $2318
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $2315
line 5424
;5424:	}
LABELV $2309
line 5455
;5425:#ifdef MISSIONPACK
;5426:	else if (gametype == GT_1FCTF) {
;5427:		if (trap_BotGetLevelItemGoal(-1, "Neutral Flag", &ctf_neutralflag) < 0)
;5428:			BotAI_Print(PRT_WARNING, "One Flag CTF without Neutral Flag\n");
;5429:		if (trap_BotGetLevelItemGoal(-1, "Red Flag", &ctf_redflag) < 0)
;5430:			BotAI_Print(PRT_WARNING, "CTF without Red Flag\n");
;5431:		if (trap_BotGetLevelItemGoal(-1, "Blue Flag", &ctf_blueflag) < 0)
;5432:			BotAI_Print(PRT_WARNING, "CTF without Blue Flag\n");
;5433:	}
;5434:	else if (gametype == GT_OBELISK) {
;5435:		if (trap_BotGetLevelItemGoal(-1, "Red Obelisk", &redobelisk) < 0)
;5436:			BotAI_Print(PRT_WARNING, "Obelisk without red obelisk\n");
;5437:		BotSetEntityNumForGoal(&redobelisk, "team_redobelisk");
;5438:		if (trap_BotGetLevelItemGoal(-1, "Blue Obelisk", &blueobelisk) < 0)
;5439:			BotAI_Print(PRT_WARNING, "Obelisk without blue obelisk\n");
;5440:		BotSetEntityNumForGoal(&blueobelisk, "team_blueobelisk");
;5441:	}
;5442:	else if (gametype == GT_HARVESTER) {
;5443:		if (trap_BotGetLevelItemGoal(-1, "Red Obelisk", &redobelisk) < 0)
;5444:			BotAI_Print(PRT_WARNING, "Harvester without red obelisk\n");
;5445:		BotSetEntityNumForGoal(&redobelisk, "team_redobelisk");
;5446:		if (trap_BotGetLevelItemGoal(-1, "Blue Obelisk", &blueobelisk) < 0)
;5447:			BotAI_Print(PRT_WARNING, "Harvester without blue obelisk\n");
;5448:		BotSetEntityNumForGoal(&blueobelisk, "team_blueobelisk");
;5449:		if (trap_BotGetLevelItemGoal(-1, "Neutral Obelisk", &neutralobelisk) < 0)
;5450:			BotAI_Print(PRT_WARNING, "Harvester without neutral obelisk\n");
;5451:		BotSetEntityNumForGoal(&neutralobelisk, "team_neutralobelisk");
;5452:	}
;5453:#endif
;5454:
;5455:	max_bspmodelindex = 0;
ADDRGP4 max_bspmodelindex
CNSTI4 0
ASGNI4
line 5456
;5456:	for (ent = trap_AAS_NextBSPEntity(0); ent; ent = trap_AAS_NextBSPEntity(ent)) {
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
ADDRGP4 $2322
JUMPV
LABELV $2319
line 5457
;5457:		if (!trap_AAS_ValueForBSPEpairKey(ent, "model", model, sizeof(model))) continue;
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $277
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
NEI4 $2323
ADDRGP4 $2320
JUMPV
LABELV $2323
line 5458
;5458:		if (model[0] == '*') {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $2325
line 5459
;5459:			modelnum = atoi(model+1);
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
line 5460
;5460:			if (modelnum > max_bspmodelindex)
ADDRLP4 132
INDIRI4
ADDRGP4 max_bspmodelindex
INDIRI4
LEI4 $2328
line 5461
;5461:				max_bspmodelindex = modelnum;
ADDRGP4 max_bspmodelindex
ADDRLP4 132
INDIRI4
ASGNI4
LABELV $2328
line 5462
;5462:		}
LABELV $2325
line 5463
;5463:	}
LABELV $2320
line 5456
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
LABELV $2322
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2319
line 5465
;5464:	//initialize the waypoint heap
;5465:	BotInitWaypoints();
ADDRGP4 BotInitWaypoints
CALLV
pop
line 5466
;5466:}
LABELV $2298
endproc BotSetupDeathmatchAI 156 16
export BotShutdownDeathmatchAI
proc BotShutdownDeathmatchAI 0 0
line 5473
;5467:
;5468:/*
;5469:==================
;5470:BotShutdownDeathmatchAI
;5471:==================
;5472:*/
;5473:void BotShutdownDeathmatchAI(void) {
line 5474
;5474:	altroutegoals_setup = qfalse;
ADDRGP4 altroutegoals_setup
CNSTI4 0
ASGNI4
line 5475
;5475:}
LABELV $2330
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
LABELV $2318
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
LABELV $2317
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
LABELV $2314
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
LABELV $2313
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
LABELV $2308
byte 1 50
byte 1 0
align 1
LABELV $2307
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
LABELV $2306
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
LABELV $2305
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
LABELV $2304
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
LABELV $2303
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
LABELV $2302
byte 1 48
byte 1 0
align 1
LABELV $2301
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
LABELV $2300
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
LABELV $2299
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
LABELV $2252
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
LABELV $2241
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
LABELV $2236
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
LABELV $2225
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $2221
byte 1 115
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $2181
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
LABELV $2178
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
LABELV $2157
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
LABELV $2154
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
LABELV $2125
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
LABELV $2118
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
LABELV $2117
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
LABELV $2114
byte 1 49
byte 1 0
align 1
LABELV $2113
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
LABELV $1979
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
LABELV $1978
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
LABELV $1974
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
LABELV $1962
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
LABELV $1961
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
LABELV $1958
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
LABELV $1947
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
LABELV $1934
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
LABELV $1928
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
LABELV $1920
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $1909
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
LABELV $1905
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
LABELV $1902
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
LABELV $1867
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $1862
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
LABELV $1861
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 98
byte 1 114
byte 1 101
byte 1 97
byte 1 107
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $1854
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
LABELV $1851
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
LABELV $1848
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
LABELV $1847
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
LABELV $1835
byte 1 42
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $1650
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $1627
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $1624
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $1586
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
LABELV $1531
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
LABELV $1527
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $678
byte 1 70
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $677
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
LABELV $676
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $675
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
LABELV $674
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
LABELV $673
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
LABELV $501
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
LABELV $327
byte 1 93
byte 1 0
align 1
LABELV $326
byte 1 91
byte 1 0
align 1
LABELV $325
byte 1 32
byte 1 0
align 1
LABELV $282
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
LABELV $277
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $276
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
LABELV $271
byte 1 110
byte 1 0
align 1
LABELV $270
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
LABELV $269
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
LABELV $188
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
LABELV $163
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
LABELV $162
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $161
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
LABELV $138
byte 1 110
byte 1 111
byte 1 0
align 1
LABELV $70
byte 1 116
byte 1 0
