export BotResetNodeSwitches
code
proc BotResetNodeSwitches 0 0
file "../ai_dmnet.c"
line 52
;1:// 2016 Trepidation Licensed under the GPL2 - Team Trepidation
;2://
;3:
;4:/*****************************************************************************
;5: * name:		ai_dmnet.c
;6: *
;7: * desc:		Quake3 bot AI
;8: *
;9: * $Archive: /MissionPack/code/game/ai_dmnet.c $
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
;30://data file headers
;31:#include "chars.h"			//characteristics
;32:#include "inv.h"			//indexes into the inventory
;33:#include "syn.h"			//synonyms
;34:#include "match.h"			//string matching types and vars
;35:
;36:// for the voice chats
;37:#include "../../ui/menudef.h"
;38:
;39://goal flag, see be_ai_goal.h for the other GFL_*
;40:#define GFL_AIR			128
;41:
;42:int numnodeswitches;
;43:char nodeswitch[MAX_NODESWITCHES+1][144];
;44:
;45:#define LOOKAHEAD_DISTANCE			300
;46:
;47:/*
;48:==================
;49:BotResetNodeSwitches
;50:==================
;51:*/
;52:void BotResetNodeSwitches(void) {
line 53
;53:	numnodeswitches = 0;
ADDRGP4 numnodeswitches
CNSTI4 0
ASGNI4
line 54
;54:}
LABELV $56
endproc BotResetNodeSwitches 0 0
export BotDumpNodeSwitches
proc BotDumpNodeSwitches 40 20
line 61
;55:
;56:/*
;57:==================
;58:BotDumpNodeSwitches
;59:==================
;60:*/
;61:void BotDumpNodeSwitches(bot_state_t *bs) {
line 65
;62:	int i;
;63:	char netname[MAX_NETNAME];
;64:
;65:	ClientName(bs->client, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 8
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
line 66
;66:	BotAI_Print(PRT_MESSAGE, "%s at %1.1f switched more than %d AI nodes\n", netname, FloatTime(), MAX_NODESWITCHES);
CNSTI4 1
ARGI4
ADDRGP4 $58
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
line 67
;67:	for (i = 0; i < numnodeswitches; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $62
JUMPV
LABELV $59
line 68
;68:		BotAI_Print(PRT_MESSAGE, nodeswitch[i]);
CNSTI4 1
ARGI4
CNSTI4 144
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 nodeswitch
ADDP4
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 69
;69:	}
LABELV $60
line 67
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $62
ADDRLP4 0
INDIRI4
ADDRGP4 numnodeswitches
INDIRI4
LTI4 $59
line 70
;70:	BotAI_Print(PRT_FATAL, "");
CNSTI4 4
ARGI4
ADDRGP4 $63
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 71
;71:}
LABELV $57
endproc BotDumpNodeSwitches 40 20
export BotRecordNodeSwitch
proc BotRecordNodeSwitch 44 32
line 78
;72:
;73:/*
;74:==================
;75:BotRecordNodeSwitch
;76:==================
;77:*/
;78:void BotRecordNodeSwitch(bot_state_t *bs, char *node, char *str, char *s) {
line 81
;79:	char netname[MAX_NETNAME];
;80:
;81:	ClientName(bs->client, netname, sizeof(netname));
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
line 82
;82:	Com_sprintf(nodeswitch[numnodeswitches], 144, "%s at %2.1f entered %s: %s from %s\n", netname, FloatTime(), node, str, s);
ADDRLP4 36
CNSTI4 144
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 numnodeswitches
INDIRI4
MULI4
ADDRGP4 nodeswitch
ADDP4
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 $65
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 floattime
INDIRF4
ARGF4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 88
;83:#ifdef DEBUG
;84:	if (0) {
;85:		BotAI_Print(PRT_MESSAGE, nodeswitch[numnodeswitches]);
;86:	}
;87:#endif //DEBUG
;88:	numnodeswitches++;
ADDRLP4 40
ADDRGP4 numnodeswitches
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 89
;89:}
LABELV $64
endproc BotRecordNodeSwitch 44 32
lit
align 4
LABELV $67
byte 4 3245342720
byte 4 3245342720
byte 4 3221225472
align 4
LABELV $68
byte 4 1097859072
byte 4 1097859072
byte 4 1073741824
export BotGetAirGoal
code
proc BotGetAirGoal 140 28
line 96
;90:
;91:/*
;92:==================
;93:BotGetAirGoal
;94:==================
;95:*/
;96:int BotGetAirGoal(bot_state_t *bs, bot_goal_t *goal) {
line 98
;97:	bsp_trace_t bsptrace;
;98:	vec3_t end, mins = {-15, -15, -2}, maxs = {15, 15, 2};
ADDRLP4 96
ADDRGP4 $67
INDIRB
ASGNB 12
ADDRLP4 108
ADDRGP4 $68
INDIRB
ASGNB 12
line 102
;99:	int areanum;
;100:
;101:	//trace up until we hit solid
;102:	VectorCopy(bs->origin, end);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 103
;103:	end[2] += 1000;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1148846080
ADDF4
ASGNF4
line 104
;104:	BotAI_Trace(&bsptrace, bs->origin, mins, maxs, end, bs->entitynum, CONTENTS_SOLID|CONTENTS_PLAYERCLIP);
ADDRLP4 12
ARGP4
ADDRLP4 124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 96
ARGP4
ADDRLP4 108
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 124
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 65537
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 106
;105:	//trace down until we hit water
;106:	VectorCopy(bsptrace.endpos, end);
ADDRLP4 0
ADDRLP4 12+12
INDIRB
ASGNB 12
line 107
;107:	BotAI_Trace(&bsptrace, end, mins, maxs, bs->origin, bs->entitynum, CONTENTS_WATER|CONTENTS_SLIME|CONTENTS_LAVA);
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 96
ARGP4
ADDRLP4 108
ARGP4
ADDRLP4 128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 128
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 109
;108:	//if we found the water surface
;109:	if (bsptrace.fraction > 0) {
ADDRLP4 12+8
INDIRF4
CNSTF4 0
LEF4 $71
line 110
;110:		areanum = BotPointAreaNum(bsptrace.endpos);
ADDRLP4 12+12
ARGP4
ADDRLP4 132
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 120
ADDRLP4 132
INDIRI4
ASGNI4
line 111
;111:		if (areanum) {
ADDRLP4 120
INDIRI4
CNSTI4 0
EQI4 $75
line 112
;112:			VectorCopy(bsptrace.endpos, goal->origin);
ADDRFP4 4
INDIRP4
ADDRLP4 12+12
INDIRB
ASGNB 12
line 113
;113:			goal->origin[2] -= 2;
ADDRLP4 136
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 114
;114:			goal->areanum = areanum;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 120
INDIRI4
ASGNI4
line 115
;115:			goal->mins[0] = -15;
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 3245342720
ASGNF4
line 116
;116:			goal->mins[1] = -15;
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 3245342720
ASGNF4
line 117
;117:			goal->mins[2] = -1;
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
CNSTF4 3212836864
ASGNF4
line 118
;118:			goal->maxs[0] = 15;
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
CNSTF4 1097859072
ASGNF4
line 119
;119:			goal->maxs[1] = 15;
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1097859072
ASGNF4
line 120
;120:			goal->maxs[2] = 1;
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1065353216
ASGNF4
line 121
;121:			goal->flags = GFL_AIR;
ADDRFP4 4
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 128
ASGNI4
line 122
;122:			goal->number = 0;
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 123
;123:			goal->iteminfo = 0;
ADDRFP4 4
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 124
;124:			goal->entitynum = 0;
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
CNSTI4 0
ASGNI4
line 125
;125:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $66
JUMPV
LABELV $75
line 127
;126:		}
;127:	}
LABELV $71
line 128
;128:	return qfalse;
CNSTI4 0
RETI4
LABELV $66
endproc BotGetAirGoal 140 28
export BotGoForAir
proc BotGoForAir 68 24
line 136
;129:}
;130:
;131:/*
;132:==================
;133:BotGoForAir
;134:==================
;135:*/
;136:int BotGoForAir(bot_state_t *bs, int tfl, bot_goal_t *ltg, float range) {
line 140
;137:	bot_goal_t goal;
;138:
;139:	//if the bot needs air
;140:	if (bs->lastair_time < FloatTime() - 6) {
ADDRFP4 0
INDIRP4
CNSTI4 6176
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1086324736
SUBF4
GEF4 $79
line 146
;141:		//
;142:#ifdef DEBUG
;143:		//BotAI_Print(PRT_MESSAGE, "going for air\n");
;144:#endif //DEBUG
;145:		//if we can find an air goal
;146:		if (BotGetAirGoal(bs, &goal)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 56
ADDRGP4 BotGetAirGoal
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $84
line 147
;147:			trap_BotPushGoal(bs->gs, &goal);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotPushGoal
CALLV
pop
line 148
;148:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $78
JUMPV
line 150
;149:		}
;150:		else {
LABELV $83
line 152
;151:			//get a nearby goal outside the water
;152:			while(trap_BotChooseNBGItem(bs->gs, bs->origin, bs->inventory, tfl, ltg, range)) {
line 153
;153:				trap_BotGetTopGoal(bs->gs, &goal);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotGetTopGoal
CALLI4
pop
line 155
;154:				//if the goal is not in water
;155:				if (!(trap_AAS_PointContents(goal.origin) & (CONTENTS_WATER|CONTENTS_SLIME|CONTENTS_LAVA))) {
ADDRLP4 0
ARGP4
ADDRLP4 60
ADDRGP4 trap_AAS_PointContents
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
NEI4 $86
line 156
;156:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $78
JUMPV
LABELV $86
line 158
;157:				}
;158:				trap_BotPopGoal(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotPopGoal
CALLV
pop
line 159
;159:			}
LABELV $84
line 152
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 4952
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 64
ADDRGP4 trap_BotChooseNBGItem
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $83
line 160
;160:			trap_BotResetAvoidGoals(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidGoals
CALLV
pop
line 161
;161:		}
line 162
;162:	}
LABELV $79
line 163
;163:	return qfalse;
CNSTI4 0
RETI4
LABELV $78
endproc BotGoForAir 68 24
export BotNearbyGoal
proc BotNearbyGoal 20 24
line 171
;164:}
;165:
;166:/*
;167:==================
;168:BotNearbyGoal
;169:==================
;170:*/
;171:int BotNearbyGoal(bot_state_t *bs, int tfl, bot_goal_t *ltg, float range) {
line 175
;172:	int ret;
;173:
;174:	//check if the bot should go for air
;175:	if (BotGoForAir(bs, tfl, ltg, range)) return qtrue;
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
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 BotGoForAir
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $89
CNSTI4 1
RETI4
ADDRGP4 $88
JUMPV
LABELV $89
line 177
;176:	//if the bot is carrying the enemy flag
;177:	if (BotCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $91
line 179
;178:		//if the bot is just a few secs away from the base 
;179:		if (trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin,
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 6636
ADDP4
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 16
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 300
GEI4 $93
line 180
;180:				bs->teamgoal.areanum, TFL_DEFAULT) < 300) {
line 182
;181:			//make the range really small
;182:			range = 50;
ADDRFP4 12
CNSTF4 1112014848
ASGNF4
line 183
;183:		}
LABELV $93
line 184
;184:	}
LABELV $91
line 186
;185:	//
;186:	ret = trap_BotChooseNBGItem(bs->gs, bs->origin, bs->inventory, tfl, ltg, range);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 4952
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 trap_BotChooseNBGItem
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 16
INDIRI4
ASGNI4
line 197
;187:	/*
;188:	if (ret)
;189:	{
;190:		char buf[128];
;191:		//get the goal at the top of the stack
;192:		trap_BotGetTopGoal(bs->gs, &goal);
;193:		trap_BotGoalName(goal.number, buf, sizeof(buf));
;194:		BotAI_Print(PRT_MESSAGE, "%1.1f: new nearby goal %s\n", FloatTime(), buf);
;195:	}
;196:    */
;197:	return ret;
ADDRLP4 0
INDIRI4
RETI4
LABELV $88
endproc BotNearbyGoal 20 24
export BotReachedGoal
proc BotReachedGoal 40 16
line 205
;198:}
;199:
;200:/*
;201:==================
;202:BotReachedGoal
;203:==================
;204:*/
;205:int BotReachedGoal(bot_state_t *bs, bot_goal_t *goal) {
line 206
;206:	if (goal->flags & GFL_ITEM) {
ADDRFP4 4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $96
line 208
;207:		//if touching the goal
;208:		if (trap_BotTouchingGoal(bs->origin, goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $98
line 209
;209:			if (!(goal->flags & GFL_DROPPED)) {
ADDRFP4 4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $100
line 210
;210:				trap_BotSetAvoidGoalTime(bs->gs, goal->number, -1);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
ADDRGP4 trap_BotSetAvoidGoalTime
CALLV
pop
line 211
;211:			}
LABELV $100
line 212
;212:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $95
JUMPV
LABELV $98
line 215
;213:		}
;214:		//if the goal isn't there
;215:		if (trap_BotItemGoalInVisButNotVisible(bs->entitynum, bs->eye, bs->viewangles, goal)) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 trap_BotItemGoalInVisButNotVisible
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $102
line 227
;216:			/*
;217:			float avoidtime;
;218:			int t;
;219:
;220:			avoidtime = trap_BotAvoidGoalTime(bs->gs, goal->number);
;221:			if (avoidtime > 0) {
;222:				t = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, goal->areanum, bs->tfl);
;223:				if ((float) t * 0.009 < avoidtime)
;224:					return qtrue;
;225:			}
;226:			*/
;227:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $95
JUMPV
LABELV $102
line 230
;228:		}
;229:		//if in the goal area and below or above the goal and not swimming
;230:		if (bs->areanum == goal->areanum) {
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
NEI4 $97
line 231
;231:			if (bs->origin[0] > goal->origin[0] + goal->mins[0] && bs->origin[0] < goal->origin[0] + goal->maxs[0]) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ASGNF4
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 12
INDIRF4
ADDRLP4 20
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDF4
LEF4 $97
ADDRLP4 12
INDIRF4
ADDRLP4 20
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDF4
GEF4 $97
line 232
;232:				if (bs->origin[1] > goal->origin[1] + goal->mins[1] && bs->origin[1] < goal->origin[1] + goal->maxs[1]) {
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ASGNF4
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 24
INDIRF4
ADDRLP4 32
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDF4
LEF4 $97
ADDRLP4 24
INDIRF4
ADDRLP4 32
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDF4
GEF4 $97
line 233
;233:					if (!trap_AAS_Swimming(bs->origin)) {
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 trap_AAS_Swimming
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $97
line 234
;234:						return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $95
JUMPV
line 236
;235:					}
;236:				}
line 237
;237:			}
line 238
;238:		}
line 239
;239:	}
LABELV $96
line 240
;240:	else if (goal->flags & GFL_AIR) {
ADDRFP4 4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $112
line 242
;241:		//if touching the goal
;242:		if (trap_BotTouchingGoal(bs->origin, goal)) return qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $114
CNSTI4 1
RETI4
ADDRGP4 $95
JUMPV
LABELV $114
line 244
;243:		//if the bot got air
;244:		if (bs->lastair_time > FloatTime() - 1) return qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6176
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
LEF4 $113
CNSTI4 1
RETI4
ADDRGP4 $95
JUMPV
line 245
;245:	}
LABELV $112
line 246
;246:	else {
line 248
;247:		//if touching the goal
;248:		if (trap_BotTouchingGoal(bs->origin, goal)) return qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $118
CNSTI4 1
RETI4
ADDRGP4 $95
JUMPV
LABELV $118
line 249
;249:	}
LABELV $113
LABELV $97
line 250
;250:	return qfalse;
CNSTI4 0
RETI4
LABELV $95
endproc BotReachedGoal 40 16
export BotGetItemLongTermGoal
proc BotGetItemLongTermGoal 20 16
line 258
;251:}
;252:
;253:/*
;254:==================
;255:BotGetItemLongTermGoal
;256:==================
;257:*/
;258:int BotGetItemLongTermGoal(bot_state_t *bs, int tfl, bot_goal_t *goal) {
line 260
;259:	//if the bot has no goal
;260:	if (!trap_BotGetTopGoal(bs->gs, goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 trap_BotGetTopGoal
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $121
line 262
;261:		//BotAI_Print(PRT_MESSAGE, "no ltg on stack\n");
;262:		bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6068
ADDP4
CNSTF4 0
ASGNF4
line 263
;263:	}
ADDRGP4 $122
JUMPV
LABELV $121
line 265
;264:	//if the bot touches the current goal
;265:	else if (BotReachedGoal(bs, goal)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotReachedGoal
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $123
line 266
;266:		BotChooseWeapon(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotChooseWeapon
CALLV
pop
line 267
;267:		bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6068
ADDP4
CNSTF4 0
ASGNF4
line 268
;268:	}
LABELV $123
LABELV $122
line 270
;269:	//if it is time to find a new long term goal
;270:	if (bs->ltg_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6068
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $125
line 272
;271:		//pop the current goal from the stack
;272:		trap_BotPopGoal(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotPopGoal
CALLV
pop
line 276
;273:		//BotAI_Print(PRT_MESSAGE, "%s: choosing new ltg\n", ClientName(bs->client, netname, sizeof(netname)));
;274:		//choose a new goal
;275:		//BotAI_Print(PRT_MESSAGE, "%6.1f client %d: BotChooseLTGItem\n", FloatTime(), bs->client);
;276:		if (trap_BotChooseLTGItem(bs->gs, bs->origin, bs->inventory, tfl)) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 4952
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 trap_BotChooseLTGItem
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $127
line 284
;277:			/*
;278:			char buf[128];
;279:			//get the goal at the top of the stack
;280:			trap_BotGetTopGoal(bs->gs, goal);
;281:			trap_BotGoalName(goal->number, buf, sizeof(buf));
;282:			BotAI_Print(PRT_MESSAGE, "%1.1f: new long term goal %s\n", FloatTime(), buf);
;283:            */
;284:			bs->ltg_time = FloatTime() + 20;
ADDRFP4 0
INDIRP4
CNSTI4 6068
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1101004800
ADDF4
ASGNF4
line 285
;285:		}
ADDRGP4 $128
JUMPV
LABELV $127
line 286
;286:		else {//the bot gets sorta stuck with all the avoid timings, shouldn't happen though
line 295
;287:			//
;288:#ifdef DEBUG
;289:			char netname[128];
;290:
;291:			BotAI_Print(PRT_MESSAGE, "%s: no valid ltg (probably stuck)\n", ClientName(bs->client, netname, sizeof(netname)));
;292:#endif
;293:			//trap_BotDumpAvoidGoals(bs->gs);
;294:			//reset the avoid goals and the avoid reach
;295:			trap_BotResetAvoidGoals(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidGoals
CALLV
pop
line 296
;296:			trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 297
;297:		}
LABELV $128
line 299
;298:		//get the goal at the top of the stack
;299:		return trap_BotGetTopGoal(bs->gs, goal);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_BotGetTopGoal
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
RETI4
ADDRGP4 $120
JUMPV
LABELV $125
line 301
;300:	}
;301:	return qtrue;
CNSTI4 1
RETI4
LABELV $120
endproc BotGetItemLongTermGoal 20 16
export BotGetLongTermGoal
proc BotGetLongTermGoal 664 20
line 312
;302:}
;303:
;304:/*
;305:==================
;306:BotGetLongTermGoal
;307:
;308:we could also create a seperate AI node for every long term goal type
;309:however this saves us a lot of code
;310:==================
;311:*/
;312:int BotGetLongTermGoal(bot_state_t *bs, int tfl, int retreat, bot_goal_t *goal) {
line 321
;313:	vec3_t target, dir, dir2;
;314:	char netname[MAX_NETNAME];
;315:	char buf[MAX_MESSAGE_SIZE];
;316:	int areanum;
;317:	float croucher;
;318:	aas_entityinfo_t entinfo, botinfo;
;319:	bot_waypoint_t *wp;
;320:
;321:	if (bs->ltgtype == LTG_TEAMHELP && !retreat) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 1
NEI4 $130
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $130
line 323
;322:		//check for bot typing status message
;323:		if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 620
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
ASGNF4
ADDRLP4 620
INDIRF4
CNSTF4 0
EQF4 $132
ADDRLP4 620
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $132
line 324
;324:			BotAI_BotInitialChat(bs, "help_start", EasyClientName(bs->teammate, netname, sizeof(netname)), NULL);
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 412
ARGP4
CNSTI4 36
ARGI4
ADDRLP4 624
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $134
ARGP4
ADDRLP4 624
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 325
;325:			trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 628
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 628
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 628
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 326
;326:			BotVoiceChatOnly(bs, bs->decisionmaker, VOICECHAT_YES);
ADDRLP4 632
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 632
INDIRP4
ARGP4
ADDRLP4 632
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
ADDRGP4 $135
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
line 327
;327:			trap_EA_Action(bs->client, ACTION_AFFIRMATIVE);
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
line 328
;328:			bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 329
;329:		}
LABELV $132
line 331
;330:		//if trying to help the team mate for more than a minute
;331:		if (bs->teamgoal_time < FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $136
line 332
;332:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
LABELV $136
line 334
;333:		//if the team mate IS visible for quite some time
;334:		if (bs->teammatevisible_time < FloatTime() - 10) bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6748
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1092616192
SUBF4
GEF4 $138
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
LABELV $138
line 336
;335:		//get entity information of the companion
;336:		BotEntityInfo(bs->teammate, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 272
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 338
;337:		//if the team mate is visible
;338:		if (BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, bs->teammate)) {
ADDRLP4 624
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 624
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 624
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 624
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 624
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 628
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 628
INDIRF4
CNSTF4 0
EQF4 $140
line 340
;339:			//if close just stand still there
;340:			VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 632
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 260
ADDRLP4 272+24
INDIRF4
ADDRLP4 632
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 260+4
ADDRLP4 272+24+4
INDIRF4
ADDRLP4 632
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 260+8
ADDRLP4 272+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 341
;341:			if (VectorLengthSquared(dir) < Square(100)) {
ADDRLP4 260
ARGP4
ADDRLP4 636
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 636
INDIRF4
CNSTF4 1176256512
GEF4 $141
line 342
;342:				trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 343
;343:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $129
JUMPV
line 345
;344:			}
;345:		}
LABELV $140
line 346
;346:		else {
line 348
;347:			//last time the bot was NOT visible
;348:			bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6748
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 349
;349:		}
LABELV $141
line 351
;350:		//if the entity information is valid (entity in PVS)
;351:		if (entinfo.valid) {
ADDRLP4 272
INDIRI4
CNSTI4 0
EQI4 $151
line 352
;352:			areanum = BotPointAreaNum(entinfo.origin);
ADDRLP4 272+24
ARGP4
ADDRLP4 632
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 448
ADDRLP4 632
INDIRI4
ASGNI4
line 353
;353:			if (areanum && trap_AAS_AreaReachability(areanum)) {
ADDRLP4 636
ADDRLP4 448
INDIRI4
ASGNI4
ADDRLP4 636
INDIRI4
CNSTI4 0
EQI4 $154
ADDRLP4 636
INDIRI4
ARGI4
ADDRLP4 640
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 640
INDIRI4
CNSTI4 0
EQI4 $154
line 355
;354:				//update team goal
;355:				bs->teamgoal.entitynum = bs->teammate;
ADDRLP4 644
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 644
INDIRP4
CNSTI4 6664
ADDP4
ADDRLP4 644
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ASGNI4
line 356
;356:				bs->teamgoal.areanum = areanum;
ADDRFP4 0
INDIRP4
CNSTI4 6636
ADDP4
ADDRLP4 448
INDIRI4
ASGNI4
line 357
;357:				VectorCopy(entinfo.origin, bs->teamgoal.origin);
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ADDRLP4 272+24
INDIRB
ASGNB 12
line 358
;358:				VectorSet(bs->teamgoal.mins, -8, -8, -8);
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
line 359
;359:				VectorSet(bs->teamgoal.maxs, 8, 8, 8);
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
line 360
;360:			}
LABELV $154
line 361
;361:		}
LABELV $151
line 362
;362:		memcpy(goal, &bs->teamgoal, sizeof(bot_goal_t));
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 363
;363:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $129
JUMPV
LABELV $130
line 366
;364:	}
;365:	//if the bot accompanies someone
;366:	if (bs->ltgtype == LTG_TEAMACCOMPANY && !retreat) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
NEI4 $157
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $157
line 368
;367:		//check for bot typing status message
;368:		if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 620
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
ASGNF4
ADDRLP4 620
INDIRF4
CNSTF4 0
EQF4 $159
ADDRLP4 620
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $159
line 369
;369:			BotAI_BotInitialChat(bs, "accompany_start", EasyClientName(bs->teammate, netname, sizeof(netname)), NULL);
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 412
ARGP4
CNSTI4 36
ARGI4
ADDRLP4 624
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $161
ARGP4
ADDRLP4 624
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 370
;370:			trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 628
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 628
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 628
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 371
;371:			BotVoiceChatOnly(bs, bs->decisionmaker, VOICECHAT_YES);
ADDRLP4 632
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 632
INDIRP4
ARGP4
ADDRLP4 632
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
ADDRGP4 $135
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
line 372
;372:			trap_EA_Action(bs->client, ACTION_AFFIRMATIVE);
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
line 373
;373:			bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 374
;374:		}
LABELV $159
line 376
;375:		//if accompanying the companion for 3 minutes
;376:		if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $162
line 377
;377:			BotAI_BotInitialChat(bs, "accompany_stop", EasyClientName(bs->teammate, netname, sizeof(netname)), NULL);
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 412
ARGP4
CNSTI4 36
ARGI4
ADDRLP4 624
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $164
ARGP4
ADDRLP4 624
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 378
;378:			trap_BotEnterChat(bs->cs, bs->teammate, CHAT_TELL);
ADDRLP4 628
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 628
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 628
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 379
;379:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 380
;380:		}
LABELV $162
line 382
;381:		//get entity information of the companion
;382:		BotEntityInfo(bs->teammate, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 272
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 384
;383:		//if the companion is visible
;384:		if (BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, bs->teammate)) {
ADDRLP4 624
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 624
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 624
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 624
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 624
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 628
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 628
INDIRF4
CNSTF4 0
EQF4 $165
line 386
;385:			//update visible time
;386:			bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6748
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 387
;387:			VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 632
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 260
ADDRLP4 272+24
INDIRF4
ADDRLP4 632
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 260+4
ADDRLP4 272+24+4
INDIRF4
ADDRLP4 632
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 260+8
ADDRLP4 272+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 388
;388:			if (VectorLengthSquared(dir) < Square(bs->formation_dist)) {
ADDRLP4 260
ARGP4
ADDRLP4 636
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 640
ADDRFP4 0
INDIRP4
CNSTI4 7012
ADDP4
INDIRF4
ASGNF4
ADDRLP4 636
INDIRF4
ADDRLP4 640
INDIRF4
ADDRLP4 640
INDIRF4
MULF4
GEF4 $174
line 392
;389:				//
;390:				// if the client being followed bumps into this bot then
;391:				// the bot should back up
;392:				BotEntityInfo(bs->entitynum, &botinfo);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 452
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 394
;393:				// if the followed client is not standing ontop of the bot
;394:				if (botinfo.origin[2] + botinfo.maxs[2] > entinfo.origin[2] + entinfo.mins[2]) {
ADDRLP4 452+24+8
INDIRF4
ADDRLP4 452+84+8
INDIRF4
ADDF4
ADDRLP4 272+24+8
INDIRF4
ADDRLP4 272+72+8
INDIRF4
ADDF4
LEF4 $176
line 396
;395:					// if the bounding boxes touch each other
;396:					if (botinfo.origin[0] + botinfo.maxs[0] > entinfo.origin[0] + entinfo.mins[0] - 4&&
ADDRLP4 644
CNSTF4 1082130432
ASGNF4
ADDRLP4 452+24
INDIRF4
ADDRLP4 452+84
INDIRF4
ADDF4
ADDRLP4 272+24
INDIRF4
ADDRLP4 272+72
INDIRF4
ADDF4
ADDRLP4 644
INDIRF4
SUBF4
LEF4 $186
ADDRLP4 452+24
INDIRF4
ADDRLP4 452+72
INDIRF4
ADDF4
ADDRLP4 272+24
INDIRF4
ADDRLP4 272+84
INDIRF4
ADDF4
ADDRLP4 644
INDIRF4
ADDF4
GEF4 $186
line 397
;397:						botinfo.origin[0] + botinfo.mins[0] < entinfo.origin[0] + entinfo.maxs[0] + 4) {
line 398
;398:						if (botinfo.origin[1] + botinfo.maxs[1] > entinfo.origin[1] + entinfo.mins[1] - 4 &&
ADDRLP4 648
CNSTF4 1082130432
ASGNF4
ADDRLP4 452+24+4
INDIRF4
ADDRLP4 452+84+4
INDIRF4
ADDF4
ADDRLP4 272+24+4
INDIRF4
ADDRLP4 272+72+4
INDIRF4
ADDF4
ADDRLP4 648
INDIRF4
SUBF4
LEF4 $196
ADDRLP4 452+24+4
INDIRF4
ADDRLP4 452+72+4
INDIRF4
ADDF4
ADDRLP4 272+24+4
INDIRF4
ADDRLP4 272+84+4
INDIRF4
ADDF4
ADDRLP4 648
INDIRF4
ADDF4
GEF4 $196
line 399
;399:							botinfo.origin[1] + botinfo.mins[1] < entinfo.origin[1] + entinfo.maxs[1] + 4) {
line 400
;400:							if (botinfo.origin[2] + botinfo.maxs[2] > entinfo.origin[2] + entinfo.mins[2] - 4 &&
ADDRLP4 652
CNSTF4 1082130432
ASGNF4
ADDRLP4 452+24+8
INDIRF4
ADDRLP4 452+84+8
INDIRF4
ADDF4
ADDRLP4 272+24+8
INDIRF4
ADDRLP4 272+72+8
INDIRF4
ADDF4
ADDRLP4 652
INDIRF4
SUBF4
LEF4 $214
ADDRLP4 452+24+8
INDIRF4
ADDRLP4 452+72+8
INDIRF4
ADDF4
ADDRLP4 272+24+8
INDIRF4
ADDRLP4 272+84+8
INDIRF4
ADDF4
ADDRLP4 652
INDIRF4
ADDF4
GEF4 $214
line 401
;401:								botinfo.origin[2] + botinfo.mins[2] < entinfo.origin[2] + entinfo.maxs[2] + 4) {
line 403
;402:								// if the followed client looks in the direction of this bot
;403:								AngleVectors(entinfo.angles, dir, NULL, NULL);
ADDRLP4 272+36
ARGP4
ADDRLP4 260
ARGP4
ADDRLP4 656
CNSTP4 0
ASGNP4
ADDRLP4 656
INDIRP4
ARGP4
ADDRLP4 656
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 404
;404:								dir[2] = 0;
ADDRLP4 260+8
CNSTF4 0
ASGNF4
line 405
;405:								VectorNormalize(dir);
ADDRLP4 260
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 407
;406:								//VectorSubtract(entinfo.origin, entinfo.lastvisorigin, dir);
;407:								VectorSubtract(bs->origin, entinfo.origin, dir2);
ADDRLP4 660
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 608
ADDRLP4 660
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRLP4 272+24
INDIRF4
SUBF4
ASGNF4
ADDRLP4 608+4
ADDRLP4 660
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRLP4 272+24+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 608+8
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRLP4 272+24+8
INDIRF4
SUBF4
ASGNF4
line 408
;408:								VectorNormalize(dir2);
ADDRLP4 608
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 409
;409:								if (DotProduct(dir, dir2) > 0.7) {
ADDRLP4 260
INDIRF4
ADDRLP4 608
INDIRF4
MULF4
ADDRLP4 260+4
INDIRF4
ADDRLP4 608+4
INDIRF4
MULF4
ADDF4
ADDRLP4 260+8
INDIRF4
ADDRLP4 608+8
INDIRF4
MULF4
ADDF4
CNSTF4 1060320051
LEF4 $241
line 411
;410:									// back up
;411:									BotSetupForMovement(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 412
;412:									trap_BotMoveInDirection(bs->ms, dir2, 400, MOVE_WALK);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 608
ARGP4
CNSTF4 1137180672
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotMoveInDirection
CALLI4
pop
line 413
;413:								}
LABELV $241
line 414
;414:							}
LABELV $214
line 415
;415:						}
LABELV $196
line 416
;416:					}
LABELV $186
line 417
;417:				}
LABELV $176
line 420
;418:				//check if the bot wants to crouch
;419:				//don't crouch if crouched less than 5 seconds ago
;420:				if (bs->attackcrouch_time < FloatTime() - 5) {
ADDRFP4 0
INDIRP4
CNSTI4 6120
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
SUBF4
GEF4 $247
line 421
;421:					croucher = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CROUCHER, 0, 1);
ADDRFP4 0
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
ADDRLP4 644
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 604
ADDRLP4 644
INDIRF4
ASGNF4
line 422
;422:					if (random() < bs->thinktime * croucher) {
ADDRLP4 648
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 648
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRFP4 0
INDIRP4
CNSTI4 4904
ADDP4
INDIRF4
ADDRLP4 604
INDIRF4
MULF4
GEF4 $249
line 423
;423:						bs->attackcrouch_time = FloatTime() + 5 + croucher * 15;
ADDRFP4 0
INDIRP4
CNSTI4 6120
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CNSTF4 1097859072
ADDRLP4 604
INDIRF4
MULF4
ADDF4
ASGNF4
line 424
;424:					}
LABELV $249
line 425
;425:				}
LABELV $247
line 427
;426:				//don't crouch when swimming
;427:				if (trap_AAS_Swimming(bs->origin)) bs->attackcrouch_time = FloatTime() - 1;
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 644
ADDRGP4 trap_AAS_Swimming
CALLI4
ASGNI4
ADDRLP4 644
INDIRI4
CNSTI4 0
EQI4 $251
ADDRFP4 0
INDIRP4
CNSTI4 6120
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
ASGNF4
LABELV $251
line 429
;428:				//if not arrived yet or arived some time ago
;429:				if (bs->arrive_time < FloatTime() - 2) {
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
SUBF4
GEF4 $253
line 431
;430:					//if not arrived yet
;431:					if (!bs->arrive_time) {
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
INDIRF4
CNSTF4 0
NEF4 $255
line 432
;432:						trap_EA_Gesture(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Gesture
CALLV
pop
line 433
;433:						BotAI_BotInitialChat(bs, "accompany_arrive", EasyClientName(bs->teammate, netname, sizeof(netname)), NULL);
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 412
ARGP4
CNSTI4 36
ARGI4
ADDRLP4 648
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $257
ARGP4
ADDRLP4 648
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 434
;434:						trap_BotEnterChat(bs->cs, bs->teammate, CHAT_TELL);
ADDRLP4 652
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 652
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 652
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 435
;435:						bs->arrive_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 436
;436:					}
ADDRGP4 $256
JUMPV
LABELV $255
line 438
;437:					//if the bot wants to crouch
;438:					else if (bs->attackcrouch_time > FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6120
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $258
line 439
;439:						trap_EA_Crouch(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Crouch
CALLV
pop
line 440
;440:					}
ADDRGP4 $259
JUMPV
LABELV $258
line 442
;441:					//else do some model taunts
;442:					else if (random() < bs->thinktime * 0.05) {
ADDRLP4 648
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 648
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1028443341
ADDRFP4 0
INDIRP4
CNSTI4 4904
ADDP4
INDIRF4
MULF4
GEF4 $260
line 444
;443:						//do a gesture :)
;444:						trap_EA_Gesture(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Gesture
CALLV
pop
line 445
;445:					}
LABELV $260
LABELV $259
LABELV $256
line 446
;446:				}
LABELV $253
line 448
;447:				//if just arrived look at the companion
;448:				if (bs->arrive_time > FloatTime() - 2) {
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
SUBF4
LEF4 $262
line 449
;449:					VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 648
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 260
ADDRLP4 272+24
INDIRF4
ADDRLP4 648
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 260+4
ADDRLP4 272+24+4
INDIRF4
ADDRLP4 648
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 260+8
ADDRLP4 272+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 450
;450:					vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 260
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 451
;451:					bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 652
ADDRFP4 0
INDIRP4
CNSTI4 6584
ADDP4
ASGNP4
ADDRLP4 652
INDIRP4
CNSTF4 1056964608
ADDRLP4 652
INDIRP4
INDIRF4
MULF4
ASGNF4
line 452
;452:				}
ADDRGP4 $263
JUMPV
LABELV $262
line 454
;453:				//else look strategically around for enemies
;454:				else if (random() < bs->thinktime * 0.8) {
ADDRLP4 648
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 648
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1061997773
ADDRFP4 0
INDIRP4
CNSTI4 4904
ADDP4
INDIRF4
MULF4
GEF4 $271
line 455
;455:					BotRoamGoal(bs, target);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 592
ARGP4
ADDRGP4 BotRoamGoal
CALLV
pop
line 456
;456:					VectorSubtract(target, bs->origin, dir);
ADDRLP4 652
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 260
ADDRLP4 592
INDIRF4
ADDRLP4 652
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 260+4
ADDRLP4 592+4
INDIRF4
ADDRLP4 652
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 260+8
ADDRLP4 592+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 457
;457:					vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 260
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 458
;458:					bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 656
ADDRFP4 0
INDIRP4
CNSTI4 6584
ADDP4
ASGNP4
ADDRLP4 656
INDIRP4
CNSTF4 1056964608
ADDRLP4 656
INDIRP4
INDIRF4
MULF4
ASGNF4
line 459
;459:				}
LABELV $271
LABELV $263
line 461
;460:				//check if the bot wants to go for air
;461:				if (BotGoForAir(bs, bs->tfl, &bs->teamgoal, 400)) {
ADDRLP4 652
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 652
INDIRP4
ARGP4
ADDRLP4 652
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRLP4 652
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 656
ADDRGP4 BotGoForAir
CALLI4
ASGNI4
ADDRLP4 656
INDIRI4
CNSTI4 0
EQI4 $277
line 462
;462:					trap_BotResetLastAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetLastAvoidReach
CALLV
pop
line 468
;463:					//get the goal at the top of the stack
;464:					//trap_BotGetTopGoal(bs->gs, &tmpgoal);
;465:					//trap_BotGoalName(tmpgoal.number, buf, 144);
;466:					//BotAI_Print(PRT_MESSAGE, "new nearby goal %s\n", buf);
;467:					//time the bot gets to pick up the nearby goal item
;468:					bs->nbg_time = FloatTime() + 8;
ADDRFP4 0
INDIRP4
CNSTI4 6072
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 469
;469:					AIEnter_Seek_NBG(bs, "BotLongTermGoal: go for air");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $279
ARGP4
ADDRGP4 AIEnter_Seek_NBG
CALLV
pop
line 470
;470:					return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $129
JUMPV
LABELV $277
line 473
;471:				}
;472:				//
;473:				trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 474
;474:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $129
JUMPV
LABELV $174
line 476
;475:			}
;476:		}
LABELV $165
line 478
;477:		//if the entity information is valid (entity in PVS)
;478:		if (entinfo.valid) {
ADDRLP4 272
INDIRI4
CNSTI4 0
EQI4 $280
line 479
;479:			areanum = BotPointAreaNum(entinfo.origin);
ADDRLP4 272+24
ARGP4
ADDRLP4 632
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 448
ADDRLP4 632
INDIRI4
ASGNI4
line 480
;480:			if (areanum && trap_AAS_AreaReachability(areanum)) {
ADDRLP4 636
ADDRLP4 448
INDIRI4
ASGNI4
ADDRLP4 636
INDIRI4
CNSTI4 0
EQI4 $283
ADDRLP4 636
INDIRI4
ARGI4
ADDRLP4 640
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 640
INDIRI4
CNSTI4 0
EQI4 $283
line 482
;481:				//update team goal
;482:				bs->teamgoal.entitynum = bs->teammate;
ADDRLP4 644
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 644
INDIRP4
CNSTI4 6664
ADDP4
ADDRLP4 644
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ASGNI4
line 483
;483:				bs->teamgoal.areanum = areanum;
ADDRFP4 0
INDIRP4
CNSTI4 6636
ADDP4
ADDRLP4 448
INDIRI4
ASGNI4
line 484
;484:				VectorCopy(entinfo.origin, bs->teamgoal.origin);
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ADDRLP4 272+24
INDIRB
ASGNB 12
line 485
;485:				VectorSet(bs->teamgoal.mins, -8, -8, -8);
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
line 486
;486:				VectorSet(bs->teamgoal.maxs, 8, 8, 8);
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
line 487
;487:			}
LABELV $283
line 488
;488:		}
LABELV $280
line 490
;489:		//the goal the bot should go for
;490:		memcpy(goal, &bs->teamgoal, sizeof(bot_goal_t));
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 492
;491:		//if the companion is NOT visible for too long
;492:		if (bs->teammatevisible_time < FloatTime() - 60) {
ADDRFP4 0
INDIRP4
CNSTI4 6748
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1114636288
SUBF4
GEF4 $286
line 493
;493:			BotAI_BotInitialChat(bs, "accompany_cannotfind", EasyClientName(bs->teammate, netname, sizeof(netname)), NULL);
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 412
ARGP4
CNSTI4 36
ARGI4
ADDRLP4 632
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $288
ARGP4
ADDRLP4 632
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 494
;494:			trap_BotEnterChat(bs->cs, bs->teammate, CHAT_TELL);
ADDRLP4 636
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 636
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 636
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 495
;495:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 497
;496:			// just to make sure the bot won't spam this message
;497:			bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6748
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 498
;498:		}
LABELV $286
line 499
;499:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $129
JUMPV
LABELV $157
line 502
;500:	}
;501:	//
;502:	if (bs->ltgtype == LTG_DEFENDKEYAREA) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 3
NEI4 $289
line 503
;503:		if (trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin,
ADDRLP4 620
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 620
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 620
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 620
INDIRP4
CNSTI4 6636
ADDP4
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 624
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 624
INDIRI4
CVIF4 4
ADDRFP4 0
INDIRP4
CNSTI4 6148
ADDP4
INDIRF4
LEF4 $291
line 504
;504:				bs->teamgoal.areanum, TFL_DEFAULT) > bs->defendaway_range) {
line 505
;505:			bs->defendaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6144
ADDP4
CNSTF4 0
ASGNF4
line 506
;506:		}
LABELV $291
line 507
;507:	}
LABELV $289
line 509
;508:	//if defending a key area
;509:	if (bs->ltgtype == LTG_DEFENDKEYAREA && !retreat &&
ADDRLP4 620
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 620
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 3
NEI4 $293
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $293
ADDRLP4 620
INDIRP4
CNSTI4 6144
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $293
line 510
;510:				bs->defendaway_time < FloatTime()) {
line 512
;511:		//check for bot typing status message
;512:		if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 624
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
ASGNF4
ADDRLP4 624
INDIRF4
CNSTF4 0
EQF4 $295
ADDRLP4 624
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $295
line 513
;513:			trap_BotGoalName(bs->teamgoal.number, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 514
;514:			BotAI_BotInitialChat(bs, "defend_start", buf, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $297
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 515
;515:			trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
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
line 516
;516:			BotVoiceChatOnly(bs, -1, VOICECHAT_ONDEFENSE);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 $298
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
line 517
;517:			bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 518
;518:		}
LABELV $295
line 520
;519:		//set the bot goal
;520:		memcpy(goal, &bs->teamgoal, sizeof(bot_goal_t));
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 522
;521:		//stop after 2 minutes
;522:		if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $299
line 523
;523:			trap_BotGoalName(bs->teamgoal.number, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 524
;524:			BotAI_BotInitialChat(bs, "defend_stop", buf, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $301
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 525
;525:			trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
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
line 526
;526:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 527
;527:		}
LABELV $299
line 529
;528:		//if very close... go away for some time
;529:		VectorSubtract(goal->origin, bs->origin, dir);
ADDRLP4 628
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 632
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 260
ADDRLP4 628
INDIRP4
INDIRF4
ADDRLP4 632
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 260+4
ADDRLP4 628
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 632
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 260+8
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 530
;530:		if (VectorLengthSquared(dir) < Square(70)) {
ADDRLP4 260
ARGP4
ADDRLP4 636
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 636
INDIRF4
CNSTF4 1167663104
GEF4 $304
line 531
;531:			trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 532
;532:			bs->defendaway_time = FloatTime() + 3 + 3 * random();
ADDRLP4 640
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 644
CNSTF4 1077936128
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6144
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 644
INDIRF4
ADDF4
ADDRLP4 644
INDIRF4
ADDRLP4 640
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 533
;533:			if (BotHasPersistantPowerupAndWeapon(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 648
ADDRGP4 BotHasPersistantPowerupAndWeapon
CALLI4
ASGNI4
ADDRLP4 648
INDIRI4
CNSTI4 0
EQI4 $306
line 534
;534:				bs->defendaway_range = 100;
ADDRFP4 0
INDIRP4
CNSTI4 6148
ADDP4
CNSTF4 1120403456
ASGNF4
line 535
;535:			}
ADDRGP4 $307
JUMPV
LABELV $306
line 536
;536:			else {
line 537
;537:				bs->defendaway_range = 350;
ADDRFP4 0
INDIRP4
CNSTI4 6148
ADDP4
CNSTF4 1135542272
ASGNF4
line 538
;538:			}
LABELV $307
line 539
;539:		}
LABELV $304
line 540
;540:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $129
JUMPV
LABELV $293
line 543
;541:	}
;542:	//going to kill someone
;543:	if (bs->ltgtype == LTG_KILL && !retreat) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 11
NEI4 $308
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $308
line 545
;544:		//check for bot typing status message
;545:		if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 624
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
ASGNF4
ADDRLP4 624
INDIRF4
CNSTF4 0
EQF4 $310
ADDRLP4 624
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $310
line 546
;546:			EasyClientName(bs->teamgoal.entitynum, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 547
;547:			BotAI_BotInitialChat(bs, "kill_start", buf, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $312
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 548
;548:			trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 628
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 628
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 628
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 549
;549:			bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 550
;550:		}
LABELV $310
line 552
;551:		//
;552:		if (bs->lastkilledplayer == bs->teamgoal.entitynum) {
ADDRLP4 628
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 628
INDIRP4
CNSTI4 5992
ADDP4
INDIRI4
ADDRLP4 628
INDIRP4
CNSTI4 6664
ADDP4
INDIRI4
NEI4 $313
line 553
;553:			EasyClientName(bs->teamgoal.entitynum, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 554
;554:			BotAI_BotInitialChat(bs, "kill_done", buf, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $315
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 555
;555:			trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 632
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 632
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 632
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 556
;556:			bs->lastkilledplayer = -1;
ADDRFP4 0
INDIRP4
CNSTI4 5992
ADDP4
CNSTI4 -1
ASGNI4
line 557
;557:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 558
;558:		}
LABELV $313
line 560
;559:		//
;560:		if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $316
line 561
;561:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 562
;562:		}
LABELV $316
line 564
;563:		//just roam around
;564:		return BotGetItemLongTermGoal(bs, tfl, goal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 632
ADDRGP4 BotGetItemLongTermGoal
CALLI4
ASGNI4
ADDRLP4 632
INDIRI4
RETI4
ADDRGP4 $129
JUMPV
LABELV $308
line 567
;565:	}
;566:	//get an item
;567:	if (bs->ltgtype == LTG_GETITEM && !retreat) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 10
NEI4 $318
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $318
line 569
;568:		//check for bot typing status message
;569:		if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 624
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
ASGNF4
ADDRLP4 624
INDIRF4
CNSTF4 0
EQF4 $320
ADDRLP4 624
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $320
line 570
;570:			trap_BotGoalName(bs->teamgoal.number, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 571
;571:			BotAI_BotInitialChat(bs, "getitem_start", buf, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $322
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 572
;572:			trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 628
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 628
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 628
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 573
;573:			BotVoiceChatOnly(bs, bs->decisionmaker, VOICECHAT_YES);
ADDRLP4 632
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 632
INDIRP4
ARGP4
ADDRLP4 632
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
ADDRGP4 $135
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
line 574
;574:			trap_EA_Action(bs->client, ACTION_AFFIRMATIVE);
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
line 575
;575:			bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 576
;576:		}
LABELV $320
line 578
;577:		//set the bot goal
;578:		memcpy(goal, &bs->teamgoal, sizeof(bot_goal_t));
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 580
;579:		//stop after some time
;580:		if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $323
line 581
;581:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 582
;582:		}
LABELV $323
line 584
;583:		//
;584:		if (trap_BotItemGoalInVisButNotVisible(bs->entitynum, bs->eye, bs->viewangles, goal)) {
ADDRLP4 628
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 628
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 628
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 628
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 632
ADDRGP4 trap_BotItemGoalInVisButNotVisible
CALLI4
ASGNI4
ADDRLP4 632
INDIRI4
CNSTI4 0
EQI4 $325
line 585
;585:			trap_BotGoalName(bs->teamgoal.number, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 586
;586:			BotAI_BotInitialChat(bs, "getitem_notthere", buf, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $327
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 587
;587:			trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 636
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 636
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 636
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 588
;588:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 589
;589:		}
ADDRGP4 $326
JUMPV
LABELV $325
line 590
;590:		else if (BotReachedGoal(bs, goal)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 636
ADDRGP4 BotReachedGoal
CALLI4
ASGNI4
ADDRLP4 636
INDIRI4
CNSTI4 0
EQI4 $328
line 591
;591:			trap_BotGoalName(bs->teamgoal.number, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 592
;592:			BotAI_BotInitialChat(bs, "getitem_gotit", buf, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $330
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 593
;593:			trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 640
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 640
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 640
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 594
;594:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 595
;595:		}
LABELV $328
LABELV $326
line 596
;596:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $129
JUMPV
LABELV $318
line 599
;597:	}
;598:	//if camping somewhere
;599:	if ((bs->ltgtype == LTG_CAMP || bs->ltgtype == LTG_CAMPORDER) && !retreat) {
ADDRLP4 624
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
ASGNI4
ADDRLP4 624
INDIRI4
CNSTI4 7
EQI4 $333
ADDRLP4 624
INDIRI4
CNSTI4 8
NEI4 $331
LABELV $333
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $331
line 601
;600:		//check for bot typing status message
;601:		if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 628
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
ASGNF4
ADDRLP4 628
INDIRF4
CNSTF4 0
EQF4 $334
ADDRLP4 628
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $334
line 602
;602:			if (bs->ltgtype == LTG_CAMPORDER) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 8
NEI4 $336
line 603
;603:				BotAI_BotInitialChat(bs, "camp_start", EasyClientName(bs->teammate, netname, sizeof(netname)), NULL);
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 412
ARGP4
CNSTI4 36
ARGI4
ADDRLP4 632
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $338
ARGP4
ADDRLP4 632
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 604
;604:				trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 636
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 636
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 636
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 605
;605:				BotVoiceChatOnly(bs, bs->decisionmaker, VOICECHAT_YES);
ADDRLP4 640
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 640
INDIRP4
ARGP4
ADDRLP4 640
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
ADDRGP4 $135
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
line 606
;606:				trap_EA_Action(bs->client, ACTION_AFFIRMATIVE);
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
line 607
;607:			}
LABELV $336
line 608
;608:			bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 609
;609:		}
LABELV $334
line 611
;610:		//set the bot goal
;611:		memcpy(goal, &bs->teamgoal, sizeof(bot_goal_t));
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 613
;612:		//
;613:		if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $339
line 614
;614:			if (bs->ltgtype == LTG_CAMPORDER) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 8
NEI4 $341
line 615
;615:				BotAI_BotInitialChat(bs, "camp_stop", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $343
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 616
;616:				trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 632
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 632
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 632
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 617
;617:			}
LABELV $341
line 618
;618:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 619
;619:		}
LABELV $339
line 621
;620:		//if really near the camp spot
;621:		VectorSubtract(goal->origin, bs->origin, dir);
ADDRLP4 632
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 636
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 260
ADDRLP4 632
INDIRP4
INDIRF4
ADDRLP4 636
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 260+4
ADDRLP4 632
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 636
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 260+8
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 622
;622:		if (VectorLengthSquared(dir) < Square(60))
ADDRLP4 260
ARGP4
ADDRLP4 640
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 640
INDIRF4
CNSTF4 1163984896
GEF4 $346
line 623
;623:		{
line 625
;624:			//if not arrived yet
;625:			if (!bs->arrive_time) {
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
INDIRF4
CNSTF4 0
NEF4 $348
line 626
;626:				if (bs->ltgtype == LTG_CAMPORDER) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 8
NEI4 $350
line 627
;627:					BotAI_BotInitialChat(bs, "camp_arrive", EasyClientName(bs->teammate, netname, sizeof(netname)), NULL);
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 412
ARGP4
CNSTI4 36
ARGI4
ADDRLP4 644
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $352
ARGP4
ADDRLP4 644
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 628
;628:					trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 648
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 648
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 648
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 629
;629:					BotVoiceChatOnly(bs, bs->decisionmaker, VOICECHAT_INPOSITION);
ADDRLP4 652
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 652
INDIRP4
ARGP4
ADDRLP4 652
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
ADDRGP4 $353
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
line 630
;630:				}
LABELV $350
line 631
;631:				bs->arrive_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 632
;632:			}
LABELV $348
line 634
;633:			//look strategically around for enemies
;634:			if (random() < bs->thinktime * 0.8) {
ADDRLP4 644
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 644
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1061997773
ADDRFP4 0
INDIRP4
CNSTI4 4904
ADDP4
INDIRF4
MULF4
GEF4 $354
line 635
;635:				BotRoamGoal(bs, target);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 592
ARGP4
ADDRGP4 BotRoamGoal
CALLV
pop
line 636
;636:				VectorSubtract(target, bs->origin, dir);
ADDRLP4 648
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 260
ADDRLP4 592
INDIRF4
ADDRLP4 648
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 260+4
ADDRLP4 592+4
INDIRF4
ADDRLP4 648
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 260+8
ADDRLP4 592+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 637
;637:				vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 260
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 638
;638:				bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 652
ADDRFP4 0
INDIRP4
CNSTI4 6584
ADDP4
ASGNP4
ADDRLP4 652
INDIRP4
CNSTF4 1056964608
ADDRLP4 652
INDIRP4
INDIRF4
MULF4
ASGNF4
line 639
;639:			}
LABELV $354
line 642
;640:			//check if the bot wants to crouch
;641:			//don't crouch if crouched less than 5 seconds ago
;642:			if (bs->attackcrouch_time < FloatTime() - 5) {
ADDRFP4 0
INDIRP4
CNSTI4 6120
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
SUBF4
GEF4 $360
line 643
;643:				croucher = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CROUCHER, 0, 1);
ADDRFP4 0
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
ADDRLP4 648
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 604
ADDRLP4 648
INDIRF4
ASGNF4
line 644
;644:				if (random() < bs->thinktime * croucher) {
ADDRLP4 652
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 652
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRFP4 0
INDIRP4
CNSTI4 4904
ADDP4
INDIRF4
ADDRLP4 604
INDIRF4
MULF4
GEF4 $362
line 645
;645:					bs->attackcrouch_time = FloatTime() + 5 + croucher * 15;
ADDRFP4 0
INDIRP4
CNSTI4 6120
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CNSTF4 1097859072
ADDRLP4 604
INDIRF4
MULF4
ADDF4
ASGNF4
line 646
;646:				}
LABELV $362
line 647
;647:			}
LABELV $360
line 649
;648:			//if the bot wants to crouch
;649:			if (bs->attackcrouch_time > FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6120
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $364
line 650
;650:				trap_EA_Crouch(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Crouch
CALLV
pop
line 654
;651:
;652:			
;653:			
;654:			}
LABELV $364
line 656
;655:			//don't crouch when swimming
;656:			if (trap_AAS_Swimming(bs->origin)) bs->attackcrouch_time = FloatTime() - 1;
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 648
ADDRGP4 trap_AAS_Swimming
CALLI4
ASGNI4
ADDRLP4 648
INDIRI4
CNSTI4 0
EQI4 $366
ADDRFP4 0
INDIRP4
CNSTI4 6120
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
ASGNF4
LABELV $366
line 658
;657:			//make sure the bot is not gonna drown
;658:			if (trap_PointContents(bs->eye,bs->entitynum) & (CONTENTS_WATER|CONTENTS_SLIME|CONTENTS_LAVA)) {
ADDRLP4 652
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 652
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 652
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 656
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 656
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $368
line 659
;659:				if (bs->ltgtype == LTG_CAMPORDER) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 8
NEI4 $370
line 660
;660:					BotAI_BotInitialChat(bs, "camp_stop", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $343
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 661
;661:					trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 660
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 660
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 660
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 663
;662:					//
;663:					if (bs->lastgoal_ltgtype == LTG_CAMPORDER) {
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
CNSTI4 8
NEI4 $372
line 664
;664:						bs->lastgoal_ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
CNSTI4 0
ASGNI4
line 665
;665:					}
LABELV $372
line 666
;666:				}
LABELV $370
line 667
;667:				bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 668
;668:			}
LABELV $368
line 670
;669:			//
;670:			if (bs->camp_range > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6188
ADDP4
INDIRF4
CNSTF4 0
LEF4 $374
line 672
;671:				//FIXME: move around a bit
;672:			}
LABELV $374
line 674
;673:			//
;674:			trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 675
;675:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $129
JUMPV
LABELV $346
line 677
;676:		}
;677:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $129
JUMPV
LABELV $331
line 680
;678:	}
;679:	//patrolling along several waypoints
;680:	if (bs->ltgtype == LTG_PATROL && !retreat) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 9
NEI4 $376
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $376
line 682
;681:		//check for bot typing status message
;682:		if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 628
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
ASGNF4
ADDRLP4 628
INDIRF4
CNSTF4 0
EQF4 $378
ADDRLP4 628
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $378
line 683
;683:			strcpy(buf, "");
ADDRLP4 4
ARGP4
ADDRGP4 $63
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 684
;684:			for (wp = bs->patrolpoints; wp; wp = wp->next) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 9076
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $383
JUMPV
LABELV $380
line 685
;685:				strcat(buf, wp->name);
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 686
;686:				if (wp->next) strcat(buf, " to ");
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $384
ADDRLP4 4
ARGP4
ADDRGP4 $386
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $384
line 687
;687:			}
LABELV $381
line 684
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ASGNP4
LABELV $383
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $380
line 688
;688:			BotAI_BotInitialChat(bs, "patrol_start", buf, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $387
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 689
;689:			trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 632
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 632
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 632
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 690
;690:			BotVoiceChatOnly(bs, bs->decisionmaker, VOICECHAT_YES);
ADDRLP4 636
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 636
INDIRP4
ARGP4
ADDRLP4 636
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
ADDRGP4 $135
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
line 691
;691:			trap_EA_Action(bs->client, ACTION_AFFIRMATIVE);
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
line 692
;692:			bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 693
;693:		}
LABELV $378
line 695
;694:		//
;695:		if (!bs->curpatrolpoint) {
ADDRFP4 0
INDIRP4
CNSTI4 9080
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $388
line 696
;696:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 697
;697:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $129
JUMPV
LABELV $388
line 700
;698:		}
;699:		//if the bot touches the current goal
;700:		if (trap_BotTouchingGoal(bs->origin, &bs->curpatrolpoint->goal)) {
ADDRLP4 632
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 632
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 632
INDIRP4
CNSTI4 9080
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRLP4 636
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 636
INDIRI4
CNSTI4 0
EQI4 $390
line 701
;701:			if (bs->patrolflags & PATROL_BACK) {
ADDRFP4 0
INDIRP4
CNSTI4 9084
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $392
line 702
;702:				if (bs->curpatrolpoint->prev) {
ADDRFP4 0
INDIRP4
CNSTI4 9080
ADDP4
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $394
line 703
;703:					bs->curpatrolpoint = bs->curpatrolpoint->prev;
ADDRLP4 640
ADDRFP4 0
INDIRP4
CNSTI4 9080
ADDP4
ASGNP4
ADDRLP4 640
INDIRP4
ADDRLP4 640
INDIRP4
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
ASGNP4
line 704
;704:				}
ADDRGP4 $393
JUMPV
LABELV $394
line 705
;705:				else {
line 706
;706:					bs->curpatrolpoint = bs->curpatrolpoint->next;
ADDRLP4 640
ADDRFP4 0
INDIRP4
CNSTI4 9080
ADDP4
ASGNP4
ADDRLP4 640
INDIRP4
ADDRLP4 640
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ASGNP4
line 707
;707:					bs->patrolflags &= ~PATROL_BACK;
ADDRLP4 644
ADDRFP4 0
INDIRP4
CNSTI4 9084
ADDP4
ASGNP4
ADDRLP4 644
INDIRP4
ADDRLP4 644
INDIRP4
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 708
;708:				}
line 709
;709:			}
ADDRGP4 $393
JUMPV
LABELV $392
line 710
;710:			else {
line 711
;711:				if (bs->curpatrolpoint->next) {
ADDRFP4 0
INDIRP4
CNSTI4 9080
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $396
line 712
;712:					bs->curpatrolpoint = bs->curpatrolpoint->next;
ADDRLP4 640
ADDRFP4 0
INDIRP4
CNSTI4 9080
ADDP4
ASGNP4
ADDRLP4 640
INDIRP4
ADDRLP4 640
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ASGNP4
line 713
;713:				}
ADDRGP4 $397
JUMPV
LABELV $396
line 714
;714:				else {
line 715
;715:					bs->curpatrolpoint = bs->curpatrolpoint->prev;
ADDRLP4 640
ADDRFP4 0
INDIRP4
CNSTI4 9080
ADDP4
ASGNP4
ADDRLP4 640
INDIRP4
ADDRLP4 640
INDIRP4
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
ASGNP4
line 716
;716:					bs->patrolflags |= PATROL_BACK;
ADDRLP4 644
ADDRFP4 0
INDIRP4
CNSTI4 9084
ADDP4
ASGNP4
ADDRLP4 644
INDIRP4
ADDRLP4 644
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 717
;717:				}
LABELV $397
line 718
;718:			}
LABELV $393
line 719
;719:		}
LABELV $390
line 721
;720:		//stop after 5 minutes
;721:		if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $398
line 722
;722:			BotAI_BotInitialChat(bs, "patrol_stop", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $400
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 723
;723:			trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 640
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 640
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 640
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 724
;724:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 725
;725:		}
LABELV $398
line 726
;726:		if (!bs->curpatrolpoint) {
ADDRFP4 0
INDIRP4
CNSTI4 9080
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $401
line 727
;727:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 728
;728:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $129
JUMPV
LABELV $401
line 730
;729:		}
;730:		memcpy(goal, &bs->curpatrolpoint->goal, sizeof(bot_goal_t));
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 9080
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 731
;731:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $129
JUMPV
LABELV $376
line 734
;732:	}
;733:#ifdef CTF
;734:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $403
line 736
;735:		//if going for enemy flag
;736:		if (bs->ltgtype == LTG_GETFLAG) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
NEI4 $405
line 738
;737:			//check for bot typing status message
;738:			if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 628
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
ASGNF4
ADDRLP4 628
INDIRF4
CNSTF4 0
EQF4 $407
ADDRLP4 628
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $407
line 739
;739:				BotAI_BotInitialChat(bs, "captureflag_start", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $409
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 740
;740:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
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
line 741
;741:				BotVoiceChatOnly(bs, -1, VOICECHAT_ONGETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 $410
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
line 742
;742:				bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 743
;743:			}
LABELV $407
line 745
;744:			//
;745:			switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 636
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 632
ADDRLP4 636
INDIRI4
ASGNI4
ADDRLP4 632
INDIRI4
CNSTI4 1
EQI4 $414
ADDRLP4 632
INDIRI4
CNSTI4 2
EQI4 $415
ADDRGP4 $411
JUMPV
LABELV $414
line 746
;746:				case TEAM_RED: memcpy(goal, &ctf_blueflag, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $412
JUMPV
LABELV $415
line 747
;747:				case TEAM_BLUE: memcpy(goal, &ctf_redflag, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 ctf_redflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $412
JUMPV
LABELV $411
line 748
;748:				default: bs->ltgtype = 0; return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
CNSTI4 0
RETI4
ADDRGP4 $129
JUMPV
LABELV $412
line 751
;749:			}
;750:			//if touching the flag
;751:			if (trap_BotTouchingGoal(bs->origin, goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 644
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 644
INDIRI4
CNSTI4 0
EQI4 $416
line 753
;752:				// make sure the bot knows the flag isn't there anymore
;753:				switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 652
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 648
ADDRLP4 652
INDIRI4
ASGNI4
ADDRLP4 648
INDIRI4
CNSTI4 1
EQI4 $421
ADDRLP4 648
INDIRI4
CNSTI4 2
EQI4 $422
ADDRGP4 $418
JUMPV
LABELV $421
line 754
;754:					case TEAM_RED: bs->blueflagstatus = 1; break;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $419
JUMPV
LABELV $422
line 755
;755:					case TEAM_BLUE: bs->redflagstatus = 1; break;
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
CNSTI4 1
ASGNI4
LABELV $418
LABELV $419
line 757
;756:				}
;757:				bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 758
;758:			}
LABELV $416
line 760
;759:			//stop after 3 minutes
;760:			if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $423
line 761
;761:				bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 762
;762:			}
LABELV $423
line 763
;763:			BotAlternateRoute(bs, goal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 BotAlternateRoute
CALLP4
pop
line 764
;764:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $129
JUMPV
LABELV $405
line 767
;765:		}
;766:		//if rushing to the base
;767:		if (bs->ltgtype == LTG_RUSHBASE && bs->rushbaseaway_time < FloatTime()) {
ADDRLP4 628
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 628
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
NEI4 $425
ADDRLP4 628
INDIRP4
CNSTI4 6152
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $425
line 768
;768:			switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 636
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 632
ADDRLP4 636
INDIRI4
ASGNI4
ADDRLP4 632
INDIRI4
CNSTI4 1
EQI4 $430
ADDRLP4 632
INDIRI4
CNSTI4 2
EQI4 $431
ADDRGP4 $427
JUMPV
LABELV $430
line 769
;769:				case TEAM_RED: memcpy(goal, &ctf_redflag, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 ctf_redflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $428
JUMPV
LABELV $431
line 770
;770:				case TEAM_BLUE: memcpy(goal, &ctf_blueflag, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $428
JUMPV
LABELV $427
line 771
;771:				default: bs->ltgtype = 0; return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
CNSTI4 0
RETI4
ADDRGP4 $129
JUMPV
LABELV $428
line 774
;772:			}
;773:			//if not carrying the flag anymore
;774:			if (!BotCTFCarryingFlag(bs)) bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 644
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 644
INDIRI4
CNSTI4 0
NEI4 $432
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
LABELV $432
line 776
;775:			//quit rushing after 2 minutes
;776:			if (bs->teamgoal_time < FloatTime()) bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $434
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
LABELV $434
line 778
;777:			//if touching the base flag the bot should loose the enemy flag
;778:			if (trap_BotTouchingGoal(bs->origin, goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 648
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 648
INDIRI4
CNSTI4 0
EQI4 $436
line 781
;779:				//if the bot is still carrying the enemy flag then the
;780:				//base flag is gone, now just walk near the base a bit
;781:				if (BotCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 652
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 652
INDIRI4
CNSTI4 0
EQI4 $438
line 782
;782:					trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 783
;783:					bs->rushbaseaway_time = FloatTime() + 5 + 10 * random();
ADDRLP4 656
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CNSTF4 1092616192
ADDRLP4 656
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 785
;784:					//FIXME: add chat to tell the others to get back the flag
;785:				}
ADDRGP4 $439
JUMPV
LABELV $438
line 786
;786:				else {
line 787
;787:					bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 788
;788:				}
LABELV $439
line 789
;789:			}
LABELV $436
line 790
;790:			BotAlternateRoute(bs, goal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 BotAlternateRoute
CALLP4
pop
line 791
;791:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $129
JUMPV
LABELV $425
line 794
;792:		}
;793:		//returning flag
;794:		if (bs->ltgtype == LTG_RETURNFLAG) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 6
NEI4 $440
line 796
;795:			//check for bot typing status message
;796:			if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 632
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
INDIRF4
ASGNF4
ADDRLP4 632
INDIRF4
CNSTF4 0
EQF4 $442
ADDRLP4 632
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $442
line 797
;797:				BotAI_BotInitialChat(bs, "returnflag_start", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $444
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 798
;798:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
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
line 799
;799:				BotVoiceChatOnly(bs, -1, VOICECHAT_ONRETURNFLAG);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 $445
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
line 800
;800:				bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 801
;801:			}
LABELV $442
line 803
;802:			//
;803:			switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 640
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 636
ADDRLP4 640
INDIRI4
ASGNI4
ADDRLP4 636
INDIRI4
CNSTI4 1
EQI4 $449
ADDRLP4 636
INDIRI4
CNSTI4 2
EQI4 $450
ADDRGP4 $446
JUMPV
LABELV $449
line 804
;804:				case TEAM_RED: memcpy(goal, &ctf_blueflag, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $447
JUMPV
LABELV $450
line 805
;805:				case TEAM_BLUE: memcpy(goal, &ctf_redflag, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 ctf_redflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $447
JUMPV
LABELV $446
line 806
;806:				default: bs->ltgtype = 0; return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
CNSTI4 0
RETI4
ADDRGP4 $129
JUMPV
LABELV $447
line 809
;807:			}
;808:			//if touching the flag
;809:			if (trap_BotTouchingGoal(bs->origin, goal)) bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 648
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 648
INDIRI4
CNSTI4 0
EQI4 $451
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
LABELV $451
line 811
;810:			//stop after 3 minutes
;811:			if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $453
line 812
;812:				bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 813
;813:			}
LABELV $453
line 814
;814:			BotAlternateRoute(bs, goal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 BotAlternateRoute
CALLP4
pop
line 815
;815:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $129
JUMPV
LABELV $440
line 817
;816:		}
;817:	}
LABELV $403
line 1017
;818:#endif //CTF
;819:#ifdef MISSIONPACK
;820:	else if (gametype == GT_1FCTF) {
;821:		if (bs->ltgtype == LTG_GETFLAG) {
;822:			//check for bot typing status message
;823:			if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
;824:				BotAI_BotInitialChat(bs, "captureflag_start", NULL);
;825:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
;826:				BotVoiceChatOnly(bs, -1, VOICECHAT_ONGETFLAG);
;827:				bs->teammessage_time = 0;
;828:			}
;829:			memcpy(goal, &ctf_neutralflag, sizeof(bot_goal_t));
;830:			//if touching the flag
;831:			if (trap_BotTouchingGoal(bs->origin, goal)) {
;832:				bs->ltgtype = 0;
;833:			}
;834:			//stop after 3 minutes
;835:			if (bs->teamgoal_time < FloatTime()) {
;836:				bs->ltgtype = 0;
;837:			}
;838:			return qtrue;
;839:		}
;840:		//if rushing to the base
;841:		if (bs->ltgtype == LTG_RUSHBASE) {
;842:			switch(BotTeam(bs)) {
;843:				case TEAM_RED: memcpy(goal, &ctf_blueflag, sizeof(bot_goal_t)); break;
;844:				case TEAM_BLUE: memcpy(goal, &ctf_redflag, sizeof(bot_goal_t)); break;
;845:				default: bs->ltgtype = 0; return qfalse;
;846:			}
;847:			//if not carrying the flag anymore
;848:			if (!Bot1FCTFCarryingFlag(bs)) {
;849:				bs->ltgtype = 0;
;850:			}
;851:			//quit rushing after 2 minutes
;852:			if (bs->teamgoal_time < FloatTime()) {
;853:				bs->ltgtype = 0;
;854:			}
;855:			//if touching the base flag the bot should loose the enemy flag
;856:			if (trap_BotTouchingGoal(bs->origin, goal)) {
;857:				bs->ltgtype = 0;
;858:			}
;859:			BotAlternateRoute(bs, goal);
;860:			return qtrue;
;861:		}
;862:		//attack the enemy base
;863:		if (bs->ltgtype == LTG_ATTACKENEMYBASE &&
;864:				bs->attackaway_time < FloatTime()) {
;865:			//check for bot typing status message
;866:			if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
;867:				BotAI_BotInitialChat(bs, "attackenemybase_start", NULL);
;868:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
;869:				BotVoiceChatOnly(bs, -1, VOICECHAT_ONOFFENSE);
;870:				bs->teammessage_time = 0;
;871:			}
;872:			switch(BotTeam(bs)) {
;873:				case TEAM_RED: memcpy(goal, &ctf_blueflag, sizeof(bot_goal_t)); break;
;874:				case TEAM_BLUE: memcpy(goal, &ctf_redflag, sizeof(bot_goal_t)); break;
;875:				default: bs->ltgtype = 0; return qfalse;
;876:			}
;877:			//quit rushing after 2 minutes
;878:			if (bs->teamgoal_time < FloatTime()) {
;879:				bs->ltgtype = 0;
;880:			}
;881:			//if touching the base flag the bot should loose the enemy flag
;882:			if (trap_BotTouchingGoal(bs->origin, goal)) {
;883:				bs->attackaway_time = FloatTime() + 2 + 5 * random();
;884:			}
;885:			return qtrue;
;886:		}
;887:		//returning flag
;888:		if (bs->ltgtype == LTG_RETURNFLAG) {
;889:			//check for bot typing status message
;890:			if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
;891:				BotAI_BotInitialChat(bs, "returnflag_start", NULL);
;892:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
;893:				BotVoiceChatOnly(bs, -1, VOICECHAT_ONRETURNFLAG);
;894:				bs->teammessage_time = 0;
;895:			}
;896:			//
;897:			if (bs->teamgoal_time < FloatTime()) {
;898:				bs->ltgtype = 0;
;899:			}
;900:			//just roam around
;901:			return BotGetItemLongTermGoal(bs, tfl, goal);
;902:		}
;903:	}
;904:	else if (gametype == GT_OBELISK) {
;905:		if (bs->ltgtype == LTG_ATTACKENEMYBASE &&
;906:				bs->attackaway_time < FloatTime()) {
;907:
;908:			//check for bot typing status message
;909:			if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
;910:				BotAI_BotInitialChat(bs, "attackenemybase_start", NULL);
;911:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
;912:				BotVoiceChatOnly(bs, -1, VOICECHAT_ONOFFENSE);
;913:				bs->teammessage_time = 0;
;914:			}
;915:			switch(BotTeam(bs)) {
;916:				case TEAM_RED: memcpy(goal, &blueobelisk, sizeof(bot_goal_t)); break;
;917:				case TEAM_BLUE: memcpy(goal, &redobelisk, sizeof(bot_goal_t)); break;
;918:				default: bs->ltgtype = 0; return qfalse;
;919:			}
;920:			//if the bot no longer wants to attack the obelisk
;921:			if (BotFeelingBad(bs) > 50) {
;922:				return BotGetItemLongTermGoal(bs, tfl, goal);
;923:			}
;924:			//if touching the obelisk
;925:			if (trap_BotTouchingGoal(bs->origin, goal)) {
;926:				bs->attackaway_time = FloatTime() + 3 + 5 * random();
;927:			}
;928:			// or very close to the obelisk
;929:			VectorSubtract(bs->origin, goal->origin, dir);
;930:			if (VectorLengthSquared(dir) < Square(60)) {
;931:				bs->attackaway_time = FloatTime() + 3 + 5 * random();
;932:			}
;933:			//quit rushing after 2 minutes
;934:			if (bs->teamgoal_time < FloatTime()) {
;935:				bs->ltgtype = 0;
;936:			}
;937:			BotAlternateRoute(bs, goal);
;938:			//just move towards the obelisk
;939:			return qtrue;
;940:		}
;941:	}
;942:	else if (gametype == GT_HARVESTER) {
;943:		//if rushing to the base
;944:		if (bs->ltgtype == LTG_RUSHBASE) {
;945:			switch(BotTeam(bs)) {
;946:				case TEAM_RED: memcpy(goal, &blueobelisk, sizeof(bot_goal_t)); break;
;947:				case TEAM_BLUE: memcpy(goal, &redobelisk, sizeof(bot_goal_t)); break;
;948:				default: BotGoHarvest(bs); return qfalse;
;949:			}
;950:			//if not carrying any cubes
;951:			if (!BotHarvesterCarryingCubes(bs)) {
;952:				BotGoHarvest(bs);
;953:				return qfalse;
;954:			}
;955:			//quit rushing after 2 minutes
;956:			if (bs->teamgoal_time < FloatTime()) {
;957:				BotGoHarvest(bs);
;958:				return qfalse;
;959:			}
;960:			//if touching the base flag the bot should loose the enemy flag
;961:			if (trap_BotTouchingGoal(bs->origin, goal)) {
;962:				BotGoHarvest(bs);
;963:				return qfalse;
;964:			}
;965:			BotAlternateRoute(bs, goal);
;966:			return qtrue;
;967:		}
;968:		//attack the enemy base
;969:		if (bs->ltgtype == LTG_ATTACKENEMYBASE &&
;970:				bs->attackaway_time < FloatTime()) {
;971:			//check for bot typing status message
;972:			if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
;973:				BotAI_BotInitialChat(bs, "attackenemybase_start", NULL);
;974:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
;975:				BotVoiceChatOnly(bs, -1, VOICECHAT_ONOFFENSE);
;976:				bs->teammessage_time = 0;
;977:			}
;978:			switch(BotTeam(bs)) {
;979:				case TEAM_RED: memcpy(goal, &blueobelisk, sizeof(bot_goal_t)); break;
;980:				case TEAM_BLUE: memcpy(goal, &redobelisk, sizeof(bot_goal_t)); break;
;981:				default: bs->ltgtype = 0; return qfalse;
;982:			}
;983:			//quit rushing after 2 minutes
;984:			if (bs->teamgoal_time < FloatTime()) {
;985:				bs->ltgtype = 0;
;986:			}
;987:			//if touching the base flag the bot should loose the enemy flag
;988:			if (trap_BotTouchingGoal(bs->origin, goal)) {
;989:				bs->attackaway_time = FloatTime() + 2 + 5 * random();
;990:			}
;991:			return qtrue;
;992:		}
;993:		//harvest cubes
;994:		if (bs->ltgtype == LTG_HARVEST &&
;995:			bs->harvestaway_time < FloatTime()) {
;996:			//check for bot typing status message
;997:			if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
;998:				BotAI_BotInitialChat(bs, "harvest_start", NULL);
;999:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
;1000:				BotVoiceChatOnly(bs, -1, VOICECHAT_ONOFFENSE);
;1001:				bs->teammessage_time = 0;
;1002:			}
;1003:			memcpy(goal, &neutralobelisk, sizeof(bot_goal_t));
;1004:			//
;1005:			if (bs->teamgoal_time < FloatTime()) {
;1006:				bs->ltgtype = 0;
;1007:			}
;1008:			//
;1009:			if (trap_BotTouchingGoal(bs->origin, goal)) {
;1010:				bs->harvestaway_time = FloatTime() + 4 + 3 * random();
;1011:			}
;1012:			return qtrue;
;1013:		}
;1014:	}
;1015:#endif
;1016:	//normal goal stuff
;1017:	return BotGetItemLongTermGoal(bs, tfl, goal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 628
ADDRGP4 BotGetItemLongTermGoal
CALLI4
ASGNI4
ADDRLP4 628
INDIRI4
RETI4
LABELV $129
endproc BotGetLongTermGoal 664 20
export BotLongTermGoal
proc BotLongTermGoal 448 20
line 1025
;1018:}
;1019:
;1020:/*
;1021:==================
;1022:BotLongTermGoal
;1023:==================
;1024:*/
;1025:int BotLongTermGoal(bot_state_t *bs, int tfl, int retreat, bot_goal_t *goal) {
line 1035
;1026:	aas_entityinfo_t entinfo;
;1027:	char teammate[MAX_MESSAGE_SIZE];
;1028:	float squaredist;
;1029:	int areanum;
;1030:	vec3_t dir;
;1031:
;1032:	//FIXME: also have air long term goals?
;1033:	//
;1034:	//if the bot is leading someone and not retreating
;1035:	if (bs->lead_time > 0 && !retreat) {
ADDRFP4 0
INDIRP4
CNSTI4 6884
ADDP4
INDIRF4
CNSTF4 0
LEF4 $456
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $456
line 1036
;1036:		if (bs->lead_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6884
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $458
line 1037
;1037:			BotAI_BotInitialChat(bs, "lead_stop", EasyClientName(bs->lead_teammate, teammate, sizeof(teammate)), NULL);
ADDRFP4 0
INDIRP4
CNSTI4 6824
ADDP4
INDIRI4
ARGI4
ADDRLP4 152
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 416
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $460
ARGP4
ADDRLP4 416
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1038
;1038:			trap_BotEnterChat(bs->cs, bs->teammate, CHAT_TELL);
ADDRLP4 420
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 420
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 420
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1039
;1039:			bs->lead_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6884
ADDP4
CNSTF4 0
ASGNF4
line 1040
;1040:			return BotGetLongTermGoal(bs, tfl, retreat, goal);
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
ADDRLP4 424
ADDRGP4 BotGetLongTermGoal
CALLI4
ASGNI4
ADDRLP4 424
INDIRI4
RETI4
ADDRGP4 $455
JUMPV
LABELV $458
line 1043
;1041:		}
;1042:		//
;1043:		if (bs->leadmessage_time < 0 && -bs->leadmessage_time < FloatTime()) {
ADDRLP4 416
ADDRFP4 0
INDIRP4
CNSTI4 6892
ADDP4
INDIRF4
ASGNF4
ADDRLP4 416
INDIRF4
CNSTF4 0
GEF4 $461
ADDRLP4 416
INDIRF4
NEGF4
ADDRGP4 floattime
INDIRF4
GEF4 $461
line 1044
;1044:			BotAI_BotInitialChat(bs, "followme", EasyClientName(bs->lead_teammate, teammate, sizeof(teammate)), NULL);
ADDRFP4 0
INDIRP4
CNSTI4 6824
ADDP4
INDIRI4
ARGI4
ADDRLP4 152
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 420
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $463
ARGP4
ADDRLP4 420
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1045
;1045:			trap_BotEnterChat(bs->cs, bs->teammate, CHAT_TELL);
ADDRLP4 424
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 424
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 424
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1046
;1046:			bs->leadmessage_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6892
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1047
;1047:		}
LABELV $461
line 1049
;1048:		//get entity information of the companion
;1049:		BotEntityInfo(bs->lead_teammate, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6824
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1051
;1050:		//
;1051:		if (entinfo.valid) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $464
line 1052
;1052:			areanum = BotPointAreaNum(entinfo.origin);
ADDRLP4 12+24
ARGP4
ADDRLP4 420
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 412
ADDRLP4 420
INDIRI4
ASGNI4
line 1053
;1053:			if (areanum && trap_AAS_AreaReachability(areanum)) {
ADDRLP4 424
ADDRLP4 412
INDIRI4
ASGNI4
ADDRLP4 424
INDIRI4
CNSTI4 0
EQI4 $467
ADDRLP4 424
INDIRI4
ARGI4
ADDRLP4 428
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 428
INDIRI4
CNSTI4 0
EQI4 $467
line 1055
;1054:				//update team goal
;1055:				bs->lead_teamgoal.entitynum = bs->lead_teammate;
ADDRLP4 432
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 432
INDIRP4
CNSTI4 6868
ADDP4
ADDRLP4 432
INDIRP4
CNSTI4 6824
ADDP4
INDIRI4
ASGNI4
line 1056
;1056:				bs->lead_teamgoal.areanum = areanum;
ADDRFP4 0
INDIRP4
CNSTI4 6840
ADDP4
ADDRLP4 412
INDIRI4
ASGNI4
line 1057
;1057:				VectorCopy(entinfo.origin, bs->lead_teamgoal.origin);
ADDRFP4 0
INDIRP4
CNSTI4 6828
ADDP4
ADDRLP4 12+24
INDIRB
ASGNB 12
line 1058
;1058:				VectorSet(bs->lead_teamgoal.mins, -8, -8, -8);
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
line 1059
;1059:				VectorSet(bs->lead_teamgoal.maxs, 8, 8, 8);
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
line 1060
;1060:			}
LABELV $467
line 1061
;1061:		}
LABELV $464
line 1063
;1062:		//if the team mate is visible
;1063:		if (BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, bs->lead_teammate)) {
ADDRLP4 420
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 420
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 420
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 420
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 420
INDIRP4
CNSTI4 6824
ADDP4
INDIRI4
ARGI4
ADDRLP4 424
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 424
INDIRF4
CNSTF4 0
EQF4 $470
line 1064
;1064:			bs->leadvisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6888
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1065
;1065:		}
LABELV $470
line 1067
;1066:		//if the team mate is not visible for 1 seconds
;1067:		if (bs->leadvisible_time < FloatTime() - 1) {
ADDRFP4 0
INDIRP4
CNSTI4 6888
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
GEF4 $472
line 1068
;1068:			bs->leadbackup_time = FloatTime() + 2;
ADDRFP4 0
INDIRP4
CNSTI4 6896
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDF4
ASGNF4
line 1069
;1069:		}
LABELV $472
line 1071
;1070:		//distance towards the team mate
;1071:		VectorSubtract(bs->origin, bs->lead_teamgoal.origin, dir);
ADDRLP4 428
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 428
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRLP4 428
INDIRP4
CNSTI4 6828
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 428
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRLP4 428
INDIRP4
CNSTI4 6832
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 432
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 432
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRLP4 432
INDIRP4
CNSTI4 6836
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1072
;1072:		squaredist = VectorLengthSquared(dir);
ADDRLP4 0
ARGP4
ADDRLP4 436
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 408
ADDRLP4 436
INDIRF4
ASGNF4
line 1074
;1073:		//if backing up towards the team mate
;1074:		if (bs->leadbackup_time > FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6896
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $476
line 1075
;1075:			if (bs->leadmessage_time < FloatTime() - 20) {
ADDRFP4 0
INDIRP4
CNSTI4 6892
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1101004800
SUBF4
GEF4 $478
line 1076
;1076:				BotAI_BotInitialChat(bs, "followme", EasyClientName(bs->lead_teammate, teammate, sizeof(teammate)), NULL);
ADDRFP4 0
INDIRP4
CNSTI4 6824
ADDP4
INDIRI4
ARGI4
ADDRLP4 152
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 440
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $463
ARGP4
ADDRLP4 440
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1077
;1077:				trap_BotEnterChat(bs->cs, bs->teammate, CHAT_TELL);
ADDRLP4 444
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 444
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 444
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1078
;1078:				bs->leadmessage_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6892
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1079
;1079:			}
LABELV $478
line 1081
;1080:			//if very close to the team mate
;1081:			if (squaredist < Square(100)) {
ADDRLP4 408
INDIRF4
CNSTF4 1176256512
GEF4 $480
line 1082
;1082:				bs->leadbackup_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6896
ADDP4
CNSTF4 0
ASGNF4
line 1083
;1083:			}
LABELV $480
line 1085
;1084:			//the bot should go back to the team mate
;1085:			memcpy(goal, &bs->lead_teamgoal, sizeof(bot_goal_t));
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6828
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1086
;1086:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $455
JUMPV
LABELV $476
line 1088
;1087:		}
;1088:		else {
line 1090
;1089:			//if quite distant from the team mate
;1090:			if (squaredist > Square(500)) {
ADDRLP4 408
INDIRF4
CNSTF4 1215570944
LEF4 $482
line 1091
;1091:				if (bs->leadmessage_time < FloatTime() - 20) {
ADDRFP4 0
INDIRP4
CNSTI4 6892
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1101004800
SUBF4
GEF4 $484
line 1092
;1092:					BotAI_BotInitialChat(bs, "followme", EasyClientName(bs->lead_teammate, teammate, sizeof(teammate)), NULL);
ADDRFP4 0
INDIRP4
CNSTI4 6824
ADDP4
INDIRI4
ARGI4
ADDRLP4 152
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 440
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $463
ARGP4
ADDRLP4 440
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1093
;1093:					trap_BotEnterChat(bs->cs, bs->teammate, CHAT_TELL);
ADDRLP4 444
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 444
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 444
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1094
;1094:					bs->leadmessage_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6892
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1095
;1095:				}
LABELV $484
line 1097
;1096:				//look at the team mate
;1097:				VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 440
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12+24
INDIRF4
ADDRLP4 440
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 12+24+4
INDIRF4
ADDRLP4 440
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
line 1098
;1098:				vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1099
;1099:				bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 444
ADDRFP4 0
INDIRP4
CNSTI4 6584
ADDP4
ASGNP4
ADDRLP4 444
INDIRP4
CNSTF4 1056964608
ADDRLP4 444
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1101
;1100:				//just wait for the team mate
;1101:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $455
JUMPV
LABELV $482
line 1103
;1102:			}
;1103:		}
line 1104
;1104:	}
LABELV $456
line 1105
;1105:	return BotGetLongTermGoal(bs, tfl, retreat, goal);
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
ADDRLP4 416
ADDRGP4 BotGetLongTermGoal
CALLI4
ASGNI4
ADDRLP4 416
INDIRI4
RETI4
LABELV $455
endproc BotLongTermGoal 448 20
export AIEnter_Intermission
proc AIEnter_Intermission 8 16
line 1113
;1106:}
;1107:
;1108:/*
;1109:==================
;1110:AIEnter_Intermission
;1111:==================
;1112:*/
;1113:void AIEnter_Intermission(bot_state_t *bs, char *s) {
line 1114
;1114:	BotRecordNodeSwitch(bs, "intermission", "", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $494
ARGP4
ADDRGP4 $63
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 1116
;1115:	//reset the bot state
;1116:	BotResetState(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotResetState
CALLV
pop
line 1118
;1117:	//check for end level chat
;1118:	if (BotChat_EndLevel(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotChat_EndLevel
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $495
line 1119
;1119:		trap_BotEnterChat(bs->cs, 0, bs->chatto);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 6052
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1120
;1120:	}
LABELV $495
line 1121
;1121:	bs->ainode = AINode_Intermission;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
ADDRGP4 AINode_Intermission
ASGNP4
line 1122
;1122:}
LABELV $493
endproc AIEnter_Intermission 8 16
export AINode_Intermission
proc AINode_Intermission 16 8
line 1129
;1123:
;1124:/*
;1125:==================
;1126:AINode_Intermission
;1127:==================
;1128:*/
;1129:int AINode_Intermission(bot_state_t *bs) {
line 1131
;1130:	//if the intermission ended
;1131:	if (!BotIntermission(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $498
line 1132
;1132:		if (BotChat_StartLevel(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotChat_StartLevel
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $500
line 1133
;1133:			bs->stand_time = FloatTime() + BotChatTime(bs);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 6096
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ASGNF4
line 1134
;1134:		}
ADDRGP4 $501
JUMPV
LABELV $500
line 1135
;1135:		else {
line 1136
;1136:			bs->stand_time = FloatTime() + 2;
ADDRFP4 0
INDIRP4
CNSTI4 6096
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDF4
ASGNF4
line 1137
;1137:		}
LABELV $501
line 1138
;1138:		AIEnter_Stand(bs, "intermission: chat");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $502
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 1139
;1139:	}
LABELV $498
line 1140
;1140:	return qtrue;
CNSTI4 1
RETI4
LABELV $497
endproc AINode_Intermission 16 8
export AIEnter_Observer
proc AIEnter_Observer 0 16
line 1148
;1141:}
;1142:
;1143:/*
;1144:==================
;1145:AIEnter_Observer
;1146:==================
;1147:*/
;1148:void AIEnter_Observer(bot_state_t *bs, char *s) {
line 1149
;1149:	BotRecordNodeSwitch(bs, "observer", "", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $504
ARGP4
ADDRGP4 $63
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 1151
;1150:	//reset the bot state
;1151:	BotResetState(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotResetState
CALLV
pop
line 1152
;1152:	bs->ainode = AINode_Observer;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
ADDRGP4 AINode_Observer
ASGNP4
line 1153
;1153:}
LABELV $503
endproc AIEnter_Observer 0 16
export AINode_Observer
proc AINode_Observer 4 8
line 1160
;1154:
;1155:/*
;1156:==================
;1157:AINode_Observer
;1158:==================
;1159:*/
;1160:int AINode_Observer(bot_state_t *bs) {
line 1162
;1161:	//if the bot left observer mode
;1162:	if (!BotIsObserver(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $506
line 1163
;1163:		AIEnter_Stand(bs, "observer: left observer");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $508
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 1164
;1164:	}
LABELV $506
line 1165
;1165:	return qtrue;
CNSTI4 1
RETI4
LABELV $505
endproc AINode_Observer 4 8
export AIEnter_Stand
proc AIEnter_Stand 0 16
line 1173
;1166:}
;1167:
;1168:/*
;1169:==================
;1170:AIEnter_Stand
;1171:==================
;1172:*/
;1173:void AIEnter_Stand(bot_state_t *bs, char *s) {
line 1174
;1174:	BotRecordNodeSwitch(bs, "stand", "", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $510
ARGP4
ADDRGP4 $63
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 1175
;1175:	bs->standfindenemy_time = FloatTime() + 1;
ADDRFP4 0
INDIRP4
CNSTI4 6112
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1176
;1176:	bs->ainode = AINode_Stand;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
ADDRGP4 AINode_Stand
ASGNP4
line 1177
;1177:}
LABELV $509
endproc AIEnter_Stand 0 16
export AINode_Stand
proc AINode_Stand 24 12
line 1184
;1178:
;1179:/*
;1180:==================
;1181:AINode_Stand
;1182:==================
;1183:*/
;1184:int AINode_Stand(bot_state_t *bs) {
line 1187
;1185:
;1186:	//if the bot's health decreased
;1187:	if (bs->lastframe_health > bs->inventory[INVENTORY_HEALTH]) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 6044
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
LEI4 $512
line 1188
;1188:		if (BotChat_HitTalking(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotChat_HitTalking
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $514
line 1189
;1189:			bs->standfindenemy_time = FloatTime() + BotChatTime(bs) + 0.1;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 6112
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
CNSTF4 1036831949
ADDF4
ASGNF4
line 1190
;1190:			bs->stand_time = FloatTime() + BotChatTime(bs) + 0.1;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 6096
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 20
INDIRF4
ADDF4
CNSTF4 1036831949
ADDF4
ASGNF4
line 1191
;1191:		}
LABELV $514
line 1192
;1192:	}
LABELV $512
line 1193
;1193:	if (bs->standfindenemy_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6112
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $516
line 1194
;1194:		if (BotFindEnemy(bs, -1)) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 4
ADDRGP4 BotFindEnemy
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $518
line 1195
;1195:			AIEnter_Battle_Fight(bs, "stand: found enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $520
ARGP4
ADDRGP4 AIEnter_Battle_Fight
CALLV
pop
line 1196
;1196:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $511
JUMPV
LABELV $518
line 1198
;1197:		}
;1198:		bs->standfindenemy_time = FloatTime() + 1;
ADDRFP4 0
INDIRP4
CNSTI4 6112
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1199
;1199:	}
LABELV $516
line 1201
;1200:	// put up chat icon
;1201:	trap_EA_Talk(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Talk
CALLV
pop
line 1203
;1202:	// when done standing
;1203:	if (bs->stand_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6096
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $521
line 1204
;1204:		trap_BotEnterChat(bs->cs, 0, bs->chatto);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 6052
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1205
;1205:		AIEnter_Seek_LTG(bs, "stand: time out");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $523
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 1206
;1206:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $511
JUMPV
LABELV $521
line 1209
;1207:	}
;1208:	//
;1209:	return qtrue;
CNSTI4 1
RETI4
LABELV $511
endproc AINode_Stand 24 12
export AIEnter_Respawn
proc AIEnter_Respawn 12 16
line 1217
;1210:}
;1211:
;1212:/*
;1213:==================
;1214:AIEnter_Respawn
;1215:==================
;1216:*/
;1217:void AIEnter_Respawn(bot_state_t *bs, char *s) {
line 1218
;1218:	BotRecordNodeSwitch(bs, "respawn", "", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $525
ARGP4
ADDRGP4 $63
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 1220
;1219:	//reset some states
;1220:	trap_BotResetMoveState(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetMoveState
CALLV
pop
line 1221
;1221:	trap_BotResetGoalState(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetGoalState
CALLV
pop
line 1222
;1222:	trap_BotResetAvoidGoals(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidGoals
CALLV
pop
line 1223
;1223:	trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 1225
;1224:	//if the bot wants to chat
;1225:	if (BotChat_Death(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotChat_Death
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $526
line 1226
;1226:		bs->respawn_time = FloatTime() + BotChatTime(bs);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 6076
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ASGNF4
line 1227
;1227:		bs->respawnchat_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6080
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1228
;1228:	}
ADDRGP4 $527
JUMPV
LABELV $526
line 1229
;1229:	else {
line 1230
;1230:		bs->respawn_time = FloatTime() + 1 + random();
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6076
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
ADDF4
ADDRLP4 4
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDF4
ASGNF4
line 1231
;1231:		bs->respawnchat_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6080
ADDP4
CNSTF4 0
ASGNF4
line 1232
;1232:	}
LABELV $527
line 1234
;1233:	//set respawn state
;1234:	bs->respawn_wait = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 5984
ADDP4
CNSTI4 0
ASGNI4
line 1235
;1235:	bs->ainode = AINode_Respawn;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
ADDRGP4 AINode_Respawn
ASGNP4
line 1236
;1236:}
LABELV $524
endproc AIEnter_Respawn 12 16
export AINode_Respawn
proc AINode_Respawn 4 12
line 1243
;1237:
;1238:/*
;1239:==================
;1240:AINode_Respawn
;1241:==================
;1242:*/
;1243:int AINode_Respawn(bot_state_t *bs) {
line 1245
;1244:	// if waiting for the actual respawn
;1245:	if (bs->respawn_wait) {
ADDRFP4 0
INDIRP4
CNSTI4 5984
ADDP4
INDIRI4
CNSTI4 0
EQI4 $529
line 1246
;1246:		if (!BotIsDead(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotIsDead
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $531
line 1247
;1247:			AIEnter_Seek_LTG(bs, "respawn: respawned");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $533
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 1248
;1248:		}
ADDRGP4 $530
JUMPV
LABELV $531
line 1249
;1249:		else {
line 1250
;1250:			trap_EA_Respawn(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Respawn
CALLV
pop
line 1251
;1251:		}
line 1252
;1252:	}
ADDRGP4 $530
JUMPV
LABELV $529
line 1253
;1253:	else if (bs->respawn_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6076
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $534
line 1255
;1254:		// wait until respawned
;1255:		bs->respawn_wait = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 5984
ADDP4
CNSTI4 1
ASGNI4
line 1257
;1256:		// elementary action respawn
;1257:		trap_EA_Respawn(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Respawn
CALLV
pop
line 1259
;1258:		//
;1259:		if (bs->respawnchat_time) {
ADDRFP4 0
INDIRP4
CNSTI4 6080
ADDP4
INDIRF4
CNSTF4 0
EQF4 $536
line 1260
;1260:			trap_BotEnterChat(bs->cs, 0, bs->chatto);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 6052
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1261
;1261:			bs->enemy = -1;
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
CNSTI4 -1
ASGNI4
line 1262
;1262:		}
LABELV $536
line 1263
;1263:	}
LABELV $534
LABELV $530
line 1264
;1264:	if (bs->respawnchat_time && bs->respawnchat_time < FloatTime() - 0.5) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 6080
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 0
EQF4 $538
ADDRLP4 0
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1056964608
SUBF4
GEF4 $538
line 1265
;1265:		trap_EA_Talk(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Talk
CALLV
pop
line 1266
;1266:	}
LABELV $538
line 1268
;1267:	//
;1268:	return qtrue;
CNSTI4 1
RETI4
LABELV $528
endproc AINode_Respawn 4 12
export BotSelectActivateWeapon
proc BotSelectActivateWeapon 56 0
line 1276
;1269:}
;1270:
;1271:/*
;1272:==================
;1273:BotSelectActivateWeapon
;1274:==================
;1275:*/
;1276:int BotSelectActivateWeapon(bot_state_t *bs) {
line 1278
;1277:	//
;1278:	if (bs->inventory[INVENTORY_MACHINEGUN] > 0 && bs->inventory[INVENTORY_BULLETS] > 0)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 4976
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $541
ADDRLP4 0
INDIRP4
CNSTI4 5028
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $541
line 1279
;1279:		return WEAPONINDEX_MACHINEGUN;
CNSTI4 2
RETI4
ADDRGP4 $540
JUMPV
LABELV $541
line 1280
;1280:	else if (bs->inventory[INVENTORY_SHOTGUN] > 0 && bs->inventory[INVENTORY_SHELLS] > 0)
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 4972
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $543
ADDRLP4 8
INDIRP4
CNSTI4 5024
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $543
line 1281
;1281:		return WEAPONINDEX_SHOTGUN;
CNSTI4 3
RETI4
ADDRGP4 $540
JUMPV
LABELV $543
line 1282
;1282:	else if (bs->inventory[INVENTORY_PLASMAGUN] > 0 && bs->inventory[INVENTORY_CELLS] > 0)
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 4996
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
LEI4 $545
ADDRLP4 16
INDIRP4
CNSTI4 5036
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
LEI4 $545
line 1283
;1283:		return WEAPONINDEX_PLASMAGUN;
CNSTI4 8
RETI4
ADDRGP4 $540
JUMPV
LABELV $545
line 1284
;1284:	else if (bs->inventory[INVENTORY_LIGHTNING] > 0 && bs->inventory[INVENTORY_LIGHTNINGAMMO] > 0)
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRP4
CNSTI4 4988
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
LEI4 $547
ADDRLP4 24
INDIRP4
CNSTI4 5040
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
LEI4 $547
line 1285
;1285:		return WEAPONINDEX_LIGHTNING;
CNSTI4 6
RETI4
ADDRGP4 $540
JUMPV
LABELV $547
line 1292
;1286:#ifdef MISSIONPACK
;1287:	else if (bs->inventory[INVENTORY_CHAINGUN] > 0 && bs->inventory[INVENTORY_BELT] > 0)
;1288:		return WEAPONINDEX_CHAINGUN;
;1289:	else if (bs->inventory[INVENTORY_NAILGUN] > 0 && bs->inventory[INVENTORY_NAILS] > 0)
;1290:		return WEAPONINDEX_NAILGUN;
;1291:#endif
;1292:	else if (bs->inventory[INVENTORY_RAILGUN] > 0 && bs->inventory[INVENTORY_SLUGS] > 0)
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRP4
CNSTI4 4992
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
LEI4 $549
ADDRLP4 32
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
LEI4 $549
line 1293
;1293:		return WEAPONINDEX_RAILGUN;
CNSTI4 7
RETI4
ADDRGP4 $540
JUMPV
LABELV $549
line 1294
;1294:	else if (bs->inventory[INVENTORY_ROCKETLAUNCHER] > 0 && bs->inventory[INVENTORY_ROCKETS] > 0)
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 40
INDIRP4
CNSTI4 4984
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
LEI4 $551
ADDRLP4 40
INDIRP4
CNSTI4 5044
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
LEI4 $551
line 1295
;1295:		return WEAPONINDEX_ROCKET_LAUNCHER;
CNSTI4 5
RETI4
ADDRGP4 $540
JUMPV
LABELV $551
line 1296
;1296:	else if (bs->inventory[INVENTORY_BFG10K] > 0 && bs->inventory[INVENTORY_BFGAMMO] > 0)
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRLP4 48
INDIRP4
CNSTI4 5004
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
LEI4 $553
ADDRLP4 48
INDIRP4
CNSTI4 5052
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
LEI4 $553
line 1297
;1297:		return WEAPONINDEX_BFG;
CNSTI4 9
RETI4
ADDRGP4 $540
JUMPV
LABELV $553
line 1298
;1298:	else {
line 1299
;1299:		return -1;
CNSTI4 -1
RETI4
LABELV $540
endproc BotSelectActivateWeapon 56 0
export BotClearPath
proc BotClearPath 380 28
line 1310
;1300:	}
;1301:}
;1302:
;1303:/*
;1304:==================
;1305:BotClearPath
;1306:
;1307: try to deactivate obstacles like proximity mines on the bot's path
;1308:==================
;1309:*/
;1310:void BotClearPath(bot_state_t *bs, bot_moveresult_t *moveresult) {
line 1318
;1311:	int i, bestmine;
;1312:	float dist, bestdist;
;1313:	vec3_t target, dir;
;1314:	bsp_trace_t bsptrace;
;1315:	entityState_t state;
;1316:
;1317:	// if there is a dead body wearing kamikze nearby
;1318:	if (bs->kamikazebody) {
ADDRFP4 0
INDIRP4
CNSTI4 6256
ADDP4
INDIRI4
CNSTI4 0
EQI4 $556
line 1320
;1319:		// if the bot's view angles and weapon are not used for movement
;1320:		if ( !(moveresult->flags & (MOVERESULT_MOVEMENTVIEW | MOVERESULT_MOVEMENTWEAPON)) ) {
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 17
BANDI4
CNSTI4 0
NEI4 $558
line 1322
;1321:			//
;1322:			BotAI_GetEntityState(bs->kamikazebody, &state);
ADDRFP4 0
INDIRP4
CNSTI4 6256
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BotAI_GetEntityState
CALLI4
pop
line 1323
;1323:			VectorCopy(state.pos.trBase, target);
ADDRLP4 240
ADDRLP4 12+12+12
INDIRB
ASGNB 12
line 1324
;1324:			target[2] += 8;
ADDRLP4 240+8
ADDRLP4 240+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 1325
;1325:			VectorSubtract(target, bs->eye, dir);
ADDRLP4 336
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 240
INDIRF4
ADDRLP4 336
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 240+4
INDIRF4
ADDRLP4 336
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 240+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1326
;1326:			vectoangles(dir, moveresult->ideal_viewangles);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1328
;1327:			//
;1328:			moveresult->weapon = BotSelectActivateWeapon(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 340
ADDRGP4 BotSelectActivateWeapon
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 340
INDIRI4
ASGNI4
line 1329
;1329:			if (moveresult->weapon == -1) {
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $567
line 1331
;1330:				// FIXME: run away!
;1331:				moveresult->weapon = 0;
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
CNSTI4 0
ASGNI4
line 1332
;1332:			}
LABELV $567
line 1333
;1333:			if (moveresult->weapon) {
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $569
line 1335
;1334:				//
;1335:				moveresult->flags |= MOVERESULT_MOVEMENTWEAPON | MOVERESULT_MOVEMENTVIEW;
ADDRLP4 344
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 344
INDIRP4
ADDRLP4 344
INDIRP4
INDIRI4
CNSTI4 17
BORI4
ASGNI4
line 1337
;1336:				// if holding the right weapon
;1337:				if (bs->cur_ps.weapon == moveresult->weapon) {
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
NEI4 $571
line 1339
;1338:					// if the bot is pretty close with it's aim
;1339:					if (InFieldOfVision(bs->viewangles, 20, moveresult->ideal_viewangles)) {
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1101004800
ARGF4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
ARGP4
ADDRLP4 348
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 348
INDIRI4
CNSTI4 0
EQI4 $573
line 1341
;1340:						//
;1341:						BotAI_Trace(&bsptrace, bs->eye, NULL, NULL, target, bs->entitynum, MASK_SHOT);
ADDRLP4 252
ARGP4
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 352
INDIRP4
CNSTI4 4936
ADDP4
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
ADDRLP4 240
ARGP4
ADDRLP4 352
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
line 1343
;1342:						// if the mine is visible from the current position
;1343:						if (bsptrace.fraction >= 1.0 || bsptrace.ent == state.number) {
ADDRLP4 252+8
INDIRF4
CNSTF4 1065353216
GEF4 $579
ADDRLP4 252+80
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $575
LABELV $579
line 1345
;1344:							// shoot at the mine
;1345:							trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 1346
;1346:						}
LABELV $575
line 1347
;1347:					}
LABELV $573
line 1348
;1348:				}
LABELV $571
line 1349
;1349:			}
LABELV $569
line 1350
;1350:		}
LABELV $558
line 1351
;1351:	}
LABELV $556
line 1352
;1352:	if (moveresult->flags & MOVERESULT_BLOCKEDBYAVOIDSPOT) {
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $580
line 1353
;1353:		bs->blockedbyavoidspot_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6208
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
ASGNF4
line 1354
;1354:	}
LABELV $580
line 1356
;1355:	// if blocked by an avoid spot and the view angles and weapon are used for movement
;1356:	if (bs->blockedbyavoidspot_time > FloatTime() &&
ADDRFP4 0
INDIRP4
CNSTI4 6208
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $582
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 17
BANDI4
CNSTI4 0
NEI4 $582
line 1357
;1357:		!(moveresult->flags & (MOVERESULT_MOVEMENTVIEW | MOVERESULT_MOVEMENTWEAPON)) ) {
line 1358
;1358:		bestdist = 300;
ADDRLP4 232
CNSTF4 1133903872
ASGNF4
line 1359
;1359:		bestmine = -1;
ADDRLP4 236
CNSTI4 -1
ASGNI4
line 1360
;1360:		for (i = 0; i < bs->numproxmines; i++) {
ADDRLP4 224
CNSTI4 0
ASGNI4
ADDRGP4 $587
JUMPV
LABELV $584
line 1361
;1361:			BotAI_GetEntityState(bs->proxmines[i], &state);
ADDRLP4 224
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 6260
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BotAI_GetEntityState
CALLI4
pop
line 1362
;1362:			VectorSubtract(state.pos.trBase, bs->origin, dir);
ADDRLP4 336
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12+12+12
INDIRF4
ADDRLP4 336
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 12+12+12+4
INDIRF4
ADDRLP4 336
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 12+12+12+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1363
;1363:			dist = VectorLength(dir);
ADDRLP4 0
ARGP4
ADDRLP4 340
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 228
ADDRLP4 340
INDIRF4
ASGNF4
line 1364
;1364:			if (dist < bestdist) {
ADDRLP4 228
INDIRF4
ADDRLP4 232
INDIRF4
GEF4 $598
line 1365
;1365:				bestdist = dist;
ADDRLP4 232
ADDRLP4 228
INDIRF4
ASGNF4
line 1366
;1366:				bestmine = i;
ADDRLP4 236
ADDRLP4 224
INDIRI4
ASGNI4
line 1367
;1367:			}
LABELV $598
line 1368
;1368:		}
LABELV $585
line 1360
ADDRLP4 224
ADDRLP4 224
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $587
ADDRLP4 224
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6516
ADDP4
INDIRI4
LTI4 $584
line 1369
;1369:		if (bestmine != -1) {
ADDRLP4 236
INDIRI4
CNSTI4 -1
EQI4 $600
line 1375
;1370:			//
;1371:			// state->generic1 == TEAM_RED || state->generic1 == TEAM_BLUE
;1372:			//
;1373:			// deactivate prox mines in the bot's path by shooting
;1374:			// rockets or plasma cells etc. at them
;1375:			BotAI_GetEntityState(bs->proxmines[bestmine], &state);
ADDRLP4 236
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 6260
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BotAI_GetEntityState
CALLI4
pop
line 1376
;1376:			VectorCopy(state.pos.trBase, target);
ADDRLP4 240
ADDRLP4 12+12+12
INDIRB
ASGNB 12
line 1377
;1377:			target[2] += 2;
ADDRLP4 240+8
ADDRLP4 240+8
INDIRF4
CNSTF4 1073741824
ADDF4
ASGNF4
line 1378
;1378:			VectorSubtract(target, bs->eye, dir);
ADDRLP4 336
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 240
INDIRF4
ADDRLP4 336
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 240+4
INDIRF4
ADDRLP4 336
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 240+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1379
;1379:			vectoangles(dir, moveresult->ideal_viewangles);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1381
;1380:			// if the bot has a weapon that does splash damage
;1381:			if (bs->inventory[INVENTORY_PLASMAGUN] > 0 && bs->inventory[INVENTORY_CELLS] > 0)
ADDRLP4 340
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 344
CNSTI4 0
ASGNI4
ADDRLP4 340
INDIRP4
CNSTI4 4996
ADDP4
INDIRI4
ADDRLP4 344
INDIRI4
LEI4 $609
ADDRLP4 340
INDIRP4
CNSTI4 5036
ADDP4
INDIRI4
ADDRLP4 344
INDIRI4
LEI4 $609
line 1382
;1382:				moveresult->weapon = WEAPONINDEX_PLASMAGUN;
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
CNSTI4 8
ASGNI4
ADDRGP4 $610
JUMPV
LABELV $609
line 1383
;1383:			else if (bs->inventory[INVENTORY_ROCKETLAUNCHER] > 0 && bs->inventory[INVENTORY_ROCKETS] > 0)
ADDRLP4 348
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 352
CNSTI4 0
ASGNI4
ADDRLP4 348
INDIRP4
CNSTI4 4984
ADDP4
INDIRI4
ADDRLP4 352
INDIRI4
LEI4 $611
ADDRLP4 348
INDIRP4
CNSTI4 5044
ADDP4
INDIRI4
ADDRLP4 352
INDIRI4
LEI4 $611
line 1384
;1384:				moveresult->weapon = WEAPONINDEX_ROCKET_LAUNCHER;
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
CNSTI4 5
ASGNI4
ADDRGP4 $612
JUMPV
LABELV $611
line 1385
;1385:			else if (bs->inventory[INVENTORY_BFG10K] > 0 && bs->inventory[INVENTORY_BFGAMMO] > 0)
ADDRLP4 356
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 360
CNSTI4 0
ASGNI4
ADDRLP4 356
INDIRP4
CNSTI4 5004
ADDP4
INDIRI4
ADDRLP4 360
INDIRI4
LEI4 $613
ADDRLP4 356
INDIRP4
CNSTI4 5052
ADDP4
INDIRI4
ADDRLP4 360
INDIRI4
LEI4 $613
line 1386
;1386:				moveresult->weapon = WEAPONINDEX_BFG;
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
CNSTI4 9
ASGNI4
ADDRGP4 $614
JUMPV
LABELV $613
line 1387
;1387:			else {
line 1388
;1388:				moveresult->weapon = 0;
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
CNSTI4 0
ASGNI4
line 1389
;1389:			}
LABELV $614
LABELV $612
LABELV $610
line 1390
;1390:			if (moveresult->weapon) {
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $615
line 1392
;1391:				//
;1392:				moveresult->flags |= MOVERESULT_MOVEMENTWEAPON | MOVERESULT_MOVEMENTVIEW;
ADDRLP4 364
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 364
INDIRP4
ADDRLP4 364
INDIRP4
INDIRI4
CNSTI4 17
BORI4
ASGNI4
line 1394
;1393:				// if holding the right weapon
;1394:				if (bs->cur_ps.weapon == moveresult->weapon) {
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
NEI4 $617
line 1396
;1395:					// if the bot is pretty close with it's aim
;1396:					if (InFieldOfVision(bs->viewangles, 20, moveresult->ideal_viewangles)) {
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1101004800
ARGF4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
ARGP4
ADDRLP4 368
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 0
EQI4 $619
line 1398
;1397:						//
;1398:						BotAI_Trace(&bsptrace, bs->eye, NULL, NULL, target, bs->entitynum, MASK_SHOT);
ADDRLP4 252
ARGP4
ADDRLP4 372
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 372
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 376
CNSTP4 0
ASGNP4
ADDRLP4 376
INDIRP4
ARGP4
ADDRLP4 376
INDIRP4
ARGP4
ADDRLP4 240
ARGP4
ADDRLP4 372
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
line 1400
;1399:						// if the mine is visible from the current position
;1400:						if (bsptrace.fraction >= 1.0 || bsptrace.ent == state.number) {
ADDRLP4 252+8
INDIRF4
CNSTF4 1065353216
GEF4 $625
ADDRLP4 252+80
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $621
LABELV $625
line 1402
;1401:							// shoot at the mine
;1402:							trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 1403
;1403:						}
LABELV $621
line 1404
;1404:					}
LABELV $619
line 1405
;1405:				}
LABELV $617
line 1406
;1406:			}
LABELV $615
line 1407
;1407:		}
LABELV $600
line 1408
;1408:	}
LABELV $582
line 1409
;1409:}
LABELV $555
endproc BotClearPath 380 28
export AIEnter_Seek_ActivateEntity
proc AIEnter_Seek_ActivateEntity 0 16
line 1416
;1410:
;1411:/*
;1412:==================
;1413:AIEnter_Seek_ActivateEntity
;1414:==================
;1415:*/
;1416:void AIEnter_Seek_ActivateEntity(bot_state_t *bs, char *s) {
line 1417
;1417:	BotRecordNodeSwitch(bs, "activate entity", "", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $627
ARGP4
ADDRGP4 $63
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 1418
;1418:	bs->ainode = AINode_Seek_ActivateEntity;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
ADDRGP4 AINode_Seek_ActivateEntity
ASGNP4
line 1419
;1419:}
LABELV $626
endproc AIEnter_Seek_ActivateEntity 0 16
export AINode_Seek_ActivateEntity
proc AINode_Seek_ActivateEntity 372 28
line 1426
;1420:
;1421:/*
;1422:==================
;1423:AINode_Seek_Activate_Entity
;1424:==================
;1425:*/
;1426:int AINode_Seek_ActivateEntity(bot_state_t *bs) {
line 1434
;1427:	bot_goal_t *goal;
;1428:	vec3_t target, dir, ideal_viewangles;
;1429:	bot_moveresult_t moveresult;
;1430:	int targetvisible;
;1431:	bsp_trace_t bsptrace;
;1432:	aas_entityinfo_t entinfo;
;1433:
;1434:	if (BotIsObserver(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 320
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 320
INDIRI4
CNSTI4 0
EQI4 $629
line 1435
;1435:		BotClearActivateGoalStack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotClearActivateGoalStack
CALLV
pop
line 1436
;1436:		AIEnter_Observer(bs, "active entity: observer");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $631
ARGP4
ADDRGP4 AIEnter_Observer
CALLV
pop
line 1437
;1437:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $628
JUMPV
LABELV $629
line 1440
;1438:	}
;1439:	//if in the intermission
;1440:	if (BotIntermission(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 324
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 324
INDIRI4
CNSTI4 0
EQI4 $632
line 1441
;1441:		BotClearActivateGoalStack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotClearActivateGoalStack
CALLV
pop
line 1442
;1442:		AIEnter_Intermission(bs, "activate entity: intermission");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $634
ARGP4
ADDRGP4 AIEnter_Intermission
CALLV
pop
line 1443
;1443:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $628
JUMPV
LABELV $632
line 1446
;1444:	}
;1445:	//respawn if dead
;1446:	if (BotIsDead(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 328
ADDRGP4 BotIsDead
CALLI4
ASGNI4
ADDRLP4 328
INDIRI4
CNSTI4 0
EQI4 $635
line 1447
;1447:		BotClearActivateGoalStack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotClearActivateGoalStack
CALLV
pop
line 1448
;1448:		AIEnter_Respawn(bs, "activate entity: bot dead");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $637
ARGP4
ADDRGP4 AIEnter_Respawn
CALLV
pop
line 1449
;1449:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $628
JUMPV
LABELV $635
line 1452
;1450:	}
;1451:	//
;1452:	bs->tfl = TFL_DEFAULT;
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
CNSTI4 18616254
ASGNI4
line 1453
;1453:	if (bot_grapple.integer) bs->tfl |= TFL_GRAPPLEHOOK;
ADDRGP4 bot_grapple+12
INDIRI4
CNSTI4 0
EQI4 $638
ADDRLP4 332
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 332
INDIRP4
ADDRLP4 332
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
LABELV $638
line 1455
;1454:	// if in lava or slime the bot should be able to get out
;1455:	if (BotInLavaOrSlime(bs)) bs->tfl |= TFL_LAVA|TFL_SLIME;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 336
ADDRGP4 BotInLavaOrSlime
CALLI4
ASGNI4
ADDRLP4 336
INDIRI4
CNSTI4 0
EQI4 $641
ADDRLP4 340
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 340
INDIRP4
ADDRLP4 340
INDIRP4
INDIRI4
CNSTI4 6291456
BORI4
ASGNI4
LABELV $641
line 1457
;1456:	// map specific code
;1457:	BotMapScripts(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotMapScripts
CALLV
pop
line 1459
;1458:	// no enemy
;1459:	bs->enemy = -1;
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
CNSTI4 -1
ASGNI4
line 1461
;1460:	// if the bot has no activate goal
;1461:	if (!bs->activatestack) {
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $643
line 1462
;1462:		BotClearActivateGoalStack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotClearActivateGoalStack
CALLV
pop
line 1463
;1463:		AIEnter_Seek_NBG(bs, "activate entity: no goal");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $645
ARGP4
ADDRGP4 AIEnter_Seek_NBG
CALLV
pop
line 1464
;1464:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $628
JUMPV
LABELV $643
line 1467
;1465:	}
;1466:	//
;1467:	goal = &bs->activatestack->goal;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
line 1469
;1468:	// initialize target being visible to false
;1469:	targetvisible = qfalse;
ADDRLP4 68
CNSTI4 0
ASGNI4
line 1471
;1470:	// if the bot has to shoot at a target to activate something
;1471:	if (bs->activatestack->shoot) {
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
EQI4 $646
line 1473
;1472:		//
;1473:		BotAI_Trace(&bsptrace, bs->eye, NULL, NULL, bs->activatestack->target, bs->entitynum, MASK_SHOT);
ADDRLP4 72
ARGP4
ADDRLP4 344
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 344
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 348
CNSTP4 0
ASGNP4
ADDRLP4 348
INDIRP4
ARGP4
ADDRLP4 348
INDIRP4
ARGP4
ADDRLP4 344
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CNSTI4 80
ADDP4
ARGP4
ADDRLP4 344
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
line 1475
;1474:		// if the shootable entity is visible from the current position
;1475:		if (bsptrace.fraction >= 1.0 || bsptrace.ent == goal->entitynum) {
ADDRLP4 72+8
INDIRF4
CNSTF4 1065353216
GEF4 $652
ADDRLP4 72+80
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $648
LABELV $652
line 1476
;1476:			targetvisible = qtrue;
ADDRLP4 68
CNSTI4 1
ASGNI4
line 1478
;1477:			// if holding the right weapon
;1478:			if (bs->cur_ps.weapon == bs->activatestack->weapon) {
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 352
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRLP4 352
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
NEI4 $653
line 1479
;1479:				VectorSubtract(bs->activatestack->target, bs->eye, dir);
ADDRLP4 356
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 360
ADDRLP4 356
INDIRP4
CNSTI4 7116
ADDP4
ASGNP4
ADDRLP4 56
ADDRLP4 360
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRF4
ADDRLP4 356
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56+4
ADDRLP4 360
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRF4
ADDRLP4 356
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 364
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56+8
ADDRLP4 364
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRF4
ADDRLP4 364
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1480
;1480:				vectoangles(dir, ideal_viewangles);
ADDRLP4 56
ARGP4
ADDRLP4 308
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1482
;1481:				// if the bot is pretty close with it's aim
;1482:				if (InFieldOfVision(bs->viewangles, 20, ideal_viewangles)) {
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1101004800
ARGF4
ADDRLP4 308
ARGP4
ADDRLP4 368
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 0
EQI4 $657
line 1483
;1483:					trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 1484
;1484:				}
LABELV $657
line 1485
;1485:			}
LABELV $653
line 1486
;1486:		}
LABELV $648
line 1487
;1487:	}
LABELV $646
line 1489
;1488:	// if the shoot target is visible
;1489:	if (targetvisible) {
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $659
line 1491
;1490:		// get the entity info of the entity the bot is shooting at
;1491:		BotEntityInfo(goal->entitynum, &entinfo);
ADDRLP4 52
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 156
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1493
;1492:		// if the entity the bot shoots at moved
;1493:		if (!VectorCompare(bs->activatestack->origin, entinfo.origin)) {
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 156+24
ARGP4
ADDRLP4 344
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 0
NEI4 $661
line 1497
;1494:#ifdef DEBUG
;1495:			BotAI_Print(PRT_MESSAGE, "hit shootable button or trigger\n");
;1496:#endif //DEBUG
;1497:			bs->activatestack->time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 0
ASGNF4
line 1498
;1498:		}
LABELV $661
line 1500
;1499:		// if the activate goal has been activated or the bot takes too long
;1500:		if (bs->activatestack->time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $664
line 1501
;1501:			BotPopFromActivateGoalStack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotPopFromActivateGoalStack
CALLI4
pop
line 1503
;1502:			// if there are more activate goals on the stack
;1503:			if (bs->activatestack) {
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $666
line 1504
;1504:				bs->activatestack->time = FloatTime() + 10;
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1092616192
ADDF4
ASGNF4
line 1505
;1505:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $628
JUMPV
LABELV $666
line 1507
;1506:			}
;1507:			AIEnter_Seek_NBG(bs, "activate entity: time out");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $668
ARGP4
ADDRGP4 AIEnter_Seek_NBG
CALLV
pop
line 1508
;1508:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $628
JUMPV
LABELV $664
line 1510
;1509:		}
;1510:		memset(&moveresult, 0, sizeof(bot_moveresult_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 52
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1511
;1511:	}
ADDRGP4 $660
JUMPV
LABELV $659
line 1512
;1512:	else {
line 1514
;1513:		// if the bot has no goal
;1514:		if (!goal) {
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $669
line 1515
;1515:			bs->activatestack->time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 0
ASGNF4
line 1516
;1516:		}
ADDRGP4 $670
JUMPV
LABELV $669
line 1518
;1517:		// if the bot does not have a shoot goal
;1518:		else if (!bs->activatestack->shoot) {
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
NEI4 $671
line 1520
;1519:			//if the bot touches the current goal
;1520:			if (trap_BotTouchingGoal(bs->origin, goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 344
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 0
EQI4 $673
line 1524
;1521:#ifdef DEBUG
;1522:				BotAI_Print(PRT_MESSAGE, "touched button or trigger\n");
;1523:#endif //DEBUG
;1524:				bs->activatestack->time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 0
ASGNF4
line 1525
;1525:			}
LABELV $673
line 1526
;1526:		}
LABELV $671
LABELV $670
line 1528
;1527:		// if the activate goal has been activated or the bot takes too long
;1528:		if (bs->activatestack->time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $675
line 1529
;1529:			BotPopFromActivateGoalStack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotPopFromActivateGoalStack
CALLI4
pop
line 1531
;1530:			// if there are more activate goals on the stack
;1531:			if (bs->activatestack) {
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $677
line 1532
;1532:				bs->activatestack->time = FloatTime() + 10;
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1092616192
ADDF4
ASGNF4
line 1533
;1533:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $628
JUMPV
LABELV $677
line 1535
;1534:			}
;1535:			AIEnter_Seek_NBG(bs, "activate entity: activated");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $679
ARGP4
ADDRGP4 AIEnter_Seek_NBG
CALLV
pop
line 1536
;1536:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $628
JUMPV
LABELV $675
line 1539
;1537:		}
;1538:		//predict obstacles
;1539:		if (BotAIPredictObstacles(bs, goal))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 344
ADDRGP4 BotAIPredictObstacles
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 0
EQI4 $680
line 1540
;1540:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $628
JUMPV
LABELV $680
line 1542
;1541:		//initialize the movement state
;1542:		BotSetupForMovement(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 1544
;1543:		//move towards the goal
;1544:		trap_BotMoveToGoal(&moveresult, bs->ms, goal, bs->tfl);
ADDRLP4 0
ARGP4
ADDRLP4 348
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 348
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 348
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotMoveToGoal
CALLV
pop
line 1546
;1545:		//if the movement failed
;1546:		if (moveresult.failure) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $682
line 1548
;1547:			//reset the avoid reach, otherwise bot is stuck in current area
;1548:			trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 1550
;1549:			//
;1550:			bs->activatestack->time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 0
ASGNF4
line 1551
;1551:		}
LABELV $682
line 1553
;1552:		//check if the bot is blocked
;1553:		BotAIBlocked(bs, &moveresult, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotAIBlocked
CALLV
pop
line 1554
;1554:	}
LABELV $660
line 1556
;1555:	//
;1556:	BotClearPath(bs, &moveresult);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotClearPath
CALLV
pop
line 1558
;1557:	// if the bot has to shoot to activate
;1558:	if (bs->activatestack->shoot) {
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
EQI4 $684
line 1560
;1559:		// if the view angles aren't yet used for the movement
;1560:		if (!(moveresult.flags & MOVERESULT_MOVEMENTVIEW)) {
ADDRLP4 0+20
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $686
line 1561
;1561:			VectorSubtract(bs->activatestack->target, bs->eye, dir);
ADDRLP4 344
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 348
ADDRLP4 344
INDIRP4
CNSTI4 7116
ADDP4
ASGNP4
ADDRLP4 56
ADDRLP4 348
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRF4
ADDRLP4 344
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56+4
ADDRLP4 348
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRF4
ADDRLP4 344
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56+8
ADDRLP4 352
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRF4
ADDRLP4 352
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1562
;1562:			vectoangles(dir, moveresult.ideal_viewangles);
ADDRLP4 56
ARGP4
ADDRLP4 0+40
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1563
;1563:			moveresult.flags |= MOVERESULT_MOVEMENTVIEW;
ADDRLP4 0+20
ADDRLP4 0+20
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1564
;1564:		}
LABELV $686
line 1566
;1565:		// if there's no weapon yet used for the movement
;1566:		if (!(moveresult.flags & MOVERESULT_MOVEMENTWEAPON)) {
ADDRLP4 0+20
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $693
line 1567
;1567:			moveresult.flags |= MOVERESULT_MOVEMENTWEAPON;
ADDRLP4 0+20
ADDRLP4 0+20
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 1569
;1568:			//
;1569:			bs->activatestack->weapon = BotSelectActivateWeapon(bs);
ADDRLP4 344
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 344
INDIRP4
ARGP4
ADDRLP4 348
ADDRGP4 BotSelectActivateWeapon
CALLI4
ASGNI4
ADDRLP4 344
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 348
INDIRI4
ASGNI4
line 1570
;1570:			if (bs->activatestack->weapon == -1) {
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $697
line 1572
;1571:				//FIXME: find a decent weapon first
;1572:				bs->activatestack->weapon = 0;
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CNSTI4 76
ADDP4
CNSTI4 0
ASGNI4
line 1573
;1573:			}
LABELV $697
line 1574
;1574:			moveresult.weapon = bs->activatestack->weapon;
ADDRLP4 0+24
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ASGNI4
line 1575
;1575:		}
LABELV $693
line 1576
;1576:	}
LABELV $684
line 1578
;1577:	// if the ideal view angles are set for movement
;1578:	if (moveresult.flags & (MOVERESULT_MOVEMENTVIEWSET|MOVERESULT_MOVEMENTVIEW|MOVERESULT_SWIMVIEW)) {
ADDRLP4 0+20
INDIRI4
CNSTI4 11
BANDI4
CNSTI4 0
EQI4 $700
line 1579
;1579:		VectorCopy(moveresult.ideal_viewangles, bs->ideal_viewangles);
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ADDRLP4 0+40
INDIRB
ASGNB 12
line 1580
;1580:	}
ADDRGP4 $701
JUMPV
LABELV $700
line 1582
;1581:	// if waiting for something
;1582:	else if (moveresult.flags & MOVERESULT_WAITING) {
ADDRLP4 0+20
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $704
line 1583
;1583:		if (random() < bs->thinktime * 0.8) {
ADDRLP4 344
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1061997773
ADDRFP4 0
INDIRP4
CNSTI4 4904
ADDP4
INDIRF4
MULF4
GEF4 $705
line 1584
;1584:			BotRoamGoal(bs, target);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
ARGP4
ADDRGP4 BotRoamGoal
CALLV
pop
line 1585
;1585:			VectorSubtract(target, bs->origin, dir);
ADDRLP4 348
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 296
INDIRF4
ADDRLP4 348
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56+4
ADDRLP4 296+4
INDIRF4
ADDRLP4 348
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56+8
ADDRLP4 296+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1586
;1586:			vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 56
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1587
;1587:			bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 352
ADDRFP4 0
INDIRP4
CNSTI4 6584
ADDP4
ASGNP4
ADDRLP4 352
INDIRP4
CNSTF4 1056964608
ADDRLP4 352
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1588
;1588:		}
line 1589
;1589:	}
ADDRGP4 $705
JUMPV
LABELV $704
line 1590
;1590:	else if (!(bs->flags & BFL_IDEALVIEWSET)) {
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $713
line 1591
;1591:		if (trap_BotMovementViewTarget(bs->ms, goal, bs->tfl, 300, target)) {
ADDRLP4 344
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 344
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 344
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
CNSTF4 1133903872
ARGF4
ADDRLP4 296
ARGP4
ADDRLP4 348
ADDRGP4 trap_BotMovementViewTarget
CALLI4
ASGNI4
ADDRLP4 348
INDIRI4
CNSTI4 0
EQI4 $715
line 1592
;1592:			VectorSubtract(target, bs->origin, dir);
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 296
INDIRF4
ADDRLP4 352
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56+4
ADDRLP4 296+4
INDIRF4
ADDRLP4 352
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56+8
ADDRLP4 296+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1593
;1593:			vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 56
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1594
;1594:		}
ADDRGP4 $716
JUMPV
LABELV $715
line 1595
;1595:		else {
line 1596
;1596:			vectoangles(moveresult.movedir, bs->ideal_viewangles);
ADDRLP4 0+28
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1597
;1597:		}
LABELV $716
line 1598
;1598:		bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 352
ADDRFP4 0
INDIRP4
CNSTI4 6584
ADDP4
ASGNP4
ADDRLP4 352
INDIRP4
CNSTF4 1056964608
ADDRLP4 352
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1599
;1599:	}
LABELV $713
LABELV $705
LABELV $701
line 1601
;1600:	// if the weapon is used for the bot movement
;1601:	if (moveresult.flags & MOVERESULT_MOVEMENTWEAPON)
ADDRLP4 0+20
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $722
line 1602
;1602:		bs->weaponnum = moveresult.weapon;
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
ADDRLP4 0+24
INDIRI4
ASGNI4
LABELV $722
line 1605
;1603:	
;1604:	// if there is an enemy
;1605:	if (BotFindEnemy(bs, -1)) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 344
ADDRGP4 BotFindEnemy
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 0
EQI4 $726
line 1606
;1606:		if (BotWantsToRetreat(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 348
ADDRGP4 BotWantsToRetreat
CALLI4
ASGNI4
ADDRLP4 348
INDIRI4
CNSTI4 0
EQI4 $728
line 1608
;1607:			//keep the current long term goal and retreat
;1608:			AIEnter_Battle_NBG(bs, "activate entity: found enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $730
ARGP4
ADDRGP4 AIEnter_Battle_NBG
CALLV
pop
line 1609
;1609:		}
ADDRGP4 $729
JUMPV
LABELV $728
line 1610
;1610:		else {
line 1611
;1611:			trap_BotResetLastAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetLastAvoidReach
CALLV
pop
line 1613
;1612:			//empty the goal stack
;1613:			trap_BotEmptyGoalStack(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotEmptyGoalStack
CALLV
pop
line 1615
;1614:			//go fight
;1615:			AIEnter_Battle_Fight(bs, "activate entity: found enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $730
ARGP4
ADDRGP4 AIEnter_Battle_Fight
CALLV
pop
line 1616
;1616:		}
LABELV $729
line 1617
;1617:		BotClearActivateGoalStack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotClearActivateGoalStack
CALLV
pop
line 1618
;1618:	}
LABELV $726
line 1619
;1619:	return qtrue;
CNSTI4 1
RETI4
LABELV $628
endproc AINode_Seek_ActivateEntity 372 28
export AIEnter_Seek_NBG
proc AIEnter_Seek_NBG 204 16
line 1627
;1620:}
;1621:
;1622:/*
;1623:==================
;1624:AIEnter_Seek_NBG
;1625:==================
;1626:*/
;1627:void AIEnter_Seek_NBG(bot_state_t *bs, char *s) {
line 1631
;1628:	bot_goal_t goal;
;1629:	char buf[144];
;1630:
;1631:	if (trap_BotGetTopGoal(bs->gs, &goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 200
ADDRGP4 trap_BotGetTopGoal
CALLI4
ASGNI4
ADDRLP4 200
INDIRI4
CNSTI4 0
EQI4 $732
line 1632
;1632:		trap_BotGoalName(goal.number, buf, 144);
ADDRLP4 0+44
INDIRI4
ARGI4
ADDRLP4 56
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 1633
;1633:		BotRecordNodeSwitch(bs, "seek NBG", buf, s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $735
ARGP4
ADDRLP4 56
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 1634
;1634:	}
ADDRGP4 $733
JUMPV
LABELV $732
line 1635
;1635:	else {
line 1636
;1636:		BotRecordNodeSwitch(bs, "seek NBG", "no goal", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $735
ARGP4
ADDRGP4 $736
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 1637
;1637:	}
LABELV $733
line 1638
;1638:	bs->ainode = AINode_Seek_NBG;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
ADDRGP4 AINode_Seek_NBG
ASGNP4
line 1639
;1639:}
LABELV $731
endproc AIEnter_Seek_NBG 204 16
export AINode_Seek_NBG
proc AINode_Seek_NBG 192 20
line 1646
;1640:
;1641:/*
;1642:==================
;1643:AINode_Seek_NBG
;1644:==================
;1645:*/
;1646:int AINode_Seek_NBG(bot_state_t *bs) {
line 1651
;1647:	bot_goal_t goal;
;1648:	vec3_t target, dir;
;1649:	bot_moveresult_t moveresult;
;1650:
;1651:	if (BotIsObserver(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 132
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 0
EQI4 $738
line 1652
;1652:		AIEnter_Observer(bs, "seek nbg: observer");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $740
ARGP4
ADDRGP4 AIEnter_Observer
CALLV
pop
line 1653
;1653:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $737
JUMPV
LABELV $738
line 1656
;1654:	}
;1655:	//if in the intermission
;1656:	if (BotIntermission(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 0
EQI4 $741
line 1657
;1657:		AIEnter_Intermission(bs, "seek nbg: intermision");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $743
ARGP4
ADDRGP4 AIEnter_Intermission
CALLV
pop
line 1658
;1658:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $737
JUMPV
LABELV $741
line 1661
;1659:	}
;1660:	//respawn if dead
;1661:	if (BotIsDead(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotIsDead
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $744
line 1662
;1662:		AIEnter_Respawn(bs, "seek nbg: bot dead");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $746
ARGP4
ADDRGP4 AIEnter_Respawn
CALLV
pop
line 1663
;1663:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $737
JUMPV
LABELV $744
line 1666
;1664:	}
;1665:	//
;1666:	bs->tfl = TFL_DEFAULT;
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
CNSTI4 18616254
ASGNI4
line 1667
;1667:	if (bot_grapple.integer) bs->tfl |= TFL_GRAPPLEHOOK;
ADDRGP4 bot_grapple+12
INDIRI4
CNSTI4 0
EQI4 $747
ADDRLP4 144
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
LABELV $747
line 1669
;1668:	//if in lava or slime the bot should be able to get out
;1669:	if (BotInLavaOrSlime(bs)) bs->tfl |= TFL_LAVA|TFL_SLIME;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 148
ADDRGP4 BotInLavaOrSlime
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $750
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRI4
CNSTI4 6291456
BORI4
ASGNI4
LABELV $750
line 1671
;1670:	//
;1671:	if (BotCanAndWantsToRocketJump(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 156
ADDRGP4 BotCanAndWantsToRocketJump
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
EQI4 $752
line 1672
;1672:		bs->tfl |= TFL_ROCKETJUMP;
ADDRLP4 160
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 1673
;1673:	}
LABELV $752
line 1675
;1674:	//map specific code
;1675:	BotMapScripts(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotMapScripts
CALLV
pop
line 1677
;1676:	//no enemy
;1677:	bs->enemy = -1;
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
CNSTI4 -1
ASGNI4
line 1679
;1678:	//if the bot has no goal
;1679:	if (!trap_BotGetTopGoal(bs->gs, &goal)) bs->nbg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 160
ADDRGP4 trap_BotGetTopGoal
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
NEI4 $754
ADDRFP4 0
INDIRP4
CNSTI4 6072
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 $755
JUMPV
LABELV $754
line 1681
;1680:	//if the bot touches the current goal
;1681:	else if (BotReachedGoal(bs, &goal)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 164
ADDRGP4 BotReachedGoal
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
EQI4 $756
line 1682
;1682:		BotChooseWeapon(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotChooseWeapon
CALLV
pop
line 1683
;1683:		bs->nbg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6072
ADDP4
CNSTF4 0
ASGNF4
line 1684
;1684:	}
LABELV $756
LABELV $755
line 1686
;1685:	//
;1686:	if (bs->nbg_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6072
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $758
line 1688
;1687:		//pop the current goal from the stack
;1688:		trap_BotPopGoal(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotPopGoal
CALLV
pop
line 1691
;1689:		//check for new nearby items right away
;1690:		//NOTE: we canNOT reset the check_time to zero because it would create an endless loop of node switches
;1691:		bs->check_time = FloatTime() + 0.05;
ADDRFP4 0
INDIRP4
CNSTI4 6092
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1028443341
ADDF4
ASGNF4
line 1693
;1692:		//go back to seek ltg
;1693:		AIEnter_Seek_LTG(bs, "seek nbg: time out");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $760
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 1694
;1694:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $737
JUMPV
LABELV $758
line 1697
;1695:	}
;1696:	//predict obstacles
;1697:	if (BotAIPredictObstacles(bs, &goal))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 168
ADDRGP4 BotAIPredictObstacles
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 0
EQI4 $761
line 1698
;1698:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $737
JUMPV
LABELV $761
line 1700
;1699:	//initialize the movement state
;1700:	BotSetupForMovement(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 1702
;1701:	//move towards the goal
;1702:	trap_BotMoveToGoal(&moveresult, bs->ms, &goal, bs->tfl);
ADDRLP4 0
ARGP4
ADDRLP4 172
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 172
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 172
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotMoveToGoal
CALLV
pop
line 1704
;1703:	//if the movement failed
;1704:	if (moveresult.failure) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $763
line 1706
;1705:		//reset the avoid reach, otherwise bot is stuck in current area
;1706:		trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 1707
;1707:		bs->nbg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6072
ADDP4
CNSTF4 0
ASGNF4
line 1708
;1708:	}
LABELV $763
line 1710
;1709:	//check if the bot is blocked
;1710:	BotAIBlocked(bs, &moveresult, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotAIBlocked
CALLV
pop
line 1712
;1711:	//
;1712:	BotClearPath(bs, &moveresult);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotClearPath
CALLV
pop
line 1714
;1713:	//if the viewangles are used for the movement
;1714:	if (moveresult.flags & (MOVERESULT_MOVEMENTVIEWSET|MOVERESULT_MOVEMENTVIEW|MOVERESULT_SWIMVIEW)) {
ADDRLP4 0+20
INDIRI4
CNSTI4 11
BANDI4
CNSTI4 0
EQI4 $765
line 1715
;1715:		VectorCopy(moveresult.ideal_viewangles, bs->ideal_viewangles);
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ADDRLP4 0+40
INDIRB
ASGNB 12
line 1716
;1716:	}
ADDRGP4 $766
JUMPV
LABELV $765
line 1718
;1717:	//if waiting for something
;1718:	else if (moveresult.flags & MOVERESULT_WAITING) {
ADDRLP4 0+20
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $769
line 1719
;1719:		if (random() < bs->thinktime * 0.8) {
ADDRLP4 176
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1061997773
ADDRFP4 0
INDIRP4
CNSTI4 4904
ADDP4
INDIRF4
MULF4
GEF4 $770
line 1720
;1720:			BotRoamGoal(bs, target);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 108
ARGP4
ADDRGP4 BotRoamGoal
CALLV
pop
line 1721
;1721:			VectorSubtract(target, bs->origin, dir);
ADDRLP4 180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 120
ADDRLP4 108
INDIRF4
ADDRLP4 180
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 120+4
ADDRLP4 108+4
INDIRF4
ADDRLP4 180
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 120+8
ADDRLP4 108+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1722
;1722:			vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 120
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1723
;1723:			bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 184
ADDRFP4 0
INDIRP4
CNSTI4 6584
ADDP4
ASGNP4
ADDRLP4 184
INDIRP4
CNSTF4 1056964608
ADDRLP4 184
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1724
;1724:		}
line 1725
;1725:	}
ADDRGP4 $770
JUMPV
LABELV $769
line 1726
;1726:	else if (!(bs->flags & BFL_IDEALVIEWSET)) {
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $778
line 1727
;1727:		if (!trap_BotGetSecondGoal(bs->gs, &goal)) trap_BotGetTopGoal(bs->gs, &goal);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 176
ADDRGP4 trap_BotGetSecondGoal
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 0
NEI4 $780
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRGP4 trap_BotGetTopGoal
CALLI4
pop
LABELV $780
line 1728
;1728:		if (trap_BotMovementViewTarget(bs->ms, &goal, bs->tfl, 300, target)) {
ADDRLP4 180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 180
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 180
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
CNSTF4 1133903872
ARGF4
ADDRLP4 108
ARGP4
ADDRLP4 184
ADDRGP4 trap_BotMovementViewTarget
CALLI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 0
EQI4 $782
line 1729
;1729:			VectorSubtract(target, bs->origin, dir);
ADDRLP4 188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 120
ADDRLP4 108
INDIRF4
ADDRLP4 188
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 120+4
ADDRLP4 108+4
INDIRF4
ADDRLP4 188
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 120+8
ADDRLP4 108+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1730
;1730:			vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 120
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1731
;1731:		}
ADDRGP4 $783
JUMPV
LABELV $782
line 1733
;1732:		//FIXME: look at cluster portals?
;1733:		else vectoangles(moveresult.movedir, bs->ideal_viewangles);
ADDRLP4 0+28
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
LABELV $783
line 1734
;1734:		bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 188
ADDRFP4 0
INDIRP4
CNSTI4 6584
ADDP4
ASGNP4
ADDRLP4 188
INDIRP4
CNSTF4 1056964608
ADDRLP4 188
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1735
;1735:	}
LABELV $778
LABELV $770
LABELV $766
line 1737
;1736:	//if the weapon is used for the bot movement
;1737:	if (moveresult.flags & MOVERESULT_MOVEMENTWEAPON) bs->weaponnum = moveresult.weapon;
ADDRLP4 0+20
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $789
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
ADDRLP4 0+24
INDIRI4
ASGNI4
LABELV $789
line 1739
;1738:	//if there is an enemy
;1739:	if (BotFindEnemy(bs, -1)) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 176
ADDRGP4 BotFindEnemy
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 0
EQI4 $793
line 1740
;1740:		if (BotWantsToRetreat(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 180
ADDRGP4 BotWantsToRetreat
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 0
EQI4 $795
line 1742
;1741:			//keep the current long term goal and retreat
;1742:			AIEnter_Battle_NBG(bs, "seek nbg: found enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $797
ARGP4
ADDRGP4 AIEnter_Battle_NBG
CALLV
pop
line 1743
;1743:		}
ADDRGP4 $796
JUMPV
LABELV $795
line 1744
;1744:		else {
line 1745
;1745:			trap_BotResetLastAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetLastAvoidReach
CALLV
pop
line 1747
;1746:			//empty the goal stack
;1747:			trap_BotEmptyGoalStack(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotEmptyGoalStack
CALLV
pop
line 1749
;1748:			//go fight
;1749:			AIEnter_Battle_Fight(bs, "seek nbg: found enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $797
ARGP4
ADDRGP4 AIEnter_Battle_Fight
CALLV
pop
line 1750
;1750:		}
LABELV $796
line 1751
;1751:	}
LABELV $793
line 1752
;1752:	return qtrue;
CNSTI4 1
RETI4
LABELV $737
endproc AINode_Seek_NBG 192 20
export AIEnter_Seek_LTG
proc AIEnter_Seek_LTG 204 16
line 1760
;1753:}
;1754:
;1755:/*
;1756:==================
;1757:AIEnter_Seek_LTG
;1758:==================
;1759:*/
;1760:void AIEnter_Seek_LTG(bot_state_t *bs, char *s) {
line 1764
;1761:	bot_goal_t goal;
;1762:	char buf[144];
;1763:
;1764:	if (trap_BotGetTopGoal(bs->gs, &goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 200
ADDRGP4 trap_BotGetTopGoal
CALLI4
ASGNI4
ADDRLP4 200
INDIRI4
CNSTI4 0
EQI4 $799
line 1765
;1765:		trap_BotGoalName(goal.number, buf, 144);
ADDRLP4 0+44
INDIRI4
ARGI4
ADDRLP4 56
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 1766
;1766:		BotRecordNodeSwitch(bs, "seek LTG", buf, s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $802
ARGP4
ADDRLP4 56
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 1767
;1767:	}
ADDRGP4 $800
JUMPV
LABELV $799
line 1768
;1768:	else {
line 1769
;1769:		BotRecordNodeSwitch(bs, "seek LTG", "no goal", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $802
ARGP4
ADDRGP4 $736
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 1770
;1770:	}
LABELV $800
line 1771
;1771:	bs->ainode = AINode_Seek_LTG;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
ADDRGP4 AINode_Seek_LTG
ASGNP4
line 1772
;1772:}
LABELV $798
endproc AIEnter_Seek_LTG 204 16
export AINode_Seek_LTG
proc AINode_Seek_LTG 212 20
line 1780
;1773:
;1774:/*
;1775:==================
;1776:AINode_Seek_LTG
;1777:==================
;1778:*/
;1779:int AINode_Seek_LTG(bot_state_t *bs)
;1780:{
line 1788
;1781:	bot_goal_t goal;
;1782:	vec3_t target, dir;
;1783:	bot_moveresult_t moveresult;
;1784:	int range;
;1785:	//char buf[128];
;1786:	//bot_goal_t tmpgoal;
;1787:
;1788:	if (BotIsObserver(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 0
EQI4 $804
line 1789
;1789:		AIEnter_Observer(bs, "seek ltg: observer");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $806
ARGP4
ADDRGP4 AIEnter_Observer
CALLV
pop
line 1790
;1790:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $803
JUMPV
LABELV $804
line 1793
;1791:	}
;1792:	//if in the intermission
;1793:	if (BotIntermission(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $807
line 1794
;1794:		AIEnter_Intermission(bs, "seek ltg: intermission");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $809
ARGP4
ADDRGP4 AIEnter_Intermission
CALLV
pop
line 1795
;1795:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $803
JUMPV
LABELV $807
line 1798
;1796:	}
;1797:	//respawn if dead
;1798:	if (BotIsDead(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 BotIsDead
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $810
line 1799
;1799:		AIEnter_Respawn(bs, "seek ltg: bot dead");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $812
ARGP4
ADDRGP4 AIEnter_Respawn
CALLV
pop
line 1800
;1800:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $803
JUMPV
LABELV $810
line 1803
;1801:	}
;1802:	//
;1803:	if (BotChat_Random(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 148
ADDRGP4 BotChat_Random
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $813
line 1804
;1804:		bs->stand_time = FloatTime() + BotChatTime(bs);
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
ARGP4
ADDRLP4 156
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 152
INDIRP4
CNSTI4 6096
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 156
INDIRF4
ADDF4
ASGNF4
line 1805
;1805:		AIEnter_Stand(bs, "seek ltg: random chat");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $815
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 1806
;1806:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $803
JUMPV
LABELV $813
line 1809
;1807:	}
;1808:	//
;1809:	bs->tfl = TFL_DEFAULT;
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
CNSTI4 18616254
ASGNI4
line 1810
;1810:	if (bot_grapple.integer) bs->tfl |= TFL_GRAPPLEHOOK;
ADDRGP4 bot_grapple+12
INDIRI4
CNSTI4 0
EQI4 $816
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
LABELV $816
line 1812
;1811:	//if in lava or slime the bot should be able to get out
;1812:	if (BotInLavaOrSlime(bs)) bs->tfl |= TFL_LAVA|TFL_SLIME;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 156
ADDRGP4 BotInLavaOrSlime
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
EQI4 $819
ADDRLP4 160
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRI4
CNSTI4 6291456
BORI4
ASGNI4
LABELV $819
line 1814
;1813:	//
;1814:	if (BotCanAndWantsToRocketJump(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 BotCanAndWantsToRocketJump
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
EQI4 $821
line 1815
;1815:		bs->tfl |= TFL_ROCKETJUMP;
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 1816
;1816:	}
LABELV $821
line 1818
;1817:	//map specific code
;1818:	BotMapScripts(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotMapScripts
CALLV
pop
line 1820
;1819:	//no enemy
;1820:	bs->enemy = -1;
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
CNSTI4 -1
ASGNI4
line 1822
;1821:	//
;1822:	if (bs->killedenemy_time > FloatTime() - 2) {
ADDRFP4 0
INDIRP4
CNSTI4 6168
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
SUBF4
LEF4 $823
line 1823
;1823:		if (random() < bs->thinktime * 1) {
ADDRLP4 168
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1065353216
ADDRFP4 0
INDIRP4
CNSTI4 4904
ADDP4
INDIRF4
MULF4
GEF4 $825
line 1824
;1824:			trap_EA_Gesture(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Gesture
CALLV
pop
line 1825
;1825:		}
LABELV $825
line 1826
;1826:	}
LABELV $823
line 1828
;1827:	//if there is an enemy
;1828:	if (BotFindEnemy(bs, -1)) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 168
ADDRGP4 BotFindEnemy
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 0
EQI4 $827
line 1829
;1829:		if (BotWantsToRetreat(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 172
ADDRGP4 BotWantsToRetreat
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 0
EQI4 $829
line 1831
;1830:			//keep the current long term goal and retreat
;1831:			AIEnter_Battle_Retreat(bs, "seek ltg: found enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $831
ARGP4
ADDRGP4 AIEnter_Battle_Retreat
CALLV
pop
line 1832
;1832:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $803
JUMPV
LABELV $829
line 1834
;1833:		}
;1834:		else {
line 1835
;1835:			trap_BotResetLastAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetLastAvoidReach
CALLV
pop
line 1837
;1836:			//empty the goal stack
;1837:			trap_BotEmptyGoalStack(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotEmptyGoalStack
CALLV
pop
line 1839
;1838:			//go fight
;1839:			AIEnter_Battle_Fight(bs, "seek ltg: found enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $831
ARGP4
ADDRGP4 AIEnter_Battle_Fight
CALLV
pop
line 1840
;1840:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $803
JUMPV
LABELV $827
line 1844
;1841:		}
;1842:	}
;1843:	//
;1844:	BotTeamGoals(bs, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotTeamGoals
CALLV
pop
line 1846
;1845:	//get the current long term goal
;1846:	if (!BotLongTermGoal(bs, bs->tfl, qfalse, &goal)) {
ADDRLP4 172
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 172
INDIRP4
ARGP4
ADDRLP4 172
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 176
ADDRGP4 BotLongTermGoal
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 0
NEI4 $832
line 1847
;1847:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $803
JUMPV
LABELV $832
line 1850
;1848:	}
;1849:	//check for nearby goals periodicly
;1850:	if (bs->check_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6092
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $834
line 1851
;1851:		bs->check_time = FloatTime() + 0.5;
ADDRFP4 0
INDIRP4
CNSTI4 6092
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 1853
;1852:		//check if the bot wants to camp
;1853:		BotWantsToCamp(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotWantsToCamp
CALLI4
pop
line 1855
;1854:		//
;1855:		if (bs->ltgtype == LTG_DEFENDKEYAREA) range = 400;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 3
NEI4 $836
ADDRLP4 108
CNSTI4 400
ASGNI4
ADDRGP4 $837
JUMPV
LABELV $836
line 1856
;1856:		else range = 150;
ADDRLP4 108
CNSTI4 150
ASGNI4
LABELV $837
line 1859
;1857:		//
;1858:#ifdef CTF
;1859:		if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $838
line 1861
;1860:			//if carrying a flag the bot shouldn't be distracted too much
;1861:			if (BotCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 180
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 0
EQI4 $840
line 1862
;1862:				range = 50;
ADDRLP4 108
CNSTI4 50
ASGNI4
LABELV $840
line 1863
;1863:		}
LABELV $838
line 1876
;1864:#endif //CTF
;1865:#ifdef MISSIONPACK
;1866:		else if (gametype == GT_1FCTF) {
;1867:			if (Bot1FCTFCarryingFlag(bs))
;1868:				range = 50;
;1869:		}
;1870:		else if (gametype == GT_HARVESTER) {
;1871:			if (BotHarvesterCarryingCubes(bs))
;1872:				range = 80;
;1873:		}
;1874:#endif
;1875:		//
;1876:		if (BotNearbyGoal(bs, bs->tfl, &goal, range)) {
ADDRLP4 180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 180
INDIRP4
ARGP4
ADDRLP4 180
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 108
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 184
ADDRGP4 BotNearbyGoal
CALLI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 0
EQI4 $842
line 1877
;1877:			trap_BotResetLastAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetLastAvoidReach
CALLV
pop
line 1883
;1878:			//get the goal at the top of the stack
;1879:			//trap_BotGetTopGoal(bs->gs, &tmpgoal);
;1880:			//trap_BotGoalName(tmpgoal.number, buf, 144);
;1881:			//BotAI_Print(PRT_MESSAGE, "new nearby goal %s\n", buf);
;1882:			//time the bot gets to pick up the nearby goal item
;1883:			bs->nbg_time = FloatTime() + 4 + range * 0.01;
ADDRFP4 0
INDIRP4
CNSTI4 6072
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1082130432
ADDF4
CNSTF4 1008981770
ADDRLP4 108
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 1884
;1884:			AIEnter_Seek_NBG(bs, "ltg seek: nbg");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $844
ARGP4
ADDRGP4 AIEnter_Seek_NBG
CALLV
pop
line 1885
;1885:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $803
JUMPV
LABELV $842
line 1887
;1886:		}
;1887:	}
LABELV $834
line 1889
;1888:	//predict obstacles
;1889:	if (BotAIPredictObstacles(bs, &goal))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 180
ADDRGP4 BotAIPredictObstacles
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 0
EQI4 $845
line 1890
;1890:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $803
JUMPV
LABELV $845
line 1892
;1891:	//initialize the movement state
;1892:	BotSetupForMovement(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 1894
;1893:	//move towards the goal
;1894:	trap_BotMoveToGoal(&moveresult, bs->ms, &goal, bs->tfl);
ADDRLP4 0
ARGP4
ADDRLP4 184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 184
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 184
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotMoveToGoal
CALLV
pop
line 1896
;1895:	//if the movement failed
;1896:	if (moveresult.failure) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $847
line 1898
;1897:		//reset the avoid reach, otherwise bot is stuck in current area
;1898:		trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 1900
;1899:		//BotAI_Print(PRT_MESSAGE, "movement failure %d\n", moveresult.traveltype);
;1900:		bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6068
ADDP4
CNSTF4 0
ASGNF4
line 1901
;1901:	}
LABELV $847
line 1903
;1902:	//
;1903:	BotAIBlocked(bs, &moveresult, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotAIBlocked
CALLV
pop
line 1905
;1904:	//
;1905:	BotClearPath(bs, &moveresult);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotClearPath
CALLV
pop
line 1907
;1906:	//if the viewangles are used for the movement
;1907:	if (moveresult.flags & (MOVERESULT_MOVEMENTVIEWSET|MOVERESULT_MOVEMENTVIEW|MOVERESULT_SWIMVIEW)) {
ADDRLP4 0+20
INDIRI4
CNSTI4 11
BANDI4
CNSTI4 0
EQI4 $849
line 1908
;1908:		VectorCopy(moveresult.ideal_viewangles, bs->ideal_viewangles);
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ADDRLP4 0+40
INDIRB
ASGNB 12
line 1909
;1909:	}
ADDRGP4 $850
JUMPV
LABELV $849
line 1911
;1910:	//if waiting for something
;1911:	else if (moveresult.flags & MOVERESULT_WAITING) {
ADDRLP4 0+20
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $853
line 1912
;1912:		if (random() < bs->thinktime * 0.8) {
ADDRLP4 188
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1061997773
ADDRFP4 0
INDIRP4
CNSTI4 4904
ADDP4
INDIRF4
MULF4
GEF4 $854
line 1913
;1913:			BotRoamGoal(bs, target);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 112
ARGP4
ADDRGP4 BotRoamGoal
CALLV
pop
line 1914
;1914:			VectorSubtract(target, bs->origin, dir);
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
ADDRLP4 112
INDIRF4
ADDRLP4 192
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 112+4
INDIRF4
ADDRLP4 192
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 112+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1915
;1915:			vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 124
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1916
;1916:			bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 196
ADDRFP4 0
INDIRP4
CNSTI4 6584
ADDP4
ASGNP4
ADDRLP4 196
INDIRP4
CNSTF4 1056964608
ADDRLP4 196
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1917
;1917:		}
line 1918
;1918:	}
ADDRGP4 $854
JUMPV
LABELV $853
line 1919
;1919:	else if (!(bs->flags & BFL_IDEALVIEWSET)) {
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $862
line 1920
;1920:		if (trap_BotMovementViewTarget(bs->ms, &goal, bs->tfl, 300, target)) {
ADDRLP4 188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 188
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 188
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
CNSTF4 1133903872
ARGF4
ADDRLP4 112
ARGP4
ADDRLP4 192
ADDRGP4 trap_BotMovementViewTarget
CALLI4
ASGNI4
ADDRLP4 192
INDIRI4
CNSTI4 0
EQI4 $864
line 1921
;1921:			VectorSubtract(target, bs->origin, dir);
ADDRLP4 196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
ADDRLP4 112
INDIRF4
ADDRLP4 196
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 112+4
INDIRF4
ADDRLP4 196
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 112+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1922
;1922:			vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 124
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1923
;1923:		}
ADDRGP4 $865
JUMPV
LABELV $864
line 1925
;1924:		//FIXME: look at cluster portals?
;1925:		else if (VectorLengthSquared(moveresult.movedir)) {
ADDRLP4 0+28
ARGP4
ADDRLP4 196
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 196
INDIRF4
CNSTF4 0
EQF4 $870
line 1926
;1926:			vectoangles(moveresult.movedir, bs->ideal_viewangles);
ADDRLP4 0+28
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1927
;1927:		}
ADDRGP4 $871
JUMPV
LABELV $870
line 1928
;1928:		else if (random() < bs->thinktime * 0.8) {
ADDRLP4 200
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 200
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1061997773
ADDRFP4 0
INDIRP4
CNSTI4 4904
ADDP4
INDIRF4
MULF4
GEF4 $874
line 1929
;1929:			BotRoamGoal(bs, target);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 112
ARGP4
ADDRGP4 BotRoamGoal
CALLV
pop
line 1930
;1930:			VectorSubtract(target, bs->origin, dir);
ADDRLP4 204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
ADDRLP4 112
INDIRF4
ADDRLP4 204
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 112+4
INDIRF4
ADDRLP4 204
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 112+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1931
;1931:			vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 124
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1932
;1932:			bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 208
ADDRFP4 0
INDIRP4
CNSTI4 6584
ADDP4
ASGNP4
ADDRLP4 208
INDIRP4
CNSTF4 1056964608
ADDRLP4 208
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1933
;1933:		}
LABELV $874
LABELV $871
LABELV $865
line 1934
;1934:		bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 204
ADDRFP4 0
INDIRP4
CNSTI4 6584
ADDP4
ASGNP4
ADDRLP4 204
INDIRP4
CNSTF4 1056964608
ADDRLP4 204
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1935
;1935:	}
LABELV $862
LABELV $854
LABELV $850
line 1937
;1936:	//if the weapon is used for the bot movement
;1937:	if (moveresult.flags & MOVERESULT_MOVEMENTWEAPON) bs->weaponnum = moveresult.weapon;
ADDRLP4 0+20
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $880
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
ADDRLP4 0+24
INDIRI4
ASGNI4
LABELV $880
line 1939
;1938:	//
;1939:	return qtrue;
CNSTI4 1
RETI4
LABELV $803
endproc AINode_Seek_LTG 212 20
export AIEnter_Battle_Fight
proc AIEnter_Battle_Fight 0 16
line 1947
;1940:}
;1941:
;1942:/*
;1943:==================
;1944:AIEnter_Battle_Fight
;1945:==================
;1946:*/
;1947:void AIEnter_Battle_Fight(bot_state_t *bs, char *s) {
line 1948
;1948:	BotRecordNodeSwitch(bs, "battle fight", "", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $885
ARGP4
ADDRGP4 $63
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 1949
;1949:	trap_BotResetLastAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetLastAvoidReach
CALLV
pop
line 1950
;1950:	bs->ainode = AINode_Battle_Fight;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
ADDRGP4 AINode_Battle_Fight
ASGNP4
line 1951
;1951:}
LABELV $884
endproc AIEnter_Battle_Fight 0 16
export AIEnter_Battle_SuicidalFight
proc AIEnter_Battle_SuicidalFight 4 16
line 1958
;1952:
;1953:/*
;1954:==================
;1955:AIEnter_Battle_Fight
;1956:==================
;1957:*/
;1958:void AIEnter_Battle_SuicidalFight(bot_state_t *bs, char *s) {
line 1959
;1959:	BotRecordNodeSwitch(bs, "battle fight", "", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $885
ARGP4
ADDRGP4 $63
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 1960
;1960:	trap_BotResetLastAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetLastAvoidReach
CALLV
pop
line 1961
;1961:	bs->ainode = AINode_Battle_Fight;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
ADDRGP4 AINode_Battle_Fight
ASGNP4
line 1962
;1962:	bs->flags |= BFL_FIGHTSUICIDAL;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 1963
;1963:}
LABELV $886
endproc AIEnter_Battle_SuicidalFight 4 16
export AINode_Battle_Fight
proc AINode_Battle_Fight 292 20
line 1970
;1964:
;1965:/*
;1966:==================
;1967:AINode_Battle_Fight
;1968:==================
;1969:*/
;1970:int AINode_Battle_Fight(bot_state_t *bs) {
line 1976
;1971:	int areanum;
;1972:	vec3_t target;
;1973:	aas_entityinfo_t entinfo;
;1974:	bot_moveresult_t moveresult;
;1975:
;1976:	if (BotIsObserver(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 208
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 208
INDIRI4
CNSTI4 0
EQI4 $888
line 1977
;1977:		AIEnter_Observer(bs, "battle fight: observer");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $890
ARGP4
ADDRGP4 AIEnter_Observer
CALLV
pop
line 1978
;1978:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $887
JUMPV
LABELV $888
line 1982
;1979:	}
;1980:
;1981:	//if in the intermission
;1982:	if (BotIntermission(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 212
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 212
INDIRI4
CNSTI4 0
EQI4 $891
line 1983
;1983:		AIEnter_Intermission(bs, "battle fight: intermission");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $893
ARGP4
ADDRGP4 AIEnter_Intermission
CALLV
pop
line 1984
;1984:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $887
JUMPV
LABELV $891
line 1987
;1985:	}
;1986:	//respawn if dead
;1987:	if (BotIsDead(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 216
ADDRGP4 BotIsDead
CALLI4
ASGNI4
ADDRLP4 216
INDIRI4
CNSTI4 0
EQI4 $894
line 1988
;1988:		AIEnter_Respawn(bs, "battle fight: bot dead");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $896
ARGP4
ADDRGP4 AIEnter_Respawn
CALLV
pop
line 1989
;1989:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $887
JUMPV
LABELV $894
line 1992
;1990:	}
;1991:	//if there is another better enemy
;1992:	if (BotFindEnemy(bs, bs->enemy)) {
ADDRLP4 220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 220
INDIRP4
ARGP4
ADDRLP4 220
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 224
ADDRGP4 BotFindEnemy
CALLI4
ASGNI4
ADDRLP4 224
INDIRI4
CNSTI4 0
EQI4 $897
line 1996
;1993:#ifdef DEBUG
;1994:		BotAI_Print(PRT_MESSAGE, "found new better enemy\n");
;1995:#endif
;1996:	}
LABELV $897
line 1998
;1997:	//if no enemy
;1998:	if (bs->enemy < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 0
GEI4 $899
line 1999
;1999:		AIEnter_Seek_LTG(bs, "battle fight: no enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $901
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 2000
;2000:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $887
JUMPV
LABELV $899
line 2003
;2001:	}
;2002:	//
;2003:	BotEntityInfo(bs->enemy, &entinfo);
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
line 2005
;2004:	//if the enemy is dead
;2005:	if (bs->enemydeath_time) {
ADDRFP4 0
INDIRP4
CNSTI4 6136
ADDP4
INDIRF4
CNSTF4 0
EQF4 $902
line 2006
;2006:		if (bs->enemydeath_time < FloatTime() - 1.0) {
ADDRFP4 0
INDIRP4
CNSTI4 6136
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
GEF4 $903
line 2007
;2007:			bs->enemydeath_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6136
ADDP4
CNSTF4 0
ASGNF4
line 2008
;2008:			if (bs->enemysuicide) {
ADDRFP4 0
INDIRP4
CNSTI4 6012
ADDP4
INDIRI4
CNSTI4 0
EQI4 $906
line 2009
;2009:				BotChat_EnemySuicide(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotChat_EnemySuicide
CALLI4
pop
line 2010
;2010:			}
LABELV $906
line 2011
;2011:			if (bs->lastkilledplayer == bs->enemy && BotChat_Kill(bs)) {
ADDRLP4 228
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 228
INDIRP4
CNSTI4 5992
ADDP4
INDIRI4
ADDRLP4 228
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
NEI4 $908
ADDRLP4 228
INDIRP4
ARGP4
ADDRLP4 232
ADDRGP4 BotChat_Kill
CALLI4
ASGNI4
ADDRLP4 232
INDIRI4
CNSTI4 0
EQI4 $908
line 2012
;2012:				bs->stand_time = FloatTime() + BotChatTime(bs);
ADDRLP4 236
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 236
INDIRP4
ARGP4
ADDRLP4 240
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 236
INDIRP4
CNSTI4 6096
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 240
INDIRF4
ADDF4
ASGNF4
line 2013
;2013:				AIEnter_Stand(bs, "battle fight: enemy dead");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $910
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 2014
;2014:			}
ADDRGP4 $909
JUMPV
LABELV $908
line 2015
;2015:			else {
line 2016
;2016:				bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6068
ADDP4
CNSTF4 0
ASGNF4
line 2017
;2017:				AIEnter_Seek_LTG(bs, "battle fight: enemy dead");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $910
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 2018
;2018:			}
LABELV $909
line 2019
;2019:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $887
JUMPV
line 2021
;2020:		}
;2021:	}
LABELV $902
line 2022
;2022:	else {
line 2023
;2023:		if (EntityIsDead(&entinfo)) {
ADDRLP4 0
ARGP4
ADDRLP4 228
ADDRGP4 EntityIsDead
CALLI4
ASGNI4
ADDRLP4 228
INDIRI4
CNSTI4 0
EQI4 $911
line 2024
;2024:			bs->enemydeath_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6136
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2025
;2025:		}
LABELV $911
line 2026
;2026:	}
LABELV $903
line 2028
;2027:	//if the enemy is invisible and not shooting the bot looses track easily
;2028:	if (EntityIsInvisible(&entinfo) && !EntityIsShooting(&entinfo)) {
ADDRLP4 0
ARGP4
ADDRLP4 228
ADDRGP4 EntityIsInvisible
CALLI4
ASGNI4
ADDRLP4 228
INDIRI4
CNSTI4 0
EQI4 $913
ADDRLP4 0
ARGP4
ADDRLP4 232
ADDRGP4 EntityIsShooting
CALLI4
ASGNI4
ADDRLP4 232
INDIRI4
CNSTI4 0
NEI4 $913
line 2029
;2029:		if (random() < 0.2) {
ADDRLP4 236
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 236
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1045220557
GEF4 $915
line 2030
;2030:			AIEnter_Seek_LTG(bs, "battle fight: invisible");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $917
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 2031
;2031:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $887
JUMPV
LABELV $915
line 2033
;2032:		}
;2033:	}
LABELV $913
line 2035
;2034:	//
;2035:	VectorCopy(entinfo.origin, target);
ADDRLP4 196
ADDRLP4 0+24
INDIRB
ASGNB 12
line 2037
;2036:	// if not a player enemy
;2037:	if (bs->enemy >= MAX_CLIENTS) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 64
LTI4 $919
line 2045
;2038:#ifdef MISSIONPACK
;2039:		// if attacking an obelisk
;2040:		if ( bs->enemy == redobelisk.entitynum ||
;2041:			bs->enemy == blueobelisk.entitynum ) {
;2042:			target[2] += 16;
;2043:		}
;2044:#endif
;2045:	}
LABELV $919
line 2047
;2046:	//update the reachability area and origin if possible
;2047:	areanum = BotPointAreaNum(target);
ADDRLP4 196
ARGP4
ADDRLP4 236
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 192
ADDRLP4 236
INDIRI4
ASGNI4
line 2048
;2048:	if (areanum && trap_AAS_AreaReachability(areanum)) {
ADDRLP4 192
INDIRI4
CNSTI4 0
EQI4 $921
ADDRLP4 192
INDIRI4
ARGI4
ADDRLP4 244
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 244
INDIRI4
CNSTI4 0
EQI4 $921
line 2049
;2049:		VectorCopy(target, bs->lastenemyorigin);
ADDRFP4 0
INDIRP4
CNSTI4 6548
ADDP4
ADDRLP4 196
INDIRB
ASGNB 12
line 2050
;2050:		bs->lastenemyareanum = areanum;
ADDRFP4 0
INDIRP4
CNSTI4 6544
ADDP4
ADDRLP4 192
INDIRI4
ASGNI4
line 2051
;2051:	}
LABELV $921
line 2053
;2052:	//update the attack inventory values
;2053:	BotUpdateBattleInventory(bs, bs->enemy);
ADDRLP4 248
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 248
INDIRP4
ARGP4
ADDRLP4 248
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotUpdateBattleInventory
CALLV
pop
line 2055
;2054:	//if the bot's health decreased
;2055:	if (bs->lastframe_health > bs->inventory[INVENTORY_HEALTH]) {
ADDRLP4 252
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 252
INDIRP4
CNSTI4 6044
ADDP4
INDIRI4
ADDRLP4 252
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
LEI4 $923
line 2056
;2056:		if (BotChat_HitNoDeath(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
ADDRGP4 BotChat_HitNoDeath
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 0
EQI4 $925
line 2057
;2057:			bs->stand_time = FloatTime() + BotChatTime(bs);
ADDRLP4 260
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 260
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 260
INDIRP4
CNSTI4 6096
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 264
INDIRF4
ADDF4
ASGNF4
line 2058
;2058:			AIEnter_Stand(bs, "battle fight: chat health decreased");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $927
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 2059
;2059:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $887
JUMPV
LABELV $925
line 2061
;2060:		}
;2061:	}
LABELV $923
line 2063
;2062:	//if the bot hit someone
;2063:	if (bs->cur_ps.persistant[PERS_HITS] > bs->lasthitcount) {
ADDRLP4 256
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 256
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
ADDRLP4 256
INDIRP4
CNSTI4 6048
ADDP4
INDIRI4
LEI4 $928
line 2064
;2064:		if (BotChat_HitNoKill(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 260
ADDRGP4 BotChat_HitNoKill
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
EQI4 $930
line 2065
;2065:			bs->stand_time = FloatTime() + BotChatTime(bs);
ADDRLP4 264
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 264
INDIRP4
ARGP4
ADDRLP4 268
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 264
INDIRP4
CNSTI4 6096
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 268
INDIRF4
ADDF4
ASGNF4
line 2066
;2066:			AIEnter_Stand(bs, "battle fight: chat hit someone");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $932
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 2067
;2067:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $887
JUMPV
LABELV $930
line 2069
;2068:		}
;2069:	}
LABELV $928
line 2071
;2070:	//if the enemy is not visible
;2071:	if (!BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, bs->enemy)) {
ADDRLP4 260
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 260
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 260
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 260
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 264
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 264
INDIRF4
CNSTF4 0
NEF4 $933
line 2072
;2072:		if (BotWantsToChase(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 268
ADDRGP4 BotWantsToChase
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
EQI4 $935
line 2073
;2073:			AIEnter_Battle_Chase(bs, "battle fight: enemy out of sight");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $937
ARGP4
ADDRGP4 AIEnter_Battle_Chase
CALLV
pop
line 2074
;2074:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $887
JUMPV
LABELV $935
line 2076
;2075:		}
;2076:		else {
line 2077
;2077:			AIEnter_Seek_LTG(bs, "battle fight: enemy out of sight");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $937
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 2078
;2078:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $887
JUMPV
LABELV $933
line 2082
;2079:		}
;2080:	}
;2081:	//use holdable items
;2082:	BotBattleUseItems(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotBattleUseItems
CALLV
pop
line 2084
;2083:	//
;2084:	bs->tfl = TFL_DEFAULT;
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
CNSTI4 18616254
ASGNI4
line 2085
;2085:	if (bot_grapple.integer) bs->tfl |= TFL_GRAPPLEHOOK;
ADDRGP4 bot_grapple+12
INDIRI4
CNSTI4 0
EQI4 $938
ADDRLP4 268
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 268
INDIRP4
ADDRLP4 268
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
LABELV $938
line 2087
;2086:	//if in lava or slime the bot should be able to get out
;2087:	if (BotInLavaOrSlime(bs)) bs->tfl |= TFL_LAVA|TFL_SLIME;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 272
ADDRGP4 BotInLavaOrSlime
CALLI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 0
EQI4 $941
ADDRLP4 276
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 276
INDIRP4
ADDRLP4 276
INDIRP4
INDIRI4
CNSTI4 6291456
BORI4
ASGNI4
LABELV $941
line 2089
;2088:	//
;2089:	if (BotCanAndWantsToRocketJump(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 280
ADDRGP4 BotCanAndWantsToRocketJump
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
EQI4 $943
line 2090
;2090:		bs->tfl |= TFL_ROCKETJUMP;
ADDRLP4 284
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 284
INDIRP4
ADDRLP4 284
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 2091
;2091:	}
LABELV $943
line 2093
;2092:	//choose the best weapon to fight with
;2093:	BotChooseWeapon(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotChooseWeapon
CALLV
pop
line 2095
;2094:	//do attack movements
;2095:	moveresult = BotAttackMove(bs, bs->tfl);
ADDRLP4 140
ARGP4
ADDRLP4 284
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 284
INDIRP4
ARGP4
ADDRLP4 284
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotAttackMove
CALLV
pop
line 2097
;2096:	//if the movement failed
;2097:	if (moveresult.failure) {
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $945
line 2099
;2098:		//reset the avoid reach, otherwise bot is stuck in current area
;2099:		trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 2101
;2100:		//BotAI_Print(PRT_MESSAGE, "movement failure %d\n", moveresult.traveltype);
;2101:		bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6068
ADDP4
CNSTF4 0
ASGNF4
line 2102
;2102:	}
LABELV $945
line 2104
;2103:	//
;2104:	BotAIBlocked(bs, &moveresult, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotAIBlocked
CALLV
pop
line 2106
;2105:	//aim at the enemy
;2106:	BotAimAtEnemy(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotAimAtEnemy
CALLV
pop
line 2108
;2107:	//attack the enemy if possible
;2108:	BotCheckAttack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckAttack
CALLV
pop
line 2110
;2109:	//if the bot wants to retreat
;2110:	if (!(bs->flags & BFL_FIGHTSUICIDAL)) {
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
NEI4 $947
line 2111
;2111:		if (BotWantsToRetreat(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 288
ADDRGP4 BotWantsToRetreat
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
EQI4 $949
line 2112
;2112:			AIEnter_Battle_Retreat(bs, "battle fight: wants to retreat");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $951
ARGP4
ADDRGP4 AIEnter_Battle_Retreat
CALLV
pop
line 2113
;2113:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $887
JUMPV
LABELV $949
line 2115
;2114:		}
;2115:	}
LABELV $947
line 2116
;2116:	return qtrue;
CNSTI4 1
RETI4
LABELV $887
endproc AINode_Battle_Fight 292 20
export AIEnter_Battle_Chase
proc AIEnter_Battle_Chase 0 16
line 2124
;2117:}
;2118:
;2119:/*
;2120:==================
;2121:AIEnter_Battle_Chase
;2122:==================
;2123:*/
;2124:void AIEnter_Battle_Chase(bot_state_t *bs, char *s) {
line 2125
;2125:	BotRecordNodeSwitch(bs, "battle chase", "", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $953
ARGP4
ADDRGP4 $63
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 2126
;2126:	bs->chase_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6084
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2127
;2127:	bs->ainode = AINode_Battle_Chase;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
ADDRGP4 AINode_Battle_Chase
ASGNP4
line 2128
;2128:}
LABELV $952
endproc AIEnter_Battle_Chase 0 16
export AINode_Battle_Chase
proc AINode_Battle_Chase 204 20
line 2136
;2129:
;2130:/*
;2131:==================
;2132:AINode_Battle_Chase
;2133:==================
;2134:*/
;2135:int AINode_Battle_Chase(bot_state_t *bs)
;2136:{
line 2142
;2137:	bot_goal_t goal;
;2138:	vec3_t target, dir;
;2139:	bot_moveresult_t moveresult;
;2140:	float range;
;2141:
;2142:	if (BotIsObserver(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 0
EQI4 $955
line 2143
;2143:		AIEnter_Observer(bs, "battle chase: observer");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $957
ARGP4
ADDRGP4 AIEnter_Observer
CALLV
pop
line 2144
;2144:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $954
JUMPV
LABELV $955
line 2147
;2145:	}
;2146:	//if in the intermission
;2147:	if (BotIntermission(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $958
line 2148
;2148:		AIEnter_Intermission(bs, "battle chase: intermission");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $960
ARGP4
ADDRGP4 AIEnter_Intermission
CALLV
pop
line 2149
;2149:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $954
JUMPV
LABELV $958
line 2152
;2150:	}
;2151:	//respawn if dead
;2152:	if (BotIsDead(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 BotIsDead
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $961
line 2153
;2153:		AIEnter_Respawn(bs, "battle chase: bot dead");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $963
ARGP4
ADDRGP4 AIEnter_Respawn
CALLV
pop
line 2154
;2154:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $954
JUMPV
LABELV $961
line 2157
;2155:	}
;2156:	//if no enemy
;2157:	if (bs->enemy < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 0
GEI4 $964
line 2158
;2158:		AIEnter_Seek_LTG(bs, "battle chase: no enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $966
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 2159
;2159:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $954
JUMPV
LABELV $964
line 2162
;2160:	}
;2161:	//if the enemy is visible
;2162:	if (BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, bs->enemy)) {
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 148
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 148
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 148
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 152
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 152
INDIRF4
CNSTF4 0
EQF4 $967
line 2163
;2163:		AIEnter_Battle_Fight(bs, "battle chase");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $953
ARGP4
ADDRGP4 AIEnter_Battle_Fight
CALLV
pop
line 2164
;2164:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $954
JUMPV
LABELV $967
line 2167
;2165:	}
;2166:	//if there is another enemy
;2167:	if (BotFindEnemy(bs, -1)) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 156
ADDRGP4 BotFindEnemy
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
EQI4 $969
line 2168
;2168:		AIEnter_Battle_Fight(bs, "battle chase: better enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $971
ARGP4
ADDRGP4 AIEnter_Battle_Fight
CALLV
pop
line 2169
;2169:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $954
JUMPV
LABELV $969
line 2172
;2170:	}
;2171:	//there is no last enemy area
;2172:	if (!bs->lastenemyareanum) {
ADDRFP4 0
INDIRP4
CNSTI4 6544
ADDP4
INDIRI4
CNSTI4 0
NEI4 $972
line 2173
;2173:		AIEnter_Seek_LTG(bs, "battle chase: no enemy area");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $974
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 2174
;2174:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $954
JUMPV
LABELV $972
line 2177
;2175:	}
;2176:	//
;2177:	bs->tfl = TFL_DEFAULT;
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
CNSTI4 18616254
ASGNI4
line 2178
;2178:	if (bot_grapple.integer) bs->tfl |= TFL_GRAPPLEHOOK;
ADDRGP4 bot_grapple+12
INDIRI4
CNSTI4 0
EQI4 $975
ADDRLP4 160
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
LABELV $975
line 2180
;2179:	//if in lava or slime the bot should be able to get out
;2180:	if (BotInLavaOrSlime(bs)) bs->tfl |= TFL_LAVA|TFL_SLIME;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 BotInLavaOrSlime
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
EQI4 $978
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRI4
CNSTI4 6291456
BORI4
ASGNI4
LABELV $978
line 2182
;2181:	//
;2182:	if (BotCanAndWantsToRocketJump(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 172
ADDRGP4 BotCanAndWantsToRocketJump
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 0
EQI4 $980
line 2183
;2183:		bs->tfl |= TFL_ROCKETJUMP;
ADDRLP4 176
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 176
INDIRP4
ADDRLP4 176
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 2184
;2184:	}
LABELV $980
line 2186
;2185:	//map specific code
;2186:	BotMapScripts(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotMapScripts
CALLV
pop
line 2188
;2187:	//create the chase goal
;2188:	goal.entitynum = bs->enemy;
ADDRLP4 0+40
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ASGNI4
line 2189
;2189:	goal.areanum = bs->lastenemyareanum;
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
CNSTI4 6544
ADDP4
INDIRI4
ASGNI4
line 2190
;2190:	VectorCopy(bs->lastenemyorigin, goal.origin);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 6548
ADDP4
INDIRB
ASGNB 12
line 2191
;2191:	VectorSet(goal.mins, -8, -8, -8);
ADDRLP4 0+16
CNSTF4 3238002688
ASGNF4
ADDRLP4 0+16+4
CNSTF4 3238002688
ASGNF4
ADDRLP4 0+16+8
CNSTF4 3238002688
ASGNF4
line 2192
;2192:	VectorSet(goal.maxs, 8, 8, 8);
ADDRLP4 0+28
CNSTF4 1090519040
ASGNF4
ADDRLP4 0+28+4
CNSTF4 1090519040
ASGNF4
ADDRLP4 0+28+8
CNSTF4 1090519040
ASGNF4
line 2194
;2193:	//if the last seen enemy spot is reached the enemy could not be found
;2194:	if (trap_BotTouchingGoal(bs->origin, &goal)) bs->chase_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 176
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 0
EQI4 $994
ADDRFP4 0
INDIRP4
CNSTI4 6084
ADDP4
CNSTF4 0
ASGNF4
LABELV $994
line 2196
;2195:	//if there's no chase time left
;2196:	if (!bs->chase_time || bs->chase_time < FloatTime() - 10) {
ADDRLP4 180
ADDRFP4 0
INDIRP4
CNSTI4 6084
ADDP4
INDIRF4
ASGNF4
ADDRLP4 180
INDIRF4
CNSTF4 0
EQF4 $998
ADDRLP4 180
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1092616192
SUBF4
GEF4 $996
LABELV $998
line 2197
;2197:		AIEnter_Seek_LTG(bs, "battle chase: time out");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $999
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 2198
;2198:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $954
JUMPV
LABELV $996
line 2201
;2199:	}
;2200:	//check for nearby goals periodicly
;2201:	if (bs->check_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6092
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $1000
line 2202
;2202:		bs->check_time = FloatTime() + 1;
ADDRFP4 0
INDIRP4
CNSTI4 6092
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2203
;2203:		range = 150;
ADDRLP4 108
CNSTF4 1125515264
ASGNF4
line 2205
;2204:		//
;2205:		if (BotNearbyGoal(bs, bs->tfl, &goal, range)) {
ADDRLP4 184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 184
INDIRP4
ARGP4
ADDRLP4 184
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 108
INDIRF4
ARGF4
ADDRLP4 188
ADDRGP4 BotNearbyGoal
CALLI4
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 0
EQI4 $1002
line 2207
;2206:			//the bot gets 5 seconds to pick up the nearby goal item
;2207:			bs->nbg_time = FloatTime() + 0.1 * range + 1;
ADDRFP4 0
INDIRP4
CNSTI4 6072
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1036831949
ADDRLP4 108
INDIRF4
MULF4
ADDF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2208
;2208:			trap_BotResetLastAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetLastAvoidReach
CALLV
pop
line 2209
;2209:			AIEnter_Battle_NBG(bs, "battle chase: nbg");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1004
ARGP4
ADDRGP4 AIEnter_Battle_NBG
CALLV
pop
line 2210
;2210:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $954
JUMPV
LABELV $1002
line 2212
;2211:		}
;2212:	}
LABELV $1000
line 2214
;2213:	//
;2214:	BotUpdateBattleInventory(bs, bs->enemy);
ADDRLP4 184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 184
INDIRP4
ARGP4
ADDRLP4 184
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotUpdateBattleInventory
CALLV
pop
line 2216
;2215:	//initialize the movement state
;2216:	BotSetupForMovement(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 2218
;2217:	//move towards the goal
;2218:	trap_BotMoveToGoal(&moveresult, bs->ms, &goal, bs->tfl);
ADDRLP4 56
ARGP4
ADDRLP4 188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 188
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 188
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotMoveToGoal
CALLV
pop
line 2220
;2219:	//if the movement failed
;2220:	if (moveresult.failure) {
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $1005
line 2222
;2221:		//reset the avoid reach, otherwise bot is stuck in current area
;2222:		trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 2224
;2223:		//BotAI_Print(PRT_MESSAGE, "movement failure %d\n", moveresult.traveltype);
;2224:		bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6068
ADDP4
CNSTF4 0
ASGNF4
line 2225
;2225:	}
LABELV $1005
line 2227
;2226:	//
;2227:	BotAIBlocked(bs, &moveresult, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotAIBlocked
CALLV
pop
line 2229
;2228:	//
;2229:	if (moveresult.flags & (MOVERESULT_MOVEMENTVIEWSET|MOVERESULT_MOVEMENTVIEW|MOVERESULT_SWIMVIEW)) {
ADDRLP4 56+20
INDIRI4
CNSTI4 11
BANDI4
CNSTI4 0
EQI4 $1007
line 2230
;2230:		VectorCopy(moveresult.ideal_viewangles, bs->ideal_viewangles);
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ADDRLP4 56+40
INDIRB
ASGNB 12
line 2231
;2231:	}
ADDRGP4 $1008
JUMPV
LABELV $1007
line 2232
;2232:	else if (!(bs->flags & BFL_IDEALVIEWSET)) {
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $1011
line 2233
;2233:		if (bs->chase_time > FloatTime() - 2) {
ADDRFP4 0
INDIRP4
CNSTI4 6084
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
SUBF4
LEF4 $1013
line 2234
;2234:			BotAimAtEnemy(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotAimAtEnemy
CALLV
pop
line 2235
;2235:		}
ADDRGP4 $1014
JUMPV
LABELV $1013
line 2236
;2236:		else {
line 2237
;2237:			if (trap_BotMovementViewTarget(bs->ms, &goal, bs->tfl, 300, target)) {
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 192
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 192
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
CNSTF4 1133903872
ARGF4
ADDRLP4 112
ARGP4
ADDRLP4 196
ADDRGP4 trap_BotMovementViewTarget
CALLI4
ASGNI4
ADDRLP4 196
INDIRI4
CNSTI4 0
EQI4 $1015
line 2238
;2238:				VectorSubtract(target, bs->origin, dir);
ADDRLP4 200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
ADDRLP4 112
INDIRF4
ADDRLP4 200
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 112+4
INDIRF4
ADDRLP4 200
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 112+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2239
;2239:				vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 124
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2240
;2240:			}
ADDRGP4 $1016
JUMPV
LABELV $1015
line 2241
;2241:			else {
line 2242
;2242:				vectoangles(moveresult.movedir, bs->ideal_viewangles);
ADDRLP4 56+28
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2243
;2243:			}
LABELV $1016
line 2244
;2244:		}
LABELV $1014
line 2245
;2245:		bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 192
ADDRFP4 0
INDIRP4
CNSTI4 6584
ADDP4
ASGNP4
ADDRLP4 192
INDIRP4
CNSTF4 1056964608
ADDRLP4 192
INDIRP4
INDIRF4
MULF4
ASGNF4
line 2246
;2246:	}
LABELV $1011
LABELV $1008
line 2248
;2247:	//if the weapon is used for the bot movement
;2248:	if (moveresult.flags & MOVERESULT_MOVEMENTWEAPON) bs->weaponnum = moveresult.weapon;
ADDRLP4 56+20
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1022
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
ADDRLP4 56+24
INDIRI4
ASGNI4
LABELV $1022
line 2250
;2249:	//if the bot is in the area the enemy was last seen in
;2250:	if (bs->areanum == bs->lastenemyareanum) bs->chase_time = 0;
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 192
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ADDRLP4 192
INDIRP4
CNSTI4 6544
ADDP4
INDIRI4
NEI4 $1026
ADDRFP4 0
INDIRP4
CNSTI4 6084
ADDP4
CNSTF4 0
ASGNF4
LABELV $1026
line 2252
;2251:	//if the bot wants to retreat (the bot could have been damage during the chase)
;2252:	if (BotWantsToRetreat(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 196
ADDRGP4 BotWantsToRetreat
CALLI4
ASGNI4
ADDRLP4 196
INDIRI4
CNSTI4 0
EQI4 $1028
line 2253
;2253:		AIEnter_Battle_Retreat(bs, "battle chase: wants to retreat");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1030
ARGP4
ADDRGP4 AIEnter_Battle_Retreat
CALLV
pop
line 2254
;2254:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $954
JUMPV
LABELV $1028
line 2256
;2255:	}
;2256:	return qtrue;
CNSTI4 1
RETI4
LABELV $954
endproc AINode_Battle_Chase 204 20
export AIEnter_Battle_Retreat
proc AIEnter_Battle_Retreat 0 16
line 2264
;2257:}
;2258:
;2259:/*
;2260:==================
;2261:AIEnter_Battle_Retreat
;2262:==================
;2263:*/
;2264:void AIEnter_Battle_Retreat(bot_state_t *bs, char *s) {
line 2265
;2265:	BotRecordNodeSwitch(bs, "battle retreat", "", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1032
ARGP4
ADDRGP4 $63
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 2266
;2266:	bs->ainode = AINode_Battle_Retreat;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
ADDRGP4 AINode_Battle_Retreat
ASGNP4
line 2267
;2267:}
LABELV $1031
endproc AIEnter_Battle_Retreat 0 16
export AINode_Battle_Retreat
proc AINode_Battle_Retreat 368 20
line 2274
;2268:
;2269:/*
;2270:==================
;2271:AINode_Battle_Retreat
;2272:==================
;2273:*/
;2274:int AINode_Battle_Retreat(bot_state_t *bs) {
line 2282
;2275:	bot_goal_t goal;
;2276:	aas_entityinfo_t entinfo;
;2277:	bot_moveresult_t moveresult;
;2278:	vec3_t target, dir;
;2279:	float attack_skill, range;
;2280:	int areanum;
;2281:
;2282:	if (BotIsObserver(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 284
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
EQI4 $1034
line 2283
;2283:		AIEnter_Observer(bs, "battle retreat: observer");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1036
ARGP4
ADDRGP4 AIEnter_Observer
CALLV
pop
line 2284
;2284:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1033
JUMPV
LABELV $1034
line 2287
;2285:	}
;2286:	//if in the intermission
;2287:	if (BotIntermission(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 288
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
EQI4 $1037
line 2288
;2288:		AIEnter_Intermission(bs, "battle retreat: intermission");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1039
ARGP4
ADDRGP4 AIEnter_Intermission
CALLV
pop
line 2289
;2289:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1033
JUMPV
LABELV $1037
line 2292
;2290:	}
;2291:	//respawn if dead
;2292:	if (BotIsDead(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 292
ADDRGP4 BotIsDead
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
EQI4 $1040
line 2293
;2293:		AIEnter_Respawn(bs, "battle retreat: bot dead");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1042
ARGP4
ADDRGP4 AIEnter_Respawn
CALLV
pop
line 2294
;2294:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1033
JUMPV
LABELV $1040
line 2297
;2295:	}
;2296:	//if no enemy
;2297:	if (bs->enemy < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1043
line 2298
;2298:		AIEnter_Seek_LTG(bs, "battle retreat: no enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1045
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 2299
;2299:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1033
JUMPV
LABELV $1043
line 2302
;2300:	}
;2301:	//
;2302:	BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 108
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2303
;2303:	if (EntityIsDead(&entinfo)) {
ADDRLP4 108
ARGP4
ADDRLP4 296
ADDRGP4 EntityIsDead
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
EQI4 $1046
line 2304
;2304:		AIEnter_Seek_LTG(bs, "battle retreat: enemy dead");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1048
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 2305
;2305:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1033
JUMPV
LABELV $1046
line 2308
;2306:	}
;2307:	//if there is another better enemy
;2308:	if (BotFindEnemy(bs, bs->enemy)) {
ADDRLP4 300
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 300
INDIRP4
ARGP4
ADDRLP4 300
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 304
ADDRGP4 BotFindEnemy
CALLI4
ASGNI4
ADDRLP4 304
INDIRI4
CNSTI4 0
EQI4 $1049
line 2312
;2309:#ifdef DEBUG
;2310:		BotAI_Print(PRT_MESSAGE, "found new better enemy\n");
;2311:#endif
;2312:	}
LABELV $1049
line 2314
;2313:	//
;2314:	bs->tfl = TFL_DEFAULT;
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
CNSTI4 18616254
ASGNI4
line 2315
;2315:	if (bot_grapple.integer) bs->tfl |= TFL_GRAPPLEHOOK;
ADDRGP4 bot_grapple+12
INDIRI4
CNSTI4 0
EQI4 $1051
ADDRLP4 308
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 308
INDIRP4
ADDRLP4 308
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
LABELV $1051
line 2317
;2316:	//if in lava or slime the bot should be able to get out
;2317:	if (BotInLavaOrSlime(bs)) bs->tfl |= TFL_LAVA|TFL_SLIME;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 312
ADDRGP4 BotInLavaOrSlime
CALLI4
ASGNI4
ADDRLP4 312
INDIRI4
CNSTI4 0
EQI4 $1054
ADDRLP4 316
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 316
INDIRP4
ADDRLP4 316
INDIRP4
INDIRI4
CNSTI4 6291456
BORI4
ASGNI4
LABELV $1054
line 2319
;2318:	//map specific code
;2319:	BotMapScripts(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotMapScripts
CALLV
pop
line 2321
;2320:	//update the attack inventory values
;2321:	BotUpdateBattleInventory(bs, bs->enemy);
ADDRLP4 320
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 320
INDIRP4
ARGP4
ADDRLP4 320
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotUpdateBattleInventory
CALLV
pop
line 2323
;2322:	//if the bot doesn't want to retreat anymore... probably picked up some nice items
;2323:	if (BotWantsToChase(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 324
ADDRGP4 BotWantsToChase
CALLI4
ASGNI4
ADDRLP4 324
INDIRI4
CNSTI4 0
EQI4 $1056
line 2325
;2324:		//empty the goal stack, when chasing, only the enemy is the goal
;2325:		trap_BotEmptyGoalStack(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotEmptyGoalStack
CALLV
pop
line 2327
;2326:		//go chase the enemy
;2327:		AIEnter_Battle_Chase(bs, "battle retreat: wants to chase");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1058
ARGP4
ADDRGP4 AIEnter_Battle_Chase
CALLV
pop
line 2328
;2328:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1033
JUMPV
LABELV $1056
line 2331
;2329:	}
;2330:	//update the last time the enemy was visible
;2331:	if (BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, bs->enemy)) {
ADDRLP4 328
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 328
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 328
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 328
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 328
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 332
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 332
INDIRF4
CNSTF4 0
EQF4 $1059
line 2332
;2332:		bs->enemyvisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6088
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2333
;2333:		VectorCopy(entinfo.origin, target);
ADDRLP4 252
ADDRLP4 108+24
INDIRB
ASGNB 12
line 2335
;2334:		// if not a player enemy
;2335:		if (bs->enemy >= MAX_CLIENTS) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 64
LTI4 $1062
line 2343
;2336:#ifdef MISSIONPACK
;2337:			// if attacking an obelisk
;2338:			if ( bs->enemy == redobelisk.entitynum ||
;2339:				bs->enemy == blueobelisk.entitynum ) {
;2340:				target[2] += 16;
;2341:			}
;2342:#endif
;2343:		}
LABELV $1062
line 2345
;2344:		//update the reachability area and origin if possible
;2345:		areanum = BotPointAreaNum(target);
ADDRLP4 252
ARGP4
ADDRLP4 336
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 248
ADDRLP4 336
INDIRI4
ASGNI4
line 2346
;2346:		if (areanum && trap_AAS_AreaReachability(areanum)) {
ADDRLP4 340
ADDRLP4 248
INDIRI4
ASGNI4
ADDRLP4 340
INDIRI4
CNSTI4 0
EQI4 $1064
ADDRLP4 340
INDIRI4
ARGI4
ADDRLP4 344
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 0
EQI4 $1064
line 2347
;2347:			VectorCopy(target, bs->lastenemyorigin);
ADDRFP4 0
INDIRP4
CNSTI4 6548
ADDP4
ADDRLP4 252
INDIRB
ASGNB 12
line 2348
;2348:			bs->lastenemyareanum = areanum;
ADDRFP4 0
INDIRP4
CNSTI4 6544
ADDP4
ADDRLP4 248
INDIRI4
ASGNI4
line 2349
;2349:		}
LABELV $1064
line 2350
;2350:	}
LABELV $1059
line 2352
;2351:	//if the enemy is NOT visible for 4 seconds
;2352:	if (bs->enemyvisible_time < FloatTime() - 4) {
ADDRFP4 0
INDIRP4
CNSTI4 6088
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1082130432
SUBF4
GEF4 $1066
line 2353
;2353:		AIEnter_Seek_LTG(bs, "battle retreat: lost enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1068
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 2354
;2354:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1033
JUMPV
LABELV $1066
line 2357
;2355:	}
;2356:	//else if the enemy is NOT visible
;2357:	else if (bs->enemyvisible_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6088
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $1069
line 2359
;2358:		//if there is another enemy
;2359:		if (BotFindEnemy(bs, -1)) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 336
ADDRGP4 BotFindEnemy
CALLI4
ASGNI4
ADDRLP4 336
INDIRI4
CNSTI4 0
EQI4 $1071
line 2360
;2360:			AIEnter_Battle_Fight(bs, "battle retreat: another enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1073
ARGP4
ADDRGP4 AIEnter_Battle_Fight
CALLV
pop
line 2361
;2361:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1033
JUMPV
LABELV $1071
line 2363
;2362:		}
;2363:	}
LABELV $1069
line 2365
;2364:	//
;2365:	BotTeamGoals(bs, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotTeamGoals
CALLV
pop
line 2367
;2366:	//use holdable items
;2367:	BotBattleUseItems(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotBattleUseItems
CALLV
pop
line 2369
;2368:	//get the current long term goal while retreating
;2369:	if (!BotLongTermGoal(bs, bs->tfl, qtrue, &goal)) {
ADDRLP4 336
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 336
INDIRP4
ARGP4
ADDRLP4 336
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 340
ADDRGP4 BotLongTermGoal
CALLI4
ASGNI4
ADDRLP4 340
INDIRI4
CNSTI4 0
NEI4 $1074
line 2370
;2370:		AIEnter_Battle_SuicidalFight(bs, "battle retreat: no way out");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1076
ARGP4
ADDRGP4 AIEnter_Battle_SuicidalFight
CALLV
pop
line 2371
;2371:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1033
JUMPV
LABELV $1074
line 2374
;2372:	}
;2373:	//check for nearby goals periodicly
;2374:	if (bs->check_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6092
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $1077
line 2375
;2375:		bs->check_time = FloatTime() + 1;
ADDRFP4 0
INDIRP4
CNSTI4 6092
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2376
;2376:		range = 150;
ADDRLP4 264
CNSTF4 1125515264
ASGNF4
line 2378
;2377:#ifdef CTF
;2378:		if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $1079
line 2380
;2379:			//if carrying a flag the bot shouldn't be distracted too much
;2380:			if (BotCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 344
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 0
EQI4 $1081
line 2381
;2381:				range = 50;
ADDRLP4 264
CNSTF4 1112014848
ASGNF4
LABELV $1081
line 2382
;2382:		}
LABELV $1079
line 2395
;2383:#endif //CTF
;2384:#ifdef MISSIONPACK
;2385:		else if (gametype == GT_1FCTF) {
;2386:			if (Bot1FCTFCarryingFlag(bs))
;2387:				range = 50;
;2388:		}
;2389:		else if (gametype == GT_HARVESTER) {
;2390:			if (BotHarvesterCarryingCubes(bs))
;2391:				range = 80;
;2392:		}
;2393:#endif
;2394:		//
;2395:		if (BotNearbyGoal(bs, bs->tfl, &goal, range)) {
ADDRLP4 344
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 344
INDIRP4
ARGP4
ADDRLP4 344
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 264
INDIRF4
ARGF4
ADDRLP4 348
ADDRGP4 BotNearbyGoal
CALLI4
ASGNI4
ADDRLP4 348
INDIRI4
CNSTI4 0
EQI4 $1083
line 2396
;2396:			trap_BotResetLastAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetLastAvoidReach
CALLV
pop
line 2398
;2397:			//time the bot gets to pick up the nearby goal item
;2398:			bs->nbg_time = FloatTime() + range / 100 + 1;
ADDRFP4 0
INDIRP4
CNSTI4 6072
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 264
INDIRF4
CNSTF4 1120403456
DIVF4
ADDF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2399
;2399:			AIEnter_Battle_NBG(bs, "battle retreat: nbg");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1085
ARGP4
ADDRGP4 AIEnter_Battle_NBG
CALLV
pop
line 2400
;2400:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1033
JUMPV
LABELV $1083
line 2402
;2401:		}
;2402:	}
LABELV $1077
line 2404
;2403:	//initialize the movement state
;2404:	BotSetupForMovement(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 2406
;2405:	//move towards the goal
;2406:	trap_BotMoveToGoal(&moveresult, bs->ms, &goal, bs->tfl);
ADDRLP4 0
ARGP4
ADDRLP4 344
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 344
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 344
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotMoveToGoal
CALLV
pop
line 2408
;2407:	//if the movement failed
;2408:	if (moveresult.failure) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1086
line 2410
;2409:		//reset the avoid reach, otherwise bot is stuck in current area
;2410:		trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 2412
;2411:		//BotAI_Print(PRT_MESSAGE, "movement failure %d\n", moveresult.traveltype);
;2412:		bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6068
ADDP4
CNSTF4 0
ASGNF4
line 2413
;2413:	}
LABELV $1086
line 2415
;2414:	//
;2415:	BotAIBlocked(bs, &moveresult, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotAIBlocked
CALLV
pop
line 2417
;2416:	//choose the best weapon to fight with
;2417:	BotChooseWeapon(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotChooseWeapon
CALLV
pop
line 2419
;2418:	//if the view is fixed for the movement
;2419:	if (moveresult.flags & (MOVERESULT_MOVEMENTVIEW|MOVERESULT_SWIMVIEW)) {
ADDRLP4 0+20
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $1088
line 2420
;2420:		VectorCopy(moveresult.ideal_viewangles, bs->ideal_viewangles);
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ADDRLP4 0+40
INDIRB
ASGNB 12
line 2421
;2421:	}
ADDRGP4 $1089
JUMPV
LABELV $1088
line 2422
;2422:	else if (!(moveresult.flags & MOVERESULT_MOVEMENTVIEWSET)
ADDRLP4 348
CNSTI4 0
ASGNI4
ADDRLP4 0+20
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 348
INDIRI4
NEI4 $1092
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 348
INDIRI4
NEI4 $1092
line 2423
;2423:				&& !(bs->flags & BFL_IDEALVIEWSET) ) {
line 2424
;2424:		attack_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_ATTACK_SKILL, 0, 1);
ADDRFP4 0
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
ADDRLP4 352
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 268
ADDRLP4 352
INDIRF4
ASGNF4
line 2426
;2425:		//if the bot is skilled anough
;2426:		if (attack_skill > 0.3) {
ADDRLP4 268
INDIRF4
CNSTF4 1050253722
LEF4 $1095
line 2427
;2427:			BotAimAtEnemy(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotAimAtEnemy
CALLV
pop
line 2428
;2428:		}
ADDRGP4 $1096
JUMPV
LABELV $1095
line 2429
;2429:		else {
line 2430
;2430:			if (trap_BotMovementViewTarget(bs->ms, &goal, bs->tfl, 300, target)) {
ADDRLP4 356
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 356
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 356
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
CNSTF4 1133903872
ARGF4
ADDRLP4 252
ARGP4
ADDRLP4 360
ADDRGP4 trap_BotMovementViewTarget
CALLI4
ASGNI4
ADDRLP4 360
INDIRI4
CNSTI4 0
EQI4 $1097
line 2431
;2431:				VectorSubtract(target, bs->origin, dir);
ADDRLP4 364
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 272
ADDRLP4 252
INDIRF4
ADDRLP4 364
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 272+4
ADDRLP4 252+4
INDIRF4
ADDRLP4 364
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 272+8
ADDRLP4 252+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2432
;2432:				vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 272
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2433
;2433:			}
ADDRGP4 $1098
JUMPV
LABELV $1097
line 2434
;2434:			else {
line 2435
;2435:				vectoangles(moveresult.movedir, bs->ideal_viewangles);
ADDRLP4 0+28
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2436
;2436:			}
LABELV $1098
line 2437
;2437:			bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 364
ADDRFP4 0
INDIRP4
CNSTI4 6584
ADDP4
ASGNP4
ADDRLP4 364
INDIRP4
CNSTF4 1056964608
ADDRLP4 364
INDIRP4
INDIRF4
MULF4
ASGNF4
line 2438
;2438:		}
LABELV $1096
line 2439
;2439:	}
LABELV $1092
LABELV $1089
line 2441
;2440:	//if the weapon is used for the bot movement
;2441:	if (moveresult.flags & MOVERESULT_MOVEMENTWEAPON) bs->weaponnum = moveresult.weapon;
ADDRLP4 0+20
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1104
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
ADDRLP4 0+24
INDIRI4
ASGNI4
LABELV $1104
line 2443
;2442:	//attack the enemy if possible
;2443:	BotCheckAttack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckAttack
CALLV
pop
line 2445
;2444:	//
;2445:	return qtrue;
CNSTI4 1
RETI4
LABELV $1033
endproc AINode_Battle_Retreat 368 20
export AIEnter_Battle_NBG
proc AIEnter_Battle_NBG 0 16
line 2453
;2446:}
;2447:
;2448:/*
;2449:==================
;2450:AIEnter_Battle_NBG
;2451:==================
;2452:*/
;2453:void AIEnter_Battle_NBG(bot_state_t *bs, char *s) {
line 2454
;2454:	BotRecordNodeSwitch(bs, "battle NBG", "", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1109
ARGP4
ADDRGP4 $63
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 2455
;2455:	bs->ainode = AINode_Battle_NBG;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
ADDRGP4 AINode_Battle_NBG
ASGNP4
line 2456
;2456:}
LABELV $1108
endproc AIEnter_Battle_NBG 0 16
export AINode_Battle_NBG
proc AINode_Battle_NBG 356 20
line 2463
;2457:
;2458:/*
;2459:==================
;2460:AINode_Battle_NBG
;2461:==================
;2462:*/
;2463:int AINode_Battle_NBG(bot_state_t *bs) {
line 2471
;2464:	int areanum;
;2465:	bot_goal_t goal;
;2466:	aas_entityinfo_t entinfo;
;2467:	bot_moveresult_t moveresult;
;2468:	float attack_skill;
;2469:	vec3_t target, dir;
;2470:
;2471:	if (BotIsObserver(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 280
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
EQI4 $1111
line 2472
;2472:		AIEnter_Observer(bs, "battle nbg: observer");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1113
ARGP4
ADDRGP4 AIEnter_Observer
CALLV
pop
line 2473
;2473:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1110
JUMPV
LABELV $1111
line 2476
;2474:	}
;2475:	//if in the intermission
;2476:	if (BotIntermission(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 284
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
EQI4 $1114
line 2477
;2477:		AIEnter_Intermission(bs, "battle nbg: intermission");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1116
ARGP4
ADDRGP4 AIEnter_Intermission
CALLV
pop
line 2478
;2478:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1110
JUMPV
LABELV $1114
line 2481
;2479:	}
;2480:	//respawn if dead
;2481:	if (BotIsDead(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 288
ADDRGP4 BotIsDead
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
EQI4 $1117
line 2482
;2482:		AIEnter_Respawn(bs, "battle nbg: bot dead");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1119
ARGP4
ADDRGP4 AIEnter_Respawn
CALLV
pop
line 2483
;2483:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1110
JUMPV
LABELV $1117
line 2486
;2484:	}
;2485:	//if no enemy
;2486:	if (bs->enemy < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1120
line 2487
;2487:		AIEnter_Seek_NBG(bs, "battle nbg: no enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1122
ARGP4
ADDRGP4 AIEnter_Seek_NBG
CALLV
pop
line 2488
;2488:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1110
JUMPV
LABELV $1120
line 2491
;2489:	}
;2490:	//
;2491:	BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 108
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2492
;2492:	if (EntityIsDead(&entinfo)) {
ADDRLP4 108
ARGP4
ADDRLP4 292
ADDRGP4 EntityIsDead
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
EQI4 $1123
line 2493
;2493:		AIEnter_Seek_NBG(bs, "battle nbg: enemy dead");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1125
ARGP4
ADDRGP4 AIEnter_Seek_NBG
CALLV
pop
line 2494
;2494:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1110
JUMPV
LABELV $1123
line 2497
;2495:	}
;2496:	//
;2497:	bs->tfl = TFL_DEFAULT;
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
CNSTI4 18616254
ASGNI4
line 2498
;2498:	if (bot_grapple.integer) bs->tfl |= TFL_GRAPPLEHOOK;
ADDRGP4 bot_grapple+12
INDIRI4
CNSTI4 0
EQI4 $1126
ADDRLP4 296
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 296
INDIRP4
ADDRLP4 296
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
LABELV $1126
line 2500
;2499:	//if in lava or slime the bot should be able to get out
;2500:	if (BotInLavaOrSlime(bs)) bs->tfl |= TFL_LAVA|TFL_SLIME;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 300
ADDRGP4 BotInLavaOrSlime
CALLI4
ASGNI4
ADDRLP4 300
INDIRI4
CNSTI4 0
EQI4 $1129
ADDRLP4 304
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 304
INDIRP4
ADDRLP4 304
INDIRP4
INDIRI4
CNSTI4 6291456
BORI4
ASGNI4
LABELV $1129
line 2502
;2501:	//
;2502:	if (BotCanAndWantsToRocketJump(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
ADDRGP4 BotCanAndWantsToRocketJump
CALLI4
ASGNI4
ADDRLP4 308
INDIRI4
CNSTI4 0
EQI4 $1131
line 2503
;2503:		bs->tfl |= TFL_ROCKETJUMP;
ADDRLP4 312
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 312
INDIRP4
ADDRLP4 312
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 2504
;2504:	}
LABELV $1131
line 2506
;2505:	//map specific code
;2506:	BotMapScripts(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotMapScripts
CALLV
pop
line 2508
;2507:	//update the last time the enemy was visible
;2508:	if (BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, bs->enemy)) {
ADDRLP4 312
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 312
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 312
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 312
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 312
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 316
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 316
INDIRF4
CNSTF4 0
EQF4 $1133
line 2509
;2509:		bs->enemyvisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6088
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2510
;2510:		VectorCopy(entinfo.origin, target);
ADDRLP4 252
ADDRLP4 108+24
INDIRB
ASGNB 12
line 2512
;2511:		// if not a player enemy
;2512:		if (bs->enemy >= MAX_CLIENTS) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 64
LTI4 $1136
line 2520
;2513:#ifdef MISSIONPACK
;2514:			// if attacking an obelisk
;2515:			if ( bs->enemy == redobelisk.entitynum ||
;2516:				bs->enemy == blueobelisk.entitynum ) {
;2517:				target[2] += 16;
;2518:			}
;2519:#endif
;2520:		}
LABELV $1136
line 2522
;2521:		//update the reachability area and origin if possible
;2522:		areanum = BotPointAreaNum(target);
ADDRLP4 252
ARGP4
ADDRLP4 320
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 248
ADDRLP4 320
INDIRI4
ASGNI4
line 2523
;2523:		if (areanum && trap_AAS_AreaReachability(areanum)) {
ADDRLP4 324
ADDRLP4 248
INDIRI4
ASGNI4
ADDRLP4 324
INDIRI4
CNSTI4 0
EQI4 $1138
ADDRLP4 324
INDIRI4
ARGI4
ADDRLP4 328
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 328
INDIRI4
CNSTI4 0
EQI4 $1138
line 2524
;2524:			VectorCopy(target, bs->lastenemyorigin);
ADDRFP4 0
INDIRP4
CNSTI4 6548
ADDP4
ADDRLP4 252
INDIRB
ASGNB 12
line 2525
;2525:			bs->lastenemyareanum = areanum;
ADDRFP4 0
INDIRP4
CNSTI4 6544
ADDP4
ADDRLP4 248
INDIRI4
ASGNI4
line 2526
;2526:		}
LABELV $1138
line 2527
;2527:	}
LABELV $1133
line 2529
;2528:	//if the bot has no goal or touches the current goal
;2529:	if (!trap_BotGetTopGoal(bs->gs, &goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 320
ADDRGP4 trap_BotGetTopGoal
CALLI4
ASGNI4
ADDRLP4 320
INDIRI4
CNSTI4 0
NEI4 $1140
line 2530
;2530:		bs->nbg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6072
ADDP4
CNSTF4 0
ASGNF4
line 2531
;2531:	}
ADDRGP4 $1141
JUMPV
LABELV $1140
line 2532
;2532:	else if (BotReachedGoal(bs, &goal)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 324
ADDRGP4 BotReachedGoal
CALLI4
ASGNI4
ADDRLP4 324
INDIRI4
CNSTI4 0
EQI4 $1142
line 2533
;2533:		bs->nbg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6072
ADDP4
CNSTF4 0
ASGNF4
line 2534
;2534:	}
LABELV $1142
LABELV $1141
line 2536
;2535:	//
;2536:	if (bs->nbg_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6072
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $1144
line 2538
;2537:		//pop the current goal from the stack
;2538:		trap_BotPopGoal(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotPopGoal
CALLV
pop
line 2540
;2539:		//if the bot still has a goal
;2540:		if (trap_BotGetTopGoal(bs->gs, &goal))
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 328
ADDRGP4 trap_BotGetTopGoal
CALLI4
ASGNI4
ADDRLP4 328
INDIRI4
CNSTI4 0
EQI4 $1146
line 2541
;2541:			AIEnter_Battle_Retreat(bs, "battle nbg: time out");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1148
ARGP4
ADDRGP4 AIEnter_Battle_Retreat
CALLV
pop
ADDRGP4 $1147
JUMPV
LABELV $1146
line 2543
;2542:		else
;2543:			AIEnter_Battle_Fight(bs, "battle nbg: time out");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1148
ARGP4
ADDRGP4 AIEnter_Battle_Fight
CALLV
pop
LABELV $1147
line 2545
;2544:		//
;2545:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1110
JUMPV
LABELV $1144
line 2548
;2546:	}
;2547:	//initialize the movement state
;2548:	BotSetupForMovement(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 2550
;2549:	//move towards the goal
;2550:	trap_BotMoveToGoal(&moveresult, bs->ms, &goal, bs->tfl);
ADDRLP4 0
ARGP4
ADDRLP4 328
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 328
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 328
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotMoveToGoal
CALLV
pop
line 2552
;2551:	//if the movement failed
;2552:	if (moveresult.failure) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1149
line 2554
;2553:		//reset the avoid reach, otherwise bot is stuck in current area
;2554:		trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 2556
;2555:		//BotAI_Print(PRT_MESSAGE, "movement failure %d\n", moveresult.traveltype);
;2556:		bs->nbg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6072
ADDP4
CNSTF4 0
ASGNF4
line 2557
;2557:	}
LABELV $1149
line 2559
;2558:	//
;2559:	BotAIBlocked(bs, &moveresult, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotAIBlocked
CALLV
pop
line 2561
;2560:	//update the attack inventory values
;2561:	BotUpdateBattleInventory(bs, bs->enemy);
ADDRLP4 332
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 332
INDIRP4
ARGP4
ADDRLP4 332
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotUpdateBattleInventory
CALLV
pop
line 2563
;2562:	//choose the best weapon to fight with
;2563:	BotChooseWeapon(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotChooseWeapon
CALLV
pop
line 2565
;2564:	//if the view is fixed for the movement
;2565:	if (moveresult.flags & (MOVERESULT_MOVEMENTVIEW|MOVERESULT_SWIMVIEW)) {
ADDRLP4 0+20
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $1151
line 2566
;2566:		VectorCopy(moveresult.ideal_viewangles, bs->ideal_viewangles);
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ADDRLP4 0+40
INDIRB
ASGNB 12
line 2567
;2567:	}
ADDRGP4 $1152
JUMPV
LABELV $1151
line 2568
;2568:	else if (!(moveresult.flags & MOVERESULT_MOVEMENTVIEWSET)
ADDRLP4 336
CNSTI4 0
ASGNI4
ADDRLP4 0+20
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 336
INDIRI4
NEI4 $1155
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 336
INDIRI4
NEI4 $1155
line 2569
;2569:				&& !(bs->flags & BFL_IDEALVIEWSET)) {
line 2570
;2570:		attack_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_ATTACK_SKILL, 0, 1);
ADDRFP4 0
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
ADDRLP4 340
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 264
ADDRLP4 340
INDIRF4
ASGNF4
line 2572
;2571:		//if the bot is skilled anough and the enemy is visible
;2572:		if (attack_skill > 0.3) {
ADDRLP4 264
INDIRF4
CNSTF4 1050253722
LEF4 $1158
line 2574
;2573:			//&& BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, bs->enemy)
;2574:			BotAimAtEnemy(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotAimAtEnemy
CALLV
pop
line 2575
;2575:		}
ADDRGP4 $1159
JUMPV
LABELV $1158
line 2576
;2576:		else {
line 2577
;2577:			if (trap_BotMovementViewTarget(bs->ms, &goal, bs->tfl, 300, target)) {
ADDRLP4 344
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 344
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 344
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
CNSTF4 1133903872
ARGF4
ADDRLP4 252
ARGP4
ADDRLP4 348
ADDRGP4 trap_BotMovementViewTarget
CALLI4
ASGNI4
ADDRLP4 348
INDIRI4
CNSTI4 0
EQI4 $1160
line 2578
;2578:				VectorSubtract(target, bs->origin, dir);
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 268
ADDRLP4 252
INDIRF4
ADDRLP4 352
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 268+4
ADDRLP4 252+4
INDIRF4
ADDRLP4 352
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 268+8
ADDRLP4 252+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2579
;2579:				vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 268
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2580
;2580:			}
ADDRGP4 $1161
JUMPV
LABELV $1160
line 2581
;2581:			else {
line 2582
;2582:				vectoangles(moveresult.movedir, bs->ideal_viewangles);
ADDRLP4 0+28
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2583
;2583:			}
LABELV $1161
line 2584
;2584:			bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 352
ADDRFP4 0
INDIRP4
CNSTI4 6584
ADDP4
ASGNP4
ADDRLP4 352
INDIRP4
CNSTF4 1056964608
ADDRLP4 352
INDIRP4
INDIRF4
MULF4
ASGNF4
line 2585
;2585:		}
LABELV $1159
line 2586
;2586:	}
LABELV $1155
LABELV $1152
line 2588
;2587:	//if the weapon is used for the bot movement
;2588:	if (moveresult.flags & MOVERESULT_MOVEMENTWEAPON) bs->weaponnum = moveresult.weapon;
ADDRLP4 0+20
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1167
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
ADDRLP4 0+24
INDIRI4
ASGNI4
LABELV $1167
line 2590
;2589:	//attack the enemy if possible
;2590:	BotCheckAttack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckAttack
CALLV
pop
line 2592
;2591:	//
;2592:	return qtrue;
CNSTI4 1
RETI4
LABELV $1110
endproc AINode_Battle_NBG 356 20
bss
export nodeswitch
align 1
LABELV nodeswitch
skip 7344
export numnodeswitches
align 4
LABELV numnodeswitches
skip 4
import BotVoiceChatOnly
import BotVoiceChat
import BotSetTeamMateTaskPreference
import BotGetTeamMateTaskPreference
import BotTeamAI
import AIEnter_Seek_Camp
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
import g_allowDevastator
import g_allowGrapple
import g_CurrentRound
import g_NumRounds
import g_RegenAmmo
import g_RegenHealth
import g_AutoChangeMap
import g_lastmap2
import g_lastmap
import g_randommap
import g_easymap
import g_mapfile
import g_ReverseCTF
import g_GaussRate
import g_GaussSelfDamage
import g_GaussKnockBack
import g_GaussJump
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
import fire_flamer
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
LABELV $1148
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 58
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $1125
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 58
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1122
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $1119
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 58
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1116
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $1113
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 58
byte 1 32
byte 1 111
byte 1 98
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1109
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 78
byte 1 66
byte 1 71
byte 1 0
align 1
LABELV $1085
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 0
align 1
LABELV $1076
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 119
byte 1 97
byte 1 121
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $1073
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 97
byte 1 110
byte 1 111
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $1068
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 108
byte 1 111
byte 1 115
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $1058
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 119
byte 1 97
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $1048
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1045
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $1042
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1039
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $1036
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 111
byte 1 98
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1032
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $1030
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 58
byte 1 32
byte 1 119
byte 1 97
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $1004
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 58
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 0
align 1
LABELV $999
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 58
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $974
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 97
byte 1 0
align 1
LABELV $971
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 58
byte 1 32
byte 1 98
byte 1 101
byte 1 116
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $966
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $963
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 58
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $960
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $957
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 58
byte 1 32
byte 1 111
byte 1 98
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $953
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $951
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 32
byte 1 119
byte 1 97
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $937
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 115
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $932
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 104
byte 1 105
byte 1 116
byte 1 32
byte 1 115
byte 1 111
byte 1 109
byte 1 101
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $927
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 32
byte 1 100
byte 1 101
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $917
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $910
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $901
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $896
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $893
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $890
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 32
byte 1 111
byte 1 98
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $885
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $844
byte 1 108
byte 1 116
byte 1 103
byte 1 32
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 58
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 0
align 1
LABELV $831
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 108
byte 1 116
byte 1 103
byte 1 58
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $815
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 108
byte 1 116
byte 1 103
byte 1 58
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $812
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 108
byte 1 116
byte 1 103
byte 1 58
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $809
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 108
byte 1 116
byte 1 103
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $806
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 108
byte 1 116
byte 1 103
byte 1 58
byte 1 32
byte 1 111
byte 1 98
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $802
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 76
byte 1 84
byte 1 71
byte 1 0
align 1
LABELV $797
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 58
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $760
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 58
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $746
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 58
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $743
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $740
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 58
byte 1 32
byte 1 111
byte 1 98
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $736
byte 1 110
byte 1 111
byte 1 32
byte 1 103
byte 1 111
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $735
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 78
byte 1 66
byte 1 71
byte 1 0
align 1
LABELV $730
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 58
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $679
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 58
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $668
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 58
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $645
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 103
byte 1 111
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $637
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 58
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $634
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $631
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 58
byte 1 32
byte 1 111
byte 1 98
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $627
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $533
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 58
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $525
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $523
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $520
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $510
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $508
byte 1 111
byte 1 98
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 32
byte 1 111
byte 1 98
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $504
byte 1 111
byte 1 98
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $502
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $494
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $463
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
LABELV $460
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 95
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $445
byte 1 111
byte 1 110
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
LABELV $444
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
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $410
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 116
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $409
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $400
byte 1 112
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 95
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $387
byte 1 112
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $386
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 0
align 1
LABELV $353
byte 1 105
byte 1 110
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
LABELV $352
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $343
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 95
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $338
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $330
byte 1 103
byte 1 101
byte 1 116
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 103
byte 1 111
byte 1 116
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $327
byte 1 103
byte 1 101
byte 1 116
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 110
byte 1 111
byte 1 116
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $322
byte 1 103
byte 1 101
byte 1 116
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $315
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 95
byte 1 100
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $312
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $301
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 95
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $298
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
LABELV $297
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $288
byte 1 97
byte 1 99
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 110
byte 1 121
byte 1 95
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $279
byte 1 66
byte 1 111
byte 1 116
byte 1 76
byte 1 111
byte 1 110
byte 1 103
byte 1 84
byte 1 101
byte 1 114
byte 1 109
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 103
byte 1 111
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 97
byte 1 105
byte 1 114
byte 1 0
align 1
LABELV $257
byte 1 97
byte 1 99
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 110
byte 1 121
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $164
byte 1 97
byte 1 99
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 110
byte 1 121
byte 1 95
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $161
byte 1 97
byte 1 99
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 110
byte 1 121
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $135
byte 1 121
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $134
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $65
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 50
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 58
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
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $63
byte 1 0
align 1
LABELV $58
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
