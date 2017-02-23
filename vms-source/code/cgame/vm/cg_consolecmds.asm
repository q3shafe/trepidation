export CG_TargetCommand_f
code
proc CG_TargetCommand_f 20 12
file "../cg_consolecmds.c"
line 14
;1:// 2016 Trepidation Licensed under the GPL2 - Team Trepidation
;2://
;3:// cg_consolecmds.c -- text commands typed in at the local console, or
;4:// executed by a key binding
;5:
;6:#include "cg_local.h"
;7:#include "../ui/ui_shared.h"
;8:#ifdef MISSIONPACK
;9:extern menuDef_t *menuScoreboard;
;10:#endif
;11:
;12:
;13:
;14:void CG_TargetCommand_f( void ) {
line 18
;15:	int		targetNum;
;16:	char	test[4];
;17:
;18:	targetNum = CG_CrosshairPlayer();
ADDRLP4 8
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 19
;19:	if (!targetNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $82
line 20
;20:		return;
ADDRGP4 $81
JUMPV
LABELV $82
line 23
;21:	}
;22:
;23:	trap_Argv( 1, test, 4 );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 24
;24:	trap_SendConsoleCommand( va( "gc %i %i", targetNum, atoi( test ) ) );
ADDRLP4 4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 $84
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 25
;25:}
LABELV $81
endproc CG_TargetCommand_f 20 12
proc CG_SizeUp_f 4 8
line 36
;26:
;27:
;28:
;29:/*
;30:=================
;31:CG_SizeUp_f
;32:
;33:Keybinding command
;34:=================
;35:*/
;36:static void CG_SizeUp_f (void) {
line 37
;37:	trap_Cvar_Set("cg_viewsize", va("%i",(int)(cg_viewsize.integer+10)));
ADDRGP4 $87
ARGP4
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 10
ADDI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $86
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 38
;38:}
LABELV $85
endproc CG_SizeUp_f 4 8
proc CG_SizeDown_f 4 8
line 48
;39:
;40:
;41:/*
;42:=================
;43:CG_SizeDown_f
;44:
;45:Keybinding command
;46:=================
;47:*/
;48:static void CG_SizeDown_f (void) {
line 49
;49:	trap_Cvar_Set("cg_viewsize", va("%i",(int)(cg_viewsize.integer-10)));
ADDRGP4 $87
ARGP4
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 10
SUBI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $86
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 50
;50:}
LABELV $89
endproc CG_SizeDown_f 4 8
proc CG_Viewpos_f 0 20
line 60
;51:
;52:
;53:/*
;54:=============
;55:CG_Viewpos_f
;56:
;57:Debugging command to print the current position
;58:=============
;59:*/
;60:static void CG_Viewpos_f (void) {
line 61
;61:	CG_Printf ("(%i %i %i) : %i\n", (int)cg.refdef.vieworg[0],
ADDRGP4 $92
ARGP4
ADDRGP4 cg+111104+24
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cg+111104+24+4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cg+111104+24+8
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cg+111472+4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 64
;62:		(int)cg.refdef.vieworg[1], (int)cg.refdef.vieworg[2], 
;63:		(int)cg.refdefViewAngles[YAW]);
;64:}
LABELV $91
endproc CG_Viewpos_f 0 20
proc CG_ScoresDown_f 0 4
line 67
;65:
;66:
;67:static void CG_ScoresDown_f( void ) {
line 71
;68:#ifdef MISSIONPACK
;69:		CG_BuildSpectatorString();
;70:#endif
;71:	if ( cg.scoresRequestTime + 2000 < cg.time ) {
ADDRGP4 cg+112528
INDIRI4
CNSTI4 2000
ADDI4
ADDRGP4 cg+109652
INDIRI4
GEI4 $104
line 74
;72:		// the scores are more than two seconds out of data,
;73:		// so request new ones
;74:		cg.scoresRequestTime = cg.time;
ADDRGP4 cg+112528
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 75
;75:		trap_SendClientCommand( "score" );
ADDRGP4 $110
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 79
;76:
;77:		// leave the current scores up if they were already
;78:		// displayed, but if this is the first hit, clear them out
;79:		if ( !cg.showScores ) {
ADDRGP4 cg+116388
INDIRI4
CNSTI4 0
NEI4 $105
line 80
;80:			cg.showScores = qtrue;
ADDRGP4 cg+116388
CNSTI4 1
ASGNI4
line 81
;81:			cg.numScores = 0;
ADDRGP4 cg+112532
CNSTI4 0
ASGNI4
line 82
;82:		}
line 83
;83:	} else {
ADDRGP4 $105
JUMPV
LABELV $104
line 86
;84:		// show the cached contents even if they just pressed if it
;85:		// is within two seconds
;86:		cg.showScores = qtrue;
ADDRGP4 cg+116388
CNSTI4 1
ASGNI4
line 87
;87:	}
LABELV $105
line 88
;88:}
LABELV $103
endproc CG_ScoresDown_f 0 4
proc CG_ScoresUp_f 0 0
line 90
;89:
;90:static void CG_ScoresUp_f( void ) {
line 91
;91:	if ( cg.showScores ) {
ADDRGP4 cg+116388
INDIRI4
CNSTI4 0
EQI4 $118
line 92
;92:		cg.showScores = qfalse;
ADDRGP4 cg+116388
CNSTI4 0
ASGNI4
line 93
;93:		cg.scoreFadeTime = cg.time;
ADDRGP4 cg+116396
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 94
;94:	}
LABELV $118
line 95
;95:}
LABELV $117
endproc CG_ScoresUp_f 0 0
proc CG_ZoomOn_f 0 4
line 98
;96:
;97:
;98:static void CG_ZoomOn_f( void ) {
line 99
;99:	trap_SendClientCommand( "+zoom" );
ADDRGP4 $125
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 100
;100:}
LABELV $124
endproc CG_ZoomOn_f 0 4
proc CG_ZoomOff_f 0 4
line 102
;101:
;102:static void CG_ZoomOff_f( void ) {
line 103
;103:	trap_SendClientCommand( "-zoom" );
ADDRGP4 $127
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 104
;104:}
LABELV $126
endproc CG_ZoomOff_f 0 4
proc CG_TellTarget_f 264 20
line 172
;105:
;106:#ifdef MISSIONPACK
;107:extern menuDef_t *menuScoreboard;
;108:void Menu_Reset();			// FIXME: add to right include file
;109:
;110:static void CG_LoadHud_f( void) {
;111:  char buff[1024];
;112:	const char *hudSet;
;113:  memset(buff, 0, sizeof(buff));
;114:
;115:	String_Init();
;116:	Menu_Reset();
;117:	
;118:	trap_Cvar_VariableStringBuffer("cg_hudFiles", buff, sizeof(buff));
;119:	hudSet = buff;
;120:	if (hudSet[0] == '\0') {
;121:		hudSet = "ui/hud.txt";
;122:	}
;123:
;124:	CG_LoadMenus(hudSet);
;125:  menuScoreboard = NULL;
;126:}
;127:
;128:
;129:static void CG_scrollScoresDown_f( void) {
;130:	if (menuScoreboard && cg.scoreBoardShowing) {
;131:		Menu_ScrollFeeder(menuScoreboard, FEEDER_SCOREBOARD, qtrue);
;132:		Menu_ScrollFeeder(menuScoreboard, FEEDER_REDTEAM_LIST, qtrue);
;133:		Menu_ScrollFeeder(menuScoreboard, FEEDER_BLUETEAM_LIST, qtrue);
;134:	}
;135:}
;136:
;137:
;138:static void CG_scrollScoresUp_f( void) {
;139:	if (menuScoreboard && cg.scoreBoardShowing) {
;140:		Menu_ScrollFeeder(menuScoreboard, FEEDER_SCOREBOARD, qfalse);
;141:		Menu_ScrollFeeder(menuScoreboard, FEEDER_REDTEAM_LIST, qfalse);
;142:		Menu_ScrollFeeder(menuScoreboard, FEEDER_BLUETEAM_LIST, qfalse);
;143:	}
;144:}
;145:
;146:
;147:static void CG_spWin_f( void) {
;148:	trap_Cvar_Set("cg_cameraOrbit", "2");
;149:	trap_Cvar_Set("cg_cameraOrbitDelay", "35");
;150:	trap_Cvar_Set("cg_thirdPerson", "1");
;151:	trap_Cvar_Set("cg_thirdPersonAngle", "0");
;152:	trap_Cvar_Set("cg_thirdPersonRange", "100");
;153:	CG_AddBufferedSound(cgs.media.winnerSound);
;154:	//trap_S_StartLocalSound(cgs.media.winnerSound, CHAN_ANNOUNCER);
;155:	CG_CenterPrint("YOU WIN!", SCREEN_HEIGHT * .30, 0);
;156:}
;157:
;158:static void CG_spLose_f( void) {
;159:	trap_Cvar_Set("cg_cameraOrbit", "2");
;160:	trap_Cvar_Set("cg_cameraOrbitDelay", "35");
;161:	trap_Cvar_Set("cg_thirdPerson", "1");
;162:	trap_Cvar_Set("cg_thirdPersonAngle", "0");
;163:	trap_Cvar_Set("cg_thirdPersonRange", "100");
;164:	CG_AddBufferedSound(cgs.media.loserSound);
;165:	//trap_S_StartLocalSound(cgs.media.loserSound, CHAN_ANNOUNCER);
;166:	CG_CenterPrint("YOU LOSE...", SCREEN_HEIGHT * .30, 0);
;167:}
;168:
;169:
;170:#endif
;171:
;172:static void CG_TellTarget_f( void ) {
line 177
;173:	int		clientNum;
;174:	char	command[128];
;175:	char	message[128];
;176:
;177:	clientNum = CG_CrosshairPlayer();
ADDRLP4 260
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 260
INDIRI4
ASGNI4
line 178
;178:	if ( clientNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $129
line 179
;179:		return;
ADDRGP4 $128
JUMPV
LABELV $129
line 182
;180:	}
;181:
;182:	trap_Args( message, 128 );
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
line 183
;183:	Com_sprintf( command, 128, "tell %i %s", clientNum, message );
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $131
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 184
;184:	trap_SendClientCommand( command );
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 185
;185:}
LABELV $128
endproc CG_TellTarget_f 264 20
proc CG_TellAttacker_f 264 20
line 187
;186:
;187:static void CG_TellAttacker_f( void ) {
line 192
;188:	int		clientNum;
;189:	char	command[128];
;190:	char	message[128];
;191:
;192:	clientNum = CG_LastAttacker();
ADDRLP4 260
ADDRGP4 CG_LastAttacker
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 260
INDIRI4
ASGNI4
line 193
;193:	if ( clientNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $133
line 194
;194:		return;
ADDRGP4 $132
JUMPV
LABELV $133
line 197
;195:	}
;196:
;197:	trap_Args( message, 128 );
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
line 198
;198:	Com_sprintf( command, 128, "tell %i %s", clientNum, message );
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $131
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 199
;199:	trap_SendClientCommand( command );
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 200
;200:}
LABELV $132
endproc CG_TellAttacker_f 264 20
proc CG_VoiceTellTarget_f 264 20
line 202
;201:
;202:static void CG_VoiceTellTarget_f( void ) {
line 207
;203:	int		clientNum;
;204:	char	command[128];
;205:	char	message[128];
;206:
;207:	clientNum = CG_CrosshairPlayer();
ADDRLP4 260
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 260
INDIRI4
ASGNI4
line 208
;208:	if ( clientNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $136
line 209
;209:		return;
ADDRGP4 $135
JUMPV
LABELV $136
line 212
;210:	}
;211:
;212:	trap_Args( message, 128 );
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
line 213
;213:	Com_sprintf( command, 128, "vtell %i %s", clientNum, message );
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $138
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 214
;214:	trap_SendClientCommand( command );
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 215
;215:}
LABELV $135
endproc CG_VoiceTellTarget_f 264 20
proc CG_VoiceTellAttacker_f 264 20
line 217
;216:
;217:static void CG_VoiceTellAttacker_f( void ) {
line 222
;218:	int		clientNum;
;219:	char	command[128];
;220:	char	message[128];
;221:
;222:	clientNum = CG_LastAttacker();
ADDRLP4 260
ADDRGP4 CG_LastAttacker
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 260
INDIRI4
ASGNI4
line 223
;223:	if ( clientNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $140
line 224
;224:		return;
ADDRGP4 $139
JUMPV
LABELV $140
line 227
;225:	}
;226:
;227:	trap_Args( message, 128 );
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
line 228
;228:	Com_sprintf( command, 128, "vtell %i %s", clientNum, message );
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $138
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 229
;229:	trap_SendClientCommand( command );
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 230
;230:}
LABELV $139
endproc CG_VoiceTellAttacker_f 264 20
proc CG_StartOrbit_f 1028 12
line 407
;231:
;232:
;233:#ifdef MISSIONPACK
;234:static void CG_NextTeamMember_f( void ) {
;235:  CG_SelectNextPlayer();
;236:}
;237:
;238:static void CG_PrevTeamMember_f( void ) {
;239:  CG_SelectPrevPlayer();
;240:}
;241:
;242:// ASS U ME's enumeration order as far as task specific orders, OFFENSE is zero, CAMP is last
;243://
;244:static void CG_NextOrder_f( void ) {
;245:	clientInfo_t *ci = cgs.clientinfo + cg.snap->ps.clientNum;
;246:	if (ci) {
;247:		if (!ci->teamLeader && sortedTeamPlayers[cg_currentSelectedPlayer.integer] != cg.snap->ps.clientNum) {
;248:			return;
;249:		}
;250:	}
;251:	if (cgs.currentOrder < TEAMTASK_CAMP) {
;252:		cgs.currentOrder++;
;253:
;254:		if (cgs.currentOrder == TEAMTASK_RETRIEVE) {
;255:			if (!CG_OtherTeamHasFlag()) {
;256:				cgs.currentOrder++;
;257:			}
;258:		}
;259:
;260:		if (cgs.currentOrder == TEAMTASK_ESCORT) {
;261:			if (!CG_YourTeamHasFlag()) {
;262:				cgs.currentOrder++;
;263:			}
;264:		}
;265:
;266:	} else {
;267:		cgs.currentOrder = TEAMTASK_OFFENSE;
;268:	}
;269:	cgs.orderPending = qtrue;
;270:	cgs.orderTime = cg.time + 3000;
;271:}
;272:
;273:
;274:static void CG_ConfirmOrder_f (void ) {
;275:	trap_SendConsoleCommand(va("cmd vtell %d %s\n", cgs.acceptLeader, VOICECHAT_YES));
;276:	trap_SendConsoleCommand("+button5; wait; -button5");
;277:	if (cg.time < cgs.acceptOrderTime) {
;278:		trap_SendClientCommand(va("teamtask %d\n", cgs.acceptTask));
;279:		cgs.acceptOrderTime = 0;
;280:	}
;281:}
;282:
;283:static void CG_DenyOrder_f (void ) {
;284:	trap_SendConsoleCommand(va("cmd vtell %d %s\n", cgs.acceptLeader, VOICECHAT_NO));
;285:	trap_SendConsoleCommand("+button6; wait; -button6");
;286:	if (cg.time < cgs.acceptOrderTime) {
;287:		cgs.acceptOrderTime = 0;
;288:	}
;289:}
;290:
;291:static void CG_TaskOffense_f (void ) {
;292:	if (cgs.gametype == GT_CTF || cgs.gametype == GT_1FCTF) {
;293:		trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONGETFLAG));
;294:	} else {
;295:		trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONOFFENSE));
;296:	}
;297:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_OFFENSE));
;298:}
;299:
;300:static void CG_TaskDefense_f (void ) {
;301:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONDEFENSE));
;302:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_DEFENSE));
;303:}
;304:
;305:static void CG_TaskPatrol_f (void ) {
;306:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONPATROL));
;307:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_PATROL));
;308:}
;309:
;310:static void CG_TaskCamp_f (void ) {
;311:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONCAMPING));
;312:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_CAMP));
;313:}
;314:
;315:static void CG_TaskFollow_f (void ) {
;316:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONFOLLOW));
;317:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_FOLLOW));
;318:}
;319:
;320:static void CG_TaskRetrieve_f (void ) {
;321:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONRETURNFLAG));
;322:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_RETRIEVE));
;323:}
;324:
;325:static void CG_TaskEscort_f (void ) {
;326:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONFOLLOWCARRIER));
;327:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_ESCORT));
;328:}
;329:
;330:static void CG_TaskOwnFlag_f (void ) {
;331:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_IHAVEFLAG));
;332:}
;333:
;334:static void CG_TauntKillInsult_f (void ) {
;335:	trap_SendConsoleCommand("cmd vsay kill_insult\n");
;336:}
;337:
;338:static void CG_TauntPraise_f (void ) {
;339:	trap_SendConsoleCommand("cmd vsay praise\n");
;340:}
;341:
;342:static void CG_TauntTaunt_f (void ) {
;343:	trap_SendConsoleCommand("cmd vtaunt\n");
;344:}
;345:
;346:static void CG_TauntDeathInsult_f (void ) {
;347:	trap_SendConsoleCommand("cmd vsay death_insult\n");
;348:}
;349:
;350:static void CG_TauntGauntlet_f (void ) {
;351:	trap_SendConsoleCommand("cmd vsay kill_guantlet\n");
;352:}
;353:
;354:static void CG_TaskSuicide_f (void ) {
;355:	int		clientNum;
;356:	char	command[128];
;357:
;358:	clientNum = CG_CrosshairPlayer();
;359:	if ( clientNum == -1 ) {
;360:		return;
;361:	}
;362:
;363:	Com_sprintf( command, 128, "tell %i suicide", clientNum );
;364:	trap_SendClientCommand( command );
;365:}
;366:
;367:
;368:
;369:/*
;370:==================
;371:CG_TeamMenu_f
;372:==================
;373:*/
;374:/*
;375:static void CG_TeamMenu_f( void ) {
;376:  if (trap_Key_GetCatcher() & KEYCATCH_CGAME) {
;377:    CG_EventHandling(CGAME_EVENT_NONE);
;378:    trap_Key_SetCatcher(0);
;379:  } else {
;380:    CG_EventHandling(CGAME_EVENT_TEAMMENU);
;381:    //trap_Key_SetCatcher(KEYCATCH_CGAME);
;382:  }
;383:}
;384:*/
;385:
;386:/*
;387:==================
;388:CG_EditHud_f
;389:==================
;390:*/
;391:/*
;392:static void CG_EditHud_f( void ) {
;393:  //cls.keyCatchers ^= KEYCATCH_CGAME;
;394:  //VM_Call (cgvm, CG_EVENT_HANDLING, (cls.keyCatchers & KEYCATCH_CGAME) ? CGAME_EVENT_EDITHUD : CGAME_EVENT_NONE);
;395:}
;396:*/
;397:
;398:
;399:#endif
;400:
;401:/*
;402:==================
;403:CG_StartOrbit_f
;404:==================
;405:*/
;406:
;407:static void CG_StartOrbit_f( void ) {
line 410
;408:	char var[MAX_TOKEN_CHARS];
;409:
;410:	trap_Cvar_VariableStringBuffer( "developer", var, sizeof( var ) );
ADDRGP4 $143
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 411
;411:	if ( !atoi(var) ) {
ADDRLP4 0
ARGP4
ADDRLP4 1024
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 0
NEI4 $144
line 412
;412:		return;
ADDRGP4 $142
JUMPV
LABELV $144
line 414
;413:	}
;414:	if (cg_cameraOrbit.value != 0) {
ADDRGP4 cg_cameraOrbit+8
INDIRF4
CNSTF4 0
EQF4 $146
line 415
;415:		trap_Cvar_Set ("cg_cameraOrbit", "0");
ADDRGP4 $149
ARGP4
ADDRGP4 $150
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 416
;416:		trap_Cvar_Set("cg_thirdPerson", "0");
ADDRGP4 $151
ARGP4
ADDRGP4 $150
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 417
;417:	} else {
ADDRGP4 $147
JUMPV
LABELV $146
line 418
;418:		trap_Cvar_Set("cg_cameraOrbit", "5");
ADDRGP4 $149
ARGP4
ADDRGP4 $152
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 419
;419:		trap_Cvar_Set("cg_thirdPerson", "1");
ADDRGP4 $151
ARGP4
ADDRGP4 $153
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 420
;420:		trap_Cvar_Set("cg_thirdPersonAngle", "0");
ADDRGP4 $154
ARGP4
ADDRGP4 $150
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 421
;421:		trap_Cvar_Set("cg_thirdPersonRange", "100");
ADDRGP4 $155
ARGP4
ADDRGP4 $156
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 422
;422:	}
LABELV $147
line 423
;423:}
LABELV $142
endproc CG_StartOrbit_f 1028 12
data
align 4
LABELV commands
address $158
address CG_TestGun_f
address $159
address CG_TestModel_f
address $160
address CG_TestModelNextFrame_f
address $161
address CG_TestModelPrevFrame_f
address $162
address CG_TestModelNextSkin_f
address $163
address CG_TestModelPrevSkin_f
address $164
address CG_Viewpos_f
address $165
address CG_ScoresDown_f
address $166
address CG_ScoresUp_f
address $167
address CG_SizeUp_f
address $168
address CG_SizeDown_f
address $169
address CG_NextWeapon_f
address $170
address CG_PrevWeapon_f
address $171
address CG_Weapon_f
address $172
address CG_TellTarget_f
address $173
address CG_TellAttacker_f
address $174
address CG_VoiceTellTarget_f
address $175
address CG_VoiceTellAttacker_f
address $176
address CG_TargetCommand_f
address $177
address CG_StartOrbit_f
address $178
address CG_LoadDeferredPlayers
address $179
address CG_ScannerOn_f
address $180
address CG_ScannerOff_f
export CG_ConsoleCommand
code
proc CG_ConsoleCommand 16 8
line 512
;424:
;425:/*
;426:static void CG_Camera_f( void ) {
;427:	char name[1024];
;428:	trap_Argv( 1, name, sizeof(name));
;429:	if (trap_loadCamera(name)) {
;430:		cg.cameraMode = qtrue;
;431:		trap_startCamera(cg.time);
;432:	} else {
;433:		CG_Printf ("Unable to load camera %s\n",name);
;434:	}
;435:}
;436:*/
;437:
;438:
;439:typedef struct {
;440:	char	*cmd;
;441:	void	(*function)(void);
;442:} consoleCommand_t;
;443:
;444:static consoleCommand_t	commands[] = {
;445:	{ "testgun", CG_TestGun_f },
;446:	{ "testmodel", CG_TestModel_f },
;447:	{ "nextframe", CG_TestModelNextFrame_f },
;448:	{ "prevframe", CG_TestModelPrevFrame_f },
;449:	{ "nextskin", CG_TestModelNextSkin_f },
;450:	{ "prevskin", CG_TestModelPrevSkin_f },
;451:	{ "viewpos", CG_Viewpos_f },
;452:	{ "+scores", CG_ScoresDown_f },
;453:	{ "-scores", CG_ScoresUp_f },
;454://	{ "+zoom", CG_ZoomDown_f },  // Cut these out since zoom is only on alt fire guass
;455://	{ "-zoom", CG_ZoomUp_f },
;456:	{ "sizeup", CG_SizeUp_f },
;457:	{ "sizedown", CG_SizeDown_f },
;458:	{ "weapnext", CG_NextWeapon_f },
;459:	{ "weapprev", CG_PrevWeapon_f },
;460:	{ "weapon", CG_Weapon_f },
;461:	{ "tell_target", CG_TellTarget_f },
;462:	{ "tell_attacker", CG_TellAttacker_f },
;463:	{ "vtell_target", CG_VoiceTellTarget_f },
;464:	{ "vtell_attacker", CG_VoiceTellAttacker_f },
;465:	{ "tcmd", CG_TargetCommand_f },
;466:
;467:#ifdef MISSIONPACK
;468:	{ "loadhud", CG_LoadHud_f },
;469:	{ "nextTeamMember", CG_NextTeamMember_f },
;470:	{ "prevTeamMember", CG_PrevTeamMember_f },
;471:	{ "nextOrder", CG_NextOrder_f },
;472:	{ "confirmOrder", CG_ConfirmOrder_f },
;473:	{ "denyOrder", CG_DenyOrder_f },
;474:	{ "taskOffense", CG_TaskOffense_f },
;475:	{ "taskDefense", CG_TaskDefense_f },
;476:	{ "taskPatrol", CG_TaskPatrol_f },
;477:	{ "taskCamp", CG_TaskCamp_f },
;478:	{ "taskFollow", CG_TaskFollow_f },
;479:	{ "taskRetrieve", CG_TaskRetrieve_f },
;480:	{ "taskEscort", CG_TaskEscort_f },
;481:	{ "taskSuicide", CG_TaskSuicide_f },
;482:	{ "taskOwnFlag", CG_TaskOwnFlag_f },
;483:	{ "tauntKillInsult", CG_TauntKillInsult_f },
;484:	{ "tauntPraise", CG_TauntPraise_f },
;485:	{ "tauntTaunt", CG_TauntTaunt_f },
;486:	{ "tauntDeathInsult", CG_TauntDeathInsult_f },
;487:	{ "tauntGauntlet", CG_TauntGauntlet_f },
;488:	{ "spWin", CG_spWin_f },
;489:	{ "spLose", CG_spLose_f },
;490:	{ "scoresDown", CG_scrollScoresDown_f },
;491:	{ "scoresUp", CG_scrollScoresUp_f },
;492:#endif
;493:	{ "startOrbit", CG_StartOrbit_f },
;494:	//{ "camera", CG_Camera_f },
;495:	{ "loaddeferred", CG_LoadDeferredPlayers },	
;496:	// Shafe - Trep - Radar
;497:	{ "+scanner", CG_ScannerOn_f },   
;498:    { "-scanner", CG_ScannerOff_f },
;499:
;500:	// Shafe - End Radar
;501:};
;502:
;503:
;504:/*
;505:=================
;506:CG_ConsoleCommand
;507:
;508:The string has been tokenized and can be retrieved with
;509:Cmd_Argc() / Cmd_Argv()
;510:=================
;511:*/
;512:qboolean CG_ConsoleCommand( void ) {
line 516
;513:	const char	*cmd;
;514:	int		i;
;515:
;516:	cmd = CG_Argv(0);
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 518
;517:
;518:	for ( i = 0 ; i < sizeof( commands ) / sizeof( commands[0] ) ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $185
JUMPV
LABELV $182
line 519
;519:		if ( !Q_stricmp( cmd, commands[i].cmd ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $186
line 520
;520:			commands[i].function();
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands+4
ADDP4
INDIRP4
CALLV
pop
line 521
;521:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $181
JUMPV
LABELV $186
line 523
;522:		}
;523:	}
LABELV $183
line 518
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $185
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 23
LTU4 $182
line 525
;524:
;525:	return qfalse;
CNSTI4 0
RETI4
LABELV $181
endproc CG_ConsoleCommand 16 8
export CG_InitConsoleCommands
proc CG_InitConsoleCommands 4 4
line 537
;526:}
;527:
;528:
;529:/*
;530:=================
;531:CG_InitConsoleCommands
;532:
;533:Let the client system know about all of our commands
;534:so it can perform tab completion
;535:=================
;536:*/
;537:void CG_InitConsoleCommands( void ) {
line 540
;538:	int		i;
;539:
;540:	for ( i = 0 ; i < sizeof( commands ) / sizeof( commands[0] ) ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $193
JUMPV
LABELV $190
line 541
;541:		trap_AddCommand( commands[i].cmd );
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 542
;542:	}
LABELV $191
line 540
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $193
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 23
LTU4 $190
line 548
;543:
;544:	//
;545:	// the game server will interpret these commands, which will be automatically
;546:	// forwarded to the server after they are not recognized locally
;547:	//
;548:	trap_AddCommand ("kill");
ADDRGP4 $194
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 549
;549:	trap_AddCommand ("say");
ADDRGP4 $195
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 550
;550:	trap_AddCommand ("say_team");
ADDRGP4 $196
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 551
;551:	trap_AddCommand ("tell");
ADDRGP4 $197
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 552
;552:	trap_AddCommand ("vsay");
ADDRGP4 $198
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 553
;553:	trap_AddCommand ("vsay_team");
ADDRGP4 $199
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 554
;554:	trap_AddCommand ("vtell");
ADDRGP4 $200
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 555
;555:	trap_AddCommand ("vtaunt");
ADDRGP4 $201
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 556
;556:	trap_AddCommand ("vosay");
ADDRGP4 $202
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 557
;557:	trap_AddCommand ("vosay_team");
ADDRGP4 $203
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 558
;558:	trap_AddCommand ("votell");
ADDRGP4 $204
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 559
;559:	trap_AddCommand ("give");
ADDRGP4 $205
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 560
;560:	trap_AddCommand ("god");
ADDRGP4 $206
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 561
;561:	trap_AddCommand ("notarget");
ADDRGP4 $207
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 562
;562:	trap_AddCommand ("noclip");
ADDRGP4 $208
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 563
;563:	trap_AddCommand ("team");
ADDRGP4 $209
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 564
;564:	trap_AddCommand ("follow");
ADDRGP4 $210
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 565
;565:	trap_AddCommand ("levelshot");
ADDRGP4 $211
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 566
;566:	trap_AddCommand ("addbot");
ADDRGP4 $212
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 567
;567:	trap_AddCommand ("setviewpos");
ADDRGP4 $213
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 568
;568:	trap_AddCommand ("callvote");
ADDRGP4 $214
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 569
;569:	trap_AddCommand ("vote");
ADDRGP4 $215
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 570
;570:	trap_AddCommand ("callteamvote");
ADDRGP4 $216
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 571
;571:	trap_AddCommand ("teamvote");
ADDRGP4 $217
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 572
;572:	trap_AddCommand ("stats");
ADDRGP4 $218
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 573
;573:	trap_AddCommand ("teamtask");
ADDRGP4 $219
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 574
;574:	trap_AddCommand ("loaddefered");	// spelled wrong, but not changing for demo
ADDRGP4 $220
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 575
;575:}
LABELV $189
endproc CG_InitConsoleCommands 4 4
import trap_PC_SourceFileAndLine
import trap_PC_ReadToken
import trap_PC_FreeSource
import trap_PC_LoadSource
import trap_PC_AddGlobalDefine
import Controls_SetDefaults
import Controls_SetConfig
import Controls_GetConfig
import UI_OutOfMemory
import UI_InitMemory
import UI_Alloc
import Display_CacheAll
import Menu_SetFeederSelection
import Menu_Paint
import Menus_CloseAll
import LerpColor
import Display_HandleKey
import Menus_CloseByName
import Menus_ShowByName
import Menus_FindByName
import Menus_OpenByName
import Display_KeyBindPending
import Display_CursorType
import Display_MouseMove
import Display_CaptureItem
import Display_GetContext
import Menus_Activate
import Menus_AnyFullScreenVisible
import Menu_Reset
import Menus_ActivateByName
import Menu_PaintAll
import Menu_New
import Menu_Count
import PC_Script_Parse
import PC_String_Parse
import PC_Rect_Parse
import PC_Int_Parse
import PC_Color_Parse
import PC_Float_Parse
import Script_Parse
import String_Parse
import Rect_Parse
import Int_Parse
import Color_Parse
import Float_Parse
import Menu_ScrollFeeder
import Menu_HandleMouseMove
import Menu_HandleKey
import Menu_GetFocused
import Menu_PostParse
import Item_Init
import Menu_Init
import Display_ExpandMacros
import Init_Display
import String_Report
import String_Init
import String_Alloc
import CG_DrawScanner
import CG_ScannerOff_f
import CG_ScannerOn_f
import CG_NewParticleArea
import initparticles
import CG_ParticleExplosion
import CG_ParticleMisc
import CG_ParticleDust
import CG_ParticleSparks
import CG_ParticleBulletDebris
import CG_ParticleSnowFlurry
import CG_AddParticleShrapnel
import CG_ParticleSmoke
import CG_ParticleSnow
import CG_AddParticles
import CG_ClearParticles
import trap_GetEntityToken
import trap_getCameraInfo
import trap_startCamera
import trap_loadCamera
import trap_SnapVector
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_Key_GetKey
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_IsDown
import trap_R_RegisterFont
import trap_MemoryRemaining
import testPrintFloat
import testPrintInt
import trap_SetUserCmdValue
import trap_GetUserCmd
import trap_GetCurrentCmdNumber
import trap_GetServerCommand
import trap_GetSnapshot
import trap_GetCurrentSnapshotNumber
import trap_GetGameState
import trap_GetGlconfig
import trap_R_RemapShader
import trap_R_LerpTag
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_LightForPoint
import trap_R_AddLightToScene
import trap_R_AddPolysToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterShader
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_R_LoadWorldMap
import trap_S_StopBackgroundTrack
import trap_S_StartBackgroundTrack
import trap_S_RegisterSound
import trap_S_Respatialize
import trap_S_UpdateEntityPosition
import trap_S_AddRealLoopingSound
import trap_S_AddLoopingSound
import trap_S_ClearLoopingSounds
import trap_S_StartLocalSound
import trap_S_StopLoopingSound
import trap_S_StartSound
import trap_CM_MarkFragments
import trap_CM_TransformedBoxTrace
import trap_CM_BoxTrace
import trap_CM_TransformedPointContents
import trap_CM_PointContents
import trap_CM_TempBoxModel
import trap_CM_InlineModel
import trap_CM_NumInlineModels
import trap_CM_LoadMap
import trap_UpdateScreen
import trap_SendClientCommand
import trap_AddCommand
import trap_SendConsoleCommand
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Cvar_VariableStringBuffer
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import CG_PlayerSprites
import CG_CheckChangedPredictableEvents
import CG_TransitionPlayerState
import CG_Respawn
import CG_PlayBufferedVoiceChats
import CG_VoiceChatLocal
import CG_ShaderStateChanged
import CG_LoadVoiceChats
import CG_SetConfigValues
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_DrawOldTourneyScoreboard
import CG_DrawOldScoreboard
import CG_DrawInformation
import CG_LoadingClient
import CG_LoadingItem
import CG_LoadingString
import CG_TransitionEntity
import CG_ProcessSnapshots
import CG_MakeExplosion
import CG_Bleed
import CG_BigExplode
import CG_GibPlayerHeadshot
import CG_BreakGlass
import CG_GibPlayer
import CG_ScorePlum
import CG_SpawnEffect
import CG_ShotgunTrail
import CG_BubbleTrail
import CG_SmokePuff
import CG_AddLocalEntities
import CG_AllocLocalEntity
import CG_InitLocalEntities
import CG_ImpactMark
import CG_AddMarks
import CG_InitMarkPolys
import CG_OutOfAmmoChange
import CG_DrawWeaponSelect
import CG_AddPlayerWeapon
import CG_AddViewWeapon
import CG_GrappleTrail
import CG_RailTrail
import CG_Bullet
import CG_ShotgunFire
import CG_MissileHitPlayer
import CG_MissileHitWall
import CG_FireWeapon2
import CG_FireWeapon
import CG_RegisterItemVisuals
import CG_RegisterWeapon
import CG_Weapon_f
import CG_PrevWeapon_f
import CG_NextWeapon_f
import CG_PositionRotatedEntityOnTag
import CG_PositionEntityOnTag
import CG_AdjustPositionForMover
import CG_Beam
import CG_AddPacketEntities
import CG_SetEntitySoundPosition
import CG_PainEvent
import CG_EntityEvent
import CG_PlaceString
import CG_CheckEvents
import CG_LoadDeferredPlayers
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
import CG_CustomSound
import CG_NewClientInfo
import CG_AddRefEntityWithPowerups
import CG_ResetPlayerEntity
import CG_Player
import CG_StatusHandle
import CG_OtherTeamHasFlag
import CG_YourTeamHasFlag
import CG_GameTypeString
import CG_CheckOrderPending
import CG_Text_PaintChar
import CG_Draw3DModel
import CG_GetKillerText
import CG_GetGameStatusText
import CG_GetTeamColor
import CG_InitTeamChat
import CG_SetPrintString
import CG_ShowResponseHead
import CG_RunMenuScript
import CG_OwnerDrawVisible
import CG_GetValue
import CG_SelectNextPlayer
import CG_SelectPrevPlayer
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
import CG_OwnerDraw
import CG_DrawTeamBackground
import CG_DrawFlagModel
import CG_DrawActive
import CG_DrawHead
import CG_CenterPrint
import CG_AddLagometerSnapshotInfo
import CG_AddLagometerFrameInfo
import teamChat2
import teamChat1
import systemChat
import drawTeamOverlayModificationCount
import numSortedTeamPlayers
import sortedTeamPlayers
import CG_DrawTopBottom
import CG_DrawSides
import CG_DrawRect
import UI_DrawProportionalString
import CG_GetColorForHealth
import CG_ColorForHealth
import CG_TileClear
import CG_TeamColor
import CG_FadeColor
import CG_DrawStrlen
import CG_DrawSmallStringColor
import CG_DrawSmallString
import CG_DrawBigStringColor
import CG_DrawBigString
import CG_DrawStringExt
import CG_DrawString
import CG_DrawPic
import CG_FillRect
import CG_AdjustFrom640
import CG_DrawActiveFrame
import CG_AddBufferedSound
import CG_ResetZoom
import CG_ZoomUp_f
import CG_ZoomDown_f
import CG_TestModelPrevSkin_f
import CG_TestModelNextSkin_f
import CG_TestModelPrevFrame_f
import CG_TestModelNextFrame_f
import CG_TestGun_f
import CG_TestModel_f
import CG_BuildSpectatorString
import CG_GetSelectedScore
import CG_SetScoreSelection
import CG_RankRunFrame
import CG_EventHandling
import CG_MouseEvent
import CG_KeyEvent
import CG_LoadMenus
import CG_LastAttacker
import CG_CrosshairPlayer
import CG_UpdateCvars
import CG_StartMusic
import CG_Error
import CG_Printf
import CG_Argv
import CG_ConfigString
import CG_Cvar_ClampInt
import CG_AddBoundingBox
import CG_PredictWeaponEffects
import cg_playerOrigins
import cg_CurrentRound
import cg_RedMC
import cg_BlueMC
import cg_GameMode
import cg_plOut
import cg_latentCmds
import cg_latentSnaps
import cl_timeNudge
import cg_optimizePrediction
import cg_projectileNudge
import sv_fps
import cg_cmdTimeNudge
import cg_drawBBox
import cg_debugDelag
import cg_delag
import cg_trueLightning
import cg_oldPlasma
import cg_oldRocket
import cg_oldRail
import cg_noProjectileTrail
import cg_noTaunt
import cg_bigFont
import cg_smallFont
import cg_cameraMode
import cg_timescale
import cg_timescaleFadeSpeed
import cg_timescaleFadeEnd
import cg_cameraOrbitDelay
import cg_cameraOrbit
import pmove_msec
import pmove_fixed
import cg_scorePlum
import cg_noVoiceText
import cg_noVoiceChats
import cg_teamChatsOnly
import cg_drawFriend
import cg_deferPlayers
import cg_predictItems
import cg_blood
import cg_paused
import cg_buildScript
import cg_forceModel
import cg_stats
import cg_teamChatHeight
import cg_teamChatTime
import cg_synchronousClients
import cg_drawAttacker
import cg_lagometer
import cg_stereoSeparation
import cg_thirdPerson
import cg_thirdPersonAngle
import cg_thirdPersonRange
import cg_zoomFov
import cg_fov
import cg_simpleItems
import cg_ignore
import cg_autoswitch
import cg_tracerLength
import cg_tracerWidth
import cg_tracerChance
import cg_viewsize
import cg_drawGun
import cg_gun_z
import cg_gun_y
import cg_gun_x
import cg_gun_frame
import cg_brassTime
import cg_addMarks
import cg_footsteps
import cg_showmiss
import cg_noPlayerAnims
import cg_nopredict
import cg_errorDecay
import cg_railTrailTime
import cg_debugEvents
import cg_debugPosition
import cg_debugAnim
import cg_animSpeed
import cg_draw2D
import cg_drawStatus
import cg_crosshairHealth
import cg_crosshairSize
import cg_crosshairY
import cg_crosshairX
import cg_teamOverlayUserinfo
import cg_drawTeamOverlay
import cg_drawRewards
import cg_drawCrosshairNames
import cg_drawCrosshair
import cg_drawAmmoWarning
import cg_drawIcons
import cg_draw3dIcons
import cg_drawSnapshot
import cg_drawFPS
import cg_drawTimer
import cg_gibs
import cg_shadows
import cg_swingSpeed
import cg_bobroll
import cg_bobpitch
import cg_bobup
import cg_runroll
import cg_runpitch
import cg_centertime
import cg_markPolys
import cg_items
import cg_weapons
import cg_entities
import cg
import cgs
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
import BG_FindItemForAmmo
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
LABELV $220
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $219
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
LABELV $218
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $217
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
LABELV $216
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
LABELV $215
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $214
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
LABELV $213
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
LABELV $212
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $211
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
LABELV $210
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $209
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $208
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $207
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
LABELV $206
byte 1 103
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $205
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $204
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $203
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
LABELV $202
byte 1 118
byte 1 111
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $201
byte 1 118
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $200
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $199
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
LABELV $198
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $197
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $196
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
LABELV $195
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $194
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $180
byte 1 45
byte 1 115
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $179
byte 1 43
byte 1 115
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $178
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $177
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 79
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $176
byte 1 116
byte 1 99
byte 1 109
byte 1 100
byte 1 0
align 1
LABELV $175
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 95
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $174
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 95
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $173
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 95
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $172
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 95
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $171
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $170
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 0
align 1
LABELV $169
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $168
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $167
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $166
byte 1 45
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $165
byte 1 43
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $164
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 112
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $163
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $162
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $161
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $160
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $159
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $158
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $156
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $155
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 82
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $154
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 65
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $153
byte 1 49
byte 1 0
align 1
LABELV $152
byte 1 53
byte 1 0
align 1
LABELV $151
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $150
byte 1 48
byte 1 0
align 1
LABELV $149
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 79
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $143
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
LABELV $138
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $131
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $127
byte 1 45
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $125
byte 1 43
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $110
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $92
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
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $87
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $86
byte 1 99
byte 1 103
byte 1 95
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $84
byte 1 103
byte 1 99
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
