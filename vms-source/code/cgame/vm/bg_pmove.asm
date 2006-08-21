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
file "../../game/bg_pmove.c"
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
line 1030
;1026:	int			i, j, k;
;1027:	vec3_t		point;
;1028:	
;1029:
;1030:	if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $391
line 1031
;1031:		Com_Printf("%i:allsolid\n", c_pmove);
ADDRGP4 $393
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1032
;1032:	}
LABELV $391
line 1035
;1033:
;1034:	// jitter around
;1035:	for (i = -1; i <= 1; i++) {
ADDRLP4 20
CNSTI4 -1
ASGNI4
LABELV $394
line 1036
;1036:		for (j = -1; j <= 1; j++) {
ADDRLP4 16
CNSTI4 -1
ASGNI4
LABELV $398
line 1037
;1037:			for (k = -1; k <= 1; k++) {
ADDRLP4 12
CNSTI4 -1
ASGNI4
LABELV $402
line 1038
;1038:				VectorCopy(pm->ps->origin, point);
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1039
;1039:				point[0] += (float) i;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1040
;1040:				point[1] += (float) j;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 16
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1041
;1041:				point[2] += (float) k;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 12
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1042
;1042:				pm->trace (trace, point, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
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
line 1043
;1043:				if ( !trace->allsolid ) {
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $408
line 1044
;1044:					point[0] = pm->ps->origin[0];
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
line 1045
;1045:					point[1] = pm->ps->origin[1];
ADDRLP4 0+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1046
;1046:					point[2] = pm->ps->origin[2] - 0.25;
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
line 1048
;1047:
;1048:					pm->trace (trace, pm->ps->origin, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
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
line 1049
;1049:					pml.groundTrace = *trace;
ADDRGP4 pml+52
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 56
line 1050
;1050:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $390
JUMPV
LABELV $408
line 1052
;1051:				}
;1052:			}
LABELV $403
line 1037
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
line 1053
;1053:		}
LABELV $399
line 1036
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
line 1054
;1054:	}
LABELV $395
line 1035
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
line 1056
;1055:
;1056:	pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 1023
ASGNI4
line 1057
;1057:	pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 1058
;1058:	pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 1060
;1059:
;1060:	return qfalse;
CNSTI4 0
RETI4
LABELV $390
endproc PM_CorrectAllSolid 36 28
proc PM_GroundTraceMissed 80 28
line 1071
;1061:}
;1062:
;1063:
;1064:/*
;1065:=============
;1066:PM_GroundTraceMissed
;1067:
;1068:The ground trace didn't hit a surface, so we are in freefall
;1069:=============
;1070:*/
;1071:static void PM_GroundTraceMissed( void ) {
line 1075
;1072:	trace_t		trace;
;1073:	vec3_t		point;
;1074:
;1075:	if ( pm->ps->groundEntityNum != ENTITYNUM_NONE ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $416
line 1077
;1076:		// we just transitioned into freefall
;1077:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $418
line 1078
;1078:			Com_Printf("%i:lift\n", c_pmove);
ADDRGP4 $420
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1079
;1079:		}
LABELV $418
line 1083
;1080:
;1081:		// if they aren't in a jumping animation and the ground is a ways away, force into it
;1082:		// if we didn't do the trace, the player would be backflipping down staircases
;1083:		VectorCopy( pm->ps->origin, point );
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1084
;1084:		point[2] -= 64;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1115684864
SUBF4
ASGNF4
line 1086
;1085:
;1086:		pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
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
line 1087
;1087:		if ( trace.fraction == 1.0 ) {
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
NEF4 $422
line 1088
;1088:			if ( pm->cmd.forwardmove >= 0 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LTI4 $425
line 1089
;1089:				PM_ForceLegsAnim( LEGS_JUMP );
CNSTI4 18
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 1090
;1090:				pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
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
line 1091
;1091:			} else {
ADDRGP4 $426
JUMPV
LABELV $425
line 1092
;1092:				PM_ForceLegsAnim( LEGS_JUMPB );
CNSTI4 20
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 1093
;1093:				pm->ps->pm_flags |= PMF_BACKWARDS_JUMP;
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
line 1094
;1094:			}
LABELV $426
line 1095
;1095:		}
LABELV $422
line 1096
;1096:	}
LABELV $416
line 1098
;1097:
;1098:	pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 1023
ASGNI4
line 1099
;1099:	pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 1100
;1100:	pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 1101
;1101:}
LABELV $415
endproc PM_GroundTraceMissed 80 28
proc PM_GroundTrace 88 28
line 1109
;1102:
;1103:
;1104:/*
;1105:=============
;1106:PM_GroundTrace
;1107:=============
;1108:*/
;1109:static void PM_GroundTrace( void ) {
line 1113
;1110:	vec3_t		point;
;1111:	trace_t		trace;
;1112:
;1113:	point[0] = pm->ps->origin[0];
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
line 1114
;1114:	point[1] = pm->ps->origin[1];
ADDRLP4 56+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1115
;1115:	point[2] = pm->ps->origin[2] - 0.25;
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
line 1117
;1116:
;1117:	pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
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
line 1118
;1118:	pml.groundTrace = trace;
ADDRGP4 pml+52
ADDRLP4 0
INDIRB
ASGNB 56
line 1121
;1119:
;1120:	// do something corrective if the trace starts in a solid...
;1121:	if ( trace.allsolid ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $433
line 1124
;1122:
;1123:
;1124:		if ( !PM_CorrectAllSolid(&trace) )
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
line 1125
;1125:			return;
ADDRGP4 $429
JUMPV
LABELV $435
line 1126
;1126:	}
LABELV $433
line 1129
;1127:
;1128:	// if the trace didn't hit anything, we are in free fall
;1129:	if ( trace.fraction == 1.0 ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $437
line 1130
;1130:		PM_GroundTraceMissed();
ADDRGP4 PM_GroundTraceMissed
CALLV
pop
line 1131
;1131:		pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 1132
;1132:		pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 1156
;1133:		
;1134:
;1135:		/*
;1136:		if (g_MultiJumps.integer != 0)
;1137:		{ 
;1138:			
;1139:			// Ignore and reset multijumps and wall jump if they have the jetpack
;1140:			if (pm->ps->powerups[PW_FLIGHT]) 
;1141:			{
;1142:				pm->ps->MultiJumps = 0;
;1143:			} 
;1144:			else
;1145:			{
;1146:
;1147:				// Go ahead and do the multijump
;1148:				if (pm->ps->MultiJumps < g_MultiJumps.integer)
;1149:				{
;1150:					PM_CheckJump ();
;1151:				}
;1152:			}
;1153:		} 
;1154:		*/
;1155:
;1156:		return;
ADDRGP4 $429
JUMPV
LABELV $437
line 1160
;1157:	}
;1158:
;1159:	// check if getting thrown off the ground
;1160:	if ( pm->ps->velocity[2] > 0 && DotProduct( pm->ps->velocity, trace.plane.normal ) > 10 ) {
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
line 1161
;1161:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $449
line 1162
;1162:			Com_Printf("%i:kickoff\n", c_pmove);
ADDRGP4 $451
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1163
;1163:		}
LABELV $449
line 1165
;1164:		// go into jump animation
;1165:		if ( pm->cmd.forwardmove >= 0 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LTI4 $452
line 1166
;1166:			PM_ForceLegsAnim( LEGS_JUMP );
CNSTI4 18
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 1167
;1167:			pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
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
line 1168
;1168:		} else {
ADDRGP4 $453
JUMPV
LABELV $452
line 1169
;1169:			PM_ForceLegsAnim( LEGS_JUMPB );
CNSTI4 20
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 1170
;1170:			pm->ps->pm_flags |= PMF_BACKWARDS_JUMP;
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
line 1171
;1171:		}
LABELV $453
line 1173
;1172:
;1173:		pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 1023
ASGNI4
line 1174
;1174:		pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 1175
;1175:		pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 1176
;1176:		return;
ADDRGP4 $429
JUMPV
LABELV $442
line 1185
;1177:	}
;1178:	
;1179:
;1180:	
;1181:	
;1182:
;1183:
;1184:	// slopes that are too steep will not be considered onground
;1185:	if ( trace.plane.normal[2] < MIN_WALK_NORMAL ) {  
ADDRLP4 0+24+8
INDIRF4
CNSTF4 1060320051
GEF4 $456
line 1189
;1186:		
;1187:			
;1188://		if (pm->ps->MultiJumps < 5 ) {
;1189:			PM_CheckJump(); // Allows you to jump up slopes
ADDRGP4 PM_CheckJump
CALLI4
pop
line 1193
;1190://		}
;1191:	
;1192:		
;1193:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $460
line 1194
;1194:			Com_Printf("%i:steep\n", c_pmove);
ADDRGP4 $462
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1196
;1195:			
;1196:		}
LABELV $460
line 1199
;1197:		// FIXME: if they can't slide down the slope, let them
;1198:		// walk (sharp crevices)
;1199:		pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 1023
ASGNI4
line 1200
;1200:		pml.groundPlane = qtrue;
ADDRGP4 pml+48
CNSTI4 1
ASGNI4
line 1201
;1201:		pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 1202
;1202:		return;
ADDRGP4 $429
JUMPV
LABELV $456
line 1205
;1203:	}
;1204:
;1205:	pml.groundPlane = qtrue;
ADDRGP4 pml+48
CNSTI4 1
ASGNI4
line 1206
;1206:	pml.walking = qtrue;
ADDRGP4 pml+44
CNSTI4 1
ASGNI4
line 1209
;1207:
;1208:	// hitting solid ground will end a waterjump
;1209:	if (pm->ps->pm_flags & PMF_TIME_WATERJUMP)
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
line 1210
;1210:	{
line 1211
;1211:		pm->ps->pm_flags &= ~(PMF_TIME_WATERJUMP | PMF_TIME_LAND);
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
line 1212
;1212:		pm->ps->pm_time = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 1213
;1213:	}
LABELV $467
line 1215
;1214:
;1215:	if ( pm->ps->groundEntityNum == ENTITYNUM_NONE ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $469
line 1217
;1216:		// just hit the ground
;1217:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $471
line 1218
;1218:			Com_Printf("%i:Land\n", c_pmove);
ADDRGP4 $473
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1219
;1219:		}
LABELV $471
line 1221
;1220:		
;1221:		PM_CrashLand();
ADDRGP4 PM_CrashLand
CALLV
pop
line 1224
;1222:
;1223:		// don't do landing time if we were just going down a slope
;1224:		if ( pml.previous_velocity[2] < -200 ) {
ADDRGP4 pml+128+8
INDIRF4
CNSTF4 3276275712
GEF4 $474
line 1226
;1225:			// don't allow another jump for a little while
;1226:			pm->ps->pm_flags |= PMF_TIME_LAND;
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
line 1227
;1227:			pm->ps->pm_time = 250;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 250
ASGNI4
line 1228
;1228:		}
LABELV $474
line 1229
;1229:	}
LABELV $469
line 1231
;1230:
;1231:	pm->ps->groundEntityNum = trace.entityNum;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 0+52
INDIRI4
ASGNI4
line 1236
;1232:
;1233:	// don't reset the z velocity for slopes
;1234:	// pm->ps->velocity[2] = 0;
;1235:
;1236:	PM_AddTouchEnt( trace.entityNum );
ADDRLP4 0+52
INDIRI4
ARGI4
ADDRGP4 PM_AddTouchEnt
CALLV
pop
line 1238
;1237://	pm->ps->MultiJumps = 0; // Shafe - Trep - Multijumping / Wall Jumping
;1238:}
LABELV $429
endproc PM_GroundTrace 88 28
proc PM_SetWaterLevel 48 8
line 1246
;1239:
;1240:
;1241:/*
;1242:=============
;1243:PM_SetWaterLevel	FIXME: avoid this twice?  certainly if not moving
;1244:=============
;1245:*/
;1246:static void PM_SetWaterLevel( void ) {
line 1255
;1247:	vec3_t		point;
;1248:	int			cont;
;1249:	int			sample1;
;1250:	int			sample2;
;1251:
;1252:	//
;1253:	// get waterlevel, accounting for ducking
;1254:	//
;1255:	pm->waterlevel = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 0
ASGNI4
line 1256
;1256:	pm->watertype = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 0
ASGNI4
line 1258
;1257:
;1258:	point[0] = pm->ps->origin[0];
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
line 1259
;1259:	point[1] = pm->ps->origin[1];
ADDRLP4 0+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1260
;1260:	point[2] = pm->ps->origin[2] + MINS_Z + 1;	
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
line 1261
;1261:	cont = pm->pointcontents( point, pm->ps->clientNum );
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
line 1263
;1262:
;1263:	if ( cont & MASK_WATER ) {
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $483
line 1264
;1264:		sample2 = pm->ps->viewheight - MINS_Z;
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
line 1265
;1265:		sample1 = sample2 / 2;
ADDRLP4 20
ADDRLP4 16
INDIRI4
CNSTI4 2
DIVI4
ASGNI4
line 1267
;1266:
;1267:		pm->watertype = cont;
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1268
;1268:		pm->waterlevel = 1;
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 1
ASGNI4
line 1269
;1269:		point[2] = pm->ps->origin[2] + MINS_Z + sample1;
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
line 1270
;1270:		cont = pm->pointcontents (point, pm->ps->clientNum );
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
line 1271
;1271:		if ( cont & MASK_WATER ) {
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $486
line 1272
;1272:			pm->waterlevel = 2;
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 2
ASGNI4
line 1273
;1273:			point[2] = pm->ps->origin[2] + MINS_Z + sample2;
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
line 1274
;1274:			cont = pm->pointcontents (point, pm->ps->clientNum );
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
line 1275
;1275:			if ( cont & MASK_WATER ){
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $489
line 1276
;1276:				pm->waterlevel = 3;
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 3
ASGNI4
line 1277
;1277:			}
LABELV $489
line 1278
;1278:		}
LABELV $486
line 1279
;1279:	}
LABELV $483
line 1281
;1280:
;1281:}
LABELV $480
endproc PM_SetWaterLevel 48 8
proc PM_CheckDuck 76 28
line 1291
;1282:
;1283:/*
;1284:==============
;1285:PM_CheckDuck
;1286:
;1287:Sets mins, maxs, and pm->ps->viewheight
;1288:==============
;1289:*/
;1290:static void PM_CheckDuck (void)
;1291:{
line 1294
;1292:	trace_t	trace;
;1293:
;1294:	if ( pm->ps->powerups[PW_INVULNERABILITY] ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 368
ADDP4
INDIRI4
CNSTI4 0
EQI4 $492
line 1295
;1295:		if ( pm->ps->pm_flags & PMF_INVULEXPAND ) {
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
line 1297
;1296:			// invulnerability sphere has a 42 units radius
;1297:			VectorSet( pm->mins, -42, -42, -42 );
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
line 1298
;1298:			VectorSet( pm->maxs, 42, 42, 42 );
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
line 1299
;1299:		}
ADDRGP4 $495
JUMPV
LABELV $494
line 1300
;1300:		else {
line 1301
;1301:			VectorSet( pm->mins, -15, -15, MINS_Z );
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
line 1302
;1302:			VectorSet( pm->maxs, 15, 15, 16 );
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
line 1303
;1303:		}
LABELV $495
line 1304
;1304:		pm->ps->pm_flags |= PMF_DUCKED;
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
line 1305
;1305:		pm->ps->viewheight = CROUCH_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 12
ASGNI4
line 1306
;1306:		return;
ADDRGP4 $491
JUMPV
LABELV $492
line 1308
;1307:	}
;1308:	pm->ps->pm_flags &= ~PMF_INVULEXPAND;
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
line 1310
;1309:
;1310:	pm->mins[0] = -15;
ADDRGP4 pm
INDIRP4
CNSTI4 180
ADDP4
CNSTF4 3245342720
ASGNF4
line 1311
;1311:	pm->mins[1] = -15;
ADDRGP4 pm
INDIRP4
CNSTI4 184
ADDP4
CNSTF4 3245342720
ASGNF4
line 1313
;1312:
;1313:	pm->maxs[0] = 15;
ADDRGP4 pm
INDIRP4
CNSTI4 192
ADDP4
CNSTF4 1097859072
ASGNF4
line 1314
;1314:	pm->maxs[1] = 15;
ADDRGP4 pm
INDIRP4
CNSTI4 196
ADDP4
CNSTF4 1097859072
ASGNF4
line 1316
;1315:
;1316:	pm->mins[2] = MINS_Z;
ADDRGP4 pm
INDIRP4
CNSTI4 188
ADDP4
CNSTF4 3250585600
ASGNF4
line 1318
;1317:
;1318:	if (pm->ps->pm_type == PM_DEAD)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $496
line 1319
;1319:	{
line 1320
;1320:		pm->maxs[2] = -8;
ADDRGP4 pm
INDIRP4
CNSTI4 200
ADDP4
CNSTF4 3238002688
ASGNF4
line 1321
;1321:		pm->ps->viewheight = DEAD_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 -16
ASGNI4
line 1322
;1322:		return;
ADDRGP4 $491
JUMPV
LABELV $496
line 1325
;1323:	}
;1324:
;1325:	if (pm->cmd.upmove < 0)
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $498
line 1326
;1326:	{	// duck
line 1327
;1327:		pm->ps->pm_flags |= PMF_DUCKED;
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
line 1328
;1328:	}
ADDRGP4 $499
JUMPV
LABELV $498
line 1330
;1329:	else
;1330:	{	// stand up if possible
line 1331
;1331:		if (pm->ps->pm_flags & PMF_DUCKED)
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
line 1332
;1332:		{
line 1334
;1333:			// try to stand up
;1334:			pm->maxs[2] = 32;
ADDRGP4 pm
INDIRP4
CNSTI4 200
ADDP4
CNSTF4 1107296256
ASGNF4
line 1335
;1335:			pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, pm->ps->origin, pm->ps->clientNum, pm->tracemask );
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
line 1336
;1336:			if (!trace.allsolid)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $502
line 1337
;1337:				pm->ps->pm_flags &= ~PMF_DUCKED;
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
line 1338
;1338:		}
LABELV $500
line 1339
;1339:	}
LABELV $499
line 1341
;1340:
;1341:	if (pm->ps->pm_flags & PMF_DUCKED)
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
line 1342
;1342:	{
line 1343
;1343:		pm->maxs[2] = 16;
ADDRGP4 pm
INDIRP4
CNSTI4 200
ADDP4
CNSTF4 1098907648
ASGNF4
line 1344
;1344:		pm->ps->viewheight = CROUCH_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 12
ASGNI4
line 1345
;1345:	}
ADDRGP4 $505
JUMPV
LABELV $504
line 1347
;1346:	else
;1347:	{
line 1348
;1348:		pm->maxs[2] = 32;
ADDRGP4 pm
INDIRP4
CNSTI4 200
ADDP4
CNSTF4 1107296256
ASGNF4
line 1349
;1349:		pm->ps->viewheight = DEFAULT_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 26
ASGNI4
line 1350
;1350:	}
LABELV $505
line 1351
;1351:}
LABELV $491
endproc PM_CheckDuck 76 28
proc PM_Footsteps 52 4
line 1363
;1352:
;1353:
;1354:
;1355://===================================================================
;1356:
;1357:
;1358:/*
;1359:===============
;1360:PM_Footsteps
;1361:===============
;1362:*/
;1363:static void PM_Footsteps( void ) {
line 1372
;1364:	float		bobmove;
;1365:	int			old;
;1366:	qboolean	footstep;
;1367:
;1368:	//
;1369:	// calculate speed and cycle to be used for
;1370:	// all cyclic walking effects
;1371:	//
;1372:	pm->xyspeed = sqrt( pm->ps->velocity[0] * pm->ps->velocity[0]
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
line 1375
;1373:		+  pm->ps->velocity[1] * pm->ps->velocity[1] );
;1374:
;1375:	if ( pm->ps->groundEntityNum == ENTITYNUM_NONE ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $507
line 1377
;1376:
;1377:		if ( pm->ps->powerups[PW_INVULNERABILITY] ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 368
ADDP4
INDIRI4
CNSTI4 0
EQI4 $509
line 1378
;1378:			PM_ContinueLegsAnim( LEGS_IDLECR );
CNSTI4 23
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1379
;1379:		}
LABELV $509
line 1381
;1380:		// airborne leaves position in cycle intact, but doesn't advance
;1381:		if ( pm->waterlevel > 1 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LEI4 $506
line 1382
;1382:			PM_ContinueLegsAnim( LEGS_SWIM );
CNSTI4 17
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1383
;1383:		}
line 1384
;1384:		return;
ADDRGP4 $506
JUMPV
LABELV $507
line 1388
;1385:	}
;1386:
;1387:	// if not trying to move
;1388:	if ( !pm->cmd.forwardmove && !pm->cmd.rightmove ) {
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
line 1389
;1389:		if (  pm->xyspeed < 5 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 212
ADDP4
INDIRF4
CNSTF4 1084227584
GEF4 $506
line 1390
;1390:			pm->ps->bobCycle = 0;	// start at beginning of cycle again
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 1391
;1391:			if ( pm->ps->pm_flags & PMF_DUCKED ) {
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
line 1392
;1392:				PM_ContinueLegsAnim( LEGS_IDLECR );
CNSTI4 23
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1393
;1393:			} else {
ADDRGP4 $506
JUMPV
LABELV $517
line 1394
;1394:				PM_ContinueLegsAnim( LEGS_IDLE );
CNSTI4 22
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1395
;1395:			}
line 1396
;1396:		}
line 1397
;1397:		return;
ADDRGP4 $506
JUMPV
LABELV $513
line 1401
;1398:	}
;1399:	
;1400:
;1401:	footstep = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1403
;1402:
;1403:	if ( pm->ps->pm_flags & PMF_DUCKED ) {
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
line 1404
;1404:		bobmove = 0.5;	// ducked characters bob much faster
ADDRLP4 4
CNSTF4 1056964608
ASGNF4
line 1405
;1405:		if ( pm->ps->pm_flags & PMF_BACKWARDS_RUN ) {
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
line 1406
;1406:			PM_ContinueLegsAnim( LEGS_BACKCR );
CNSTI4 32
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1407
;1407:		}
ADDRGP4 $520
JUMPV
LABELV $521
line 1408
;1408:		else {
line 1409
;1409:			PM_ContinueLegsAnim( LEGS_WALKCR );
CNSTI4 13
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1410
;1410:		}
line 1422
;1411:		// ducked characters never play footsteps
;1412:	/*
;1413:	} else 	if ( pm->ps->pm_flags & PMF_BACKWARDS_RUN ) {
;1414:		if ( !( pm->cmd.buttons & BUTTON_WALKING ) ) {
;1415:			bobmove = 0.4;	// faster speeds bob faster
;1416:			footstep = qtrue;
;1417:		} else {
;1418:			bobmove = 0.3;
;1419:		}
;1420:		PM_ContinueLegsAnim( LEGS_BACK );
;1421:	*/
;1422:	} else {
ADDRGP4 $520
JUMPV
LABELV $519
line 1423
;1423:		if ( !( pm->cmd.buttons & BUTTON_WALKING ) ) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $523
line 1424
;1424:			bobmove = 0.4f;	// faster speeds bob faster
ADDRLP4 4
CNSTF4 1053609165
ASGNF4
line 1425
;1425:			if ( pm->ps->pm_flags & PMF_BACKWARDS_RUN ) {
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
line 1426
;1426:				PM_ContinueLegsAnim( LEGS_BACK );
CNSTI4 16
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1427
;1427:			}
ADDRGP4 $526
JUMPV
LABELV $525
line 1428
;1428:			else {
line 1429
;1429:				PM_ContinueLegsAnim( LEGS_RUN );
CNSTI4 15
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1430
;1430:			}
LABELV $526
line 1431
;1431:			footstep = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 1432
;1432:		} else {
ADDRGP4 $524
JUMPV
LABELV $523
line 1433
;1433:			bobmove = 0.3f;	// walking bobs slow
ADDRLP4 4
CNSTF4 1050253722
ASGNF4
line 1434
;1434:			if ( pm->ps->pm_flags & PMF_BACKWARDS_RUN ) {
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
line 1435
;1435:				PM_ContinueLegsAnim( LEGS_BACKWALK );
CNSTI4 33
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1436
;1436:			}
ADDRGP4 $528
JUMPV
LABELV $527
line 1437
;1437:			else {
line 1438
;1438:				PM_ContinueLegsAnim( LEGS_WALK );
CNSTI4 14
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1439
;1439:			}
LABELV $528
line 1440
;1440:		}
LABELV $524
line 1441
;1441:	}
LABELV $520
line 1444
;1442:
;1443:	// check for footstep / splash sounds
;1444:	old = pm->ps->bobCycle;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1445
;1445:	pm->ps->bobCycle = (int)( old + bobmove * pml.msec ) & 255;
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
line 1448
;1446:
;1447:	// if we just crossed a cycle boundary, play an apropriate footstep event
;1448:	if ( ( ( old + 64 ) ^ ( pm->ps->bobCycle + 64 ) ) & 128 ) {
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
line 1449
;1449:		if ( pm->waterlevel == 0 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 0
NEI4 $532
line 1451
;1450:			// on ground will only play sounds if running
;1451:			if ( footstep && !pm->noFootsteps ) {
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
line 1452
;1452:				PM_AddEvent( PM_FootstepForSurface() );
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
line 1453
;1453:			}
line 1454
;1454:		} else if ( pm->waterlevel == 1 ) {
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
line 1456
;1455:			// splashing
;1456:			PM_AddEvent( EV_FOOTSPLASH );
CNSTI4 3
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1457
;1457:		} else if ( pm->waterlevel == 2 ) {
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
line 1459
;1458:			// wading / swimming at surface
;1459:			PM_AddEvent( EV_SWIM );
CNSTI4 5
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1460
;1460:		} else if ( pm->waterlevel == 3 ) {
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
line 1463
;1461:			// no sound when completely underwater
;1462:
;1463:		}
LABELV $540
LABELV $539
LABELV $537
LABELV $533
line 1464
;1464:	}
LABELV $530
line 1465
;1465:}
LABELV $506
endproc PM_Footsteps 52 4
proc PM_WaterEvents 16 4
line 1474
;1466:
;1467:/*
;1468:==============
;1469:PM_WaterEvents
;1470:
;1471:Generate sound events for entering and leaving water
;1472:==============
;1473:*/
;1474:static void PM_WaterEvents( void ) {		// FIXME?
line 1478
;1475:	//
;1476:	// if just entered a water volume, play a sound
;1477:	//
;1478:	if (!pml.previous_waterlevel && pm->waterlevel) {
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
line 1479
;1479:		PM_AddEvent( EV_WATER_TOUCH );
CNSTI4 15
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1480
;1480:	}
LABELV $543
line 1485
;1481:
;1482:	//
;1483:	// if just completely exited a water volume, play a sound
;1484:	//
;1485:	if (pml.previous_waterlevel && !pm->waterlevel) {
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
line 1486
;1486:		PM_AddEvent( EV_WATER_LEAVE );
CNSTI4 16
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1487
;1487:	}
LABELV $546
line 1492
;1488:
;1489:	//
;1490:	// check for head just going under water
;1491:	//
;1492:	if (pml.previous_waterlevel != 3 && pm->waterlevel == 3) {
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
line 1493
;1493:		PM_AddEvent( EV_WATER_UNDER );
CNSTI4 17
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1494
;1494:	}
LABELV $549
line 1499
;1495:
;1496:	//
;1497:	// check for head just coming out of water
;1498:	//
;1499:	if (pml.previous_waterlevel == 3 && pm->waterlevel != 3) {
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
line 1500
;1500:		PM_AddEvent( EV_WATER_CLEAR );
CNSTI4 18
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1501
;1501:	}
LABELV $552
line 1502
;1502:}
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
byte 4 3
byte 4 20
code
proc PM_BeginWeaponChange 8 4
line 1530
;1503:
;1504:
;1505:// Shafe - Trep - Alt Ammo Usage 
;1506:// alt ammo usage
;1507:
;1508:int		altAmmoUsage[WP_NUM_WEAPONS] =
;1509:{
;1510:	0,				//WP_NONE,
;1511:	1,				//GAUNTLET,				
;1512:	1,				//machine gun
;1513:	1,				//shotgun
;1514:	2,				//grenade launcher
;1515:	3,				//rocket launcher/singularity cannon
;1516:	1,				//flame thrower
;1517:	4,				//rail gun - it's just the sing cannon..lets make it more than alt sing to piss people off.
;1518:	12,				//Gata Gun
;1519:	3,				//bfg/devastator
;1520:	20,				//hmmmm... dunno what this one is
;1521:
;1522:
;1523:};
;1524:
;1525:/*
;1526:===============
;1527:PM_BeginWeaponChange
;1528:===============
;1529:*/
;1530:static void PM_BeginWeaponChange( int weapon ) {
line 1531
;1531:	if ( weapon <= WP_NONE || weapon >= WP_NUM_WEAPONS ) {
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
line 1532
;1532:		return;
ADDRGP4 $555
JUMPV
LABELV $556
line 1535
;1533:	}
;1534:
;1535:	if ( !( pm->ps->stats[STAT_WEAPONS] & ( 1 << weapon ) ) ) {
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
line 1536
;1536:		return;
ADDRGP4 $555
JUMPV
LABELV $559
line 1539
;1537:	}
;1538:	
;1539:	if ( pm->ps->weaponstate == WEAPON_DROPPING ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $561
line 1540
;1540:		return;
ADDRGP4 $555
JUMPV
LABELV $561
line 1543
;1541:	}
;1542:
;1543:	PM_AddEvent( EV_CHANGE_WEAPON );
CNSTI4 22
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1544
;1544:	pm->ps->weaponstate = WEAPON_DROPPING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 1545
;1545:	pm->ps->weaponTime += 200;
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
line 1546
;1546:	PM_StartTorsoAnim( TORSO_DROP );
CNSTI4 9
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1547
;1547:}
LABELV $555
endproc PM_BeginWeaponChange 8 4
proc PM_FinishWeaponChange 12 4
line 1555
;1548:
;1549:
;1550:/*
;1551:===============
;1552:PM_FinishWeaponChange
;1553:===============
;1554:*/
;1555:static void PM_FinishWeaponChange( void ) {
line 1558
;1556:	int		weapon;
;1557:
;1558:	weapon = pm->cmd.weapon;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
CNSTI4 24
ADDP4
INDIRU1
CVUI4 1
ASGNI4
line 1559
;1559:	if ( weapon < WP_NONE || weapon >= WP_NUM_WEAPONS ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $566
ADDRLP4 0
INDIRI4
CNSTI4 11
LTI4 $564
LABELV $566
line 1560
;1560:		weapon = WP_NONE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1561
;1561:	}
LABELV $564
line 1563
;1562:
;1563:	if ( !( pm->ps->stats[STAT_WEAPONS] & ( 1 << weapon ) ) ) {
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
line 1564
;1564:		weapon = WP_NONE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1565
;1565:	}
LABELV $567
line 1567
;1566:
;1567:	pm->ps->weapon = weapon;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1568
;1568:	pm->ps->weaponstate = WEAPON_RAISING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1
ASGNI4
line 1569
;1569:	pm->ps->weaponTime += 250;
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
line 1570
;1570:	PM_StartTorsoAnim( TORSO_RAISE );
CNSTI4 10
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1571
;1571:}
LABELV $563
endproc PM_FinishWeaponChange 12 4
proc PM_TorsoAnimation 0 4
line 1580
;1572:
;1573:
;1574:/*
;1575:==============
;1576:PM_TorsoAnimation
;1577:
;1578:==============
;1579:*/
;1580:static void PM_TorsoAnimation( void ) {
line 1581
;1581:	if ( pm->ps->weaponstate == WEAPON_READY ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 0
NEI4 $570
line 1582
;1582:		if ( pm->ps->weapon == WP_GAUNTLET ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 1
NEI4 $572
line 1583
;1583:			PM_ContinueTorsoAnim( TORSO_STAND2 );
CNSTI4 12
ARGI4
ADDRGP4 PM_ContinueTorsoAnim
CALLV
pop
line 1584
;1584:		} else {
ADDRGP4 $569
JUMPV
LABELV $572
line 1585
;1585:			PM_ContinueTorsoAnim( TORSO_STAND );
CNSTI4 11
ARGI4
ADDRGP4 PM_ContinueTorsoAnim
CALLV
pop
line 1586
;1586:		}
line 1587
;1587:		return;
LABELV $570
line 1589
;1588:	}
;1589:}
LABELV $569
endproc PM_TorsoAnimation 0 4
proc PM_Weapon 48 4
line 1600
;1590:
;1591:
;1592:/*
;1593:==============
;1594:PM_Weapon
;1595:
;1596:Generates weapon events and modifes the weapon counter
;1597:==============
;1598:*/
;1599:
;1600:static void PM_Weapon( void ) {
line 1602
;1601:	int		addTime;
;1602:	qboolean	altfired = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1606
;1603:
;1604:
;1605:	// don't allow attack until all buttons are up
;1606:	if ( pm->ps->pm_flags & PMF_RESPAWNED ) {
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
line 1607
;1607:		return;
ADDRGP4 $574
JUMPV
LABELV $575
line 1611
;1608:	}
;1609:
;1610:	// ignore if spectator
;1611:	if ( pm->ps->persistant[PERS_TEAM] == TEAM_SPECTATOR ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 3
NEI4 $577
line 1612
;1612:		return;
ADDRGP4 $574
JUMPV
LABELV $577
line 1616
;1613:	}
;1614:
;1615:	// check for dead player
;1616:	if ( pm->ps->stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $579
line 1617
;1617:		pm->ps->weapon = WP_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 0
ASGNI4
line 1618
;1618:		return;
ADDRGP4 $574
JUMPV
LABELV $579
line 1623
;1619:	}
;1620:
;1621:	// check for item using
;1622:	// Shafe - Trep - I think here is where we want to force the medkit as a MUST use holdable... but nothing done yet
;1623:	if ( pm->cmd.buttons & BUTTON_USE_HOLDABLE ) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $581
line 1624
;1624:		if ( ! ( pm->ps->pm_flags & PMF_USE_ITEM_HELD ) ) {
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
line 1625
;1625:			if ( bg_itemlist[pm->ps->stats[STAT_HOLDABLE_ITEM]].giTag == HI_MEDKIT && pm->ps->stats[STAT_HEALTH] >= (pm->ps->stats[STAT_MAX_HEALTH] + 25)) {
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
line 1627
;1626:				// don't use medkit if at max health
;1627:				pm->ps->stats[STAT_HOLDABLE_ITEM] = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 1
ASGNI4
line 1628
;1628:			} else {
ADDRGP4 $574
JUMPV
LABELV $585
line 1631
;1629:			
;1630:			
;1631:				pm->ps->pm_flags |= PMF_USE_ITEM_HELD;
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
line 1632
;1632:				PM_AddEvent( EV_USE_ITEM0 + bg_itemlist[pm->ps->stats[STAT_HOLDABLE_ITEM]].giTag );
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
line 1633
;1633:				pm->ps->stats[STAT_HOLDABLE_ITEM] = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 1634
;1634:			}
line 1635
;1635:			return;
ADDRGP4 $574
JUMPV
line 1637
;1636:		}
;1637:	} else {
LABELV $581
line 1638
;1638:		pm->ps->pm_flags &= ~PMF_USE_ITEM_HELD;
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
line 1639
;1639:	}
LABELV $582
line 1643
;1640:
;1641:
;1642:	// make weapon function
;1643:	if ( pm->ps->weaponTime > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $589
line 1644
;1644:		pm->ps->weaponTime -= pml.msec;
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
line 1645
;1645:	}
LABELV $589
line 1650
;1646:
;1647:	// check for weapon change
;1648:	// can't change if weapon is firing, but can change
;1649:	// again if lowering or raising
;1650:	if ( pm->ps->weaponTime <= 0 || pm->ps->weaponstate != WEAPON_FIRING ) {
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
line 1651
;1651:		if ( pm->ps->weapon != pm->cmd.weapon ) {
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
line 1652
;1652:			PM_BeginWeaponChange( pm->cmd.weapon );
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
line 1653
;1653:		}
LABELV $595
line 1654
;1654:	}
LABELV $592
line 1656
;1655:
;1656:	if ( pm->ps->weaponTime > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $597
line 1657
;1657:		return;
ADDRGP4 $574
JUMPV
LABELV $597
line 1661
;1658:	}
;1659:
;1660:	// change weapon if time
;1661:	if ( pm->ps->weaponstate == WEAPON_DROPPING ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $599
line 1662
;1662:		PM_FinishWeaponChange();
ADDRGP4 PM_FinishWeaponChange
CALLV
pop
line 1663
;1663:		return;
ADDRGP4 $574
JUMPV
LABELV $599
line 1669
;1664:	}
;1665:
;1666:
;1667:
;1668:
;1669:	if ( pm->ps->weaponstate == WEAPON_RAISING ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1
NEI4 $601
line 1670
;1670:		pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 1671
;1671:		if ( pm->ps->weapon == WP_GAUNTLET ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 1
NEI4 $603
line 1672
;1672:			PM_StartTorsoAnim( TORSO_STAND2 );
CNSTI4 12
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1673
;1673:		} else {
ADDRGP4 $574
JUMPV
LABELV $603
line 1674
;1674:			PM_StartTorsoAnim( TORSO_STAND );
CNSTI4 11
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1675
;1675:		}
line 1676
;1676:		return;
ADDRGP4 $574
JUMPV
LABELV $601
line 1685
;1677:	}
;1678:
;1679:
;1680:
;1681:
;1682:	// check for fire
;1683:	// Shafe - Trep - Alt Fire
;1684:
;1685:	if ( ! ((pm->cmd.buttons & BUTTON_ATTACK) ||( pm->cmd.buttons & 32)) ) 
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
;1686:	{
line 1687
;1687:				pm->ps->weaponTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 1688
;1688:				pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 1689
;1689:				altfired = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1690
;1690:				return;
ADDRGP4 $574
JUMPV
LABELV $605
line 1696
;1691:	}
;1692:	
;1693:
;1694:
;1695:	// start the animation even if out of ammo
;1696:	if ( pm->ps->weapon == WP_GAUNTLET ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 1
NEI4 $607
line 1698
;1697:		// the guantlet only "fires" when it actually hits something
;1698:		if ( !pm->gauntletHit ) {
ADDRGP4 pm
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 0
NEI4 $609
line 1699
;1699:			pm->ps->weaponTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 1700
;1700:			pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 1701
;1701:			return;
ADDRGP4 $574
JUMPV
LABELV $609
line 1703
;1702:		}
;1703:		PM_StartTorsoAnim( TORSO_ATTACK2 );
CNSTI4 8
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1704
;1704:	} else {
ADDRGP4 $608
JUMPV
LABELV $607
line 1705
;1705:		PM_StartTorsoAnim( TORSO_ATTACK );
CNSTI4 7
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1706
;1706:	}
LABELV $608
line 1708
;1707:
;1708:	pm->ps->weaponstate = WEAPON_FIRING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 3
ASGNI4
line 1711
;1709:
;1710:	// check for out of ammo
;1711:	if ( ! pm->ps->ammo[ pm->ps->weapon ] ) {
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
line 1712
;1712:		PM_AddEvent( EV_NOAMMO );
CNSTI4 21
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1713
;1713:		pm->ps->weaponTime += 500;
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
line 1714
;1714:		return;
ADDRGP4 $574
JUMPV
LABELV $611
line 1718
;1715:	}
;1716:
;1717:		// check for out of ammo for alt fire - Shafe - Trep 
;1718:	if ( pm->cmd.buttons & 32)
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $613
line 1719
;1719:	{
line 1720
;1720:		if ( (pm->ps->ammo[ pm->ps->weapon ]-altAmmoUsage[pm->ps->weapon]) <= 0) 
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
line 1721
;1721:		{
line 1722
;1722:			PM_AddEvent( EV_NOAMMO );
CNSTI4 21
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1723
;1723:			pm->ps->weaponTime += 500;
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
line 1724
;1724:			return;
ADDRGP4 $574
JUMPV
LABELV $615
line 1727
;1725:		}
;1726:
;1727:	}
LABELV $613
line 1746
;1728:
;1729:	
;1730:	
;1731:
;1732:
;1733:		
;1734:
;1735:
;1736:
;1737:
;1738:	// Shafe - Trep Instagib  Cant get this to work - But This would be the correct way to go about it
;1739:	//if (g_instagib.integer == 1) {  
;1740:	//	if ( pm->ps->weapon != WP_RAILGUN ); // InstaGib - unlimited ammo
;1741:	//}
;1742:
;1743:
;1744:// Shafe - Trep.. All Replaced For Alt Fire Usage
;1745:// Normal Attack Button 
;1746:if (pm->cmd.buttons & 1) { 
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $617
line 1749
;1747:
;1748:  // Normal Fire Event 
;1749:  PM_AddEvent( EV_FIRE_WEAPON ); 
CNSTI4 23
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1751
;1750:
;1751:  switch( pm->ps->weapon ) { 
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
line 1755
;1752:  default: 
;1753:
;1754:	case WP_GAUNTLET: 
;1755:		addTime = 400; 
ADDRLP4 4
CNSTI4 400
ASGNI4
line 1756
;1756:		break; 
ADDRGP4 $618
JUMPV
LABELV $623
line 1758
;1757:	case WP_LIGHTNING: 
;1758:		addTime = 400;  // Shafe - Trep - Flame Thrower was 50 -- Primary Fire Shoots Flame Balls
ADDRLP4 4
CNSTI4 400
ASGNI4
line 1759
;1759:		break; 
ADDRGP4 $618
JUMPV
LABELV $624
line 1761
;1760:	case WP_SHOTGUN: 
;1761:		addTime = 1000; 
ADDRLP4 4
CNSTI4 1000
ASGNI4
line 1762
;1762:		break; 
ADDRGP4 $618
JUMPV
LABELV $625
line 1764
;1763:	case WP_MACHINEGUN: 
;1764:		addTime = 100; 
ADDRLP4 4
CNSTI4 100
ASGNI4
line 1765
;1765:		break; 
ADDRGP4 $618
JUMPV
LABELV $626
line 1767
;1766:	case WP_GRENADE_LAUNCHER: 
;1767:		addTime = 800; 
ADDRLP4 4
CNSTI4 800
ASGNI4
line 1768
;1768:		break; 
ADDRGP4 $618
JUMPV
LABELV $627
line 1770
;1769:	case WP_ROCKET_LAUNCHER: 
;1770:		addTime = 800; 
ADDRLP4 4
CNSTI4 800
ASGNI4
line 1771
;1771:		break; 
ADDRGP4 $618
JUMPV
LABELV $628
line 1773
;1772:	case WP_PLASMAGUN: 
;1773:		addTime = 100; 
ADDRLP4 4
CNSTI4 100
ASGNI4
line 1774
;1774:		break; 
ADDRGP4 $618
JUMPV
LABELV $629
line 1776
;1775:	case WP_RAILGUN: 
;1776:		addTime = 1200; 
ADDRLP4 4
CNSTI4 1200
ASGNI4
line 1777
;1777:		break; 
ADDRGP4 $618
JUMPV
LABELV $630
line 1780
;1778:	case WP_BFG: 
;1779:		//  addTime = 1000; 
;1780:		addTime = 500; 
ADDRLP4 4
CNSTI4 500
ASGNI4
line 1781
;1781:		break; 
ADDRGP4 $618
JUMPV
LABELV $631
line 1783
;1782:	case WP_GRAPPLING_HOOK: 
;1783:		addTime = 400; 
ADDRLP4 4
CNSTI4 400
ASGNI4
line 1784
;1784:		break; 
line 1788
;1785:	} 
;1786:
;1787: // New Alt Fire Button 
;1788: } else if (pm->cmd.buttons & 32) { 
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
line 1791
;1789:
;1790:  // New Event 
;1791:  PM_AddEvent( EV_FIRE_WEAPON2 ); 
CNSTI4 24
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1792
;1792:  altfired = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1794
;1793:
;1794:  switch( pm->ps->weapon ) { 
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
line 1797
;1795:  default: 
;1796:  	case WP_GAUNTLET: 
;1797:		addTime = 400; 
ADDRLP4 4
CNSTI4 400
ASGNI4
line 1798
;1798:		break; 
ADDRGP4 $637
JUMPV
LABELV $640
line 1800
;1799:	case WP_LIGHTNING: 
;1800:		addTime = 60;  // Shafe - Trep - Flame Thrower was 50  // Streaming Flames
ADDRLP4 4
CNSTI4 60
ASGNI4
line 1801
;1801:		break; 
ADDRGP4 $637
JUMPV
LABELV $641
line 1803
;1802:	case WP_SHOTGUN: 
;1803:		addTime = 1000; 
ADDRLP4 4
CNSTI4 1000
ASGNI4
line 1804
;1804:		break; 
ADDRGP4 $637
JUMPV
LABELV $642
line 1806
;1805:	case WP_MACHINEGUN: 
;1806:		addTime = 1000; 
ADDRLP4 4
CNSTI4 1000
ASGNI4
line 1807
;1807:		break; 
ADDRGP4 $637
JUMPV
LABELV $643
line 1809
;1808:	case WP_GRENADE_LAUNCHER: 
;1809:		addTime = 800; 
ADDRLP4 4
CNSTI4 800
ASGNI4
line 1810
;1810:		break; 
ADDRGP4 $637
JUMPV
LABELV $644
line 1812
;1811:	case WP_ROCKET_LAUNCHER: 
;1812:		addTime = 800; 
ADDRLP4 4
CNSTI4 800
ASGNI4
line 1813
;1813:		break; 
ADDRGP4 $637
JUMPV
LABELV $645
line 1815
;1814:	case WP_PLASMAGUN: 
;1815:		addTime = 1500; 
ADDRLP4 4
CNSTI4 1500
ASGNI4
line 1816
;1816:		break; 
ADDRGP4 $637
JUMPV
LABELV $646
line 1818
;1817:	case WP_RAILGUN: 
;1818:		addTime = 1500; 
ADDRLP4 4
CNSTI4 1500
ASGNI4
line 1819
;1819:		break; 
ADDRGP4 $637
JUMPV
LABELV $647
line 1822
;1820:	case WP_BFG: 
;1821:		//  addTime = 100; 
;1822:		addTime = 3000; 
ADDRLP4 4
CNSTI4 3000
ASGNI4
line 1823
;1823:		break; 
ADDRGP4 $637
JUMPV
LABELV $648
line 1825
;1824:	case WP_GRAPPLING_HOOK: 
;1825:		addTime = 400; 
ADDRLP4 4
CNSTI4 400
ASGNI4
line 1826
;1826:		break; 
LABELV $637
line 1828
;1827:	}
;1828: }
LABELV $634
LABELV $618
line 1835
;1829:
;1830:	
;1831: 	// take an ammo away if not infinite
;1832:	// Shafe - Trep - Alt Fire Ammo Mgt
;1833:	// I moved this from above... hmmmm..
;1834:	
;1835:	if (altfired == qtrue) 
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $651
line 1836
;1836:	{
line 1837
;1837:			if ( pm->ps->ammo[ pm->ps->weapon ] != -1 ) 
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
line 1838
;1838:			{
line 1839
;1839:				pm->ps->ammo[pm->ps->weapon] -= altAmmoUsage[pm->ps->weapon];
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
line 1844
;1840:				// Let's not let them go -1 (infinite).. That is bad.. Just set the ammo to 0
;1841:				// 
;1842:				// This is gonna screw up mod makers who are used to using -1 for infinite ammo... 
;1843:				// Infinite ammo should now be 9999  - Shafe
;1844:				if (pm->ps->ammo[pm->ps->weapon] < 0) { pm->ps->ammo[pm->ps->weapon] = 0; }
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
line 1845
;1845:			}
line 1846
;1846:	} 
ADDRGP4 $652
JUMPV
LABELV $651
line 1848
;1847:	else 
;1848:	{
line 1849
;1849:		if ( pm->ps->ammo[ pm->ps->weapon ] != -1 ) {
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
line 1850
;1850:			pm->ps->ammo[ pm->ps->weapon ]--;
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
line 1851
;1851:		}
LABELV $657
line 1852
;1852:	}
LABELV $652
line 1855
;1853: 
;1854:
;1855:	if ( pm->ps->powerups[PW_HASTE] ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
CNSTI4 0
EQI4 $659
line 1856
;1856:		addTime /= 1.3;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CVIF4 4
CNSTF4 1067869798
DIVF4
CVFI4 4
ASGNI4
line 1857
;1857:	}
LABELV $659
line 1859
;1858:
;1859:	pm->ps->weaponTime += addTime;
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
line 1860
;1860:}
LABELV $574
endproc PM_Weapon 48 4
proc PM_Animate 0 4
line 1868
;1861:
;1862:/*
;1863:================
;1864:PM_Animate
;1865:================
;1866:*/
;1867:
;1868:static void PM_Animate( void ) {
line 1869
;1869:	if ( pm->cmd.buttons & BUTTON_GESTURE ) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $662
line 1870
;1870:		if ( pm->ps->torsoTimer == 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 0
NEI4 $664
line 1871
;1871:			PM_StartTorsoAnim( TORSO_GESTURE );
CNSTI4 6
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1872
;1872:			pm->ps->torsoTimer = TIMER_GESTURE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
CNSTI4 2294
ASGNI4
line 1873
;1873:			PM_AddEvent( EV_TAUNT );
CNSTI4 73
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1874
;1874:		}
LABELV $664
line 1907
;1875:#ifdef MISSIONPACK
;1876:	} else if ( pm->cmd.buttons & BUTTON_GETFLAG ) {
;1877:		if ( pm->ps->torsoTimer == 0 ) {
;1878:			PM_StartTorsoAnim( TORSO_GETFLAG );
;1879:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;1880:		}
;1881:	} else if ( pm->cmd.buttons & BUTTON_GUARDBASE ) {
;1882:		if ( pm->ps->torsoTimer == 0 ) {
;1883:			PM_StartTorsoAnim( TORSO_GUARDBASE );
;1884:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;1885:		}
;1886:	} else if ( pm->cmd.buttons & BUTTON_PATROL ) {
;1887:		if ( pm->ps->torsoTimer == 0 ) {
;1888:			PM_StartTorsoAnim( TORSO_PATROL );
;1889:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;1890:		}
;1891:	} else if ( pm->cmd.buttons & BUTTON_FOLLOWME ) {
;1892:		if ( pm->ps->torsoTimer == 0 ) {
;1893:			PM_StartTorsoAnim( TORSO_FOLLOWME );
;1894:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;1895:		}
;1896:	} else if ( pm->cmd.buttons & BUTTON_AFFIRMATIVE ) {
;1897:		if ( pm->ps->torsoTimer == 0 ) {
;1898:			PM_StartTorsoAnim( TORSO_AFFIRMATIVE);
;1899:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;1900:		}
;1901:	} else if ( pm->cmd.buttons & BUTTON_NEGATIVE ) {
;1902:		if ( pm->ps->torsoTimer == 0 ) {
;1903:			PM_StartTorsoAnim( TORSO_NEGATIVE );
;1904:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;1905:		}
;1906:#endif
;1907:	}
LABELV $662
line 1908
;1908:}
LABELV $661
endproc PM_Animate 0 4
proc PM_DropTimers 4 0
line 1916
;1909:
;1910:
;1911:/*
;1912:================
;1913:PM_DropTimers
;1914:================
;1915:*/
;1916:static void PM_DropTimers( void ) {
line 1918
;1917:	// drop misc timing counter
;1918:	if ( pm->ps->pm_time ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $667
line 1919
;1919:		if ( pml.msec >= pm->ps->pm_time ) {
ADDRGP4 pml+40
INDIRI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
LTI4 $669
line 1920
;1920:			pm->ps->pm_flags &= ~PMF_ALL_TIMES;
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
line 1921
;1921:			pm->ps->pm_time = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 1922
;1922:		} else {
ADDRGP4 $670
JUMPV
LABELV $669
line 1923
;1923:			pm->ps->pm_time -= pml.msec;
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
line 1924
;1924:		}
LABELV $670
line 1925
;1925:	}
LABELV $667
line 1928
;1926:
;1927:	// drop animation counter
;1928:	if ( pm->ps->legsTimer > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
LEI4 $673
line 1929
;1929:		pm->ps->legsTimer -= pml.msec;
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
line 1930
;1930:		if ( pm->ps->legsTimer < 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
GEI4 $676
line 1931
;1931:			pm->ps->legsTimer = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
line 1932
;1932:		}
LABELV $676
line 1933
;1933:	}
LABELV $673
line 1935
;1934:
;1935:	if ( pm->ps->torsoTimer > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 0
LEI4 $678
line 1936
;1936:		pm->ps->torsoTimer -= pml.msec;
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
line 1937
;1937:		if ( pm->ps->torsoTimer < 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 0
GEI4 $681
line 1938
;1938:			pm->ps->torsoTimer = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
CNSTI4 0
ASGNI4
line 1939
;1939:		}
LABELV $681
line 1940
;1940:	}
LABELV $678
line 1941
;1941:}
LABELV $666
endproc PM_DropTimers 4 0
export PM_UpdateViewAngles
proc PM_UpdateViewAngles 24 0
line 1951
;1942:
;1943:/*
;1944:================
;1945:PM_UpdateViewAngles
;1946:
;1947:This can be used as another entry point when only the viewangles
;1948:are being updated isntead of a full move
;1949:================
;1950:*/
;1951:void PM_UpdateViewAngles( playerState_t *ps, const usercmd_t *cmd ) {
line 1955
;1952:	short		temp;
;1953:	int		i;
;1954:
;1955:	if ( ps->pm_type == PM_INTERMISSION || ps->pm_type == PM_SPINTERMISSION) {
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
line 1956
;1956:		return;		// no view changes at all
ADDRGP4 $683
JUMPV
LABELV $684
line 1959
;1957:	}
;1958:
;1959:	if ( ps->pm_type != PM_SPECTATOR && ps->stats[STAT_HEALTH] <= 0 ) {
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
line 1960
;1960:		return;		// no view changes at all
ADDRGP4 $683
JUMPV
LABELV $687
line 1964
;1961:	}
;1962:
;1963:	// circularly clamp the angles with deltas
;1964:	for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $689
line 1965
;1965:		temp = cmd->angles[i] + ps->delta_angles[i];
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
line 1966
;1966:		if ( i == PITCH ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $693
line 1968
;1967:			// don't let the player look up or down more than 90 degrees
;1968:			if ( temp > 16000 ) {
ADDRLP4 4
INDIRI2
CVII4 2
CNSTI4 16000
LEI4 $695
line 1969
;1969:				ps->delta_angles[i] = 16000 - cmd->angles[i];
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
line 1970
;1970:				temp = 16000;
ADDRLP4 4
CNSTI2 16000
ASGNI2
line 1971
;1971:			} else if ( temp < -16000 ) {
ADDRGP4 $696
JUMPV
LABELV $695
ADDRLP4 4
INDIRI2
CVII4 2
CNSTI4 -16000
GEI4 $697
line 1972
;1972:				ps->delta_angles[i] = -16000 - cmd->angles[i];
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
line 1973
;1973:				temp = -16000;
ADDRLP4 4
CNSTI2 -16000
ASGNI2
line 1974
;1974:			}
LABELV $697
LABELV $696
line 1975
;1975:		}
LABELV $693
line 1976
;1976:		ps->viewangles[i] = SHORT2ANGLE(temp);
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
line 1977
;1977:	}
LABELV $690
line 1964
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
line 1979
;1978:
;1979:}
LABELV $683
endproc PM_UpdateViewAngles 24 0
proc PM_LadderMove 72 16
line 1992
;1980:
;1981:
;1982:// Shafe - Trep - Ladder Functions - Stolen But Credited ;)
;1983:/*
;1984:===================
;1985:PM_LadderMove()
;1986:by: Calrathan [Arthur Tomlin]
;1987:
;1988:Right now all I know is that this works for VERTICAL ladders. 
;1989:Ladders with angles on them (urban2 for AQ2) Haven't been tested
;1990:===================
;1991:*/
;1992:static void PM_LadderMove( void ) {
line 2000
;1993:        int i;
;1994:        vec3_t wishvel;
;1995:        float wishspeed;
;1996:        vec3_t wishdir;
;1997:        float scale;
;1998:        float vel;
;1999:
;2000:        PM_Friction ();
ADDRGP4 PM_Friction
CALLV
pop
line 2002
;2001:
;2002:        scale = PM_CmdScale( &pm->cmd );
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
line 2005
;2003:
;2004:        // user intentions [what the user is attempting to do]
;2005:        if ( !scale ) { 
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $700
line 2006
;2006:                wishvel[0] = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 2007
;2007:                wishvel[1] = 0;
ADDRLP4 8+4
CNSTF4 0
ASGNF4
line 2008
;2008:                wishvel[2] = 0;
ADDRLP4 8+8
CNSTF4 0
ASGNF4
line 2009
;2009:        }
ADDRGP4 $701
JUMPV
LABELV $700
line 2010
;2010:        else {   // if they're trying to move... lets calculate it
line 2011
;2011:                for (i=0 ; i<3 ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $704
line 2012
;2012:                        wishvel[i] = scale * pml.forward[i]*pm->cmd.forwardmove +
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
line 2011
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
line 2014
;2013:                                     scale * pml.right[i]*pm->cmd.rightmove; 
;2014:                wishvel[2] += scale * pm->cmd.upmove;
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
line 2015
;2015:        }
LABELV $701
line 2017
;2016:
;2017:        VectorCopy (wishvel, wishdir);
ADDRLP4 24
ADDRLP4 8
INDIRB
ASGNB 12
line 2018
;2018:        wishspeed = VectorNormalize(wishdir);
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
line 2020
;2019:
;2020:        if ( wishspeed > pm->ps->speed * pm_ladderScale ) {
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
line 2021
;2021:                wishspeed = pm->ps->speed * pm_ladderScale;
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
line 2022
;2022:        }
LABELV $710
line 2024
;2023:		
;2024:		PM_CheckJump(); // Shafe - Jump from a ladder?
ADDRGP4 PM_CheckJump
CALLI4
pop
line 2026
;2025:
;2026:        PM_Accelerate (wishdir, wishspeed, pm_ladderAccelerate);
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
line 2029
;2027:
;2028:        // This SHOULD help us with sloped ladders, but it remains untested.
;2029:        if ( pml.groundPlane && DotProduct( pm->ps->velocity, pml.groundTrace.plane.normal ) < 0 ) {
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
line 2030
;2030:                vel = VectorLength(pm->ps->velocity);
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
line 2032
;2031:                // slide along the ground plane [the ladder section under our feet] 
;2032:                PM_ClipVelocity (pm->ps->velocity, pml.groundTrace.plane.normal, 
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
line 2035
;2033:                        pm->ps->velocity, OVERCLIP );
;2034:
;2035:                VectorNormalize(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2036
;2036:                VectorScale(pm->ps->velocity, vel, pm->ps->velocity);
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
line 2037
;2037:        }
LABELV $712
line 2039
;2038:
;2039:        PM_SlideMove( qfalse ); // move without gravity
CNSTI4 0
ARGI4
ADDRGP4 PM_SlideMove
CALLI4
pop
line 2040
;2040:}
LABELV $699
endproc PM_LadderMove 72 16
export CheckLadder
proc CheckLadder 96 28
line 2049
;2041:
;2042:
;2043:/*
;2044:=============
;2045:CheckLadder [ ARTHUR TOMLIN ]
;2046:=============
;2047:*/
;2048:void CheckLadder( void )
;2049:{
line 2052
;2050:        vec3_t flatforward,spot;
;2051:        trace_t trace;
;2052:        pml.ladder = qfalse;
ADDRGP4 pml+108
CNSTI4 0
ASGNI4
line 2054
;2053:        // check for ladder
;2054:        flatforward[0] = pml.forward[0];
ADDRLP4 0
ADDRGP4 pml
INDIRF4
ASGNF4
line 2055
;2055:        flatforward[1] = pml.forward[1];
ADDRLP4 0+4
ADDRGP4 pml+4
INDIRF4
ASGNF4
line 2056
;2056:        flatforward[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 2057
;2057:        VectorNormalize (flatforward);
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2058
;2058:        VectorMA (pm->ps->origin, 1, flatforward, spot);
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
line 2059
;2059:        pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, spot, pm->ps->clientNum, MASK_PLAYERSOLID);
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
line 2061
;2060:
;2061:        if ((trace.fraction < 1) && (trace.surfaceFlags & SURF_LADDER))
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
line 2062
;2062:                pml.ladder = qtrue;
ADDRGP4 pml+108
CNSTI4 1
ASGNI4
LABELV $734
line 2064
;2063:
;2064:}
LABELV $725
endproc CheckLadder 96 28
export PmoveSingle
proc PmoveSingle 64 16
line 2077
;2065:
;2066:/// End Shafe - Ladder Functions
;2067:
;2068:
;2069:/*
;2070:================
;2071:PmoveSingle
;2072:
;2073:================
;2074:*/
;2075:void trap_SnapVector( float *v );
;2076:
;2077:void PmoveSingle (pmove_t *pmove) {
line 2078
;2078:	pm = pmove;
ADDRGP4 pm
ADDRFP4 0
INDIRP4
ASGNP4
line 2082
;2079:
;2080:	// this counter lets us debug movement problems with a journal
;2081:	// by setting a conditional breakpoint fot the previous frame
;2082:	c_pmove++;
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
line 2085
;2083:
;2084:	// clear results
;2085:	pm->numtouch = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 2086
;2086:	pm->watertype = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 0
ASGNI4
line 2087
;2087:	pm->waterlevel = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 0
ASGNI4
line 2089
;2088:
;2089:	if ( pm->ps->stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $740
line 2090
;2090:		pm->tracemask &= ~CONTENTS_BODY;	// corpses can fly through bodies
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
line 2091
;2091:	}
LABELV $740
line 2095
;2092:
;2093:	// make sure walking button is clear if they are running, to avoid
;2094:	// proxy no-footsteps cheats
;2095:	if ( abs( pm->cmd.forwardmove ) > 64 || abs( pm->cmd.rightmove ) > 64 ) {
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
line 2096
;2096:		pm->cmd.buttons &= ~BUTTON_WALKING;
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
line 2097
;2097:	}
LABELV $742
line 2100
;2098:
;2099:	// set the talk balloon flag
;2100:	if ( pm->cmd.buttons & BUTTON_TALK ) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $745
line 2101
;2101:		pm->ps->eFlags |= EF_TALK;
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
line 2102
;2102:	} else {
ADDRGP4 $746
JUMPV
LABELV $745
line 2103
;2103:		pm->ps->eFlags &= ~EF_TALK;
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
line 2104
;2104:	}
LABELV $746
line 2109
;2105:
;2106:	// set the firing flag for continuous beam weapons
;2107:	
;2108:	// Shafe - Trep - Alt Fire Code
;2109:	if ( !(pm->ps->pm_flags & PMF_RESPAWNED) && pm->ps->pm_type != PM_INTERMISSION && ( (pm->cmd.buttons & BUTTON_ATTACK) || (pm->cmd.buttons & 32) ) && pm->ps->ammo[ pm->ps->weapon ] ) { 
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
line 2110
;2110:		pm->ps->eFlags |= EF_FIRING; 
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
line 2111
;2111:	} else { 
ADDRGP4 $748
JUMPV
LABELV $747
line 2112
;2112:		pm->ps->eFlags &= ~EF_FIRING; 
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
line 2113
;2113:	}
LABELV $748
line 2122
;2114:	/*if ( !(pm->ps->pm_flags & PMF_RESPAWNED) && pm->ps->pm_type != PM_INTERMISSION
;2115:		&& ( pm->cmd.buttons & BUTTON_ATTACK ) && pm->ps->ammo[ pm->ps->weapon ] ) {
;2116:		pm->ps->eFlags |= EF_FIRING;
;2117:	} else {
;2118:		pm->ps->eFlags &= ~EF_FIRING;
;2119:	}*/
;2120:
;2121:	// clear the respawned flag if attack and use are cleared
;2122:	if ( pm->ps->stats[STAT_HEALTH] > 0 && 
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
line 2123
;2123:		!( pm->cmd.buttons & (BUTTON_ATTACK | BUTTON_USE_HOLDABLE) ) ) {
line 2124
;2124:		pm->ps->pm_flags &= ~PMF_RESPAWNED;
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
line 2125
;2125:	}
LABELV $750
line 2130
;2126:
;2127:	// if talk button is down, dissallow all other input
;2128:	// this is to prevent any possible intercept proxy from
;2129:	// adding fake talk balloons
;2130:	if ( pmove->cmd.buttons & BUTTON_TALK ) {
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $752
line 2133
;2131:		// keep the talk button set tho for when the cmd.serverTime > 66 msec
;2132:		// and the same cmd is used multiple times in Pmove
;2133:		pmove->cmd.buttons = BUTTON_TALK;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 2
ASGNI4
line 2134
;2134:		pmove->cmd.forwardmove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 25
ADDP4
CNSTI1 0
ASGNI1
line 2135
;2135:		pmove->cmd.rightmove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 26
ADDP4
CNSTI1 0
ASGNI1
line 2136
;2136:		pmove->cmd.upmove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 27
ADDP4
CNSTI1 0
ASGNI1
line 2137
;2137:	}
LABELV $752
line 2140
;2138:
;2139:	// clear all pmove local vars
;2140:	memset (&pml, 0, sizeof(pml));
ADDRGP4 pml
ARGP4
CNSTI4 0
ARGI4
CNSTI4 144
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2143
;2141:
;2142:	// determine the time
;2143:	pml.msec = pmove->cmd.serverTime - pm->ps->commandTime;
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
line 2144
;2144:	if ( pml.msec < 1 ) {
ADDRGP4 pml+40
INDIRI4
CNSTI4 1
GEI4 $755
line 2145
;2145:		pml.msec = 1;
ADDRGP4 pml+40
CNSTI4 1
ASGNI4
line 2146
;2146:	} else if ( pml.msec > 200 ) {
ADDRGP4 $756
JUMPV
LABELV $755
ADDRGP4 pml+40
INDIRI4
CNSTI4 200
LEI4 $759
line 2147
;2147:		pml.msec = 200;
ADDRGP4 pml+40
CNSTI4 200
ASGNI4
line 2148
;2148:	}
LABELV $759
LABELV $756
line 2149
;2149:	pm->ps->commandTime = pmove->cmd.serverTime;
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 2152
;2150:
;2151:	// save old org in case we get stuck
;2152:	VectorCopy (pm->ps->origin, pml.previous_origin);
ADDRGP4 pml+116
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2155
;2153:
;2154:	// save old velocity for crashlanding
;2155:	VectorCopy (pm->ps->velocity, pml.previous_velocity);
ADDRGP4 pml+128
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 2157
;2156:
;2157:	pml.frametime = pml.msec * 0.001;
ADDRGP4 pml+36
CNSTF4 981668463
ADDRGP4 pml+40
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 2160
;2158:
;2159:	// update the viewangles
;2160:	PM_UpdateViewAngles( pm->ps, &pm->cmd );
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
line 2162
;2161:
;2162:	AngleVectors (pm->ps->viewangles, pml.forward, pml.right, pml.up);
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
line 2164
;2163:
;2164:	if ( pm->cmd.upmove < 10 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
GEI4 $769
line 2166
;2165:		// not holding jump
;2166:		pm->ps->pm_flags &= ~PMF_JUMP_HELD;
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
line 2167
;2167:	}
LABELV $769
line 2170
;2168:
;2169:	// decide if backpedaling animations should be used
;2170:	if ( pm->cmd.forwardmove < 0 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $771
line 2171
;2171:		pm->ps->pm_flags |= PMF_BACKWARDS_RUN;
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
line 2172
;2172:	} else if ( pm->cmd.forwardmove > 0 || ( pm->cmd.forwardmove == 0 && pm->cmd.rightmove ) ) {
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
line 2173
;2173:		pm->ps->pm_flags &= ~PMF_BACKWARDS_RUN;
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
line 2174
;2174:	}
LABELV $773
LABELV $772
line 2176
;2175:
;2176:	if ( pm->ps->pm_type >= PM_DEAD ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
LTI4 $776
line 2177
;2177:		pm->cmd.forwardmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
CNSTI1 0
ASGNI1
line 2178
;2178:		pm->cmd.rightmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 26
ADDP4
CNSTI1 0
ASGNI1
line 2179
;2179:		pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
CNSTI1 0
ASGNI1
line 2180
;2180:	}
LABELV $776
line 2182
;2181:
;2182:	if ( pm->ps->pm_type == PM_SPECTATOR ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $778
line 2183
;2183:		PM_CheckDuck ();
ADDRGP4 PM_CheckDuck
CALLV
pop
line 2184
;2184:		PM_FlyMove ();
ADDRGP4 PM_FlyMove
CALLV
pop
line 2185
;2185:		PM_DropTimers ();
ADDRGP4 PM_DropTimers
CALLV
pop
line 2186
;2186:		return;
ADDRGP4 $739
JUMPV
LABELV $778
line 2189
;2187:	}
;2188:
;2189:	if ( pm->ps->pm_type == PM_NOCLIP ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $780
line 2190
;2190:		PM_NoclipMove ();
ADDRGP4 PM_NoclipMove
CALLV
pop
line 2191
;2191:		PM_DropTimers ();
ADDRGP4 PM_DropTimers
CALLV
pop
line 2192
;2192:		return;
ADDRGP4 $739
JUMPV
LABELV $780
line 2195
;2193:	}
;2194:
;2195:	if (pm->ps->pm_type == PM_FREEZE) {
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
line 2196
;2196:		return;		// no movement at all
ADDRGP4 $739
JUMPV
LABELV $782
line 2199
;2197:	}
;2198:
;2199:	if ( pm->ps->pm_type == PM_INTERMISSION || pm->ps->pm_type == PM_SPINTERMISSION) {
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
line 2200
;2200:		return;		// no movement at all
ADDRGP4 $739
JUMPV
LABELV $784
line 2204
;2201:	}
;2202:
;2203:	// set watertype, and waterlevel
;2204:	PM_SetWaterLevel();
ADDRGP4 PM_SetWaterLevel
CALLV
pop
line 2205
;2205:	pml.previous_waterlevel = pmove->waterlevel;
ADDRGP4 pml+140
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ASGNI4
line 2208
;2206:
;2207:	// set mins, maxs, and viewheight
;2208:	PM_CheckDuck ();
ADDRGP4 PM_CheckDuck
CALLV
pop
line 2211
;2209:
;2210:	// set groundentity
;2211:	PM_GroundTrace();
ADDRGP4 PM_GroundTrace
CALLV
pop
line 2213
;2212:
;2213:	if ( pm->ps->pm_type == PM_DEAD ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $788
line 2214
;2214:		PM_DeadMove ();
ADDRGP4 PM_DeadMove
CALLV
pop
line 2215
;2215:	}
LABELV $788
line 2217
;2216:
;2217:	PM_DropTimers();
ADDRGP4 PM_DropTimers
CALLV
pop
line 2219
;2218:
;2219:	CheckLadder();	// Shafe - Trep - Ladder Support
ADDRGP4 CheckLadder
CALLV
pop
line 2229
;2220:
;2221:#ifdef MISSIONPACK
;2222:	if ( pm->ps->powerups[PW_INVULNERABILITY] ) {
;2223:		PM_InvulnerabilityMove();
;2224:	} else
;2225:#endif
;2226:
;2227:		
;2228:	
;2229:	if ( pm->ps->powerups[PW_FLIGHT] ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $790
line 2231
;2230:		// flight powerup doesn't allow jump and has different friction
;2231:		PM_FlyMove();
ADDRGP4 PM_FlyMove
CALLV
pop
line 2232
;2232:	} else if (pm->ps->pm_flags & PMF_GRAPPLE_PULL) {
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
line 2233
;2233:		PM_GrappleMove();
ADDRGP4 PM_GrappleMove
CALLV
pop
line 2235
;2234:		// We can wiggle a bit
;2235:		PM_AirMove();
ADDRGP4 PM_AirMove
CALLV
pop
line 2236
;2236:	} else if (pm->ps->pm_flags & PMF_TIME_WATERJUMP) {
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
line 2237
;2237:		PM_WaterJumpMove();
ADDRGP4 PM_WaterJumpMove
CALLV
pop
line 2238
;2238:	} else if ( pm->waterlevel > 1 ) {
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
line 2240
;2239:		// swimming
;2240:		PM_WaterMove();
ADDRGP4 PM_WaterMove
CALLV
pop
line 2241
;2241:	} else if (pml.ladder) {        
ADDRGP4 $797
JUMPV
LABELV $796
ADDRGP4 pml+108
INDIRI4
CNSTI4 0
EQI4 $798
line 2242
;2242:        PM_LadderMove();
ADDRGP4 PM_LadderMove
CALLV
pop
line 2243
;2243:	} else if ( pml.walking ) {
ADDRGP4 $799
JUMPV
LABELV $798
ADDRGP4 pml+44
INDIRI4
CNSTI4 0
EQI4 $801
line 2245
;2244:		// walking on ground
;2245:		PM_WalkMove();
ADDRGP4 PM_WalkMove
CALLV
pop
line 2246
;2246:	} else {
ADDRGP4 $802
JUMPV
LABELV $801
line 2248
;2247:		// airborne
;2248:		PM_AirMove();
ADDRGP4 PM_AirMove
CALLV
pop
line 2249
;2249:	}
LABELV $802
LABELV $799
LABELV $797
LABELV $795
LABELV $793
LABELV $791
line 2251
;2250:
;2251:	PM_Animate();
ADDRGP4 PM_Animate
CALLV
pop
line 2254
;2252:
;2253:	// set groundentity, watertype, and waterlevel
;2254:	PM_GroundTrace();
ADDRGP4 PM_GroundTrace
CALLV
pop
line 2255
;2255:	PM_SetWaterLevel();
ADDRGP4 PM_SetWaterLevel
CALLV
pop
line 2258
;2256:
;2257:	// weapons
;2258:	PM_Weapon();
ADDRGP4 PM_Weapon
CALLV
pop
line 2261
;2259:
;2260:	// torso animation
;2261:	PM_TorsoAnimation();
ADDRGP4 PM_TorsoAnimation
CALLV
pop
line 2264
;2262:
;2263:	// footstep events / legs animations
;2264:	PM_Footsteps();
ADDRGP4 PM_Footsteps
CALLV
pop
line 2267
;2265:
;2266:	// entering / leaving water splashes
;2267:	PM_WaterEvents();
ADDRGP4 PM_WaterEvents
CALLV
pop
line 2270
;2268:
;2269:	// snap some parts of playerstate to save network bandwidth
;2270:	trap_SnapVector( pm->ps->velocity );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 trap_SnapVector
CALLV
pop
line 2271
;2271:}
LABELV $739
endproc PmoveSingle 64 16
export Pmove
proc Pmove 16 4
line 2281
;2272:
;2273:
;2274:/*
;2275:================
;2276:Pmove
;2277:
;2278:Can be called by either the server or the client
;2279:================
;2280:*/
;2281:void Pmove (pmove_t *pmove) {
line 2284
;2282:	int			finalTime;
;2283:
;2284:	finalTime = pmove->cmd.serverTime;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 2286
;2285:
;2286:	if ( finalTime < pmove->ps->commandTime ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
INDIRP4
INDIRI4
GEI4 $805
line 2287
;2287:		return;	// should not happen
ADDRGP4 $804
JUMPV
LABELV $805
line 2290
;2288:	}
;2289:
;2290:	if ( finalTime > pmove->ps->commandTime + 1000 ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
INDIRP4
INDIRI4
CNSTI4 1000
ADDI4
LEI4 $807
line 2291
;2291:		pmove->ps->commandTime = finalTime - 1000;
ADDRFP4 0
INDIRP4
INDIRP4
ADDRLP4 0
INDIRI4
CNSTI4 1000
SUBI4
ASGNI4
line 2292
;2292:	}
LABELV $807
line 2294
;2293:
;2294:	pmove->ps->pmove_framecount = (pmove->ps->pmove_framecount+1) & ((1<<PS_PMOVEFRAMECOUNTBITS)-1);
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
line 2298
;2295:
;2296:	// chop the move up if it is too long, to prevent framerate
;2297:	// dependent behavior
;2298:	while ( pmove->ps->commandTime != finalTime ) {
line 2301
;2299:		int		msec;
;2300:
;2301:		msec = finalTime - pmove->ps->commandTime;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 2303
;2302:
;2303:		if ( pmove->pmove_fixed ) {
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
EQI4 $812
line 2304
;2304:			if ( msec > pmove->pmove_msec ) {
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
LEI4 $813
line 2305
;2305:				msec = pmove->pmove_msec;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ASGNI4
line 2306
;2306:			}
line 2307
;2307:		}
ADDRGP4 $813
JUMPV
LABELV $812
line 2308
;2308:		else {
line 2309
;2309:			if ( msec > 66 ) {
ADDRLP4 8
INDIRI4
CNSTI4 66
LEI4 $816
line 2310
;2310:				msec = 66;
ADDRLP4 8
CNSTI4 66
ASGNI4
line 2311
;2311:			}
LABELV $816
line 2312
;2312:		}
LABELV $813
line 2313
;2313:		pmove->cmd.serverTime = pmove->ps->commandTime + msec;
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
line 2314
;2314:		PmoveSingle( pmove );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 PmoveSingle
CALLV
pop
line 2316
;2315:
;2316:		if ( pmove->ps->pm_flags & PMF_JUMP_HELD ) {
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
line 2317
;2317:			pmove->cmd.upmove = 20;
ADDRFP4 0
INDIRP4
CNSTI4 27
ADDP4
CNSTI1 20
ASGNI1
line 2318
;2318:		}
LABELV $818
line 2319
;2319:	}
LABELV $810
line 2298
ADDRFP4 0
INDIRP4
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $809
line 2323
;2320:
;2321:	//PM_CheckStuck();
;2322:
;2323:}
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
