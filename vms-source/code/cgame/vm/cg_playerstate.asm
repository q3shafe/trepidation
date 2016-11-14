export CG_CheckAmmo
code
proc CG_CheckAmmo 20 8
file "../cg_playerstate.c"
line 17
;1:// 2016 Trepidation Licensed under the GPL2
;2://
;3:// cg_playerstate.c -- this file acts on changes in a new playerState_t
;4:// With normal play, this will be done after local prediction, but when
;5:// following another player or playing back a demo, it will be checked
;6:// when the snapshot transitions like all the other entities
;7:
;8:#include "cg_local.h"
;9:
;10:/*
;11:==============
;12:CG_CheckAmmo
;13:
;14:If the ammo has gone low enough to generate the warning, play a sound
;15:==============
;16:*/
;17:void CG_CheckAmmo( void ) {
line 24
;18:	int		i;
;19:	int		total;
;20:	int		previous;
;21:	int		weapons;
;22:
;23:	// see about how many seconds of ammo we have remaining
;24:	weapons = cg.snap->ps.stats[ STAT_WEAPONS ];
ADDRLP4 8
ADDRGP4 cg+36
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ASGNI4
line 25
;25:	total = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 26
;26:	for ( i = WP_MACHINEGUN ; i < WP_NUM_WEAPONS ; i++ ) {
ADDRLP4 0
CNSTI4 2
ASGNI4
LABELV $74
line 27
;27:		if ( ! ( weapons & ( 1 << i ) ) ) {
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $78
line 28
;28:			continue;
ADDRGP4 $75
JUMPV
LABELV $78
line 30
;29:		}
;30:		switch ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $80
ADDRLP4 0
INDIRI4
CNSTI4 7
GTI4 $80
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $85-12
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $85
address $82
address $82
address $82
address $80
address $82
code
LABELV $82
line 38
;31:		case WP_ROCKET_LAUNCHER:
;32:		case WP_GRENADE_LAUNCHER:
;33:		case WP_RAILGUN:
;34:		case WP_SHOTGUN:
;35:#ifdef MISSIONPACK
;36:		case WP_PROX_LAUNCHER:
;37:#endif
;38:			total += cg.snap->ps.ammo[i] * 1000;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1000
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 420
ADDP4
ADDP4
INDIRI4
MULI4
ADDI4
ASGNI4
line 39
;39:			break;
ADDRGP4 $81
JUMPV
LABELV $80
line 41
;40:		default:
;41:			total += cg.snap->ps.ammo[i] * 200;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 200
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 420
ADDP4
ADDP4
INDIRI4
MULI4
ADDI4
ASGNI4
line 42
;42:			break;
LABELV $81
line 44
;43:		}
;44:		if ( total >= 5000 ) {
ADDRLP4 4
INDIRI4
CNSTI4 5000
LTI4 $87
line 45
;45:			cg.lowAmmoWarning = 0;
ADDRGP4 cg+126460
CNSTI4 0
ASGNI4
line 46
;46:			return;
ADDRGP4 $72
JUMPV
LABELV $87
line 48
;47:		}
;48:	}
LABELV $75
line 26
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $74
line 50
;49:
;50:	previous = cg.lowAmmoWarning;
ADDRLP4 12
ADDRGP4 cg+126460
INDIRI4
ASGNI4
line 52
;51:
;52:	if ( total == 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $91
line 53
;53:		cg.lowAmmoWarning = 2;
ADDRGP4 cg+126460
CNSTI4 2
ASGNI4
line 54
;54:	} else {
ADDRGP4 $92
JUMPV
LABELV $91
line 55
;55:		cg.lowAmmoWarning = 1;
ADDRGP4 cg+126460
CNSTI4 1
ASGNI4
line 56
;56:	}
LABELV $92
line 59
;57:
;58:	// play a sound on transitions
;59:	if ( cg.lowAmmoWarning != previous ) {
ADDRGP4 cg+126460
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $95
line 60
;60:		trap_S_StartLocalSound( cgs.media.noAmmoSound, CHAN_LOCAL_SOUND );
ADDRGP4 cgs+154388+804
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 61
;61:	}
LABELV $95
line 62
;62:}
LABELV $72
endproc CG_CheckAmmo 20 8
export CG_DamageFeedback
proc CG_DamageFeedback 72 16
line 69
;63:
;64:/*
;65:==============
;66:CG_DamageFeedback
;67:==============
;68:*/
;69:void CG_DamageFeedback( int yawByte, int pitchByte, int damage ) {
line 80
;70:	float		left, front, up;
;71:	float		kick;
;72:	int			health;
;73:	float		scale;
;74:	vec3_t		dir;
;75:	vec3_t		angles;
;76:	float		dist;
;77:	float		yaw, pitch;
;78:
;79:	// show the attacking player's head and name in corner
;80:	cg.attackerTime = cg.time;
ADDRGP4 cg+126484
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 83
;81:
;82:	// the lower on health you are, the greater the view kick will be
;83:	health = cg.snap->ps.stats[STAT_HEALTH];
ADDRLP4 20
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ASGNI4
line 84
;84:	if ( health < 40 ) {
ADDRLP4 20
INDIRI4
CNSTI4 40
GEI4 $104
line 85
;85:		scale = 1;
ADDRLP4 28
CNSTF4 1065353216
ASGNF4
line 86
;86:	} else {
ADDRGP4 $105
JUMPV
LABELV $104
line 87
;87:		scale = 40.0 / health;
ADDRLP4 28
CNSTF4 1109393408
ADDRLP4 20
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 88
;88:	}
LABELV $105
line 89
;89:	kick = damage * scale;
ADDRLP4 12
ADDRFP4 8
INDIRI4
CVIF4 4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 91
;90:
;91:	if (kick < 5)
ADDRLP4 12
INDIRF4
CNSTF4 1084227584
GEF4 $106
line 92
;92:		kick = 5;
ADDRLP4 12
CNSTF4 1084227584
ASGNF4
LABELV $106
line 93
;93:	if (kick > 10)
ADDRLP4 12
INDIRF4
CNSTF4 1092616192
LEF4 $108
line 94
;94:		kick = 10;
ADDRLP4 12
CNSTF4 1092616192
ASGNF4
LABELV $108
line 97
;95:
;96:	// if yaw and pitch are both 255, make the damage always centered (falling, etc)
;97:	if ( yawByte == 255 && pitchByte == 255 ) {
ADDRLP4 60
CNSTI4 255
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $110
ADDRFP4 4
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $110
line 98
;98:		cg.damageX = 0;
ADDRGP4 cg+126760
CNSTF4 0
ASGNF4
line 99
;99:		cg.damageY = 0;
ADDRGP4 cg+126764
CNSTF4 0
ASGNF4
line 100
;100:		cg.v_dmg_roll = 0;
ADDRGP4 cg+126808
CNSTF4 0
ASGNF4
line 101
;101:		cg.v_dmg_pitch = -kick;
ADDRGP4 cg+126804
ADDRLP4 12
INDIRF4
NEGF4
ASGNF4
line 102
;102:	} else {
ADDRGP4 $111
JUMPV
LABELV $110
line 104
;103:		// positional
;104:		pitch = pitchByte / 255.0 * 360;
ADDRLP4 56
CNSTF4 1135869952
ADDRFP4 4
INDIRI4
CVIF4 4
CNSTF4 1132396544
DIVF4
MULF4
ASGNF4
line 105
;105:		yaw = yawByte / 255.0 * 360;
ADDRLP4 52
CNSTF4 1135869952
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1132396544
DIVF4
MULF4
ASGNF4
line 107
;106:
;107:		angles[PITCH] = pitch;
ADDRLP4 32
ADDRLP4 56
INDIRF4
ASGNF4
line 108
;108:		angles[YAW] = yaw;
ADDRLP4 32+4
ADDRLP4 52
INDIRF4
ASGNF4
line 109
;109:		angles[ROLL] = 0;
ADDRLP4 32+8
CNSTF4 0
ASGNF4
line 111
;110:
;111:		AngleVectors( angles, dir, NULL, NULL );
ADDRLP4 32
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 64
CNSTP4 0
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 112
;112:		VectorSubtract( vec3_origin, dir, dir );
ADDRLP4 0
ADDRGP4 vec3_origin
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRGP4 vec3_origin+4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 vec3_origin+8
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 114
;113:
;114:		front = DotProduct (dir, cg.refdef.viewaxis[0] );
ADDRLP4 16
ADDRLP4 0
INDIRF4
ADDRGP4 cg+111104+36
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRGP4 cg+111104+36+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRGP4 cg+111104+36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 115
;115:		left = DotProduct (dir, cg.refdef.viewaxis[1] );
ADDRLP4 24
ADDRLP4 0
INDIRF4
ADDRGP4 cg+111104+36+12
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRGP4 cg+111104+36+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRGP4 cg+111104+36+12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 116
;116:		up = DotProduct (dir, cg.refdef.viewaxis[2] );
ADDRLP4 48
ADDRLP4 0
INDIRF4
ADDRGP4 cg+111104+36+24
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRGP4 cg+111104+36+24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRGP4 cg+111104+36+24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 118
;117:
;118:		dir[0] = front;
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 119
;119:		dir[1] = left;
ADDRLP4 0+4
ADDRLP4 24
INDIRF4
ASGNF4
line 120
;120:		dir[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 121
;121:		dist = VectorLength( dir );
ADDRLP4 0
ARGP4
ADDRLP4 68
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 44
ADDRLP4 68
INDIRF4
ASGNF4
line 122
;122:		if ( dist < 0.1 ) {
ADDRLP4 44
INDIRF4
CNSTF4 1036831949
GEF4 $162
line 123
;123:			dist = 0.1f;
ADDRLP4 44
CNSTF4 1036831949
ASGNF4
line 124
;124:		}
LABELV $162
line 126
;125:
;126:		cg.v_dmg_roll = kick * left;
ADDRGP4 cg+126808
ADDRLP4 12
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 128
;127:		
;128:		cg.v_dmg_pitch = -kick * front;
ADDRGP4 cg+126804
ADDRLP4 12
INDIRF4
NEGF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 130
;129:
;130:		if ( front <= 0.1 ) {
ADDRLP4 16
INDIRF4
CNSTF4 1036831949
GTF4 $166
line 131
;131:			front = 0.1f;
ADDRLP4 16
CNSTF4 1036831949
ASGNF4
line 132
;132:		}
LABELV $166
line 133
;133:		cg.damageX = -left / front;
ADDRGP4 cg+126760
ADDRLP4 24
INDIRF4
NEGF4
ADDRLP4 16
INDIRF4
DIVF4
ASGNF4
line 134
;134:		cg.damageY = up / dist;
ADDRGP4 cg+126764
ADDRLP4 48
INDIRF4
ADDRLP4 44
INDIRF4
DIVF4
ASGNF4
line 135
;135:	}
LABELV $111
line 138
;136:
;137:	// clamp the position
;138:	if ( cg.damageX > 1.0 ) {
ADDRGP4 cg+126760
INDIRF4
CNSTF4 1065353216
LEF4 $170
line 139
;139:		cg.damageX = 1.0;
ADDRGP4 cg+126760
CNSTF4 1065353216
ASGNF4
line 140
;140:	}
LABELV $170
line 141
;141:	if ( cg.damageX < - 1.0 ) {
ADDRGP4 cg+126760
INDIRF4
CNSTF4 3212836864
GEF4 $174
line 142
;142:		cg.damageX = -1.0;
ADDRGP4 cg+126760
CNSTF4 3212836864
ASGNF4
line 143
;143:	}
LABELV $174
line 145
;144:
;145:	if ( cg.damageY > 1.0 ) {
ADDRGP4 cg+126764
INDIRF4
CNSTF4 1065353216
LEF4 $178
line 146
;146:		cg.damageY = 1.0;
ADDRGP4 cg+126764
CNSTF4 1065353216
ASGNF4
line 147
;147:	}
LABELV $178
line 148
;148:	if ( cg.damageY < - 1.0 ) {
ADDRGP4 cg+126764
INDIRF4
CNSTF4 3212836864
GEF4 $182
line 149
;149:		cg.damageY = -1.0;
ADDRGP4 cg+126764
CNSTF4 3212836864
ASGNF4
line 150
;150:	}
LABELV $182
line 153
;151:
;152:	// don't let the screen flashes vary as much
;153:	if ( kick > 10 ) {
ADDRLP4 12
INDIRF4
CNSTF4 1092616192
LEF4 $186
line 154
;154:		kick = 10;
ADDRLP4 12
CNSTF4 1092616192
ASGNF4
line 155
;155:	}
LABELV $186
line 156
;156:	cg.damageValue = kick;
ADDRGP4 cg+126768
ADDRLP4 12
INDIRF4
ASGNF4
line 157
;157:	cg.v_dmg_time = cg.time + DAMAGE_TIME;
ADDRGP4 cg+126800
ADDRGP4 cg+109652
INDIRI4
CNSTI4 500
ADDI4
CVIF4 4
ASGNF4
line 158
;158:	cg.damageTime = cg.snap->serverTime;
ADDRGP4 cg+126756
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 159
;159:}
LABELV $100
endproc CG_DamageFeedback 72 16
export CG_Respawn
proc CG_Respawn 0 0
line 172
;160:
;161:
;162:
;163:
;164:/*
;165:================
;166:CG_Respawn
;167:
;168:A respawn happened this snapshot
;169:================
;170:*/
;171:void CG_Respawn( void ) 
;172:{
line 174
;173:	// Check if the zoom needs to be resetted -Vincent
;174:	CG_ResetZoom();
ADDRGP4 CG_ResetZoom
CALLV
pop
line 177
;175:
;176:	// no error decay on player movement
;177:	cg.thisFrameTeleport = qtrue;
ADDRGP4 cg+109640
CNSTI4 1
ASGNI4
line 180
;178:
;179:	// display weapons available
;180:	cg.weaponSelectTime = cg.time;
ADDRGP4 cg+126744
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 183
;181:
;182:	// select the weapon the server says we are using
;183:	cg.weaponSelect = cg.snap->ps.weapon;
ADDRGP4 cg+111004
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 184
;184:}
LABELV $193
endproc CG_Respawn 0 0
export CG_CheckPlayerstateEvents
proc CG_CheckPlayerstateEvents 52 8
line 193
;185:
;186:extern char *eventnames[];
;187:
;188:/*
;189:==============
;190:CG_CheckPlayerstateEvents
;191:==============
;192:*/
;193:void CG_CheckPlayerstateEvents( playerState_t *ps, playerState_t *ops ) {
line 198
;194:	int			i;
;195:	int			event;
;196:	centity_t	*cent;
;197:
;198:	if ( ps->externalEvent && ps->externalEvent != ops->externalEvent ) {
ADDRLP4 12
CNSTI4 128
ASGNI4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $200
ADDRLP4 16
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
EQI4 $200
line 199
;199:		cent = &cg_entities[ ps->clientNum ];
ADDRLP4 4
CNSTI4 740
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 200
;200:		cent->currentState.event = ps->externalEvent;
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
ASGNI4
line 201
;201:		cent->currentState.eventParm = ps->externalEventParm;
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
ASGNI4
line 202
;202:		CG_EntityEvent( cent, cent->lerpOrigin );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 CG_EntityEvent
CALLV
pop
line 203
;203:	}
LABELV $200
line 205
;204:
;205:	cent = &cg.predictedPlayerEntity; // cg_entities[ ps->clientNum ];
ADDRLP4 4
ADDRGP4 cg+110152
ASGNP4
line 207
;206:	// go through the predictable events buffer
;207:	for ( i = ps->eventSequence - MAX_PS_EVENTS ; i < ps->eventSequence ; i++ ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
ADDRGP4 $206
JUMPV
LABELV $203
line 209
;208:		// if we have a new predictable event
;209:		if ( i >= ops->eventSequence
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 28
INDIRI4
GEI4 $209
ADDRLP4 32
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRI4
SUBI4
LEI4 $207
ADDRLP4 36
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 32
INDIRI4
LSHI4
ASGNI4
ADDRLP4 40
CNSTI4 112
ASGNI4
ADDRLP4 36
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
ADDRLP4 24
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ADDP4
INDIRI4
EQI4 $207
LABELV $209
line 212
;210:			// or the server told us to play another event instead of a predicted event we already issued
;211:			// or something the server told us changed our prediction causing a different event
;212:			|| (i > ops->eventSequence - MAX_PS_EVENTS && ps->events[i & (MAX_PS_EVENTS-1)] != ops->events[i & (MAX_PS_EVENTS-1)]) ) {
line 214
;213:
;214:			event = ps->events[ i & (MAX_PS_EVENTS-1) ];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ASGNI4
line 215
;215:			cent->currentState.event = event;
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 216
;216:			cent->currentState.eventParm = ps->eventParms[ i & (MAX_PS_EVENTS-1) ];
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDP4
INDIRI4
ASGNI4
line 217
;217:			CG_EntityEvent( cent, cent->lerpOrigin );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 CG_EntityEvent
CALLV
pop
line 219
;218:
;219:			cg.predictableEvents[ i & (MAX_PREDICTED_EVENTS-1) ] = event;
ADDRLP4 0
INDIRI4
CNSTI4 15
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cg+110916
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 221
;220:
;221:			cg.eventSequence++;
ADDRLP4 48
ADDRGP4 cg+110912
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 222
;222:		}
LABELV $207
line 223
;223:	}
LABELV $204
line 207
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $206
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
LTI4 $203
line 224
;224:}
LABELV $199
endproc CG_CheckPlayerstateEvents 52 8
export CG_CheckChangedPredictableEvents
proc CG_CheckChangedPredictableEvents 24 8
line 231
;225:
;226:/*
;227:==================
;228:CG_CheckChangedPredictableEvents
;229:==================
;230:*/
;231:void CG_CheckChangedPredictableEvents( playerState_t *ps ) {
line 236
;232:	int i;
;233:	int event;
;234:	centity_t	*cent;
;235:
;236:	cent = &cg.predictedPlayerEntity;
ADDRLP4 4
ADDRGP4 cg+110152
ASGNP4
line 237
;237:	for ( i = ps->eventSequence - MAX_PS_EVENTS ; i < ps->eventSequence ; i++ ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
ADDRGP4 $217
JUMPV
LABELV $214
line 239
;238:		//
;239:		if (i >= cg.eventSequence) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+110912
INDIRI4
LTI4 $218
line 240
;240:			continue;
ADDRGP4 $215
JUMPV
LABELV $218
line 243
;241:		}
;242:		// if this event is not further back in than the maximum predictable events we remember
;243:		if (i > cg.eventSequence - MAX_PREDICTED_EVENTS) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+110912
INDIRI4
CNSTI4 16
SUBI4
LEI4 $221
line 245
;244:			// if the new playerstate event is different from a previously predicted one
;245:			if ( ps->events[i & (MAX_PS_EVENTS-1)] != cg.predictableEvents[i & (MAX_PREDICTED_EVENTS-1) ] ) {
ADDRLP4 16
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 15
BANDI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRGP4 cg+110916
ADDP4
INDIRI4
EQI4 $224
line 247
;246:
;247:				event = ps->events[ i & (MAX_PS_EVENTS-1) ];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ASGNI4
line 248
;248:				cent->currentState.event = event;
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 249
;249:				cent->currentState.eventParm = ps->eventParms[ i & (MAX_PS_EVENTS-1) ];
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDP4
INDIRI4
ASGNI4
line 250
;250:				CG_EntityEvent( cent, cent->lerpOrigin );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 CG_EntityEvent
CALLV
pop
line 252
;251:
;252:				cg.predictableEvents[ i & (MAX_PREDICTED_EVENTS-1) ] = event;
ADDRLP4 0
INDIRI4
CNSTI4 15
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cg+110916
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 254
;253:
;254:				if ( cg_showmiss.integer ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $228
line 255
;255:					CG_Printf("WARNING: changed predicted event\n");
ADDRGP4 $231
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 256
;256:				}
LABELV $228
line 257
;257:			}
LABELV $224
line 258
;258:		}
LABELV $221
line 259
;259:	}
LABELV $215
line 237
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $217
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
LTI4 $214
line 260
;260:}
LABELV $212
endproc CG_CheckChangedPredictableEvents 24 8
proc pushReward 4 0
line 267
;261:
;262:/*
;263:==================
;264:pushReward
;265:==================
;266:*/
;267:static void pushReward(sfxHandle_t sfx, qhandle_t shader, int rewardCount) {
line 268
;268:	if (cg.rewardStack < (MAX_REWARDSTACK-1)) {
ADDRGP4 cg+126492
INDIRI4
CNSTI4 9
GEI4 $233
line 269
;269:		cg.rewardStack++;
ADDRLP4 0
ADDRGP4 cg+126492
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 270
;270:		cg.rewardSound[cg.rewardStack] = sfx;
ADDRGP4 cg+126492
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+126580
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 271
;271:		cg.rewardShader[cg.rewardStack] = shader;
ADDRGP4 cg+126492
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+126540
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 272
;272:		cg.rewardCount[cg.rewardStack] = rewardCount;
ADDRGP4 cg+126492
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+126500
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 273
;273:	}
LABELV $233
line 274
;274:}
LABELV $232
endproc pushReward 4 0
export CG_CheckLocalSounds
proc CG_CheckLocalSounds 88 12
line 281
;275:
;276:/*
;277:==================
;278:CG_CheckLocalSounds
;279:==================
;280:*/
;281:void CG_CheckLocalSounds( playerState_t *ps, playerState_t *ops ) {
line 286
;282:	int			highScore, health, armor, reward;
;283:	sfxHandle_t sfx;
;284:
;285:	// don't play the sounds if the player just changed teams
;286:	if ( ps->persistant[PERS_TEAM] != ops->persistant[PERS_TEAM] ) {
ADDRLP4 20
CNSTI4 260
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
EQI4 $244
line 287
;287:		return;
ADDRGP4 $243
JUMPV
LABELV $244
line 291
;288:	}
;289:
;290:	// hit changes
;291:	if ( ps->persistant[PERS_HITS] > ops->persistant[PERS_HITS] ) {
ADDRLP4 24
CNSTI4 252
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
LEI4 $246
line 292
;292:		armor  = ps->persistant[PERS_ATTACKEE_ARMOR] & 0xff;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 293
;293:		health = ps->persistant[PERS_ATTACKEE_ARMOR] >> 8;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 8
RSHI4
ASGNI4
line 303
;294:#ifdef MISSIONPACK
;295:		if (armor > 50 ) {
;296:			trap_S_StartLocalSound( cgs.media.hitSoundHighArmor, CHAN_LOCAL_SOUND );
;297:		} else if (armor || health > 100) {
;298:			trap_S_StartLocalSound( cgs.media.hitSoundLowArmor, CHAN_LOCAL_SOUND );
;299:		} else {
;300:			trap_S_StartLocalSound( cgs.media.hitSound, CHAN_LOCAL_SOUND );
;301:		}
;302:#else
;303:		trap_S_StartLocalSound( cgs.media.hitSound, CHAN_LOCAL_SOUND );
ADDRGP4 cgs+154388+852
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 305
;304:#endif
;305:	} else if ( ps->persistant[PERS_HITS] < ops->persistant[PERS_HITS] ) {
ADDRGP4 $247
JUMPV
LABELV $246
ADDRLP4 28
CNSTI4 252
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
GEI4 $250
line 306
;306:		trap_S_StartLocalSound( cgs.media.hitTeamSound, CHAN_LOCAL_SOUND );
ADDRGP4 cgs+154388+864
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 307
;307:	}
LABELV $250
LABELV $247
line 310
;308:
;309:	// health changes of more than -1 should make pain sounds
;310:	if ( ps->stats[STAT_HEALTH] < ops->stats[STAT_HEALTH] - 1 ) {
ADDRLP4 32
CNSTI4 184
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
CNSTI4 1
SUBI4
GEI4 $254
line 311
;311:		if ( ps->stats[STAT_HEALTH] > 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
LEI4 $256
line 312
;312:			CG_PainEvent( &cg.predictedPlayerEntity, ps->stats[STAT_HEALTH] );
ADDRGP4 cg+110152
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_PainEvent
CALLV
pop
line 313
;313:		}
LABELV $256
line 314
;314:	}
LABELV $254
line 318
;315:
;316:
;317:	// if we are going into the intermission, don't start any voices
;318:	if ( cg.intermissionStarted ) {
ADDRGP4 cg+24
INDIRI4
CNSTI4 0
EQI4 $259
line 319
;319:		return;
ADDRGP4 $243
JUMPV
LABELV $259
line 323
;320:	}
;321:
;322:	// reward sounds
;323:	reward = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 324
;324:	if (ps->persistant[PERS_CAPTURES] != ops->persistant[PERS_CAPTURES]) {
ADDRLP4 36
CNSTI4 304
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
EQI4 $262
line 325
;325:		pushReward(cgs.media.captureAwardSound, cgs.media.medalCapture, ps->persistant[PERS_CAPTURES]);
ADDRGP4 cgs+154388+952
INDIRI4
ARGI4
ADDRGP4 cgs+154388+596
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ARGI4
ADDRGP4 pushReward
CALLV
pop
line 326
;326:		reward = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 328
;327:		//Com_Printf("capture\n");
;328:	}
LABELV $262
line 329
;329:	if (ps->persistant[PERS_IMPRESSIVE_COUNT] != ops->persistant[PERS_IMPRESSIVE_COUNT]) {
ADDRLP4 40
CNSTI4 284
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
EQI4 $268
line 337
;330:#ifdef MISSIONPACK
;331:		if (ps->persistant[PERS_IMPRESSIVE_COUNT] == 1) {
;332:			sfx = cgs.media.firstImpressiveSound;
;333:		} else {
;334:			sfx = cgs.media.impressiveSound;
;335:		}
;336:#else
;337:		sfx = cgs.media.impressiveSound;
ADDRLP4 4
ADDRGP4 cgs+154388+868
INDIRI4
ASGNI4
line 339
;338:#endif
;339:		pushReward(sfx, cgs.media.medalImpressive, ps->persistant[PERS_IMPRESSIVE_COUNT]);
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 cgs+154388+576
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRGP4 pushReward
CALLV
pop
line 340
;340:		reward = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 342
;341:		//Com_Printf("impressive\n");
;342:	}
LABELV $268
line 343
;343:	if (ps->persistant[PERS_EXCELLENT_COUNT] != ops->persistant[PERS_EXCELLENT_COUNT]) {
ADDRLP4 44
CNSTI4 288
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
EQI4 $274
line 351
;344:#ifdef MISSIONPACK
;345:		if (ps->persistant[PERS_EXCELLENT_COUNT] == 1) {
;346:			sfx = cgs.media.firstExcellentSound;
;347:		} else {
;348:			sfx = cgs.media.excellentSound;
;349:		}
;350:#else
;351:		sfx = cgs.media.excellentSound;
ADDRLP4 4
ADDRGP4 cgs+154388+872
INDIRI4
ASGNI4
line 353
;352:#endif
;353:		pushReward(sfx, cgs.media.medalExcellent, ps->persistant[PERS_EXCELLENT_COUNT]);
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 cgs+154388+580
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ARGI4
ADDRGP4 pushReward
CALLV
pop
line 354
;354:		reward = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 356
;355:		//Com_Printf("excellent\n");
;356:	}
LABELV $274
line 357
;357:	if (ps->persistant[PERS_GAUNTLET_FRAG_COUNT] != ops->persistant[PERS_GAUNTLET_FRAG_COUNT]) {
ADDRLP4 48
CNSTI4 300
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
EQI4 $280
line 365
;358:#ifdef MISSIONPACK
;359:		if (ops->persistant[PERS_GAUNTLET_FRAG_COUNT] == 1) {
;360:			sfx = cgs.media.firstHumiliationSound;
;361:		} else {
;362:			sfx = cgs.media.humiliationSound;
;363:		}
;364:#else
;365:		sfx = cgs.media.humiliationSound;
ADDRLP4 4
ADDRGP4 cgs+154388+880
INDIRI4
ASGNI4
line 367
;366:#endif
;367:		pushReward(sfx, cgs.media.medalGauntlet, ps->persistant[PERS_GAUNTLET_FRAG_COUNT]);
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 cgs+154388+584
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
ARGI4
ADDRGP4 pushReward
CALLV
pop
line 368
;368:		reward = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 370
;369:		//Com_Printf("guantlet frag\n");
;370:	}
LABELV $280
line 371
;371:	if (ps->persistant[PERS_DEFEND_COUNT] != ops->persistant[PERS_DEFEND_COUNT]) {
ADDRLP4 52
CNSTI4 292
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRI4
EQI4 $286
line 372
;372:		pushReward(cgs.media.defendSound, cgs.media.medalDefend, ps->persistant[PERS_DEFEND_COUNT]);
ADDRGP4 cgs+154388+888
INDIRI4
ARGI4
ADDRGP4 cgs+154388+588
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ARGI4
ADDRGP4 pushReward
CALLV
pop
line 373
;373:		reward = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 375
;374:		//Com_Printf("defend\n");
;375:	}
LABELV $286
line 376
;376:	if (ps->persistant[PERS_ASSIST_COUNT] != ops->persistant[PERS_ASSIST_COUNT]) {
ADDRLP4 56
CNSTI4 296
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
EQI4 $292
line 377
;377:		pushReward(cgs.media.assistSound, cgs.media.medalAssist, ps->persistant[PERS_ASSIST_COUNT]);
ADDRGP4 cgs+154388+884
INDIRI4
ARGI4
ADDRGP4 cgs+154388+592
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ARGI4
ADDRGP4 pushReward
CALLV
pop
line 378
;378:		reward = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 380
;379:		//Com_Printf("assist\n");
;380:	}
LABELV $292
line 382
;381:	// if any of the player event bits changed
;382:	if (ps->persistant[PERS_PLAYEREVENTS] != ops->persistant[PERS_PLAYEREVENTS]) {
ADDRLP4 60
CNSTI4 268
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRI4
EQI4 $298
line 383
;383:		if ((ps->persistant[PERS_PLAYEREVENTS] & PLAYEREVENT_DENIEDREWARD) !=
ADDRLP4 64
CNSTI4 268
ASGNI4
ADDRLP4 68
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
BANDI4
ADDRFP4 4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
BANDI4
EQI4 $300
line 384
;384:				(ops->persistant[PERS_PLAYEREVENTS] & PLAYEREVENT_DENIEDREWARD)) {
line 385
;385:			trap_S_StartLocalSound( cgs.media.deniedSound, CHAN_ANNOUNCER );
ADDRGP4 cgs+154388+876
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 386
;386:		}
ADDRGP4 $301
JUMPV
LABELV $300
line 387
;387:		else if ((ps->persistant[PERS_PLAYEREVENTS] & PLAYEREVENT_GAUNTLETREWARD) !=
ADDRLP4 72
CNSTI4 268
ASGNI4
ADDRLP4 76
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRI4
ADDRLP4 76
INDIRI4
BANDI4
ADDRFP4 4
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRI4
ADDRLP4 76
INDIRI4
BANDI4
EQI4 $304
line 388
;388:				(ops->persistant[PERS_PLAYEREVENTS] & PLAYEREVENT_GAUNTLETREWARD)) {
line 389
;389:			trap_S_StartLocalSound( cgs.media.humiliationSound, CHAN_ANNOUNCER );
ADDRGP4 cgs+154388+880
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 390
;390:		}
ADDRGP4 $305
JUMPV
LABELV $304
line 391
;391:		else if ((ps->persistant[PERS_PLAYEREVENTS] & PLAYEREVENT_HOLYSHIT) !=
ADDRLP4 80
CNSTI4 268
ASGNI4
ADDRLP4 84
CNSTI4 4
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRI4
ADDRLP4 84
INDIRI4
BANDI4
ADDRFP4 4
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRI4
ADDRLP4 84
INDIRI4
BANDI4
EQI4 $308
line 392
;392:				(ops->persistant[PERS_PLAYEREVENTS] & PLAYEREVENT_HOLYSHIT)) {
line 393
;393:			trap_S_StartLocalSound( cgs.media.holyShitSound, CHAN_ANNOUNCER );
ADDRGP4 cgs+154388+1036
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 394
;394:		}
LABELV $308
LABELV $305
LABELV $301
line 395
;395:		reward = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 396
;396:	}
LABELV $298
line 399
;397:
;398:	// check for flag pickup
;399:	if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $312
line 400
;400:		if ((ps->powerups[PW_REDFLAG] != ops->powerups[PW_REDFLAG] && ps->powerups[PW_REDFLAG]) ||
ADDRLP4 64
CNSTI4 340
ASGNI4
ADDRLP4 68
ADDRFP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRI4
EQI4 $318
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $319
LABELV $318
ADDRLP4 72
CNSTI4 344
ASGNI4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRI4
EQI4 $320
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $319
LABELV $320
ADDRLP4 80
CNSTI4 348
ASGNI4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 84
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRI4
EQI4 $315
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $315
LABELV $319
line 403
;401:			(ps->powerups[PW_BLUEFLAG] != ops->powerups[PW_BLUEFLAG] && ps->powerups[PW_BLUEFLAG]) ||
;402:			(ps->powerups[PW_NEUTRALFLAG] != ops->powerups[PW_NEUTRALFLAG] && ps->powerups[PW_NEUTRALFLAG]) )
;403:		{
line 404
;404:			trap_S_StartLocalSound( cgs.media.youHaveFlagSound, CHAN_ANNOUNCER );
ADDRGP4 cgs+154388+1028
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 405
;405:		}
LABELV $315
line 406
;406:	}
LABELV $312
line 409
;407:
;408:	// lead changes
;409:	if (!reward) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $323
line 411
;410:		//
;411:		if ( !cg.warmup ) {
ADDRGP4 cg+126724
INDIRI4
CNSTI4 0
NEI4 $325
line 413
;412:			// never play lead changes during warmup
;413:			if ( ps->persistant[PERS_RANK] != ops->persistant[PERS_RANK] ) {
ADDRLP4 64
CNSTI4 256
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRI4
EQI4 $328
line 414
;414:				if ( cgs.gametype < GT_TEAM) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
GEI4 $330
line 415
;415:					if (  ps->persistant[PERS_RANK] == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 0
NEI4 $333
line 416
;416:						CG_AddBufferedSound(cgs.media.takenLeadSound);
ADDRGP4 cgs+154388+904
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 417
;417:					} else if ( ps->persistant[PERS_RANK] == RANK_TIED_FLAG ) {
ADDRGP4 $334
JUMPV
LABELV $333
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 16384
NEI4 $337
line 418
;418:						CG_AddBufferedSound(cgs.media.tiedLeadSound);
ADDRGP4 cgs+154388+908
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 419
;419:					} else if ( ( ops->persistant[PERS_RANK] & ~RANK_TIED_FLAG ) == 0 ) {
ADDRGP4 $338
JUMPV
LABELV $337
ADDRFP4 4
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 -16385
BANDI4
CNSTI4 0
NEI4 $341
line 420
;420:						CG_AddBufferedSound(cgs.media.lostLeadSound);
ADDRGP4 cgs+154388+912
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 421
;421:					}
LABELV $341
LABELV $338
LABELV $334
line 422
;422:				}
LABELV $330
line 423
;423:			}
LABELV $328
line 424
;424:		}
LABELV $325
line 425
;425:	}
LABELV $323
line 428
;426:
;427:	// timelimit warnings
;428:	if ( cgs.timelimit > 0 ) {
ADDRGP4 cgs+31476
INDIRI4
CNSTI4 0
LEI4 $345
line 431
;429:		int		msec;
;430:
;431:		msec = cg.time - cgs.levelStartTime;
ADDRLP4 64
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cgs+34796
INDIRI4
SUBI4
ASGNI4
line 432
;432:		if ( !( cg.timelimitWarnings & 4 ) && msec > ( cgs.timelimit * 60 + 2 ) * 1000 ) {
ADDRGP4 cg+109664
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $350
ADDRLP4 64
INDIRI4
CNSTI4 1000
CNSTI4 60
ADDRGP4 cgs+31476
INDIRI4
MULI4
MULI4
CNSTI4 2000
ADDI4
LEI4 $350
line 433
;433:			cg.timelimitWarnings |= 1 | 2 | 4;
ADDRLP4 68
ADDRGP4 cg+109664
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 7
BORI4
ASGNI4
line 434
;434:			trap_S_StartLocalSound( cgs.media.suddenDeathSound, CHAN_ANNOUNCER );
ADDRGP4 cgs+154388+836
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 435
;435:		}
ADDRGP4 $351
JUMPV
LABELV $350
line 436
;436:		else if ( !( cg.timelimitWarnings & 2 ) && msec > (cgs.timelimit - 1) * 60 * 1000 ) {
ADDRGP4 cg+109664
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $357
ADDRLP4 64
INDIRI4
CNSTI4 1000
CNSTI4 60
ADDRGP4 cgs+31476
INDIRI4
MULI4
MULI4
CNSTI4 60000
SUBI4
LEI4 $357
line 437
;437:			cg.timelimitWarnings |= 1 | 2;
ADDRLP4 68
ADDRGP4 cg+109664
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 3
BORI4
ASGNI4
line 438
;438:			trap_S_StartLocalSound( cgs.media.oneMinuteSound, CHAN_ANNOUNCER );
ADDRGP4 cgs+154388+828
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 439
;439:		}
ADDRGP4 $358
JUMPV
LABELV $357
line 440
;440:		else if ( cgs.timelimit > 5 && !( cg.timelimitWarnings & 1 ) && msec > (cgs.timelimit - 5) * 60 * 1000 ) {
ADDRGP4 cgs+31476
INDIRI4
CNSTI4 5
LEI4 $364
ADDRGP4 cg+109664
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $364
ADDRLP4 64
INDIRI4
CNSTI4 1000
CNSTI4 60
ADDRGP4 cgs+31476
INDIRI4
MULI4
MULI4
CNSTI4 300000
SUBI4
LEI4 $364
line 441
;441:			cg.timelimitWarnings |= 1;
ADDRLP4 68
ADDRGP4 cg+109664
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 442
;442:			trap_S_StartLocalSound( cgs.media.fiveMinuteSound, CHAN_ANNOUNCER );
ADDRGP4 cgs+154388+832
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 443
;443:		}
LABELV $364
LABELV $358
LABELV $351
line 444
;444:	}
LABELV $345
line 447
;445:
;446:	// fraglimit warnings
;447:	if ( cgs.fraglimit > 0 && cgs.gametype < GT_CTF) {
ADDRGP4 cgs+31468
INDIRI4
CNSTI4 0
LEI4 $372
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
GEI4 $372
line 448
;448:		highScore = cgs.scores1;
ADDRLP4 8
ADDRGP4 cgs+34800
INDIRI4
ASGNI4
line 449
;449:		if ( !( cg.fraglimitWarnings & 4 ) && highScore == (cgs.fraglimit - 1) ) {
ADDRGP4 cg+109668
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $377
ADDRLP4 8
INDIRI4
ADDRGP4 cgs+31468
INDIRI4
CNSTI4 1
SUBI4
NEI4 $377
line 450
;450:			cg.fraglimitWarnings |= 1 | 2 | 4;
ADDRLP4 64
ADDRGP4 cg+109668
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 7
BORI4
ASGNI4
line 451
;451:			CG_AddBufferedSound(cgs.media.oneFragSound);
ADDRGP4 cgs+154388+848
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 452
;452:		}
ADDRGP4 $378
JUMPV
LABELV $377
line 453
;453:		else if ( cgs.fraglimit > 2 && !( cg.fraglimitWarnings & 2 ) && highScore == (cgs.fraglimit - 2) ) {
ADDRLP4 64
CNSTI4 2
ASGNI4
ADDRGP4 cgs+31468
INDIRI4
ADDRLP4 64
INDIRI4
LEI4 $384
ADDRGP4 cg+109668
INDIRI4
ADDRLP4 64
INDIRI4
BANDI4
CNSTI4 0
NEI4 $384
ADDRLP4 8
INDIRI4
ADDRGP4 cgs+31468
INDIRI4
ADDRLP4 64
INDIRI4
SUBI4
NEI4 $384
line 454
;454:			cg.fraglimitWarnings |= 1 | 2;
ADDRLP4 68
ADDRGP4 cg+109668
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 3
BORI4
ASGNI4
line 455
;455:			CG_AddBufferedSound(cgs.media.twoFragSound);
ADDRGP4 cgs+154388+844
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 456
;456:		}
ADDRGP4 $385
JUMPV
LABELV $384
line 457
;457:		else if ( cgs.fraglimit > 3 && !( cg.fraglimitWarnings & 1 ) && highScore == (cgs.fraglimit - 3) ) {
ADDRLP4 68
CNSTI4 3
ASGNI4
ADDRGP4 cgs+31468
INDIRI4
ADDRLP4 68
INDIRI4
LEI4 $392
ADDRGP4 cg+109668
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $392
ADDRLP4 8
INDIRI4
ADDRGP4 cgs+31468
INDIRI4
ADDRLP4 68
INDIRI4
SUBI4
NEI4 $392
line 458
;458:			cg.fraglimitWarnings |= 1;
ADDRLP4 72
ADDRGP4 cg+109668
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 459
;459:			CG_AddBufferedSound(cgs.media.threeFragSound);
ADDRGP4 cgs+154388+840
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 460
;460:		}
LABELV $392
LABELV $385
LABELV $378
line 461
;461:	}
LABELV $372
line 462
;462:}
LABELV $243
endproc CG_CheckLocalSounds 88 12
export CG_TransitionPlayerState
proc CG_TransitionPlayerState 24 12
line 470
;463:
;464:/*
;465:===============
;466:CG_TransitionPlayerState
;467:
;468:===============
;469:*/
;470:void CG_TransitionPlayerState( playerState_t *ps, playerState_t *ops ) {
line 472
;471:	// check for changing follow mode
;472:	if ( ps->clientNum != ops->clientNum ) {
ADDRLP4 0
CNSTI4 140
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRI4
EQI4 $401
line 473
;473:		cg.thisFrameTeleport = qtrue;
ADDRGP4 cg+109640
CNSTI4 1
ASGNI4
line 475
;474:		// make sure we don't get any unwanted transition effects
;475:		*ops = *ps;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 468
line 476
;476:	}
LABELV $401
line 479
;477:
;478:	// damage events (player is getting wounded)
;479:	if ( ps->damageEvent != ops->damageEvent && ps->damageCount ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 168
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
EQI4 $404
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 0
EQI4 $404
line 480
;480:		CG_DamageFeedback( ps->damageYaw, ps->damagePitch, ps->damageCount );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DamageFeedback
CALLV
pop
line 481
;481:	}
LABELV $404
line 484
;482:
;483:	// respawning
;484:	if ( ps->persistant[PERS_SPAWN_COUNT] != ops->persistant[PERS_SPAWN_COUNT] ) {
ADDRLP4 12
CNSTI4 264
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
EQI4 $406
line 485
;485:		CG_Respawn();
ADDRGP4 CG_Respawn
CALLV
pop
line 486
;486:	}
LABELV $406
line 488
;487:
;488:	if ( cg.mapRestart ) {
ADDRGP4 cg+109672
INDIRI4
CNSTI4 0
EQI4 $408
line 489
;489:		CG_Respawn();
ADDRGP4 CG_Respawn
CALLV
pop
line 490
;490:		cg.mapRestart = qfalse;
ADDRGP4 cg+109672
CNSTI4 0
ASGNI4
line 491
;491:	}
LABELV $408
line 493
;492:
;493:	if ( cg.snap->ps.pm_type != PM_INTERMISSION 
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 5
EQI4 $412
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 3
EQI4 $412
line 494
;494:		&& ps->persistant[PERS_TEAM] != TEAM_SPECTATOR ) {
line 495
;495:		CG_CheckLocalSounds( ps, ops );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_CheckLocalSounds
CALLV
pop
line 496
;496:	}
LABELV $412
line 499
;497:
;498:	// check for going low on ammo
;499:	CG_CheckAmmo();
ADDRGP4 CG_CheckAmmo
CALLV
pop
line 502
;500:
;501:	// run events
;502:	CG_CheckPlayerstateEvents( ps, ops );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_CheckPlayerstateEvents
CALLV
pop
line 505
;503:
;504:	// smooth the ducking viewheight change
;505:	if ( ps->viewheight != ops->viewheight ) {
ADDRLP4 16
CNSTI4 164
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
EQI4 $415
line 506
;506:		cg.duckChange = ps->viewheight - ops->viewheight;
ADDRLP4 20
CNSTI4 164
ASGNI4
ADDRGP4 cg+110988
ADDRFP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 507
;507:		cg.duckTime = cg.time;
ADDRGP4 cg+110992
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 508
;508:	}
LABELV $415
line 509
;509:}
LABELV $400
endproc CG_TransitionPlayerState 24 12
import eventnames
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
import CG_PlayBufferedVoiceChats
import CG_VoiceChatLocal
import CG_ShaderStateChanged
import CG_LoadVoiceChats
import CG_SetConfigValues
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_InitConsoleCommands
import CG_ConsoleCommand
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
LABELV $231
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 10
byte 1 0
