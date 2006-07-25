export CG_PositionEntityOnTag
code
proc CG_PositionEntityOnTag 84 24
file "../cg_ents.c"
line 17
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_ents.c -- present snapshot entities, happens every single frame
;4:
;5:#include "cg_local.h"
;6:
;7:
;8:/*
;9:======================
;10:CG_PositionEntityOnTag
;11:
;12:Modifies the entities position and axis by the given
;13:tag location
;14:======================
;15:*/
;16:void CG_PositionEntityOnTag( refEntity_t *entity, const refEntity_t *parent, 
;17:							qhandle_t parentModel, char *tagName ) {
line 22
;18:	int				i;
;19:	orientation_t	lerped;
;20:	
;21:	// lerp the tag
;22:	trap_R_LerpTag( &lerped, parentModel, parent->oldframe, parent->frame,
ADDRLP4 4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 52
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ARGI4
CNSTF4 1065353216
ADDRLP4 52
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_LerpTag
CALLI4
pop
line 26
;23:		1.0 - parent->backlerp, tagName );
;24:
;25:	// FIXME: allow origin offsets along tag?
;26:	VectorCopy( parent->origin, entity->origin );
ADDRLP4 56
CNSTI4 68
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 27
;27:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $73
line 28
;28:		VectorMA( entity->origin, lerped.origin[i], parent->axis[i], entity->origin );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 29
;29:	}
LABELV $74
line 27
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $73
line 32
;30:
;31:	// had to cast away the const to avoid compiler problems...
;32:	MatrixMultiply( lerped.axis, ((refEntity_t *)parent)->axis, entity->axis );
ADDRLP4 4+12
ARGP4
ADDRLP4 60
CNSTI4 28
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ARGP4
ADDRGP4 MatrixMultiply
CALLV
pop
line 33
;33:	entity->backlerp = parent->backlerp;
ADDRLP4 64
CNSTI4 100
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
ASGNF4
line 34
;34:}
LABELV $72
endproc CG_PositionEntityOnTag 84 24
export CG_PositionRotatedEntityOnTag
proc CG_PositionRotatedEntityOnTag 120 24
line 46
;35:
;36:
;37:/*
;38:======================
;39:CG_PositionRotatedEntityOnTag
;40:
;41:Modifies the entities position and axis by the given
;42:tag location
;43:======================
;44:*/
;45:void CG_PositionRotatedEntityOnTag( refEntity_t *entity, const refEntity_t *parent, 
;46:							qhandle_t parentModel, char *tagName ) {
line 53
;47:	int				i;
;48:	orientation_t	lerped;
;49:	vec3_t			tempAxis[3];
;50:
;51://AxisClear( entity->axis );
;52:	// lerp the tag
;53:	trap_R_LerpTag( &lerped, parentModel, parent->oldframe, parent->frame,
ADDRLP4 4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 88
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ARGI4
CNSTF4 1065353216
ADDRLP4 88
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_LerpTag
CALLI4
pop
line 57
;54:		1.0 - parent->backlerp, tagName );
;55:
;56:	// FIXME: allow origin offsets along tag?
;57:	VectorCopy( parent->origin, entity->origin );
ADDRLP4 92
CNSTI4 68
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 58
;58:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $79
line 59
;59:		VectorMA( entity->origin, lerped.origin[i], parent->axis[i], entity->origin );
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 60
;60:	}
LABELV $80
line 58
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $79
line 63
;61:
;62:	// had to cast away the const to avoid compiler problems...
;63:	MatrixMultiply( entity->axis, lerped.axis, tempAxis );
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 52
ARGP4
ADDRGP4 MatrixMultiply
CALLV
pop
line 64
;64:	MatrixMultiply( tempAxis, ((refEntity_t *)parent)->axis, entity->axis );
ADDRLP4 52
ARGP4
ADDRLP4 96
CNSTI4 28
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 96
INDIRI4
ADDP
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
ARGP4
ADDRGP4 MatrixMultiply
CALLV
pop
line 65
;65:}
LABELV $78
endproc CG_PositionRotatedEntityOnTag 120 24
export CG_SetEntitySoundPosition
proc CG_SetEntitySoundPosition 24 8
line 84
;66:
;67:
;68:
;69:/*
;70:==========================================================================
;71:
;72:FUNCTIONS CALLED EACH FRAME
;73:
;74:==========================================================================
;75:*/
;76:
;77:/*
;78:======================
;79:CG_SetEntitySoundPosition
;80:
;81:Also called by event processing code
;82:======================
;83:*/
;84:void CG_SetEntitySoundPosition( centity_t *cent ) {
line 85
;85:	if ( cent->currentState.solid == SOLID_BMODEL ) {
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
NEI4 $85
line 89
;86:		vec3_t	origin;
;87:		float	*v;
;88:
;89:		v = cgs.inlineModelMidpoints[ cent->currentState.modelindex ];
ADDRLP4 12
CNSTI4 12
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+37900
ADDP4
ASGNP4
line 90
;90:		VectorAdd( cent->lerpOrigin, v, origin );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
CNSTI4 708
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 16
INDIRP4
CNSTI4 712
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 91
;91:		trap_S_UpdateEntityPosition( cent->currentState.number, origin );
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_S_UpdateEntityPosition
CALLV
pop
line 92
;92:	} else {
ADDRGP4 $86
JUMPV
LABELV $85
line 93
;93:		trap_S_UpdateEntityPosition( cent->currentState.number, cent->lerpOrigin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRGP4 trap_S_UpdateEntityPosition
CALLV
pop
line 94
;94:	}
LABELV $86
line 95
;95:}
LABELV $84
endproc CG_SetEntitySoundPosition 24 8
proc CG_EntityEffects 20 20
line 104
;96:
;97:/*
;98:==================
;99:CG_EntityEffects
;100:
;101:Add continuous entity effects, like local entity emission and lighting
;102:==================
;103:*/
;104:static void CG_EntityEffects( centity_t *cent ) {
line 107
;105:
;106:	// update sound origins
;107:	CG_SetEntitySoundPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetEntitySoundPosition
CALLV
pop
line 110
;108:
;109:	// add loop sound
;110:	if ( cent->currentState.loopSound ) {
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
CNSTI4 0
EQI4 $91
line 111
;111:		if (cent->currentState.eType != ET_SPEAKER) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 7
EQI4 $93
line 112
;112:			trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, 
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35848
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
line 114
;113:				cgs.gameSounds[ cent->currentState.loopSound ] );
;114:		} else {
ADDRGP4 $94
JUMPV
LABELV $93
line 115
;115:			trap_S_AddRealLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, 
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35848
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_AddRealLoopingSound
CALLV
pop
line 117
;116:				cgs.gameSounds[ cent->currentState.loopSound ] );
;117:		}
LABELV $94
line 118
;118:	}
LABELV $91
line 122
;119:
;120:
;121:	// constant light glow
;122:	if ( cent->currentState.constantLight ) {
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 0
EQI4 $97
line 126
;123:		int		cl;
;124:		int		i, r, g, b;
;125:
;126:		cl = cent->currentState.constantLight;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ASGNI4
line 127
;127:		r = cl & 255;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 128
;128:		g = ( cl >> 8 ) & 255;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
ASGNI4
line 129
;129:		b = ( cl >> 16 ) & 255;
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 16
RSHI4
CNSTI4 255
BANDI4
ASGNI4
line 130
;130:		i = ( ( cl >> 24 ) & 255 ) * 4;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 24
RSHI4
CNSTI4 255
BANDI4
CNSTI4 2
LSHI4
ASGNI4
line 131
;131:		trap_R_AddLightToScene( cent->lerpOrigin, i, r, g, b );
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 132
;132:	}
LABELV $97
line 134
;133:
;134:}
LABELV $90
endproc CG_EntityEffects 20 20
proc CG_General 144 12
line 142
;135:
;136:
;137:/*
;138:==================
;139:CG_General
;140:==================
;141:*/
;142:static void CG_General( centity_t *cent ) {
line 146
;143:	refEntity_t			ent;
;144:	entityState_t		*s1;
;145:
;146:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 149
;147:
;148:	// if set to invisible, skip
;149:	if (!s1->modelindex) {
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 0
NEI4 $100
line 150
;150:		return;
ADDRGP4 $99
JUMPV
LABELV $100
line 153
;151:	}
;152:
;153:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 157
;154:
;155:	// set frame
;156:
;157:	ent.frame = s1->frame;
ADDRLP4 0+80
ADDRLP4 140
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
line 158
;158:	ent.oldframe = ent.frame;
ADDRLP4 0+96
ADDRLP4 0+80
INDIRI4
ASGNI4
line 159
;159:	ent.backlerp = 0;
ADDRLP4 0+100
CNSTF4 0
ASGNF4
line 161
;160:
;161:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 162
;162:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 164
;163:
;164:	ent.hModel = cgs.gameModels[s1->modelindex];
ADDRLP4 0+8
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+34824
ADDP4
INDIRI4
ASGNI4
line 167
;165:
;166:	// player model
;167:	if (s1->number == cg.snap->ps.clientNum) {
ADDRLP4 140
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $110
line 168
;168:		ent.renderfx |= RF_THIRD_PERSON;	// only draw from mirrors
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 169
;169:	}
LABELV $110
line 172
;170:
;171:	// convert angles to axis
;172:	AnglesToAxis( cent->lerpAngles, ent.axis );
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 175
;173:
;174:	// add to refresh list
;175:	trap_R_AddRefEntityToScene (&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 176
;176:}
LABELV $99
endproc CG_General 144 12
proc CG_Speaker 16 16
line 185
;177:
;178:/*
;179:==================
;180:CG_Speaker
;181:
;182:Speaker entities can automatically play sounds
;183:==================
;184:*/
;185:static void CG_Speaker( centity_t *cent ) {
line 186
;186:	if ( ! cent->currentState.clientNum ) {	// FIXME: use something other than clientNum...
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 0
NEI4 $116
line 187
;187:		return;		// not auto triggering
ADDRGP4 $115
JUMPV
LABELV $116
line 190
;188:	}
;189:
;190:	if ( cg.time < cent->miscTime ) {
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
GEI4 $118
line 191
;191:		return;
ADDRGP4 $115
JUMPV
LABELV $118
line 194
;192:	}
;193:
;194:	trap_S_StartSound (NULL, cent->currentState.number, CHAN_ITEM, cgs.gameSounds[cent->currentState.eventParm] );
CNSTP4 0
ARGP4
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35848
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 198
;195:
;196:	//	ent->s.frame = ent->wait * 10;
;197:	//	ent->s.clientNum = ent->random * 10;
;198:	cent->miscTime = cg.time + cent->currentState.frame * 100 + cent->currentState.clientNum * 100 * crandom();
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 100
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 444
ADDP4
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
MULI4
ADDI4
CVIF4 4
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
MULI4
CVIF4 4
CNSTF4 1073741824
ADDRLP4 4
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
CVFI4 4
ASGNI4
line 199
;199:}
LABELV $115
endproc CG_Speaker 16 16
proc CG_Item 212 12
line 206
;200:
;201:/*
;202:==================
;203:CG_Item
;204:==================
;205:*/
;206:static void CG_Item( centity_t *cent ) {
line 215
;207:	refEntity_t		ent;
;208:	entityState_t	*es;
;209:	gitem_t			*item;
;210:	int				msec;
;211:	float			frac;
;212:	float			scale;
;213:	weaponInfo_t	*wi;
;214:
;215:	es = &cent->currentState;
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
line 216
;216:	if ( es->modelindex >= bg_numItems ) {
ADDRLP4 144
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $124
line 217
;217:		CG_Error( "Bad item index %i on entity", es->modelindex );
ADDRGP4 $126
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 218
;218:	}
LABELV $124
line 221
;219:
;220:	// if set to invisible, skip
;221:	if ( !es->modelindex || ( es->eFlags & EF_NODRAW ) ) {
ADDRLP4 168
CNSTI4 0
ASGNI4
ADDRLP4 144
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRLP4 168
INDIRI4
EQI4 $129
ADDRLP4 144
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 128
BANDI4
ADDRLP4 168
INDIRI4
EQI4 $127
LABELV $129
line 222
;222:		return;
ADDRGP4 $123
JUMPV
LABELV $127
line 225
;223:	}
;224:
;225:	item = &bg_itemlist[ es->modelindex ];
ADDRLP4 140
CNSTI4 52
ADDRLP4 144
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 226
;226:	if ( cg_simpleItems.integer && item->giType != IT_TEAM ) {
ADDRGP4 cg_simpleItems+12
INDIRI4
CNSTI4 0
EQI4 $130
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
EQI4 $130
line 227
;227:		memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 228
;228:		ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 229
;229:		VectorCopy( cent->lerpOrigin, ent.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 230
;230:		ent.radius = 14;
ADDRLP4 0+132
CNSTF4 1096810496
ASGNF4
line 231
;231:		ent.customShader = cg_items[es->modelindex].icon;
ADDRLP4 0+112
CNSTI4 24
ADDRLP4 144
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ASGNI4
line 232
;232:		ent.shaderRGBA[0] = 255;
ADDRLP4 0+116
CNSTU1 255
ASGNU1
line 233
;233:		ent.shaderRGBA[1] = 255;
ADDRLP4 0+116+1
CNSTU1 255
ASGNU1
line 234
;234:		ent.shaderRGBA[2] = 255;
ADDRLP4 0+116+2
CNSTU1 255
ASGNU1
line 235
;235:		ent.shaderRGBA[3] = 255;
ADDRLP4 0+116+3
CNSTU1 255
ASGNU1
line 236
;236:		trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 237
;237:		return;
ADDRGP4 $123
JUMPV
LABELV $130
line 241
;238:	}
;239:
;240:	// items bob up and down continuously
;241:	scale = 0.005 + cent->currentState.number * 0.00001;
ADDRLP4 160
CNSTF4 925353388
ADDRFP4 0
INDIRP4
INDIRI4
CVIF4 4
MULF4
CNSTF4 1000593162
ADDF4
ASGNF4
line 242
;242:	cent->lerpOrigin[2] += 4 + cos( ( cg.time + 1000 ) *  scale ) * 4;
ADDRGP4 cg+107604
INDIRI4
CNSTI4 1000
ADDI4
CVIF4 4
ADDRLP4 160
INDIRF4
MULF4
ARGF4
ADDRLP4 172
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 176
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ASGNP4
ADDRLP4 176
INDIRP4
ADDRLP4 176
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 172
INDIRF4
MULF4
CNSTF4 1082130432
ADDF4
ADDF4
ASGNF4
line 244
;243:
;244:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 247
;245:
;246:	// autorotate at one of two speeds
;247:	if ( item->giType == IT_HEALTH ) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 4
NEI4 $145
line 248
;248:		VectorCopy( cg.autoAnglesFast, cent->lerpAngles );
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRGP4 cg+109000
INDIRB
ASGNB 12
line 249
;249:		AxisCopy( cg.autoAxisFast, ent.axis );
ADDRGP4 cg+109012
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AxisCopy
CALLV
pop
line 250
;250:	} else {
ADDRGP4 $146
JUMPV
LABELV $145
line 251
;251:		VectorCopy( cg.autoAngles, cent->lerpAngles );
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRGP4 cg+108952
INDIRB
ASGNB 12
line 252
;252:		AxisCopy( cg.autoAxis, ent.axis );
ADDRGP4 cg+108964
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AxisCopy
CALLV
pop
line 253
;253:	}
LABELV $146
line 255
;254:
;255:	wi = NULL;
ADDRLP4 152
CNSTP4 0
ASGNP4
line 259
;256:	// the weapons have their origin where they attatch to player
;257:	// models, so we need to offset them or they will rotate
;258:	// eccentricly
;259:	if ( item->giType == IT_WEAPON ) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $153
line 260
;260:		wi = &cg_weapons[item->giTag];
ADDRLP4 152
CNSTI4 136
ADDRLP4 140
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons
ADDP4
ASGNP4
line 261
;261:		cent->lerpOrigin[0] -= 
ADDRLP4 180
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ASGNP4
ADDRLP4 180
INDIRP4
ADDRLP4 180
INDIRP4
INDIRF4
ADDRLP4 152
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0+28
INDIRF4
MULF4
ADDRLP4 152
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0+28+12
INDIRF4
MULF4
ADDF4
ADDRLP4 152
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0+28+24
INDIRF4
MULF4
ADDF4
SUBF4
ASGNF4
line 265
;262:			wi->weaponMidpoint[0] * ent.axis[0][0] +
;263:			wi->weaponMidpoint[1] * ent.axis[1][0] +
;264:			wi->weaponMidpoint[2] * ent.axis[2][0];
;265:		cent->lerpOrigin[1] -= 
ADDRLP4 188
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ASGNP4
ADDRLP4 188
INDIRP4
ADDRLP4 188
INDIRP4
INDIRF4
ADDRLP4 152
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0+28+4
INDIRF4
MULF4
ADDRLP4 152
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0+28+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 152
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0+28+24+4
INDIRF4
MULF4
ADDF4
SUBF4
ASGNF4
line 269
;266:			wi->weaponMidpoint[0] * ent.axis[0][1] +
;267:			wi->weaponMidpoint[1] * ent.axis[1][1] +
;268:			wi->weaponMidpoint[2] * ent.axis[2][1];
;269:		cent->lerpOrigin[2] -= 
ADDRLP4 196
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ASGNP4
ADDRLP4 196
INDIRP4
ADDRLP4 196
INDIRP4
INDIRF4
ADDRLP4 152
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0+28+8
INDIRF4
MULF4
ADDRLP4 152
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0+28+12+8
INDIRF4
MULF4
ADDF4
ADDRLP4 152
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0+28+24+8
INDIRF4
MULF4
ADDF4
SUBF4
ASGNF4
line 274
;270:			wi->weaponMidpoint[0] * ent.axis[0][2] +
;271:			wi->weaponMidpoint[1] * ent.axis[1][2] +
;272:			wi->weaponMidpoint[2] * ent.axis[2][2];
;273:
;274:		cent->lerpOrigin[2] += 8;	// an extra height boost
ADDRLP4 204
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ASGNP4
ADDRLP4 204
INDIRP4
ADDRLP4 204
INDIRP4
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 275
;275:	}
LABELV $153
line 277
;276:
;277:	ent.hModel = cg_items[es->modelindex].models[0];
ADDRLP4 0+8
CNSTI4 24
ADDRLP4 144
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_items+4
ADDP4
INDIRI4
ASGNI4
line 279
;278:
;279:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 280
;280:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 282
;281:
;282:	ent.nonNormalizedAxes = qfalse;
ADDRLP4 0+64
CNSTI4 0
ASGNI4
line 285
;283:
;284:	// if just respawned, slowly scale up
;285:	msec = cg.time - cent->miscTime;
ADDRLP4 156
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
SUBI4
ASGNI4
line 286
;286:	if ( msec >= 0 && msec < ITEM_SCALEUP_TIME ) {
ADDRLP4 156
INDIRI4
CNSTI4 0
LTI4 $182
ADDRLP4 156
INDIRI4
CNSTI4 1000
GEI4 $182
line 287
;287:		frac = (float)msec / ITEM_SCALEUP_TIME;
ADDRLP4 148
ADDRLP4 156
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ASGNF4
line 288
;288:		VectorScale( ent.axis[0], frac, ent.axis[0] );
ADDRLP4 0+28
ADDRLP4 0+28
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+4
ADDRLP4 0+28+4
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+8
ADDRLP4 0+28+8
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
line 289
;289:		VectorScale( ent.axis[1], frac, ent.axis[1] );
ADDRLP4 0+28+12
ADDRLP4 0+28+12
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+4
ADDRLP4 0+28+12+4
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+8
ADDRLP4 0+28+12+8
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
line 290
;290:		VectorScale( ent.axis[2], frac, ent.axis[2] );
ADDRLP4 0+28+24
ADDRLP4 0+28+24
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+4
ADDRLP4 0+28+24+4
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+8
ADDRLP4 0+28+24+8
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
line 291
;291:		ent.nonNormalizedAxes = qtrue;
ADDRLP4 0+64
CNSTI4 1
ASGNI4
line 292
;292:	} else {
ADDRGP4 $183
JUMPV
LABELV $182
line 293
;293:		frac = 1.0;
ADDRLP4 148
CNSTF4 1065353216
ASGNF4
line 294
;294:	}
LABELV $183
line 298
;295:
;296:	// items without glow textures need to keep a minimum light value
;297:	// so they are always visible
;298:	if ( ( item->giType == IT_WEAPON ) ||
ADDRLP4 184
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 1
EQI4 $229
ADDRLP4 184
INDIRI4
CNSTI4 3
NEI4 $227
LABELV $229
line 299
;299:		 ( item->giType == IT_ARMOR ) ) {
line 300
;300:		ent.renderfx |= RF_MINLIGHT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 301
;301:	}
LABELV $227
line 304
;302:
;303:	// increase the size of the weapons when they are presented as items
;304:	if ( item->giType == IT_WEAPON ) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $231
line 305
;305:		VectorScale( ent.axis[0], 1.5, ent.axis[0] );
ADDRLP4 0+28
CNSTF4 1069547520
ADDRLP4 0+28
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+4
CNSTF4 1069547520
ADDRLP4 0+28+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+8
CNSTF4 1069547520
ADDRLP4 0+28+8
INDIRF4
MULF4
ASGNF4
line 306
;306:		VectorScale( ent.axis[1], 1.5, ent.axis[1] );
ADDRLP4 0+28+12
CNSTF4 1069547520
ADDRLP4 0+28+12
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+4
CNSTF4 1069547520
ADDRLP4 0+28+12+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+8
CNSTF4 1069547520
ADDRLP4 0+28+12+8
INDIRF4
MULF4
ASGNF4
line 307
;307:		VectorScale( ent.axis[2], 1.5, ent.axis[2] );
ADDRLP4 0+28+24
CNSTF4 1069547520
ADDRLP4 0+28+24
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+4
CNSTF4 1069547520
ADDRLP4 0+28+24+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+8
CNSTF4 1069547520
ADDRLP4 0+28+24+8
INDIRF4
MULF4
ASGNF4
line 308
;308:		ent.nonNormalizedAxes = qtrue;
ADDRLP4 0+64
CNSTI4 1
ASGNI4
line 312
;309:#ifdef MISSIONPACK
;310:		trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, cgs.media.weaponHoverSound );
;311:#endif
;312:	}
LABELV $231
line 324
;313:
;314:#ifdef MISSIONPACK
;315:	if ( item->giType == IT_HOLDABLE && item->giTag == HI_KAMIKAZE ) {
;316:		VectorScale( ent.axis[0], 2, ent.axis[0] );
;317:		VectorScale( ent.axis[1], 2, ent.axis[1] );
;318:		VectorScale( ent.axis[2], 2, ent.axis[2] );
;319:		ent.nonNormalizedAxes = qtrue;
;320:	}
;321:#endif
;322:
;323:	// add to refresh list
;324:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 348
;325:
;326:#ifdef MISSIONPACK
;327:	if ( item->giType == IT_WEAPON && wi->barrelModel ) {
;328:		refEntity_t	barrel;
;329:
;330:		memset( &barrel, 0, sizeof( barrel ) );
;331:
;332:		barrel.hModel = wi->barrelModel;
;333:
;334:		VectorCopy( ent.lightingOrigin, barrel.lightingOrigin );
;335:		barrel.shadowPlane = ent.shadowPlane;
;336:		barrel.renderfx = ent.renderfx;
;337:
;338:		CG_PositionRotatedEntityOnTag( &barrel, &ent, wi->weaponModel, "tag_barrel" );
;339:
;340:		AxisCopy( ent.axis, barrel.axis );
;341:		barrel.nonNormalizedAxes = ent.nonNormalizedAxes;
;342:
;343:		trap_R_AddRefEntityToScene( &barrel );
;344:	}
;345:#endif
;346:
;347:	// accompanying rings / spheres for powerups
;348:	if ( !cg_simpleItems.integer ) 
ADDRGP4 cg_simpleItems+12
INDIRI4
CNSTI4 0
NEI4 $276
line 349
;349:	{
line 352
;350:		vec3_t spinAngles;
;351:
;352:		VectorClear( spinAngles );
ADDRLP4 200
CNSTF4 0
ASGNF4
ADDRLP4 188+8
ADDRLP4 200
INDIRF4
ASGNF4
ADDRLP4 188+4
ADDRLP4 200
INDIRF4
ASGNF4
ADDRLP4 188
ADDRLP4 200
INDIRF4
ASGNF4
line 354
;353:
;354:		if ( item->giType == IT_HEALTH || item->giType == IT_POWERUP )
ADDRLP4 204
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 4
EQI4 $283
ADDRLP4 204
INDIRI4
CNSTI4 5
NEI4 $281
LABELV $283
line 355
;355:		{
line 356
;356:			if ( ( ent.hModel = cg_items[es->modelindex].models[1] ) != 0 )
ADDRLP4 208
CNSTI4 24
ADDRLP4 144
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_items+4+4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 208
INDIRI4
ASGNI4
ADDRLP4 208
INDIRI4
CNSTI4 0
EQI4 $284
line 357
;357:			{
line 358
;358:				if ( item->giType == IT_POWERUP )
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $289
line 359
;359:				{
line 360
;360:					ent.origin[2] += 12;
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
CNSTF4 1094713344
ADDF4
ASGNF4
line 361
;361:					spinAngles[1] = ( cg.time & 1023 ) * 360 / -1024.0f;
ADDRLP4 188+4
CNSTI4 360
ADDRGP4 cg+107604
INDIRI4
CNSTI4 1023
BANDI4
MULI4
CVIF4 4
CNSTF4 3296722944
DIVF4
ASGNF4
line 362
;362:				}
LABELV $289
line 363
;363:				AnglesToAxis( spinAngles, ent.axis );
ADDRLP4 188
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 366
;364:				
;365:				// scale up if respawning
;366:				if ( frac != 1.0 ) {
ADDRLP4 148
INDIRF4
CNSTF4 1065353216
EQF4 $296
line 367
;367:					VectorScale( ent.axis[0], frac, ent.axis[0] );
ADDRLP4 0+28
ADDRLP4 0+28
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+4
ADDRLP4 0+28+4
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+8
ADDRLP4 0+28+8
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
line 368
;368:					VectorScale( ent.axis[1], frac, ent.axis[1] );
ADDRLP4 0+28+12
ADDRLP4 0+28+12
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+4
ADDRLP4 0+28+12+4
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+8
ADDRLP4 0+28+12+8
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
line 369
;369:					VectorScale( ent.axis[2], frac, ent.axis[2] );
ADDRLP4 0+28+24
ADDRLP4 0+28+24
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+4
ADDRLP4 0+28+24+4
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+8
ADDRLP4 0+28+24+8
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
line 370
;370:					ent.nonNormalizedAxes = qtrue;
ADDRLP4 0+64
CNSTI4 1
ASGNI4
line 371
;371:				}
LABELV $296
line 372
;372:				trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 373
;373:			}
LABELV $284
line 374
;374:		}
LABELV $281
line 375
;375:	}
LABELV $276
line 376
;376:}
LABELV $123
endproc CG_Item 212 12
proc CG_Missile 164 20
line 385
;377:
;378://============================================================================
;379:
;380:/*
;381:===============
;382:CG_Missile
;383:===============
;384:*/
;385:static void CG_Missile( centity_t *cent ) {
line 391
;386:	refEntity_t			ent;
;387:	entityState_t		*s1;
;388:	const weaponInfo_t		*weapon;
;389://	int	col;
;390:
;391:	s1 = &cent->currentState;
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
line 392
;392:	if ( s1->weapon > WP_NUM_WEAPONS ) {
ADDRLP4 144
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 11
LEI4 $342
line 393
;393:		s1->weapon = 0;
ADDRLP4 144
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 394
;394:	}
LABELV $342
line 395
;395:	weapon = &cg_weapons[s1->weapon];
ADDRLP4 140
CNSTI4 136
ADDRLP4 144
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons
ADDP4
ASGNP4
line 398
;396:
;397:	// calculate the axis
;398:	VectorCopy( s1->angles, cent->lerpAngles);
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRLP4 144
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 401
;399:
;400:	// add trails
;401:	if ( weapon->missileTrailFunc ) 
ADDRLP4 140
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $344
line 402
;402:	{
line 403
;403:		weapon->missileTrailFunc( cent, weapon );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CALLV
pop
line 404
;404:	}
LABELV $344
line 423
;405:/*
;406:	if ( cent->currentState.modelindex == TEAM_RED ) {
;407:		col = 1;
;408:	}
;409:	else if ( cent->currentState.modelindex == TEAM_BLUE ) {
;410:		col = 2;
;411:	}
;412:	else {
;413:		col = 0;
;414:	}
;415:
;416:	// add dynamic light
;417:	if ( weapon->missileDlight ) {
;418:		trap_R_AddLightToScene(cent->lerpOrigin, weapon->missileDlight, 
;419:			weapon->missileDlightColor[col][0], weapon->missileDlightColor[col][1], weapon->missileDlightColor[col][2] );
;420:	}
;421:*/
;422:	// add dynamic light
;423:	if ( weapon->missileDlight ) {
ADDRLP4 140
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
CNSTF4 0
EQF4 $346
line 424
;424:		trap_R_AddLightToScene(cent->lerpOrigin, weapon->missileDlight, 
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ARGF4
ADDRLP4 140
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ARGF4
ADDRLP4 140
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ARGF4
ADDRLP4 140
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 426
;425:			weapon->missileDlightColor[0], weapon->missileDlightColor[1], weapon->missileDlightColor[2] );
;426:	}
LABELV $346
line 429
;427:
;428:	// add missile sound
;429:	if ( weapon->missileSound ) {
ADDRLP4 140
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 0
EQI4 $348
line 432
;430:		vec3_t	velocity;
;431:
;432:		BG_EvaluateTrajectoryDelta( &cent->currentState.pos, cg.time, velocity );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRLP4 148
ARGP4
ADDRGP4 BG_EvaluateTrajectoryDelta
CALLV
pop
line 434
;433:
;434:		trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, velocity, weapon->missileSound );
ADDRLP4 160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 160
INDIRP4
INDIRI4
ARGI4
ADDRLP4 160
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRLP4 148
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
line 435
;435:	}
LABELV $348
line 438
;436:
;437:	// create the render entity
;438:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 439
;439:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 440
;440:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 454
;441:
;442:	/* Maybe?
;443:	if ( cent->currentState.weapon == WP_PLASMAGUN ) {
;444:		ent.reType = RT_SPRITE;
;445:		ent.radius = 16;
;446:		ent.rotation = 0;
;447:		ent.customShader = cgs.media.plasmaBallShader;
;448:		trap_R_AddRefEntityToScene( &ent );
;449:		return;
;450:	}
;451:	*/
;452:
;453:	// Shafe - Trep - Flame Thrower
;454:	if (cent->currentState.weapon == WP_LIGHTNING ) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 6
NEI4 $353
line 455
;455:		ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 456
;456:		ent.radius = 32;
ADDRLP4 0+132
CNSTF4 1107296256
ASGNF4
line 457
;457:		ent.rotation = 0;
ADDRLP4 0+136
CNSTF4 0
ASGNF4
line 458
;458:		ent.customShader = cgs.media.flameBallShader;
ADDRLP4 0+112
ADDRGP4 cgs+152852+484
INDIRI4
ASGNI4
line 459
;459:		trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 460
;460:		return;
ADDRGP4 $341
JUMPV
LABELV $353
line 464
;461:	} // End Shafe
;462:
;463:	// flicker between two skins
;464:	ent.skinNum = cg.clientFrame & 1;
ADDRLP4 0+104
ADDRGP4 cg
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 465
;465:	ent.hModel = weapon->missileModel;
ADDRLP4 0+8
ADDRLP4 140
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ASGNI4
line 466
;466:	ent.renderfx = weapon->missileRenderfx | RF_NOSHADOW;
ADDRLP4 0+4
ADDRLP4 140
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 477
;467:
;468:#ifdef MISSIONPACK
;469:	if ( cent->currentState.weapon == WP_PROX_LAUNCHER ) {
;470:		if (s1->generic1 == TEAM_BLUE) {
;471:			ent.hModel = cgs.media.blueProxMine;
;472:		}
;473:	}
;474:#endif
;475:
;476:	// convert direction of travel into axis
;477:	if ( VectorNormalize2( s1->pos.trDelta, ent.axis[0] ) == 0 ) {
ADDRLP4 144
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRLP4 148
ADDRGP4 VectorNormalize2
CALLF4
ASGNF4
ADDRLP4 148
INDIRF4
CNSTF4 0
NEF4 $363
line 478
;478:		ent.axis[0][2] = 1;
ADDRLP4 0+28+8
CNSTF4 1065353216
ASGNF4
line 479
;479:	}
LABELV $363
line 482
;480:
;481:	// spin as it moves
;482:	if ( s1->pos.trType != TR_STATIONARY ) {
ADDRLP4 144
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $368
line 483
;483:		RotateAroundDirection( ent.axis, cg.time / 4 );
ADDRLP4 0+28
ARGP4
ADDRGP4 cg+107604
INDIRI4
CNSTI4 4
DIVI4
CVIF4 4
ARGF4
ADDRGP4 RotateAroundDirection
CALLV
pop
line 484
;484:	} else {
ADDRGP4 $369
JUMPV
LABELV $368
line 491
;485:#ifdef MISSIONPACK
;486:		if ( s1->weapon == WP_PROX_LAUNCHER ) {
;487:			AnglesToAxis( cent->lerpAngles, ent.axis );
;488:		}
;489:		else
;490:#endif
;491:		{
line 492
;492:			RotateAroundDirection( ent.axis, s1->time );
ADDRLP4 0+28
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 RotateAroundDirection
CALLV
pop
line 493
;493:		}
line 494
;494:	}
LABELV $369
line 497
;495:
;496:	// add to refresh list, possibly with quad glow
;497:	CG_AddRefEntityWithPowerups( &ent, s1, TEAM_FREE );
ADDRLP4 0
ARGP4
ADDRLP4 144
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 CG_AddRefEntityWithPowerups
CALLV
pop
line 498
;498:}
LABELV $341
endproc CG_Missile 164 20
proc CG_Grapple 152 12
line 507
;499:
;500:/*
;501:===============
;502:CG_Grapple
;503:
;504:This is called when the grapple is sitting up against the wall
;505:===============
;506:*/
;507:static void CG_Grapple( centity_t *cent ) {
line 512
;508:	refEntity_t			ent;
;509:	entityState_t		*s1;
;510:	const weaponInfo_t		*weapon;
;511:
;512:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 513
;513:	if ( s1->weapon > WP_NUM_WEAPONS ) {
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 11
LEI4 $374
line 514
;514:		s1->weapon = 0;
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 515
;515:	}
LABELV $374
line 516
;516:	weapon = &cg_weapons[s1->weapon];
ADDRLP4 144
CNSTI4 136
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons
ADDP4
ASGNP4
line 519
;517:
;518:	// calculate the axis
;519:	VectorCopy( s1->angles, cent->lerpAngles);
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRLP4 140
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 529
;520:
;521:#if 0 // FIXME add grapple pull sound here..?
;522:	// add missile sound
;523:	if ( weapon->missileSound ) {
;524:		trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, weapon->missileSound );
;525:	}
;526:#endif
;527:
;528:	// Will draw cable if needed
;529:	CG_GrappleTrail ( cent, weapon );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRGP4 CG_GrappleTrail
CALLV
pop
line 532
;530:
;531:	// create the render entity
;532:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 533
;533:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 534
;534:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 537
;535:
;536:	// flicker between two skins
;537:	ent.skinNum = cg.clientFrame & 1;
ADDRLP4 0+104
ADDRGP4 cg
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 538
;538:	ent.hModel = weapon->missileModel;
ADDRLP4 0+8
ADDRLP4 144
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ASGNI4
line 539
;539:	ent.renderfx = weapon->missileRenderfx | RF_NOSHADOW;
ADDRLP4 0+4
ADDRLP4 144
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 542
;540:
;541:	// convert direction of travel into axis
;542:	if ( VectorNormalize2( s1->pos.trDelta, ent.axis[0] ) == 0 ) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRLP4 148
ADDRGP4 VectorNormalize2
CALLF4
ASGNF4
ADDRLP4 148
INDIRF4
CNSTF4 0
NEF4 $381
line 543
;543:		ent.axis[0][2] = 1;
ADDRLP4 0+28+8
CNSTF4 1065353216
ASGNF4
line 544
;544:	}
LABELV $381
line 546
;545:
;546:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 547
;547:}
LABELV $373
endproc CG_Grapple 152 12
proc CG_Mover 144 12
line 554
;548:
;549:/*
;550:===============
;551:CG_Mover
;552:===============
;553:*/
;554:static void CG_Mover( centity_t *cent ) {
line 558
;555:	refEntity_t			ent;
;556:	entityState_t		*s1;
;557:
;558:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 561
;559:
;560:	// create the render entity
;561:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 562
;562:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 563
;563:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 564
;564:	AnglesToAxis( cent->lerpAngles, ent.axis );
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 566
;565:
;566:	ent.renderfx = RF_NOSHADOW;
ADDRLP4 0+4
CNSTI4 64
ASGNI4
line 569
;567:
;568:	// flicker between two skins (FIXME?)
;569:	ent.skinNum = ( cg.time >> 6 ) & 1;
ADDRLP4 0+104
ADDRGP4 cg+107604
INDIRI4
CNSTI4 6
RSHI4
CNSTI4 1
BANDI4
ASGNI4
line 572
;570:
;571:	// get the model, either as a bmodel or a modelindex
;572:	if ( s1->solid == SOLID_BMODEL ) {
ADDRLP4 140
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
NEI4 $393
line 573
;573:		ent.hModel = cgs.inlineDrawModel[s1->modelindex];
ADDRLP4 0+8
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+36876
ADDP4
INDIRI4
ASGNI4
line 574
;574:	} else {
ADDRGP4 $394
JUMPV
LABELV $393
line 575
;575:		ent.hModel = cgs.gameModels[s1->modelindex];
ADDRLP4 0+8
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+34824
ADDP4
INDIRI4
ASGNI4
line 576
;576:	}
LABELV $394
line 579
;577:
;578:	// add to refresh list
;579:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 582
;580:
;581:	// add the secondary model
;582:	if ( s1->modelindex2 ) {
ADDRLP4 140
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 0
EQI4 $399
line 583
;583:		ent.skinNum = 0;
ADDRLP4 0+104
CNSTI4 0
ASGNI4
line 584
;584:		ent.hModel = cgs.gameModels[s1->modelindex2];
ADDRLP4 0+8
ADDRLP4 140
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+34824
ADDP4
INDIRI4
ASGNI4
line 585
;585:		trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 586
;586:	}
LABELV $399
line 588
;587:
;588:}
LABELV $386
endproc CG_Mover 144 12
export CG_Beam
proc CG_Beam 144 12
line 597
;589:
;590:/*
;591:===============
;592:CG_Beam
;593:
;594:Also called as an event
;595:===============
;596:*/
;597:void CG_Beam( centity_t *cent ) {
line 601
;598:	refEntity_t			ent;
;599:	entityState_t		*s1;
;600:
;601:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 604
;602:
;603:	// create the render entity
;604:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 605
;605:	VectorCopy( s1->pos.trBase, ent.origin );
ADDRLP4 0+68
ADDRLP4 140
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 606
;606:	VectorCopy( s1->origin2, ent.oldorigin );
ADDRLP4 0+84
ADDRLP4 140
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 607
;607:	AxisClear( ent.axis );
ADDRLP4 0+28
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 608
;608:	ent.reType = RT_BEAM;
ADDRLP4 0
CNSTI4 3
ASGNI4
line 610
;609:
;610:	ent.renderfx = RF_NOSHADOW;
ADDRLP4 0+4
CNSTI4 64
ASGNI4
line 613
;611:
;612:	// add to refresh list
;613:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 614
;614:}
LABELV $404
endproc CG_Beam 144 12
proc CG_Portal 144 12
line 622
;615:
;616:
;617:/*
;618:===============
;619:CG_Portal
;620:===============
;621:*/
;622:static void CG_Portal( centity_t *cent ) {
line 626
;623:	refEntity_t			ent;
;624:	entityState_t		*s1;
;625:
;626:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 629
;627:
;628:	// create the render entity
;629:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 630
;630:	VectorCopy( cent->lerpOrigin, ent.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 631
;631:	VectorCopy( s1->origin2, ent.oldorigin );
ADDRLP4 0+84
ADDRLP4 140
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 632
;632:	ByteToDir( s1->eventParm, ent.axis[0] );
ADDRLP4 140
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 0+28
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 633
;633:	PerpendicularVector( ent.axis[1], ent.axis[0] );
ADDRLP4 0+28+12
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 637
;634:
;635:	// negating this tends to get the directions like they want
;636:	// we really should have a camera roll value
;637:	VectorSubtract( vec3_origin, ent.axis[1], ent.axis[1] );
ADDRLP4 0+28+12
ADDRGP4 vec3_origin
INDIRF4
ADDRLP4 0+28+12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+28+12+4
ADDRGP4 vec3_origin+4
INDIRF4
ADDRLP4 0+28+12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+28+12+8
ADDRGP4 vec3_origin+8
INDIRF4
ADDRLP4 0+28+12+8
INDIRF4
SUBF4
ASGNF4
line 639
;638:
;639:	CrossProduct( ent.axis[0], ent.axis[1], ent.axis[2] );
ADDRLP4 0+28
ARGP4
ADDRLP4 0+28+12
ARGP4
ADDRLP4 0+28+24
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 640
;640:	ent.reType = RT_PORTALSURFACE;
ADDRLP4 0
CNSTI4 7
ASGNI4
line 641
;641:	ent.oldframe = s1->powerups;
ADDRLP4 0+96
ADDRLP4 140
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 642
;642:	ent.frame = s1->frame;		// rotation speed
ADDRLP4 0+80
ADDRLP4 140
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
line 643
;643:	ent.skinNum = s1->clientNum/256.0 * 360;	// roll offset
ADDRLP4 0+104
CNSTF4 1135869952
ADDRLP4 140
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1132462080
DIVF4
MULF4
CVFI4 4
ASGNI4
line 646
;644:
;645:	// add to refresh list
;646:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 647
;647:}
LABELV $409
endproc CG_Portal 144 12
export CG_AdjustPositionForMover
proc CG_AdjustPositionForMover 92 12
line 657
;648:
;649:
;650:/*
;651:=========================
;652:CG_AdjustPositionForMover
;653:
;654:Also called by client movement prediction code
;655:=========================
;656:*/
;657:void CG_AdjustPositionForMover( const vec3_t in, int moverNum, int fromTime, int toTime, vec3_t out ) {
line 662
;658:	centity_t	*cent;
;659:	vec3_t	oldOrigin, origin, deltaOrigin;
;660:	vec3_t	oldAngles, angles, deltaAngles;
;661:
;662:	if ( moverNum <= 0 || moverNum >= ENTITYNUM_MAX_NORMAL ) {
ADDRLP4 76
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
LEI4 $445
ADDRLP4 76
INDIRI4
CNSTI4 1022
LTI4 $443
LABELV $445
line 663
;663:		VectorCopy( in, out );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 664
;664:		return;
ADDRGP4 $442
JUMPV
LABELV $443
line 667
;665:	}
;666:
;667:	cent = &cg_entities[ moverNum ];
ADDRLP4 0
CNSTI4 732
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 668
;668:	if ( cent->currentState.eType != ET_MOVER ) {
ADDRLP4 80
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $446
line 669
;669:		VectorCopy( in, out );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 670
;670:		return;
ADDRGP4 $442
JUMPV
LABELV $446
line 673
;671:	}
;672:
;673:	BG_EvaluateTrajectory( &cent->currentState.pos, fromTime, oldOrigin );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 674
;674:	BG_EvaluateTrajectory( &cent->currentState.apos, fromTime, oldAngles );
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 40
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 676
;675:
;676:	BG_EvaluateTrajectory( &cent->currentState.pos, toTime, origin );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 28
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 677
;677:	BG_EvaluateTrajectory( &cent->currentState.apos, toTime, angles );
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 679
;678:
;679:	VectorSubtract( origin, oldOrigin, deltaOrigin );
ADDRLP4 4
ADDRLP4 28
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 28+4
INDIRF4
ADDRLP4 16+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 28+8
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
ASGNF4
line 680
;680:	VectorSubtract( angles, oldAngles, deltaAngles );
ADDRLP4 64
ADDRLP4 52
INDIRF4
ADDRLP4 40
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 52+4
INDIRF4
ADDRLP4 40+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 52+8
INDIRF4
ADDRLP4 40+8
INDIRF4
SUBF4
ASGNF4
line 682
;681:
;682:	VectorAdd( in, deltaOrigin, out );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84
CNSTI4 4
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 88
CNSTI4 8
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4+8
INDIRF4
ADDF4
ASGNF4
line 685
;683:
;684:	// FIXME: origin change when on a rotating object
;685:}
LABELV $442
endproc CG_AdjustPositionForMover 92 12
proc CG_InterpolateEntityPosition 44 12
line 693
;686:
;687:
;688:/*
;689:=============================
;690:CG_InterpolateEntityPosition
;691:=============================
;692:*/
;693:static void CG_InterpolateEntityPosition( centity_t *cent ) {
line 699
;694:	vec3_t		current, next;
;695:	float		f;
;696:
;697:	// it would be an internal error to find an entity that interpolates without
;698:	// a snapshot ahead of the current one
;699:	if ( cg.nextSnap == NULL ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $463
line 700
;700:		CG_Error( "CG_InterpoateEntityPosition: cg.nextSnap == NULL" );
ADDRGP4 $466
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 701
;701:	}
LABELV $463
line 703
;702:
;703:	f = cg.frameInterpolation;
ADDRLP4 24
ADDRGP4 cg+107588
INDIRF4
ASGNF4
line 708
;704:	//CG_Printf("interpolation fraction: %.2f\n", cg.frameInterpolation);
;705:
;706:	// this will linearize a sine or parabolic curve, but it is important
;707:	// to not extrapolate player positions if more recent data is available
;708:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.snap->serverTime, current );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 709
;709:	BG_EvaluateTrajectory( &cent->nextState.pos, cg.nextSnap->serverTime, next );
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
ARGP4
ADDRGP4 cg+40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 711
;710:
;711:	cent->lerpOrigin[0] = current[0] + f * ( next[0] - current[0] );
ADDRLP4 28
ADDRLP4 0
INDIRF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRLP4 28
INDIRF4
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 28
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 712
;712:	cent->lerpOrigin[1] = current[1] + f * ( next[1] - current[1] );
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 713
;713:	cent->lerpOrigin[2] = current[2] + f * ( next[2] - current[2] );
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRLP4 24
INDIRF4
ADDRLP4 12+8
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 715
;714:
;715:	BG_EvaluateTrajectory( &cent->currentState.apos, cg.snap->serverTime, current );
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 716
;716:	BG_EvaluateTrajectory( &cent->nextState.apos, cg.nextSnap->serverTime, next );
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
ARGP4
ADDRGP4 cg+40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 718
;717:
;718:	cent->lerpAngles[0] = LerpAngle( current[0], next[0], f );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 LerpAngle
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRLP4 32
INDIRF4
ASGNF4
line 719
;719:	cent->lerpAngles[1] = LerpAngle( current[1], next[1], f );
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 12+4
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 LerpAngle
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
ADDRLP4 36
INDIRF4
ASGNF4
line 720
;720:	cent->lerpAngles[2] = LerpAngle( current[2], next[2], f );
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRLP4 12+8
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 LerpAngle
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRLP4 40
INDIRF4
ASGNF4
line 721
;721:}
LABELV $462
endproc CG_InterpolateEntityPosition 44 12
proc CG_CalcEntityLerpPositions 120 28
line 729
;722:
;723:/*
;724:===============
;725:CG_CalcEntityLerpPositions
;726:
;727:===============
;728:*/
;729:static void CG_CalcEntityLerpPositions( centity_t *cent ) {
line 732
;730://unlagged - projectile nudge
;731:	// this will be set to how far forward projectiles will be extrapolated
;732:	int timeshift = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 750
;733://unlagged - projectile nudge
;734:
;735://unlagged - smooth clients #2
;736:	// this is done server-side now - cg_smoothClients is undefined
;737:	// players will always be TR_INTERPOLATE
;738:/*
;739:	// if this player does not want to see extrapolated players
;740:	if ( !cg_smoothClients.integer ) {
;741:		// make sure the clients use TR_INTERPOLATE
;742:		if ( cent->currentState.number < MAX_CLIENTS ) {
;743:			cent->currentState.pos.trType = TR_INTERPOLATE;
;744:			cent->nextState.pos.trType = TR_INTERPOLATE;
;745:		}
;746:	}
;747:*/
;748://unlagged - smooth clients #2
;749:
;750:	if ( cent->interpolate && cent->currentState.pos.trType == TR_INTERPOLATE ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
EQI4 $483
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
NEI4 $483
line 751
;751:		CG_InterpolateEntityPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_InterpolateEntityPosition
CALLV
pop
line 752
;752:		return;
ADDRGP4 $482
JUMPV
LABELV $483
line 757
;753:	}
;754:
;755:	// first see if we can interpolate between two snaps for
;756:	// linear extrapolated clients
;757:	if ( cent->interpolate && cent->currentState.pos.trType == TR_LINEAR_STOP &&
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
EQI4 $485
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 3
NEI4 $485
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 64
GEI4 $485
line 758
;758:			cent->currentState.number < MAX_CLIENTS) {
line 759
;759:		CG_InterpolateEntityPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_InterpolateEntityPosition
CALLV
pop
line 760
;760:		return;
ADDRGP4 $482
JUMPV
LABELV $485
line 767
;761:	}
;762:
;763://unlagged - timenudge extrapolation
;764:	// interpolating failed (probably no nextSnap), so extrapolate
;765:	// this can also happen if the teleport bit is flipped, but that
;766:	// won't be noticeable
;767:	if ( cent->currentState.number < MAX_CLIENTS &&
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 64
GEI4 $487
ADDRLP4 12
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
EQI4 $487
line 768
;768:			cent->currentState.clientNum != cg.predictedPlayerState.clientNum ) {
line 769
;769:		cent->currentState.pos.trType = TR_LINEAR_STOP;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 3
ASGNI4
line 770
;770:		cent->currentState.pos.trTime = cg.snap->serverTime;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 771
;771:		cent->currentState.pos.trDuration = 1000 / sv_fps.integer;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 1000
ADDRGP4 sv_fps+12
INDIRI4
DIVI4
ASGNI4
line 772
;772:	}
LABELV $487
line 777
;773://unlagged - timenudge extrapolation
;774:
;775://unlagged - projectile nudge
;776:	// if it's a missile but not a grappling hook
;777:	if ( cent->currentState.eType == ET_MISSILE && cent->currentState.weapon != WP_GRAPPLING_HOOK ) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $493
ADDRLP4 16
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 10
EQI4 $493
line 779
;778:		// if it's one of ours
;779:		if ( cent->currentState.otherEntityNum == cg.clientNum ) {
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ADDRGP4 cg+4
INDIRI4
NEI4 $495
line 783
;780:			// extrapolate one server frame's worth - this will correct for tiny
;781:			// visual inconsistencies introduced by backward-reconciling all players
;782:			// one server frame before running projectiles
;783:			timeshift = 1000 / sv_fps.integer;
ADDRLP4 0
CNSTI4 1000
ADDRGP4 sv_fps+12
INDIRI4
DIVI4
ASGNI4
line 784
;784:		}
ADDRGP4 $496
JUMPV
LABELV $495
line 786
;785:		// if it's not, and it's not a grenade launcher
;786:		else if ( cent->currentState.weapon != WP_GRENADE_LAUNCHER ) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 4
EQI4 $499
line 788
;787:			// extrapolate based on cg_projectileNudge
;788:			timeshift = cg_projectileNudge.integer + 1000 / sv_fps.integer;
ADDRLP4 0
ADDRGP4 cg_projectileNudge+12
INDIRI4
CNSTI4 1000
ADDRGP4 sv_fps+12
INDIRI4
DIVI4
ADDI4
ASGNI4
line 789
;789:		}
LABELV $499
LABELV $496
line 790
;790:	}
LABELV $493
line 795
;791:
;792:	// just use the current frame and evaluate as best we can
;793://	BG_EvaluateTrajectory( &cent->currentState.pos, cg.time, cent->lerpOrigin );
;794://	BG_EvaluateTrajectory( &cent->currentState.apos, cg.time, cent->lerpAngles );
;795:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.time + timeshift, cent->lerpOrigin );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ARGI4
ADDRLP4 20
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 796
;796:	BG_EvaluateTrajectory( &cent->currentState.apos, cg.time + timeshift, cent->lerpAngles );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ARGI4
ADDRLP4 24
INDIRP4
CNSTI4 720
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 799
;797:
;798:	// if there's a time shift
;799:	if ( timeshift != 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $505
line 803
;800:		trace_t tr;
;801:		vec3_t lastOrigin;
;802:
;803:		BG_EvaluateTrajectory( &cent->currentState.pos, cg.time, lastOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRLP4 28
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 805
;804:
;805:		CG_Trace( &tr, lastOrigin, vec3_origin, vec3_origin, cent->lerpOrigin, cent->currentState.number, MASK_SHOT );
ADDRLP4 40
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 96
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRLP4 100
INDIRP4
INDIRI4
ARGI4
CNSTI4 100664321
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 808
;806:
;807:		// don't let the projectile go through the floor
;808:		if ( tr.fraction < 1.0f ) {
ADDRLP4 40+8
INDIRF4
CNSTF4 1065353216
GEF4 $508
line 809
;809:			cent->lerpOrigin[0] = lastOrigin[0] + tr.fraction * ( cent->lerpOrigin[0] - lastOrigin[0] );
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ASGNP4
ADDRLP4 108
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 104
INDIRP4
ADDRLP4 108
INDIRF4
ADDRLP4 40+8
INDIRF4
ADDRLP4 104
INDIRP4
INDIRF4
ADDRLP4 108
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 810
;810:			cent->lerpOrigin[1] = lastOrigin[1] + tr.fraction * ( cent->lerpOrigin[1] - lastOrigin[1] );
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 28+4
INDIRF4
ADDRLP4 40+8
INDIRF4
ADDRLP4 112
INDIRP4
INDIRF4
ADDRLP4 28+4
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 811
;811:			cent->lerpOrigin[2] = lastOrigin[2] + tr.fraction * ( cent->lerpOrigin[2] - lastOrigin[2] );
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 28+8
INDIRF4
ADDRLP4 40+8
INDIRF4
ADDRLP4 116
INDIRP4
INDIRF4
ADDRLP4 28+8
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 812
;812:		}
LABELV $508
line 813
;813:	}
LABELV $505
line 819
;814://unlagged - projectile nudge
;815:
;816:
;817:	// adjust for riding a mover if it wasn't rolled into the predicted
;818:	// player state
;819:	if ( cent != &cg.predictedPlayerEntity ) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 cg+108104
CVPU4 4
EQU4 $518
line 820
;820:		CG_AdjustPositionForMover( cent->lerpOrigin, cent->currentState.groundEntityNum, 
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
CNSTI4 708
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 CG_AdjustPositionForMover
CALLV
pop
line 822
;821:		cg.snap->serverTime, cg.time, cent->lerpOrigin );
;822:	}
LABELV $518
line 823
;823:}
LABELV $482
endproc CG_CalcEntityLerpPositions 120 28
proc CG_TeamBase 140 12
line 830
;824:
;825:/*
;826:===============
;827:CG_TeamBase
;828:===============
;829:*/
;830:static void CG_TeamBase( centity_t *cent ) {
line 839
;831:	refEntity_t model;
;832:#ifdef MISSIONPACK
;833:	vec3_t angles;
;834:	int t, h;
;835:	float c;
;836:
;837:	if ( cgs.gametype == GT_CTF || cgs.gametype == GT_1FCTF ) {
;838:#else
;839:	if ( cgs.gametype == GT_CTF) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
NEI4 $524
line 842
;840:#endif
;841:		// show the flag base
;842:		memset(&model, 0, sizeof(model));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 843
;843:		model.reType = RT_MODEL;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 844
;844:		VectorCopy( cent->lerpOrigin, model.lightingOrigin );
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 845
;845:		VectorCopy( cent->lerpOrigin, model.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 846
;846:		AnglesToAxis( cent->currentState.angles, model.axis );
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 847
;847:		if ( cent->currentState.modelindex == TEAM_RED ) {
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 1
NEI4 $530
line 848
;848:			model.hModel = cgs.media.redFlagBaseModel;
ADDRLP4 0+8
ADDRGP4 cgs+152852+108
INDIRI4
ASGNI4
line 849
;849:		}
ADDRGP4 $531
JUMPV
LABELV $530
line 850
;850:		else if ( cent->currentState.modelindex == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 2
NEI4 $535
line 851
;851:			model.hModel = cgs.media.blueFlagBaseModel;
ADDRLP4 0+8
ADDRGP4 cgs+152852+112
INDIRI4
ASGNI4
line 852
;852:		}
ADDRGP4 $536
JUMPV
LABELV $535
line 853
;853:		else {
line 854
;854:			model.hModel = cgs.media.neutralFlagBaseModel;
ADDRLP4 0+8
ADDRGP4 cgs+152852+116
INDIRI4
ASGNI4
line 855
;855:		}
LABELV $536
LABELV $531
line 856
;856:		trap_R_AddRefEntityToScene( &model );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 857
;857:	}
LABELV $524
line 976
;858:#ifdef MISSIONPACK
;859:	else if ( cgs.gametype == GT_OBELISK ) {
;860:		// show the obelisk
;861:		memset(&model, 0, sizeof(model));
;862:		model.reType = RT_MODEL;
;863:		VectorCopy( cent->lerpOrigin, model.lightingOrigin );
;864:		VectorCopy( cent->lerpOrigin, model.origin );
;865:		AnglesToAxis( cent->currentState.angles, model.axis );
;866:
;867:		model.hModel = cgs.media.overloadBaseModel;
;868:		trap_R_AddRefEntityToScene( &model );
;869:		// if hit
;870:		if ( cent->currentState.frame == 1) {
;871:			// show hit model
;872:			// modelindex2 is the health value of the obelisk
;873:			c = cent->currentState.modelindex2;
;874:			model.shaderRGBA[0] = 0xff;
;875:			model.shaderRGBA[1] = c;
;876:			model.shaderRGBA[2] = c;
;877:			model.shaderRGBA[3] = 0xff;
;878:			//
;879:			model.hModel = cgs.media.overloadEnergyModel;
;880:			trap_R_AddRefEntityToScene( &model );
;881:		}
;882:		// if respawning
;883:		if ( cent->currentState.frame == 2) {
;884:			if ( !cent->miscTime ) {
;885:				cent->miscTime = cg.time;
;886:			}
;887:			t = cg.time - cent->miscTime;
;888:			h = (cg_obeliskRespawnDelay.integer - 5) * 1000;
;889:			//
;890:			if (t > h) {
;891:				c = (float) (t - h) / h;
;892:				if (c > 1)
;893:					c = 1;
;894:			}
;895:			else {
;896:				c = 0;
;897:			}
;898:			// show the lights
;899:			AnglesToAxis( cent->currentState.angles, model.axis );
;900:			//
;901:			model.shaderRGBA[0] = c * 0xff;
;902:			model.shaderRGBA[1] = c * 0xff;
;903:			model.shaderRGBA[2] = c * 0xff;
;904:			model.shaderRGBA[3] = c * 0xff;
;905:
;906:			model.hModel = cgs.media.overloadLightsModel;
;907:			trap_R_AddRefEntityToScene( &model );
;908:			// show the target
;909:			if (t > h) {
;910:				if ( !cent->muzzleFlashTime ) {
;911:					trap_S_StartSound (cent->lerpOrigin, ENTITYNUM_NONE, CHAN_BODY,  cgs.media.obeliskRespawnSound);
;912:					cent->muzzleFlashTime = 1;
;913:				}
;914:				VectorCopy(cent->currentState.angles, angles);
;915:				angles[YAW] += (float) 16 * acos(1-c) * 180 / M_PI;
;916:				AnglesToAxis( angles, model.axis );
;917:
;918:				VectorScale( model.axis[0], c, model.axis[0]);
;919:				VectorScale( model.axis[1], c, model.axis[1]);
;920:				VectorScale( model.axis[2], c, model.axis[2]);
;921:
;922:				model.shaderRGBA[0] = 0xff;
;923:				model.shaderRGBA[1] = 0xff;
;924:				model.shaderRGBA[2] = 0xff;
;925:				model.shaderRGBA[3] = 0xff;
;926:				//
;927:				model.origin[2] += 56;
;928:				model.hModel = cgs.media.overloadTargetModel;
;929:				trap_R_AddRefEntityToScene( &model );
;930:			}
;931:			else {
;932:				//FIXME: show animated smoke
;933:			}
;934:		}
;935:		else {
;936:			cent->miscTime = 0;
;937:			cent->muzzleFlashTime = 0;
;938:			// modelindex2 is the health value of the obelisk
;939:			c = cent->currentState.modelindex2;
;940:			model.shaderRGBA[0] = 0xff;
;941:			model.shaderRGBA[1] = c;
;942:			model.shaderRGBA[2] = c;
;943:			model.shaderRGBA[3] = 0xff;
;944:			// show the lights
;945:			model.hModel = cgs.media.overloadLightsModel;
;946:			trap_R_AddRefEntityToScene( &model );
;947:			// show the target
;948:			model.origin[2] += 56;
;949:			model.hModel = cgs.media.overloadTargetModel;
;950:			trap_R_AddRefEntityToScene( &model );
;951:		}
;952:	}
;953:	else if ( cgs.gametype == GT_HARVESTER ) {
;954:		// show harvester model
;955:		memset(&model, 0, sizeof(model));
;956:		model.reType = RT_MODEL;
;957:		VectorCopy( cent->lerpOrigin, model.lightingOrigin );
;958:		VectorCopy( cent->lerpOrigin, model.origin );
;959:		AnglesToAxis( cent->currentState.angles, model.axis );
;960:
;961:		if ( cent->currentState.modelindex == TEAM_RED ) {
;962:			model.hModel = cgs.media.harvesterModel;
;963:			model.customSkin = cgs.media.harvesterRedSkin;
;964:		}
;965:		else if ( cent->currentState.modelindex == TEAM_BLUE ) {
;966:			model.hModel = cgs.media.harvesterModel;
;967:			model.customSkin = cgs.media.harvesterBlueSkin;
;968:		}
;969:		else {
;970:			model.hModel = cgs.media.harvesterNeutralModel;
;971:			model.customSkin = 0;
;972:		}
;973:		trap_R_AddRefEntityToScene( &model );
;974:	}
;975:#endif
;976:}
LABELV $523
endproc CG_TeamBase 140 12
proc CG_AddCEntity 8 8
line 984
;977:
;978:/*
;979:===============
;980:CG_AddCEntity
;981:
;982:===============
;983:*/
;984:static void CG_AddCEntity( centity_t *cent ) {
line 986
;985:	// event-only entities will have been dealt with already
;986:	if ( cent->currentState.eType >= ET_EVENTS ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
LTI4 $544
line 987
;987:		return;
ADDRGP4 $543
JUMPV
LABELV $544
line 991
;988:	}
;989:
;990:	// calculate the current origin
;991:	CG_CalcEntityLerpPositions( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CalcEntityLerpPositions
CALLV
pop
line 994
;992:
;993:	// add automatic effects
;994:	CG_EntityEffects( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_EntityEffects
CALLV
pop
line 996
;995:
;996:	switch ( cent->currentState.eType ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $546
ADDRLP4 0
INDIRI4
CNSTI4 12
GTI4 $546
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $561
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $561
address $551
address $552
address $553
address $554
address $555
address $556
address $557
address $558
address $547
address $547
address $547
address $559
address $560
code
LABELV $546
line 998
;997:	default:
;998:		CG_Error( "Bad entity type: %i\n", cent->currentState.eType );
ADDRGP4 $549
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 999
;999:		break;
ADDRGP4 $547
JUMPV
line 1003
;1000:	case ET_INVISIBLE:
;1001:	case ET_PUSH_TRIGGER:
;1002:	case ET_TELEPORT_TRIGGER:
;1003:		break;
LABELV $551
line 1005
;1004:	case ET_GENERAL:
;1005:		CG_General( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_General
CALLV
pop
line 1006
;1006:		break;
ADDRGP4 $547
JUMPV
LABELV $552
line 1008
;1007:	case ET_PLAYER:
;1008:		CG_Player( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Player
CALLV
pop
line 1009
;1009:		break;
ADDRGP4 $547
JUMPV
LABELV $553
line 1011
;1010:	case ET_ITEM:
;1011:		CG_Item( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Item
CALLV
pop
line 1012
;1012:		break;
ADDRGP4 $547
JUMPV
LABELV $554
line 1014
;1013:	case ET_MISSILE:
;1014:		CG_Missile( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Missile
CALLV
pop
line 1015
;1015:		break;
ADDRGP4 $547
JUMPV
LABELV $555
line 1017
;1016:	case ET_MOVER:
;1017:		CG_Mover( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Mover
CALLV
pop
line 1018
;1018:		break;
ADDRGP4 $547
JUMPV
LABELV $556
line 1020
;1019:	case ET_BEAM:
;1020:		CG_Beam( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Beam
CALLV
pop
line 1021
;1021:		break;
ADDRGP4 $547
JUMPV
LABELV $557
line 1023
;1022:	case ET_PORTAL:
;1023:		CG_Portal( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Portal
CALLV
pop
line 1024
;1024:		break;
ADDRGP4 $547
JUMPV
LABELV $558
line 1026
;1025:	case ET_SPEAKER:
;1026:		CG_Speaker( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Speaker
CALLV
pop
line 1027
;1027:		break;
ADDRGP4 $547
JUMPV
LABELV $559
line 1029
;1028:	case ET_GRAPPLE:
;1029:		CG_Grapple( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Grapple
CALLV
pop
line 1030
;1030:		break;
ADDRGP4 $547
JUMPV
LABELV $560
line 1032
;1031:	case ET_TEAM:
;1032:		CG_TeamBase( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_TeamBase
CALLV
pop
line 1033
;1033:		break;
LABELV $547
line 1035
;1034:	}
;1035:}
LABELV $543
endproc CG_AddCEntity 8 8
export CG_AddPacketEntities
proc CG_AddPacketEntities 20 12
line 1043
;1036:
;1037:/*
;1038:===============
;1039:CG_AddPacketEntities
;1040:
;1041:===============
;1042:*/
;1043:void CG_AddPacketEntities( void ) {
line 1049
;1044:	int					num;
;1045:	centity_t			*cent;
;1046:	playerState_t		*ps;
;1047:
;1048:	// set cg.frameInterpolation
;1049:	if ( cg.nextSnap ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $563
line 1052
;1050:		int		delta;
;1051:
;1052:		delta = (cg.nextSnap->serverTime - cg.snap->serverTime);
ADDRLP4 16
CNSTI4 8
ASGNI4
ADDRLP4 12
ADDRGP4 cg+40
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1053
;1053:		if ( delta == 0 ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $568
line 1054
;1054:			cg.frameInterpolation = 0;
ADDRGP4 cg+107588
CNSTF4 0
ASGNF4
line 1055
;1055:		} else {
ADDRGP4 $564
JUMPV
LABELV $568
line 1056
;1056:			cg.frameInterpolation = (float)( cg.time - cg.snap->serverTime ) / delta;
ADDRGP4 cg+107588
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 12
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 1057
;1057:		}
line 1058
;1058:	} else {
ADDRGP4 $564
JUMPV
LABELV $563
line 1059
;1059:		cg.frameInterpolation = 0;	// actually, it should never be used, because 
ADDRGP4 cg+107588
CNSTF4 0
ASGNF4
line 1061
;1060:									// no entities should be marked as interpolating
;1061:	}
LABELV $564
line 1064
;1062:
;1063:	// the auto-rotating items will all have the same axis
;1064:	cg.autoAngles[0] = 0;
ADDRGP4 cg+108952
CNSTF4 0
ASGNF4
line 1065
;1065:	cg.autoAngles[1] = ( cg.time & 2047 ) * 360 / 2048.0;
ADDRGP4 cg+108952+4
CNSTI4 360
ADDRGP4 cg+107604
INDIRI4
CNSTI4 2047
BANDI4
MULI4
CVIF4 4
CNSTF4 1157627904
DIVF4
ASGNF4
line 1066
;1066:	cg.autoAngles[2] = 0;
ADDRGP4 cg+108952+8
CNSTF4 0
ASGNF4
line 1068
;1067:
;1068:	cg.autoAnglesFast[0] = 0;
ADDRGP4 cg+109000
CNSTF4 0
ASGNF4
line 1069
;1069:	cg.autoAnglesFast[1] = ( cg.time & 1023 ) * 360 / 1024.0f;
ADDRGP4 cg+109000+4
CNSTI4 360
ADDRGP4 cg+107604
INDIRI4
CNSTI4 1023
BANDI4
MULI4
CVIF4 4
CNSTF4 1149239296
DIVF4
ASGNF4
line 1070
;1070:	cg.autoAnglesFast[2] = 0;
ADDRGP4 cg+109000+8
CNSTF4 0
ASGNF4
line 1072
;1071:
;1072:	AnglesToAxis( cg.autoAngles, cg.autoAxis );
ADDRGP4 cg+108952
ARGP4
ADDRGP4 cg+108964
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1073
;1073:	AnglesToAxis( cg.autoAnglesFast, cg.autoAxisFast );
ADDRGP4 cg+109000
ARGP4
ADDRGP4 cg+109012
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1076
;1074:
;1075:	// generate and add the entity from the playerstate
;1076:	ps = &cg.predictedPlayerState;
ADDRLP4 8
ADDRGP4 cg+107636
ASGNP4
line 1077
;1077:	BG_PlayerStateToEntityState( ps, &cg.predictedPlayerEntity.currentState, qfalse );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 cg+108104
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 1078
;1078:	CG_AddCEntity( &cg.predictedPlayerEntity );
ADDRGP4 cg+108104
ARGP4
ADDRGP4 CG_AddCEntity
CALLV
pop
line 1081
;1079:
;1080:	// lerp the non-predicted value for lightning gun origins
;1081:	CG_CalcEntityLerpPositions( &cg_entities[ cg.snap->ps.clientNum ] );
CNSTI4 732
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ARGP4
ADDRGP4 CG_CalcEntityLerpPositions
CALLV
pop
line 1084
;1082:
;1083://unlagged - early transitioning
;1084:	if ( cg.nextSnap ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $595
line 1087
;1085:		// pre-add some of the entities sent over by the server
;1086:		// we have data for them and they don't need to interpolate
;1087:		for ( num = 0 ; num < cg.nextSnap->numEntities ; num++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $601
JUMPV
LABELV $598
line 1088
;1088:			cent = &cg_entities[ cg.nextSnap->entities[ num ].number ];
ADDRLP4 0
CNSTI4 732
CNSTI4 208
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cg+40
INDIRP4
CNSTI4 516
ADDP4
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 1089
;1089:			if ( cent->nextState.eType == ET_MISSILE || cent->nextState.eType == ET_GENERAL ) {
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 3
EQI4 $606
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $604
LABELV $606
line 1091
;1090:				// transition it immediately and add it
;1091:				CG_TransitionEntity( cent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_TransitionEntity
CALLV
pop
line 1092
;1092:				cent->interpolate = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 1
ASGNI4
line 1093
;1093:				CG_AddCEntity( cent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddCEntity
CALLV
pop
line 1094
;1094:			}
LABELV $604
line 1095
;1095:		}
LABELV $599
line 1087
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $601
ADDRLP4 4
INDIRI4
ADDRGP4 cg+40
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $598
line 1096
;1096:	}
LABELV $595
line 1100
;1097://unlagged - early transitioning
;1098:
;1099:	// add each entity sent over by the server
;1100:	for ( num = 0 ; num < cg.snap->numEntities ; num++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $610
JUMPV
LABELV $607
line 1101
;1101:		cent = &cg_entities[ cg.snap->entities[ num ].number ];
ADDRLP4 0
CNSTI4 732
CNSTI4 208
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 516
ADDP4
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 1103
;1102://unlagged - early transitioning
;1103:		if ( !cg.nextSnap || cent->nextState.eType != ET_MISSILE && cent->nextState.eType != ET_GENERAL ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $616
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 3
EQI4 $613
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $613
LABELV $616
line 1105
;1104://unlagged - early transitioning
;1105:			CG_AddCEntity( cent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddCEntity
CALLV
pop
line 1106
;1106:		}
LABELV $613
line 1107
;1107:	}
LABELV $608
line 1100
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $610
ADDRLP4 4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $607
line 1108
;1108:}
LABELV $562
endproc CG_AddPacketEntities 20 12
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
import CG_GibPlayer
import CG_ScorePlum
import CG_SpawnEffect
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
LABELV $549
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $466
byte 1 67
byte 1 71
byte 1 95
byte 1 73
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 112
byte 1 111
byte 1 97
byte 1 116
byte 1 101
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 80
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 99
byte 1 103
byte 1 46
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 32
byte 1 61
byte 1 61
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 0
align 1
LABELV $126
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 0
