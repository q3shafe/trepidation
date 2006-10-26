export G_ResetHistory
code
proc G_ResetHistory 20 0
file "../g_unlagged.c"
line 10
;1:#include "g_local.h"
;2:
;3:/*
;4:============
;5:G_ResetHistory
;6:
;7:Clear out the given client's history (should be called when the teleport bit is flipped)
;8:============
;9:*/
;10:void G_ResetHistory( gentity_t *ent ) {
line 14
;11:	int		i, time;
;12:
;13:	// fill up the history with data (assume the current position)
;14:	ent->client->historyHead = NUM_CLIENT_HISTORY - 1;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2720
ADDP4
CNSTI4 16
ASGNI4
line 15
;15:	for ( i = ent->client->historyHead, time = level.time; i >= 0; i--, time -= 50 ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2720
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRGP4 level+32
INDIRI4
ASGNI4
ADDRGP4 $59
JUMPV
LABELV $56
line 16
;16:		VectorCopy( ent->r.mins, ent->client->history[i].mins );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2724
ADDP4
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 444
ADDP4
INDIRB
ASGNB 12
line 17
;17:		VectorCopy( ent->r.maxs, ent->client->history[i].maxs );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 12
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2724
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 456
ADDP4
INDIRB
ASGNB 12
line 18
;18:		VectorCopy( ent->r.currentOrigin, ent->client->history[i].currentOrigin );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 16
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2724
ADDP4
ADDP4
CNSTI4 24
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 496
ADDP4
INDIRB
ASGNB 12
line 19
;19:		ent->client->history[i].leveltime = time;
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2724
ADDP4
ADDP4
CNSTI4 36
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 20
;20:	}
LABELV $57
line 15
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
LABELV $59
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $56
line 21
;21:}
LABELV $55
endproc G_ResetHistory 20 0
export G_StoreHistory
proc G_StoreHistory 52 4
line 31
;22:
;23:
;24:/*
;25:============
;26:G_StoreHistory
;27:
;28:Keep track of where the client's been
;29:============
;30:*/
;31:void G_StoreHistory( gentity_t *ent ) {
line 34
;32:	int		head, frametime;
;33:
;34:	frametime = level.time - level.previousTime;
ADDRLP4 4
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+36
INDIRI4
SUBI4
ASGNI4
line 36
;35:
;36:	ent->client->historyHead++;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2720
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
line 37
;37:	if ( ent->client->historyHead >= NUM_CLIENT_HISTORY ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2720
ADDP4
INDIRI4
CNSTI4 17
LTI4 $64
line 38
;38:		ent->client->historyHead = 0;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2720
ADDP4
CNSTI4 0
ASGNI4
line 39
;39:	}
LABELV $64
line 41
;40:
;41:	head = ent->client->historyHead;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2720
ADDP4
INDIRI4
ASGNI4
line 44
;42:
;43:	// store all the collision-detection info and the time
;44:	VectorCopy( ent->r.mins, ent->client->history[head].mins );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 12
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2724
ADDP4
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 444
ADDP4
INDIRB
ASGNB 12
line 45
;45:	VectorCopy( ent->r.maxs, ent->client->history[head].maxs );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 16
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2724
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 456
ADDP4
INDIRB
ASGNB 12
line 46
;46:	VectorCopy( ent->s.pos.trBase, ent->client->history[head].currentOrigin );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
CNSTI4 24
ASGNI4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 20
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2724
ADDP4
ADDP4
ADDRLP4 24
INDIRI4
ADDP4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 47
;47:	SnapVector( ent->client->history[head].currentOrigin );
ADDRLP4 28
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2724
ADDP4
ADDP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 36
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2724
ADDP4
ADDP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 36
INDIRP4
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 44
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2724
ADDP4
ADDP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 44
INDIRP4
ADDRLP4 48
INDIRF4
ASGNF4
line 48
;48:	ent->client->history[head].leveltime = level.time;
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2724
ADDP4
ADDP4
CNSTI4 36
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 49
;49:}
LABELV $61
endproc G_StoreHistory 52 4
proc TimeShiftLerp 20 0
line 60
;50:
;51:
;52:/*
;53:=============
;54:TimeShiftLerp
;55:
;56:Used below to interpolate between two previous vectors
;57:Returns a vector "frac" times the distance between "start" and "end"
;58:=============
;59:*/
;60:static void TimeShiftLerp( float frac, vec3_t start, vec3_t end, vec3_t result ) {
line 69
;61:// From CG_InterpolateEntityPosition in cg_ents.c:
;62:/*
;63:	cent->lerpOrigin[0] = current[0] + f * ( next[0] - current[0] );
;64:	cent->lerpOrigin[1] = current[1] + f * ( next[1] - current[1] );
;65:	cent->lerpOrigin[2] = current[2] + f * ( next[2] - current[2] );
;66:*/
;67:// Making these exactly the same should avoid floating-point error
;68:
;69:	result[0] = start[0] + frac * ( end[0] - start[0] );
ADDRLP4 0
ADDRFP4 4
INDIRP4
INDIRF4
ASGNF4
ADDRFP4 12
INDIRP4
ADDRLP4 0
INDIRF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 70
;70:	result[1] = start[1] + frac * ( end[1] - start[1] );
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRLP4 8
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRFP4 12
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ADDRLP4 8
INDIRF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 71
;71:	result[2] = start[2] + frac * ( end[2] - start[2] );
ADDRLP4 12
CNSTI4 8
ASGNI4
ADDRLP4 16
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRFP4 12
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
ADDRLP4 16
INDIRF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 72
;72:}
LABELV $67
endproc TimeShiftLerp 20 0
export G_TimeShiftClient
proc G_TimeShiftClient 2172 80
line 82
;73:
;74:
;75:/*
;76:=================
;77:G_TimeShiftClient
;78:
;79:Move a client back to where he was at the specified "time"
;80:=================
;81:*/
;82:void G_TimeShiftClient( gentity_t *ent, int time, qboolean debug, gentity_t *debugger ) {
line 117
;83:	int		j, k;
;84:	char msg[2048];
;85:
;86:	// this will dump out the head index, and the time for all the stored positions
;87:/*
;88:	if ( debug ) {
;89:		char	str[MAX_STRING_CHARS];
;90:
;91:		Com_sprintf(str, sizeof(str), "print \"head: %d, %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d\n\"",
;92:			ent->client->historyHead,
;93:			ent->client->history[0].leveltime,
;94:			ent->client->history[1].leveltime,
;95:			ent->client->history[2].leveltime,
;96:			ent->client->history[3].leveltime,
;97:			ent->client->history[4].leveltime,
;98:			ent->client->history[5].leveltime,
;99:			ent->client->history[6].leveltime,
;100:			ent->client->history[7].leveltime,
;101:			ent->client->history[8].leveltime,
;102:			ent->client->history[9].leveltime,
;103:			ent->client->history[10].leveltime,
;104:			ent->client->history[11].leveltime,
;105:			ent->client->history[12].leveltime,
;106:			ent->client->history[13].leveltime,
;107:			ent->client->history[14].leveltime,
;108:			ent->client->history[15].leveltime,
;109:			ent->client->history[16].leveltime);
;110:
;111:		trap_SendServerCommand( debugger - g_entities, str );
;112:	}
;113:*/
;114:
;115:	// find two entries in the history whose times sandwich "time"
;116:	// assumes no two adjacent records have the same timestamp
;117:	j = k = ent->client->historyHead;
ADDRLP4 2056
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2720
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 2056
INDIRI4
ASGNI4
ADDRLP4 0
ADDRLP4 2056
INDIRI4
ASGNI4
LABELV $69
line 118
;118:	do {
line 119
;119:		if ( ent->client->history[j].leveltime <= time )
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2724
ADDP4
ADDP4
CNSTI4 36
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
GTI4 $72
line 120
;120:			break;
ADDRGP4 $71
JUMPV
LABELV $72
line 122
;121:
;122:		k = j;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 123
;123:		j--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 124
;124:		if ( j < 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $74
line 125
;125:			j = NUM_CLIENT_HISTORY - 1;
ADDRLP4 0
CNSTI4 16
ASGNI4
line 126
;126:		}
LABELV $74
line 127
;127:	}
LABELV $70
line 128
;128:	while ( j != ent->client->historyHead );
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2720
ADDP4
INDIRI4
NEI4 $69
LABELV $71
line 131
;129:
;130:	// if we got past the first iteration above, we've sandwiched (or wrapped)
;131:	if ( j != k ) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $76
line 133
;132:		// make sure it doesn't get re-saved
;133:		if ( ent->client->saved.leveltime != level.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 3440
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
EQI4 $78
line 135
;134:			// save the current origin and bounding box
;135:			VectorCopy( ent->r.mins, ent->client->saved.mins );
ADDRLP4 2060
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2060
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 3404
ADDP4
ADDRLP4 2060
INDIRP4
CNSTI4 444
ADDP4
INDIRB
ASGNB 12
line 136
;136:			VectorCopy( ent->r.maxs, ent->client->saved.maxs );
ADDRLP4 2064
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2064
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 3416
ADDP4
ADDRLP4 2064
INDIRP4
CNSTI4 456
ADDP4
INDIRB
ASGNB 12
line 137
;137:			VectorCopy( ent->r.currentOrigin, ent->client->saved.currentOrigin );
ADDRLP4 2068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2068
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 3428
ADDP4
ADDRLP4 2068
INDIRP4
CNSTI4 496
ADDP4
INDIRB
ASGNB 12
line 138
;138:			ent->client->saved.leveltime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 3440
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 139
;139:		}
LABELV $78
line 143
;140:
;141:		// if we haven't wrapped back to the head, we've sandwiched, so
;142:		// we shift the client's position back to where he was at "time"
;143:		if ( j != ent->client->historyHead ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2720
ADDP4
INDIRI4
EQI4 $82
line 144
;144:			float	frac = (float)(time - ent->client->history[j].leveltime) /
ADDRLP4 2064
CNSTI4 40
ASGNI4
ADDRLP4 2068
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2724
ADDP4
ASGNP4
ADDRLP4 2072
CNSTI4 36
ASGNI4
ADDRLP4 2076
ADDRLP4 2064
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 2068
INDIRP4
ADDP4
ADDRLP4 2072
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 2060
ADDRFP4 4
INDIRI4
ADDRLP4 2076
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 2064
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 2068
INDIRP4
ADDP4
ADDRLP4 2072
INDIRI4
ADDP4
INDIRI4
ADDRLP4 2076
INDIRI4
SUBI4
CVIF4 4
DIVF4
ASGNF4
line 148
;145:				(float)(ent->client->history[k].leveltime - ent->client->history[j].leveltime);
;146:
;147:			// interpolate between the two origins to give position at time index "time"
;148:			TimeShiftLerp( frac,
ADDRLP4 2060
INDIRF4
ARGF4
ADDRLP4 2080
CNSTI4 40
ASGNI4
ADDRLP4 2084
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2088
ADDRLP4 2084
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2724
ADDP4
ASGNP4
ADDRLP4 2092
CNSTI4 24
ASGNI4
ADDRLP4 2080
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 2088
INDIRP4
ADDP4
ADDRLP4 2092
INDIRI4
ADDP4
ARGP4
ADDRLP4 2080
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 2088
INDIRP4
ADDP4
ADDRLP4 2092
INDIRI4
ADDP4
ARGP4
ADDRLP4 2084
INDIRP4
CNSTI4 496
ADDP4
ARGP4
ADDRGP4 TimeShiftLerp
CALLV
pop
line 153
;149:				ent->client->history[j].currentOrigin, ent->client->history[k].currentOrigin,
;150:				ent->r.currentOrigin );
;151:
;152:			// lerp these too, just for fun (and ducking)
;153:			TimeShiftLerp( frac,
ADDRLP4 2060
INDIRF4
ARGF4
ADDRLP4 2096
CNSTI4 40
ASGNI4
ADDRLP4 2100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2104
ADDRLP4 2100
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2724
ADDP4
ASGNP4
ADDRLP4 2096
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 2104
INDIRP4
ADDP4
ARGP4
ADDRLP4 2096
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 2104
INDIRP4
ADDP4
ARGP4
ADDRLP4 2100
INDIRP4
CNSTI4 444
ADDP4
ARGP4
ADDRGP4 TimeShiftLerp
CALLV
pop
line 157
;154:				ent->client->history[j].mins, ent->client->history[k].mins,
;155:				ent->r.mins );
;156:
;157:			TimeShiftLerp( frac,
ADDRLP4 2060
INDIRF4
ARGF4
ADDRLP4 2108
CNSTI4 40
ASGNI4
ADDRLP4 2112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2116
ADDRLP4 2112
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2724
ADDP4
ASGNP4
ADDRLP4 2120
CNSTI4 12
ASGNI4
ADDRLP4 2108
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 2116
INDIRP4
ADDP4
ADDRLP4 2120
INDIRI4
ADDP4
ARGP4
ADDRLP4 2108
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 2116
INDIRP4
ADDP4
ADDRLP4 2120
INDIRI4
ADDP4
ARGP4
ADDRLP4 2112
INDIRP4
CNSTI4 456
ADDP4
ARGP4
ADDRGP4 TimeShiftLerp
CALLV
pop
line 161
;158:				ent->client->history[j].maxs, ent->client->history[k].maxs,
;159:				ent->r.maxs );
;160:
;161:			if ( debug && debugger != NULL ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $84
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $84
line 165
;162:				// print some debugging stuff exactly like what the client does
;163:
;164:				// it starts with "Rec:" to let you know it backward-reconciled
;165:				Com_sprintf( msg, sizeof(msg),
ADDRLP4 8
ARGP4
CNSTI4 2048
ARGI4
ADDRGP4 $86
ARGP4
ADDRLP4 2124
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 2124
INDIRI4
ARGI4
ADDRLP4 2128
CNSTI4 40
ASGNI4
ADDRLP4 2132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2136
CNSTI4 524
ASGNI4
ADDRLP4 2140
ADDRLP4 2132
INDIRP4
ADDRLP4 2136
INDIRI4
ADDP4
INDIRP4
CNSTI4 2724
ADDP4
ASGNP4
ADDRLP4 2144
ADDRLP4 2128
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 2140
INDIRP4
ADDP4
ASGNP4
ADDRLP4 2148
CNSTI4 36
ASGNI4
ADDRLP4 2144
INDIRP4
ADDRLP4 2148
INDIRI4
ADDP4
INDIRI4
ARGI4
ADDRLP4 2152
ADDRLP4 2128
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 2140
INDIRP4
ADDP4
ASGNP4
ADDRLP4 2152
INDIRP4
ADDRLP4 2148
INDIRI4
ADDP4
INDIRI4
ARGI4
ADDRLP4 2132
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ARGF4
ADDRLP4 2132
INDIRP4
CNSTI4 500
ADDP4
INDIRF4
ARGF4
ADDRLP4 2132
INDIRP4
CNSTI4 504
ADDP4
INDIRF4
ARGF4
ADDRLP4 2060
INDIRF4
ARGF4
ADDRLP4 2156
CNSTI4 24
ASGNI4
ADDRLP4 2144
INDIRP4
ADDRLP4 2156
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRLP4 2160
CNSTI4 28
ASGNI4
ADDRLP4 2144
INDIRP4
ADDRLP4 2160
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRLP4 2164
CNSTI4 32
ASGNI4
ADDRLP4 2144
INDIRP4
ADDRLP4 2164
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRLP4 2152
INDIRP4
ADDRLP4 2156
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRLP4 2152
INDIRP4
ADDRLP4 2160
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRLP4 2152
INDIRP4
ADDRLP4 2164
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 2168
ADDRFP4 12
INDIRP4
ADDRLP4 2136
INDIRI4
ADDP4
INDIRP4
CNSTI4 3444
ADDP4
INDIRI4
ASGNI4
ADDRGP4 level+32
INDIRI4
ADDRLP4 2168
INDIRI4
ADDI4
ARGI4
ADDRGP4 level+32
INDIRI4
ADDRLP4 2124
INDIRI4
SUBI4
ARGI4
ADDRGP4 level+32
INDIRI4
ADDRLP4 2168
INDIRI4
ADDI4
ADDRLP4 2124
INDIRI4
SUBI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 181
;166:					"print \"^1Rec: time: %d, j: %d, k: %d, origin: %0.2f %0.2f %0.2f\n"
;167:					"^2frac: %0.4f, origin1: %0.2f %0.2f %0.2f, origin2: %0.2f %0.2f %0.2f\n"
;168:					"^7level.time: %d, est time: %d, level.time delta: %d, est real ping: %d\n\"",
;169:					time, ent->client->history[j].leveltime, ent->client->history[k].leveltime,
;170:					ent->r.currentOrigin[0], ent->r.currentOrigin[1], ent->r.currentOrigin[2],
;171:					frac,
;172:					ent->client->history[j].currentOrigin[0],
;173:					ent->client->history[j].currentOrigin[1],
;174:					ent->client->history[j].currentOrigin[2], 
;175:					ent->client->history[k].currentOrigin[0],
;176:					ent->client->history[k].currentOrigin[1],
;177:					ent->client->history[k].currentOrigin[2],
;178:					level.time, level.time + debugger->client->frameOffset,
;179:					level.time - time, level.time + debugger->client->frameOffset - time);
;180:
;181:				trap_SendServerCommand( debugger - g_entities, msg );
ADDRFP4 12
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 182
;182:			}
LABELV $84
line 185
;183:
;184:			// this will recalculate absmin and absmax
;185:			trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 186
;186:		} else {
ADDRGP4 $77
JUMPV
LABELV $82
line 188
;187:			// we wrapped, so grab the earliest
;188:			VectorCopy( ent->client->history[k].currentOrigin, ent->r.currentOrigin );
ADDRLP4 2060
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2060
INDIRP4
CNSTI4 496
ADDP4
CNSTI4 40
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 2060
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2724
ADDP4
ADDP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 189
;189:			VectorCopy( ent->client->history[k].mins, ent->r.mins );
ADDRLP4 2064
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2064
INDIRP4
CNSTI4 444
ADDP4
CNSTI4 40
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 2064
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2724
ADDP4
ADDP4
INDIRB
ASGNB 12
line 190
;190:			VectorCopy( ent->client->history[k].maxs, ent->r.maxs );
ADDRLP4 2068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2068
INDIRP4
CNSTI4 456
ADDP4
CNSTI4 40
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 2068
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2724
ADDP4
ADDP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 193
;191:
;192:			// this will recalculate absmin and absmax
;193:			trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 194
;194:		}
line 195
;195:	}
ADDRGP4 $77
JUMPV
LABELV $76
line 196
;196:	else {
line 203
;197:		// this only happens when the client is using a negative timenudge, because that
;198:		// number is added to the command time
;199:
;200:		// print some debugging stuff exactly like what the client does
;201:
;202:		// it starts with "No rec:" to let you know it didn't backward-reconcile
;203:		if ( debug && debugger != NULL ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $91
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $91
line 204
;204:			Com_sprintf( msg, sizeof(msg),
ADDRLP4 8
ARGP4
CNSTI4 2048
ARGI4
ADDRGP4 $93
ARGP4
ADDRLP4 2060
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 2060
INDIRI4
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 2064
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2068
ADDRLP4 2064
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ASGNF4
ADDRLP4 2068
INDIRF4
ARGF4
ADDRLP4 2072
ADDRLP4 2064
INDIRP4
CNSTI4 500
ADDP4
INDIRF4
ASGNF4
ADDRLP4 2072
INDIRF4
ARGF4
ADDRLP4 2076
ADDRLP4 2064
INDIRP4
CNSTI4 504
ADDP4
INDIRF4
ASGNF4
ADDRLP4 2076
INDIRF4
ARGF4
CNSTF4 0
ARGF4
ADDRLP4 2068
INDIRF4
ARGF4
ADDRLP4 2072
INDIRF4
ARGF4
ADDRLP4 2076
INDIRF4
ARGF4
ADDRLP4 2068
INDIRF4
ARGF4
ADDRLP4 2072
INDIRF4
ARGF4
ADDRLP4 2076
INDIRF4
ARGF4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 2080
ADDRFP4 12
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 3444
ADDP4
INDIRI4
ASGNI4
ADDRGP4 level+32
INDIRI4
ADDRLP4 2080
INDIRI4
ADDI4
ARGI4
ADDRGP4 level+32
INDIRI4
ADDRLP4 2060
INDIRI4
SUBI4
ARGI4
ADDRGP4 level+32
INDIRI4
ADDRLP4 2080
INDIRI4
ADDI4
ADDRLP4 2060
INDIRI4
SUBI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 216
;205:				"print \"^1No rec: time: %d, j: %d, k: %d, origin: %0.2f %0.2f %0.2f\n"
;206:				"^2frac: %0.4f, origin1: %0.2f %0.2f %0.2f, origin2: %0.2f %0.2f %0.2f\n"
;207:				"^7level.time: %d, est time: %d, level.time delta: %d, est real ping: %d\n\"",
;208:				time, level.time, level.time,
;209:				ent->r.currentOrigin[0], ent->r.currentOrigin[1], ent->r.currentOrigin[2],
;210:				0.0f,
;211:				ent->r.currentOrigin[0], ent->r.currentOrigin[1], ent->r.currentOrigin[2], 
;212:				ent->r.currentOrigin[0], ent->r.currentOrigin[1], ent->r.currentOrigin[2],
;213:				level.time, level.time + debugger->client->frameOffset,
;214:				level.time - time, level.time + debugger->client->frameOffset - time);
;215:
;216:			trap_SendServerCommand( debugger - g_entities, msg );
ADDRFP4 12
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 876
DIVI4
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 217
;217:		}
LABELV $91
line 218
;218:	}
LABELV $77
line 219
;219:}
LABELV $68
endproc G_TimeShiftClient 2172 80
export G_TimeShiftAllClients
proc G_TimeShiftAllClients 36 16
line 230
;220:
;221:
;222:/*
;223:=====================
;224:G_TimeShiftAllClients
;225:
;226:Move ALL clients back to where they were at the specified "time",
;227:except for "skip"
;228:=====================
;229:*/
;230:void G_TimeShiftAllClients( int time, gentity_t *skip ) {
line 233
;231:	int			i;
;232:	gentity_t	*ent;
;233:	qboolean debug = ( skip != NULL && skip->client && 
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
CNSTU4 0
ASGNU4
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $102
ADDRLP4 24
ADDRLP4 16
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $102
ADDRLP4 24
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
CNSTI4 0
EQI4 $102
ADDRLP4 16
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 7
NEI4 $102
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $103
JUMPV
LABELV $102
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $103
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 237
;234:			skip->client->pers.debugDelag && skip->s.weapon == WP_RAILGUN );
;235:
;236:	// for every client
;237:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 238
;238:	for ( i = 0; i < MAX_CLIENTS; i++, ent++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $104
line 239
;239:		if ( ent->client && ent->inuse && ent->client->sess.sessionTeam < TEAM_SPECTATOR && ent != skip ) {
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $108
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $108
ADDRLP4 32
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
GEI4 $108
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
EQU4 $108
line 240
;240:			G_TimeShiftClient( ent, time, debug, skip );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_TimeShiftClient
CALLV
pop
line 241
;241:		}
LABELV $108
line 242
;242:	}
LABELV $105
line 238
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 876
ADDP4
ASGNP4
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $104
line 243
;243:}
LABELV $100
endproc G_TimeShiftAllClients 36 16
lit
align 4
LABELV $111
byte 4 0
byte 4 0
byte 4 2
byte 4 4
byte 4 0
byte 4 0
byte 4 8
byte 4 16
byte 4 0
byte 4 0
byte 4 0
skip 4
export G_DoTimeShiftFor
code
proc G_DoTimeShiftFor 76 8
line 253
;244:
;245:
;246:/*
;247:================
;248:G_DoTimeShiftFor
;249:
;250:Decide what time to shift everyone back to, and do it
;251:================
;252:*/
;253:void G_DoTimeShiftFor( gentity_t *ent ) {	
line 255
;254:#ifndef MISSIONPACK
;255:	int wpflags[WP_NUM_WEAPONS] = { 0, 0, 2, 4, 0, 0, 8, 16, 0, 0, 0 };
ADDRLP4 0
ADDRGP4 $111
INDIRB
ASGNB 48
line 259
;256:#else
;257:	int wpflags[WP_NUM_WEAPONS] = { 0, 0, 2, 4, 0, 0, 8, 16, 0, 0, 0, 32, 0, 64 };
;258:#endif
;259:	int wpflag = wpflags[ent->client->ps.weapon];
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ASGNI4
line 263
;260:	int time;
;261:
;262:	// don't time shift for mistakes or bots
;263:	if ( !ent->inuse || !ent->client || (ent->r.svFlags & SVF_BOT) ) {
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $115
ADDRLP4 56
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $115
ADDRLP4 56
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 60
INDIRI4
EQI4 $112
LABELV $115
line 264
;264:		return;
ADDRGP4 $110
JUMPV
LABELV $112
line 268
;265:	}
;266:
;267:	// if it's enabled server-side and the client wants it or wants it for this weapon
;268:	if ( g_delagHitscan.integer && ( ent->client->pers.delag & 1 || ent->client->pers.delag & wpflag ) ) {
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 g_delagHitscan+12
INDIRI4
ADDRLP4 64
INDIRI4
EQI4 $116
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 64
INDIRI4
NEI4 $119
ADDRLP4 68
INDIRI4
ADDRLP4 48
INDIRI4
BANDI4
ADDRLP4 64
INDIRI4
EQI4 $116
LABELV $119
line 270
;269:		// do the full lag compensation, except what the client nudges
;270:		time = ent->client->attackTime + ent->client->pers.cmdTimeNudge;
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 52
ADDRLP4 72
INDIRP4
CNSTI4 2716
ADDP4
INDIRI4
ADDRLP4 72
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ADDI4
ASGNI4
line 271
;271:	}
ADDRGP4 $117
JUMPV
LABELV $116
line 272
;272:	else {
line 274
;273:		// do just 50ms
;274:		time = level.previousTime + ent->client->frameOffset;
ADDRLP4 52
ADDRGP4 level+36
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 3444
ADDP4
INDIRI4
ADDI4
ASGNI4
line 275
;275:	}
LABELV $117
line 277
;276:
;277:	G_TimeShiftAllClients( time, ent );
ADDRLP4 52
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_TimeShiftAllClients
CALLV
pop
line 278
;278:}
LABELV $110
endproc G_DoTimeShiftFor 76 8
export G_UnTimeShiftClient
proc G_UnTimeShiftClient 12 4
line 288
;279:
;280:
;281:/*
;282:===================
;283:G_UnTimeShiftClient
;284:
;285:Move a client back to where he was before the time shift
;286:===================
;287:*/
;288:void G_UnTimeShiftClient( gentity_t *ent ) {
line 290
;289:	// if it was saved
;290:	if ( ent->client->saved.leveltime == level.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 3440
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
NEI4 $122
line 292
;291:		// move it back
;292:		VectorCopy( ent->client->saved.mins, ent->r.mins );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 3404
ADDP4
INDIRB
ASGNB 12
line 293
;293:		VectorCopy( ent->client->saved.maxs, ent->r.maxs );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 456
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 3416
ADDP4
INDIRB
ASGNB 12
line 294
;294:		VectorCopy( ent->client->saved.currentOrigin, ent->r.currentOrigin );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 3428
ADDP4
INDIRB
ASGNB 12
line 295
;295:		ent->client->saved.leveltime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 3440
ADDP4
CNSTI4 0
ASGNI4
line 298
;296:
;297:		// this will recalculate absmin and absmax
;298:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 299
;299:	}
LABELV $122
line 300
;300:}
LABELV $121
endproc G_UnTimeShiftClient 12 4
export G_UnTimeShiftAllClients
proc G_UnTimeShiftAllClients 16 4
line 311
;301:
;302:
;303:/*
;304:=======================
;305:G_UnTimeShiftAllClients
;306:
;307:Move ALL the clients back to where they were before the time shift,
;308:except for "skip"
;309:=======================
;310:*/
;311:void G_UnTimeShiftAllClients( gentity_t *skip ) {
line 315
;312:	int			i;
;313:	gentity_t	*ent;
;314:
;315:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 316
;316:	for ( i = 0; i < MAX_CLIENTS; i++, ent++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $126
line 317
;317:		if ( ent->client && ent->inuse && ent->client->sess.sessionTeam < TEAM_SPECTATOR && ent != skip ) {
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $130
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $130
ADDRLP4 12
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
GEI4 $130
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $130
line 318
;318:			G_UnTimeShiftClient( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_UnTimeShiftClient
CALLV
pop
line 319
;319:		}
LABELV $130
line 320
;320:	}
LABELV $127
line 316
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 876
ADDP4
ASGNP4
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $126
line 321
;321:}
LABELV $125
endproc G_UnTimeShiftAllClients 16 4
export G_UndoTimeShiftFor
proc G_UndoTimeShiftFor 8 4
line 331
;322:
;323:
;324:/*
;325:==================
;326:G_UndoTimeShiftFor
;327:
;328:Put everyone except for this client back where they were
;329:==================
;330:*/
;331:void G_UndoTimeShiftFor( gentity_t *ent ) {
line 334
;332:
;333:	// don't un-time shift for mistakes or bots
;334:	if ( !ent->inuse || !ent->client || (ent->r.svFlags & SVF_BOT) ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $136
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $136
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 4
INDIRI4
EQI4 $133
LABELV $136
line 335
;335:		return;
ADDRGP4 $132
JUMPV
LABELV $133
line 338
;336:	}
;337:
;338:	G_UnTimeShiftAllClients( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UnTimeShiftAllClients
CALLV
pop
line 339
;339:}
LABELV $132
endproc G_UndoTimeShiftFor 8 4
export G_PredictPlayerClipVelocity
proc G_PredictPlayerClipVelocity 28 0
line 352
;340:
;341:
;342:/*
;343:===========================
;344:G_PredictPlayerClipVelocity
;345:
;346:Slide on the impacting surface
;347:===========================
;348:*/
;349:
;350:#define	OVERCLIP		1.001f
;351:
;352:void G_PredictPlayerClipVelocity( vec3_t in, vec3_t normal, vec3_t out ) {
line 356
;353:	float	backoff;
;354:
;355:	// find the magnitude of the vector "in" along "normal"
;356:	backoff = DotProduct (in, normal);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 4
ASGNI4
ADDRLP4 16
CNSTI4 8
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 8
INDIRP4
INDIRF4
MULF4
ADDRLP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 359
;357:
;358:	// tilt the plane a bit to avoid floating-point error issues
;359:	if ( backoff < 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $138
line 360
;360:		backoff *= OVERCLIP;
ADDRLP4 0
CNSTF4 1065361605
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 361
;361:	} else {
ADDRGP4 $139
JUMPV
LABELV $138
line 362
;362:		backoff /= OVERCLIP;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1065361605
DIVF4
ASGNF4
line 363
;363:	}
LABELV $139
line 366
;364:
;365:	// slide along
;366:	VectorMA( in, -backoff, normal, out );
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
ADDRLP4 20
CNSTI4 4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24
CNSTI4 8
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 367
;367:}
LABELV $137
endproc G_PredictPlayerClipVelocity 28 0
lit
align 4
LABELV $141
byte 4 0
byte 4 0
byte 4 1065353216
export G_PredictPlayerSlideMove
code
proc G_PredictPlayerSlideMove 312 28
line 379
;368:
;369:
;370:/*
;371:========================
;372:G_PredictPlayerSlideMove
;373:
;374:Advance the given entity frametime seconds, sliding as appropriate
;375:========================
;376:*/
;377:#define	MAX_CLIP_PLANES	5
;378:
;379:qboolean G_PredictPlayerSlideMove( gentity_t *ent, float frametime ) {
line 394
;380:	int			bumpcount, numbumps;
;381:	vec3_t		dir;
;382:	float		d;
;383:	int			numplanes;
;384:	vec3_t		planes[MAX_CLIP_PLANES];
;385:	vec3_t		primal_velocity, velocity, origin;
;386:	vec3_t		clipVelocity;
;387:	int			i, j, k;
;388:	trace_t	trace;
;389:	vec3_t		end;
;390:	float		time_left;
;391:	float		into;
;392:	vec3_t		endVelocity;
;393:	vec3_t		endClipVelocity;
;394:	vec3_t		worldUp = { 0.0f, 0.0f, 1.0f };
ADDRLP4 248
ADDRGP4 $141
INDIRB
ASGNB 12
line 396
;395:	
;396:	numbumps = 4;
ADDRLP4 232
CNSTI4 4
ASGNI4
line 398
;397:
;398:	VectorCopy( ent->s.pos.trDelta, primal_velocity );
ADDRLP4 236
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 399
;399:	VectorCopy( primal_velocity, velocity );
ADDRLP4 76
ADDRLP4 236
INDIRB
ASGNB 12
line 400
;400:	VectorCopy( ent->s.pos.trBase, origin );
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 402
;401:
;402:	VectorCopy( velocity, endVelocity );
ADDRLP4 140
ADDRLP4 76
INDIRB
ASGNB 12
line 404
;403:
;404:	time_left = frametime;
ADDRLP4 212
ADDRFP4 4
INDIRF4
ASGNF4
line 406
;405:
;406:	numplanes = 0;
ADDRLP4 108
CNSTI4 0
ASGNI4
line 408
;407:
;408:	for ( bumpcount = 0; bumpcount < numbumps; bumpcount++ ) {
ADDRLP4 228
CNSTI4 0
ASGNI4
ADDRGP4 $145
JUMPV
LABELV $142
line 411
;409:
;410:		// calculate position we are trying to move to
;411:		VectorMA( origin, time_left, velocity, end );
ADDRLP4 216
ADDRLP4 112
INDIRF4
ADDRLP4 76
INDIRF4
ADDRLP4 212
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 216+4
ADDRLP4 112+4
INDIRF4
ADDRLP4 76+4
INDIRF4
ADDRLP4 212
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 216+8
ADDRLP4 112+8
INDIRF4
ADDRLP4 76+8
INDIRF4
ADDRLP4 212
INDIRF4
MULF4
ADDF4
ASGNF4
line 414
;412:
;413:		// see if we can make it there
;414:		trap_Trace( &trace, origin, ent->r.mins, ent->r.maxs, end, ent->s.number, ent->clipmask );
ADDRLP4 152
ARGP4
ADDRLP4 112
ARGP4
ADDRLP4 264
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 264
INDIRP4
CNSTI4 444
ADDP4
ARGP4
ADDRLP4 264
INDIRP4
CNSTI4 456
ADDP4
ARGP4
ADDRLP4 216
ARGP4
ADDRLP4 264
INDIRP4
INDIRI4
ARGI4
ADDRLP4 264
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 416
;415:
;416:		if (trace.allsolid) {
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $152
line 418
;417:			// entity is completely trapped in another solid
;418:			VectorClear( velocity );
ADDRLP4 268
CNSTF4 0
ASGNF4
ADDRLP4 76+8
ADDRLP4 268
INDIRF4
ASGNF4
ADDRLP4 76+4
ADDRLP4 268
INDIRF4
ASGNF4
ADDRLP4 76
ADDRLP4 268
INDIRF4
ASGNF4
line 419
;419:			VectorCopy( origin, ent->s.pos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 112
INDIRB
ASGNB 12
line 420
;420:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $140
JUMPV
LABELV $152
line 423
;421:		}
;422:
;423:		if (trace.fraction > 0) {
ADDRLP4 152+8
INDIRF4
CNSTF4 0
LEF4 $156
line 425
;424:			// actually covered some distance
;425:			VectorCopy( trace.endpos, origin );
ADDRLP4 112
ADDRLP4 152+12
INDIRB
ASGNB 12
line 426
;426:		}
LABELV $156
line 428
;427:
;428:		if (trace.fraction == 1) {
ADDRLP4 152+8
INDIRF4
CNSTF4 1065353216
NEF4 $160
line 429
;429:			break;		// moved the entire distance
ADDRGP4 $144
JUMPV
LABELV $160
line 432
;430:		}
;431:
;432:		time_left -= time_left * trace.fraction;
ADDRLP4 212
ADDRLP4 212
INDIRF4
ADDRLP4 212
INDIRF4
ADDRLP4 152+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 434
;433:
;434:		if ( numplanes >= MAX_CLIP_PLANES ) {
ADDRLP4 108
INDIRI4
CNSTI4 5
LTI4 $164
line 436
;435:			// this shouldn't really happen
;436:			VectorClear( velocity );
ADDRLP4 272
CNSTF4 0
ASGNF4
ADDRLP4 76+8
ADDRLP4 272
INDIRF4
ASGNF4
ADDRLP4 76+4
ADDRLP4 272
INDIRF4
ASGNF4
ADDRLP4 76
ADDRLP4 272
INDIRF4
ASGNF4
line 437
;437:			VectorCopy( origin, ent->s.pos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 112
INDIRB
ASGNB 12
line 438
;438:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $140
JUMPV
LABELV $164
line 446
;439:		}
;440:
;441:		//
;442:		// if this is the same plane we hit before, nudge velocity
;443:		// out along it, which fixes some epsilon issues with
;444:		// non-axial planes
;445:		//
;446:		for ( i = 0; i < numplanes; i++ ) {
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRGP4 $171
JUMPV
LABELV $168
line 447
;447:			if ( DotProduct( trace.plane.normal, planes[i] ) > 0.99 ) {
ADDRLP4 272
CNSTI4 12
ADDRLP4 92
INDIRI4
MULI4
ASGNI4
ADDRLP4 152+24
INDIRF4
ADDRLP4 272
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 152+24+4
INDIRF4
ADDRLP4 272
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 152+24+8
INDIRF4
ADDRLP4 272
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1065185444
LEF4 $172
line 448
;448:				VectorAdd( trace.plane.normal, velocity, velocity );
ADDRLP4 76
ADDRLP4 152+24
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
ASGNF4
ADDRLP4 76+4
ADDRLP4 152+24+4
INDIRF4
ADDRLP4 76+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 76+8
ADDRLP4 152+24+8
INDIRF4
ADDRLP4 76+8
INDIRF4
ADDF4
ASGNF4
line 449
;449:				break;
ADDRGP4 $170
JUMPV
LABELV $172
line 451
;450:			}
;451:		}
LABELV $169
line 446
ADDRLP4 92
ADDRLP4 92
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $171
ADDRLP4 92
INDIRI4
ADDRLP4 108
INDIRI4
LTI4 $168
LABELV $170
line 453
;452:
;453:		if ( i < numplanes ) {
ADDRLP4 92
INDIRI4
ADDRLP4 108
INDIRI4
GEI4 $190
line 454
;454:			continue;
ADDRGP4 $143
JUMPV
LABELV $190
line 457
;455:		}
;456:
;457:		VectorCopy( trace.plane.normal, planes[numplanes] );
CNSTI4 12
ADDRLP4 108
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ADDRLP4 152+24
INDIRB
ASGNB 12
line 458
;458:		numplanes++;
ADDRLP4 108
ADDRLP4 108
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 465
;459:
;460:		//
;461:		// modify velocity so it parallels all of the clip planes
;462:		//
;463:
;464:		// find a plane that it enters
;465:		for ( i = 0; i < numplanes; i++ ) {
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRGP4 $196
JUMPV
LABELV $193
line 466
;466:			into = DotProduct( velocity, planes[i] );
ADDRLP4 272
CNSTI4 12
ADDRLP4 92
INDIRI4
MULI4
ASGNI4
ADDRLP4 208
ADDRLP4 76
INDIRF4
ADDRLP4 272
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 76+4
INDIRF4
ADDRLP4 272
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 76+8
INDIRF4
ADDRLP4 272
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 467
;467:			if ( into >= 0.1 ) {
ADDRLP4 208
INDIRF4
CNSTF4 1036831949
LTF4 $201
line 468
;468:				continue;		// move doesn't interact with the plane
ADDRGP4 $194
JUMPV
LABELV $201
line 472
;469:			}
;470:
;471:			// slide along the plane
;472:			G_PredictPlayerClipVelocity( velocity, planes[i], clipVelocity );
ADDRLP4 76
ARGP4
CNSTI4 12
ADDRLP4 92
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 G_PredictPlayerClipVelocity
CALLV
pop
line 475
;473:
;474:			// slide along the plane
;475:			G_PredictPlayerClipVelocity( endVelocity, planes[i], endClipVelocity );
ADDRLP4 140
ARGP4
CNSTI4 12
ADDRLP4 92
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 128
ARGP4
ADDRGP4 G_PredictPlayerClipVelocity
CALLV
pop
line 478
;476:
;477:			// see if there is a second plane that the new move enters
;478:			for ( j = 0; j < numplanes; j++ ) {
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRGP4 $206
JUMPV
LABELV $203
line 479
;479:				if ( j == i ) {
ADDRLP4 88
INDIRI4
ADDRLP4 92
INDIRI4
NEI4 $207
line 480
;480:					continue;
ADDRGP4 $204
JUMPV
LABELV $207
line 483
;481:				}
;482:
;483:				if ( DotProduct( clipVelocity, planes[j] ) >= 0.1 ) {
ADDRLP4 276
CNSTI4 12
ADDRLP4 88
INDIRI4
MULI4
ASGNI4
ADDRLP4 64
INDIRF4
ADDRLP4 276
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 276
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 276
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1036831949
LTF4 $209
line 484
;484:					continue;		// move doesn't interact with the plane
ADDRGP4 $204
JUMPV
LABELV $209
line 488
;485:				}
;486:
;487:				// try clipping the move to the plane
;488:				G_PredictPlayerClipVelocity( clipVelocity, planes[j], clipVelocity );
ADDRLP4 64
ARGP4
CNSTI4 12
ADDRLP4 88
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 G_PredictPlayerClipVelocity
CALLV
pop
line 489
;489:				G_PredictPlayerClipVelocity( endClipVelocity, planes[j], endClipVelocity );
ADDRLP4 128
ARGP4
CNSTI4 12
ADDRLP4 88
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 128
ARGP4
ADDRGP4 G_PredictPlayerClipVelocity
CALLV
pop
line 492
;490:
;491:				// see if it goes back into the first clip plane
;492:				if ( DotProduct( clipVelocity, planes[i] ) >= 0 ) {
ADDRLP4 280
CNSTI4 12
ADDRLP4 92
INDIRI4
MULI4
ASGNI4
ADDRLP4 64
INDIRF4
ADDRLP4 280
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 280
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 280
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 0
LTF4 $215
line 493
;493:					continue;
ADDRGP4 $204
JUMPV
LABELV $215
line 497
;494:				}
;495:
;496:				// slide the original velocity along the crease
;497:				CrossProduct( planes[i], planes[j], dir );
ADDRLP4 284
CNSTI4 12
ASGNI4
ADDRLP4 284
INDIRI4
ADDRLP4 92
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 284
INDIRI4
ADDRLP4 88
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 96
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 498
;498:				VectorNormalize( dir );
ADDRLP4 96
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 499
;499:				d = DotProduct( dir, velocity );
ADDRLP4 124
ADDRLP4 96
INDIRF4
ADDRLP4 76
INDIRF4
MULF4
ADDRLP4 96+4
INDIRF4
ADDRLP4 76+4
INDIRF4
MULF4
ADDF4
ADDRLP4 96+8
INDIRF4
ADDRLP4 76+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 500
;500:				VectorScale( dir, d, clipVelocity );
ADDRLP4 64
ADDRLP4 96
INDIRF4
ADDRLP4 124
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 96+4
INDIRF4
ADDRLP4 124
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 96+8
INDIRF4
ADDRLP4 124
INDIRF4
MULF4
ASGNF4
line 502
;501:
;502:				CrossProduct( planes[i], planes[j], dir );
ADDRLP4 292
CNSTI4 12
ASGNI4
ADDRLP4 292
INDIRI4
ADDRLP4 92
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 292
INDIRI4
ADDRLP4 88
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 96
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 503
;503:				VectorNormalize( dir );
ADDRLP4 96
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 504
;504:				d = DotProduct( dir, endVelocity );
ADDRLP4 124
ADDRLP4 96
INDIRF4
ADDRLP4 140
INDIRF4
MULF4
ADDRLP4 96+4
INDIRF4
ADDRLP4 140+4
INDIRF4
MULF4
ADDF4
ADDRLP4 96+8
INDIRF4
ADDRLP4 140+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 505
;505:				VectorScale( dir, d, endClipVelocity );
ADDRLP4 128
ADDRLP4 96
INDIRF4
ADDRLP4 124
INDIRF4
MULF4
ASGNF4
ADDRLP4 128+4
ADDRLP4 96+4
INDIRF4
ADDRLP4 124
INDIRF4
MULF4
ASGNF4
ADDRLP4 128+8
ADDRLP4 96+8
INDIRF4
ADDRLP4 124
INDIRF4
MULF4
ASGNF4
line 508
;506:
;507:				// see if there is a third plane the the new move enters
;508:				for ( k = 0; k < numplanes; k++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $240
JUMPV
LABELV $237
line 509
;509:					if ( k == i || k == j ) {
ADDRLP4 0
INDIRI4
ADDRLP4 92
INDIRI4
EQI4 $243
ADDRLP4 0
INDIRI4
ADDRLP4 88
INDIRI4
NEI4 $241
LABELV $243
line 510
;510:						continue;
ADDRGP4 $238
JUMPV
LABELV $241
line 513
;511:					}
;512:
;513:					if ( DotProduct( clipVelocity, planes[k] ) >= 0.1 ) {
ADDRLP4 304
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 64
INDIRF4
ADDRLP4 304
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 304
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 304
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1036831949
LTF4 $244
line 514
;514:						continue;		// move doesn't interact with the plane
ADDRGP4 $238
JUMPV
LABELV $244
line 518
;515:					}
;516:
;517:					// stop dead at a tripple plane interaction
;518:					VectorClear( velocity );
ADDRLP4 308
CNSTF4 0
ASGNF4
ADDRLP4 76+8
ADDRLP4 308
INDIRF4
ASGNF4
ADDRLP4 76+4
ADDRLP4 308
INDIRF4
ASGNF4
ADDRLP4 76
ADDRLP4 308
INDIRF4
ASGNF4
line 519
;519:					VectorCopy( origin, ent->s.pos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 112
INDIRB
ASGNB 12
line 520
;520:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $140
JUMPV
LABELV $238
line 508
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $240
ADDRLP4 0
INDIRI4
ADDRLP4 108
INDIRI4
LTI4 $237
line 522
;521:				}
;522:			}
LABELV $204
line 478
ADDRLP4 88
ADDRLP4 88
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $206
ADDRLP4 88
INDIRI4
ADDRLP4 108
INDIRI4
LTI4 $203
line 525
;523:
;524:			// if we have fixed all interactions, try another move
;525:			VectorCopy( clipVelocity, velocity );
ADDRLP4 76
ADDRLP4 64
INDIRB
ASGNB 12
line 526
;526:			VectorCopy( endClipVelocity, endVelocity );
ADDRLP4 140
ADDRLP4 128
INDIRB
ASGNB 12
line 527
;527:			break;
ADDRGP4 $195
JUMPV
LABELV $194
line 465
ADDRLP4 92
ADDRLP4 92
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $196
ADDRLP4 92
INDIRI4
ADDRLP4 108
INDIRI4
LTI4 $193
LABELV $195
line 529
;528:		}
;529:	}
LABELV $143
line 408
ADDRLP4 228
ADDRLP4 228
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $145
ADDRLP4 228
INDIRI4
ADDRLP4 232
INDIRI4
LTI4 $142
LABELV $144
line 531
;530:
;531:	VectorCopy( endVelocity, velocity );
ADDRLP4 76
ADDRLP4 140
INDIRB
ASGNB 12
line 532
;532:	VectorCopy( origin, ent->s.pos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 112
INDIRB
ASGNB 12
line 534
;533:
;534:	return (bumpcount != 0);
ADDRLP4 228
INDIRI4
CNSTI4 0
EQI4 $253
ADDRLP4 260
CNSTI4 1
ASGNI4
ADDRGP4 $254
JUMPV
LABELV $253
ADDRLP4 260
CNSTI4 0
ASGNI4
LABELV $254
ADDRLP4 260
INDIRI4
RETI4
LABELV $140
endproc G_PredictPlayerSlideMove 312 28
export G_PredictPlayerStepSlideMove
proc G_PredictPlayerStepSlideMove 148 28
line 547
;535:}
;536:
;537:
;538:/*
;539:============================
;540:G_PredictPlayerStepSlideMove
;541:
;542:Advance the given entity frametime seconds, stepping and sliding as appropriate
;543:============================
;544:*/
;545:#define	STEPSIZE 18
;546:
;547:void G_PredictPlayerStepSlideMove( gentity_t *ent, float frametime ) {
line 553
;548:	vec3_t start_o, start_v, down_o, down_v;
;549:	vec3_t down, up;
;550:	trace_t trace;
;551:	float stepSize;
;552:
;553:	VectorCopy (ent->s.pos.trBase, start_o);
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 554
;554:	VectorCopy (ent->s.pos.trDelta, start_v);
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 556
;555:
;556:	if ( !G_PredictPlayerSlideMove( ent, frametime ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 132
ADDRGP4 G_PredictPlayerSlideMove
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 0
NEI4 $256
line 558
;557:		// not clipped, so forget stepping
;558:		return;
ADDRGP4 $255
JUMPV
LABELV $256
line 561
;559:	}
;560:
;561:	VectorCopy( ent->s.pos.trBase, down_o);
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 562
;562:	VectorCopy( ent->s.pos.trDelta, down_v);
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 564
;563:
;564:	VectorCopy (start_o, up);
ADDRLP4 80
ADDRLP4 56
INDIRB
ASGNB 12
line 565
;565:	up[2] += STEPSIZE;
ADDRLP4 80+8
ADDRLP4 80+8
INDIRF4
CNSTF4 1099956224
ADDF4
ASGNF4
line 568
;566:
;567:	// test the player position if they were a stepheight higher
;568:	trap_Trace( &trace, start_o, ent->r.mins, ent->r.maxs, up, ent->s.number, ent->clipmask );
ADDRLP4 0
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 136
INDIRP4
CNSTI4 444
ADDP4
ARGP4
ADDRLP4 136
INDIRP4
CNSTI4 456
ADDP4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 136
INDIRP4
INDIRI4
ARGI4
ADDRLP4 136
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 569
;569:	if ( trace.allsolid ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $259
line 570
;570:		return;		// can't step up
ADDRGP4 $255
JUMPV
LABELV $259
line 573
;571:	}
;572:
;573:	stepSize = trace.endpos[2] - start_o[2];
ADDRLP4 104
ADDRLP4 0+12+8
INDIRF4
ADDRLP4 56+8
INDIRF4
SUBF4
ASGNF4
line 576
;574:
;575:	// try slidemove from this position
;576:	VectorCopy( trace.endpos, ent->s.pos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 577
;577:	VectorCopy( start_v, ent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 92
INDIRB
ASGNB 12
line 579
;578:
;579:	G_PredictPlayerSlideMove( ent, frametime );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRGP4 G_PredictPlayerSlideMove
CALLI4
pop
line 582
;580:
;581:	// push down the final amount
;582:	VectorCopy( ent->s.pos.trBase, down );
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 583
;583:	down[2] -= stepSize;
ADDRLP4 68+8
ADDRLP4 68+8
INDIRF4
ADDRLP4 104
INDIRF4
SUBF4
ASGNF4
line 584
;584:	trap_Trace( &trace, ent->s.pos.trBase, ent->r.mins, ent->r.maxs, down, ent->s.number, ent->clipmask );
ADDRLP4 0
ARGP4
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 444
ADDP4
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 456
ADDP4
ARGP4
ADDRLP4 68
ARGP4
ADDRLP4 140
INDIRP4
INDIRI4
ARGI4
ADDRLP4 140
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 585
;585:	if ( !trace.allsolid ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $266
line 586
;586:		VectorCopy( trace.endpos, ent->s.pos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 587
;587:	}
LABELV $266
line 588
;588:	if ( trace.fraction < 1.0 ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $269
line 589
;589:		G_PredictPlayerClipVelocity( ent->s.pos.trDelta, trace.plane.normal, ent->s.pos.trDelta );
ADDRLP4 144
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRLP4 0+24
ARGP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRGP4 G_PredictPlayerClipVelocity
CALLV
pop
line 590
;590:	}
LABELV $269
line 591
;591:}
LABELV $255
endproc G_PredictPlayerStepSlideMove 148 28
export G_PredictPlayerMove
proc G_PredictPlayerMove 0 8
line 603
;592:
;593:
;594:/*
;595:===================
;596:G_PredictPlayerMove
;597:
;598:Advance the given entity frametime seconds, stepping and sliding as appropriate
;599:
;600:This is the entry point to the server-side-only prediction code
;601:===================
;602:*/
;603:void G_PredictPlayerMove( gentity_t *ent, float frametime ) {
line 604
;604:	G_PredictPlayerStepSlideMove( ent, frametime );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRGP4 G_PredictPlayerStepSlideMove
CALLV
pop
line 605
;605:}
LABELV $273
endproc G_PredictPlayerMove 0 8
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
import BuildMC
import BuildGenerator
import BuildTurret
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
LABELV $93
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 78
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 99
byte 1 58
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 106
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 107
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 48
byte 1 46
byte 1 50
byte 1 102
byte 1 32
byte 1 37
byte 1 48
byte 1 46
byte 1 50
byte 1 102
byte 1 32
byte 1 37
byte 1 48
byte 1 46
byte 1 50
byte 1 102
byte 1 10
byte 1 94
byte 1 50
byte 1 102
byte 1 114
byte 1 97
byte 1 99
byte 1 58
byte 1 32
byte 1 37
byte 1 48
byte 1 46
byte 1 52
byte 1 102
byte 1 44
byte 1 32
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 49
byte 1 58
byte 1 32
byte 1 37
byte 1 48
byte 1 46
byte 1 50
byte 1 102
byte 1 32
byte 1 37
byte 1 48
byte 1 46
byte 1 50
byte 1 102
byte 1 32
byte 1 37
byte 1 48
byte 1 46
byte 1 50
byte 1 102
byte 1 44
byte 1 32
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 50
byte 1 58
byte 1 32
byte 1 37
byte 1 48
byte 1 46
byte 1 50
byte 1 102
byte 1 32
byte 1 37
byte 1 48
byte 1 46
byte 1 50
byte 1 102
byte 1 32
byte 1 37
byte 1 48
byte 1 46
byte 1 50
byte 1 102
byte 1 10
byte 1 94
byte 1 55
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 46
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 46
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 100
byte 1 101
byte 1 108
byte 1 116
byte 1 97
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 108
byte 1 32
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $86
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 82
byte 1 101
byte 1 99
byte 1 58
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 106
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 107
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 48
byte 1 46
byte 1 50
byte 1 102
byte 1 32
byte 1 37
byte 1 48
byte 1 46
byte 1 50
byte 1 102
byte 1 32
byte 1 37
byte 1 48
byte 1 46
byte 1 50
byte 1 102
byte 1 10
byte 1 94
byte 1 50
byte 1 102
byte 1 114
byte 1 97
byte 1 99
byte 1 58
byte 1 32
byte 1 37
byte 1 48
byte 1 46
byte 1 52
byte 1 102
byte 1 44
byte 1 32
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 49
byte 1 58
byte 1 32
byte 1 37
byte 1 48
byte 1 46
byte 1 50
byte 1 102
byte 1 32
byte 1 37
byte 1 48
byte 1 46
byte 1 50
byte 1 102
byte 1 32
byte 1 37
byte 1 48
byte 1 46
byte 1 50
byte 1 102
byte 1 44
byte 1 32
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 50
byte 1 58
byte 1 32
byte 1 37
byte 1 48
byte 1 46
byte 1 50
byte 1 102
byte 1 32
byte 1 37
byte 1 48
byte 1 46
byte 1 50
byte 1 102
byte 1 32
byte 1 37
byte 1 48
byte 1 46
byte 1 50
byte 1 102
byte 1 10
byte 1 94
byte 1 55
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 46
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 46
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 100
byte 1 101
byte 1 108
byte 1 116
byte 1 97
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 108
byte 1 32
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 34
byte 1 0
