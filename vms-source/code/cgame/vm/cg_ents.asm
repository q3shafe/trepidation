code
proc CG_TURRET 152 12
file "../cg_ents.c"
line 9
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_ents.c -- present snapshot entities, happens every single frame
;4:
;5:#include "cg_local.h"
;6:
;7:
;8:static void CG_TURRET(centity_t *cent)
;9:{
line 14
;10:	refEntity_t			ent;
;11:	entityState_t		*s1;
;12:	
;13:
;14:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 16
;15:
;16:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 18
;17:
;18:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 19
;19:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 22
;20:
;21:
;22:	ent.frame = s1->frame;
ADDRLP4 0+80
ADDRLP4 140
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
line 23
;23:	ent.oldframe = ent.frame;
ADDRLP4 0+96
ADDRLP4 0+80
INDIRI4
ASGNI4
line 24
;24:	ent.backlerp = 0;
ADDRLP4 0+100
CNSTF4 0
ASGNF4
line 26
;25:	// convert angles to axis
;26:	AnglesToAxis( cent->lerpAngles, ent.axis );
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
line 28
;27:	
;28:	ent.hModel=cgs.gameModels[s1->modelindex];
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
line 30
;29:	// add to refresh list
;30:	switch (s1->time2){
ADDRLP4 144
ADDRLP4 140
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 1
EQI4 $85
ADDRLP4 144
INDIRI4
CNSTI4 2
EQI4 $89
ADDRLP4 144
INDIRI4
CNSTI4 3
EQI4 $93
ADDRGP4 $82
JUMPV
LABELV $85
line 32
;31:	case 1:
;32:		trap_R_AddRefEntityToScene (&ent); // make the model show up
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 33
;33:		ent.customShader=cgs.media.battleSuitShader;
ADDRLP4 0+112
ADDRGP4 cgs+152852+460
INDIRI4
ASGNI4
line 34
;34:		trap_R_AddRefEntityToScene (&ent); // make the shader show up
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 35
;35:		break;	
ADDRGP4 $83
JUMPV
LABELV $89
line 37
;36:	case 2:
;37:		ent.customShader=cgs.media.invisShader;
ADDRLP4 0+112
ADDRGP4 cgs+152852+452
INDIRI4
ASGNI4
line 38
;38:		trap_R_AddRefEntityToScene (&ent); // make the shader show up. no model
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 39
;39:		break;
ADDRGP4 $83
JUMPV
LABELV $93
line 41
;40:	case 3:
;41:		trap_R_AddRefEntityToScene (&ent); // just add the model (uncloaked cloaking turret)
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 42
;42:		break;
ADDRGP4 $83
JUMPV
LABELV $82
line 44
;43:	default:
;44:		trap_R_AddRefEntityToScene (&ent); // if something else has happened
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 45
;45:	}
LABELV $83
line 46
;46:}
LABELV $72
endproc CG_TURRET 152 12
export CG_PositionEntityOnTag
proc CG_PositionEntityOnTag 84 24
line 57
;47:
;48:/*
;49:======================
;50:CG_PositionEntityOnTag
;51:
;52:Modifies the entities position and axis by the given
;53:tag location
;54:======================
;55:*/
;56:void CG_PositionEntityOnTag( refEntity_t *entity, const refEntity_t *parent, 
;57:							qhandle_t parentModel, char *tagName ) {
line 62
;58:	int				i;
;59:	orientation_t	lerped;
;60:	
;61:	// lerp the tag
;62:	trap_R_LerpTag( &lerped, parentModel, parent->oldframe, parent->frame,
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
line 66
;63:		1.0 - parent->backlerp, tagName );
;64:
;65:	// FIXME: allow origin offsets along tag?
;66:	VectorCopy( parent->origin, entity->origin );
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
line 67
;67:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $95
line 68
;68:		VectorMA( entity->origin, lerped.origin[i], parent->axis[i], entity->origin );
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
line 69
;69:	}
LABELV $96
line 67
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $95
line 72
;70:
;71:	// had to cast away the const to avoid compiler problems...
;72:	MatrixMultiply( lerped.axis, ((refEntity_t *)parent)->axis, entity->axis );
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
line 73
;73:	entity->backlerp = parent->backlerp;
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
line 74
;74:}
LABELV $94
endproc CG_PositionEntityOnTag 84 24
export CG_PositionRotatedEntityOnTag
proc CG_PositionRotatedEntityOnTag 120 24
line 86
;75:
;76:
;77:/*
;78:======================
;79:CG_PositionRotatedEntityOnTag
;80:
;81:Modifies the entities position and axis by the given
;82:tag location
;83:======================
;84:*/
;85:void CG_PositionRotatedEntityOnTag( refEntity_t *entity, const refEntity_t *parent, 
;86:							qhandle_t parentModel, char *tagName ) {
line 93
;87:	int				i;
;88:	orientation_t	lerped;
;89:	vec3_t			tempAxis[3];
;90:
;91://AxisClear( entity->axis );
;92:	// lerp the tag
;93:	trap_R_LerpTag( &lerped, parentModel, parent->oldframe, parent->frame,
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
line 97
;94:		1.0 - parent->backlerp, tagName );
;95:
;96:	// FIXME: allow origin offsets along tag?
;97:	VectorCopy( parent->origin, entity->origin );
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
line 98
;98:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $101
line 99
;99:		VectorMA( entity->origin, lerped.origin[i], parent->axis[i], entity->origin );
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
line 100
;100:	}
LABELV $102
line 98
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $101
line 103
;101:
;102:	// had to cast away the const to avoid compiler problems...
;103:	MatrixMultiply( entity->axis, lerped.axis, tempAxis );
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
line 104
;104:	MatrixMultiply( tempAxis, ((refEntity_t *)parent)->axis, entity->axis );
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
line 105
;105:}
LABELV $100
endproc CG_PositionRotatedEntityOnTag 120 24
export CG_SetEntitySoundPosition
proc CG_SetEntitySoundPosition 24 8
line 124
;106:
;107:
;108:
;109:/*
;110:==========================================================================
;111:
;112:FUNCTIONS CALLED EACH FRAME
;113:
;114:==========================================================================
;115:*/
;116:
;117:/*
;118:======================
;119:CG_SetEntitySoundPosition
;120:
;121:Also called by event processing code
;122:======================
;123:*/
;124:void CG_SetEntitySoundPosition( centity_t *cent ) {
line 125
;125:	if ( cent->currentState.solid == SOLID_BMODEL ) {
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
NEI4 $107
line 129
;126:		vec3_t	origin;
;127:		float	*v;
;128:
;129:		v = cgs.inlineModelMidpoints[ cent->currentState.modelindex ];
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
line 130
;130:		VectorAdd( cent->lerpOrigin, v, origin );
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
line 131
;131:		trap_S_UpdateEntityPosition( cent->currentState.number, origin );
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_S_UpdateEntityPosition
CALLV
pop
line 132
;132:	} else {
ADDRGP4 $108
JUMPV
LABELV $107
line 133
;133:		trap_S_UpdateEntityPosition( cent->currentState.number, cent->lerpOrigin );
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
line 134
;134:	}
LABELV $108
line 135
;135:}
LABELV $106
endproc CG_SetEntitySoundPosition 24 8
proc CG_EntityEffects 20 20
line 144
;136:
;137:/*
;138:==================
;139:CG_EntityEffects
;140:
;141:Add continuous entity effects, like local entity emission and lighting
;142:==================
;143:*/
;144:static void CG_EntityEffects( centity_t *cent ) {
line 147
;145:
;146:	// update sound origins
;147:	CG_SetEntitySoundPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetEntitySoundPosition
CALLV
pop
line 150
;148:
;149:	// add loop sound
;150:	if ( cent->currentState.loopSound ) {
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
CNSTI4 0
EQI4 $113
line 151
;151:		if (cent->currentState.eType != ET_SPEAKER) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 7
EQI4 $115
line 152
;152:			trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, 
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
line 154
;153:				cgs.gameSounds[ cent->currentState.loopSound ] );
;154:		} else {
ADDRGP4 $116
JUMPV
LABELV $115
line 155
;155:			trap_S_AddRealLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, 
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
line 157
;156:				cgs.gameSounds[ cent->currentState.loopSound ] );
;157:		}
LABELV $116
line 158
;158:	}
LABELV $113
line 162
;159:
;160:
;161:	// constant light glow
;162:	if ( cent->currentState.constantLight ) {
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 0
EQI4 $119
line 166
;163:		int		cl;
;164:		int		i, r, g, b;
;165:
;166:		cl = cent->currentState.constantLight;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ASGNI4
line 167
;167:		r = cl & 255;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 168
;168:		g = ( cl >> 8 ) & 255;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
ASGNI4
line 169
;169:		b = ( cl >> 16 ) & 255;
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 16
RSHI4
CNSTI4 255
BANDI4
ASGNI4
line 170
;170:		i = ( ( cl >> 24 ) & 255 ) * 4;
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
line 171
;171:		trap_R_AddLightToScene( cent->lerpOrigin, i, r, g, b );
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
line 172
;172:	}
LABELV $119
line 174
;173:
;174:}
LABELV $112
endproc CG_EntityEffects 20 20
proc CG_General 144 12
line 182
;175:
;176:
;177:/*
;178:==================
;179:CG_General
;180:==================
;181:*/
;182:static void CG_General( centity_t *cent ) {
line 186
;183:	refEntity_t			ent;
;184:	entityState_t		*s1;
;185:
;186:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 189
;187:
;188:	// if set to invisible, skip
;189:	if (!s1->modelindex) {
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 0
NEI4 $122
line 190
;190:		return;
ADDRGP4 $121
JUMPV
LABELV $122
line 193
;191:	}
;192:
;193:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 197
;194:
;195:	// set frame
;196:
;197:	ent.frame = s1->frame;
ADDRLP4 0+80
ADDRLP4 140
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
line 198
;198:	ent.oldframe = ent.frame;
ADDRLP4 0+96
ADDRLP4 0+80
INDIRI4
ASGNI4
line 199
;199:	ent.backlerp = 0;
ADDRLP4 0+100
CNSTF4 0
ASGNF4
line 201
;200:
;201:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 202
;202:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 204
;203:
;204:	ent.hModel = cgs.gameModels[s1->modelindex];
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
line 207
;205:
;206:	// player model
;207:	if (s1->number == cg.snap->ps.clientNum) {
ADDRLP4 140
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $132
line 208
;208:		ent.renderfx |= RF_THIRD_PERSON;	// only draw from mirrors
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 209
;209:	}
LABELV $132
line 212
;210:
;211:	// convert angles to axis
;212:	AnglesToAxis( cent->lerpAngles, ent.axis );
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
line 215
;213:
;214:	// add to refresh list
;215:	trap_R_AddRefEntityToScene (&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 216
;216:}
LABELV $121
endproc CG_General 144 12
proc CG_Speaker 16 16
line 225
;217:
;218:/*
;219:==================
;220:CG_Speaker
;221:
;222:Speaker entities can automatically play sounds
;223:==================
;224:*/
;225:static void CG_Speaker( centity_t *cent ) {
line 226
;226:	if ( ! cent->currentState.clientNum ) {	// FIXME: use something other than clientNum...
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 0
NEI4 $138
line 227
;227:		return;		// not auto triggering
ADDRGP4 $137
JUMPV
LABELV $138
line 230
;228:	}
;229:
;230:	if ( cg.time < cent->miscTime ) {
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
GEI4 $140
line 231
;231:		return;
ADDRGP4 $137
JUMPV
LABELV $140
line 234
;232:	}
;233:
;234:	trap_S_StartSound (NULL, cent->currentState.number, CHAN_ITEM, cgs.gameSounds[cent->currentState.eventParm] );
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
line 238
;235:
;236:	//	ent->s.frame = ent->wait * 10;
;237:	//	ent->s.clientNum = ent->random * 10;
;238:	cent->miscTime = cg.time + cent->currentState.frame * 100 + cent->currentState.clientNum * 100 * crandom();
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
line 239
;239:}
LABELV $137
endproc CG_Speaker 16 16
proc CG_Item 332 16
line 246
;240:
;241:/*
;242:==================
;243:CG_Item
;244:==================
;245:*/
;246:static void CG_Item( centity_t *cent ) {
line 255
;247:	refEntity_t		ent;
;248:	entityState_t	*es;
;249:	gitem_t			*item;
;250:	int				msec;
;251:	float			frac;
;252:	float			scale;
;253:	weaponInfo_t	*wi;
;254:
;255:	es = &cent->currentState;
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
line 256
;256:	if ( es->modelindex >= bg_numItems ) {
ADDRLP4 148
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $146
line 257
;257:		CG_Error( "Bad item index %i on entity", es->modelindex );
ADDRGP4 $148
ARGP4
ADDRLP4 148
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 258
;258:	}
LABELV $146
line 261
;259:
;260:	// if set to invisible, skip
;261:	if ( !es->modelindex || ( es->eFlags & EF_NODRAW ) ) {
ADDRLP4 168
CNSTI4 0
ASGNI4
ADDRLP4 148
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRLP4 168
INDIRI4
EQI4 $151
ADDRLP4 148
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 128
BANDI4
ADDRLP4 168
INDIRI4
EQI4 $149
LABELV $151
line 262
;262:		return;
ADDRGP4 $145
JUMPV
LABELV $149
line 265
;263:	}
;264:
;265:	item = &bg_itemlist[ es->modelindex ];
ADDRLP4 140
CNSTI4 52
ADDRLP4 148
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 266
;266:	if ( cg_simpleItems.integer && item->giType != IT_TEAM ) {
ADDRGP4 cg_simpleItems+12
INDIRI4
CNSTI4 0
EQI4 $152
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
EQI4 $152
line 267
;267:		memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 268
;268:		ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 269
;269:		VectorCopy( cent->lerpOrigin, ent.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 270
;270:		ent.radius = 14;
ADDRLP4 0+132
CNSTF4 1096810496
ASGNF4
line 271
;271:		ent.customShader = cg_items[es->modelindex].icon;
ADDRLP4 0+112
CNSTI4 24
ADDRLP4 148
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ASGNI4
line 272
;272:		ent.shaderRGBA[0] = 255;
ADDRLP4 0+116
CNSTU1 255
ASGNU1
line 273
;273:		ent.shaderRGBA[1] = 255;
ADDRLP4 0+116+1
CNSTU1 255
ASGNU1
line 274
;274:		ent.shaderRGBA[2] = 255;
ADDRLP4 0+116+2
CNSTU1 255
ASGNU1
line 275
;275:		ent.shaderRGBA[3] = 255;
ADDRLP4 0+116+3
CNSTU1 255
ASGNU1
line 276
;276:		trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 277
;277:		return;
ADDRGP4 $145
JUMPV
LABELV $152
line 281
;278:	}
;279:
;280:	// items bob up and down continuously
;281:	scale = 0.005 + cent->currentState.number * 0.00001;
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
line 282
;282:	cent->lerpOrigin[2] += 4 + cos( ( cg.time + 1000 ) *  scale ) * 4;
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
line 284
;283:
;284:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 287
;285:
;286:	// autorotate at one of two speeds
;287:	if ( item->giType == IT_HEALTH ) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 4
NEI4 $167
line 288
;288:		VectorCopy( cg.autoAnglesFast, cent->lerpAngles );
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRGP4 cg+109000
INDIRB
ASGNB 12
line 289
;289:		AxisCopy( cg.autoAxisFast, ent.axis );
ADDRGP4 cg+109012
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AxisCopy
CALLV
pop
line 290
;290:	} else {
ADDRGP4 $168
JUMPV
LABELV $167
line 291
;291:		VectorCopy( cg.autoAngles, cent->lerpAngles );
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRGP4 cg+108952
INDIRB
ASGNB 12
line 292
;292:		AxisCopy( cg.autoAxis, ent.axis );
ADDRGP4 cg+108964
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AxisCopy
CALLV
pop
line 293
;293:	}
LABELV $168
line 295
;294:
;295:	wi = NULL;
ADDRLP4 144
CNSTP4 0
ASGNP4
line 299
;296:	// the weapons have their origin where they attatch to player
;297:	// models, so we need to offset them or they will rotate
;298:	// eccentricly
;299:	if ( item->giType == IT_WEAPON ) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $175
line 300
;300:		wi = &cg_weapons[item->giTag];
ADDRLP4 144
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
line 301
;301:		cent->lerpOrigin[0] -= 
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
ADDRLP4 144
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0+28
INDIRF4
MULF4
ADDRLP4 144
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0+28+12
INDIRF4
MULF4
ADDF4
ADDRLP4 144
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
line 305
;302:			wi->weaponMidpoint[0] * ent.axis[0][0] +
;303:			wi->weaponMidpoint[1] * ent.axis[1][0] +
;304:			wi->weaponMidpoint[2] * ent.axis[2][0];
;305:		cent->lerpOrigin[1] -= 
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
ADDRLP4 144
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0+28+4
INDIRF4
MULF4
ADDRLP4 144
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0+28+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 144
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
line 309
;306:			wi->weaponMidpoint[0] * ent.axis[0][1] +
;307:			wi->weaponMidpoint[1] * ent.axis[1][1] +
;308:			wi->weaponMidpoint[2] * ent.axis[2][1];
;309:		cent->lerpOrigin[2] -= 
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
ADDRLP4 144
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0+28+8
INDIRF4
MULF4
ADDRLP4 144
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0+28+12+8
INDIRF4
MULF4
ADDF4
ADDRLP4 144
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
line 314
;310:			wi->weaponMidpoint[0] * ent.axis[0][2] +
;311:			wi->weaponMidpoint[1] * ent.axis[1][2] +
;312:			wi->weaponMidpoint[2] * ent.axis[2][2];
;313:
;314:		cent->lerpOrigin[2] += 8;	// an extra height boost
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
line 315
;315:	}
LABELV $175
line 317
;316:
;317:	ent.hModel = cg_items[es->modelindex].models[0];
ADDRLP4 0+8
CNSTI4 24
ADDRLP4 148
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_items+4
ADDP4
INDIRI4
ASGNI4
line 319
;318:
;319:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 320
;320:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 322
;321:
;322:	ent.nonNormalizedAxes = qfalse;
ADDRLP4 0+64
CNSTI4 0
ASGNI4
line 325
;323:
;324:	// if just respawned, slowly scale up
;325:	msec = cg.time - cent->miscTime;
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
line 326
;326:	if ( msec >= 0 && msec < ITEM_SCALEUP_TIME ) {
ADDRLP4 156
INDIRI4
CNSTI4 0
LTI4 $204
ADDRLP4 156
INDIRI4
CNSTI4 1000
GEI4 $204
line 327
;327:		frac = (float)msec / ITEM_SCALEUP_TIME;
ADDRLP4 152
ADDRLP4 156
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ASGNF4
line 328
;328:		VectorScale( ent.axis[0], frac, ent.axis[0] );
ADDRLP4 0+28
ADDRLP4 0+28
INDIRF4
ADDRLP4 152
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+4
ADDRLP4 0+28+4
INDIRF4
ADDRLP4 152
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+8
ADDRLP4 0+28+8
INDIRF4
ADDRLP4 152
INDIRF4
MULF4
ASGNF4
line 329
;329:		VectorScale( ent.axis[1], frac, ent.axis[1] );
ADDRLP4 0+28+12
ADDRLP4 0+28+12
INDIRF4
ADDRLP4 152
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+4
ADDRLP4 0+28+12+4
INDIRF4
ADDRLP4 152
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+8
ADDRLP4 0+28+12+8
INDIRF4
ADDRLP4 152
INDIRF4
MULF4
ASGNF4
line 330
;330:		VectorScale( ent.axis[2], frac, ent.axis[2] );
ADDRLP4 0+28+24
ADDRLP4 0+28+24
INDIRF4
ADDRLP4 152
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+4
ADDRLP4 0+28+24+4
INDIRF4
ADDRLP4 152
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+8
ADDRLP4 0+28+24+8
INDIRF4
ADDRLP4 152
INDIRF4
MULF4
ASGNF4
line 331
;331:		ent.nonNormalizedAxes = qtrue;
ADDRLP4 0+64
CNSTI4 1
ASGNI4
line 332
;332:	} else {
ADDRGP4 $205
JUMPV
LABELV $204
line 333
;333:		frac = 1.0;
ADDRLP4 152
CNSTF4 1065353216
ASGNF4
line 334
;334:	}
LABELV $205
line 338
;335:
;336:	// items without glow textures need to keep a minimum light value
;337:	// so they are always visible
;338:	if ( ( item->giType == IT_WEAPON ) ||
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
EQI4 $251
ADDRLP4 184
INDIRI4
CNSTI4 3
NEI4 $249
LABELV $251
line 339
;339:		 ( item->giType == IT_ARMOR ) ) {
line 340
;340:		ent.renderfx |= RF_MINLIGHT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 341
;341:	}
LABELV $249
line 344
;342:
;343:	// increase the size of the weapons when they are presented as items
;344:	if ( item->giType == IT_WEAPON ) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $253
line 345
;345:		VectorScale( ent.axis[0], 1.5, ent.axis[0] );
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
line 346
;346:		VectorScale( ent.axis[1], 1.5, ent.axis[1] );
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
line 347
;347:		VectorScale( ent.axis[2], 1.5, ent.axis[2] );
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
line 348
;348:		ent.nonNormalizedAxes = qtrue;
ADDRLP4 0+64
CNSTI4 1
ASGNI4
line 350
;349:#ifdef MISSIONPACK
;350:		trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, cgs.media.weaponHoverSound );
ADDRLP4 188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 188
INDIRP4
INDIRI4
ARGI4
ADDRLP4 188
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRGP4 cgs+152852+1068
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
line 352
;351:#endif
;352:	}
LABELV $253
line 355
;353:
;354:#ifdef MISSIONPACK
;355:	if ( item->giType == IT_HOLDABLE && item->giTag == HI_KAMIKAZE ) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 6
NEI4 $300
ADDRLP4 140
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 3
NEI4 $300
line 356
;356:		VectorScale( ent.axis[0], 2, ent.axis[0] );
ADDRLP4 0+28
CNSTF4 1073741824
ADDRLP4 0+28
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+4
CNSTF4 1073741824
ADDRLP4 0+28+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+8
CNSTF4 1073741824
ADDRLP4 0+28+8
INDIRF4
MULF4
ASGNF4
line 357
;357:		VectorScale( ent.axis[1], 2, ent.axis[1] );
ADDRLP4 0+28+12
CNSTF4 1073741824
ADDRLP4 0+28+12
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+4
CNSTF4 1073741824
ADDRLP4 0+28+12+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+8
CNSTF4 1073741824
ADDRLP4 0+28+12+8
INDIRF4
MULF4
ASGNF4
line 358
;358:		VectorScale( ent.axis[2], 2, ent.axis[2] );
ADDRLP4 0+28+24
CNSTF4 1073741824
ADDRLP4 0+28+24
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+4
CNSTF4 1073741824
ADDRLP4 0+28+24+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+8
CNSTF4 1073741824
ADDRLP4 0+28+24+8
INDIRF4
MULF4
ASGNF4
line 359
;359:		ent.nonNormalizedAxes = qtrue;
ADDRLP4 0+64
CNSTI4 1
ASGNI4
line 360
;360:	}
LABELV $300
line 364
;361:#endif
;362:
;363:	// add to refresh list
;364:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 367
;365:
;366:#ifdef MISSIONPACK
;367:	if ( item->giType == IT_WEAPON && wi->barrelModel ) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $345
ADDRLP4 144
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $345
line 370
;368:		refEntity_t	barrel;
;369:
;370:		memset( &barrel, 0, sizeof( barrel ) );
ADDRLP4 192
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 372
;371:
;372:		barrel.hModel = wi->barrelModel;
ADDRLP4 192+8
ADDRLP4 144
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 374
;373:
;374:		VectorCopy( ent.lightingOrigin, barrel.lightingOrigin );
ADDRLP4 192+12
ADDRLP4 0+12
INDIRB
ASGNB 12
line 375
;375:		barrel.shadowPlane = ent.shadowPlane;
ADDRLP4 192+24
ADDRLP4 0+24
INDIRF4
ASGNF4
line 376
;376:		barrel.renderfx = ent.renderfx;
ADDRLP4 192+4
ADDRLP4 0+4
INDIRI4
ASGNI4
line 378
;377:
;378:		CG_PositionRotatedEntityOnTag( &barrel, &ent, wi->weaponModel, "tag_barrel" );
ADDRLP4 192
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 $354
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 380
;379:
;380:		AxisCopy( ent.axis, barrel.axis );
ADDRLP4 0+28
ARGP4
ADDRLP4 192+28
ARGP4
ADDRGP4 AxisCopy
CALLV
pop
line 381
;381:		barrel.nonNormalizedAxes = ent.nonNormalizedAxes;
ADDRLP4 192+64
ADDRLP4 0+64
INDIRI4
ASGNI4
line 383
;382:
;383:		trap_R_AddRefEntityToScene( &barrel );
ADDRLP4 192
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 384
;384:	}
LABELV $345
line 388
;385:#endif
;386:
;387:	// accompanying rings / spheres for powerups
;388:	if ( !cg_simpleItems.integer ) 
ADDRGP4 cg_simpleItems+12
INDIRI4
CNSTI4 0
NEI4 $359
line 389
;389:	{
line 392
;390:		vec3_t spinAngles;
;391:
;392:		VectorClear( spinAngles );
ADDRLP4 204
CNSTF4 0
ASGNF4
ADDRLP4 192+8
ADDRLP4 204
INDIRF4
ASGNF4
ADDRLP4 192+4
ADDRLP4 204
INDIRF4
ASGNF4
ADDRLP4 192
ADDRLP4 204
INDIRF4
ASGNF4
line 394
;393:
;394:		if ( item->giType == IT_HEALTH || item->giType == IT_POWERUP )
ADDRLP4 208
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 208
INDIRI4
CNSTI4 4
EQI4 $366
ADDRLP4 208
INDIRI4
CNSTI4 5
NEI4 $364
LABELV $366
line 395
;395:		{
line 396
;396:			if ( ( ent.hModel = cg_items[es->modelindex].models[1] ) != 0 )
ADDRLP4 212
CNSTI4 24
ADDRLP4 148
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
ADDRLP4 212
INDIRI4
ASGNI4
ADDRLP4 212
INDIRI4
CNSTI4 0
EQI4 $367
line 397
;397:			{
line 398
;398:				if ( item->giType == IT_POWERUP )
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $372
line 399
;399:				{
line 400
;400:					ent.origin[2] += 12;
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
CNSTF4 1094713344
ADDF4
ASGNF4
line 401
;401:					spinAngles[1] = ( cg.time & 1023 ) * 360 / -1024.0f;
ADDRLP4 192+4
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
line 402
;402:				}
LABELV $372
line 403
;403:				AnglesToAxis( spinAngles, ent.axis );
ADDRLP4 192
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 406
;404:				
;405:				// scale up if respawning
;406:				if ( frac != 1.0 ) {
ADDRLP4 152
INDIRF4
CNSTF4 1065353216
EQF4 $379
line 407
;407:					VectorScale( ent.axis[0], frac, ent.axis[0] );
ADDRLP4 0+28
ADDRLP4 0+28
INDIRF4
ADDRLP4 152
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+4
ADDRLP4 0+28+4
INDIRF4
ADDRLP4 152
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+8
ADDRLP4 0+28+8
INDIRF4
ADDRLP4 152
INDIRF4
MULF4
ASGNF4
line 408
;408:					VectorScale( ent.axis[1], frac, ent.axis[1] );
ADDRLP4 0+28+12
ADDRLP4 0+28+12
INDIRF4
ADDRLP4 152
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+4
ADDRLP4 0+28+12+4
INDIRF4
ADDRLP4 152
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+8
ADDRLP4 0+28+12+8
INDIRF4
ADDRLP4 152
INDIRF4
MULF4
ASGNF4
line 409
;409:					VectorScale( ent.axis[2], frac, ent.axis[2] );
ADDRLP4 0+28+24
ADDRLP4 0+28+24
INDIRF4
ADDRLP4 152
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+4
ADDRLP4 0+28+24+4
INDIRF4
ADDRLP4 152
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+8
ADDRLP4 0+28+24+8
INDIRF4
ADDRLP4 152
INDIRF4
MULF4
ASGNF4
line 410
;410:					ent.nonNormalizedAxes = qtrue;
ADDRLP4 0+64
CNSTI4 1
ASGNI4
line 411
;411:				}
LABELV $379
line 412
;412:				trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 413
;413:			}
LABELV $367
line 414
;414:		}
LABELV $364
line 415
;415:	}
LABELV $359
line 416
;416:}
LABELV $145
endproc CG_Item 332 16
proc CG_Missile 164 20
line 425
;417:
;418://============================================================================
;419:
;420:/*
;421:===============
;422:CG_Missile
;423:===============
;424:*/
;425:static void CG_Missile( centity_t *cent ) {
line 431
;426:	refEntity_t			ent;
;427:	entityState_t		*s1;
;428:	const weaponInfo_t		*weapon;
;429://	int	col;
;430:
;431:	s1 = &cent->currentState;
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
line 432
;432:	if ( s1->weapon > WP_NUM_WEAPONS ) {
ADDRLP4 144
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 14
LEI4 $425
line 433
;433:		s1->weapon = 0;
ADDRLP4 144
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 434
;434:	}
LABELV $425
line 435
;435:	weapon = &cg_weapons[s1->weapon];
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
line 438
;436:
;437:	// calculate the axis
;438:	VectorCopy( s1->angles, cent->lerpAngles);
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
line 441
;439:
;440:	// add trails
;441:	if ( weapon->missileTrailFunc ) 
ADDRLP4 140
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $427
line 442
;442:	{
line 443
;443:		weapon->missileTrailFunc( cent, weapon );
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
line 444
;444:	}
LABELV $427
line 463
;445:/*
;446:	if ( cent->currentState.modelindex == TEAM_RED ) {
;447:		col = 1;
;448:	}
;449:	else if ( cent->currentState.modelindex == TEAM_BLUE ) {
;450:		col = 2;
;451:	}
;452:	else {
;453:		col = 0;
;454:	}
;455:
;456:	// add dynamic light
;457:	if ( weapon->missileDlight ) {
;458:		trap_R_AddLightToScene(cent->lerpOrigin, weapon->missileDlight, 
;459:			weapon->missileDlightColor[col][0], weapon->missileDlightColor[col][1], weapon->missileDlightColor[col][2] );
;460:	}
;461:*/
;462:	// add dynamic light
;463:	if ( weapon->missileDlight ) {
ADDRLP4 140
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
CNSTF4 0
EQF4 $429
line 464
;464:		trap_R_AddLightToScene(cent->lerpOrigin, weapon->missileDlight, 
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
line 466
;465:			weapon->missileDlightColor[0], weapon->missileDlightColor[1], weapon->missileDlightColor[2] );
;466:	}
LABELV $429
line 469
;467:
;468:	// add missile sound
;469:	if ( weapon->missileSound ) {
ADDRLP4 140
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 0
EQI4 $431
line 472
;470:		vec3_t	velocity;
;471:
;472:		BG_EvaluateTrajectoryDelta( &cent->currentState.pos, cg.time, velocity );
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
line 474
;473:
;474:		trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, velocity, weapon->missileSound );
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
line 475
;475:	}
LABELV $431
line 478
;476:
;477:	// create the render entity
;478:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 479
;479:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 480
;480:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 494
;481:
;482:	/* Maybe?
;483:	if ( cent->currentState.weapon == WP_PLASMAGUN ) {
;484:		ent.reType = RT_SPRITE;
;485:		ent.radius = 16;
;486:		ent.rotation = 0;
;487:		ent.customShader = cgs.media.plasmaBallShader;
;488:		trap_R_AddRefEntityToScene( &ent );
;489:		return;
;490:	}
;491:	*/
;492:
;493:	// Shafe - Trep - Flame Thrower
;494:	if (cent->currentState.weapon == WP_LIGHTNING ) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 6
NEI4 $436
line 495
;495:		ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 496
;496:		ent.radius = 32;
ADDRLP4 0+132
CNSTF4 1107296256
ASGNF4
line 497
;497:		ent.rotation = 0;
ADDRLP4 0+136
CNSTF4 0
ASGNF4
line 498
;498:		ent.customShader = cgs.media.flameBallShader;
ADDRLP4 0+112
ADDRGP4 cgs+152852+524
INDIRI4
ASGNI4
line 499
;499:		trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 500
;500:		return;
ADDRGP4 $424
JUMPV
LABELV $436
line 504
;501:	} // End Shafe
;502:
;503:	// flicker between two skins
;504:	ent.skinNum = cg.clientFrame & 1;
ADDRLP4 0+104
ADDRGP4 cg
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 505
;505:	ent.hModel = weapon->missileModel;
ADDRLP4 0+8
ADDRLP4 140
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ASGNI4
line 506
;506:	ent.renderfx = weapon->missileRenderfx | RF_NOSHADOW;
ADDRLP4 0+4
ADDRLP4 140
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 509
;507:
;508:#ifdef MISSIONPACK
;509:	if ( cent->currentState.weapon == WP_PROX_LAUNCHER ) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 12
NEI4 $446
line 510
;510:		if (s1->generic1 == TEAM_BLUE) {
ADDRLP4 144
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 2
NEI4 $448
line 511
;511:			ent.hModel = cgs.media.blueProxMine;
ADDRLP4 0+8
ADDRGP4 cgs+152852+344
INDIRI4
ASGNI4
line 512
;512:		}
LABELV $448
line 513
;513:	}
LABELV $446
line 517
;514:#endif
;515:
;516:	// convert direction of travel into axis
;517:	if ( VectorNormalize2( s1->pos.trDelta, ent.axis[0] ) == 0 ) {
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
NEF4 $453
line 518
;518:		ent.axis[0][2] = 1;
ADDRLP4 0+28+8
CNSTF4 1065353216
ASGNF4
line 519
;519:	}
LABELV $453
line 522
;520:
;521:	// spin as it moves
;522:	if ( s1->pos.trType != TR_STATIONARY ) {
ADDRLP4 144
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $458
line 523
;523:		RotateAroundDirection( ent.axis, cg.time / 4 );
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
line 524
;524:	} else {
ADDRGP4 $459
JUMPV
LABELV $458
line 526
;525:#ifdef MISSIONPACK
;526:		if ( s1->weapon == WP_PROX_LAUNCHER ) {
ADDRLP4 144
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 12
NEI4 $462
line 527
;527:			AnglesToAxis( cent->lerpAngles, ent.axis );
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
line 528
;528:		}
ADDRGP4 $463
JUMPV
LABELV $462
line 531
;529:		else
;530:#endif
;531:		{
line 532
;532:			RotateAroundDirection( ent.axis, s1->time );
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
line 533
;533:		}
LABELV $463
line 534
;534:	}
LABELV $459
line 537
;535:
;536:	// add to refresh list, possibly with quad glow
;537:	CG_AddRefEntityWithPowerups( &ent, s1, TEAM_FREE );
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
line 538
;538:}
LABELV $424
endproc CG_Missile 164 20
proc CG_Grapple 152 12
line 547
;539:
;540:/*
;541:===============
;542:CG_Grapple
;543:
;544:This is called when the grapple is sitting up against the wall
;545:===============
;546:*/
;547:static void CG_Grapple( centity_t *cent ) {
line 552
;548:	refEntity_t			ent;
;549:	entityState_t		*s1;
;550:	const weaponInfo_t		*weapon;
;551:
;552:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 553
;553:	if ( s1->weapon > WP_NUM_WEAPONS ) {
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 14
LEI4 $467
line 554
;554:		s1->weapon = 0;
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 555
;555:	}
LABELV $467
line 556
;556:	weapon = &cg_weapons[s1->weapon];
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
line 559
;557:
;558:	// calculate the axis
;559:	VectorCopy( s1->angles, cent->lerpAngles);
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
line 569
;560:
;561:#if 0 // FIXME add grapple pull sound here..?
;562:	// add missile sound
;563:	if ( weapon->missileSound ) {
;564:		trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, weapon->missileSound );
;565:	}
;566:#endif
;567:
;568:	// Will draw cable if needed
;569:	CG_GrappleTrail ( cent, weapon );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRGP4 CG_GrappleTrail
CALLV
pop
line 572
;570:
;571:	// create the render entity
;572:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 573
;573:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 574
;574:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 577
;575:
;576:	// flicker between two skins
;577:	ent.skinNum = cg.clientFrame & 1;
ADDRLP4 0+104
ADDRGP4 cg
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 578
;578:	ent.hModel = weapon->missileModel;
ADDRLP4 0+8
ADDRLP4 144
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ASGNI4
line 579
;579:	ent.renderfx = weapon->missileRenderfx | RF_NOSHADOW;
ADDRLP4 0+4
ADDRLP4 144
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 582
;580:
;581:	// convert direction of travel into axis
;582:	if ( VectorNormalize2( s1->pos.trDelta, ent.axis[0] ) == 0 ) {
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
NEF4 $474
line 583
;583:		ent.axis[0][2] = 1;
ADDRLP4 0+28+8
CNSTF4 1065353216
ASGNF4
line 584
;584:	}
LABELV $474
line 586
;585:
;586:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 587
;587:}
LABELV $466
endproc CG_Grapple 152 12
proc CG_Mover 144 12
line 594
;588:
;589:/*
;590:===============
;591:CG_Mover
;592:===============
;593:*/
;594:static void CG_Mover( centity_t *cent ) {
line 598
;595:	refEntity_t			ent;
;596:	entityState_t		*s1;
;597:
;598:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 601
;599:
;600:	// create the render entity
;601:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 602
;602:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 603
;603:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 604
;604:	AnglesToAxis( cent->lerpAngles, ent.axis );
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
line 606
;605:
;606:	ent.renderfx = RF_NOSHADOW;
ADDRLP4 0+4
CNSTI4 64
ASGNI4
line 609
;607:
;608:	// flicker between two skins (FIXME?)
;609:	ent.skinNum = ( cg.time >> 6 ) & 1;
ADDRLP4 0+104
ADDRGP4 cg+107604
INDIRI4
CNSTI4 6
RSHI4
CNSTI4 1
BANDI4
ASGNI4
line 612
;610:
;611:	// get the model, either as a bmodel or a modelindex
;612:	if ( s1->solid == SOLID_BMODEL ) {
ADDRLP4 140
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
NEI4 $486
line 613
;613:		ent.hModel = cgs.inlineDrawModel[s1->modelindex];
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
line 614
;614:	} else {
ADDRGP4 $487
JUMPV
LABELV $486
line 615
;615:		ent.hModel = cgs.gameModels[s1->modelindex];
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
line 616
;616:	}
LABELV $487
line 619
;617:
;618:	// add to refresh list
;619:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 622
;620:
;621:	// add the secondary model
;622:	if ( s1->modelindex2 ) {
ADDRLP4 140
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 0
EQI4 $492
line 623
;623:		ent.skinNum = 0;
ADDRLP4 0+104
CNSTI4 0
ASGNI4
line 624
;624:		ent.hModel = cgs.gameModels[s1->modelindex2];
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
line 625
;625:		trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 626
;626:	}
LABELV $492
line 628
;627:
;628:}
LABELV $479
endproc CG_Mover 144 12
export CG_Beam
proc CG_Beam 144 12
line 637
;629:
;630:/*
;631:===============
;632:CG_Beam
;633:
;634:Also called as an event
;635:===============
;636:*/
;637:void CG_Beam( centity_t *cent ) {
line 641
;638:	refEntity_t			ent;
;639:	entityState_t		*s1;
;640:
;641:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 644
;642:
;643:	// create the render entity
;644:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 645
;645:	VectorCopy( s1->pos.trBase, ent.origin );
ADDRLP4 0+68
ADDRLP4 140
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 646
;646:	VectorCopy( s1->origin2, ent.oldorigin );
ADDRLP4 0+84
ADDRLP4 140
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 647
;647:	AxisClear( ent.axis );
ADDRLP4 0+28
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 648
;648:	ent.reType = RT_BEAM;
ADDRLP4 0
CNSTI4 3
ASGNI4
line 650
;649:
;650:	ent.renderfx = RF_NOSHADOW;
ADDRLP4 0+4
CNSTI4 64
ASGNI4
line 653
;651:
;652:	// add to refresh list
;653:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 654
;654:}
LABELV $497
endproc CG_Beam 144 12
proc CG_Portal 144 12
line 662
;655:
;656:
;657:/*
;658:===============
;659:CG_Portal
;660:===============
;661:*/
;662:static void CG_Portal( centity_t *cent ) {
line 666
;663:	refEntity_t			ent;
;664:	entityState_t		*s1;
;665:
;666:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 669
;667:
;668:	// create the render entity
;669:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 670
;670:	VectorCopy( cent->lerpOrigin, ent.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 671
;671:	VectorCopy( s1->origin2, ent.oldorigin );
ADDRLP4 0+84
ADDRLP4 140
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 672
;672:	ByteToDir( s1->eventParm, ent.axis[0] );
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
line 673
;673:	PerpendicularVector( ent.axis[1], ent.axis[0] );
ADDRLP4 0+28+12
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 677
;674:
;675:	// negating this tends to get the directions like they want
;676:	// we really should have a camera roll value
;677:	VectorSubtract( vec3_origin, ent.axis[1], ent.axis[1] );
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
line 679
;678:
;679:	CrossProduct( ent.axis[0], ent.axis[1], ent.axis[2] );
ADDRLP4 0+28
ARGP4
ADDRLP4 0+28+12
ARGP4
ADDRLP4 0+28+24
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 680
;680:	ent.reType = RT_PORTALSURFACE;
ADDRLP4 0
CNSTI4 7
ASGNI4
line 681
;681:	ent.oldframe = s1->powerups;
ADDRLP4 0+96
ADDRLP4 140
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 682
;682:	ent.frame = s1->frame;		// rotation speed
ADDRLP4 0+80
ADDRLP4 140
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
line 683
;683:	ent.skinNum = s1->clientNum/256.0 * 360;	// roll offset
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
line 686
;684:
;685:	// add to refresh list
;686:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 687
;687:}
LABELV $502
endproc CG_Portal 144 12
export CG_AdjustPositionForMover
proc CG_AdjustPositionForMover 92 12
line 697
;688:
;689:
;690:/*
;691:=========================
;692:CG_AdjustPositionForMover
;693:
;694:Also called by client movement prediction code
;695:=========================
;696:*/
;697:void CG_AdjustPositionForMover( const vec3_t in, int moverNum, int fromTime, int toTime, vec3_t out ) {
line 702
;698:	centity_t	*cent;
;699:	vec3_t	oldOrigin, origin, deltaOrigin;
;700:	vec3_t	oldAngles, angles, deltaAngles;
;701:
;702:	if ( moverNum <= 0 || moverNum >= ENTITYNUM_MAX_NORMAL ) {
ADDRLP4 76
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
LEI4 $538
ADDRLP4 76
INDIRI4
CNSTI4 1022
LTI4 $536
LABELV $538
line 703
;703:		VectorCopy( in, out );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 704
;704:		return;
ADDRGP4 $535
JUMPV
LABELV $536
line 707
;705:	}
;706:
;707:	cent = &cg_entities[ moverNum ];
ADDRLP4 0
CNSTI4 732
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 708
;708:	if ( cent->currentState.eType != ET_MOVER ) {
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
EQI4 $539
line 709
;709:		VectorCopy( in, out );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 710
;710:		return;
ADDRGP4 $535
JUMPV
LABELV $539
line 713
;711:	}
;712:
;713:	BG_EvaluateTrajectory( &cent->currentState.pos, fromTime, oldOrigin );
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
line 714
;714:	BG_EvaluateTrajectory( &cent->currentState.apos, fromTime, oldAngles );
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
line 716
;715:
;716:	BG_EvaluateTrajectory( &cent->currentState.pos, toTime, origin );
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
line 717
;717:	BG_EvaluateTrajectory( &cent->currentState.apos, toTime, angles );
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
line 719
;718:
;719:	VectorSubtract( origin, oldOrigin, deltaOrigin );
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
line 720
;720:	VectorSubtract( angles, oldAngles, deltaAngles );
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
line 722
;721:
;722:	VectorAdd( in, deltaOrigin, out );
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
line 725
;723:
;724:	// FIXME: origin change when on a rotating object
;725:}
LABELV $535
endproc CG_AdjustPositionForMover 92 12
proc CG_InterpolateEntityPosition 44 12
line 733
;726:
;727:
;728:/*
;729:=============================
;730:CG_InterpolateEntityPosition
;731:=============================
;732:*/
;733:static void CG_InterpolateEntityPosition( centity_t *cent ) {
line 739
;734:	vec3_t		current, next;
;735:	float		f;
;736:
;737:	// it would be an internal error to find an entity that interpolates without
;738:	// a snapshot ahead of the current one
;739:	if ( cg.nextSnap == NULL ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $556
line 740
;740:		CG_Error( "CG_InterpoateEntityPosition: cg.nextSnap == NULL" );
ADDRGP4 $559
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 741
;741:	}
LABELV $556
line 743
;742:
;743:	f = cg.frameInterpolation;
ADDRLP4 24
ADDRGP4 cg+107588
INDIRF4
ASGNF4
line 748
;744:	//CG_Printf("interpolation fraction: %.2f\n", cg.frameInterpolation);
;745:
;746:	// this will linearize a sine or parabolic curve, but it is important
;747:	// to not extrapolate player positions if more recent data is available
;748:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.snap->serverTime, current );
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
line 749
;749:	BG_EvaluateTrajectory( &cent->nextState.pos, cg.nextSnap->serverTime, next );
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
line 751
;750:
;751:	cent->lerpOrigin[0] = current[0] + f * ( next[0] - current[0] );
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
line 752
;752:	cent->lerpOrigin[1] = current[1] + f * ( next[1] - current[1] );
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
line 753
;753:	cent->lerpOrigin[2] = current[2] + f * ( next[2] - current[2] );
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
line 755
;754:
;755:	BG_EvaluateTrajectory( &cent->currentState.apos, cg.snap->serverTime, current );
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
line 756
;756:	BG_EvaluateTrajectory( &cent->nextState.apos, cg.nextSnap->serverTime, next );
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
line 758
;757:
;758:	cent->lerpAngles[0] = LerpAngle( current[0], next[0], f );
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
line 759
;759:	cent->lerpAngles[1] = LerpAngle( current[1], next[1], f );
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
line 760
;760:	cent->lerpAngles[2] = LerpAngle( current[2], next[2], f );
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
line 761
;761:}
LABELV $555
endproc CG_InterpolateEntityPosition 44 12
proc CG_CalcEntityLerpPositions 120 28
line 769
;762:
;763:/*
;764:===============
;765:CG_CalcEntityLerpPositions
;766:
;767:===============
;768:*/
;769:static void CG_CalcEntityLerpPositions( centity_t *cent ) {
line 772
;770://unlagged - projectile nudge
;771:	// this will be set to how far forward projectiles will be extrapolated
;772:	int timeshift = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 790
;773://unlagged - projectile nudge
;774:
;775://unlagged - smooth clients #2
;776:	// this is done server-side now - cg_smoothClients is undefined
;777:	// players will always be TR_INTERPOLATE
;778:/*
;779:	// if this player does not want to see extrapolated players
;780:	if ( !cg_smoothClients.integer ) {
;781:		// make sure the clients use TR_INTERPOLATE
;782:		if ( cent->currentState.number < MAX_CLIENTS ) {
;783:			cent->currentState.pos.trType = TR_INTERPOLATE;
;784:			cent->nextState.pos.trType = TR_INTERPOLATE;
;785:		}
;786:	}
;787:*/
;788://unlagged - smooth clients #2
;789:
;790:	if ( cent->interpolate && cent->currentState.pos.trType == TR_INTERPOLATE ) {
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
EQI4 $576
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
NEI4 $576
line 791
;791:		CG_InterpolateEntityPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_InterpolateEntityPosition
CALLV
pop
line 792
;792:		return;
ADDRGP4 $575
JUMPV
LABELV $576
line 797
;793:	}
;794:
;795:	// first see if we can interpolate between two snaps for
;796:	// linear extrapolated clients
;797:	if ( cent->interpolate && cent->currentState.pos.trType == TR_LINEAR_STOP &&
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
EQI4 $578
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 3
NEI4 $578
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 64
GEI4 $578
line 798
;798:			cent->currentState.number < MAX_CLIENTS) {
line 799
;799:		CG_InterpolateEntityPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_InterpolateEntityPosition
CALLV
pop
line 800
;800:		return;
ADDRGP4 $575
JUMPV
LABELV $578
line 807
;801:	}
;802:
;803://unlagged - timenudge extrapolation
;804:	// interpolating failed (probably no nextSnap), so extrapolate
;805:	// this can also happen if the teleport bit is flipped, but that
;806:	// won't be noticeable
;807:	if ( cent->currentState.number < MAX_CLIENTS &&
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 64
GEI4 $580
ADDRLP4 12
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
EQI4 $580
line 808
;808:			cent->currentState.clientNum != cg.predictedPlayerState.clientNum ) {
line 809
;809:		cent->currentState.pos.trType = TR_LINEAR_STOP;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 3
ASGNI4
line 810
;810:		cent->currentState.pos.trTime = cg.snap->serverTime;
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
line 811
;811:		cent->currentState.pos.trDuration = 1000 / sv_fps.integer;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 1000
ADDRGP4 sv_fps+12
INDIRI4
DIVI4
ASGNI4
line 812
;812:	}
LABELV $580
line 817
;813://unlagged - timenudge extrapolation
;814:
;815://unlagged - projectile nudge
;816:	// if it's a missile but not a grappling hook
;817:	if ( cent->currentState.eType == ET_MISSILE && cent->currentState.weapon != WP_GRAPPLING_HOOK ) {
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
NEI4 $586
ADDRLP4 16
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 10
EQI4 $586
line 819
;818:		// if it's one of ours
;819:		if ( cent->currentState.otherEntityNum == cg.clientNum ) {
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ADDRGP4 cg+4
INDIRI4
NEI4 $588
line 823
;820:			// extrapolate one server frame's worth - this will correct for tiny
;821:			// visual inconsistencies introduced by backward-reconciling all players
;822:			// one server frame before running projectiles
;823:			timeshift = 1000 / sv_fps.integer;
ADDRLP4 0
CNSTI4 1000
ADDRGP4 sv_fps+12
INDIRI4
DIVI4
ASGNI4
line 824
;824:		}
ADDRGP4 $589
JUMPV
LABELV $588
line 826
;825:		// if it's not, and it's not a grenade launcher
;826:		else if ( cent->currentState.weapon != WP_GRENADE_LAUNCHER ) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 4
EQI4 $592
line 828
;827:			// extrapolate based on cg_projectileNudge
;828:			timeshift = cg_projectileNudge.integer + 1000 / sv_fps.integer;
ADDRLP4 0
ADDRGP4 cg_projectileNudge+12
INDIRI4
CNSTI4 1000
ADDRGP4 sv_fps+12
INDIRI4
DIVI4
ADDI4
ASGNI4
line 829
;829:		}
LABELV $592
LABELV $589
line 830
;830:	}
LABELV $586
line 835
;831:
;832:	// just use the current frame and evaluate as best we can
;833://	BG_EvaluateTrajectory( &cent->currentState.pos, cg.time, cent->lerpOrigin );
;834://	BG_EvaluateTrajectory( &cent->currentState.apos, cg.time, cent->lerpAngles );
;835:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.time + timeshift, cent->lerpOrigin );
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
line 836
;836:	BG_EvaluateTrajectory( &cent->currentState.apos, cg.time + timeshift, cent->lerpAngles );
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
line 839
;837:
;838:	// if there's a time shift
;839:	if ( timeshift != 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $598
line 843
;840:		trace_t tr;
;841:		vec3_t lastOrigin;
;842:
;843:		BG_EvaluateTrajectory( &cent->currentState.pos, cg.time, lastOrigin );
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
line 845
;844:
;845:		CG_Trace( &tr, lastOrigin, vec3_origin, vec3_origin, cent->lerpOrigin, cent->currentState.number, MASK_SHOT );
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
line 848
;846:
;847:		// don't let the projectile go through the floor
;848:		if ( tr.fraction < 1.0f ) {
ADDRLP4 40+8
INDIRF4
CNSTF4 1065353216
GEF4 $601
line 849
;849:			cent->lerpOrigin[0] = lastOrigin[0] + tr.fraction * ( cent->lerpOrigin[0] - lastOrigin[0] );
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
line 850
;850:			cent->lerpOrigin[1] = lastOrigin[1] + tr.fraction * ( cent->lerpOrigin[1] - lastOrigin[1] );
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
line 851
;851:			cent->lerpOrigin[2] = lastOrigin[2] + tr.fraction * ( cent->lerpOrigin[2] - lastOrigin[2] );
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
line 852
;852:		}
LABELV $601
line 853
;853:	}
LABELV $598
line 859
;854://unlagged - projectile nudge
;855:
;856:
;857:	// adjust for riding a mover if it wasn't rolled into the predicted
;858:	// player state
;859:	if ( cent != &cg.predictedPlayerEntity ) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 cg+108104
CVPU4 4
EQU4 $611
line 860
;860:		CG_AdjustPositionForMover( cent->lerpOrigin, cent->currentState.groundEntityNum, 
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
line 862
;861:		cg.snap->serverTime, cg.time, cent->lerpOrigin );
;862:	}
LABELV $611
line 863
;863:}
LABELV $575
endproc CG_CalcEntityLerpPositions 120 28
proc CG_TeamBase 216 16
line 870
;864:
;865:/*
;866:===============
;867:CG_TeamBase
;868:===============
;869:*/
;870:static void CG_TeamBase( centity_t *cent ) {
line 877
;871:	refEntity_t model;
;872:#ifdef MISSIONPACK
;873:	vec3_t angles;
;874:	int t, h;
;875:	float c;
;876:
;877:	if ( cgs.gametype == GT_CTF || cgs.gametype == GT_1FCTF ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
EQI4 $621
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 5
NEI4 $617
LABELV $621
line 882
;878:#else
;879:	if ( cgs.gametype == GT_CTF) {
;880:#endif
;881:		// show the flag base
;882:		memset(&model, 0, sizeof(model));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 883
;883:		model.reType = RT_MODEL;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 884
;884:		VectorCopy( cent->lerpOrigin, model.lightingOrigin );
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 885
;885:		VectorCopy( cent->lerpOrigin, model.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 886
;886:		AnglesToAxis( cent->currentState.angles, model.axis );
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
line 887
;887:		if ( cent->currentState.modelindex == TEAM_RED ) {
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 1
NEI4 $625
line 888
;888:			model.hModel = cgs.media.redFlagBaseModel;
ADDRLP4 0+8
ADDRGP4 cgs+152852+108
INDIRI4
ASGNI4
line 889
;889:		}
ADDRGP4 $626
JUMPV
LABELV $625
line 890
;890:		else if ( cent->currentState.modelindex == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 2
NEI4 $630
line 891
;891:			model.hModel = cgs.media.blueFlagBaseModel;
ADDRLP4 0+8
ADDRGP4 cgs+152852+112
INDIRI4
ASGNI4
line 892
;892:		}
ADDRGP4 $631
JUMPV
LABELV $630
line 893
;893:		else {
line 894
;894:			model.hModel = cgs.media.neutralFlagBaseModel;
ADDRLP4 0+8
ADDRGP4 cgs+152852+116
INDIRI4
ASGNI4
line 895
;895:		}
LABELV $631
LABELV $626
line 896
;896:		trap_R_AddRefEntityToScene( &model );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 897
;897:	}
ADDRGP4 $618
JUMPV
LABELV $617
line 899
;898:#ifdef MISSIONPACK
;899:	else if ( cgs.gametype == GT_OBELISK ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 6
NEI4 $638
line 901
;900:		// show the obelisk
;901:		memset(&model, 0, sizeof(model));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 902
;902:		model.reType = RT_MODEL;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 903
;903:		VectorCopy( cent->lerpOrigin, model.lightingOrigin );
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 904
;904:		VectorCopy( cent->lerpOrigin, model.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 905
;905:		AnglesToAxis( cent->currentState.angles, model.axis );
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
line 907
;906:
;907:		model.hModel = cgs.media.overloadBaseModel;
ADDRLP4 0+8
ADDRGP4 cgs+152852+120
INDIRI4
ASGNI4
line 908
;908:		trap_R_AddRefEntityToScene( &model );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 910
;909:		// if hit
;910:		if ( cent->currentState.frame == 1) {
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 1
NEI4 $647
line 913
;911:			// show hit model
;912:			// modelindex2 is the health value of the obelisk
;913:			c = cent->currentState.modelindex2;
ADDRLP4 140
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 914
;914:			model.shaderRGBA[0] = 0xff;
ADDRLP4 0+116
CNSTU1 255
ASGNU1
line 915
;915:			model.shaderRGBA[1] = c;
ADDRLP4 168
ADDRLP4 140
INDIRF4
ASGNF4
ADDRLP4 172
CNSTF4 1325400064
ASGNF4
ADDRLP4 168
INDIRF4
ADDRLP4 172
INDIRF4
LTF4 $653
ADDRLP4 164
ADDRLP4 168
INDIRF4
ADDRLP4 172
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $654
JUMPV
LABELV $653
ADDRLP4 164
ADDRLP4 168
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $654
ADDRLP4 0+116+1
ADDRLP4 164
INDIRU4
CVUU1 4
ASGNU1
line 916
;916:			model.shaderRGBA[2] = c;
ADDRLP4 180
ADDRLP4 140
INDIRF4
ASGNF4
ADDRLP4 184
CNSTF4 1325400064
ASGNF4
ADDRLP4 180
INDIRF4
ADDRLP4 184
INDIRF4
LTF4 $658
ADDRLP4 176
ADDRLP4 180
INDIRF4
ADDRLP4 184
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $659
JUMPV
LABELV $658
ADDRLP4 176
ADDRLP4 180
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $659
ADDRLP4 0+116+2
ADDRLP4 176
INDIRU4
CVUU1 4
ASGNU1
line 917
;917:			model.shaderRGBA[3] = 0xff;
ADDRLP4 0+116+3
CNSTU1 255
ASGNU1
line 919
;918:			//
;919:			model.hModel = cgs.media.overloadEnergyModel;
ADDRLP4 0+8
ADDRGP4 cgs+152852+132
INDIRI4
ASGNI4
line 920
;920:			trap_R_AddRefEntityToScene( &model );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 921
;921:		}
LABELV $647
line 923
;922:		// if respawning
;923:		if ( cent->currentState.frame == 2) {
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 2
NEI4 $665
line 924
;924:			if ( !cent->miscTime ) {
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
CNSTI4 0
NEI4 $667
line 925
;925:				cent->miscTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 926
;926:			}
LABELV $667
line 927
;927:			t = cg.time - cent->miscTime;
ADDRLP4 148
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
SUBI4
ASGNI4
line 928
;928:			h = (cg_obeliskRespawnDelay.integer - 5) * 1000;
ADDRLP4 144
CNSTI4 1000
ADDRGP4 cg_obeliskRespawnDelay+12
INDIRI4
MULI4
CNSTI4 5000
SUBI4
ASGNI4
line 930
;929:			//
;930:			if (t > h) {
ADDRLP4 148
INDIRI4
ADDRLP4 144
INDIRI4
LEI4 $672
line 931
;931:				c = (float) (t - h) / h;
ADDRLP4 164
ADDRLP4 144
INDIRI4
ASGNI4
ADDRLP4 140
ADDRLP4 148
INDIRI4
ADDRLP4 164
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 164
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 932
;932:				if (c > 1)
ADDRLP4 140
INDIRF4
CNSTF4 1065353216
LEF4 $673
line 933
;933:					c = 1;
ADDRLP4 140
CNSTF4 1065353216
ASGNF4
line 934
;934:			}
ADDRGP4 $673
JUMPV
LABELV $672
line 935
;935:			else {
line 936
;936:				c = 0;
ADDRLP4 140
CNSTF4 0
ASGNF4
line 937
;937:			}
LABELV $673
line 939
;938:			// show the lights
;939:			AnglesToAxis( cent->currentState.angles, model.axis );
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
line 941
;940:			//
;941:			model.shaderRGBA[0] = c * 0xff;
ADDRLP4 168
CNSTF4 1132396544
ADDRLP4 140
INDIRF4
MULF4
ASGNF4
ADDRLP4 172
CNSTF4 1325400064
ASGNF4
ADDRLP4 168
INDIRF4
ADDRLP4 172
INDIRF4
LTF4 $679
ADDRLP4 164
ADDRLP4 168
INDIRF4
ADDRLP4 172
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $680
JUMPV
LABELV $679
ADDRLP4 164
ADDRLP4 168
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $680
ADDRLP4 0+116
ADDRLP4 164
INDIRU4
CVUU1 4
ASGNU1
line 942
;942:			model.shaderRGBA[1] = c * 0xff;
ADDRLP4 180
CNSTF4 1132396544
ADDRLP4 140
INDIRF4
MULF4
ASGNF4
ADDRLP4 184
CNSTF4 1325400064
ASGNF4
ADDRLP4 180
INDIRF4
ADDRLP4 184
INDIRF4
LTF4 $684
ADDRLP4 176
ADDRLP4 180
INDIRF4
ADDRLP4 184
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $685
JUMPV
LABELV $684
ADDRLP4 176
ADDRLP4 180
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $685
ADDRLP4 0+116+1
ADDRLP4 176
INDIRU4
CVUU1 4
ASGNU1
line 943
;943:			model.shaderRGBA[2] = c * 0xff;
ADDRLP4 192
CNSTF4 1132396544
ADDRLP4 140
INDIRF4
MULF4
ASGNF4
ADDRLP4 196
CNSTF4 1325400064
ASGNF4
ADDRLP4 192
INDIRF4
ADDRLP4 196
INDIRF4
LTF4 $689
ADDRLP4 188
ADDRLP4 192
INDIRF4
ADDRLP4 196
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $690
JUMPV
LABELV $689
ADDRLP4 188
ADDRLP4 192
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $690
ADDRLP4 0+116+2
ADDRLP4 188
INDIRU4
CVUU1 4
ASGNU1
line 944
;944:			model.shaderRGBA[3] = c * 0xff;
ADDRLP4 204
CNSTF4 1132396544
ADDRLP4 140
INDIRF4
MULF4
ASGNF4
ADDRLP4 208
CNSTF4 1325400064
ASGNF4
ADDRLP4 204
INDIRF4
ADDRLP4 208
INDIRF4
LTF4 $694
ADDRLP4 200
ADDRLP4 204
INDIRF4
ADDRLP4 208
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $695
JUMPV
LABELV $694
ADDRLP4 200
ADDRLP4 204
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $695
ADDRLP4 0+116+3
ADDRLP4 200
INDIRU4
CVUU1 4
ASGNU1
line 946
;945:
;946:			model.hModel = cgs.media.overloadLightsModel;
ADDRLP4 0+8
ADDRGP4 cgs+152852+128
INDIRI4
ASGNI4
line 947
;947:			trap_R_AddRefEntityToScene( &model );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 949
;948:			// show the target
;949:			if (t > h) {
ADDRLP4 148
INDIRI4
ADDRLP4 144
INDIRI4
LEI4 $639
line 950
;950:				if ( !cent->muzzleFlashTime ) {
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 0
NEI4 $701
line 951
;951:					trap_S_StartSound (cent->lerpOrigin, ENTITYNUM_NONE, CHAN_BODY,  cgs.media.obeliskRespawnSound);
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+152852+884
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 952
;952:					cent->muzzleFlashTime = 1;
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 1
ASGNI4
line 953
;953:				}
LABELV $701
line 954
;954:				VectorCopy(cent->currentState.angles, angles);
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 955
;955:				angles[YAW] += (float) 16 * acos(1-c) * 180 / M_PI;
CNSTF4 1065353216
ADDRLP4 140
INDIRF4
SUBF4
ARGF4
ADDRLP4 212
ADDRGP4 acos
CALLF4
ASGNF4
ADDRLP4 152+4
ADDRLP4 152+4
INDIRF4
CNSTF4 1127481344
CNSTF4 1098907648
ADDRLP4 212
INDIRF4
MULF4
MULF4
CNSTF4 1078530011
DIVF4
ADDF4
ASGNF4
line 956
;956:				AnglesToAxis( angles, model.axis );
ADDRLP4 152
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 958
;957:
;958:				VectorScale( model.axis[0], c, model.axis[0]);
ADDRLP4 0+28
ADDRLP4 0+28
INDIRF4
ADDRLP4 140
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+4
ADDRLP4 0+28+4
INDIRF4
ADDRLP4 140
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+8
ADDRLP4 0+28+8
INDIRF4
ADDRLP4 140
INDIRF4
MULF4
ASGNF4
line 959
;959:				VectorScale( model.axis[1], c, model.axis[1]);
ADDRLP4 0+28+12
ADDRLP4 0+28+12
INDIRF4
ADDRLP4 140
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+4
ADDRLP4 0+28+12+4
INDIRF4
ADDRLP4 140
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+8
ADDRLP4 0+28+12+8
INDIRF4
ADDRLP4 140
INDIRF4
MULF4
ASGNF4
line 960
;960:				VectorScale( model.axis[2], c, model.axis[2]);
ADDRLP4 0+28+24
ADDRLP4 0+28+24
INDIRF4
ADDRLP4 140
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+4
ADDRLP4 0+28+24+4
INDIRF4
ADDRLP4 140
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+8
ADDRLP4 0+28+24+8
INDIRF4
ADDRLP4 140
INDIRF4
MULF4
ASGNF4
line 962
;961:
;962:				model.shaderRGBA[0] = 0xff;
ADDRLP4 0+116
CNSTU1 255
ASGNU1
line 963
;963:				model.shaderRGBA[1] = 0xff;
ADDRLP4 0+116+1
CNSTU1 255
ASGNU1
line 964
;964:				model.shaderRGBA[2] = 0xff;
ADDRLP4 0+116+2
CNSTU1 255
ASGNU1
line 965
;965:				model.shaderRGBA[3] = 0xff;
ADDRLP4 0+116+3
CNSTU1 255
ASGNU1
line 967
;966:				//
;967:				model.origin[2] += 56;
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
CNSTF4 1113587712
ADDF4
ASGNF4
line 968
;968:				model.hModel = cgs.media.overloadTargetModel;
ADDRLP4 0+8
ADDRGP4 cgs+152852+124
INDIRI4
ASGNI4
line 969
;969:				trap_R_AddRefEntityToScene( &model );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 970
;970:			}
line 971
;971:			else {
line 973
;972:				//FIXME: show animated smoke
;973:			}
line 974
;974:		}
ADDRGP4 $639
JUMPV
LABELV $665
line 975
;975:		else {
line 976
;976:			cent->miscTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
CNSTI4 0
ASGNI4
line 977
;977:			cent->muzzleFlashTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 0
ASGNI4
line 979
;978:			// modelindex2 is the health value of the obelisk
;979:			c = cent->currentState.modelindex2;
ADDRLP4 140
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 980
;980:			model.shaderRGBA[0] = 0xff;
ADDRLP4 0+116
CNSTU1 255
ASGNU1
line 981
;981:			model.shaderRGBA[1] = c;
ADDRLP4 168
ADDRLP4 140
INDIRF4
ASGNF4
ADDRLP4 172
CNSTF4 1325400064
ASGNF4
ADDRLP4 168
INDIRF4
ADDRLP4 172
INDIRF4
LTF4 $765
ADDRLP4 164
ADDRLP4 168
INDIRF4
ADDRLP4 172
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $766
JUMPV
LABELV $765
ADDRLP4 164
ADDRLP4 168
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $766
ADDRLP4 0+116+1
ADDRLP4 164
INDIRU4
CVUU1 4
ASGNU1
line 982
;982:			model.shaderRGBA[2] = c;
ADDRLP4 180
ADDRLP4 140
INDIRF4
ASGNF4
ADDRLP4 184
CNSTF4 1325400064
ASGNF4
ADDRLP4 180
INDIRF4
ADDRLP4 184
INDIRF4
LTF4 $770
ADDRLP4 176
ADDRLP4 180
INDIRF4
ADDRLP4 184
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $771
JUMPV
LABELV $770
ADDRLP4 176
ADDRLP4 180
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $771
ADDRLP4 0+116+2
ADDRLP4 176
INDIRU4
CVUU1 4
ASGNU1
line 983
;983:			model.shaderRGBA[3] = 0xff;
ADDRLP4 0+116+3
CNSTU1 255
ASGNU1
line 985
;984:			// show the lights
;985:			model.hModel = cgs.media.overloadLightsModel;
ADDRLP4 0+8
ADDRGP4 cgs+152852+128
INDIRI4
ASGNI4
line 986
;986:			trap_R_AddRefEntityToScene( &model );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 988
;987:			// show the target
;988:			model.origin[2] += 56;
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
CNSTF4 1113587712
ADDF4
ASGNF4
line 989
;989:			model.hModel = cgs.media.overloadTargetModel;
ADDRLP4 0+8
ADDRGP4 cgs+152852+124
INDIRI4
ASGNI4
line 990
;990:			trap_R_AddRefEntityToScene( &model );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 991
;991:		}
line 992
;992:	}
ADDRGP4 $639
JUMPV
LABELV $638
line 993
;993:	else if ( cgs.gametype == GT_HARVESTER ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 7
NEI4 $782
line 995
;994:		// show harvester model
;995:		memset(&model, 0, sizeof(model));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 996
;996:		model.reType = RT_MODEL;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 997
;997:		VectorCopy( cent->lerpOrigin, model.lightingOrigin );
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 998
;998:		VectorCopy( cent->lerpOrigin, model.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 999
;999:		AnglesToAxis( cent->currentState.angles, model.axis );
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
line 1001
;1000:
;1001:		if ( cent->currentState.modelindex == TEAM_RED ) {
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 1
NEI4 $788
line 1002
;1002:			model.hModel = cgs.media.harvesterModel;
ADDRLP4 0+8
ADDRGP4 cgs+152852+136
INDIRI4
ASGNI4
line 1003
;1003:			model.customSkin = cgs.media.harvesterRedSkin;
ADDRLP4 0+108
ADDRGP4 cgs+152852+140
INDIRI4
ASGNI4
line 1004
;1004:		}
ADDRGP4 $789
JUMPV
LABELV $788
line 1005
;1005:		else if ( cent->currentState.modelindex == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 2
NEI4 $796
line 1006
;1006:			model.hModel = cgs.media.harvesterModel;
ADDRLP4 0+8
ADDRGP4 cgs+152852+136
INDIRI4
ASGNI4
line 1007
;1007:			model.customSkin = cgs.media.harvesterBlueSkin;
ADDRLP4 0+108
ADDRGP4 cgs+152852+144
INDIRI4
ASGNI4
line 1008
;1008:		}
ADDRGP4 $797
JUMPV
LABELV $796
line 1009
;1009:		else {
line 1010
;1010:			model.hModel = cgs.media.harvesterNeutralModel;
ADDRLP4 0+8
ADDRGP4 cgs+152852+148
INDIRI4
ASGNI4
line 1011
;1011:			model.customSkin = 0;
ADDRLP4 0+108
CNSTI4 0
ASGNI4
line 1012
;1012:		}
LABELV $797
LABELV $789
line 1013
;1013:		trap_R_AddRefEntityToScene( &model );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1014
;1014:	}
LABELV $782
LABELV $639
LABELV $618
line 1016
;1015:#endif
;1016:}
LABELV $616
endproc CG_TeamBase 216 16
proc CG_AddCEntity 8 8
line 1024
;1017:
;1018:/*
;1019:===============
;1020:CG_AddCEntity
;1021:
;1022:===============
;1023:*/
;1024:static void CG_AddCEntity( centity_t *cent ) {
line 1026
;1025:	// event-only entities will have been dealt with already
;1026:	if ( cent->currentState.eType >= ET_EVENTS ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 14
LTI4 $809
line 1027
;1027:		return;
ADDRGP4 $808
JUMPV
LABELV $809
line 1031
;1028:	}
;1029:
;1030:	// calculate the current origin
;1031:	CG_CalcEntityLerpPositions( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CalcEntityLerpPositions
CALLV
pop
line 1034
;1032:
;1033:	// add automatic effects
;1034:	CG_EntityEffects( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_EntityEffects
CALLV
pop
line 1036
;1035:
;1036:	switch ( cent->currentState.eType ) {
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
LTI4 $811
ADDRLP4 0
INDIRI4
CNSTI4 13
GTI4 $811
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $827
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $827
address $816
address $817
address $818
address $819
address $820
address $821
address $822
address $823
address $812
address $812
address $812
address $824
address $826
address $825
code
LABELV $811
line 1038
;1037:	default:
;1038:		CG_Error( "Bad entity type: %i\n", cent->currentState.eType );
ADDRGP4 $814
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
line 1039
;1039:		break;
ADDRGP4 $812
JUMPV
line 1043
;1040:	case ET_INVISIBLE:
;1041:	case ET_PUSH_TRIGGER:
;1042:	case ET_TELEPORT_TRIGGER:
;1043:		break;
LABELV $816
line 1045
;1044:	case ET_GENERAL:
;1045:		CG_General( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_General
CALLV
pop
line 1046
;1046:		break;
ADDRGP4 $812
JUMPV
LABELV $817
line 1048
;1047:	case ET_PLAYER:
;1048:		CG_Player( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Player
CALLV
pop
line 1049
;1049:		break;
ADDRGP4 $812
JUMPV
LABELV $818
line 1051
;1050:	case ET_ITEM:
;1051:		CG_Item( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Item
CALLV
pop
line 1052
;1052:		break;
ADDRGP4 $812
JUMPV
LABELV $819
line 1054
;1053:	case ET_MISSILE:
;1054:		CG_Missile( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Missile
CALLV
pop
line 1055
;1055:		break;
ADDRGP4 $812
JUMPV
LABELV $820
line 1057
;1056:	case ET_MOVER:
;1057:		CG_Mover( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Mover
CALLV
pop
line 1058
;1058:		break;
ADDRGP4 $812
JUMPV
LABELV $821
line 1060
;1059:	case ET_BEAM:
;1060:		CG_Beam( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Beam
CALLV
pop
line 1061
;1061:		break;
ADDRGP4 $812
JUMPV
LABELV $822
line 1063
;1062:	case ET_PORTAL:
;1063:		CG_Portal( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Portal
CALLV
pop
line 1064
;1064:		break;
ADDRGP4 $812
JUMPV
LABELV $823
line 1066
;1065:	case ET_SPEAKER:
;1066:		CG_Speaker( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Speaker
CALLV
pop
line 1067
;1067:		break;
ADDRGP4 $812
JUMPV
LABELV $824
line 1069
;1068:	case ET_GRAPPLE:
;1069:		CG_Grapple( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Grapple
CALLV
pop
line 1070
;1070:		break;
ADDRGP4 $812
JUMPV
LABELV $825
line 1072
;1071:	case ET_TURRET:
;1072:		CG_TURRET(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_TURRET
CALLV
pop
line 1073
;1073:		break;
ADDRGP4 $812
JUMPV
LABELV $826
line 1075
;1074:	case ET_TEAM:
;1075:		CG_TeamBase( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_TeamBase
CALLV
pop
line 1076
;1076:		break;
LABELV $812
line 1078
;1077:	}
;1078:}
LABELV $808
endproc CG_AddCEntity 8 8
export CG_AddPacketEntities
proc CG_AddPacketEntities 20 12
line 1086
;1079:
;1080:/*
;1081:===============
;1082:CG_AddPacketEntities
;1083:
;1084:===============
;1085:*/
;1086:void CG_AddPacketEntities( void ) {
line 1092
;1087:	int					num;
;1088:	centity_t			*cent;
;1089:	playerState_t		*ps;
;1090:
;1091:	// set cg.frameInterpolation
;1092:	if ( cg.nextSnap ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $829
line 1095
;1093:		int		delta;
;1094:
;1095:		delta = (cg.nextSnap->serverTime - cg.snap->serverTime);
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
line 1096
;1096:		if ( delta == 0 ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $834
line 1097
;1097:			cg.frameInterpolation = 0;
ADDRGP4 cg+107588
CNSTF4 0
ASGNF4
line 1098
;1098:		} else {
ADDRGP4 $830
JUMPV
LABELV $834
line 1099
;1099:			cg.frameInterpolation = (float)( cg.time - cg.snap->serverTime ) / delta;
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
line 1100
;1100:		}
line 1101
;1101:	} else {
ADDRGP4 $830
JUMPV
LABELV $829
line 1102
;1102:		cg.frameInterpolation = 0;	// actually, it should never be used, because 
ADDRGP4 cg+107588
CNSTF4 0
ASGNF4
line 1104
;1103:									// no entities should be marked as interpolating
;1104:	}
LABELV $830
line 1107
;1105:
;1106:	// the auto-rotating items will all have the same axis
;1107:	cg.autoAngles[0] = 0;
ADDRGP4 cg+108952
CNSTF4 0
ASGNF4
line 1108
;1108:	cg.autoAngles[1] = ( cg.time & 2047 ) * 360 / 2048.0;
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
line 1109
;1109:	cg.autoAngles[2] = 0;
ADDRGP4 cg+108952+8
CNSTF4 0
ASGNF4
line 1111
;1110:
;1111:	cg.autoAnglesFast[0] = 0;
ADDRGP4 cg+109000
CNSTF4 0
ASGNF4
line 1112
;1112:	cg.autoAnglesFast[1] = ( cg.time & 1023 ) * 360 / 1024.0f;
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
line 1113
;1113:	cg.autoAnglesFast[2] = 0;
ADDRGP4 cg+109000+8
CNSTF4 0
ASGNF4
line 1115
;1114:
;1115:	AnglesToAxis( cg.autoAngles, cg.autoAxis );
ADDRGP4 cg+108952
ARGP4
ADDRGP4 cg+108964
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1116
;1116:	AnglesToAxis( cg.autoAnglesFast, cg.autoAxisFast );
ADDRGP4 cg+109000
ARGP4
ADDRGP4 cg+109012
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1119
;1117:
;1118:	// generate and add the entity from the playerstate
;1119:	ps = &cg.predictedPlayerState;
ADDRLP4 8
ADDRGP4 cg+107636
ASGNP4
line 1120
;1120:	BG_PlayerStateToEntityState( ps, &cg.predictedPlayerEntity.currentState, qfalse );
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
line 1121
;1121:	CG_AddCEntity( &cg.predictedPlayerEntity );
ADDRGP4 cg+108104
ARGP4
ADDRGP4 CG_AddCEntity
CALLV
pop
line 1124
;1122:
;1123:	// lerp the non-predicted value for lightning gun origins
;1124:	CG_CalcEntityLerpPositions( &cg_entities[ cg.snap->ps.clientNum ] );
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
line 1127
;1125:
;1126://unlagged - early transitioning
;1127:	if ( cg.nextSnap ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $861
line 1130
;1128:		// pre-add some of the entities sent over by the server
;1129:		// we have data for them and they don't need to interpolate
;1130:		for ( num = 0 ; num < cg.nextSnap->numEntities ; num++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $867
JUMPV
LABELV $864
line 1131
;1131:			cent = &cg_entities[ cg.nextSnap->entities[ num ].number ];
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
line 1132
;1132:			if ( cent->nextState.eType == ET_MISSILE || cent->nextState.eType == ET_GENERAL ) {
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
EQI4 $872
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $870
LABELV $872
line 1134
;1133:				// transition it immediately and add it
;1134:				CG_TransitionEntity( cent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_TransitionEntity
CALLV
pop
line 1135
;1135:				cent->interpolate = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 1
ASGNI4
line 1136
;1136:				CG_AddCEntity( cent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddCEntity
CALLV
pop
line 1137
;1137:			}
LABELV $870
line 1138
;1138:		}
LABELV $865
line 1130
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $867
ADDRLP4 4
INDIRI4
ADDRGP4 cg+40
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $864
line 1139
;1139:	}
LABELV $861
line 1143
;1140://unlagged - early transitioning
;1141:
;1142:	// add each entity sent over by the server
;1143:	for ( num = 0 ; num < cg.snap->numEntities ; num++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $876
JUMPV
LABELV $873
line 1144
;1144:		cent = &cg_entities[ cg.snap->entities[ num ].number ];
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
line 1146
;1145://unlagged - early transitioning
;1146:		if ( !cg.nextSnap || cent->nextState.eType != ET_MISSILE && cent->nextState.eType != ET_GENERAL ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $882
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
EQI4 $879
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $879
LABELV $882
line 1148
;1147://unlagged - early transitioning
;1148:			CG_AddCEntity( cent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddCEntity
CALLV
pop
line 1149
;1149:		}
LABELV $879
line 1150
;1150:	}
LABELV $874
line 1143
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $876
ADDRLP4 4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $873
line 1151
;1151:}
LABELV $828
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
import CG_LightningBoltBeam
import CG_InvulnerabilityJuiced
import CG_InvulnerabilityImpact
import CG_ObeliskPain
import CG_ObeliskExplode
import CG_KamikazeEffect
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
import cg_obeliskRespawnDelay
import cg_recordSPDemoName
import cg_recordSPDemo
import cg_singlePlayerActive
import cg_enableBreath
import cg_enableDust
import cg_singlePlayer
import cg_currentSelectedPlayerName
import cg_currentSelectedPlayer
import cg_blueTeamName
import cg_redTeamName
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
LABELV $814
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
LABELV $559
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
LABELV $354
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 98
byte 1 97
byte 1 114
byte 1 114
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $148
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
