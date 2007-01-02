export PM_SlideMove
code
proc PM_SlideMove 308 28
file "../bg_slidemove.c"
line 25
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// bg_slidemove.c -- part of bg_pmove functionality
;4:
;5:#include "q_shared.h"
;6:#include "bg_public.h"
;7:#include "bg_local.h"
;8:
;9:/*
;10:
;11:input: origin, velocity, bounds, groundPlane, trace function
;12:
;13:output: origin, velocity, impacts, stairup boolean
;14:
;15:*/
;16:
;17:/*
;18:==================
;19:PM_SlideMove
;20:
;21:Returns qtrue if the velocity was clipped in some way
;22:==================
;23:*/
;24:#define	MAX_CLIP_PLANES	5
;25:qboolean	PM_SlideMove( qboolean gravity ) {
line 41
;26:	int			bumpcount, numbumps;
;27:	vec3_t		dir;
;28:	float		d;
;29:	int			numplanes;
;30:	vec3_t		planes[MAX_CLIP_PLANES];
;31:	vec3_t		primal_velocity;
;32:	vec3_t		clipVelocity;
;33:	int			i, j, k;
;34:	trace_t	trace;
;35:	vec3_t		end;
;36:	float		time_left;
;37:	float		into;
;38:	vec3_t		endVelocity;
;39:	vec3_t		endClipVelocity;
;40:	
;41:	numbumps = 4;
ADDRLP4 208
CNSTI4 4
ASGNI4
line 43
;42:
;43:	VectorCopy (pm->ps->velocity, primal_velocity);
ADDRLP4 212
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 45
;44:
;45:	if ( gravity ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $44
line 46
;46:		VectorCopy( pm->ps->velocity, endVelocity );
ADDRLP4 116
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 47
;47:		endVelocity[2] -= pm->ps->gravity * pml.frametime;
ADDRLP4 116+8
ADDRLP4 116+8
INDIRF4
ADDRGP4 pm
INDIRP4
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
line 48
;48:		pm->ps->velocity[2] = ( pm->ps->velocity[2] + endVelocity[2] ) * 0.5;
ADDRLP4 224
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 224
INDIRP4
CNSTF4 1056964608
ADDRLP4 224
INDIRP4
INDIRF4
ADDRLP4 116+8
INDIRF4
ADDF4
MULF4
ASGNF4
line 49
;49:		primal_velocity[2] = endVelocity[2];
ADDRLP4 212+8
ADDRLP4 116+8
INDIRF4
ASGNF4
line 50
;50:		if ( pml.groundPlane ) {
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $51
line 52
;51:			// slide along the ground plane
;52:			PM_ClipVelocity (pm->ps->velocity, pml.groundTrace.plane.normal, 
ADDRLP4 228
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 228
INDIRP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 228
INDIRP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 54
;53:				pm->ps->velocity, OVERCLIP );
;54:		}
LABELV $51
line 55
;55:	}
LABELV $44
line 57
;56:
;57:	time_left = pml.frametime;
ADDRLP4 188
ADDRGP4 pml+36
INDIRF4
ASGNF4
line 60
;58:
;59:	// never turn against the ground plane
;60:	if ( pml.groundPlane ) {
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $57
line 61
;61:		numplanes = 1;
ADDRLP4 96
CNSTI4 1
ASGNI4
line 62
;62:		VectorCopy( pml.groundTrace.plane.normal, planes[0] );
ADDRLP4 4
ADDRGP4 pml+52+24
INDIRB
ASGNB 12
line 63
;63:	} else {
ADDRGP4 $58
JUMPV
LABELV $57
line 64
;64:		numplanes = 0;
ADDRLP4 96
CNSTI4 0
ASGNI4
line 65
;65:	}
LABELV $58
line 68
;66:
;67:	// never turn against original velocity
;68:	VectorNormalize2( pm->ps->velocity, planes[numplanes] );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTI4 12
ADDRLP4 96
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRGP4 VectorNormalize2
CALLF4
pop
line 69
;69:	numplanes++;
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 71
;70:
;71:	for ( bumpcount=0 ; bumpcount < numbumps ; bumpcount++ ) {
ADDRLP4 204
CNSTI4 0
ASGNI4
ADDRGP4 $65
JUMPV
LABELV $62
line 74
;72:
;73:		// calculate position we are trying to move to
;74:		VectorMA( pm->ps->origin, time_left, pm->ps->velocity, end );
ADDRLP4 224
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 228
ADDRLP4 224
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 192
ADDRLP4 228
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 228
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 188
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 236
ADDRLP4 224
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 192+4
ADDRLP4 236
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 236
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 188
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 240
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 192+8
ADDRLP4 240
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 240
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 188
INDIRF4
MULF4
ADDF4
ASGNF4
line 77
;75:
;76:		// see if we can make it there
;77:		pm->trace ( &trace, pm->ps->origin, pm->mins, pm->maxs, end, pm->ps->clientNum, pm->tracemask);
ADDRLP4 128
ARGP4
ADDRLP4 244
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 248
ADDRLP4 244
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 248
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 244
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 244
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 192
ARGP4
ADDRLP4 248
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 244
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 244
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CALLV
pop
line 79
;78:
;79:		if (trace.allsolid) {
ADDRLP4 128
INDIRI4
CNSTI4 0
EQI4 $68
line 81
;80:			// entity is completely trapped in another solid
;81:			pm->ps->velocity[2] = 0;	// don't build up falling damage, but allow sideways acceleration
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
line 82
;82:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $43
JUMPV
LABELV $68
line 85
;83:		}
;84:
;85:		if (trace.fraction > 0) {
ADDRLP4 128+8
INDIRF4
CNSTF4 0
LEF4 $70
line 87
;86:			// actually covered some distance
;87:			VectorCopy (trace.endpos, pm->ps->origin);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 128+12
INDIRB
ASGNB 12
line 88
;88:		}
LABELV $70
line 90
;89:
;90:		if (trace.fraction == 1) {
ADDRLP4 128+8
INDIRF4
CNSTF4 1065353216
NEF4 $74
line 91
;91:			 break;		// moved the entire distance
ADDRGP4 $64
JUMPV
LABELV $74
line 95
;92:		}
;93:
;94:		// save entity for contact
;95:		PM_AddTouchEnt( trace.entityNum );
ADDRLP4 128+52
INDIRI4
ARGI4
ADDRGP4 PM_AddTouchEnt
CALLV
pop
line 97
;96:
;97:		time_left -= time_left * trace.fraction;
ADDRLP4 188
ADDRLP4 188
INDIRF4
ADDRLP4 188
INDIRF4
ADDRLP4 128+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 99
;98:
;99:		if (numplanes >= MAX_CLIP_PLANES) {
ADDRLP4 96
INDIRI4
CNSTI4 5
LTI4 $79
line 101
;100:			// this shouldn't really happen
;101:			VectorClear( pm->ps->velocity );
ADDRLP4 256
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 260
CNSTF4 0
ASGNF4
ADDRLP4 256
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 260
INDIRF4
ASGNF4
ADDRLP4 256
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 260
INDIRF4
ASGNF4
ADDRLP4 256
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 260
INDIRF4
ASGNF4
line 102
;102:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $43
JUMPV
LABELV $79
line 110
;103:		}
;104:
;105:		//
;106:		// if this is the same plane we hit before, nudge velocity
;107:		// out along it, which fixes some epsilon issues with
;108:		// non-axial planes
;109:		//
;110:		for ( i = 0 ; i < numplanes ; i++ ) {
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRGP4 $84
JUMPV
LABELV $81
line 111
;111:			if ( DotProduct( trace.plane.normal, planes[i] ) > 0.99 ) {
ADDRLP4 256
CNSTI4 12
ADDRLP4 80
INDIRI4
MULI4
ASGNI4
ADDRLP4 128+24
INDIRF4
ADDRLP4 256
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 128+24+4
INDIRF4
ADDRLP4 256
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 128+24+8
INDIRF4
ADDRLP4 256
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1065185444
LEF4 $85
line 112
;112:				VectorAdd( trace.plane.normal, pm->ps->velocity, pm->ps->velocity );
ADDRLP4 260
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 260
INDIRP4
ADDRLP4 128+24
INDIRF4
ADDRLP4 260
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 264
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 264
INDIRP4
ADDRLP4 128+24+4
INDIRF4
ADDRLP4 264
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 268
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 268
INDIRP4
ADDRLP4 128+24+8
INDIRF4
ADDRLP4 268
INDIRP4
INDIRF4
ADDF4
ASGNF4
line 113
;113:				break;
ADDRGP4 $83
JUMPV
LABELV $85
line 115
;114:			}
;115:		}
LABELV $82
line 110
ADDRLP4 80
ADDRLP4 80
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $84
ADDRLP4 80
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $81
LABELV $83
line 116
;116:		if ( i < numplanes ) {
ADDRLP4 80
INDIRI4
ADDRLP4 96
INDIRI4
GEI4 $99
line 117
;117:			continue;
ADDRGP4 $63
JUMPV
LABELV $99
line 119
;118:		}
;119:		VectorCopy (trace.plane.normal, planes[numplanes]);
CNSTI4 12
ADDRLP4 96
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ADDRLP4 128+24
INDIRB
ASGNB 12
line 120
;120:		numplanes++;
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 127
;121:
;122:		//
;123:		// modify velocity so it parallels all of the clip planes
;124:		//
;125:
;126:		// find a plane that it enters
;127:		for ( i = 0 ; i < numplanes ; i++ ) {
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRGP4 $105
JUMPV
LABELV $102
line 128
;128:			into = DotProduct( pm->ps->velocity, planes[i] );
ADDRLP4 256
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 260
CNSTI4 12
ADDRLP4 80
INDIRI4
MULI4
ASGNI4
ADDRLP4 184
ADDRLP4 256
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 260
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 256
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 260
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 256
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 260
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 129
;129:			if ( into >= 0.1 ) {
ADDRLP4 184
INDIRF4
CNSTF4 1036831949
LTF4 $108
line 130
;130:				continue;		// move doesn't interact with the plane
ADDRGP4 $103
JUMPV
LABELV $108
line 134
;131:			}
;132:
;133:			// see how hard we are hitting things
;134:			if ( -into > pml.impactSpeed ) {
ADDRLP4 184
INDIRF4
NEGF4
ADDRGP4 pml+112
INDIRF4
LEF4 $110
line 135
;135:				pml.impactSpeed = -into;
ADDRGP4 pml+112
ADDRLP4 184
INDIRF4
NEGF4
ASGNF4
line 136
;136:			}
LABELV $110
line 139
;137:
;138:			// slide along the plane
;139:			PM_ClipVelocity (pm->ps->velocity, planes[i], clipVelocity, OVERCLIP );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTI4 12
ADDRLP4 80
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 64
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 142
;140:
;141:			// slide along the plane
;142:			PM_ClipVelocity (endVelocity, planes[i], endClipVelocity, OVERCLIP );
ADDRLP4 116
ARGP4
CNSTI4 12
ADDRLP4 80
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 104
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 145
;143:
;144:			// see if there is a second plane that the new move enters
;145:			for ( j = 0 ; j < numplanes ; j++ ) {
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRGP4 $117
JUMPV
LABELV $114
line 146
;146:				if ( j == i ) {
ADDRLP4 76
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $118
line 147
;147:					continue;
ADDRGP4 $115
JUMPV
LABELV $118
line 149
;148:				}
;149:				if ( DotProduct( clipVelocity, planes[j] ) >= 0.1 ) {
ADDRLP4 264
CNSTI4 12
ADDRLP4 76
INDIRI4
MULI4
ASGNI4
ADDRLP4 64
INDIRF4
ADDRLP4 264
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 264
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 264
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1036831949
LTF4 $120
line 150
;150:					continue;		// move doesn't interact with the plane
ADDRGP4 $115
JUMPV
LABELV $120
line 154
;151:				}
;152:
;153:				// try clipping the move to the plane
;154:				PM_ClipVelocity( clipVelocity, planes[j], clipVelocity, OVERCLIP );
ADDRLP4 64
ARGP4
CNSTI4 12
ADDRLP4 76
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 64
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 155
;155:				PM_ClipVelocity( endClipVelocity, planes[j], endClipVelocity, OVERCLIP );
ADDRLP4 104
ARGP4
CNSTI4 12
ADDRLP4 76
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 104
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 158
;156:
;157:				// see if it goes back into the first clip plane
;158:				if ( DotProduct( clipVelocity, planes[i] ) >= 0 ) {
ADDRLP4 268
CNSTI4 12
ADDRLP4 80
INDIRI4
MULI4
ASGNI4
ADDRLP4 64
INDIRF4
ADDRLP4 268
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 268
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 268
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 0
LTF4 $126
line 159
;159:					continue;
ADDRGP4 $115
JUMPV
LABELV $126
line 163
;160:				}
;161:
;162:				// slide the original velocity along the crease
;163:				CrossProduct (planes[i], planes[j], dir);
ADDRLP4 272
CNSTI4 12
ASGNI4
ADDRLP4 272
INDIRI4
ADDRLP4 80
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 272
INDIRI4
ADDRLP4 76
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 84
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 164
;164:				VectorNormalize( dir );
ADDRLP4 84
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 165
;165:				d = DotProduct( dir, pm->ps->velocity );
ADDRLP4 276
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 100
ADDRLP4 84
INDIRF4
ADDRLP4 276
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 84+4
INDIRF4
ADDRLP4 276
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 84+8
INDIRF4
ADDRLP4 276
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 166
;166:				VectorScale( dir, d, clipVelocity );
ADDRLP4 64
ADDRLP4 84
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 84+4
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
line 168
;167:
;168:				CrossProduct (planes[i], planes[j], dir);
ADDRLP4 284
CNSTI4 12
ASGNI4
ADDRLP4 284
INDIRI4
ADDRLP4 80
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 284
INDIRI4
ADDRLP4 76
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 84
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 169
;169:				VectorNormalize( dir );
ADDRLP4 84
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 170
;170:				d = DotProduct( dir, endVelocity );
ADDRLP4 100
ADDRLP4 84
INDIRF4
ADDRLP4 116
INDIRF4
MULF4
ADDRLP4 84+4
INDIRF4
ADDRLP4 116+4
INDIRF4
MULF4
ADDF4
ADDRLP4 84+8
INDIRF4
ADDRLP4 116+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 171
;171:				VectorScale( dir, d, endClipVelocity );
ADDRLP4 104
ADDRLP4 84
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 104+4
ADDRLP4 84+4
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 104+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
line 174
;172:
;173:				// see if there is a third plane the the new move enters
;174:				for ( k = 0 ; k < numplanes ; k++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $149
JUMPV
LABELV $146
line 175
;175:					if ( k == i || k == j ) {
ADDRLP4 0
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $152
ADDRLP4 0
INDIRI4
ADDRLP4 76
INDIRI4
NEI4 $150
LABELV $152
line 176
;176:						continue;
ADDRGP4 $147
JUMPV
LABELV $150
line 178
;177:					}
;178:					if ( DotProduct( clipVelocity, planes[k] ) >= 0.1 ) {
ADDRLP4 296
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 64
INDIRF4
ADDRLP4 296
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 296
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 296
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1036831949
LTF4 $153
line 179
;179:						continue;		// move doesn't interact with the plane
ADDRGP4 $147
JUMPV
LABELV $153
line 183
;180:					}
;181:
;182:					// stop dead at a tripple plane interaction
;183:					VectorClear( pm->ps->velocity );
ADDRLP4 300
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 304
CNSTF4 0
ASGNF4
ADDRLP4 300
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 304
INDIRF4
ASGNF4
ADDRLP4 300
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 304
INDIRF4
ASGNF4
ADDRLP4 300
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 304
INDIRF4
ASGNF4
line 184
;184:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $43
JUMPV
LABELV $147
line 174
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $149
ADDRLP4 0
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $146
line 186
;185:				}
;186:			}
LABELV $115
line 145
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $117
ADDRLP4 76
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $114
line 189
;187:
;188:			// if we have fixed all interactions, try another move
;189:			VectorCopy( clipVelocity, pm->ps->velocity );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 64
INDIRB
ASGNB 12
line 190
;190:			VectorCopy( endClipVelocity, endVelocity );
ADDRLP4 116
ADDRLP4 104
INDIRB
ASGNB 12
line 191
;191:			break;
ADDRGP4 $104
JUMPV
LABELV $103
line 127
ADDRLP4 80
ADDRLP4 80
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $105
ADDRLP4 80
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $102
LABELV $104
line 193
;192:		}
;193:	}
LABELV $63
line 71
ADDRLP4 204
ADDRLP4 204
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $65
ADDRLP4 204
INDIRI4
ADDRLP4 208
INDIRI4
LTI4 $62
LABELV $64
line 195
;194:
;195:	if ( gravity ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $159
line 196
;196:		VectorCopy( endVelocity, pm->ps->velocity );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 116
INDIRB
ASGNB 12
line 197
;197:	}
LABELV $159
line 200
;198:
;199:	// don't change velocity if in a timer (FIXME: is this correct?)
;200:	if ( pm->ps->pm_time ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $161
line 201
;201:		VectorCopy( primal_velocity, pm->ps->velocity );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 212
INDIRB
ASGNB 12
line 202
;202:	}
LABELV $161
line 204
;203:
;204:	return ( bumpcount != 0 );
ADDRLP4 204
INDIRI4
CNSTI4 0
EQI4 $164
ADDRLP4 224
CNSTI4 1
ASGNI4
ADDRGP4 $165
JUMPV
LABELV $164
ADDRLP4 224
CNSTI4 0
ASGNI4
LABELV $165
ADDRLP4 224
INDIRI4
RETI4
LABELV $43
endproc PM_SlideMove 308 28
export PM_StepSlideMove
proc PM_StepSlideMove 160 28
line 213
;205:}
;206:
;207:/*
;208:==================
;209:PM_StepSlideMove
;210:
;211:==================
;212:*/
;213:void PM_StepSlideMove( qboolean gravity ) {
line 222
;214:	vec3_t		start_o, start_v;
;215:	vec3_t		down_o, down_v;
;216:	trace_t		trace;
;217://	float		down_dist, up_dist;
;218://	vec3_t		delta, delta2;
;219:	vec3_t		up, down;
;220:	float		stepSize;
;221:
;222:	VectorCopy (pm->ps->origin, start_o);
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 223
;223:	VectorCopy (pm->ps->velocity, start_v);
ADDRLP4 92
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 225
;224:
;225:	if ( PM_SlideMove( gravity ) == 0 ) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 132
ADDRGP4 PM_SlideMove
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 0
NEI4 $167
line 226
;226:		return;		// we got exactly where we wanted to go first try	
ADDRGP4 $166
JUMPV
LABELV $167
line 229
;227:	}
;228:
;229:	VectorCopy(start_o, down);
ADDRLP4 80
ADDRLP4 68
INDIRB
ASGNB 12
line 230
;230:	down[2] -= STEPSIZE;
ADDRLP4 80+8
ADDRLP4 80+8
INDIRF4
CNSTF4 1099956224
SUBF4
ASGNF4
line 231
;231:	pm->trace (&trace, start_o, pm->mins, pm->maxs, down, pm->ps->clientNum, pm->tracemask);
ADDRLP4 0
ARGP4
ADDRLP4 68
ARGP4
ADDRLP4 136
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 136
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 136
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 136
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 136
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 136
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CALLV
pop
line 232
;232:	VectorSet(up, 0, 0, 1);
ADDRLP4 140
CNSTF4 0
ASGNF4
ADDRLP4 56
ADDRLP4 140
INDIRF4
ASGNF4
ADDRLP4 56+4
ADDRLP4 140
INDIRF4
ASGNF4
ADDRLP4 56+8
CNSTF4 1065353216
ASGNF4
line 234
;233:	// never step up when you still have up velocity
;234:	if ( pm->ps->velocity[2] > 0 && (trace.fraction == 1.0 ||
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
LEF4 $172
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $182
ADDRLP4 0+24
INDIRF4
ADDRLP4 56
INDIRF4
MULF4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 56+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 56+8
INDIRF4
MULF4
ADDF4
CNSTF4 1060320051
GEF4 $172
LABELV $182
line 235
;235:										DotProduct(trace.plane.normal, up) < 0.7)) {
line 236
;236:		return;
ADDRGP4 $166
JUMPV
LABELV $172
line 239
;237:	}
;238:
;239:	VectorCopy (pm->ps->origin, down_o);
ADDRLP4 108
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 240
;240:	VectorCopy (pm->ps->velocity, down_v);
ADDRLP4 120
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 242
;241:
;242:	VectorCopy (start_o, up);
ADDRLP4 56
ADDRLP4 68
INDIRB
ASGNB 12
line 243
;243:	up[2] += STEPSIZE;
ADDRLP4 56+8
ADDRLP4 56+8
INDIRF4
CNSTF4 1099956224
ADDF4
ASGNF4
line 246
;244:
;245:	// test the player position if they were a stepheight higher
;246:	pm->trace (&trace, start_o, pm->mins, pm->maxs, up, pm->ps->clientNum, pm->tracemask);
ADDRLP4 0
ARGP4
ADDRLP4 68
ARGP4
ADDRLP4 144
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 144
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 144
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 144
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CALLV
pop
line 247
;247:	if ( trace.allsolid ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $184
line 248
;248:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $166
line 249
;249:			Com_Printf("%i:bend can't step\n", c_pmove);
ADDRGP4 $188
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 250
;250:		}
line 251
;251:		return;		// can't step up
ADDRGP4 $166
JUMPV
LABELV $184
line 254
;252:	}
;253:
;254:	stepSize = trace.endpos[2] - start_o[2];
ADDRLP4 104
ADDRLP4 0+12+8
INDIRF4
ADDRLP4 68+8
INDIRF4
SUBF4
ASGNF4
line 256
;255:	// try slidemove from this position
;256:	VectorCopy (trace.endpos, pm->ps->origin);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 257
;257:	VectorCopy (start_v, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 92
INDIRB
ASGNB 12
line 259
;258:
;259:	PM_SlideMove( gravity );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 PM_SlideMove
CALLI4
pop
line 262
;260:
;261:	// push down the final amount
;262:	VectorCopy (pm->ps->origin, down);
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 263
;263:	down[2] -= stepSize;
ADDRLP4 80+8
ADDRLP4 80+8
INDIRF4
ADDRLP4 104
INDIRF4
SUBF4
ASGNF4
line 264
;264:	pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, down, pm->ps->clientNum, pm->tracemask);
ADDRLP4 0
ARGP4
ADDRLP4 148
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 152
ADDRLP4 148
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 148
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 148
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 152
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 148
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 148
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CALLV
pop
line 265
;265:	if ( !trace.allsolid ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $194
line 266
;266:		VectorCopy (trace.endpos, pm->ps->origin);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 267
;267:	}
LABELV $194
line 268
;268:	if ( trace.fraction < 1.0 ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $197
line 269
;269:		PM_ClipVelocity( pm->ps->velocity, trace.plane.normal, pm->ps->velocity, OVERCLIP );
ADDRLP4 156
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ARGP4
ADDRLP4 0+24
ARGP4
ADDRLP4 156
INDIRP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 270
;270:	}
LABELV $197
line 284
;271:
;272:#if 0
;273:	// if the down trace can trace back to the original position directly, don't step
;274:	pm->trace( &trace, pm->ps->origin, pm->mins, pm->maxs, start_o, pm->ps->clientNum, pm->tracemask);
;275:	if ( trace.fraction == 1.0 ) {
;276:		// use the original move
;277:		VectorCopy (down_o, pm->ps->origin);
;278:		VectorCopy (down_v, pm->ps->velocity);
;279:		if ( pm->debugLevel ) {
;280:			Com_Printf("%i:bend\n", c_pmove);
;281:		}
;282:	} else 
;283:#endif
;284:	{
line 288
;285:		// use the step move
;286:		float	delta;
;287:
;288:		delta = pm->ps->origin[2] - start_o[2];
ADDRLP4 156
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 68+8
INDIRF4
SUBF4
ASGNF4
line 289
;289:		if ( delta > 2 ) {
ADDRLP4 156
INDIRF4
CNSTF4 1073741824
LEF4 $202
line 290
;290:			if ( delta < 7 ) {
ADDRLP4 156
INDIRF4
CNSTF4 1088421888
GEF4 $204
line 291
;291:				PM_AddEvent( EV_STEP_4 );
CNSTI4 6
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 292
;292:			} else if ( delta < 11 ) {
ADDRGP4 $205
JUMPV
LABELV $204
ADDRLP4 156
INDIRF4
CNSTF4 1093664768
GEF4 $206
line 293
;293:				PM_AddEvent( EV_STEP_8 );
CNSTI4 7
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 294
;294:			} else if ( delta < 15 ) {
ADDRGP4 $207
JUMPV
LABELV $206
ADDRLP4 156
INDIRF4
CNSTF4 1097859072
GEF4 $208
line 295
;295:				PM_AddEvent( EV_STEP_12 );
CNSTI4 8
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 296
;296:			} else {
ADDRGP4 $209
JUMPV
LABELV $208
line 297
;297:				PM_AddEvent( EV_STEP_16 );
CNSTI4 9
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 298
;298:			}
LABELV $209
LABELV $207
LABELV $205
line 299
;299:		}
LABELV $202
line 300
;300:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $210
line 301
;301:			Com_Printf("%i:stepped\n", c_pmove);
ADDRGP4 $212
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 302
;302:		}
LABELV $210
line 303
;303:	}
line 304
;304:}
LABELV $166
endproc PM_StepSlideMove 160 28
import PM_AddEvent
import PM_AddTouchEnt
import PM_ClipVelocity
import c_pmove
import pm_flightfriction
import pm_waterfriction
import pm_friction
import pm_flyaccelerate
import pm_wateraccelerate
import pm_airaccelerate
import pm_accelerate
import pm_wadeScale
import pm_swimScale
import pm_duckScale
import pm_stopspeed
import pml
import pm
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
LABELV $212
byte 1 37
byte 1 105
byte 1 58
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $188
byte 1 37
byte 1 105
byte 1 58
byte 1 98
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 10
byte 1 0
