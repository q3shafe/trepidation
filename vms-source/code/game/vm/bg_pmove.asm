data
export pm_stopspeed
align 4
LABELV pm_stopspeed
byte 4 1120403456
export pm_duckScale
align 4
LABELV pm_duckScale
byte 4 1048576000
export pm_swimScale
align 4
LABELV pm_swimScale
byte 4 1056964608
export pm_wadeScale
align 4
LABELV pm_wadeScale
byte 4 1060320051
export pm_ladderScale
align 4
LABELV pm_ladderScale
byte 4 1061997773
export pm_accelerate
align 4
LABELV pm_accelerate
byte 4 1092616192
export pm_airaccelerate
align 4
LABELV pm_airaccelerate
byte 4 1065353216
export pm_ladderAccelerate
align 4
LABELV pm_ladderAccelerate
byte 4 1161527296
export pm_wateraccelerate
align 4
LABELV pm_wateraccelerate
byte 4 1082130432
export pm_flyaccelerate
align 4
LABELV pm_flyaccelerate
byte 4 1090519040
export pm_ladderfriction
align 4
LABELV pm_ladderfriction
byte 4 1161527296
export pm_friction
align 4
LABELV pm_friction
byte 4 1086324736
export pm_waterfriction
align 4
LABELV pm_waterfriction
byte 4 1065353216
export pm_flightfriction
align 4
LABELV pm_flightfriction
byte 4 1077936128
export pm_spectatorfriction
align 4
LABELV pm_spectatorfriction
byte 4 1084227584
export c_pmove
align 4
LABELV c_pmove
byte 4 0
export PM_AddEvent
code
proc PM_AddEvent 0 12
file "../bg_pmove.c"
line 44
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// bg_pmove.c -- both games player movement code
;4:// takes a playerstate and a usercmd as input and returns a modifed playerstate
;5:
;6:#include "q_shared.h"
;7:#include "bg_public.h"
;8:#include "bg_local.h"
;9:
;10:
;11:pmove_t		*pm;
;12:pml_t		pml;
;13:
;14:// movement parameters
;15:float	pm_stopspeed = 100.0f;
;16:float	pm_duckScale = 0.25f;
;17:float	pm_swimScale = 0.50f;
;18:float	pm_wadeScale = 0.70f;
;19:float	pm_ladderScale = 0.80f; 	// Shafe - Trep - Ladder Support Set the max movement speed to HALF of normal
;20:
;21:float	pm_accelerate = 10.0f;
;22:float	pm_airaccelerate = 1.0f;
;23:float	pm_ladderAccelerate = 3000; 	// Shafe - Trep - Ladder Support
;24:float	pm_wateraccelerate = 4.0f;
;25:float	pm_flyaccelerate = 8.0f;
;26:
;27:float	pm_ladderfriction = 3000; // Shafe - Trep - Ladder Support
;28:float	pm_friction = 6.0f;
;29:float	pm_waterfriction = 1.0f;
;30:float	pm_flightfriction = 3.0f;
;31:float	pm_spectatorfriction = 5.0f;
;32:
;33:int		c_pmove = 0;
;34:
;35:
;36:
;37:
;38:/*
;39:===============
;40:PM_AddEvent
;41:
;42:===============
;43:*/
;44:void PM_AddEvent( int newEvent ) {
line 45
;45:	BG_AddPredictableEventToPlayerstate( newEvent, 0, pm->ps );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 pm
INDIRP4
INDIRP4
ARGP4
ADDRGP4 BG_AddPredictableEventToPlayerstate
CALLV
pop
line 46
;46:}
LABELV $43
endproc PM_AddEvent 0 12
export PM_AddTouchEnt
proc PM_AddTouchEnt 12 0
line 53
;47:
;48:/*
;49:===============
;50:PM_AddTouchEnt
;51:===============
;52:*/
;53:void PM_AddTouchEnt( int entityNum ) {
line 56
;54:	int		i;
;55:
;56:	if ( entityNum == ENTITYNUM_WORLD ) {
ADDRFP4 0
INDIRI4
CNSTI4 1022
NEI4 $45
line 57
;57:		return;
ADDRGP4 $44
JUMPV
LABELV $45
line 59
;58:	}
;59:	if ( pm->numtouch == MAXTOUCH ) {
ADDRGP4 pm
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 32
NEI4 $47
line 60
;60:		return;
ADDRGP4 $44
JUMPV
LABELV $47
line 64
;61:	}
;62:
;63:	// see if it is already added
;64:	for ( i = 0 ; i < pm->numtouch ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $52
JUMPV
LABELV $49
line 65
;65:		if ( pm->touchents[ i ] == entityNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pm
INDIRP4
CNSTI4 52
ADDP4
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $53
line 66
;66:			return;
ADDRGP4 $44
JUMPV
LABELV $53
line 68
;67:		}
;68:	}
LABELV $50
line 64
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $52
ADDRLP4 0
INDIRI4
ADDRGP4 pm
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
LTI4 $49
line 71
;69:
;70:	// add it
;71:	pm->touchents[pm->numtouch] = entityNum;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 72
;72:	pm->numtouch++;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
CNSTI4 48
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
line 73
;73:}
LABELV $44
endproc PM_AddTouchEnt 12 0
proc PM_StartTorsoAnim 8 0
line 80
;74:
;75:/*
;76:===================
;77:PM_StartTorsoAnim
;78:===================
;79:*/
;80:static void PM_StartTorsoAnim( int anim ) {
line 81
;81:	if ( pm->ps->pm_type >= PM_DEAD ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
LTI4 $56
line 82
;82:		return;
ADDRGP4 $55
JUMPV
LABELV $56
line 84
;83:	}
;84:	pm->ps->torsoAnim = ( ( pm->ps->torsoAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT )
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
ASGNP4
ADDRLP4 4
CNSTI4 128
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
BANDI4
ADDRLP4 4
INDIRI4
BXORI4
ADDRFP4 0
INDIRI4
BORI4
ASGNI4
line 86
;85:		| anim;
;86:}
LABELV $55
endproc PM_StartTorsoAnim 8 0
proc PM_StartLegsAnim 8 0
line 87
;87:static void PM_StartLegsAnim( int anim ) {
line 88
;88:	if ( pm->ps->pm_type >= PM_DEAD ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
LTI4 $59
line 89
;89:		return;
ADDRGP4 $58
JUMPV
LABELV $59
line 91
;90:	}
;91:	if ( pm->ps->legsTimer > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
LEI4 $61
line 92
;92:		return;		// a high priority animation is running
ADDRGP4 $58
JUMPV
LABELV $61
line 94
;93:	}
;94:	pm->ps->legsAnim = ( ( pm->ps->legsAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT )
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 4
CNSTI4 128
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
BANDI4
ADDRLP4 4
INDIRI4
BXORI4
ADDRFP4 0
INDIRI4
BORI4
ASGNI4
line 96
;95:		| anim;
;96:}
LABELV $58
endproc PM_StartLegsAnim 8 0
proc PM_ContinueLegsAnim 0 4
line 98
;97:
;98:static void PM_ContinueLegsAnim( int anim ) {
line 99
;99:	if ( ( pm->ps->legsAnim & ~ANIM_TOGGLEBIT ) == anim ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ADDRFP4 0
INDIRI4
NEI4 $64
line 100
;100:		return;
ADDRGP4 $63
JUMPV
LABELV $64
line 102
;101:	}
;102:	if ( pm->ps->legsTimer > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
LEI4 $66
line 103
;103:		return;		// a high priority animation is running
ADDRGP4 $63
JUMPV
LABELV $66
line 105
;104:	}
;105:	PM_StartLegsAnim( anim );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 PM_StartLegsAnim
CALLV
pop
line 106
;106:}
LABELV $63
endproc PM_ContinueLegsAnim 0 4
proc PM_ContinueTorsoAnim 0 4
line 108
;107:
;108:static void PM_ContinueTorsoAnim( int anim ) {
line 109
;109:	if ( ( pm->ps->torsoAnim & ~ANIM_TOGGLEBIT ) == anim ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ADDRFP4 0
INDIRI4
NEI4 $69
line 110
;110:		return;
ADDRGP4 $68
JUMPV
LABELV $69
line 112
;111:	}
;112:	if ( pm->ps->torsoTimer > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 0
LEI4 $71
line 113
;113:		return;		// a high priority animation is running
ADDRGP4 $68
JUMPV
LABELV $71
line 115
;114:	}
;115:	PM_StartTorsoAnim( anim );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 116
;116:}
LABELV $68
endproc PM_ContinueTorsoAnim 0 4
proc PM_ForceLegsAnim 0 4
line 118
;117:
;118:static void PM_ForceLegsAnim( int anim ) {
line 119
;119:	pm->ps->legsTimer = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
line 120
;120:	PM_StartLegsAnim( anim );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 PM_StartLegsAnim
CALLV
pop
line 121
;121:}
LABELV $73
endproc PM_ForceLegsAnim 0 4
export PM_ClipVelocity
proc PM_ClipVelocity 32 0
line 131
;122:
;123:
;124:/*
;125:==================
;126:PM_ClipVelocity
;127:
;128:Slide off of the impacting surface
;129:==================
;130:*/
;131:void PM_ClipVelocity( vec3_t in, vec3_t normal, vec3_t out, float overbounce ) {
line 136
;132:	float	backoff;
;133:	float	change;
;134:	int		i;
;135:	
;136:	backoff = DotProduct (in, normal);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 4
ASGNI4
ADDRLP4 24
CNSTI4 8
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 16
INDIRP4
INDIRF4
MULF4
ADDRLP4 12
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 12
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 138
;137:	
;138:	if ( backoff < 0 ) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GEF4 $75
line 139
;139:		backoff *= overbounce;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 140
;140:	} else {
ADDRGP4 $76
JUMPV
LABELV $75
line 141
;141:		backoff /= overbounce;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRFP4 12
INDIRF4
DIVF4
ASGNF4
line 142
;142:	}
LABELV $76
line 144
;143:
;144:	for ( i=0 ; i<3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $77
line 145
;145:		change = normal[i]*backoff;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
MULF4
ASGNF4
line 146
;146:		out[i] = in[i] - change;
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 28
INDIRI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 28
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
line 147
;147:	}
LABELV $78
line 144
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $77
line 148
;148:}
LABELV $74
endproc PM_ClipVelocity 32 0
proc PM_Friction 48 4
line 158
;149:
;150:
;151:/*
;152:==================
;153:PM_Friction
;154:
;155:Handles both ground friction and water friction
;156:==================
;157:*/
;158:static void PM_Friction( void ) {
line 164
;159:	vec3_t	vec;
;160:	float	*vel;
;161:	float	speed, newspeed, control;
;162:	float	drop;
;163:	
;164:	vel = pm->ps->velocity;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
line 166
;165:	
;166:	VectorCopy( vel, vec );
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRB
ASGNB 12
line 167
;167:	if ( pml.walking ) {
ADDRGP4 pml+44
INDIRI4
CNSTI4 0
EQI4 $82
line 168
;168:		vec[2] = 0;	// ignore slope movement
ADDRLP4 16+8
CNSTF4 0
ASGNF4
line 169
;169:	}
LABELV $82
line 171
;170:
;171:	speed = VectorLength(vec);
ADDRLP4 16
ARGP4
ADDRLP4 32
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 32
INDIRF4
ASGNF4
line 172
;172:	if (speed < 1) {
ADDRLP4 8
INDIRF4
CNSTF4 1065353216
GEF4 $86
line 173
;173:		vel[0] = 0;
ADDRLP4 0
INDIRP4
CNSTF4 0
ASGNF4
line 174
;174:		vel[1] = 0;		// allow sinking underwater
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
line 176
;175:		// FIXME: still have z friction underwater?
;176:		return;
ADDRGP4 $81
JUMPV
LABELV $86
line 179
;177:	}
;178:
;179:	drop = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 182
;180:
;181:	// apply ground friction
;182:	if ( pm->waterlevel <= 1 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
GTI4 $88
line 183
;183:		if ( pml.walking && !(pml.groundTrace.surfaceFlags & SURF_SLICK) ) {
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRGP4 pml+44
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $90
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 36
INDIRI4
NEI4 $90
line 185
;184:			// if getting knocked back, no friction
;185:			if ( ! (pm->ps->pm_flags & PMF_TIME_KNOCKBACK) ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
NEI4 $95
line 186
;186:				control = speed < pm_stopspeed ? pm_stopspeed : speed;
ADDRLP4 8
INDIRF4
ADDRGP4 pm_stopspeed
INDIRF4
GEF4 $98
ADDRLP4 40
ADDRGP4 pm_stopspeed
INDIRF4
ASGNF4
ADDRGP4 $99
JUMPV
LABELV $98
ADDRLP4 40
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $99
ADDRLP4 28
ADDRLP4 40
INDIRF4
ASGNF4
line 187
;187:				drop += control*pm_friction*pml.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 28
INDIRF4
ADDRGP4 pm_friction
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 188
;188:			}
LABELV $95
line 189
;189:		}
LABELV $90
line 190
;190:	}
LABELV $88
line 193
;191:
;192:	// apply water friction even if just wading
;193:	if ( pm->waterlevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 0
EQI4 $101
line 194
;194:		drop += speed*pm_waterfriction*pm->waterlevel*pml.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 pm_waterfriction
INDIRF4
MULF4
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 195
;195:	}
LABELV $101
line 198
;196:
;197:	// apply flying friction
;198:	if ( pm->ps->powerups[PW_FLIGHT]) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $104
line 199
;199:		drop += speed*pm_flightfriction*pml.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 pm_flightfriction
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 200
;200:	}
LABELV $104
line 204
;201:
;202:
;203:	// Shafe - Trep - Ladder Support
;204:	if ( pml.ladder ) // If they're on a ladder... 
ADDRGP4 pml+108
INDIRI4
CNSTI4 0
EQI4 $107
line 205
;205:	{
line 206
;206:		drop += speed*pm_ladderfriction*pml.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 pm_ladderfriction
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 207
;207:	}
LABELV $107
line 210
;208:	///////////////////////// End Shafe Ladder
;209:
;210:	if ( pm->ps->pm_type == PM_SPECTATOR) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $111
line 211
;211:		drop += speed*pm_spectatorfriction*pml.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 pm_spectatorfriction
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 212
;212:	}
LABELV $111
line 215
;213:
;214:	// scale the velocity
;215:	newspeed = speed - drop;
ADDRLP4 4
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
line 216
;216:	if (newspeed < 0) {
ADDRLP4 4
INDIRF4
CNSTF4 0
GEF4 $114
line 217
;217:		newspeed = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 218
;218:	}
LABELV $114
line 219
;219:	newspeed /= speed;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
DIVF4
ASGNF4
line 221
;220:
;221:	vel[0] = vel[0] * newspeed;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 222
;222:	vel[1] = vel[1] * newspeed;
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 223
;223:	vel[2] = vel[2] * newspeed;
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 224
;224:}
LABELV $81
endproc PM_Friction 48 4
proc PM_Accelerate 32 0
line 234
;225:
;226:
;227:/*
;228:==============
;229:PM_Accelerate
;230:
;231:Handles user intended acceleration
;232:==============
;233:*/
;234:static void PM_Accelerate( vec3_t wishdir, float wishspeed, float accel ) {
line 240
;235:#if 1
;236:	// q2 style
;237:	int			i;
;238:	float		addspeed, accelspeed, currentspeed;
;239:
;240:	currentspeed = DotProduct (pm->ps->velocity, wishdir);
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
INDIRF4
MULF4
ADDRLP4 16
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 16
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 241
;241:	addspeed = wishspeed - currentspeed;
ADDRLP4 8
ADDRFP4 4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
line 242
;242:	if (addspeed <= 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GTF4 $117
line 243
;243:		return;
ADDRGP4 $116
JUMPV
LABELV $117
line 245
;244:	}
;245:	accelspeed = accel*pml.frametime*wishspeed;
ADDRLP4 4
ADDRFP4 8
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 246
;246:	if (accelspeed > addspeed) {
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $120
line 247
;247:		accelspeed = addspeed;
ADDRLP4 4
ADDRLP4 8
INDIRF4
ASGNF4
line 248
;248:	}
LABELV $120
line 250
;249:	
;250:	for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $122
line 251
;251:		pm->ps->velocity[i] += accelspeed*wishdir[i];	
ADDRLP4 24
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 28
ADDRLP4 24
INDIRI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 24
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 252
;252:	}
LABELV $123
line 250
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $122
line 271
;253:#else
;254:	// proper way (avoids strafe jump maxspeed bug), but feels bad
;255:	vec3_t		wishVelocity;
;256:	vec3_t		pushDir;
;257:	float		pushLen;
;258:	float		canPush;
;259:
;260:	VectorScale( wishdir, wishspeed, wishVelocity );
;261:	VectorSubtract( wishVelocity, pm->ps->velocity, pushDir );
;262:	pushLen = VectorNormalize( pushDir );
;263:
;264:	canPush = accel*pml.frametime*wishspeed;
;265:	if (canPush > pushLen) {
;266:		canPush = pushLen;
;267:	}
;268:
;269:	VectorMA( pm->ps->velocity, canPush, pushDir, pm->ps->velocity );
;270:#endif
;271:}
LABELV $116
endproc PM_Accelerate 32 0
proc PM_CmdScale 44 4
line 284
;272:
;273:
;274:
;275:/*
;276:============
;277:PM_CmdScale
;278:
;279:Returns the scale factor to apply to cmd movements
;280:This allows the clients to use axial -127 to 127 values for all directions
;281:without getting a sqrt(2) distortion in speed.
;282:============
;283:*/
;284:static float PM_CmdScale( usercmd_t *cmd ) {
line 289
;285:	int		max;
;286:	float	total;
;287:	float	scale;
;288:
;289:	max = abs( cmd->forwardmove );
ADDRFP4 0
INDIRP4
CNSTI4 21
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 12
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 290
;290:	if ( abs( cmd->rightmove ) > max ) {
ADDRFP4 0
INDIRP4
CNSTI4 22
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 16
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $127
line 291
;291:		max = abs( cmd->rightmove );
ADDRFP4 0
INDIRP4
CNSTI4 22
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 20
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
line 292
;292:	}
LABELV $127
line 293
;293:	if ( abs( cmd->upmove ) > max ) {
ADDRFP4 0
INDIRP4
CNSTI4 23
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 20
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $129
line 294
;294:		max = abs( cmd->upmove );
ADDRFP4 0
INDIRP4
CNSTI4 23
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 24
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 295
;295:	}
LABELV $129
line 296
;296:	if ( !max ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $131
line 297
;297:		return 0;
CNSTF4 0
RETF4
ADDRGP4 $126
JUMPV
LABELV $131
line 300
;298:	}
;299:
;300:	total = sqrt( cmd->forwardmove * cmd->forwardmove
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 21
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
ADDRLP4 24
INDIRP4
CNSTI4 22
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 36
ADDRLP4 24
INDIRP4
CNSTI4 23
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 28
INDIRI4
MULI4
ADDRLP4 32
INDIRI4
ADDRLP4 32
INDIRI4
MULI4
ADDI4
ADDRLP4 36
INDIRI4
ADDRLP4 36
INDIRI4
MULI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 40
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 40
INDIRF4
ASGNF4
line 302
;301:		+ cmd->rightmove * cmd->rightmove + cmd->upmove * cmd->upmove );
;302:	scale = (float)pm->ps->speed * max / ( 127.0 * total );
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRI4
CVIF4 4
MULF4
CNSTF4 1123942400
ADDRLP4 4
INDIRF4
MULF4
DIVF4
ASGNF4
line 304
;303:
;304:	return scale;
ADDRLP4 8
INDIRF4
RETF4
LABELV $126
endproc PM_CmdScale 44 4
proc PM_SetMovementDir 72 0
line 316
;305:}
;306:
;307:
;308:/*
;309:================
;310:PM_SetMovementDir
;311:
;312:Determine the rotation of the legs reletive
;313:to the facing dir
;314:================
;315:*/
;316:static void PM_SetMovementDir( void ) {
line 317
;317:	if ( pm->cmd.forwardmove || pm->cmd.rightmove ) {
ADDRLP4 0
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
NEI4 $136
ADDRLP4 0
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
EQI4 $134
LABELV $136
line 318
;318:		if ( pm->cmd.rightmove == 0 && pm->cmd.forwardmove > 0 ) {
ADDRLP4 8
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI4
NEI4 $137
ADDRLP4 8
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI4
LEI4 $137
line 319
;319:			pm->ps->movementDir = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 320
;320:		} else if ( pm->cmd.rightmove < 0 && pm->cmd.forwardmove > 0 ) {
ADDRGP4 $135
JUMPV
LABELV $137
ADDRLP4 16
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
ADDRLP4 20
INDIRI4
GEI4 $139
ADDRLP4 16
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ADDRLP4 20
INDIRI4
LEI4 $139
line 321
;321:			pm->ps->movementDir = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 1
ASGNI4
line 322
;322:		} else if ( pm->cmd.rightmove < 0 && pm->cmd.forwardmove == 0 ) {
ADDRGP4 $135
JUMPV
LABELV $139
ADDRLP4 24
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
ADDRLP4 28
INDIRI4
GEI4 $141
ADDRLP4 24
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ADDRLP4 28
INDIRI4
NEI4 $141
line 323
;323:			pm->ps->movementDir = 2;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 2
ASGNI4
line 324
;324:		} else if ( pm->cmd.rightmove < 0 && pm->cmd.forwardmove < 0 ) {
ADDRGP4 $135
JUMPV
LABELV $141
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
ADDRLP4 36
INDIRI4
GEI4 $143
ADDRLP4 32
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ADDRLP4 36
INDIRI4
GEI4 $143
line 325
;325:			pm->ps->movementDir = 3;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 3
ASGNI4
line 326
;326:		} else if ( pm->cmd.rightmove == 0 && pm->cmd.forwardmove < 0 ) {
ADDRGP4 $135
JUMPV
LABELV $143
ADDRLP4 40
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 40
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
ADDRLP4 44
INDIRI4
NEI4 $145
ADDRLP4 40
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ADDRLP4 44
INDIRI4
GEI4 $145
line 327
;327:			pm->ps->movementDir = 4;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 4
ASGNI4
line 328
;328:		} else if ( pm->cmd.rightmove > 0 && pm->cmd.forwardmove < 0 ) {
ADDRGP4 $135
JUMPV
LABELV $145
ADDRLP4 48
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRLP4 48
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
ADDRLP4 52
INDIRI4
LEI4 $147
ADDRLP4 48
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ADDRLP4 52
INDIRI4
GEI4 $147
line 329
;329:			pm->ps->movementDir = 5;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 5
ASGNI4
line 330
;330:		} else if ( pm->cmd.rightmove > 0 && pm->cmd.forwardmove == 0 ) {
ADDRGP4 $135
JUMPV
LABELV $147
ADDRLP4 56
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
ADDRLP4 60
INDIRI4
LEI4 $149
ADDRLP4 56
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ADDRLP4 60
INDIRI4
NEI4 $149
line 331
;331:			pm->ps->movementDir = 6;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 6
ASGNI4
line 332
;332:		} else if ( pm->cmd.rightmove > 0 && pm->cmd.forwardmove > 0 ) {
ADDRGP4 $135
JUMPV
LABELV $149
ADDRLP4 64
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRLP4 64
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
ADDRLP4 68
INDIRI4
LEI4 $135
ADDRLP4 64
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ADDRLP4 68
INDIRI4
LEI4 $135
line 333
;333:			pm->ps->movementDir = 7;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 7
ASGNI4
line 334
;334:		}
line 335
;335:	} else {
ADDRGP4 $135
JUMPV
LABELV $134
line 339
;336:		// if they aren't actively going directly sideways,
;337:		// change the animation to the diagonal so they
;338:		// don't stop too crooked
;339:		if ( pm->ps->movementDir == 2 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 2
NEI4 $153
line 340
;340:			pm->ps->movementDir = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 1
ASGNI4
line 341
;341:		} else if ( pm->ps->movementDir == 6 ) {
ADDRGP4 $154
JUMPV
LABELV $153
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 6
NEI4 $155
line 342
;342:			pm->ps->movementDir = 7;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 7
ASGNI4
line 343
;343:		} 
LABELV $155
LABELV $154
line 344
;344:	}
LABELV $135
line 345
;345:}
LABELV $133
endproc PM_SetMovementDir 72 0
proc PM_CheckJump 8 4
line 356
;346:
;347:
;348:
;349:
;350:
;351:/*
;352:=============
;353:PM_CheckJump
;354:=============
;355:*/
;356:static qboolean PM_CheckJump( void ) {
line 357
;357:	if ( pm->ps->pm_flags & PMF_RESPAWNED ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $158
line 358
;358:		return qfalse;		// don't allow jump until all buttons are up
CNSTI4 0
RETI4
ADDRGP4 $157
JUMPV
LABELV $158
line 361
;359:	}
;360:
;361:	if ( pm->cmd.upmove < 10 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
GEI4 $160
line 363
;362:		// not holding jump
;363:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $157
JUMPV
LABELV $160
line 367
;364:	}
;365:
;366:	// must wait for jump to be released
;367:	if ( pm->ps->pm_flags & PMF_JUMP_HELD ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $162
line 369
;368:		// clear upmove so cmdscale doesn't lower running speed
;369:		pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
CNSTI1 0
ASGNI1
line 370
;370:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $157
JUMPV
LABELV $162
line 375
;371:	}
;372:
;373:	
;374:
;375:	pml.groundPlane = qfalse;		// jumping away
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 376
;376:	pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 377
;377:	pm->ps->pm_flags |= PMF_JUMP_HELD;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 379
;378:
;379:	pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 1023
ASGNI4
line 380
;380:	pm->ps->velocity[2] = JUMP_VELOCITY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1132920832
ASGNF4
line 381
;381:	PM_AddEvent( EV_JUMP );
CNSTI4 14
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 385
;382:
;383://	pm->ps->MultiJumps++; // Shafe - Trep - Multijumping / wall jumping
;384:
;385:	if ( pm->cmd.forwardmove >= 0 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LTI4 $166
line 386
;386:		PM_ForceLegsAnim( LEGS_JUMP );
CNSTI4 18
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 387
;387:		pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 388
;388:	} else {
ADDRGP4 $167
JUMPV
LABELV $166
line 389
;389:		PM_ForceLegsAnim( LEGS_JUMPB );
CNSTI4 20
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 390
;390:		pm->ps->pm_flags |= PMF_BACKWARDS_JUMP;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 391
;391:	}
LABELV $167
line 393
;392:
;393:	return qtrue;
CNSTI4 1
RETI4
LABELV $157
endproc PM_CheckJump 8 4
proc PM_CheckWaterJump 56 8
line 401
;394:}
;395:
;396:/*
;397:=============
;398:PM_CheckWaterJump
;399:=============
;400:*/
;401:static qboolean	PM_CheckWaterJump( void ) {
line 406
;402:	vec3_t	spot;
;403:	int		cont;
;404:	vec3_t	flatforward;
;405:
;406:	if (pm->ps->pm_time) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $169
line 407
;407:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $168
JUMPV
LABELV $169
line 411
;408:	}
;409:
;410:	// check for water jump
;411:	if ( pm->waterlevel != 2 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 2
EQI4 $171
line 412
;412:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $168
JUMPV
LABELV $171
line 415
;413:	}
;414:
;415:	flatforward[0] = pml.forward[0];
ADDRLP4 12
ADDRGP4 pml
INDIRF4
ASGNF4
line 416
;416:	flatforward[1] = pml.forward[1];
ADDRLP4 12+4
ADDRGP4 pml+4
INDIRF4
ASGNF4
line 417
;417:	flatforward[2] = 0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 418
;418:	VectorNormalize (flatforward);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 420
;419:
;420:	VectorMA (pm->ps->origin, 30, flatforward, spot);
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
CNSTF4 1106247680
ASGNF4
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 32
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 28
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 32
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1106247680
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 421
;421:	spot[2] += 4;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1082130432
ADDF4
ASGNF4
line 422
;422:	cont = pm->pointcontents (spot, pm->ps->clientNum );
ADDRLP4 0
ARGP4
ADDRLP4 36
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
ADDRLP4 36
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 40
INDIRI4
ASGNI4
line 423
;423:	if ( !(cont & CONTENTS_SOLID) ) {
ADDRLP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $181
line 424
;424:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $168
JUMPV
LABELV $181
line 427
;425:	}
;426:
;427:	spot[2] += 16;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 428
;428:	cont = pm->pointcontents (spot, pm->ps->clientNum );
ADDRLP4 0
ARGP4
ADDRLP4 44
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
ADDRLP4 44
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 48
INDIRI4
ASGNI4
line 429
;429:	if ( cont ) {
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $184
line 430
;430:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $168
JUMPV
LABELV $184
line 434
;431:	}
;432:
;433:	// jump out of water
;434:	VectorScale (pml.forward, 200, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1128792064
ADDRGP4 pml
INDIRF4
MULF4
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1128792064
ADDRGP4 pml+4
INDIRF4
MULF4
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1128792064
ADDRGP4 pml+8
INDIRF4
MULF4
ASGNF4
line 435
;435:	pm->ps->velocity[2] = 350;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1135542272
ASGNF4
line 437
;436:
;437:	pm->ps->pm_flags |= PMF_TIME_WATERJUMP;
ADDRLP4 52
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 438
;438:	pm->ps->pm_time = 2000;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 2000
ASGNI4
line 440
;439:
;440:	return qtrue;
CNSTI4 1
RETI4
LABELV $168
endproc PM_CheckWaterJump 56 8
proc PM_WaterJumpMove 12 4
line 453
;441:}
;442:
;443://============================================================================
;444:
;445:
;446:/*
;447:===================
;448:PM_WaterJumpMove
;449:
;450:Flying out of the water
;451:===================
;452:*/
;453:static void PM_WaterJumpMove( void ) {
line 456
;454:	// waterjump has no control, but falls
;455:
;456:	PM_StepSlideMove( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 PM_StepSlideMove
CALLV
pop
line 458
;457:
;458:	pm->ps->velocity[2] -= pm->ps->gravity * pml.frametime;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pml+36
INDIRF4
MULF4
SUBF4
ASGNF4
line 459
;459:	if (pm->ps->velocity[2] < 0) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
GEF4 $190
line 461
;460:		// cancel as soon as we are falling down again
;461:		pm->ps->pm_flags &= ~PMF_ALL_TIMES;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -353
BANDI4
ASGNI4
line 462
;462:		pm->ps->pm_time = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 463
;463:	}
LABELV $190
line 464
;464:}
LABELV $188
endproc PM_WaterJumpMove 12 4
proc PM_WaterMove 76 16
line 472
;465:
;466:/*
;467:===================
;468:PM_WaterMove
;469:
;470:===================
;471:*/
;472:static void PM_WaterMove( void ) {
line 480
;473:	int		i;
;474:	vec3_t	wishvel;
;475:	float	wishspeed;
;476:	vec3_t	wishdir;
;477:	float	scale;
;478:	float	vel;
;479:
;480:	if ( PM_CheckWaterJump() ) {
ADDRLP4 40
ADDRGP4 PM_CheckWaterJump
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $193
line 481
;481:		PM_WaterJumpMove();
ADDRGP4 PM_WaterJumpMove
CALLV
pop
line 482
;482:		return;
ADDRGP4 $192
JUMPV
LABELV $193
line 498
;483:	}
;484:#if 0
;485:	// jump = head for surface
;486:	if ( pm->cmd.upmove >= 10 ) {
;487:		if (pm->ps->velocity[2] > -300) {
;488:			if ( pm->watertype == CONTENTS_WATER ) {
;489:				pm->ps->velocity[2] = 100;
;490:			} else if (pm->watertype == CONTENTS_SLIME) {
;491:				pm->ps->velocity[2] = 80;
;492:			} else {
;493:				pm->ps->velocity[2] = 50;
;494:			}
;495:		}
;496:	}
;497:#endif
;498:	PM_Friction ();
ADDRGP4 PM_Friction
CALLV
pop
line 500
;499:
;500:	scale = PM_CmdScale( &pm->cmd );
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 44
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 44
INDIRF4
ASGNF4
line 504
;501:	//
;502:	// user intentions
;503:	//
;504:	if ( !scale ) {
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $195
line 505
;505:		wishvel[0] = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 506
;506:		wishvel[1] = 0;
ADDRLP4 8+4
CNSTF4 0
ASGNF4
line 507
;507:		wishvel[2] = -60;		// sink towards bottom
ADDRLP4 8+8
CNSTF4 3262119936
ASGNF4
line 508
;508:	} else {
ADDRGP4 $196
JUMPV
LABELV $195
line 509
;509:		for (i=0 ; i<3 ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $199
line 510
;510:			wishvel[i] = scale * pml.forward[i]*pm->cmd.forwardmove + scale * pml.right[i]*pm->cmd.rightmove;
ADDRLP4 48
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 56
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 48
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRF4
ADDRLP4 48
INDIRI4
ADDRGP4 pml
ADDP4
INDIRF4
MULF4
ADDRLP4 56
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDRLP4 4
INDIRF4
ADDRLP4 48
INDIRI4
ADDRGP4 pml+12
ADDP4
INDIRF4
MULF4
ADDRLP4 56
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDF4
ASGNF4
LABELV $200
line 509
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $199
line 512
;511:
;512:		wishvel[2] += scale * pm->cmd.upmove;
ADDRLP4 8+8
ADDRLP4 8+8
INDIRF4
ADDRLP4 4
INDIRF4
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDF4
ASGNF4
line 513
;513:	}
LABELV $196
line 515
;514:
;515:	VectorCopy (wishvel, wishdir);
ADDRLP4 24
ADDRLP4 8
INDIRB
ASGNB 12
line 516
;516:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 24
ARGP4
ADDRLP4 48
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 48
INDIRF4
ASGNF4
line 518
;517:
;518:	if ( wishspeed > pm->ps->speed * pm_swimScale ) {
ADDRLP4 20
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_swimScale
INDIRF4
MULF4
LEF4 $205
line 519
;519:		wishspeed = pm->ps->speed * pm_swimScale;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_swimScale
INDIRF4
MULF4
ASGNF4
line 520
;520:	}
LABELV $205
line 522
;521:
;522:	PM_Accelerate (wishdir, wishspeed, pm_wateraccelerate);
ADDRLP4 24
ARGP4
ADDRLP4 20
INDIRF4
ARGF4
ADDRGP4 pm_wateraccelerate
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 525
;523:
;524:	// make sure we can go up slopes easily under water
;525:	if ( pml.groundPlane && DotProduct( pm->ps->velocity, pml.groundTrace.plane.normal ) < 0 ) {
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $207
ADDRLP4 52
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRGP4 pml+52+24
INDIRF4
MULF4
ADDRLP4 52
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRGP4 pml+52+24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 52
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRGP4 pml+52+24+8
INDIRF4
MULF4
ADDF4
CNSTF4 0
GEF4 $207
line 526
;526:		vel = VectorLength(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 56
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 56
INDIRF4
ASGNF4
line 528
;527:		// slide along the ground plane
;528:		PM_ClipVelocity (pm->ps->velocity, pml.groundTrace.plane.normal, 
ADDRLP4 60
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 531
;529:			pm->ps->velocity, OVERCLIP );
;530:
;531:		VectorNormalize(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 532
;532:		VectorScale(pm->ps->velocity, vel, pm->ps->velocity);
ADDRLP4 64
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
ADDRLP4 72
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
line 533
;533:	}
LABELV $207
line 535
;534:
;535:	PM_SlideMove( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 PM_SlideMove
CALLI4
pop
line 536
;536:}
LABELV $192
endproc PM_WaterMove 76 16
proc PM_FlyMove 52 12
line 561
;537:
;538:#ifdef MISSIONPACK
;539:/*
;540:===================
;541:PM_InvulnerabilityMove
;542:
;543:Only with the invulnerability powerup
;544:===================
;545:*/
;546:static void PM_InvulnerabilityMove( void ) {
;547:	pm->cmd.forwardmove = 0;
;548:	pm->cmd.rightmove = 0;
;549:	pm->cmd.upmove = 0;
;550:	VectorClear(pm->ps->velocity);
;551:}
;552:#endif
;553:
;554:/*
;555:===================
;556:PM_FlyMove
;557:
;558:Only with the flight powerup
;559:===================
;560:*/
;561:static void PM_FlyMove( void ) {
line 569
;562:	int		i;
;563:	vec3_t	wishvel;
;564:	float	wishspeed;
;565:	vec3_t	wishdir;
;566:	float	scale;
;567:
;568:	// normal slowdown
;569:	PM_Friction ();
ADDRGP4 PM_Friction
CALLV
pop
line 571
;570:
;571:	scale = PM_CmdScale( &pm->cmd );
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 36
INDIRF4
ASGNF4
line 575
;572:	//
;573:	// user intentions
;574:	//
;575:	if ( !scale ) {
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $221
line 576
;576:		wishvel[0] = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 577
;577:		wishvel[1] = 0;
ADDRLP4 8+4
CNSTF4 0
ASGNF4
line 578
;578:		wishvel[2] = 0;
ADDRLP4 8+8
CNSTF4 0
ASGNF4
line 579
;579:	} else {
ADDRGP4 $222
JUMPV
LABELV $221
line 580
;580:		for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $225
line 581
;581:			wishvel[i] = scale * pml.forward[i]*pm->cmd.forwardmove + scale * pml.right[i]*pm->cmd.rightmove;
ADDRLP4 40
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 48
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 40
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRF4
ADDRLP4 40
INDIRI4
ADDRGP4 pml
ADDP4
INDIRF4
MULF4
ADDRLP4 48
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDRLP4 4
INDIRF4
ADDRLP4 40
INDIRI4
ADDRGP4 pml+12
ADDP4
INDIRF4
MULF4
ADDRLP4 48
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDF4
ASGNF4
line 582
;582:		}
LABELV $226
line 580
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $225
line 584
;583:
;584:		wishvel[2] += scale * pm->cmd.upmove;
ADDRLP4 8+8
ADDRLP4 8+8
INDIRF4
ADDRLP4 4
INDIRF4
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDF4
ASGNF4
line 585
;585:	}
LABELV $222
line 587
;586:
;587:	VectorCopy (wishvel, wishdir);
ADDRLP4 20
ADDRLP4 8
INDIRB
ASGNB 12
line 588
;588:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 20
ARGP4
ADDRLP4 40
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 32
ADDRLP4 40
INDIRF4
ASGNF4
line 590
;589:
;590:	PM_Accelerate (wishdir, wishspeed, pm_flyaccelerate);
ADDRLP4 20
ARGP4
ADDRLP4 32
INDIRF4
ARGF4
ADDRGP4 pm_flyaccelerate
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 592
;591:
;592:	PM_StepSlideMove( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 PM_StepSlideMove
CALLV
pop
line 593
;593:}
LABELV $220
endproc PM_FlyMove 52 12
proc PM_AirMove 80 16
line 602
;594:
;595:
;596:/*
;597:===================
;598:PM_AirMove
;599:
;600:===================
;601:*/
;602:static void PM_AirMove( void ) {
line 611
;603:	int			i;
;604:	vec3_t		wishvel;
;605:	float		fmove, smove;
;606:	vec3_t		wishdir;
;607:	float		wishspeed;
;608:	float		scale;
;609:	usercmd_t	cmd;
;610:
;611:	PM_Friction();
ADDRGP4 PM_Friction
CALLV
pop
line 613
;612:
;613:	fmove = pm->cmd.forwardmove;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 614
;614:	smove = pm->cmd.rightmove;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 616
;615:
;616:	cmd = pm->cmd;
ADDRLP4 44
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
INDIRB
ASGNB 24
line 617
;617:	scale = PM_CmdScale( &cmd );
ADDRLP4 44
ARGP4
ADDRLP4 68
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 68
INDIRF4
ASGNF4
line 620
;618:
;619:	// set the movementDir so clients can rotate the legs for strafing
;620:	PM_SetMovementDir();
ADDRGP4 PM_SetMovementDir
CALLV
pop
line 623
;621:
;622:	// project moves down to flat plane
;623:	pml.forward[2] = 0;
ADDRGP4 pml+8
CNSTF4 0
ASGNF4
line 624
;624:	pml.right[2] = 0;
ADDRGP4 pml+12+8
CNSTF4 0
ASGNF4
line 625
;625:	VectorNormalize (pml.forward);
ADDRGP4 pml
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 626
;626:	VectorNormalize (pml.right);
ADDRGP4 pml+12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 628
;627:
;628:	for ( i = 0 ; i < 2 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $236
line 629
;629:		wishvel[i] = pml.forward[i]*fmove + pml.right[i]*smove;
ADDRLP4 72
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 72
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 72
INDIRI4
ADDRGP4 pml
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 72
INDIRI4
ADDRGP4 pml+12
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
line 630
;630:	}
LABELV $237
line 628
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $236
line 631
;631:	wishvel[2] = 0;
ADDRLP4 4+8
CNSTF4 0
ASGNF4
line 633
;632:
;633:	VectorCopy (wishvel, wishdir);
ADDRLP4 24
ADDRLP4 4
INDIRB
ASGNB 12
line 634
;634:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 24
ARGP4
ADDRLP4 72
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 72
INDIRF4
ASGNF4
line 635
;635:	wishspeed *= scale;
ADDRLP4 36
ADDRLP4 36
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ASGNF4
line 638
;636:
;637:	// not on ground, so little effect on velocity
;638:	PM_Accelerate (wishdir, wishspeed, pm_airaccelerate);
ADDRLP4 24
ARGP4
ADDRLP4 36
INDIRF4
ARGF4
ADDRGP4 pm_airaccelerate
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 643
;639:
;640:	// we may have a ground plane that is very steep, even
;641:	// though we don't have a groundentity
;642:	// slide along the steep plane
;643:	if ( pml.groundPlane ) {
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $242
line 644
;644:		PM_ClipVelocity (pm->ps->velocity, pml.groundTrace.plane.normal, 
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 646
;645:			pm->ps->velocity, OVERCLIP );
;646:	}
LABELV $242
line 658
;647:
;648:#if 0
;649:	//ZOID:  If we are on the grapple, try stair-stepping
;650:	//this allows a player to use the grapple to pull himself
;651:	//over a ledge
;652:	if (pm->ps->pm_flags & PMF_GRAPPLE_PULL)
;653:		PM_StepSlideMove ( qtrue );
;654:	else
;655:		PM_SlideMove ( qtrue );
;656:#endif
;657:
;658:	PM_StepSlideMove ( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 PM_StepSlideMove
CALLV
pop
line 659
;659:}
LABELV $231
endproc PM_AirMove 80 16
proc PM_GrappleMove 52 4
line 667
;660:
;661:/*
;662:===================
;663:PM_GrappleMove
;664:
;665:===================
;666:*/
;667:static void PM_GrappleMove( void ) {
line 671
;668:	vec3_t vel, v;
;669:	float vlen;
;670:
;671:	VectorScale(pml.forward, -16, v);
ADDRLP4 28
CNSTF4 3246391296
ASGNF4
ADDRLP4 12
ADDRLP4 28
INDIRF4
ADDRGP4 pml
INDIRF4
MULF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 28
INDIRF4
ADDRGP4 pml+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 12+8
CNSTF4 3246391296
ADDRGP4 pml+8
INDIRF4
MULF4
ASGNF4
line 672
;672:	VectorAdd(pm->ps->grapplePoint, v, v);
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 32
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 32
INDIRP4
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 12+8
INDIRF4
ADDF4
ASGNF4
line 673
;673:	VectorSubtract(v, pm->ps->origin, vel);
ADDRLP4 36
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ADDRLP4 36
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 36
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 12+8
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 674
;674:	vlen = VectorLength(vel);
ADDRLP4 0
ARGP4
ADDRLP4 40
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 40
INDIRF4
ASGNF4
line 675
;675:	VectorNormalize( vel );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 677
;676:
;677:	if (vlen <= 100)
ADDRLP4 24
INDIRF4
CNSTF4 1120403456
GTF4 $260
line 678
;678:		VectorScale(vel, 10 * vlen, vel);
ADDRLP4 44
CNSTF4 1092616192
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1092616192
ADDRLP4 24
INDIRF4
MULF4
MULF4
ASGNF4
ADDRGP4 $261
JUMPV
LABELV $260
line 680
;679:	else
;680:		VectorScale(vel, 800, vel);
ADDRLP4 48
CNSTF4 1145569280
ASGNF4
ADDRLP4 0
ADDRLP4 48
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 48
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1145569280
ADDRLP4 0+8
INDIRF4
MULF4
ASGNF4
LABELV $261
line 682
;681:
;682:	VectorCopy(vel, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 684
;683:
;684:	pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 685
;685:}
LABELV $247
endproc PM_GrappleMove 52 4
proc PM_WalkMove 128 16
line 693
;686:
;687:/*
;688:===================
;689:PM_WalkMove
;690:
;691:===================
;692:*/
;693:static void PM_WalkMove( void ) {
line 704
;694:	int			i;
;695:	vec3_t		wishvel;
;696:	float		fmove, smove;
;697:	vec3_t		wishdir;
;698:	float		wishspeed;
;699:	float		scale;
;700:	usercmd_t	cmd;
;701:	float		accelerate;
;702:	float		vel;
;703:
;704:	if ( pm->waterlevel > 2 && DotProduct( pml.forward, pml.groundTrace.plane.normal ) > 0 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 2
LEI4 $272
ADDRGP4 pml
INDIRF4
ADDRGP4 pml+52+24
INDIRF4
MULF4
ADDRGP4 pml+4
INDIRF4
ADDRGP4 pml+52+24+4
INDIRF4
MULF4
ADDF4
ADDRGP4 pml+8
INDIRF4
ADDRGP4 pml+52+24+8
INDIRF4
MULF4
ADDF4
CNSTF4 0
LEF4 $272
line 706
;705:		// begin swimming
;706:		PM_WaterMove();
ADDRGP4 PM_WaterMove
CALLV
pop
line 707
;707:		return;
ADDRGP4 $271
JUMPV
LABELV $272
line 711
;708:	}
;709:
;710:
;711:	if ( PM_CheckJump () ) {
ADDRLP4 76
ADDRGP4 PM_CheckJump
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $284
line 713
;712:		// jumped away
;713:		if ( pm->waterlevel > 1 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LEI4 $286
line 714
;714:			PM_WaterMove();
ADDRGP4 PM_WaterMove
CALLV
pop
line 715
;715:		} else {
ADDRGP4 $271
JUMPV
LABELV $286
line 716
;716:			PM_AirMove();
ADDRGP4 PM_AirMove
CALLV
pop
line 717
;717:		}
line 718
;718:		return;
ADDRGP4 $271
JUMPV
LABELV $284
line 721
;719:	}
;720:
;721:	PM_Friction ();
ADDRGP4 PM_Friction
CALLV
pop
line 723
;722:
;723:	fmove = pm->cmd.forwardmove;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 724
;724:	smove = pm->cmd.rightmove;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 726
;725:
;726:	cmd = pm->cmd;
ADDRLP4 48
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
INDIRB
ASGNB 24
line 727
;727:	scale = PM_CmdScale( &cmd );
ADDRLP4 48
ARGP4
ADDRLP4 80
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 44
ADDRLP4 80
INDIRF4
ASGNF4
line 730
;728:
;729:	// set the movementDir so clients can rotate the legs for strafing
;730:	PM_SetMovementDir();
ADDRGP4 PM_SetMovementDir
CALLV
pop
line 733
;731:
;732:	// project moves down to flat plane
;733:	pml.forward[2] = 0;
ADDRGP4 pml+8
CNSTF4 0
ASGNF4
line 734
;734:	pml.right[2] = 0;
ADDRGP4 pml+12+8
CNSTF4 0
ASGNF4
line 737
;735:
;736:	// project the forward and right directions onto the ground plane
;737:	PM_ClipVelocity (pml.forward, pml.groundTrace.plane.normal, pml.forward, OVERCLIP );
ADDRLP4 84
ADDRGP4 pml
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 738
;738:	PM_ClipVelocity (pml.right, pml.groundTrace.plane.normal, pml.right, OVERCLIP );
ADDRGP4 pml+12
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRGP4 pml+12
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 740
;739:	//
;740:	VectorNormalize (pml.forward);
ADDRGP4 pml
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 741
;741:	VectorNormalize (pml.right);
ADDRGP4 pml+12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 743
;742:
;743:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $298
line 744
;744:		wishvel[i] = pml.forward[i]*fmove + pml.right[i]*smove;
ADDRLP4 88
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 88
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 88
INDIRI4
ADDRGP4 pml
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 88
INDIRI4
ADDRGP4 pml+12
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
line 745
;745:	}
LABELV $299
line 743
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $298
line 749
;746:	// when going up or down slopes the wish velocity should Not be zero
;747://	wishvel[2] = 0;
;748:
;749:	VectorCopy (wishvel, wishdir);
ADDRLP4 32
ADDRLP4 4
INDIRB
ASGNB 12
line 750
;750:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 32
ARGP4
ADDRLP4 88
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 88
INDIRF4
ASGNF4
line 751
;751:	wishspeed *= scale;
ADDRLP4 24
ADDRLP4 24
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ASGNF4
line 754
;752:
;753:	// clamp the speed lower if ducking
;754:	if ( pm->ps->pm_flags & PMF_DUCKED ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $303
line 755
;755:		if ( wishspeed > pm->ps->speed * pm_duckScale ) {
ADDRLP4 24
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_duckScale
INDIRF4
MULF4
LEF4 $305
line 756
;756:			wishspeed = pm->ps->speed * pm_duckScale;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_duckScale
INDIRF4
MULF4
ASGNF4
line 757
;757:		}
LABELV $305
line 758
;758:	}
LABELV $303
line 761
;759:
;760:	// clamp the speed lower if wading or walking on the bottom
;761:	if ( pm->waterlevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 0
EQI4 $307
line 764
;762:		float	waterScale;
;763:
;764:		waterScale = pm->waterlevel / 3.0;
ADDRLP4 92
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1077936128
DIVF4
ASGNF4
line 765
;765:		waterScale = 1.0 - ( 1.0 - pm_swimScale ) * waterScale;
ADDRLP4 96
CNSTF4 1065353216
ASGNF4
ADDRLP4 92
ADDRLP4 96
INDIRF4
ADDRLP4 96
INDIRF4
ADDRGP4 pm_swimScale
INDIRF4
SUBF4
ADDRLP4 92
INDIRF4
MULF4
SUBF4
ASGNF4
line 766
;766:		if ( wishspeed > pm->ps->speed * waterScale ) {
ADDRLP4 24
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 92
INDIRF4
MULF4
LEF4 $309
line 767
;767:			wishspeed = pm->ps->speed * waterScale;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 92
INDIRF4
MULF4
ASGNF4
line 768
;768:		}
LABELV $309
line 769
;769:	}
LABELV $307
line 773
;770:
;771:	// when a player gets hit, they temporarily lose
;772:	// full control, which allows them to be moved a bit
;773:	if ( ( pml.groundTrace.surfaceFlags & SURF_SLICK ) || pm->ps->pm_flags & PMF_TIME_KNOCKBACK ) {
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 92
INDIRI4
NEI4 $315
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
BANDI4
ADDRLP4 92
INDIRI4
EQI4 $311
LABELV $315
line 774
;774:		accelerate = pm_airaccelerate;
ADDRLP4 72
ADDRGP4 pm_airaccelerate
INDIRF4
ASGNF4
line 775
;775:	} else {
ADDRGP4 $312
JUMPV
LABELV $311
line 776
;776:		accelerate = pm_accelerate;
ADDRLP4 72
ADDRGP4 pm_accelerate
INDIRF4
ASGNF4
line 777
;777:	}
LABELV $312
line 779
;778:
;779:	PM_Accelerate (wishdir, wishspeed, accelerate);
ADDRLP4 32
ARGP4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 72
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 784
;780:
;781:	//Com_Printf("velocity = %1.1f %1.1f %1.1f\n", pm->ps->velocity[0], pm->ps->velocity[1], pm->ps->velocity[2]);
;782:	//Com_Printf("velocity1 = %1.1f\n", VectorLength(pm->ps->velocity));
;783:
;784:	if ( ( pml.groundTrace.surfaceFlags & SURF_SLICK ) || pm->ps->pm_flags & PMF_TIME_KNOCKBACK ) {
ADDRLP4 96
CNSTI4 0
ASGNI4
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 96
INDIRI4
NEI4 $320
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
BANDI4
ADDRLP4 96
INDIRI4
EQI4 $316
LABELV $320
line 785
;785:		pm->ps->velocity[2] -= pm->ps->gravity * pml.frametime;
ADDRLP4 100
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 104
ADDRLP4 100
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRF4
ADDRLP4 100
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pml+36
INDIRF4
MULF4
SUBF4
ASGNF4
line 786
;786:	} else {
LABELV $316
line 789
;787:		// don't reset the z velocity for slopes
;788://		pm->ps->velocity[2] = 0;
;789:	}
LABELV $317
line 791
;790:
;791:	vel = VectorLength(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 100
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 100
INDIRF4
ASGNF4
line 794
;792:
;793:	// slide along the ground plane
;794:	PM_ClipVelocity (pm->ps->velocity, pml.groundTrace.plane.normal, 
ADDRLP4 104
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 104
INDIRP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 798
;795:		pm->ps->velocity, OVERCLIP );
;796:
;797:	// don't decrease velocity when going up or down a slope
;798:	VectorNormalize(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 799
;799:	VectorScale(pm->ps->velocity, vel, pm->ps->velocity);
ADDRLP4 108
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
ADDRLP4 112
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
ADDRLP4 116
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 802
;800:
;801:	// don't do anything if standing still
;802:	if (!pm->ps->velocity[0] && !pm->ps->velocity[1]) {
ADDRLP4 120
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 124
CNSTF4 0
ASGNF4
ADDRLP4 120
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 124
INDIRF4
NEF4 $324
ADDRLP4 120
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 124
INDIRF4
NEF4 $324
line 803
;803:		return;
ADDRGP4 $271
JUMPV
LABELV $324
line 806
;804:	}
;805:
;806:	PM_StepSlideMove( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 PM_StepSlideMove
CALLV
pop
line 810
;807:
;808:	//Com_Printf("velocity2 = %1.1f\n", VectorLength(pm->ps->velocity));
;809:
;810:}
LABELV $271
endproc PM_WalkMove 128 16
proc PM_DeadMove 20 4
line 818
;811:
;812:
;813:/*
;814:==============
;815:PM_DeadMove
;816:==============
;817:*/
;818:static void PM_DeadMove( void ) {
line 821
;819:	float	forward;
;820:
;821:	if ( !pml.walking ) {
ADDRGP4 pml+44
INDIRI4
CNSTI4 0
NEI4 $327
line 822
;822:		return;
ADDRGP4 $326
JUMPV
LABELV $327
line 827
;823:	}
;824:
;825:	// extra friction
;826:
;827:	forward = VectorLength (pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 828
;828:	forward -= 20;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1101004800
SUBF4
ASGNF4
line 829
;829:	if ( forward <= 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
GTF4 $330
line 830
;830:		VectorClear (pm->ps->velocity);
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 831
;831:	} else {
ADDRGP4 $331
JUMPV
LABELV $330
line 832
;832:		VectorNormalize (pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 833
;833:		VectorScale (pm->ps->velocity, forward, pm->ps->velocity);
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 834
;834:	}
LABELV $331
line 835
;835:}
LABELV $326
endproc PM_DeadMove 20 4
proc PM_NoclipMove 104 12
line 843
;836:
;837:
;838:/*
;839:===============
;840:PM_NoclipMove
;841:===============
;842:*/
;843:static void PM_NoclipMove( void ) {
line 852
;844:	float	speed, drop, friction, control, newspeed;
;845:	int			i;
;846:	vec3_t		wishvel;
;847:	float		fmove, smove;
;848:	vec3_t		wishdir;
;849:	float		wishspeed;
;850:	float		scale;
;851:
;852:	pm->ps->viewheight = DEFAULT_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 26
ASGNI4
line 856
;853:
;854:	// friction
;855:
;856:	speed = VectorLength (pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 64
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 64
INDIRF4
ASGNF4
line 857
;857:	if (speed < 1)
ADDRLP4 24
INDIRF4
CNSTF4 1065353216
GEF4 $333
line 858
;858:	{
line 859
;859:		VectorCopy (vec3_origin, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 860
;860:	}
ADDRGP4 $334
JUMPV
LABELV $333
line 862
;861:	else
;862:	{
line 863
;863:		drop = 0;
ADDRLP4 52
CNSTF4 0
ASGNF4
line 865
;864:
;865:		friction = pm_friction*1.5;	// extra friction
ADDRLP4 56
CNSTF4 1069547520
ADDRGP4 pm_friction
INDIRF4
MULF4
ASGNF4
line 866
;866:		control = speed < pm_stopspeed ? pm_stopspeed : speed;
ADDRLP4 24
INDIRF4
ADDRGP4 pm_stopspeed
INDIRF4
GEF4 $336
ADDRLP4 68
ADDRGP4 pm_stopspeed
INDIRF4
ASGNF4
ADDRGP4 $337
JUMPV
LABELV $336
ADDRLP4 68
ADDRLP4 24
INDIRF4
ASGNF4
LABELV $337
ADDRLP4 60
ADDRLP4 68
INDIRF4
ASGNF4
line 867
;867:		drop += control*friction*pml.frametime;
ADDRLP4 52
ADDRLP4 52
INDIRF4
ADDRLP4 60
INDIRF4
ADDRLP4 56
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 870
;868:
;869:		// scale the velocity
;870:		newspeed = speed - drop;
ADDRLP4 28
ADDRLP4 24
INDIRF4
ADDRLP4 52
INDIRF4
SUBF4
ASGNF4
line 871
;871:		if (newspeed < 0)
ADDRLP4 28
INDIRF4
CNSTF4 0
GEF4 $339
line 872
;872:			newspeed = 0;
ADDRLP4 28
CNSTF4 0
ASGNF4
LABELV $339
line 873
;873:		newspeed /= speed;
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 24
INDIRF4
DIVF4
ASGNF4
line 875
;874:
;875:		VectorScale (pm->ps->velocity, newspeed, pm->ps->velocity);
ADDRLP4 72
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 876
;876:	}
LABELV $334
line 879
;877:
;878:	// accelerate
;879:	scale = PM_CmdScale( &pm->cmd );
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 68
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 68
INDIRF4
ASGNF4
line 881
;880:
;881:	fmove = pm->cmd.forwardmove;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 882
;882:	smove = pm->cmd.rightmove;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 884
;883:	
;884:	for (i=0 ; i<3 ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $341
line 885
;885:		wishvel[i] = pml.forward[i]*fmove + pml.right[i]*smove;
ADDRLP4 72
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 72
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 72
INDIRI4
ADDRGP4 pml
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 72
INDIRI4
ADDRGP4 pml+12
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $342
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
LTI4 $341
line 886
;886:	wishvel[2] += pm->cmd.upmove;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ADDF4
ASGNF4
line 888
;887:
;888:	VectorCopy (wishvel, wishdir);
ADDRLP4 32
ADDRLP4 4
INDIRB
ASGNB 12
line 889
;889:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 32
ARGP4
ADDRLP4 76
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 44
ADDRLP4 76
INDIRF4
ASGNF4
line 890
;890:	wishspeed *= scale;
ADDRLP4 44
ADDRLP4 44
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
ASGNF4
line 892
;891:
;892:	PM_Accelerate( wishdir, wishspeed, pm_accelerate );
ADDRLP4 32
ARGP4
ADDRLP4 44
INDIRF4
ARGF4
ADDRGP4 pm_accelerate
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 895
;893:
;894:	// move
;895:	VectorMA (pm->ps->origin, pml.frametime, pm->ps->velocity, pm->ps->origin);
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 84
ADDRLP4 80
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 92
ADDRLP4 88
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 96
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 100
ADDRLP4 96
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 896
;896:}
LABELV $332
endproc PM_NoclipMove 104 12
proc PM_FootstepForSurface 0 0
line 907
;897:
;898://============================================================================
;899:
;900:/*
;901:================
;902:PM_FootstepForSurface
;903:
;904:Returns an event number apropriate for the groundsurface
;905:================
;906:*/
;907:static int PM_FootstepForSurface( void ) {
line 908
;908:	if ( pml.groundTrace.surfaceFlags & SURF_NOSTEPS ) {
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $351
line 909
;909:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $350
JUMPV
LABELV $351
line 911
;910:	}
;911:	if ( pml.groundTrace.surfaceFlags & SURF_METALSTEPS ) {
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $355
line 912
;912:		return EV_FOOTSTEP_METAL;
CNSTI4 2
RETI4
ADDRGP4 $350
JUMPV
LABELV $355
line 914
;913:	}
;914:	return EV_FOOTSTEP;
CNSTI4 1
RETI4
LABELV $350
endproc PM_FootstepForSurface 0 0
proc PM_CrashLand 52 4
line 925
;915:}
;916:
;917:
;918:/*
;919:=================
;920:PM_CrashLand
;921:
;922:Check for hard landings that generate sound events
;923:=================
;924:*/
;925:static void PM_CrashLand( void ) {
line 933
;926:	float		delta;
;927:	float		dist;
;928:	float		vel, acc;
;929:	float		t;
;930:	float		a, b, c, den;
;931:
;932:	// decide which landing animation to use
;933:	if ( pm->ps->pm_flags & PMF_BACKWARDS_JUMP ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $360
line 934
;934:		PM_ForceLegsAnim( LEGS_LANDB );
CNSTI4 21
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 935
;935:	} else {
ADDRGP4 $361
JUMPV
LABELV $360
line 936
;936:		PM_ForceLegsAnim( LEGS_LAND );
CNSTI4 19
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 937
;937:	}
LABELV $361
line 939
;938:
;939:	pm->ps->legsTimer = TIMER_LAND;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 130
ASGNI4
line 942
;940:
;941:	// calculate the exact velocity on landing
;942:	dist = pm->ps->origin[2] - pml.previous_origin[2];
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRGP4 pml+116+8
INDIRF4
SUBF4
ASGNF4
line 943
;943:	vel = pml.previous_velocity[2];
ADDRLP4 8
ADDRGP4 pml+128+8
INDIRF4
ASGNF4
line 944
;944:	acc = -pm->ps->gravity;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
NEGI4
CVIF4 4
ASGNF4
line 946
;945:
;946:	a = acc / 2;
ADDRLP4 16
ADDRLP4 12
INDIRF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 947
;947:	b = vel;
ADDRLP4 4
ADDRLP4 8
INDIRF4
ASGNF4
line 948
;948:	c = -dist;
ADDRLP4 32
ADDRLP4 24
INDIRF4
NEGF4
ASGNF4
line 950
;949:
;950:	den =  b * b - 4 * a * c;
ADDRLP4 20
ADDRLP4 4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
CNSTF4 1082130432
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 32
INDIRF4
MULF4
SUBF4
ASGNF4
line 951
;951:	if ( den < 0 ) {
ADDRLP4 20
INDIRF4
CNSTF4 0
GEF4 $366
line 952
;952:		return;
ADDRGP4 $359
JUMPV
LABELV $366
line 954
;953:	}
;954:	t = (-b - sqrt( den ) ) / ( 2 * a );
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 4
INDIRF4
NEGF4
ADDRLP4 40
INDIRF4
SUBF4
CNSTF4 1073741824
ADDRLP4 16
INDIRF4
MULF4
DIVF4
ASGNF4
line 956
;955:
;956:	delta = vel + t * acc;
ADDRLP4 0
ADDRLP4 8
INDIRF4
ADDRLP4 28
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 957
;957:	delta = delta*delta * 0.0001;
ADDRLP4 0
CNSTF4 953267991
ADDRLP4 0
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
MULF4
ASGNF4
line 960
;958:
;959:	// ducking while falling doubles damage
;960:	if ( pm->ps->pm_flags & PMF_DUCKED ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $368
line 961
;961:		delta *= 2;
ADDRLP4 0
CNSTF4 1073741824
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 962
;962:	}
LABELV $368
line 965
;963:
;964:	// never take falling damage if completely underwater
;965:	if ( pm->waterlevel == 3 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 3
NEI4 $370
line 966
;966:		return;
ADDRGP4 $359
JUMPV
LABELV $370
line 970
;967:	}
;968:
;969:	// reduce falling damage if there is standing water
;970:	if ( pm->waterlevel == 2 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 2
NEI4 $372
line 971
;971:		delta *= 0.25;
ADDRLP4 0
CNSTF4 1048576000
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 972
;972:	}
LABELV $372
line 973
;973:	if ( pm->waterlevel == 1 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
NEI4 $374
line 974
;974:		delta *= 0.5;
ADDRLP4 0
CNSTF4 1056964608
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 975
;975:	}
LABELV $374
line 977
;976:
;977:	if ( delta < 1 ) {
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
GEF4 $376
line 978
;978:		return;
ADDRGP4 $359
JUMPV
LABELV $376
line 985
;979:	}
;980:
;981:	// create a local entity event to play the sound
;982:
;983:	// SURF_NODAMAGE is used for bounce pads where you don't ever
;984:	// want to take damage or play a crunch sound
;985:	if ( !(pml.groundTrace.surfaceFlags & SURF_NODAMAGE) )  {
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $378
line 986
;986:		if ( delta > 60 ) {
ADDRLP4 0
INDIRF4
CNSTF4 1114636288
LEF4 $382
line 987
;987:			PM_AddEvent( EV_FALL_FAR );
CNSTI4 12
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 988
;988:		} else if ( delta > 40 ) {
ADDRGP4 $383
JUMPV
LABELV $382
ADDRLP4 0
INDIRF4
CNSTF4 1109393408
LEF4 $384
line 990
;989:			// this is a pain grunt, so don't play it if dead
;990:			if ( pm->ps->stats[STAT_HEALTH] > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
LEI4 $385
line 991
;991:				PM_AddEvent( EV_FALL_MEDIUM );
CNSTI4 11
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 992
;992:			}
line 993
;993:		} else if ( delta > 7 ) {
ADDRGP4 $385
JUMPV
LABELV $384
ADDRLP4 0
INDIRF4
CNSTF4 1088421888
LEF4 $388
line 994
;994:			PM_AddEvent( EV_FALL_SHORT );
CNSTI4 10
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 995
;995:		} else {
ADDRGP4 $389
JUMPV
LABELV $388
line 996
;996:			PM_AddEvent( PM_FootstepForSurface() );
ADDRLP4 48
ADDRGP4 PM_FootstepForSurface
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 997
;997:		}
LABELV $389
LABELV $385
LABELV $383
line 998
;998:	}
LABELV $378
line 1001
;999:
;1000:	// start footstep cycle over
;1001:	pm->ps->bobCycle = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 1002
;1002:}
LABELV $359
endproc PM_CrashLand 52 4
proc PM_CorrectAllSolid 36 28
line 1025
;1003:
;1004:/*
;1005:=============
;1006:PM_CheckStuck
;1007:=============
;1008:*/
;1009:/*
;1010:void PM_CheckStuck(void) {
;1011:	trace_t trace;
;1012:
;1013:	pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, pm->ps->origin, pm->ps->clientNum, pm->tracemask);
;1014:	if (trace.allsolid) {
;1015:		//int shit = qtrue;
;1016:	}
;1017:}
;1018:*/
;1019:
;1020:/*
;1021:=============
;1022:PM_CorrectAllSolid
;1023:=============
;1024:*/
;1025:static int PM_CorrectAllSolid( trace_t *trace ) {
line 1029
;1026:	int			i, j, k;
;1027:	vec3_t		point;
;1028:
;1029:	if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $391
line 1030
;1030:		Com_Printf("%i:allsolid\n", c_pmove);
ADDRGP4 $393
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1031
;1031:	}
LABELV $391
line 1034
;1032:
;1033:	// jitter around
;1034:	for (i = -1; i <= 1; i++) {
ADDRLP4 20
CNSTI4 -1
ASGNI4
LABELV $394
line 1035
;1035:		for (j = -1; j <= 1; j++) {
ADDRLP4 16
CNSTI4 -1
ASGNI4
LABELV $398
line 1036
;1036:			for (k = -1; k <= 1; k++) {
ADDRLP4 12
CNSTI4 -1
ASGNI4
LABELV $402
line 1037
;1037:				VectorCopy(pm->ps->origin, point);
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1038
;1038:				point[0] += (float) i;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1039
;1039:				point[1] += (float) j;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 16
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1040
;1040:				point[2] += (float) k;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 12
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1041
;1041:				pm->trace (trace, point, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 24
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 24
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CALLV
pop
line 1042
;1042:				if ( !trace->allsolid ) {
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $408
line 1043
;1043:					point[0] = pm->ps->origin[0];
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
line 1044
;1044:					point[1] = pm->ps->origin[1];
ADDRLP4 0+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1045
;1045:					point[2] = pm->ps->origin[2] - 0.25;
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1048576000
SUBF4
ASGNF4
line 1047
;1046:
;1047:					pm->trace (trace, pm->ps->origin, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CALLV
pop
line 1048
;1048:					pml.groundTrace = *trace;
ADDRGP4 pml+52
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 56
line 1049
;1049:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $390
JUMPV
LABELV $408
line 1051
;1050:				}
;1051:			}
LABELV $403
line 1036
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
LEI4 $402
line 1052
;1052:		}
LABELV $399
line 1035
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
LEI4 $398
line 1053
;1053:	}
LABELV $395
line 1034
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 1
LEI4 $394
line 1055
;1054:
;1055:	pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 1023
ASGNI4
line 1056
;1056:	pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 1057
;1057:	pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 1059
;1058:
;1059:	return qfalse;
CNSTI4 0
RETI4
LABELV $390
endproc PM_CorrectAllSolid 36 28
proc PM_GroundTraceMissed 80 28
line 1070
;1060:}
;1061:
;1062:
;1063:/*
;1064:=============
;1065:PM_GroundTraceMissed
;1066:
;1067:The ground trace didn't hit a surface, so we are in freefall
;1068:=============
;1069:*/
;1070:static void PM_GroundTraceMissed( void ) {
line 1074
;1071:	trace_t		trace;
;1072:	vec3_t		point;
;1073:
;1074:	if ( pm->ps->groundEntityNum != ENTITYNUM_NONE ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $416
line 1076
;1075:		// we just transitioned into freefall
;1076:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $418
line 1077
;1077:			Com_Printf("%i:lift\n", c_pmove);
ADDRGP4 $420
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1078
;1078:		}
LABELV $418
line 1082
;1079:
;1080:		// if they aren't in a jumping animation and the ground is a ways away, force into it
;1081:		// if we didn't do the trace, the player would be backflipping down staircases
;1082:		VectorCopy( pm->ps->origin, point );
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1083
;1083:		point[2] -= 64;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1115684864
SUBF4
ASGNF4
line 1085
;1084:
;1085:		pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRLP4 12
ARGP4
ADDRLP4 68
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 72
ADDRLP4 68
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CALLV
pop
line 1086
;1086:		if ( trace.fraction == 1.0 ) {
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
NEF4 $422
line 1087
;1087:			if ( pm->cmd.forwardmove >= 0 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LTI4 $425
line 1088
;1088:				PM_ForceLegsAnim( LEGS_JUMP );
CNSTI4 18
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 1089
;1089:				pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 1090
;1090:			} else {
ADDRGP4 $426
JUMPV
LABELV $425
line 1091
;1091:				PM_ForceLegsAnim( LEGS_JUMPB );
CNSTI4 20
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 1092
;1092:				pm->ps->pm_flags |= PMF_BACKWARDS_JUMP;
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1093
;1093:			}
LABELV $426
line 1094
;1094:		}
LABELV $422
line 1095
;1095:	}
LABELV $416
line 1097
;1096:
;1097:	pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 1023
ASGNI4
line 1098
;1098:	pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 1099
;1099:	pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 1100
;1100:}
LABELV $415
endproc PM_GroundTraceMissed 80 28
proc PM_GroundTrace 88 28
line 1108
;1101:
;1102:
;1103:/*
;1104:=============
;1105:PM_GroundTrace
;1106:=============
;1107:*/
;1108:static void PM_GroundTrace( void ) {
line 1112
;1109:	vec3_t		point;
;1110:	trace_t		trace;
;1111:
;1112:	point[0] = pm->ps->origin[0];
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
line 1113
;1113:	point[1] = pm->ps->origin[1];
ADDRLP4 56+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1114
;1114:	point[2] = pm->ps->origin[2] - 0.25;
ADDRLP4 56+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1048576000
SUBF4
ASGNF4
line 1116
;1115:
;1116:	pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRLP4 0
ARGP4
ADDRLP4 68
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 72
ADDRLP4 68
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CALLV
pop
line 1117
;1117:	pml.groundTrace = trace;
ADDRGP4 pml+52
ADDRLP4 0
INDIRB
ASGNB 56
line 1120
;1118:
;1119:	// do something corrective if the trace starts in a solid...
;1120:	if ( trace.allsolid ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $433
line 1123
;1121:
;1122:
;1123:		if ( !PM_CorrectAllSolid(&trace) )
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRGP4 PM_CorrectAllSolid
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $435
line 1124
;1124:			return;
ADDRGP4 $429
JUMPV
LABELV $435
line 1125
;1125:	}
LABELV $433
line 1128
;1126:
;1127:	// if the trace didn't hit anything, we are in free fall
;1128:	if ( trace.fraction == 1.0 ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $437
line 1129
;1129:		PM_GroundTraceMissed();
ADDRGP4 PM_GroundTraceMissed
CALLV
pop
line 1130
;1130:		pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 1131
;1131:		pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 1154
;1132:		
;1133:		// Shafe - Holy Hell  How do I make this read g_multijump? ???
;1134:		/*		
;1135:		//if (g_MultiJump.integer != 0)
;1136:		//{ 
;1137:			
;1138:			// Ignore and reset multijumps and wall jump if they have the jetpack
;1139:			if (pm->ps->powerups[PW_FLIGHT]) 
;1140:			{
;1141:				pm->ps->MultiJumps = 0;
;1142:			} 
;1143:			else
;1144:			{
;1145:
;1146:				// Go ahead and do the multijump
;1147:				if (pm->ps->MultiJumps < g_MultiJump.integer)
;1148:				{
;1149:					PM_CheckJump ();
;1150:				}
;1151:			}
;1152:		} 
;1153:		*/
;1154:		return;
ADDRGP4 $429
JUMPV
LABELV $437
line 1158
;1155:	}
;1156:
;1157:	// check if getting thrown off the ground
;1158:	if ( pm->ps->velocity[2] > 0 && DotProduct( pm->ps->velocity, trace.plane.normal ) > 10 ) {
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 80
ADDRLP4 76
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ASGNF4
ADDRLP4 80
INDIRF4
CNSTF4 0
LEF4 $442
ADDRLP4 76
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0+24
INDIRF4
MULF4
ADDRLP4 76
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 0+24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 80
INDIRF4
ADDRLP4 0+24+8
INDIRF4
MULF4
ADDF4
CNSTF4 1092616192
LEF4 $442
line 1159
;1159:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $449
line 1160
;1160:			Com_Printf("%i:kickoff\n", c_pmove);
ADDRGP4 $451
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1161
;1161:		}
LABELV $449
line 1163
;1162:		// go into jump animation
;1163:		if ( pm->cmd.forwardmove >= 0 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LTI4 $452
line 1164
;1164:			PM_ForceLegsAnim( LEGS_JUMP );
CNSTI4 18
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 1165
;1165:			pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
ADDRLP4 84
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 1166
;1166:		} else {
ADDRGP4 $453
JUMPV
LABELV $452
line 1167
;1167:			PM_ForceLegsAnim( LEGS_JUMPB );
CNSTI4 20
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 1168
;1168:			pm->ps->pm_flags |= PMF_BACKWARDS_JUMP;
ADDRLP4 84
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1169
;1169:		}
LABELV $453
line 1171
;1170:
;1171:		pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 1023
ASGNI4
line 1172
;1172:		pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 1173
;1173:		pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 1174
;1174:		return;
ADDRGP4 $429
JUMPV
LABELV $442
line 1191
;1175:	}
;1176:	
;1177:
;1178:	// Shafe - Trep is the slope a wall?  If so allow a wall jump
;1179:	/*	I Think this was causing you not to be able to jump on slopes.
;1180:	if ( trace.plane.normal[2] < 1.00 ) 
;1181:	{  
;1182:		//if (pm->ps->MultiJumps < 4 ) 
;1183:		//{
;1184:			PM_CheckJump(); // Shafe - Trep - Wall jumping?
;1185:		//} 
;1186:	} // End Shafe
;1187:	*/
;1188:	
;1189:
;1190:	// slopes that are too steep will not be considered onground
;1191:	if ( trace.plane.normal[2] < MIN_WALK_NORMAL ) {  
ADDRLP4 0+24+8
INDIRF4
CNSTF4 1060320051
GEF4 $456
line 1196
;1192:		
;1193:		// Shafe - Wall Jumping 
;1194:	
;1195:		//if (pm->ps->MultiJumps < 4 ) {
;1196:			PM_CheckJump(); // Shafe - Trep - Wall jumping?
ADDRGP4 PM_CheckJump
CALLI4
pop
line 1200
;1197:		//}
;1198:	
;1199:		
;1200:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $460
line 1201
;1201:			Com_Printf("%i:steep\n", c_pmove);
ADDRGP4 $462
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1203
;1202:			
;1203:		}
LABELV $460
line 1206
;1204:		// FIXME: if they can't slide down the slope, let them
;1205:		// walk (sharp crevices)
;1206:		pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 1023
ASGNI4
line 1207
;1207:		pml.groundPlane = qtrue;
ADDRGP4 pml+48
CNSTI4 1
ASGNI4
line 1208
;1208:		pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 1209
;1209:		return;
ADDRGP4 $429
JUMPV
LABELV $456
line 1212
;1210:	}
;1211:
;1212:	pml.groundPlane = qtrue;
ADDRGP4 pml+48
CNSTI4 1
ASGNI4
line 1213
;1213:	pml.walking = qtrue;
ADDRGP4 pml+44
CNSTI4 1
ASGNI4
line 1216
;1214:
;1215:	// hitting solid ground will end a waterjump
;1216:	if (pm->ps->pm_flags & PMF_TIME_WATERJUMP)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $467
line 1217
;1217:	{
line 1218
;1218:		pm->ps->pm_flags &= ~(PMF_TIME_WATERJUMP | PMF_TIME_LAND);
ADDRLP4 84
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 -289
BANDI4
ASGNI4
line 1219
;1219:		pm->ps->pm_time = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 1220
;1220:	}
LABELV $467
line 1222
;1221:
;1222:	if ( pm->ps->groundEntityNum == ENTITYNUM_NONE ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $469
line 1224
;1223:		// just hit the ground
;1224:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $471
line 1225
;1225:			Com_Printf("%i:Land\n", c_pmove);
ADDRGP4 $473
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1226
;1226:		}
LABELV $471
line 1228
;1227:		
;1228:		PM_CrashLand();
ADDRGP4 PM_CrashLand
CALLV
pop
line 1231
;1229:
;1230:		// don't do landing time if we were just going down a slope
;1231:		if ( pml.previous_velocity[2] < -200 ) {
ADDRGP4 pml+128+8
INDIRF4
CNSTF4 3276275712
GEF4 $474
line 1233
;1232:			// don't allow another jump for a little while
;1233:			pm->ps->pm_flags |= PMF_TIME_LAND;
ADDRLP4 84
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 1234
;1234:			pm->ps->pm_time = 250;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 250
ASGNI4
line 1235
;1235:		}
LABELV $474
line 1236
;1236:	}
LABELV $469
line 1238
;1237:
;1238:	pm->ps->groundEntityNum = trace.entityNum;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 0+52
INDIRI4
ASGNI4
line 1243
;1239:
;1240:	// don't reset the z velocity for slopes
;1241:	// pm->ps->velocity[2] = 0;
;1242:
;1243:	PM_AddTouchEnt( trace.entityNum );
ADDRLP4 0+52
INDIRI4
ARGI4
ADDRGP4 PM_AddTouchEnt
CALLV
pop
line 1245
;1244://	pm->ps->MultiJumps = 0; // Shafe - Trep - Multijumping / Wall Jumping
;1245:}
LABELV $429
endproc PM_GroundTrace 88 28
proc PM_SetWaterLevel 48 8
line 1253
;1246:
;1247:
;1248:/*
;1249:=============
;1250:PM_SetWaterLevel	FIXME: avoid this twice?  certainly if not moving
;1251:=============
;1252:*/
;1253:static void PM_SetWaterLevel( void ) {
line 1262
;1254:	vec3_t		point;
;1255:	int			cont;
;1256:	int			sample1;
;1257:	int			sample2;
;1258:
;1259:	//
;1260:	// get waterlevel, accounting for ducking
;1261:	//
;1262:	pm->waterlevel = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 0
ASGNI4
line 1263
;1263:	pm->watertype = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 0
ASGNI4
line 1265
;1264:
;1265:	point[0] = pm->ps->origin[0];
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
line 1266
;1266:	point[1] = pm->ps->origin[1];
ADDRLP4 0+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1267
;1267:	point[2] = pm->ps->origin[2] + MINS_Z + 1;	
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3250585600
ADDF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1268
;1268:	cont = pm->pointcontents( point, pm->ps->clientNum );
ADDRLP4 0
ARGP4
ADDRLP4 24
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 28
INDIRI4
ASGNI4
line 1270
;1269:
;1270:	if ( cont & MASK_WATER ) {
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $483
line 1271
;1271:		sample2 = pm->ps->viewheight - MINS_Z;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 -24
SUBI4
ASGNI4
line 1272
;1272:		sample1 = sample2 / 2;
ADDRLP4 20
ADDRLP4 16
INDIRI4
CNSTI4 2
DIVI4
ASGNI4
line 1274
;1273:
;1274:		pm->watertype = cont;
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1275
;1275:		pm->waterlevel = 1;
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 1
ASGNI4
line 1276
;1276:		point[2] = pm->ps->origin[2] + MINS_Z + sample1;
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3250585600
ADDF4
ADDRLP4 20
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1277
;1277:		cont = pm->pointcontents (point, pm->ps->clientNum );
ADDRLP4 0
ARGP4
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 36
INDIRI4
ASGNI4
line 1278
;1278:		if ( cont & MASK_WATER ) {
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $486
line 1279
;1279:			pm->waterlevel = 2;
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 2
ASGNI4
line 1280
;1280:			point[2] = pm->ps->origin[2] + MINS_Z + sample2;
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3250585600
ADDF4
ADDRLP4 16
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1281
;1281:			cont = pm->pointcontents (point, pm->ps->clientNum );
ADDRLP4 0
ARGP4
ADDRLP4 40
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 44
INDIRI4
ASGNI4
line 1282
;1282:			if ( cont & MASK_WATER ){
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $489
line 1283
;1283:				pm->waterlevel = 3;
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 3
ASGNI4
line 1284
;1284:			}
LABELV $489
line 1285
;1285:		}
LABELV $486
line 1286
;1286:	}
LABELV $483
line 1288
;1287:
;1288:}
LABELV $480
endproc PM_SetWaterLevel 48 8
proc PM_CheckDuck 76 28
line 1298
;1289:
;1290:/*
;1291:==============
;1292:PM_CheckDuck
;1293:
;1294:Sets mins, maxs, and pm->ps->viewheight
;1295:==============
;1296:*/
;1297:static void PM_CheckDuck (void)
;1298:{
line 1301
;1299:	trace_t	trace;
;1300:
;1301:	if ( pm->ps->powerups[PW_INVULNERABILITY] ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 368
ADDP4
INDIRI4
CNSTI4 0
EQI4 $492
line 1302
;1302:		if ( pm->ps->pm_flags & PMF_INVULEXPAND ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $494
line 1304
;1303:			// invulnerability sphere has a 42 units radius
;1304:			VectorSet( pm->mins, -42, -42, -42 );
ADDRGP4 pm
INDIRP4
CNSTI4 180
ADDP4
CNSTF4 3257401344
ASGNF4
ADDRGP4 pm
INDIRP4
CNSTI4 184
ADDP4
CNSTF4 3257401344
ASGNF4
ADDRGP4 pm
INDIRP4
CNSTI4 188
ADDP4
CNSTF4 3257401344
ASGNF4
line 1305
;1305:			VectorSet( pm->maxs, 42, 42, 42 );
ADDRGP4 pm
INDIRP4
CNSTI4 192
ADDP4
CNSTF4 1109917696
ASGNF4
ADDRGP4 pm
INDIRP4
CNSTI4 196
ADDP4
CNSTF4 1109917696
ASGNF4
ADDRGP4 pm
INDIRP4
CNSTI4 200
ADDP4
CNSTF4 1109917696
ASGNF4
line 1306
;1306:		}
ADDRGP4 $495
JUMPV
LABELV $494
line 1307
;1307:		else {
line 1308
;1308:			VectorSet( pm->mins, -15, -15, MINS_Z );
ADDRGP4 pm
INDIRP4
CNSTI4 180
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRGP4 pm
INDIRP4
CNSTI4 184
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRGP4 pm
INDIRP4
CNSTI4 188
ADDP4
CNSTF4 3250585600
ASGNF4
line 1309
;1309:			VectorSet( pm->maxs, 15, 15, 16 );
ADDRGP4 pm
INDIRP4
CNSTI4 192
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRGP4 pm
INDIRP4
CNSTI4 196
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRGP4 pm
INDIRP4
CNSTI4 200
ADDP4
CNSTF4 1098907648
ASGNF4
line 1310
;1310:		}
LABELV $495
line 1311
;1311:		pm->ps->pm_flags |= PMF_DUCKED;
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1312
;1312:		pm->ps->viewheight = CROUCH_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 12
ASGNI4
line 1313
;1313:		return;
ADDRGP4 $491
JUMPV
LABELV $492
line 1315
;1314:	}
;1315:	pm->ps->pm_flags &= ~PMF_INVULEXPAND;
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 1317
;1316:
;1317:	pm->mins[0] = -15;
ADDRGP4 pm
INDIRP4
CNSTI4 180
ADDP4
CNSTF4 3245342720
ASGNF4
line 1318
;1318:	pm->mins[1] = -15;
ADDRGP4 pm
INDIRP4
CNSTI4 184
ADDP4
CNSTF4 3245342720
ASGNF4
line 1320
;1319:
;1320:	pm->maxs[0] = 15;
ADDRGP4 pm
INDIRP4
CNSTI4 192
ADDP4
CNSTF4 1097859072
ASGNF4
line 1321
;1321:	pm->maxs[1] = 15;
ADDRGP4 pm
INDIRP4
CNSTI4 196
ADDP4
CNSTF4 1097859072
ASGNF4
line 1323
;1322:
;1323:	pm->mins[2] = MINS_Z;
ADDRGP4 pm
INDIRP4
CNSTI4 188
ADDP4
CNSTF4 3250585600
ASGNF4
line 1325
;1324:
;1325:	if (pm->ps->pm_type == PM_DEAD)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $496
line 1326
;1326:	{
line 1327
;1327:		pm->maxs[2] = -8;
ADDRGP4 pm
INDIRP4
CNSTI4 200
ADDP4
CNSTF4 3238002688
ASGNF4
line 1328
;1328:		pm->ps->viewheight = DEAD_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 -16
ASGNI4
line 1329
;1329:		return;
ADDRGP4 $491
JUMPV
LABELV $496
line 1332
;1330:	}
;1331:
;1332:	if (pm->cmd.upmove < 0)
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $498
line 1333
;1333:	{	// duck
line 1334
;1334:		pm->ps->pm_flags |= PMF_DUCKED;
ADDRLP4 60
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1335
;1335:	}
ADDRGP4 $499
JUMPV
LABELV $498
line 1337
;1336:	else
;1337:	{	// stand up if possible
line 1338
;1338:		if (pm->ps->pm_flags & PMF_DUCKED)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $500
line 1339
;1339:		{
line 1341
;1340:			// try to stand up
;1341:			pm->maxs[2] = 32;
ADDRGP4 pm
INDIRP4
CNSTI4 200
ADDP4
CNSTF4 1107296256
ASGNF4
line 1342
;1342:			pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, pm->ps->origin, pm->ps->clientNum, pm->tracemask );
ADDRLP4 0
ARGP4
ADDRLP4 60
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 60
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 68
ADDRLP4 64
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CALLV
pop
line 1343
;1343:			if (!trace.allsolid)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $502
line 1344
;1344:				pm->ps->pm_flags &= ~PMF_DUCKED;
ADDRLP4 72
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
LABELV $502
line 1345
;1345:		}
LABELV $500
line 1346
;1346:	}
LABELV $499
line 1348
;1347:
;1348:	if (pm->ps->pm_flags & PMF_DUCKED)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $504
line 1349
;1349:	{
line 1350
;1350:		pm->maxs[2] = 16;
ADDRGP4 pm
INDIRP4
CNSTI4 200
ADDP4
CNSTF4 1098907648
ASGNF4
line 1351
;1351:		pm->ps->viewheight = CROUCH_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 12
ASGNI4
line 1352
;1352:	}
ADDRGP4 $505
JUMPV
LABELV $504
line 1354
;1353:	else
;1354:	{
line 1355
;1355:		pm->maxs[2] = 32;
ADDRGP4 pm
INDIRP4
CNSTI4 200
ADDP4
CNSTF4 1107296256
ASGNF4
line 1356
;1356:		pm->ps->viewheight = DEFAULT_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 26
ASGNI4
line 1357
;1357:	}
LABELV $505
line 1358
;1358:}
LABELV $491
endproc PM_CheckDuck 76 28
proc PM_Footsteps 52 4
line 1370
;1359:
;1360:
;1361:
;1362://===================================================================
;1363:
;1364:
;1365:/*
;1366:===============
;1367:PM_Footsteps
;1368:===============
;1369:*/
;1370:static void PM_Footsteps( void ) {
line 1379
;1371:	float		bobmove;
;1372:	int			old;
;1373:	qboolean	footstep;
;1374:
;1375:	//
;1376:	// calculate speed and cycle to be used for
;1377:	// all cyclic walking effects
;1378:	//
;1379:	pm->xyspeed = sqrt( pm->ps->velocity[0] * pm->ps->velocity[0]
ADDRLP4 12
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 16
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ASGNF4
ADDRLP4 20
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDRLP4 24
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 28
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 28
INDIRF4
ASGNF4
line 1382
;1380:		+  pm->ps->velocity[1] * pm->ps->velocity[1] );
;1381:
;1382:	if ( pm->ps->groundEntityNum == ENTITYNUM_NONE ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $507
line 1384
;1383:
;1384:		if ( pm->ps->powerups[PW_INVULNERABILITY] ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 368
ADDP4
INDIRI4
CNSTI4 0
EQI4 $509
line 1385
;1385:			PM_ContinueLegsAnim( LEGS_IDLECR );
CNSTI4 23
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1386
;1386:		}
LABELV $509
line 1388
;1387:		// airborne leaves position in cycle intact, but doesn't advance
;1388:		if ( pm->waterlevel > 1 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LEI4 $506
line 1389
;1389:			PM_ContinueLegsAnim( LEGS_SWIM );
CNSTI4 17
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1390
;1390:		}
line 1391
;1391:		return;
ADDRGP4 $506
JUMPV
LABELV $507
line 1395
;1392:	}
;1393:
;1394:	// if not trying to move
;1395:	if ( !pm->cmd.forwardmove && !pm->cmd.rightmove ) {
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ADDRLP4 36
INDIRI4
NEI4 $513
ADDRLP4 32
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
ADDRLP4 36
INDIRI4
NEI4 $513
line 1396
;1396:		if (  pm->xyspeed < 5 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 212
ADDP4
INDIRF4
CNSTF4 1084227584
GEF4 $506
line 1397
;1397:			pm->ps->bobCycle = 0;	// start at beginning of cycle again
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 1398
;1398:			if ( pm->ps->pm_flags & PMF_DUCKED ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $517
line 1399
;1399:				PM_ContinueLegsAnim( LEGS_IDLECR );
CNSTI4 23
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1400
;1400:			} else {
ADDRGP4 $506
JUMPV
LABELV $517
line 1401
;1401:				PM_ContinueLegsAnim( LEGS_IDLE );
CNSTI4 22
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1402
;1402:			}
line 1403
;1403:		}
line 1404
;1404:		return;
ADDRGP4 $506
JUMPV
LABELV $513
line 1408
;1405:	}
;1406:	
;1407:
;1408:	footstep = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1410
;1409:
;1410:	if ( pm->ps->pm_flags & PMF_DUCKED ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $519
line 1411
;1411:		bobmove = 0.5;	// ducked characters bob much faster
ADDRLP4 4
CNSTF4 1056964608
ASGNF4
line 1412
;1412:		if ( pm->ps->pm_flags & PMF_BACKWARDS_RUN ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $521
line 1413
;1413:			PM_ContinueLegsAnim( LEGS_BACKCR );
CNSTI4 32
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1414
;1414:		}
ADDRGP4 $520
JUMPV
LABELV $521
line 1415
;1415:		else {
line 1416
;1416:			PM_ContinueLegsAnim( LEGS_WALKCR );
CNSTI4 13
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1417
;1417:		}
line 1429
;1418:		// ducked characters never play footsteps
;1419:	/*
;1420:	} else 	if ( pm->ps->pm_flags & PMF_BACKWARDS_RUN ) {
;1421:		if ( !( pm->cmd.buttons & BUTTON_WALKING ) ) {
;1422:			bobmove = 0.4;	// faster speeds bob faster
;1423:			footstep = qtrue;
;1424:		} else {
;1425:			bobmove = 0.3;
;1426:		}
;1427:		PM_ContinueLegsAnim( LEGS_BACK );
;1428:	*/
;1429:	} else {
ADDRGP4 $520
JUMPV
LABELV $519
line 1430
;1430:		if ( !( pm->cmd.buttons & BUTTON_WALKING ) ) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $523
line 1431
;1431:			bobmove = 0.4f;	// faster speeds bob faster
ADDRLP4 4
CNSTF4 1053609165
ASGNF4
line 1432
;1432:			if ( pm->ps->pm_flags & PMF_BACKWARDS_RUN ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $525
line 1433
;1433:				PM_ContinueLegsAnim( LEGS_BACK );
CNSTI4 16
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1434
;1434:			}
ADDRGP4 $526
JUMPV
LABELV $525
line 1435
;1435:			else {
line 1436
;1436:				PM_ContinueLegsAnim( LEGS_RUN );
CNSTI4 15
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1437
;1437:			}
LABELV $526
line 1438
;1438:			footstep = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 1439
;1439:		} else {
ADDRGP4 $524
JUMPV
LABELV $523
line 1440
;1440:			bobmove = 0.3f;	// walking bobs slow
ADDRLP4 4
CNSTF4 1050253722
ASGNF4
line 1441
;1441:			if ( pm->ps->pm_flags & PMF_BACKWARDS_RUN ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $527
line 1442
;1442:				PM_ContinueLegsAnim( LEGS_BACKWALK );
CNSTI4 33
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1443
;1443:			}
ADDRGP4 $528
JUMPV
LABELV $527
line 1444
;1444:			else {
line 1445
;1445:				PM_ContinueLegsAnim( LEGS_WALK );
CNSTI4 14
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1446
;1446:			}
LABELV $528
line 1447
;1447:		}
LABELV $524
line 1448
;1448:	}
LABELV $520
line 1451
;1449:
;1450:	// check for footstep / splash sounds
;1451:	old = pm->ps->bobCycle;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1452
;1452:	pm->ps->bobCycle = (int)( old + bobmove * pml.msec ) & 255;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
ADDRGP4 pml+40
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
CNSTI4 255
BANDI4
ASGNI4
line 1455
;1453:
;1454:	// if we just crossed a cycle boundary, play an apropriate footstep event
;1455:	if ( ( ( old + 64 ) ^ ( pm->ps->bobCycle + 64 ) ) & 128 ) {
ADDRLP4 40
CNSTI4 64
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 40
INDIRI4
ADDI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
ADDI4
BXORI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $530
line 1456
;1456:		if ( pm->waterlevel == 0 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 0
NEI4 $532
line 1458
;1457:			// on ground will only play sounds if running
;1458:			if ( footstep && !pm->noFootsteps ) {
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $533
ADDRGP4 pm
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
NEI4 $533
line 1459
;1459:				PM_AddEvent( PM_FootstepForSurface() );
ADDRLP4 48
ADDRGP4 PM_FootstepForSurface
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1460
;1460:			}
line 1461
;1461:		} else if ( pm->waterlevel == 1 ) {
ADDRGP4 $533
JUMPV
LABELV $532
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
NEI4 $536
line 1463
;1462:			// splashing
;1463:			PM_AddEvent( EV_FOOTSPLASH );
CNSTI4 3
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1464
;1464:		} else if ( pm->waterlevel == 2 ) {
ADDRGP4 $537
JUMPV
LABELV $536
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 2
NEI4 $538
line 1466
;1465:			// wading / swimming at surface
;1466:			PM_AddEvent( EV_SWIM );
CNSTI4 5
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1467
;1467:		} else if ( pm->waterlevel == 3 ) {
ADDRGP4 $539
JUMPV
LABELV $538
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 3
NEI4 $540
line 1470
;1468:			// no sound when completely underwater
;1469:
;1470:		}
LABELV $540
LABELV $539
LABELV $537
LABELV $533
line 1471
;1471:	}
LABELV $530
line 1472
;1472:}
LABELV $506
endproc PM_Footsteps 52 4
proc PM_WaterEvents 16 4
line 1481
;1473:
;1474:/*
;1475:==============
;1476:PM_WaterEvents
;1477:
;1478:Generate sound events for entering and leaving water
;1479:==============
;1480:*/
;1481:static void PM_WaterEvents( void ) {		// FIXME?
line 1485
;1482:	//
;1483:	// if just entered a water volume, play a sound
;1484:	//
;1485:	if (!pml.previous_waterlevel && pm->waterlevel) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 pml+140
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $543
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $543
line 1486
;1486:		PM_AddEvent( EV_WATER_TOUCH );
CNSTI4 15
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1487
;1487:	}
LABELV $543
line 1492
;1488:
;1489:	//
;1490:	// if just completely exited a water volume, play a sound
;1491:	//
;1492:	if (pml.previous_waterlevel && !pm->waterlevel) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 pml+140
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $546
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $546
line 1493
;1493:		PM_AddEvent( EV_WATER_LEAVE );
CNSTI4 16
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1494
;1494:	}
LABELV $546
line 1499
;1495:
;1496:	//
;1497:	// check for head just going under water
;1498:	//
;1499:	if (pml.previous_waterlevel != 3 && pm->waterlevel == 3) {
ADDRLP4 8
CNSTI4 3
ASGNI4
ADDRGP4 pml+140
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $549
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $549
line 1500
;1500:		PM_AddEvent( EV_WATER_UNDER );
CNSTI4 17
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1501
;1501:	}
LABELV $549
line 1506
;1502:
;1503:	//
;1504:	// check for head just coming out of water
;1505:	//
;1506:	if (pml.previous_waterlevel == 3 && pm->waterlevel != 3) {
ADDRLP4 12
CNSTI4 3
ASGNI4
ADDRGP4 pml+140
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $552
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $552
line 1507
;1507:		PM_AddEvent( EV_WATER_CLEAR );
CNSTI4 18
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1508
;1508:	}
LABELV $552
line 1509
;1509:}
LABELV $542
endproc PM_WaterEvents 16 4
data
export altAmmoUsage
align 4
LABELV altAmmoUsage
byte 4 0
byte 4 1
byte 4 1
byte 4 1
byte 4 2
byte 4 3
byte 4 1
byte 4 4
byte 4 12
byte 4 1
byte 4 20
code
proc PM_BeginWeaponChange 8 4
line 1537
;1510:
;1511:
;1512:// Shafe - Trep - Alt Ammo Usage 
;1513:// alt ammo usage
;1514:
;1515:int		altAmmoUsage[WP_NUM_WEAPONS] =
;1516:{
;1517:	0,				//WP_NONE,
;1518:	1,				//GAUNTLET,				
;1519:	1,				//machine gun
;1520:	1,				//shotgun
;1521:	2,				//grenade launcher
;1522:	3,				//rocket launchet
;1523:	1,				//flame thrower
;1524:	4,				//rail gun - it's just the sing cannon..lets make it more than alt sing to piss people off.
;1525:	12,				//plasma -  lets make this a lot until we get primary fire replaced
;1526:	1,				//bfg
;1527:	20,				//hmmmm... dunno what this one is
;1528:
;1529:
;1530:};
;1531:
;1532:/*
;1533:===============
;1534:PM_BeginWeaponChange
;1535:===============
;1536:*/
;1537:static void PM_BeginWeaponChange( int weapon ) {
line 1538
;1538:	if ( weapon <= WP_NONE || weapon >= WP_NUM_WEAPONS ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $558
ADDRLP4 0
INDIRI4
CNSTI4 11
LTI4 $556
LABELV $558
line 1539
;1539:		return;
ADDRGP4 $555
JUMPV
LABELV $556
line 1542
;1540:	}
;1541:
;1542:	if ( !( pm->ps->stats[STAT_WEAPONS] & ( 1 << weapon ) ) ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $559
line 1543
;1543:		return;
ADDRGP4 $555
JUMPV
LABELV $559
line 1546
;1544:	}
;1545:	
;1546:	if ( pm->ps->weaponstate == WEAPON_DROPPING ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $561
line 1547
;1547:		return;
ADDRGP4 $555
JUMPV
LABELV $561
line 1550
;1548:	}
;1549:
;1550:	PM_AddEvent( EV_CHANGE_WEAPON );
CNSTI4 22
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1551
;1551:	pm->ps->weaponstate = WEAPON_DROPPING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 1552
;1552:	pm->ps->weaponTime += 200;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 1553
;1553:	PM_StartTorsoAnim( TORSO_DROP );
CNSTI4 9
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1554
;1554:}
LABELV $555
endproc PM_BeginWeaponChange 8 4
proc PM_FinishWeaponChange 12 4
line 1562
;1555:
;1556:
;1557:/*
;1558:===============
;1559:PM_FinishWeaponChange
;1560:===============
;1561:*/
;1562:static void PM_FinishWeaponChange( void ) {
line 1565
;1563:	int		weapon;
;1564:
;1565:	weapon = pm->cmd.weapon;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
CNSTI4 24
ADDP4
INDIRU1
CVUI4 1
ASGNI4
line 1566
;1566:	if ( weapon < WP_NONE || weapon >= WP_NUM_WEAPONS ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $566
ADDRLP4 0
INDIRI4
CNSTI4 11
LTI4 $564
LABELV $566
line 1567
;1567:		weapon = WP_NONE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1568
;1568:	}
LABELV $564
line 1570
;1569:
;1570:	if ( !( pm->ps->stats[STAT_WEAPONS] & ( 1 << weapon ) ) ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $567
line 1571
;1571:		weapon = WP_NONE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1572
;1572:	}
LABELV $567
line 1574
;1573:
;1574:	pm->ps->weapon = weapon;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1575
;1575:	pm->ps->weaponstate = WEAPON_RAISING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1
ASGNI4
line 1576
;1576:	pm->ps->weaponTime += 250;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 250
ADDI4
ASGNI4
line 1577
;1577:	PM_StartTorsoAnim( TORSO_RAISE );
CNSTI4 10
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1578
;1578:}
LABELV $563
endproc PM_FinishWeaponChange 12 4
proc PM_TorsoAnimation 0 4
line 1587
;1579:
;1580:
;1581:/*
;1582:==============
;1583:PM_TorsoAnimation
;1584:
;1585:==============
;1586:*/
;1587:static void PM_TorsoAnimation( void ) {
line 1588
;1588:	if ( pm->ps->weaponstate == WEAPON_READY ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 0
NEI4 $570
line 1589
;1589:		if ( pm->ps->weapon == WP_GAUNTLET ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 1
NEI4 $572
line 1590
;1590:			PM_ContinueTorsoAnim( TORSO_STAND2 );
CNSTI4 12
ARGI4
ADDRGP4 PM_ContinueTorsoAnim
CALLV
pop
line 1591
;1591:		} else {
ADDRGP4 $569
JUMPV
LABELV $572
line 1592
;1592:			PM_ContinueTorsoAnim( TORSO_STAND );
CNSTI4 11
ARGI4
ADDRGP4 PM_ContinueTorsoAnim
CALLV
pop
line 1593
;1593:		}
line 1594
;1594:		return;
LABELV $570
line 1596
;1595:	}
;1596:}
LABELV $569
endproc PM_TorsoAnimation 0 4
proc PM_Weapon 48 4
line 1606
;1597:
;1598:
;1599:/*
;1600:==============
;1601:PM_Weapon
;1602:
;1603:Generates weapon events and modifes the weapon counter
;1604:==============
;1605:*/
;1606:static void PM_Weapon( void ) {
line 1608
;1607:	int		addTime;
;1608:	qboolean	altfired = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1613
;1609:
;1610:
;1611:
;1612:	// don't allow attack until all buttons are up
;1613:	if ( pm->ps->pm_flags & PMF_RESPAWNED ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $575
line 1614
;1614:		return;
ADDRGP4 $574
JUMPV
LABELV $575
line 1618
;1615:	}
;1616:
;1617:	// ignore if spectator
;1618:	if ( pm->ps->persistant[PERS_TEAM] == TEAM_SPECTATOR ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 3
NEI4 $577
line 1619
;1619:		return;
ADDRGP4 $574
JUMPV
LABELV $577
line 1623
;1620:	}
;1621:
;1622:	// check for dead player
;1623:	if ( pm->ps->stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $579
line 1624
;1624:		pm->ps->weapon = WP_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 0
ASGNI4
line 1625
;1625:		return;
ADDRGP4 $574
JUMPV
LABELV $579
line 1630
;1626:	}
;1627:
;1628:	// check for item using
;1629:	// Shafe - Trep - I think here is where we want to force the medkit as a MUST use holdable... but nothing done yet
;1630:	if ( pm->cmd.buttons & BUTTON_USE_HOLDABLE ) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $581
line 1631
;1631:		if ( ! ( pm->ps->pm_flags & PMF_USE_ITEM_HELD ) ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $582
line 1632
;1632:			if ( bg_itemlist[pm->ps->stats[STAT_HOLDABLE_ITEM]].giTag == HI_MEDKIT && pm->ps->stats[STAT_HEALTH] >= (pm->ps->stats[STAT_MAX_HEALTH] + 25)) {
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
CNSTI4 52
ADDRLP4 8
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 2
NEI4 $585
ADDRLP4 8
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 25
ADDI4
LTI4 $585
line 1634
;1633:				// don't use medkit if at max health
;1634:				pm->ps->stats[STAT_HOLDABLE_ITEM] = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 1
ASGNI4
line 1635
;1635:			} else {
ADDRGP4 $574
JUMPV
LABELV $585
line 1638
;1636:			
;1637:			
;1638:				pm->ps->pm_flags |= PMF_USE_ITEM_HELD;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 1639
;1639:				PM_AddEvent( EV_USE_ITEM0 + bg_itemlist[pm->ps->stats[STAT_HOLDABLE_ITEM]].giTag );
CNSTI4 52
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 25
ADDI4
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1640
;1640:				pm->ps->stats[STAT_HOLDABLE_ITEM] = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 1641
;1641:			}
line 1642
;1642:			return;
ADDRGP4 $574
JUMPV
line 1644
;1643:		}
;1644:	} else {
LABELV $581
line 1645
;1645:		pm->ps->pm_flags &= ~PMF_USE_ITEM_HELD;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 1646
;1646:	}
LABELV $582
line 1650
;1647:
;1648:
;1649:	// make weapon function
;1650:	if ( pm->ps->weaponTime > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $589
line 1651
;1651:		pm->ps->weaponTime -= pml.msec;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 1652
;1652:	}
LABELV $589
line 1657
;1653:
;1654:	// check for weapon change
;1655:	// can't change if weapon is firing, but can change
;1656:	// again if lowering or raising
;1657:	if ( pm->ps->weaponTime <= 0 || pm->ps->weaponstate != WEAPON_FIRING ) {
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $594
ADDRLP4 8
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 3
EQI4 $592
LABELV $594
line 1658
;1658:		if ( pm->ps->weapon != pm->cmd.weapon ) {
ADDRLP4 12
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 24
ADDP4
INDIRU1
CVUI4 1
EQI4 $595
line 1659
;1659:			PM_BeginWeaponChange( pm->cmd.weapon );
ADDRGP4 pm
INDIRP4
CNSTI4 24
ADDP4
INDIRU1
CVUI4 1
ARGI4
ADDRGP4 PM_BeginWeaponChange
CALLV
pop
line 1660
;1660:		}
LABELV $595
line 1661
;1661:	}
LABELV $592
line 1663
;1662:
;1663:	if ( pm->ps->weaponTime > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $597
line 1664
;1664:		return;
ADDRGP4 $574
JUMPV
LABELV $597
line 1668
;1665:	}
;1666:
;1667:	// change weapon if time
;1668:	if ( pm->ps->weaponstate == WEAPON_DROPPING ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $599
line 1669
;1669:		PM_FinishWeaponChange();
ADDRGP4 PM_FinishWeaponChange
CALLV
pop
line 1670
;1670:		return;
ADDRGP4 $574
JUMPV
LABELV $599
line 1673
;1671:	}
;1672:
;1673:	if ( pm->ps->weaponstate == WEAPON_RAISING ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1
NEI4 $601
line 1674
;1674:		pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 1675
;1675:		if ( pm->ps->weapon == WP_GAUNTLET ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 1
NEI4 $603
line 1676
;1676:			PM_StartTorsoAnim( TORSO_STAND2 );
CNSTI4 12
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1677
;1677:		} else {
ADDRGP4 $574
JUMPV
LABELV $603
line 1678
;1678:			PM_StartTorsoAnim( TORSO_STAND );
CNSTI4 11
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1679
;1679:		}
line 1680
;1680:		return;
ADDRGP4 $574
JUMPV
LABELV $601
line 1685
;1681:	}
;1682:
;1683:	// check for fire
;1684:	// Shafe - Trep - Alt Fire
;1685:	if ( ! ((pm->cmd.buttons & BUTTON_ATTACK) ||( pm->cmd.buttons & 32)) ) {
ADDRLP4 12
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 16
INDIRI4
NEI4 $605
ADDRLP4 12
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 16
INDIRI4
NEI4 $605
line 1686
;1686:		pm->ps->weaponTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 1687
;1687:		pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 1688
;1688:		altfired = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1689
;1689:		return;
ADDRGP4 $574
JUMPV
LABELV $605
line 1693
;1690:	}
;1691:
;1692:	// start the animation even if out of ammo
;1693:	if ( pm->ps->weapon == WP_GAUNTLET ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 1
NEI4 $607
line 1695
;1694:		// the guantlet only "fires" when it actually hits something
;1695:		if ( !pm->gauntletHit ) {
ADDRGP4 pm
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 0
NEI4 $609
line 1696
;1696:			pm->ps->weaponTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 1697
;1697:			pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 1698
;1698:			return;
ADDRGP4 $574
JUMPV
LABELV $609
line 1700
;1699:		}
;1700:		PM_StartTorsoAnim( TORSO_ATTACK2 );
CNSTI4 8
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1701
;1701:	} else {
ADDRGP4 $608
JUMPV
LABELV $607
line 1702
;1702:		PM_StartTorsoAnim( TORSO_ATTACK );
CNSTI4 7
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1703
;1703:	}
LABELV $608
line 1705
;1704:
;1705:	pm->ps->weaponstate = WEAPON_FIRING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 3
ASGNI4
line 1708
;1706:
;1707:	// check for out of ammo
;1708:	if ( ! pm->ps->ammo[ pm->ps->weapon ] ) {
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $611
line 1709
;1709:		PM_AddEvent( EV_NOAMMO );
CNSTI4 21
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1710
;1710:		pm->ps->weaponTime += 500;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 1711
;1711:		return;
ADDRGP4 $574
JUMPV
LABELV $611
line 1715
;1712:	}
;1713:
;1714:		// check for out of ammo for alt fire - Shafe - Trep 
;1715:	if ( pm->cmd.buttons & 32)
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $613
line 1716
;1716:	{
line 1717
;1717:		if ( (pm->ps->ammo[ pm->ps->weapon ]-altAmmoUsage[pm->ps->weapon]) <= 0) 
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
ADDRGP4 altAmmoUsage
ADDP4
INDIRI4
SUBI4
CNSTI4 0
GTI4 $615
line 1718
;1718:		{
line 1719
;1719:			PM_AddEvent( EV_NOAMMO );
CNSTI4 21
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1720
;1720:			pm->ps->weaponTime += 500;
ADDRLP4 32
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 1721
;1721:			return;
ADDRGP4 $574
JUMPV
LABELV $615
line 1724
;1722:		}
;1723:
;1724:	}
LABELV $613
line 1738
;1725:	
;1726:
;1727:
;1728:
;1729:
;1730:	// Shafe - Trep Instagib  Cant get this to work - But This would be the correct way to go about it
;1731:	//if (g_instagib.integer == 1) {  
;1732:	//	if ( pm->ps->weapon != WP_RAILGUN ); // InstaGib - unlimited ammo
;1733:	//}
;1734:
;1735:
;1736:// Shafe - Trep.. All Replaced For Alt Fire Usage
;1737:// Normal Attack Button 
;1738:if (pm->cmd.buttons & 1) { 
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $617
line 1741
;1739:
;1740:  // Normal Fire Event 
;1741:  PM_AddEvent( EV_FIRE_WEAPON ); 
CNSTI4 23
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1743
;1742:
;1743:  switch( pm->ps->weapon ) { 
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 1
LTI4 $619
ADDRLP4 24
INDIRI4
CNSTI4 10
GTI4 $619
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $632-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $632
address $622
address $625
address $624
address $626
address $627
address $623
address $629
address $628
address $630
address $631
code
LABELV $619
LABELV $622
line 1747
;1744:  default: 
;1745:
;1746:	case WP_GAUNTLET: 
;1747:		addTime = 400; 
ADDRLP4 4
CNSTI4 400
ASGNI4
line 1748
;1748:		break; 
ADDRGP4 $618
JUMPV
LABELV $623
line 1750
;1749:	case WP_LIGHTNING: 
;1750:		addTime = 400;  // Shafe - Trep - Flame Thrower was 50 -- Primary Fire Shoots Flame Balls
ADDRLP4 4
CNSTI4 400
ASGNI4
line 1751
;1751:		break; 
ADDRGP4 $618
JUMPV
LABELV $624
line 1753
;1752:	case WP_SHOTGUN: 
;1753:		addTime = 1000; 
ADDRLP4 4
CNSTI4 1000
ASGNI4
line 1754
;1754:		break; 
ADDRGP4 $618
JUMPV
LABELV $625
line 1756
;1755:	case WP_MACHINEGUN: 
;1756:		addTime = 100; 
ADDRLP4 4
CNSTI4 100
ASGNI4
line 1757
;1757:		break; 
ADDRGP4 $618
JUMPV
LABELV $626
line 1759
;1758:	case WP_GRENADE_LAUNCHER: 
;1759:		addTime = 800; 
ADDRLP4 4
CNSTI4 800
ASGNI4
line 1760
;1760:		break; 
ADDRGP4 $618
JUMPV
LABELV $627
line 1762
;1761:	case WP_ROCKET_LAUNCHER: 
;1762:		addTime = 800; 
ADDRLP4 4
CNSTI4 800
ASGNI4
line 1763
;1763:		break; 
ADDRGP4 $618
JUMPV
LABELV $628
line 1765
;1764:	case WP_PLASMAGUN: 
;1765:		addTime = 100; 
ADDRLP4 4
CNSTI4 100
ASGNI4
line 1766
;1766:		break; 
ADDRGP4 $618
JUMPV
LABELV $629
line 1768
;1767:	case WP_RAILGUN: 
;1768:		addTime = 1200; 
ADDRLP4 4
CNSTI4 1200
ASGNI4
line 1769
;1769:		break; 
ADDRGP4 $618
JUMPV
LABELV $630
line 1772
;1770:	case WP_BFG: 
;1771:		//  addTime = 100; 
;1772:		addTime = 200; 
ADDRLP4 4
CNSTI4 200
ASGNI4
line 1773
;1773:		break; 
ADDRGP4 $618
JUMPV
LABELV $631
line 1775
;1774:	case WP_GRAPPLING_HOOK: 
;1775:		addTime = 400; 
ADDRLP4 4
CNSTI4 400
ASGNI4
line 1776
;1776:		break; 
line 1780
;1777:	} 
;1778:
;1779: // New Alt Fire Button 
;1780: } else if (pm->cmd.buttons & 32) { 
ADDRGP4 $618
JUMPV
LABELV $617
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $634
line 1783
;1781:
;1782:  // New Event 
;1783:  PM_AddEvent( EV_FIRE_WEAPON2 ); 
CNSTI4 24
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1784
;1784:  altfired = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1786
;1785:
;1786:  switch( pm->ps->weapon ) { 
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 1
LTI4 $636
ADDRLP4 24
INDIRI4
CNSTI4 10
GTI4 $636
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $649-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $649
address $639
address $642
address $641
address $643
address $644
address $640
address $646
address $645
address $647
address $648
code
LABELV $636
LABELV $639
line 1789
;1787:  default: 
;1788:  	case WP_GAUNTLET: 
;1789:		addTime = 400; 
ADDRLP4 4
CNSTI4 400
ASGNI4
line 1790
;1790:		break; 
ADDRGP4 $637
JUMPV
LABELV $640
line 1792
;1791:	case WP_LIGHTNING: 
;1792:		addTime = 10;  // Shafe - Trep - Flame Thrower was 50  // Streaming Flames
ADDRLP4 4
CNSTI4 10
ASGNI4
line 1793
;1793:		break; 
ADDRGP4 $637
JUMPV
LABELV $641
line 1795
;1794:	case WP_SHOTGUN: 
;1795:		addTime = 1000; 
ADDRLP4 4
CNSTI4 1000
ASGNI4
line 1796
;1796:		break; 
ADDRGP4 $637
JUMPV
LABELV $642
line 1798
;1797:	case WP_MACHINEGUN: 
;1798:		addTime = 100; 
ADDRLP4 4
CNSTI4 100
ASGNI4
line 1799
;1799:		break; 
ADDRGP4 $637
JUMPV
LABELV $643
line 1801
;1800:	case WP_GRENADE_LAUNCHER: 
;1801:		addTime = 800; 
ADDRLP4 4
CNSTI4 800
ASGNI4
line 1802
;1802:		break; 
ADDRGP4 $637
JUMPV
LABELV $644
line 1804
;1803:	case WP_ROCKET_LAUNCHER: 
;1804:		addTime = 800; 
ADDRLP4 4
CNSTI4 800
ASGNI4
line 1805
;1805:		break; 
ADDRGP4 $637
JUMPV
LABELV $645
line 1807
;1806:	case WP_PLASMAGUN: 
;1807:		addTime = 1500; 
ADDRLP4 4
CNSTI4 1500
ASGNI4
line 1808
;1808:		break; 
ADDRGP4 $637
JUMPV
LABELV $646
line 1810
;1809:	case WP_RAILGUN: 
;1810:		addTime = 1500; 
ADDRLP4 4
CNSTI4 1500
ASGNI4
line 1811
;1811:		break; 
ADDRGP4 $637
JUMPV
LABELV $647
line 1814
;1812:	case WP_BFG: 
;1813:		//  addTime = 100; 
;1814:		addTime = 200; 
ADDRLP4 4
CNSTI4 200
ASGNI4
line 1815
;1815:		break; 
ADDRGP4 $637
JUMPV
LABELV $648
line 1817
;1816:	case WP_GRAPPLING_HOOK: 
;1817:		addTime = 400; 
ADDRLP4 4
CNSTI4 400
ASGNI4
line 1818
;1818:		break; 
LABELV $637
line 1820
;1819:	}
;1820: }
LABELV $634
LABELV $618
line 1827
;1821:
;1822:	
;1823: 	// take an ammo away if not infinite
;1824:	// Shafe - Trep - Alt Fire Ammo Mgt
;1825:	// I moved this from above... hmmmm..
;1826:	
;1827:	if (altfired == qtrue) 
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $651
line 1828
;1828:	{
line 1829
;1829:			if ( pm->ps->ammo[ pm->ps->weapon ] != -1 ) 
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $652
line 1830
;1830:			{
line 1831
;1831:				pm->ps->ammo[pm->ps->weapon] -= altAmmoUsage[pm->ps->weapon];
ADDRLP4 28
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 36
ADDRLP4 32
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 376
ADDP4
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
ADDRLP4 32
INDIRI4
ADDRGP4 altAmmoUsage
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1836
;1832:				// Let's not let them go -1 (infinite).. That is bad.. Just set the ammo to 0
;1833:				// 
;1834:				// This is gonna screw up mod makers who are used to using -1 for infinite ammo... 
;1835:				// Infinite ammo should now be 9999  - Shafe
;1836:				if (pm->ps->ammo[pm->ps->weapon] < 0) { pm->ps->ammo[pm->ps->weapon] = 0; }
ADDRLP4 40
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 40
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
CNSTI4 0
GEI4 $652
ADDRLP4 44
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 44
INDIRP4
CNSTI4 376
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 1837
;1837:			}
line 1838
;1838:	} 
ADDRGP4 $652
JUMPV
LABELV $651
line 1840
;1839:	else 
;1840:	{
line 1841
;1841:		if ( pm->ps->ammo[ pm->ps->weapon ] != -1 ) {
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $657
line 1842
;1842:			pm->ps->ammo[ pm->ps->weapon ]--;
ADDRLP4 28
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 28
INDIRP4
CNSTI4 376
ADDP4
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1843
;1843:		}
LABELV $657
line 1844
;1844:	}
LABELV $652
line 1847
;1845: 
;1846:
;1847:	if ( pm->ps->powerups[PW_HASTE] ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
CNSTI4 0
EQI4 $659
line 1848
;1848:		addTime /= 1.3;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CVIF4 4
CNSTF4 1067869798
DIVF4
CVFI4 4
ASGNI4
line 1849
;1849:	}
LABELV $659
line 1851
;1850:
;1851:	pm->ps->weaponTime += addTime;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 1852
;1852:}
LABELV $574
endproc PM_Weapon 48 4
proc PM_Animate 0 4
line 1860
;1853:
;1854:/*
;1855:================
;1856:PM_Animate
;1857:================
;1858:*/
;1859:
;1860:static void PM_Animate( void ) {
line 1861
;1861:	if ( pm->cmd.buttons & BUTTON_GESTURE ) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $662
line 1862
;1862:		if ( pm->ps->torsoTimer == 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 0
NEI4 $664
line 1863
;1863:			PM_StartTorsoAnim( TORSO_GESTURE );
CNSTI4 6
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1864
;1864:			pm->ps->torsoTimer = TIMER_GESTURE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
CNSTI4 2294
ASGNI4
line 1865
;1865:			PM_AddEvent( EV_TAUNT );
CNSTI4 71
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1866
;1866:		}
LABELV $664
line 1899
;1867:#ifdef MISSIONPACK
;1868:	} else if ( pm->cmd.buttons & BUTTON_GETFLAG ) {
;1869:		if ( pm->ps->torsoTimer == 0 ) {
;1870:			PM_StartTorsoAnim( TORSO_GETFLAG );
;1871:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;1872:		}
;1873:	} else if ( pm->cmd.buttons & BUTTON_GUARDBASE ) {
;1874:		if ( pm->ps->torsoTimer == 0 ) {
;1875:			PM_StartTorsoAnim( TORSO_GUARDBASE );
;1876:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;1877:		}
;1878:	} else if ( pm->cmd.buttons & BUTTON_PATROL ) {
;1879:		if ( pm->ps->torsoTimer == 0 ) {
;1880:			PM_StartTorsoAnim( TORSO_PATROL );
;1881:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;1882:		}
;1883:	} else if ( pm->cmd.buttons & BUTTON_FOLLOWME ) {
;1884:		if ( pm->ps->torsoTimer == 0 ) {
;1885:			PM_StartTorsoAnim( TORSO_FOLLOWME );
;1886:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;1887:		}
;1888:	} else if ( pm->cmd.buttons & BUTTON_AFFIRMATIVE ) {
;1889:		if ( pm->ps->torsoTimer == 0 ) {
;1890:			PM_StartTorsoAnim( TORSO_AFFIRMATIVE);
;1891:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;1892:		}
;1893:	} else if ( pm->cmd.buttons & BUTTON_NEGATIVE ) {
;1894:		if ( pm->ps->torsoTimer == 0 ) {
;1895:			PM_StartTorsoAnim( TORSO_NEGATIVE );
;1896:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;1897:		}
;1898:#endif
;1899:	}
LABELV $662
line 1900
;1900:}
LABELV $661
endproc PM_Animate 0 4
proc PM_DropTimers 4 0
line 1908
;1901:
;1902:
;1903:/*
;1904:================
;1905:PM_DropTimers
;1906:================
;1907:*/
;1908:static void PM_DropTimers( void ) {
line 1910
;1909:	// drop misc timing counter
;1910:	if ( pm->ps->pm_time ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $667
line 1911
;1911:		if ( pml.msec >= pm->ps->pm_time ) {
ADDRGP4 pml+40
INDIRI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
LTI4 $669
line 1912
;1912:			pm->ps->pm_flags &= ~PMF_ALL_TIMES;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -353
BANDI4
ASGNI4
line 1913
;1913:			pm->ps->pm_time = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 1914
;1914:		} else {
ADDRGP4 $670
JUMPV
LABELV $669
line 1915
;1915:			pm->ps->pm_time -= pml.msec;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 1916
;1916:		}
LABELV $670
line 1917
;1917:	}
LABELV $667
line 1920
;1918:
;1919:	// drop animation counter
;1920:	if ( pm->ps->legsTimer > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
LEI4 $673
line 1921
;1921:		pm->ps->legsTimer -= pml.msec;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 1922
;1922:		if ( pm->ps->legsTimer < 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
GEI4 $676
line 1923
;1923:			pm->ps->legsTimer = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
line 1924
;1924:		}
LABELV $676
line 1925
;1925:	}
LABELV $673
line 1927
;1926:
;1927:	if ( pm->ps->torsoTimer > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 0
LEI4 $678
line 1928
;1928:		pm->ps->torsoTimer -= pml.msec;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 1929
;1929:		if ( pm->ps->torsoTimer < 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 0
GEI4 $681
line 1930
;1930:			pm->ps->torsoTimer = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
CNSTI4 0
ASGNI4
line 1931
;1931:		}
LABELV $681
line 1932
;1932:	}
LABELV $678
line 1933
;1933:}
LABELV $666
endproc PM_DropTimers 4 0
export PM_UpdateViewAngles
proc PM_UpdateViewAngles 24 0
line 1943
;1934:
;1935:/*
;1936:================
;1937:PM_UpdateViewAngles
;1938:
;1939:This can be used as another entry point when only the viewangles
;1940:are being updated isntead of a full move
;1941:================
;1942:*/
;1943:void PM_UpdateViewAngles( playerState_t *ps, const usercmd_t *cmd ) {
line 1947
;1944:	short		temp;
;1945:	int		i;
;1946:
;1947:	if ( ps->pm_type == PM_INTERMISSION || ps->pm_type == PM_SPINTERMISSION) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 5
EQI4 $686
ADDRLP4 8
INDIRI4
CNSTI4 6
NEI4 $684
LABELV $686
line 1948
;1948:		return;		// no view changes at all
ADDRGP4 $683
JUMPV
LABELV $684
line 1951
;1949:	}
;1950:
;1951:	if ( ps->pm_type != PM_SPECTATOR && ps->stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $687
ADDRLP4 12
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $687
line 1952
;1952:		return;		// no view changes at all
ADDRGP4 $683
JUMPV
LABELV $687
line 1956
;1953:	}
;1954:
;1955:	// circularly clamp the angles with deltas
;1956:	for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $689
line 1957
;1957:		temp = cmd->angles[i] + ps->delta_angles[i];
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
ADDP4
INDIRI4
ADDI4
CVII2 4
ASGNI2
line 1958
;1958:		if ( i == PITCH ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $693
line 1960
;1959:			// don't let the player look up or down more than 90 degrees
;1960:			if ( temp > 16000 ) {
ADDRLP4 4
INDIRI2
CVII4 2
CNSTI4 16000
LEI4 $695
line 1961
;1961:				ps->delta_angles[i] = 16000 - cmd->angles[i];
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
ADDP4
CNSTI4 16000
ADDRLP4 20
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1962
;1962:				temp = 16000;
ADDRLP4 4
CNSTI2 16000
ASGNI2
line 1963
;1963:			} else if ( temp < -16000 ) {
ADDRGP4 $696
JUMPV
LABELV $695
ADDRLP4 4
INDIRI2
CVII4 2
CNSTI4 -16000
GEI4 $697
line 1964
;1964:				ps->delta_angles[i] = -16000 - cmd->angles[i];
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
ADDP4
CNSTI4 -16000
ADDRLP4 20
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1965
;1965:				temp = -16000;
ADDRLP4 4
CNSTI2 -16000
ASGNI2
line 1966
;1966:			}
LABELV $697
LABELV $696
line 1967
;1967:		}
LABELV $693
line 1968
;1968:		ps->viewangles[i] = SHORT2ANGLE(temp);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
ADDP4
CNSTF4 1001652224
ADDRLP4 4
INDIRI2
CVII4 2
CVIF4 4
MULF4
ASGNF4
line 1969
;1969:	}
LABELV $690
line 1956
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $689
line 1971
;1970:
;1971:}
LABELV $683
endproc PM_UpdateViewAngles 24 0
proc PM_LadderMove 72 16
line 1984
;1972:
;1973:
;1974:// Shafe - Trep - Ladder Functions - Stolen But Credited ;)
;1975:/*
;1976:===================
;1977:PM_LadderMove()
;1978:by: Calrathan [Arthur Tomlin]
;1979:
;1980:Right now all I know is that this works for VERTICAL ladders. 
;1981:Ladders with angles on them (urban2 for AQ2) Haven't been tested
;1982:===================
;1983:*/
;1984:static void PM_LadderMove( void ) {
line 1992
;1985:        int i;
;1986:        vec3_t wishvel;
;1987:        float wishspeed;
;1988:        vec3_t wishdir;
;1989:        float scale;
;1990:        float vel;
;1991:
;1992:        PM_Friction ();
ADDRGP4 PM_Friction
CALLV
pop
line 1994
;1993:
;1994:        scale = PM_CmdScale( &pm->cmd );
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 40
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 40
INDIRF4
ASGNF4
line 1997
;1995:
;1996:        // user intentions [what the user is attempting to do]
;1997:        if ( !scale ) { 
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $700
line 1998
;1998:                wishvel[0] = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 1999
;1999:                wishvel[1] = 0;
ADDRLP4 8+4
CNSTF4 0
ASGNF4
line 2000
;2000:                wishvel[2] = 0;
ADDRLP4 8+8
CNSTF4 0
ASGNF4
line 2001
;2001:        }
ADDRGP4 $701
JUMPV
LABELV $700
line 2002
;2002:        else {   // if they're trying to move... lets calculate it
line 2003
;2003:                for (i=0 ; i<3 ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $704
line 2004
;2004:                        wishvel[i] = scale * pml.forward[i]*pm->cmd.forwardmove +
ADDRLP4 44
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 52
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 44
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRF4
ADDRLP4 44
INDIRI4
ADDRGP4 pml
ADDP4
INDIRF4
MULF4
ADDRLP4 52
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDRLP4 4
INDIRF4
ADDRLP4 44
INDIRI4
ADDRGP4 pml+12
ADDP4
INDIRF4
MULF4
ADDRLP4 52
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDF4
ASGNF4
LABELV $705
line 2003
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $704
line 2006
;2005:                                     scale * pml.right[i]*pm->cmd.rightmove; 
;2006:                wishvel[2] += scale * pm->cmd.upmove;
ADDRLP4 8+8
ADDRLP4 8+8
INDIRF4
ADDRLP4 4
INDIRF4
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDF4
ASGNF4
line 2007
;2007:        }
LABELV $701
line 2009
;2008:
;2009:        VectorCopy (wishvel, wishdir);
ADDRLP4 24
ADDRLP4 8
INDIRB
ASGNB 12
line 2010
;2010:        wishspeed = VectorNormalize(wishdir);
ADDRLP4 24
ARGP4
ADDRLP4 44
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 44
INDIRF4
ASGNF4
line 2012
;2011:
;2012:        if ( wishspeed > pm->ps->speed * pm_ladderScale ) {
ADDRLP4 20
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_ladderScale
INDIRF4
MULF4
LEF4 $710
line 2013
;2013:                wishspeed = pm->ps->speed * pm_ladderScale;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_ladderScale
INDIRF4
MULF4
ASGNF4
line 2014
;2014:        }
LABELV $710
line 2016
;2015:		
;2016:		PM_CheckJump(); // Shafe - Jump from a ladder?
ADDRGP4 PM_CheckJump
CALLI4
pop
line 2018
;2017:
;2018:        PM_Accelerate (wishdir, wishspeed, pm_ladderAccelerate);
ADDRLP4 24
ARGP4
ADDRLP4 20
INDIRF4
ARGF4
ADDRGP4 pm_ladderAccelerate
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 2021
;2019:
;2020:        // This SHOULD help us with sloped ladders, but it remains untested.
;2021:        if ( pml.groundPlane && DotProduct( pm->ps->velocity, pml.groundTrace.plane.normal ) < 0 ) {
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $712
ADDRLP4 48
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRGP4 pml+52+24
INDIRF4
MULF4
ADDRLP4 48
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRGP4 pml+52+24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 48
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRGP4 pml+52+24+8
INDIRF4
MULF4
ADDF4
CNSTF4 0
GEF4 $712
line 2022
;2022:                vel = VectorLength(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 52
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 52
INDIRF4
ASGNF4
line 2024
;2023:                // slide along the ground plane [the ladder section under our feet] 
;2024:                PM_ClipVelocity (pm->ps->velocity, pml.groundTrace.plane.normal, 
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 2027
;2025:                        pm->ps->velocity, OVERCLIP );
;2026:
;2027:                VectorNormalize(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2028
;2028:                VectorScale(pm->ps->velocity, vel, pm->ps->velocity);
ADDRLP4 60
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
ADDRLP4 64
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
line 2029
;2029:        }
LABELV $712
line 2031
;2030:
;2031:        PM_SlideMove( qfalse ); // move without gravity
CNSTI4 0
ARGI4
ADDRGP4 PM_SlideMove
CALLI4
pop
line 2032
;2032:}
LABELV $699
endproc PM_LadderMove 72 16
export CheckLadder
proc CheckLadder 96 28
line 2041
;2033:
;2034:
;2035:/*
;2036:=============
;2037:CheckLadder [ ARTHUR TOMLIN ]
;2038:=============
;2039:*/
;2040:void CheckLadder( void )
;2041:{
line 2044
;2042:        vec3_t flatforward,spot;
;2043:        trace_t trace;
;2044:        pml.ladder = qfalse;
ADDRGP4 pml+108
CNSTI4 0
ASGNI4
line 2046
;2045:        // check for ladder
;2046:        flatforward[0] = pml.forward[0];
ADDRLP4 0
ADDRGP4 pml
INDIRF4
ASGNF4
line 2047
;2047:        flatforward[1] = pml.forward[1];
ADDRLP4 0+4
ADDRGP4 pml+4
INDIRF4
ASGNF4
line 2048
;2048:        flatforward[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 2049
;2049:        VectorNormalize (flatforward);
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2050
;2050:        VectorMA (pm->ps->origin, 1, flatforward, spot);
ADDRLP4 80
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 84
CNSTF4 1065353216
ASGNF4
ADDRLP4 12
ADDRLP4 80
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 84
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 80
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 84
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1065353216
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2051
;2051:        pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, spot, pm->ps->clientNum, MASK_PLAYERSOLID);
ADDRLP4 24
ARGP4
ADDRLP4 88
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 92
ADDRLP4 88
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 88
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 88
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 92
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 33619969
ARGI4
ADDRLP4 88
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CALLV
pop
line 2053
;2052:
;2053:        if ((trace.fraction < 1) && (trace.surfaceFlags & SURF_LADDER))
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
GEF4 $734
ADDRLP4 24+44
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $734
line 2054
;2054:                pml.ladder = qtrue;
ADDRGP4 pml+108
CNSTI4 1
ASGNI4
LABELV $734
line 2056
;2055:
;2056:}
LABELV $725
endproc CheckLadder 96 28
export PmoveSingle
proc PmoveSingle 64 16
line 2069
;2057:
;2058:/// End Shafe - Ladder Functions
;2059:
;2060:
;2061:/*
;2062:================
;2063:PmoveSingle
;2064:
;2065:================
;2066:*/
;2067:void trap_SnapVector( float *v );
;2068:
;2069:void PmoveSingle (pmove_t *pmove) {
line 2070
;2070:	pm = pmove;
ADDRGP4 pm
ADDRFP4 0
INDIRP4
ASGNP4
line 2074
;2071:
;2072:	// this counter lets us debug movement problems with a journal
;2073:	// by setting a conditional breakpoint fot the previous frame
;2074:	c_pmove++;
ADDRLP4 0
ADDRGP4 c_pmove
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2077
;2075:
;2076:	// clear results
;2077:	pm->numtouch = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 2078
;2078:	pm->watertype = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 0
ASGNI4
line 2079
;2079:	pm->waterlevel = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 0
ASGNI4
line 2081
;2080:
;2081:	if ( pm->ps->stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $740
line 2082
;2082:		pm->tracemask &= ~CONTENTS_BODY;	// corpses can fly through bodies
ADDRLP4 4
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -33554433
BANDI4
ASGNI4
line 2083
;2083:	}
LABELV $740
line 2087
;2084:
;2085:	// make sure walking button is clear if they are running, to avoid
;2086:	// proxy no-footsteps cheats
;2087:	if ( abs( pm->cmd.forwardmove ) > 64 || abs( pm->cmd.rightmove ) > 64 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 4
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 64
GTI4 $744
ADDRGP4 pm
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 64
LEI4 $742
LABELV $744
line 2088
;2088:		pm->cmd.buttons &= ~BUTTON_WALKING;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 2089
;2089:	}
LABELV $742
line 2092
;2090:
;2091:	// set the talk balloon flag
;2092:	if ( pm->cmd.buttons & BUTTON_TALK ) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $745
line 2093
;2093:		pm->ps->eFlags |= EF_TALK;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 2094
;2094:	} else {
ADDRGP4 $746
JUMPV
LABELV $745
line 2095
;2095:		pm->ps->eFlags &= ~EF_TALK;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
line 2096
;2096:	}
LABELV $746
line 2101
;2097:
;2098:	// set the firing flag for continuous beam weapons
;2099:	
;2100:	// Shafe - Trep - Alt Fire Code
;2101:	if ( !(pm->ps->pm_flags & PMF_RESPAWNED) && pm->ps->pm_type != PM_INTERMISSION && ( (pm->cmd.buttons & BUTTON_ATTACK) || (pm->cmd.buttons & 32) ) && pm->ps->ammo[ pm->ps->weapon ] ) { 
ADDRLP4 12
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 512
BANDI4
ADDRLP4 20
INDIRI4
NEI4 $747
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5
EQI4 $747
ADDRLP4 24
ADDRLP4 12
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 20
INDIRI4
NEI4 $749
ADDRLP4 24
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 20
INDIRI4
EQI4 $747
LABELV $749
ADDRLP4 28
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 28
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $747
line 2102
;2102:		pm->ps->eFlags |= EF_FIRING; 
ADDRLP4 32
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 2103
;2103:	} else { 
ADDRGP4 $748
JUMPV
LABELV $747
line 2104
;2104:		pm->ps->eFlags &= ~EF_FIRING; 
ADDRLP4 32
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 -257
BANDI4
ASGNI4
line 2105
;2105:	}
LABELV $748
line 2114
;2106:	/*if ( !(pm->ps->pm_flags & PMF_RESPAWNED) && pm->ps->pm_type != PM_INTERMISSION
;2107:		&& ( pm->cmd.buttons & BUTTON_ATTACK ) && pm->ps->ammo[ pm->ps->weapon ] ) {
;2108:		pm->ps->eFlags |= EF_FIRING;
;2109:	} else {
;2110:		pm->ps->eFlags &= ~EF_FIRING;
;2111:	}*/
;2112:
;2113:	// clear the respawned flag if attack and use are cleared
;2114:	if ( pm->ps->stats[STAT_HEALTH] > 0 && 
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
LEI4 $750
ADDRLP4 32
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 5
BANDI4
ADDRLP4 36
INDIRI4
NEI4 $750
line 2115
;2115:		!( pm->cmd.buttons & (BUTTON_ATTACK | BUTTON_USE_HOLDABLE) ) ) {
line 2116
;2116:		pm->ps->pm_flags &= ~PMF_RESPAWNED;
ADDRLP4 40
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
line 2117
;2117:	}
LABELV $750
line 2122
;2118:
;2119:	// if talk button is down, dissallow all other input
;2120:	// this is to prevent any possible intercept proxy from
;2121:	// adding fake talk balloons
;2122:	if ( pmove->cmd.buttons & BUTTON_TALK ) {
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $752
line 2125
;2123:		// keep the talk button set tho for when the cmd.serverTime > 66 msec
;2124:		// and the same cmd is used multiple times in Pmove
;2125:		pmove->cmd.buttons = BUTTON_TALK;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 2
ASGNI4
line 2126
;2126:		pmove->cmd.forwardmove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 25
ADDP4
CNSTI1 0
ASGNI1
line 2127
;2127:		pmove->cmd.rightmove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 26
ADDP4
CNSTI1 0
ASGNI1
line 2128
;2128:		pmove->cmd.upmove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 27
ADDP4
CNSTI1 0
ASGNI1
line 2129
;2129:	}
LABELV $752
line 2132
;2130:
;2131:	// clear all pmove local vars
;2132:	memset (&pml, 0, sizeof(pml));
ADDRGP4 pml
ARGP4
CNSTI4 0
ARGI4
CNSTI4 144
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2135
;2133:
;2134:	// determine the time
;2135:	pml.msec = pmove->cmd.serverTime - pm->ps->commandTime;
ADDRGP4 pml+40
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRGP4 pm
INDIRP4
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 2136
;2136:	if ( pml.msec < 1 ) {
ADDRGP4 pml+40
INDIRI4
CNSTI4 1
GEI4 $755
line 2137
;2137:		pml.msec = 1;
ADDRGP4 pml+40
CNSTI4 1
ASGNI4
line 2138
;2138:	} else if ( pml.msec > 200 ) {
ADDRGP4 $756
JUMPV
LABELV $755
ADDRGP4 pml+40
INDIRI4
CNSTI4 200
LEI4 $759
line 2139
;2139:		pml.msec = 200;
ADDRGP4 pml+40
CNSTI4 200
ASGNI4
line 2140
;2140:	}
LABELV $759
LABELV $756
line 2141
;2141:	pm->ps->commandTime = pmove->cmd.serverTime;
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 2144
;2142:
;2143:	// save old org in case we get stuck
;2144:	VectorCopy (pm->ps->origin, pml.previous_origin);
ADDRGP4 pml+116
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2147
;2145:
;2146:	// save old velocity for crashlanding
;2147:	VectorCopy (pm->ps->velocity, pml.previous_velocity);
ADDRGP4 pml+128
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 2149
;2148:
;2149:	pml.frametime = pml.msec * 0.001;
ADDRGP4 pml+36
CNSTF4 981668463
ADDRGP4 pml+40
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 2152
;2150:
;2151:	// update the viewangles
;2152:	PM_UpdateViewAngles( pm->ps, &pm->cmd );
ADDRLP4 40
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 PM_UpdateViewAngles
CALLV
pop
line 2154
;2153:
;2154:	AngleVectors (pm->ps->viewangles, pml.forward, pml.right, pml.up);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRGP4 pml
ARGP4
ADDRGP4 pml+12
ARGP4
ADDRGP4 pml+24
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2156
;2155:
;2156:	if ( pm->cmd.upmove < 10 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
GEI4 $769
line 2158
;2157:		// not holding jump
;2158:		pm->ps->pm_flags &= ~PMF_JUMP_HELD;
ADDRLP4 44
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 2159
;2159:	}
LABELV $769
line 2162
;2160:
;2161:	// decide if backpedaling animations should be used
;2162:	if ( pm->cmd.forwardmove < 0 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $771
line 2163
;2163:		pm->ps->pm_flags |= PMF_BACKWARDS_RUN;
ADDRLP4 44
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
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
line 2164
;2164:	} else if ( pm->cmd.forwardmove > 0 || ( pm->cmd.forwardmove == 0 && pm->cmd.rightmove ) ) {
ADDRGP4 $772
JUMPV
LABELV $771
ADDRLP4 44
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 48
ADDRLP4 44
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRLP4 48
INDIRI4
ADDRLP4 52
INDIRI4
GTI4 $775
ADDRLP4 48
INDIRI4
ADDRLP4 52
INDIRI4
NEI4 $773
ADDRLP4 44
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
ADDRLP4 52
INDIRI4
EQI4 $773
LABELV $775
line 2165
;2165:		pm->ps->pm_flags &= ~PMF_BACKWARDS_RUN;
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 2166
;2166:	}
LABELV $773
LABELV $772
line 2168
;2167:
;2168:	if ( pm->ps->pm_type >= PM_DEAD ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
LTI4 $776
line 2169
;2169:		pm->cmd.forwardmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
CNSTI1 0
ASGNI1
line 2170
;2170:		pm->cmd.rightmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 26
ADDP4
CNSTI1 0
ASGNI1
line 2171
;2171:		pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
CNSTI1 0
ASGNI1
line 2172
;2172:	}
LABELV $776
line 2174
;2173:
;2174:	if ( pm->ps->pm_type == PM_SPECTATOR ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $778
line 2175
;2175:		PM_CheckDuck ();
ADDRGP4 PM_CheckDuck
CALLV
pop
line 2176
;2176:		PM_FlyMove ();
ADDRGP4 PM_FlyMove
CALLV
pop
line 2177
;2177:		PM_DropTimers ();
ADDRGP4 PM_DropTimers
CALLV
pop
line 2178
;2178:		return;
ADDRGP4 $739
JUMPV
LABELV $778
line 2181
;2179:	}
;2180:
;2181:	if ( pm->ps->pm_type == PM_NOCLIP ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $780
line 2182
;2182:		PM_NoclipMove ();
ADDRGP4 PM_NoclipMove
CALLV
pop
line 2183
;2183:		PM_DropTimers ();
ADDRGP4 PM_DropTimers
CALLV
pop
line 2184
;2184:		return;
ADDRGP4 $739
JUMPV
LABELV $780
line 2187
;2185:	}
;2186:
;2187:	if (pm->ps->pm_type == PM_FREEZE) {
ADDRLP4 56
CNSTI4 4
ASGNI4
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
ADDRLP4 56
INDIRI4
NEI4 $782
line 2188
;2188:		return;		// no movement at all
ADDRGP4 $739
JUMPV
LABELV $782
line 2191
;2189:	}
;2190:
;2191:	if ( pm->ps->pm_type == PM_INTERMISSION || pm->ps->pm_type == PM_SPINTERMISSION) {
ADDRLP4 60
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 5
EQI4 $786
ADDRLP4 60
INDIRI4
CNSTI4 6
NEI4 $784
LABELV $786
line 2192
;2192:		return;		// no movement at all
ADDRGP4 $739
JUMPV
LABELV $784
line 2196
;2193:	}
;2194:
;2195:	// set watertype, and waterlevel
;2196:	PM_SetWaterLevel();
ADDRGP4 PM_SetWaterLevel
CALLV
pop
line 2197
;2197:	pml.previous_waterlevel = pmove->waterlevel;
ADDRGP4 pml+140
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ASGNI4
line 2200
;2198:
;2199:	// set mins, maxs, and viewheight
;2200:	PM_CheckDuck ();
ADDRGP4 PM_CheckDuck
CALLV
pop
line 2203
;2201:
;2202:	// set groundentity
;2203:	PM_GroundTrace();
ADDRGP4 PM_GroundTrace
CALLV
pop
line 2205
;2204:
;2205:	if ( pm->ps->pm_type == PM_DEAD ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $788
line 2206
;2206:		PM_DeadMove ();
ADDRGP4 PM_DeadMove
CALLV
pop
line 2207
;2207:	}
LABELV $788
line 2209
;2208:
;2209:	PM_DropTimers();
ADDRGP4 PM_DropTimers
CALLV
pop
line 2211
;2210:
;2211:	CheckLadder();	// Shafe - Trep - Ladder Support
ADDRGP4 CheckLadder
CALLV
pop
line 2221
;2212:
;2213:#ifdef MISSIONPACK
;2214:	if ( pm->ps->powerups[PW_INVULNERABILITY] ) {
;2215:		PM_InvulnerabilityMove();
;2216:	} else
;2217:#endif
;2218:
;2219:		
;2220:	
;2221:	if ( pm->ps->powerups[PW_FLIGHT] ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $790
line 2223
;2222:		// flight powerup doesn't allow jump and has different friction
;2223:		PM_FlyMove();
ADDRGP4 PM_FlyMove
CALLV
pop
line 2224
;2224:	} else if (pm->ps->pm_flags & PMF_GRAPPLE_PULL) {
ADDRGP4 $791
JUMPV
LABELV $790
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $792
line 2225
;2225:		PM_GrappleMove();
ADDRGP4 PM_GrappleMove
CALLV
pop
line 2227
;2226:		// We can wiggle a bit
;2227:		PM_AirMove();
ADDRGP4 PM_AirMove
CALLV
pop
line 2228
;2228:	} else if (pm->ps->pm_flags & PMF_TIME_WATERJUMP) {
ADDRGP4 $793
JUMPV
LABELV $792
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $794
line 2229
;2229:		PM_WaterJumpMove();
ADDRGP4 PM_WaterJumpMove
CALLV
pop
line 2230
;2230:	} else if ( pm->waterlevel > 1 ) {
ADDRGP4 $795
JUMPV
LABELV $794
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LEI4 $796
line 2232
;2231:		// swimming
;2232:		PM_WaterMove();
ADDRGP4 PM_WaterMove
CALLV
pop
line 2233
;2233:	} else if (pml.ladder) {        
ADDRGP4 $797
JUMPV
LABELV $796
ADDRGP4 pml+108
INDIRI4
CNSTI4 0
EQI4 $798
line 2234
;2234:        PM_LadderMove();
ADDRGP4 PM_LadderMove
CALLV
pop
line 2235
;2235:	} else if ( pml.walking ) {
ADDRGP4 $799
JUMPV
LABELV $798
ADDRGP4 pml+44
INDIRI4
CNSTI4 0
EQI4 $801
line 2237
;2236:		// walking on ground
;2237:		PM_WalkMove();
ADDRGP4 PM_WalkMove
CALLV
pop
line 2238
;2238:	} else {
ADDRGP4 $802
JUMPV
LABELV $801
line 2240
;2239:		// airborne
;2240:		PM_AirMove();
ADDRGP4 PM_AirMove
CALLV
pop
line 2241
;2241:	}
LABELV $802
LABELV $799
LABELV $797
LABELV $795
LABELV $793
LABELV $791
line 2243
;2242:
;2243:	PM_Animate();
ADDRGP4 PM_Animate
CALLV
pop
line 2246
;2244:
;2245:	// set groundentity, watertype, and waterlevel
;2246:	PM_GroundTrace();
ADDRGP4 PM_GroundTrace
CALLV
pop
line 2247
;2247:	PM_SetWaterLevel();
ADDRGP4 PM_SetWaterLevel
CALLV
pop
line 2250
;2248:
;2249:	// weapons
;2250:	PM_Weapon();
ADDRGP4 PM_Weapon
CALLV
pop
line 2253
;2251:
;2252:	// torso animation
;2253:	PM_TorsoAnimation();
ADDRGP4 PM_TorsoAnimation
CALLV
pop
line 2256
;2254:
;2255:	// footstep events / legs animations
;2256:	PM_Footsteps();
ADDRGP4 PM_Footsteps
CALLV
pop
line 2259
;2257:
;2258:	// entering / leaving water splashes
;2259:	PM_WaterEvents();
ADDRGP4 PM_WaterEvents
CALLV
pop
line 2262
;2260:
;2261:	// snap some parts of playerstate to save network bandwidth
;2262:	trap_SnapVector( pm->ps->velocity );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 trap_SnapVector
CALLV
pop
line 2263
;2263:}
LABELV $739
endproc PmoveSingle 64 16
export Pmove
proc Pmove 16 4
line 2273
;2264:
;2265:
;2266:/*
;2267:================
;2268:Pmove
;2269:
;2270:Can be called by either the server or the client
;2271:================
;2272:*/
;2273:void Pmove (pmove_t *pmove) {
line 2276
;2274:	int			finalTime;
;2275:
;2276:	finalTime = pmove->cmd.serverTime;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 2278
;2277:
;2278:	if ( finalTime < pmove->ps->commandTime ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
INDIRP4
INDIRI4
GEI4 $805
line 2279
;2279:		return;	// should not happen
ADDRGP4 $804
JUMPV
LABELV $805
line 2282
;2280:	}
;2281:
;2282:	if ( finalTime > pmove->ps->commandTime + 1000 ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
INDIRP4
INDIRI4
CNSTI4 1000
ADDI4
LEI4 $807
line 2283
;2283:		pmove->ps->commandTime = finalTime - 1000;
ADDRFP4 0
INDIRP4
INDIRP4
ADDRLP4 0
INDIRI4
CNSTI4 1000
SUBI4
ASGNI4
line 2284
;2284:	}
LABELV $807
line 2286
;2285:
;2286:	pmove->ps->pmove_framecount = (pmove->ps->pmove_framecount+1) & ((1<<PS_PMOVEFRAMECOUNTBITS)-1);
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 456
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 63
BANDI4
ASGNI4
ADDRGP4 $810
JUMPV
LABELV $809
line 2290
;2287:
;2288:	// chop the move up if it is too long, to prevent framerate
;2289:	// dependent behavior
;2290:	while ( pmove->ps->commandTime != finalTime ) {
line 2293
;2291:		int		msec;
;2292:
;2293:		msec = finalTime - pmove->ps->commandTime;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 2295
;2294:
;2295:		if ( pmove->pmove_fixed ) {
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
EQI4 $812
line 2296
;2296:			if ( msec > pmove->pmove_msec ) {
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
LEI4 $813
line 2297
;2297:				msec = pmove->pmove_msec;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ASGNI4
line 2298
;2298:			}
line 2299
;2299:		}
ADDRGP4 $813
JUMPV
LABELV $812
line 2300
;2300:		else {
line 2301
;2301:			if ( msec > 66 ) {
ADDRLP4 8
INDIRI4
CNSTI4 66
LEI4 $816
line 2302
;2302:				msec = 66;
ADDRLP4 8
CNSTI4 66
ASGNI4
line 2303
;2303:			}
LABELV $816
line 2304
;2304:		}
LABELV $813
line 2305
;2305:		pmove->cmd.serverTime = pmove->ps->commandTime + msec;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 12
INDIRP4
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 2306
;2306:		PmoveSingle( pmove );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 PmoveSingle
CALLV
pop
line 2308
;2307:
;2308:		if ( pmove->ps->pm_flags & PMF_JUMP_HELD ) {
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $818
line 2309
;2309:			pmove->cmd.upmove = 20;
ADDRFP4 0
INDIRP4
CNSTI4 27
ADDP4
CNSTI1 20
ASGNI1
line 2310
;2310:		}
LABELV $818
line 2311
;2311:	}
LABELV $810
line 2290
ADDRFP4 0
INDIRP4
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $809
line 2315
;2312:
;2313:	//PM_CheckStuck();
;2314:
;2315:}
LABELV $804
endproc Pmove 16 4
import trap_SnapVector
import PM_StepSlideMove
import PM_SlideMove
bss
export pml
align 4
LABELV pml
skip 144
export pm
align 4
LABELV pm
skip 4
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
LABELV $473
byte 1 37
byte 1 105
byte 1 58
byte 1 76
byte 1 97
byte 1 110
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $462
byte 1 37
byte 1 105
byte 1 58
byte 1 115
byte 1 116
byte 1 101
byte 1 101
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $451
byte 1 37
byte 1 105
byte 1 58
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 111
byte 1 102
byte 1 102
byte 1 10
byte 1 0
align 1
LABELV $420
byte 1 37
byte 1 105
byte 1 58
byte 1 108
byte 1 105
byte 1 102
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $393
byte 1 37
byte 1 105
byte 1 58
byte 1 97
byte 1 108
byte 1 108
byte 1 115
byte 1 111
byte 1 108
byte 1 105
byte 1 100
byte 1 10
byte 1 0
