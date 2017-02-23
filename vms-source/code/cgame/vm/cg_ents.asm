code
proc CG_TURRET 156 12
file "../cg_ents.c"
line 11
;1:// 2016 Trepidation Licensed under the GPL2 - Team Trepidation
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
ADDRGP4 cgs+154388+444
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
ADDRGP4 cgs+154388+436
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
ADDRGP4 cgs+154388+424
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
;297:	// Lets just make health and armor 'simpleitems' for now - Shafe
;298:	if ( cg_simpleItems.integer != -1) // this is for devs
ADDRGP4 cg_simpleItems+12
INDIRI4
CNSTI4 -1
EQI4 $171
line 299
;299:	{
line 300
;300:		if ( item->giType == IT_AMMO && item->giType != IT_TEAM )
ADDRLP4 172
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 2
NEI4 $174
ADDRLP4 172
INDIRI4
CNSTI4 8
EQI4 $174
line 301
;301:		{	
line 302
;302:			memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 303
;303:			ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 304
;304:			VectorCopy( cent->lerpOrigin, ent.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 305
;305:			ent.radius = 14;
ADDRLP4 0+132
CNSTF4 1096810496
ASGNF4
line 306
;306:			ent.customShader = cg_items[es->modelindex].icon;
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
line 307
;307:			ent.shaderRGBA[0] = 255;
ADDRLP4 0+116
CNSTU1 255
ASGNU1
line 308
;308:			ent.shaderRGBA[1] = 255;
ADDRLP4 0+116+1
CNSTU1 255
ASGNU1
line 309
;309:			ent.shaderRGBA[2] = 255;
ADDRLP4 0+116+2
CNSTU1 255
ASGNU1
line 310
;310:			ent.shaderRGBA[3] = 255;
ADDRLP4 0+116+3
CNSTU1 255
ASGNU1
line 311
;311:			trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 312
;312:			return;
ADDRGP4 $150
JUMPV
LABELV $174
line 314
;313:		}
;314:	}
LABELV $171
line 316
;315:	// items bob up and down continuously
;316:	scale = 0.005 + cent->currentState.number * 0.00001;
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
line 317
;317:	cent->lerpOrigin[2] += 4 + cos( ( cg.time + 1000 ) *  scale ) * 4;
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
line 319
;318:
;319:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 322
;320:
;321:	// autorotate at one of two speeds
;322:	if ( item->giType == IT_HEALTH ) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 4
NEI4 $188
line 323
;323:		VectorCopy( cg.autoAnglesFast, cent->lerpAngles );
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRGP4 cg+111056
INDIRB
ASGNB 12
line 324
;324:		AxisCopy( cg.autoAxisFast, ent.axis );
ADDRGP4 cg+111068
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AxisCopy
CALLV
pop
line 325
;325:	} else {
ADDRGP4 $189
JUMPV
LABELV $188
line 326
;326:		VectorCopy( cg.autoAngles, cent->lerpAngles );
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRGP4 cg+111008
INDIRB
ASGNB 12
line 327
;327:		AxisCopy( cg.autoAxis, ent.axis );
ADDRGP4 cg+111020
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AxisCopy
CALLV
pop
line 328
;328:	}
LABELV $189
line 330
;329:
;330:	wi = NULL;
ADDRLP4 152
CNSTP4 0
ASGNP4
line 334
;331:	// the weapons have their origin where they attatch to player
;332:	// models, so we need to offset them or they will rotate
;333:	// eccentricly
;334:	if ( item->giType == IT_WEAPON ) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $196
line 335
;335:		wi = &cg_weapons[item->giTag];
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
line 336
;336:		cent->lerpOrigin[0] -= 
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
line 340
;337:			wi->weaponMidpoint[0] * ent.axis[0][0] +
;338:			wi->weaponMidpoint[1] * ent.axis[1][0] +
;339:			wi->weaponMidpoint[2] * ent.axis[2][0];
;340:		cent->lerpOrigin[1] -= 
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
line 344
;341:			wi->weaponMidpoint[0] * ent.axis[0][1] +
;342:			wi->weaponMidpoint[1] * ent.axis[1][1] +
;343:			wi->weaponMidpoint[2] * ent.axis[2][1];
;344:		cent->lerpOrigin[2] -= 
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
line 349
;345:			wi->weaponMidpoint[0] * ent.axis[0][2] +
;346:			wi->weaponMidpoint[1] * ent.axis[1][2] +
;347:			wi->weaponMidpoint[2] * ent.axis[2][2];
;348:
;349:		cent->lerpOrigin[2] += 8;	// an extra height boost
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
line 350
;350:	}
LABELV $196
line 352
;351:
;352:	ent.hModel = cg_items[es->modelindex].models[0];
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
line 354
;353:
;354:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 355
;355:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 357
;356:
;357:	ent.nonNormalizedAxes = qfalse;
ADDRLP4 0+64
CNSTI4 0
ASGNI4
line 360
;358:
;359:	// if just respawned, slowly scale up
;360:	msec = cg.time - cent->miscTime;
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
line 361
;361:	if ( msec >= 0 && msec < ITEM_SCALEUP_TIME ) {
ADDRLP4 156
INDIRI4
CNSTI4 0
LTI4 $225
ADDRLP4 156
INDIRI4
CNSTI4 1000
GEI4 $225
line 362
;362:		frac = (float)msec / ITEM_SCALEUP_TIME;
ADDRLP4 148
ADDRLP4 156
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ASGNF4
line 363
;363:		VectorScale( ent.axis[0], frac, ent.axis[0] );
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
line 364
;364:		VectorScale( ent.axis[1], frac, ent.axis[1] );
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
line 365
;365:		VectorScale( ent.axis[2], frac, ent.axis[2] );
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
line 366
;366:		ent.nonNormalizedAxes = qtrue;
ADDRLP4 0+64
CNSTI4 1
ASGNI4
line 367
;367:	} else {
ADDRGP4 $226
JUMPV
LABELV $225
line 368
;368:		frac = 1.0;
ADDRLP4 148
CNSTF4 1065353216
ASGNF4
line 369
;369:	}
LABELV $226
line 373
;370:
;371:	// items without glow textures need to keep a minimum light value
;372:	// so they are always visible
;373:	if ( ( item->giType == IT_WEAPON ) ||
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
EQI4 $272
ADDRLP4 184
INDIRI4
CNSTI4 3
NEI4 $270
LABELV $272
line 374
;374:		 ( item->giType == IT_ARMOR ) ) {
line 375
;375:		ent.renderfx |= RF_MINLIGHT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 376
;376:	}
LABELV $270
line 379
;377:
;378:	// increase the size of the weapons when they are presented as items
;379:	if ( item->giType == IT_WEAPON ) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $274
line 380
;380:		VectorScale( ent.axis[0], 1.5, ent.axis[0] );
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
line 381
;381:		VectorScale( ent.axis[1], 1.5, ent.axis[1] );
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
line 382
;382:		VectorScale( ent.axis[2], 1.5, ent.axis[2] );
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
line 383
;383:		ent.nonNormalizedAxes = qtrue;
ADDRLP4 0+64
CNSTI4 1
ASGNI4
line 387
;384:#ifdef MISSIONPACK
;385:		trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, cgs.media.weaponHoverSound );
;386:#endif
;387:	}
LABELV $274
line 399
;388:
;389:#ifdef MISSIONPACK
;390:	if ( item->giType == IT_HOLDABLE && item->giTag == HI_KAMIKAZE ) {
;391:		VectorScale( ent.axis[0], 2, ent.axis[0] );
;392:		VectorScale( ent.axis[1], 2, ent.axis[1] );
;393:		VectorScale( ent.axis[2], 2, ent.axis[2] );
;394:		ent.nonNormalizedAxes = qtrue;
;395:	}
;396:#endif
;397:
;398:	// add to refresh list
;399:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 423
;400:
;401:#ifdef MISSIONPACK
;402:	if ( item->giType == IT_WEAPON && wi->barrelModel ) {
;403:		refEntity_t	barrel;
;404:
;405:		memset( &barrel, 0, sizeof( barrel ) );
;406:
;407:		barrel.hModel = wi->barrelModel;
;408:
;409:		VectorCopy( ent.lightingOrigin, barrel.lightingOrigin );
;410:		barrel.shadowPlane = ent.shadowPlane;
;411:		barrel.renderfx = ent.renderfx;
;412:
;413:		CG_PositionRotatedEntityOnTag( &barrel, &ent, wi->weaponModel, "tag_barrel" );
;414:
;415:		AxisCopy( ent.axis, barrel.axis );
;416:		barrel.nonNormalizedAxes = ent.nonNormalizedAxes;
;417:
;418:		trap_R_AddRefEntityToScene( &barrel );
;419:	}
;420:#endif
;421:
;422:	// accompanying rings / spheres for powerups
;423:	if ( !cg_simpleItems.integer ) 
ADDRGP4 cg_simpleItems+12
INDIRI4
CNSTI4 0
NEI4 $319
line 424
;424:	{
line 427
;425:		vec3_t spinAngles;
;426:
;427:		VectorClear( spinAngles );
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
line 429
;428:
;429:		if ( item->giType == IT_HEALTH || item->giType == IT_POWERUP )
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
EQI4 $326
ADDRLP4 204
INDIRI4
CNSTI4 5
NEI4 $324
LABELV $326
line 430
;430:		{
line 431
;431:			if ( ( ent.hModel = cg_items[es->modelindex].models[1] ) != 0 )
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
EQI4 $327
line 432
;432:			{
line 433
;433:				if ( item->giType == IT_POWERUP )
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $332
line 434
;434:				{
line 435
;435:					ent.origin[2] += 12;
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
CNSTF4 1094713344
ADDF4
ASGNF4
line 436
;436:					spinAngles[1] = ( cg.time & 1023 ) * 360 / -1024.0f;
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
line 437
;437:				}
LABELV $332
line 438
;438:				AnglesToAxis( spinAngles, ent.axis );
ADDRLP4 188
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 441
;439:				
;440:				// scale up if respawning
;441:				if ( frac != 1.0 ) {
ADDRLP4 148
INDIRF4
CNSTF4 1065353216
EQF4 $339
line 442
;442:					VectorScale( ent.axis[0], frac, ent.axis[0] );
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
line 443
;443:					VectorScale( ent.axis[1], frac, ent.axis[1] );
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
line 444
;444:					VectorScale( ent.axis[2], frac, ent.axis[2] );
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
line 445
;445:					ent.nonNormalizedAxes = qtrue;
ADDRLP4 0+64
CNSTI4 1
ASGNI4
line 446
;446:				}
LABELV $339
line 447
;447:				trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 448
;448:			}
LABELV $327
line 449
;449:		}
LABELV $324
line 450
;450:	}
LABELV $319
line 451
;451:}
LABELV $150
endproc CG_Item 212 12
proc CG_Missile 164 20
line 460
;452:
;453://============================================================================
;454:
;455:/*
;456:===============
;457:CG_Missile
;458:===============
;459:*/
;460:static void CG_Missile( centity_t *cent ) {
line 466
;461:	refEntity_t			ent;
;462:	entityState_t		*s1;
;463:	const weaponInfo_t		*weapon;
;464://	int	col;
;465:
;466:	s1 = &cent->currentState;
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
line 467
;467:	if ( s1->weapon > WP_NUM_WEAPONS ) {
ADDRLP4 144
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 12
LEI4 $385
line 468
;468:		s1->weapon = 0;
ADDRLP4 144
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 469
;469:	}
LABELV $385
line 470
;470:	weapon = &cg_weapons[s1->weapon];
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
line 473
;471:
;472:	// calculate the axis
;473:	VectorCopy( s1->angles, cent->lerpAngles);
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
line 476
;474:
;475:	// add trails
;476:	if ( weapon->missileTrailFunc ) 
ADDRLP4 140
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $387
line 477
;477:	{
line 478
;478:		weapon->missileTrailFunc( cent, weapon );
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
line 479
;479:	}
LABELV $387
line 498
;480:/*
;481:	if ( cent->currentState.modelindex == TEAM_RED ) {
;482:		col = 1;
;483:	}
;484:	else if ( cent->currentState.modelindex == TEAM_BLUE ) {
;485:		col = 2;
;486:	}
;487:	else {
;488:		col = 0;
;489:	}
;490:
;491:	// add dynamic light
;492:	if ( weapon->missileDlight ) {
;493:		trap_R_AddLightToScene(cent->lerpOrigin, weapon->missileDlight, 
;494:			weapon->missileDlightColor[col][0], weapon->missileDlightColor[col][1], weapon->missileDlightColor[col][2] );
;495:	}
;496:*/
;497:	// add dynamic light
;498:	if ( weapon->missileDlight ) {
ADDRLP4 140
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
CNSTF4 0
EQF4 $389
line 499
;499:		trap_R_AddLightToScene(cent->lerpOrigin, weapon->missileDlight, 
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
line 501
;500:			weapon->missileDlightColor[0], weapon->missileDlightColor[1], weapon->missileDlightColor[2] );
;501:	}
LABELV $389
line 504
;502:
;503:	// add missile sound
;504:	if ( weapon->missileSound ) {
ADDRLP4 140
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 0
EQI4 $391
line 507
;505:		vec3_t	velocity;
;506:
;507:		BG_EvaluateTrajectoryDelta( &cent->currentState.pos, cg.time, velocity );
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
line 509
;508:
;509:		trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, velocity, weapon->missileSound );
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
line 510
;510:	}
LABELV $391
line 513
;511:
;512:	// create the render entity
;513:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 514
;514:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 515
;515:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 529
;516:
;517:	/* Maybe?
;518:	if ( cent->currentState.weapon == WP_PLASMAGUN ) {
;519:		ent.reType = RT_SPRITE;
;520:		ent.radius = 16;
;521:		ent.rotation = 0;
;522:		ent.customShader = cgs.media.plasmaBallShader;
;523:		trap_R_AddRefEntityToScene( &ent );
;524:		return;
;525:	}
;526:	*/
;527:
;528:		// Shafe - Trep - turret // Machine Gun
;529:	if (cent->currentState.weapon == WP_MACHINEGUN ) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 2
NEI4 $396
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
EQI4 $398
line 532
;532:		{
line 533
;533:			ent.radius = 6;
ADDRLP4 0+132
CNSTF4 1086324736
ASGNF4
line 534
;534:		} 
ADDRGP4 $399
JUMPV
LABELV $398
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
LABELV $399
line 540
;539:
;540:		ent.rotation = 0;
ADDRLP4 0+136
CNSTF4 0
ASGNF4
line 541
;541:		ent.customShader = cgs.media.turretFireShader;
ADDRLP4 0+112
ADDRGP4 cgs+154388+528
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
ADDRGP4 $384
JUMPV
LABELV $396
line 547
;544:	} // End Shafe
;545:
;546:	// Shafe - Trep - turret // Machine Gun
;547:	if (cent->currentState.weapon == WP_TURRET ) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 11
NEI4 $406
line 548
;548:		ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 549
;549:		if (cent->currentState.eFlags & EF_ALT_FIRING)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $408
line 550
;550:		{
line 551
;551:			ent.radius = 5;
ADDRLP4 0+132
CNSTF4 1084227584
ASGNF4
line 552
;552:		} 
ADDRGP4 $409
JUMPV
LABELV $408
line 554
;553:		else
;554:		{
line 555
;555:			ent.radius = 3;
ADDRLP4 0+132
CNSTF4 1077936128
ASGNF4
line 556
;556:		}
LABELV $409
line 558
;557:
;558:		ent.rotation = 0;
ADDRLP4 0+136
CNSTF4 0
ASGNF4
line 559
;559:		ent.customShader = cgs.media.turretFireShader;
ADDRLP4 0+112
ADDRGP4 cgs+154388+528
INDIRI4
ASGNI4
line 560
;560:		trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 561
;561:		return;
ADDRGP4 $384
JUMPV
LABELV $406
line 565
;562:	} // End Shafe
;563:
;564:	// Shafe - Trep - Flame Thrower
;565:	if (cent->currentState.weapon == WP_LIGHTNING ) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 6
NEI4 $416
line 566
;566:		ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 567
;567:		ent.radius = 32;
ADDRLP4 0+132
CNSTF4 1107296256
ASGNF4
line 568
;568:		ent.rotation = 0;
ADDRLP4 0+136
CNSTF4 0
ASGNF4
line 569
;569:		ent.customShader = cgs.media.flameBallShader;
ADDRLP4 0+112
ADDRGP4 cgs+154388+516
INDIRI4
ASGNI4
line 570
;570:		trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 571
;571:		return;
ADDRGP4 $384
JUMPV
LABELV $416
line 575
;572:	} // End Shafe
;573:
;574:	// Shafe - Trep - Devastator
;575:	if (cent->currentState.weapon == WP_BFG ) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 9
NEI4 $423
line 576
;576:		ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 578
;577:		//ent.radius = 10;
;578:		ent.rotation = 0;
ADDRLP4 0+136
CNSTF4 0
ASGNF4
line 579
;579:		ent.customShader = cgs.media.bfgBallShader;
ADDRLP4 0+112
ADDRGP4 cgs+154388+524
INDIRI4
ASGNI4
line 580
;580:		if (cent->currentState.eFlags & EF_ALT_FIRING)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $429
line 581
;581:		{
line 582
;582:			ent.radius = 10;
ADDRLP4 0+132
CNSTF4 1092616192
ASGNF4
line 583
;583:		} 
ADDRGP4 $430
JUMPV
LABELV $429
line 585
;584:		else
;585:		{
line 586
;586:			ent.radius = 5;
ADDRLP4 0+132
CNSTF4 1084227584
ASGNF4
line 587
;587:		}
LABELV $430
line 588
;588:		trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 589
;589:		return;
ADDRGP4 $384
JUMPV
LABELV $423
line 594
;590:	} // End Shafe
;591:
;592:
;593:	// flicker between two skins
;594:	ent.skinNum = cg.clientFrame & 1;
ADDRLP4 0+104
ADDRGP4 cg
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 595
;595:	ent.hModel = weapon->missileModel;
ADDRLP4 0+8
ADDRLP4 140
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ASGNI4
line 596
;596:	ent.renderfx = weapon->missileRenderfx; // | RF_NOSHADOW;
ADDRLP4 0+4
ADDRLP4 140
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 607
;597:
;598:#ifdef MISSIONPACK
;599:	if ( cent->currentState.weapon == WP_PROX_LAUNCHER ) {
;600:		if (s1->generic1 == TEAM_BLUE) {
;601:			ent.hModel = cgs.media.blueProxMine;
;602:		}
;603:	}
;604:#endif
;605:
;606:	// convert direction of travel into axis
;607:	if ( VectorNormalize2( s1->pos.trDelta, ent.axis[0] ) == 0 ) {
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
NEF4 $436
line 608
;608:		ent.axis[0][2] = 1;
ADDRLP4 0+28+8
CNSTF4 1065353216
ASGNF4
line 609
;609:	}
LABELV $436
line 612
;610:
;611:	// spin as it moves
;612:	if ( s1->pos.trType != TR_STATIONARY ) {
ADDRLP4 144
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $441
line 613
;613:		RotateAroundDirection( ent.axis, cg.time / 4 );
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
line 614
;614:	} else {
ADDRGP4 $442
JUMPV
LABELV $441
line 621
;615:#ifdef MISSIONPACK
;616:		if ( s1->weapon == WP_PROX_LAUNCHER ) {
;617:			AnglesToAxis( cent->lerpAngles, ent.axis );
;618:		}
;619:		else
;620:#endif
;621:		{
line 622
;622:			RotateAroundDirection( ent.axis, s1->time );
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
line 623
;623:		}
line 624
;624:	}
LABELV $442
line 627
;625:
;626:	// add to refresh list, possibly with quad glow
;627:	CG_AddRefEntityWithPowerups( &ent, s1, TEAM_FREE, cent );
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
line 628
;628:}
LABELV $384
endproc CG_Missile 164 20
proc CG_Grapple 152 12
line 637
;629:
;630:/*
;631:===============
;632:CG_Grapple
;633:
;634:This is called when the grapple is sitting up against the wall
;635:===============
;636:*/
;637:static void CG_Grapple( centity_t *cent ) {
line 642
;638:	refEntity_t			ent;
;639:	entityState_t		*s1;
;640:	const weaponInfo_t		*weapon;
;641:
;642:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 643
;643:	if ( s1->weapon > WP_NUM_WEAPONS ) {
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 12
LEI4 $447
line 644
;644:		s1->weapon = 0;
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 645
;645:	}
LABELV $447
line 646
;646:	weapon = &cg_weapons[s1->weapon];
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
line 649
;647:
;648:	// calculate the axis
;649:	VectorCopy( s1->angles, cent->lerpAngles);
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
line 659
;650:
;651:#if 0 // FIXME add grapple pull sound here..?
;652:	// add missile sound
;653:	if ( weapon->missileSound ) {
;654:		trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, weapon->missileSound );
;655:	}
;656:#endif
;657:
;658:	// Will draw cable if needed
;659:	CG_GrappleTrail ( cent, weapon );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRGP4 CG_GrappleTrail
CALLV
pop
line 662
;660:
;661:	// create the render entity
;662:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 663
;663:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 664
;664:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 667
;665:
;666:	// flicker between two skins
;667:	ent.skinNum = cg.clientFrame & 1;
ADDRLP4 0+104
ADDRGP4 cg
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 668
;668:	ent.hModel = weapon->missileModel;
ADDRLP4 0+8
ADDRLP4 144
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ASGNI4
line 669
;669:	ent.renderfx = weapon->missileRenderfx | RF_NOSHADOW;
ADDRLP4 0+4
ADDRLP4 144
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 672
;670:
;671:	// convert direction of travel into axis
;672:	if ( VectorNormalize2( s1->pos.trDelta, ent.axis[0] ) == 0 ) {
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
NEF4 $454
line 673
;673:		ent.axis[0][2] = 1;
ADDRLP4 0+28+8
CNSTF4 1065353216
ASGNF4
line 674
;674:	}
LABELV $454
line 676
;675:
;676:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 677
;677:}
LABELV $446
endproc CG_Grapple 152 12
proc CG_Mover 144 12
line 684
;678:
;679:/*
;680:===============
;681:CG_Mover
;682:===============
;683:*/
;684:static void CG_Mover( centity_t *cent ) {
line 688
;685:	refEntity_t			ent;
;686:	entityState_t		*s1;
;687:
;688:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 691
;689:
;690:	// create the render entity
;691:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 692
;692:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 693
;693:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 694
;694:	AnglesToAxis( cent->lerpAngles, ent.axis );
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
line 696
;695:
;696:	ent.renderfx = RF_NOSHADOW;
ADDRLP4 0+4
CNSTI4 64
ASGNI4
line 699
;697:
;698:	// flicker between two skins (FIXME?)
;699:	ent.skinNum = ( cg.time >> 6 ) & 1;
ADDRLP4 0+104
ADDRGP4 cg+109652
INDIRI4
CNSTI4 6
RSHI4
CNSTI4 1
BANDI4
ASGNI4
line 702
;700:
;701:	// get the model, either as a bmodel or a modelindex
;702:	if ( s1->solid == SOLID_BMODEL ) {
ADDRLP4 140
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
NEI4 $466
line 703
;703:		ent.hModel = cgs.inlineDrawModel[s1->modelindex];
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
line 704
;704:	} else {
ADDRGP4 $467
JUMPV
LABELV $466
line 705
;705:		ent.hModel = cgs.gameModels[s1->modelindex];
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
line 706
;706:	}
LABELV $467
line 709
;707:
;708:	// add to refresh list
;709:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 712
;710:
;711:	// add the secondary model
;712:	if ( s1->modelindex2 ) {
ADDRLP4 140
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 0
EQI4 $472
line 713
;713:		ent.skinNum = 0;
ADDRLP4 0+104
CNSTI4 0
ASGNI4
line 714
;714:		ent.hModel = cgs.gameModels[s1->modelindex2];
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
line 715
;715:		trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 716
;716:	}
LABELV $472
line 718
;717:
;718:}
LABELV $459
endproc CG_Mover 144 12
export CG_Beam
proc CG_Beam 144 12
line 727
;719:
;720:/*
;721:===============
;722:CG_Beam
;723:
;724:Also called as an event
;725:===============
;726:*/
;727:void CG_Beam( centity_t *cent ) {
line 731
;728:	refEntity_t			ent;
;729:	entityState_t		*s1;
;730:
;731:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 734
;732:
;733:	// create the render entity
;734:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 735
;735:	VectorCopy( s1->pos.trBase, ent.origin );
ADDRLP4 0+68
ADDRLP4 140
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 736
;736:	VectorCopy( s1->origin2, ent.oldorigin );
ADDRLP4 0+84
ADDRLP4 140
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 737
;737:	AxisClear( ent.axis );
ADDRLP4 0+28
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 738
;738:	ent.reType = RT_BEAM;
ADDRLP4 0
CNSTI4 3
ASGNI4
line 740
;739:
;740:	ent.renderfx = RF_NOSHADOW;
ADDRLP4 0+4
CNSTI4 64
ASGNI4
line 743
;741:
;742:	// add to refresh list
;743:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 744
;744:}
LABELV $477
endproc CG_Beam 144 12
proc CG_Portal 144 12
line 752
;745:
;746:
;747:/*
;748:===============
;749:CG_Portal
;750:===============
;751:*/
;752:static void CG_Portal( centity_t *cent ) {
line 756
;753:	refEntity_t			ent;
;754:	entityState_t		*s1;
;755:
;756:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 759
;757:
;758:	// create the render entity
;759:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 760
;760:	VectorCopy( cent->lerpOrigin, ent.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 761
;761:	VectorCopy( s1->origin2, ent.oldorigin );
ADDRLP4 0+84
ADDRLP4 140
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 762
;762:	ByteToDir( s1->eventParm, ent.axis[0] );
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
line 763
;763:	PerpendicularVector( ent.axis[1], ent.axis[0] );
ADDRLP4 0+28+12
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 767
;764:
;765:	// negating this tends to get the directions like they want
;766:	// we really should have a camera roll value
;767:	VectorSubtract( vec3_origin, ent.axis[1], ent.axis[1] );
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
line 769
;768:
;769:	CrossProduct( ent.axis[0], ent.axis[1], ent.axis[2] );
ADDRLP4 0+28
ARGP4
ADDRLP4 0+28+12
ARGP4
ADDRLP4 0+28+24
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 770
;770:	ent.reType = RT_PORTALSURFACE;
ADDRLP4 0
CNSTI4 7
ASGNI4
line 771
;771:	ent.oldframe = s1->powerups;
ADDRLP4 0+96
ADDRLP4 140
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 772
;772:	ent.frame = s1->frame;		// rotation speed
ADDRLP4 0+80
ADDRLP4 140
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
line 773
;773:	ent.skinNum = s1->clientNum/256.0 * 360;	// roll offset
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
line 776
;774:
;775:	// add to refresh list
;776:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 777
;777:}
LABELV $482
endproc CG_Portal 144 12
export CG_AdjustPositionForMover
proc CG_AdjustPositionForMover 92 12
line 787
;778:
;779:
;780:/*
;781:=========================
;782:CG_AdjustPositionForMover
;783:
;784:Also called by client movement prediction code
;785:=========================
;786:*/
;787:void CG_AdjustPositionForMover( const vec3_t in, int moverNum, int fromTime, int toTime, vec3_t out ) {
line 792
;788:	centity_t	*cent;
;789:	vec3_t	oldOrigin, origin, deltaOrigin;
;790:	vec3_t	oldAngles, angles, deltaAngles;
;791:
;792:	if ( moverNum <= 0 || moverNum >= ENTITYNUM_MAX_NORMAL ) {
ADDRLP4 76
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
LEI4 $518
ADDRLP4 76
INDIRI4
CNSTI4 1022
LTI4 $516
LABELV $518
line 793
;793:		VectorCopy( in, out );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 794
;794:		return;
ADDRGP4 $515
JUMPV
LABELV $516
line 797
;795:	}
;796:
;797:	cent = &cg_entities[ moverNum ];
ADDRLP4 0
CNSTI4 740
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 798
;798:	if ( cent->currentState.eType != ET_MOVER ) {
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
EQI4 $519
line 799
;799:		VectorCopy( in, out );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 800
;800:		return;
ADDRGP4 $515
JUMPV
LABELV $519
line 803
;801:	}
;802:
;803:	BG_EvaluateTrajectory( &cent->currentState.pos, fromTime, oldOrigin );
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
line 804
;804:	BG_EvaluateTrajectory( &cent->currentState.apos, fromTime, oldAngles );
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
line 806
;805:
;806:	BG_EvaluateTrajectory( &cent->currentState.pos, toTime, origin );
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
line 807
;807:	BG_EvaluateTrajectory( &cent->currentState.apos, toTime, angles );
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
line 809
;808:
;809:	VectorSubtract( origin, oldOrigin, deltaOrigin );
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
line 810
;810:	VectorSubtract( angles, oldAngles, deltaAngles );
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
line 812
;811:
;812:	VectorAdd( in, deltaOrigin, out );
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
line 815
;813:
;814:	// FIXME: origin change when on a rotating object
;815:}
LABELV $515
endproc CG_AdjustPositionForMover 92 12
proc CG_InterpolateEntityPosition 44 12
line 823
;816:
;817:
;818:/*
;819:=============================
;820:CG_InterpolateEntityPosition
;821:=============================
;822:*/
;823:static void CG_InterpolateEntityPosition( centity_t *cent ) {
line 829
;824:	vec3_t		current, next;
;825:	float		f;
;826:
;827:	// it would be an internal error to find an entity that interpolates without
;828:	// a snapshot ahead of the current one
;829:	if ( cg.nextSnap == NULL ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $536
line 830
;830:		CG_Error( "CG_InterpoateEntityPosition: cg.nextSnap == NULL" );
ADDRGP4 $539
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 831
;831:	}
LABELV $536
line 833
;832:
;833:	f = cg.frameInterpolation;
ADDRLP4 24
ADDRGP4 cg+109636
INDIRF4
ASGNF4
line 838
;834:	//CG_Printf("interpolation fraction: %.2f\n", cg.frameInterpolation);
;835:
;836:	// this will linearize a sine or parabolic curve, but it is important
;837:	// to not extrapolate player positions if more recent data is available
;838:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.snap->serverTime, current );
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
line 839
;839:	BG_EvaluateTrajectory( &cent->nextState.pos, cg.nextSnap->serverTime, next );
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
line 841
;840:
;841:	cent->lerpOrigin[0] = current[0] + f * ( next[0] - current[0] );
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
line 842
;842:	cent->lerpOrigin[1] = current[1] + f * ( next[1] - current[1] );
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
line 843
;843:	cent->lerpOrigin[2] = current[2] + f * ( next[2] - current[2] );
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
line 845
;844:
;845:	BG_EvaluateTrajectory( &cent->currentState.apos, cg.snap->serverTime, current );
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
line 846
;846:	BG_EvaluateTrajectory( &cent->nextState.apos, cg.nextSnap->serverTime, next );
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
line 848
;847:
;848:	cent->lerpAngles[0] = LerpAngle( current[0], next[0], f );
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
line 849
;849:	cent->lerpAngles[1] = LerpAngle( current[1], next[1], f );
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
line 850
;850:	cent->lerpAngles[2] = LerpAngle( current[2], next[2], f );
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
line 851
;851:}
LABELV $535
endproc CG_InterpolateEntityPosition 44 12
proc CG_CalcEntityLerpPositions 120 28
line 859
;852:
;853:/*
;854:===============
;855:CG_CalcEntityLerpPositions
;856:
;857:===============
;858:*/
;859:static void CG_CalcEntityLerpPositions( centity_t *cent ) {
line 862
;860://unlagged - projectile nudge
;861:	// this will be set to how far forward projectiles will be extrapolated
;862:	int timeshift = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 880
;863://unlagged - projectile nudge
;864:
;865://unlagged - smooth clients #2
;866:	// this is done server-side now - cg_smoothClients is undefined
;867:	// players will always be TR_INTERPOLATE
;868:/*
;869:	// if this player does not want to see extrapolated players
;870:	if ( !cg_smoothClients.integer ) {
;871:		// make sure the clients use TR_INTERPOLATE
;872:		if ( cent->currentState.number < MAX_CLIENTS ) {
;873:			cent->currentState.pos.trType = TR_INTERPOLATE;
;874:			cent->nextState.pos.trType = TR_INTERPOLATE;
;875:		}
;876:	}
;877:*/
;878://unlagged - smooth clients #2
;879:
;880:	if ( cent->interpolate && cent->currentState.pos.trType == TR_INTERPOLATE ) {
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
EQI4 $556
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
NEI4 $556
line 881
;881:		CG_InterpolateEntityPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_InterpolateEntityPosition
CALLV
pop
line 882
;882:		return;
ADDRGP4 $555
JUMPV
LABELV $556
line 887
;883:	}
;884:
;885:	// first see if we can interpolate between two snaps for
;886:	// linear extrapolated clients
;887:	if ( cent->interpolate && cent->currentState.pos.trType == TR_LINEAR_STOP &&
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
EQI4 $558
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 3
NEI4 $558
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 64
GEI4 $558
line 888
;888:			cent->currentState.number < MAX_CLIENTS) {
line 889
;889:		CG_InterpolateEntityPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_InterpolateEntityPosition
CALLV
pop
line 890
;890:		return;
ADDRGP4 $555
JUMPV
LABELV $558
line 897
;891:	}
;892:
;893://unlagged - timenudge extrapolation
;894:	// interpolating failed (probably no nextSnap), so extrapolate
;895:	// this can also happen if the teleport bit is flipped, but that
;896:	// won't be noticeable
;897:	if ( cent->currentState.number < MAX_CLIENTS &&
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 64
GEI4 $560
ADDRLP4 12
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
EQI4 $560
line 898
;898:			cent->currentState.clientNum != cg.predictedPlayerState.clientNum ) {
line 899
;899:		cent->currentState.pos.trType = TR_LINEAR_STOP;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 3
ASGNI4
line 900
;900:		cent->currentState.pos.trTime = cg.snap->serverTime;
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
line 901
;901:		cent->currentState.pos.trDuration = 1000 / sv_fps.integer;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 1000
ADDRGP4 sv_fps+12
INDIRI4
DIVI4
ASGNI4
line 902
;902:	}
LABELV $560
line 907
;903://unlagged - timenudge extrapolation
;904:
;905://unlagged - projectile nudge
;906:	// if it's a missile but not a grappling hook
;907:	if ( cent->currentState.eType == ET_MISSILE && cent->currentState.weapon != WP_GRAPPLING_HOOK ) {
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
NEI4 $566
ADDRLP4 16
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 10
EQI4 $566
line 909
;908:		// if it's one of ours
;909:		if ( cent->currentState.otherEntityNum == cg.clientNum ) {
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ADDRGP4 cg+4
INDIRI4
NEI4 $568
line 913
;910:			// extrapolate one server frame's worth - this will correct for tiny
;911:			// visual inconsistencies introduced by backward-reconciling all players
;912:			// one server frame before running projectiles
;913:			timeshift = 1000 / sv_fps.integer;
ADDRLP4 0
CNSTI4 1000
ADDRGP4 sv_fps+12
INDIRI4
DIVI4
ASGNI4
line 914
;914:		}
ADDRGP4 $569
JUMPV
LABELV $568
line 916
;915:		// if it's not, and it's not a grenade launcher
;916:		else if ( cent->currentState.weapon != WP_GRENADE_LAUNCHER ) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 5
EQI4 $572
line 918
;917:			// extrapolate based on cg_projectileNudge
;918:			timeshift = cg_projectileNudge.integer + 1000 / sv_fps.integer;
ADDRLP4 0
ADDRGP4 cg_projectileNudge+12
INDIRI4
CNSTI4 1000
ADDRGP4 sv_fps+12
INDIRI4
DIVI4
ADDI4
ASGNI4
line 919
;919:		}
LABELV $572
LABELV $569
line 920
;920:	}
LABELV $566
line 925
;921:
;922:	// just use the current frame and evaluate as best we can
;923://	BG_EvaluateTrajectory( &cent->currentState.pos, cg.time, cent->lerpOrigin );
;924://	BG_EvaluateTrajectory( &cent->currentState.apos, cg.time, cent->lerpAngles );
;925:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.time + timeshift, cent->lerpOrigin );
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
line 926
;926:	BG_EvaluateTrajectory( &cent->currentState.apos, cg.time + timeshift, cent->lerpAngles );
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
line 929
;927:
;928:	// if there's a time shift
;929:	if ( timeshift != 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $578
line 933
;930:		trace_t tr;
;931:		vec3_t lastOrigin;
;932:
;933:		BG_EvaluateTrajectory( &cent->currentState.pos, cg.time, lastOrigin );
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
line 935
;934:
;935:		CG_Trace( &tr, lastOrigin, vec3_origin, vec3_origin, cent->lerpOrigin, cent->currentState.number, MASK_SHOT );
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
line 938
;936:
;937:		// don't let the projectile go through the floor
;938:		if ( tr.fraction < 1.0f ) {
ADDRLP4 40+8
INDIRF4
CNSTF4 1065353216
GEF4 $581
line 939
;939:			cent->lerpOrigin[0] = lastOrigin[0] + tr.fraction * ( cent->lerpOrigin[0] - lastOrigin[0] );
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
line 940
;940:			cent->lerpOrigin[1] = lastOrigin[1] + tr.fraction * ( cent->lerpOrigin[1] - lastOrigin[1] );
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
line 941
;941:			cent->lerpOrigin[2] = lastOrigin[2] + tr.fraction * ( cent->lerpOrigin[2] - lastOrigin[2] );
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
line 942
;942:		}
LABELV $581
line 943
;943:	}
LABELV $578
line 949
;944://unlagged - projectile nudge
;945:
;946:
;947:	// adjust for riding a mover if it wasn't rolled into the predicted
;948:	// player state
;949:	if ( cent != &cg.predictedPlayerEntity ) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 cg+110152
CVPU4 4
EQU4 $591
line 950
;950:		CG_AdjustPositionForMover( cent->lerpOrigin, cent->currentState.groundEntityNum, 
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
line 952
;951:		cg.snap->serverTime, cg.time, cent->lerpOrigin );
;952:	}
LABELV $591
line 953
;953:}
LABELV $555
endproc CG_CalcEntityLerpPositions 120 28
proc CG_TeamBase 140 12
line 960
;954:
;955:/*
;956:===============
;957:CG_TeamBase
;958:===============
;959:*/
;960:static void CG_TeamBase( centity_t *cent ) {
line 969
;961:	refEntity_t model;
;962:#ifdef MISSIONPACK
;963:	vec3_t angles;
;964:	int t, h;
;965:	float c;
;966:
;967:	if ( cgs.gametype == GT_CTF || cgs.gametype == GT_1FCTF ) {
;968:#else
;969:	if ( cgs.gametype == GT_CTF) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
NEI4 $597
line 972
;970:#endif
;971:		// show the flag base
;972:		memset(&model, 0, sizeof(model));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 973
;973:		model.reType = RT_MODEL;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 974
;974:		VectorCopy( cent->lerpOrigin, model.lightingOrigin );
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 975
;975:		VectorCopy( cent->lerpOrigin, model.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 976
;976:		AnglesToAxis( cent->currentState.angles, model.axis );
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
line 977
;977:		if ( cent->currentState.modelindex == TEAM_RED ) {
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 1
NEI4 $603
line 978
;978:			model.hModel = cgs.media.redFlagBaseModel;
ADDRLP4 0+8
ADDRGP4 cgs+154388+108
INDIRI4
ASGNI4
line 979
;979:		}
ADDRGP4 $604
JUMPV
LABELV $603
line 980
;980:		else if ( cent->currentState.modelindex == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 2
NEI4 $608
line 981
;981:			model.hModel = cgs.media.blueFlagBaseModel;
ADDRLP4 0+8
ADDRGP4 cgs+154388+112
INDIRI4
ASGNI4
line 982
;982:		}
ADDRGP4 $609
JUMPV
LABELV $608
line 983
;983:		else {
line 984
;984:			model.hModel = cgs.media.neutralFlagBaseModel;
ADDRLP4 0+8
ADDRGP4 cgs+154388+116
INDIRI4
ASGNI4
line 985
;985:		}
LABELV $609
LABELV $604
line 986
;986:		trap_R_AddRefEntityToScene( &model );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 987
;987:	}
LABELV $597
line 1106
;988:#ifdef MISSIONPACK
;989:	else if ( cgs.gametype == GT_OBELISK ) {
;990:		// show the obelisk
;991:		memset(&model, 0, sizeof(model));
;992:		model.reType = RT_MODEL;
;993:		VectorCopy( cent->lerpOrigin, model.lightingOrigin );
;994:		VectorCopy( cent->lerpOrigin, model.origin );
;995:		AnglesToAxis( cent->currentState.angles, model.axis );
;996:
;997:		model.hModel = cgs.media.overloadBaseModel;
;998:		trap_R_AddRefEntityToScene( &model );
;999:		// if hit
;1000:		if ( cent->currentState.frame == 1) {
;1001:			// show hit model
;1002:			// modelindex2 is the health value of the obelisk
;1003:			c = cent->currentState.modelindex2;
;1004:			model.shaderRGBA[0] = 0xff;
;1005:			model.shaderRGBA[1] = c;
;1006:			model.shaderRGBA[2] = c;
;1007:			model.shaderRGBA[3] = 0xff;
;1008:			//
;1009:			model.hModel = cgs.media.overloadEnergyModel;
;1010:			trap_R_AddRefEntityToScene( &model );
;1011:		}
;1012:		// if respawning
;1013:		if ( cent->currentState.frame == 2) {
;1014:			if ( !cent->miscTime ) {
;1015:				cent->miscTime = cg.time;
;1016:			}
;1017:			t = cg.time - cent->miscTime;
;1018:			h = (cg_obeliskRespawnDelay.integer - 5) * 1000;
;1019:			//
;1020:			if (t > h) {
;1021:				c = (float) (t - h) / h;
;1022:				if (c > 1)
;1023:					c = 1;
;1024:			}
;1025:			else {
;1026:				c = 0;
;1027:			}
;1028:			// show the lights
;1029:			AnglesToAxis( cent->currentState.angles, model.axis );
;1030:			//
;1031:			model.shaderRGBA[0] = c * 0xff;
;1032:			model.shaderRGBA[1] = c * 0xff;
;1033:			model.shaderRGBA[2] = c * 0xff;
;1034:			model.shaderRGBA[3] = c * 0xff;
;1035:
;1036:			model.hModel = cgs.media.overloadLightsModel;
;1037:			trap_R_AddRefEntityToScene( &model );
;1038:			// show the target
;1039:			if (t > h) {
;1040:				if ( !cent->muzzleFlashTime ) {
;1041:					trap_S_StartSound (cent->lerpOrigin, ENTITYNUM_NONE, CHAN_BODY,  cgs.media.obeliskRespawnSound);
;1042:					cent->muzzleFlashTime = 1;
;1043:				}
;1044:				VectorCopy(cent->currentState.angles, angles);
;1045:				angles[YAW] += (float) 16 * acos(1-c) * 180 / M_PI;
;1046:				AnglesToAxis( angles, model.axis );
;1047:
;1048:				VectorScale( model.axis[0], c, model.axis[0]);
;1049:				VectorScale( model.axis[1], c, model.axis[1]);
;1050:				VectorScale( model.axis[2], c, model.axis[2]);
;1051:
;1052:				model.shaderRGBA[0] = 0xff;
;1053:				model.shaderRGBA[1] = 0xff;
;1054:				model.shaderRGBA[2] = 0xff;
;1055:				model.shaderRGBA[3] = 0xff;
;1056:				//
;1057:				model.origin[2] += 56;
;1058:				model.hModel = cgs.media.overloadTargetModel;
;1059:				trap_R_AddRefEntityToScene( &model );
;1060:			}
;1061:			else {
;1062:				//FIXME: show animated smoke
;1063:			}
;1064:		}
;1065:		else {
;1066:			cent->miscTime = 0;
;1067:			cent->muzzleFlashTime = 0;
;1068:			// modelindex2 is the health value of the obelisk
;1069:			c = cent->currentState.modelindex2;
;1070:			model.shaderRGBA[0] = 0xff;
;1071:			model.shaderRGBA[1] = c;
;1072:			model.shaderRGBA[2] = c;
;1073:			model.shaderRGBA[3] = 0xff;
;1074:			// show the lights
;1075:			model.hModel = cgs.media.overloadLightsModel;
;1076:			trap_R_AddRefEntityToScene( &model );
;1077:			// show the target
;1078:			model.origin[2] += 56;
;1079:			model.hModel = cgs.media.overloadTargetModel;
;1080:			trap_R_AddRefEntityToScene( &model );
;1081:		}
;1082:	}
;1083:	else if ( cgs.gametype == GT_HARVESTER ) {
;1084:		// show harvester model
;1085:		memset(&model, 0, sizeof(model));
;1086:		model.reType = RT_MODEL;
;1087:		VectorCopy( cent->lerpOrigin, model.lightingOrigin );
;1088:		VectorCopy( cent->lerpOrigin, model.origin );
;1089:		AnglesToAxis( cent->currentState.angles, model.axis );
;1090:
;1091:		if ( cent->currentState.modelindex == TEAM_RED ) {
;1092:			model.hModel = cgs.media.harvesterModel;
;1093:			model.customSkin = cgs.media.harvesterRedSkin;
;1094:		}
;1095:		else if ( cent->currentState.modelindex == TEAM_BLUE ) {
;1096:			model.hModel = cgs.media.harvesterModel;
;1097:			model.customSkin = cgs.media.harvesterBlueSkin;
;1098:		}
;1099:		else {
;1100:			model.hModel = cgs.media.harvesterNeutralModel;
;1101:			model.customSkin = 0;
;1102:		}
;1103:		trap_R_AddRefEntityToScene( &model );
;1104:	}
;1105:#endif
;1106:}
LABELV $596
endproc CG_TeamBase 140 12
proc CG_AddCEntity 8 8
line 1114
;1107:
;1108:/*
;1109:===============
;1110:CG_AddCEntity
;1111:
;1112:===============
;1113:*/
;1114:static void CG_AddCEntity( centity_t *cent ) {
line 1116
;1115:	// event-only entities will have been dealt with already
;1116:	if ( cent->currentState.eType >= ET_EVENTS ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 14
LTI4 $617
line 1117
;1117:		return;
ADDRGP4 $616
JUMPV
LABELV $617
line 1121
;1118:	}
;1119:
;1120:	// calculate the current origin
;1121:	CG_CalcEntityLerpPositions( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CalcEntityLerpPositions
CALLV
pop
line 1124
;1122:
;1123:	// add automatic effects
;1124:	CG_EntityEffects( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_EntityEffects
CALLV
pop
line 1126
;1125:
;1126:	switch ( cent->currentState.eType ) {
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
LTI4 $619
ADDRLP4 0
INDIRI4
CNSTI4 15
GTI4 $619
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $636
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $636
address $624
address $625
address $626
address $627
address $628
address $630
address $631
address $632
address $620
address $620
address $620
address $633
address $635
address $634
address $619
address $629
code
LABELV $619
line 1128
;1127:	default:
;1128:		CG_Error( "Bad entity type: %i\n", cent->currentState.eType );
ADDRGP4 $622
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
line 1129
;1129:		break;
ADDRGP4 $620
JUMPV
line 1133
;1130:	case ET_INVISIBLE:
;1131:	case ET_PUSH_TRIGGER:
;1132:	case ET_TELEPORT_TRIGGER:
;1133:		break;
LABELV $624
line 1135
;1134:	case ET_GENERAL:
;1135:		CG_General( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_General
CALLV
pop
line 1136
;1136:		break;
ADDRGP4 $620
JUMPV
LABELV $625
line 1138
;1137:	case ET_PLAYER:
;1138:		CG_Player( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Player
CALLV
pop
line 1139
;1139:		break;
ADDRGP4 $620
JUMPV
LABELV $626
line 1141
;1140:	case ET_ITEM:
;1141:		CG_Item( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Item
CALLV
pop
line 1142
;1142:		break;
ADDRGP4 $620
JUMPV
LABELV $627
line 1144
;1143:	case ET_MISSILE:
;1144:		CG_Missile( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Missile
CALLV
pop
line 1145
;1145:		break;
ADDRGP4 $620
JUMPV
LABELV $628
line 1147
;1146:	case ET_MOVER:
;1147:		CG_Mover( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Mover
CALLV
pop
line 1148
;1148:		break;
ADDRGP4 $620
JUMPV
LABELV $629
line 1150
;1149:	case ET_BREAKABLE:
;1150: 		CG_Mover( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Mover
CALLV
pop
line 1151
;1151: 		break;
ADDRGP4 $620
JUMPV
LABELV $630
line 1153
;1152:	case ET_BEAM:
;1153:		CG_Beam( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Beam
CALLV
pop
line 1154
;1154:		break;
ADDRGP4 $620
JUMPV
LABELV $631
line 1156
;1155:	case ET_PORTAL:
;1156:		CG_Portal( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Portal
CALLV
pop
line 1157
;1157:		break;
ADDRGP4 $620
JUMPV
LABELV $632
line 1159
;1158:	case ET_SPEAKER:
;1159:		CG_Speaker( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Speaker
CALLV
pop
line 1160
;1160:		break;
ADDRGP4 $620
JUMPV
LABELV $633
line 1162
;1161:	case ET_GRAPPLE:
;1162:		CG_Grapple( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Grapple
CALLV
pop
line 1163
;1163:		break;
ADDRGP4 $620
JUMPV
LABELV $634
line 1165
;1164:	case ET_BUILDABLE:
;1165:		CG_TURRET(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_TURRET
CALLV
pop
line 1166
;1166:		break;
ADDRGP4 $620
JUMPV
LABELV $635
line 1168
;1167:	case ET_TEAM:
;1168:		CG_TeamBase( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_TeamBase
CALLV
pop
line 1169
;1169:		break;
LABELV $620
line 1171
;1170:	}
;1171:}
LABELV $616
endproc CG_AddCEntity 8 8
export CG_AddPacketEntities
proc CG_AddPacketEntities 20 12
line 1179
;1172:
;1173:/*
;1174:===============
;1175:CG_AddPacketEntities
;1176:
;1177:===============
;1178:*/
;1179:void CG_AddPacketEntities( void ) {
line 1185
;1180:	int					num;
;1181:	centity_t			*cent;
;1182:	playerState_t		*ps;
;1183:
;1184:	// set cg.frameInterpolation
;1185:	if ( cg.nextSnap ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $638
line 1188
;1186:		int		delta;
;1187:
;1188:		delta = (cg.nextSnap->serverTime - cg.snap->serverTime);
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
line 1189
;1189:		if ( delta == 0 ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $643
line 1190
;1190:			cg.frameInterpolation = 0;
ADDRGP4 cg+109636
CNSTF4 0
ASGNF4
line 1191
;1191:		} else {
ADDRGP4 $639
JUMPV
LABELV $643
line 1192
;1192:			cg.frameInterpolation = (float)( cg.time - cg.snap->serverTime ) / delta;
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
line 1193
;1193:		}
line 1194
;1194:	} else {
ADDRGP4 $639
JUMPV
LABELV $638
line 1195
;1195:		cg.frameInterpolation = 0;	// actually, it should never be used, because 
ADDRGP4 cg+109636
CNSTF4 0
ASGNF4
line 1197
;1196:									// no entities should be marked as interpolating
;1197:	}
LABELV $639
line 1200
;1198:
;1199:	// the auto-rotating items will all have the same axis
;1200:	cg.autoAngles[0] = 0;
ADDRGP4 cg+111008
CNSTF4 0
ASGNF4
line 1201
;1201:	cg.autoAngles[1] = ( cg.time & 2047 ) * 360 / 2048.0;
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
line 1202
;1202:	cg.autoAngles[2] = 0;
ADDRGP4 cg+111008+8
CNSTF4 0
ASGNF4
line 1204
;1203:
;1204:	cg.autoAnglesFast[0] = 0;
ADDRGP4 cg+111056
CNSTF4 0
ASGNF4
line 1205
;1205:	cg.autoAnglesFast[1] = ( cg.time & 1023 ) * 360 / 1024.0f;
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
line 1206
;1206:	cg.autoAnglesFast[2] = 0;
ADDRGP4 cg+111056+8
CNSTF4 0
ASGNF4
line 1208
;1207:
;1208:	AnglesToAxis( cg.autoAngles, cg.autoAxis );
ADDRGP4 cg+111008
ARGP4
ADDRGP4 cg+111020
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1209
;1209:	AnglesToAxis( cg.autoAnglesFast, cg.autoAxisFast );
ADDRGP4 cg+111056
ARGP4
ADDRGP4 cg+111068
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1212
;1210:
;1211:	// generate and add the entity from the playerstate
;1212:	ps = &cg.predictedPlayerState;
ADDRLP4 8
ADDRGP4 cg+109684
ASGNP4
line 1213
;1213:	BG_PlayerStateToEntityState( ps, &cg.predictedPlayerEntity.currentState, qfalse );
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
line 1214
;1214:	CG_AddCEntity( &cg.predictedPlayerEntity );
ADDRGP4 cg+110152
ARGP4
ADDRGP4 CG_AddCEntity
CALLV
pop
line 1217
;1215:
;1216:	// lerp the non-predicted value for lightning gun origins
;1217:	CG_CalcEntityLerpPositions( &cg_entities[ cg.snap->ps.clientNum ] );
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
line 1220
;1218:
;1219://unlagged - early transitioning
;1220:	if ( cg.nextSnap ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $670
line 1223
;1221:		// pre-add some of the entities sent over by the server
;1222:		// we have data for them and they don't need to interpolate
;1223:		for ( num = 0 ; num < cg.nextSnap->numEntities ; num++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $676
JUMPV
LABELV $673
line 1224
;1224:			cent = &cg_entities[ cg.nextSnap->entities[ num ].number ];
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
line 1225
;1225:			if ( cent->nextState.eType == ET_MISSILE || cent->nextState.eType == ET_GENERAL ) {
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
EQI4 $681
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $679
LABELV $681
line 1227
;1226:				// transition it immediately and add it
;1227:				CG_TransitionEntity( cent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_TransitionEntity
CALLV
pop
line 1228
;1228:				cent->interpolate = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 1
ASGNI4
line 1229
;1229:				CG_AddCEntity( cent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddCEntity
CALLV
pop
line 1230
;1230:			}
LABELV $679
line 1231
;1231:		}
LABELV $674
line 1223
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $676
ADDRLP4 4
INDIRI4
ADDRGP4 cg+40
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $673
line 1232
;1232:	}
LABELV $670
line 1236
;1233://unlagged - early transitioning
;1234:
;1235:	// add each entity sent over by the server
;1236:	for ( num = 0 ; num < cg.snap->numEntities ; num++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $685
JUMPV
LABELV $682
line 1237
;1237:		cent = &cg_entities[ cg.snap->entities[ num ].number ];
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
line 1239
;1238://unlagged - early transitioning
;1239:		if ( !cg.nextSnap || cent->nextState.eType != ET_MISSILE && cent->nextState.eType != ET_GENERAL ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $691
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
EQI4 $688
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $688
LABELV $691
line 1241
;1240://unlagged - early transitioning
;1241:			CG_AddCEntity( cent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddCEntity
CALLV
pop
line 1242
;1242:		}
LABELV $688
line 1243
;1243:	}
LABELV $683
line 1236
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $685
ADDRLP4 4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $682
line 1244
;1244:}
LABELV $637
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
LABELV $622
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
LABELV $539
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
