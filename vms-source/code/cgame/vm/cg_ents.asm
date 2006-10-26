code
proc CG_TURRET 160 12
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
line 16
;12:	refEntity_t			ent;
;13:	entityState_t		*s1;
;14:	int					team;
;15:
;16:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 18
;17:
;18:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 20
;19:
;20:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 21
;21:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 24
;22:
;23:
;24:	ent.frame = s1->frame;
ADDRLP4 0+80
ADDRLP4 140
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
line 25
;25:	ent.oldframe = ent.frame;
ADDRLP4 0+96
ADDRLP4 0+80
INDIRI4
ASGNI4
line 26
;26:	ent.backlerp = 0;
ADDRLP4 0+100
CNSTF4 0
ASGNF4
line 28
;27:	// convert angles to axis
;28:	AnglesToAxis( cent->lerpAngles, ent.axis );
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
line 30
;29:	
;30:	ent.hModel=cgs.gameModels[s1->modelindex];
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
line 32
;31:	// add to refresh list
;32:	switch (s1->time2){
ADDRLP4 148
ADDRLP4 140
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ASGNI4
ADDRLP4 156
CNSTI4 1
ASGNI4
ADDRLP4 148
INDIRI4
ADDRLP4 156
INDIRI4
EQI4 $85
ADDRLP4 148
INDIRI4
CNSTI4 2
EQI4 $89
ADDRLP4 148
INDIRI4
CNSTI4 3
EQI4 $93
ADDRLP4 148
INDIRI4
ADDRLP4 156
INDIRI4
LTI4 $82
LABELV $98
ADDRLP4 148
INDIRI4
CNSTI4 9
EQI4 $94
ADDRGP4 $82
JUMPV
LABELV $85
line 34
;33:	case 1:
;34:		trap_R_AddRefEntityToScene (&ent); // make the model show up
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 35
;35:		ent.customShader=cgs.media.battleSuitShader;
ADDRLP4 0+112
ADDRGP4 cgs+153876+440
INDIRI4
ASGNI4
line 36
;36:		trap_R_AddRefEntityToScene (&ent); // make the shader show up
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 37
;37:		CG_PlayerSprites(cent); // This needs some work
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerSprites
CALLV
pop
line 38
;38:		break;	
ADDRGP4 $83
JUMPV
LABELV $89
line 40
;39:	case 2:
;40:		ent.customShader=cgs.media.invisShader;
ADDRLP4 0+112
ADDRGP4 cgs+153876+432
INDIRI4
ASGNI4
line 41
;41:		trap_R_AddRefEntityToScene (&ent); // make the shader show up. no model
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 42
;42:		CG_PlayerSprites(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerSprites
CALLV
pop
line 43
;43:		break;
ADDRGP4 $83
JUMPV
LABELV $93
line 45
;44:	case 3:
;45:		trap_R_AddRefEntityToScene (&ent); // just add the model (uncloaked cloaking turret)
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 46
;46:		CG_PlayerSprites(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerSprites
CALLV
pop
line 48
;47:		
;48:		break;
ADDRGP4 $83
JUMPV
LABELV $94
line 51
;49:	case 9:
;50:		// Being Built
;51:		trap_R_AddRefEntityToScene (&ent); // make the model show up
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 52
;52:		ent.customShader=cgs.media.buildShader;
ADDRLP4 0+112
ADDRGP4 cgs+153876+420
INDIRI4
ASGNI4
line 53
;53:		trap_R_AddRefEntityToScene (&ent); // make the shader show up
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 54
;54:		CG_PlayerSprites(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerSprites
CALLV
pop
line 55
;55:		break;
ADDRGP4 $83
JUMPV
LABELV $82
line 57
;56:	default:
;57:		trap_R_AddRefEntityToScene (&ent); // if something else has happened
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 58
;58:		CG_PlayerSprites(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerSprites
CALLV
pop
line 59
;59:	}
LABELV $83
line 64
;60:
;61:	
;62:		
;63:		
;64:}
LABELV $72
endproc CG_TURRET 160 12
export CG_PositionEntityOnTag
proc CG_PositionEntityOnTag 84 24
line 75
;65:
;66:/*
;67:======================
;68:CG_PositionEntityOnTag
;69:
;70:Modifies the entities position and axis by the given
;71:tag location
;72:======================
;73:*/
;74:void CG_PositionEntityOnTag( refEntity_t *entity, const refEntity_t *parent, 
;75:							qhandle_t parentModel, char *tagName ) {
line 80
;76:	int				i;
;77:	orientation_t	lerped;
;78:	
;79:	// lerp the tag
;80:	trap_R_LerpTag( &lerped, parentModel, parent->oldframe, parent->frame,
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
line 84
;81:		1.0 - parent->backlerp, tagName );
;82:
;83:	// FIXME: allow origin offsets along tag?
;84:	VectorCopy( parent->origin, entity->origin );
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
line 85
;85:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $100
line 86
;86:		VectorMA( entity->origin, lerped.origin[i], parent->axis[i], entity->origin );
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
line 87
;87:	}
LABELV $101
line 85
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
line 90
;88:
;89:	// had to cast away the const to avoid compiler problems...
;90:	MatrixMultiply( lerped.axis, ((refEntity_t *)parent)->axis, entity->axis );
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
line 91
;91:	entity->backlerp = parent->backlerp;
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
line 92
;92:}
LABELV $99
endproc CG_PositionEntityOnTag 84 24
export CG_PositionRotatedEntityOnTag
proc CG_PositionRotatedEntityOnTag 120 24
line 104
;93:
;94:
;95:/*
;96:======================
;97:CG_PositionRotatedEntityOnTag
;98:
;99:Modifies the entities position and axis by the given
;100:tag location
;101:======================
;102:*/
;103:void CG_PositionRotatedEntityOnTag( refEntity_t *entity, const refEntity_t *parent, 
;104:							qhandle_t parentModel, char *tagName ) {
line 111
;105:	int				i;
;106:	orientation_t	lerped;
;107:	vec3_t			tempAxis[3];
;108:
;109://AxisClear( entity->axis );
;110:	// lerp the tag
;111:	trap_R_LerpTag( &lerped, parentModel, parent->oldframe, parent->frame,
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
line 115
;112:		1.0 - parent->backlerp, tagName );
;113:
;114:	// FIXME: allow origin offsets along tag?
;115:	VectorCopy( parent->origin, entity->origin );
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
line 116
;116:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $106
line 117
;117:		VectorMA( entity->origin, lerped.origin[i], parent->axis[i], entity->origin );
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
line 118
;118:	}
LABELV $107
line 116
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
line 121
;119:
;120:	// had to cast away the const to avoid compiler problems...
;121:	MatrixMultiply( entity->axis, lerped.axis, tempAxis );
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
line 122
;122:	MatrixMultiply( tempAxis, ((refEntity_t *)parent)->axis, entity->axis );
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
line 123
;123:}
LABELV $105
endproc CG_PositionRotatedEntityOnTag 120 24
export CG_SetEntitySoundPosition
proc CG_SetEntitySoundPosition 24 8
line 142
;124:
;125:
;126:
;127:/*
;128:==========================================================================
;129:
;130:FUNCTIONS CALLED EACH FRAME
;131:
;132:==========================================================================
;133:*/
;134:
;135:/*
;136:======================
;137:CG_SetEntitySoundPosition
;138:
;139:Also called by event processing code
;140:======================
;141:*/
;142:void CG_SetEntitySoundPosition( centity_t *cent ) {
line 143
;143:	if ( cent->currentState.solid == SOLID_BMODEL ) {
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
NEI4 $112
line 147
;144:		vec3_t	origin;
;145:		float	*v;
;146:
;147:		v = cgs.inlineModelMidpoints[ cent->currentState.modelindex ];
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
line 148
;148:		VectorAdd( cent->lerpOrigin, v, origin );
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
line 149
;149:		trap_S_UpdateEntityPosition( cent->currentState.number, origin );
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_S_UpdateEntityPosition
CALLV
pop
line 150
;150:	} else {
ADDRGP4 $113
JUMPV
LABELV $112
line 151
;151:		trap_S_UpdateEntityPosition( cent->currentState.number, cent->lerpOrigin );
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
line 152
;152:	}
LABELV $113
line 153
;153:}
LABELV $111
endproc CG_SetEntitySoundPosition 24 8
proc CG_EntityEffects 20 20
line 162
;154:
;155:/*
;156:==================
;157:CG_EntityEffects
;158:
;159:Add continuous entity effects, like local entity emission and lighting
;160:==================
;161:*/
;162:static void CG_EntityEffects( centity_t *cent ) {
line 165
;163:
;164:	// update sound origins
;165:	CG_SetEntitySoundPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetEntitySoundPosition
CALLV
pop
line 168
;166:
;167:	// add loop sound
;168:	if ( cent->currentState.loopSound ) {
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
CNSTI4 0
EQI4 $118
line 169
;169:		if (cent->currentState.eType != ET_SPEAKER) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 7
EQI4 $120
line 170
;170:			trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, 
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
line 172
;171:				cgs.gameSounds[ cent->currentState.loopSound ] );
;172:		} else {
ADDRGP4 $121
JUMPV
LABELV $120
line 173
;173:			trap_S_AddRealLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, 
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
line 175
;174:				cgs.gameSounds[ cent->currentState.loopSound ] );
;175:		}
LABELV $121
line 176
;176:	}
LABELV $118
line 180
;177:
;178:
;179:	// constant light glow
;180:	if ( cent->currentState.constantLight ) {
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 0
EQI4 $124
line 184
;181:		int		cl;
;182:		int		i, r, g, b;
;183:
;184:		cl = cent->currentState.constantLight;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ASGNI4
line 185
;185:		r = cl & 255;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 186
;186:		g = ( cl >> 8 ) & 255;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
ASGNI4
line 187
;187:		b = ( cl >> 16 ) & 255;
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 16
RSHI4
CNSTI4 255
BANDI4
ASGNI4
line 188
;188:		i = ( ( cl >> 24 ) & 255 ) * 4;
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
line 189
;189:		trap_R_AddLightToScene( cent->lerpOrigin, i, r, g, b );
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
line 190
;190:	}
LABELV $124
line 192
;191:
;192:}
LABELV $117
endproc CG_EntityEffects 20 20
proc CG_General 144 12
line 200
;193:
;194:
;195:/*
;196:==================
;197:CG_General
;198:==================
;199:*/
;200:static void CG_General( centity_t *cent ) {
line 204
;201:	refEntity_t			ent;
;202:	entityState_t		*s1;
;203:
;204:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 207
;205:
;206:	// if set to invisible, skip
;207:	if (!s1->modelindex) {
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 0
NEI4 $127
line 208
;208:		return;
ADDRGP4 $126
JUMPV
LABELV $127
line 211
;209:	}
;210:
;211:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 215
;212:
;213:	// set frame
;214:
;215:	ent.frame = s1->frame;
ADDRLP4 0+80
ADDRLP4 140
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
line 216
;216:	ent.oldframe = ent.frame;
ADDRLP4 0+96
ADDRLP4 0+80
INDIRI4
ASGNI4
line 217
;217:	ent.backlerp = 0;
ADDRLP4 0+100
CNSTF4 0
ASGNF4
line 219
;218:
;219:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 220
;220:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 222
;221:
;222:	ent.hModel = cgs.gameModels[s1->modelindex];
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
line 225
;223:
;224:	// player model
;225:	if (s1->number == cg.snap->ps.clientNum) {
ADDRLP4 140
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $137
line 226
;226:		ent.renderfx |= RF_THIRD_PERSON;	// only draw from mirrors
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 227
;227:	}
LABELV $137
line 230
;228:
;229:	// convert angles to axis
;230:	AnglesToAxis( cent->lerpAngles, ent.axis );
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
line 233
;231:
;232:	// add to refresh list
;233:	trap_R_AddRefEntityToScene (&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 234
;234:}
LABELV $126
endproc CG_General 144 12
proc CG_Speaker 16 16
line 243
;235:
;236:/*
;237:==================
;238:CG_Speaker
;239:
;240:Speaker entities can automatically play sounds
;241:==================
;242:*/
;243:static void CG_Speaker( centity_t *cent ) {
line 244
;244:	if ( ! cent->currentState.clientNum ) {	// FIXME: use something other than clientNum...
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 0
NEI4 $143
line 245
;245:		return;		// not auto triggering
ADDRGP4 $142
JUMPV
LABELV $143
line 248
;246:	}
;247:
;248:	if ( cg.time < cent->miscTime ) {
ADDRGP4 cg+109652
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
GEI4 $145
line 249
;249:		return;
ADDRGP4 $142
JUMPV
LABELV $145
line 252
;250:	}
;251:
;252:	trap_S_StartSound (NULL, cent->currentState.number, CHAN_ITEM, cgs.gameSounds[cent->currentState.eventParm] );
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
line 256
;253:
;254:	//	ent->s.frame = ent->wait * 10;
;255:	//	ent->s.clientNum = ent->random * 10;
;256:	cent->miscTime = cg.time + cent->currentState.frame * 100 + cent->currentState.clientNum * 100 * crandom();
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
line 257
;257:}
LABELV $142
endproc CG_Speaker 16 16
proc CG_Item 212 12
line 264
;258:
;259:/*
;260:==================
;261:CG_Item
;262:==================
;263:*/
;264:static void CG_Item( centity_t *cent ) {
line 273
;265:	refEntity_t		ent;
;266:	entityState_t	*es;
;267:	gitem_t			*item;
;268:	int				msec;
;269:	float			frac;
;270:	float			scale;
;271:	weaponInfo_t	*wi;
;272:
;273:	es = &cent->currentState;
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
line 274
;274:	if ( es->modelindex >= bg_numItems ) {
ADDRLP4 144
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $151
line 275
;275:		CG_Error( "Bad item index %i on entity", es->modelindex );
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
line 276
;276:	}
LABELV $151
line 279
;277:
;278:	// if set to invisible, skip
;279:	if ( !es->modelindex || ( es->eFlags & EF_NODRAW ) ) {
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
line 280
;280:		return;
ADDRGP4 $150
JUMPV
LABELV $154
line 283
;281:	}
;282:
;283:	item = &bg_itemlist[ es->modelindex ];
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
line 284
;284:	if ( cg_simpleItems.integer && item->giType != IT_TEAM ) {
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
line 285
;285:		memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 286
;286:		ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 287
;287:		VectorCopy( cent->lerpOrigin, ent.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 288
;288:		ent.radius = 14;
ADDRLP4 0+132
CNSTF4 1096810496
ASGNF4
line 289
;289:		ent.customShader = cg_items[es->modelindex].icon;
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
line 290
;290:		ent.shaderRGBA[0] = 255;
ADDRLP4 0+116
CNSTU1 255
ASGNU1
line 291
;291:		ent.shaderRGBA[1] = 255;
ADDRLP4 0+116+1
CNSTU1 255
ASGNU1
line 292
;292:		ent.shaderRGBA[2] = 255;
ADDRLP4 0+116+2
CNSTU1 255
ASGNU1
line 293
;293:		ent.shaderRGBA[3] = 255;
ADDRLP4 0+116+3
CNSTU1 255
ASGNU1
line 294
;294:		trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 295
;295:		return;
ADDRGP4 $150
JUMPV
LABELV $157
line 299
;296:	}
;297:
;298:	// items bob up and down continuously
;299:	scale = 0.005 + cent->currentState.number * 0.00001;
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
line 300
;300:	cent->lerpOrigin[2] += 4 + cos( ( cg.time + 1000 ) *  scale ) * 4;
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
line 302
;301:
;302:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 305
;303:
;304:	// autorotate at one of two speeds
;305:	if ( item->giType == IT_HEALTH ) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 4
NEI4 $172
line 306
;306:		VectorCopy( cg.autoAnglesFast, cent->lerpAngles );
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRGP4 cg+111056
INDIRB
ASGNB 12
line 307
;307:		AxisCopy( cg.autoAxisFast, ent.axis );
ADDRGP4 cg+111068
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AxisCopy
CALLV
pop
line 308
;308:	} else {
ADDRGP4 $173
JUMPV
LABELV $172
line 309
;309:		VectorCopy( cg.autoAngles, cent->lerpAngles );
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRGP4 cg+111008
INDIRB
ASGNB 12
line 310
;310:		AxisCopy( cg.autoAxis, ent.axis );
ADDRGP4 cg+111020
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AxisCopy
CALLV
pop
line 311
;311:	}
LABELV $173
line 313
;312:
;313:	wi = NULL;
ADDRLP4 152
CNSTP4 0
ASGNP4
line 317
;314:	// the weapons have their origin where they attatch to player
;315:	// models, so we need to offset them or they will rotate
;316:	// eccentricly
;317:	if ( item->giType == IT_WEAPON ) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $180
line 318
;318:		wi = &cg_weapons[item->giTag];
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
line 319
;319:		cent->lerpOrigin[0] -= 
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
line 323
;320:			wi->weaponMidpoint[0] * ent.axis[0][0] +
;321:			wi->weaponMidpoint[1] * ent.axis[1][0] +
;322:			wi->weaponMidpoint[2] * ent.axis[2][0];
;323:		cent->lerpOrigin[1] -= 
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
line 327
;324:			wi->weaponMidpoint[0] * ent.axis[0][1] +
;325:			wi->weaponMidpoint[1] * ent.axis[1][1] +
;326:			wi->weaponMidpoint[2] * ent.axis[2][1];
;327:		cent->lerpOrigin[2] -= 
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
line 332
;328:			wi->weaponMidpoint[0] * ent.axis[0][2] +
;329:			wi->weaponMidpoint[1] * ent.axis[1][2] +
;330:			wi->weaponMidpoint[2] * ent.axis[2][2];
;331:
;332:		cent->lerpOrigin[2] += 8;	// an extra height boost
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
line 333
;333:	}
LABELV $180
line 335
;334:
;335:	ent.hModel = cg_items[es->modelindex].models[0];
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
line 337
;336:
;337:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 338
;338:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 340
;339:
;340:	ent.nonNormalizedAxes = qfalse;
ADDRLP4 0+64
CNSTI4 0
ASGNI4
line 343
;341:
;342:	// if just respawned, slowly scale up
;343:	msec = cg.time - cent->miscTime;
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
line 344
;344:	if ( msec >= 0 && msec < ITEM_SCALEUP_TIME ) {
ADDRLP4 156
INDIRI4
CNSTI4 0
LTI4 $209
ADDRLP4 156
INDIRI4
CNSTI4 1000
GEI4 $209
line 345
;345:		frac = (float)msec / ITEM_SCALEUP_TIME;
ADDRLP4 148
ADDRLP4 156
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ASGNF4
line 346
;346:		VectorScale( ent.axis[0], frac, ent.axis[0] );
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
line 347
;347:		VectorScale( ent.axis[1], frac, ent.axis[1] );
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
line 348
;348:		VectorScale( ent.axis[2], frac, ent.axis[2] );
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
line 349
;349:		ent.nonNormalizedAxes = qtrue;
ADDRLP4 0+64
CNSTI4 1
ASGNI4
line 350
;350:	} else {
ADDRGP4 $210
JUMPV
LABELV $209
line 351
;351:		frac = 1.0;
ADDRLP4 148
CNSTF4 1065353216
ASGNF4
line 352
;352:	}
LABELV $210
line 356
;353:
;354:	// items without glow textures need to keep a minimum light value
;355:	// so they are always visible
;356:	if ( ( item->giType == IT_WEAPON ) ||
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
line 357
;357:		 ( item->giType == IT_ARMOR ) ) {
line 358
;358:		ent.renderfx |= RF_MINLIGHT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 359
;359:	}
LABELV $254
line 362
;360:
;361:	// increase the size of the weapons when they are presented as items
;362:	if ( item->giType == IT_WEAPON ) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $258
line 363
;363:		VectorScale( ent.axis[0], 1.5, ent.axis[0] );
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
line 364
;364:		VectorScale( ent.axis[1], 1.5, ent.axis[1] );
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
line 365
;365:		VectorScale( ent.axis[2], 1.5, ent.axis[2] );
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
line 366
;366:		ent.nonNormalizedAxes = qtrue;
ADDRLP4 0+64
CNSTI4 1
ASGNI4
line 370
;367:#ifdef MISSIONPACK
;368:		trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, cgs.media.weaponHoverSound );
;369:#endif
;370:	}
LABELV $258
line 382
;371:
;372:#ifdef MISSIONPACK
;373:	if ( item->giType == IT_HOLDABLE && item->giTag == HI_KAMIKAZE ) {
;374:		VectorScale( ent.axis[0], 2, ent.axis[0] );
;375:		VectorScale( ent.axis[1], 2, ent.axis[1] );
;376:		VectorScale( ent.axis[2], 2, ent.axis[2] );
;377:		ent.nonNormalizedAxes = qtrue;
;378:	}
;379:#endif
;380:
;381:	// add to refresh list
;382:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 406
;383:
;384:#ifdef MISSIONPACK
;385:	if ( item->giType == IT_WEAPON && wi->barrelModel ) {
;386:		refEntity_t	barrel;
;387:
;388:		memset( &barrel, 0, sizeof( barrel ) );
;389:
;390:		barrel.hModel = wi->barrelModel;
;391:
;392:		VectorCopy( ent.lightingOrigin, barrel.lightingOrigin );
;393:		barrel.shadowPlane = ent.shadowPlane;
;394:		barrel.renderfx = ent.renderfx;
;395:
;396:		CG_PositionRotatedEntityOnTag( &barrel, &ent, wi->weaponModel, "tag_barrel" );
;397:
;398:		AxisCopy( ent.axis, barrel.axis );
;399:		barrel.nonNormalizedAxes = ent.nonNormalizedAxes;
;400:
;401:		trap_R_AddRefEntityToScene( &barrel );
;402:	}
;403:#endif
;404:
;405:	// accompanying rings / spheres for powerups
;406:	if ( !cg_simpleItems.integer ) 
ADDRGP4 cg_simpleItems+12
INDIRI4
CNSTI4 0
NEI4 $303
line 407
;407:	{
line 410
;408:		vec3_t spinAngles;
;409:
;410:		VectorClear( spinAngles );
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
line 412
;411:
;412:		if ( item->giType == IT_HEALTH || item->giType == IT_POWERUP )
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
line 413
;413:		{
line 414
;414:			if ( ( ent.hModel = cg_items[es->modelindex].models[1] ) != 0 )
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
line 415
;415:			{
line 416
;416:				if ( item->giType == IT_POWERUP )
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $316
line 417
;417:				{
line 418
;418:					ent.origin[2] += 12;
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
CNSTF4 1094713344
ADDF4
ASGNF4
line 419
;419:					spinAngles[1] = ( cg.time & 1023 ) * 360 / -1024.0f;
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
line 420
;420:				}
LABELV $316
line 421
;421:				AnglesToAxis( spinAngles, ent.axis );
ADDRLP4 188
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 424
;422:				
;423:				// scale up if respawning
;424:				if ( frac != 1.0 ) {
ADDRLP4 148
INDIRF4
CNSTF4 1065353216
EQF4 $323
line 425
;425:					VectorScale( ent.axis[0], frac, ent.axis[0] );
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
line 426
;426:					VectorScale( ent.axis[1], frac, ent.axis[1] );
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
line 427
;427:					VectorScale( ent.axis[2], frac, ent.axis[2] );
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
line 428
;428:					ent.nonNormalizedAxes = qtrue;
ADDRLP4 0+64
CNSTI4 1
ASGNI4
line 429
;429:				}
LABELV $323
line 430
;430:				trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 431
;431:			}
LABELV $311
line 432
;432:		}
LABELV $308
line 433
;433:	}
LABELV $303
line 434
;434:}
LABELV $150
endproc CG_Item 212 12
proc CG_Missile 164 20
line 443
;435:
;436://============================================================================
;437:
;438:/*
;439:===============
;440:CG_Missile
;441:===============
;442:*/
;443:static void CG_Missile( centity_t *cent ) {
line 449
;444:	refEntity_t			ent;
;445:	entityState_t		*s1;
;446:	const weaponInfo_t		*weapon;
;447://	int	col;
;448:
;449:	s1 = &cent->currentState;
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
line 450
;450:	if ( s1->weapon > WP_NUM_WEAPONS ) {
ADDRLP4 144
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 12
LEI4 $369
line 451
;451:		s1->weapon = 0;
ADDRLP4 144
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 452
;452:	}
LABELV $369
line 453
;453:	weapon = &cg_weapons[s1->weapon];
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
line 456
;454:
;455:	// calculate the axis
;456:	VectorCopy( s1->angles, cent->lerpAngles);
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
line 459
;457:
;458:	// add trails
;459:	if ( weapon->missileTrailFunc ) 
ADDRLP4 140
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $371
line 460
;460:	{
line 461
;461:		weapon->missileTrailFunc( cent, weapon );
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
line 462
;462:	}
LABELV $371
line 481
;463:/*
;464:	if ( cent->currentState.modelindex == TEAM_RED ) {
;465:		col = 1;
;466:	}
;467:	else if ( cent->currentState.modelindex == TEAM_BLUE ) {
;468:		col = 2;
;469:	}
;470:	else {
;471:		col = 0;
;472:	}
;473:
;474:	// add dynamic light
;475:	if ( weapon->missileDlight ) {
;476:		trap_R_AddLightToScene(cent->lerpOrigin, weapon->missileDlight, 
;477:			weapon->missileDlightColor[col][0], weapon->missileDlightColor[col][1], weapon->missileDlightColor[col][2] );
;478:	}
;479:*/
;480:	// add dynamic light
;481:	if ( weapon->missileDlight ) {
ADDRLP4 140
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
CNSTF4 0
EQF4 $373
line 482
;482:		trap_R_AddLightToScene(cent->lerpOrigin, weapon->missileDlight, 
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
line 484
;483:			weapon->missileDlightColor[0], weapon->missileDlightColor[1], weapon->missileDlightColor[2] );
;484:	}
LABELV $373
line 487
;485:
;486:	// add missile sound
;487:	if ( weapon->missileSound ) {
ADDRLP4 140
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 0
EQI4 $375
line 490
;488:		vec3_t	velocity;
;489:
;490:		BG_EvaluateTrajectoryDelta( &cent->currentState.pos, cg.time, velocity );
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
line 492
;491:
;492:		trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, velocity, weapon->missileSound );
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
line 493
;493:	}
LABELV $375
line 496
;494:
;495:	// create the render entity
;496:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 497
;497:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 498
;498:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 512
;499:
;500:	/* Maybe?
;501:	if ( cent->currentState.weapon == WP_PLASMAGUN ) {
;502:		ent.reType = RT_SPRITE;
;503:		ent.radius = 16;
;504:		ent.rotation = 0;
;505:		ent.customShader = cgs.media.plasmaBallShader;
;506:		trap_R_AddRefEntityToScene( &ent );
;507:		return;
;508:	}
;509:	*/
;510:
;511:		// Shafe - Trep - turret // Machine Gun
;512:	if (cent->currentState.weapon == WP_MACHINEGUN ) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 2
NEI4 $380
line 513
;513:		ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 514
;514:		if (cent->currentState.eFlags & EF_ALT_FIRING)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $382
line 515
;515:		{
line 516
;516:			ent.radius = 6;
ADDRLP4 0+132
CNSTF4 1086324736
ASGNF4
line 517
;517:		} 
ADDRGP4 $383
JUMPV
LABELV $382
line 519
;518:		else
;519:		{
line 520
;520:			ent.radius = 3;
ADDRLP4 0+132
CNSTF4 1077936128
ASGNF4
line 521
;521:		}
LABELV $383
line 523
;522:
;523:		ent.rotation = 0;
ADDRLP4 0+136
CNSTF4 0
ASGNF4
line 524
;524:		ent.customShader = cgs.media.turretFireShader;
ADDRLP4 0+112
ADDRGP4 cgs+153876+516
INDIRI4
ASGNI4
line 525
;525:		trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 526
;526:		return;
ADDRGP4 $368
JUMPV
LABELV $380
line 530
;527:	} // End Shafe
;528:
;529:	// Shafe - Trep - turret // Machine Gun
;530:	if (cent->currentState.weapon == WP_TURRET ) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 11
NEI4 $390
line 531
;531:		ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 532
;532:		if (cent->currentState.eFlags & EF_ALT_FIRING)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $392
line 533
;533:		{
line 534
;534:			ent.radius = 5;
ADDRLP4 0+132
CNSTF4 1084227584
ASGNF4
line 535
;535:		} 
ADDRGP4 $393
JUMPV
LABELV $392
line 537
;536:		else
;537:		{
line 538
;538:			ent.radius = 3;
ADDRLP4 0+132
CNSTF4 1077936128
ASGNF4
line 539
;539:		}
LABELV $393
line 541
;540:
;541:		ent.rotation = 0;
ADDRLP4 0+136
CNSTF4 0
ASGNF4
line 542
;542:		ent.customShader = cgs.media.turretFireShader;
ADDRLP4 0+112
ADDRGP4 cgs+153876+516
INDIRI4
ASGNI4
line 543
;543:		trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 544
;544:		return;
ADDRGP4 $368
JUMPV
LABELV $390
line 548
;545:	} // End Shafe
;546:
;547:	// Shafe - Trep - Flame Thrower
;548:	if (cent->currentState.weapon == WP_LIGHTNING ) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 6
NEI4 $400
line 549
;549:		ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 550
;550:		ent.radius = 32;
ADDRLP4 0+132
CNSTF4 1107296256
ASGNF4
line 551
;551:		ent.rotation = 0;
ADDRLP4 0+136
CNSTF4 0
ASGNF4
line 552
;552:		ent.customShader = cgs.media.flameBallShader;
ADDRLP4 0+112
ADDRGP4 cgs+153876+504
INDIRI4
ASGNI4
line 553
;553:		trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 554
;554:		return;
ADDRGP4 $368
JUMPV
LABELV $400
line 558
;555:	} // End Shafe
;556:
;557:	// Shafe - Trep - Devastator
;558:	if (cent->currentState.weapon == WP_BFG ) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 9
NEI4 $407
line 559
;559:		ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 561
;560:		//ent.radius = 10;
;561:		ent.rotation = 0;
ADDRLP4 0+136
CNSTF4 0
ASGNF4
line 562
;562:		ent.customShader = cgs.media.bfgBallShader;
ADDRLP4 0+112
ADDRGP4 cgs+153876+512
INDIRI4
ASGNI4
line 563
;563:		if (cent->currentState.eFlags & EF_ALT_FIRING)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $413
line 564
;564:		{
line 565
;565:			ent.radius = 10;
ADDRLP4 0+132
CNSTF4 1092616192
ASGNF4
line 566
;566:		} 
ADDRGP4 $414
JUMPV
LABELV $413
line 568
;567:		else
;568:		{
line 569
;569:			ent.radius = 5;
ADDRLP4 0+132
CNSTF4 1084227584
ASGNF4
line 570
;570:		}
LABELV $414
line 571
;571:		trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 572
;572:		return;
ADDRGP4 $368
JUMPV
LABELV $407
line 576
;573:	} // End Shafe
;574:
;575:	// flicker between two skins
;576:	ent.skinNum = cg.clientFrame & 1;
ADDRLP4 0+104
ADDRGP4 cg
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 577
;577:	ent.hModel = weapon->missileModel;
ADDRLP4 0+8
ADDRLP4 140
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ASGNI4
line 578
;578:	ent.renderfx = weapon->missileRenderfx; // | RF_NOSHADOW;
ADDRLP4 0+4
ADDRLP4 140
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 589
;579:
;580:#ifdef MISSIONPACK
;581:	if ( cent->currentState.weapon == WP_PROX_LAUNCHER ) {
;582:		if (s1->generic1 == TEAM_BLUE) {
;583:			ent.hModel = cgs.media.blueProxMine;
;584:		}
;585:	}
;586:#endif
;587:
;588:	// convert direction of travel into axis
;589:	if ( VectorNormalize2( s1->pos.trDelta, ent.axis[0] ) == 0 ) {
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
line 590
;590:		ent.axis[0][2] = 1;
ADDRLP4 0+28+8
CNSTF4 1065353216
ASGNF4
line 591
;591:	}
LABELV $420
line 594
;592:
;593:	// spin as it moves
;594:	if ( s1->pos.trType != TR_STATIONARY ) {
ADDRLP4 144
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $425
line 595
;595:		RotateAroundDirection( ent.axis, cg.time / 4 );
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
line 596
;596:	} else {
ADDRGP4 $426
JUMPV
LABELV $425
line 603
;597:#ifdef MISSIONPACK
;598:		if ( s1->weapon == WP_PROX_LAUNCHER ) {
;599:			AnglesToAxis( cent->lerpAngles, ent.axis );
;600:		}
;601:		else
;602:#endif
;603:		{
line 604
;604:			RotateAroundDirection( ent.axis, s1->time );
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
line 605
;605:		}
line 606
;606:	}
LABELV $426
line 609
;607:
;608:	// add to refresh list, possibly with quad glow
;609:	CG_AddRefEntityWithPowerups( &ent, s1, TEAM_FREE );
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
line 610
;610:}
LABELV $368
endproc CG_Missile 164 20
proc CG_Grapple 152 12
line 619
;611:
;612:/*
;613:===============
;614:CG_Grapple
;615:
;616:This is called when the grapple is sitting up against the wall
;617:===============
;618:*/
;619:static void CG_Grapple( centity_t *cent ) {
line 624
;620:	refEntity_t			ent;
;621:	entityState_t		*s1;
;622:	const weaponInfo_t		*weapon;
;623:
;624:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 625
;625:	if ( s1->weapon > WP_NUM_WEAPONS ) {
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 12
LEI4 $431
line 626
;626:		s1->weapon = 0;
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 627
;627:	}
LABELV $431
line 628
;628:	weapon = &cg_weapons[s1->weapon];
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
line 631
;629:
;630:	// calculate the axis
;631:	VectorCopy( s1->angles, cent->lerpAngles);
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
line 641
;632:
;633:#if 0 // FIXME add grapple pull sound here..?
;634:	// add missile sound
;635:	if ( weapon->missileSound ) {
;636:		trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, weapon->missileSound );
;637:	}
;638:#endif
;639:
;640:	// Will draw cable if needed
;641:	CG_GrappleTrail ( cent, weapon );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRGP4 CG_GrappleTrail
CALLV
pop
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
;645:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 646
;646:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 649
;647:
;648:	// flicker between two skins
;649:	ent.skinNum = cg.clientFrame & 1;
ADDRLP4 0+104
ADDRGP4 cg
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 650
;650:	ent.hModel = weapon->missileModel;
ADDRLP4 0+8
ADDRLP4 144
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ASGNI4
line 651
;651:	ent.renderfx = weapon->missileRenderfx | RF_NOSHADOW;
ADDRLP4 0+4
ADDRLP4 144
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 654
;652:
;653:	// convert direction of travel into axis
;654:	if ( VectorNormalize2( s1->pos.trDelta, ent.axis[0] ) == 0 ) {
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
line 655
;655:		ent.axis[0][2] = 1;
ADDRLP4 0+28+8
CNSTF4 1065353216
ASGNF4
line 656
;656:	}
LABELV $438
line 658
;657:
;658:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 659
;659:}
LABELV $430
endproc CG_Grapple 152 12
proc CG_Mover 144 12
line 666
;660:
;661:/*
;662:===============
;663:CG_Mover
;664:===============
;665:*/
;666:static void CG_Mover( centity_t *cent ) {
line 670
;667:	refEntity_t			ent;
;668:	entityState_t		*s1;
;669:
;670:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 673
;671:
;672:	// create the render entity
;673:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 674
;674:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 675
;675:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 676
;676:	AnglesToAxis( cent->lerpAngles, ent.axis );
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
line 678
;677:
;678:	ent.renderfx = RF_NOSHADOW;
ADDRLP4 0+4
CNSTI4 64
ASGNI4
line 681
;679:
;680:	// flicker between two skins (FIXME?)
;681:	ent.skinNum = ( cg.time >> 6 ) & 1;
ADDRLP4 0+104
ADDRGP4 cg+109652
INDIRI4
CNSTI4 6
RSHI4
CNSTI4 1
BANDI4
ASGNI4
line 684
;682:
;683:	// get the model, either as a bmodel or a modelindex
;684:	if ( s1->solid == SOLID_BMODEL ) {
ADDRLP4 140
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
NEI4 $450
line 685
;685:		ent.hModel = cgs.inlineDrawModel[s1->modelindex];
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
line 686
;686:	} else {
ADDRGP4 $451
JUMPV
LABELV $450
line 687
;687:		ent.hModel = cgs.gameModels[s1->modelindex];
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
line 688
;688:	}
LABELV $451
line 691
;689:
;690:	// add to refresh list
;691:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 694
;692:
;693:	// add the secondary model
;694:	if ( s1->modelindex2 ) {
ADDRLP4 140
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 0
EQI4 $456
line 695
;695:		ent.skinNum = 0;
ADDRLP4 0+104
CNSTI4 0
ASGNI4
line 696
;696:		ent.hModel = cgs.gameModels[s1->modelindex2];
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
line 697
;697:		trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 698
;698:	}
LABELV $456
line 700
;699:
;700:}
LABELV $443
endproc CG_Mover 144 12
export CG_Beam
proc CG_Beam 144 12
line 709
;701:
;702:/*
;703:===============
;704:CG_Beam
;705:
;706:Also called as an event
;707:===============
;708:*/
;709:void CG_Beam( centity_t *cent ) {
line 713
;710:	refEntity_t			ent;
;711:	entityState_t		*s1;
;712:
;713:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 716
;714:
;715:	// create the render entity
;716:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 717
;717:	VectorCopy( s1->pos.trBase, ent.origin );
ADDRLP4 0+68
ADDRLP4 140
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 718
;718:	VectorCopy( s1->origin2, ent.oldorigin );
ADDRLP4 0+84
ADDRLP4 140
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 719
;719:	AxisClear( ent.axis );
ADDRLP4 0+28
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 720
;720:	ent.reType = RT_BEAM;
ADDRLP4 0
CNSTI4 3
ASGNI4
line 722
;721:
;722:	ent.renderfx = RF_NOSHADOW;
ADDRLP4 0+4
CNSTI4 64
ASGNI4
line 725
;723:
;724:	// add to refresh list
;725:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 726
;726:}
LABELV $461
endproc CG_Beam 144 12
proc CG_Portal 144 12
line 734
;727:
;728:
;729:/*
;730:===============
;731:CG_Portal
;732:===============
;733:*/
;734:static void CG_Portal( centity_t *cent ) {
line 738
;735:	refEntity_t			ent;
;736:	entityState_t		*s1;
;737:
;738:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 741
;739:
;740:	// create the render entity
;741:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 742
;742:	VectorCopy( cent->lerpOrigin, ent.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 743
;743:	VectorCopy( s1->origin2, ent.oldorigin );
ADDRLP4 0+84
ADDRLP4 140
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 744
;744:	ByteToDir( s1->eventParm, ent.axis[0] );
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
line 745
;745:	PerpendicularVector( ent.axis[1], ent.axis[0] );
ADDRLP4 0+28+12
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 749
;746:
;747:	// negating this tends to get the directions like they want
;748:	// we really should have a camera roll value
;749:	VectorSubtract( vec3_origin, ent.axis[1], ent.axis[1] );
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
line 751
;750:
;751:	CrossProduct( ent.axis[0], ent.axis[1], ent.axis[2] );
ADDRLP4 0+28
ARGP4
ADDRLP4 0+28+12
ARGP4
ADDRLP4 0+28+24
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 752
;752:	ent.reType = RT_PORTALSURFACE;
ADDRLP4 0
CNSTI4 7
ASGNI4
line 753
;753:	ent.oldframe = s1->powerups;
ADDRLP4 0+96
ADDRLP4 140
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 754
;754:	ent.frame = s1->frame;		// rotation speed
ADDRLP4 0+80
ADDRLP4 140
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
line 755
;755:	ent.skinNum = s1->clientNum/256.0 * 360;	// roll offset
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
line 758
;756:
;757:	// add to refresh list
;758:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 759
;759:}
LABELV $466
endproc CG_Portal 144 12
export CG_AdjustPositionForMover
proc CG_AdjustPositionForMover 92 12
line 769
;760:
;761:
;762:/*
;763:=========================
;764:CG_AdjustPositionForMover
;765:
;766:Also called by client movement prediction code
;767:=========================
;768:*/
;769:void CG_AdjustPositionForMover( const vec3_t in, int moverNum, int fromTime, int toTime, vec3_t out ) {
line 774
;770:	centity_t	*cent;
;771:	vec3_t	oldOrigin, origin, deltaOrigin;
;772:	vec3_t	oldAngles, angles, deltaAngles;
;773:
;774:	if ( moverNum <= 0 || moverNum >= ENTITYNUM_MAX_NORMAL ) {
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
line 775
;775:		VectorCopy( in, out );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 776
;776:		return;
ADDRGP4 $499
JUMPV
LABELV $500
line 779
;777:	}
;778:
;779:	cent = &cg_entities[ moverNum ];
ADDRLP4 0
CNSTI4 740
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 780
;780:	if ( cent->currentState.eType != ET_MOVER ) {
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
line 781
;781:		VectorCopy( in, out );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 782
;782:		return;
ADDRGP4 $499
JUMPV
LABELV $503
line 785
;783:	}
;784:
;785:	BG_EvaluateTrajectory( &cent->currentState.pos, fromTime, oldOrigin );
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
line 786
;786:	BG_EvaluateTrajectory( &cent->currentState.apos, fromTime, oldAngles );
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
line 788
;787:
;788:	BG_EvaluateTrajectory( &cent->currentState.pos, toTime, origin );
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
line 789
;789:	BG_EvaluateTrajectory( &cent->currentState.apos, toTime, angles );
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
line 791
;790:
;791:	VectorSubtract( origin, oldOrigin, deltaOrigin );
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
line 792
;792:	VectorSubtract( angles, oldAngles, deltaAngles );
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
line 794
;793:
;794:	VectorAdd( in, deltaOrigin, out );
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
line 797
;795:
;796:	// FIXME: origin change when on a rotating object
;797:}
LABELV $499
endproc CG_AdjustPositionForMover 92 12
proc CG_InterpolateEntityPosition 44 12
line 805
;798:
;799:
;800:/*
;801:=============================
;802:CG_InterpolateEntityPosition
;803:=============================
;804:*/
;805:static void CG_InterpolateEntityPosition( centity_t *cent ) {
line 811
;806:	vec3_t		current, next;
;807:	float		f;
;808:
;809:	// it would be an internal error to find an entity that interpolates without
;810:	// a snapshot ahead of the current one
;811:	if ( cg.nextSnap == NULL ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $520
line 812
;812:		CG_Error( "CG_InterpoateEntityPosition: cg.nextSnap == NULL" );
ADDRGP4 $523
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 813
;813:	}
LABELV $520
line 815
;814:
;815:	f = cg.frameInterpolation;
ADDRLP4 24
ADDRGP4 cg+109636
INDIRF4
ASGNF4
line 820
;816:	//CG_Printf("interpolation fraction: %.2f\n", cg.frameInterpolation);
;817:
;818:	// this will linearize a sine or parabolic curve, but it is important
;819:	// to not extrapolate player positions if more recent data is available
;820:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.snap->serverTime, current );
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
line 821
;821:	BG_EvaluateTrajectory( &cent->nextState.pos, cg.nextSnap->serverTime, next );
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
line 823
;822:
;823:	cent->lerpOrigin[0] = current[0] + f * ( next[0] - current[0] );
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
line 824
;824:	cent->lerpOrigin[1] = current[1] + f * ( next[1] - current[1] );
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
line 825
;825:	cent->lerpOrigin[2] = current[2] + f * ( next[2] - current[2] );
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
line 827
;826:
;827:	BG_EvaluateTrajectory( &cent->currentState.apos, cg.snap->serverTime, current );
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
line 828
;828:	BG_EvaluateTrajectory( &cent->nextState.apos, cg.nextSnap->serverTime, next );
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
line 830
;829:
;830:	cent->lerpAngles[0] = LerpAngle( current[0], next[0], f );
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
line 831
;831:	cent->lerpAngles[1] = LerpAngle( current[1], next[1], f );
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
line 832
;832:	cent->lerpAngles[2] = LerpAngle( current[2], next[2], f );
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
line 833
;833:}
LABELV $519
endproc CG_InterpolateEntityPosition 44 12
proc CG_CalcEntityLerpPositions 120 28
line 841
;834:
;835:/*
;836:===============
;837:CG_CalcEntityLerpPositions
;838:
;839:===============
;840:*/
;841:static void CG_CalcEntityLerpPositions( centity_t *cent ) {
line 844
;842://unlagged - projectile nudge
;843:	// this will be set to how far forward projectiles will be extrapolated
;844:	int timeshift = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 862
;845://unlagged - projectile nudge
;846:
;847://unlagged - smooth clients #2
;848:	// this is done server-side now - cg_smoothClients is undefined
;849:	// players will always be TR_INTERPOLATE
;850:/*
;851:	// if this player does not want to see extrapolated players
;852:	if ( !cg_smoothClients.integer ) {
;853:		// make sure the clients use TR_INTERPOLATE
;854:		if ( cent->currentState.number < MAX_CLIENTS ) {
;855:			cent->currentState.pos.trType = TR_INTERPOLATE;
;856:			cent->nextState.pos.trType = TR_INTERPOLATE;
;857:		}
;858:	}
;859:*/
;860://unlagged - smooth clients #2
;861:
;862:	if ( cent->interpolate && cent->currentState.pos.trType == TR_INTERPOLATE ) {
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
line 863
;863:		CG_InterpolateEntityPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_InterpolateEntityPosition
CALLV
pop
line 864
;864:		return;
ADDRGP4 $539
JUMPV
LABELV $540
line 869
;865:	}
;866:
;867:	// first see if we can interpolate between two snaps for
;868:	// linear extrapolated clients
;869:	if ( cent->interpolate && cent->currentState.pos.trType == TR_LINEAR_STOP &&
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
line 870
;870:			cent->currentState.number < MAX_CLIENTS) {
line 871
;871:		CG_InterpolateEntityPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_InterpolateEntityPosition
CALLV
pop
line 872
;872:		return;
ADDRGP4 $539
JUMPV
LABELV $542
line 879
;873:	}
;874:
;875://unlagged - timenudge extrapolation
;876:	// interpolating failed (probably no nextSnap), so extrapolate
;877:	// this can also happen if the teleport bit is flipped, but that
;878:	// won't be noticeable
;879:	if ( cent->currentState.number < MAX_CLIENTS &&
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
line 880
;880:			cent->currentState.clientNum != cg.predictedPlayerState.clientNum ) {
line 881
;881:		cent->currentState.pos.trType = TR_LINEAR_STOP;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 3
ASGNI4
line 882
;882:		cent->currentState.pos.trTime = cg.snap->serverTime;
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
line 883
;883:		cent->currentState.pos.trDuration = 1000 / sv_fps.integer;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 1000
ADDRGP4 sv_fps+12
INDIRI4
DIVI4
ASGNI4
line 884
;884:	}
LABELV $544
line 889
;885://unlagged - timenudge extrapolation
;886:
;887://unlagged - projectile nudge
;888:	// if it's a missile but not a grappling hook
;889:	if ( cent->currentState.eType == ET_MISSILE && cent->currentState.weapon != WP_GRAPPLING_HOOK ) {
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
line 891
;890:		// if it's one of ours
;891:		if ( cent->currentState.otherEntityNum == cg.clientNum ) {
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ADDRGP4 cg+4
INDIRI4
NEI4 $552
line 895
;892:			// extrapolate one server frame's worth - this will correct for tiny
;893:			// visual inconsistencies introduced by backward-reconciling all players
;894:			// one server frame before running projectiles
;895:			timeshift = 1000 / sv_fps.integer;
ADDRLP4 0
CNSTI4 1000
ADDRGP4 sv_fps+12
INDIRI4
DIVI4
ASGNI4
line 896
;896:		}
ADDRGP4 $553
JUMPV
LABELV $552
line 898
;897:		// if it's not, and it's not a grenade launcher
;898:		else if ( cent->currentState.weapon != WP_GRENADE_LAUNCHER ) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 4
EQI4 $556
line 900
;899:			// extrapolate based on cg_projectileNudge
;900:			timeshift = cg_projectileNudge.integer + 1000 / sv_fps.integer;
ADDRLP4 0
ADDRGP4 cg_projectileNudge+12
INDIRI4
CNSTI4 1000
ADDRGP4 sv_fps+12
INDIRI4
DIVI4
ADDI4
ASGNI4
line 901
;901:		}
LABELV $556
LABELV $553
line 902
;902:	}
LABELV $550
line 907
;903:
;904:	// just use the current frame and evaluate as best we can
;905://	BG_EvaluateTrajectory( &cent->currentState.pos, cg.time, cent->lerpOrigin );
;906://	BG_EvaluateTrajectory( &cent->currentState.apos, cg.time, cent->lerpAngles );
;907:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.time + timeshift, cent->lerpOrigin );
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
line 908
;908:	BG_EvaluateTrajectory( &cent->currentState.apos, cg.time + timeshift, cent->lerpAngles );
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
line 911
;909:
;910:	// if there's a time shift
;911:	if ( timeshift != 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $562
line 915
;912:		trace_t tr;
;913:		vec3_t lastOrigin;
;914:
;915:		BG_EvaluateTrajectory( &cent->currentState.pos, cg.time, lastOrigin );
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
line 917
;916:
;917:		CG_Trace( &tr, lastOrigin, vec3_origin, vec3_origin, cent->lerpOrigin, cent->currentState.number, MASK_SHOT );
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
line 920
;918:
;919:		// don't let the projectile go through the floor
;920:		if ( tr.fraction < 1.0f ) {
ADDRLP4 40+8
INDIRF4
CNSTF4 1065353216
GEF4 $565
line 921
;921:			cent->lerpOrigin[0] = lastOrigin[0] + tr.fraction * ( cent->lerpOrigin[0] - lastOrigin[0] );
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
line 922
;922:			cent->lerpOrigin[1] = lastOrigin[1] + tr.fraction * ( cent->lerpOrigin[1] - lastOrigin[1] );
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
line 923
;923:			cent->lerpOrigin[2] = lastOrigin[2] + tr.fraction * ( cent->lerpOrigin[2] - lastOrigin[2] );
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
line 924
;924:		}
LABELV $565
line 925
;925:	}
LABELV $562
line 931
;926://unlagged - projectile nudge
;927:
;928:
;929:	// adjust for riding a mover if it wasn't rolled into the predicted
;930:	// player state
;931:	if ( cent != &cg.predictedPlayerEntity ) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 cg+110152
CVPU4 4
EQU4 $575
line 932
;932:		CG_AdjustPositionForMover( cent->lerpOrigin, cent->currentState.groundEntityNum, 
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
line 934
;933:		cg.snap->serverTime, cg.time, cent->lerpOrigin );
;934:	}
LABELV $575
line 935
;935:}
LABELV $539
endproc CG_CalcEntityLerpPositions 120 28
proc CG_TeamBase 140 12
line 942
;936:
;937:/*
;938:===============
;939:CG_TeamBase
;940:===============
;941:*/
;942:static void CG_TeamBase( centity_t *cent ) {
line 951
;943:	refEntity_t model;
;944:#ifdef MISSIONPACK
;945:	vec3_t angles;
;946:	int t, h;
;947:	float c;
;948:
;949:	if ( cgs.gametype == GT_CTF || cgs.gametype == GT_1FCTF ) {
;950:#else
;951:	if ( cgs.gametype == GT_CTF) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
NEI4 $581
line 954
;952:#endif
;953:		// show the flag base
;954:		memset(&model, 0, sizeof(model));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 955
;955:		model.reType = RT_MODEL;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 956
;956:		VectorCopy( cent->lerpOrigin, model.lightingOrigin );
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 957
;957:		VectorCopy( cent->lerpOrigin, model.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 958
;958:		AnglesToAxis( cent->currentState.angles, model.axis );
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
line 959
;959:		if ( cent->currentState.modelindex == TEAM_RED ) {
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 1
NEI4 $587
line 960
;960:			model.hModel = cgs.media.redFlagBaseModel;
ADDRLP4 0+8
ADDRGP4 cgs+153876+108
INDIRI4
ASGNI4
line 961
;961:		}
ADDRGP4 $588
JUMPV
LABELV $587
line 962
;962:		else if ( cent->currentState.modelindex == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 2
NEI4 $592
line 963
;963:			model.hModel = cgs.media.blueFlagBaseModel;
ADDRLP4 0+8
ADDRGP4 cgs+153876+112
INDIRI4
ASGNI4
line 964
;964:		}
ADDRGP4 $593
JUMPV
LABELV $592
line 965
;965:		else {
line 966
;966:			model.hModel = cgs.media.neutralFlagBaseModel;
ADDRLP4 0+8
ADDRGP4 cgs+153876+116
INDIRI4
ASGNI4
line 967
;967:		}
LABELV $593
LABELV $588
line 968
;968:		trap_R_AddRefEntityToScene( &model );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 969
;969:	}
LABELV $581
line 1088
;970:#ifdef MISSIONPACK
;971:	else if ( cgs.gametype == GT_OBELISK ) {
;972:		// show the obelisk
;973:		memset(&model, 0, sizeof(model));
;974:		model.reType = RT_MODEL;
;975:		VectorCopy( cent->lerpOrigin, model.lightingOrigin );
;976:		VectorCopy( cent->lerpOrigin, model.origin );
;977:		AnglesToAxis( cent->currentState.angles, model.axis );
;978:
;979:		model.hModel = cgs.media.overloadBaseModel;
;980:		trap_R_AddRefEntityToScene( &model );
;981:		// if hit
;982:		if ( cent->currentState.frame == 1) {
;983:			// show hit model
;984:			// modelindex2 is the health value of the obelisk
;985:			c = cent->currentState.modelindex2;
;986:			model.shaderRGBA[0] = 0xff;
;987:			model.shaderRGBA[1] = c;
;988:			model.shaderRGBA[2] = c;
;989:			model.shaderRGBA[3] = 0xff;
;990:			//
;991:			model.hModel = cgs.media.overloadEnergyModel;
;992:			trap_R_AddRefEntityToScene( &model );
;993:		}
;994:		// if respawning
;995:		if ( cent->currentState.frame == 2) {
;996:			if ( !cent->miscTime ) {
;997:				cent->miscTime = cg.time;
;998:			}
;999:			t = cg.time - cent->miscTime;
;1000:			h = (cg_obeliskRespawnDelay.integer - 5) * 1000;
;1001:			//
;1002:			if (t > h) {
;1003:				c = (float) (t - h) / h;
;1004:				if (c > 1)
;1005:					c = 1;
;1006:			}
;1007:			else {
;1008:				c = 0;
;1009:			}
;1010:			// show the lights
;1011:			AnglesToAxis( cent->currentState.angles, model.axis );
;1012:			//
;1013:			model.shaderRGBA[0] = c * 0xff;
;1014:			model.shaderRGBA[1] = c * 0xff;
;1015:			model.shaderRGBA[2] = c * 0xff;
;1016:			model.shaderRGBA[3] = c * 0xff;
;1017:
;1018:			model.hModel = cgs.media.overloadLightsModel;
;1019:			trap_R_AddRefEntityToScene( &model );
;1020:			// show the target
;1021:			if (t > h) {
;1022:				if ( !cent->muzzleFlashTime ) {
;1023:					trap_S_StartSound (cent->lerpOrigin, ENTITYNUM_NONE, CHAN_BODY,  cgs.media.obeliskRespawnSound);
;1024:					cent->muzzleFlashTime = 1;
;1025:				}
;1026:				VectorCopy(cent->currentState.angles, angles);
;1027:				angles[YAW] += (float) 16 * acos(1-c) * 180 / M_PI;
;1028:				AnglesToAxis( angles, model.axis );
;1029:
;1030:				VectorScale( model.axis[0], c, model.axis[0]);
;1031:				VectorScale( model.axis[1], c, model.axis[1]);
;1032:				VectorScale( model.axis[2], c, model.axis[2]);
;1033:
;1034:				model.shaderRGBA[0] = 0xff;
;1035:				model.shaderRGBA[1] = 0xff;
;1036:				model.shaderRGBA[2] = 0xff;
;1037:				model.shaderRGBA[3] = 0xff;
;1038:				//
;1039:				model.origin[2] += 56;
;1040:				model.hModel = cgs.media.overloadTargetModel;
;1041:				trap_R_AddRefEntityToScene( &model );
;1042:			}
;1043:			else {
;1044:				//FIXME: show animated smoke
;1045:			}
;1046:		}
;1047:		else {
;1048:			cent->miscTime = 0;
;1049:			cent->muzzleFlashTime = 0;
;1050:			// modelindex2 is the health value of the obelisk
;1051:			c = cent->currentState.modelindex2;
;1052:			model.shaderRGBA[0] = 0xff;
;1053:			model.shaderRGBA[1] = c;
;1054:			model.shaderRGBA[2] = c;
;1055:			model.shaderRGBA[3] = 0xff;
;1056:			// show the lights
;1057:			model.hModel = cgs.media.overloadLightsModel;
;1058:			trap_R_AddRefEntityToScene( &model );
;1059:			// show the target
;1060:			model.origin[2] += 56;
;1061:			model.hModel = cgs.media.overloadTargetModel;
;1062:			trap_R_AddRefEntityToScene( &model );
;1063:		}
;1064:	}
;1065:	else if ( cgs.gametype == GT_HARVESTER ) {
;1066:		// show harvester model
;1067:		memset(&model, 0, sizeof(model));
;1068:		model.reType = RT_MODEL;
;1069:		VectorCopy( cent->lerpOrigin, model.lightingOrigin );
;1070:		VectorCopy( cent->lerpOrigin, model.origin );
;1071:		AnglesToAxis( cent->currentState.angles, model.axis );
;1072:
;1073:		if ( cent->currentState.modelindex == TEAM_RED ) {
;1074:			model.hModel = cgs.media.harvesterModel;
;1075:			model.customSkin = cgs.media.harvesterRedSkin;
;1076:		}
;1077:		else if ( cent->currentState.modelindex == TEAM_BLUE ) {
;1078:			model.hModel = cgs.media.harvesterModel;
;1079:			model.customSkin = cgs.media.harvesterBlueSkin;
;1080:		}
;1081:		else {
;1082:			model.hModel = cgs.media.harvesterNeutralModel;
;1083:			model.customSkin = 0;
;1084:		}
;1085:		trap_R_AddRefEntityToScene( &model );
;1086:	}
;1087:#endif
;1088:}
LABELV $580
endproc CG_TeamBase 140 12
proc CG_AddCEntity 8 8
line 1096
;1089:
;1090:/*
;1091:===============
;1092:CG_AddCEntity
;1093:
;1094:===============
;1095:*/
;1096:static void CG_AddCEntity( centity_t *cent ) {
line 1098
;1097:	// event-only entities will have been dealt with already
;1098:	if ( cent->currentState.eType >= ET_EVENTS ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 14
LTI4 $601
line 1099
;1099:		return;
ADDRGP4 $600
JUMPV
LABELV $601
line 1103
;1100:	}
;1101:
;1102:	// calculate the current origin
;1103:	CG_CalcEntityLerpPositions( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CalcEntityLerpPositions
CALLV
pop
line 1106
;1104:
;1105:	// add automatic effects
;1106:	CG_EntityEffects( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_EntityEffects
CALLV
pop
line 1108
;1107:
;1108:	switch ( cent->currentState.eType ) {
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
line 1110
;1109:	default:
;1110:		CG_Error( "Bad entity type: %i\n", cent->currentState.eType );
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
line 1111
;1111:		break;
ADDRGP4 $604
JUMPV
line 1115
;1112:	case ET_INVISIBLE:
;1113:	case ET_PUSH_TRIGGER:
;1114:	case ET_TELEPORT_TRIGGER:
;1115:		break;
LABELV $608
line 1117
;1116:	case ET_GENERAL:
;1117:		CG_General( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_General
CALLV
pop
line 1118
;1118:		break;
ADDRGP4 $604
JUMPV
LABELV $609
line 1120
;1119:	case ET_PLAYER:
;1120:		CG_Player( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Player
CALLV
pop
line 1121
;1121:		break;
ADDRGP4 $604
JUMPV
LABELV $610
line 1123
;1122:	case ET_ITEM:
;1123:		CG_Item( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Item
CALLV
pop
line 1124
;1124:		break;
ADDRGP4 $604
JUMPV
LABELV $611
line 1126
;1125:	case ET_MISSILE:
;1126:		CG_Missile( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Missile
CALLV
pop
line 1127
;1127:		break;
ADDRGP4 $604
JUMPV
LABELV $612
line 1129
;1128:	case ET_MOVER:
;1129:		CG_Mover( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Mover
CALLV
pop
line 1130
;1130:		break;
ADDRGP4 $604
JUMPV
LABELV $613
line 1132
;1131:	case ET_BREAKABLE:
;1132: 		CG_Mover( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Mover
CALLV
pop
line 1133
;1133: 		break;
ADDRGP4 $604
JUMPV
LABELV $614
line 1135
;1134:	case ET_BEAM:
;1135:		CG_Beam( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Beam
CALLV
pop
line 1136
;1136:		break;
ADDRGP4 $604
JUMPV
LABELV $615
line 1138
;1137:	case ET_PORTAL:
;1138:		CG_Portal( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Portal
CALLV
pop
line 1139
;1139:		break;
ADDRGP4 $604
JUMPV
LABELV $616
line 1141
;1140:	case ET_SPEAKER:
;1141:		CG_Speaker( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Speaker
CALLV
pop
line 1142
;1142:		break;
ADDRGP4 $604
JUMPV
LABELV $617
line 1144
;1143:	case ET_GRAPPLE:
;1144:		CG_Grapple( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Grapple
CALLV
pop
line 1145
;1145:		break;
ADDRGP4 $604
JUMPV
LABELV $618
line 1147
;1146:	case ET_TURRET:
;1147:		CG_TURRET(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_TURRET
CALLV
pop
line 1148
;1148:		break;
ADDRGP4 $604
JUMPV
LABELV $619
line 1150
;1149:	case ET_TEAM:
;1150:		CG_TeamBase( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_TeamBase
CALLV
pop
line 1151
;1151:		break;
LABELV $604
line 1153
;1152:	}
;1153:}
LABELV $600
endproc CG_AddCEntity 8 8
export CG_AddPacketEntities
proc CG_AddPacketEntities 20 12
line 1161
;1154:
;1155:/*
;1156:===============
;1157:CG_AddPacketEntities
;1158:
;1159:===============
;1160:*/
;1161:void CG_AddPacketEntities( void ) {
line 1167
;1162:	int					num;
;1163:	centity_t			*cent;
;1164:	playerState_t		*ps;
;1165:
;1166:	// set cg.frameInterpolation
;1167:	if ( cg.nextSnap ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $622
line 1170
;1168:		int		delta;
;1169:
;1170:		delta = (cg.nextSnap->serverTime - cg.snap->serverTime);
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
line 1171
;1171:		if ( delta == 0 ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $627
line 1172
;1172:			cg.frameInterpolation = 0;
ADDRGP4 cg+109636
CNSTF4 0
ASGNF4
line 1173
;1173:		} else {
ADDRGP4 $623
JUMPV
LABELV $627
line 1174
;1174:			cg.frameInterpolation = (float)( cg.time - cg.snap->serverTime ) / delta;
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
line 1175
;1175:		}
line 1176
;1176:	} else {
ADDRGP4 $623
JUMPV
LABELV $622
line 1177
;1177:		cg.frameInterpolation = 0;	// actually, it should never be used, because 
ADDRGP4 cg+109636
CNSTF4 0
ASGNF4
line 1179
;1178:									// no entities should be marked as interpolating
;1179:	}
LABELV $623
line 1182
;1180:
;1181:	// the auto-rotating items will all have the same axis
;1182:	cg.autoAngles[0] = 0;
ADDRGP4 cg+111008
CNSTF4 0
ASGNF4
line 1183
;1183:	cg.autoAngles[1] = ( cg.time & 2047 ) * 360 / 2048.0;
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
line 1184
;1184:	cg.autoAngles[2] = 0;
ADDRGP4 cg+111008+8
CNSTF4 0
ASGNF4
line 1186
;1185:
;1186:	cg.autoAnglesFast[0] = 0;
ADDRGP4 cg+111056
CNSTF4 0
ASGNF4
line 1187
;1187:	cg.autoAnglesFast[1] = ( cg.time & 1023 ) * 360 / 1024.0f;
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
line 1188
;1188:	cg.autoAnglesFast[2] = 0;
ADDRGP4 cg+111056+8
CNSTF4 0
ASGNF4
line 1190
;1189:
;1190:	AnglesToAxis( cg.autoAngles, cg.autoAxis );
ADDRGP4 cg+111008
ARGP4
ADDRGP4 cg+111020
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1191
;1191:	AnglesToAxis( cg.autoAnglesFast, cg.autoAxisFast );
ADDRGP4 cg+111056
ARGP4
ADDRGP4 cg+111068
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1194
;1192:
;1193:	// generate and add the entity from the playerstate
;1194:	ps = &cg.predictedPlayerState;
ADDRLP4 8
ADDRGP4 cg+109684
ASGNP4
line 1195
;1195:	BG_PlayerStateToEntityState( ps, &cg.predictedPlayerEntity.currentState, qfalse );
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
line 1196
;1196:	CG_AddCEntity( &cg.predictedPlayerEntity );
ADDRGP4 cg+110152
ARGP4
ADDRGP4 CG_AddCEntity
CALLV
pop
line 1199
;1197:
;1198:	// lerp the non-predicted value for lightning gun origins
;1199:	CG_CalcEntityLerpPositions( &cg_entities[ cg.snap->ps.clientNum ] );
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
line 1202
;1200:
;1201://unlagged - early transitioning
;1202:	if ( cg.nextSnap ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $654
line 1205
;1203:		// pre-add some of the entities sent over by the server
;1204:		// we have data for them and they don't need to interpolate
;1205:		for ( num = 0 ; num < cg.nextSnap->numEntities ; num++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $660
JUMPV
LABELV $657
line 1206
;1206:			cent = &cg_entities[ cg.nextSnap->entities[ num ].number ];
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
line 1207
;1207:			if ( cent->nextState.eType == ET_MISSILE || cent->nextState.eType == ET_GENERAL ) {
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
line 1209
;1208:				// transition it immediately and add it
;1209:				CG_TransitionEntity( cent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_TransitionEntity
CALLV
pop
line 1210
;1210:				cent->interpolate = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 1
ASGNI4
line 1211
;1211:				CG_AddCEntity( cent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddCEntity
CALLV
pop
line 1212
;1212:			}
LABELV $663
line 1213
;1213:		}
LABELV $658
line 1205
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
line 1214
;1214:	}
LABELV $654
line 1218
;1215://unlagged - early transitioning
;1216:
;1217:	// add each entity sent over by the server
;1218:	for ( num = 0 ; num < cg.snap->numEntities ; num++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $669
JUMPV
LABELV $666
line 1219
;1219:		cent = &cg_entities[ cg.snap->entities[ num ].number ];
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
line 1221
;1220://unlagged - early transitioning
;1221:		if ( !cg.nextSnap || cent->nextState.eType != ET_MISSILE && cent->nextState.eType != ET_GENERAL ) {
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
line 1223
;1222://unlagged - early transitioning
;1223:			CG_AddCEntity( cent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddCEntity
CALLV
pop
line 1224
;1224:		}
LABELV $672
line 1225
;1225:	}
LABELV $667
line 1218
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
line 1226
;1226:}
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
