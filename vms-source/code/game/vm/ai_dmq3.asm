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
export BotFirstLadder
proc BotFirstLadder 8 4
line 117
;108:
;109:/*
;110:==================
;111:BotFirstLadder
;112:==================
;113:*/
;114:
;115:// Ladder support (part 2) -Vincent
;116:int BotFirstLadder( int *areas, int numareas )
;117:{
line 119
;118:	int i;
;119:	for (i=0; i<numareas; i++) 
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $61
JUMPV
LABELV $58
line 120
;120:	{
line 121
;121:		if (trap_AAS_AreaLadder( areas[i] )) 
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 trap_AAS_AreaLadder
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $62
line 122
;122:		{
line 123
;123:		return areas[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI4
RETI4
ADDRGP4 $57
JUMPV
LABELV $62
line 125
;124:		}
;125:	}
LABELV $59
line 119
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $61
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $58
line 126
;126:	return 0;
CNSTI4 0
RETI4
LABELV $57
endproc BotFirstLadder 8 4
export BotCTFCarryingFlag
proc BotCTFCarryingFlag 0 0
line 134
;127:}
;128:
;129:/*
;130:==================
;131:BotCTFCarryingFlag
;132:==================
;133:*/
;134:int BotCTFCarryingFlag(bot_state_t *bs) {
line 135
;135:	if (gametype != GT_CTF) return CTF_FLAG_NONE;
ADDRGP4 gametype
INDIRI4
CNSTI4 4
EQI4 $65
CNSTI4 0
RETI4
ADDRGP4 $64
JUMPV
LABELV $65
line 137
;136:
;137:	if (bs->inventory[INVENTORY_REDFLAG] > 0) return CTF_FLAG_RED;
ADDRFP4 0
INDIRP4
CNSTI4 5132
ADDP4
INDIRI4
CNSTI4 0
LEI4 $67
CNSTI4 1
RETI4
ADDRGP4 $64
JUMPV
LABELV $67
line 138
;138:	else if (bs->inventory[INVENTORY_BLUEFLAG] > 0) return CTF_FLAG_BLUE;
ADDRFP4 0
INDIRP4
CNSTI4 5136
ADDP4
INDIRI4
CNSTI4 0
LEI4 $69
CNSTI4 2
RETI4
ADDRGP4 $64
JUMPV
LABELV $69
line 139
;139:	return CTF_FLAG_NONE;
CNSTI4 0
RETI4
LABELV $64
endproc BotCTFCarryingFlag 0 0
export BotTeam
proc BotTeam 1044 12
line 147
;140:}
;141:
;142:/*
;143:==================
;144:BotTeam
;145:==================
;146:*/
;147:int BotTeam(bot_state_t *bs) {
line 150
;148:	char info[1024];
;149:
;150:	if (bs->client < 0 || bs->client >= MAX_CLIENTS) {
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
LTI4 $74
ADDRLP4 1024
INDIRI4
CNSTI4 64
LTI4 $72
LABELV $74
line 152
;151:		//BotAI_Print(PRT_ERROR, "BotCTFTeam: client out of range\n");
;152:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $71
JUMPV
LABELV $72
line 154
;153:	}
;154:	trap_GetConfigstring(CS_PLAYERS+bs->client, info, sizeof(info));
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
line 156
;155:	//
;156:	if (atoi(Info_ValueForKey(info, "t")) == TEAM_RED) return TEAM_RED;
ADDRLP4 0
ARGP4
ADDRGP4 $77
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
NEI4 $75
CNSTI4 1
RETI4
ADDRGP4 $71
JUMPV
LABELV $75
line 157
;157:	else if (atoi(Info_ValueForKey(info, "t")) == TEAM_BLUE) return TEAM_BLUE;
ADDRLP4 0
ARGP4
ADDRGP4 $77
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
NEI4 $78
CNSTI4 2
RETI4
ADDRGP4 $71
JUMPV
LABELV $78
line 158
;158:	return TEAM_FREE;
CNSTI4 0
RETI4
LABELV $71
endproc BotTeam 1044 12
export BotOppositeTeam
proc BotOppositeTeam 12 4
line 166
;159:}
;160:
;161:/*
;162:==================
;163:BotOppositeTeam
;164:==================
;165:*/
;166:int BotOppositeTeam(bot_state_t *bs) {
line 167
;167:	switch(BotTeam(bs)) {
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
EQI4 $84
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $85
ADDRGP4 $81
JUMPV
LABELV $84
line 168
;168:		case TEAM_RED: return TEAM_BLUE;
CNSTI4 2
RETI4
ADDRGP4 $80
JUMPV
LABELV $85
line 169
;169:		case TEAM_BLUE: return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $80
JUMPV
LABELV $81
line 170
;170:		default: return TEAM_FREE;
CNSTI4 0
RETI4
LABELV $80
endproc BotOppositeTeam 12 4
export BotEnemyFlag
proc BotEnemyFlag 4 4
line 179
;171:	}
;172:}
;173:
;174:/*
;175:==================
;176:BotEnemyFlag
;177:==================
;178:*/
;179:bot_goal_t *BotEnemyFlag(bot_state_t *bs) {
line 180
;180:	if (BotTeam(bs) == TEAM_RED) {
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
NEI4 $87
line 181
;181:		return &ctf_blueflag;
ADDRGP4 ctf_blueflag
RETP4
ADDRGP4 $86
JUMPV
LABELV $87
line 183
;182:	}
;183:	else {
line 184
;184:		return &ctf_redflag;
ADDRGP4 ctf_redflag
RETP4
LABELV $86
endproc BotEnemyFlag 4 4
export BotTeamFlag
proc BotTeamFlag 4 4
line 193
;185:	}
;186:}
;187:
;188:/*
;189:==================
;190:BotTeamFlag
;191:==================
;192:*/
;193:bot_goal_t *BotTeamFlag(bot_state_t *bs) {
line 194
;194:	if (BotTeam(bs) == TEAM_RED) {
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
NEI4 $90
line 195
;195:		return &ctf_redflag;
ADDRGP4 ctf_redflag
RETP4
ADDRGP4 $89
JUMPV
LABELV $90
line 197
;196:	}
;197:	else {
line 198
;198:		return &ctf_blueflag;
ADDRGP4 ctf_blueflag
RETP4
LABELV $89
endproc BotTeamFlag 4 4
export EntityIsDead
proc EntityIsDead 472 8
line 208
;199:	}
;200:}
;201:
;202:
;203:/*
;204:==================
;205:EntityIsDead
;206:==================
;207:*/
;208:qboolean EntityIsDead(aas_entityinfo_t *entinfo) {
line 211
;209:	playerState_t ps;
;210:
;211:	if (entinfo->number >= 0 && entinfo->number < MAX_CLIENTS) {
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
LTI4 $93
ADDRLP4 468
INDIRI4
CNSTI4 64
GEI4 $93
line 213
;212:		//retrieve the current client state
;213:		BotAI_GetClientState( entinfo->number, &ps );
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
line 214
;214:		if (ps.pm_type != PM_NORMAL) return qtrue;
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $95
CNSTI4 1
RETI4
ADDRGP4 $92
JUMPV
LABELV $95
line 215
;215:	}
LABELV $93
line 216
;216:	return qfalse;
CNSTI4 0
RETI4
LABELV $92
endproc EntityIsDead 472 8
export EntityCarriesFlag
proc EntityCarriesFlag 0 0
line 224
;217:}
;218:
;219:/*
;220:==================
;221:EntityCarriesFlag
;222:==================
;223:*/
;224:qboolean EntityCarriesFlag(aas_entityinfo_t *entinfo) {
line 225
;225:	if ( entinfo->powerups & ( 1 << PW_REDFLAG ) )
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $99
line 226
;226:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $98
JUMPV
LABELV $99
line 227
;227:	if ( entinfo->powerups & ( 1 << PW_BLUEFLAG ) )
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $101
line 228
;228:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $98
JUMPV
LABELV $101
line 233
;229:#ifdef MISSIONPACK
;230:	if ( entinfo->powerups & ( 1 << PW_NEUTRALFLAG ) )
;231:		return qtrue;
;232:#endif
;233:	return qfalse;
CNSTI4 0
RETI4
LABELV $98
endproc EntityCarriesFlag 0 0
export EntityIsInvisible
proc EntityIsInvisible 4 4
line 241
;234:}
;235:
;236:/*
;237:==================
;238:EntityIsInvisible
;239:==================
;240:*/
;241:qboolean EntityIsInvisible(aas_entityinfo_t *entinfo) {
line 243
;242:	// the flag is always visible
;243:	if (EntityCarriesFlag(entinfo)) {
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
EQI4 $104
line 244
;244:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $103
JUMPV
LABELV $104
line 246
;245:	}
;246:	if (entinfo->powerups & (1 << PW_INVIS)) {
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $106
line 247
;247:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $103
JUMPV
LABELV $106
line 249
;248:	}
;249:	return qfalse;
CNSTI4 0
RETI4
LABELV $103
endproc EntityIsInvisible 4 4
export EntityIsShooting
proc EntityIsShooting 0 0
line 257
;250:}
;251:
;252:/*
;253:==================
;254:EntityIsShooting
;255:==================
;256:*/
;257:qboolean EntityIsShooting(aas_entityinfo_t *entinfo) {
line 258
;258:	if (entinfo->flags & EF_FIRING) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $109
line 259
;259:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $108
JUMPV
LABELV $109
line 261
;260:	}
;261:	return qfalse;
CNSTI4 0
RETI4
LABELV $108
endproc EntityIsShooting 0 0
export EntityIsChatting
proc EntityIsChatting 0 0
line 269
;262:}
;263:
;264:/*
;265:==================
;266:EntityIsChatting
;267:==================
;268:*/
;269:qboolean EntityIsChatting(aas_entityinfo_t *entinfo) {
line 270
;270:	if (entinfo->flags & EF_TALK) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $112
line 271
;271:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $111
JUMPV
LABELV $112
line 273
;272:	}
;273:	return qfalse;
CNSTI4 0
RETI4
LABELV $111
endproc EntityIsChatting 0 0
export EntityHasQuad
proc EntityHasQuad 0 0
line 281
;274:}
;275:
;276:/*
;277:==================
;278:EntityHasQuad
;279:==================
;280:*/
;281:qboolean EntityHasQuad(aas_entityinfo_t *entinfo) {
line 282
;282:	if (entinfo->powerups & (1 << PW_QUAD)) {
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $115
line 283
;283:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $114
JUMPV
LABELV $115
line 285
;284:	}
;285:	return qfalse;
CNSTI4 0
RETI4
LABELV $114
endproc EntityHasQuad 0 0
export BotRememberLastOrderedTask
proc BotRememberLastOrderedTask 16 12
line 349
;286:}
;287:
;288:#ifdef MISSIONPACK
;289:/*
;290:==================
;291:EntityHasKamikze
;292:==================
;293:*/
;294:qboolean EntityHasKamikaze(aas_entityinfo_t *entinfo) {
;295:	if (entinfo->flags & EF_KAMIKAZE) {
;296:		return qtrue;
;297:	}
;298:	return qfalse;
;299:}
;300:
;301:/*
;302:==================
;303:EntityCarriesCubes
;304:==================
;305:*/
;306:qboolean EntityCarriesCubes(aas_entityinfo_t *entinfo) {
;307:	entityState_t state;
;308:
;309:	if (gametype != GT_HARVESTER)
;310:		return qfalse;
;311:	//FIXME: get this info from the aas_entityinfo_t ?
;312:	BotAI_GetEntityState(entinfo->number, &state);
;313:	if (state.generic1 > 0)
;314:		return qtrue;
;315:	return qfalse;
;316:}
;317:
;318:/*
;319:==================
;320:Bot1FCTFCarryingFlag
;321:==================
;322:*/
;323:int Bot1FCTFCarryingFlag(bot_state_t *bs) {
;324:	if (gametype != GT_1FCTF) return qfalse;
;325:
;326:	if (bs->inventory[INVENTORY_NEUTRALFLAG] > 0) return qtrue;
;327:	return qfalse;
;328:}
;329:
;330:/*
;331:==================
;332:BotHarvesterCarryingCubes
;333:==================
;334:*/
;335:int BotHarvesterCarryingCubes(bot_state_t *bs) {
;336:	if (gametype != GT_HARVESTER) return qfalse;
;337:
;338:	if (bs->inventory[INVENTORY_REDCUBE] > 0) return qtrue;
;339:	if (bs->inventory[INVENTORY_BLUECUBE] > 0) return qtrue;
;340:	return qfalse;
;341:}
;342:#endif
;343:
;344:/*
;345:==================
;346:BotRememberLastOrderedTask
;347:==================
;348:*/
;349:void BotRememberLastOrderedTask(bot_state_t *bs) {
line 350
;350:	if (!bs->ordered) {
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $118
line 351
;351:		return;
ADDRGP4 $117
JUMPV
LABELV $118
line 353
;352:	}
;353:	bs->lastgoal_decisionmaker = bs->decisionmaker;
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
line 354
;354:	bs->lastgoal_ltgtype = bs->ltgtype;
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
line 355
;355:	memcpy(&bs->lastgoal_teamgoal, &bs->teamgoal, sizeof(bot_goal_t));
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
line 356
;356:	bs->lastgoal_teammate = bs->teammate;
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
line 357
;357:}
LABELV $117
endproc BotRememberLastOrderedTask 16 12
export BotSetTeamStatus
proc BotSetTeamStatus 0 0
line 364
;358:
;359:/*
;360:==================
;361:BotSetTeamStatus
;362:==================
;363:*/
;364:void BotSetTeamStatus(bot_state_t *bs) {
line 421
;365:#ifdef MISSIONPACK
;366:	int teamtask;
;367:	aas_entityinfo_t entinfo;
;368:
;369:	teamtask = TEAMTASK_PATROL;
;370:
;371:	switch(bs->ltgtype) {
;372:		case LTG_TEAMHELP:
;373:			break;
;374:		case LTG_TEAMACCOMPANY:
;375:			BotEntityInfo(bs->teammate, &entinfo);
;376:			if ( ( (gametype == GT_CTF || gametype == GT_1FCTF) && EntityCarriesFlag(&entinfo))
;377:				|| ( gametype == GT_HARVESTER && EntityCarriesCubes(&entinfo)) ) {
;378:				teamtask = TEAMTASK_ESCORT;
;379:			}
;380:			else {
;381:				teamtask = TEAMTASK_FOLLOW;
;382:			}
;383:			break;
;384:		case LTG_DEFENDKEYAREA:
;385:			teamtask = TEAMTASK_DEFENSE;
;386:			break;
;387:		case LTG_GETFLAG:
;388:			teamtask = TEAMTASK_OFFENSE;
;389:			break;
;390:		case LTG_RUSHBASE:
;391:			teamtask = TEAMTASK_DEFENSE;
;392:			break;
;393:		case LTG_RETURNFLAG:
;394:			teamtask = TEAMTASK_RETRIEVE;
;395:			break;
;396:		case LTG_CAMP:
;397:		case LTG_CAMPORDER:
;398:			teamtask = TEAMTASK_CAMP;
;399:			break;
;400:		case LTG_PATROL:
;401:			teamtask = TEAMTASK_PATROL;
;402:			break;
;403:		case LTG_GETITEM:
;404:			teamtask = TEAMTASK_PATROL;
;405:			break;
;406:		case LTG_KILL:
;407:			teamtask = TEAMTASK_PATROL;
;408:			break;
;409:		case LTG_HARVEST:
;410:			teamtask = TEAMTASK_OFFENSE;
;411:			break;
;412:		case LTG_ATTACKENEMYBASE:
;413:			teamtask = TEAMTASK_OFFENSE;
;414:			break;
;415:		default:
;416:			teamtask = TEAMTASK_PATROL;
;417:			break;
;418:	}
;419:	BotSetUserInfo(bs, "teamtask", va("%d", teamtask));
;420:#endif
;421:}
LABELV $120
endproc BotSetTeamStatus 0 0
export BotSetLastOrderedTask
proc BotSetLastOrderedTask 60 16
line 428
;422:
;423:/*
;424:==================
;425:BotSetLastOrderedTask
;426:==================
;427:*/
;428:int BotSetLastOrderedTask(bot_state_t *bs) {
line 430
;429:
;430:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $122
line 432
;431:		// don't go back to returning the flag if it's at the base
;432:		if ( bs->lastgoal_ltgtype == LTG_RETURNFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
CNSTI4 6
NEI4 $124
line 433
;433:			if ( BotTeam(bs) == TEAM_RED ) {
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
NEI4 $126
line 434
;434:				if ( bs->redflagstatus == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
CNSTI4 0
NEI4 $127
line 435
;435:					bs->lastgoal_ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
CNSTI4 0
ASGNI4
line 436
;436:				}
line 437
;437:			}
ADDRGP4 $127
JUMPV
LABELV $126
line 438
;438:			else {
line 439
;439:				if ( bs->blueflagstatus == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
CNSTI4 0
NEI4 $130
line 440
;440:					bs->lastgoal_ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
CNSTI4 0
ASGNI4
line 441
;441:				}
LABELV $130
line 442
;442:			}
LABELV $127
line 443
;443:		}
LABELV $124
line 444
;444:	}
LABELV $122
line 446
;445:
;446:	if ( bs->lastgoal_ltgtype ) {
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $132
line 447
;447:		bs->decisionmaker = bs->lastgoal_decisionmaker;
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
line 448
;448:		bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 449
;449:		bs->ltgtype = bs->lastgoal_ltgtype;
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
line 450
;450:		memcpy(&bs->teamgoal, &bs->lastgoal_teamgoal, sizeof(bot_goal_t));
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
line 451
;451:		bs->teammate = bs->lastgoal_teammate;
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
line 452
;452:		bs->teamgoal_time = FloatTime() + 300;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1133903872
ADDF4
ASGNF4
line 453
;453:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 455
;454:		//
;455:		if ( gametype == GT_CTF ) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $134
line 456
;456:			if ( bs->ltgtype == LTG_GETFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
NEI4 $136
line 460
;457:				bot_goal_t *tb, *eb;
;458:				int tt, et;
;459:
;460:				tb = BotTeamFlag(bs);
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
line 461
;461:				eb = BotEnemyFlag(bs);
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
line 462
;462:				tt = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, tb->areanum, TFL_DEFAULT);
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
line 463
;463:				et = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, eb->areanum, TFL_DEFAULT);
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
line 465
;464:				// if the travel time towards the enemy base is larger than towards our base
;465:				if (et > tt) {
ADDRLP4 28
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $138
line 467
;466:					//get an alternative route goal towards the enemy base
;467:					BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
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
line 468
;468:				}
LABELV $138
line 469
;469:			}
LABELV $136
line 470
;470:		}
LABELV $134
line 471
;471:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $121
JUMPV
LABELV $132
line 473
;472:	}
;473:	return qfalse;
CNSTI4 0
RETI4
LABELV $121
endproc BotSetLastOrderedTask 60 16
export BotRefuseOrder
proc BotRefuseOrder 8 12
line 481
;474:}
;475:
;476:/*
;477:==================
;478:BotRefuseOrder
;479:==================
;480:*/
;481:void BotRefuseOrder(bot_state_t *bs) {
line 482
;482:	if (!bs->ordered)
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $141
line 483
;483:		return;
ADDRGP4 $140
JUMPV
LABELV $141
line 485
;484:	// if the bot was ordered to do something
;485:	if ( bs->order_time && bs->order_time > FloatTime() - 10 ) {
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
EQF4 $143
ADDRLP4 0
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1092616192
SUBF4
LEF4 $143
line 486
;486:		trap_EA_Action(bs->client, ACTION_NEGATIVE);
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
line 487
;487:		BotVoiceChat(bs, bs->decisionmaker, VOICECHAT_NO);
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
ADDRGP4 $145
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 488
;488:		bs->order_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
CNSTF4 0
ASGNF4
line 489
;489:	}
LABELV $143
line 490
;490:}
LABELV $140
endproc BotRefuseOrder 8 12
export BotCTFSeekGoals
proc BotCTFSeekGoals 240 12
line 497
;491:
;492:/*
;493:==================
;494:BotCTFSeekGoals
;495:==================
;496:*/
;497:void BotCTFSeekGoals(bot_state_t *bs) {
line 504
;498:	float rnd, l1, l2;
;499:	int flagstatus, c;
;500:	vec3_t dir;
;501:	aas_entityinfo_t entinfo;
;502:
;503:	//when carrying a flag in ctf the bot should rush to the base
;504:	if (BotCTFCarryingFlag(bs)) {
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
EQI4 $147
line 506
;505:		//if not already rushing to the base
;506:		if (bs->ltgtype != LTG_RUSHBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
EQI4 $149
line 507
;507:			BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 508
;508:			bs->ltgtype = LTG_RUSHBASE;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 5
ASGNI4
line 509
;509:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 510
;510:			bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
CNSTF4 0
ASGNF4
line 511
;511:			bs->decisionmaker = bs->client;
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
line 512
;512:			bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 514
;513:			//
;514:			switch(BotTeam(bs)) {
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
EQI4 $154
ADDRLP4 180
INDIRI4
CNSTI4 2
EQI4 $159
ADDRGP4 $151
JUMPV
LABELV $154
line 515
;515:				case TEAM_RED: VectorSubtract(bs->origin, ctf_blueflag.origin, dir); break;
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
ADDRGP4 $152
JUMPV
LABELV $159
line 516
;516:				case TEAM_BLUE: VectorSubtract(bs->origin, ctf_redflag.origin, dir); break;
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
ADDRGP4 $152
JUMPV
LABELV $151
line 517
;517:				default: VectorSet(dir, 999, 999, 999); break;
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
LABELV $152
line 520
;518:			}
;519:			// if the bot picked up the flag very close to the enemy base
;520:			if ( VectorLength(dir) < 128 ) {
ADDRLP4 160
ARGP4
ADDRLP4 192
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 192
INDIRF4
CNSTF4 1124073472
GEF4 $166
line 522
;521:				// get an alternative route goal through the enemy base
;522:				BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
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
line 523
;523:			} else {
ADDRGP4 $167
JUMPV
LABELV $166
line 525
;524:				// don't use any alt route goal, just get the hell out of the base
;525:				bs->altroutegoal.areanum = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6692
ADDP4
CNSTI4 0
ASGNI4
line 526
;526:			}
LABELV $167
line 527
;527:			BotSetUserInfo(bs, "teamtask", va("%d", TEAMTASK_OFFENSE));
ADDRGP4 $169
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
ADDRGP4 $168
ARGP4
ADDRLP4 196
INDIRP4
ARGP4
ADDRGP4 BotSetUserInfo
CALLV
pop
line 528
;528:			BotVoiceChat(bs, -1, VOICECHAT_IHAVEFLAG);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 $170
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 529
;529:		}
ADDRGP4 $146
JUMPV
LABELV $149
line 530
;530:		else if (bs->rushbaseaway_time > FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $146
line 531
;531:			if (BotTeam(bs) == TEAM_RED) flagstatus = bs->redflagstatus;
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
NEI4 $173
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $174
JUMPV
LABELV $173
line 532
;532:			else flagstatus = bs->blueflagstatus;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
ASGNI4
LABELV $174
line 534
;533:			//if the flag is back
;534:			if (flagstatus == 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $146
line 535
;535:				bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
CNSTF4 0
ASGNF4
line 536
;536:			}
line 537
;537:		}
line 538
;538:		return;
ADDRGP4 $146
JUMPV
LABELV $147
line 541
;539:	}
;540:	// if the bot decided to follow someone
;541:	if ( bs->ltgtype == LTG_TEAMACCOMPANY && !bs->ordered ) {
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
NEI4 $177
ADDRLP4 176
INDIRP4
CNSTI4 6612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $177
line 543
;542:		// if the team mate being accompanied no longer carries the flag
;543:		BotEntityInfo(bs->teammate, &entinfo);
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
line 544
;544:		if (!EntityCarriesFlag(&entinfo)) {
ADDRLP4 16
ARGP4
ADDRLP4 180
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 0
NEI4 $179
line 545
;545:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 546
;546:		}
LABELV $179
line 547
;547:	}
LABELV $177
line 549
;548:	//
;549:	if (BotTeam(bs) == TEAM_RED) flagstatus = bs->redflagstatus * 2 + bs->blueflagstatus;
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
NEI4 $181
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
ADDRGP4 $182
JUMPV
LABELV $181
line 550
;550:	else flagstatus = bs->blueflagstatus * 2 + bs->redflagstatus;
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
LABELV $182
line 552
;551:	//if our team has the enemy flag and our flag is at the base
;552:	if (flagstatus == 1) {
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $183
line 554
;553:		//
;554:		if (bs->owndecision_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
GEF4 $146
line 556
;555:			//if Not defending the base already
;556:			if (!(bs->ltgtype == LTG_DEFENDKEYAREA &&
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
NEI4 $191
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
EQI4 $146
ADDRLP4 196
INDIRI4
ADDRGP4 ctf_blueflag+44
INDIRI4
EQI4 $146
LABELV $191
line 558
;557:					(bs->teamgoal.number == ctf_redflag.number ||
;558:					bs->teamgoal.number == ctf_blueflag.number))) {
line 560
;559:				//if there is a visible team mate flag carrier
;560:				c = BotTeamFlagCarrierVisible(bs);
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
line 561
;561:				if (c >= 0 &&
ADDRLP4 204
ADDRLP4 156
INDIRI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 0
LTI4 $146
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
NEI4 $194
ADDRLP4 208
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ADDRLP4 204
INDIRI4
EQI4 $146
LABELV $194
line 563
;562:						// and not already following the team mate flag carrier
;563:						(bs->ltgtype != LTG_TEAMACCOMPANY || bs->teammate != c)) {
line 565
;564:					//
;565:					BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 567
;566:					//follow the flag carrier
;567:					bs->decisionmaker = bs->client;
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
line 568
;568:					bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 570
;569:					//the team mate
;570:					bs->teammate = c;
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
ADDRLP4 156
INDIRI4
ASGNI4
line 572
;571:					//last time the team mate was visible
;572:					bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6748
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 574
;573:					//no message
;574:					bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 576
;575:					//no arrive message
;576:					bs->arrive_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
CNSTF4 1065353216
ASGNF4
line 578
;577:					//
;578:					BotVoiceChat(bs, bs->teammate, VOICECHAT_ONFOLLOW);
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
ADDRGP4 $195
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 580
;579:					//get the team goal time
;580:					bs->teamgoal_time = FloatTime() + TEAM_ACCOMPANY_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 581
;581:					bs->ltgtype = LTG_TEAMACCOMPANY;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 2
ASGNI4
line 582
;582:					bs->formation_dist = 3.5 * 32;		//3.5 meter
ADDRFP4 0
INDIRP4
CNSTI4 7012
ADDP4
CNSTF4 1121976320
ASGNF4
line 583
;583:					BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 584
;584:					bs->owndecision_time = FloatTime() + 5;
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
line 585
;585:				}
line 586
;586:			}
line 587
;587:		}
line 588
;588:		return;
ADDRGP4 $146
JUMPV
LABELV $183
line 591
;589:	}
;590:	//if the enemy has our flag
;591:	else if (flagstatus == 2) {
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $196
line 593
;592:		//
;593:		if (bs->owndecision_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
GEF4 $146
line 595
;594:			//if enemy flag carrier is visible
;595:			c = BotEnemyFlagCarrierVisible(bs);
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
line 596
;596:			if (c >= 0) {
ADDRLP4 156
INDIRI4
CNSTI4 0
LTI4 $200
line 598
;597:				//FIXME: fight enemy flag carrier
;598:			}
LABELV $200
line 600
;599:			//if not already doing something important
;600:			if (bs->ltgtype != LTG_GETFLAG &&
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
EQI4 $146
ADDRLP4 196
INDIRI4
CNSTI4 6
EQI4 $146
ADDRLP4 196
INDIRI4
CNSTI4 1
EQI4 $146
ADDRLP4 196
INDIRI4
CNSTI4 2
EQI4 $146
ADDRLP4 196
INDIRI4
CNSTI4 8
EQI4 $146
ADDRLP4 196
INDIRI4
CNSTI4 9
EQI4 $146
ADDRLP4 196
INDIRI4
CNSTI4 10
EQI4 $146
line 606
;601:				bs->ltgtype != LTG_RETURNFLAG &&
;602:				bs->ltgtype != LTG_TEAMHELP &&
;603:				bs->ltgtype != LTG_TEAMACCOMPANY &&
;604:				bs->ltgtype != LTG_CAMPORDER &&
;605:				bs->ltgtype != LTG_PATROL &&
;606:				bs->ltgtype != LTG_GETITEM) {
line 608
;607:
;608:				BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 609
;609:				bs->decisionmaker = bs->client;
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
line 610
;610:				bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 612
;611:				//
;612:				if (random() < 0.5) {
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
GEF4 $204
line 614
;613:					//go for the enemy flag
;614:					bs->ltgtype = LTG_GETFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 4
ASGNI4
line 615
;615:				}
ADDRGP4 $205
JUMPV
LABELV $204
line 616
;616:				else {
line 617
;617:					bs->ltgtype = LTG_RETURNFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 6
ASGNI4
line 618
;618:				}
LABELV $205
line 620
;619:				//no team message
;620:				bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 622
;621:				//set the time the bot will stop getting the flag
;622:				bs->teamgoal_time = FloatTime() + CTF_GETFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 624
;623:				//get an alternative route goal towards the enemy base
;624:				BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
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
line 626
;625:				//
;626:				BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 627
;627:				bs->owndecision_time = FloatTime() + 5;
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
line 628
;628:			}
line 629
;629:		}
line 630
;630:		return;
ADDRGP4 $146
JUMPV
LABELV $196
line 633
;631:	}
;632:	//if both flags Not at their bases
;633:	else if (flagstatus == 3) {
ADDRLP4 0
INDIRI4
CNSTI4 3
NEI4 $206
line 635
;634:		//
;635:		if (bs->owndecision_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
GEF4 $146
line 637
;636:			// if not trying to return the flag and not following the team flag carrier
;637:			if ( bs->ltgtype != LTG_RETURNFLAG && bs->ltgtype != LTG_TEAMACCOMPANY ) {
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
EQI4 $146
ADDRLP4 192
INDIRI4
CNSTI4 2
EQI4 $146
line 639
;638:				//
;639:				c = BotTeamFlagCarrierVisible(bs);
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
line 641
;640:				// if there is a visible team mate flag carrier
;641:				if (c >= 0) {
ADDRLP4 156
INDIRI4
CNSTI4 0
LTI4 $212
line 642
;642:					BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 644
;643:					//follow the flag carrier
;644:					bs->decisionmaker = bs->client;
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
line 645
;645:					bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 647
;646:					//the team mate
;647:					bs->teammate = c;
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
ADDRLP4 156
INDIRI4
ASGNI4
line 649
;648:					//last time the team mate was visible
;649:					bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6748
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 651
;650:					//no message
;651:					bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 653
;652:					//no arrive message
;653:					bs->arrive_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
CNSTF4 1065353216
ASGNF4
line 655
;654:					//
;655:					BotVoiceChat(bs, bs->teammate, VOICECHAT_ONFOLLOW);
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
ADDRGP4 $195
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 657
;656:					//get the team goal time
;657:					bs->teamgoal_time = FloatTime() + TEAM_ACCOMPANY_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 658
;658:					bs->ltgtype = LTG_TEAMACCOMPANY;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 2
ASGNI4
line 659
;659:					bs->formation_dist = 3.5 * 32;		//3.5 meter
ADDRFP4 0
INDIRP4
CNSTI4 7012
ADDP4
CNSTF4 1121976320
ASGNF4
line 661
;660:					//
;661:					BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 662
;662:					bs->owndecision_time = FloatTime() + 5;
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
line 663
;663:				}
ADDRGP4 $146
JUMPV
LABELV $212
line 664
;664:				else {
line 665
;665:					BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 666
;666:					bs->decisionmaker = bs->client;
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
line 667
;667:					bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 669
;668:					//get the enemy flag
;669:					bs->teammessage_time = FloatTime() + 2 * random();
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
line 671
;670:					//get the flag
;671:					bs->ltgtype = LTG_RETURNFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 6
ASGNI4
line 673
;672:					//set the time the bot will stop getting the flag
;673:					bs->teamgoal_time = FloatTime() + CTF_RETURNFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 675
;674:					//get an alternative route goal towards the enemy base
;675:					BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
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
line 677
;676:					//
;677:					BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 678
;678:					bs->owndecision_time = FloatTime() + 5;
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
line 679
;679:				}
line 680
;680:			}
line 681
;681:		}
line 682
;682:		return;
ADDRGP4 $146
JUMPV
LABELV $206
line 685
;683:	}
;684:	// don't just do something wait for the bot team leader to give orders
;685:	if (BotTeamLeader(bs)) {
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
EQI4 $214
line 686
;686:		return;
ADDRGP4 $146
JUMPV
LABELV $214
line 689
;687:	}
;688:	// if the bot is ordered to do something
;689:	if ( bs->lastgoal_ltgtype ) {
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $216
line 690
;690:		bs->teamgoal_time += 60;
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
line 691
;691:	}
LABELV $216
line 693
;692:	// if the bot decided to do something on it's own and has a last ordered goal
;693:	if ( !bs->ordered && bs->lastgoal_ltgtype ) {
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
NEI4 $218
ADDRLP4 196
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
ADDRLP4 200
INDIRI4
EQI4 $218
line 694
;694:		bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 695
;695:	}
LABELV $218
line 697
;696:	//if already a CTF or team goal
;697:	if (bs->ltgtype == LTG_TEAMHELP ||
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
EQI4 $231
ADDRLP4 204
INDIRI4
CNSTI4 2
EQI4 $231
ADDRLP4 204
INDIRI4
CNSTI4 3
EQI4 $231
ADDRLP4 204
INDIRI4
CNSTI4 4
EQI4 $231
ADDRLP4 204
INDIRI4
CNSTI4 5
EQI4 $231
ADDRLP4 204
INDIRI4
CNSTI4 6
EQI4 $231
ADDRLP4 204
INDIRI4
CNSTI4 8
EQI4 $231
ADDRLP4 204
INDIRI4
CNSTI4 9
EQI4 $231
ADDRLP4 204
INDIRI4
CNSTI4 10
EQI4 $231
ADDRLP4 204
INDIRI4
CNSTI4 14
EQI4 $231
ADDRLP4 204
INDIRI4
CNSTI4 15
NEI4 $220
LABELV $231
line 707
;698:			bs->ltgtype == LTG_TEAMACCOMPANY ||
;699:			bs->ltgtype == LTG_DEFENDKEYAREA ||
;700:			bs->ltgtype == LTG_GETFLAG ||
;701:			bs->ltgtype == LTG_RUSHBASE ||
;702:			bs->ltgtype == LTG_RETURNFLAG ||
;703:			bs->ltgtype == LTG_CAMPORDER ||
;704:			bs->ltgtype == LTG_PATROL ||
;705:			bs->ltgtype == LTG_GETITEM ||
;706:			bs->ltgtype == LTG_MAKELOVE_UNDER ||
;707:			bs->ltgtype == LTG_MAKELOVE_ONTOP) {
line 708
;708:		return;
ADDRGP4 $146
JUMPV
LABELV $220
line 711
;709:	}
;710:	//
;711:	if (BotSetLastOrderedTask(bs))
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
EQI4 $232
line 712
;712:		return;
ADDRGP4 $146
JUMPV
LABELV $232
line 714
;713:	//
;714:	if (bs->owndecision_time > FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
LEF4 $234
line 715
;715:		return;;
ADDRGP4 $146
JUMPV
LABELV $234
line 717
;716:	//if the bot is roaming
;717:	if (bs->ctfroam_time > FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 6164
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $236
line 718
;718:		return;
ADDRGP4 $146
JUMPV
LABELV $236
line 720
;719:	//if the bot has anough aggression to decide what to do
;720:	if (BotAggression(bs) < 50)
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
GEF4 $238
line 721
;721:		return;
ADDRGP4 $146
JUMPV
LABELV $238
line 723
;722:	//set the time to send a message to the team mates
;723:	bs->teammessage_time = FloatTime() + 2 * random();
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
line 725
;724:	//
;725:	if (bs->teamtaskpreference & (TEAMTP_ATTACKER|TEAMTP_DEFENDER)) {
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $240
line 726
;726:		if (bs->teamtaskpreference & TEAMTP_ATTACKER) {
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $242
line 727
;727:			l1 = 0.7f;
ADDRLP4 8
CNSTF4 1060320051
ASGNF4
line 728
;728:		}
ADDRGP4 $243
JUMPV
LABELV $242
line 729
;729:		else {
line 730
;730:			l1 = 0.2f;
ADDRLP4 8
CNSTF4 1045220557
ASGNF4
line 731
;731:		}
LABELV $243
line 732
;732:		l2 = 0.9f;
ADDRLP4 12
CNSTF4 1063675494
ASGNF4
line 733
;733:	}
ADDRGP4 $241
JUMPV
LABELV $240
line 734
;734:	else {
line 735
;735:		l1 = 0.4f;
ADDRLP4 8
CNSTF4 1053609165
ASGNF4
line 736
;736:		l2 = 0.7f;
ADDRLP4 12
CNSTF4 1060320051
ASGNF4
line 737
;737:	}
LABELV $241
line 739
;738:	//get the flag or defend the base
;739:	rnd = random();
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
line 740
;740:	if (rnd < l1 && ctf_redflag.areanum && ctf_blueflag.areanum) {
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
GEF4 $244
ADDRLP4 224
CNSTI4 0
ASGNI4
ADDRGP4 ctf_redflag+12
INDIRI4
ADDRLP4 224
INDIRI4
EQI4 $244
ADDRGP4 ctf_blueflag+12
INDIRI4
ADDRLP4 224
INDIRI4
EQI4 $244
line 741
;741:		bs->decisionmaker = bs->client;
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
line 742
;742:		bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 743
;743:		bs->ltgtype = LTG_GETFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 4
ASGNI4
line 745
;744:		//set the time the bot will stop getting the flag
;745:		bs->teamgoal_time = FloatTime() + CTF_GETFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 747
;746:		//get an alternative route goal towards the enemy base
;747:		BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
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
line 748
;748:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 749
;749:	}
ADDRGP4 $245
JUMPV
LABELV $244
line 750
;750:	else if (rnd < l2 && ctf_redflag.areanum && ctf_blueflag.areanum) {
ADDRLP4 4
INDIRF4
ADDRLP4 12
INDIRF4
GEF4 $248
ADDRLP4 228
CNSTI4 0
ASGNI4
ADDRGP4 ctf_redflag+12
INDIRI4
ADDRLP4 228
INDIRI4
EQI4 $248
ADDRGP4 ctf_blueflag+12
INDIRI4
ADDRLP4 228
INDIRI4
EQI4 $248
line 751
;751:		bs->decisionmaker = bs->client;
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
line 752
;752:		bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 754
;753:		//
;754:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t));
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
NEI4 $252
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
ADDRGP4 $253
JUMPV
LABELV $252
line 755
;755:		else memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t));
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
LABELV $253
line 757
;756:		//set the ltg type
;757:		bs->ltgtype = LTG_DEFENDKEYAREA;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 3
ASGNI4
line 759
;758:		//set the time the bot stops defending the base
;759:		bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 760
;760:		bs->defendaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6144
ADDP4
CNSTF4 0
ASGNF4
line 761
;761:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 762
;762:	}
ADDRGP4 $249
JUMPV
LABELV $248
line 763
;763:	else {
line 764
;764:		bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 766
;765:		//set the time the bot will stop roaming
;766:		bs->ctfroam_time = FloatTime() + CTF_ROAM_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6164
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 767
;767:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 768
;768:	}
LABELV $249
LABELV $245
line 769
;769:	bs->owndecision_time = FloatTime() + 5;
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
line 773
;770:#ifdef DEBUG
;771:	BotPrintTeamGoal(bs);
;772:#endif //DEBUG
;773:}
LABELV $146
endproc BotCTFSeekGoals 240 12
export BotCTFRetreatGoals
proc BotCTFRetreatGoals 8 4
line 780
;774:
;775:/*
;776:==================
;777:BotCTFRetreatGoals
;778:==================
;779:*/
;780:void BotCTFRetreatGoals(bot_state_t *bs) {
line 782
;781:	//when carrying a flag in ctf the bot should rush to the base
;782:	if (BotCTFCarryingFlag(bs)) {
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
EQI4 $255
line 784
;783:		//if not already rushing to the base
;784:		if (bs->ltgtype != LTG_RUSHBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
EQI4 $257
line 785
;785:			BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 786
;786:			bs->ltgtype = LTG_RUSHBASE;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 5
ASGNI4
line 787
;787:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 788
;788:			bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
CNSTF4 0
ASGNF4
line 789
;789:			bs->decisionmaker = bs->client;
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
line 790
;790:			bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 791
;791:			BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 792
;792:		}
LABELV $257
line 793
;793:	}
LABELV $255
line 794
;794:}
LABELV $254
endproc BotCTFRetreatGoals 8 4
export BotTeamGoals
proc BotTeamGoals 0 4
line 1330
;795:
;796:#ifdef MISSIONPACK
;797:/*
;798:==================
;799:Bot1FCTFSeekGoals
;800:==================
;801:*/
;802:void Bot1FCTFSeekGoals(bot_state_t *bs) {
;803:	aas_entityinfo_t entinfo;
;804:	float rnd, l1, l2;
;805:	int c;
;806:
;807:	//when carrying a flag in ctf the bot should rush to the base
;808:	if (Bot1FCTFCarryingFlag(bs)) {
;809:		//if not already rushing to the base
;810:		if (bs->ltgtype != LTG_RUSHBASE) {
;811:			BotRefuseOrder(bs);
;812:			bs->ltgtype = LTG_RUSHBASE;
;813:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
;814:			bs->rushbaseaway_time = 0;
;815:			bs->decisionmaker = bs->client;
;816:			bs->ordered = qfalse;
;817:			//get an alternative route goal towards the enemy base
;818:			BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
;819:			//
;820:			BotSetTeamStatus(bs);
;821:			BotVoiceChat(bs, -1, VOICECHAT_IHAVEFLAG);
;822:		}
;823:		return;
;824:	}
;825:	// if the bot decided to follow someone
;826:	if ( bs->ltgtype == LTG_TEAMACCOMPANY && !bs->ordered ) {
;827:		// if the team mate being accompanied no longer carries the flag
;828:		BotEntityInfo(bs->teammate, &entinfo);
;829:		if (!EntityCarriesFlag(&entinfo)) {
;830:			bs->ltgtype = 0;
;831:		}
;832:	}
;833:	//our team has the flag
;834:	if (bs->neutralflagstatus == 1) {
;835:		if (bs->owndecision_time < FloatTime()) {
;836:			// if not already following someone
;837:			if (bs->ltgtype != LTG_TEAMACCOMPANY) {
;838:				//if there is a visible team mate flag carrier
;839:				c = BotTeamFlagCarrierVisible(bs);
;840:				if (c >= 0) {
;841:					BotRefuseOrder(bs);
;842:					//follow the flag carrier
;843:					bs->decisionmaker = bs->client;
;844:					bs->ordered = qfalse;
;845:					//the team mate
;846:					bs->teammate = c;
;847:					//last time the team mate was visible
;848:					bs->teammatevisible_time = FloatTime();
;849:					//no message
;850:					bs->teammessage_time = 0;
;851:					//no arrive message
;852:					bs->arrive_time = 1;
;853:					//
;854:					BotVoiceChat(bs, bs->teammate, VOICECHAT_ONFOLLOW);
;855:					//get the team goal time
;856:					bs->teamgoal_time = FloatTime() + TEAM_ACCOMPANY_TIME;
;857:					bs->ltgtype = LTG_TEAMACCOMPANY;
;858:					bs->formation_dist = 3.5 * 32;		//3.5 meter
;859:					BotSetTeamStatus(bs);
;860:					bs->owndecision_time = FloatTime() + 5;
;861:					return;
;862:				}
;863:			}
;864:			//if already a CTF or team goal
;865:			if (bs->ltgtype == LTG_TEAMHELP ||
;866:					bs->ltgtype == LTG_TEAMACCOMPANY ||
;867:					bs->ltgtype == LTG_DEFENDKEYAREA ||
;868:					bs->ltgtype == LTG_GETFLAG ||
;869:					bs->ltgtype == LTG_RUSHBASE ||
;870:					bs->ltgtype == LTG_CAMPORDER ||
;871:					bs->ltgtype == LTG_PATROL ||
;872:					bs->ltgtype == LTG_ATTACKENEMYBASE ||
;873:					bs->ltgtype == LTG_GETITEM ||
;874:					bs->ltgtype == LTG_MAKELOVE_UNDER ||
;875:					bs->ltgtype == LTG_MAKELOVE_ONTOP) {
;876:				return;
;877:			}
;878:			//if not already attacking the enemy base
;879:			if (bs->ltgtype != LTG_ATTACKENEMYBASE) {
;880:				BotRefuseOrder(bs);
;881:				bs->decisionmaker = bs->client;
;882:				bs->ordered = qfalse;
;883:				//
;884:				if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t));
;885:				else memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t));
;886:				//set the ltg type
;887:				bs->ltgtype = LTG_ATTACKENEMYBASE;
;888:				//set the time the bot will stop getting the flag
;889:				bs->teamgoal_time = FloatTime() + TEAM_ATTACKENEMYBASE_TIME;
;890:				BotSetTeamStatus(bs);
;891:				bs->owndecision_time = FloatTime() + 5;
;892:			}
;893:		}
;894:		return;
;895:	}
;896:	//enemy team has the flag
;897:	else if (bs->neutralflagstatus == 2) {
;898:		if (bs->owndecision_time < FloatTime()) {
;899:			c = BotEnemyFlagCarrierVisible(bs);
;900:			if (c >= 0) {
;901:				//FIXME: attack enemy flag carrier
;902:			}
;903:			//if already a CTF or team goal
;904:			if (bs->ltgtype == LTG_TEAMHELP ||
;905:					bs->ltgtype == LTG_TEAMACCOMPANY ||
;906:					bs->ltgtype == LTG_CAMPORDER ||
;907:					bs->ltgtype == LTG_PATROL ||
;908:					bs->ltgtype == LTG_GETITEM) {
;909:				return;
;910:			}
;911:			// if not already defending the base
;912:			if (bs->ltgtype != LTG_DEFENDKEYAREA) {
;913:				BotRefuseOrder(bs);
;914:				bs->decisionmaker = bs->client;
;915:				bs->ordered = qfalse;
;916:				//
;917:				if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t));
;918:				else memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t));
;919:				//set the ltg type
;920:				bs->ltgtype = LTG_DEFENDKEYAREA;
;921:				//set the time the bot stops defending the base
;922:				bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
;923:				bs->defendaway_time = 0;
;924:				BotSetTeamStatus(bs);
;925:				bs->owndecision_time = FloatTime() + 5;
;926:			}
;927:		}
;928:		return;
;929:	}
;930:	// don't just do something wait for the bot team leader to give orders
;931:	if (BotTeamLeader(bs)) {
;932:		return;
;933:	}
;934:	// if the bot is ordered to do something
;935:	if ( bs->lastgoal_ltgtype ) {
;936:		bs->teamgoal_time += 60;
;937:	}
;938:	// if the bot decided to do something on it's own and has a last ordered goal
;939:	if ( !bs->ordered && bs->lastgoal_ltgtype ) {
;940:		bs->ltgtype = 0;
;941:	}
;942:	//if already a CTF or team goal
;943:	if (bs->ltgtype == LTG_TEAMHELP ||
;944:			bs->ltgtype == LTG_TEAMACCOMPANY ||
;945:			bs->ltgtype == LTG_DEFENDKEYAREA ||
;946:			bs->ltgtype == LTG_GETFLAG ||
;947:			bs->ltgtype == LTG_RUSHBASE ||
;948:			bs->ltgtype == LTG_RETURNFLAG ||
;949:			bs->ltgtype == LTG_CAMPORDER ||
;950:			bs->ltgtype == LTG_PATROL ||
;951:			bs->ltgtype == LTG_ATTACKENEMYBASE ||
;952:			bs->ltgtype == LTG_GETITEM ||
;953:			bs->ltgtype == LTG_MAKELOVE_UNDER ||
;954:			bs->ltgtype == LTG_MAKELOVE_ONTOP) {
;955:		return;
;956:	}
;957:	//
;958:	if (BotSetLastOrderedTask(bs))
;959:		return;
;960:	//
;961:	if (bs->owndecision_time > FloatTime())
;962:		return;;
;963:	//if the bot is roaming
;964:	if (bs->ctfroam_time > FloatTime())
;965:		return;
;966:	//if the bot has anough aggression to decide what to do
;967:	if (BotAggression(bs) < 50)
;968:		return;
;969:	//set the time to send a message to the team mates
;970:	bs->teammessage_time = FloatTime() + 2 * random();
;971:	//
;972:	if (bs->teamtaskpreference & (TEAMTP_ATTACKER|TEAMTP_DEFENDER)) {
;973:		if (bs->teamtaskpreference & TEAMTP_ATTACKER) {
;974:			l1 = 0.7f;
;975:		}
;976:		else {
;977:			l1 = 0.2f;
;978:		}
;979:		l2 = 0.9f;
;980:	}
;981:	else {
;982:		l1 = 0.4f;
;983:		l2 = 0.7f;
;984:	}
;985:	//get the flag or defend the base
;986:	rnd = random();
;987:	if (rnd < l1 && ctf_neutralflag.areanum) {
;988:		bs->decisionmaker = bs->client;
;989:		bs->ordered = qfalse;
;990:		bs->ltgtype = LTG_GETFLAG;
;991:		//set the time the bot will stop getting the flag
;992:		bs->teamgoal_time = FloatTime() + CTF_GETFLAG_TIME;
;993:		BotSetTeamStatus(bs);
;994:	}
;995:	else if (rnd < l2 && ctf_redflag.areanum && ctf_blueflag.areanum) {
;996:		bs->decisionmaker = bs->client;
;997:		bs->ordered = qfalse;
;998:		//
;999:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t));
;1000:		else memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t));
;1001:		//set the ltg type
;1002:		bs->ltgtype = LTG_DEFENDKEYAREA;
;1003:		//set the time the bot stops defending the base
;1004:		bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
;1005:		bs->defendaway_time = 0;
;1006:		BotSetTeamStatus(bs);
;1007:	}
;1008:	else {
;1009:		bs->ltgtype = 0;
;1010:		//set the time the bot will stop roaming
;1011:		bs->ctfroam_time = FloatTime() + CTF_ROAM_TIME;
;1012:		BotSetTeamStatus(bs);
;1013:	}
;1014:	bs->owndecision_time = FloatTime() + 5;
;1015:#ifdef DEBUG
;1016:	BotPrintTeamGoal(bs);
;1017:#endif //DEBUG
;1018:}
;1019:
;1020:/*
;1021:==================
;1022:Bot1FCTFRetreatGoals
;1023:==================
;1024:*/
;1025:void Bot1FCTFRetreatGoals(bot_state_t *bs) {
;1026:	//when carrying a flag in ctf the bot should rush to the enemy base
;1027:	if (Bot1FCTFCarryingFlag(bs)) {
;1028:		//if not already rushing to the base
;1029:		if (bs->ltgtype != LTG_RUSHBASE) {
;1030:			BotRefuseOrder(bs);
;1031:			bs->ltgtype = LTG_RUSHBASE;
;1032:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
;1033:			bs->rushbaseaway_time = 0;
;1034:			bs->decisionmaker = bs->client;
;1035:			bs->ordered = qfalse;
;1036:			//get an alternative route goal towards the enemy base
;1037:			BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
;1038:			BotSetTeamStatus(bs);
;1039:		}
;1040:	}
;1041:}
;1042:
;1043:/*
;1044:==================
;1045:BotObeliskSeekGoals
;1046:==================
;1047:*/
;1048:void BotObeliskSeekGoals(bot_state_t *bs) {
;1049:	float rnd, l1, l2;
;1050:
;1051:	// don't just do something wait for the bot team leader to give orders
;1052:	if (BotTeamLeader(bs)) {
;1053:		return;
;1054:	}
;1055:	// if the bot is ordered to do something
;1056:	if ( bs->lastgoal_ltgtype ) {
;1057:		bs->teamgoal_time += 60;
;1058:	}
;1059:	//if already a team goal
;1060:	if (bs->ltgtype == LTG_TEAMHELP ||
;1061:			bs->ltgtype == LTG_TEAMACCOMPANY ||
;1062:			bs->ltgtype == LTG_DEFENDKEYAREA ||
;1063:			bs->ltgtype == LTG_GETFLAG ||
;1064:			bs->ltgtype == LTG_RUSHBASE ||
;1065:			bs->ltgtype == LTG_RETURNFLAG ||
;1066:			bs->ltgtype == LTG_CAMPORDER ||
;1067:			bs->ltgtype == LTG_PATROL ||
;1068:			bs->ltgtype == LTG_ATTACKENEMYBASE ||
;1069:			bs->ltgtype == LTG_GETITEM ||
;1070:			bs->ltgtype == LTG_MAKELOVE_UNDER ||
;1071:			bs->ltgtype == LTG_MAKELOVE_ONTOP) {
;1072:		return;
;1073:	}
;1074:	//
;1075:	if (BotSetLastOrderedTask(bs))
;1076:		return;
;1077:	//if the bot is roaming
;1078:	if (bs->ctfroam_time > FloatTime())
;1079:		return;
;1080:	//if the bot has anough aggression to decide what to do
;1081:	if (BotAggression(bs) < 50)
;1082:		return;
;1083:	//set the time to send a message to the team mates
;1084:	bs->teammessage_time = FloatTime() + 2 * random();
;1085:	//
;1086:	if (bs->teamtaskpreference & (TEAMTP_ATTACKER|TEAMTP_DEFENDER)) {
;1087:		if (bs->teamtaskpreference & TEAMTP_ATTACKER) {
;1088:			l1 = 0.7f;
;1089:		}
;1090:		else {
;1091:			l1 = 0.2f;
;1092:		}
;1093:		l2 = 0.9f;
;1094:	}
;1095:	else {
;1096:		l1 = 0.4f;
;1097:		l2 = 0.7f;
;1098:	}
;1099:	//get the flag or defend the base
;1100:	rnd = random();
;1101:	if (rnd < l1 && redobelisk.areanum && blueobelisk.areanum) {
;1102:		bs->decisionmaker = bs->client;
;1103:		bs->ordered = qfalse;
;1104:		//
;1105:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &blueobelisk, sizeof(bot_goal_t));
;1106:		else memcpy(&bs->teamgoal, &redobelisk, sizeof(bot_goal_t));
;1107:		//set the ltg type
;1108:		bs->ltgtype = LTG_ATTACKENEMYBASE;
;1109:		//set the time the bot will stop attacking the enemy base
;1110:		bs->teamgoal_time = FloatTime() + TEAM_ATTACKENEMYBASE_TIME;
;1111:		//get an alternate route goal towards the enemy base
;1112:		BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
;1113:		BotSetTeamStatus(bs);
;1114:	}
;1115:	else if (rnd < l2 && redobelisk.areanum && blueobelisk.areanum) {
;1116:		bs->decisionmaker = bs->client;
;1117:		bs->ordered = qfalse;
;1118:		//
;1119:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &redobelisk, sizeof(bot_goal_t));
;1120:		else memcpy(&bs->teamgoal, &blueobelisk, sizeof(bot_goal_t));
;1121:		//set the ltg type
;1122:		bs->ltgtype = LTG_DEFENDKEYAREA;
;1123:		//set the time the bot stops defending the base
;1124:		bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
;1125:		bs->defendaway_time = 0;
;1126:		BotSetTeamStatus(bs);
;1127:	}
;1128:	else {
;1129:		bs->ltgtype = 0;
;1130:		//set the time the bot will stop roaming
;1131:		bs->ctfroam_time = FloatTime() + CTF_ROAM_TIME;
;1132:		BotSetTeamStatus(bs);
;1133:	}
;1134:}
;1135:
;1136:/*
;1137:==================
;1138:BotGoHarvest
;1139:==================
;1140:*/
;1141:void BotGoHarvest(bot_state_t *bs) {
;1142:	//
;1143:	if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &blueobelisk, sizeof(bot_goal_t));
;1144:	else memcpy(&bs->teamgoal, &redobelisk, sizeof(bot_goal_t));
;1145:	//set the ltg type
;1146:	bs->ltgtype = LTG_HARVEST;
;1147:	//set the time the bot will stop harvesting
;1148:	bs->teamgoal_time = FloatTime() + TEAM_HARVEST_TIME;
;1149:	bs->harvestaway_time = 0;
;1150:	BotSetTeamStatus(bs);
;1151:}
;1152:
;1153:/*
;1154:==================
;1155:BotObeliskRetreatGoals
;1156:==================
;1157:*/
;1158:void BotObeliskRetreatGoals(bot_state_t *bs) {
;1159:	//nothing special
;1160:}
;1161:
;1162:/*
;1163:==================
;1164:BotHarvesterSeekGoals
;1165:==================
;1166:*/
;1167:void BotHarvesterSeekGoals(bot_state_t *bs) {
;1168:	aas_entityinfo_t entinfo;
;1169:	float rnd, l1, l2;
;1170:	int c;
;1171:
;1172:	//when carrying cubes in harvester the bot should rush to the base
;1173:	if (BotHarvesterCarryingCubes(bs)) {
;1174:		//if not already rushing to the base
;1175:		if (bs->ltgtype != LTG_RUSHBASE) {
;1176:			BotRefuseOrder(bs);
;1177:			bs->ltgtype = LTG_RUSHBASE;
;1178:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
;1179:			bs->rushbaseaway_time = 0;
;1180:			bs->decisionmaker = bs->client;
;1181:			bs->ordered = qfalse;
;1182:			//get an alternative route goal towards the enemy base
;1183:			BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
;1184:			//
;1185:			BotSetTeamStatus(bs);
;1186:		}
;1187:		return;
;1188:	}
;1189:	// don't just do something wait for the bot team leader to give orders
;1190:	if (BotTeamLeader(bs)) {
;1191:		return;
;1192:	}
;1193:	// if the bot decided to follow someone
;1194:	if ( bs->ltgtype == LTG_TEAMACCOMPANY && !bs->ordered ) {
;1195:		// if the team mate being accompanied no longer carries the flag
;1196:		BotEntityInfo(bs->teammate, &entinfo);
;1197:		if (!EntityCarriesCubes(&entinfo)) {
;1198:			bs->ltgtype = 0;
;1199:		}
;1200:	}
;1201:	// if the bot is ordered to do something
;1202:	if ( bs->lastgoal_ltgtype ) {
;1203:		bs->teamgoal_time += 60;
;1204:	}
;1205:	//if not yet doing something
;1206:	if (bs->ltgtype == LTG_TEAMHELP ||
;1207:			bs->ltgtype == LTG_TEAMACCOMPANY ||
;1208:			bs->ltgtype == LTG_DEFENDKEYAREA ||
;1209:			bs->ltgtype == LTG_GETFLAG ||
;1210:			bs->ltgtype == LTG_CAMPORDER ||
;1211:			bs->ltgtype == LTG_PATROL ||
;1212:			bs->ltgtype == LTG_ATTACKENEMYBASE ||
;1213:			bs->ltgtype == LTG_HARVEST ||
;1214:			bs->ltgtype == LTG_GETITEM ||
;1215:			bs->ltgtype == LTG_MAKELOVE_UNDER ||
;1216:			bs->ltgtype == LTG_MAKELOVE_ONTOP) {
;1217:		return;
;1218:	}
;1219:	//
;1220:	if (BotSetLastOrderedTask(bs))
;1221:		return;
;1222:	//if the bot is roaming
;1223:	if (bs->ctfroam_time > FloatTime())
;1224:		return;
;1225:	//if the bot has anough aggression to decide what to do
;1226:	if (BotAggression(bs) < 50)
;1227:		return;
;1228:	//set the time to send a message to the team mates
;1229:	bs->teammessage_time = FloatTime() + 2 * random();
;1230:	//
;1231:	c = BotEnemyCubeCarrierVisible(bs);
;1232:	if (c >= 0) {
;1233:		//FIXME: attack enemy cube carrier
;1234:	}
;1235:	if (bs->ltgtype != LTG_TEAMACCOMPANY) {
;1236:		//if there is a visible team mate carrying cubes
;1237:		c = BotTeamCubeCarrierVisible(bs);
;1238:		if (c >= 0) {
;1239:			//follow the team mate carrying cubes
;1240:			bs->decisionmaker = bs->client;
;1241:			bs->ordered = qfalse;
;1242:			//the team mate
;1243:			bs->teammate = c;
;1244:			//last time the team mate was visible
;1245:			bs->teammatevisible_time = FloatTime();
;1246:			//no message
;1247:			bs->teammessage_time = 0;
;1248:			//no arrive message
;1249:			bs->arrive_time = 1;
;1250:			//
;1251:			BotVoiceChat(bs, bs->teammate, VOICECHAT_ONFOLLOW);
;1252:			//get the team goal time
;1253:			bs->teamgoal_time = FloatTime() + TEAM_ACCOMPANY_TIME;
;1254:			bs->ltgtype = LTG_TEAMACCOMPANY;
;1255:			bs->formation_dist = 3.5 * 32;		//3.5 meter
;1256:			BotSetTeamStatus(bs);
;1257:			return;
;1258:		}
;1259:	}
;1260:	//
;1261:	if (bs->teamtaskpreference & (TEAMTP_ATTACKER|TEAMTP_DEFENDER)) {
;1262:		if (bs->teamtaskpreference & TEAMTP_ATTACKER) {
;1263:			l1 = 0.7f;
;1264:		}
;1265:		else {
;1266:			l1 = 0.2f;
;1267:		}
;1268:		l2 = 0.9f;
;1269:	}
;1270:	else {
;1271:		l1 = 0.4f;
;1272:		l2 = 0.7f;
;1273:	}
;1274:	//
;1275:	rnd = random();
;1276:	if (rnd < l1 && redobelisk.areanum && blueobelisk.areanum) {
;1277:		bs->decisionmaker = bs->client;
;1278:		bs->ordered = qfalse;
;1279:		BotGoHarvest(bs);
;1280:	}
;1281:	else if (rnd < l2 && redobelisk.areanum && blueobelisk.areanum) {
;1282:		bs->decisionmaker = bs->client;
;1283:		bs->ordered = qfalse;
;1284:		//
;1285:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &redobelisk, sizeof(bot_goal_t));
;1286:		else memcpy(&bs->teamgoal, &blueobelisk, sizeof(bot_goal_t));
;1287:		//set the ltg type
;1288:		bs->ltgtype = LTG_DEFENDKEYAREA;
;1289:		//set the time the bot stops defending the base
;1290:		bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
;1291:		bs->defendaway_time = 0;
;1292:		BotSetTeamStatus(bs);
;1293:	}
;1294:	else {
;1295:		bs->ltgtype = 0;
;1296:		//set the time the bot will stop roaming
;1297:		bs->ctfroam_time = FloatTime() + CTF_ROAM_TIME;
;1298:		BotSetTeamStatus(bs);
;1299:	}
;1300:}
;1301:
;1302:/*
;1303:==================
;1304:BotHarvesterRetreatGoals
;1305:==================
;1306:*/
;1307:void BotHarvesterRetreatGoals(bot_state_t *bs) {
;1308:	//when carrying cubes in harvester the bot should rush to the base
;1309:	if (BotHarvesterCarryingCubes(bs)) {
;1310:		//if not already rushing to the base
;1311:		if (bs->ltgtype != LTG_RUSHBASE) {
;1312:			BotRefuseOrder(bs);
;1313:			bs->ltgtype = LTG_RUSHBASE;
;1314:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
;1315:			bs->rushbaseaway_time = 0;
;1316:			bs->decisionmaker = bs->client;
;1317:			bs->ordered = qfalse;
;1318:			BotSetTeamStatus(bs);
;1319:		}
;1320:		return;
;1321:	}
;1322:}
;1323:#endif
;1324:
;1325:/*
;1326:==================
;1327:BotTeamGoals
;1328:==================
;1329:*/
;1330:void BotTeamGoals(bot_state_t *bs, int retreat) {
line 1332
;1331:
;1332:	if ( retreat ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $260
line 1333
;1333:		if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $261
line 1334
;1334:			BotCTFRetreatGoals(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFRetreatGoals
CALLV
pop
line 1335
;1335:		}
line 1347
;1336:#ifdef MISSIONPACK
;1337:		else if (gametype == GT_1FCTF) {
;1338:			Bot1FCTFRetreatGoals(bs);
;1339:		}
;1340:		else if (gametype == GT_OBELISK) {
;1341:			BotObeliskRetreatGoals(bs);
;1342:		}
;1343:		else if (gametype == GT_HARVESTER) {
;1344:			BotHarvesterRetreatGoals(bs);
;1345:		}
;1346:#endif
;1347:	}
ADDRGP4 $261
JUMPV
LABELV $260
line 1348
;1348:	else {
line 1349
;1349:		if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $264
line 1351
;1350:			//decide what to do in CTF mode
;1351:			BotCTFSeekGoals(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFSeekGoals
CALLV
pop
line 1352
;1352:		}
LABELV $264
line 1364
;1353:#ifdef MISSIONPACK
;1354:		else if (gametype == GT_1FCTF) {
;1355:			Bot1FCTFSeekGoals(bs);
;1356:		}
;1357:		else if (gametype == GT_OBELISK) {
;1358:			BotObeliskSeekGoals(bs);
;1359:		}
;1360:		else if (gametype == GT_HARVESTER) {
;1361:			BotHarvesterSeekGoals(bs);
;1362:		}
;1363:#endif
;1364:	}
LABELV $261
line 1367
;1365:	// reset the order time which is used to see if
;1366:	// we decided to refuse an order
;1367:	bs->order_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
CNSTF4 0
ASGNF4
line 1368
;1368:}
LABELV $259
endproc BotTeamGoals 0 4
export BotPointAreaNum
proc BotPointAreaNum 136 20
line 1376
;1369:
;1370:/*
;1371:==================
;1372:BotPointAreaNum
;1373:==================
;1374:*/
;1375:int BotPointAreaNum(vec3_t origin) 
;1376:{
line 1379
;1377:	int areanum, numareas, areas[10];
;1378:	vec3_t end, mins, maxs;
;1379:	gentity_t *ent=NULL;
ADDRLP4 16
CNSTP4 0
ASGNP4
line 1382
;1380:
;1381:	// Ladder support (part 1) -Vincent
;1382:	if (ent && ent->client && ent->client->ps.pm_flags & PMF_LADDER)
ADDRLP4 92
CNSTU4 0
ASGNU4
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 92
INDIRU4
EQU4 $267
ADDRLP4 96
ADDRLP4 16
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CVPU4 4
ADDRLP4 92
INDIRU4
EQU4 $267
ADDRLP4 96
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $267
line 1383
;1383:	{
line 1384
;1384:		areanum = trap_AAS_PointAreaNum(origin);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 trap_AAS_PointAreaNum
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 100
INDIRI4
ASGNI4
line 1385
;1385:		if (areanum && !trap_AAS_AreaLadder(areanum)) 
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $269
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 108
ADDRGP4 trap_AAS_AreaLadder
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $269
line 1386
;1386:		{
line 1387
;1387:		areanum = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1388
;1388:		}
LABELV $269
line 1389
;1389:		if (areanum)
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $271
line 1390
;1390:		{
line 1391
;1391:		return areanum;
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $266
JUMPV
LABELV $271
line 1394
;1392:		}
;1393:
;1394:		maxs[0] = 8;
ADDRLP4 0
CNSTF4 1090519040
ASGNF4
line 1395
;1395:		maxs[1] = 8;
ADDRLP4 0+4
CNSTF4 1090519040
ASGNF4
line 1396
;1396:		maxs[2] = 4;
ADDRLP4 0+8
CNSTF4 1082130432
ASGNF4
line 1397
;1397:		VectorSubtract( origin, maxs, mins );
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 112
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 112
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 1398
;1398:		VectorAdd( origin, maxs, maxs );
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 116
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 116
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDF4
ASGNF4
line 1399
;1399:		numareas = trap_AAS_BBoxAreas(mins, maxs, areas, 50);
ADDRLP4 24
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 36
ARGP4
CNSTI4 50
ARGI4
ADDRLP4 120
ADDRGP4 trap_AAS_BBoxAreas
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 120
INDIRI4
ASGNI4
line 1400
;1400:		if (numareas > 0) 
ADDRLP4 20
INDIRI4
CNSTI4 0
LEI4 $283
line 1401
;1401:		{
line 1402
;1402:		BotFirstLadder(areas, numareas);
ADDRLP4 36
ARGP4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 BotFirstLadder
CALLI4
pop
line 1403
;1403:		}
LABELV $283
line 1405
;1404:
;1405:		areanum = trap_AAS_PointAreaNum(origin);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 trap_AAS_PointAreaNum
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 124
INDIRI4
ASGNI4
line 1406
;1406:		if (areanum && !trap_AAS_AreaReachability(areanum)) 
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $285
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 132
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 0
NEI4 $285
line 1407
;1407:		{
line 1408
;1408:		areanum = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1409
;1409:		}
LABELV $285
line 1410
;1410:		if (areanum) 
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $287
line 1411
;1411:		{
line 1412
;1412:		return areanum;
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $266
JUMPV
LABELV $287
line 1414
;1413:		}
;1414:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $266
JUMPV
LABELV $267
line 1417
;1415:	}
;1416:	else
;1417:	{
line 1418
;1418:		areanum = trap_AAS_PointAreaNum(origin);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 trap_AAS_PointAreaNum
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 100
INDIRI4
ASGNI4
line 1420
;1419:	
;1420:		if (areanum)
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $289
line 1421
;1421:		{
line 1422
;1422:		return areanum;
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $266
JUMPV
LABELV $289
line 1425
;1423:		}
;1424:	
;1425:		VectorCopy(origin, end);
ADDRLP4 76
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 1426
;1426:		end[2] += 10;
ADDRLP4 76+8
ADDRLP4 76+8
INDIRF4
CNSTF4 1092616192
ADDF4
ASGNF4
line 1427
;1427:		numareas = trap_AAS_TraceAreas(origin, end, areas, NULL, 10);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 36
ARGP4
CNSTP4 0
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 104
ADDRGP4 trap_AAS_TraceAreas
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 104
INDIRI4
ASGNI4
line 1429
;1428:
;1429:		if (numareas > 0)
ADDRLP4 20
INDIRI4
CNSTI4 0
LEI4 $292
line 1430
;1430:		{
line 1431
;1431:		return areas[0];
ADDRLP4 36
INDIRI4
RETI4
ADDRGP4 $266
JUMPV
LABELV $292
line 1433
;1432:		}
;1433:		return 0;
CNSTI4 0
RETI4
LABELV $266
endproc BotPointAreaNum 136 20
export ClientName
proc ClientName 1032 12
line 1442
;1434:	}
;1435:}
;1436:
;1437:/*
;1438:==================
;1439:ClientName
;1440:==================
;1441:*/
;1442:char *ClientName(int client, char *name, int size) {
line 1445
;1443:	char buf[MAX_INFO_STRING];
;1444:
;1445:	if (client < 0 || client >= MAX_CLIENTS) {
ADDRLP4 1024
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 0
LTI4 $297
ADDRLP4 1024
INDIRI4
CNSTI4 64
LTI4 $295
LABELV $297
line 1446
;1446:		BotAI_Print(PRT_ERROR, "ClientName: client out of range\n");
CNSTI4 3
ARGI4
ADDRGP4 $298
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 1447
;1447:		return "[client out of range]";
ADDRGP4 $299
RETP4
ADDRGP4 $294
JUMPV
LABELV $295
line 1449
;1448:	}
;1449:	trap_GetConfigstring(CS_PLAYERS+client, buf, sizeof(buf));
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
line 1450
;1450:	strncpy(name, Info_ValueForKey(buf, "n"), size-1);
ADDRLP4 0
ARGP4
ADDRGP4 $300
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
line 1451
;1451:	name[size-1] = '\0';
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 1452
;1452:	Q_CleanStr( name );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1453
;1453:	return name;
ADDRFP4 4
INDIRP4
RETP4
LABELV $294
endproc ClientName 1032 12
export ClientSkin
proc ClientSkin 1032 12
line 1461
;1454:}
;1455:
;1456:/*
;1457:==================
;1458:ClientSkin
;1459:==================
;1460:*/
;1461:char *ClientSkin(int client, char *skin, int size) {
line 1464
;1462:	char buf[MAX_INFO_STRING];
;1463:
;1464:	if (client < 0 || client >= MAX_CLIENTS) {
ADDRLP4 1024
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 0
LTI4 $304
ADDRLP4 1024
INDIRI4
CNSTI4 64
LTI4 $302
LABELV $304
line 1465
;1465:		BotAI_Print(PRT_ERROR, "ClientSkin: client out of range\n");
CNSTI4 3
ARGI4
ADDRGP4 $305
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 1466
;1466:		return "[client out of range]";
ADDRGP4 $299
RETP4
ADDRGP4 $301
JUMPV
LABELV $302
line 1468
;1467:	}
;1468:	trap_GetConfigstring(CS_PLAYERS+client, buf, sizeof(buf));
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
line 1469
;1469:	strncpy(skin, Info_ValueForKey(buf, "model"), size-1);
ADDRLP4 0
ARGP4
ADDRGP4 $306
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
line 1470
;1470:	skin[size-1] = '\0';
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 1471
;1471:	return skin;
ADDRFP4 4
INDIRP4
RETP4
LABELV $301
endproc ClientSkin 1032 12
bss
align 4
LABELV $308
skip 4
export ClientFromName
code
proc ClientFromName 1040 12
line 1479
;1472:}
;1473:
;1474:/*
;1475:==================
;1476:ClientFromName
;1477:==================
;1478:*/
;1479:int ClientFromName(char *name) {
line 1484
;1480:	int i;
;1481:	char buf[MAX_INFO_STRING];
;1482:	static int maxclients;
;1483:
;1484:	if (!maxclients)
ADDRGP4 $308
INDIRI4
CNSTI4 0
NEI4 $309
line 1485
;1485:		maxclients = trap_Cvar_VariableIntegerValue("sv_maxclients");
ADDRGP4 $311
ARGP4
ADDRLP4 1028
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 $308
ADDRLP4 1028
INDIRI4
ASGNI4
LABELV $309
line 1486
;1486:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $315
JUMPV
LABELV $312
line 1487
;1487:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
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
line 1488
;1488:		Q_CleanStr( buf );
ADDRLP4 4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1489
;1489:		if (!Q_stricmp(Info_ValueForKey(buf, "n"), name)) return i;
ADDRLP4 4
ARGP4
ADDRGP4 $300
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
NEI4 $316
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $307
JUMPV
LABELV $316
line 1490
;1490:	}
LABELV $313
line 1486
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $315
ADDRLP4 0
INDIRI4
ADDRGP4 $308
INDIRI4
GEI4 $318
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $312
LABELV $318
line 1491
;1491:	return -1;
CNSTI4 -1
RETI4
LABELV $307
endproc ClientFromName 1040 12
bss
align 4
LABELV $320
skip 4
export ClientOnSameTeamFromName
code
proc ClientOnSameTeamFromName 1044 12
line 1499
;1492:}
;1493:
;1494:/*
;1495:==================
;1496:ClientOnSameTeamFromName
;1497:==================
;1498:*/
;1499:int ClientOnSameTeamFromName(bot_state_t *bs, char *name) {
line 1504
;1500:	int i;
;1501:	char buf[MAX_INFO_STRING];
;1502:	static int maxclients;
;1503:
;1504:	if (!maxclients)
ADDRGP4 $320
INDIRI4
CNSTI4 0
NEI4 $321
line 1505
;1505:		maxclients = trap_Cvar_VariableIntegerValue("sv_maxclients");
ADDRGP4 $311
ARGP4
ADDRLP4 1028
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 $320
ADDRLP4 1028
INDIRI4
ASGNI4
LABELV $321
line 1506
;1506:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $326
JUMPV
LABELV $323
line 1507
;1507:		if (!BotSameTeam(bs, i))
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
NEI4 $327
line 1508
;1508:			continue;
ADDRGP4 $324
JUMPV
LABELV $327
line 1509
;1509:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
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
line 1510
;1510:		Q_CleanStr( buf );
ADDRLP4 4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1511
;1511:		if (!Q_stricmp(Info_ValueForKey(buf, "n"), name)) return i;
ADDRLP4 4
ARGP4
ADDRGP4 $300
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
NEI4 $329
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $319
JUMPV
LABELV $329
line 1512
;1512:	}
LABELV $324
line 1506
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $326
ADDRLP4 0
INDIRI4
ADDRGP4 $320
INDIRI4
GEI4 $331
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $323
LABELV $331
line 1513
;1513:	return -1;
CNSTI4 -1
RETI4
LABELV $319
endproc ClientOnSameTeamFromName 1044 12
export stristr
proc stristr 12 4
line 1521
;1514:}
;1515:
;1516:/*
;1517:==================
;1518:stristr
;1519:==================
;1520:*/
;1521:char *stristr(char *str, char *charset) {
ADDRGP4 $334
JUMPV
LABELV $333
line 1524
;1522:	int i;
;1523:
;1524:	while(*str) {
line 1525
;1525:		for (i = 0; charset[i] && str[i]; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $339
JUMPV
LABELV $336
line 1526
;1526:			if (toupper(charset[i]) != toupper(str[i])) break;
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
EQI4 $340
ADDRGP4 $338
JUMPV
LABELV $340
line 1527
;1527:		}
LABELV $337
line 1525
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $339
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
EQI4 $342
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDRLP4 8
INDIRI4
NEI4 $336
LABELV $342
LABELV $338
line 1528
;1528:		if (!charset[i]) return str;
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $343
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $332
JUMPV
LABELV $343
line 1529
;1529:		str++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1530
;1530:	}
LABELV $334
line 1524
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $333
line 1531
;1531:	return NULL;
CNSTP4 0
RETP4
LABELV $332
endproc stristr 12 4
export EasyClientName
proc EasyClientName 208 12
line 1539
;1532:}
;1533:
;1534:/*
;1535:==================
;1536:EasyClientName
;1537:==================
;1538:*/
;1539:char *EasyClientName(int client, char *buf, int size) {
line 1544
;1540:	int i;
;1541:	char *str1, *str2, *ptr, c;
;1542:	char name[128];
;1543:
;1544:	strcpy(name, ClientName(client, name, sizeof(name)));
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
line 1545
;1545:	for (i = 0; name[i]; i++) name[i] &= 127;
ADDRLP4 136
CNSTI4 0
ASGNI4
ADDRGP4 $349
JUMPV
LABELV $346
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
LABELV $347
ADDRLP4 136
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $349
ADDRLP4 136
INDIRI4
ADDRLP4 5
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $346
line 1547
;1546:	//remove all spaces
;1547:	for (ptr = strstr(name, " "); ptr; ptr = strstr(name, " ")) 
ADDRLP4 5
ARGP4
ADDRGP4 $354
ARGP4
ADDRLP4 156
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 156
INDIRP4
ASGNP4
ADDRGP4 $353
JUMPV
LABELV $350
line 1548
;1548:	{
line 1549
;1549:		memmove(ptr, ptr+1, strlen(ptr+1)+1);
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
line 1550
;1550:	}
LABELV $351
line 1547
ADDRLP4 5
ARGP4
ADDRGP4 $354
ARGP4
ADDRLP4 160
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 160
INDIRP4
ASGNP4
LABELV $353
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $350
line 1553
;1551:	
;1552:	//check for [x] and ]x[ clan names
;1553:	str1 = strstr(name, "[");
ADDRLP4 5
ARGP4
ADDRGP4 $355
ARGP4
ADDRLP4 164
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 140
ADDRLP4 164
INDIRP4
ASGNP4
line 1554
;1554:	str2 = strstr(name, "]");
ADDRLP4 5
ARGP4
ADDRGP4 $356
ARGP4
ADDRLP4 168
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 144
ADDRLP4 168
INDIRP4
ASGNP4
line 1555
;1555:	if (str1 && str2) {
ADDRLP4 172
CNSTU4 0
ASGNU4
ADDRLP4 140
INDIRP4
CVPU4 4
ADDRLP4 172
INDIRU4
EQU4 $357
ADDRLP4 144
INDIRP4
CVPU4 4
ADDRLP4 172
INDIRU4
EQU4 $357
line 1556
;1556:		if (str2 > str1) memmove(str1, str2+1, strlen(str2+1)+1);
ADDRLP4 144
INDIRP4
CVPU4 4
ADDRLP4 140
INDIRP4
CVPU4 4
LEU4 $359
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
ADDRGP4 $360
JUMPV
LABELV $359
line 1557
;1557:		else memmove(str2, str1+1, strlen(str1+1)+1);
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
LABELV $360
line 1558
;1558:	}
LABELV $357
line 1561
;1559:
;1560:	//remove Mr or Ms (not really frequently used but important too...) prefix -Vincent
;1561:	if ((name[0] == 'm' || name[0] == 'M') &&
ADDRLP4 176
ADDRLP4 5
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 109
EQI4 $367
ADDRLP4 176
INDIRI4
CNSTI4 77
NEI4 $361
LABELV $367
ADDRLP4 5+1
INDIRI1
CVII4 1
CNSTI4 114
EQI4 $370
ADDRLP4 5+1
INDIRI1
CVII4 1
CNSTI4 82
EQI4 $370
ADDRLP4 5+1
INDIRI1
CVII4 1
CNSTI4 115
EQI4 $370
ADDRLP4 5+1
INDIRI1
CVII4 1
CNSTI4 83
NEI4 $361
LABELV $370
line 1563
;1562:			(name[1] == 'r' || name[1] == 'R' || name[1] == 's' || name[1] == 'S')) 
;1563:	{
line 1564
;1564:		memmove(name, name+2, strlen(name+2)+1);
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
line 1565
;1565:	}
LABELV $361
line 1568
;1566:
;1567:
;1568:	ptr = name;
ADDRLP4 0
ADDRLP4 5
ASGNP4
line 1570
;1569:	
;1570:	if (*ptr >= 'A' && *ptr <= 'Z')
ADDRLP4 180
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 65
LTI4 $376
ADDRLP4 180
INDIRI4
CNSTI4 90
GTI4 $376
line 1571
;1571:	{ //Leave first capital in name untouched, now done correctly -Vincent
line 1572
;1572:	ptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1573
;1573:	}
ADDRGP4 $376
JUMPV
LABELV $375
line 1576
;1574:
;1575:	while(*ptr) 
;1576:	{
line 1577
;1577:		c = *ptr;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
line 1578
;1578:		if ((c >= 'a' && c <= 'z') ||
ADDRLP4 184
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 97
LTI4 $381
ADDRLP4 184
INDIRI4
CNSTI4 122
LEI4 $382
LABELV $381
ADDRLP4 188
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 48
LTI4 $383
ADDRLP4 188
INDIRI4
CNSTI4 57
LEI4 $382
LABELV $383
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 95
NEI4 $378
LABELV $382
line 1580
;1579:				(c >= '0' && c <= '9') || c == '_') 
;1580:		{
line 1581
;1581:		ptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1582
;1582:		}
ADDRGP4 $379
JUMPV
LABELV $378
line 1583
;1583:		else if (c >= 'A' && c <= 'Z') 
ADDRLP4 192
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 192
INDIRI4
CNSTI4 65
LTI4 $384
ADDRLP4 192
INDIRI4
CNSTI4 90
GTI4 $384
line 1584
;1584:		{
line 1585
;1585:		*ptr += 'a' - 'A';
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
line 1586
;1586:		ptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1587
;1587:		}
ADDRGP4 $385
JUMPV
LABELV $384
line 1589
;1588:		else 
;1589:		{
line 1590
;1590:		memmove(ptr, ptr+1, strlen(ptr + 1)+1);
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 196
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 204
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 204
INDIRI4
ADDP4
ARGP4
ADDRLP4 196
INDIRI4
ADDRLP4 204
INDIRI4
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 1591
;1591:		}
LABELV $385
LABELV $379
line 1592
;1592:	}
LABELV $376
line 1575
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $375
line 1593
;1593:	strncpy(buf, name, size-1);
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
line 1594
;1594:	buf[size-1] = '\0';
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 1595
;1595:	return buf;
ADDRFP4 4
INDIRP4
RETP4
LABELV $345
endproc EasyClientName 208 12
export BotSynonymContext
proc BotSynonymContext 8 4
line 1603
;1596:}
;1597:
;1598:/*
;1599:==================
;1600:BotSynonymContext
;1601:==================
;1602:*/
;1603:int BotSynonymContext(bot_state_t *bs) {
line 1606
;1604:	int context;
;1605:
;1606:	context = CONTEXT_NORMAL|CONTEXT_NEARBYITEM|CONTEXT_NAMES;
ADDRLP4 0
CNSTI4 1027
ASGNI4
line 1608
;1607:	//
;1608:	if (gametype == GT_CTF
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $387
line 1612
;1609:#ifdef MISSIONPACK
;1610:		|| gametype == GT_1FCTF
;1611:#endif
;1612:		) {
line 1613
;1613:		if (BotTeam(bs) == TEAM_RED) context |= CONTEXT_CTFREDTEAM;
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
NEI4 $389
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 4
BORI4
ASGNI4
ADDRGP4 $390
JUMPV
LABELV $389
line 1614
;1614:		else context |= CONTEXT_CTFBLUETEAM;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 8
BORI4
ASGNI4
LABELV $390
line 1615
;1615:	}
LABELV $387
line 1626
;1616:#ifdef MISSIONPACK
;1617:	else if (gametype == GT_OBELISK) {
;1618:		if (BotTeam(bs) == TEAM_RED) context |= CONTEXT_OBELISKREDTEAM;
;1619:		else context |= CONTEXT_OBELISKBLUETEAM;
;1620:	}
;1621:	else if (gametype == GT_HARVESTER) {
;1622:		if (BotTeam(bs) == TEAM_RED) context |= CONTEXT_HARVESTERREDTEAM;
;1623:		else context |= CONTEXT_HARVESTERBLUETEAM;
;1624:	}
;1625:#endif
;1626:	return context;
ADDRLP4 0
INDIRI4
RETI4
LABELV $386
endproc BotSynonymContext 8 4
export BotChooseWeapon
proc BotChooseWeapon 20 8
line 1634
;1627:}
;1628:
;1629:/*
;1630:==================
;1631:BotChooseWeapon
;1632:==================
;1633:*/
;1634:void BotChooseWeapon(bot_state_t *bs) {
line 1638
;1635:	int newweaponnum;
;1636:
;1637:	
;1638:		if (bs->cur_ps.weaponstate == WEAPON_RAISING ||
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
EQI4 $394
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $392
LABELV $394
line 1639
;1639:				bs->cur_ps.weaponstate == WEAPON_DROPPING) {
line 1640
;1640:			trap_EA_SelectWeapon(bs->client, bs->weaponnum);
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
line 1641
;1641:		}
ADDRGP4 $393
JUMPV
LABELV $392
line 1642
;1642:		else {
line 1643
;1643:			newweaponnum = trap_BotChooseBestFightWeapon(bs->ws, bs->inventory);
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
line 1644
;1644:			if (bs->weaponnum != newweaponnum) bs->weaponchange_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $395
ADDRFP4 0
INDIRP4
CNSTI4 6192
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
LABELV $395
line 1645
;1645:			bs->weaponnum = newweaponnum;
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1647
;1646:			//BotAI_Print(PRT_MESSAGE, "bs->weaponnum = %d\n", bs->weaponnum);
;1647:			trap_EA_SelectWeapon(bs->client, bs->weaponnum);
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
line 1648
;1648:		}
LABELV $393
line 1650
;1649:
;1650:}
LABELV $391
endproc BotChooseWeapon 20 8
export BotSetupForMovement
proc BotSetupForMovement 88 12
line 1657
;1651:
;1652:/*
;1653:==================
;1654:BotSetupForMovement
;1655:==================
;1656:*/
;1657:void BotSetupForMovement(bot_state_t *bs) {
line 1660
;1658:	bot_initmove_t initmove;
;1659:
;1660:	memset(&initmove, 0, sizeof(bot_initmove_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 68
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1661
;1661:	VectorCopy(bs->cur_ps.origin, initmove.origin);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1662
;1662:	VectorCopy(bs->cur_ps.velocity, initmove.velocity);
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRB
ASGNB 12
line 1663
;1663:	VectorClear(initmove.viewoffset);
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
line 1664
;1664:	initmove.viewoffset[2] += bs->cur_ps.viewheight;
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
line 1665
;1665:	initmove.entitynum = bs->entitynum;
ADDRLP4 0+36
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1666
;1666:	initmove.client = bs->client;
ADDRLP4 0+40
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1667
;1667:	initmove.thinktime = bs->thinktime;
ADDRLP4 0+44
ADDRFP4 0
INDIRP4
CNSTI4 4904
ADDP4
INDIRF4
ASGNF4
line 1669
;1668:	//set the onground flag
;1669:	if (bs->cur_ps.groundEntityNum != ENTITYNUM_NONE) initmove.or_moveflags |= MFL_ONGROUND;
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $409
ADDRLP4 0+64
ADDRLP4 0+64
INDIRI4
CNSTI4 2
BORI4
ASGNI4
LABELV $409
line 1671
;1670:	//set the teleported flag
;1671:	if ((bs->cur_ps.pm_flags & PMF_TIME_KNOCKBACK) && (bs->cur_ps.pm_time > 0)) {
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
EQI4 $412
ADDRLP4 72
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 76
INDIRI4
LEI4 $412
line 1672
;1672:		initmove.or_moveflags |= MFL_TELEPORTED;
ADDRLP4 0+64
ADDRLP4 0+64
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 1673
;1673:	}
LABELV $412
line 1675
;1674:	//set the waterjump flag
;1675:	if ((bs->cur_ps.pm_flags & PMF_TIME_WATERJUMP) && (bs->cur_ps.pm_time > 0)) {
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
EQI4 $415
ADDRLP4 80
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 84
INDIRI4
LEI4 $415
line 1676
;1676:		initmove.or_moveflags |= MFL_WATERJUMP;
ADDRLP4 0+64
ADDRLP4 0+64
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 1677
;1677:	}
LABELV $415
line 1679
;1678:	//set presence type
;1679:	if (bs->cur_ps.pm_flags & PMF_DUCKED) initmove.presencetype = PRESENCE_CROUCH;
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $418
ADDRLP4 0+48
CNSTI4 4
ASGNI4
ADDRGP4 $419
JUMPV
LABELV $418
line 1680
;1680:	else initmove.presencetype = PRESENCE_NORMAL;
ADDRLP4 0+48
CNSTI4 2
ASGNI4
LABELV $419
line 1682
;1681:	//
;1682:	if (bs->walker > 0.5) initmove.or_moveflags |= MFL_WALK;
ADDRFP4 0
INDIRP4
CNSTI4 6056
ADDP4
INDIRF4
CNSTF4 1056964608
LEF4 $422
ADDRLP4 0+64
ADDRLP4 0+64
INDIRI4
CNSTI4 512
BORI4
ASGNI4
LABELV $422
line 1684
;1683:	//
;1684:	VectorCopy(bs->viewangles, initmove.viewangles);
ADDRLP4 0+52
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
INDIRB
ASGNB 12
line 1686
;1685:	//
;1686:	trap_BotInitMoveState(bs->ms, &initmove);
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
line 1687
;1687:}
LABELV $397
endproc BotSetupForMovement 88 12
export BotCheckItemPickup
proc BotCheckItemPickup 0 0
line 1694
;1688:
;1689:/*
;1690:==================
;1691:BotCheckItemPickup
;1692:==================
;1693:*/
;1694:void BotCheckItemPickup(bot_state_t *bs, int *oldinventory) {
line 1781
;1695:#ifdef MISSIONPACK
;1696:	int offence, leader;
;1697:
;1698:	if (gametype <= GT_TEAM)
;1699:		return;
;1700:
;1701:	offence = -1;
;1702:	// go into offence if picked up the kamikaze or invulnerability
;1703:	if (!oldinventory[INVENTORY_KAMIKAZE] && bs->inventory[INVENTORY_KAMIKAZE] >= 1) {
;1704:		offence = qtrue;
;1705:	}
;1706:	if (!oldinventory[INVENTORY_INVULNERABILITY] && bs->inventory[INVENTORY_INVULNERABILITY] >= 1) {
;1707:		offence = qtrue;
;1708:	}
;1709:	// if not already wearing the kamikaze or invulnerability
;1710:	if (!bs->inventory[INVENTORY_KAMIKAZE] && !bs->inventory[INVENTORY_INVULNERABILITY]) {
;1711:		if (!oldinventory[INVENTORY_SCOUT] && bs->inventory[INVENTORY_SCOUT] >= 1) {
;1712:			offence = qtrue;
;1713:		}
;1714:		if (!oldinventory[INVENTORY_GUARD] && bs->inventory[INVENTORY_GUARD] >= 1) {
;1715:			offence = qtrue;
;1716:		}
;1717:		if (!oldinventory[INVENTORY_DOUBLER] && bs->inventory[INVENTORY_DOUBLER] >= 1) {
;1718:			offence = qfalse;
;1719:		}
;1720:		if (!oldinventory[INVENTORY_AMMOREGEN] && bs->inventory[INVENTORY_AMMOREGEN] >= 1) {
;1721:			offence = qfalse;
;1722:		}
;1723:	}
;1724:
;1725:	if (offence >= 0) {
;1726:		leader = ClientFromName(bs->teamleader);
;1727:		if (offence) {
;1728:			if (!(bs->teamtaskpreference & TEAMTP_ATTACKER)) {
;1729:				// if we have a bot team leader
;1730:				if (BotTeamLeader(bs)) {
;1731:					// tell the leader we want to be on offence
;1732:					BotVoiceChat(bs, leader, VOICECHAT_WANTONOFFENSE);
;1733:					//BotAI_BotInitialChat(bs, "wantoffence", NULL);
;1734:					//trap_BotEnterChat(bs->cs, leader, CHAT_TELL);
;1735:				}
;1736:				else if (g_spSkill.integer <= 3) {
;1737:					if ( bs->ltgtype != LTG_GETFLAG &&
;1738:						 bs->ltgtype != LTG_ATTACKENEMYBASE &&
;1739:						 bs->ltgtype != LTG_HARVEST ) {
;1740:						//
;1741:						if ((gametype != GT_CTF || (bs->redflagstatus == 0 && bs->blueflagstatus == 0)) &&
;1742:							(gametype != GT_1FCTF || bs->neutralflagstatus == 0) ) {
;1743:							// tell the leader we want to be on offence
;1744:							BotVoiceChat(bs, leader, VOICECHAT_WANTONOFFENSE);
;1745:							//BotAI_BotInitialChat(bs, "wantoffence", NULL);
;1746:							//trap_BotEnterChat(bs->cs, leader, CHAT_TELL);
;1747:						}
;1748:					}
;1749:					bs->teamtaskpreference |= TEAMTP_ATTACKER;
;1750:				}
;1751:			}
;1752:			bs->teamtaskpreference &= ~TEAMTP_DEFENDER;
;1753:		}
;1754:		else {
;1755:			if (!(bs->teamtaskpreference & TEAMTP_DEFENDER)) {
;1756:				// if we have a bot team leader
;1757:				if (BotTeamLeader(bs)) {
;1758:					// tell the leader we want to be on defense
;1759:					BotVoiceChat(bs, -1, VOICECHAT_WANTONDEFENSE);
;1760:					//BotAI_BotInitialChat(bs, "wantdefence", NULL);
;1761:					//trap_BotEnterChat(bs->cs, leader, CHAT_TELL);
;1762:				}
;1763:				else if (g_spSkill.integer <= 3) {
;1764:					if ( bs->ltgtype != LTG_DEFENDKEYAREA ) {
;1765:						//
;1766:						if ((gametype != GT_CTF || (bs->redflagstatus == 0 && bs->blueflagstatus == 0)) &&
;1767:							(gametype != GT_1FCTF || bs->neutralflagstatus == 0) ) {
;1768:							// tell the leader we want to be on defense
;1769:							BotVoiceChat(bs, -1, VOICECHAT_WANTONDEFENSE);
;1770:							//BotAI_BotInitialChat(bs, "wantdefence", NULL);
;1771:							//trap_BotEnterChat(bs->cs, leader, CHAT_TELL);
;1772:						}
;1773:					}
;1774:				}
;1775:				bs->teamtaskpreference |= TEAMTP_DEFENDER;
;1776:			}
;1777:			bs->teamtaskpreference &= ~TEAMTP_ATTACKER;
;1778:		}
;1779:	}
;1780:#endif
;1781:}
LABELV $426
endproc BotCheckItemPickup 0 0
export BotUpdateInventory
proc BotUpdateInventory 1224 12
line 1788
;1782:
;1783:/*
;1784:==================
;1785:BotUpdateInventory
;1786:==================
;1787:*/
;1788:void BotUpdateInventory(bot_state_t *bs) {
line 1791
;1789:	int oldinventory[MAX_ITEMS];
;1790:
;1791:	memcpy(oldinventory, bs->inventory, sizeof(oldinventory));
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
line 1793
;1792:	//armor
;1793:	bs->inventory[INVENTORY_ARMOR] = bs->cur_ps.stats[STAT_ARMOR];
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
line 1795
;1794:	//weapons
;1795:	bs->inventory[INVENTORY_GAUNTLET] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_GAUNTLET)) != 0;
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
EQI4 $429
ADDRLP4 1028
CNSTI4 1
ASGNI4
ADDRGP4 $430
JUMPV
LABELV $429
ADDRLP4 1028
CNSTI4 0
ASGNI4
LABELV $430
ADDRLP4 1032
INDIRP4
CNSTI4 4968
ADDP4
ADDRLP4 1028
INDIRI4
ASGNI4
line 1796
;1796:	bs->inventory[INVENTORY_SHOTGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_SHOTGUN)) != 0;
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
EQI4 $432
ADDRLP4 1036
CNSTI4 1
ASGNI4
ADDRGP4 $433
JUMPV
LABELV $432
ADDRLP4 1036
CNSTI4 0
ASGNI4
LABELV $433
ADDRLP4 1040
INDIRP4
CNSTI4 4972
ADDP4
ADDRLP4 1036
INDIRI4
ASGNI4
line 1797
;1797:	bs->inventory[INVENTORY_MACHINEGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_MACHINEGUN)) != 0;
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
EQI4 $435
ADDRLP4 1044
CNSTI4 1
ASGNI4
ADDRGP4 $436
JUMPV
LABELV $435
ADDRLP4 1044
CNSTI4 0
ASGNI4
LABELV $436
ADDRLP4 1048
INDIRP4
CNSTI4 4976
ADDP4
ADDRLP4 1044
INDIRI4
ASGNI4
line 1798
;1798:	bs->inventory[INVENTORY_GRENADELAUNCHER] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_GRENADE_LAUNCHER)) != 0;
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
EQI4 $438
ADDRLP4 1052
CNSTI4 1
ASGNI4
ADDRGP4 $439
JUMPV
LABELV $438
ADDRLP4 1052
CNSTI4 0
ASGNI4
LABELV $439
ADDRLP4 1056
INDIRP4
CNSTI4 4980
ADDP4
ADDRLP4 1052
INDIRI4
ASGNI4
line 1799
;1799:	bs->inventory[INVENTORY_ROCKETLAUNCHER] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_ROCKET_LAUNCHER)) != 0;
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
EQI4 $441
ADDRLP4 1060
CNSTI4 1
ASGNI4
ADDRGP4 $442
JUMPV
LABELV $441
ADDRLP4 1060
CNSTI4 0
ASGNI4
LABELV $442
ADDRLP4 1064
INDIRP4
CNSTI4 4984
ADDP4
ADDRLP4 1060
INDIRI4
ASGNI4
line 1800
;1800:	bs->inventory[INVENTORY_LIGHTNING] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_LIGHTNING)) != 0;
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
EQI4 $444
ADDRLP4 1068
CNSTI4 1
ASGNI4
ADDRGP4 $445
JUMPV
LABELV $444
ADDRLP4 1068
CNSTI4 0
ASGNI4
LABELV $445
ADDRLP4 1072
INDIRP4
CNSTI4 4988
ADDP4
ADDRLP4 1068
INDIRI4
ASGNI4
line 1801
;1801:	bs->inventory[INVENTORY_RAILGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_RAILGUN)) != 0;
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
EQI4 $447
ADDRLP4 1076
CNSTI4 1
ASGNI4
ADDRGP4 $448
JUMPV
LABELV $447
ADDRLP4 1076
CNSTI4 0
ASGNI4
LABELV $448
ADDRLP4 1080
INDIRP4
CNSTI4 4992
ADDP4
ADDRLP4 1076
INDIRI4
ASGNI4
line 1802
;1802:	bs->inventory[INVENTORY_PLASMAGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_PLASMAGUN)) != 0;
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
EQI4 $450
ADDRLP4 1084
CNSTI4 1
ASGNI4
ADDRGP4 $451
JUMPV
LABELV $450
ADDRLP4 1084
CNSTI4 0
ASGNI4
LABELV $451
ADDRLP4 1088
INDIRP4
CNSTI4 4996
ADDP4
ADDRLP4 1084
INDIRI4
ASGNI4
line 1803
;1803:	bs->inventory[INVENTORY_BFG10K] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_BFG)) != 0;
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
EQI4 $453
ADDRLP4 1092
CNSTI4 1
ASGNI4
ADDRGP4 $454
JUMPV
LABELV $453
ADDRLP4 1092
CNSTI4 0
ASGNI4
LABELV $454
ADDRLP4 1096
INDIRP4
CNSTI4 5004
ADDP4
ADDRLP4 1092
INDIRI4
ASGNI4
line 1804
;1804:	bs->inventory[INVENTORY_GRAPPLINGHOOK] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_GRAPPLING_HOOK)) != 0;
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
EQI4 $456
ADDRLP4 1100
CNSTI4 1
ASGNI4
ADDRGP4 $457
JUMPV
LABELV $456
ADDRLP4 1100
CNSTI4 0
ASGNI4
LABELV $457
ADDRLP4 1104
INDIRP4
CNSTI4 5008
ADDP4
ADDRLP4 1100
INDIRI4
ASGNI4
line 1811
;1805:#ifdef MISSIONPACK
;1806:	bs->inventory[INVENTORY_NAILGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_NAILGUN)) != 0;;
;1807:	bs->inventory[INVENTORY_PROXLAUNCHER] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_PROX_LAUNCHER)) != 0;;
;1808:	bs->inventory[INVENTORY_CHAINGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_CHAINGUN)) != 0;;
;1809:#endif
;1810:	//ammo
;1811:	bs->inventory[INVENTORY_SHELLS] = bs->cur_ps.ammo[WP_SHOTGUN];
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
line 1812
;1812:	bs->inventory[INVENTORY_BULLETS] = bs->cur_ps.ammo[WP_MACHINEGUN];
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
line 1813
;1813:	bs->inventory[INVENTORY_GRENADES] = bs->cur_ps.ammo[WP_GRENADE_LAUNCHER];
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
line 1814
;1814:	bs->inventory[INVENTORY_CELLS] = bs->cur_ps.ammo[WP_PLASMAGUN];
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
line 1815
;1815:	bs->inventory[INVENTORY_LIGHTNINGAMMO] = bs->cur_ps.ammo[WP_LIGHTNING];
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
line 1816
;1816:	bs->inventory[INVENTORY_ROCKETS] = bs->cur_ps.ammo[WP_ROCKET_LAUNCHER];
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
line 1817
;1817:	bs->inventory[INVENTORY_SLUGS] = bs->cur_ps.ammo[WP_RAILGUN];
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
line 1818
;1818:	bs->inventory[INVENTORY_BFGAMMO] = bs->cur_ps.ammo[WP_BFG];
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
line 1825
;1819:#ifdef MISSIONPACK
;1820:	bs->inventory[INVENTORY_NAILS] = bs->cur_ps.ammo[WP_NAILGUN];
;1821:	bs->inventory[INVENTORY_MINES] = bs->cur_ps.ammo[WP_PROX_LAUNCHER];
;1822:	bs->inventory[INVENTORY_BELT] = bs->cur_ps.ammo[WP_CHAINGUN];
;1823:#endif
;1824:	//powerups
;1825:	bs->inventory[INVENTORY_HEALTH] = bs->cur_ps.stats[STAT_HEALTH];
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
line 1826
;1826:	bs->inventory[INVENTORY_TELEPORTER] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_TELEPORTER;
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
NEI4 $459
ADDRLP4 1144
CNSTI4 1
ASGNI4
ADDRGP4 $460
JUMPV
LABELV $459
ADDRLP4 1144
CNSTI4 0
ASGNI4
LABELV $460
ADDRLP4 1148
INDIRP4
CNSTI4 5072
ADDP4
ADDRLP4 1144
INDIRI4
ASGNI4
line 1827
;1827:	bs->inventory[INVENTORY_MEDKIT] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_MEDKIT;
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
NEI4 $462
ADDRLP4 1152
CNSTI4 1
ASGNI4
ADDRGP4 $463
JUMPV
LABELV $462
ADDRLP4 1152
CNSTI4 0
ASGNI4
LABELV $463
ADDRLP4 1156
INDIRP4
CNSTI4 5076
ADDP4
ADDRLP4 1152
INDIRI4
ASGNI4
line 1833
;1828:#ifdef MISSIONPACK
;1829:	bs->inventory[INVENTORY_KAMIKAZE] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_KAMIKAZE;
;1830:	bs->inventory[INVENTORY_PORTAL] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_PORTAL;
;1831:	bs->inventory[INVENTORY_INVULNERABILITY] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_INVULNERABILITY;
;1832:#endif
;1833:	bs->inventory[INVENTORY_QUAD] = bs->cur_ps.powerups[PW_QUAD] != 0;
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
EQI4 $465
ADDRLP4 1160
CNSTI4 1
ASGNI4
ADDRGP4 $466
JUMPV
LABELV $465
ADDRLP4 1160
CNSTI4 0
ASGNI4
LABELV $466
ADDRLP4 1164
INDIRP4
CNSTI4 5092
ADDP4
ADDRLP4 1160
INDIRI4
ASGNI4
line 1834
;1834:	bs->inventory[INVENTORY_ENVIRONMENTSUIT] = bs->cur_ps.powerups[PW_BATTLESUIT] != 0;
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
EQI4 $468
ADDRLP4 1168
CNSTI4 1
ASGNI4
ADDRGP4 $469
JUMPV
LABELV $468
ADDRLP4 1168
CNSTI4 0
ASGNI4
LABELV $469
ADDRLP4 1172
INDIRP4
CNSTI4 5096
ADDP4
ADDRLP4 1168
INDIRI4
ASGNI4
line 1835
;1835:	bs->inventory[INVENTORY_HASTE] = bs->cur_ps.powerups[PW_HASTE] != 0;
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
EQI4 $471
ADDRLP4 1176
CNSTI4 1
ASGNI4
ADDRGP4 $472
JUMPV
LABELV $471
ADDRLP4 1176
CNSTI4 0
ASGNI4
LABELV $472
ADDRLP4 1180
INDIRP4
CNSTI4 5100
ADDP4
ADDRLP4 1176
INDIRI4
ASGNI4
line 1836
;1836:	bs->inventory[INVENTORY_INVISIBILITY] = bs->cur_ps.powerups[PW_INVIS] != 0;
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
EQI4 $474
ADDRLP4 1184
CNSTI4 1
ASGNI4
ADDRGP4 $475
JUMPV
LABELV $474
ADDRLP4 1184
CNSTI4 0
ASGNI4
LABELV $475
ADDRLP4 1188
INDIRP4
CNSTI4 5104
ADDP4
ADDRLP4 1184
INDIRI4
ASGNI4
line 1837
;1837:	bs->inventory[INVENTORY_REGEN] = bs->cur_ps.powerups[PW_REGEN] != 0;
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
EQI4 $477
ADDRLP4 1192
CNSTI4 1
ASGNI4
ADDRGP4 $478
JUMPV
LABELV $477
ADDRLP4 1192
CNSTI4 0
ASGNI4
LABELV $478
ADDRLP4 1196
INDIRP4
CNSTI4 5108
ADDP4
ADDRLP4 1192
INDIRI4
ASGNI4
line 1838
;1838:	bs->inventory[INVENTORY_FLIGHT] = bs->cur_ps.powerups[PW_FLIGHT] != 0;
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
EQI4 $480
ADDRLP4 1200
CNSTI4 1
ASGNI4
ADDRGP4 $481
JUMPV
LABELV $480
ADDRLP4 1200
CNSTI4 0
ASGNI4
LABELV $481
ADDRLP4 1204
INDIRP4
CNSTI4 5112
ADDP4
ADDRLP4 1200
INDIRI4
ASGNI4
line 1845
;1839:#ifdef MISSIONPACK
;1840:	bs->inventory[INVENTORY_SCOUT] = bs->cur_ps.stats[STAT_PERSISTANT_POWERUP] == MODELINDEX_SCOUT;
;1841:	bs->inventory[INVENTORY_GUARD] = bs->cur_ps.stats[STAT_PERSISTANT_POWERUP] == MODELINDEX_GUARD;
;1842:	bs->inventory[INVENTORY_DOUBLER] = bs->cur_ps.stats[STAT_PERSISTANT_POWERUP] == MODELINDEX_DOUBLER;
;1843:	bs->inventory[INVENTORY_AMMOREGEN] = bs->cur_ps.stats[STAT_PERSISTANT_POWERUP] == MODELINDEX_AMMOREGEN;
;1844:#endif
;1845:	bs->inventory[INVENTORY_REDFLAG] = bs->cur_ps.powerups[PW_REDFLAG] != 0;
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
EQI4 $483
ADDRLP4 1208
CNSTI4 1
ASGNI4
ADDRGP4 $484
JUMPV
LABELV $483
ADDRLP4 1208
CNSTI4 0
ASGNI4
LABELV $484
ADDRLP4 1212
INDIRP4
CNSTI4 5132
ADDP4
ADDRLP4 1208
INDIRI4
ASGNI4
line 1846
;1846:	bs->inventory[INVENTORY_BLUEFLAG] = bs->cur_ps.powerups[PW_BLUEFLAG] != 0;
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
EQI4 $486
ADDRLP4 1216
CNSTI4 1
ASGNI4
ADDRGP4 $487
JUMPV
LABELV $486
ADDRLP4 1216
CNSTI4 0
ASGNI4
LABELV $487
ADDRLP4 1220
INDIRP4
CNSTI4 5136
ADDP4
ADDRLP4 1216
INDIRI4
ASGNI4
line 1858
;1847:#ifdef MISSIONPACK
;1848:	bs->inventory[INVENTORY_NEUTRALFLAG] = bs->cur_ps.powerups[PW_NEUTRALFLAG] != 0;
;1849:	if (BotTeam(bs) == TEAM_RED) {
;1850:		bs->inventory[INVENTORY_REDCUBE] = bs->cur_ps.generic1;
;1851:		bs->inventory[INVENTORY_BLUECUBE] = 0;
;1852:	}
;1853:	else {
;1854:		bs->inventory[INVENTORY_REDCUBE] = 0;
;1855:		bs->inventory[INVENTORY_BLUECUBE] = bs->cur_ps.generic1;
;1856:	}
;1857:#endif
;1858:	BotCheckItemPickup(bs, oldinventory);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckItemPickup
CALLV
pop
line 1859
;1859:}
LABELV $427
endproc BotUpdateInventory 1224 12
export BotUpdateBattleInventory
proc BotUpdateBattleInventory 160 8
line 1866
;1860:
;1861:/*
;1862:==================
;1863:BotUpdateBattleInventory
;1864:==================
;1865:*/
;1866:void BotUpdateBattleInventory(bot_state_t *bs, int enemy) {
line 1870
;1867:	vec3_t dir;
;1868:	aas_entityinfo_t entinfo;
;1869:
;1870:	BotEntityInfo(enemy, &entinfo);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1871
;1871:	VectorSubtract(entinfo.origin, bs->origin, dir);
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
line 1872
;1872:	bs->inventory[ENEMY_HEIGHT] = (int) dir[2];
ADDRFP4 0
INDIRP4
CNSTI4 5756
ADDP4
ADDRLP4 0+8
INDIRF4
CVFI4 4
ASGNI4
line 1873
;1873:	dir[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1874
;1874:	bs->inventory[ENEMY_HORIZONTAL_DIST] = (int) VectorLength(dir);
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
line 1876
;1875:	//FIXME: add num visible enemies and num visible team mates to the inventory
;1876:}
LABELV $488
endproc BotUpdateBattleInventory 160 8
export BotBattleUseItems
proc BotBattleUseItems 4 4
line 2103
;1877:
;1878:#ifdef MISSIONPACK
;1879:/*
;1880:==================
;1881:BotUseKamikaze
;1882:==================
;1883:*/
;1884:#define KAMIKAZE_DIST		1024
;1885:
;1886:void BotUseKamikaze(bot_state_t *bs) {
;1887:	int c, teammates, enemies;
;1888:	aas_entityinfo_t entinfo;
;1889:	vec3_t dir, target;
;1890:	bot_goal_t *goal;
;1891:	bsp_trace_t trace;
;1892:
;1893:	//if the bot has no kamikaze
;1894:	if (bs->inventory[INVENTORY_KAMIKAZE] <= 0)
;1895:		return;
;1896:	if (bs->kamikaze_time > FloatTime())
;1897:		return;
;1898:	bs->kamikaze_time = FloatTime() + 0.2;
;1899:	if (gametype == GT_CTF) {
;1900:		//never use kamikaze if the team flag carrier is visible
;1901:		if (BotCTFCarryingFlag(bs))
;1902:			return;
;1903:		c = BotTeamFlagCarrierVisible(bs);
;1904:		if (c >= 0) {
;1905:			BotEntityInfo(c, &entinfo);
;1906:			VectorSubtract(entinfo.origin, bs->origin, dir);
;1907:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST))
;1908:				return;
;1909:		}
;1910:		c = BotEnemyFlagCarrierVisible(bs);
;1911:		if (c >= 0) {
;1912:			BotEntityInfo(c, &entinfo);
;1913:			VectorSubtract(entinfo.origin, bs->origin, dir);
;1914:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST)) {
;1915:				trap_EA_Use(bs->client);
;1916:				return;
;1917:			}
;1918:		}
;1919:	}
;1920:	else if (gametype == GT_1FCTF) {
;1921:		//never use kamikaze if the team flag carrier is visible
;1922:		if (Bot1FCTFCarryingFlag(bs))
;1923:			return;
;1924:		c = BotTeamFlagCarrierVisible(bs);
;1925:		if (c >= 0) {
;1926:			BotEntityInfo(c, &entinfo);
;1927:			VectorSubtract(entinfo.origin, bs->origin, dir);
;1928:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST))
;1929:				return;
;1930:		}
;1931:		c = BotEnemyFlagCarrierVisible(bs);
;1932:		if (c >= 0) {
;1933:			BotEntityInfo(c, &entinfo);
;1934:			VectorSubtract(entinfo.origin, bs->origin, dir);
;1935:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST)) {
;1936:				trap_EA_Use(bs->client);
;1937:				return;
;1938:			}
;1939:		}
;1940:	}
;1941:	else if (gametype == GT_OBELISK) {
;1942:		switch(BotTeam(bs)) {
;1943:			case TEAM_RED: goal = &blueobelisk; break;
;1944:			default: goal = &redobelisk; break;
;1945:		}
;1946:		//if the obelisk is visible
;1947:		VectorCopy(goal->origin, target);
;1948:		target[2] += 1;
;1949:		VectorSubtract(bs->origin, target, dir);
;1950:		if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST * 0.9)) {
;1951:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
;1952:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
;1953:				trap_EA_Use(bs->client);
;1954:				return;
;1955:			}
;1956:		}
;1957:	}
;1958:	else if (gametype == GT_HARVESTER) {
;1959:		//
;1960:		if (BotHarvesterCarryingCubes(bs))
;1961:			return;
;1962:		//never use kamikaze if a team mate carrying cubes is visible
;1963:		c = BotTeamCubeCarrierVisible(bs);
;1964:		if (c >= 0) {
;1965:			BotEntityInfo(c, &entinfo);
;1966:			VectorSubtract(entinfo.origin, bs->origin, dir);
;1967:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST))
;1968:				return;
;1969:		}
;1970:		c = BotEnemyCubeCarrierVisible(bs);
;1971:		if (c >= 0) {
;1972:			BotEntityInfo(c, &entinfo);
;1973:			VectorSubtract(entinfo.origin, bs->origin, dir);
;1974:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST)) {
;1975:				trap_EA_Use(bs->client);
;1976:				return;
;1977:			}
;1978:		}
;1979:	}
;1980:	//
;1981:	BotVisibleTeamMatesAndEnemies(bs, &teammates, &enemies, KAMIKAZE_DIST);
;1982:	//
;1983:	if (enemies > 2 && enemies > teammates+1) {
;1984:		trap_EA_Use(bs->client);
;1985:		return;
;1986:	}
;1987:}
;1988:
;1989:/*
;1990:==================
;1991:BotUseInvulnerability
;1992:==================
;1993:*/
;1994:void BotUseInvulnerability(bot_state_t *bs) {
;1995:	int c;
;1996:	vec3_t dir, target;
;1997:	bot_goal_t *goal;
;1998:	bsp_trace_t trace;
;1999:
;2000:	//if the bot has no invulnerability
;2001:	if (bs->inventory[INVENTORY_INVULNERABILITY] <= 0)
;2002:		return;
;2003:	if (bs->invulnerability_time > FloatTime())
;2004:		return;
;2005:	bs->invulnerability_time = FloatTime() + 0.2;
;2006:	if (gametype == GT_CTF) {
;2007:		//never use kamikaze if the team flag carrier is visible
;2008:		if (BotCTFCarryingFlag(bs))
;2009:			return;
;2010:		c = BotEnemyFlagCarrierVisible(bs);
;2011:		if (c >= 0)
;2012:			return;
;2013:		//if near enemy flag and the flag is visible
;2014:		switch(BotTeam(bs)) {
;2015:			case TEAM_RED: goal = &ctf_blueflag; break;
;2016:			default: goal = &ctf_redflag; break;
;2017:		}
;2018:		//if the obelisk is visible
;2019:		VectorCopy(goal->origin, target);
;2020:		target[2] += 1;
;2021:		VectorSubtract(bs->origin, target, dir);
;2022:		if (VectorLengthSquared(dir) < Square(200)) {
;2023:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
;2024:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
;2025:				trap_EA_Use(bs->client);
;2026:				return;
;2027:			}
;2028:		}
;2029:	}
;2030:	else if (gametype == GT_1FCTF) {
;2031:		//never use kamikaze if the team flag carrier is visible
;2032:		if (Bot1FCTFCarryingFlag(bs))
;2033:			return;
;2034:		c = BotEnemyFlagCarrierVisible(bs);
;2035:		if (c >= 0)
;2036:			return;
;2037:		//if near enemy flag and the flag is visible
;2038:		switch(BotTeam(bs)) {
;2039:			case TEAM_RED: goal = &ctf_blueflag; break;
;2040:			default: goal = &ctf_redflag; break;
;2041:		}
;2042:		//if the obelisk is visible
;2043:		VectorCopy(goal->origin, target);
;2044:		target[2] += 1;
;2045:		VectorSubtract(bs->origin, target, dir);
;2046:		if (VectorLengthSquared(dir) < Square(200)) {
;2047:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
;2048:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
;2049:				trap_EA_Use(bs->client);
;2050:				return;
;2051:			}
;2052:		}
;2053:	}
;2054:	else if (gametype == GT_OBELISK) {
;2055:		switch(BotTeam(bs)) {
;2056:			case TEAM_RED: goal = &blueobelisk; break;
;2057:			default: goal = &redobelisk; break;
;2058:		}
;2059:		//if the obelisk is visible
;2060:		VectorCopy(goal->origin, target);
;2061:		target[2] += 1;
;2062:		VectorSubtract(bs->origin, target, dir);
;2063:		if (VectorLengthSquared(dir) < Square(300)) {
;2064:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
;2065:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
;2066:				trap_EA_Use(bs->client);
;2067:				return;
;2068:			}
;2069:		}
;2070:	}
;2071:	else if (gametype == GT_HARVESTER) {
;2072:		//
;2073:		if (BotHarvesterCarryingCubes(bs))
;2074:			return;
;2075:		c = BotEnemyCubeCarrierVisible(bs);
;2076:		if (c >= 0)
;2077:			return;
;2078:		//if near enemy base and enemy base is visible
;2079:		switch(BotTeam(bs)) {
;2080:			case TEAM_RED: goal = &blueobelisk; break;
;2081:			default: goal = &redobelisk; break;
;2082:		}
;2083:		//if the obelisk is visible
;2084:		VectorCopy(goal->origin, target);
;2085:		target[2] += 1;
;2086:		VectorSubtract(bs->origin, target, dir);
;2087:		if (VectorLengthSquared(dir) < Square(200)) {
;2088:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
;2089:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
;2090:				trap_EA_Use(bs->client);
;2091:				return;
;2092:			}
;2093:		}
;2094:	}
;2095:}
;2096:#endif
;2097:
;2098:/*
;2099:==================
;2100:BotBattleUseItems
;2101:==================
;2102:*/
;2103:void BotBattleUseItems(bot_state_t *bs) {
line 2104
;2104:	if (bs->inventory[INVENTORY_HEALTH] < 40) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 40
GEI4 $499
line 2105
;2105:		if (bs->inventory[INVENTORY_TELEPORTER] > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 5072
ADDP4
INDIRI4
CNSTI4 0
LEI4 $501
line 2106
;2106:			if (!BotCTFCarryingFlag(bs)
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
NEI4 $503
line 2111
;2107:#ifdef MISSIONPACK
;2108:				&& !Bot1FCTFCarryingFlag(bs)
;2109:				&& !BotHarvesterCarryingCubes(bs)
;2110:#endif
;2111:				) {
line 2112
;2112:				trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 2113
;2113:			}
LABELV $503
line 2114
;2114:		}
LABELV $501
line 2115
;2115:	}
LABELV $499
line 2116
;2116:	if (bs->inventory[INVENTORY_HEALTH] < 60) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $505
line 2117
;2117:		if (bs->inventory[INVENTORY_MEDKIT] > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 5076
ADDP4
INDIRI4
CNSTI4 0
LEI4 $507
line 2118
;2118:			trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 2119
;2119:		}
LABELV $507
line 2120
;2120:	}
LABELV $505
line 2125
;2121:#ifdef MISSIONPACK
;2122:	BotUseKamikaze(bs);
;2123:	BotUseInvulnerability(bs);
;2124:#endif
;2125:}
LABELV $498
endproc BotBattleUseItems 4 4
export BotSetTeleportTime
proc BotSetTeleportTime 8 0
line 2132
;2126:
;2127:/*
;2128:==================
;2129:BotSetTeleportTime
;2130:==================
;2131:*/
;2132:void BotSetTeleportTime(bot_state_t *bs) {
line 2133
;2133:	if ((bs->cur_ps.eFlags ^ bs->last_eFlags) & EF_TELEPORT_BIT) {
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
EQI4 $510
line 2134
;2134:		bs->teleport_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6180
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2135
;2135:	}
LABELV $510
line 2136
;2136:	bs->last_eFlags = bs->cur_ps.eFlags;
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
line 2137
;2137:}
LABELV $509
endproc BotSetTeleportTime 8 0
export BotIsDead
proc BotIsDead 4 0
line 2144
;2138:
;2139:/*
;2140:==================
;2141:BotIsDead
;2142:==================
;2143:*/
;2144:qboolean BotIsDead(bot_state_t *bs) {
line 2145
;2145:	return (bs->cur_ps.pm_type == PM_DEAD);
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 3
NEI4 $514
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $515
JUMPV
LABELV $514
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $515
ADDRLP4 0
INDIRI4
RETI4
LABELV $512
endproc BotIsDead 4 0
export BotIsObserver
proc BotIsObserver 1032 12
line 2153
;2146:}
;2147:
;2148:/*
;2149:==================
;2150:BotIsObserver
;2151:==================
;2152:*/
;2153:qboolean BotIsObserver(bot_state_t *bs) {
line 2155
;2154:	char buf[MAX_INFO_STRING];
;2155:	if (bs->cur_ps.pm_type == PM_SPECTATOR) return qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 2
NEI4 $517
CNSTI4 1
RETI4
ADDRGP4 $516
JUMPV
LABELV $517
line 2156
;2156:	trap_GetConfigstring(CS_PLAYERS+bs->client, buf, sizeof(buf));
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
line 2157
;2157:	if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR) return qtrue;
ADDRLP4 0
ARGP4
ADDRGP4 $77
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
NEI4 $519
CNSTI4 1
RETI4
ADDRGP4 $516
JUMPV
LABELV $519
line 2158
;2158:	return qfalse;
CNSTI4 0
RETI4
LABELV $516
endproc BotIsObserver 1032 12
export BotIntermission
proc BotIntermission 8 0
line 2166
;2159:}
;2160:
;2161:/*
;2162:==================
;2163:BotIntermission
;2164:==================
;2165:*/
;2166:qboolean BotIntermission(bot_state_t *bs) {
line 2168
;2167:	//NOTE: we shouldn't be looking at the game code...
;2168:	if (level.intermissiontime) return qtrue;
ADDRGP4 level+9140
INDIRI4
CNSTI4 0
EQI4 $522
CNSTI4 1
RETI4
ADDRGP4 $521
JUMPV
LABELV $522
line 2169
;2169:	return (bs->cur_ps.pm_type == PM_FREEZE || bs->cur_ps.pm_type == PM_INTERMISSION);
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
EQI4 $528
ADDRLP4 4
INDIRI4
CNSTI4 5
NEI4 $526
LABELV $528
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $527
JUMPV
LABELV $526
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $527
ADDRLP4 0
INDIRI4
RETI4
LABELV $521
endproc BotIntermission 8 0
export BotInLavaOrSlime
proc BotInLavaOrSlime 16 4
line 2178
;2170:	
;2171:}
;2172:
;2173:/*
;2174:==================
;2175:BotInLavaOrSlime
;2176:==================
;2177:*/
;2178:qboolean BotInLavaOrSlime(bot_state_t *bs) {
line 2181
;2179:	vec3_t feet;
;2180:
;2181:	VectorCopy(bs->origin, feet);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 2182
;2182:	feet[2] -= 23;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1102577664
SUBF4
ASGNF4
line 2183
;2183:	return (trap_AAS_PointContents(feet) & (CONTENTS_LAVA|CONTENTS_SLIME));
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
LABELV $529
endproc BotInLavaOrSlime 16 4
lit
align 4
LABELV $532
byte 4 3238002688
byte 4 3238002688
byte 4 3238002688
align 4
LABELV $533
byte 4 1090519040
byte 4 1090519040
byte 4 1090519040
export BotCreateWayPoint
code
proc BotCreateWayPoint 32 12
line 2191
;2184:}
;2185:
;2186:/*
;2187:==================
;2188:BotCreateWayPoint
;2189:==================
;2190:*/
;2191:bot_waypoint_t *BotCreateWayPoint(char *name, vec3_t origin, int areanum) {
line 2193
;2192:	bot_waypoint_t *wp;
;2193:	vec3_t waypointmins = {-8, -8, -8}, waypointmaxs = {8, 8, 8};
ADDRLP4 4
ADDRGP4 $532
INDIRB
ASGNB 12
ADDRLP4 16
ADDRGP4 $533
INDIRB
ASGNB 12
line 2195
;2194:
;2195:	wp = botai_freewaypoints;
ADDRLP4 0
ADDRGP4 botai_freewaypoints
INDIRP4
ASGNP4
line 2196
;2196:	if ( !wp ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $534
line 2197
;2197:		BotAI_Print( PRT_WARNING, "BotCreateWayPoint: Out of waypoints\n" );
CNSTI4 2
ARGI4
ADDRGP4 $536
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 2198
;2198:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $531
JUMPV
LABELV $534
line 2200
;2199:	}
;2200:	botai_freewaypoints = botai_freewaypoints->next;
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
line 2202
;2201:
;2202:	Q_strncpyz( wp->name, name, sizeof(wp->name) );
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
line 2203
;2203:	VectorCopy(origin, wp->goal.origin);
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2204
;2204:	VectorCopy(waypointmins, wp->goal.mins);
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 2205
;2205:	VectorCopy(waypointmaxs, wp->goal.maxs);
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 2206
;2206:	wp->goal.areanum = areanum;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 2207
;2207:	wp->next = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
CNSTP4 0
ASGNP4
line 2208
;2208:	wp->prev = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
CNSTP4 0
ASGNP4
line 2209
;2209:	return wp;
ADDRLP4 0
INDIRP4
RETP4
LABELV $531
endproc BotCreateWayPoint 32 12
export BotFindWayPoint
proc BotFindWayPoint 8 8
line 2217
;2210:}
;2211:
;2212:/*
;2213:==================
;2214:BotFindWayPoint
;2215:==================
;2216:*/
;2217:bot_waypoint_t *BotFindWayPoint(bot_waypoint_t *waypoints, char *name) {
line 2220
;2218:	bot_waypoint_t *wp;
;2219:
;2220:	for (wp = waypoints; wp; wp = wp->next) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $541
JUMPV
LABELV $538
line 2221
;2221:		if (!Q_stricmp(wp->name, name)) return wp;
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
NEI4 $542
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $537
JUMPV
LABELV $542
line 2222
;2222:	}
LABELV $539
line 2220
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ASGNP4
LABELV $541
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $538
line 2223
;2223:	return NULL;
CNSTP4 0
RETP4
LABELV $537
endproc BotFindWayPoint 8 8
export BotFreeWaypoints
proc BotFreeWaypoints 4 0
line 2231
;2224:}
;2225:
;2226:/*
;2227:==================
;2228:BotFreeWaypoints
;2229:==================
;2230:*/
;2231:void BotFreeWaypoints(bot_waypoint_t *wp) {
line 2234
;2232:	bot_waypoint_t *nextwp;
;2233:
;2234:	for (; wp; wp = nextwp) {
ADDRGP4 $548
JUMPV
LABELV $545
line 2235
;2235:		nextwp = wp->next;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ASGNP4
line 2236
;2236:		wp->next = botai_freewaypoints;
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRGP4 botai_freewaypoints
INDIRP4
ASGNP4
line 2237
;2237:		botai_freewaypoints = wp;
ADDRGP4 botai_freewaypoints
ADDRFP4 0
INDIRP4
ASGNP4
line 2238
;2238:	}
LABELV $546
line 2234
ADDRFP4 0
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $548
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $545
line 2239
;2239:}
LABELV $544
endproc BotFreeWaypoints 4 0
export BotInitWaypoints
proc BotInitWaypoints 4 0
line 2246
;2240:
;2241:/*
;2242:==================
;2243:BotInitWaypoints
;2244:==================
;2245:*/
;2246:void BotInitWaypoints(void) {
line 2249
;2247:	int i;
;2248:
;2249:	botai_freewaypoints = NULL;
ADDRGP4 botai_freewaypoints
CNSTP4 0
ASGNP4
line 2250
;2250:	for (i = 0; i < MAX_WAYPOINTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $550
line 2251
;2251:		botai_waypoints[i].next = botai_freewaypoints;
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botai_waypoints+92
ADDP4
ADDRGP4 botai_freewaypoints
INDIRP4
ASGNP4
line 2252
;2252:		botai_freewaypoints = &botai_waypoints[i];
ADDRGP4 botai_freewaypoints
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botai_waypoints
ADDP4
ASGNP4
line 2253
;2253:	}
LABELV $551
line 2250
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 128
LTI4 $550
line 2254
;2254:}
LABELV $549
endproc BotInitWaypoints 4 0
export TeamPlayIsOn
proc TeamPlayIsOn 4 0
line 2261
;2255:
;2256:/*
;2257:==================
;2258:TeamPlayIsOn
;2259:==================
;2260:*/
;2261:int TeamPlayIsOn(void) {
line 2262
;2262:	return ( gametype >= GT_TEAM );
ADDRGP4 gametype
INDIRI4
CNSTI4 3
LTI4 $557
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $558
JUMPV
LABELV $557
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $558
ADDRLP4 0
INDIRI4
RETI4
LABELV $555
endproc TeamPlayIsOn 4 0
export BotAggression
proc BotAggression 28 0
line 2270
;2263:}
;2264:
;2265:/*
;2266:==================
;2267:BotAggression
;2268:==================
;2269:*/
;2270:float BotAggression(bot_state_t *bs) {
line 2272
;2271:	//if the bot has quad
;2272:	if (bs->inventory[INVENTORY_QUAD]) {
ADDRFP4 0
INDIRP4
CNSTI4 5092
ADDP4
INDIRI4
CNSTI4 0
EQI4 $560
line 2274
;2273:		//if the bot is not holding the gauntlet or the enemy is really nearby
;2274:		if (bs->weaponnum != WP_GAUNTLET ||
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
NEI4 $564
ADDRLP4 0
INDIRP4
CNSTI4 5752
ADDP4
INDIRI4
CNSTI4 80
GEI4 $562
LABELV $564
line 2275
;2275:			bs->inventory[ENEMY_HORIZONTAL_DIST] < 80) {
line 2276
;2276:			return 70;
CNSTF4 1116471296
RETF4
ADDRGP4 $559
JUMPV
LABELV $562
line 2278
;2277:		}
;2278:	}
LABELV $560
line 2280
;2279:	//if the enemy is located way higher than the bot
;2280:	if (bs->inventory[ENEMY_HEIGHT] > 200) return 0;
ADDRFP4 0
INDIRP4
CNSTI4 5756
ADDP4
INDIRI4
CNSTI4 200
LEI4 $565
CNSTF4 0
RETF4
ADDRGP4 $559
JUMPV
LABELV $565
line 2282
;2281:	//if the bot is very low on health
;2282:	if (bs->inventory[INVENTORY_HEALTH] < 60) return 0;
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $567
CNSTF4 0
RETF4
ADDRGP4 $559
JUMPV
LABELV $567
line 2284
;2283:	//if the bot is low on health
;2284:	if (bs->inventory[INVENTORY_HEALTH] < 80) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 80
GEI4 $569
line 2286
;2285:		//if the bot has insufficient armor
;2286:		if (bs->inventory[INVENTORY_ARMOR] < 40) return 0;
ADDRFP4 0
INDIRP4
CNSTI4 4956
ADDP4
INDIRI4
CNSTI4 40
GEI4 $571
CNSTF4 0
RETF4
ADDRGP4 $559
JUMPV
LABELV $571
line 2287
;2287:	}
LABELV $569
line 2289
;2288:	//if the bot can use the bfg
;2289:	if (bs->inventory[INVENTORY_BFG10K] > 0 &&
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
LEI4 $573
ADDRLP4 0
INDIRP4
CNSTI4 5052
ADDP4
INDIRI4
CNSTI4 7
LEI4 $573
line 2290
;2290:			bs->inventory[INVENTORY_BFGAMMO] > 7) return 100;
CNSTF4 1120403456
RETF4
ADDRGP4 $559
JUMPV
LABELV $573
line 2292
;2291:	//if the bot can use the railgun
;2292:	if (bs->inventory[INVENTORY_RAILGUN] > 0 &&
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
LEI4 $575
ADDRLP4 4
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
CNSTI4 5
LEI4 $575
line 2293
;2293:			bs->inventory[INVENTORY_SLUGS] > 5) return 95;
CNSTF4 1119748096
RETF4
ADDRGP4 $559
JUMPV
LABELV $575
line 2295
;2294:	//if the bot can use the lightning gun
;2295:	if (bs->inventory[INVENTORY_LIGHTNING] > 0 &&
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
LEI4 $577
ADDRLP4 8
INDIRP4
CNSTI4 5040
ADDP4
INDIRI4
CNSTI4 50
LEI4 $577
line 2296
;2296:			bs->inventory[INVENTORY_LIGHTNINGAMMO] > 50) return 90;
CNSTF4 1119092736
RETF4
ADDRGP4 $559
JUMPV
LABELV $577
line 2298
;2297:	//if the bot can use the rocketlauncher
;2298:	if (bs->inventory[INVENTORY_ROCKETLAUNCHER] > 0 &&
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
LEI4 $579
ADDRLP4 12
INDIRP4
CNSTI4 5044
ADDP4
INDIRI4
CNSTI4 5
LEI4 $579
line 2299
;2299:			bs->inventory[INVENTORY_ROCKETS] > 5) return 90;
CNSTF4 1119092736
RETF4
ADDRGP4 $559
JUMPV
LABELV $579
line 2301
;2300:	//if the bot can use the plasmagun
;2301:	if (bs->inventory[INVENTORY_PLASMAGUN] > 0 &&
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
LEI4 $581
ADDRLP4 16
INDIRP4
CNSTI4 5036
ADDP4
INDIRI4
CNSTI4 40
LEI4 $581
line 2302
;2302:			bs->inventory[INVENTORY_CELLS] > 40) return 85;
CNSTF4 1118437376
RETF4
ADDRGP4 $559
JUMPV
LABELV $581
line 2304
;2303:	//if the bot can use the grenade launcher
;2304:	if (bs->inventory[INVENTORY_GRENADELAUNCHER] > 0 &&
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
LEI4 $583
ADDRLP4 20
INDIRP4
CNSTI4 5032
ADDP4
INDIRI4
CNSTI4 10
LEI4 $583
line 2305
;2305:			bs->inventory[INVENTORY_GRENADES] > 10) return 80;
CNSTF4 1117782016
RETF4
ADDRGP4 $559
JUMPV
LABELV $583
line 2307
;2306:	//if the bot can use the shotgun
;2307:	if (bs->inventory[INVENTORY_SHOTGUN] > 0 &&
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
LEI4 $585
ADDRLP4 24
INDIRP4
CNSTI4 5024
ADDP4
INDIRI4
CNSTI4 10
LEI4 $585
line 2308
;2308:			bs->inventory[INVENTORY_SHELLS] > 10) return 50;
CNSTF4 1112014848
RETF4
ADDRGP4 $559
JUMPV
LABELV $585
line 2310
;2309:	//otherwise the bot is not feeling too good
;2310:	return 0;
CNSTF4 0
RETF4
LABELV $559
endproc BotAggression 28 0
export BotFeelingBad
proc BotFeelingBad 0 0
line 2318
;2311:}
;2312:
;2313:/*
;2314:==================
;2315:BotFeelingBad
;2316:==================
;2317:*/
;2318:float BotFeelingBad(bot_state_t *bs) {
line 2320
;2319:
;2320:	if (g_instagib.integer == 0) {  // Shafe - Grrr... Instagib
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 0
NEI4 $588
line 2322
;2321:	
;2322:		if (bs->weaponnum == WP_GAUNTLET) {
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
CNSTI4 1
NEI4 $591
line 2323
;2323:			return 100;
CNSTF4 1120403456
RETF4
ADDRGP4 $587
JUMPV
LABELV $591
line 2325
;2324:		}
;2325:		if (bs->inventory[INVENTORY_HEALTH] < 40) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 40
GEI4 $593
line 2326
;2326:			return 100;
CNSTF4 1120403456
RETF4
ADDRGP4 $587
JUMPV
LABELV $593
line 2328
;2327:		}
;2328:		if (bs->weaponnum == WP_MACHINEGUN) {
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
CNSTI4 2
NEI4 $595
line 2329
;2329:			return 90;
CNSTF4 1119092736
RETF4
ADDRGP4 $587
JUMPV
LABELV $595
line 2331
;2330:		}
;2331:		if (bs->inventory[INVENTORY_HEALTH] < 60) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $597
line 2332
;2332:			return 80;
CNSTF4 1117782016
RETF4
ADDRGP4 $587
JUMPV
LABELV $597
line 2334
;2333:		}
;2334:	} // End Shafe
LABELV $588
line 2335
;2335:	return 0;
CNSTF4 0
RETF4
LABELV $587
endproc BotFeelingBad 0 0
export BotWantsToRetreat
proc BotWantsToRetreat 144 8
line 2343
;2336:}
;2337:
;2338:/*
;2339:==================
;2340:BotWantsToRetreat
;2341:==================
;2342:*/
;2343:int BotWantsToRetreat(bot_state_t *bs) {
line 2346
;2344:	aas_entityinfo_t entinfo;
;2345:
;2346:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $600
line 2348
;2347:		//always retreat when carrying a CTF flag
;2348:		if (BotCTFCarryingFlag(bs))
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
EQI4 $602
line 2349
;2349:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $599
JUMPV
LABELV $602
line 2350
;2350:	}
LABELV $600
line 2376
;2351:#ifdef MISSIONPACK
;2352:	else if (gametype == GT_1FCTF) {
;2353:		//if carrying the flag then always retreat
;2354:		if (Bot1FCTFCarryingFlag(bs))
;2355:			return qtrue;
;2356:	}
;2357:	else if (gametype == GT_OBELISK) {
;2358:		//the bots should be dedicated to attacking the enemy obelisk
;2359:		if (bs->ltgtype == LTG_ATTACKENEMYBASE) {
;2360:			if (bs->enemy != redobelisk.entitynum ||
;2361:						bs->enemy != blueobelisk.entitynum) {
;2362:				return qtrue;
;2363:			}
;2364:		}
;2365:		if (BotFeelingBad(bs) > 50) {
;2366:			return qtrue;
;2367:		}
;2368:		return qfalse;
;2369:	}
;2370:	else if (gametype == GT_HARVESTER) {
;2371:		//if carrying cubes then always retreat
;2372:		if (BotHarvesterCarryingCubes(bs)) return qtrue;
;2373:	}
;2374:#endif
;2375:	//
;2376:	if (bs->enemy >= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 0
LTI4 $604
line 2378
;2377:		//if the enemy is carrying a flag
;2378:		BotEntityInfo(bs->enemy, &entinfo);
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
line 2379
;2379:		if (EntityCarriesFlag(&entinfo))
ADDRLP4 0
ARGP4
ADDRLP4 140
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $606
line 2380
;2380:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $599
JUMPV
LABELV $606
line 2381
;2381:	}
LABELV $604
line 2383
;2382:	//if the bot is getting the flag
;2383:	if (bs->ltgtype == LTG_GETFLAG)
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
NEI4 $608
line 2384
;2384:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $599
JUMPV
LABELV $608
line 2386
;2385:	//
;2386:	if (BotAggression(bs) < 50)
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
GEF4 $610
line 2387
;2387:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $599
JUMPV
LABELV $610
line 2388
;2388:	return qfalse;
CNSTI4 0
RETI4
LABELV $599
endproc BotWantsToRetreat 144 8
export BotWantsToChase
proc BotWantsToChase 148 8
line 2396
;2389:}
;2390:
;2391:/*
;2392:==================
;2393:BotWantsToChase
;2394:==================
;2395:*/
;2396:int BotWantsToChase(bot_state_t *bs) {
line 2399
;2397:	aas_entityinfo_t entinfo;
;2398:
;2399:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $613
line 2401
;2400:		//never chase when carrying a CTF flag
;2401:		if (BotCTFCarryingFlag(bs))
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
EQI4 $615
line 2402
;2402:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $612
JUMPV
LABELV $615
line 2404
;2403:		//always chase if the enemy is carrying a flag
;2404:		BotEntityInfo(bs->enemy, &entinfo);
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
line 2405
;2405:		if (EntityCarriesFlag(&entinfo))
ADDRLP4 0
ARGP4
ADDRLP4 144
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $617
line 2406
;2406:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $612
JUMPV
LABELV $617
line 2407
;2407:	}
LABELV $613
line 2434
;2408:#ifdef MISSIONPACK
;2409:	else if (gametype == GT_1FCTF) {
;2410:		//never chase if carrying the flag
;2411:		if (Bot1FCTFCarryingFlag(bs))
;2412:			return qfalse;
;2413:		//always chase if the enemy is carrying a flag
;2414:		BotEntityInfo(bs->enemy, &entinfo);
;2415:		if (EntityCarriesFlag(&entinfo))
;2416:			return qtrue;
;2417:	}
;2418:	else if (gametype == GT_OBELISK) {
;2419:		//the bots should be dedicated to attacking the enemy obelisk
;2420:		if (bs->ltgtype == LTG_ATTACKENEMYBASE) {
;2421:			if (bs->enemy != redobelisk.entitynum ||
;2422:						bs->enemy != blueobelisk.entitynum) {
;2423:				return qfalse;
;2424:			}
;2425:		}
;2426:	}
;2427:	else if (gametype == GT_HARVESTER) {
;2428:		//never chase if carrying cubes
;2429:		if (BotHarvesterCarryingCubes(bs))
;2430:			return qfalse;
;2431:	}
;2432:#endif
;2433:	//if the bot is getting the flag
;2434:	if (bs->ltgtype == LTG_GETFLAG)
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
NEI4 $619
line 2435
;2435:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $612
JUMPV
LABELV $619
line 2437
;2436:	//
;2437:	if (BotAggression(bs) > 50)
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
LEF4 $621
line 2438
;2438:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $612
JUMPV
LABELV $621
line 2439
;2439:	return qfalse;
CNSTI4 0
RETI4
LABELV $612
endproc BotWantsToChase 148 8
export BotWantsToHelp
proc BotWantsToHelp 0 0
line 2447
;2440:}
;2441:
;2442:/*
;2443:==================
;2444:BotWantsToHelp
;2445:==================
;2446:*/
;2447:int BotWantsToHelp(bot_state_t *bs) {
line 2448
;2448:	return qtrue;
CNSTI4 1
RETI4
LABELV $623
endproc BotWantsToHelp 0 0
export BotCanAndWantsToRocketJump
proc BotCanAndWantsToRocketJump 8 16
line 2456
;2449:}
;2450:
;2451:/*
;2452:==================
;2453:BotCanAndWantsToRocketJump
;2454:==================
;2455:*/
;2456:int BotCanAndWantsToRocketJump(bot_state_t *bs) {
line 2460
;2457:	float rocketjumper;
;2458:
;2459:	//if rocket jumping is disabled
;2460:	if (!bot_rocketjump.integer) return qfalse;
ADDRGP4 bot_rocketjump+12
INDIRI4
CNSTI4 0
NEI4 $625
CNSTI4 0
RETI4
ADDRGP4 $624
JUMPV
LABELV $625
line 2463
;2461:	
;2462:	//if no rocket launcher
;2463:	if (bs->inventory[INVENTORY_ROCKETLAUNCHER] <= 0) 
ADDRFP4 0
INDIRP4
CNSTI4 4984
ADDP4
INDIRI4
CNSTI4 0
GTI4 $628
line 2464
;2464:	{
line 2466
;2465:		// Try Grenade here
;2466:		if (bs->inventory[INVENTORY_GRENADELAUNCHER] <= 0) 
ADDRFP4 0
INDIRP4
CNSTI4 4980
ADDP4
INDIRI4
CNSTI4 0
GTI4 $629
line 2467
;2467:		{
line 2468
;2468:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $624
JUMPV
line 2470
;2469:		}
;2470:	} 
LABELV $628
line 2472
;2471:	else 
;2472:	{
line 2474
;2473:		//if low on rockets
;2474:		if (bs->inventory[INVENTORY_ROCKETS] < 2) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 5044
ADDP4
INDIRI4
CNSTI4 2
GEI4 $632
CNSTI4 0
RETI4
ADDRGP4 $624
JUMPV
LABELV $632
line 2475
;2475:	}
LABELV $629
line 2479
;2476:	
;2477:	
;2478:	//never rocket jump with the Quad
;2479:	if (bs->inventory[INVENTORY_QUAD]) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 5092
ADDP4
INDIRI4
CNSTI4 0
EQI4 $634
CNSTI4 0
RETI4
ADDRGP4 $624
JUMPV
LABELV $634
line 2481
;2480:	//if low on health
;2481:	if (bs->inventory[INVENTORY_HEALTH] < 60) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $636
CNSTI4 0
RETI4
ADDRGP4 $624
JUMPV
LABELV $636
line 2483
;2482:	//if not full health
;2483:	if (bs->inventory[INVENTORY_HEALTH] < 70) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 70
GEI4 $638
line 2485
;2484:		//if the bot has insufficient armor
;2485:		if (bs->inventory[INVENTORY_ARMOR] < 10) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 4956
ADDP4
INDIRI4
CNSTI4 10
GEI4 $640
CNSTI4 0
RETI4
ADDRGP4 $624
JUMPV
LABELV $640
line 2486
;2486:	}
LABELV $638
line 2487
;2487:	rocketjumper = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_WEAPONJUMPING, 0, 1);
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
line 2488
;2488:	if (rocketjumper < 0.5) return qfalse;
ADDRLP4 0
INDIRF4
CNSTF4 1056964608
GEF4 $642
CNSTI4 0
RETI4
ADDRGP4 $624
JUMPV
LABELV $642
line 2489
;2489:	return qtrue;
CNSTI4 1
RETI4
LABELV $624
endproc BotCanAndWantsToRocketJump 8 16
export BotHasPersistantPowerupAndWeapon
proc BotHasPersistantPowerupAndWeapon 32 0
line 2497
;2490:}
;2491:
;2492:/*
;2493:==================
;2494:BotHasPersistantPowerupAndWeapon
;2495:==================
;2496:*/
;2497:int BotHasPersistantPowerupAndWeapon(bot_state_t *bs) {
line 2508
;2498:#ifdef MISSIONPACK
;2499:	// if the bot does not have a persistant powerup
;2500:	if (!bs->inventory[INVENTORY_SCOUT] &&
;2501:		!bs->inventory[INVENTORY_GUARD] &&
;2502:		!bs->inventory[INVENTORY_DOUBLER] &&
;2503:		!bs->inventory[INVENTORY_AMMOREGEN] ) {
;2504:		return qfalse;
;2505:	}
;2506:#endif
;2507:	//if the bot is very low on health
;2508:	if (bs->inventory[INVENTORY_HEALTH] < 60) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $645
CNSTI4 0
RETI4
ADDRGP4 $644
JUMPV
LABELV $645
line 2510
;2509:	//if the bot is low on health
;2510:	if (bs->inventory[INVENTORY_HEALTH] < 80) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 80
GEI4 $647
line 2512
;2511:		//if the bot has insufficient armor
;2512:		if (bs->inventory[INVENTORY_ARMOR] < 40) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 4956
ADDP4
INDIRI4
CNSTI4 40
GEI4 $649
CNSTI4 0
RETI4
ADDRGP4 $644
JUMPV
LABELV $649
line 2513
;2513:	}
LABELV $647
line 2515
;2514:	//if the bot can use the bfg
;2515:	if (bs->inventory[INVENTORY_BFG10K] > 0 &&
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
LEI4 $651
ADDRLP4 0
INDIRP4
CNSTI4 5052
ADDP4
INDIRI4
CNSTI4 7
LEI4 $651
line 2516
;2516:			bs->inventory[INVENTORY_BFGAMMO] > 7) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $644
JUMPV
LABELV $651
line 2518
;2517:	//if the bot can use the railgun
;2518:	if (bs->inventory[INVENTORY_RAILGUN] > 0 &&
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
LEI4 $653
ADDRLP4 4
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
CNSTI4 5
LEI4 $653
line 2519
;2519:			bs->inventory[INVENTORY_SLUGS] > 5) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $644
JUMPV
LABELV $653
line 2521
;2520:	//if the bot can use the lightning gun
;2521:	if (bs->inventory[INVENTORY_LIGHTNING] > 0 &&
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
LEI4 $655
ADDRLP4 8
INDIRP4
CNSTI4 5040
ADDP4
INDIRI4
CNSTI4 50
LEI4 $655
line 2522
;2522:			bs->inventory[INVENTORY_LIGHTNINGAMMO] > 50) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $644
JUMPV
LABELV $655
line 2524
;2523:	//if the bot can use the rocketlauncher
;2524:	if (bs->inventory[INVENTORY_ROCKETLAUNCHER] > 0 &&
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
LEI4 $657
ADDRLP4 12
INDIRP4
CNSTI4 5044
ADDP4
INDIRI4
CNSTI4 5
LEI4 $657
line 2525
;2525:			bs->inventory[INVENTORY_ROCKETS] > 5) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $644
JUMPV
LABELV $657
line 2527
;2526:	//
;2527:	if (bs->inventory[INVENTORY_NAILGUN] > 0 &&
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
LEI4 $659
ADDRLP4 16
INDIRP4
CNSTI4 5056
ADDP4
INDIRI4
CNSTI4 5
LEI4 $659
line 2528
;2528:			bs->inventory[INVENTORY_NAILS] > 5) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $644
JUMPV
LABELV $659
line 2530
;2529:	//
;2530:	if (bs->inventory[INVENTORY_PROXLAUNCHER] > 0 &&
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
LEI4 $661
ADDRLP4 20
INDIRP4
CNSTI4 5060
ADDP4
INDIRI4
CNSTI4 5
LEI4 $661
line 2531
;2531:			bs->inventory[INVENTORY_MINES] > 5) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $644
JUMPV
LABELV $661
line 2533
;2532:	//
;2533:	if (bs->inventory[INVENTORY_CHAINGUN] > 0 &&
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
LEI4 $663
ADDRLP4 24
INDIRP4
CNSTI4 5064
ADDP4
INDIRI4
CNSTI4 40
LEI4 $663
line 2534
;2534:			bs->inventory[INVENTORY_BELT] > 40) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $644
JUMPV
LABELV $663
line 2536
;2535:	//if the bot can use the plasmagun
;2536:	if (bs->inventory[INVENTORY_PLASMAGUN] > 0 &&
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
LEI4 $665
ADDRLP4 28
INDIRP4
CNSTI4 5036
ADDP4
INDIRI4
CNSTI4 20
LEI4 $665
line 2537
;2537:			bs->inventory[INVENTORY_CELLS] > 20) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $644
JUMPV
LABELV $665
line 2538
;2538:	return qfalse;
CNSTI4 0
RETI4
LABELV $644
endproc BotHasPersistantPowerupAndWeapon 32 0
export BotGoCamp
proc BotGoCamp 16 16
line 2546
;2539:}
;2540:
;2541:/*
;2542:==================
;2543:BotGoCamp
;2544:==================
;2545:*/
;2546:void BotGoCamp(bot_state_t *bs, bot_goal_t *goal) {
line 2549
;2547:	float camper;
;2548:
;2549:	bs->decisionmaker = bs->client;
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
line 2551
;2550:	//set message time to zero so bot will NOT show any message
;2551:	bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 2553
;2552:	//set the ltg type
;2553:	bs->ltgtype = LTG_CAMP;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 7
ASGNI4
line 2555
;2554:	//set the team goal
;2555:	memcpy(&bs->teamgoal, goal, sizeof(bot_goal_t));
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
line 2557
;2556:	//get the team goal time
;2557:	camper = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CAMPER, 0, 1);
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
line 2558
;2558:	if (camper > 0.99) bs->teamgoal_time = FloatTime() + 99999;
ADDRLP4 0
INDIRF4
CNSTF4 1065185444
LEF4 $668
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1203982208
ADDF4
ASGNF4
ADDRGP4 $669
JUMPV
LABELV $668
line 2559
;2559:	else bs->teamgoal_time = FloatTime() + 120 + 180 * camper + random() * 15;
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
LABELV $669
line 2561
;2560:	//set the last time the bot started camping
;2561:	bs->camp_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6184
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2563
;2562:	//the teammate that requested the camping
;2563:	bs->teammate = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
CNSTI4 0
ASGNI4
line 2565
;2564:	//do NOT type arrive message
;2565:	bs->arrive_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
CNSTF4 1065353216
ASGNF4
line 2566
;2566:}
LABELV $667
endproc BotGoCamp 16 16
export BotWantsToCamp
proc BotWantsToCamp 176 16
line 2573
;2567:
;2568:/*
;2569:==================
;2570:BotWantsToCamp
;2571:==================
;2572:*/
;2573:int BotWantsToCamp(bot_state_t *bs) {
line 2578
;2574:	float camper;
;2575:	int cs, traveltime, besttraveltime;
;2576:	bot_goal_t goal, bestgoal;
;2577:
;2578:	camper = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CAMPER, 0, 1);
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
line 2579
;2579:	if (camper < 0.1) return qfalse;
ADDRLP4 124
INDIRF4
CNSTF4 1036831949
GEF4 $671
CNSTI4 0
RETI4
ADDRGP4 $670
JUMPV
LABELV $671
line 2581
;2580:	//if the bot has a team goal
;2581:	if (bs->ltgtype == LTG_TEAMHELP ||
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
EQI4 $681
ADDRLP4 132
INDIRI4
CNSTI4 2
EQI4 $681
ADDRLP4 132
INDIRI4
CNSTI4 3
EQI4 $681
ADDRLP4 132
INDIRI4
CNSTI4 4
EQI4 $681
ADDRLP4 132
INDIRI4
CNSTI4 5
EQI4 $681
ADDRLP4 132
INDIRI4
CNSTI4 7
EQI4 $681
ADDRLP4 132
INDIRI4
CNSTI4 8
EQI4 $681
ADDRLP4 132
INDIRI4
CNSTI4 9
NEI4 $673
LABELV $681
line 2588
;2582:			bs->ltgtype == LTG_TEAMACCOMPANY ||
;2583:			bs->ltgtype == LTG_DEFENDKEYAREA ||
;2584:			bs->ltgtype == LTG_GETFLAG ||
;2585:			bs->ltgtype == LTG_RUSHBASE ||
;2586:			bs->ltgtype == LTG_CAMP ||
;2587:			bs->ltgtype == LTG_CAMPORDER ||
;2588:			bs->ltgtype == LTG_PATROL) {
line 2589
;2589:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $670
JUMPV
LABELV $673
line 2592
;2590:	}
;2591:	//if camped recently
;2592:	if (bs->camp_time > FloatTime() - 60 + 300 * (1-camper)) return qfalse;
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
LEF4 $682
CNSTI4 0
RETI4
ADDRGP4 $670
JUMPV
LABELV $682
line 2594
;2593:	//
;2594:	if (random() > camper) {
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
LEF4 $684
line 2595
;2595:		bs->camp_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6184
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2596
;2596:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $670
JUMPV
LABELV $684
line 2599
;2597:	}
;2598:	//if the bot isn't healthy anough
;2599:	if (BotAggression(bs) < 50) return qfalse;
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
GEF4 $686
CNSTI4 0
RETI4
ADDRGP4 $670
JUMPV
LABELV $686
line 2601
;2600:	//the bot should have at least have the rocket launcher, the railgun or the bfg10k with some ammo
;2601:	if ((bs->inventory[INVENTORY_ROCKETLAUNCHER] <= 0 || bs->inventory[INVENTORY_ROCKETS < 10]) &&
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
LEI4 $690
ADDRLP4 144
INDIRP4
CNSTI4 4952
ADDP4
INDIRI4
ADDRLP4 148
INDIRI4
EQI4 $688
LABELV $690
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
LEI4 $691
ADDRLP4 152
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
CNSTI4 10
GEI4 $688
LABELV $691
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
LEI4 $692
ADDRLP4 156
INDIRP4
CNSTI4 5052
ADDP4
INDIRI4
CNSTI4 10
GEI4 $688
LABELV $692
line 2603
;2602:		(bs->inventory[INVENTORY_RAILGUN] <= 0 || bs->inventory[INVENTORY_SLUGS] < 10) &&
;2603:		(bs->inventory[INVENTORY_BFG10K] <= 0 || bs->inventory[INVENTORY_BFGAMMO] < 10)) {
line 2604
;2604:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $670
JUMPV
LABELV $688
line 2607
;2605:	}
;2606:	//find the closest camp spot
;2607:	besttraveltime = 99999;
ADDRLP4 64
CNSTI4 99999
ASGNI4
line 2608
;2608:	for (cs = trap_BotGetNextCampSpotGoal(0, &goal); cs; cs = trap_BotGetNextCampSpotGoal(cs, &goal)) {
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
ADDRGP4 $696
JUMPV
LABELV $693
line 2609
;2609:		traveltime = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, goal.areanum, TFL_DEFAULT);
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
line 2610
;2610:		if (traveltime && traveltime < besttraveltime) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $698
ADDRLP4 0
INDIRI4
ADDRLP4 64
INDIRI4
GEI4 $698
line 2611
;2611:			besttraveltime = traveltime;
ADDRLP4 64
ADDRLP4 0
INDIRI4
ASGNI4
line 2612
;2612:			memcpy(&bestgoal, &goal, sizeof(bot_goal_t));
ADDRLP4 68
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2613
;2613:		}
LABELV $698
line 2614
;2614:	}
LABELV $694
line 2608
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
LABELV $696
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $693
line 2615
;2615:	if (besttraveltime > 150) return qfalse;
ADDRLP4 64
INDIRI4
CNSTI4 150
LEI4 $700
CNSTI4 0
RETI4
ADDRGP4 $670
JUMPV
LABELV $700
line 2617
;2616:	//ok found a camp spot, go camp there
;2617:	BotGoCamp(bs, &bestgoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 BotGoCamp
CALLV
pop
line 2618
;2618:	bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 2620
;2619:	//
;2620:	return qtrue;
CNSTI4 1
RETI4
LABELV $670
endproc BotWantsToCamp 176 16
export BotDontAvoid
proc BotDontAvoid 68 12
line 2628
;2621:}
;2622:
;2623:/*
;2624:==================
;2625:BotDontAvoid
;2626:==================
;2627:*/
;2628:void BotDontAvoid(bot_state_t *bs, char *itemname) {
line 2632
;2629:	bot_goal_t goal;
;2630:	int num;
;2631:
;2632:	num = trap_BotGetLevelItemGoal(-1, itemname, &goal);
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
ADDRGP4 $704
JUMPV
LABELV $703
line 2633
;2633:	while(num >= 0) {
line 2634
;2634:		trap_BotRemoveFromAvoidGoals(bs->gs, goal.number);
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
line 2635
;2635:		num = trap_BotGetLevelItemGoal(num, itemname, &goal);
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
line 2636
;2636:	}
LABELV $704
line 2633
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $703
line 2637
;2637:}
LABELV $702
endproc BotDontAvoid 68 12
export BotGoForPowerups
proc BotGoForPowerups 0 8
line 2644
;2638:
;2639:/*
;2640:==================
;2641:BotGoForPowerups
;2642:==================
;2643:*/
;2644:void BotGoForPowerups(bot_state_t *bs) {
line 2647
;2645:
;2646:	//don't avoid any of the powerups anymore
;2647:	BotDontAvoid(bs, "Quad Damage");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $708
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2648
;2648:	BotDontAvoid(bs, "Regeneration");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $709
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2649
;2649:	BotDontAvoid(bs, "Battle Suit");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $710
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2650
;2650:	BotDontAvoid(bs, "Speed");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $711
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2651
;2651:	BotDontAvoid(bs, "Invisibility");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $712
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2652
;2652:	BotDontAvoid(bs, "Flight"); // Not sure about this one
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $713
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2655
;2653:	//reset the long term goal time so the bot will go for the powerup
;2654:	//NOTE: the long term goal type doesn't change
;2655:	bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6068
ADDP4
CNSTF4 0
ASGNF4
line 2656
;2656:}
LABELV $707
endproc BotGoForPowerups 0 8
export BotRoamGoal
proc BotRoamGoal 180 28
line 2663
;2657:
;2658:/*
;2659:==================
;2660:BotRoamGoal
;2661:==================
;2662:*/
;2663:void BotRoamGoal(bot_state_t *bs, vec3_t goal) {
line 2669
;2664:	int pc, i;
;2665:	float len, rnd;
;2666:	vec3_t dir, bestorg, belowbestorg;
;2667:	bsp_trace_t trace;
;2668:
;2669:	for (i = 0; i < 10; i++) {
ADDRLP4 116
CNSTI4 0
ASGNI4
LABELV $715
line 2671
;2670:		//start at the bot origin
;2671:		VectorCopy(bs->origin, bestorg);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 2672
;2672:		rnd = random();
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
line 2673
;2673:		if (rnd > 0.25) {
ADDRLP4 112
INDIRF4
CNSTF4 1048576000
LEF4 $719
line 2675
;2674:			//add a random value to the x-coordinate
;2675:			if (random() < 0.5) bestorg[0] -= 800 * random() + 100;
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
GEF4 $721
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
ADDRGP4 $722
JUMPV
LABELV $721
line 2676
;2676:			else bestorg[0] += 800 * random() + 100;
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
LABELV $722
line 2677
;2677:		}
LABELV $719
line 2678
;2678:		if (rnd < 0.75) {
ADDRLP4 112
INDIRF4
CNSTF4 1061158912
GEF4 $723
line 2680
;2679:			//add a random value to the y-coordinate
;2680:			if (random() < 0.5) bestorg[1] -= 800 * random() + 100;
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
GEF4 $725
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
ADDRGP4 $726
JUMPV
LABELV $725
line 2681
;2681:			else bestorg[1] += 800 * random() + 100;
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
LABELV $726
line 2682
;2682:		}
LABELV $723
line 2684
;2683:		//add a random value to the z-coordinate (NOTE: 48 = maxjump?)
;2684:		bestorg[2] += 2 * 48 * crandom();
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
line 2686
;2685:		//trace a line from the origin to the roam target
;2686:		BotAI_Trace(&trace, bs->origin, NULL, NULL, bestorg, bs->entitynum, MASK_SOLID);
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
line 2688
;2687:		//direction and length towards the roam target
;2688:		VectorSubtract(trace.endpos, bs->origin, dir);
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
line 2689
;2689:		len = VectorNormalize(dir);
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
line 2691
;2690:		//if the roam target is far away anough
;2691:		if (len > 200) {
ADDRLP4 108
INDIRF4
CNSTF4 1128792064
LEF4 $737
line 2693
;2692:			//the roam target is in the given direction before walls
;2693:			VectorScale(dir, len * trace.fraction - 40, dir);
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
line 2694
;2694:			VectorAdd(bs->origin, dir, bestorg);
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
line 2696
;2695:			//get the coordinates of the floor below the roam target
;2696:			belowbestorg[0] = bestorg[0];
ADDRLP4 120
ADDRLP4 12
INDIRF4
ASGNF4
line 2697
;2697:			belowbestorg[1] = bestorg[1];
ADDRLP4 120+4
ADDRLP4 12+4
INDIRF4
ASGNF4
line 2698
;2698:			belowbestorg[2] = bestorg[2] - 800;
ADDRLP4 120+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1145569280
SUBF4
ASGNF4
line 2699
;2699:			BotAI_Trace(&trace, bestorg, NULL, NULL, belowbestorg, bs->entitynum, MASK_SOLID);
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
line 2701
;2700:			//
;2701:			if (!trace.startsolid) {
ADDRLP4 24+4
INDIRI4
CNSTI4 0
NEI4 $754
line 2702
;2702:				trace.endpos[2]++;
ADDRLP4 24+12+8
ADDRLP4 24+12+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2703
;2703:				pc = trap_PointContents(trace.endpos, bs->entitynum);
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
line 2704
;2704:				if (!(pc & (CONTENTS_LAVA | CONTENTS_SLIME))) {
ADDRLP4 132
INDIRI4
CNSTI4 24
BANDI4
CNSTI4 0
NEI4 $760
line 2705
;2705:					VectorCopy(bestorg, goal);
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRB
ASGNB 12
line 2706
;2706:					return;
ADDRGP4 $714
JUMPV
LABELV $760
line 2708
;2707:				}
;2708:			}
LABELV $754
line 2709
;2709:		}
LABELV $737
line 2710
;2710:	}
LABELV $716
line 2669
ADDRLP4 116
ADDRLP4 116
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 10
LTI4 $715
line 2711
;2711:	VectorCopy(bestorg, goal);
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRB
ASGNB 12
line 2712
;2712:}
LABELV $714
endproc BotRoamGoal 180 28
lit
align 4
LABELV $764
byte 4 0
byte 4 0
byte 4 1065353216
export BotAttackMove
code
proc BotAttackMove 392 16
line 2719
;2713:
;2714:/*
;2715:==================
;2716:BotAttackMove
;2717:==================
;2718:*/
;2719:bot_moveresult_t BotAttackMove(bot_state_t *bs, int tfl) {
line 2723
;2720:	int movetype, i, attackentity;
;2721:	float attack_skill, jumper, croucher, dist, strafechange_time;
;2722:	float attack_dist, attack_range;
;2723:	vec3_t forward, backward, sideward, hordir, up = {0, 0, 1};
ADDRLP4 56
ADDRGP4 $764
INDIRB
ASGNB 12
line 2728
;2724:	aas_entityinfo_t entinfo;
;2725:	bot_moveresult_t moveresult;
;2726:	bot_goal_t goal;
;2727:
;2728:	attackentity = bs->enemy;
ADDRLP4 332
ADDRFP4 4
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ASGNI4
line 2730
;2729:	//
;2730:	if (bs->attackchase_time > FloatTime()) {
ADDRFP4 4
INDIRP4
CNSTI4 6124
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $765
line 2732
;2731:		//create the chase goal
;2732:		goal.entitynum = attackentity;
ADDRLP4 136+40
ADDRLP4 332
INDIRI4
ASGNI4
line 2733
;2733:		goal.areanum = bs->lastenemyareanum;
ADDRLP4 136+12
ADDRFP4 4
INDIRP4
CNSTI4 6544
ADDP4
INDIRI4
ASGNI4
line 2734
;2734:		VectorCopy(bs->lastenemyorigin, goal.origin);
ADDRLP4 136
ADDRFP4 4
INDIRP4
CNSTI4 6548
ADDP4
INDIRB
ASGNB 12
line 2735
;2735:		VectorSet(goal.mins, -8, -8, -8);
ADDRLP4 136+16
CNSTF4 3238002688
ASGNF4
ADDRLP4 136+16+4
CNSTF4 3238002688
ASGNF4
ADDRLP4 136+16+8
CNSTF4 3238002688
ASGNF4
line 2736
;2736:		VectorSet(goal.maxs, 8, 8, 8);
ADDRLP4 136+28
CNSTF4 1090519040
ASGNF4
ADDRLP4 136+28+4
CNSTF4 1090519040
ASGNF4
ADDRLP4 136+28+8
CNSTF4 1090519040
ASGNF4
line 2738
;2737:		//initialize the movement state
;2738:		BotSetupForMovement(bs);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 2740
;2739:		//move towards the goal
;2740:		trap_BotMoveToGoal(&moveresult, bs->ms, &goal, tfl);
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
line 2741
;2741:		return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $762
JUMPV
LABELV $765
line 2744
;2742:	}
;2743:	//
;2744:	memset(&moveresult, 0, sizeof(bot_moveresult_t));
ADDRLP4 80
ARGP4
CNSTI4 0
ARGI4
CNSTI4 52
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2746
;2745:	//
;2746:	attack_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_ATTACK_SKILL, 0, 1);
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
line 2747
;2747:	jumper = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_JUMPER, 0, 1);
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
line 2748
;2748:	croucher = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CROUCHER, 0, 1);
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
line 2750
;2749:	//if the bot is really stupid
;2750:	if (attack_skill < 0.2) return moveresult;
ADDRLP4 132
INDIRF4
CNSTF4 1045220557
GEF4 $779
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $762
JUMPV
LABELV $779
line 2752
;2751:	//initialize the movement state
;2752:	BotSetupForMovement(bs);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 2754
;2753:	//get the enemy entity info
;2754:	BotEntityInfo(attackentity, &entinfo);
ADDRLP4 332
INDIRI4
ARGI4
ADDRLP4 192
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2756
;2755:	//direction towards the enemy
;2756:	VectorSubtract(entinfo.origin, bs->origin, forward);
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
line 2758
;2757:	//the distance towards the enemy
;2758:	dist = VectorNormalize(forward);
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
line 2759
;2759:	VectorNegate(forward, backward);
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
line 2761
;2760:	//walk, crouch or jump
;2761:	movetype = MOVE_WALK;
ADDRLP4 52
CNSTI4 1
ASGNI4
line 2763
;2762:	//
;2763:	if (bs->attackcrouch_time < FloatTime() - 1) {
ADDRFP4 4
INDIRP4
CNSTI4 6120
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
GEF4 $792
line 2764
;2764:		if (random() < jumper) {
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
GEF4 $794
line 2765
;2765:			movetype = MOVE_JUMP;
ADDRLP4 52
CNSTI4 4
ASGNI4
line 2766
;2766:		}
ADDRGP4 $795
JUMPV
LABELV $794
line 2768
;2767:		//wait at least one second before crouching again
;2768:		else if (bs->attackcrouch_time < FloatTime() - 1 && random() < croucher) {
ADDRFP4 4
INDIRP4
CNSTI4 6120
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
GEF4 $796
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
GEF4 $796
line 2769
;2769:			bs->attackcrouch_time = FloatTime() + croucher * 5;
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
line 2770
;2770:		}
LABELV $796
LABELV $795
line 2771
;2771:	}
LABELV $792
line 2772
;2772:	if (bs->attackcrouch_time > FloatTime()) movetype = MOVE_CROUCH;
ADDRFP4 4
INDIRP4
CNSTI4 6120
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $798
ADDRLP4 52
CNSTI4 2
ASGNI4
LABELV $798
line 2774
;2773:	//if the bot should jump
;2774:	if (movetype == MOVE_JUMP) {
ADDRLP4 52
INDIRI4
CNSTI4 4
NEI4 $800
line 2776
;2775:		//if jumped last frame
;2776:		if (bs->attackjump_time > FloatTime()) {
ADDRFP4 4
INDIRP4
CNSTI4 6128
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $802
line 2777
;2777:			movetype = MOVE_WALK;
ADDRLP4 52
CNSTI4 1
ASGNI4
line 2778
;2778:		}
ADDRGP4 $803
JUMPV
LABELV $802
line 2779
;2779:		else {
line 2780
;2780:			bs->attackjump_time = FloatTime() + 1;
ADDRFP4 4
INDIRP4
CNSTI4 6128
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2781
;2781:		}
LABELV $803
line 2782
;2782:	}
LABELV $800
line 2783
;2783:	if (bs->cur_ps.weapon == WP_GAUNTLET) {
ADDRFP4 4
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 1
NEI4 $804
line 2784
;2784:		attack_dist = 0;
ADDRLP4 72
CNSTF4 0
ASGNF4
line 2785
;2785:		attack_range = 0;
ADDRLP4 76
CNSTF4 0
ASGNF4
line 2786
;2786:	}
ADDRGP4 $805
JUMPV
LABELV $804
line 2787
;2787:	else {
line 2788
;2788:		attack_dist = IDEAL_ATTACKDIST;
ADDRLP4 72
CNSTF4 1124859904
ASGNF4
line 2789
;2789:		attack_range = 40;
ADDRLP4 76
CNSTF4 1109393408
ASGNF4
line 2790
;2790:	}
LABELV $805
line 2792
;2791:	//if the bot is stupid
;2792:	if (attack_skill <= 0.4) {
ADDRLP4 132
INDIRF4
CNSTF4 1053609165
GTF4 $806
line 2794
;2793:		//just walk to or away from the enemy
;2794:		if (dist > attack_dist + attack_range) {
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
LEF4 $808
line 2795
;2795:			if (trap_BotMoveInDirection(bs->ms, forward, 400, movetype)) return moveresult;
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
EQI4 $810
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $762
JUMPV
LABELV $810
line 2796
;2796:		}
LABELV $808
line 2797
;2797:		if (dist < attack_dist - attack_range) {
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRF4
SUBF4
GEF4 $812
line 2798
;2798:			if (trap_BotMoveInDirection(bs->ms, backward, 400, movetype)) return moveresult;
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
EQI4 $814
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $762
JUMPV
LABELV $814
line 2799
;2799:		}
LABELV $812
line 2800
;2800:		return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $762
JUMPV
LABELV $806
line 2803
;2801:	}
;2802:	//increase the strafe time
;2803:	bs->attackstrafe_time += bs->thinktime;
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
line 2805
;2804:	//get the strafe change time
;2805:	strafechange_time = 0.4 + (1 - attack_skill) * 0.2;
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
line 2806
;2806:	if (attack_skill > 0.7) strafechange_time += crandom() * 0.2;
ADDRLP4 132
INDIRF4
CNSTF4 1060320051
LEF4 $816
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
LABELV $816
line 2808
;2807:	//if the strafe direction should be changed
;2808:	if (bs->attackstrafe_time > strafechange_time) {
ADDRFP4 4
INDIRP4
CNSTI4 6116
ADDP4
INDIRF4
ADDRLP4 336
INDIRF4
LEF4 $818
line 2810
;2809:		//some magic number :)
;2810:		if (random() > 0.935) {
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
LEF4 $820
line 2812
;2811:			//flip the strafe direction
;2812:			bs->flags ^= BFL_STRAFERIGHT;
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
line 2813
;2813:			bs->attackstrafe_time = 0;
ADDRFP4 4
INDIRP4
CNSTI4 6116
ADDP4
CNSTF4 0
ASGNF4
line 2814
;2814:		}
LABELV $820
line 2815
;2815:	}
LABELV $818
line 2817
;2816:	//
;2817:	for (i = 0; i < 2; i++) {
ADDRLP4 48
CNSTI4 0
ASGNI4
LABELV $822
line 2818
;2818:		hordir[0] = forward[0];
ADDRLP4 12
ADDRLP4 24
INDIRF4
ASGNF4
line 2819
;2819:		hordir[1] = forward[1];
ADDRLP4 12+4
ADDRLP4 24+4
INDIRF4
ASGNF4
line 2820
;2820:		hordir[2] = 0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 2821
;2821:		VectorNormalize(hordir);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2823
;2822:		//get the sideward vector
;2823:		CrossProduct(hordir, up, sideward);
ADDRLP4 12
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 2825
;2824:		//reverse the vector depending on the strafe direction
;2825:		if (bs->flags & BFL_STRAFERIGHT) VectorNegate(sideward, sideward);
ADDRFP4 4
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $829
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
LABELV $829
line 2827
;2826:		//randomly go back a little
;2827:		if (random() > 0.9) {
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
LEF4 $835
line 2828
;2828:			VectorAdd(sideward, backward, sideward);
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
line 2829
;2829:		}
ADDRGP4 $836
JUMPV
LABELV $835
line 2830
;2830:		else {
line 2832
;2831:			//walk forward or backward to get at the ideal attack distance
;2832:			if (dist > attack_dist + attack_range) {
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
LEF4 $843
line 2833
;2833:				VectorAdd(sideward, forward, sideward);
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
line 2834
;2834:			}
ADDRGP4 $844
JUMPV
LABELV $843
line 2835
;2835:			else if (dist < attack_dist - attack_range) {
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRF4
SUBF4
GEF4 $851
line 2836
;2836:				VectorAdd(sideward, backward, sideward);
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
line 2837
;2837:			}
LABELV $851
LABELV $844
line 2838
;2838:		}
LABELV $836
line 2840
;2839:		//perform the movement
;2840:		if (trap_BotMoveInDirection(bs->ms, sideward, 400, movetype))
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
EQI4 $859
line 2841
;2841:			return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $762
JUMPV
LABELV $859
line 2843
;2842:		//movement failed, flip the strafe direction
;2843:		bs->flags ^= BFL_STRAFERIGHT;
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
line 2844
;2844:		bs->attackstrafe_time = 0;
ADDRFP4 4
INDIRP4
CNSTI4 6116
ADDP4
CNSTF4 0
ASGNF4
line 2845
;2845:	}
LABELV $823
line 2817
ADDRLP4 48
ADDRLP4 48
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 2
LTI4 $822
line 2848
;2846:	//bot couldn't do any usefull movement
;2847://	bs->attackchase_time = AAS_Time() + 6;
;2848:	return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
LABELV $762
endproc BotAttackMove 392 16
export BotSameTeam
proc BotSameTeam 2072 12
line 2856
;2849:}
;2850:
;2851:/*
;2852:==================
;2853:BotSameTeam
;2854:==================
;2855:*/
;2856:int BotSameTeam(bot_state_t *bs, int entnum) {
line 2859
;2857:	char info1[1024], info2[1024];
;2858:
;2859:	if (bs->client < 0 || bs->client >= MAX_CLIENTS) {
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
LTI4 $864
ADDRLP4 2048
INDIRI4
CNSTI4 64
LTI4 $862
LABELV $864
line 2861
;2860:		//BotAI_Print(PRT_ERROR, "BotSameTeam: client out of range\n");
;2861:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $861
JUMPV
LABELV $862
line 2863
;2862:	}
;2863:	if (entnum < 0 || entnum >= MAX_CLIENTS) {
ADDRLP4 2052
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 2052
INDIRI4
CNSTI4 0
LTI4 $867
ADDRLP4 2052
INDIRI4
CNSTI4 64
LTI4 $865
LABELV $867
line 2865
;2864:		//BotAI_Print(PRT_ERROR, "BotSameTeam: client out of range\n");
;2865:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $861
JUMPV
LABELV $865
line 2867
;2866:	}
;2867:	if ( gametype >= GT_TEAM ) {
ADDRGP4 gametype
INDIRI4
CNSTI4 3
LTI4 $868
line 2868
;2868:		trap_GetConfigstring(CS_PLAYERS+bs->client, info1, sizeof(info1));
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
line 2869
;2869:		trap_GetConfigstring(CS_PLAYERS+entnum, info2, sizeof(info2));
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
line 2871
;2870:		//
;2871:		if (atoi(Info_ValueForKey(info1, "t")) == atoi(Info_ValueForKey(info2, "t"))) return qtrue;
ADDRLP4 0
ARGP4
ADDRGP4 $77
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
ADDRGP4 $77
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
NEI4 $870
CNSTI4 1
RETI4
ADDRGP4 $861
JUMPV
LABELV $870
line 2872
;2872:	}
LABELV $868
line 2873
;2873:	return qfalse;
CNSTI4 0
RETI4
LABELV $861
endproc BotSameTeam 2072 12
export InFieldOfVision
proc InFieldOfVision 24 4
line 2882
;2874:}
;2875:
;2876:/*
;2877:==================
;2878:InFieldOfVision
;2879:==================
;2880:*/
;2881:qboolean InFieldOfVision(vec3_t viewangles, float fov, vec3_t angles)
;2882:{
line 2886
;2883:	int i;
;2884:	float diff, angle;
;2885:
;2886:	for (i = 0; i < 2; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $873
line 2887
;2887:		angle = AngleMod(viewangles[i]);
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
line 2888
;2888:		angles[i] = AngleMod(angles[i]);
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
line 2889
;2889:		diff = angles[i] - angle;
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
line 2890
;2890:		if (angles[i] > angle) {
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
LEF4 $877
line 2891
;2891:			if (diff > 180.0) diff -= 360.0;
ADDRLP4 4
INDIRF4
CNSTF4 1127481344
LEF4 $878
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 2892
;2892:		}
ADDRGP4 $878
JUMPV
LABELV $877
line 2893
;2893:		else {
line 2894
;2894:			if (diff < -180.0) diff += 360.0;
ADDRLP4 4
INDIRF4
CNSTF4 3274964992
GEF4 $881
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $881
line 2895
;2895:		}
LABELV $878
line 2896
;2896:		if (diff > 0) {
ADDRLP4 4
INDIRF4
CNSTF4 0
LEF4 $883
line 2897
;2897:			if (diff > fov * 0.5) return qfalse;
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRFP4 4
INDIRF4
MULF4
LEF4 $884
CNSTI4 0
RETI4
ADDRGP4 $872
JUMPV
line 2898
;2898:		}
LABELV $883
line 2899
;2899:		else {
line 2900
;2900:			if (diff < -fov * 0.5) return qfalse;
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRFP4 4
INDIRF4
NEGF4
MULF4
GEF4 $887
CNSTI4 0
RETI4
ADDRGP4 $872
JUMPV
LABELV $887
line 2901
;2901:		}
LABELV $884
line 2902
;2902:	}
LABELV $874
line 2886
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $873
line 2903
;2903:	return qtrue;
CNSTI4 1
RETI4
LABELV $872
endproc InFieldOfVision 24 4
export BotEntityVisible
proc BotEntityVisible 376 28
line 2913
;2904:}
;2905:
;2906:/*
;2907:==================
;2908:BotEntityVisible
;2909:
;2910:returns visibility in the range [0, 1] taking fog and water surfaces into account
;2911:==================
;2912:*/
;2913:float BotEntityVisible(int viewer, vec3_t eye, vec3_t viewangles, float fov, int ent) {
line 2921
;2914:	int i, contents_mask, passent, hitent, infog, inwater, otherinfog, pc;
;2915:	float squaredfogdist, waterfactor, vis, bestvis;
;2916:	bsp_trace_t trace;
;2917:	aas_entityinfo_t entinfo;
;2918:	vec3_t dir, entangles, start, end, middle;
;2919:
;2920:	//calculate middle of bounding box
;2921:	BotEntityInfo(ent, &entinfo);
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 148
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2922
;2922:	VectorAdd(entinfo.mins, entinfo.maxs, middle);
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
line 2923
;2923:	VectorScale(middle, 0.5, middle);
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
line 2924
;2924:	VectorAdd(entinfo.origin, middle, middle);
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
line 2926
;2925:	//check if entity is within field of vision
;2926:	VectorSubtract(middle, eye, dir);
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
line 2927
;2927:	vectoangles(dir, entangles);
ADDRLP4 136
ARGP4
ADDRLP4 320
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2928
;2928:	if (!InFieldOfVision(viewangles, fov, entangles)) return 0;
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
NEI4 $919
CNSTF4 0
RETF4
ADDRGP4 $889
JUMPV
LABELV $919
line 2930
;2929:	//
;2930:	pc = trap_AAS_PointContents(eye);
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
line 2931
;2931:	infog = (pc & CONTENTS_FOG);
ADDRLP4 312
ADDRLP4 316
INDIRI4
CNSTI4 64
BANDI4
ASGNI4
line 2932
;2932:	inwater = (pc & (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER));
ADDRLP4 308
ADDRLP4 316
INDIRI4
CNSTI4 56
BANDI4
ASGNI4
line 2934
;2933:	//
;2934:	bestvis = 0;
ADDRLP4 296
CNSTF4 0
ASGNF4
line 2935
;2935:	for (i = 0; i < 3; i++) {
ADDRLP4 100
CNSTI4 0
ASGNI4
LABELV $921
line 2939
;2936:		//if the point is not in potential visible sight
;2937:		//if (!AAS_inPVS(eye, middle)) continue;
;2938:		//
;2939:		contents_mask = CONTENTS_SOLID|CONTENTS_PLAYERCLIP;
ADDRLP4 96
CNSTI4 65537
ASGNI4
line 2940
;2940:		passent = viewer;
ADDRLP4 116
ADDRFP4 0
INDIRI4
ASGNI4
line 2941
;2941:		hitent = ent;
ADDRLP4 132
ADDRFP4 16
INDIRI4
ASGNI4
line 2942
;2942:		VectorCopy(eye, start);
ADDRLP4 120
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2943
;2943:		VectorCopy(middle, end);
ADDRLP4 104
ADDRLP4 84
INDIRB
ASGNB 12
line 2945
;2944:		//if the entity is in water, lava or slime
;2945:		if (trap_AAS_PointContents(middle) & (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER)) {
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
EQI4 $925
line 2946
;2946:			contents_mask |= (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER);
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 56
BORI4
ASGNI4
line 2947
;2947:		}
LABELV $925
line 2949
;2948:		//if eye is in water, lava or slime
;2949:		if (inwater) {
ADDRLP4 308
INDIRI4
CNSTI4 0
EQI4 $927
line 2950
;2950:			if (!(contents_mask & (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER))) {
ADDRLP4 96
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
NEI4 $929
line 2951
;2951:				passent = ent;
ADDRLP4 116
ADDRFP4 16
INDIRI4
ASGNI4
line 2952
;2952:				hitent = viewer;
ADDRLP4 132
ADDRFP4 0
INDIRI4
ASGNI4
line 2953
;2953:				VectorCopy(middle, start);
ADDRLP4 120
ADDRLP4 84
INDIRB
ASGNB 12
line 2954
;2954:				VectorCopy(eye, end);
ADDRLP4 104
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2955
;2955:			}
LABELV $929
line 2956
;2956:			contents_mask ^= (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER);
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 56
BXORI4
ASGNI4
line 2957
;2957:		}
LABELV $927
line 2959
;2958:		//trace from start to end
;2959:		BotAI_Trace(&trace, start, NULL, NULL, end, passent, contents_mask);
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
line 2961
;2960:		//if water was hit
;2961:		waterfactor = 1.0;
ADDRLP4 288
CNSTF4 1065353216
ASGNF4
line 2962
;2962:		if (trace.contents & (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER)) {
ADDRLP4 0+76
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $931
line 2964
;2963:			//if the water surface is translucent
;2964:			if (1) {
line 2966
;2965:				//trace through the water
;2966:				contents_mask &= ~(CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER);
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 -57
BANDI4
ASGNI4
line 2967
;2967:				BotAI_Trace(&trace, trace.endpos, NULL, NULL, end, passent, contents_mask);
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
line 2968
;2968:				waterfactor = 0.5;
ADDRLP4 288
CNSTF4 1056964608
ASGNF4
line 2969
;2969:			}
LABELV $934
line 2970
;2970:		}
LABELV $931
line 2972
;2971:		//if a full trace or the hitent was hit
;2972:		if (trace.fraction >= 1 || trace.ent == hitent) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $941
ADDRLP4 0+80
INDIRI4
ADDRLP4 132
INDIRI4
NEI4 $937
LABELV $941
line 2975
;2973:			//check for fog, assuming there's only one fog brush where
;2974:			//either the viewer or the entity is in or both are in
;2975:			otherinfog = (trap_AAS_PointContents(middle) & CONTENTS_FOG);
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
line 2976
;2976:			if (infog && otherinfog) {
ADDRLP4 360
CNSTI4 0
ASGNI4
ADDRLP4 312
INDIRI4
ADDRLP4 360
INDIRI4
EQI4 $942
ADDRLP4 304
INDIRI4
ADDRLP4 360
INDIRI4
EQI4 $942
line 2977
;2977:				VectorSubtract(trace.endpos, eye, dir);
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
line 2978
;2978:				squaredfogdist = VectorLengthSquared(dir);
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
line 2979
;2979:			}
ADDRGP4 $943
JUMPV
LABELV $942
line 2980
;2980:			else if (infog) {
ADDRLP4 312
INDIRI4
CNSTI4 0
EQI4 $951
line 2981
;2981:				VectorCopy(trace.endpos, start);
ADDRLP4 120
ADDRLP4 0+12
INDIRB
ASGNB 12
line 2982
;2982:				BotAI_Trace(&trace, start, NULL, NULL, eye, viewer, CONTENTS_FOG);
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
line 2983
;2983:				VectorSubtract(eye, trace.endpos, dir);
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
line 2984
;2984:				squaredfogdist = VectorLengthSquared(dir);
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
line 2985
;2985:			}
ADDRGP4 $952
JUMPV
LABELV $951
line 2986
;2986:			else if (otherinfog) {
ADDRLP4 304
INDIRI4
CNSTI4 0
EQI4 $961
line 2987
;2987:				VectorCopy(trace.endpos, end);
ADDRLP4 104
ADDRLP4 0+12
INDIRB
ASGNB 12
line 2988
;2988:				BotAI_Trace(&trace, eye, NULL, NULL, end, viewer, CONTENTS_FOG);
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
line 2989
;2989:				VectorSubtract(end, trace.endpos, dir);
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
line 2990
;2990:				squaredfogdist = VectorLengthSquared(dir);
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
line 2991
;2991:			}
ADDRGP4 $962
JUMPV
LABELV $961
line 2992
;2992:			else {
line 2994
;2993:				//if the entity and the viewer are not in fog assume there's no fog in between
;2994:				squaredfogdist = 0;
ADDRLP4 300
CNSTF4 0
ASGNF4
line 2995
;2995:			}
LABELV $962
LABELV $952
LABELV $943
line 2997
;2996:			//decrease visibility with the view distance through fog
;2997:			vis = 1 / ((squaredfogdist * 0.001) < 1 ? 1 : (squaredfogdist * 0.001));
ADDRLP4 368
CNSTF4 1065353216
ASGNF4
CNSTF4 981668463
ADDRLP4 300
INDIRF4
MULF4
ADDRLP4 368
INDIRF4
GEF4 $974
ADDRLP4 364
CNSTF4 1065353216
ASGNF4
ADDRGP4 $975
JUMPV
LABELV $974
ADDRLP4 364
CNSTF4 981668463
ADDRLP4 300
INDIRF4
MULF4
ASGNF4
LABELV $975
ADDRLP4 292
ADDRLP4 368
INDIRF4
ADDRLP4 364
INDIRF4
DIVF4
ASGNF4
line 2999
;2998:			//if entering water visibility is reduced
;2999:			vis *= waterfactor;
ADDRLP4 292
ADDRLP4 292
INDIRF4
ADDRLP4 288
INDIRF4
MULF4
ASGNF4
line 3001
;3000:			//
;3001:			if (vis > bestvis) bestvis = vis;
ADDRLP4 292
INDIRF4
ADDRLP4 296
INDIRF4
LEF4 $976
ADDRLP4 296
ADDRLP4 292
INDIRF4
ASGNF4
LABELV $976
line 3003
;3002:			//if pretty much no fog
;3003:			if (bestvis >= 0.95) return bestvis;
ADDRLP4 296
INDIRF4
CNSTF4 1064514355
LTF4 $978
ADDRLP4 296
INDIRF4
RETF4
ADDRGP4 $889
JUMPV
LABELV $978
line 3004
;3004:		}
LABELV $937
line 3006
;3005:		//check bottom and top of bounding box as well
;3006:		if (i == 0) middle[2] += entinfo.mins[2];
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $980
ADDRLP4 84+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 148+72+8
INDIRF4
ADDF4
ASGNF4
ADDRGP4 $981
JUMPV
LABELV $980
line 3007
;3007:		else if (i == 1) middle[2] += entinfo.maxs[2] - entinfo.mins[2];
ADDRLP4 100
INDIRI4
CNSTI4 1
NEI4 $985
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
LABELV $985
LABELV $981
line 3008
;3008:	}
LABELV $922
line 2935
ADDRLP4 100
ADDRLP4 100
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 3
LTI4 $921
line 3009
;3009:	return bestvis;
ADDRLP4 296
INDIRF4
RETF4
LABELV $889
endproc BotEntityVisible 376 28
export BotFindEnemy
proc BotFindEnemy 432 20
line 3017
;3010:}
;3011:
;3012:/*
;3013:==================
;3014:BotFindEnemy
;3015:==================
;3016:*/
;3017:int BotFindEnemy(bot_state_t *bs, int curenemy) {
line 3024
;3018:	int i, healthdecrease;
;3019:	float f, alertness, easyfragger, vis;
;3020:	float squaredist, cursquaredist;
;3021:	aas_entityinfo_t entinfo, curenemyinfo;
;3022:	vec3_t dir, angles;
;3023:
;3024:	alertness = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_ALERTNESS, 0, 1);
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
line 3025
;3025:	easyfragger = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_EASY_FRAGGER, 0, 1);
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
line 3027
;3026:	//check if the health decreased
;3027:	healthdecrease = bs->lasthealth > bs->inventory[INVENTORY_HEALTH];
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
LEI4 $994
ADDRLP4 344
CNSTI4 1
ASGNI4
ADDRGP4 $995
JUMPV
LABELV $994
ADDRLP4 344
CNSTI4 0
ASGNI4
LABELV $995
ADDRLP4 160
ADDRLP4 344
INDIRI4
ASGNI4
line 3029
;3028:	//remember the current health value
;3029:	bs->lasthealth = bs->inventory[INVENTORY_HEALTH];
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
line 3031
;3030:	//
;3031:	if (curenemy >= 0) {
ADDRFP4 4
INDIRI4
CNSTI4 0
LTI4 $996
line 3032
;3032:		BotEntityInfo(curenemy, &curenemyinfo);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 196
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3033
;3033:		if (EntityCarriesFlag(&curenemyinfo)) return qfalse;
ADDRLP4 196
ARGP4
ADDRLP4 356
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 356
INDIRI4
CNSTI4 0
EQI4 $998
CNSTI4 0
RETI4
ADDRGP4 $992
JUMPV
LABELV $998
line 3034
;3034:		VectorSubtract(curenemyinfo.origin, bs->origin, dir);
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
line 3035
;3035:		cursquaredist = VectorLengthSquared(dir);
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
line 3036
;3036:	}
ADDRGP4 $997
JUMPV
LABELV $996
line 3037
;3037:	else {
line 3038
;3038:		cursquaredist = 0;
ADDRLP4 192
CNSTF4 0
ASGNF4
line 3039
;3039:	}
LABELV $997
line 3068
;3040:#ifdef MISSIONPACK
;3041:	if (gametype == GT_OBELISK) {
;3042:		vec3_t target;
;3043:		bot_goal_t *goal;
;3044:		bsp_trace_t trace;
;3045:
;3046:		if (BotTeam(bs) == TEAM_RED)
;3047:			goal = &blueobelisk;
;3048:		else
;3049:			goal = &redobelisk;
;3050:		//if the obelisk is visible
;3051:		VectorCopy(goal->origin, target);
;3052:		target[2] += 1;
;3053:		BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
;3054:		if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
;3055:			if (goal->entitynum == bs->enemy) {
;3056:				return qfalse;
;3057:			}
;3058:			bs->enemy = goal->entitynum;
;3059:			bs->enemysight_time = FloatTime();
;3060:			bs->enemysuicide = qfalse;
;3061:			bs->enemydeath_time = 0;
;3062:			bs->enemyvisible_time = FloatTime();
;3063:			return qtrue;
;3064:		}
;3065:	}
;3066:#endif
;3067:	//
;3068:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 140
CNSTI4 0
ASGNI4
ADDRGP4 $1010
JUMPV
LABELV $1007
line 3070
;3069:
;3070:		if (i == bs->client) continue;
ADDRLP4 140
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1011
ADDRGP4 $1008
JUMPV
LABELV $1011
line 3072
;3071:		//if it's the current enemy
;3072:		if (i == curenemy) continue;
ADDRLP4 140
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $1013
ADDRGP4 $1008
JUMPV
LABELV $1013
line 3074
;3073:		//
;3074:		BotEntityInfo(i, &entinfo);
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3076
;3075:		//
;3076:		if (!entinfo.valid) continue;
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1015
ADDRGP4 $1008
JUMPV
LABELV $1015
line 3078
;3077:		//if the enemy isn't dead and the enemy isn't the bot self
;3078:		if (EntityIsDead(&entinfo) || entinfo.number == bs->entitynum) continue;
ADDRLP4 0
ARGP4
ADDRLP4 356
ADDRGP4 EntityIsDead
CALLI4
ASGNI4
ADDRLP4 356
INDIRI4
CNSTI4 0
NEI4 $1020
ADDRLP4 0+20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
NEI4 $1017
LABELV $1020
ADDRGP4 $1008
JUMPV
LABELV $1017
line 3080
;3079:		//if the enemy is invisible and not shooting
;3080:		if (EntityIsInvisible(&entinfo) && !EntityIsShooting(&entinfo)) {
ADDRLP4 0
ARGP4
ADDRLP4 360
ADDRGP4 EntityIsInvisible
CALLI4
ASGNI4
ADDRLP4 360
INDIRI4
CNSTI4 0
EQI4 $1021
ADDRLP4 0
ARGP4
ADDRLP4 364
ADDRGP4 EntityIsShooting
CALLI4
ASGNI4
ADDRLP4 364
INDIRI4
CNSTI4 0
NEI4 $1021
line 3081
;3081:			continue;
ADDRGP4 $1008
JUMPV
LABELV $1021
line 3085
;3082:		}
;3083://unlagged - misc
;3084:		// this has nothing to do with lag compensation, but it's great for testing
;3085:		if ( g_entities[i].flags & FL_NOTARGET ) continue;
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
EQI4 $1023
ADDRGP4 $1008
JUMPV
LABELV $1023
line 3088
;3086://unlagged - misc
;3087:		//if not an easy fragger don't shoot at chatting players
;3088:		if (easyfragger < 0.5 && EntityIsChatting(&entinfo)) continue;
ADDRLP4 176
INDIRF4
CNSTF4 1056964608
GEF4 $1026
ADDRLP4 0
ARGP4
ADDRLP4 368
ADDRGP4 EntityIsChatting
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 0
EQI4 $1026
ADDRGP4 $1008
JUMPV
LABELV $1026
line 3090
;3089:		//
;3090:		if (lastteleport_time > FloatTime() - 3) {
ADDRGP4 lastteleport_time
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1077936128
SUBF4
LEF4 $1028
line 3091
;3091:			VectorSubtract(entinfo.origin, lastteleport_origin, dir);
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
line 3092
;3092:			if (VectorLengthSquared(dir) < Square(70)) continue;
ADDRLP4 144
ARGP4
ADDRLP4 372
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 372
INDIRF4
CNSTF4 1167663104
GEF4 $1039
ADDRGP4 $1008
JUMPV
LABELV $1039
line 3093
;3093:		}
LABELV $1028
line 3095
;3094:		//calculate the distance towards the enemy
;3095:		VectorSubtract(entinfo.origin, bs->origin, dir);
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
line 3096
;3096:		squaredist = VectorLengthSquared(dir);
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
line 3098
;3097:		//if this entity is not carrying a flag
;3098:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 0
ARGP4
ADDRLP4 380
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 380
INDIRI4
CNSTI4 0
NEI4 $1048
line 3099
;3099:		{
line 3101
;3100:			//if this enemy is further away than the current one
;3101:			if (curenemy >= 0 && squaredist > cursquaredist) continue;
ADDRFP4 4
INDIRI4
CNSTI4 0
LTI4 $1050
ADDRLP4 156
INDIRF4
ADDRLP4 192
INDIRF4
LEF4 $1050
ADDRGP4 $1008
JUMPV
LABELV $1050
line 3102
;3102:		} //end if
LABELV $1048
line 3104
;3103:		//if the bot has no
;3104:		if (squaredist > Square(900.0 + alertness * 4000.0)) continue;
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
LEF4 $1052
ADDRGP4 $1008
JUMPV
LABELV $1052
line 3106
;3105:		//if on the same team
;3106:		if (BotSameTeam(bs, i)) continue;
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
EQI4 $1054
ADDRGP4 $1008
JUMPV
LABELV $1054
line 3108
;3107:		//if the bot's health decreased or the enemy is shooting
;3108:		if (curenemy < 0 && (healthdecrease || EntityIsShooting(&entinfo)))
ADDRLP4 392
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 392
INDIRI4
GEI4 $1056
ADDRLP4 160
INDIRI4
ADDRLP4 392
INDIRI4
NEI4 $1058
ADDRLP4 0
ARGP4
ADDRLP4 396
ADDRGP4 EntityIsShooting
CALLI4
ASGNI4
ADDRLP4 396
INDIRI4
CNSTI4 0
EQI4 $1056
LABELV $1058
line 3109
;3109:			f = 360;
ADDRLP4 168
CNSTF4 1135869952
ASGNF4
ADDRGP4 $1057
JUMPV
LABELV $1056
line 3111
;3110:		else
;3111:			f = 90 + 90 - (90 - (squaredist > Square(810) ? Square(810) : squaredist) / (810 * 9));
ADDRLP4 156
INDIRF4
CNSTF4 1226845760
LEF4 $1060
ADDRLP4 400
CNSTF4 1226845760
ASGNF4
ADDRGP4 $1061
JUMPV
LABELV $1060
ADDRLP4 400
ADDRLP4 156
INDIRF4
ASGNF4
LABELV $1061
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
LABELV $1057
line 3113
;3112:		//check if the enemy is visible
;3113:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, f, i);
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
line 3114
;3114:		if (vis <= 0) continue;
ADDRLP4 172
INDIRF4
CNSTF4 0
GTF4 $1062
ADDRGP4 $1008
JUMPV
LABELV $1062
line 3116
;3115:		//if the enemy is quite far away, not shooting and the bot is not damaged
;3116:		if (curenemy < 0 && squaredist > Square(100) && !healthdecrease && !EntityIsShooting(&entinfo))
ADDRLP4 412
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 412
INDIRI4
GEI4 $1064
ADDRLP4 156
INDIRF4
CNSTF4 1176256512
LEF4 $1064
ADDRLP4 160
INDIRI4
ADDRLP4 412
INDIRI4
NEI4 $1064
ADDRLP4 0
ARGP4
ADDRLP4 416
ADDRGP4 EntityIsShooting
CALLI4
ASGNI4
ADDRLP4 416
INDIRI4
CNSTI4 0
NEI4 $1064
line 3117
;3117:		{
line 3119
;3118:			//check if we can avoid this enemy
;3119:			VectorSubtract(bs->origin, entinfo.origin, dir);
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
line 3120
;3120:			vectoangles(dir, angles);
ADDRLP4 144
ARGP4
ADDRLP4 180
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3122
;3121:			//if the bot isn't in the fov of the enemy
;3122:			if (!InFieldOfVision(entinfo.angles, 90, angles)) {
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
NEI4 $1073
line 3124
;3123:				//update some stuff for this enemy
;3124:				BotUpdateBattleInventory(bs, i);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
INDIRI4
ARGI4
ADDRGP4 BotUpdateBattleInventory
CALLV
pop
line 3126
;3125:				//if the bot doesn't really want to fight
;3126:				if (BotWantsToRetreat(bs)) continue;
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
EQI4 $1076
ADDRGP4 $1008
JUMPV
LABELV $1076
line 3127
;3127:			}
LABELV $1073
line 3128
;3128:		}
LABELV $1064
line 3130
;3129:		//found an enemy
;3130:		bs->enemy = entinfo.number;
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
ADDRLP4 0+20
INDIRI4
ASGNI4
line 3131
;3131:		if (curenemy >= 0) bs->enemysight_time = FloatTime() - 2;
ADDRFP4 4
INDIRI4
CNSTI4 0
LTI4 $1079
ADDRFP4 0
INDIRP4
CNSTI4 6132
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
SUBF4
ASGNF4
ADDRGP4 $1080
JUMPV
LABELV $1079
line 3132
;3132:		else bs->enemysight_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6132
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
LABELV $1080
line 3133
;3133:		bs->enemysuicide = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6012
ADDP4
CNSTI4 0
ASGNI4
line 3134
;3134:		bs->enemydeath_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6136
ADDP4
CNSTF4 0
ASGNF4
line 3135
;3135:		bs->enemyvisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6088
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 3136
;3136:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $992
JUMPV
LABELV $1008
line 3068
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1010
ADDRLP4 140
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $1081
ADDRLP4 140
INDIRI4
CNSTI4 64
LTI4 $1007
LABELV $1081
line 3138
;3137:	}
;3138:	return qfalse;
CNSTI4 0
RETI4
LABELV $992
endproc BotFindEnemy 432 20
export BotTeamFlagCarrierVisible
proc BotTeamFlagCarrierVisible 164 20
line 3146
;3139:}
;3140:
;3141:/*
;3142:==================
;3143:BotTeamFlagCarrierVisible
;3144:==================
;3145:*/
;3146:int BotTeamFlagCarrierVisible(bot_state_t *bs) {
line 3151
;3147:	int i;
;3148:	float vis;
;3149:	aas_entityinfo_t entinfo;
;3150:
;3151:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1086
JUMPV
LABELV $1083
line 3152
;3152:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1087
line 3153
;3153:			continue;
ADDRGP4 $1084
JUMPV
LABELV $1087
line 3155
;3154:		//
;3155:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3157
;3156:		//if this player is active
;3157:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1089
line 3158
;3158:			continue;
ADDRGP4 $1084
JUMPV
LABELV $1089
line 3160
;3159:		//if this player is carrying a flag
;3160:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 4
ARGP4
ADDRLP4 148
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $1091
line 3161
;3161:			continue;
ADDRGP4 $1084
JUMPV
LABELV $1091
line 3163
;3162:		//if the flag carrier is not on the same team
;3163:		if (!BotSameTeam(bs, i))
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
NEI4 $1093
line 3164
;3164:			continue;
ADDRGP4 $1084
JUMPV
LABELV $1093
line 3166
;3165:		//if the flag carrier is not visible
;3166:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
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
line 3167
;3167:		if (vis <= 0)
ADDRLP4 144
INDIRF4
CNSTF4 0
GTF4 $1095
line 3168
;3168:			continue;
ADDRGP4 $1084
JUMPV
LABELV $1095
line 3170
;3169:		//
;3170:		return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1082
JUMPV
LABELV $1084
line 3151
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1086
ADDRLP4 0
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $1097
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $1083
LABELV $1097
line 3172
;3171:	}
;3172:	return -1;
CNSTI4 -1
RETI4
LABELV $1082
endproc BotTeamFlagCarrierVisible 164 20
export BotTeamFlagCarrier
proc BotTeamFlagCarrier 152 8
line 3180
;3173:}
;3174:
;3175:/*
;3176:==================
;3177:BotTeamFlagCarrier
;3178:==================
;3179:*/
;3180:int BotTeamFlagCarrier(bot_state_t *bs) {
line 3184
;3181:	int i;
;3182:	aas_entityinfo_t entinfo;
;3183:
;3184:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1102
JUMPV
LABELV $1099
line 3185
;3185:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1103
line 3186
;3186:			continue;
ADDRGP4 $1100
JUMPV
LABELV $1103
line 3188
;3187:		//
;3188:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3190
;3189:		//if this player is active
;3190:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1105
line 3191
;3191:			continue;
ADDRGP4 $1100
JUMPV
LABELV $1105
line 3193
;3192:		//if this player is carrying a flag
;3193:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 4
ARGP4
ADDRLP4 144
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
NEI4 $1107
line 3194
;3194:			continue;
ADDRGP4 $1100
JUMPV
LABELV $1107
line 3196
;3195:		//if the flag carrier is not on the same team
;3196:		if (!BotSameTeam(bs, i))
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
NEI4 $1109
line 3197
;3197:			continue;
ADDRGP4 $1100
JUMPV
LABELV $1109
line 3199
;3198:		//
;3199:		return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1098
JUMPV
LABELV $1100
line 3184
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1102
ADDRLP4 0
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $1111
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $1099
LABELV $1111
line 3201
;3200:	}
;3201:	return -1;
CNSTI4 -1
RETI4
LABELV $1098
endproc BotTeamFlagCarrier 152 8
export BotEnemyFlagCarrierVisible
proc BotEnemyFlagCarrierVisible 164 20
line 3209
;3202:}
;3203:
;3204:/*
;3205:==================
;3206:BotEnemyFlagCarrierVisible
;3207:==================
;3208:*/
;3209:int BotEnemyFlagCarrierVisible(bot_state_t *bs) {
line 3214
;3210:	int i;
;3211:	float vis;
;3212:	aas_entityinfo_t entinfo;
;3213:
;3214:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1116
JUMPV
LABELV $1113
line 3215
;3215:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1117
line 3216
;3216:			continue;
ADDRGP4 $1114
JUMPV
LABELV $1117
line 3218
;3217:		//
;3218:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3220
;3219:		//if this player is active
;3220:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1119
line 3221
;3221:			continue;
ADDRGP4 $1114
JUMPV
LABELV $1119
line 3223
;3222:		//if this player is carrying a flag
;3223:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 4
ARGP4
ADDRLP4 148
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $1121
line 3224
;3224:			continue;
ADDRGP4 $1114
JUMPV
LABELV $1121
line 3226
;3225:		//if the flag carrier is on the same team
;3226:		if (BotSameTeam(bs, i))
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
EQI4 $1123
line 3227
;3227:			continue;
ADDRGP4 $1114
JUMPV
LABELV $1123
line 3229
;3228:		//if the flag carrier is not visible
;3229:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
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
line 3230
;3230:		if (vis <= 0)
ADDRLP4 144
INDIRF4
CNSTF4 0
GTF4 $1125
line 3231
;3231:			continue;
ADDRGP4 $1114
JUMPV
LABELV $1125
line 3233
;3232:		//
;3233:		return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1112
JUMPV
LABELV $1114
line 3214
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1116
ADDRLP4 0
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $1127
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $1113
LABELV $1127
line 3235
;3234:	}
;3235:	return -1;
CNSTI4 -1
RETI4
LABELV $1112
endproc BotEnemyFlagCarrierVisible 164 20
export BotVisibleTeamMatesAndEnemies
proc BotVisibleTeamMatesAndEnemies 192 20
line 3243
;3236:}
;3237:
;3238:/*
;3239:==================
;3240:BotVisibleTeamMatesAndEnemies
;3241:==================
;3242:*/
;3243:void BotVisibleTeamMatesAndEnemies(bot_state_t *bs, int *teammates, int *enemies, float range) {
line 3249
;3244:	int i;
;3245:	float vis;
;3246:	aas_entityinfo_t entinfo;
;3247:	vec3_t dir;
;3248:
;3249:	if (teammates)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1129
line 3250
;3250:		*teammates = 0;
ADDRFP4 4
INDIRP4
CNSTI4 0
ASGNI4
LABELV $1129
line 3251
;3251:	if (enemies)
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1131
line 3252
;3252:		*enemies = 0;
ADDRFP4 8
INDIRP4
CNSTI4 0
ASGNI4
LABELV $1131
line 3253
;3253:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1136
JUMPV
LABELV $1133
line 3254
;3254:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1137
line 3255
;3255:			continue;
ADDRGP4 $1134
JUMPV
LABELV $1137
line 3257
;3256:		//
;3257:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3259
;3258:		//if this player is active
;3259:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1139
line 3260
;3260:			continue;
ADDRGP4 $1134
JUMPV
LABELV $1139
line 3262
;3261:		//if this player is carrying a flag
;3262:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 4
ARGP4
ADDRLP4 160
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
NEI4 $1141
line 3263
;3263:			continue;
ADDRGP4 $1134
JUMPV
LABELV $1141
line 3265
;3264:		//if not within range
;3265:		VectorSubtract(entinfo.origin, bs->origin, dir);
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
line 3266
;3266:		if (VectorLengthSquared(dir) > Square(range))
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
LEF4 $1150
line 3267
;3267:			continue;
ADDRGP4 $1134
JUMPV
LABELV $1150
line 3269
;3268:		//if the flag carrier is not visible
;3269:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
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
line 3270
;3270:		if (vis <= 0)
ADDRLP4 156
INDIRF4
CNSTF4 0
GTF4 $1152
line 3271
;3271:			continue;
ADDRGP4 $1134
JUMPV
LABELV $1152
line 3273
;3272:		//if the flag carrier is on the same team
;3273:		if (BotSameTeam(bs, i)) {
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
EQI4 $1154
line 3274
;3274:			if (teammates)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1155
line 3275
;3275:				(*teammates)++;
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
line 3276
;3276:		}
ADDRGP4 $1155
JUMPV
LABELV $1154
line 3277
;3277:		else {
line 3278
;3278:			if (enemies)
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1158
line 3279
;3279:				(*enemies)++;
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
LABELV $1158
line 3280
;3280:		}
LABELV $1155
line 3281
;3281:	}
LABELV $1134
line 3253
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1136
ADDRLP4 0
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $1160
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $1133
LABELV $1160
line 3282
;3282:}
LABELV $1128
endproc BotVisibleTeamMatesAndEnemies 192 20
lit
align 4
LABELV $1162
byte 4 3229614080
byte 4 3229614080
byte 4 3229614080
align 4
LABELV $1163
byte 4 1082130432
byte 4 1082130432
byte 4 1082130432
export BotAimAtEnemy
code
proc BotAimAtEnemy 1144 52
line 3353
;3283:
;3284:#ifdef MISSIONPACK
;3285:/*
;3286:==================
;3287:BotTeamCubeCarrierVisible
;3288:==================
;3289:*/
;3290:int BotTeamCubeCarrierVisible(bot_state_t *bs) {
;3291:	int i;
;3292:	float vis;
;3293:	aas_entityinfo_t entinfo;
;3294:
;3295:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
;3296:		if (i == bs->client) continue;
;3297:		//
;3298:		BotEntityInfo(i, &entinfo);
;3299:		//if this player is active
;3300:		if (!entinfo.valid) continue;
;3301:		//if this player is carrying a flag
;3302:		if (!EntityCarriesCubes(&entinfo)) continue;
;3303:		//if the flag carrier is not on the same team
;3304:		if (!BotSameTeam(bs, i)) continue;
;3305:		//if the flag carrier is not visible
;3306:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
;3307:		if (vis <= 0) continue;
;3308:		//
;3309:		return i;
;3310:	}
;3311:	return -1;
;3312:}
;3313:
;3314:/*
;3315:==================
;3316:BotEnemyCubeCarrierVisible
;3317:==================
;3318:*/
;3319:int BotEnemyCubeCarrierVisible(bot_state_t *bs) {
;3320:	int i;
;3321:	float vis;
;3322:	aas_entityinfo_t entinfo;
;3323:
;3324:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
;3325:		if (i == bs->client)
;3326:			continue;
;3327:		//
;3328:		BotEntityInfo(i, &entinfo);
;3329:		//if this player is active
;3330:		if (!entinfo.valid)
;3331:			continue;
;3332:		//if this player is carrying a flag
;3333:		if (!EntityCarriesCubes(&entinfo)) continue;
;3334:		//if the flag carrier is on the same team
;3335:		if (BotSameTeam(bs, i))
;3336:			continue;
;3337:		//if the flag carrier is not visible
;3338:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
;3339:		if (vis <= 0)
;3340:			continue;
;3341:		//
;3342:		return i;
;3343:	}
;3344:	return -1;
;3345:}
;3346:#endif
;3347:
;3348:/*
;3349:==================
;3350:BotAimAtEnemy
;3351:==================
;3352:*/
;3353:void BotAimAtEnemy(bot_state_t *bs) {
line 3357
;3354:	int i, enemyvisible;
;3355:	float dist, f, aim_skill, aim_accuracy, speed, reactiontime;
;3356:	vec3_t dir, bestorigin, end, start, groundtarget, cmdmove, enemyvelocity;
;3357:	vec3_t mins = {-4,-4,-4}, maxs = {4, 4, 4};
ADDRLP4 860
ADDRGP4 $1162
INDIRB
ASGNB 12
ADDRLP4 872
ADDRGP4 $1163
INDIRB
ASGNB 12
line 3365
;3358:	weaponinfo_t wi;
;3359:	aas_entityinfo_t entinfo;
;3360:	bot_goal_t goal;
;3361:	bsp_trace_t trace;
;3362:	vec3_t target;
;3363:
;3364:	//if the bot has no enemy
;3365:	if (bs->enemy < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1164
line 3366
;3366:		return;
ADDRGP4 $1161
JUMPV
LABELV $1164
line 3369
;3367:	}
;3368:	//get the enemy entity information
;3369:	BotEntityInfo(bs->enemy, &entinfo);
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
line 3371
;3370:	//if this is not a player (should be an obelisk)
;3371:	if (bs->enemy >= MAX_CLIENTS) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 64
LTI4 $1166
line 3373
;3372:		//if the obelisk is visible
;3373:		VectorCopy(entinfo.origin, target);
ADDRLP4 828
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3382
;3374:#ifdef MISSIONPACK
;3375:		// if attacking an obelisk
;3376:		if ( bs->enemy == redobelisk.entitynum ||
;3377:			bs->enemy == blueobelisk.entitynum ) {
;3378:			target[2] += 32;
;3379:		}
;3380:#endif
;3381:		//aim at the obelisk
;3382:		VectorSubtract(target, bs->eye, dir);
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
line 3383
;3383:		vectoangles(dir, bs->ideal_viewangles);
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
line 3385
;3384:		//set the aim target before trying to attack
;3385:		VectorCopy(target, bs->aimtarget);
ADDRFP4 0
INDIRP4
CNSTI4 6220
ADDP4
ADDRLP4 828
INDIRB
ASGNB 12
line 3386
;3386:		return;
ADDRGP4 $1161
JUMPV
LABELV $1166
line 3391
;3387:	}
;3388:	//
;3389:	//BotAI_Print(PRT_MESSAGE, "client %d: aiming at client %d\n", bs->entitynum, bs->enemy);
;3390:	//
;3391:	aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL, 0, 1);
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
line 3392
;3392:	aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY, 0, 1);
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
line 3394
;3393:	//
;3394:	if (aim_skill > 0.95) {
ADDRLP4 736
INDIRF4
CNSTF4 1064514355
LEF4 $1173
line 3396
;3395:		//don't aim too early
;3396:		reactiontime = 0.5 * trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_REACTIONTIME, 0, 1);
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
line 3397
;3397:		if (bs->enemysight_time > FloatTime() - reactiontime) return;
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
LEF4 $1175
ADDRGP4 $1161
JUMPV
LABELV $1175
line 3398
;3398:		if (bs->teleport_time > FloatTime() - reactiontime) return;
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
LEF4 $1177
ADDRGP4 $1161
JUMPV
LABELV $1177
line 3399
;3399:	}
LABELV $1173
line 3402
;3400:
;3401:	//get the weapon information
;3402:	trap_BotGetWeaponInfo(bs->ws, bs->weaponnum, &wi);
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
line 3404
;3403:	//get the weapon specific aim accuracy and or aim skill
;3404:	if (wi.number == WP_MACHINEGUN) {
ADDRLP4 160+4
INDIRI4
CNSTI4 2
NEI4 $1179
line 3405
;3405:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_MACHINEGUN, 0, 1);
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
line 3406
;3406:	}
ADDRGP4 $1180
JUMPV
LABELV $1179
line 3407
;3407:	else if (wi.number == WP_SHOTGUN) {
ADDRLP4 160+4
INDIRI4
CNSTI4 3
NEI4 $1182
line 3408
;3408:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_SHOTGUN, 0, 1);
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
line 3409
;3409:	}
ADDRGP4 $1183
JUMPV
LABELV $1182
line 3410
;3410:	else if (wi.number == WP_GRENADE_LAUNCHER) {
ADDRLP4 160+4
INDIRI4
CNSTI4 4
NEI4 $1185
line 3411
;3411:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_GRENADELAUNCHER, 0, 1);
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
line 3412
;3412:		aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL_GRENADELAUNCHER, 0, 1);
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
line 3413
;3413:	}
ADDRGP4 $1186
JUMPV
LABELV $1185
line 3414
;3414:	else if (wi.number == WP_ROCKET_LAUNCHER) {
ADDRLP4 160+4
INDIRI4
CNSTI4 5
NEI4 $1188
line 3415
;3415:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_ROCKETLAUNCHER, 0, 1);
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
line 3416
;3416:		aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL_ROCKETLAUNCHER, 0, 1);
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
line 3417
;3417:	}
ADDRGP4 $1189
JUMPV
LABELV $1188
line 3418
;3418:	else if (wi.number == WP_LIGHTNING) {
ADDRLP4 160+4
INDIRI4
CNSTI4 6
NEI4 $1191
line 3419
;3419:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_LIGHTNING, 0, 1);
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
line 3420
;3420:	}
ADDRGP4 $1192
JUMPV
LABELV $1191
line 3421
;3421:	else if (wi.number == WP_RAILGUN) {
ADDRLP4 160+4
INDIRI4
CNSTI4 7
NEI4 $1194
line 3422
;3422:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_RAILGUN, 0, 1);
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
line 3423
;3423:	}
ADDRGP4 $1195
JUMPV
LABELV $1194
line 3424
;3424:	else if (wi.number == WP_PLASMAGUN) {
ADDRLP4 160+4
INDIRI4
CNSTI4 8
NEI4 $1197
line 3425
;3425:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_PLASMAGUN, 0, 1);
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
line 3426
;3426:		aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL_PLASMAGUN, 0, 1);
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
line 3427
;3427:	}
ADDRGP4 $1198
JUMPV
LABELV $1197
line 3428
;3428:	else if (wi.number == WP_BFG) {
ADDRLP4 160+4
INDIRI4
CNSTI4 9
NEI4 $1200
line 3429
;3429:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_BFG10K, 0, 1);
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
line 3430
;3430:		aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL_BFG10K, 0, 1);
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
line 3431
;3431:	}
LABELV $1200
LABELV $1198
LABELV $1195
LABELV $1192
LABELV $1189
LABELV $1186
LABELV $1183
LABELV $1180
line 3433
;3432:	//
;3433:	if (aim_accuracy <= 0) aim_accuracy = 0.0001f;
ADDRLP4 156
INDIRF4
CNSTF4 0
GTF4 $1203
ADDRLP4 156
CNSTF4 953267991
ASGNF4
LABELV $1203
line 3435
;3434:	//get the enemy entity information
;3435:	BotEntityInfo(bs->enemy, &entinfo);
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
line 3437
;3436:	//if the enemy is invisible then shoot crappy most of the time
;3437:	if (EntityIsInvisible(&entinfo)) {
ADDRLP4 0
ARGP4
ADDRLP4 996
ADDRGP4 EntityIsInvisible
CALLI4
ASGNI4
ADDRLP4 996
INDIRI4
CNSTI4 0
EQI4 $1205
line 3438
;3438:		if (random() > 0.1) aim_accuracy *= 0.4f;
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
LEF4 $1207
ADDRLP4 156
CNSTF4 1053609165
ADDRLP4 156
INDIRF4
MULF4
ASGNF4
LABELV $1207
line 3439
;3439:	}
LABELV $1205
line 3441
;3440:	//
;3441:	VectorSubtract(entinfo.origin, entinfo.lastvisorigin, enemyvelocity);
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
line 3442
;3442:	VectorScale(enemyvelocity, 1 / entinfo.update_time, enemyvelocity);
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
line 3444
;3443:	//enemy origin and velocity is remembered every 0.5 seconds
;3444:	if (bs->enemyposition_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6140
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $1228
line 3446
;3445:		//
;3446:		bs->enemyposition_time = FloatTime() + 0.5;
ADDRFP4 0
INDIRP4
CNSTI4 6140
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 3447
;3447:		VectorCopy(enemyvelocity, bs->enemyvelocity);
ADDRFP4 0
INDIRP4
CNSTI4 6232
ADDP4
ADDRLP4 712
INDIRB
ASGNB 12
line 3448
;3448:		VectorCopy(entinfo.origin, bs->enemyorigin);
ADDRFP4 0
INDIRP4
CNSTI4 6244
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3449
;3449:	}
LABELV $1228
line 3451
;3450:	//if not extremely skilled
;3451:	if (aim_skill < 0.9) {
ADDRLP4 736
INDIRF4
CNSTF4 1063675494
GEF4 $1231
line 3452
;3452:		VectorSubtract(entinfo.origin, bs->enemyorigin, dir);
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
line 3454
;3453:		//if the enemy moved a bit
;3454:		if (VectorLengthSquared(dir) > Square(48)) {
ADDRLP4 140
ARGP4
ADDRLP4 1008
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1008
INDIRF4
CNSTF4 1158676480
LEF4 $1240
line 3456
;3455:			//if the enemy changed direction
;3456:			if (DotProduct(bs->enemyvelocity, enemyvelocity) < 0) {
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
GEF4 $1242
line 3458
;3457:				//aim accuracy should be worse now
;3458:				aim_accuracy *= 0.7f;
ADDRLP4 156
CNSTF4 1060320051
ADDRLP4 156
INDIRF4
MULF4
ASGNF4
line 3459
;3459:			}
LABELV $1242
line 3460
;3460:		}
LABELV $1240
line 3461
;3461:	}
LABELV $1231
line 3463
;3462:	//check visibility of enemy
;3463:	enemyvisible = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, bs->enemy);
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
line 3465
;3464:	//if the enemy is visible
;3465:	if (enemyvisible) {
ADDRLP4 824
INDIRI4
CNSTI4 0
EQI4 $1246
line 3467
;3466:		//
;3467:		VectorCopy(entinfo.origin, bestorigin);
ADDRLP4 724
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3468
;3468:		bestorigin[2] += 8;
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 3471
;3469:		//get the start point shooting from
;3470:		//NOTE: the x and y projectile start offsets are ignored
;3471:		VectorCopy(bs->origin, start);
ADDRLP4 844
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 3472
;3472:		start[2] += bs->cur_ps.viewheight;
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
line 3473
;3473:		start[2] += wi.offset[2];
ADDRLP4 844+8
ADDRLP4 844+8
INDIRF4
ADDRLP4 160+292+8
INDIRF4
ADDF4
ASGNF4
line 3475
;3474:		//
;3475:		BotAI_Trace(&trace, start, mins, maxs, bestorigin, bs->entitynum, MASK_SHOT);
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
line 3477
;3476:		//if the enemy is NOT hit
;3477:		if (trace.fraction <= 1 && trace.ent != entinfo.number) {
ADDRLP4 740+8
INDIRF4
CNSTF4 1065353216
GTF4 $1254
ADDRLP4 740+80
INDIRI4
ADDRLP4 0+20
INDIRI4
EQI4 $1254
line 3478
;3478:			bestorigin[2] += 16;
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 3479
;3479:		}
LABELV $1254
line 3481
;3480:		//if it is not an instant hit weapon the bot might want to predict the enemy
;3481:		if (wi.speed) {
ADDRLP4 160+272
INDIRF4
CNSTF4 0
EQF4 $1260
line 3483
;3482:			//
;3483:			VectorSubtract(bestorigin, bs->origin, dir);
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
line 3484
;3484:			dist = VectorLength(dir);
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
line 3485
;3485:			VectorSubtract(entinfo.origin, bs->enemyorigin, dir);
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
line 3487
;3486:			//if the enemy is NOT pretty far away and strafing just small steps left and right
;3487:			if (!(dist > 100 && VectorLengthSquared(dir) < Square(32))) {
ADDRLP4 840
INDIRF4
CNSTF4 1120403456
LEF4 $1276
ADDRLP4 140
ARGP4
ADDRLP4 1024
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1024
INDIRF4
CNSTF4 1149239296
LTF4 $1274
LABELV $1276
line 3489
;3488:				//if skilled anough do exact prediction
;3489:				if (aim_skill > 0.8 &&
ADDRLP4 736
INDIRF4
CNSTF4 1061997773
LEF4 $1277
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1277
line 3491
;3490:						//if the weapon is ready to fire
;3491:						bs->cur_ps.weaponstate == WEAPON_READY) {
line 3495
;3492:					aas_clientmove_t move;
;3493:					vec3_t origin;
;3494:
;3495:					VectorSubtract(entinfo.origin, bs->origin, dir);
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
line 3497
;3496:					//distance towards the enemy
;3497:					dist = VectorLength(dir);
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
line 3499
;3498:					//direction the enemy is moving in
;3499:					VectorSubtract(entinfo.origin, entinfo.lastvisorigin, dir);
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
line 3501
;3500:					//
;3501:					VectorScale(dir, 1 / entinfo.update_time, dir);
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
line 3503
;3502:					//
;3503:					VectorCopy(entinfo.origin, origin);
ADDRLP4 1028
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3504
;3504:					origin[2] += 1;
ADDRLP4 1028+8
ADDRLP4 1028+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 3506
;3505:					//
;3506:					VectorClear(cmdmove);
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
line 3508
;3507:					//AAS_ClearShownDebugLines();
;3508:					trap_AAS_PredictClientMovement(&move, bs->enemy, origin,
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
line 3512
;3509:														PRESENCE_CROUCH, qfalse,
;3510:														dir, cmdmove, 0,
;3511:														dist * 10 / wi.speed, 0.1f, 0, 0, qfalse);
;3512:					VectorCopy(move.endpos, bestorigin);
ADDRLP4 724
ADDRLP4 1040
INDIRB
ASGNB 12
line 3514
;3513:					//BotAI_Print(PRT_MESSAGE, "%1.1f predicted speed = %f, frames = %f\n", FloatTime(), VectorLength(dir), dist * 10 / wi.speed);
;3514:				}
ADDRGP4 $1278
JUMPV
LABELV $1277
line 3516
;3515:				//if not that skilled do linear prediction
;3516:				else if (aim_skill > 0.4) {
ADDRLP4 736
INDIRF4
CNSTF4 1053609165
LEF4 $1310
line 3517
;3517:					VectorSubtract(entinfo.origin, bs->origin, dir);
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
line 3519
;3518:					//distance towards the enemy
;3519:					dist = VectorLength(dir);
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
line 3521
;3520:					//direction the enemy is moving in
;3521:					VectorSubtract(entinfo.origin, entinfo.lastvisorigin, dir);
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
line 3522
;3522:					dir[2] = 0;
ADDRLP4 140+8
CNSTF4 0
ASGNF4
line 3524
;3523:					//
;3524:					speed = VectorNormalize(dir) / entinfo.update_time;
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
line 3527
;3525:					//botimport.Print(PRT_MESSAGE, "speed = %f, wi->speed = %f\n", speed, wi->speed);
;3526:					//best spot to aim at
;3527:					VectorMA(entinfo.origin, (dist / wi.speed) * speed, dir, bestorigin);
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
line 3528
;3528:				}
LABELV $1310
LABELV $1278
line 3529
;3529:			}
LABELV $1274
line 3530
;3530:		}
LABELV $1260
line 3532
;3531:		//if the projectile does radial damage
;3532:		if (aim_skill > 0.6 && wi.proj.damagetype & DAMAGETYPE_RADIAL) {
ADDRLP4 736
INDIRF4
CNSTF4 1058642330
LEF4 $1345
ADDRLP4 160+344+180
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1345
line 3534
;3533:			//if the enemy isn't standing significantly higher than the bot
;3534:			if (entinfo.origin[2] < bs->origin[2] + 16) {
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
CNSTF4 1098907648
ADDF4
GEF4 $1349
line 3536
;3535:				//try to aim at the ground in front of the enemy
;3536:				VectorCopy(entinfo.origin, end);
ADDRLP4 956
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3537
;3537:				end[2] -= 64;
ADDRLP4 956+8
ADDRLP4 956+8
INDIRF4
CNSTF4 1115684864
SUBF4
ASGNF4
line 3538
;3538:				BotAI_Trace(&trace, entinfo.origin, NULL, NULL, end, entinfo.number, MASK_SHOT);
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
line 3540
;3539:				//
;3540:				VectorCopy(bestorigin, groundtarget);
ADDRLP4 944
ADDRLP4 724
INDIRB
ASGNB 12
line 3541
;3541:				if (trace.startsolid) groundtarget[2] = entinfo.origin[2] - 16;
ADDRLP4 740+4
INDIRI4
CNSTI4 0
EQI4 $1357
ADDRLP4 944+8
ADDRLP4 0+24+8
INDIRF4
CNSTF4 1098907648
SUBF4
ASGNF4
ADDRGP4 $1358
JUMPV
LABELV $1357
line 3542
;3542:				else groundtarget[2] = trace.endpos[2] - 8;
ADDRLP4 944+8
ADDRLP4 740+12+8
INDIRF4
CNSTF4 1090519040
SUBF4
ASGNF4
LABELV $1358
line 3544
;3543:				//trace a line from projectile start to ground target
;3544:				BotAI_Trace(&trace, start, NULL, NULL, groundtarget, bs->entitynum, MASK_SHOT);
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
line 3546
;3545:				//if hitpoint is not vertically too far from the ground target
;3546:				if (fabs(trace.endpos[2] - groundtarget[2]) < 50) {
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
GEF4 $1366
line 3547
;3547:					VectorSubtract(trace.endpos, groundtarget, dir);
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
line 3549
;3548:					//if the hitpoint is near anough the ground target
;3549:					if (VectorLengthSquared(dir) < Square(60)) {
ADDRLP4 140
ARGP4
ADDRLP4 1024
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1024
INDIRF4
CNSTF4 1163984896
GEF4 $1380
line 3550
;3550:						VectorSubtract(trace.endpos, start, dir);
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
line 3552
;3551:						//if the hitpoint is far anough from the bot
;3552:						if (VectorLengthSquared(dir) > Square(100)) {
ADDRLP4 140
ARGP4
ADDRLP4 1028
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1028
INDIRF4
CNSTF4 1176256512
LEF4 $1391
line 3554
;3553:							//check if the bot is visible from the ground target
;3554:							trace.endpos[2] += 1;
ADDRLP4 740+12+8
ADDRLP4 740+12+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 3555
;3555:							BotAI_Trace(&trace, trace.endpos, NULL, NULL, entinfo.origin, entinfo.number, MASK_SHOT);
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
line 3556
;3556:							if (trace.fraction >= 1) {
ADDRLP4 740+8
INDIRF4
CNSTF4 1065353216
LTF4 $1398
line 3558
;3557:								//botimport.Print(PRT_MESSAGE, "%1.1f aiming at ground\n", AAS_Time());
;3558:								VectorCopy(groundtarget, bestorigin);
ADDRLP4 724
ADDRLP4 944
INDIRB
ASGNB 12
line 3559
;3559:							}
LABELV $1398
line 3560
;3560:						}
LABELV $1391
line 3561
;3561:					}
LABELV $1380
line 3562
;3562:				}
LABELV $1366
line 3563
;3563:			}
LABELV $1349
line 3564
;3564:		}
LABELV $1345
line 3565
;3565:		bestorigin[0] += 20 * crandom() * (1 - aim_accuracy);
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
line 3566
;3566:		bestorigin[1] += 20 * crandom() * (1 - aim_accuracy);
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
line 3567
;3567:		bestorigin[2] += 10 * crandom() * (1 - aim_accuracy);
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
line 3568
;3568:	}
ADDRGP4 $1247
JUMPV
LABELV $1246
line 3569
;3569:	else {
line 3571
;3570:		//
;3571:		VectorCopy(bs->lastenemyorigin, bestorigin);
ADDRLP4 724
ADDRFP4 0
INDIRP4
CNSTI4 6548
ADDP4
INDIRB
ASGNB 12
line 3572
;3572:		bestorigin[2] += 8;
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 3574
;3573:		//if the bot is skilled anough
;3574:		if (aim_skill > 0.5) {
ADDRLP4 736
INDIRF4
CNSTF4 1056964608
LEF4 $1404
line 3576
;3575:			//do prediction shots around corners
;3576:			if (wi.number == WP_BFG ||
ADDRLP4 160+4
INDIRI4
CNSTI4 9
EQI4 $1412
ADDRLP4 160+4
INDIRI4
CNSTI4 5
EQI4 $1412
ADDRLP4 160+4
INDIRI4
CNSTI4 4
NEI4 $1406
LABELV $1412
line 3578
;3577:				wi.number == WP_ROCKET_LAUNCHER ||
;3578:				wi.number == WP_GRENADE_LAUNCHER) {
line 3580
;3579:				//create the chase goal
;3580:				goal.entitynum = bs->client;
ADDRLP4 884+40
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 3581
;3581:				goal.areanum = bs->areanum;
ADDRLP4 884+12
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ASGNI4
line 3582
;3582:				VectorCopy(bs->eye, goal.origin);
ADDRLP4 884
ADDRFP4 0
INDIRP4
CNSTI4 4936
ADDP4
INDIRB
ASGNB 12
line 3583
;3583:				VectorSet(goal.mins, -8, -8, -8);
ADDRLP4 884+16
CNSTF4 3238002688
ASGNF4
ADDRLP4 884+16+4
CNSTF4 3238002688
ASGNF4
ADDRLP4 884+16+8
CNSTF4 3238002688
ASGNF4
line 3584
;3584:				VectorSet(goal.maxs, 8, 8, 8);
ADDRLP4 884+28
CNSTF4 1090519040
ASGNF4
ADDRLP4 884+28+4
CNSTF4 1090519040
ASGNF4
ADDRLP4 884+28+8
CNSTF4 1090519040
ASGNF4
line 3586
;3585:				//
;3586:				if (trap_BotPredictVisiblePosition(bs->lastenemyorigin, bs->lastenemyareanum, &goal, TFL_DEFAULT, target)) {
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
EQI4 $1425
line 3587
;3587:					VectorSubtract(target, bs->eye, dir);
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
line 3588
;3588:					if (VectorLengthSquared(dir) > Square(80)) {
ADDRLP4 140
ARGP4
ADDRLP4 1024
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1024
INDIRF4
CNSTF4 1170735104
LEF4 $1431
line 3589
;3589:						VectorCopy(target, bestorigin);
ADDRLP4 724
ADDRLP4 828
INDIRB
ASGNB 12
line 3590
;3590:						bestorigin[2] -= 20;
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1101004800
SUBF4
ASGNF4
line 3591
;3591:					}
LABELV $1431
line 3592
;3592:				}
LABELV $1425
line 3593
;3593:				aim_accuracy = 1;
ADDRLP4 156
CNSTF4 1065353216
ASGNF4
line 3594
;3594:			}
LABELV $1406
line 3595
;3595:		}
LABELV $1404
line 3596
;3596:	}
LABELV $1247
line 3598
;3597:	//
;3598:	if (enemyvisible) {
ADDRLP4 824
INDIRI4
CNSTI4 0
EQI4 $1434
line 3599
;3599:		BotAI_Trace(&trace, bs->eye, NULL, NULL, bestorigin, bs->entitynum, MASK_SHOT);
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
line 3600
;3600:		VectorCopy(trace.endpos, bs->aimtarget);
ADDRFP4 0
INDIRP4
CNSTI4 6220
ADDP4
ADDRLP4 740+12
INDIRB
ASGNB 12
line 3601
;3601:	}
ADDRGP4 $1435
JUMPV
LABELV $1434
line 3602
;3602:	else {
line 3603
;3603:		VectorCopy(bestorigin, bs->aimtarget);
ADDRFP4 0
INDIRP4
CNSTI4 6220
ADDP4
ADDRLP4 724
INDIRB
ASGNB 12
line 3604
;3604:	}
LABELV $1435
line 3606
;3605:	//get aim direction
;3606:	VectorSubtract(bestorigin, bs->eye, dir);
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
line 3608
;3607:	//
;3608:	if (wi.number == WP_MACHINEGUN ||
ADDRLP4 160+4
INDIRI4
CNSTI4 2
EQI4 $1449
ADDRLP4 160+4
INDIRI4
CNSTI4 3
EQI4 $1449
ADDRLP4 160+4
INDIRI4
CNSTI4 6
EQI4 $1449
ADDRLP4 160+4
INDIRI4
CNSTI4 7
NEI4 $1441
LABELV $1449
line 3611
;3609:		wi.number == WP_SHOTGUN ||
;3610:		wi.number == WP_LIGHTNING ||
;3611:		wi.number == WP_RAILGUN) {
line 3613
;3612:		//distance towards the enemy
;3613:		dist = VectorLength(dir);
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
line 3614
;3614:		if (dist > 150) dist = 150;
ADDRLP4 840
INDIRF4
CNSTF4 1125515264
LEF4 $1450
ADDRLP4 840
CNSTF4 1125515264
ASGNF4
LABELV $1450
line 3615
;3615:		f = 0.6 + dist / 150 * 0.4;
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
line 3616
;3616:		aim_accuracy *= f;
ADDRLP4 156
ADDRLP4 156
INDIRF4
ADDRLP4 940
INDIRF4
MULF4
ASGNF4
line 3617
;3617:	}
LABELV $1441
line 3619
;3618:	//add some random stuff to the aim direction depending on the aim accuracy
;3619:	if (aim_accuracy < 0.8) {
ADDRLP4 156
INDIRF4
CNSTF4 1061997773
GEF4 $1452
line 3620
;3620:		VectorNormalize(dir);
ADDRLP4 140
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3621
;3621:		for (i = 0; i < 3; i++) dir[i] += 0.3 * crandom() * (1 - aim_accuracy);
ADDRLP4 152
CNSTI4 0
ASGNI4
LABELV $1454
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
LABELV $1455
ADDRLP4 152
ADDRLP4 152
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 3
LTI4 $1454
line 3622
;3622:	}
LABELV $1452
line 3624
;3623:	//set the ideal view angles
;3624:	vectoangles(dir, bs->ideal_viewangles);
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
line 3626
;3625:	//take the weapon spread into account for lower skilled bots
;3626:	bs->ideal_viewangles[PITCH] += 6 * wi.vspread * crandom() * (1 - aim_accuracy);
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
line 3627
;3627:	bs->ideal_viewangles[PITCH] = AngleMod(bs->ideal_viewangles[PITCH]);
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
line 3628
;3628:	bs->ideal_viewangles[YAW] += 6 * wi.hspread * crandom() * (1 - aim_accuracy);
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
line 3629
;3629:	bs->ideal_viewangles[YAW] = AngleMod(bs->ideal_viewangles[YAW]);
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
line 3631
;3630:	//if the bots should be really challenging
;3631:	if (bot_challenge.integer) {
ADDRGP4 bot_challenge+12
INDIRI4
CNSTI4 0
EQI4 $1460
line 3633
;3632:		//if the bot is really accurate and has the enemy in view for some time
;3633:		if (aim_accuracy > 0.9 && bs->enemysight_time < FloatTime() - 1) {
ADDRLP4 156
INDIRF4
CNSTF4 1063675494
LEF4 $1463
ADDRFP4 0
INDIRP4
CNSTI4 6132
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
GEF4 $1463
line 3635
;3634:			//set the view angles directly
;3635:			if (bs->ideal_viewangles[PITCH] > 180) bs->ideal_viewangles[PITCH] -= 360;
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
INDIRF4
CNSTF4 1127481344
LEF4 $1465
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
LABELV $1465
line 3636
;3636:			VectorCopy(bs->ideal_viewangles, bs->viewangles);
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
line 3637
;3637:			trap_EA_View(bs->client, bs->viewangles);
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
line 3638
;3638:		}
LABELV $1463
line 3639
;3639:	}
LABELV $1460
line 3640
;3640:}
LABELV $1161
endproc BotAimAtEnemy 1144 52
lit
align 4
LABELV $1468
byte 4 3238002688
byte 4 3238002688
byte 4 3238002688
align 4
LABELV $1469
byte 4 1090519040
byte 4 1090519040
byte 4 1090519040
export BotCheckAttack
code
proc BotCheckAttack 1028 28
line 3647
;3641:
;3642:/*
;3643:==================
;3644:BotCheckAttack
;3645:==================
;3646:*/
;3647:void BotCheckAttack(bot_state_t *bs) {
line 3656
;3648:	float points, reactiontime, fov, firethrottle;
;3649:	int attackentity;
;3650:	bsp_trace_t bsptrace;
;3651:	//float selfpreservation;
;3652:	vec3_t forward, right, start, end, dir, angles;
;3653:	weaponinfo_t wi;
;3654:	bsp_trace_t trace;
;3655:	aas_entityinfo_t entinfo;
;3656:	vec3_t mins = {-8, -8, -8}, maxs = {8, 8, 8};
ADDRLP4 808
ADDRGP4 $1468
INDIRB
ASGNB 12
ADDRLP4 820
ADDRGP4 $1469
INDIRB
ASGNB 12
line 3658
;3657:
;3658:	attackentity = bs->enemy;
ADDRLP4 576
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ASGNI4
line 3660
;3659:	//
;3660:	BotEntityInfo(attackentity, &entinfo);
ADDRLP4 576
INDIRI4
ARGI4
ADDRLP4 832
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3662
;3661:	// if not attacking a player
;3662:	if (attackentity >= MAX_CLIENTS) {
ADDRLP4 576
INDIRI4
CNSTI4 64
LTI4 $1470
line 3674
;3663:#ifdef MISSIONPACK
;3664:		// if attacking an obelisk
;3665:		if ( entinfo.number == redobelisk.entitynum ||
;3666:			entinfo.number == blueobelisk.entitynum ) {
;3667:			// if obelisk is respawning return
;3668:			if ( g_entities[entinfo.number].activator &&
;3669:				g_entities[entinfo.number].activator->s.frame == 2 ) {
;3670:				return;
;3671:			}
;3672:		}
;3673:#endif
;3674:	}
LABELV $1470
line 3676
;3675:
;3676:	reactiontime = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_REACTIONTIME, 0, 1);
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
line 3677
;3677:	if (bs->enemysight_time > FloatTime() - reactiontime) return;
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
LEF4 $1472
ADDRGP4 $1467
JUMPV
LABELV $1472
line 3678
;3678:	if (bs->teleport_time > FloatTime() - reactiontime) return;
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
LEF4 $1474
ADDRGP4 $1467
JUMPV
LABELV $1474
line 3680
;3679:	//if changing weapons
;3680:	if (bs->weaponchange_time > FloatTime() - 0.1) return;
ADDRFP4 0
INDIRP4
CNSTI4 6192
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1036831949
SUBF4
LEF4 $1476
ADDRGP4 $1467
JUMPV
LABELV $1476
line 3682
;3681:	//check fire throttle characteristic
;3682:	if (bs->firethrottlewait_time > FloatTime()) return;
ADDRFP4 0
INDIRP4
CNSTI4 6196
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $1478
ADDRGP4 $1467
JUMPV
LABELV $1478
line 3683
;3683:	firethrottle = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_FIRETHROTTLE, 0, 1);
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
line 3684
;3684:	if (bs->firethrottleshoot_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6200
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $1480
line 3685
;3685:		if (random() > firethrottle) {
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
LEF4 $1482
line 3686
;3686:			bs->firethrottlewait_time = FloatTime() + firethrottle;
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
line 3687
;3687:			bs->firethrottleshoot_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6200
ADDP4
CNSTF4 0
ASGNF4
line 3688
;3688:		}
ADDRGP4 $1483
JUMPV
LABELV $1482
line 3689
;3689:		else {
line 3690
;3690:			bs->firethrottleshoot_time = FloatTime() + 1 - firethrottle;
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
line 3691
;3691:			bs->firethrottlewait_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6196
ADDP4
CNSTF4 0
ASGNF4
line 3692
;3692:		}
LABELV $1483
line 3693
;3693:	}
LABELV $1480
line 3696
;3694:	//
;3695:	//
;3696:	VectorSubtract(bs->aimtarget, bs->eye, dir);
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
line 3698
;3697:	//
;3698:	if (bs->weaponnum == WP_GAUNTLET) {
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1486
line 3699
;3699:		if (VectorLengthSquared(dir) > Square(60)) {
ADDRLP4 580
ARGP4
ADDRLP4 992
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 992
INDIRF4
CNSTF4 1163984896
LEF4 $1488
line 3700
;3700:			return;
ADDRGP4 $1467
JUMPV
LABELV $1488
line 3702
;3701:		}
;3702:	}
LABELV $1486
line 3703
;3703:	if (VectorLengthSquared(dir) < Square(100))
ADDRLP4 580
ARGP4
ADDRLP4 992
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 992
INDIRF4
CNSTF4 1176256512
GEF4 $1490
line 3704
;3704:		fov = 120;
ADDRLP4 788
CNSTF4 1123024896
ASGNF4
ADDRGP4 $1491
JUMPV
LABELV $1490
line 3706
;3705:	else
;3706:		fov = 50;
ADDRLP4 788
CNSTF4 1112014848
ASGNF4
LABELV $1491
line 3708
;3707:	//
;3708:	vectoangles(dir, angles);
ADDRLP4 580
ARGP4
ADDRLP4 796
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3709
;3709:	if (!InFieldOfVision(bs->viewangles, fov, angles))
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
NEI4 $1492
line 3710
;3710:		return;
ADDRGP4 $1467
JUMPV
LABELV $1492
line 3711
;3711:	BotAI_Trace(&bsptrace, bs->eye, NULL, NULL, bs->aimtarget, bs->client, CONTENTS_SOLID|CONTENTS_PLAYERCLIP);
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
line 3712
;3712:	if (bsptrace.fraction < 1 && bsptrace.ent != attackentity)
ADDRLP4 704+8
INDIRF4
CNSTF4 1065353216
GEF4 $1494
ADDRLP4 704+80
INDIRI4
ADDRLP4 576
INDIRI4
EQI4 $1494
line 3713
;3713:		return;
ADDRGP4 $1467
JUMPV
LABELV $1494
line 3716
;3714:
;3715:	//get the weapon info
;3716:	trap_BotGetWeaponInfo(bs->ws, bs->weaponnum, &wi);
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
line 3718
;3717:	//get the start point shooting from
;3718:	VectorCopy(bs->origin, start);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 3719
;3719:	start[2] += bs->cur_ps.viewheight;
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
line 3720
;3720:	AngleVectors(bs->viewangles, forward, right, NULL);
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
line 3721
;3721:	start[0] += forward[0] * wi.offset[0] + right[0] * wi.offset[1];
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
line 3722
;3722:	start[1] += forward[1] * wi.offset[0] + right[1] * wi.offset[1];
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
line 3723
;3723:	start[2] += forward[2] * wi.offset[0] + right[2] * wi.offset[1] + wi.offset[2];
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
line 3725
;3724:	//end point aiming at
;3725:	VectorMA(start, 1000, forward, end);
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
line 3727
;3726:	//a little back to make sure not inside a very close enemy
;3727:	VectorMA(start, -12, forward, start);
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
line 3728
;3728:	BotAI_Trace(&trace, start, mins, maxs, end, bs->entitynum, MASK_SHOT);
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
line 3730
;3729:	//if the entity is a client
;3730:	if (trace.ent > 0 && trace.ent <= MAX_CLIENTS) {
ADDRLP4 592+80
INDIRI4
CNSTI4 0
LEI4 $1528
ADDRLP4 592+80
INDIRI4
CNSTI4 64
GTI4 $1528
line 3731
;3731:		if (trace.ent != attackentity) {
ADDRLP4 592+80
INDIRI4
ADDRLP4 576
INDIRI4
EQI4 $1532
line 3733
;3732:			//if a teammate is hit
;3733:			if (BotSameTeam(bs, trace.ent))
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
EQI4 $1535
line 3734
;3734:				return;
ADDRGP4 $1467
JUMPV
LABELV $1535
line 3735
;3735:		}
LABELV $1532
line 3736
;3736:	}
LABELV $1528
line 3738
;3737:	//if won't hit the enemy or not attacking a player (obelisk)
;3738:	if (trace.ent != attackentity || attackentity >= MAX_CLIENTS) {
ADDRLP4 592+80
INDIRI4
ADDRLP4 576
INDIRI4
NEI4 $1541
ADDRLP4 576
INDIRI4
CNSTI4 64
LTI4 $1538
LABELV $1541
line 3740
;3739:		//if the projectile does radial damage
;3740:		if (wi.proj.damagetype & DAMAGETYPE_RADIAL) {
ADDRLP4 24+344+180
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1542
line 3741
;3741:			if (trace.fraction * 1000 < wi.proj.radius) {
CNSTF4 1148846080
ADDRLP4 592+8
INDIRF4
MULF4
ADDRLP4 24+344+172
INDIRF4
GEF4 $1546
line 3742
;3742:				points = (wi.proj.damage - 0.5 * trace.fraction * 1000) * 0.5;
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
line 3743
;3743:				if (points > 0) {
ADDRLP4 972
INDIRF4
CNSTF4 0
LEF4 $1554
line 3744
;3744:					return;
ADDRGP4 $1467
JUMPV
LABELV $1554
line 3746
;3745:				}
;3746:			}
LABELV $1546
line 3748
;3747:			//FIXME: check if a teammate gets radial damage
;3748:		}
LABELV $1542
line 3749
;3749:	}
LABELV $1538
line 3751
;3750:	//if fire has to be release to activate weapon
;3751:	if (wi.flags & WFL_FIRERELEASED) {
ADDRLP4 24+176
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1556
line 3752
;3752:		if (bs->flags & BFL_ATTACKED) {
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1557
line 3753
;3753:			trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 3754
;3754:		}
line 3755
;3755:	}
ADDRGP4 $1557
JUMPV
LABELV $1556
line 3756
;3756:	else {
line 3757
;3757:		trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 3758
;3758:	}
LABELV $1557
line 3759
;3759:	bs->flags ^= BFL_ATTACKED;
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
line 3760
;3760:}
LABELV $1467
endproc BotCheckAttack 1028 28
lit
align 4
LABELV $1567
byte 4 1143930880
byte 4 1129054208
byte 4 1143472128
align 4
LABELV $1568
byte 4 1148256256
byte 4 1139408896
byte 4 1143603200
align 4
LABELV $1569
byte 4 1134034944
byte 4 1135607808
byte 4 1147535360
export BotMapScripts
code
proc BotMapScripts 1424 16
line 3767
;3761:
;3762:/*
;3763:==================
;3764:BotMapScripts
;3765:==================
;3766:*/
;3767:void BotMapScripts(bot_state_t *bs) {
line 3775
;3768:	char info[1024];
;3769:	char mapname[128];
;3770:	int i, shootbutton;
;3771:	float aim_accuracy;
;3772:	aas_entityinfo_t entinfo;
;3773:	vec3_t dir;
;3774:
;3775:	trap_GetServerinfo(info, sizeof(info));
ADDRLP4 272
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetServerinfo
CALLV
pop
line 3777
;3776:
;3777:	strncpy(mapname, Info_ValueForKey( info, "mapname" ), sizeof(mapname)-1);
ADDRLP4 272
ARGP4
ADDRGP4 $1562
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
line 3778
;3778:	mapname[sizeof(mapname)-1] = '\0';
ADDRLP4 144+127
CNSTI1 0
ASGNI1
line 3780
;3779:
;3780:	if (!Q_stricmp(mapname, "q3tourney6")) {
ADDRLP4 144
ARGP4
ADDRGP4 $1566
ARGP4
ADDRLP4 1320
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1320
INDIRI4
CNSTI4 0
NEI4 $1564
line 3781
;3781:		vec3_t mins = {700, 204, 672}, maxs = {964, 468, 680};
ADDRLP4 1324
ADDRGP4 $1567
INDIRB
ASGNB 12
ADDRLP4 1336
ADDRGP4 $1568
INDIRB
ASGNB 12
line 3782
;3782:		vec3_t buttonorg = {304, 352, 920};
ADDRLP4 1348
ADDRGP4 $1569
INDIRB
ASGNB 12
line 3784
;3783:		//NOTE: NEVER use the func_bobbing in q3tourney6
;3784:		bs->tfl &= ~TFL_FUNCBOB;
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
line 3786
;3785:		//if the bot is below the bounding box
;3786:		if (bs->origin[0] > mins[0] && bs->origin[0] < maxs[0]) {
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
LEF4 $1570
ADDRLP4 1364
INDIRF4
ADDRLP4 1336
INDIRF4
GEF4 $1570
line 3787
;3787:			if (bs->origin[1] > mins[1] && bs->origin[1] < maxs[1]) {
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
LEF4 $1572
ADDRLP4 1368
INDIRF4
ADDRLP4 1336+4
INDIRF4
GEF4 $1572
line 3788
;3788:				if (bs->origin[2] < mins[2]) {
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRLP4 1324+8
INDIRF4
GEF4 $1576
line 3789
;3789:					return;
ADDRGP4 $1561
JUMPV
LABELV $1576
line 3791
;3790:				}
;3791:			}
LABELV $1572
line 3792
;3792:		}
LABELV $1570
line 3793
;3793:		shootbutton = qfalse;
ADDRLP4 1296
CNSTI4 0
ASGNI4
line 3795
;3794:		//if an enemy is below this bounding box then shoot the button
;3795:		for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 140
CNSTI4 0
ASGNI4
ADDRGP4 $1582
JUMPV
LABELV $1579
line 3797
;3796:
;3797:			if (i == bs->client) continue;
ADDRLP4 140
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1583
ADDRGP4 $1580
JUMPV
LABELV $1583
line 3799
;3798:			//
;3799:			BotEntityInfo(i, &entinfo);
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3801
;3800:			//
;3801:			if (!entinfo.valid) continue;
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1585
ADDRGP4 $1580
JUMPV
LABELV $1585
line 3803
;3802:			//if the enemy isn't dead and the enemy isn't the bot self
;3803:			if (EntityIsDead(&entinfo) || entinfo.number == bs->entitynum) continue;
ADDRLP4 0
ARGP4
ADDRLP4 1368
ADDRGP4 EntityIsDead
CALLI4
ASGNI4
ADDRLP4 1368
INDIRI4
CNSTI4 0
NEI4 $1590
ADDRLP4 0+20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
NEI4 $1587
LABELV $1590
ADDRGP4 $1580
JUMPV
LABELV $1587
line 3805
;3804:			//
;3805:			if (entinfo.origin[0] > mins[0] && entinfo.origin[0] < maxs[0]) {
ADDRLP4 0+24
INDIRF4
ADDRLP4 1324
INDIRF4
LEF4 $1591
ADDRLP4 0+24
INDIRF4
ADDRLP4 1336
INDIRF4
GEF4 $1591
line 3806
;3806:				if (entinfo.origin[1] > mins[1] && entinfo.origin[1] < maxs[1]) {
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1324+4
INDIRF4
LEF4 $1595
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1336+4
INDIRF4
GEF4 $1595
line 3807
;3807:					if (entinfo.origin[2] < mins[2]) {
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 1324+8
INDIRF4
GEF4 $1603
line 3809
;3808:						//if there's a team mate below the crusher
;3809:						if (BotSameTeam(bs, i)) {
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
EQI4 $1608
line 3810
;3810:							shootbutton = qfalse;
ADDRLP4 1296
CNSTI4 0
ASGNI4
line 3811
;3811:							break;
ADDRGP4 $1581
JUMPV
LABELV $1608
line 3813
;3812:						}
;3813:						else {
line 3814
;3814:							shootbutton = qtrue;
ADDRLP4 1296
CNSTI4 1
ASGNI4
line 3815
;3815:						}
line 3816
;3816:					}
LABELV $1603
line 3817
;3817:				}
LABELV $1595
line 3818
;3818:			}
LABELV $1591
line 3819
;3819:		}
LABELV $1580
line 3795
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1582
ADDRLP4 140
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $1610
ADDRLP4 140
INDIRI4
CNSTI4 64
LTI4 $1579
LABELV $1610
LABELV $1581
line 3820
;3820:		if (shootbutton) {
ADDRLP4 1296
INDIRI4
CNSTI4 0
EQI4 $1565
line 3821
;3821:			bs->flags |= BFL_IDEALVIEWSET;
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
line 3822
;3822:			VectorSubtract(buttonorg, bs->eye, dir);
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
line 3823
;3823:			vectoangles(dir, bs->ideal_viewangles);
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
line 3824
;3824:			aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY, 0, 1);
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
line 3825
;3825:			bs->ideal_viewangles[PITCH] += 8 * crandom() * (1 - aim_accuracy);
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
line 3826
;3826:			bs->ideal_viewangles[PITCH] = AngleMod(bs->ideal_viewangles[PITCH]);
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
line 3827
;3827:			bs->ideal_viewangles[YAW] += 8 * crandom() * (1 - aim_accuracy);
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
line 3828
;3828:			bs->ideal_viewangles[YAW] = AngleMod(bs->ideal_viewangles[YAW]);
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
line 3830
;3829:			//
;3830:			if (InFieldOfVision(bs->viewangles, 20, bs->ideal_viewangles)) {
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
EQI4 $1565
line 3831
;3831:				trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 3832
;3832:			}
line 3833
;3833:		}
line 3834
;3834:	}
ADDRGP4 $1565
JUMPV
LABELV $1564
line 3835
;3835:	else if (!Q_stricmp(mapname, "mpq3tourney6")) {
ADDRLP4 144
ARGP4
ADDRGP4 $1621
ARGP4
ADDRLP4 1324
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1324
INDIRI4
CNSTI4 0
NEI4 $1619
line 3837
;3836:		//NOTE: NEVER use the func_bobbing in mpq3tourney6
;3837:		bs->tfl &= ~TFL_FUNCBOB;
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
line 3838
;3838:	}
LABELV $1619
LABELV $1565
line 3839
;3839:}
LABELV $1561
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
line 3852
;3840:
;3841:/*
;3842:==================
;3843:BotSetMovedir
;3844:==================
;3845:*/
;3846:// bk001205 - made these static
;3847:static vec3_t VEC_UP		= {0, -1,  0};
;3848:static vec3_t MOVEDIR_UP	= {0,  0,  1};
;3849:static vec3_t VEC_DOWN		= {0, -2,  0};
;3850:static vec3_t MOVEDIR_DOWN	= {0,  0, -1};
;3851:
;3852:void BotSetMovedir(vec3_t angles, vec3_t movedir) {
line 3853
;3853:	if (VectorCompare(angles, VEC_UP)) {
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
EQI4 $1623
line 3854
;3854:		VectorCopy(MOVEDIR_UP, movedir);
ADDRFP4 4
INDIRP4
ADDRGP4 MOVEDIR_UP
INDIRB
ASGNB 12
line 3855
;3855:	}
ADDRGP4 $1624
JUMPV
LABELV $1623
line 3856
;3856:	else if (VectorCompare(angles, VEC_DOWN)) {
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
EQI4 $1625
line 3857
;3857:		VectorCopy(MOVEDIR_DOWN, movedir);
ADDRFP4 4
INDIRP4
ADDRGP4 MOVEDIR_DOWN
INDIRB
ASGNB 12
line 3858
;3858:	}
ADDRGP4 $1626
JUMPV
LABELV $1625
line 3859
;3859:	else {
line 3860
;3860:		AngleVectors(angles, movedir, NULL, NULL);
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
line 3861
;3861:	}
LABELV $1626
LABELV $1624
line 3862
;3862:}
LABELV $1622
endproc BotSetMovedir 12 16
export BotModelMinsMaxs
proc BotModelMinsMaxs 40 0
line 3871
;3863:
;3864:/*
;3865:==================
;3866:BotModelMinsMaxs
;3867:
;3868:this is ugly
;3869:==================
;3870:*/
;3871:int BotModelMinsMaxs(int modelindex, int eType, int contents, vec3_t mins, vec3_t maxs) {
line 3875
;3872:	gentity_t *ent;
;3873:	int i;
;3874:
;3875:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 3876
;3876:	for (i = 0; i < level.num_entities; i++, ent++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1631
JUMPV
LABELV $1628
line 3877
;3877:		if ( !ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1633
line 3878
;3878:			continue;
ADDRGP4 $1629
JUMPV
LABELV $1633
line 3880
;3879:		}
;3880:		if ( eType && ent->s.eType != eType) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $1635
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $1635
line 3881
;3881:			continue;
ADDRGP4 $1629
JUMPV
LABELV $1635
line 3883
;3882:		}
;3883:		if ( contents && ent->r.contents != contents) {
ADDRLP4 12
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $1637
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $1637
line 3884
;3884:			continue;
ADDRGP4 $1629
JUMPV
LABELV $1637
line 3886
;3885:		}
;3886:		if (ent->s.modelindex == modelindex) {
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $1639
line 3887
;3887:			if (mins)
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1641
line 3888
;3888:				VectorAdd(ent->r.currentOrigin, ent->r.mins, mins);
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
LABELV $1641
line 3889
;3889:			if (maxs)
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1643
line 3890
;3890:				VectorAdd(ent->r.currentOrigin, ent->r.maxs, maxs);
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
LABELV $1643
line 3891
;3891:			return i;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $1627
JUMPV
LABELV $1639
line 3893
;3892:		}
;3893:	}
LABELV $1629
line 3876
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
LABELV $1631
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $1628
line 3894
;3894:	if (mins)
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1645
line 3895
;3895:		VectorClear(mins);
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
LABELV $1645
line 3896
;3896:	if (maxs)
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1647
line 3897
;3897:		VectorClear(maxs);
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
LABELV $1647
line 3898
;3898:	return 0;
CNSTI4 0
RETI4
LABELV $1627
endproc BotModelMinsMaxs 40 0
lit
align 4
LABELV $1650
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
align 4
LABELV $1651
byte 4 3212836864
byte 4 3212836864
byte 4 3212836864
export BotFuncButtonActivateGoal
code
proc BotFuncButtonActivateGoal 648 28
line 3906
;3899:}
;3900:
;3901:/*
;3902:==================
;3903:BotFuncButtonGoal
;3904:==================
;3905:*/
;3906:int BotFuncButtonActivateGoal(bot_state_t *bs, int bspent, bot_activategoal_t *activategoal) {
line 3912
;3907:	int i, areas[10], numareas, modelindex, entitynum;
;3908:	char model[128];
;3909:	float lip, dist, health, angle;
;3910:	vec3_t size, start, end, mins, maxs, angles, points[10];
;3911:	vec3_t movedir, origin, goalorigin, bboxmins, bboxmaxs;
;3912:	vec3_t extramins = {1, 1, 1}, extramaxs = {-1, -1, -1};
ADDRLP4 304
ADDRGP4 $1650
INDIRB
ASGNB 12
ADDRLP4 316
ADDRGP4 $1651
INDIRB
ASGNB 12
line 3915
;3913:	bsp_trace_t bsptrace;
;3914:
;3915:	activategoal->shoot = qfalse;
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
line 3916
;3916:	VectorClear(activategoal->target);
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
line 3918
;3917:	//create a bot goal towards the button
;3918:	trap_AAS_ValueForBSPEpairKey(bspent, "model", model, sizeof(model));
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $306
ARGP4
ADDRLP4 160
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 3919
;3919:	if (!*model)
ADDRLP4 160
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1652
line 3920
;3920:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1649
JUMPV
LABELV $1652
line 3921
;3921:	modelindex = atoi(model+1);
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
line 3922
;3922:	if (!modelindex)
ADDRLP4 288
INDIRI4
CNSTI4 0
NEI4 $1655
line 3923
;3923:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1649
JUMPV
LABELV $1655
line 3924
;3924:	VectorClear(angles);
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
line 3925
;3925:	entitynum = BotModelMinsMaxs(modelindex, ET_MOVER, 0, mins, maxs);
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
line 3927
;3926:	//get the lip of the button
;3927:	trap_AAS_FloatForBSPEpairKey(bspent, "lip", &lip);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $1659
ARGP4
ADDRLP4 328
ARGP4
ADDRGP4 trap_AAS_FloatForBSPEpairKey
CALLI4
pop
line 3928
;3928:	if (!lip) lip = 4;
ADDRLP4 328
INDIRF4
CNSTF4 0
NEF4 $1660
ADDRLP4 328
CNSTF4 1082130432
ASGNF4
LABELV $1660
line 3930
;3929:	//get the move direction from the angle
;3930:	trap_AAS_FloatForBSPEpairKey(bspent, "angle", &angle);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $1662
ARGP4
ADDRLP4 352
ARGP4
ADDRGP4 trap_AAS_FloatForBSPEpairKey
CALLI4
pop
line 3931
;3931:	VectorSet(angles, 0, angle, 0);
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
line 3932
;3932:	BotSetMovedir(angles, movedir);
ADDRLP4 96
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 BotSetMovedir
CALLV
pop
line 3934
;3933:	//button size
;3934:	VectorSubtract(maxs, mins, size);
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
line 3936
;3935:	//button origin
;3936:	VectorAdd(mins, maxs, origin);
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
line 3937
;3937:	VectorScale(origin, 0.5, origin);
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
line 3939
;3938:	//touch distance of the button
;3939:	dist = fabs(movedir[0]) * size[0] + fabs(movedir[1]) * size[1] + fabs(movedir[2]) * size[2];
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
line 3940
;3940:	dist *= 0.5;
ADDRLP4 28
CNSTF4 1056964608
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 3942
;3941:	//
;3942:	trap_AAS_FloatForBSPEpairKey(bspent, "health", &health);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $1685
ARGP4
ADDRLP4 348
ARGP4
ADDRGP4 trap_AAS_FloatForBSPEpairKey
CALLI4
pop
line 3944
;3943:	//if the button is shootable
;3944:	if (health) {
ADDRLP4 348
INDIRF4
CNSTF4 0
EQF4 $1686
line 3946
;3945:		//calculate the shoot target
;3946:		VectorMA(origin, -dist, movedir, goalorigin);
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
line 3948
;3947:		//
;3948:		VectorCopy(goalorigin, activategoal->target);
ADDRFP4 8
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 124
INDIRB
ASGNB 12
line 3949
;3949:		activategoal->shoot = qtrue;
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 1
ASGNI4
line 3951
;3950:		//
;3951:		BotAI_Trace(&bsptrace, bs->eye, NULL, NULL, goalorigin, bs->entitynum, MASK_SHOT);
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
line 3953
;3952:		// if the button is visible from the current position
;3953:		if (bsptrace.fraction >= 1.0 || bsptrace.ent == entitynum) {
ADDRLP4 356+8
INDIRF4
CNSTF4 1065353216
GEF4 $1698
ADDRLP4 356+80
INDIRI4
ADDRLP4 344
INDIRI4
NEI4 $1694
LABELV $1698
line 3955
;3954:			//
;3955:			activategoal->goal.entitynum = entitynum; //NOTE: this is the entity number of the shootable button
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 344
INDIRI4
ASGNI4
line 3956
;3956:			activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 3957
;3957:			activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 3958
;3958:			VectorCopy(bs->origin, activategoal->goal.origin);
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
line 3959
;3959:			activategoal->goal.areanum = bs->areanum;
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
line 3960
;3960:			VectorSet(activategoal->goal.mins, -8, -8, -8);
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
line 3961
;3961:			VectorSet(activategoal->goal.maxs, 8, 8, 8);
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
line 3963
;3962:			//
;3963:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1649
JUMPV
LABELV $1694
line 3965
;3964:		}
;3965:		else {
line 3968
;3966:			//create a goal from where the button is visible and shoot at the button from there
;3967:			//add bounding box size to the dist
;3968:			trap_AAS_PresenceTypeBoundingBox(PRESENCE_CROUCH, bboxmins, bboxmaxs);
CNSTI4 4
ARGI4
ADDRLP4 136
ARGP4
ADDRLP4 148
ARGP4
ADDRGP4 trap_AAS_PresenceTypeBoundingBox
CALLV
pop
line 3969
;3969:			for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1699
line 3970
;3970:				if (movedir[i] < 0) dist += fabs(movedir[i]) * fabs(bboxmaxs[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1703
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
ADDRGP4 $1704
JUMPV
LABELV $1703
line 3971
;3971:				else dist += fabs(movedir[i]) * fabs(bboxmins[i]);
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
LABELV $1704
line 3972
;3972:			}
LABELV $1700
line 3969
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1699
line 3974
;3973:			//calculate the goal origin
;3974:			VectorMA(origin, -dist, movedir, goalorigin);
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
line 3976
;3975:			//
;3976:			VectorCopy(goalorigin, start);
ADDRLP4 292
ADDRLP4 124
INDIRB
ASGNB 12
line 3977
;3977:			start[2] += 24;
ADDRLP4 292+8
ADDRLP4 292+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 3978
;3978:			VectorCopy(start, end);
ADDRLP4 332
ADDRLP4 292
INDIRB
ASGNB 12
line 3979
;3979:			end[2] -= 512;
ADDRLP4 332+8
ADDRLP4 332+8
INDIRF4
CNSTF4 1140850688
SUBF4
ASGNF4
line 3980
;3980:			numareas = trap_AAS_TraceAreas(start, end, areas, points, 10);
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
line 3982
;3981:			//
;3982:			for (i = numareas-1; i >= 0; i--) {
ADDRLP4 0
ADDRLP4 108
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $1716
JUMPV
LABELV $1713
line 3983
;3983:				if (trap_AAS_AreaReachability(areas[i])) {
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
EQI4 $1717
line 3984
;3984:					break;
ADDRGP4 $1715
JUMPV
LABELV $1717
line 3986
;3985:				}
;3986:			}
LABELV $1714
line 3982
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $1716
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1713
LABELV $1715
line 3987
;3987:			if (i < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1719
line 3989
;3988:				// FIXME: trace forward and maybe in other directions to find a valid area
;3989:			}
LABELV $1719
line 3990
;3990:			if (i >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1721
line 3992
;3991:				//
;3992:				VectorCopy(points[i], activategoal->goal.origin);
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
line 3993
;3993:				activategoal->goal.areanum = areas[i];
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
line 3994
;3994:				VectorSet(activategoal->goal.mins, 8, 8, 8);
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
line 3995
;3995:				VectorSet(activategoal->goal.maxs, -8, -8, -8);
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
line 3997
;3996:				//
;3997:				for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1723
line 3998
;3998:				{
line 3999
;3999:					if (movedir[i] < 0) activategoal->goal.maxs[i] += fabs(movedir[i]) * fabs(extramaxs[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1727
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
ADDRGP4 $1728
JUMPV
LABELV $1727
line 4000
;4000:					else activategoal->goal.mins[i] += fabs(movedir[i]) * fabs(extramins[i]);
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
LABELV $1728
line 4001
;4001:				} //end for
LABELV $1724
line 3997
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1723
line 4003
;4002:				//
;4003:				activategoal->goal.entitynum = entitynum;
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 344
INDIRI4
ASGNI4
line 4004
;4004:				activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 4005
;4005:				activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 4006
;4006:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1649
JUMPV
LABELV $1721
line 4008
;4007:			}
;4008:		}
line 4009
;4009:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1649
JUMPV
LABELV $1686
line 4011
;4010:	}
;4011:	else {
line 4013
;4012:		//add bounding box size to the dist
;4013:		trap_AAS_PresenceTypeBoundingBox(PRESENCE_CROUCH, bboxmins, bboxmaxs);
CNSTI4 4
ARGI4
ADDRLP4 136
ARGP4
ADDRLP4 148
ARGP4
ADDRGP4 trap_AAS_PresenceTypeBoundingBox
CALLV
pop
line 4014
;4014:		for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1729
line 4015
;4015:			if (movedir[i] < 0) dist += fabs(movedir[i]) * fabs(bboxmaxs[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1733
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
ADDRGP4 $1734
JUMPV
LABELV $1733
line 4016
;4016:			else dist += fabs(movedir[i]) * fabs(bboxmins[i]);
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
LABELV $1734
line 4017
;4017:		}
LABELV $1730
line 4014
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1729
line 4019
;4018:		//calculate the goal origin
;4019:		VectorMA(origin, -dist, movedir, goalorigin);
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
line 4021
;4020:		//
;4021:		VectorCopy(goalorigin, start);
ADDRLP4 292
ADDRLP4 124
INDIRB
ASGNB 12
line 4022
;4022:		start[2] += 24;
ADDRLP4 292+8
ADDRLP4 292+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 4023
;4023:		VectorCopy(start, end);
ADDRLP4 332
ADDRLP4 292
INDIRB
ASGNB 12
line 4024
;4024:		end[2] -= 100;
ADDRLP4 332+8
ADDRLP4 332+8
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 4025
;4025:		numareas = trap_AAS_TraceAreas(start, end, areas, NULL, 10);
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
line 4027
;4026:		//
;4027:		for (i = 0; i < numareas; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1746
JUMPV
LABELV $1743
line 4028
;4028:			if (trap_AAS_AreaReachability(areas[i])) {
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
EQI4 $1747
line 4029
;4029:				break;
ADDRGP4 $1745
JUMPV
LABELV $1747
line 4031
;4030:			}
;4031:		}
LABELV $1744
line 4027
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1746
ADDRLP4 0
INDIRI4
ADDRLP4 108
INDIRI4
LTI4 $1743
LABELV $1745
line 4032
;4032:		if (i < numareas) {
ADDRLP4 0
INDIRI4
ADDRLP4 108
INDIRI4
GEI4 $1749
line 4034
;4033:			//
;4034:			VectorCopy(origin, activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 4035
;4035:			activategoal->goal.areanum = areas[i];
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
line 4036
;4036:			VectorSubtract(mins, origin, activategoal->goal.mins);
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
line 4037
;4037:			VectorSubtract(maxs, origin, activategoal->goal.maxs);
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
line 4039
;4038:			//
;4039:			for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1759
line 4040
;4040:			{
line 4041
;4041:				if (movedir[i] < 0) activategoal->goal.maxs[i] += fabs(movedir[i]) * fabs(extramaxs[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1763
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
ADDRGP4 $1764
JUMPV
LABELV $1763
line 4042
;4042:				else activategoal->goal.mins[i] += fabs(movedir[i]) * fabs(extramins[i]);
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
LABELV $1764
line 4043
;4043:			} //end for
LABELV $1760
line 4039
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1759
line 4045
;4044:			//
;4045:			activategoal->goal.entitynum = entitynum;
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 344
INDIRI4
ASGNI4
line 4046
;4046:			activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 4047
;4047:			activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 4048
;4048:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1649
JUMPV
LABELV $1749
line 4050
;4049:		}
;4050:	}
line 4051
;4051:	return qfalse;
CNSTI4 0
RETI4
LABELV $1649
endproc BotFuncButtonActivateGoal 648 28
export BotFuncDoorActivateGoal
proc BotFuncDoorActivateGoal 1096 20
line 4059
;4052:}
;4053:
;4054:/*
;4055:==================
;4056:BotFuncDoorGoal
;4057:==================
;4058:*/
;4059:int BotFuncDoorActivateGoal(bot_state_t *bs, int bspent, bot_activategoal_t *activategoal) {
line 4065
;4060:	int modelindex, entitynum;
;4061:	char model[MAX_INFO_STRING];
;4062:	vec3_t mins, maxs, origin, angles;
;4063:
;4064:	//shoot at the shootable door
;4065:	trap_AAS_ValueForBSPEpairKey(bspent, "model", model, sizeof(model));
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $306
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4066
;4066:	if (!*model)
ADDRLP4 12
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1766
line 4067
;4067:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1765
JUMPV
LABELV $1766
line 4068
;4068:	modelindex = atoi(model+1);
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
line 4069
;4069:	if (!modelindex)
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $1769
line 4070
;4070:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1765
JUMPV
LABELV $1769
line 4071
;4071:	VectorClear(angles);
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
line 4072
;4072:	entitynum = BotModelMinsMaxs(modelindex, ET_MOVER, 0, mins, maxs);
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
line 4074
;4073:	//door origin
;4074:	VectorAdd(mins, maxs, origin);
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
line 4075
;4075:	VectorScale(origin, 0.5, origin);
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
line 4076
;4076:	VectorCopy(origin, activategoal->target);
ADDRFP4 8
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 4077
;4077:	activategoal->shoot = qtrue;
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 1
ASGNI4
line 4079
;4078:	//
;4079:	activategoal->goal.entitynum = entitynum; //NOTE: this is the entity number of the shootable door
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 1076
INDIRI4
ASGNI4
line 4080
;4080:	activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 4081
;4081:	activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 4082
;4082:	VectorCopy(bs->origin, activategoal->goal.origin);
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
line 4083
;4083:	activategoal->goal.areanum = bs->areanum;
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
line 4084
;4084:	VectorSet(activategoal->goal.mins, -8, -8, -8);
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
line 4085
;4085:	VectorSet(activategoal->goal.maxs, 8, 8, 8);
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
line 4086
;4086:	return qtrue;
CNSTI4 1
RETI4
LABELV $1765
endproc BotFuncDoorActivateGoal 1096 20
export BotTriggerMultipleActivateGoal
proc BotTriggerMultipleActivateGoal 300 20
line 4094
;4087:	} 
;4088:
;4089:/*
;4090:==================
;4091:BotTriggerMultipleGoal
;4092:==================
;4093:*/
;4094:int BotTriggerMultipleActivateGoal(bot_state_t *bs, int bspent, bot_activategoal_t *activategoal) {
line 4100
;4095:	int i, areas[10], numareas, modelindex, entitynum;
;4096:	char model[128];
;4097:	vec3_t start, end, mins, maxs, angles;
;4098:	vec3_t origin, goalorigin;
;4099:
;4100:	activategoal->shoot = qfalse;
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
line 4101
;4101:	VectorClear(activategoal->target);
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
line 4103
;4102:	//create a bot goal towards the trigger
;4103:	trap_AAS_ValueForBSPEpairKey(bspent, "model", model, sizeof(model));
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $306
ARGP4
ADDRLP4 84
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4104
;4104:	if (!*model)
ADDRLP4 84
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1784
line 4105
;4105:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1783
JUMPV
LABELV $1784
line 4106
;4106:	modelindex = atoi(model+1);
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
line 4107
;4107:	if (!modelindex)
ADDRLP4 224
INDIRI4
CNSTI4 0
NEI4 $1787
line 4108
;4108:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1783
JUMPV
LABELV $1787
line 4109
;4109:	VectorClear(angles);
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
line 4110
;4110:	entitynum = BotModelMinsMaxs(modelindex, 0, CONTENTS_TRIGGER, mins, maxs);
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
line 4112
;4111:	//trigger origin
;4112:	VectorAdd(mins, maxs, origin);
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
line 4113
;4113:	VectorScale(origin, 0.5, origin);
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
line 4114
;4114:	VectorCopy(origin, goalorigin);
ADDRLP4 252
ADDRLP4 4
INDIRB
ASGNB 12
line 4116
;4115:	//
;4116:	VectorCopy(goalorigin, start);
ADDRLP4 212
ADDRLP4 252
INDIRB
ASGNB 12
line 4117
;4117:	start[2] += 24;
ADDRLP4 212+8
ADDRLP4 212+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 4118
;4118:	VectorCopy(start, end);
ADDRLP4 228
ADDRLP4 212
INDIRB
ASGNB 12
line 4119
;4119:	end[2] -= 100;
ADDRLP4 228+8
ADDRLP4 228+8
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 4120
;4120:	numareas = trap_AAS_TraceAreas(start, end, areas, NULL, 10);
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
line 4122
;4121:	//
;4122:	for (i = 0; i < numareas; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1806
JUMPV
LABELV $1803
line 4123
;4123:		if (trap_AAS_AreaReachability(areas[i])) {
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
EQI4 $1807
line 4124
;4124:			break;
ADDRGP4 $1805
JUMPV
LABELV $1807
line 4126
;4125:		}
;4126:	}
LABELV $1804
line 4122
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1806
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $1803
LABELV $1805
line 4127
;4127:	if (i < numareas) {
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
GEI4 $1809
line 4128
;4128:		VectorCopy(origin, activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 4129
;4129:		activategoal->goal.areanum = areas[i];
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
line 4130
;4130:		VectorSubtract(mins, origin, activategoal->goal.mins);
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
line 4131
;4131:		VectorSubtract(maxs, origin, activategoal->goal.maxs);
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
line 4133
;4132:		//
;4133:		activategoal->goal.entitynum = entitynum;
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 264
INDIRI4
ASGNI4
line 4134
;4134:		activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 4135
;4135:		activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 4136
;4136:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1783
JUMPV
LABELV $1809
line 4138
;4137:	}
;4138:	return qfalse;
CNSTI4 0
RETI4
LABELV $1783
endproc BotTriggerMultipleActivateGoal 300 20
export BotPopFromActivateGoalStack
proc BotPopFromActivateGoalStack 4 8
line 4146
;4139:}
;4140:
;4141:/*
;4142:==================
;4143:BotPopFromActivateGoalStack
;4144:==================
;4145:*/
;4146:int BotPopFromActivateGoalStack(bot_state_t *bs) {
line 4147
;4147:	if (!bs->activatestack)
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1820
line 4148
;4148:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1819
JUMPV
LABELV $1820
line 4149
;4149:	BotEnableActivateGoalAreas(bs->activatestack, qtrue);
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
line 4150
;4150:	bs->activatestack->inuse = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CNSTI4 0
ASGNI4
line 4151
;4151:	bs->activatestack->justused_time = FloatTime();
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
line 4152
;4152:	bs->activatestack = bs->activatestack->next;
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
line 4153
;4153:	return qtrue;
CNSTI4 1
RETI4
LABELV $1819
endproc BotPopFromActivateGoalStack 4 8
export BotPushOntoActivateGoalStack
proc BotPushOntoActivateGoalStack 24 12
line 4161
;4154:}
;4155:
;4156:/*
;4157:==================
;4158:BotPushOntoActivateGoalStack
;4159:==================
;4160:*/
;4161:int BotPushOntoActivateGoalStack(bot_state_t *bs, bot_activategoal_t *activategoal) {
line 4165
;4162:	int i, best;
;4163:	float besttime;
;4164:
;4165:	best = -1;
ADDRLP4 8
CNSTI4 -1
ASGNI4
line 4166
;4166:	besttime = FloatTime() + 9999;
ADDRLP4 4
ADDRGP4 floattime
INDIRF4
CNSTF4 1176255488
ADDF4
ASGNF4
line 4168
;4167:	//
;4168:	for (i = 0; i < MAX_ACTIVATESTACK; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1823
line 4169
;4169:		if (!bs->activategoalheap[i].inuse) {
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
NEI4 $1827
line 4170
;4170:			if (bs->activategoalheap[i].justused_time < besttime) {
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
GEF4 $1829
line 4171
;4171:				besttime = bs->activategoalheap[i].justused_time;
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
line 4172
;4172:				best = i;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 4173
;4173:			}
LABELV $1829
line 4174
;4174:		}
LABELV $1827
line 4175
;4175:	}
LABELV $1824
line 4168
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $1823
line 4176
;4176:	if (best != -1) {
ADDRLP4 8
INDIRI4
CNSTI4 -1
EQI4 $1831
line 4177
;4177:		memcpy(&bs->activategoalheap[best], activategoal, sizeof(bot_activategoal_t));
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
line 4178
;4178:		bs->activategoalheap[best].inuse = qtrue;
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
line 4179
;4179:		bs->activategoalheap[best].next = bs->activatestack;
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
line 4180
;4180:		bs->activatestack = &bs->activategoalheap[best];
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
line 4181
;4181:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1822
JUMPV
LABELV $1831
line 4183
;4182:	}
;4183:	return qfalse;
CNSTI4 0
RETI4
LABELV $1822
endproc BotPushOntoActivateGoalStack 24 12
export BotClearActivateGoalStack
proc BotClearActivateGoalStack 0 4
line 4191
;4184:}
;4185:
;4186:/*
;4187:==================
;4188:BotClearActivateGoalStack
;4189:==================
;4190:*/
;4191:void BotClearActivateGoalStack(bot_state_t *bs) {
ADDRGP4 $1835
JUMPV
LABELV $1834
line 4193
;4192:	while(bs->activatestack)
;4193:		BotPopFromActivateGoalStack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotPopFromActivateGoalStack
CALLI4
pop
LABELV $1835
line 4192
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1834
line 4194
;4194:}
LABELV $1833
endproc BotClearActivateGoalStack 0 4
export BotEnableActivateGoalAreas
proc BotEnableActivateGoalAreas 12 8
line 4201
;4195:
;4196:/*
;4197:==================
;4198:BotEnableActivateGoalAreas
;4199:==================
;4200:*/
;4201:void BotEnableActivateGoalAreas(bot_activategoal_t *activategoal, int enable) {
line 4204
;4202:	int i;
;4203:
;4204:	if (activategoal->areasdisabled == !enable)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $1841
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $1842
JUMPV
LABELV $1841
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $1842
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $1838
line 4205
;4205:		return;
ADDRGP4 $1837
JUMPV
LABELV $1838
line 4206
;4206:	for (i = 0; i < activategoal->numareas; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1846
JUMPV
LABELV $1843
line 4207
;4207:		trap_AAS_EnableRoutingArea( activategoal->areas[i], enable );
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
LABELV $1844
line 4206
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1846
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
LTI4 $1843
line 4208
;4208:	activategoal->areasdisabled = !enable;
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $1848
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $1849
JUMPV
LABELV $1848
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $1849
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 4209
;4209:}
LABELV $1837
endproc BotEnableActivateGoalAreas 12 8
export BotIsGoingToActivateEntity
proc BotIsGoingToActivateEntity 8 0
line 4216
;4210:
;4211:/*
;4212:==================
;4213:BotIsGoingToActivateEntity
;4214:==================
;4215:*/
;4216:int BotIsGoingToActivateEntity(bot_state_t *bs, int entitynum) {
line 4220
;4217:	bot_activategoal_t *a;
;4218:	int i;
;4219:
;4220:	for (a = bs->activatestack; a; a = a->next) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $1854
JUMPV
LABELV $1851
line 4221
;4221:		if (a->time < FloatTime())
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $1855
line 4222
;4222:			continue;
ADDRGP4 $1852
JUMPV
LABELV $1855
line 4223
;4223:		if (a->goal.entitynum == entitynum)
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $1857
line 4224
;4224:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1850
JUMPV
LABELV $1857
line 4225
;4225:	}
LABELV $1852
line 4220
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
ASGNP4
LABELV $1854
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1851
line 4226
;4226:	for (i = 0; i < MAX_ACTIVATESTACK; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $1859
line 4227
;4227:		if (bs->activategoalheap[i].inuse)
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
EQI4 $1863
line 4228
;4228:			continue;
ADDRGP4 $1860
JUMPV
LABELV $1863
line 4230
;4229:		//
;4230:		if (bs->activategoalheap[i].goal.entitynum == entitynum) {
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
NEI4 $1865
line 4232
;4231:			// if the bot went for this goal less than 2 seconds ago
;4232:			if (bs->activategoalheap[i].justused_time > FloatTime() - 2)
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
LEF4 $1867
line 4233
;4233:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1850
JUMPV
LABELV $1867
line 4234
;4234:		}
LABELV $1865
line 4235
;4235:	}
LABELV $1860
line 4226
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 8
LTI4 $1859
line 4236
;4236:	return qfalse;
CNSTI4 0
RETI4
LABELV $1850
endproc BotIsGoingToActivateEntity 8 0
export BotGetActivateGoal
proc BotGetActivateGoal 3320 20
line 4249
;4237:}
;4238:
;4239:/*
;4240:==================
;4241:BotGetActivateGoal
;4242:
;4243:  returns the number of the bsp entity to activate
;4244:  goal->entitynum will be set to the game entity to activate
;4245:==================
;4246:*/
;4247://#define OBSTACLEDEBUG
;4248:
;4249:int BotGetActivateGoal(bot_state_t *bs, int entitynum, bot_activategoal_t *activategoal) {
line 4259
;4250:	int i, ent, cur_entities[10], spawnflags, modelindex, areas[MAX_ACTIVATEAREAS*2], numareas, t;
;4251:	char model[MAX_INFO_STRING], tmpmodel[128];
;4252:	char target[128], classname[128];
;4253:	float health;
;4254:	char targetname[10][128];
;4255:	aas_entityinfo_t entinfo;
;4256:	aas_areainfo_t areainfo;
;4257:	vec3_t origin, angles, absmins, absmaxs;
;4258:
;4259:	memset(activategoal, 0, sizeof(bot_activategoal_t));
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
line 4260
;4260:	BotEntityInfo(entitynum, &entinfo);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 3052
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 4261
;4261:	Com_sprintf(model, sizeof( model ), "*%d", entinfo.modelindex);
ADDRLP4 1712
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1870
ARGP4
ADDRLP4 3052+104
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 4262
;4262:	for (ent = trap_AAS_NextBSPEntity(0); ent; ent = trap_AAS_NextBSPEntity(ent)) {
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
ADDRGP4 $1875
JUMPV
LABELV $1872
line 4263
;4263:		if (!trap_AAS_ValueForBSPEpairKey(ent, "model", tmpmodel, sizeof(tmpmodel))) continue;
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $306
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
NEI4 $1876
ADDRGP4 $1873
JUMPV
LABELV $1876
line 4264
;4264:		if (!strcmp(model, tmpmodel)) break;
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
NEI4 $1878
ADDRGP4 $1874
JUMPV
LABELV $1878
line 4265
;4265:	}
LABELV $1873
line 4262
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
LABELV $1875
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1872
LABELV $1874
line 4266
;4266:	if (!ent) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1880
line 4267
;4267:		BotAI_Print(PRT_ERROR, "BotGetActivateGoal: no entity found with model %s\n", model);
CNSTI4 3
ARGI4
ADDRGP4 $1882
ARGP4
ADDRLP4 1712
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4268
;4268:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1869
JUMPV
LABELV $1880
line 4270
;4269:	}
;4270:	trap_AAS_ValueForBSPEpairKey(ent, "classname", classname, sizeof(classname));
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1883
ARGP4
ADDRLP4 1456
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4271
;4271:	if (!classname) {
ADDRLP4 1456
CVPU4 4
CNSTU4 0
NEU4 $1884
line 4272
;4272:		BotAI_Print(PRT_ERROR, "BotGetActivateGoal: entity with model %s has no classname\n", model);
CNSTI4 3
ARGI4
ADDRGP4 $1886
ARGP4
ADDRLP4 1712
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4273
;4273:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1869
JUMPV
LABELV $1884
line 4276
;4274:	}
;4275:	//if it is a door
;4276:	if (!strcmp(classname, "func_door")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $1889
ARGP4
ADDRLP4 3260
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3260
INDIRI4
CNSTI4 0
NEI4 $1887
line 4277
;4277:		if (trap_AAS_FloatForBSPEpairKey(ent, "health", &health)) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1685
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
EQI4 $1890
line 4279
;4278:			//if the door has health then the door must be shot to open
;4279:			if (health) {
ADDRLP4 3208
INDIRF4
CNSTF4 0
EQF4 $1892
line 4280
;4280:				BotFuncDoorActivateGoal(bs, ent, activategoal);
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
line 4281
;4281:				return ent;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1869
JUMPV
LABELV $1892
line 4283
;4282:			}
;4283:		}
LABELV $1890
line 4286
;4284:
;4285:	//if it is some glass
;4286: 	if (!strcmp(classname, "func_breakable")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $1896
ARGP4
ADDRLP4 3268
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3268
INDIRI4
CNSTI4 0
NEI4 $1894
line 4287
;4287: 		return ent;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1869
JUMPV
LABELV $1894
line 4291
;4288: 	}
;4289:	
;4290:		//
;4291:		trap_AAS_IntForBSPEpairKey(ent, "spawnflags", &spawnflags);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1897
ARGP4
ADDRLP4 3204
ARGP4
ADDRGP4 trap_AAS_IntForBSPEpairKey
CALLI4
pop
line 4293
;4292:		// if the door starts open then just wait for the door to return
;4293:		if ( spawnflags & 1 )
ADDRLP4 3204
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1898
line 4294
;4294:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $1869
JUMPV
LABELV $1898
line 4296
;4295:		//get the door origin
;4296:		if (!trap_AAS_VectorForBSPEpairKey(ent, "origin", origin)) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1902
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
NEI4 $1900
line 4297
;4297:			VectorClear(origin);
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
line 4298
;4298:		}
LABELV $1900
line 4300
;4299:		//if the door is open or opening already
;4300:		if (!VectorCompare(origin, entinfo.origin))
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
NEI4 $1905
line 4301
;4301:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $1869
JUMPV
LABELV $1905
line 4303
;4302:		// store all the areas the door is in
;4303:		trap_AAS_ValueForBSPEpairKey(ent, "model", model, sizeof(model));
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $306
ARGP4
ADDRLP4 1712
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4304
;4304:		if (*model) {
ADDRLP4 1712
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1908
line 4305
;4305:			modelindex = atoi(model+1);
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
line 4306
;4306:			if (modelindex) {
ADDRLP4 3212
INDIRI4
CNSTI4 0
EQI4 $1911
line 4307
;4307:				VectorClear(angles);
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
line 4308
;4308:				BotModelMinsMaxs(modelindex, ET_MOVER, 0, absmins, absmaxs);
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
line 4310
;4309:				//
;4310:				numareas = trap_AAS_BBoxAreas(absmins, absmaxs, areas, MAX_ACTIVATEAREAS*2);
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
line 4312
;4311:				// store the areas with reachabilities first
;4312:				for (i = 0; i < numareas; i++) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $1918
JUMPV
LABELV $1915
line 4313
;4313:					if (activategoal->numareas >= MAX_ACTIVATEAREAS)
ADDRFP4 8
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 32
LTI4 $1919
line 4314
;4314:						break;
ADDRGP4 $1917
JUMPV
LABELV $1919
line 4315
;4315:					if ( !trap_AAS_AreaReachability(areas[i]) ) {
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
NEI4 $1921
line 4316
;4316:						continue;
ADDRGP4 $1916
JUMPV
LABELV $1921
line 4318
;4317:					}
;4318:					trap_AAS_AreaInfo(areas[i], &areainfo);
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
line 4319
;4319:					if (areainfo.contents & AREACONTENTS_MOVER) {
ADDRLP4 2996
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $1923
line 4320
;4320:						activategoal->areas[activategoal->numareas++] = areas[i];
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
line 4321
;4321:					}
LABELV $1923
line 4322
;4322:				}
LABELV $1916
line 4312
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1918
ADDRLP4 132
INDIRI4
ADDRLP4 3048
INDIRI4
LTI4 $1915
LABELV $1917
line 4324
;4323:				// store any remaining areas
;4324:				for (i = 0; i < numareas; i++) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $1928
JUMPV
LABELV $1925
line 4325
;4325:					if (activategoal->numareas >= MAX_ACTIVATEAREAS)
ADDRFP4 8
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 32
LTI4 $1929
line 4326
;4326:						break;
ADDRGP4 $1927
JUMPV
LABELV $1929
line 4327
;4327:					if ( trap_AAS_AreaReachability(areas[i]) ) {
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
EQI4 $1931
line 4328
;4328:						continue;
ADDRGP4 $1926
JUMPV
LABELV $1931
line 4330
;4329:					}
;4330:					trap_AAS_AreaInfo(areas[i], &areainfo);
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
line 4331
;4331:					if (areainfo.contents & AREACONTENTS_MOVER) {
ADDRLP4 2996
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $1933
line 4332
;4332:						activategoal->areas[activategoal->numareas++] = areas[i];
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
line 4333
;4333:					}
LABELV $1933
line 4334
;4334:				}
LABELV $1926
line 4324
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1928
ADDRLP4 132
INDIRI4
ADDRLP4 3048
INDIRI4
LTI4 $1925
LABELV $1927
line 4335
;4335:			}
LABELV $1911
line 4336
;4336:		}
LABELV $1908
line 4337
;4337:	}
LABELV $1887
line 4339
;4338:	// if the bot is blocked by or standing on top of a button
;4339:	if (!strcmp(classname, "func_button")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $1937
ARGP4
ADDRLP4 3264
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3264
INDIRI4
CNSTI4 0
NEI4 $1935
line 4340
;4340:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1869
JUMPV
LABELV $1935
line 4343
;4341:	}
;4342:	// get the targetname so we can find an entity with a matching target
;4343:	if (!trap_AAS_ValueForBSPEpairKey(ent, "targetname", targetname[0], sizeof(targetname[0]))) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1940
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
NEI4 $1938
line 4344
;4344:		if (bot_developer.integer) {
ADDRGP4 bot_developer+12
INDIRI4
CNSTI4 0
EQI4 $1941
line 4345
;4345:			BotAI_Print(PRT_ERROR, "BotGetActivateGoal: entity with model \"%s\" has no targetname\n", model);
CNSTI4 3
ARGI4
ADDRGP4 $1944
ARGP4
ADDRLP4 1712
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4346
;4346:		}
LABELV $1941
line 4347
;4347:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1869
JUMPV
LABELV $1938
line 4350
;4348:	}
;4349:	// allow tree-like activation
;4350:	cur_entities[0] = trap_AAS_NextBSPEntity(0);
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
line 4351
;4351:	for (i = 0; i >= 0 && i < 10;) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $1948
JUMPV
LABELV $1945
line 4352
;4352:		for (ent = cur_entities[i]; ent; ent = trap_AAS_NextBSPEntity(ent)) {
ADDRLP4 0
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1416
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1952
JUMPV
LABELV $1949
line 4353
;4353:			if (!trap_AAS_ValueForBSPEpairKey(ent, "target", target, sizeof(target))) continue;
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1955
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
NEI4 $1953
ADDRGP4 $1950
JUMPV
LABELV $1953
line 4354
;4354:			if (!strcmp(targetname[i], target)) {
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
NEI4 $1956
line 4355
;4355:				cur_entities[i] = trap_AAS_NextBSPEntity(ent);
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
line 4356
;4356:				break;
ADDRGP4 $1951
JUMPV
LABELV $1956
line 4358
;4357:			}
;4358:		}
LABELV $1950
line 4352
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
LABELV $1952
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1949
LABELV $1951
line 4359
;4359:		if (!ent) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1958
line 4360
;4360:			if (bot_developer.integer) {
ADDRGP4 bot_developer+12
INDIRI4
CNSTI4 0
EQI4 $1960
line 4361
;4361:				BotAI_Print(PRT_ERROR, "BotGetActivateGoal: no entity with target \"%s\"\n", targetname[i]);
CNSTI4 3
ARGI4
ADDRGP4 $1963
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
line 4362
;4362:			}
LABELV $1960
line 4363
;4363:			i--;
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4364
;4364:			continue;
ADDRGP4 $1946
JUMPV
LABELV $1958
line 4366
;4365:		}
;4366:		if (!trap_AAS_ValueForBSPEpairKey(ent, "classname", classname, sizeof(classname))) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1883
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
NEI4 $1964
line 4367
;4367:			if (bot_developer.integer) {
ADDRGP4 bot_developer+12
INDIRI4
CNSTI4 0
EQI4 $1946
line 4368
;4368:				BotAI_Print(PRT_ERROR, "BotGetActivateGoal: entity with target \"%s\" has no classname\n", targetname[i]);
CNSTI4 3
ARGI4
ADDRGP4 $1969
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
line 4369
;4369:			}
line 4370
;4370:			continue;
ADDRGP4 $1946
JUMPV
LABELV $1964
line 4373
;4371:		}
;4372:		// BSP button model
;4373:		if (!strcmp(classname, "func_button")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $1937
ARGP4
ADDRLP4 3284
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3284
INDIRI4
CNSTI4 0
NEI4 $1970
line 4375
;4374:			//
;4375:			if (!BotFuncButtonActivateGoal(bs, ent, activategoal))
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
NEI4 $1972
line 4376
;4376:				continue;
ADDRGP4 $1946
JUMPV
LABELV $1972
line 4378
;4377:			// if the bot tries to activate this button already
;4378:			if ( bs->activatestack && bs->activatestack->inuse &&
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
EQU4 $1974
ADDRLP4 3292
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $1974
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
NEI4 $1974
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
LEF4 $1974
ADDRLP4 3292
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ADDRLP4 3300
INDIRF4
CNSTF4 1073741824
SUBF4
GEF4 $1974
line 4382
;4379:				 bs->activatestack->goal.entitynum == activategoal->goal.entitynum &&
;4380:				 bs->activatestack->time > FloatTime() &&
;4381:				 bs->activatestack->start_time < FloatTime() - 2)
;4382:				continue;
ADDRGP4 $1946
JUMPV
LABELV $1974
line 4384
;4383:			// if the bot is in a reachability area
;4384:			if ( trap_AAS_AreaReachability(bs->areanum) ) {
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
EQI4 $1976
line 4386
;4385:				// disable all areas the blocking entity is in
;4386:				BotEnableActivateGoalAreas( activategoal, qfalse );
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4388
;4387:				//
;4388:				t = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, activategoal->goal.areanum, bs->tfl);
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
line 4390
;4389:				// if the button is not reachable
;4390:				if (!t) {
ADDRLP4 2736
INDIRI4
CNSTI4 0
NEI4 $1978
line 4391
;4391:					continue;
ADDRGP4 $1946
JUMPV
LABELV $1978
line 4393
;4392:				}
;4393:				activategoal->time = FloatTime() + t * 0.01 + 5;
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
line 4394
;4394:			}
LABELV $1976
line 4395
;4395:			return ent;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1869
JUMPV
LABELV $1970
line 4398
;4396:		}
;4397:		// invisible trigger multiple box
;4398:		else if (!strcmp(classname, "trigger_multiple")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $1982
ARGP4
ADDRLP4 3288
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3288
INDIRI4
CNSTI4 0
NEI4 $1980
line 4400
;4399:			//
;4400:			if (!BotTriggerMultipleActivateGoal(bs, ent, activategoal))
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
NEI4 $1983
line 4401
;4401:				continue;
ADDRGP4 $1946
JUMPV
LABELV $1983
line 4403
;4402:			// if the bot tries to activate this trigger already
;4403:			if ( bs->activatestack && bs->activatestack->inuse &&
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
EQU4 $1985
ADDRLP4 3296
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $1985
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
NEI4 $1985
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
LEF4 $1985
ADDRLP4 3296
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ADDRLP4 3304
INDIRF4
CNSTF4 1073741824
SUBF4
GEF4 $1985
line 4407
;4404:				 bs->activatestack->goal.entitynum == activategoal->goal.entitynum &&
;4405:				 bs->activatestack->time > FloatTime() &&
;4406:				 bs->activatestack->start_time < FloatTime() - 2)
;4407:				continue;
ADDRGP4 $1946
JUMPV
LABELV $1985
line 4409
;4408:			// if the bot is in a reachability area
;4409:			if ( trap_AAS_AreaReachability(bs->areanum) ) {
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
EQI4 $1987
line 4411
;4410:				// disable all areas the blocking entity is in
;4411:				BotEnableActivateGoalAreas( activategoal, qfalse );
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4413
;4412:				//
;4413:				t = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, activategoal->goal.areanum, bs->tfl);
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
line 4415
;4414:				// if the trigger is not reachable
;4415:				if (!t) {
ADDRLP4 2736
INDIRI4
CNSTI4 0
NEI4 $1989
line 4416
;4416:					continue;
ADDRGP4 $1946
JUMPV
LABELV $1989
line 4418
;4417:				}
;4418:				activategoal->time = FloatTime() + t * 0.01 + 5;
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
line 4419
;4419:			}
LABELV $1987
line 4420
;4420:			return ent;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1869
JUMPV
LABELV $1980
line 4422
;4421:		}
;4422:		else if (!strcmp(classname, "func_timer")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $1993
ARGP4
ADDRLP4 3292
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3292
INDIRI4
CNSTI4 0
NEI4 $1991
line 4424
;4423:			// just skip the func_timer
;4424:			continue;
ADDRGP4 $1946
JUMPV
LABELV $1991
line 4427
;4425:		}
;4426:		// the actual button or trigger might be linked through a target_relay or target_delay
;4427:		else if (!strcmp(classname, "target_relay") || !strcmp(classname, "target_delay")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $1996
ARGP4
ADDRLP4 3296
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3296
INDIRI4
CNSTI4 0
EQI4 $1998
ADDRLP4 1456
ARGP4
ADDRGP4 $1997
ARGP4
ADDRLP4 3300
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3300
INDIRI4
CNSTI4 0
NEI4 $1994
LABELV $1998
line 4428
;4428:			if (trap_AAS_ValueForBSPEpairKey(ent, "targetname", targetname[i+1], sizeof(targetname[0]))) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1940
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
EQI4 $1999
line 4429
;4429:				i++;
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4430
;4430:				cur_entities[i] = trap_AAS_NextBSPEntity(0);
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
line 4431
;4431:			}
LABELV $1999
line 4432
;4432:		}
LABELV $1994
line 4433
;4433:	}
LABELV $1946
line 4351
LABELV $1948
ADDRLP4 132
INDIRI4
CNSTI4 0
LTI4 $2002
ADDRLP4 132
INDIRI4
CNSTI4 10
LTI4 $1945
LABELV $2002
line 4437
;4434:#ifdef OBSTACLEDEBUG
;4435:	BotAI_Print(PRT_ERROR, "BotGetActivateGoal: no valid activator for entity with target \"%s\"\n", targetname[0]);
;4436:#endif
;4437:	return 0;
CNSTI4 0
RETI4
LABELV $1869
endproc BotGetActivateGoal 3320 20
export BotGoForActivateGoal
proc BotGoForActivateGoal 144 8
line 4445
;4438:}
;4439:
;4440:/*
;4441:==================
;4442:BotGoForActivateGoal
;4443:==================
;4444:*/
;4445:int BotGoForActivateGoal(bot_state_t *bs, bot_activategoal_t *activategoal) {
line 4448
;4446:	aas_entityinfo_t activateinfo;
;4447:
;4448:	activategoal->inuse = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 1
ASGNI4
line 4449
;4449:	if (!activategoal->time)
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
CNSTF4 0
NEF4 $2004
line 4450
;4450:		activategoal->time = FloatTime() + 10;
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1092616192
ADDF4
ASGNF4
LABELV $2004
line 4451
;4451:	activategoal->start_time = FloatTime();
ADDRFP4 4
INDIRP4
CNSTI4 64
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4452
;4452:	BotEntityInfo(activategoal->goal.entitynum, &activateinfo);
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
line 4453
;4453:	VectorCopy(activateinfo.origin, activategoal->origin);
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 4455
;4454:	//
;4455:	if (BotPushOntoActivateGoalStack(bs, activategoal)) {
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
EQI4 $2007
line 4457
;4456:		// enter the activate entity AI node
;4457:		AIEnter_Seek_ActivateEntity(bs, "BotGoForActivateGoal");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2009
ARGP4
ADDRGP4 AIEnter_Seek_ActivateEntity
CALLV
pop
line 4458
;4458:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2003
JUMPV
LABELV $2007
line 4460
;4459:	}
;4460:	else {
line 4462
;4461:		// enable any routing areas that were disabled
;4462:		BotEnableActivateGoalAreas(activategoal, qtrue);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4463
;4463:		return qfalse;
CNSTI4 0
RETI4
LABELV $2003
endproc BotGoForActivateGoal 144 8
export BotPrintActivateGoalInfo
proc BotPrintActivateGoalInfo 296 36
line 4472
;4464:	}
;4465:}
;4466:
;4467:/*
;4468:==================
;4469:BotPrintActivateGoalInfo
;4470:==================
;4471:*/
;4472:void BotPrintActivateGoalInfo(bot_state_t *bs, bot_activategoal_t *activategoal, int bspent) {
line 4477
;4473:	char netname[MAX_NETNAME];
;4474:	char classname[128];
;4475:	char buf[128];
;4476:
;4477:	ClientName(bs->client, netname, sizeof(netname));
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
line 4478
;4478:	trap_AAS_ValueForBSPEpairKey(bspent, "classname", classname, sizeof(classname));
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $1883
ARGP4
ADDRLP4 36
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4479
;4479:	if (activategoal->shoot) {
ADDRFP4 4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2011
line 4480
;4480:		Com_sprintf(buf, sizeof(buf), "%s: I have to shoot at a %s from %1.1f %1.1f %1.1f in area %d\n",
ADDRLP4 164
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $2013
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
line 4486
;4481:						netname, classname,
;4482:						activategoal->goal.origin[0],
;4483:						activategoal->goal.origin[1],
;4484:						activategoal->goal.origin[2],
;4485:						activategoal->goal.areanum);
;4486:	}
ADDRGP4 $2012
JUMPV
LABELV $2011
line 4487
;4487:	else {
line 4488
;4488:		Com_sprintf(buf, sizeof(buf), "%s: I have to activate a %s at %1.1f %1.1f %1.1f in area %d\n",
ADDRLP4 164
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $2014
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
line 4494
;4489:						netname, classname,
;4490:						activategoal->goal.origin[0],
;4491:						activategoal->goal.origin[1],
;4492:						activategoal->goal.origin[2],
;4493:						activategoal->goal.areanum);
;4494:	}
LABELV $2012
line 4495
;4495:	trap_EA_Say(bs->client, buf);
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
line 4496
;4496:}
LABELV $2010
endproc BotPrintActivateGoalInfo 296 36
export BotRandomMove
proc BotRandomMove 32 16
line 4503
;4497:
;4498:/*
;4499:==================
;4500:BotRandomMove
;4501:==================
;4502:*/
;4503:void BotRandomMove(bot_state_t *bs, bot_moveresult_t *moveresult) {
line 4506
;4504:	vec3_t dir, angles;
;4505:
;4506:	angles[0] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 4507
;4507:	angles[1] = random() * 360;
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
line 4508
;4508:	angles[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 4509
;4509:	AngleVectors(angles, dir, NULL, NULL);
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
line 4511
;4510:
;4511:	trap_BotMoveInDirection(bs->ms, dir, 400, MOVE_WALK);
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
line 4513
;4512:
;4513:	moveresult->failure = qfalse;
ADDRFP4 4
INDIRP4
CNSTI4 0
ASGNI4
line 4514
;4514:	VectorCopy(dir, moveresult->movedir);
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 12
INDIRB
ASGNB 12
line 4515
;4515:}
LABELV $2015
endproc BotRandomMove 32 16
lit
align 4
LABELV $2019
byte 4 0
byte 4 0
byte 4 1065353216
export BotAIBlocked
code
proc BotAIBlocked 528 16
line 4528
;4516:
;4517:/*
;4518:==================
;4519:BotAIBlocked
;4520:
;4521:Very basic handling of bots being blocked by other entities.
;4522:Check what kind of entity is blocking the bot and try to activate
;4523:it. If that's not an option then try to walk around or over the entity.
;4524:Before the bot ends in this part of the AI it should predict which doors to
;4525:open, which buttons to activate etc.
;4526:==================
;4527:*/
;4528:void BotAIBlocked(bot_state_t *bs, bot_moveresult_t *moveresult, int activate) {
line 4530
;4529:	int movetype, bspent;
;4530:	vec3_t hordir, start, end, mins, maxs, sideward, angles, up = {0, 0, 1};
ADDRLP4 228
ADDRGP4 $2019
INDIRB
ASGNB 12
line 4535
;4531:	aas_entityinfo_t entinfo;
;4532:	bot_activategoal_t activategoal;
;4533:
;4534:	// if the bot is not blocked by anything
;4535:	if (!moveresult->blocked) {
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2020
line 4536
;4536:		bs->notblocked_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6204
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4537
;4537:		return;
ADDRGP4 $2018
JUMPV
LABELV $2020
line 4540
;4538:	}
;4539:	// if stuck in a solid area
;4540:	if ( moveresult->type == RESULTTYPE_INSOLIDAREA ) {
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 8
NEI4 $2022
line 4542
;4541:		// move in a random direction in the hope to get out
;4542:		BotRandomMove(bs, moveresult);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRandomMove
CALLV
pop
line 4544
;4543:		//
;4544:		return;
ADDRGP4 $2018
JUMPV
LABELV $2022
line 4547
;4545:	}
;4546:	// get info for the entity that is blocking the bot
;4547:	BotEntityInfo(moveresult->blockentity, &entinfo);
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
line 4553
;4548:#ifdef OBSTACLEDEBUG
;4549:	ClientName(bs->client, netname, sizeof(netname));
;4550:	BotAI_Print(PRT_MESSAGE, "%s: I'm blocked by model %d\n", netname, entinfo.modelindex);
;4551:#endif OBSTACLEDEBUG
;4552:	// if blocked by a bsp model and the bot wants to activate it
;4553:	if (activate && entinfo.modelindex > 0 && entinfo.modelindex <= max_bspmodelindex) {
ADDRLP4 488
CNSTI4 0
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 488
INDIRI4
EQI4 $2024
ADDRLP4 40+104
INDIRI4
ADDRLP4 488
INDIRI4
LEI4 $2024
ADDRLP4 40+104
INDIRI4
ADDRGP4 max_bspmodelindex
INDIRI4
GTI4 $2024
line 4555
;4554:		// find the bsp entity which should be activated in order to get the blocking entity out of the way
;4555:		bspent = BotGetActivateGoal(bs, entinfo.number, &activategoal);
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
line 4556
;4556:		if (bspent) {
ADDRLP4 484
INDIRI4
CNSTI4 0
EQI4 $2029
line 4558
;4557:			//
;4558:			if (bs->activatestack && !bs->activatestack->inuse)
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
EQU4 $2031
ADDRLP4 496
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $2031
line 4559
;4559:				bs->activatestack = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
CNSTP4 0
ASGNP4
LABELV $2031
line 4561
;4560:			// if not already trying to activate this entity
;4561:			if (!BotIsGoingToActivateEntity(bs, activategoal.goal.entitynum)) {
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
NEI4 $2033
line 4563
;4562:				//
;4563:				BotGoForActivateGoal(bs, &activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 240
ARGP4
ADDRGP4 BotGoForActivateGoal
CALLI4
pop
line 4564
;4564:			}
LABELV $2033
line 4568
;4565:			// if ontop of an obstacle or
;4566:			// if the bot is not in a reachability area it'll still
;4567:			// need some dynamic obstacle avoidance, otherwise return
;4568:			if (!(moveresult->flags & MOVERESULT_ONTOPOFOBSTACLE) &&
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $2030
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
EQI4 $2030
line 4570
;4569:				trap_AAS_AreaReachability(bs->areanum))
;4570:				return;
ADDRGP4 $2018
JUMPV
line 4571
;4571:		}
LABELV $2029
line 4572
;4572:		else {
line 4574
;4573:			// enable any routing areas that were disabled
;4574:			BotEnableActivateGoalAreas(&activategoal, qtrue);
ADDRLP4 240
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4575
;4575:		}
LABELV $2030
line 4576
;4576:	}
LABELV $2024
line 4578
;4577:	// just some basic dynamic obstacle avoidance code
;4578:	hordir[0] = moveresult->movedir[0];
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ASGNF4
line 4579
;4579:	hordir[1] = moveresult->movedir[1];
ADDRLP4 0+4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ASGNF4
line 4580
;4580:	hordir[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 4582
;4581:	// if no direction just take a random direction
;4582:	if (VectorNormalize(hordir) < 0.1) {
ADDRLP4 0
ARGP4
ADDRLP4 492
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 492
INDIRF4
CNSTF4 1036831949
GEF4 $2041
line 4583
;4583:		VectorSet(angles, 0, 360 * random(), 0);
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
line 4584
;4584:		AngleVectors(angles, hordir, NULL, NULL);
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
line 4585
;4585:	}
LABELV $2041
line 4589
;4586:	//
;4587:	//if (moveresult->flags & MOVERESULT_ONTOPOFOBSTACLE) movetype = MOVE_JUMP;
;4588:	//else
;4589:	movetype = MOVE_WALK;
ADDRLP4 36
CNSTI4 1
ASGNI4
line 4592
;4590:	// if there's an obstacle at the bot's feet and head then
;4591:	// the bot might be able to crouch through
;4592:	VectorCopy(bs->origin, start);
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 4593
;4593:	start[2] += 18;
ADDRLP4 24+8
ADDRLP4 24+8
INDIRF4
CNSTF4 1099956224
ADDF4
ASGNF4
line 4594
;4594:	VectorMA(start, 5, hordir, end);
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
line 4595
;4595:	VectorSet(mins, -16, -16, -24);
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
line 4596
;4596:	VectorSet(maxs, 16, 16, 4);
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
line 4601
;4597:	//
;4598:	//bsptrace = AAS_Trace(start, mins, maxs, end, bs->entitynum, MASK_PLAYERSOLID);
;4599:	//if (bsptrace.fraction >= 1) movetype = MOVE_CROUCH;
;4600:	// get the sideward vector
;4601:	CrossProduct(hordir, up, sideward);
ADDRLP4 0
ARGP4
ADDRLP4 228
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 4603
;4602:	//
;4603:	if (bs->flags & BFL_AVOIDRIGHT) VectorNegate(sideward, sideward);
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $2056
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
LABELV $2056
line 4605
;4604:	// try to crouch straight forward?
;4605:	if (movetype != MOVE_CROUCH || !trap_BotMoveInDirection(bs->ms, hordir, 400, movetype)) {
ADDRLP4 36
INDIRI4
CNSTI4 2
NEI4 $2064
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
NEI4 $2062
LABELV $2064
line 4607
;4606:		// perform the movement
;4607:		if (!trap_BotMoveInDirection(bs->ms, sideward, 400, movetype)) {
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
NEI4 $2065
line 4609
;4608:			// flip the avoid direction flag
;4609:			bs->flags ^= BFL_AVOIDRIGHT;
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
line 4612
;4610:			// flip the direction
;4611:			// VectorNegate(sideward, sideward);
;4612:			VectorMA(sideward, -1, hordir, sideward);
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
line 4614
;4613:			// move in the other direction
;4614:			trap_BotMoveInDirection(bs->ms, sideward, 400, movetype);
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
line 4615
;4615:		}
LABELV $2065
line 4616
;4616:	}
LABELV $2062
line 4618
;4617:	//
;4618:	if (bs->notblocked_time < FloatTime() - 0.4) {
ADDRFP4 0
INDIRP4
CNSTI4 6204
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1053609165
SUBF4
GEF4 $2073
line 4621
;4619:		// just reset goals and hope the bot will go into another direction?
;4620:		// is this still needed??
;4621:		if (bs->ainode == AINode_Seek_NBG) bs->nbg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 AINode_Seek_NBG
CVPU4 4
NEU4 $2075
ADDRFP4 0
INDIRP4
CNSTI4 6072
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 $2076
JUMPV
LABELV $2075
line 4622
;4622:		else if (bs->ainode == AINode_Seek_LTG) bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 AINode_Seek_LTG
CVPU4 4
NEU4 $2077
ADDRFP4 0
INDIRP4
CNSTI4 6068
ADDP4
CNSTF4 0
ASGNF4
LABELV $2077
LABELV $2076
line 4623
;4623:	}
LABELV $2073
line 4624
;4624:}
LABELV $2018
endproc BotAIBlocked 528 16
export BotAIPredictObstacles
proc BotAIPredictObstacles 324 44
line 4636
;4625:
;4626:/*
;4627:==================
;4628:BotAIPredictObstacles
;4629:
;4630:Predict the route towards the goal and check if the bot
;4631:will be blocked by certain obstacles. When the bot has obstacles
;4632:on it's path the bot should figure out if they can be removed
;4633:by activating certain entities.
;4634:==================
;4635:*/
;4636:int BotAIPredictObstacles(bot_state_t *bs, bot_goal_t *goal) {
line 4641
;4637:	int modelnum, entitynum, bspent;
;4638:	bot_activategoal_t activategoal;
;4639:	aas_predictroute_t route;
;4640:
;4641:	if (!bot_predictobstacles.integer)
ADDRGP4 bot_predictobstacles+12
INDIRI4
CNSTI4 0
NEI4 $2080
line 4642
;4642:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2079
JUMPV
LABELV $2080
line 4645
;4643:
;4644:	// always predict when the goal change or at regular intervals
;4645:	if (bs->predictobstacles_goalareanum == goal->areanum &&
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
NEI4 $2083
ADDRLP4 292
INDIRP4
CNSTI4 6212
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1086324736
SUBF4
LEF4 $2083
line 4646
;4646:		bs->predictobstacles_time > FloatTime() - 6) {
line 4647
;4647:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2079
JUMPV
LABELV $2083
line 4649
;4648:	}
;4649:	bs->predictobstacles_goalareanum = goal->areanum;
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
line 4650
;4650:	bs->predictobstacles_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6212
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4653
;4651:
;4652:	// predict at most 100 areas or 10 seconds ahead
;4653:	trap_AAS_PredictRoute(&route, bs->areanum, bs->origin,
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
line 4658
;4654:							goal->areanum, bs->tfl, 100, 1000,
;4655:							RSE_USETRAVELTYPE|RSE_ENTERCONTENTS,
;4656:							AREACONTENTS_MOVER, TFL_BRIDGE, 0);
;4657:	// if bot has to travel through an area with a mover
;4658:	if (route.stopevent & RSE_ENTERCONTENTS) {
ADDRLP4 0+16
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $2085
line 4660
;4659:		// if the bot will run into a mover
;4660:		if (route.endcontents & AREACONTENTS_MOVER) {
ADDRLP4 0+20
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $2086
line 4662
;4661:			//NOTE: this only works with bspc 2.1 or higher
;4662:			modelnum = (route.endcontents & AREACONTENTS_MODELNUM) >> AREACONTENTS_MODELNUMSHIFT;
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
line 4663
;4663:			if (modelnum) {
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $2086
line 4665
;4664:				//
;4665:				entitynum = BotModelMinsMaxs(modelnum, ET_MOVER, 0, NULL, NULL);
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
line 4666
;4666:				if (entitynum) {
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $2086
line 4668
;4667:					//NOTE: BotGetActivateGoal already checks if the door is open or not
;4668:					bspent = BotGetActivateGoal(bs, entitynum, &activategoal);
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
line 4669
;4669:					if (bspent) {
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $2086
line 4671
;4670:						//
;4671:						if (bs->activatestack && !bs->activatestack->inuse)
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
EQU4 $2098
ADDRLP4 316
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $2098
line 4672
;4672:							bs->activatestack = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
CNSTP4 0
ASGNP4
LABELV $2098
line 4674
;4673:						// if not already trying to activate this entity
;4674:						if (!BotIsGoingToActivateEntity(bs, activategoal.goal.entitynum)) {
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
NEI4 $2100
line 4678
;4675:							//
;4676:							//BotAI_Print(PRT_MESSAGE, "blocked by mover model %d, entity %d ?\n", modelnum, entitynum);
;4677:							//
;4678:							BotGoForActivateGoal(bs, &activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 BotGoForActivateGoal
CALLI4
pop
line 4679
;4679:							return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2079
JUMPV
LABELV $2100
line 4681
;4680:						}
;4681:						else {
line 4683
;4682:							// enable any routing areas that were disabled
;4683:							BotEnableActivateGoalAreas(&activategoal, qtrue);
ADDRLP4 48
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4684
;4684:						}
line 4685
;4685:					}
line 4686
;4686:				}
line 4687
;4687:			}
line 4688
;4688:		}
line 4689
;4689:	}
ADDRGP4 $2086
JUMPV
LABELV $2085
line 4690
;4690:	else if (route.stopevent & RSE_USETRAVELTYPE) {
ADDRLP4 0+16
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $2104
line 4691
;4691:		if (route.endtravelflags & TFL_BRIDGE) {
ADDRLP4 0+24
INDIRI4
CNSTI4 67108864
BANDI4
CNSTI4 0
EQI4 $2107
line 4693
;4692:			//FIXME: check if the bridge is available to travel over
;4693:		}
LABELV $2107
line 4694
;4694:	}
LABELV $2104
LABELV $2086
line 4695
;4695:	return qfalse;
CNSTI4 0
RETI4
LABELV $2079
endproc BotAIPredictObstacles 324 44
export BotCheckConsoleMessages
proc BotCheckConsoleMessages 1012 48
line 4703
;4696:}
;4697:
;4698:/*
;4699:==================
;4700:BotCheckConsoleMessages
;4701:==================
;4702:*/
;4703:void BotCheckConsoleMessages(bot_state_t *bs) {
line 4711
;4704:	char botname[MAX_NETNAME], message[MAX_MESSAGE_SIZE], netname[MAX_NETNAME], *ptr;
;4705:	float chat_reply;
;4706:	int context, handle;
;4707:	bot_consolemessage_t m;
;4708:	bot_match_t match;
;4709:
;4710:	//the name of this bot
;4711:	ClientName(bs->client, botname, sizeof(botname));
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
ADDRGP4 $2112
JUMPV
LABELV $2111
line 4713
;4712:	//
;4713:	while((handle = trap_BotNextConsoleMessage(bs->cs, &m)) != 0) {
line 4715
;4714:		//if the chat state is flooded with messages the bot will read them quickly
;4715:		if (trap_BotNumConsoleMessages(bs->cs) < 10) {
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
GEI4 $2114
line 4717
;4716:			//if it is a chat message the bot needs some time to read it
;4717:			if (m.type == CMS_CHAT && m.time > FloatTime() - (1 + random())) break;
ADDRLP4 0+8
INDIRI4
CNSTI4 1
NEI4 $2116
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
LEF4 $2116
ADDRGP4 $2113
JUMPV
LABELV $2116
line 4718
;4718:		}
LABELV $2114
line 4720
;4719:		//
;4720:		ptr = m.message;
ADDRLP4 276
ADDRLP4 0+12
ASGNP4
line 4723
;4721:		//if it is a chat message then don't unify white spaces and don't
;4722:		//replace synonyms in the netname
;4723:		if (m.type == CMS_CHAT) {
ADDRLP4 0+8
INDIRI4
CNSTI4 1
NEI4 $2121
line 4725
;4724:			//
;4725:			if (trap_BotFindMatch(m.message, &match, MTCONTEXT_REPLYCHAT)) {
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
EQI4 $2124
line 4726
;4726:				ptr = m.message + match.variables[MESSAGE].offset;
ADDRLP4 276
ADDRLP4 288+264+16
INDIRI1
CVII4 1
ADDRLP4 0+12
ADDP4
ASGNP4
line 4727
;4727:			}
LABELV $2124
line 4728
;4728:		}
LABELV $2121
line 4730
;4729:		//unify the white spaces in the message
;4730:		trap_UnifyWhiteSpaces(ptr);
ADDRLP4 276
INDIRP4
ARGP4
ADDRGP4 trap_UnifyWhiteSpaces
CALLV
pop
line 4732
;4731:		//replace synonyms in the right context
;4732:		context = BotSynonymContext(bs);
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
line 4733
;4733:		trap_BotReplaceSynonyms(ptr, context);
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
line 4735
;4734:		//if there's no match
;4735:		if (!BotMatchMessage(bs, m.message)) {
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
NEI4 $2130
line 4737
;4736:			//if it is a chat message
;4737:			if (m.type == CMS_CHAT && !bot_nochat.integer) {
ADDRLP4 0+8
INDIRI4
CNSTI4 1
NEI4 $2133
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 0
NEI4 $2133
line 4739
;4738:				//
;4739:				if (!trap_BotFindMatch(m.message, &match, MTCONTEXT_REPLYCHAT)) {
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
NEI4 $2137
line 4740
;4740:					trap_BotRemoveConsoleMessage(bs->cs, handle);
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
line 4741
;4741:					continue;
ADDRGP4 $2112
JUMPV
LABELV $2137
line 4744
;4742:				}
;4743:				//don't use eliza chats with team messages
;4744:				if (match.subtype & ST_TEAM) {
ADDRLP4 288+260
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $2140
line 4745
;4745:					trap_BotRemoveConsoleMessage(bs->cs, handle);
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
line 4746
;4746:					continue;
ADDRGP4 $2112
JUMPV
LABELV $2140
line 4749
;4747:				}
;4748:				//
;4749:				trap_BotMatchVariable(&match, NETNAME, netname, sizeof(netname));
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
line 4750
;4750:				trap_BotMatchVariable(&match, MESSAGE, message, sizeof(message));
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
line 4752
;4751:				//if this is a message from the bot self
;4752:				if (bs->client == ClientFromName(netname)) {
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
NEI4 $2143
line 4753
;4753:					trap_BotRemoveConsoleMessage(bs->cs, handle);
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
line 4754
;4754:					continue;
ADDRGP4 $2112
JUMPV
LABELV $2143
line 4757
;4755:				}
;4756:				//unify the message
;4757:				trap_UnifyWhiteSpaces(message);
ADDRLP4 616
ARGP4
ADDRGP4 trap_UnifyWhiteSpaces
CALLV
pop
line 4759
;4758:				//
;4759:				trap_Cvar_Update(&bot_testrchat);
ADDRGP4 bot_testrchat
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 4760
;4760:				if (bot_testrchat.integer) {
ADDRGP4 bot_testrchat+12
INDIRI4
CNSTI4 0
EQI4 $2145
line 4762
;4761:					//
;4762:					trap_BotLibVarSet("bot_testrchat", "1");
ADDRGP4 $2148
ARGP4
ADDRGP4 $2149
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 4764
;4763:					//if bot replies with a chat message
;4764:					if (trap_BotReplyChat(bs->cs, message, context, CONTEXT_REPLY,
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
EQI4 $2150
line 4768
;4765:															NULL, NULL,
;4766:															NULL, NULL,
;4767:															NULL, NULL,
;4768:															botname, netname)) {
line 4769
;4769:						BotAI_Print(PRT_MESSAGE, "------------------------\n");
CNSTI4 1
ARGI4
ADDRGP4 $2152
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4770
;4770:					}
ADDRGP4 $2146
JUMPV
LABELV $2150
line 4771
;4771:					else {
line 4772
;4772:						BotAI_Print(PRT_MESSAGE, "**** no valid reply ****\n");
CNSTI4 1
ARGI4
ADDRGP4 $2153
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4773
;4773:					}
line 4774
;4774:				}
ADDRGP4 $2146
JUMPV
LABELV $2145
line 4776
;4775:				//if at a valid chat position and not chatting already and not in teamplay
;4776:				else if (bs->ainode != AINode_Stand && BotValidChatPosition(bs) && !TeamPlayIsOn()) {
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
EQU4 $2154
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
EQI4 $2154
ADDRLP4 976
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 976
INDIRI4
CNSTI4 0
NEI4 $2154
line 4777
;4777:					chat_reply = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_REPLY, 0, 1);
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
line 4778
;4778:					if (random() < 1.5 / (NumBots()+1) && random() < chat_reply) {
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
GEF4 $2156
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
GEF4 $2156
line 4780
;4779:						//if bot replies with a chat message
;4780:						if (trap_BotReplyChat(bs->cs, message, context, CONTEXT_REPLY,
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
EQI4 $2158
line 4784
;4781:																NULL, NULL,
;4782:																NULL, NULL,
;4783:																NULL, NULL,
;4784:																botname, netname)) {
line 4786
;4785:							//remove the console message
;4786:							trap_BotRemoveConsoleMessage(bs->cs, handle);
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
line 4787
;4787:							bs->stand_time = FloatTime() + BotChatTime(bs);
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
line 4788
;4788:							AIEnter_Stand(bs, "BotCheckConsoleMessages: reply chat");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2160
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 4790
;4789:							//EA_Say(bs->client, bs->cs.chatmessage);
;4790:							break;
ADDRGP4 $2113
JUMPV
LABELV $2158
line 4792
;4791:						}
;4792:					}
LABELV $2156
line 4793
;4793:				}
LABELV $2154
LABELV $2146
line 4794
;4794:			}
LABELV $2133
line 4795
;4795:		}
LABELV $2130
line 4797
;4796:		//remove the console message
;4797:		trap_BotRemoveConsoleMessage(bs->cs, handle);
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
line 4798
;4798:	}
LABELV $2112
line 4713
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
NEI4 $2111
LABELV $2113
line 4799
;4799:}
LABELV $2110
endproc BotCheckConsoleMessages 1012 48
export BotCheckForGrenades
proc BotCheckForGrenades 8 16
line 4806
;4800:
;4801:/*
;4802:==================
;4803:BotCheckEvents
;4804:==================
;4805:*/
;4806:void BotCheckForGrenades(bot_state_t *bs, entityState_t *state) {
line 4808
;4807:	// if this is not a grenade
;4808:	if (state->eType != ET_MISSILE || state->weapon != WP_GRENADE_LAUNCHER)
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
NEI4 $2164
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $2162
LABELV $2164
line 4809
;4809:		return;
ADDRGP4 $2161
JUMPV
LABELV $2162
line 4811
;4810:	// try to avoid the grenade
;4811:	trap_BotAddAvoidSpot(bs->ms, state->pos.trBase, 160, AVOID_ALWAYS);
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
line 4812
;4812:}
LABELV $2161
endproc BotCheckForGrenades 8 16
export BotCheckEvents
proc BotCheckEvents 164 12
line 4864
;4813:
;4814:#ifdef MISSIONPACK
;4815:/*
;4816:==================
;4817:BotCheckForProxMines
;4818:==================
;4819:*/
;4820:void BotCheckForProxMines(bot_state_t *bs, entityState_t *state) {
;4821:	// if this is not a prox mine
;4822:	if (state->eType != ET_MISSILE || state->weapon != WP_PROX_LAUNCHER)
;4823:		return;
;4824:	// if this prox mine is from someone on our own team
;4825:	if (state->generic1 == BotTeam(bs))
;4826:		return;
;4827:	// if the bot doesn't have a weapon to deactivate the mine
;4828:	if (!(bs->inventory[INVENTORY_PLASMAGUN] > 0 && bs->inventory[INVENTORY_CELLS] > 0) &&
;4829:		!(bs->inventory[INVENTORY_ROCKETLAUNCHER] > 0 && bs->inventory[INVENTORY_ROCKETS] > 0) &&
;4830:		!(bs->inventory[INVENTORY_BFG10K] > 0 && bs->inventory[INVENTORY_BFGAMMO] > 0) ) {
;4831:		return;
;4832:	}
;4833:	// try to avoid the prox mine
;4834:	trap_BotAddAvoidSpot(bs->ms, state->pos.trBase, 160, AVOID_ALWAYS);
;4835:	//
;4836:	if (bs->numproxmines >= MAX_PROXMINES)
;4837:		return;
;4838:	bs->proxmines[bs->numproxmines] = state->number;
;4839:	bs->numproxmines++;
;4840:}
;4841:
;4842:/*
;4843:==================
;4844:BotCheckForKamikazeBody
;4845:==================
;4846:*/
;4847:void BotCheckForKamikazeBody(bot_state_t *bs, entityState_t *state) {
;4848:	// if this entity is not wearing the kamikaze
;4849:	if (!(state->eFlags & EF_KAMIKAZE))
;4850:		return;
;4851:	// if this entity isn't dead
;4852:	if (!(state->eFlags & EF_DEAD))
;4853:		return;
;4854:	//remember this kamikaze body
;4855:	bs->kamikazebody = state->number;
;4856:}
;4857:#endif
;4858:
;4859:/*
;4860:==================
;4861:BotCheckEvents
;4862:==================
;4863:*/
;4864:void BotCheckEvents(bot_state_t *bs, entityState_t *state) {
line 4873
;4865:	int event;
;4866:	char buf[128];
;4867:#ifdef MISSIONPACK
;4868:	aas_entityinfo_t entinfo;
;4869:#endif
;4870:
;4871:	//NOTE: this sucks, we're accessing the gentity_t directly
;4872:	//but there's no other fast way to do it right now
;4873:	if (bs->entityeventTime[state->number] == g_entities[state->number].eventTime) {
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
NEI4 $2166
line 4874
;4874:		return;
ADDRGP4 $2165
JUMPV
LABELV $2166
line 4876
;4875:	}
;4876:	bs->entityeventTime[state->number] = g_entities[state->number].eventTime;
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
line 4878
;4877:	//if it's an event only entity
;4878:	if (state->eType > ET_EVENTS) {
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 14
LEI4 $2170
line 4879
;4879:		event = (state->eType - ET_EVENTS) & ~EV_EVENT_BITS;
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
line 4880
;4880:	}
ADDRGP4 $2171
JUMPV
LABELV $2170
line 4881
;4881:	else {
line 4882
;4882:		event = state->event & ~EV_EVENT_BITS;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
ASGNI4
line 4883
;4883:	}
LABELV $2171
line 4885
;4884:	//
;4885:	switch(event) {
ADDRLP4 140
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 1
LTI4 $2172
ADDRLP4 140
INDIRI4
CNSTI4 75
GTI4 $2172
ADDRLP4 140
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2221-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2221
address $2173
address $2173
address $2173
address $2173
address $2173
address $2173
address $2173
address $2173
address $2173
address $2173
address $2173
address $2173
address $2173
address $2173
address $2173
address $2173
address $2173
address $2173
address $2173
address $2173
address $2173
address $2173
address $2173
address $2172
address $2173
address $2173
address $2173
address $2173
address $2173
address $2173
address $2173
address $2173
address $2173
address $2173
address $2173
address $2173
address $2173
address $2173
address $2173
address $2172
address $2172
address $2172
address $2206
address $2172
address $2172
address $2172
address $2207
address $2185
address $2193
address $2172
address $2172
address $2172
address $2172
address $2172
address $2172
address $2172
address $2172
address $2172
address $2172
address $2172
address $2172
address $2174
address $2172
address $2172
address $2172
address $2172
address $2172
address $2172
address $2172
address $2172
address $2172
address $2172
address $2172
address $2172
address $2173
code
LABELV $2174
line 4888
;4886:		//client obituary event
;4887:		case EV_OBITUARY:
;4888:		{
line 4891
;4889:			int target, attacker, mod;
;4890:
;4891:			target = state->otherEntityNum;
ADDRLP4 144
ADDRFP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 4892
;4892:			attacker = state->otherEntityNum2;
ADDRLP4 148
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 4893
;4893:			mod = state->eventParm;
ADDRLP4 152
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 4895
;4894:			//
;4895:			if (target == bs->client) {
ADDRLP4 144
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2175
line 4896
;4896:				bs->botdeathtype = mod;
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
ADDRLP4 152
INDIRI4
ASGNI4
line 4897
;4897:				bs->lastkilledby = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 5996
ADDP4
ADDRLP4 148
INDIRI4
ASGNI4
line 4899
;4898:				//
;4899:				if (target == attacker ||
ADDRLP4 156
ADDRLP4 144
INDIRI4
ASGNI4
ADDRLP4 156
INDIRI4
ADDRLP4 148
INDIRI4
EQI4 $2180
ADDRLP4 156
INDIRI4
CNSTI4 1023
EQI4 $2180
ADDRLP4 156
INDIRI4
CNSTI4 1022
NEI4 $2177
LABELV $2180
line 4901
;4900:					target == ENTITYNUM_NONE ||
;4901:					target == ENTITYNUM_WORLD) bs->botsuicide = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6008
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $2178
JUMPV
LABELV $2177
line 4902
;4902:				else bs->botsuicide = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6008
ADDP4
CNSTI4 0
ASGNI4
LABELV $2178
line 4904
;4903:				//
;4904:				bs->num_deaths++;
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
line 4905
;4905:			}
ADDRGP4 $2173
JUMPV
LABELV $2175
line 4907
;4906:			//else if this client was killed by the bot
;4907:			else if (attacker == bs->client) {
ADDRLP4 148
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2181
line 4908
;4908:				bs->enemydeathtype = mod;
ADDRFP4 0
INDIRP4
CNSTI4 6004
ADDP4
ADDRLP4 152
INDIRI4
ASGNI4
line 4909
;4909:				bs->lastkilledplayer = target;
ADDRFP4 0
INDIRP4
CNSTI4 5992
ADDP4
ADDRLP4 144
INDIRI4
ASGNI4
line 4910
;4910:				bs->killedenemy_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6168
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4912
;4911:				//
;4912:				bs->num_kills++;
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
line 4913
;4913:			}
ADDRGP4 $2173
JUMPV
LABELV $2181
line 4914
;4914:			else if (attacker == bs->enemy && target == attacker) {
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
NEI4 $2173
ADDRLP4 144
INDIRI4
ADDRLP4 156
INDIRI4
NEI4 $2173
line 4915
;4915:				bs->enemysuicide = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6012
ADDP4
CNSTI4 1
ASGNI4
line 4916
;4916:			}
line 4930
;4917:			//
;4918:#ifdef MISSIONPACK			
;4919:			if (gametype == GT_1FCTF) {
;4920:				//
;4921:				BotEntityInfo(target, &entinfo);
;4922:				if ( entinfo.powerups & ( 1 << PW_NEUTRALFLAG ) ) {
;4923:					if (!BotSameTeam(bs, target)) {
;4924:						bs->neutralflagstatus = 3;	//enemy dropped the flag
;4925:						bs->flagstatuschanged = qtrue;
;4926:					}
;4927:				}
;4928:			}
;4929:#endif
;4930:			break;
ADDRGP4 $2173
JUMPV
LABELV $2185
line 4933
;4931:		}
;4932:		case EV_GLOBAL_SOUND:
;4933:		{
line 4934
;4934:			if (state->eventParm < 0 || state->eventParm > MAX_SOUNDS) {
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
LTI4 $2188
ADDRLP4 144
INDIRI4
CNSTI4 256
LEI4 $2186
LABELV $2188
line 4935
;4935:				BotAI_Print(PRT_ERROR, "EV_GLOBAL_SOUND: eventParm (%d) out of range\n", state->eventParm);
CNSTI4 3
ARGI4
ADDRGP4 $2189
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
line 4936
;4936:				break;
ADDRGP4 $2173
JUMPV
LABELV $2186
line 4938
;4937:			}
;4938:			trap_GetConfigstring(CS_SOUNDS + state->eventParm, buf, sizeof(buf));
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
line 4958
;4939:			/*
;4940:			if (!strcmp(buf, "sound/teamplay/flagret_red.wav")) {
;4941:				//red flag is returned
;4942:				bs->redflagstatus = 0;
;4943:				bs->flagstatuschanged = qtrue;
;4944:			}
;4945:			else if (!strcmp(buf, "sound/teamplay/flagret_blu.wav")) {
;4946:				//blue flag is returned
;4947:				bs->blueflagstatus = 0;
;4948:				bs->flagstatuschanged = qtrue;
;4949:			}
;4950:			else*/
;4951:#ifdef MISSIONPACK
;4952:			if (!strcmp(buf, "sound/items/kamikazerespawn.wav" )) {
;4953:				//the kamikaze respawned so dont avoid it
;4954:				BotDontAvoid(bs, "Kamikaze");
;4955:			}
;4956:			else
;4957:#endif
;4958:				if (!strcmp(buf, "sound/items/poweruprespawn.wav")) {
ADDRLP4 4
ARGP4
ADDRGP4 $2192
ARGP4
ADDRLP4 148
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $2173
line 4960
;4959:				//powerup respawned... go get it
;4960:				BotGoForPowerups(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotGoForPowerups
CALLV
pop
line 4961
;4961:			}
line 4962
;4962:			break;
ADDRGP4 $2173
JUMPV
LABELV $2193
line 4965
;4963:		}
;4964:		case EV_GLOBAL_TEAM_SOUND:
;4965:		{
line 4966
;4966:			if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $2173
line 4967
;4967:				switch(state->eventParm) {
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
LTI4 $2173
ADDRLP4 144
INDIRI4
CNSTI4 5
GTI4 $2173
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2205
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2205
address $2199
address $2200
address $2201
address $2202
address $2203
address $2204
code
LABELV $2199
line 4969
;4968:					case GTS_RED_CAPTURE:
;4969:						bs->blueflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 0
ASGNI4
line 4970
;4970:						bs->redflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
CNSTI4 0
ASGNI4
line 4971
;4971:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 1
ASGNI4
line 4972
;4972:						break; //see BotMatch_CTF
ADDRGP4 $2173
JUMPV
LABELV $2200
line 4974
;4973:					case GTS_BLUE_CAPTURE:
;4974:						bs->blueflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 0
ASGNI4
line 4975
;4975:						bs->redflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
CNSTI4 0
ASGNI4
line 4976
;4976:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 1
ASGNI4
line 4977
;4977:						break; //see BotMatch_CTF
ADDRGP4 $2173
JUMPV
LABELV $2201
line 4980
;4978:					case GTS_RED_RETURN:
;4979:						//blue flag is returned
;4980:						bs->blueflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 0
ASGNI4
line 4981
;4981:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 1
ASGNI4
line 4982
;4982:						break;
ADDRGP4 $2173
JUMPV
LABELV $2202
line 4985
;4983:					case GTS_BLUE_RETURN:
;4984:						//red flag is returned
;4985:						bs->redflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
CNSTI4 0
ASGNI4
line 4986
;4986:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 1
ASGNI4
line 4987
;4987:						break;
ADDRGP4 $2173
JUMPV
LABELV $2203
line 4990
;4988:					case GTS_RED_TAKEN:
;4989:						//blue flag is taken
;4990:						bs->blueflagstatus = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 1
ASGNI4
line 4991
;4991:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 1
ASGNI4
line 4992
;4992:						break; //see BotMatch_CTF
ADDRGP4 $2173
JUMPV
LABELV $2204
line 4995
;4993:					case GTS_BLUE_TAKEN:
;4994:						//red flag is taken
;4995:						bs->redflagstatus = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
CNSTI4 1
ASGNI4
line 4996
;4996:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 1
ASGNI4
line 4997
;4997:						break; //see BotMatch_CTF
line 4999
;4998:				}
;4999:			}
line 5032
;5000:#ifdef MISSIONPACK
;5001:			else if (gametype == GT_1FCTF) {
;5002:				switch(state->eventParm) {
;5003:					case GTS_RED_CAPTURE:
;5004:						bs->neutralflagstatus = 0;
;5005:						bs->flagstatuschanged = qtrue;
;5006:						break;
;5007:					case GTS_BLUE_CAPTURE:
;5008:						bs->neutralflagstatus = 0;
;5009:						bs->flagstatuschanged = qtrue;
;5010:						break;
;5011:					case GTS_RED_RETURN:
;5012:						//flag has returned
;5013:						bs->neutralflagstatus = 0;
;5014:						bs->flagstatuschanged = qtrue;
;5015:						break;
;5016:					case GTS_BLUE_RETURN:
;5017:						//flag has returned
;5018:						bs->neutralflagstatus = 0;
;5019:						bs->flagstatuschanged = qtrue;
;5020:						break;
;5021:					case GTS_RED_TAKEN:
;5022:						bs->neutralflagstatus = BotTeam(bs) == TEAM_RED ? 2 : 1; //FIXME: check Team_TakeFlagSound in g_team.c
;5023:						bs->flagstatuschanged = qtrue;
;5024:						break;
;5025:					case GTS_BLUE_TAKEN:
;5026:						bs->neutralflagstatus = BotTeam(bs) == TEAM_BLUE ? 2 : 1; //FIXME: check Team_TakeFlagSound in g_team.c
;5027:						bs->flagstatuschanged = qtrue;
;5028:						break;
;5029:				}
;5030:			}
;5031:#endif
;5032:			break;
ADDRGP4 $2173
JUMPV
LABELV $2206
line 5035
;5033:		}
;5034:		case EV_PLAYER_TELEPORT_IN:
;5035:		{
line 5036
;5036:			VectorCopy(state->origin, lastteleport_origin);
ADDRGP4 lastteleport_origin
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 5037
;5037:			lastteleport_time = FloatTime();
ADDRGP4 lastteleport_time
ADDRGP4 floattime
INDIRF4
ASGNF4
line 5038
;5038:			break;
ADDRGP4 $2173
JUMPV
LABELV $2207
line 5041
;5039:		}
;5040:		case EV_GENERAL_SOUND:
;5041:		{
line 5043
;5042:			//if this sound is played on the bot
;5043:			if (state->number == bs->client) {
ADDRFP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2173
line 5044
;5044:				if (state->eventParm < 0 || state->eventParm > MAX_SOUNDS) {
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
LTI4 $2212
ADDRLP4 144
INDIRI4
CNSTI4 256
LEI4 $2210
LABELV $2212
line 5045
;5045:					BotAI_Print(PRT_ERROR, "EV_GENERAL_SOUND: eventParm (%d) out of range\n", state->eventParm);
CNSTI4 3
ARGI4
ADDRGP4 $2213
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
line 5046
;5046:					break;
ADDRGP4 $2173
JUMPV
LABELV $2210
line 5049
;5047:				}
;5048:				//check out the sound
;5049:				trap_GetConfigstring(CS_SOUNDS + state->eventParm, buf, sizeof(buf));
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
line 5051
;5050:				//if falling into a death pit
;5051:				if (!strcmp(buf, "*falling1.wav")) {
ADDRLP4 4
ARGP4
ADDRGP4 $2216
ARGP4
ADDRLP4 148
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $2173
line 5053
;5052:					//if the bot has a personal teleporter
;5053:					if (bs->inventory[INVENTORY_TELEPORTER] > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 5072
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2173
line 5055
;5054:						//use the holdable item
;5055:						trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 5056
;5056:					}
line 5057
;5057:				}
line 5058
;5058:			}
line 5059
;5059:			break;
line 5086
;5060:		}
;5061:		case EV_FOOTSTEP:
;5062:		case EV_FOOTSTEP_METAL:
;5063:		case EV_FOOTSPLASH:
;5064:		case EV_FOOTWADE:
;5065:		case EV_SWIM:
;5066:		case EV_FALL_SHORT:
;5067:		case EV_FALL_MEDIUM:
;5068:		case EV_FALL_FAR:
;5069:		case EV_STEP_4:
;5070:		case EV_STEP_8:
;5071:		case EV_STEP_12:
;5072:		case EV_STEP_16:
;5073:		case EV_JUMP_PAD:
;5074:		case EV_JUMP:
;5075:		case EV_TAUNT:
;5076:		case EV_WATER_TOUCH:
;5077:		case EV_WATER_LEAVE:
;5078:		case EV_WATER_UNDER:
;5079:		case EV_WATER_CLEAR:
;5080:		case EV_ITEM_PICKUP:
;5081:		case EV_GLOBAL_ITEM_PICKUP:
;5082:		case EV_NOAMMO:
;5083:		case EV_CHANGE_WEAPON:
;5084:		case EV_FIRE_WEAPON:
;5085:			//FIXME: either add to sound queue or mark player as someone making noise
;5086:			break;
line 5102
;5087:		case EV_USE_ITEM0:
;5088:		case EV_USE_ITEM1:
;5089:		case EV_USE_ITEM2:
;5090:		case EV_USE_ITEM3:
;5091:		case EV_USE_ITEM4:
;5092:		case EV_USE_ITEM5:
;5093:		case EV_USE_ITEM6:
;5094:		case EV_USE_ITEM7:
;5095:		case EV_USE_ITEM8:
;5096:		case EV_USE_ITEM9:
;5097:		case EV_USE_ITEM10:
;5098:		case EV_USE_ITEM11:
;5099:		case EV_USE_ITEM12:
;5100:		case EV_USE_ITEM13:
;5101:		case EV_USE_ITEM14:
;5102:			break;
LABELV $2172
LABELV $2173
line 5104
;5103:	}
;5104:}
LABELV $2165
endproc BotCheckEvents 164 12
export BotCheckSnapshot
proc BotCheckSnapshot 220 16
line 5111
;5105:
;5106:/*
;5107:==================
;5108:BotCheckSnapshot
;5109:==================
;5110:*/
;5111:void BotCheckSnapshot(bot_state_t *bs) {
line 5116
;5112:	int ent;
;5113:	entityState_t state;
;5114:
;5115:	//remove all avoid spots
;5116:	trap_BotAddAvoidSpot(bs->ms, vec3_origin, 0, AVOID_CLEAR);
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
line 5118
;5117:	//reset kamikaze body
;5118:	bs->kamikazebody = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6256
ADDP4
CNSTI4 0
ASGNI4
line 5120
;5119:	//reset number of proxmines
;5120:	bs->numproxmines = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6516
ADDP4
CNSTI4 0
ASGNI4
line 5122
;5121:	//
;5122:	ent = 0;
ADDRLP4 212
CNSTI4 0
ASGNI4
ADDRGP4 $2225
JUMPV
LABELV $2224
line 5123
;5123:	while( ( ent = BotAI_GetSnapshotEntity( bs->client, ent, &state ) ) != -1 ) {
line 5125
;5124:		//check the entity state for events
;5125:		BotCheckEvents(bs, &state);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckEvents
CALLV
pop
line 5127
;5126:		//check for grenades the bot should avoid
;5127:		BotCheckForGrenades(bs, &state);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckForGrenades
CALLV
pop
line 5135
;5128:		//
;5129:#ifdef MISSIONPACK
;5130:		//check for proximity mines which the bot should deactivate
;5131:		BotCheckForProxMines(bs, &state);
;5132:		//check for dead bodies with the kamikaze effect which should be gibbed
;5133:		BotCheckForKamikazeBody(bs, &state);
;5134:#endif
;5135:	}
LABELV $2225
line 5123
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
NEI4 $2224
line 5137
;5136:	//check the player state for events
;5137:	BotAI_GetEntityState(bs->client, &state);
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
line 5139
;5138:	//copy the player state events to the entity state
;5139:	state.event = bs->cur_ps.externalEvent;
ADDRLP4 0+180
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 5140
;5140:	state.eventParm = bs->cur_ps.externalEventParm;
ADDRLP4 0+184
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
line 5142
;5141:	//
;5142:	BotCheckEvents(bs, &state);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckEvents
CALLV
pop
line 5143
;5143:}
LABELV $2223
endproc BotCheckSnapshot 220 16
export BotCheckAir
proc BotCheckAir 4 4
line 5150
;5144:
;5145:/*
;5146:==================
;5147:BotCheckAir
;5148:==================
;5149:*/
;5150:void BotCheckAir(bot_state_t *bs) {
line 5151
;5151:	if (bs->inventory[INVENTORY_ENVIRONMENTSUIT] <= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 5096
ADDP4
INDIRI4
CNSTI4 0
GTI4 $2230
line 5152
;5152:		if (trap_AAS_PointContents(bs->eye) & (CONTENTS_WATER|CONTENTS_SLIME|CONTENTS_LAVA)) {
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
EQI4 $2232
line 5153
;5153:			return;
ADDRGP4 $2229
JUMPV
LABELV $2232
line 5155
;5154:		}
;5155:	}
LABELV $2230
line 5156
;5156:	bs->lastair_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6176
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 5157
;5157:}
LABELV $2229
endproc BotCheckAir 4 4
export BotAlternateRoute
proc BotAlternateRoute 16 16
line 5164
;5158:
;5159:/*
;5160:==================
;5161:BotAlternateRoute
;5162:==================
;5163:*/
;5164:bot_goal_t *BotAlternateRoute(bot_state_t *bs, bot_goal_t *goal) {
line 5168
;5165:	int t;
;5166:
;5167:	// if the bot has an alternative route goal
;5168:	if (bs->altroutegoal.areanum) {
ADDRFP4 0
INDIRP4
CNSTI4 6692
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2235
line 5170
;5169:		//
;5170:		if (bs->reachedaltroutegoal_time)
ADDRFP4 0
INDIRP4
CNSTI4 6736
ADDP4
INDIRF4
CNSTF4 0
EQF4 $2237
line 5171
;5171:			return goal;
ADDRFP4 4
INDIRP4
RETP4
ADDRGP4 $2234
JUMPV
LABELV $2237
line 5173
;5172:		// travel time towards alternative route goal
;5173:		t = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, bs->altroutegoal.areanum, bs->tfl);
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
line 5174
;5174:		if (t && t < 20) {
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $2239
ADDRLP4 12
INDIRI4
CNSTI4 20
GEI4 $2239
line 5176
;5175:			//BotAI_Print(PRT_MESSAGE, "reached alternate route goal\n");
;5176:			bs->reachedaltroutegoal_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6736
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 5177
;5177:		}
LABELV $2239
line 5178
;5178:		memcpy(goal, &bs->altroutegoal, sizeof(bot_goal_t));
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
line 5179
;5179:		return &bs->altroutegoal;
ADDRFP4 0
INDIRP4
CNSTI4 6680
ADDP4
RETP4
ADDRGP4 $2234
JUMPV
LABELV $2235
line 5181
;5180:	}
;5181:	return goal;
ADDRFP4 4
INDIRP4
RETP4
LABELV $2234
endproc BotAlternateRoute 16 16
export BotGetAlternateRouteGoal
proc BotGetAlternateRouteGoal 24 0
line 5189
;5182:}
;5183:
;5184:/*
;5185:==================
;5186:BotGetAlternateRouteGoal
;5187:==================
;5188:*/
;5189:int BotGetAlternateRouteGoal(bot_state_t *bs, int base) {
line 5194
;5190:	aas_altroutegoal_t *altroutegoals;
;5191:	bot_goal_t *goal;
;5192:	int numaltroutegoals, rnd;
;5193:
;5194:	if (base == TEAM_RED) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $2242
line 5195
;5195:		altroutegoals = red_altroutegoals;
ADDRLP4 12
ADDRGP4 red_altroutegoals
ASGNP4
line 5196
;5196:		numaltroutegoals = red_numaltroutegoals;
ADDRLP4 4
ADDRGP4 red_numaltroutegoals
INDIRI4
ASGNI4
line 5197
;5197:	}
ADDRGP4 $2243
JUMPV
LABELV $2242
line 5198
;5198:	else {
line 5199
;5199:		altroutegoals = blue_altroutegoals;
ADDRLP4 12
ADDRGP4 blue_altroutegoals
ASGNP4
line 5200
;5200:		numaltroutegoals = blue_numaltroutegoals;
ADDRLP4 4
ADDRGP4 blue_numaltroutegoals
INDIRI4
ASGNI4
line 5201
;5201:	}
LABELV $2243
line 5202
;5202:	if (!numaltroutegoals)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2244
line 5203
;5203:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2241
JUMPV
LABELV $2244
line 5204
;5204:	rnd = (float) random() * numaltroutegoals;
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
line 5205
;5205:	if (rnd >= numaltroutegoals)
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $2246
line 5206
;5206:		rnd = numaltroutegoals-1;
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $2246
line 5207
;5207:	goal = &bs->altroutegoal;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 6680
ADDP4
ASGNP4
line 5208
;5208:	goal->areanum = altroutegoals[rnd].areanum;
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
line 5209
;5209:	VectorCopy(altroutegoals[rnd].origin, goal->origin);
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
line 5210
;5210:	VectorSet(goal->mins, -8, -8, -8);
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
line 5211
;5211:	VectorSet(goal->maxs, 8, 8, 8);
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
line 5212
;5212:	goal->entitynum = 0;
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTI4 0
ASGNI4
line 5213
;5213:	goal->iteminfo = 0;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 5214
;5214:	goal->number = 0;
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 5215
;5215:	goal->flags = 0;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 5217
;5216:	//
;5217:	bs->reachedaltroutegoal_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6736
ADDP4
CNSTF4 0
ASGNF4
line 5218
;5218:	return qtrue;
CNSTI4 1
RETI4
LABELV $2241
endproc BotGetAlternateRouteGoal 24 0
export BotSetupAlternativeRouteGoals
proc BotSetupAlternativeRouteGoals 0 0
line 5226
;5219:}
;5220:
;5221:/*
;5222:==================
;5223:BotSetupAlternateRouteGoals
;5224:==================
;5225:*/
;5226:void BotSetupAlternativeRouteGoals(void) {
line 5228
;5227:
;5228:	if (altroutegoals_setup)
ADDRGP4 altroutegoals_setup
INDIRI4
CNSTI4 0
EQI4 $2249
line 5229
;5229:		return;
ADDRGP4 $2248
JUMPV
LABELV $2249
line 5298
;5230:#ifdef MISSIONPACK
;5231:	if (gametype == GT_CTF) {
;5232:		if (trap_BotGetLevelItemGoal(-1, "Neutral Flag", &ctf_neutralflag) < 0)
;5233:			BotAI_Print(PRT_WARNING, "no alt routes without Neutral Flag\n");
;5234:		if (ctf_neutralflag.areanum) {
;5235:			//
;5236:			red_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5237:										ctf_neutralflag.origin, ctf_neutralflag.areanum,
;5238:										ctf_redflag.origin, ctf_redflag.areanum, TFL_DEFAULT,
;5239:										red_altroutegoals, MAX_ALTROUTEGOALS,
;5240:										ALTROUTEGOAL_CLUSTERPORTALS|
;5241:										ALTROUTEGOAL_VIEWPORTALS);
;5242:			blue_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5243:										ctf_neutralflag.origin, ctf_neutralflag.areanum,
;5244:										ctf_blueflag.origin, ctf_blueflag.areanum, TFL_DEFAULT,
;5245:										blue_altroutegoals, MAX_ALTROUTEGOALS,
;5246:										ALTROUTEGOAL_CLUSTERPORTALS|
;5247:										ALTROUTEGOAL_VIEWPORTALS);
;5248:		}
;5249:	}
;5250:	else if (gametype == GT_1FCTF) {
;5251:		//
;5252:		red_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5253:									ctf_neutralflag.origin, ctf_neutralflag.areanum,
;5254:									ctf_redflag.origin, ctf_redflag.areanum, TFL_DEFAULT,
;5255:									red_altroutegoals, MAX_ALTROUTEGOALS,
;5256:									ALTROUTEGOAL_CLUSTERPORTALS|
;5257:									ALTROUTEGOAL_VIEWPORTALS);
;5258:		blue_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5259:									ctf_neutralflag.origin, ctf_neutralflag.areanum,
;5260:									ctf_blueflag.origin, ctf_blueflag.areanum, TFL_DEFAULT,
;5261:									blue_altroutegoals, MAX_ALTROUTEGOALS,
;5262:									ALTROUTEGOAL_CLUSTERPORTALS|
;5263:									ALTROUTEGOAL_VIEWPORTALS);
;5264:	}
;5265:	else if (gametype == GT_OBELISK) {
;5266:		if (trap_BotGetLevelItemGoal(-1, "Neutral Obelisk", &neutralobelisk) < 0)
;5267:			BotAI_Print(PRT_WARNING, "Harvester without neutral obelisk\n");
;5268:		//
;5269:		red_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5270:									neutralobelisk.origin, neutralobelisk.areanum,
;5271:									redobelisk.origin, redobelisk.areanum, TFL_DEFAULT,
;5272:									red_altroutegoals, MAX_ALTROUTEGOALS,
;5273:									ALTROUTEGOAL_CLUSTERPORTALS|
;5274:									ALTROUTEGOAL_VIEWPORTALS);
;5275:		blue_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5276:									neutralobelisk.origin, neutralobelisk.areanum,
;5277:									blueobelisk.origin, blueobelisk.areanum, TFL_DEFAULT,
;5278:									blue_altroutegoals, MAX_ALTROUTEGOALS,
;5279:									ALTROUTEGOAL_CLUSTERPORTALS|
;5280:									ALTROUTEGOAL_VIEWPORTALS);
;5281:	}
;5282:	else if (gametype == GT_HARVESTER) {
;5283:		//
;5284:		red_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5285:									neutralobelisk.origin, neutralobelisk.areanum,
;5286:									redobelisk.origin, redobelisk.areanum, TFL_DEFAULT,
;5287:									red_altroutegoals, MAX_ALTROUTEGOALS,
;5288:									ALTROUTEGOAL_CLUSTERPORTALS|
;5289:									ALTROUTEGOAL_VIEWPORTALS);
;5290:		blue_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5291:									neutralobelisk.origin, neutralobelisk.areanum,
;5292:									blueobelisk.origin, blueobelisk.areanum, TFL_DEFAULT,
;5293:									blue_altroutegoals, MAX_ALTROUTEGOALS,
;5294:									ALTROUTEGOAL_CLUSTERPORTALS|
;5295:									ALTROUTEGOAL_VIEWPORTALS);
;5296:	}
;5297:#endif
;5298:	altroutegoals_setup = qtrue;
ADDRGP4 altroutegoals_setup
CNSTI4 1
ASGNI4
line 5299
;5299:}
LABELV $2248
endproc BotSetupAlternativeRouteGoals 0 0
export BotDeathmatchAI
proc BotDeathmatchAI 1492 20
line 5306
;5300:
;5301:/*
;5302:==================
;5303:BotDeathmatchAI
;5304:==================
;5305:*/
;5306:void BotDeathmatchAI(bot_state_t *bs, float thinktime) {
line 5312
;5307:	char gender[144], name[144], buf[144];
;5308:	char userinfo[MAX_INFO_STRING];
;5309:	int i;
;5310:
;5311:	//if the bot has just been setup
;5312:	if (bs->setupcount > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6016
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2252
line 5313
;5313:		bs->setupcount--;
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
line 5314
;5314:		if (bs->setupcount > 0) return;
ADDRFP4 0
INDIRP4
CNSTI4 6016
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2254
ADDRGP4 $2251
JUMPV
LABELV $2254
line 5316
;5315:		//get the gender characteristic
;5316:		trap_Characteristic_String(bs->character, CHARACTERISTIC_GENDER, gender, sizeof(gender));
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
line 5318
;5317:		//set the bot gender
;5318:		trap_GetUserinfo(bs->client, userinfo, sizeof(userinfo));
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
line 5319
;5319:		Info_SetValueForKey(userinfo, "sex", gender);
ADDRLP4 292
ARGP4
ADDRGP4 $2256
ARGP4
ADDRLP4 148
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 5320
;5320:		trap_SetUserinfo(bs->client, userinfo);
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
line 5322
;5321:		//set the team
;5322:		if ( !bs->map_restart && g_gametype.integer != GT_TOURNAMENT ) {
ADDRFP4 0
INDIRP4
CNSTI4 6020
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2257
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
EQI4 $2257
line 5323
;5323:			Com_sprintf(buf, sizeof(buf), "team %s", bs->settings.team);
ADDRLP4 1316
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 $2260
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4756
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 5324
;5324:			trap_EA_Command(bs->client, buf);
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
line 5325
;5325:		}
LABELV $2257
line 5327
;5326:		//set the chat gender
;5327:		if (gender[0] == 'm') trap_BotSetChatGender(bs->cs, CHAT_GENDERMALE);
ADDRLP4 148
INDIRI1
CVII4 1
CNSTI4 109
NEI4 $2261
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
ADDRGP4 $2262
JUMPV
LABELV $2261
line 5328
;5328:		else if (gender[0] == 'f')  trap_BotSetChatGender(bs->cs, CHAT_GENDERFEMALE);
ADDRLP4 148
INDIRI1
CVII4 1
CNSTI4 102
NEI4 $2263
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
ADDRGP4 $2264
JUMPV
LABELV $2263
line 5329
;5329:		else  trap_BotSetChatGender(bs->cs, CHAT_GENDERLESS);
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
LABELV $2264
LABELV $2262
line 5331
;5330:		//set the chat name
;5331:		ClientName(bs->client, name, sizeof(name));
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
line 5332
;5332:		trap_BotSetChatName(bs->cs, name, bs->client);
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
line 5334
;5333:		//
;5334:		bs->lastframe_health = bs->inventory[INVENTORY_HEALTH];
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
line 5335
;5335:		bs->lasthitcount = bs->cur_ps.persistant[PERS_HITS];
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
line 5337
;5336:		//
;5337:		bs->setupcount = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6016
ADDP4
CNSTI4 0
ASGNI4
line 5339
;5338:		//
;5339:		BotSetupAlternativeRouteGoals();
ADDRGP4 BotSetupAlternativeRouteGoals
CALLV
pop
line 5340
;5340:	}
LABELV $2252
line 5342
;5341:	//no ideal view set
;5342:	bs->flags &= ~BFL_IDEALVIEWSET;
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
line 5344
;5343:	//
;5344:	if (!BotIntermission(bs)) {
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
NEI4 $2265
line 5346
;5345:		//set the teleport time
;5346:		BotSetTeleportTime(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeleportTime
CALLV
pop
line 5348
;5347:		//update some inventory values
;5348:		BotUpdateInventory(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotUpdateInventory
CALLV
pop
line 5350
;5349:		//check out the snapshot
;5350:		BotCheckSnapshot(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckSnapshot
CALLV
pop
line 5352
;5351:		//check for air
;5352:		BotCheckAir(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckAir
CALLV
pop
line 5353
;5353:	}
LABELV $2265
line 5355
;5354:	//check the console messages
;5355:	BotCheckConsoleMessages(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckConsoleMessages
CALLV
pop
line 5357
;5356:	//if not in the intermission and not in observer mode
;5357:	if (!BotIntermission(bs) && !BotIsObserver(bs)) {
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
NEI4 $2267
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
NEI4 $2267
line 5359
;5358:		//do team AI
;5359:		BotTeamAI(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotTeamAI
CALLV
pop
line 5360
;5360:	}
LABELV $2267
line 5362
;5361:	//if the bot has no ai node
;5362:	if (!bs->ainode) {
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2269
line 5363
;5363:		AIEnter_Seek_LTG(bs, "BotDeathmatchAI: no ai node");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2271
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 5364
;5364:	}
LABELV $2269
line 5366
;5365:	//if the bot entered the game less than 8 seconds ago
;5366:	if (!bs->entergamechat && bs->entergame_time > FloatTime() - 8) {
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
NEI4 $2272
ADDRLP4 1476
INDIRP4
CNSTI4 6064
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1090519040
SUBF4
LEF4 $2272
line 5367
;5367:		if (BotChat_EnterGame(bs)) {
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
EQI4 $2274
line 5368
;5368:			bs->stand_time = FloatTime() + BotChatTime(bs);
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
line 5369
;5369:			AIEnter_Stand(bs, "BotDeathmatchAI: chat enter game");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2276
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 5370
;5370:		}
LABELV $2274
line 5371
;5371:		bs->entergamechat = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6024
ADDP4
CNSTI4 1
ASGNI4
line 5372
;5372:	}
LABELV $2272
line 5374
;5373:	//reset the node switches from the previous frame
;5374:	BotResetNodeSwitches();
ADDRGP4 BotResetNodeSwitches
CALLV
pop
line 5376
;5375:	//execute AI nodes
;5376:	for (i = 0; i < MAX_NODESWITCHES; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2277
line 5377
;5377:		if (bs->ainode(bs)) break;
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
EQI4 $2281
ADDRGP4 $2279
JUMPV
LABELV $2281
line 5378
;5378:	}
LABELV $2278
line 5376
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 50
LTI4 $2277
LABELV $2279
line 5380
;5379:	//if the bot removed itself :)
;5380:	if (!bs->inuse) return;
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $2283
ADDRGP4 $2251
JUMPV
LABELV $2283
line 5382
;5381:	//if the bot executed too many AI nodes
;5382:	if (i >= MAX_NODESWITCHES) {
ADDRLP4 0
INDIRI4
CNSTI4 50
LTI4 $2285
line 5383
;5383:		trap_BotDumpGoalStack(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotDumpGoalStack
CALLV
pop
line 5384
;5384:		trap_BotDumpAvoidGoals(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotDumpAvoidGoals
CALLV
pop
line 5385
;5385:		BotDumpNodeSwitches(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotDumpNodeSwitches
CALLV
pop
line 5386
;5386:		ClientName(bs->client, name, sizeof(name));
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
line 5387
;5387:		BotAI_Print(PRT_ERROR, "%s at %1.1f switched more than %d AI nodes\n", name, FloatTime(), MAX_NODESWITCHES);
CNSTI4 3
ARGI4
ADDRGP4 $2287
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
line 5388
;5388:	}
LABELV $2285
line 5390
;5389:	//
;5390:	bs->lastframe_health = bs->inventory[INVENTORY_HEALTH];
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
line 5391
;5391:	bs->lasthitcount = bs->cur_ps.persistant[PERS_HITS];
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
line 5392
;5392:}
LABELV $2251
endproc BotDeathmatchAI 1492 20
export BotSetEntityNumForGoalWithModel
proc BotSetEntityNumForGoalWithModel 44 4
line 5399
;5393:
;5394:/*
;5395:==================
;5396:BotSetEntityNumForGoalWithModel
;5397:==================
;5398:*/
;5399:void BotSetEntityNumForGoalWithModel(bot_goal_t *goal, int eType, char *modelname) {
line 5404
;5400:	gentity_t *ent;
;5401:	int i, modelindex;
;5402:	vec3_t dir;
;5403:
;5404:	modelindex = G_ModelIndex( modelname );
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
line 5405
;5405:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 5406
;5406:	for (i = 0; i < level.num_entities; i++, ent++) {
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $2292
JUMPV
LABELV $2289
line 5407
;5407:		if ( !ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2294
line 5408
;5408:			continue;
ADDRGP4 $2290
JUMPV
LABELV $2294
line 5410
;5409:		}
;5410:		if ( eType && ent->s.eType != eType) {
ADDRLP4 28
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $2296
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $2296
line 5411
;5411:			continue;
ADDRGP4 $2290
JUMPV
LABELV $2296
line 5413
;5412:		}
;5413:		if (ent->s.modelindex != modelindex) {
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $2298
line 5414
;5414:			continue;
ADDRGP4 $2290
JUMPV
LABELV $2298
line 5416
;5415:		}
;5416:		VectorSubtract(goal->origin, ent->s.origin, dir);
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
line 5417
;5417:		if (VectorLengthSquared(dir) < Square(10)) {
ADDRLP4 4
ARGP4
ADDRLP4 40
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 40
INDIRF4
CNSTF4 1120403456
GEF4 $2302
line 5418
;5418:			goal->entitynum = i;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 5419
;5419:			return;
ADDRGP4 $2288
JUMPV
LABELV $2302
line 5421
;5420:		}
;5421:	}
LABELV $2290
line 5406
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
LABELV $2292
ADDRLP4 16
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $2289
line 5422
;5422:}
LABELV $2288
endproc BotSetEntityNumForGoalWithModel 44 4
export BotSetEntityNumForGoal
proc BotSetEntityNumForGoal 36 8
line 5429
;5423:
;5424:/*
;5425:==================
;5426:BotSetEntityNumForGoal
;5427:==================
;5428:*/
;5429:void BotSetEntityNumForGoal(bot_goal_t *goal, char *classname) {
line 5434
;5430:	gentity_t *ent;
;5431:	int i;
;5432:	vec3_t dir;
;5433:
;5434:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 5435
;5435:	for (i = 0; i < level.num_entities; i++, ent++) {
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $2308
JUMPV
LABELV $2305
line 5436
;5436:		if ( !ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2310
line 5437
;5437:			continue;
ADDRGP4 $2306
JUMPV
LABELV $2310
line 5439
;5438:		}
;5439:		if ( !Q_stricmp(ent->classname, classname) ) {
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
NEI4 $2312
line 5440
;5440:			continue;
ADDRGP4 $2306
JUMPV
LABELV $2312
line 5442
;5441:		}
;5442:		VectorSubtract(goal->origin, ent->s.origin, dir);
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
line 5443
;5443:		if (VectorLengthSquared(dir) < Square(10)) {
ADDRLP4 4
ARGP4
ADDRLP4 32
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 32
INDIRF4
CNSTF4 1120403456
GEF4 $2316
line 5444
;5444:			goal->entitynum = i;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 5445
;5445:			return;
ADDRGP4 $2304
JUMPV
LABELV $2316
line 5447
;5446:		}
;5447:	}
LABELV $2306
line 5435
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
LABELV $2308
ADDRLP4 16
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $2305
line 5448
;5448:}
LABELV $2304
endproc BotSetEntityNumForGoal 36 8
export BotGoalForBSPEntity
proc BotGoalForBSPEntity 1128 20
line 5455
;5449:
;5450:/*
;5451:==================
;5452:BotGoalForBSPEntity
;5453:==================
;5454:*/
;5455:int BotGoalForBSPEntity( char *classname, bot_goal_t *goal ) {
line 5460
;5456:	char value[MAX_INFO_STRING];
;5457:	vec3_t origin, start, end;
;5458:	int ent, numareas, areas[10];
;5459:
;5460:	memset(goal, 0, sizeof(bot_goal_t));
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
line 5461
;5461:	for (ent = trap_AAS_NextBSPEntity(0); ent; ent = trap_AAS_NextBSPEntity(ent)) {
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
ADDRGP4 $2322
JUMPV
LABELV $2319
line 5462
;5462:		if (!trap_AAS_ValueForBSPEpairKey(ent, "classname", value, sizeof(value)))
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1883
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
NEI4 $2323
line 5463
;5463:			continue;
ADDRGP4 $2320
JUMPV
LABELV $2323
line 5464
;5464:		if (!strcmp(value, classname)) {
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
NEI4 $2325
line 5465
;5465:			if (!trap_AAS_VectorForBSPEpairKey(ent, "origin", origin))
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1902
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
NEI4 $2327
line 5466
;5466:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2318
JUMPV
LABELV $2327
line 5467
;5467:			VectorCopy(origin, goal->origin);
ADDRFP4 4
INDIRP4
ADDRLP4 1028
INDIRB
ASGNB 12
line 5468
;5468:			VectorCopy(origin, start);
ADDRLP4 1040
ADDRLP4 1028
INDIRB
ASGNB 12
line 5469
;5469:			start[2] -= 32;
ADDRLP4 1040+8
ADDRLP4 1040+8
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 5470
;5470:			VectorCopy(origin, end);
ADDRLP4 1052
ADDRLP4 1028
INDIRB
ASGNB 12
line 5471
;5471:			end[2] += 32;
ADDRLP4 1052+8
ADDRLP4 1052+8
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 5472
;5472:			numareas = trap_AAS_TraceAreas(start, end, areas, NULL, 10);
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
line 5473
;5473:			if (!numareas)
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $2331
line 5474
;5474:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2318
JUMPV
LABELV $2331
line 5475
;5475:			goal->areanum = areas[0];
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 1068
INDIRI4
ASGNI4
line 5476
;5476:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2318
JUMPV
LABELV $2325
line 5478
;5477:		}
;5478:	}
LABELV $2320
line 5461
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
LABELV $2322
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2319
line 5479
;5479:	return qfalse;
CNSTI4 0
RETI4
LABELV $2318
endproc BotGoalForBSPEntity 1128 20
export BotSetupDeathmatchAI
proc BotSetupDeathmatchAI 156 16
line 5487
;5480:}
;5481:
;5482:/*
;5483:==================
;5484:BotSetupDeathmatchAI
;5485:==================
;5486:*/
;5487:void BotSetupDeathmatchAI(void) {
line 5491
;5488:	int ent, modelnum;
;5489:	char model[128];
;5490:
;5491:	gametype = trap_Cvar_VariableIntegerValue("g_gametype");
ADDRGP4 $2334
ARGP4
ADDRLP4 136
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 gametype
ADDRLP4 136
INDIRI4
ASGNI4
line 5492
;5492:	maxclients = trap_Cvar_VariableIntegerValue("sv_maxclients");
ADDRGP4 $311
ARGP4
ADDRLP4 140
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 maxclients
ADDRLP4 140
INDIRI4
ASGNI4
line 5494
;5493:
;5494:	trap_Cvar_Register(&bot_rocketjump, "bot_rocketjump", "1", 0);
ADDRGP4 bot_rocketjump
ARGP4
ADDRGP4 $2335
ARGP4
ADDRGP4 $2149
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5495
;5495:	trap_Cvar_Register(&bot_grapple, "bot_grapple", "0", 0);
ADDRGP4 bot_grapple
ARGP4
ADDRGP4 $2336
ARGP4
ADDRGP4 $2337
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5496
;5496:	trap_Cvar_Register(&bot_fastchat, "bot_fastchat", "0", 0);
ADDRGP4 bot_fastchat
ARGP4
ADDRGP4 $2338
ARGP4
ADDRGP4 $2337
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5497
;5497:	trap_Cvar_Register(&bot_nochat, "bot_nochat", "0", 0);
ADDRGP4 bot_nochat
ARGP4
ADDRGP4 $2339
ARGP4
ADDRGP4 $2337
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5498
;5498:	trap_Cvar_Register(&bot_testrchat, "bot_testrchat", "0", 0);
ADDRGP4 bot_testrchat
ARGP4
ADDRGP4 $2148
ARGP4
ADDRGP4 $2337
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5499
;5499:	trap_Cvar_Register(&bot_challenge, "bot_challenge", "0", 0);
ADDRGP4 bot_challenge
ARGP4
ADDRGP4 $2340
ARGP4
ADDRGP4 $2337
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5500
;5500:	trap_Cvar_Register(&bot_predictobstacles, "bot_predictobstacles", "1", 0);
ADDRGP4 bot_predictobstacles
ARGP4
ADDRGP4 $2341
ARGP4
ADDRGP4 $2149
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5501
;5501:	trap_Cvar_Register(&g_spSkill, "g_spSkill", "2", 0);
ADDRGP4 g_spSkill
ARGP4
ADDRGP4 $2342
ARGP4
ADDRGP4 $2343
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5503
;5502:	//
;5503:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $2344
line 5504
;5504:		if (trap_BotGetLevelItemGoal(-1, "Red Flag", &ctf_redflag) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $2348
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
GEI4 $2346
line 5505
;5505:			BotAI_Print(PRT_WARNING, "CTF without Red Flag\n");
CNSTI4 2
ARGI4
ADDRGP4 $2349
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $2346
line 5506
;5506:		if (trap_BotGetLevelItemGoal(-1, "Blue Flag", &ctf_blueflag) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $2352
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
GEI4 $2350
line 5507
;5507:			BotAI_Print(PRT_WARNING, "CTF without Blue Flag\n");
CNSTI4 2
ARGI4
ADDRGP4 $2353
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $2350
line 5508
;5508:	}
LABELV $2344
line 5539
;5509:#ifdef MISSIONPACK
;5510:	else if (gametype == GT_1FCTF) {
;5511:		if (trap_BotGetLevelItemGoal(-1, "Neutral Flag", &ctf_neutralflag) < 0)
;5512:			BotAI_Print(PRT_WARNING, "One Flag CTF without Neutral Flag\n");
;5513:		if (trap_BotGetLevelItemGoal(-1, "Red Flag", &ctf_redflag) < 0)
;5514:			BotAI_Print(PRT_WARNING, "CTF without Red Flag\n");
;5515:		if (trap_BotGetLevelItemGoal(-1, "Blue Flag", &ctf_blueflag) < 0)
;5516:			BotAI_Print(PRT_WARNING, "CTF without Blue Flag\n");
;5517:	}
;5518:	else if (gametype == GT_OBELISK) {
;5519:		if (trap_BotGetLevelItemGoal(-1, "Red Obelisk", &redobelisk) < 0)
;5520:			BotAI_Print(PRT_WARNING, "Obelisk without red obelisk\n");
;5521:		BotSetEntityNumForGoal(&redobelisk, "team_redobelisk");
;5522:		if (trap_BotGetLevelItemGoal(-1, "Blue Obelisk", &blueobelisk) < 0)
;5523:			BotAI_Print(PRT_WARNING, "Obelisk without blue obelisk\n");
;5524:		BotSetEntityNumForGoal(&blueobelisk, "team_blueobelisk");
;5525:	}
;5526:	else if (gametype == GT_HARVESTER) {
;5527:		if (trap_BotGetLevelItemGoal(-1, "Red Obelisk", &redobelisk) < 0)
;5528:			BotAI_Print(PRT_WARNING, "Harvester without red obelisk\n");
;5529:		BotSetEntityNumForGoal(&redobelisk, "team_redobelisk");
;5530:		if (trap_BotGetLevelItemGoal(-1, "Blue Obelisk", &blueobelisk) < 0)
;5531:			BotAI_Print(PRT_WARNING, "Harvester without blue obelisk\n");
;5532:		BotSetEntityNumForGoal(&blueobelisk, "team_blueobelisk");
;5533:		if (trap_BotGetLevelItemGoal(-1, "Neutral Obelisk", &neutralobelisk) < 0)
;5534:			BotAI_Print(PRT_WARNING, "Harvester without neutral obelisk\n");
;5535:		BotSetEntityNumForGoal(&neutralobelisk, "team_neutralobelisk");
;5536:	}
;5537:#endif
;5538:
;5539:	max_bspmodelindex = 0;
ADDRGP4 max_bspmodelindex
CNSTI4 0
ASGNI4
line 5540
;5540:	for (ent = trap_AAS_NextBSPEntity(0); ent; ent = trap_AAS_NextBSPEntity(ent)) {
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
ADDRGP4 $2357
JUMPV
LABELV $2354
line 5541
;5541:		if (!trap_AAS_ValueForBSPEpairKey(ent, "model", model, sizeof(model))) continue;
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $306
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
NEI4 $2358
ADDRGP4 $2355
JUMPV
LABELV $2358
line 5542
;5542:		if (model[0] == '*') {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $2360
line 5543
;5543:			modelnum = atoi(model+1);
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
line 5544
;5544:			if (modelnum > max_bspmodelindex)
ADDRLP4 132
INDIRI4
ADDRGP4 max_bspmodelindex
INDIRI4
LEI4 $2363
line 5545
;5545:				max_bspmodelindex = modelnum;
ADDRGP4 max_bspmodelindex
ADDRLP4 132
INDIRI4
ASGNI4
LABELV $2363
line 5546
;5546:		}
LABELV $2360
line 5547
;5547:	}
LABELV $2355
line 5540
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
LABELV $2357
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2354
line 5549
;5548:	//initialize the waypoint heap
;5549:	BotInitWaypoints();
ADDRGP4 BotInitWaypoints
CALLV
pop
line 5550
;5550:}
LABELV $2333
endproc BotSetupDeathmatchAI 156 16
export BotShutdownDeathmatchAI
proc BotShutdownDeathmatchAI 0 0
line 5557
;5551:
;5552:/*
;5553:==================
;5554:BotShutdownDeathmatchAI
;5555:==================
;5556:*/
;5557:void BotShutdownDeathmatchAI(void) {
line 5558
;5558:	altroutegoals_setup = qfalse;
ADDRGP4 altroutegoals_setup
CNSTI4 0
ASGNI4
line 5559
;5559:}
LABELV $2365
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
LABELV $2353
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
LABELV $2352
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
LABELV $2349
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
LABELV $2348
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
LABELV $2343
byte 1 50
byte 1 0
align 1
LABELV $2342
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
LABELV $2341
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
LABELV $2340
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
LABELV $2339
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
LABELV $2338
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
LABELV $2337
byte 1 48
byte 1 0
align 1
LABELV $2336
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
LABELV $2335
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
LABELV $2334
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
LABELV $2287
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
LABELV $2276
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
LABELV $2271
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
LABELV $2260
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $2256
byte 1 115
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $2216
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
LABELV $2213
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
LABELV $2192
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
LABELV $2189
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
LABELV $2160
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
LABELV $2153
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
LABELV $2152
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
LABELV $2149
byte 1 49
byte 1 0
align 1
LABELV $2148
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
LABELV $2014
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
LABELV $2013
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
LABELV $2009
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
LABELV $1997
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
LABELV $1996
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
LABELV $1993
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
LABELV $1982
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
LABELV $1969
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
LABELV $1963
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
LABELV $1955
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $1944
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
LABELV $1940
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
LABELV $1937
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
LABELV $1902
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $1897
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
LABELV $1896
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
LABELV $1889
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
LABELV $1886
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
LABELV $1883
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
LABELV $1882
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
LABELV $1870
byte 1 42
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $1685
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $1662
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $1659
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $1621
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
LABELV $1566
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
LABELV $1562
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $713
byte 1 70
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $712
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
LABELV $711
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $710
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
LABELV $709
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
LABELV $708
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
LABELV $536
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
LABELV $356
byte 1 93
byte 1 0
align 1
LABELV $355
byte 1 91
byte 1 0
align 1
LABELV $354
byte 1 32
byte 1 0
align 1
LABELV $311
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
LABELV $306
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $305
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
LABELV $300
byte 1 110
byte 1 0
align 1
LABELV $299
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
LABELV $298
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
LABELV $195
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
LABELV $170
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
LABELV $169
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $168
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
LABELV $145
byte 1 110
byte 1 111
byte 1 0
align 1
LABELV $77
byte 1 116
byte 1 0
