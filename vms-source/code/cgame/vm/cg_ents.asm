code
proc CG_TURRET 156 12
file "../cg_ents.c"
line 11
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_ents.c -- present snapshot entities, happens every single frame
;4:
;5:#include "cg_local.h"
;6:
;7:
;8:
;9:
;10:static void CG_TURRET(centity_t *cent)
;11:{
line 15
;12:	refEntity_t			ent;
;13:	entityState_t		*s1;
;14:
;15:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 17
;16:
;17:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 19
;18:
;19:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 20
;20:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 23
;21:
;22:
;23:	ent.frame = s1->frame;
ADDRLP4 0+80
ADDRLP4 140
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
line 24
;24:	ent.oldframe = ent.frame;
ADDRLP4 0+96
ADDRLP4 0+80
INDIRI4
ASGNI4
line 25
;25:	ent.backlerp = 0;
ADDRLP4 0+100
CNSTF4 0
ASGNF4
line 27
;26:	// convert angles to axis
;27:	AnglesToAxis( cent->lerpAngles, ent.axis );
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 29
;28:	
;29:	ent.hModel=cgs.gameModels[s1->modelindex];
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
line 31
;30:	// add to refresh list
;31:	switch (s1->time2){
ADDRLP4 144
ADDRLP4 140
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ASGNI4
ADDRLP4 152
CNSTI4 1
ASGNI4
ADDRLP4 144
INDIRI4
ADDRLP4 152
INDIRI4
EQI4 $85
ADDRLP4 144
INDIRI4
CNSTI4 2
EQI4 $89
ADDRLP4 144
INDIRI4
CNSTI4 3
EQI4 $93
ADDRLP4 144
INDIRI4
ADDRLP4 152
INDIRI4
LTI4 $82
LABELV $98
ADDRLP4 144
INDIRI4
CNSTI4 9
EQI4 $94
ADDRGP4 $82
JUMPV
LABELV $85
line 33
;32:	case 1:
;33:		trap_R_AddRefEntityToScene (&ent); // make the model show up
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 34
;34:		ent.customShader=cgs.media.battleSuitShader;
ADDRLP4 0+112
ADDRGP4 cgs+154388+440
INDIRI4
ASGNI4
line 35
;35:		trap_R_AddRefEntityToScene (&ent); // make the shader show up
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 36
;36:		CG_PlayerSprites(cent); // This needs some work
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerSprites
CALLV
pop
line 37
;37:		break;	
ADDRGP4 $83
JUMPV
LABELV $89
line 39
;38:	case 2:
;39:		ent.customShader=cgs.media.invisShader;
ADDRLP4 0+112
ADDRGP4 cgs+154388+432
INDIRI4
ASGNI4
line 40
;40:		trap_R_AddRefEntityToScene (&ent); // make the shader show up. no model
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 41
;41:		CG_PlayerSprites(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerSprites
CALLV
pop
line 42
;42:		break;
ADDRGP4 $83
JUMPV
LABELV $93
line 44
;43:	case 3:
;44:		trap_R_AddRefEntityToScene (&ent); // just add the model (uncloaked cloaking turret)
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 45
;45:		CG_PlayerSprites(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerSprites
CALLV
pop
line 47
;46:		
;47:		break;
ADDRGP4 $83
JUMPV
LABELV $94
line 50
;48:	case 9:
;49:		// Being Built
;50:		trap_R_AddRefEntityToScene (&ent); // make the model show up
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 51
;51:		ent.customShader=cgs.media.buildShader;
ADDRLP4 0+112
ADDRGP4 cgs+154388+420
INDIRI4
ASGNI4
line 52
;52:		trap_R_AddRefEntityToScene (&ent); // make the shader show up
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 53
;53:		CG_PlayerSprites(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerSprites
CALLV
pop
line 54
;54:		break;
ADDRGP4 $83
JUMPV
LABELV $82
line 56
;55:	default:
;56:		trap_R_AddRefEntityToScene (&ent); // if something else has happened
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 57
;57:		CG_PlayerSprites(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerSprites
CALLV
pop
line 58
;58:	}
LABELV $83
line 63
;59:
;60:	
;61:		
;62:		
;63:}
LABELV $72
endproc CG_TURRET 156 12
export CG_PositionEntityOnTag
proc CG_PositionEntityOnTag 84 24
line 74
;64:
;65:/*
;66:======================
;67:CG_PositionEntityOnTag
;68:
;69:Modifies the entities position and axis by the given
;70:tag location
;71:======================
;72:*/
;73:void CG_PositionEntityOnTag( refEntity_t *entity, const refEntity_t *parent, 
;74:							qhandle_t parentModel, char *tagName ) {
line 79
;75:	int				i;
;76:	orientation_t	lerped;
;77:	
;78:	// lerp the tag
;79:	trap_R_LerpTag( &lerped, parentModel, parent->oldframe, parent->frame,
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
line 83
;80:		1.0 - parent->backlerp, tagName );
;81:
;82:	// FIXME: allow origin offsets along tag?
;83:	VectorCopy( parent->origin, entity->origin );
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
line 84
;84:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $100
line 85
;85:		VectorMA( entity->origin, lerped.origin[i], parent->axis[i], entity->origin );
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
line 86
;86:	}
LABELV $101
line 84
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $100
line 89
;87:
;88:	// had to cast away the const to avoid compiler problems...
;89:	MatrixMultiply( lerped.axis, ((refEntity_t *)parent)->axis, entity->axis );
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
line 90
;90:	entity->backlerp = parent->backlerp;
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
line 91
;91:}
LABELV $99
endproc CG_PositionEntityOnTag 84 24
export CG_PositionRotatedEntityOnTag
proc CG_PositionRotatedEntityOnTag 120 24
line 103
;92:
;93:
;94:/*
;95:======================
;96:CG_PositionRotatedEntityOnTag
;97:
;98:Modifies the entities position and axis by the given
;99:tag location
;100:======================
;101:*/
;102:void CG_PositionRotatedEntityOnTag( refEntity_t *entity, const refEntity_t *parent, 
;103:							qhandle_t parentModel, char *tagName ) {
line 110
;104:	int				i;
;105:	orientation_t	lerped;
;106:	vec3_t			tempAxis[3];
;107:
;108://AxisClear( entity->axis );
;109:	// lerp the tag
;110:	trap_R_LerpTag( &lerped, parentModel, parent->oldframe, parent->frame,
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
line 114
;111:		1.0 - parent->backlerp, tagName );
;112:
;113:	// FIXME: allow origin offsets along tag?
;114:	VectorCopy( parent->origin, entity->origin );
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
line 115
;115:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $106
line 116
;116:		VectorMA( entity->origin, lerped.origin[i], parent->axis[i], entity->origin );
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
line 117
;117:	}
LABELV $107
line 115
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $106
line 120
;118:
;119:	// had to cast away the const to avoid compiler problems...
;120:	MatrixMultiply( entity->axis, lerped.axis, tempAxis );
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
line 121
;121:	MatrixMultiply( tempAxis, ((refEntity_t *)parent)->axis, entity->axis );
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
line 122
;122:}
LABELV $105
endproc CG_PositionRotatedEntityOnTag 120 24
export CG_SetEntitySoundPosition
proc CG_SetEntitySoundPosition 24 8
line 141
;123:
;124:
;125:
;126:/*
;127:==========================================================================
;128:
;129:FUNCTIONS CALLED EACH FRAME
;130:
;131:==========================================================================
;132:*/
;133:
;134:/*
;135:======================
;136:CG_SetEntitySoundPosition
;137:
;138:Also called by event processing code
;139:======================
;140:*/
;141:void CG_SetEntitySoundPosition( centity_t *cent ) {
line 142
;142:	if ( cent->currentState.solid == SOLID_BMODEL ) {
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
NEI4 $112
line 146
;143:		vec3_t	origin;
;144:		float	*v;
;145:
;146:		v = cgs.inlineModelMidpoints[ cent->currentState.modelindex ];
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
line 147
;147:		VectorAdd( cent->lerpOrigin, v, origin );
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
CNSTI4 716
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
CNSTI4 720
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
CNSTI4 724
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 148
;148:		trap_S_UpdateEntityPosition( cent->currentState.number, origin );
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_S_UpdateEntityPosition
CALLV
pop
line 149
;149:	} else {
ADDRGP4 $113
JUMPV
LABELV $112
line 150
;150:		trap_S_UpdateEntityPosition( cent->currentState.number, cent->lerpOrigin );
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
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 trap_S_UpdateEntityPosition
CALLV
pop
line 151
;151:	}
LABELV $113
line 152
;152:}
LABELV $111
endproc CG_SetEntitySoundPosition 24 8
proc CG_EntityEffects 20 20
line 161
;153:
;154:/*
;155:==================
;156:CG_EntityEffects
;157:
;158:Add continuous entity effects, like local entity emission and lighting
;159:==================
;160:*/
;161:static void CG_EntityEffects( centity_t *cent ) {
line 164
;162:
;163:	// update sound origins
;164:	CG_SetEntitySoundPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetEntitySoundPosition
CALLV
pop
line 167
;165:
;166:	// add loop sound
;167:	if ( cent->currentState.loopSound ) {
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
CNSTI4 0
EQI4 $118
line 168
;168:		if (cent->currentState.eType != ET_SPEAKER) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 7
EQI4 $120
line 169
;169:			trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, 
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
CNSTI4 716
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
line 171
;170:				cgs.gameSounds[ cent->currentState.loopSound ] );
;171:		} else {
ADDRGP4 $121
JUMPV
LABELV $120
line 172
;172:			trap_S_AddRealLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, 
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
CNSTI4 716
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
line 174
;173:				cgs.gameSounds[ cent->currentState.loopSound ] );
;174:		}
LABELV $121
line 175
;175:	}
LABELV $118
line 179
;176:
;177:
;178:	// constant light glow
;179:	if ( cent->currentState.constantLight ) {
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 0
EQI4 $124
line 183
;180:		int		cl;
;181:		int		i, r, g, b;
;182:
;183:		cl = cent->currentState.constantLight;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ASGNI4
line 184
;184:		r = cl & 255;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 185
;185:		g = ( cl >> 8 ) & 255;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
ASGNI4
line 186
;186:		b = ( cl >> 16 ) & 255;
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 16
RSHI4
CNSTI4 255
BANDI4
ASGNI4
line 187
;187:		i = ( ( cl >> 24 ) & 255 ) * 4;
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
line 188
;188:		trap_R_AddLightToScene( cent->lerpOrigin, i, r, g, b );
ADDRFP4 0
INDIRP4
CNSTI4 716
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
line 189
;189:	}
LABELV $124
line 191
;190:
;191:}
LABELV $117
endproc CG_EntityEffects 20 20
proc CG_General 144 12
line 199
;192:
;193:
;194:/*
;195:==================
;196:CG_General
;197:==================
;198:*/
;199:static void CG_General( centity_t *cent ) {
line 203
;200:	refEntity_t			ent;
;201:	entityState_t		*s1;
;202:
;203:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 206
;204:
;205:	// if set to invisible, skip
;206:	if (!s1->modelindex) {
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 0
NEI4 $127
line 207
;207:		return;
ADDRGP4 $126
JUMPV
LABELV $127
line 210
;208:	}
;209:
;210:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 214
;211:
;212:	// set frame
;213:
;214:	ent.frame = s1->frame;
ADDRLP4 0+80
ADDRLP4 140
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
line 215
;215:	ent.oldframe = ent.frame;
ADDRLP4 0+96
ADDRLP4 0+80
INDIRI4
ASGNI4
line 216
;216:	ent.backlerp = 0;
ADDRLP4 0+100
CNSTF4 0
ASGNF4
line 218
;217:
;218:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 219
;219:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 221
;220:
;221:	ent.hModel = cgs.gameModels[s1->modelindex];
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
line 224
;222:
;223:	// player model
;224:	if (s1->number == cg.snap->ps.clientNum) {
ADDRLP4 140
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $137
line 225
;225:		ent.renderfx |= RF_THIRD_PERSON;	// only draw from mirrors
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 226
;226:	}
LABELV $137
line 229
;227:
;228:	// convert angles to axis
;229:	AnglesToAxis( cent->lerpAngles, ent.axis );
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 232
;230:
;231:	// add to refresh list
;232:	trap_R_AddRefEntityToScene (&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 233
;233:}
LABELV $126
endproc CG_General 144 12
proc CG_Speaker 16 16
line 242
;234:
;235:/*
;236:==================
;237:CG_Speaker
;238:
;239:Speaker entities can automatically play sounds
;240:==================
;241:*/
;242:static void CG_Speaker( centity_t *cent ) {
line 243
;243:	if ( ! cent->currentState.clientNum ) {	// FIXME: use something other than clientNum...
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 0
NEI4 $143
line 244
;244:		return;		// not auto triggering
ADDRGP4 $142
JUMPV
LABELV $143
line 247
;245:	}
;246:
;247:	if ( cg.time < cent->miscTime ) {
ADDRGP4 cg+109652
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
GEI4 $145
line 248
;248:		return;
ADDRGP4 $142
JUMPV
LABELV $145
line 251
;249:	}
;250:
;251:	trap_S_StartSound (NULL, cent->currentState.number, CHAN_ITEM, cgs.gameSounds[cent->currentState.eventParm] );
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
line 255
;252:
;253:	//	ent->s.frame = ent->wait * 10;
;254:	//	ent->s.clientNum = ent->random * 10;
;255:	cent->miscTime = cg.time + cent->currentState.frame * 100 + cent->currentState.clientNum * 100 * crandom();
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
CNSTI4 452
ADDP4
ADDRGP4 cg+109652
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
line 256
;256:}
LABELV $142
endproc CG_Speaker 16 16
proc CG_Item 212 12
line 263
;257:
;258:/*
;259:==================
;260:CG_Item
;261:==================
;262:*/
;263:static void CG_Item( centity_t *cent ) {
line 272
;264:	refEntity_t		ent;
;265:	entityState_t	*es;
;266:	gitem_t			*item;
;267:	int				msec;
;268:	float			frac;
;269:	float			scale;
;270:	weaponInfo_t	*wi;
;271:
;272:	es = &cent->currentState;
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
line 273
;273:	if ( es->modelindex >= bg_numItems ) {
ADDRLP4 144
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $151
line 274
;274:		CG_Error( "Bad item index %i on entity", es->modelindex );
ADDRGP4 $153
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
line 275
;275:	}
LABELV $151
line 278
;276:
;277:	// if set to invisible, skip
;278:	if ( !es->modelindex || ( es->eFlags & EF_NODRAW ) ) {
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
EQI4 $156
ADDRLP4 144
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 128
BANDI4
ADDRLP4 168
INDIRI4
EQI4 $154
LABELV $156
line 279
;279:		return;
ADDRGP4 $150
JUMPV
LABELV $154
line 282
;280:	}
;281:
;282:	item = &bg_itemlist[ es->modelindex ];
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
line 283
;283:	if ( cg_simpleItems.integer && item->giType != IT_TEAM ) {
ADDRGP4 cg_simpleItems+12
INDIRI4
CNSTI4 0
EQI4 $157
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
EQI4 $157
line 284
;284:		memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 285
;285:		ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 286
;286:		VectorCopy( cent->lerpOrigin, ent.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 287
;287:		ent.radius = 14;
ADDRLP4 0+132
CNSTF4 1096810496
ASGNF4
line 288
;288:		ent.customShader = cg_items[es->modelindex].icon;
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
line 289
;289:		ent.shaderRGBA[0] = 255;
ADDRLP4 0+116
CNSTU1 255
ASGNU1
line 290
;290:		ent.shaderRGBA[1] = 255;
ADDRLP4 0+116+1
CNSTU1 255
ASGNU1
line 291
;291:		ent.shaderRGBA[2] = 255;
ADDRLP4 0+116+2
CNSTU1 255
ASGNU1
line 292
;292:		ent.shaderRGBA[3] = 255;
ADDRLP4 0+116+3
CNSTU1 255
ASGNU1
line 293
;293:		trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 294
;294:		return;
ADDRGP4 $150
JUMPV
LABELV $157
line 298
;295:	}
;296:
;297:	// items bob up and down continuously
;298:	scale = 0.005 + cent->currentState.number * 0.00001;
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
line 299
;299:	cent->lerpOrigin[2] += 4 + cos( ( cg.time + 1000 ) *  scale ) * 4;
ADDRGP4 cg+109652
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
CNSTI4 724
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
line 301
;300:
;301:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 304
;302:
;303:	// autorotate at one of two speeds
;304:	if ( item->giType == IT_HEALTH ) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 4
NEI4 $172
line 305
;305:		VectorCopy( cg.autoAnglesFast, cent->lerpAngles );
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRGP4 cg+111056
INDIRB
ASGNB 12
line 306
;306:		AxisCopy( cg.autoAxisFast, ent.axis );
ADDRGP4 cg+111068
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AxisCopy
CALLV
pop
line 307
;307:	} else {
ADDRGP4 $173
JUMPV
LABELV $172
line 308
;308:		VectorCopy( cg.autoAngles, cent->lerpAngles );
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRGP4 cg+111008
INDIRB
ASGNB 12
line 309
;309:		AxisCopy( cg.autoAxis, ent.axis );
ADDRGP4 cg+111020
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AxisCopy
CALLV
pop
line 310
;310:	}
LABELV $173
line 312
;311:
;312:	wi = NULL;
ADDRLP4 152
CNSTP4 0
ASGNP4
line 316
;313:	// the weapons have their origin where they attatch to player
;314:	// models, so we need to offset them or they will rotate
;315:	// eccentricly
;316:	if ( item->giType == IT_WEAPON ) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $180
line 317
;317:		wi = &cg_weapons[item->giTag];
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
line 318
;318:		cent->lerpOrigin[0] -= 
ADDRLP4 180
ADDRFP4 0
INDIRP4
CNSTI4 716
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
line 322
;319:			wi->weaponMidpoint[0] * ent.axis[0][0] +
;320:			wi->weaponMidpoint[1] * ent.axis[1][0] +
;321:			wi->weaponMidpoint[2] * ent.axis[2][0];
;322:		cent->lerpOrigin[1] -= 
ADDRLP4 188
ADDRFP4 0
INDIRP4
CNSTI4 720
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
line 326
;323:			wi->weaponMidpoint[0] * ent.axis[0][1] +
;324:			wi->weaponMidpoint[1] * ent.axis[1][1] +
;325:			wi->weaponMidpoint[2] * ent.axis[2][1];
;326:		cent->lerpOrigin[2] -= 
ADDRLP4 196
ADDRFP4 0
INDIRP4
CNSTI4 724
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
line 331
;327:			wi->weaponMidpoint[0] * ent.axis[0][2] +
;328:			wi->weaponMidpoint[1] * ent.axis[1][2] +
;329:			wi->weaponMidpoint[2] * ent.axis[2][2];
;330:
;331:		cent->lerpOrigin[2] += 8;	// an extra height boost
ADDRLP4 204
ADDRFP4 0
INDIRP4
CNSTI4 724
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
line 332
;332:	}
LABELV $180
line 334
;333:
;334:	ent.hModel = cg_items[es->modelindex].models[0];
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
line 336
;335:
;336:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 337
;337:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 339
;338:
;339:	ent.nonNormalizedAxes = qfalse;
ADDRLP4 0+64
CNSTI4 0
ASGNI4
line 342
;340:
;341:	// if just respawned, slowly scale up
;342:	msec = cg.time - cent->miscTime;
ADDRLP4 156
ADDRGP4 cg+109652
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
SUBI4
ASGNI4
line 343
;343:	if ( msec >= 0 && msec < ITEM_SCALEUP_TIME ) {
ADDRLP4 156
INDIRI4
CNSTI4 0
LTI4 $209
ADDRLP4 156
INDIRI4
CNSTI4 1000
GEI4 $209
line 344
;344:		frac = (float)msec / ITEM_SCALEUP_TIME;
ADDRLP4 148
ADDRLP4 156
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ASGNF4
line 345
;345:		VectorScale( ent.axis[0], frac, ent.axis[0] );
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
line 346
;346:		VectorScale( ent.axis[1], frac, ent.axis[1] );
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
line 347
;347:		VectorScale( ent.axis[2], frac, ent.axis[2] );
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
line 348
;348:		ent.nonNormalizedAxes = qtrue;
ADDRLP4 0+64
CNSTI4 1
ASGNI4
line 349
;349:	} else {
ADDRGP4 $210
JUMPV
LABELV $209
line 350
;350:		frac = 1.0;
ADDRLP4 148
CNSTF4 1065353216
ASGNF4
line 351
;351:	}
LABELV $210
line 355
;352:
;353:	// items without glow textures need to keep a minimum light value
;354:	// so they are always visible
;355:	if ( ( item->giType == IT_WEAPON ) ||
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
EQI4 $256
ADDRLP4 184
INDIRI4
CNSTI4 3
NEI4 $254
LABELV $256
line 356
;356:		 ( item->giType == IT_ARMOR ) ) {
line 357
;357:		ent.renderfx |= RF_MINLIGHT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 358
;358:	}
LABELV $254
line 361
;359:
;360:	// increase the size of the weapons when they are presented as items
;361:	if ( item->giType == IT_WEAPON ) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $258
line 362
;362:		VectorScale( ent.axis[0], 1.5, ent.axis[0] );
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
line 363
;363:		VectorScale( ent.axis[1], 1.5, ent.axis[1] );
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
line 364
;364:		VectorScale( ent.axis[2], 1.5, ent.axis[2] );
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
line 365
;365:		ent.nonNormalizedAxes = qtrue;
ADDRLP4 0+64
CNSTI4 1
ASGNI4
line 369
;366:#ifdef MISSIONPACK
;367:		trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, cgs.media.weaponHoverSound );
;368:#endif
;369:	}
LABELV $258
line 381
;370:
;371:#ifdef MISSIONPACK
;372:	if ( item->giType == IT_HOLDABLE && item->giTag == HI_KAMIKAZE ) {
;373:		VectorScale( ent.axis[0], 2, ent.axis[0] );
;374:		VectorScale( ent.axis[1], 2, ent.axis[1] );
;375:		VectorScale( ent.axis[2], 2, ent.axis[2] );
;376:		ent.nonNormalizedAxes = qtrue;
;377:	}
;378:#endif
;379:
;380:	// add to refresh list
;381:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 405
;382:
;383:#ifdef MISSIONPACK
;384:	if ( item->giType == IT_WEAPON && wi->barrelModel ) {
;385:		refEntity_t	barrel;
;386:
;387:		memset( &barrel, 0, sizeof( barrel ) );
;388:
;389:		barrel.hModel = wi->barrelModel;
;390:
;391:		VectorCopy( ent.lightingOrigin, barrel.lightingOrigin );
;392:		barrel.shadowPlane = ent.shadowPlane;
;393:		barrel.renderfx = ent.renderfx;
;394:
;395:		CG_PositionRotatedEntityOnTag( &barrel, &ent, wi->weaponModel, "tag_barrel" );
;396:
;397:		AxisCopy( ent.axis, barrel.axis );
;398:		barrel.nonNormalizedAxes = ent.nonNormalizedAxes;
;399:
;400:		trap_R_AddRefEntityToScene( &barrel );
;401:	}
;402:#endif
;403:
;404:	// accompanying rings / spheres for powerups
;405:	if ( !cg_simpleItems.integer ) 
ADDRGP4 cg_simpleItems+12
INDIRI4
CNSTI4 0
NEI4 $303
line 406
;406:	{
line 409
;407:		vec3_t spinAngles;
;408:
;409:		VectorClear( spinAngles );
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
line 411
;410:
;411:		if ( item->giType == IT_HEALTH || item->giType == IT_POWERUP )
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
EQI4 $310
ADDRLP4 204
INDIRI4
CNSTI4 5
NEI4 $308
LABELV $310
line 412
;412:		{
line 413
;413:			if ( ( ent.hModel = cg_items[es->modelindex].models[1] ) != 0 )
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
EQI4 $311
line 414
;414:			{
line 415
;415:				if ( item->giType == IT_POWERUP )
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $316
line 416
;416:				{
line 417
;417:					ent.origin[2] += 12;
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
CNSTF4 1094713344
ADDF4
ASGNF4
line 418
;418:					spinAngles[1] = ( cg.time & 1023 ) * 360 / -1024.0f;
ADDRLP4 188+4
CNSTI4 360
ADDRGP4 cg+109652
INDIRI4
CNSTI4 1023
BANDI4
MULI4
CVIF4 4
CNSTF4 3296722944
DIVF4
ASGNF4
line 419
;419:				}
LABELV $316
line 420
;420:				AnglesToAxis( spinAngles, ent.axis );
ADDRLP4 188
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 423
;421:				
;422:				// scale up if respawning
;423:				if ( frac != 1.0 ) {
ADDRLP4 148
INDIRF4
CNSTF4 1065353216
EQF4 $323
line 424
;424:					VectorScale( ent.axis[0], frac, ent.axis[0] );
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
line 425
;425:					VectorScale( ent.axis[1], frac, ent.axis[1] );
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
line 426
;426:					VectorScale( ent.axis[2], frac, ent.axis[2] );
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
line 427
;427:					ent.nonNormalizedAxes = qtrue;
ADDRLP4 0+64
CNSTI4 1
ASGNI4
line 428
;428:				}
LABELV $323
line 429
;429:				trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 430
;430:			}
LABELV $311
line 431
;431:		}
LABELV $308
line 432
;432:	}
LABELV $303
line 433
;433:}
LABELV $150
endproc CG_Item 212 12
proc CG_Missile 164 20
line 442
;434:
;435://============================================================================
;436:
;437:/*
;438:===============
;439:CG_Missile
;440:===============
;441:*/
;442:static void CG_Missile( centity_t *cent ) {
line 448
;443:	refEntity_t			ent;
;444:	entityState_t		*s1;
;445:	const weaponInfo_t		*weapon;
;446://	int	col;
;447:
;448:	s1 = &cent->currentState;
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
line 449
;449:	if ( s1->weapon > WP_NUM_WEAPONS ) {
ADDRLP4 144
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 12
LEI4 $369
line 450
;450:		s1->weapon = 0;
ADDRLP4 144
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 451
;451:	}
LABELV $369
line 452
;452:	weapon = &cg_weapons[s1->weapon];
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
line 455
;453:
;454:	// calculate the axis
;455:	VectorCopy( s1->angles, cent->lerpAngles);
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRLP4 144
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 458
;456:
;457:	// add trails
;458:	if ( weapon->missileTrailFunc ) 
ADDRLP4 140
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $371
line 459
;459:	{
line 460
;460:		weapon->missileTrailFunc( cent, weapon );
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
line 461
;461:	}
LABELV $371
line 480
;462:/*
;463:	if ( cent->currentState.modelindex == TEAM_RED ) {
;464:		col = 1;
;465:	}
;466:	else if ( cent->currentState.modelindex == TEAM_BLUE ) {
;467:		col = 2;
;468:	}
;469:	else {
;470:		col = 0;
;471:	}
;472:
;473:	// add dynamic light
;474:	if ( weapon->missileDlight ) {
;475:		trap_R_AddLightToScene(cent->lerpOrigin, weapon->missileDlight, 
;476:			weapon->missileDlightColor[col][0], weapon->missileDlightColor[col][1], weapon->missileDlightColor[col][2] );
;477:	}
;478:*/
;479:	// add dynamic light
;480:	if ( weapon->missileDlight ) {
ADDRLP4 140
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
CNSTF4 0
EQF4 $373
line 481
;481:		trap_R_AddLightToScene(cent->lerpOrigin, weapon->missileDlight, 
ADDRFP4 0
INDIRP4
CNSTI4 716
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
line 483
;482:			weapon->missileDlightColor[0], weapon->missileDlightColor[1], weapon->missileDlightColor[2] );
;483:	}
LABELV $373
line 486
;484:
;485:	// add missile sound
;486:	if ( weapon->missileSound ) {
ADDRLP4 140
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 0
EQI4 $375
line 489
;487:		vec3_t	velocity;
;488:
;489:		BG_EvaluateTrajectoryDelta( &cent->currentState.pos, cg.time, velocity );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+109652
INDIRI4
ARGI4
ADDRLP4 148
ARGP4
ADDRGP4 BG_EvaluateTrajectoryDelta
CALLV
pop
line 491
;490:
;491:		trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, velocity, weapon->missileSound );
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
CNSTI4 716
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
line 492
;492:	}
LABELV $375
line 495
;493:
;494:	// create the render entity
;495:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 496
;496:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 497
;497:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 511
;498:
;499:	/* Maybe?
;500:	if ( cent->currentState.weapon == WP_PLASMAGUN ) {
;501:		ent.reType = RT_SPRITE;
;502:		ent.radius = 16;
;503:		ent.rotation = 0;
;504:		ent.customShader = cgs.media.plasmaBallShader;
;505:		trap_R_AddRefEntityToScene( &ent );
;506:		return;
;507:	}
;508:	*/
;509:
;510:		// Shafe - Trep - turret // Machine Gun
;511:	if (cent->currentState.weapon == WP_MACHINEGUN ) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 2
NEI4 $380
line 512
;512:		ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 513
;513:		if (cent->currentState.eFlags & EF_ALT_FIRING)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $382
line 514
;514:		{
line 515
;515:			ent.radius = 6;
ADDRLP4 0+132
CNSTF4 1086324736
ASGNF4
line 516
;516:		} 
ADDRGP4 $383
JUMPV
LABELV $382
line 518
;517:		else
;518:		{
line 519
;519:			ent.radius = 3;
ADDRLP4 0+132
CNSTF4 1077936128
ASGNF4
line 520
;520:		}
LABELV $383
line 522
;521:
;522:		ent.rotation = 0;
ADDRLP4 0+136
CNSTF4 0
ASGNF4
line 523
;523:		ent.customShader = cgs.media.turretFireShader;
ADDRLP4 0+112
ADDRGP4 cgs+154388+524
INDIRI4
ASGNI4
line 524
;524:		trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 525
;525:		return;
ADDRGP4 $368
JUMPV
LABELV $380
line 529
;526:	} // End Shafe
;527:
;528:	// Shafe - Trep - turret // Machine Gun
;529:	if (cent->currentState.weapon == WP_TURRET ) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 11
NEI4 $390
line 530
;530:		ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 531
;531:		if (cent->currentState.eFlags & EF_ALT_FIRING)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $392
line 532
;532:		{
line 533
;533:			ent.radius = 5;
ADDRLP4 0+132
CNSTF4 1084227584
ASGNF4
line 534
;534:		} 
ADDRGP4 $393
JUMPV
LABELV $392
line 536
;535:		else
;536:		{
line 537
;537:			ent.radius = 3;
ADDRLP4 0+132
CNSTF4 1077936128
ASGNF4
line 538
;538:		}
LABELV $393
line 540
;539:
;540:		ent.rotation = 0;
ADDRLP4 0+136
CNSTF4 0
ASGNF4
line 541
;541:		ent.customShader = cgs.media.turretFireShader;
ADDRLP4 0+112
ADDRGP4 cgs+154388+524
INDIRI4
ASGNI4
line 542
;542:		trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 543
;543:		return;
ADDRGP4 $368
JUMPV
LABELV $390
line 547
;544:	} // End Shafe
;545:
;546:	// Shafe - Trep - Flame Thrower
;547:	if (cent->currentState.weapon == WP_LIGHTNING ) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 6
NEI4 $400
line 548
;548:		ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 549
;549:		ent.radius = 32;
ADDRLP4 0+132
CNSTF4 1107296256
ASGNF4
line 550
;550:		ent.rotation = 0;
ADDRLP4 0+136
CNSTF4 0
ASGNF4
line 551
;551:		ent.customShader = cgs.media.flameBallShader;
ADDRLP4 0+112
ADDRGP4 cgs+154388+512
INDIRI4
ASGNI4
line 552
;552:		trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 553
;553:		return;
ADDRGP4 $368
JUMPV
LABELV $400
line 557
;554:	} // End Shafe
;555:
;556:	// Shafe - Trep - Devastator
;557:	if (cent->currentState.weapon == WP_BFG ) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 9
NEI4 $407
line 558
;558:		ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 560
;559:		//ent.radius = 10;
;560:		ent.rotation = 0;
ADDRLP4 0+136
CNSTF4 0
ASGNF4
line 561
;561:		ent.customShader = cgs.media.bfgBallShader;
ADDRLP4 0+112
ADDRGP4 cgs+154388+520
INDIRI4
ASGNI4
line 562
;562:		if (cent->currentState.eFlags & EF_ALT_FIRING)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $413
line 563
;563:		{
line 564
;564:			ent.radius = 10;
ADDRLP4 0+132
CNSTF4 1092616192
ASGNF4
line 565
;565:		} 
ADDRGP4 $414
JUMPV
LABELV $413
line 567
;566:		else
;567:		{
line 568
;568:			ent.radius = 5;
ADDRLP4 0+132
CNSTF4 1084227584
ASGNF4
line 569
;569:		}
LABELV $414
line 570
;570:		trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 571
;571:		return;
ADDRGP4 $368
JUMPV
LABELV $407
line 575
;572:	} // End Shafe
;573:
;574:	// flicker between two skins
;575:	ent.skinNum = cg.clientFrame & 1;
ADDRLP4 0+104
ADDRGP4 cg
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 576
;576:	ent.hModel = weapon->missileModel;
ADDRLP4 0+8
ADDRLP4 140
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ASGNI4
line 577
;577:	ent.renderfx = weapon->missileRenderfx; // | RF_NOSHADOW;
ADDRLP4 0+4
ADDRLP4 140
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 588
;578:
;579:#ifdef MISSIONPACK
;580:	if ( cent->currentState.weapon == WP_PROX_LAUNCHER ) {
;581:		if (s1->generic1 == TEAM_BLUE) {
;582:			ent.hModel = cgs.media.blueProxMine;
;583:		}
;584:	}
;585:#endif
;586:
;587:	// convert direction of travel into axis
;588:	if ( VectorNormalize2( s1->pos.trDelta, ent.axis[0] ) == 0 ) {
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
NEF4 $420
line 589
;589:		ent.axis[0][2] = 1;
ADDRLP4 0+28+8
CNSTF4 1065353216
ASGNF4
line 590
;590:	}
LABELV $420
line 593
;591:
;592:	// spin as it moves
;593:	if ( s1->pos.trType != TR_STATIONARY ) {
ADDRLP4 144
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $425
line 594
;594:		RotateAroundDirection( ent.axis, cg.time / 4 );
ADDRLP4 0+28
ARGP4
ADDRGP4 cg+109652
INDIRI4
CNSTI4 4
DIVI4
CVIF4 4
ARGF4
ADDRGP4 RotateAroundDirection
CALLV
pop
line 595
;595:	} else {
ADDRGP4 $426
JUMPV
LABELV $425
line 602
;596:#ifdef MISSIONPACK
;597:		if ( s1->weapon == WP_PROX_LAUNCHER ) {
;598:			AnglesToAxis( cent->lerpAngles, ent.axis );
;599:		}
;600:		else
;601:#endif
;602:		{
line 603
;603:			RotateAroundDirection( ent.axis, s1->time );
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
line 604
;604:		}
line 605
;605:	}
LABELV $426
line 608
;606:
;607:	// add to refresh list, possibly with quad glow
;608:	CG_AddRefEntityWithPowerups( &ent, s1, TEAM_FREE, cent );
ADDRLP4 0
ARGP4
ADDRLP4 144
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddRefEntityWithPowerups
CALLV
pop
line 609
;609:}
LABELV $368
endproc CG_Missile 164 20
proc CG_Grapple 152 12
line 618
;610:
;611:/*
;612:===============
;613:CG_Grapple
;614:
;615:This is called when the grapple is sitting up against the wall
;616:===============
;617:*/
;618:static void CG_Grapple( centity_t *cent ) {
line 623
;619:	refEntity_t			ent;
;620:	entityState_t		*s1;
;621:	const weaponInfo_t		*weapon;
;622:
;623:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 624
;624:	if ( s1->weapon > WP_NUM_WEAPONS ) {
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 12
LEI4 $431
line 625
;625:		s1->weapon = 0;
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 626
;626:	}
LABELV $431
line 627
;627:	weapon = &cg_weapons[s1->weapon];
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
line 630
;628:
;629:	// calculate the axis
;630:	VectorCopy( s1->angles, cent->lerpAngles);
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRLP4 140
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 640
;631:
;632:#if 0 // FIXME add grapple pull sound here..?
;633:	// add missile sound
;634:	if ( weapon->missileSound ) {
;635:		trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, weapon->missileSound );
;636:	}
;637:#endif
;638:
;639:	// Will draw cable if needed
;640:	CG_GrappleTrail ( cent, weapon );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRGP4 CG_GrappleTrail
CALLV
pop
line 643
;641:
;642:	// create the render entity
;643:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 644
;644:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 645
;645:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 648
;646:
;647:	// flicker between two skins
;648:	ent.skinNum = cg.clientFrame & 1;
ADDRLP4 0+104
ADDRGP4 cg
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 649
;649:	ent.hModel = weapon->missileModel;
ADDRLP4 0+8
ADDRLP4 144
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ASGNI4
line 650
;650:	ent.renderfx = weapon->missileRenderfx | RF_NOSHADOW;
ADDRLP4 0+4
ADDRLP4 144
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 653
;651:
;652:	// convert direction of travel into axis
;653:	if ( VectorNormalize2( s1->pos.trDelta, ent.axis[0] ) == 0 ) {
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
NEF4 $438
line 654
;654:		ent.axis[0][2] = 1;
ADDRLP4 0+28+8
CNSTF4 1065353216
ASGNF4
line 655
;655:	}
LABELV $438
line 657
;656:
;657:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 658
;658:}
LABELV $430
endproc CG_Grapple 152 12
proc CG_Mover 144 12
line 665
;659:
;660:/*
;661:===============
;662:CG_Mover
;663:===============
;664:*/
;665:static void CG_Mover( centity_t *cent ) {
line 669
;666:	refEntity_t			ent;
;667:	entityState_t		*s1;
;668:
;669:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 672
;670:
;671:	// create the render entity
;672:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 673
;673:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 674
;674:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 675
;675:	AnglesToAxis( cent->lerpAngles, ent.axis );
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 677
;676:
;677:	ent.renderfx = RF_NOSHADOW;
ADDRLP4 0+4
CNSTI4 64
ASGNI4
line 680
;678:
;679:	// flicker between two skins (FIXME?)
;680:	ent.skinNum = ( cg.time >> 6 ) & 1;
ADDRLP4 0+104
ADDRGP4 cg+109652
INDIRI4
CNSTI4 6
RSHI4
CNSTI4 1
BANDI4
ASGNI4
line 683
;681:
;682:	// get the model, either as a bmodel or a modelindex
;683:	if ( s1->solid == SOLID_BMODEL ) {
ADDRLP4 140
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
NEI4 $450
line 684
;684:		ent.hModel = cgs.inlineDrawModel[s1->modelindex];
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
line 685
;685:	} else {
ADDRGP4 $451
JUMPV
LABELV $450
line 686
;686:		ent.hModel = cgs.gameModels[s1->modelindex];
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
line 687
;687:	}
LABELV $451
line 690
;688:
;689:	// add to refresh list
;690:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 693
;691:
;692:	// add the secondary model
;693:	if ( s1->modelindex2 ) {
ADDRLP4 140
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 0
EQI4 $456
line 694
;694:		ent.skinNum = 0;
ADDRLP4 0+104
CNSTI4 0
ASGNI4
line 695
;695:		ent.hModel = cgs.gameModels[s1->modelindex2];
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
line 696
;696:		trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 697
;697:	}
LABELV $456
line 699
;698:
;699:}
LABELV $443
endproc CG_Mover 144 12
export CG_Beam
proc CG_Beam 144 12
line 708
;700:
;701:/*
;702:===============
;703:CG_Beam
;704:
;705:Also called as an event
;706:===============
;707:*/
;708:void CG_Beam( centity_t *cent ) {
line 712
;709:	refEntity_t			ent;
;710:	entityState_t		*s1;
;711:
;712:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 715
;713:
;714:	// create the render entity
;715:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 716
;716:	VectorCopy( s1->pos.trBase, ent.origin );
ADDRLP4 0+68
ADDRLP4 140
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 717
;717:	VectorCopy( s1->origin2, ent.oldorigin );
ADDRLP4 0+84
ADDRLP4 140
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 718
;718:	AxisClear( ent.axis );
ADDRLP4 0+28
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 719
;719:	ent.reType = RT_BEAM;
ADDRLP4 0
CNSTI4 3
ASGNI4
line 721
;720:
;721:	ent.renderfx = RF_NOSHADOW;
ADDRLP4 0+4
CNSTI4 64
ASGNI4
line 724
;722:
;723:	// add to refresh list
;724:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 725
;725:}
LABELV $461
endproc CG_Beam 144 12
proc CG_Portal 144 12
line 733
;726:
;727:
;728:/*
;729:===============
;730:CG_Portal
;731:===============
;732:*/
;733:static void CG_Portal( centity_t *cent ) {
line 737
;734:	refEntity_t			ent;
;735:	entityState_t		*s1;
;736:
;737:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 740
;738:
;739:	// create the render entity
;740:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 741
;741:	VectorCopy( cent->lerpOrigin, ent.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 742
;742:	VectorCopy( s1->origin2, ent.oldorigin );
ADDRLP4 0+84
ADDRLP4 140
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 743
;743:	ByteToDir( s1->eventParm, ent.axis[0] );
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
line 744
;744:	PerpendicularVector( ent.axis[1], ent.axis[0] );
ADDRLP4 0+28+12
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 748
;745:
;746:	// negating this tends to get the directions like they want
;747:	// we really should have a camera roll value
;748:	VectorSubtract( vec3_origin, ent.axis[1], ent.axis[1] );
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
line 750
;749:
;750:	CrossProduct( ent.axis[0], ent.axis[1], ent.axis[2] );
ADDRLP4 0+28
ARGP4
ADDRLP4 0+28+12
ARGP4
ADDRLP4 0+28+24
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 751
;751:	ent.reType = RT_PORTALSURFACE;
ADDRLP4 0
CNSTI4 7
ASGNI4
line 752
;752:	ent.oldframe = s1->powerups;
ADDRLP4 0+96
ADDRLP4 140
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 753
;753:	ent.frame = s1->frame;		// rotation speed
ADDRLP4 0+80
ADDRLP4 140
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
line 754
;754:	ent.skinNum = s1->clientNum/256.0 * 360;	// roll offset
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
line 757
;755:
;756:	// add to refresh list
;757:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 758
;758:}
LABELV $466
endproc CG_Portal 144 12
export CG_AdjustPositionForMover
proc CG_AdjustPositionForMover 92 12
line 768
;759:
;760:
;761:/*
;762:=========================
;763:CG_AdjustPositionForMover
;764:
;765:Also called by client movement prediction code
;766:=========================
;767:*/
;768:void CG_AdjustPositionForMover( const vec3_t in, int moverNum, int fromTime, int toTime, vec3_t out ) {
line 773
;769:	centity_t	*cent;
;770:	vec3_t	oldOrigin, origin, deltaOrigin;
;771:	vec3_t	oldAngles, angles, deltaAngles;
;772:
;773:	if ( moverNum <= 0 || moverNum >= ENTITYNUM_MAX_NORMAL ) {
ADDRLP4 76
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
LEI4 $502
ADDRLP4 76
INDIRI4
CNSTI4 1022
LTI4 $500
LABELV $502
line 774
;774:		VectorCopy( in, out );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 775
;775:		return;
ADDRGP4 $499
JUMPV
LABELV $500
line 778
;776:	}
;777:
;778:	cent = &cg_entities[ moverNum ];
ADDRLP4 0
CNSTI4 740
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 779
;779:	if ( cent->currentState.eType != ET_MOVER ) {
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
EQI4 $503
line 780
;780:		VectorCopy( in, out );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 781
;781:		return;
ADDRGP4 $499
JUMPV
LABELV $503
line 784
;782:	}
;783:
;784:	BG_EvaluateTrajectory( &cent->currentState.pos, fromTime, oldOrigin );
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
line 785
;785:	BG_EvaluateTrajectory( &cent->currentState.apos, fromTime, oldAngles );
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
line 787
;786:
;787:	BG_EvaluateTrajectory( &cent->currentState.pos, toTime, origin );
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
line 788
;788:	BG_EvaluateTrajectory( &cent->currentState.apos, toTime, angles );
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
line 790
;789:
;790:	VectorSubtract( origin, oldOrigin, deltaOrigin );
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
line 791
;791:	VectorSubtract( angles, oldAngles, deltaAngles );
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
line 793
;792:
;793:	VectorAdd( in, deltaOrigin, out );
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
line 796
;794:
;795:	// FIXME: origin change when on a rotating object
;796:}
LABELV $499
endproc CG_AdjustPositionForMover 92 12
proc CG_InterpolateEntityPosition 44 12
line 804
;797:
;798:
;799:/*
;800:=============================
;801:CG_InterpolateEntityPosition
;802:=============================
;803:*/
;804:static void CG_InterpolateEntityPosition( centity_t *cent ) {
line 810
;805:	vec3_t		current, next;
;806:	float		f;
;807:
;808:	// it would be an internal error to find an entity that interpolates without
;809:	// a snapshot ahead of the current one
;810:	if ( cg.nextSnap == NULL ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $520
line 811
;811:		CG_Error( "CG_InterpoateEntityPosition: cg.nextSnap == NULL" );
ADDRGP4 $523
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 812
;812:	}
LABELV $520
line 814
;813:
;814:	f = cg.frameInterpolation;
ADDRLP4 24
ADDRGP4 cg+109636
INDIRF4
ASGNF4
line 819
;815:	//CG_Printf("interpolation fraction: %.2f\n", cg.frameInterpolation);
;816:
;817:	// this will linearize a sine or parabolic curve, but it is important
;818:	// to not extrapolate player positions if more recent data is available
;819:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.snap->serverTime, current );
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
line 820
;820:	BG_EvaluateTrajectory( &cent->nextState.pos, cg.nextSnap->serverTime, next );
ADDRFP4 0
INDIRP4
CNSTI4 224
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
line 822
;821:
;822:	cent->lerpOrigin[0] = current[0] + f * ( next[0] - current[0] );
ADDRLP4 28
ADDRLP4 0
INDIRF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 716
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
line 823
;823:	cent->lerpOrigin[1] = current[1] + f * ( next[1] - current[1] );
ADDRFP4 0
INDIRP4
CNSTI4 720
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
line 824
;824:	cent->lerpOrigin[2] = current[2] + f * ( next[2] - current[2] );
ADDRFP4 0
INDIRP4
CNSTI4 724
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
line 826
;825:
;826:	BG_EvaluateTrajectory( &cent->currentState.apos, cg.snap->serverTime, current );
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
line 827
;827:	BG_EvaluateTrajectory( &cent->nextState.apos, cg.nextSnap->serverTime, next );
ADDRFP4 0
INDIRP4
CNSTI4 260
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
line 829
;828:
;829:	cent->lerpAngles[0] = LerpAngle( current[0], next[0], f );
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
CNSTI4 728
ADDP4
ADDRLP4 32
INDIRF4
ASGNF4
line 830
;830:	cent->lerpAngles[1] = LerpAngle( current[1], next[1], f );
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
CNSTI4 732
ADDP4
ADDRLP4 36
INDIRF4
ASGNF4
line 831
;831:	cent->lerpAngles[2] = LerpAngle( current[2], next[2], f );
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
CNSTI4 736
ADDP4
ADDRLP4 40
INDIRF4
ASGNF4
line 832
;832:}
LABELV $519
endproc CG_InterpolateEntityPosition 44 12
proc CG_CalcEntityLerpPositions 120 28
line 840
;833:
;834:/*
;835:===============
;836:CG_CalcEntityLerpPositions
;837:
;838:===============
;839:*/
;840:static void CG_CalcEntityLerpPositions( centity_t *cent ) {
line 843
;841://unlagged - projectile nudge
;842:	// this will be set to how far forward projectiles will be extrapolated
;843:	int timeshift = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 861
;844://unlagged - projectile nudge
;845:
;846://unlagged - smooth clients #2
;847:	// this is done server-side now - cg_smoothClients is undefined
;848:	// players will always be TR_INTERPOLATE
;849:/*
;850:	// if this player does not want to see extrapolated players
;851:	if ( !cg_smoothClients.integer ) {
;852:		// make sure the clients use TR_INTERPOLATE
;853:		if ( cent->currentState.number < MAX_CLIENTS ) {
;854:			cent->currentState.pos.trType = TR_INTERPOLATE;
;855:			cent->nextState.pos.trType = TR_INTERPOLATE;
;856:		}
;857:	}
;858:*/
;859://unlagged - smooth clients #2
;860:
;861:	if ( cent->interpolate && cent->currentState.pos.trType == TR_INTERPOLATE ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 0
EQI4 $540
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
NEI4 $540
line 862
;862:		CG_InterpolateEntityPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_InterpolateEntityPosition
CALLV
pop
line 863
;863:		return;
ADDRGP4 $539
JUMPV
LABELV $540
line 868
;864:	}
;865:
;866:	// first see if we can interpolate between two snaps for
;867:	// linear extrapolated clients
;868:	if ( cent->interpolate && cent->currentState.pos.trType == TR_LINEAR_STOP &&
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 0
EQI4 $542
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 3
NEI4 $542
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 64
GEI4 $542
line 869
;869:			cent->currentState.number < MAX_CLIENTS) {
line 870
;870:		CG_InterpolateEntityPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_InterpolateEntityPosition
CALLV
pop
line 871
;871:		return;
ADDRGP4 $539
JUMPV
LABELV $542
line 878
;872:	}
;873:
;874://unlagged - timenudge extrapolation
;875:	// interpolating failed (probably no nextSnap), so extrapolate
;876:	// this can also happen if the teleport bit is flipped, but that
;877:	// won't be noticeable
;878:	if ( cent->currentState.number < MAX_CLIENTS &&
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 64
GEI4 $544
ADDRLP4 12
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
EQI4 $544
line 879
;879:			cent->currentState.clientNum != cg.predictedPlayerState.clientNum ) {
line 880
;880:		cent->currentState.pos.trType = TR_LINEAR_STOP;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 3
ASGNI4
line 881
;881:		cent->currentState.pos.trTime = cg.snap->serverTime;
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
line 882
;882:		cent->currentState.pos.trDuration = 1000 / sv_fps.integer;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 1000
ADDRGP4 sv_fps+12
INDIRI4
DIVI4
ASGNI4
line 883
;883:	}
LABELV $544
line 888
;884://unlagged - timenudge extrapolation
;885:
;886://unlagged - projectile nudge
;887:	// if it's a missile but not a grappling hook
;888:	if ( cent->currentState.eType == ET_MISSILE && cent->currentState.weapon != WP_GRAPPLING_HOOK ) {
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
NEI4 $550
ADDRLP4 16
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 10
EQI4 $550
line 890
;889:		// if it's one of ours
;890:		if ( cent->currentState.otherEntityNum == cg.clientNum ) {
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ADDRGP4 cg+4
INDIRI4
NEI4 $552
line 894
;891:			// extrapolate one server frame's worth - this will correct for tiny
;892:			// visual inconsistencies introduced by backward-reconciling all players
;893:			// one server frame before running projectiles
;894:			timeshift = 1000 / sv_fps.integer;
ADDRLP4 0
CNSTI4 1000
ADDRGP4 sv_fps+12
INDIRI4
DIVI4
ASGNI4
line 895
;895:		}
ADDRGP4 $553
JUMPV
LABELV $552
line 897
;896:		// if it's not, and it's not a grenade launcher
;897:		else if ( cent->currentState.weapon != WP_GRENADE_LAUNCHER ) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 4
EQI4 $556
line 899
;898:			// extrapolate based on cg_projectileNudge
;899:			timeshift = cg_projectileNudge.integer + 1000 / sv_fps.integer;
ADDRLP4 0
ADDRGP4 cg_projectileNudge+12
INDIRI4
CNSTI4 1000
ADDRGP4 sv_fps+12
INDIRI4
DIVI4
ADDI4
ASGNI4
line 900
;900:		}
LABELV $556
LABELV $553
line 901
;901:	}
LABELV $550
line 906
;902:
;903:	// just use the current frame and evaluate as best we can
;904://	BG_EvaluateTrajectory( &cent->currentState.pos, cg.time, cent->lerpOrigin );
;905://	BG_EvaluateTrajectory( &cent->currentState.apos, cg.time, cent->lerpAngles );
;906:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.time + timeshift, cent->lerpOrigin );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+109652
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ARGI4
ADDRLP4 20
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 907
;907:	BG_EvaluateTrajectory( &cent->currentState.apos, cg.time + timeshift, cent->lerpAngles );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRGP4 cg+109652
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ARGI4
ADDRLP4 24
INDIRP4
CNSTI4 728
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 910
;908:
;909:	// if there's a time shift
;910:	if ( timeshift != 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $562
line 914
;911:		trace_t tr;
;912:		vec3_t lastOrigin;
;913:
;914:		BG_EvaluateTrajectory( &cent->currentState.pos, cg.time, lastOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+109652
INDIRI4
ARGI4
ADDRLP4 28
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 916
;915:
;916:		CG_Trace( &tr, lastOrigin, vec3_origin, vec3_origin, cent->lerpOrigin, cent->currentState.number, MASK_SHOT );
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
CNSTI4 716
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
line 919
;917:
;918:		// don't let the projectile go through the floor
;919:		if ( tr.fraction < 1.0f ) {
ADDRLP4 40+8
INDIRF4
CNSTF4 1065353216
GEF4 $565
line 920
;920:			cent->lerpOrigin[0] = lastOrigin[0] + tr.fraction * ( cent->lerpOrigin[0] - lastOrigin[0] );
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 716
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
line 921
;921:			cent->lerpOrigin[1] = lastOrigin[1] + tr.fraction * ( cent->lerpOrigin[1] - lastOrigin[1] );
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 720
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
line 922
;922:			cent->lerpOrigin[2] = lastOrigin[2] + tr.fraction * ( cent->lerpOrigin[2] - lastOrigin[2] );
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 724
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
line 923
;923:		}
LABELV $565
line 924
;924:	}
LABELV $562
line 930
;925://unlagged - projectile nudge
;926:
;927:
;928:	// adjust for riding a mover if it wasn't rolled into the predicted
;929:	// player state
;930:	if ( cent != &cg.predictedPlayerEntity ) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 cg+110152
CVPU4 4
EQU4 $575
line 931
;931:		CG_AdjustPositionForMover( cent->lerpOrigin, cent->currentState.groundEntityNum, 
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
CNSTI4 716
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
ADDRGP4 cg+109652
INDIRI4
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 CG_AdjustPositionForMover
CALLV
pop
line 933
;932:		cg.snap->serverTime, cg.time, cent->lerpOrigin );
;933:	}
LABELV $575
line 934
;934:}
LABELV $539
endproc CG_CalcEntityLerpPositions 120 28
proc CG_TeamBase 140 12
line 941
;935:
;936:/*
;937:===============
;938:CG_TeamBase
;939:===============
;940:*/
;941:static void CG_TeamBase( centity_t *cent ) {
line 950
;942:	refEntity_t model;
;943:#ifdef MISSIONPACK
;944:	vec3_t angles;
;945:	int t, h;
;946:	float c;
;947:
;948:	if ( cgs.gametype == GT_CTF || cgs.gametype == GT_1FCTF ) {
;949:#else
;950:	if ( cgs.gametype == GT_CTF) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
NEI4 $581
line 953
;951:#endif
;952:		// show the flag base
;953:		memset(&model, 0, sizeof(model));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 954
;954:		model.reType = RT_MODEL;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 955
;955:		VectorCopy( cent->lerpOrigin, model.lightingOrigin );
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 956
;956:		VectorCopy( cent->lerpOrigin, model.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 957
;957:		AnglesToAxis( cent->currentState.angles, model.axis );
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
line 958
;958:		if ( cent->currentState.modelindex == TEAM_RED ) {
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 1
NEI4 $587
line 959
;959:			model.hModel = cgs.media.redFlagBaseModel;
ADDRLP4 0+8
ADDRGP4 cgs+154388+108
INDIRI4
ASGNI4
line 960
;960:		}
ADDRGP4 $588
JUMPV
LABELV $587
line 961
;961:		else if ( cent->currentState.modelindex == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 2
NEI4 $592
line 962
;962:			model.hModel = cgs.media.blueFlagBaseModel;
ADDRLP4 0+8
ADDRGP4 cgs+154388+112
INDIRI4
ASGNI4
line 963
;963:		}
ADDRGP4 $593
JUMPV
LABELV $592
line 964
;964:		else {
line 965
;965:			model.hModel = cgs.media.neutralFlagBaseModel;
ADDRLP4 0+8
ADDRGP4 cgs+154388+116
INDIRI4
ASGNI4
line 966
;966:		}
LABELV $593
LABELV $588
line 967
;967:		trap_R_AddRefEntityToScene( &model );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 968
;968:	}
LABELV $581
line 1087
;969:#ifdef MISSIONPACK
;970:	else if ( cgs.gametype == GT_OBELISK ) {
;971:		// show the obelisk
;972:		memset(&model, 0, sizeof(model));
;973:		model.reType = RT_MODEL;
;974:		VectorCopy( cent->lerpOrigin, model.lightingOrigin );
;975:		VectorCopy( cent->lerpOrigin, model.origin );
;976:		AnglesToAxis( cent->currentState.angles, model.axis );
;977:
;978:		model.hModel = cgs.media.overloadBaseModel;
;979:		trap_R_AddRefEntityToScene( &model );
;980:		// if hit
;981:		if ( cent->currentState.frame == 1) {
;982:			// show hit model
;983:			// modelindex2 is the health value of the obelisk
;984:			c = cent->currentState.modelindex2;
;985:			model.shaderRGBA[0] = 0xff;
;986:			model.shaderRGBA[1] = c;
;987:			model.shaderRGBA[2] = c;
;988:			model.shaderRGBA[3] = 0xff;
;989:			//
;990:			model.hModel = cgs.media.overloadEnergyModel;
;991:			trap_R_AddRefEntityToScene( &model );
;992:		}
;993:		// if respawning
;994:		if ( cent->currentState.frame == 2) {
;995:			if ( !cent->miscTime ) {
;996:				cent->miscTime = cg.time;
;997:			}
;998:			t = cg.time - cent->miscTime;
;999:			h = (cg_obeliskRespawnDelay.integer - 5) * 1000;
;1000:			//
;1001:			if (t > h) {
;1002:				c = (float) (t - h) / h;
;1003:				if (c > 1)
;1004:					c = 1;
;1005:			}
;1006:			else {
;1007:				c = 0;
;1008:			}
;1009:			// show the lights
;1010:			AnglesToAxis( cent->currentState.angles, model.axis );
;1011:			//
;1012:			model.shaderRGBA[0] = c * 0xff;
;1013:			model.shaderRGBA[1] = c * 0xff;
;1014:			model.shaderRGBA[2] = c * 0xff;
;1015:			model.shaderRGBA[3] = c * 0xff;
;1016:
;1017:			model.hModel = cgs.media.overloadLightsModel;
;1018:			trap_R_AddRefEntityToScene( &model );
;1019:			// show the target
;1020:			if (t > h) {
;1021:				if ( !cent->muzzleFlashTime ) {
;1022:					trap_S_StartSound (cent->lerpOrigin, ENTITYNUM_NONE, CHAN_BODY,  cgs.media.obeliskRespawnSound);
;1023:					cent->muzzleFlashTime = 1;
;1024:				}
;1025:				VectorCopy(cent->currentState.angles, angles);
;1026:				angles[YAW] += (float) 16 * acos(1-c) * 180 / M_PI;
;1027:				AnglesToAxis( angles, model.axis );
;1028:
;1029:				VectorScale( model.axis[0], c, model.axis[0]);
;1030:				VectorScale( model.axis[1], c, model.axis[1]);
;1031:				VectorScale( model.axis[2], c, model.axis[2]);
;1032:
;1033:				model.shaderRGBA[0] = 0xff;
;1034:				model.shaderRGBA[1] = 0xff;
;1035:				model.shaderRGBA[2] = 0xff;
;1036:				model.shaderRGBA[3] = 0xff;
;1037:				//
;1038:				model.origin[2] += 56;
;1039:				model.hModel = cgs.media.overloadTargetModel;
;1040:				trap_R_AddRefEntityToScene( &model );
;1041:			}
;1042:			else {
;1043:				//FIXME: show animated smoke
;1044:			}
;1045:		}
;1046:		else {
;1047:			cent->miscTime = 0;
;1048:			cent->muzzleFlashTime = 0;
;1049:			// modelindex2 is the health value of the obelisk
;1050:			c = cent->currentState.modelindex2;
;1051:			model.shaderRGBA[0] = 0xff;
;1052:			model.shaderRGBA[1] = c;
;1053:			model.shaderRGBA[2] = c;
;1054:			model.shaderRGBA[3] = 0xff;
;1055:			// show the lights
;1056:			model.hModel = cgs.media.overloadLightsModel;
;1057:			trap_R_AddRefEntityToScene( &model );
;1058:			// show the target
;1059:			model.origin[2] += 56;
;1060:			model.hModel = cgs.media.overloadTargetModel;
;1061:			trap_R_AddRefEntityToScene( &model );
;1062:		}
;1063:	}
;1064:	else if ( cgs.gametype == GT_HARVESTER ) {
;1065:		// show harvester model
;1066:		memset(&model, 0, sizeof(model));
;1067:		model.reType = RT_MODEL;
;1068:		VectorCopy( cent->lerpOrigin, model.lightingOrigin );
;1069:		VectorCopy( cent->lerpOrigin, model.origin );
;1070:		AnglesToAxis( cent->currentState.angles, model.axis );
;1071:
;1072:		if ( cent->currentState.modelindex == TEAM_RED ) {
;1073:			model.hModel = cgs.media.harvesterModel;
;1074:			model.customSkin = cgs.media.harvesterRedSkin;
;1075:		}
;1076:		else if ( cent->currentState.modelindex == TEAM_BLUE ) {
;1077:			model.hModel = cgs.media.harvesterModel;
;1078:			model.customSkin = cgs.media.harvesterBlueSkin;
;1079:		}
;1080:		else {
;1081:			model.hModel = cgs.media.harvesterNeutralModel;
;1082:			model.customSkin = 0;
;1083:		}
;1084:		trap_R_AddRefEntityToScene( &model );
;1085:	}
;1086:#endif
;1087:}
LABELV $580
endproc CG_TeamBase 140 12
proc CG_AddCEntity 8 8
line 1095
;1088:
;1089:/*
;1090:===============
;1091:CG_AddCEntity
;1092:
;1093:===============
;1094:*/
;1095:static void CG_AddCEntity( centity_t *cent ) {
line 1097
;1096:	// event-only entities will have been dealt with already
;1097:	if ( cent->currentState.eType >= ET_EVENTS ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 14
LTI4 $601
line 1098
;1098:		return;
ADDRGP4 $600
JUMPV
LABELV $601
line 1102
;1099:	}
;1100:
;1101:	// calculate the current origin
;1102:	CG_CalcEntityLerpPositions( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CalcEntityLerpPositions
CALLV
pop
line 1105
;1103:
;1104:	// add automatic effects
;1105:	CG_EntityEffects( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_EntityEffects
CALLV
pop
line 1107
;1106:
;1107:	switch ( cent->currentState.eType ) {
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
LTI4 $603
ADDRLP4 0
INDIRI4
CNSTI4 15
GTI4 $603
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $620
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $620
address $608
address $609
address $610
address $611
address $612
address $614
address $615
address $616
address $604
address $604
address $604
address $617
address $619
address $618
address $603
address $613
code
LABELV $603
line 1109
;1108:	default:
;1109:		CG_Error( "Bad entity type: %i\n", cent->currentState.eType );
ADDRGP4 $606
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
line 1110
;1110:		break;
ADDRGP4 $604
JUMPV
line 1114
;1111:	case ET_INVISIBLE:
;1112:	case ET_PUSH_TRIGGER:
;1113:	case ET_TELEPORT_TRIGGER:
;1114:		break;
LABELV $608
line 1116
;1115:	case ET_GENERAL:
;1116:		CG_General( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_General
CALLV
pop
line 1117
;1117:		break;
ADDRGP4 $604
JUMPV
LABELV $609
line 1119
;1118:	case ET_PLAYER:
;1119:		CG_Player( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Player
CALLV
pop
line 1120
;1120:		break;
ADDRGP4 $604
JUMPV
LABELV $610
line 1122
;1121:	case ET_ITEM:
;1122:		CG_Item( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Item
CALLV
pop
line 1123
;1123:		break;
ADDRGP4 $604
JUMPV
LABELV $611
line 1125
;1124:	case ET_MISSILE:
;1125:		CG_Missile( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Missile
CALLV
pop
line 1126
;1126:		break;
ADDRGP4 $604
JUMPV
LABELV $612
line 1128
;1127:	case ET_MOVER:
;1128:		CG_Mover( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Mover
CALLV
pop
line 1129
;1129:		break;
ADDRGP4 $604
JUMPV
LABELV $613
line 1131
;1130:	case ET_BREAKABLE:
;1131: 		CG_Mover( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Mover
CALLV
pop
line 1132
;1132: 		break;
ADDRGP4 $604
JUMPV
LABELV $614
line 1134
;1133:	case ET_BEAM:
;1134:		CG_Beam( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Beam
CALLV
pop
line 1135
;1135:		break;
ADDRGP4 $604
JUMPV
LABELV $615
line 1137
;1136:	case ET_PORTAL:
;1137:		CG_Portal( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Portal
CALLV
pop
line 1138
;1138:		break;
ADDRGP4 $604
JUMPV
LABELV $616
line 1140
;1139:	case ET_SPEAKER:
;1140:		CG_Speaker( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Speaker
CALLV
pop
line 1141
;1141:		break;
ADDRGP4 $604
JUMPV
LABELV $617
line 1143
;1142:	case ET_GRAPPLE:
;1143:		CG_Grapple( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Grapple
CALLV
pop
line 1144
;1144:		break;
ADDRGP4 $604
JUMPV
LABELV $618
line 1146
;1145:	case ET_TURRET:
;1146:		CG_TURRET(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_TURRET
CALLV
pop
line 1147
;1147:		break;
ADDRGP4 $604
JUMPV
LABELV $619
line 1149
;1148:	case ET_TEAM:
;1149:		CG_TeamBase( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_TeamBase
CALLV
pop
line 1150
;1150:		break;
LABELV $604
line 1152
;1151:	}
;1152:}
LABELV $600
endproc CG_AddCEntity 8 8
export CG_AddPacketEntities
proc CG_AddPacketEntities 20 12
line 1160
;1153:
;1154:/*
;1155:===============
;1156:CG_AddPacketEntities
;1157:
;1158:===============
;1159:*/
;1160:void CG_AddPacketEntities( void ) {
line 1166
;1161:	int					num;
;1162:	centity_t			*cent;
;1163:	playerState_t		*ps;
;1164:
;1165:	// set cg.frameInterpolation
;1166:	if ( cg.nextSnap ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $622
line 1169
;1167:		int		delta;
;1168:
;1169:		delta = (cg.nextSnap->serverTime - cg.snap->serverTime);
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
line 1170
;1170:		if ( delta == 0 ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $627
line 1171
;1171:			cg.frameInterpolation = 0;
ADDRGP4 cg+109636
CNSTF4 0
ASGNF4
line 1172
;1172:		} else {
ADDRGP4 $623
JUMPV
LABELV $627
line 1173
;1173:			cg.frameInterpolation = (float)( cg.time - cg.snap->serverTime ) / delta;
ADDRGP4 cg+109636
ADDRGP4 cg+109652
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
line 1174
;1174:		}
line 1175
;1175:	} else {
ADDRGP4 $623
JUMPV
LABELV $622
line 1176
;1176:		cg.frameInterpolation = 0;	// actually, it should never be used, because 
ADDRGP4 cg+109636
CNSTF4 0
ASGNF4
line 1178
;1177:									// no entities should be marked as interpolating
;1178:	}
LABELV $623
line 1181
;1179:
;1180:	// the auto-rotating items will all have the same axis
;1181:	cg.autoAngles[0] = 0;
ADDRGP4 cg+111008
CNSTF4 0
ASGNF4
line 1182
;1182:	cg.autoAngles[1] = ( cg.time & 2047 ) * 360 / 2048.0;
ADDRGP4 cg+111008+4
CNSTI4 360
ADDRGP4 cg+109652
INDIRI4
CNSTI4 2047
BANDI4
MULI4
CVIF4 4
CNSTF4 1157627904
DIVF4
ASGNF4
line 1183
;1183:	cg.autoAngles[2] = 0;
ADDRGP4 cg+111008+8
CNSTF4 0
ASGNF4
line 1185
;1184:
;1185:	cg.autoAnglesFast[0] = 0;
ADDRGP4 cg+111056
CNSTF4 0
ASGNF4
line 1186
;1186:	cg.autoAnglesFast[1] = ( cg.time & 1023 ) * 360 / 1024.0f;
ADDRGP4 cg+111056+4
CNSTI4 360
ADDRGP4 cg+109652
INDIRI4
CNSTI4 1023
BANDI4
MULI4
CVIF4 4
CNSTF4 1149239296
DIVF4
ASGNF4
line 1187
;1187:	cg.autoAnglesFast[2] = 0;
ADDRGP4 cg+111056+8
CNSTF4 0
ASGNF4
line 1189
;1188:
;1189:	AnglesToAxis( cg.autoAngles, cg.autoAxis );
ADDRGP4 cg+111008
ARGP4
ADDRGP4 cg+111020
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1190
;1190:	AnglesToAxis( cg.autoAnglesFast, cg.autoAxisFast );
ADDRGP4 cg+111056
ARGP4
ADDRGP4 cg+111068
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1193
;1191:
;1192:	// generate and add the entity from the playerstate
;1193:	ps = &cg.predictedPlayerState;
ADDRLP4 8
ADDRGP4 cg+109684
ASGNP4
line 1194
;1194:	BG_PlayerStateToEntityState( ps, &cg.predictedPlayerEntity.currentState, qfalse );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 cg+110152
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 1195
;1195:	CG_AddCEntity( &cg.predictedPlayerEntity );
ADDRGP4 cg+110152
ARGP4
ADDRGP4 CG_AddCEntity
CALLV
pop
line 1198
;1196:
;1197:	// lerp the non-predicted value for lightning gun origins
;1198:	CG_CalcEntityLerpPositions( &cg_entities[ cg.snap->ps.clientNum ] );
CNSTI4 740
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
line 1201
;1199:
;1200://unlagged - early transitioning
;1201:	if ( cg.nextSnap ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $654
line 1204
;1202:		// pre-add some of the entities sent over by the server
;1203:		// we have data for them and they don't need to interpolate
;1204:		for ( num = 0 ; num < cg.nextSnap->numEntities ; num++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $660
JUMPV
LABELV $657
line 1205
;1205:			cent = &cg_entities[ cg.nextSnap->entities[ num ].number ];
ADDRLP4 0
CNSTI4 740
CNSTI4 212
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
line 1206
;1206:			if ( cent->nextState.eType == ET_MISSILE || cent->nextState.eType == ET_GENERAL ) {
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 3
EQI4 $665
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $663
LABELV $665
line 1208
;1207:				// transition it immediately and add it
;1208:				CG_TransitionEntity( cent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_TransitionEntity
CALLV
pop
line 1209
;1209:				cent->interpolate = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 1
ASGNI4
line 1210
;1210:				CG_AddCEntity( cent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddCEntity
CALLV
pop
line 1211
;1211:			}
LABELV $663
line 1212
;1212:		}
LABELV $658
line 1204
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $660
ADDRLP4 4
INDIRI4
ADDRGP4 cg+40
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $657
line 1213
;1213:	}
LABELV $654
line 1217
;1214://unlagged - early transitioning
;1215:
;1216:	// add each entity sent over by the server
;1217:	for ( num = 0 ; num < cg.snap->numEntities ; num++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $669
JUMPV
LABELV $666
line 1218
;1218:		cent = &cg_entities[ cg.snap->entities[ num ].number ];
ADDRLP4 0
CNSTI4 740
CNSTI4 212
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
line 1220
;1219://unlagged - early transitioning
;1220:		if ( !cg.nextSnap || cent->nextState.eType != ET_MISSILE && cent->nextState.eType != ET_GENERAL ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $675
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 3
EQI4 $672
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $672
LABELV $675
line 1222
;1221://unlagged - early transitioning
;1222:			CG_AddCEntity( cent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddCEntity
CALLV
pop
line 1223
;1223:		}
LABELV $672
line 1224
;1224:	}
LABELV $667
line 1217
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $669
ADDRLP4 4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $666
line 1225
;1225:}
LABELV $621
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
LABELV $606
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
LABELV $523
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
LABELV $153
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
