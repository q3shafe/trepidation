code
proc CG_ShotgunEjectBrass 136 8
file "../cg_weapons.c"
line 83
;1:// 2016 Trepidation Licensed under the GPL2 - Team Trepidation
;2://
;3:// cg_weapons.c -- events and effects dealing with weapons
;4:#include "cg_local.h"
;5:
;6:/*
;7:==========================
;8:CG_MachineGunEjectBrass
;9:==========================
;10:
;11:static void CG_MachineGunEjectBrass( centity_t *cent ) {
;12:	localEntity_t	*le;
;13:	refEntity_t		*re;
;14:	vec3_t			velocity, xvelocity;
;15:	vec3_t			offset, xoffset;
;16:	float			waterScale = 1.0f;
;17:	vec3_t			v[3];
;18:
;19:	if ( cg_brassTime.integer <= 0 ) {
;20:		return;
;21:	}
;22:
;23:	le = CG_AllocLocalEntity();
;24:	re = &le->refEntity;
;25:
;26:	velocity[0] = 0;
;27:	velocity[1] = -50 + 40 * crandom();
;28:	velocity[2] = 100 + 50 * crandom();
;29:
;30:	le->leType = LE_FRAGMENT;
;31:	le->startTime = cg.time;
;32:	le->endTime = le->startTime + cg_brassTime.integer + ( cg_brassTime.integer / 4 ) * random();
;33:
;34:	le->pos.trType = TR_GRAVITY;
;35:	le->pos.trTime = cg.time - (rand()&15);
;36:
;37:	AnglesToAxis( cent->lerpAngles, v );
;38:
;39:	offset[0] = 8;
;40:	offset[1] = -4;
;41:	offset[2] = 24;
;42:
;43:	xoffset[0] = offset[0] * v[0][0] + offset[1] * v[1][0] + offset[2] * v[2][0];
;44:	xoffset[1] = offset[0] * v[0][1] + offset[1] * v[1][1] + offset[2] * v[2][1];
;45:	xoffset[2] = offset[0] * v[0][2] + offset[1] * v[1][2] + offset[2] * v[2][2];
;46:	VectorAdd( cent->lerpOrigin, xoffset, re->origin );
;47:
;48:	VectorCopy( re->origin, le->pos.trBase );
;49:
;50:	if ( CG_PointContents( re->origin, -1 ) & CONTENTS_WATER ) {
;51:		waterScale = 0.10f;
;52:	}
;53:
;54:	xvelocity[0] = velocity[0] * v[0][0] + velocity[1] * v[1][0] + velocity[2] * v[2][0];
;55:	xvelocity[1] = velocity[0] * v[0][1] + velocity[1] * v[1][1] + velocity[2] * v[2][1];
;56:	xvelocity[2] = velocity[0] * v[0][2] + velocity[1] * v[1][2] + velocity[2] * v[2][2];
;57:	VectorScale( xvelocity, waterScale, le->pos.trDelta );
;58:
;59:	AxisCopy( axisDefault, re->axis );
;60:	re->hModel = cgs.media.machinegunBrassModel;
;61:
;62:	le->bounceFactor = 0.4 * waterScale;
;63:
;64:	le->angles.trType = TR_LINEAR;
;65:	le->angles.trTime = cg.time;
;66:	le->angles.trBase[0] = rand()&31;
;67:	le->angles.trBase[1] = rand()&31;
;68:	le->angles.trBase[2] = rand()&31;
;69:	le->angles.trDelta[0] = 2;
;70:	le->angles.trDelta[1] = 1;
;71:	le->angles.trDelta[2] = 0;
;72:
;73:	le->leFlags = LEF_TUMBLE;
;74:	le->leBounceSoundType = LEBS_BRASS;
;75:	le->leMarkType = LEMT_NONE;
;76:}
;77:
;78:/*
;79:==========================
;80:CG_ShotgunEjectBrass
;81:==========================
;82:*/
;83:static void CG_ShotgunEjectBrass( centity_t *cent ) {
line 91
;84:	localEntity_t	*le;
;85:	refEntity_t		*re;
;86:	vec3_t			velocity, xvelocity;
;87:	vec3_t			offset, xoffset;
;88:	vec3_t			v[3];
;89:	int				i;
;90:
;91:	if ( cg_brassTime.integer <= 0 ) {
ADDRGP4 cg_brassTime+12
INDIRI4
CNSTI4 0
GTI4 $73
line 92
;92:		return;
ADDRGP4 $72
JUMPV
LABELV $73
line 95
;93:	}
;94:
;95:	for ( i = 0; i < 2; i++ ) {
ADDRLP4 92
CNSTI4 0
ASGNI4
LABELV $76
line 96
;96:		float	waterScale = 1.0f;
ADDRLP4 96
CNSTF4 1065353216
ASGNF4
line 98
;97:
;98:		le = CG_AllocLocalEntity();
ADDRLP4 100
ADDRGP4 CG_AllocLocalEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 100
INDIRP4
ASGNP4
line 99
;99:		re = &le->refEntity;
ADDRLP4 64
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
ASGNP4
line 101
;100:
;101:		velocity[0] = 60 + 60 * crandom();
ADDRLP4 104
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 40
CNSTF4 1114636288
CNSTF4 1073741824
ADDRLP4 104
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
CNSTF4 1114636288
ADDF4
ASGNF4
line 102
;102:		if ( i == 0 ) {
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $80
line 103
;103:			velocity[1] = 40 + 10 * crandom();
ADDRLP4 108
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 40+4
CNSTF4 1092616192
CNSTF4 1073741824
ADDRLP4 108
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
CNSTF4 1109393408
ADDF4
ASGNF4
line 104
;104:		} else {
ADDRGP4 $81
JUMPV
LABELV $80
line 105
;105:			velocity[1] = -40 + 10 * crandom();
ADDRLP4 108
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 40+4
CNSTF4 1092616192
CNSTF4 1073741824
ADDRLP4 108
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
CNSTF4 3256877056
ADDF4
ASGNF4
line 106
;106:		}
LABELV $81
line 107
;107:		velocity[2] = 100 + 50 * crandom();
ADDRLP4 108
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 40+8
CNSTF4 1112014848
CNSTF4 1073741824
ADDRLP4 108
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
CNSTF4 1120403456
ADDF4
ASGNF4
line 109
;108:
;109:		le->leType = LE_FRAGMENT;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 3
ASGNI4
line 110
;110:		le->startTime = cg.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 111
;111:		le->endTime = le->startTime + cg_brassTime.integer*3 + cg_brassTime.integer * random();
ADDRLP4 112
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 3
ADDRGP4 cg_brassTime+12
INDIRI4
MULI4
ADDI4
CVIF4 4
ADDRGP4 cg_brassTime+12
INDIRI4
CVIF4 4
ADDRLP4 112
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 113
;112:
;113:		le->pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
CNSTI4 5
ASGNI4
line 114
;114:		le->pos.trTime = cg.time;
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 116
;115:
;116:		AnglesToAxis( cent->lerpAngles, v );
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 118
;117:
;118:		offset[0] = 8;
ADDRLP4 52
CNSTF4 1090519040
ASGNF4
line 119
;119:		offset[1] = 0;
ADDRLP4 52+4
CNSTF4 0
ASGNF4
line 120
;120:		offset[2] = 24;
ADDRLP4 52+8
CNSTF4 1103101952
ASGNF4
line 122
;121:
;122:		xoffset[0] = offset[0] * v[0][0] + offset[1] * v[1][0] + offset[2] * v[2][0];
ADDRLP4 80
ADDRLP4 52
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDRLP4 52+4
INDIRF4
ADDRLP4 4+12
INDIRF4
MULF4
ADDF4
ADDRLP4 52+8
INDIRF4
ADDRLP4 4+24
INDIRF4
MULF4
ADDF4
ASGNF4
line 123
;123:		xoffset[1] = offset[0] * v[0][1] + offset[1] * v[1][1] + offset[2] * v[2][1];
ADDRLP4 80+4
ADDRLP4 52
INDIRF4
ADDRLP4 4+4
INDIRF4
MULF4
ADDRLP4 52+4
INDIRF4
ADDRLP4 4+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 52+8
INDIRF4
ADDRLP4 4+24+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 124
;124:		xoffset[2] = offset[0] * v[0][2] + offset[1] * v[1][2] + offset[2] * v[2][2];
ADDRLP4 80+8
ADDRLP4 52
INDIRF4
ADDRLP4 4+8
INDIRF4
MULF4
ADDRLP4 52+4
INDIRF4
ADDRLP4 4+12+8
INDIRF4
MULF4
ADDF4
ADDRLP4 52+8
INDIRF4
ADDRLP4 4+24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 125
;125:		VectorAdd( cent->lerpOrigin, xoffset, re->origin );
ADDRLP4 64
INDIRP4
CNSTI4 68
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRF4
ADDRLP4 80
INDIRF4
ADDF4
ASGNF4
ADDRLP4 64
INDIRP4
CNSTI4 72
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRF4
ADDRLP4 80+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 64
INDIRP4
CNSTI4 76
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRF4
ADDRLP4 80+8
INDIRF4
ADDF4
ASGNF4
line 126
;126:		VectorCopy( re->origin, le->pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 68
ADDP4
INDIRB
ASGNB 12
line 127
;127:		if ( CG_PointContents( re->origin, -1 ) & CONTENTS_WATER ) {
ADDRLP4 64
INDIRP4
CNSTI4 68
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 120
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $113
line 128
;128:			waterScale = 0.10f;
ADDRLP4 96
CNSTF4 1036831949
ASGNF4
line 129
;129:		}
LABELV $113
line 131
;130:
;131:		xvelocity[0] = velocity[0] * v[0][0] + velocity[1] * v[1][0] + velocity[2] * v[2][0];
ADDRLP4 68
ADDRLP4 40
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDRLP4 40+4
INDIRF4
ADDRLP4 4+12
INDIRF4
MULF4
ADDF4
ADDRLP4 40+8
INDIRF4
ADDRLP4 4+24
INDIRF4
MULF4
ADDF4
ASGNF4
line 132
;132:		xvelocity[1] = velocity[0] * v[0][1] + velocity[1] * v[1][1] + velocity[2] * v[2][1];
ADDRLP4 68+4
ADDRLP4 40
INDIRF4
ADDRLP4 4+4
INDIRF4
MULF4
ADDRLP4 40+4
INDIRF4
ADDRLP4 4+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 40+8
INDIRF4
ADDRLP4 4+24+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 133
;133:		xvelocity[2] = velocity[0] * v[0][2] + velocity[1] * v[1][2] + velocity[2] * v[2][2];
ADDRLP4 68+8
ADDRLP4 40
INDIRF4
ADDRLP4 4+8
INDIRF4
MULF4
ADDRLP4 40+4
INDIRF4
ADDRLP4 4+12+8
INDIRF4
MULF4
ADDF4
ADDRLP4 40+8
INDIRF4
ADDRLP4 4+24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 134
;134:		VectorScale( xvelocity, waterScale, le->pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
ADDRLP4 68
INDIRF4
ADDRLP4 96
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 68+4
INDIRF4
ADDRLP4 96
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 68+8
INDIRF4
ADDRLP4 96
INDIRF4
MULF4
ASGNF4
line 136
;135:
;136:		AxisCopy( axisDefault, re->axis );
ADDRGP4 axisDefault
ARGP4
ADDRLP4 64
INDIRP4
CNSTI4 28
ADDP4
ARGP4
ADDRGP4 AxisCopy
CALLV
pop
line 137
;137:		re->hModel = cgs.media.shotgunBrassModel;
ADDRLP4 64
INDIRP4
CNSTI4 8
ADDP4
ADDRGP4 cgs+154388+196
INDIRI4
ASGNI4
line 138
;138:		le->bounceFactor = 0.3f;
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
CNSTF4 1050253722
ASGNF4
line 140
;139:
;140:		le->angles.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 2
ASGNI4
line 141
;141:		le->angles.trTime = cg.time;
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 142
;142:		le->angles.trBase[0] = rand()&31;
ADDRLP4 124
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 124
INDIRI4
CNSTI4 31
BANDI4
CVIF4 4
ASGNF4
line 143
;143:		le->angles.trBase[1] = rand()&31;
ADDRLP4 128
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRLP4 128
INDIRI4
CNSTI4 31
BANDI4
CVIF4 4
ASGNF4
line 144
;144:		le->angles.trBase[2] = rand()&31;
ADDRLP4 132
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 132
INDIRI4
CNSTI4 31
BANDI4
CVIF4 4
ASGNF4
line 145
;145:		le->angles.trDelta[0] = 1;
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
CNSTF4 1065353216
ASGNF4
line 146
;146:		le->angles.trDelta[1] = 0.5;
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
CNSTF4 1056964608
ASGNF4
line 147
;147:		le->angles.trDelta[2] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
CNSTF4 0
ASGNF4
line 149
;148:
;149:		le->leFlags = LEF_TUMBLE;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 150
;150:		le->leBounceSoundType = LEBS_BRASS;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 151
;151:		le->leMarkType = LEMT_NONE;
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 0
ASGNI4
line 152
;152:	}
LABELV $77
line 95
ADDRLP4 92
ADDRLP4 92
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 2
LTI4 $76
line 153
;153:}
LABELV $72
endproc CG_ShotgunEjectBrass 136 8
export CG_RailTrail
proc CG_RailTrail 644 16
line 195
;154:
;155:
;156:#ifdef MISSIONPACK
;157:/*
;158:==========================
;159:CG_NailgunEjectBrass
;160:==========================
;161:*/
;162:static void CG_NailgunEjectBrass( centity_t *cent ) {
;163:	localEntity_t	*smoke;
;164:	vec3_t			origin;
;165:	vec3_t			v[3];
;166:	vec3_t			offset;
;167:	vec3_t			xoffset;
;168:	vec3_t			up;
;169:
;170:	AnglesToAxis( cent->lerpAngles, v );
;171:
;172:	offset[0] = 0;
;173:	offset[1] = -12;
;174:	offset[2] = 24;
;175:
;176:	xoffset[0] = offset[0] * v[0][0] + offset[1] * v[1][0] + offset[2] * v[2][0];
;177:	xoffset[1] = offset[0] * v[0][1] + offset[1] * v[1][1] + offset[2] * v[2][1];
;178:	xoffset[2] = offset[0] * v[0][2] + offset[1] * v[1][2] + offset[2] * v[2][2];
;179:	VectorAdd( cent->lerpOrigin, xoffset, origin );
;180:
;181:	VectorSet( up, 0, 0, 64 );
;182:
;183:	smoke = CG_SmokePuff( origin, up, 32, 1, 1, 1, 0.33f, 700, cg.time, 0, 0, cgs.media.smokePuffShader );
;184:	// use the optimized local entity add
;185:	smoke->leType = LE_SCALE_FADE;
;186:}
;187:#endif
;188:
;189:
;190:/*
;191:==========================
;192:CG_RailTrail
;193:==========================
;194:*/
;195:void CG_RailTrail (clientInfo_t *ci, vec3_t start, vec3_t end) {
line 207
;196:	vec3_t axis[36], move, move2, next_move, vec, temp;
;197:	float  len;
;198:	int    i, j, skip;
;199: 
;200:	localEntity_t *le;
;201:	refEntity_t   *re;
;202: 
;203:#define RADIUS   4
;204:#define ROTATION 1
;205:#define SPACING  5
;206: 
;207:	start[2] -= 4;
ADDRLP4 516
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 516
INDIRP4
ADDRLP4 516
INDIRP4
INDIRF4
CNSTF4 1082130432
SUBF4
ASGNF4
line 208
;208:	VectorCopy (start, move);
ADDRLP4 8
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 209
;209:	VectorSubtract (end, start, vec);
ADDRLP4 520
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 524
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 520
INDIRP4
INDIRF4
ADDRLP4 524
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 528
CNSTI4 4
ASGNI4
ADDRLP4 28+4
ADDRLP4 520
INDIRP4
ADDRLP4 528
INDIRI4
ADDP4
INDIRF4
ADDRLP4 524
INDIRP4
ADDRLP4 528
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 532
CNSTI4 8
ASGNI4
ADDRLP4 28+8
ADDRFP4 8
INDIRP4
ADDRLP4 532
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 532
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 210
;210:	len = VectorNormalize (vec);
ADDRLP4 28
ARGP4
ADDRLP4 536
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 500
ADDRLP4 536
INDIRF4
ASGNF4
line 211
;211:	PerpendicularVector(temp, vec);
ADDRLP4 488
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 212
;212:	for (i = 0 ; i < 36; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $143
line 213
;213:		RotatePointAroundVector(axis[i], vec, temp, i * 10);//banshee 2.4 was 10
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 40
ADDP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 488
ARGP4
CNSTI4 10
ADDRLP4 4
INDIRI4
MULI4
CVIF4 4
ARGF4
ADDRGP4 RotatePointAroundVector
CALLV
pop
line 214
;214:	}
LABELV $144
line 212
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 36
LTI4 $143
line 216
;215: 
;216:	le = CG_AllocLocalEntity();
ADDRLP4 540
ADDRGP4 CG_AllocLocalEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 540
INDIRP4
ASGNP4
line 217
;217:	re = &le->refEntity;
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
ASGNP4
line 219
;218: 
;219:	le->leType = LE_FADE_RGB;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 6
ASGNI4
line 220
;220:	le->startTime = cg.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 221
;221:	le->endTime = cg.time + cg_railTrailTime.value;
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRGP4 cg+109652
INDIRI4
CVIF4 4
ADDRGP4 cg_railTrailTime+8
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 222
;222:	le->lifeRate = 1.0 / (le->endTime - le->startTime);
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
CNSTF4 1065353216
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
SUBI4
CVIF4 4
DIVF4
ASGNF4
line 224
;223: 
;224:	re->shaderTime = cg.time / 1000.0f;
ADDRLP4 24
INDIRP4
CNSTI4 128
ADDP4
ADDRGP4 cg+109652
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ASGNF4
line 225
;225:	re->reType = RT_RAIL_CORE;
ADDRLP4 24
INDIRP4
CNSTI4 4
ASGNI4
line 226
;226:	re->customShader = cgs.media.railCoreShader;
ADDRLP4 24
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+154388+204
INDIRI4
ASGNI4
line 228
;227: 
;228:	VectorCopy(start, re->origin);
ADDRLP4 24
INDIRP4
CNSTI4 68
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 229
;229:	VectorCopy(end, re->oldorigin);
ADDRLP4 24
INDIRP4
CNSTI4 84
ADDP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 231
;230: 
;231:	re->shaderRGBA[0] = ci->color1[0] * 255;
ADDRLP4 552
CNSTF4 1132396544
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 556
CNSTF4 1325400064
ASGNF4
ADDRLP4 552
INDIRF4
ADDRLP4 556
INDIRF4
LTF4 $154
ADDRLP4 548
ADDRLP4 552
INDIRF4
ADDRLP4 556
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $155
JUMPV
LABELV $154
ADDRLP4 548
ADDRLP4 552
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $155
ADDRLP4 24
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 548
INDIRU4
CVUU1 4
ASGNU1
line 232
;232:    re->shaderRGBA[1] = ci->color1[1] * 255;
ADDRLP4 564
CNSTF4 1132396544
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 568
CNSTF4 1325400064
ASGNF4
ADDRLP4 564
INDIRF4
ADDRLP4 568
INDIRF4
LTF4 $157
ADDRLP4 560
ADDRLP4 564
INDIRF4
ADDRLP4 568
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $158
JUMPV
LABELV $157
ADDRLP4 560
ADDRLP4 564
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $158
ADDRLP4 24
INDIRP4
CNSTI4 117
ADDP4
ADDRLP4 560
INDIRU4
CVUU1 4
ASGNU1
line 233
;233:    re->shaderRGBA[2] = ci->color1[2] * 255;
ADDRLP4 576
CNSTF4 1132396544
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 580
CNSTF4 1325400064
ASGNF4
ADDRLP4 576
INDIRF4
ADDRLP4 580
INDIRF4
LTF4 $160
ADDRLP4 572
ADDRLP4 576
INDIRF4
ADDRLP4 580
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $161
JUMPV
LABELV $160
ADDRLP4 572
ADDRLP4 576
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $161
ADDRLP4 24
INDIRP4
CNSTI4 118
ADDP4
ADDRLP4 572
INDIRU4
CVUU1 4
ASGNU1
line 234
;234:    re->shaderRGBA[3] = 255;
ADDRLP4 24
INDIRP4
CNSTI4 119
ADDP4
CNSTU1 255
ASGNU1
line 236
;235:
;236:	le->color[0] = ci->color1[0] * 0.75;
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
CNSTF4 1061158912
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRF4
MULF4
ASGNF4
line 237
;237:	le->color[1] = ci->color1[1] * 0.75;
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
CNSTF4 1061158912
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRF4
MULF4
ASGNF4
line 238
;238:	le->color[2] = ci->color1[2] * 0.75;
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
CNSTF4 1061158912
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRF4
MULF4
ASGNF4
line 239
;239:	le->color[3] = 1.0f;
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
CNSTF4 1065353216
ASGNF4
line 241
;240:
;241:	AxisClear( re->axis );
ADDRLP4 24
INDIRP4
CNSTI4 28
ADDP4
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 243
;242: 
;243:	VectorMA(move, 20, vec, move);
ADDRLP4 584
CNSTF4 1101004800
ASGNF4
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 584
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 8+4
INDIRF4
ADDRLP4 584
INDIRF4
ADDRLP4 28+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 8+8
ADDRLP4 8+8
INDIRF4
CNSTF4 1101004800
ADDRLP4 28+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 244
;244:	VectorCopy(move, next_move);
ADDRLP4 504
ADDRLP4 8
INDIRB
ASGNB 12
line 245
;245:	VectorScale (vec, SPACING, vec);
ADDRLP4 588
CNSTF4 1084227584
ASGNF4
ADDRLP4 28
ADDRLP4 588
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 588
INDIRF4
ADDRLP4 28+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 28+8
CNSTF4 1084227584
ADDRLP4 28+8
INDIRF4
MULF4
ASGNF4
line 247
;246:
;247:	if (cg_oldRail.integer != 0) {
ADDRGP4 cg_oldRail+12
INDIRI4
CNSTI4 0
EQI4 $172
line 249
;248:		// nudge down a bit so it isn't exactly in center
;249:		re->origin[2] -= 8;
ADDRLP4 592
ADDRLP4 24
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 592
INDIRP4
ADDRLP4 592
INDIRP4
INDIRF4
CNSTF4 1090519040
SUBF4
ASGNF4
line 250
;250:		re->oldorigin[2] -= 8;
ADDRLP4 596
ADDRLP4 24
INDIRP4
CNSTI4 92
ADDP4
ASGNP4
ADDRLP4 596
INDIRP4
ADDRLP4 596
INDIRP4
INDIRF4
CNSTF4 1090519040
SUBF4
ASGNF4
line 251
;251:		return;
ADDRGP4 $140
JUMPV
LABELV $172
line 253
;252:	}
;253:	skip = -1;
ADDRLP4 484
CNSTI4 -1
ASGNI4
line 255
;254: 
;255:	j = 18;
ADDRLP4 20
CNSTI4 18
ASGNI4
line 256
;256:    for (i = 0; i < len; i += SPACING) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $178
JUMPV
LABELV $175
line 257
;257:		if (i != skip) {
ADDRLP4 4
INDIRI4
ADDRLP4 484
INDIRI4
EQI4 $179
line 258
;258:			skip = i + SPACING;
ADDRLP4 484
ADDRLP4 4
INDIRI4
CNSTI4 5
ADDI4
ASGNI4
line 259
;259:			le = CG_AllocLocalEntity();
ADDRLP4 592
ADDRGP4 CG_AllocLocalEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 592
INDIRP4
ASGNP4
line 260
;260:            re = &le->refEntity;
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
ASGNP4
line 261
;261:            le->leFlags = LEF_PUFF_DONT_SCALE;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 1
ASGNI4
line 262
;262:			le->leType = LE_MOVE_SCALE_FADE;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 4
ASGNI4
line 263
;263:            le->startTime = cg.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 264
;264:            le->endTime = cg.time + (i>>1) + 600;
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRGP4 cg+109652
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 1
RSHI4
ADDI4
CNSTI4 600
ADDI4
ASGNI4
line 265
;265:            le->lifeRate = 1.0 / (le->endTime - le->startTime);
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
CNSTF4 1065353216
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
SUBI4
CVIF4 4
DIVF4
ASGNF4
line 267
;266:
;267:            re->shaderTime = cg.time / 1000.0f;
ADDRLP4 24
INDIRP4
CNSTI4 128
ADDP4
ADDRGP4 cg+109652
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ASGNF4
line 268
;268:            re->reType = RT_SPRITE;
ADDRLP4 24
INDIRP4
CNSTI4 2
ASGNI4
line 269
;269:            re->radius = 1.1f;
ADDRLP4 24
INDIRP4
CNSTI4 132
ADDP4
CNSTF4 1066192077
ASGNF4
line 270
;270:			re->customShader = cgs.media.railRingsShader;
ADDRLP4 24
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+154388+200
INDIRI4
ASGNI4
line 272
;271:
;272:            re->shaderRGBA[0] = ci->color2[0] * 255;
ADDRLP4 604
CNSTF4 1132396544
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 608
CNSTF4 1325400064
ASGNF4
ADDRLP4 604
INDIRF4
ADDRLP4 608
INDIRF4
LTF4 $187
ADDRLP4 600
ADDRLP4 604
INDIRF4
ADDRLP4 608
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $188
JUMPV
LABELV $187
ADDRLP4 600
ADDRLP4 604
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $188
ADDRLP4 24
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 600
INDIRU4
CVUU1 4
ASGNU1
line 273
;273:            re->shaderRGBA[1] = ci->color2[1] * 255;
ADDRLP4 616
CNSTF4 1132396544
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 620
CNSTF4 1325400064
ASGNF4
ADDRLP4 616
INDIRF4
ADDRLP4 620
INDIRF4
LTF4 $190
ADDRLP4 612
ADDRLP4 616
INDIRF4
ADDRLP4 620
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $191
JUMPV
LABELV $190
ADDRLP4 612
ADDRLP4 616
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $191
ADDRLP4 24
INDIRP4
CNSTI4 117
ADDP4
ADDRLP4 612
INDIRU4
CVUU1 4
ASGNU1
line 274
;274:            re->shaderRGBA[2] = ci->color2[2] * 255;
ADDRLP4 628
CNSTF4 1132396544
ADDRFP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 632
CNSTF4 1325400064
ASGNF4
ADDRLP4 628
INDIRF4
ADDRLP4 632
INDIRF4
LTF4 $193
ADDRLP4 624
ADDRLP4 628
INDIRF4
ADDRLP4 632
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $194
JUMPV
LABELV $193
ADDRLP4 624
ADDRLP4 628
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $194
ADDRLP4 24
INDIRP4
CNSTI4 118
ADDP4
ADDRLP4 624
INDIRU4
CVUU1 4
ASGNU1
line 275
;275:            re->shaderRGBA[3] = 255;
ADDRLP4 24
INDIRP4
CNSTI4 119
ADDP4
CNSTU1 255
ASGNU1
line 277
;276:
;277:            le->color[0] = ci->color2[0] * 0.75;
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
CNSTF4 1061158912
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRF4
MULF4
ASGNF4
line 278
;278:            le->color[1] = ci->color2[1] * 0.75;
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
CNSTF4 1061158912
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
MULF4
ASGNF4
line 279
;279:            le->color[2] = ci->color2[2] * 0.75;
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
CNSTF4 1061158912
ADDRFP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
MULF4
ASGNF4
line 280
;280:            le->color[3] = 1.0f;
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
CNSTF4 1065353216
ASGNF4
line 282
;281:
;282:            le->pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
CNSTI4 2
ASGNI4
line 283
;283:            le->pos.trTime = cg.time;
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 285
;284:
;285:			VectorCopy( move, move2);
ADDRLP4 472
ADDRLP4 8
INDIRB
ASGNB 12
line 286
;286:            VectorMA(move2, RADIUS , axis[j], move2);
ADDRLP4 636
CNSTF4 1082130432
ASGNF4
ADDRLP4 640
CNSTI4 12
ADDRLP4 20
INDIRI4
MULI4
ASGNI4
ADDRLP4 472
ADDRLP4 472
INDIRF4
ADDRLP4 636
INDIRF4
ADDRLP4 640
INDIRI4
ADDRLP4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 472+4
ADDRLP4 472+4
INDIRF4
ADDRLP4 636
INDIRF4
ADDRLP4 640
INDIRI4
ADDRLP4 40+4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 472+8
ADDRLP4 472+8
INDIRF4
CNSTF4 1082130432
CNSTI4 12
ADDRLP4 20
INDIRI4
MULI4
ADDRLP4 40+8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 287
;287:            VectorCopy(move2, le->pos.trBase);
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 472
INDIRB
ASGNB 12
line 289
;288:
;289:            le->pos.trDelta[0] = axis[j][0]*6;
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
CNSTF4 1086324736
CNSTI4 12
ADDRLP4 20
INDIRI4
MULI4
ADDRLP4 40
ADDP4
INDIRF4
MULF4
ASGNF4
line 290
;290:            le->pos.trDelta[1] = axis[j][1]*6;
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 1086324736
CNSTI4 12
ADDRLP4 20
INDIRI4
MULI4
ADDRLP4 40+4
ADDP4
INDIRF4
MULF4
ASGNF4
line 291
;291:            le->pos.trDelta[2] = axis[j][2]*6;
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
CNSTF4 1086324736
CNSTI4 12
ADDRLP4 20
INDIRI4
MULI4
ADDRLP4 40+8
ADDP4
INDIRF4
MULF4
ASGNF4
line 292
;292:		}
LABELV $179
line 294
;293:
;294:        VectorAdd (move, vec, move);
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 28
INDIRF4
ADDF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 8+4
INDIRF4
ADDRLP4 28+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 8+8
ADDRLP4 8+8
INDIRF4
ADDRLP4 28+8
INDIRF4
ADDF4
ASGNF4
line 296
;295:
;296:        j = j + ROTATION < 36 ? j + ROTATION : (j + ROTATION) % 36;
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 36
GEI4 $211
ADDRLP4 592
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $212
JUMPV
LABELV $211
ADDRLP4 592
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 36
MODI4
ASGNI4
LABELV $212
ADDRLP4 20
ADDRLP4 592
INDIRI4
ASGNI4
line 297
;297:	}
LABELV $176
line 256
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 5
ADDI4
ASGNI4
LABELV $178
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 500
INDIRF4
LTF4 $175
line 298
;298:}
LABELV $140
endproc CG_RailTrail 644 16
proc CG_RocketTrail 92 48
line 307
;299:
;300:
;301:
;302:/*
;303:==========================
;304:CG_RocketTrail
;305:==========================
;306:*/
;307:static void CG_RocketTrail( centity_t *ent, const weaponInfo_t *wi ) {
line 317
;308:	int		step;
;309:	vec3_t	origin, lastPos;
;310:	int		t;
;311:	int		startTime, contents;
;312:	int		lastContents;
;313:	entityState_t	*es;
;314:	vec3_t	up;
;315:	localEntity_t	*smoke;
;316:
;317:	if ( cg_noProjectileTrail.integer ) {
ADDRGP4 cg_noProjectileTrail+12
INDIRI4
CNSTI4 0
EQI4 $214
line 318
;318:		return;
ADDRGP4 $213
JUMPV
LABELV $214
line 321
;319:	}
;320:
;321:	up[0] = 0;
ADDRLP4 28
CNSTF4 0
ASGNF4
line 322
;322:	up[1] = 0;
ADDRLP4 28+4
CNSTF4 0
ASGNF4
line 323
;323:	up[2] = 0;
ADDRLP4 28+8
CNSTF4 0
ASGNF4
line 325
;324:
;325:	step = 50;
ADDRLP4 20
CNSTI4 50
ASGNI4
line 327
;326:
;327:	es = &ent->currentState;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
line 328
;328:	startTime = ent->trailTime;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
ASGNI4
line 329
;329:	t = step * ( (startTime + step) / step );
ADDRLP4 0
ADDRLP4 20
INDIRI4
ADDRLP4 56
INDIRI4
ADDRLP4 20
INDIRI4
ADDI4
ADDRLP4 20
INDIRI4
DIVI4
MULI4
ASGNI4
line 331
;330:
;331:	BG_EvaluateTrajectory( &es->pos, cg.time, origin );
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+109652
INDIRI4
ARGI4
ADDRLP4 44
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 332
;332:	contents = CG_PointContents( origin, -1 );
ADDRLP4 44
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 68
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 68
INDIRI4
ASGNI4
line 335
;333:
;334:	// if object (e.g. grenade) is stationary, don't toss up smoke
;335:	if ( es->pos.trType == TR_STATIONARY ) {
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $220
line 336
;336:		ent->trailTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 337
;337:		return;
ADDRGP4 $213
JUMPV
LABELV $220
line 340
;338:	}
;339:
;340:	BG_EvaluateTrajectory( &es->pos, ent->trailTime, lastPos );
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 341
;341:	lastContents = CG_PointContents( lastPos, -1 );
ADDRLP4 4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 72
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 60
ADDRLP4 72
INDIRI4
ASGNI4
line 343
;342:
;343:	ent->trailTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 345
;344:
;345:	if ( contents & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ) {
ADDRLP4 40
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $231
line 346
;346:		if ( contents & lastContents & CONTENTS_WATER ) {
ADDRLP4 40
INDIRI4
ADDRLP4 60
INDIRI4
BANDI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $213
line 347
;347:			CG_BubbleTrail( lastPos, origin, 8 );
ADDRLP4 4
ARGP4
ADDRLP4 44
ARGP4
CNSTF4 1090519040
ARGF4
ADDRGP4 CG_BubbleTrail
CALLV
pop
line 348
;348:		}
line 349
;349:		return;
ADDRGP4 $213
JUMPV
line 352
;350:	}
;351:
;352:	for ( ; t <= ent->trailTime ; t += step ) {
LABELV $228
line 353
;353:		BG_EvaluateTrajectory( &es->pos, t, lastPos );
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 355
;354:
;355:		smoke = CG_SmokePuff( lastPos, up, 
ADDRLP4 4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 76
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
ARGF4
ADDRLP4 80
CNSTF4 1065353216
ASGNF4
ADDRLP4 80
INDIRF4
ARGF4
ADDRLP4 80
INDIRF4
ARGF4
ADDRLP4 80
INDIRF4
ARGF4
CNSTF4 1051260355
ARGF4
ADDRLP4 76
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRLP4 84
INDIRI4
ARGI4
ADDRLP4 84
INDIRI4
ARGI4
ADDRGP4 cgs+154388+296
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 CG_SmokePuff
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 88
INDIRP4
ASGNP4
line 364
;356:					  wi->trailRadius, 
;357:					  1, 1, 1, 0.33f,
;358:					  wi->wiTrailTime, 
;359:					  t,
;360:					  0,
;361:					  0, 
;362:					  cgs.media.smokePuffShader2 ); // Shafe set this to 2
;363:		// use the optimized local entity add
;364:		smoke->leType = LE_SCALE_FADE;
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 7
ASGNI4
line 365
;365:	}
LABELV $229
line 352
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
ADDI4
ASGNI4
LABELV $231
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
LEI4 $228
line 367
;366:
;367:}
LABELV $213
endproc CG_RocketTrail 92 48
proc CG_PlasmaTrail 204 12
line 443
;368:
;369:#ifdef MISSIONPACK
;370:/*
;371:==========================
;372:CG_NailTrail
;373:==========================
;374:*/
;375:static void CG_NailTrail( centity_t *ent, const weaponInfo_t *wi ) {
;376:	int		step;
;377:	vec3_t	origin, lastPos;
;378:	int		t;
;379:	int		startTime, contents;
;380:	int		lastContents;
;381:	entityState_t	*es;
;382:	vec3_t	up;
;383:	localEntity_t	*smoke;
;384:
;385:	if ( cg_noProjectileTrail.integer ) {
;386:		return;
;387:	}
;388:
;389:	up[0] = 0;
;390:	up[1] = 0;
;391:	up[2] = 0;
;392:
;393:	step = 50;
;394:
;395:	es = &ent->currentState;
;396:	startTime = ent->trailTime;
;397:	t = step * ( (startTime + step) / step );
;398:
;399:	BG_EvaluateTrajectory( &es->pos, cg.time, origin );
;400:	contents = CG_PointContents( origin, -1 );
;401:
;402:	// if object (e.g. grenade) is stationary, don't toss up smoke
;403:	if ( es->pos.trType == TR_STATIONARY ) {
;404:		ent->trailTime = cg.time;
;405:		return;
;406:	}
;407:
;408:	BG_EvaluateTrajectory( &es->pos, ent->trailTime, lastPos );
;409:	lastContents = CG_PointContents( lastPos, -1 );
;410:
;411:	ent->trailTime = cg.time;
;412:
;413:	if ( contents & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ) {
;414:		if ( contents & lastContents & CONTENTS_WATER ) {
;415:			CG_BubbleTrail( lastPos, origin, 8 );
;416:		}
;417:		return;
;418:	}
;419:
;420:	for ( ; t <= ent->trailTime ; t += step ) {
;421:		BG_EvaluateTrajectory( &es->pos, t, lastPos );
;422:
;423:		smoke = CG_SmokePuff( lastPos, up, 
;424:					  wi->trailRadius, 
;425:					  1, 1, 1, 0.33f,
;426:					  wi->wiTrailTime, 
;427:					  t,
;428:					  0,
;429:					  0, 
;430:					  cgs.media.nailPuffShader );
;431:		// use the optimized local entity add
;432:		smoke->leType = LE_SCALE_FADE;
;433:	}
;434:
;435:}
;436:#endif
;437:
;438:/*
;439:==========================
;440:CG_NailTrail
;441:==========================
;442:*/
;443:static void CG_PlasmaTrail( centity_t *cent, const weaponInfo_t *wi ) {
line 452
;444:	localEntity_t	*le;
;445:	refEntity_t		*re;
;446:	entityState_t	*es;
;447:	vec3_t			velocity, xvelocity, origin;
;448:	vec3_t			offset, xoffset;
;449:	vec3_t			v[3];
;450:	int				t, startTime, step;
;451:
;452:	float	waterScale = 1.0f;
ADDRLP4 92
CNSTF4 1065353216
ASGNF4
line 454
;453:
;454:	if ( cg_noProjectileTrail.integer || cg_oldPlasma.integer ) {
ADDRLP4 124
CNSTI4 0
ASGNI4
ADDRGP4 cg_noProjectileTrail+12
INDIRI4
ADDRLP4 124
INDIRI4
NEI4 $239
ADDRGP4 cg_oldPlasma+12
INDIRI4
ADDRLP4 124
INDIRI4
EQI4 $235
LABELV $239
line 455
;455:		return;
ADDRGP4 $234
JUMPV
LABELV $235
line 458
;456:	}
;457:
;458:	step = 50;
ADDRLP4 108
CNSTI4 50
ASGNI4
line 460
;459:
;460:	es = &cent->currentState;
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
line 461
;461:	startTime = cent->trailTime;
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
ASGNI4
line 462
;462:	t = step * ( (startTime + step) / step );
ADDRLP4 120
ADDRLP4 108
INDIRI4
ADDRLP4 116
INDIRI4
ADDRLP4 108
INDIRI4
ADDI4
ADDRLP4 108
INDIRI4
DIVI4
MULI4
ASGNI4
line 464
;463:
;464:	BG_EvaluateTrajectory( &es->pos, cg.time, origin );
ADDRLP4 112
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+109652
INDIRI4
ARGI4
ADDRLP4 96
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 466
;465:
;466:	le = CG_AllocLocalEntity();
ADDRLP4 132
ADDRGP4 CG_AllocLocalEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 132
INDIRP4
ASGNP4
line 467
;467:	re = &le->refEntity;
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
ASGNP4
line 469
;468:
;469:	velocity[0] = 60 - 120 * crandom();
ADDRLP4 136
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 44
CNSTF4 1114636288
CNSTF4 1123024896
CNSTF4 1073741824
ADDRLP4 136
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
SUBF4
ASGNF4
line 470
;470:	velocity[1] = 40 - 80 * crandom();
ADDRLP4 140
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 44+4
CNSTF4 1109393408
CNSTF4 1117782016
CNSTF4 1073741824
ADDRLP4 140
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
SUBF4
ASGNF4
line 471
;471:	velocity[2] = 100 - 200 * crandom();
ADDRLP4 144
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 44+8
CNSTF4 1120403456
CNSTF4 1128792064
CNSTF4 1073741824
ADDRLP4 144
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
SUBF4
ASGNF4
line 473
;472:
;473:	le->leType = LE_MOVE_SCALE_FADE;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 4
ASGNI4
line 474
;474:	le->leFlags = LEF_TUMBLE;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 475
;475:	le->leBounceSoundType = LEBS_NONE;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 476
;476:	le->leMarkType = LEMT_NONE;
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 0
ASGNI4
line 478
;477:
;478:	le->startTime = cg.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 479
;479:	le->endTime = le->startTime + 600;
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 600
ADDI4
ASGNI4
line 481
;480:
;481:	le->pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
CNSTI4 5
ASGNI4
line 482
;482:	le->pos.trTime = cg.time;
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 484
;483:
;484:	AnglesToAxis( cent->lerpAngles, v );
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 486
;485:
;486:	offset[0] = 2;
ADDRLP4 56
CNSTF4 1073741824
ASGNF4
line 487
;487:	offset[1] = 2;
ADDRLP4 56+4
CNSTF4 1073741824
ASGNF4
line 488
;488:	offset[2] = 2;
ADDRLP4 56+8
CNSTF4 1073741824
ASGNF4
line 490
;489:
;490:	xoffset[0] = offset[0] * v[0][0] + offset[1] * v[1][0] + offset[2] * v[2][0];
ADDRLP4 80
ADDRLP4 56
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDRLP4 56+4
INDIRF4
ADDRLP4 4+12
INDIRF4
MULF4
ADDF4
ADDRLP4 56+8
INDIRF4
ADDRLP4 4+24
INDIRF4
MULF4
ADDF4
ASGNF4
line 491
;491:	xoffset[1] = offset[0] * v[0][1] + offset[1] * v[1][1] + offset[2] * v[2][1];
ADDRLP4 80+4
ADDRLP4 56
INDIRF4
ADDRLP4 4+4
INDIRF4
MULF4
ADDRLP4 56+4
INDIRF4
ADDRLP4 4+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 56+8
INDIRF4
ADDRLP4 4+24+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 492
;492:	xoffset[2] = offset[0] * v[0][2] + offset[1] * v[1][2] + offset[2] * v[2][2];
ADDRLP4 80+8
ADDRLP4 56
INDIRF4
ADDRLP4 4+8
INDIRF4
MULF4
ADDRLP4 56+4
INDIRF4
ADDRLP4 4+12+8
INDIRF4
MULF4
ADDF4
ADDRLP4 56+8
INDIRF4
ADDRLP4 4+24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 494
;493:
;494:	VectorAdd( origin, xoffset, re->origin );
ADDRLP4 40
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 96
INDIRF4
ADDRLP4 80
INDIRF4
ADDF4
ASGNF4
ADDRLP4 40
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 96+4
INDIRF4
ADDRLP4 80+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 40
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 96+8
INDIRF4
ADDRLP4 80+8
INDIRF4
ADDF4
ASGNF4
line 495
;495:	VectorCopy( re->origin, le->pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 68
ADDP4
INDIRB
ASGNB 12
line 497
;496:
;497:	if ( CG_PointContents( re->origin, -1 ) & CONTENTS_WATER ) {
ADDRLP4 40
INDIRP4
CNSTI4 68
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 152
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $271
line 498
;498:		waterScale = 0.10f;
ADDRLP4 92
CNSTF4 1036831949
ASGNF4
line 499
;499:	}
LABELV $271
line 501
;500:
;501:	xvelocity[0] = velocity[0] * v[0][0] + velocity[1] * v[1][0] + velocity[2] * v[2][0];
ADDRLP4 68
ADDRLP4 44
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDRLP4 44+4
INDIRF4
ADDRLP4 4+12
INDIRF4
MULF4
ADDF4
ADDRLP4 44+8
INDIRF4
ADDRLP4 4+24
INDIRF4
MULF4
ADDF4
ASGNF4
line 502
;502:	xvelocity[1] = velocity[0] * v[0][1] + velocity[1] * v[1][1] + velocity[2] * v[2][1];
ADDRLP4 68+4
ADDRLP4 44
INDIRF4
ADDRLP4 4+4
INDIRF4
MULF4
ADDRLP4 44+4
INDIRF4
ADDRLP4 4+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 44+8
INDIRF4
ADDRLP4 4+24+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 503
;503:	xvelocity[2] = velocity[0] * v[0][2] + velocity[1] * v[1][2] + velocity[2] * v[2][2];
ADDRLP4 68+8
ADDRLP4 44
INDIRF4
ADDRLP4 4+8
INDIRF4
MULF4
ADDRLP4 44+4
INDIRF4
ADDRLP4 4+12+8
INDIRF4
MULF4
ADDF4
ADDRLP4 44+8
INDIRF4
ADDRLP4 4+24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 504
;504:	VectorScale( xvelocity, waterScale, le->pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
ADDRLP4 68
INDIRF4
ADDRLP4 92
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 68+4
INDIRF4
ADDRLP4 92
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 68+8
INDIRF4
ADDRLP4 92
INDIRF4
MULF4
ASGNF4
line 506
;505:
;506:	AxisCopy( axisDefault, re->axis );
ADDRGP4 axisDefault
ARGP4
ADDRLP4 40
INDIRP4
CNSTI4 28
ADDP4
ARGP4
ADDRGP4 AxisCopy
CALLV
pop
line 507
;507:    re->shaderTime = cg.time / 1000.0f;
ADDRLP4 40
INDIRP4
CNSTI4 128
ADDP4
ADDRGP4 cg+109652
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ASGNF4
line 508
;508:    re->reType = RT_SPRITE;
ADDRLP4 40
INDIRP4
CNSTI4 2
ASGNI4
line 509
;509:    re->radius = 0.25f;
ADDRLP4 40
INDIRP4
CNSTI4 132
ADDP4
CNSTF4 1048576000
ASGNF4
line 510
;510:	re->customShader = cgs.media.railRingsShader;
ADDRLP4 40
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+154388+200
INDIRI4
ASGNI4
line 511
;511:	le->bounceFactor = 0.3f;
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
CNSTF4 1050253722
ASGNF4
line 513
;512:
;513:    re->shaderRGBA[0] = wi->flashDlightColor[0] * 63;
ADDRLP4 160
CNSTF4 1115422720
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 164
CNSTF4 1325400064
ASGNF4
ADDRLP4 160
INDIRF4
ADDRLP4 164
INDIRF4
LTF4 $299
ADDRLP4 156
ADDRLP4 160
INDIRF4
ADDRLP4 164
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $300
JUMPV
LABELV $299
ADDRLP4 156
ADDRLP4 160
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $300
ADDRLP4 40
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 156
INDIRU4
CVUU1 4
ASGNU1
line 514
;514:    re->shaderRGBA[1] = wi->flashDlightColor[1] * 63;
ADDRLP4 172
CNSTF4 1115422720
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 176
CNSTF4 1325400064
ASGNF4
ADDRLP4 172
INDIRF4
ADDRLP4 176
INDIRF4
LTF4 $302
ADDRLP4 168
ADDRLP4 172
INDIRF4
ADDRLP4 176
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $303
JUMPV
LABELV $302
ADDRLP4 168
ADDRLP4 172
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $303
ADDRLP4 40
INDIRP4
CNSTI4 117
ADDP4
ADDRLP4 168
INDIRU4
CVUU1 4
ASGNU1
line 515
;515:    re->shaderRGBA[2] = wi->flashDlightColor[2] * 63;
ADDRLP4 184
CNSTF4 1115422720
ADDRFP4 4
INDIRP4
CNSTI4 48
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 188
CNSTF4 1325400064
ASGNF4
ADDRLP4 184
INDIRF4
ADDRLP4 188
INDIRF4
LTF4 $305
ADDRLP4 180
ADDRLP4 184
INDIRF4
ADDRLP4 188
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $306
JUMPV
LABELV $305
ADDRLP4 180
ADDRLP4 184
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $306
ADDRLP4 40
INDIRP4
CNSTI4 118
ADDP4
ADDRLP4 180
INDIRU4
CVUU1 4
ASGNU1
line 516
;516:    re->shaderRGBA[3] = 63;
ADDRLP4 40
INDIRP4
CNSTI4 119
ADDP4
CNSTU1 63
ASGNU1
line 518
;517:
;518:    le->color[0] = wi->flashDlightColor[0] * 0.2;
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
CNSTF4 1045220557
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ASGNF4
line 519
;519:    le->color[1] = wi->flashDlightColor[1] * 0.2;
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
CNSTF4 1045220557
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
MULF4
ASGNF4
line 520
;520:    le->color[2] = wi->flashDlightColor[2] * 0.2;
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
CNSTF4 1045220557
ADDRFP4 4
INDIRP4
CNSTI4 48
ADDP4
INDIRF4
MULF4
ASGNF4
line 521
;521:    le->color[3] = 0.25f;
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
CNSTF4 1048576000
ASGNF4
line 523
;522:
;523:	le->angles.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 2
ASGNI4
line 524
;524:	le->angles.trTime = cg.time;
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 525
;525:	le->angles.trBase[0] = rand()&31;
ADDRLP4 192
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 192
INDIRI4
CNSTI4 31
BANDI4
CVIF4 4
ASGNF4
line 526
;526:	le->angles.trBase[1] = rand()&31;
ADDRLP4 196
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRLP4 196
INDIRI4
CNSTI4 31
BANDI4
CVIF4 4
ASGNF4
line 527
;527:	le->angles.trBase[2] = rand()&31;
ADDRLP4 200
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 200
INDIRI4
CNSTI4 31
BANDI4
CVIF4 4
ASGNF4
line 528
;528:	le->angles.trDelta[0] = 1;
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
CNSTF4 1065353216
ASGNF4
line 529
;529:	le->angles.trDelta[1] = 0.5;
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
CNSTF4 1056964608
ASGNF4
line 530
;530:	le->angles.trDelta[2] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
CNSTF4 0
ASGNF4
line 532
;531:
;532:}
LABELV $234
endproc CG_PlasmaTrail 204 12
export CG_GrappleTrail
proc CG_GrappleTrail 184 16
line 538
;533:/*
;534:==========================
;535:CG_GrappleTrail
;536:==========================
;537:*/
;538:void CG_GrappleTrail( centity_t *ent, const weaponInfo_t *wi ) {
line 544
;539:	vec3_t	origin;
;540:	entityState_t	*es;
;541:	vec3_t			forward, up;
;542:	refEntity_t		beam;
;543:
;544:	es = &ent->currentState;
ADDRLP4 164
ADDRFP4 0
INDIRP4
ASGNP4
line 546
;545:
;546:	BG_EvaluateTrajectory( &es->pos, cg.time, origin );
ADDRLP4 164
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+109652
INDIRI4
ARGI4
ADDRLP4 152
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 547
;547:	ent->trailTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 549
;548:
;549:	memset( &beam, 0, sizeof( beam ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 551
;550:	//FIXME adjust for muzzle position
;551:	VectorCopy ( cg_entities[ ent->currentState.otherEntityNum ].lerpOrigin, beam.origin );
ADDRLP4 0+68
CNSTI4 740
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+716
ADDP4
INDIRB
ASGNB 12
line 552
;552:	beam.origin[2] += 26;
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
CNSTF4 1104150528
ADDF4
ASGNF4
line 553
;553:	AngleVectors( cg_entities[ ent->currentState.otherEntityNum ].lerpAngles, forward, NULL, up );
CNSTI4 740
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+728
ADDP4
ARGP4
ADDRLP4 168
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 140
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 554
;554:	VectorMA( beam.origin, -6, up, beam.origin );
ADDRLP4 0+68
ADDRLP4 0+68
INDIRF4
CNSTF4 3233808384
ADDRLP4 140
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+4
ADDRLP4 0+68+4
INDIRF4
CNSTF4 3233808384
ADDRLP4 140+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
CNSTF4 3233808384
ADDRLP4 140+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 555
;555:	VectorCopy( origin, beam.oldorigin );
ADDRLP4 0+84
ADDRLP4 152
INDIRB
ASGNB 12
line 557
;556:
;557:	if (Distance( beam.origin, beam.oldorigin ) < 64 )
ADDRLP4 0+68
ARGP4
ADDRLP4 0+84
ARGP4
ADDRLP4 180
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 180
INDIRF4
CNSTF4 1115684864
GEF4 $329
line 558
;558:		return; // Don't draw if close
ADDRGP4 $308
JUMPV
LABELV $329
line 560
;559:
;560:	beam.reType = RT_LIGHTNING;
ADDRLP4 0
CNSTI4 6
ASGNI4
line 561
;561:	beam.customShader = cgs.media.lightningShader;
ADDRLP4 0+112
ADDRGP4 cgs+154388+208
INDIRI4
ASGNI4
line 563
;562:
;563:	AxisClear( beam.axis );
ADDRLP4 0+28
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 564
;564:	beam.shaderRGBA[0] = 0xff;
ADDRLP4 0+116
CNSTU1 255
ASGNU1
line 565
;565:	beam.shaderRGBA[1] = 0xff;
ADDRLP4 0+116+1
CNSTU1 255
ASGNU1
line 566
;566:	beam.shaderRGBA[2] = 0xff;
ADDRLP4 0+116+2
CNSTU1 255
ASGNU1
line 567
;567:	beam.shaderRGBA[3] = 0xff;
ADDRLP4 0+116+3
CNSTU1 255
ASGNU1
line 568
;568:	trap_R_AddRefEntityToScene( &beam );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 569
;569:}
LABELV $308
endproc CG_GrappleTrail 184 16
proc CG_GrenadeTrail 92 48
line 576
;570:
;571:/*
;572:==========================
;573:CG_GrenadeTrail
;574:==========================
;575:*/
;576:static void CG_GrenadeTrail( centity_t *ent, const weaponInfo_t *wi ) {
line 588
;577:	//CG_RocketTrail( ent, wi );  // We now use separate effects  Shafe - Trep
;578:	// Shafe - Trep all of this is just copied from CG_RocketTrail with a changed shader... This can be consolidated a bit better... later
;579:	int		step;
;580:	vec3_t	origin, lastPos;
;581:	int		t;
;582:	int		startTime, contents;
;583:	int		lastContents;
;584:	entityState_t	*es;
;585:	vec3_t	up;
;586:	localEntity_t	*smoke;
;587:
;588:	if ( cg_noProjectileTrail.integer ) {
ADDRGP4 cg_noProjectileTrail+12
INDIRI4
CNSTI4 0
EQI4 $345
line 589
;589:		return;
ADDRGP4 $344
JUMPV
LABELV $345
line 592
;590:	}
;591:
;592:	up[0] = 0;
ADDRLP4 28
CNSTF4 0
ASGNF4
line 593
;593:	up[1] = 0;
ADDRLP4 28+4
CNSTF4 0
ASGNF4
line 594
;594:	up[2] = 0;
ADDRLP4 28+8
CNSTF4 0
ASGNF4
line 596
;595:
;596:	step = 50;
ADDRLP4 20
CNSTI4 50
ASGNI4
line 598
;597:
;598:	es = &ent->currentState;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
line 599
;599:	startTime = ent->trailTime;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
ASGNI4
line 600
;600:	t = step * ( (startTime + step) / step );
ADDRLP4 0
ADDRLP4 20
INDIRI4
ADDRLP4 56
INDIRI4
ADDRLP4 20
INDIRI4
ADDI4
ADDRLP4 20
INDIRI4
DIVI4
MULI4
ASGNI4
line 602
;601:
;602:	BG_EvaluateTrajectory( &es->pos, cg.time, origin );
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+109652
INDIRI4
ARGI4
ADDRLP4 44
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 603
;603:	contents = CG_PointContents( origin, -1 );
ADDRLP4 44
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 68
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 68
INDIRI4
ASGNI4
line 606
;604:
;605:	// if object (e.g. grenade) is stationary, don't toss up smoke
;606:	if ( es->pos.trType == TR_STATIONARY ) {
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $351
line 607
;607:		ent->trailTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 608
;608:		return;
ADDRGP4 $344
JUMPV
LABELV $351
line 611
;609:	}
;610:
;611:	BG_EvaluateTrajectory( &es->pos, ent->trailTime, lastPos );
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 612
;612:	lastContents = CG_PointContents( lastPos, -1 );
ADDRLP4 4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 72
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 60
ADDRLP4 72
INDIRI4
ASGNI4
line 614
;613:
;614:	ent->trailTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 616
;615:
;616:	if ( contents & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ) {
ADDRLP4 40
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $362
line 617
;617:		if ( contents & lastContents & CONTENTS_WATER ) {
ADDRLP4 40
INDIRI4
ADDRLP4 60
INDIRI4
BANDI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $344
line 618
;618:			CG_BubbleTrail( lastPos, origin, 8 );
ADDRLP4 4
ARGP4
ADDRLP4 44
ARGP4
CNSTF4 1090519040
ARGF4
ADDRGP4 CG_BubbleTrail
CALLV
pop
line 619
;619:		}
line 620
;620:		return;
ADDRGP4 $344
JUMPV
line 623
;621:	}
;622:
;623:	for ( ; t <= ent->trailTime ; t += step ) {
LABELV $359
line 624
;624:		BG_EvaluateTrajectory( &es->pos, t, lastPos );
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 626
;625:
;626:		smoke = CG_SmokePuff( lastPos, up, 
ADDRLP4 4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 76
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
ARGF4
ADDRLP4 80
CNSTF4 1065353216
ASGNF4
ADDRLP4 80
INDIRF4
ARGF4
ADDRLP4 80
INDIRF4
ARGF4
ADDRLP4 80
INDIRF4
ARGF4
CNSTF4 1051260355
ARGF4
ADDRLP4 76
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRLP4 84
INDIRI4
ARGI4
ADDRLP4 84
INDIRI4
ARGI4
ADDRGP4 cgs+154388+288
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 CG_SmokePuff
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 88
INDIRP4
ASGNP4
line 635
;627:					  wi->trailRadius, 
;628:					  1, 1, 1, 0.33f,
;629:					  wi->wiTrailTime, 
;630:					  t,
;631:					  0,
;632:					  0, 
;633:					  cgs.media.smokePuffShader );
;634:		// use the optimized local entity add
;635:		smoke->leType = LE_SCALE_FADE;
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 7
ASGNI4
line 636
;636:	}
LABELV $360
line 623
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
ADDI4
ASGNI4
LABELV $362
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
LEI4 $359
line 638
;637:
;638:}
LABELV $344
endproc CG_GrenadeTrail 92 48
export CG_RegisterWeapon
proc CG_RegisterWeapon 308 12
line 649
;639:
;640:
;641:
;642:/*
;643:=================
;644:CG_RegisterWeapon
;645:
;646:The server says this item is used on this level
;647:=================
;648:*/
;649:void CG_RegisterWeapon( int weaponNum ) {
line 656
;650:	weaponInfo_t	*weaponInfo;
;651:	gitem_t			*item, *ammo;
;652:	char			path[MAX_QPATH];
;653:	vec3_t			mins, maxs;
;654:	int				i;
;655:
;656:	weaponInfo = &cg_weapons[weaponNum];
ADDRLP4 12
CNSTI4 136
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cg_weapons
ADDP4
ASGNP4
line 658
;657:
;658:	if ( weaponNum == 0 ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $366
line 659
;659:		return;
ADDRGP4 $365
JUMPV
LABELV $366
line 663
;660:	}
;661:
;662:	
;663:	if ( weaponInfo->registered ) {
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $368
line 664
;664:		return;
ADDRGP4 $365
JUMPV
LABELV $368
line 667
;665:	}
;666:
;667:	memset( weaponInfo, 0, sizeof( *weaponInfo ) );
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 136
ARGI4
ADDRGP4 memset
CALLP4
pop
line 668
;668:	weaponInfo->registered = qtrue;
ADDRLP4 12
INDIRP4
CNSTI4 1
ASGNI4
line 670
;669:
;670:	for ( item = bg_itemlist + 1 ; item->classname ; item++ ) {
ADDRLP4 4
ADDRGP4 bg_itemlist+52
ASGNP4
ADDRGP4 $373
JUMPV
LABELV $370
line 671
;671:		if ( item->giType == IT_WEAPON && item->giTag == weaponNum ) {
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $375
ADDRLP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $375
line 672
;672:			weaponInfo->item = item;
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 673
;673:			break;
ADDRGP4 $372
JUMPV
LABELV $375
line 675
;674:		}
;675:	}
LABELV $371
line 670
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
LABELV $373
ADDRLP4 4
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $370
LABELV $372
line 676
;676:	if ( !item->classname ) {
ADDRLP4 4
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $377
line 677
;677:		CG_Error( "Couldn't find weapon %i", weaponNum );
ADDRGP4 $379
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 678
;678:	}
LABELV $377
line 679
;679:	CG_RegisterItemVisuals( item - bg_itemlist );
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 682
;680:
;681:	// load cmodel before model so filecache works
;682:	weaponInfo->weaponModel = trap_R_RegisterModel( item->world_model[0] );
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
line 685
;683:
;684:	// calc midpoint for rotation
;685:	trap_R_ModelBounds( weaponInfo->weaponModel, mins, maxs );
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRLP4 92
ARGP4
ADDRGP4 trap_R_ModelBounds
CALLV
pop
line 686
;686:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $380
line 687
;687:		weaponInfo->weaponMidpoint[i] = mins[i] + 0.5 * ( maxs[i] - mins[i] );
ADDRLP4 108
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 112
ADDRLP4 108
INDIRI4
ADDRLP4 16
ADDP4
INDIRF4
ASGNF4
ADDRLP4 108
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 24
ADDP4
ADDP4
ADDRLP4 112
INDIRF4
CNSTF4 1056964608
ADDRLP4 108
INDIRI4
ADDRLP4 92
ADDP4
INDIRF4
ADDRLP4 112
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 688
;688:	}
LABELV $381
line 686
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $380
line 690
;689:
;690:	weaponInfo->weaponIcon = trap_R_RegisterShader( item->icon );
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 108
INDIRI4
ASGNI4
line 691
;691:	weaponInfo->ammoIcon = trap_R_RegisterShader( item->icon );
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 112
INDIRI4
ASGNI4
line 693
;692:
;693:	for ( ammo = bg_itemlist + 1 ; ammo->classname ; ammo++ ) {
ADDRLP4 8
ADDRGP4 bg_itemlist+52
ASGNP4
ADDRGP4 $387
JUMPV
LABELV $384
line 694
;694:		if ( ammo->giType == IT_AMMO && ammo->giTag == weaponNum ) {
ADDRLP4 8
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 2
NEI4 $389
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $389
line 695
;695:			break;
ADDRGP4 $386
JUMPV
LABELV $389
line 697
;696:		}
;697:	}
LABELV $385
line 693
ADDRLP4 8
ADDRLP4 8
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
LABELV $387
ADDRLP4 8
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $384
LABELV $386
line 698
;698:	if ( ammo->classname && ammo->world_model[0] ) {
ADDRLP4 120
CNSTU4 0
ASGNU4
ADDRLP4 8
INDIRP4
INDIRP4
CVPU4 4
ADDRLP4 120
INDIRU4
EQU4 $391
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 120
INDIRU4
EQU4 $391
line 699
;699:		weaponInfo->ammoModel = trap_R_RegisterModel( ammo->world_model[0] );
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 124
INDIRI4
ASGNI4
line 700
;700:	}
LABELV $391
line 702
;701:
;702:	strcpy( path, item->world_model[0] );
ADDRLP4 28
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 703
;703:	COM_StripExtension( path, path );
ADDRLP4 28
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 COM_StripExtension
CALLV
pop
line 704
;704:	strcat( path, "_flash.md3" );
ADDRLP4 28
ARGP4
ADDRGP4 $393
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 705
;705:	weaponInfo->flashModel = trap_R_RegisterModel( path );
ADDRLP4 28
ARGP4
ADDRLP4 124
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 124
INDIRI4
ASGNI4
line 707
;706:
;707:	strcpy( path, item->world_model[0] );
ADDRLP4 28
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 708
;708:	COM_StripExtension( path, path );
ADDRLP4 28
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 COM_StripExtension
CALLV
pop
line 709
;709:	strcat( path, "_barrel.md3" );
ADDRLP4 28
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 710
;710:	weaponInfo->barrelModel = trap_R_RegisterModel( path );
ADDRLP4 28
ARGP4
ADDRLP4 128
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 128
INDIRI4
ASGNI4
line 712
;711:
;712:	strcpy( path, item->world_model[0] );
ADDRLP4 28
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 713
;713:	COM_StripExtension( path, path );
ADDRLP4 28
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 COM_StripExtension
CALLV
pop
line 714
;714:	strcat( path, "_hand.md3" );
ADDRLP4 28
ARGP4
ADDRGP4 $395
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 715
;715:	weaponInfo->handsModel = trap_R_RegisterModel( path );
ADDRLP4 28
ARGP4
ADDRLP4 132
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 132
INDIRI4
ASGNI4
line 717
;716:
;717:	if ( !weaponInfo->handsModel ) {
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
NEI4 $396
line 718
;718:		weaponInfo->handsModel = trap_R_RegisterModel( "models/weapons2/shotgun/shotgun_hand.md3" );
ADDRGP4 $398
ARGP4
ADDRLP4 136
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 136
INDIRI4
ASGNI4
line 719
;719:	}
LABELV $396
line 721
;720:
;721:	weaponInfo->loopFireSound = qfalse;
ADDRLP4 12
INDIRP4
CNSTI4 132
ADDP4
CNSTI4 0
ASGNI4
line 723
;722:
;723:	switch ( weaponNum ) {
ADDRLP4 136
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 1
LTI4 $399
ADDRLP4 136
INDIRI4
CNSTI4 11
GTI4 $399
ADDRLP4 136
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $467-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $467
address $401
address $416
address $450
address $427
address $434
address $404
address $440
address $429
address $461
address $413
address $424
code
LABELV $401
line 725
;724:	case WP_GAUNTLET:
;725:		MAKERGB( weaponInfo->flashDlightColor, 0.6f, 0.6f, 1.0f );
ADDRLP4 12
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1058642330
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1058642330
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 48
ADDP4
CNSTF4 1065353216
ASGNF4
line 726
;726:		weaponInfo->firingSound = trap_S_RegisterSound( "sound/weapons/melee/fstrun.wav", qfalse );
ADDRGP4 $402
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 140
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 128
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
line 727
;727:		weaponInfo->flashSound[0] = trap_S_RegisterSound( "sound/weapons/melee/fstatck.wav", qfalse );
ADDRGP4 $403
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 144
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 144
INDIRI4
ASGNI4
line 728
;728:		break;
ADDRGP4 $400
JUMPV
LABELV $404
line 735
;729:
;730:	case WP_LIGHTNING:
;731:		// Shafe - Trep - Flame Thrower
;732:
;733:		/* 2016 */
;734:		//weaponInfo->missileSound = trap_S_RegisterSound( "sound/plasma/lasfly.wav", qfalse );
;735:		weaponInfo->missileSound = trap_S_RegisterSound( "sound/world/electro.ogg", qfalse );
ADDRGP4 $405
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 148
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 84
ADDP4
ADDRLP4 148
INDIRI4
ASGNI4
line 736
;736:		MAKERGB( weaponInfo->flashDlightColor, 0.6f, 0.6f, 1.0f );
ADDRLP4 12
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1058642330
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1058642330
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 48
ADDP4
CNSTF4 1065353216
ASGNF4
line 737
;737:		weaponInfo->flashSound[0] = trap_S_RegisterSound( "sound/weapons/flamethrower/fireimpc.wav", qfalse );
ADDRGP4 $406
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 152
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 152
INDIRI4
ASGNI4
line 738
;738:		cgs.media.flameExplosionShader = trap_R_RegisterShader( "rocketExplosion" );
ADDRGP4 $409
ARGP4
ADDRLP4 156
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+520
ADDRLP4 156
INDIRI4
ASGNI4
line 748
;739:		
;740:
;741:
;742:		//MAKERGB( weaponInfo->flashDlightColor, 0.6f, 0.6f, 1.0f );
;743:		//weaponInfo->readySound = trap_S_RegisterSound( "sound/weapons/melee/fsthum.wav", qfalse );
;744:		//weaponInfo->firingSound = trap_S_RegisterSound( "sound/weapons/lightning/lg_hum.wav", qfalse );
;745:
;746:		//weaponInfo->flashSound[0] = trap_S_RegisterSound( "sound/weapons/lightning/lg_fire.wav", qfalse );
;747:		
;748:		cgs.media.lightningShader = trap_R_RegisterShader( "lightningBoltNew"); // Shafe - Flame Thrower This is Needed For The Grapple (in oa pk3)
ADDRGP4 $412
ARGP4
ADDRLP4 160
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+208
ADDRLP4 160
INDIRI4
ASGNI4
line 755
;749:		
;750:		//cgs.media.lightningExplosionModel = trap_R_RegisterModel( "models/weaphits/crackle.md3" );
;751:		//cgs.media.sfx_lghit1 = trap_S_RegisterSound( "sound/weapons/lightning/lg_hit.wav", qfalse );
;752:		//cgs.media.sfx_lghit2 = trap_S_RegisterSound( "sound/weapons/lightning/lg_hit2.wav", qfalse );
;753:		//cgs.media.sfx_lghit3 = trap_S_RegisterSound( "sound/weapons/lightning/lg_hit3.wav", qfalse );
;754:
;755:		break;
ADDRGP4 $400
JUMPV
LABELV $413
line 758
;756:
;757:	case WP_GRAPPLING_HOOK:
;758:		MAKERGB( weaponInfo->flashDlightColor, 0.6f, 0.6f, 1.0f );
ADDRLP4 12
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1058642330
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1058642330
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 48
ADDP4
CNSTF4 1065353216
ASGNF4
line 759
;759:		weaponInfo->missileModel = trap_R_RegisterModel( "models/ammo/rocket/rocket.md3" );
ADDRGP4 $414
ARGP4
ADDRLP4 164
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 164
INDIRI4
ASGNI4
line 760
;760:		weaponInfo->missileTrailFunc = CG_GrappleTrail;
ADDRLP4 12
INDIRP4
CNSTI4 88
ADDP4
ADDRGP4 CG_GrappleTrail
ASGNP4
line 761
;761:		weaponInfo->missileDlight = 200;
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
CNSTF4 1128792064
ASGNF4
line 762
;762:		weaponInfo->wiTrailTime = 2000;
ADDRLP4 12
INDIRP4
CNSTI4 120
ADDP4
CNSTF4 1157234688
ASGNF4
line 763
;763:		weaponInfo->trailRadius = 64;
ADDRLP4 12
INDIRP4
CNSTI4 116
ADDP4
CNSTF4 1115684864
ASGNF4
line 764
;764:		MAKERGB( weaponInfo->missileDlightColor, 1, 0.75f, 0 );
ADDRLP4 12
INDIRP4
CNSTI4 96
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 100
ADDP4
CNSTF4 1061158912
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 104
ADDP4
CNSTF4 0
ASGNF4
line 765
;765:		weaponInfo->readySound = trap_S_RegisterSound( "sound/weapons/melee/fsthum.wav", qfalse );
ADDRGP4 $415
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 168
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 124
ADDP4
ADDRLP4 168
INDIRI4
ASGNI4
line 766
;766:		weaponInfo->firingSound = trap_S_RegisterSound( "sound/weapons/melee/fstrun.wav", qfalse );
ADDRGP4 $402
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 172
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 128
ADDP4
ADDRLP4 172
INDIRI4
ASGNI4
line 767
;767:		break;
ADDRGP4 $400
JUMPV
LABELV $416
line 784
;768:
;769:#ifdef MISSIONPACK
;770:	case WP_CHAINGUN:
;771:		weaponInfo->firingSound = trap_S_RegisterSound( "sound/weapons/vulcan/wvulfire.wav", qfalse );
;772:		weaponInfo->loopFireSound = qtrue;
;773:		MAKERGB( weaponInfo->flashDlightColor, 1, 1, 0 );
;774:		weaponInfo->flashSound[0] = trap_S_RegisterSound( "sound/weapons/vulcan/vulcanf1b.wav", qfalse );
;775:		weaponInfo->flashSound[1] = trap_S_RegisterSound( "sound/weapons/vulcan/vulcanf2b.wav", qfalse );
;776:		weaponInfo->flashSound[2] = trap_S_RegisterSound( "sound/weapons/vulcan/vulcanf3b.wav", qfalse );
;777:		weaponInfo->flashSound[3] = trap_S_RegisterSound( "sound/weapons/vulcan/vulcanf4b.wav", qfalse );
;778:		//weaponInfo->ejectBrassFunc = CG_MachineGunEjectBrass;
;779:		cgs.media.bulletExplosionShader = trap_R_RegisterShader( "bulletExplosion" );
;780:		break;
;781:#endif
;782:
;783:	case WP_MACHINEGUN:
;784:		MAKERGB( weaponInfo->flashDlightColor, 1, 1, 0 );
ADDRLP4 12
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 48
ADDP4
CNSTF4 0
ASGNF4
line 785
;785:		weaponInfo->flashSound[0] = trap_S_RegisterSound( "sound/weapons/machinegun/machgf1b.wav", qfalse );
ADDRGP4 $417
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 176
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 176
INDIRI4
ASGNI4
line 786
;786:		weaponInfo->flashSound[1] = trap_S_RegisterSound( "sound/weapons/machinegun/machgf2b.wav", qfalse );
ADDRGP4 $418
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 180
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 56
ADDP4
ADDRLP4 180
INDIRI4
ASGNI4
line 787
;787:		weaponInfo->flashSound[2] = trap_S_RegisterSound( "sound/weapons/machinegun/machgf3b.wav", qfalse );
ADDRGP4 $419
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 184
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 184
INDIRI4
ASGNI4
line 788
;788:		weaponInfo->flashSound[3] = trap_S_RegisterSound( "sound/weapons/machinegun/machgf4b.wav", qfalse );
ADDRGP4 $420
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 188
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 188
INDIRI4
ASGNI4
line 790
;789:		//weaponInfo->ejectBrassFunc = CG_MachineGunEjectBrass;
;790:		cgs.media.bulletExplosionShader = trap_R_RegisterShader( "bulletExplosion" );
ADDRGP4 $423
ARGP4
ADDRLP4 192
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+496
ADDRLP4 192
INDIRI4
ASGNI4
line 791
;791:		break;
ADDRGP4 $400
JUMPV
LABELV $424
line 794
;792:
;793:	case WP_TURRET:
;794:		MAKERGB( weaponInfo->flashDlightColor, 1, 1, 0 );
ADDRLP4 12
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 48
ADDP4
CNSTF4 0
ASGNF4
line 795
;795:		weaponInfo->flashSound[0] = trap_S_RegisterSound( "sound/weapons/machinegun/machgf1b.wav", qfalse );
ADDRGP4 $417
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 196
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 196
INDIRI4
ASGNI4
line 796
;796:		weaponInfo->flashSound[1] = trap_S_RegisterSound( "sound/weapons/machinegun/machgf2b.wav", qfalse );
ADDRGP4 $418
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 200
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 56
ADDP4
ADDRLP4 200
INDIRI4
ASGNI4
line 797
;797:		weaponInfo->flashSound[2] = trap_S_RegisterSound( "sound/weapons/machinegun/machgf3b.wav", qfalse );
ADDRGP4 $419
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 204
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 204
INDIRI4
ASGNI4
line 798
;798:		weaponInfo->flashSound[3] = trap_S_RegisterSound( "sound/weapons/machinegun/machgf4b.wav", qfalse );
ADDRGP4 $420
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 208
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 208
INDIRI4
ASGNI4
line 800
;799:		//weaponInfo->ejectBrassFunc = CG_MachineGunEjectBrass;
;800:		cgs.media.bulletExplosionShader = trap_R_RegisterShader( "bulletExplosion" );
ADDRGP4 $423
ARGP4
ADDRLP4 212
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+496
ADDRLP4 212
INDIRI4
ASGNI4
line 808
;801:		/*weaponInfo->missileTrailFunc = CG_PlasmaTrail;
;802:		weaponInfo->missileSound = trap_S_RegisterSound( "sound/weapons/plasma/lasfly.wav", qfalse );
;803:		MAKERGB( weaponInfo->flashDlightColor, 0.6f, 0.6f, 1.0f );
;804:		weaponInfo->flashSound[0] = trap_S_RegisterSound( "sound/weapons/plasma/hyprbf1a.wav", qfalse );
;805:		cgs.media.plasmaExplosionShader = trap_R_RegisterShader( "plasmaExplosion" );
;806:		cgs.media.railRingsShader = trap_R_RegisterShader( "railDisc" );
;807:		*/
;808:		break; 
ADDRGP4 $400
JUMPV
LABELV $427
line 812
;809:
;810:
;811:	case WP_SHOTGUN:
;812:		weaponInfo->flashSound[0] = trap_S_RegisterSound( "sound/weapons/shotgun/sshotf1b.wav", qfalse );
ADDRGP4 $428
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 216
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 216
INDIRI4
ASGNI4
line 813
;813:		weaponInfo->ejectBrassFunc = CG_ShotgunEjectBrass;		
ADDRLP4 12
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 CG_ShotgunEjectBrass
ASGNP4
line 814
;814:		MAKERGB( weaponInfo->flashDlightColor, 1, 1, 0 );
ADDRLP4 12
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 48
ADDP4
CNSTF4 0
ASGNF4
line 815
;815:		break;
ADDRGP4 $400
JUMPV
LABELV $429
line 818
;816:
;817:	case WP_ROCKET_LAUNCHER:
;818:		weaponInfo->missileModel = trap_R_RegisterModel( "models/ammo/rocket/rocket.md3" );
ADDRGP4 $414
ARGP4
ADDRLP4 220
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 220
INDIRI4
ASGNI4
line 819
;819:		weaponInfo->missileSound = trap_S_RegisterSound( "sound/weapons/rocket/rockfly.wav", qfalse );
ADDRGP4 $430
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 224
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 84
ADDP4
ADDRLP4 224
INDIRI4
ASGNI4
line 820
;820:		weaponInfo->missileTrailFunc = CG_RocketTrail;
ADDRLP4 12
INDIRP4
CNSTI4 88
ADDP4
ADDRGP4 CG_RocketTrail
ASGNP4
line 821
;821:		weaponInfo->missileDlight = 200;
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
CNSTF4 1128792064
ASGNF4
line 822
;822:		weaponInfo->wiTrailTime = 2000; 
ADDRLP4 12
INDIRP4
CNSTI4 120
ADDP4
CNSTF4 1157234688
ASGNF4
line 823
;823:		weaponInfo->trailRadius = 64; 
ADDRLP4 12
INDIRP4
CNSTI4 116
ADDP4
CNSTF4 1115684864
ASGNF4
line 825
;824:		
;825:		MAKERGB( weaponInfo->missileDlightColor, 1, 0.75f, 0 );
ADDRLP4 12
INDIRP4
CNSTI4 96
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 100
ADDP4
CNSTF4 1061158912
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 104
ADDP4
CNSTF4 0
ASGNF4
line 826
;826:		MAKERGB( weaponInfo->flashDlightColor, 1, 0.75f, 0 );
ADDRLP4 12
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1061158912
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 48
ADDP4
CNSTF4 0
ASGNF4
line 828
;827:
;828:		weaponInfo->flashSound[0] = trap_S_RegisterSound( "sound/weapons/rocket/rocklf1a.wav", qfalse );
ADDRGP4 $431
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 228
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 228
INDIRI4
ASGNI4
line 829
;829:		cgs.media.rocketExplosionShader = trap_R_RegisterShader( "rocketExplosion" );
ADDRGP4 $409
ARGP4
ADDRLP4 232
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+500
ADDRLP4 232
INDIRI4
ASGNI4
line 830
;830:		break;
ADDRGP4 $400
JUMPV
LABELV $434
line 845
;831:
;832:#ifdef MISSIONPACK
;833:	case WP_PROX_LAUNCHER:
;834:		weaponInfo->missileModel = trap_R_RegisterModel( "models/weaphits/proxmine.md3" );
;835:		weaponInfo->missileTrailFunc = CG_GrenadeTrail;
;836:		weaponInfo->wiTrailTime = 700;
;837:		weaponInfo->trailRadius = 32;
;838:		MAKERGB( weaponInfo->flashDlightColor, 1, 0.70f, 0 );
;839:		weaponInfo->flashSound[0] = trap_S_RegisterSound( "sound/weapons/proxmine/wstbfire.wav", qfalse );
;840:		cgs.media.grenadeExplosionShader = trap_R_RegisterShader( "grenadeExplosion" );
;841:		break;
;842:#endif
;843:
;844:	case WP_GRENADE_LAUNCHER:
;845:		weaponInfo->missileModel = trap_R_RegisterModel( "models/ammo/grenade1.md3" );
ADDRGP4 $435
ARGP4
ADDRLP4 236
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 236
INDIRI4
ASGNI4
line 846
;846:		weaponInfo->missileTrailFunc = CG_GrenadeTrail;
ADDRLP4 12
INDIRP4
CNSTI4 88
ADDP4
ADDRGP4 CG_GrenadeTrail
ASGNP4
line 847
;847:		weaponInfo->wiTrailTime = 700;
ADDRLP4 12
INDIRP4
CNSTI4 120
ADDP4
CNSTF4 1143930880
ASGNF4
line 848
;848:		weaponInfo->trailRadius = 32;
ADDRLP4 12
INDIRP4
CNSTI4 116
ADDP4
CNSTF4 1107296256
ASGNF4
line 849
;849:		MAKERGB( weaponInfo->flashDlightColor, 1, 0.70f, 0 );
ADDRLP4 12
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1060320051
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 48
ADDP4
CNSTF4 0
ASGNF4
line 850
;850:		weaponInfo->flashSound[0] = trap_S_RegisterSound( "sound/weapons/grenade/grenlf1a.wav", qfalse );
ADDRGP4 $436
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 240
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 240
INDIRI4
ASGNI4
line 851
;851:		cgs.media.grenadeExplosionShader = trap_R_RegisterShader( "grenadeExplosion" );
ADDRGP4 $439
ARGP4
ADDRLP4 244
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+504
ADDRLP4 244
INDIRI4
ASGNI4
line 852
;852:		break;
ADDRGP4 $400
JUMPV
LABELV $440
line 870
;853:
;854:#ifdef MISSIONPACK
;855:	case WP_NAILGUN:
;856:		weaponInfo->ejectBrassFunc = CG_NailgunEjectBrass;
;857:		weaponInfo->missileTrailFunc = CG_NailTrail;
;858://		weaponInfo->missileSound = trap_S_RegisterSound( "sound/weapons/nailgun/wnalflit.wav", qfalse );
;859:		weaponInfo->trailRadius = 16;
;860:		weaponInfo->wiTrailTime = 250;
;861:		weaponInfo->missileModel = trap_R_RegisterModel( "models/weaphits/nail.md3" );
;862:		MAKERGB( weaponInfo->flashDlightColor, 1, 0.75f, 0 );
;863:		weaponInfo->flashSound[0] = trap_S_RegisterSound( "sound/weapons/nailgun/wnalfire.wav", qfalse );
;864:		break;
;865:#endif
;866:
;867:	case WP_PLASMAGUN:
;868:		
;869://		weaponInfo->missileModel = cgs.media.invulnerabilityPowerupModel;
;870:		weaponInfo->missileModel = trap_R_RegisterModel( "models/weaphits/disc.md3" );
ADDRGP4 $441
ARGP4
ADDRLP4 248
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 248
INDIRI4
ASGNI4
line 871
;871:		weaponInfo->missileTrailFunc = CG_PlasmaTrail;
ADDRLP4 12
INDIRP4
CNSTI4 88
ADDP4
ADDRGP4 CG_PlasmaTrail
ASGNP4
line 872
;872:		weaponInfo->missileSound = trap_S_RegisterSound( "sound/weapons/plasma/lasfly.wav", qfalse );
ADDRGP4 $442
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 252
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 84
ADDP4
ADDRLP4 252
INDIRI4
ASGNI4
line 873
;873:		MAKERGB( weaponInfo->flashDlightColor, 0.6f, 0.6f, 1.0f );
ADDRLP4 12
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1058642330
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1058642330
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 48
ADDP4
CNSTF4 1065353216
ASGNF4
line 874
;874:		weaponInfo->flashSound[0] = trap_S_RegisterSound( "sound/weapons/plasma/hyprbf1a.wav", qfalse );
ADDRGP4 $443
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 256
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 256
INDIRI4
ASGNI4
line 875
;875:		cgs.media.plasmaExplosionShader = trap_R_RegisterShader( "plasmaExplosion" );
ADDRGP4 $446
ARGP4
ADDRLP4 260
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+492
ADDRLP4 260
INDIRI4
ASGNI4
line 876
;876:		cgs.media.railRingsShader = trap_R_RegisterShader( "railDisc" );
ADDRGP4 $449
ARGP4
ADDRLP4 264
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+200
ADDRLP4 264
INDIRI4
ASGNI4
line 877
;877:		break;
ADDRGP4 $400
JUMPV
LABELV $450
line 880
;878:
;879:	case WP_RAILGUN:
;880:		weaponInfo->readySound = trap_S_RegisterSound( "sound/weapons/railgun/rg_hum.wav", qfalse );
ADDRGP4 $451
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 268
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 124
ADDP4
ADDRLP4 268
INDIRI4
ASGNI4
line 881
;881:		MAKERGB( weaponInfo->flashDlightColor, 1, 0.5f, 0 );
ADDRLP4 12
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1056964608
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 48
ADDP4
CNSTF4 0
ASGNF4
line 882
;882:		weaponInfo->flashSound[0] = trap_S_RegisterSound( "sound/weapons/railgun/railgf1a.wav", qfalse ); 
ADDRGP4 $452
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 272
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 272
INDIRI4
ASGNI4
line 883
;883:		cgs.media.railExplosionShader = trap_R_RegisterShader( "railExplosion" );
ADDRGP4 $455
ARGP4
ADDRLP4 276
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+488
ADDRLP4 276
INDIRI4
ASGNI4
line 884
;884:		cgs.media.railRingsShader = trap_R_RegisterShader( "railDisc" );
ADDRGP4 $449
ARGP4
ADDRLP4 280
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+200
ADDRLP4 280
INDIRI4
ASGNI4
line 885
;885:		cgs.media.railCoreShader = trap_R_RegisterShader( "railCore" );
ADDRGP4 $460
ARGP4
ADDRLP4 284
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+204
ADDRLP4 284
INDIRI4
ASGNI4
line 886
;886:		break;
ADDRGP4 $400
JUMPV
LABELV $461
line 889
;887:
;888:	case WP_BFG:
;889:		weaponInfo->readySound = trap_S_RegisterSound( "sound/weapons/bfg/bfg_hum.wav", qfalse );
ADDRGP4 $462
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 288
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 124
ADDP4
ADDRLP4 288
INDIRI4
ASGNI4
line 892
;890:		
;891:		// Devastator
;892:		weaponInfo->missileTrailFunc = CG_GrenadeTrail;
ADDRLP4 12
INDIRP4
CNSTI4 88
ADDP4
ADDRGP4 CG_GrenadeTrail
ASGNP4
line 893
;893:		weaponInfo->wiTrailTime = 900;
ADDRLP4 12
INDIRP4
CNSTI4 120
ADDP4
CNSTF4 1147207680
ASGNF4
line 894
;894:		weaponInfo->trailRadius = 90;
ADDRLP4 12
INDIRP4
CNSTI4 116
ADDP4
CNSTF4 1119092736
ASGNF4
line 896
;895:		
;896:		MAKERGB( weaponInfo->flashDlightColor, 1, 0.7f, 1 );
ADDRLP4 12
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1060320051
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 48
ADDP4
CNSTF4 1065353216
ASGNF4
line 897
;897:		weaponInfo->flashSound[0] = trap_S_RegisterSound( "sound/weapons/bfg/bfg_fire.wav", qfalse );
ADDRGP4 $463
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 292
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 292
INDIRI4
ASGNI4
line 898
;898:		cgs.media.bfgExplosionShader = trap_R_RegisterShader( "bfgExplosion" );
ADDRGP4 $466
ARGP4
ADDRLP4 296
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+508
ADDRLP4 296
INDIRI4
ASGNI4
line 901
;899:		//cgs.media.bfgExplosionShader = trap_R_RegisterShader( "grenadeExplosion" );
;900:		//weaponInfo->missileModel = trap_R_RegisterModel( "models/weaphits/bfg.md3" );
;901:		weaponInfo->missileSound = trap_S_RegisterSound( "sound/weapons/rocket/rockfly.wav", qfalse );
ADDRGP4 $430
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 300
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 84
ADDP4
ADDRLP4 300
INDIRI4
ASGNI4
line 907
;902:		
;903:
;904:
;905:		
;906:
;907:		break;
ADDRGP4 $400
JUMPV
LABELV $399
line 910
;908:
;909:	 default:
;910:		MAKERGB( weaponInfo->flashDlightColor, 1, 1, 1 );
ADDRLP4 12
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 48
ADDP4
CNSTF4 1065353216
ASGNF4
line 911
;911:		weaponInfo->flashSound[0] = trap_S_RegisterSound( "sound/weapons/rocket/rocklf1a.wav", qfalse );
ADDRGP4 $431
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 304
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 304
INDIRI4
ASGNI4
line 912
;912:		break;
LABELV $400
line 914
;913:	}
;914:}
LABELV $365
endproc CG_RegisterWeapon 308 12
export CG_RegisterItemVisuals
proc CG_RegisterItemVisuals 28 12
line 923
;915:
;916:/*
;917:=================
;918:CG_RegisterItemVisuals
;919:
;920:The server says this item is used on this level
;921:=================
;922:*/
;923:void CG_RegisterItemVisuals( int itemNum ) {
line 927
;924:	itemInfo_t		*itemInfo;
;925:	gitem_t			*item;
;926:
;927:	if ( itemNum < 0 || itemNum >= bg_numItems ) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $472
ADDRLP4 8
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $470
LABELV $472
line 928
;928:		CG_Error( "CG_RegisterItemVisuals: itemNum %d out of range [0-%d]", itemNum, bg_numItems-1 );
ADDRGP4 $473
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 bg_numItems
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 929
;929:	}
LABELV $470
line 931
;930:
;931:	itemInfo = &cg_items[ itemNum ];
ADDRLP4 4
CNSTI4 24
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cg_items
ADDP4
ASGNP4
line 932
;932:	if ( itemInfo->registered ) {
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $474
line 933
;933:		return;
ADDRGP4 $469
JUMPV
LABELV $474
line 936
;934:	}
;935:
;936:	item = &bg_itemlist[ itemNum ];
ADDRLP4 0
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 938
;937:
;938:	memset( itemInfo, 0, sizeof( &itemInfo ) );
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 memset
CALLP4
pop
line 939
;939:	itemInfo->registered = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 1
ASGNI4
line 941
;940:
;941:	itemInfo->models[0] = trap_R_RegisterModel( item->world_model[0] );
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 943
;942:
;943:	itemInfo->icon = trap_R_RegisterShader( item->icon );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 945
;944:
;945:	if ( item->giType == IT_WEAPON ) {
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $476
line 946
;946:		CG_RegisterWeapon( item->giTag );
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_RegisterWeapon
CALLV
pop
line 947
;947:	}
LABELV $476
line 952
;948:
;949:	//
;950:	// powerups have an accompanying ring or sphere
;951:	//
;952:	if ( item->giType == IT_POWERUP || item->giType == IT_HEALTH || 
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 5
EQI4 $482
ADDRLP4 20
INDIRI4
CNSTI4 4
EQI4 $482
ADDRLP4 20
INDIRI4
CNSTI4 3
EQI4 $482
ADDRLP4 20
INDIRI4
CNSTI4 6
NEI4 $478
LABELV $482
line 953
;953:		item->giType == IT_ARMOR || item->giType == IT_HOLDABLE ) {
line 954
;954:		if ( item->world_model[1] ) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $483
line 955
;955:			itemInfo->models[1] = trap_R_RegisterModel( item->world_model[1] );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 956
;956:		}
LABELV $483
line 957
;957:	}
LABELV $478
line 958
;958:}
LABELV $469
endproc CG_RegisterItemVisuals 28 12
proc CG_MapTorsoToWeaponFrame 24 0
line 975
;959:
;960:
;961:/*
;962:========================================================================================
;963:
;964:VIEW WEAPON
;965:
;966:========================================================================================
;967:*/
;968:
;969:/*
;970:=================
;971:CG_MapTorsoToWeaponFrame
;972:
;973:=================
;974:*/
;975:static int CG_MapTorsoToWeaponFrame( clientInfo_t *ci, int frame ) {
line 978
;976:
;977:	// change weapon
;978:	if ( frame >= ci->animations[TORSO_DROP].firstFrame 
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $486
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 9
ADDI4
GEI4 $486
line 979
;979:		&& frame < ci->animations[TORSO_DROP].firstFrame + 9 ) {
line 980
;980:		return frame - ci->animations[TORSO_DROP].firstFrame + 6;
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
SUBI4
CNSTI4 6
ADDI4
RETI4
ADDRGP4 $485
JUMPV
LABELV $486
line 984
;981:	}
;982:
;983:	// stand attack
;984:	if ( frame >= ci->animations[TORSO_ATTACK].firstFrame 
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $488
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
CNSTI4 6
ADDI4
GEI4 $488
line 985
;985:		&& frame < ci->animations[TORSO_ATTACK].firstFrame + 6 ) {
line 986
;986:		return 1 + frame - ci->animations[TORSO_ATTACK].firstFrame;
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ADDRFP4 0
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
SUBI4
RETI4
ADDRGP4 $485
JUMPV
LABELV $488
line 990
;987:	}
;988:
;989:	// stand attack 2
;990:	if ( frame >= ci->animations[TORSO_ATTACK2].firstFrame 
ADDRLP4 16
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
LTI4 $490
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
CNSTI4 6
ADDI4
GEI4 $490
line 991
;991:		&& frame < ci->animations[TORSO_ATTACK2].firstFrame + 6 ) {
line 992
;992:		return 1 + frame - ci->animations[TORSO_ATTACK2].firstFrame;
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
INDIRI4
SUBI4
RETI4
ADDRGP4 $485
JUMPV
LABELV $490
line 995
;993:	}
;994:	
;995:	return 0;
CNSTI4 0
RETI4
LABELV $485
endproc CG_MapTorsoToWeaponFrame 24 0
proc CG_CalculateWeaponPosition 40 4
line 1004
;996:}
;997:
;998:
;999:/*
;1000:==============
;1001:CG_CalculateWeaponPosition
;1002:==============
;1003:*/
;1004:static void CG_CalculateWeaponPosition( vec3_t origin, vec3_t angles ) {
line 1009
;1005:	float	scale;
;1006:	int		delta;
;1007:	float	fracsin;
;1008:
;1009:	VectorCopy( cg.refdef.vieworg, origin );
ADDRFP4 0
INDIRP4
ADDRGP4 cg+111104+24
INDIRB
ASGNB 12
line 1010
;1010:	VectorCopy( cg.refdefViewAngles, angles );
ADDRFP4 4
INDIRP4
ADDRGP4 cg+111472
INDIRB
ASGNB 12
line 1013
;1011:
;1012:	// on odd legs, invert some angles
;1013:	if ( cg.bobcycle & 1 ) {
ADDRGP4 cg+126840
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $496
line 1014
;1014:		scale = -cg.xyspeed;
ADDRLP4 0
ADDRGP4 cg+126844
INDIRF4
NEGF4
ASGNF4
line 1015
;1015:	} else {
ADDRGP4 $497
JUMPV
LABELV $496
line 1016
;1016:		scale = cg.xyspeed;
ADDRLP4 0
ADDRGP4 cg+126844
INDIRF4
ASGNF4
line 1017
;1017:	}
LABELV $497
line 1020
;1018:
;1019:	// gun angles from bobbing
;1020:	angles[ROLL] += scale * cg.bobfracsin * 0.005;
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CNSTF4 1000593162
ADDRLP4 0
INDIRF4
ADDRGP4 cg+126836
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 1021
;1021:	angles[YAW] += scale * cg.bobfracsin * 0.01;
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CNSTF4 1008981770
ADDRLP4 0
INDIRF4
ADDRGP4 cg+126836
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 1022
;1022:	angles[PITCH] += cg.xyspeed * cg.bobfracsin * 0.005;
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
CNSTF4 1000593162
ADDRGP4 cg+126844
INDIRF4
ADDRGP4 cg+126836
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 1025
;1023:
;1024:	// drop the weapon when landing
;1025:	delta = cg.time - cg.landTime;
ADDRLP4 8
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cg+111000
INDIRI4
SUBI4
ASGNI4
line 1026
;1026:	if ( delta < LAND_DEFLECT_TIME ) {
ADDRLP4 8
INDIRI4
CNSTI4 150
GEI4 $507
line 1027
;1027:		origin[2] += cg.landChange*0.25 * delta / LAND_DEFLECT_TIME;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CNSTF4 1048576000
ADDRGP4 cg+110996
INDIRF4
MULF4
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
CNSTF4 1125515264
DIVF4
ADDF4
ASGNF4
line 1028
;1028:	} else if ( delta < LAND_DEFLECT_TIME + LAND_RETURN_TIME ) {
ADDRGP4 $508
JUMPV
LABELV $507
ADDRLP4 8
INDIRI4
CNSTI4 450
GEI4 $510
line 1029
;1029:		origin[2] += cg.landChange*0.25 * 
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CNSTF4 1048576000
ADDRGP4 cg+110996
INDIRF4
MULF4
CNSTI4 450
ADDRLP4 8
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1133903872
DIVF4
ADDF4
ASGNF4
line 1031
;1030:			(LAND_DEFLECT_TIME + LAND_RETURN_TIME - delta) / LAND_RETURN_TIME;
;1031:	}
LABELV $510
LABELV $508
line 1044
;1032:
;1033:#if 0
;1034:	// drop the weapon when stair climbing
;1035:	delta = cg.time - cg.stepTime;
;1036:	if ( delta < STEP_TIME/2 ) {
;1037:		origin[2] -= cg.stepChange*0.25 * delta / (STEP_TIME/2);
;1038:	} else if ( delta < STEP_TIME ) {
;1039:		origin[2] -= cg.stepChange*0.25 * (STEP_TIME - delta) / (STEP_TIME/2);
;1040:	}
;1041:#endif
;1042:
;1043:	// idle drift
;1044:	scale = cg.xyspeed + 40;
ADDRLP4 0
ADDRGP4 cg+126844
INDIRF4
CNSTF4 1109393408
ADDF4
ASGNF4
line 1045
;1045:	fracsin = sin( cg.time * 0.001 );
CNSTF4 981668463
ADDRGP4 cg+109652
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 24
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 24
INDIRF4
ASGNF4
line 1046
;1046:	angles[ROLL] += scale * fracsin * 0.01;
ADDRLP4 28
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
CNSTF4 1008981770
ADDRLP4 0
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 1047
;1047:	angles[YAW] += scale * fracsin * 0.01;
ADDRLP4 32
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
CNSTF4 1008981770
ADDRLP4 0
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 1048
;1048:	angles[PITCH] += scale * fracsin * 0.01;
ADDRLP4 36
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
CNSTF4 1008981770
ADDRLP4 0
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 1049
;1049:}
LABELV $492
endproc CG_CalculateWeaponPosition 40 4
proc CG_SpawnRailTrail 4 12
line 1179
;1050:
;1051:
;1052:/*
;1053:===============
;1054:CG_LightningBolt
;1055:
;1056:Origin will be the exact tag point, which is slightly
;1057:different than the muzzle point used for determining hits.
;1058:The cent should be the non-predicted cent if it is from the player,
;1059:so the endpoint will reflect the simulated strike (lagging the predicted
;1060:angle)
;1061:===============
;1062:static void CG_LightningBolt( centity_t *cent, vec3_t origin ) {
;1063:	trace_t  trace;
;1064:	refEntity_t  beam;
;1065:	vec3_t   forward;
;1066:	vec3_t   muzzlePoint, endPoint;
;1067:
;1068:	if (cent->currentState.weapon != WP_LIGHTNING) {
;1069:		return;
;1070:	}
;1071:
;1072:	memset( &beam, 0, sizeof( beam ) );
;1073:
;1074://unlagged - attack prediction #1
;1075:	// if the entity is us, unlagged is on server-side, and we've got it on for the lightning gun
;1076:	if ( (cent->currentState.number == cg.predictedPlayerState.clientNum) && cgs.delagHitscan &&
;1077:			( cg_delag.integer & 1 || cg_delag.integer & 8 ) ) {
;1078:		// always shoot straight forward from our current position
;1079:		AngleVectors( cg.predictedPlayerState.viewangles, forward, NULL, NULL );
;1080:		VectorCopy( cg.predictedPlayerState.origin, muzzlePoint );
;1081:	}
;1082:	else
;1083://unlagged - attack prediction #1
;1084:	// CPMA  "true" lightning
;1085:	if ((cent->currentState.number == cg.predictedPlayerState.clientNum) && (cg_trueLightning.value != 0)) {
;1086:		vec3_t angle;
;1087:		int i;
;1088:
;1089://unlagged - true lightning
;1090:		// might as well fix up true lightning while we're at it
;1091:		vec3_t viewangles;
;1092:		VectorCopy( cg.predictedPlayerState.viewangles, viewangles );
;1093://unlagged - true lightning
;1094:
;1095:		for (i = 0; i < 3; i++) {
;1096:			float a = cent->lerpAngles[i] - viewangles[i]; //unlagged: was cg.refdefViewAngles[i];
;1097:			if (a > 180) {
;1098:				a -= 360;
;1099:			}
;1100:			if (a < -180) {
;1101:				a += 360;
;1102:			}
;1103:
;1104:			angle[i] = viewangles[i] /*unlagged: was cg.refdefViewAngles[i] + a * (1.0 - cg_trueLightning.value);
;1105:			if (angle[i] < 0) {
;1106:				angle[i] += 360;
;1107:			}
;1108:			if (angle[i] > 360) {
;1109:				angle[i] -= 360;
;1110:			}
;1111:		}
;1112:
;1113:		AngleVectors(angle, forward, NULL, NULL );
;1114://unlagged - true lightning
;1115://		VectorCopy(cent->lerpOrigin, muzzlePoint );
;1116://		VectorCopy(cg.refdef.vieworg, muzzlePoint );
;1117:		// *this* is the correct origin for true lightning
;1118:		VectorCopy(cg.predictedPlayerState.origin, muzzlePoint );
;1119://unlagged - true lightning
;1120:	} else {
;1121:		// !CPMA
;1122:		AngleVectors( cent->lerpAngles, forward, NULL, NULL );
;1123:		VectorCopy(cent->lerpOrigin, muzzlePoint );
;1124:	}
;1125:
;1126:	// FIXME: crouch
;1127:	muzzlePoint[2] += DEFAULT_VIEWHEIGHT;
;1128:
;1129:	VectorMA( muzzlePoint, 14, forward, muzzlePoint );
;1130:
;1131:	// project forward by the lightning range
;1132:	VectorMA( muzzlePoint, LIGHTNING_RANGE, forward, endPoint );
;1133:
;1134:	// see if it hit a wall
;1135:	CG_Trace( &trace, muzzlePoint, vec3_origin, vec3_origin, endPoint, 
;1136:		cent->currentState.number, MASK_SHOT );
;1137:
;1138:	// this is the endpoint
;1139:	VectorCopy( trace.endpos, beam.oldorigin );
;1140:
;1141:	// use the provided origin, even though it may be slightly
;1142:	// different than the muzzle origin
;1143:	VectorCopy( origin, beam.origin );
;1144:
;1145:	beam.reType = RT_LIGHTNING;
;1146:	beam.customShader = cgs.media.lightningShader;
;1147:	trap_R_AddRefEntityToScene( &beam );
;1148:
;1149:	// add the impact flare if it hit something
;1150:	if ( trace.fraction < 1.0 ) {
;1151:		vec3_t	angles;
;1152:		vec3_t	dir;
;1153:
;1154:		VectorSubtract( beam.oldorigin, beam.origin, dir );
;1155:		VectorNormalize( dir );
;1156:
;1157:		memset( &beam, 0, sizeof( beam ) );
;1158:		beam.hModel = cgs.media.lightningExplosionModel;
;1159:
;1160:		VectorMA( trace.endpos, -16, dir, beam.origin );
;1161:
;1162:		// make a random orientation
;1163:		angles[0] = rand() % 360;
;1164:		angles[1] = rand() % 360;
;1165:		angles[2] = rand() % 360;
;1166:		AnglesToAxis( angles, beam.axis );
;1167:		trap_R_AddRefEntityToScene( &beam );
;1168:	}
;1169:}
;1170:
;1171:/*
;1172:===============
;1173:CG_SpawnRailTrail
;1174:
;1175:Origin will be the exact tag point, which is slightly
;1176:different than the muzzle point used for determining hits.
;1177:===============
;1178:*/
;1179:static void CG_SpawnRailTrail( centity_t *cent, vec3_t origin ) {
line 1182
;1180:	clientInfo_t	*ci;
;1181:
;1182:	if ( cent->currentState.weapon != WP_RAILGUN ) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 3
EQI4 $516
line 1183
;1183:		return;
ADDRGP4 $515
JUMPV
LABELV $516
line 1185
;1184:	}
;1185:	if ( !cent->pe.railgunFlash ) {
ADDRFP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 0
NEI4 $518
line 1186
;1186:		return;
ADDRGP4 $515
JUMPV
LABELV $518
line 1188
;1187:	}
;1188:	cent->pe.railgunFlash = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 628
ADDP4
CNSTI4 1
ASGNI4
line 1189
;1189:	ci = &cgs.clientinfo[ cent->currentState.clientNum ];
ADDRLP4 0
CNSTI4 1740
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 1190
;1190:	CG_RailTrail( ci, origin, cent->pe.railgunImpact );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
ARGP4
ADDRGP4 CG_RailTrail
CALLV
pop
line 1191
;1191:}
LABELV $515
endproc CG_SpawnRailTrail 4 12
proc CG_MachinegunSpinAngle 32 4
line 1201
;1192:
;1193:
;1194:/*
;1195:======================
;1196:CG_MachinegunSpinAngle
;1197:======================
;1198:*/
;1199:#define		SPIN_SPEED	0.9
;1200:#define		COAST_TIME	1000
;1201:static float	CG_MachinegunSpinAngle( centity_t *cent ) {
line 1206
;1202:	int		delta;
;1203:	float	angle;
;1204:	float	speed;
;1205:
;1206:	delta = cg.time - cent->pe.barrelTime;
ADDRLP4 0
ADDRGP4 cg+109652
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1207
;1207:	if ( cent->pe.barrelSpinning ) {
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
CNSTI4 0
EQI4 $523
line 1208
;1208:		angle = cent->pe.barrelAngle + delta * SPIN_SPEED;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
CNSTF4 1063675494
ADDRLP4 0
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 1209
;1209:	} else {
ADDRGP4 $524
JUMPV
LABELV $523
line 1210
;1210:		if ( delta > COAST_TIME ) {
ADDRLP4 0
INDIRI4
CNSTI4 1000
LEI4 $525
line 1211
;1211:			delta = COAST_TIME;
ADDRLP4 0
CNSTI4 1000
ASGNI4
line 1212
;1212:		}
LABELV $525
line 1214
;1213:
;1214:		speed = 0.5 * ( SPIN_SPEED + (float)( COAST_TIME - delta ) / COAST_TIME );
ADDRLP4 8
CNSTF4 1056964608
CNSTI4 1000
ADDRLP4 0
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1148846080
DIVF4
CNSTF4 1063675494
ADDF4
MULF4
ASGNF4
line 1215
;1215:		angle = cent->pe.barrelAngle + delta * speed;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CVIF4 4
ADDRLP4 8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1216
;1216:	}
LABELV $524
line 1218
;1217:
;1218:	if ( cent->pe.barrelSpinning == !(cent->currentState.eFlags & EF_FIRING) ) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
NEI4 $530
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $531
JUMPV
LABELV $530
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $531
ADDRLP4 16
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $527
line 1219
;1219:		cent->pe.barrelTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1220
;1220:		cent->pe.barrelAngle = AngleMod( angle );
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
line 1221
;1221:		cent->pe.barrelSpinning = !!(cent->currentState.eFlags & EF_FIRING);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $534
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $535
JUMPV
LABELV $534
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $535
ADDRLP4 28
INDIRP4
CNSTI4 640
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 1227
;1222:#ifdef MISSIONPACK
;1223:		if ( cent->currentState.weapon == WP_CHAINGUN && !cent->pe.barrelSpinning ) {
;1224:			trap_S_StartSound( NULL, cent->currentState.number, CHAN_WEAPON, trap_S_RegisterSound( "sound/weapons/vulcan/wvulwind.wav", qfalse ) );
;1225:		}
;1226:#endif
;1227:	}
LABELV $527
line 1229
;1228:
;1229:	return angle;
ADDRLP4 4
INDIRF4
RETF4
LABELV $521
endproc CG_MachinegunSpinAngle 32 4
proc CG_AddWeaponWithPowerups 12 4
line 1239
;1230:}
;1231:
;1232:
;1233:/*
;1234:========================
;1235:CG_AddWeaponWithPowerups
;1236:========================
;1237:*/
;1238:static void CG_AddWeaponWithPowerups( refEntity_t *gun, int powerups, centity_t *cent ) 
;1239:{
line 1243
;1240:	entityState_t	*state;
;1241:	clientInfo_t	*ci;
;1242:	int				clientNum;
;1243:	state		=	&cent->currentState;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
line 1244
;1244:	clientNum	=	cent->currentState.clientNum;
ADDRLP4 8
ADDRFP4 8
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 1245
;1245:	ci			=	&cgs.clientinfo[ clientNum ];
ADDRLP4 4
CNSTI4 1740
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 1247
;1246:	
;1247:	if ( state->time2 == 9 || ci->cgimmobilized == qtrue )	
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 9
EQI4 $540
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 1
NEI4 $538
LABELV $540
line 1248
;1248:	{ //-Vincent
line 1249
;1249:	gun->customShader = cgs.media.immobilizedWepShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+154388+468
INDIRI4
ASGNI4
line 1250
;1250:	trap_R_AddRefEntityToScene( gun );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1251
;1251:	}
LABELV $538
line 1254
;1252:
;1253:	// add powerup effects
;1254:	if ( powerups & ( 1 << PW_INVIS ) ) {
ADDRFP4 4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $543
line 1255
;1255:		gun->customShader = cgs.media.invisShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+154388+436
INDIRI4
ASGNI4
line 1256
;1256:		trap_R_AddRefEntityToScene( gun );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1257
;1257:	} else {
ADDRGP4 $544
JUMPV
LABELV $543
line 1258
;1258:		trap_R_AddRefEntityToScene( gun );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1260
;1259:
;1260:		if ( powerups & ( 1 << PW_BATTLESUIT ) ) {
ADDRFP4 4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $547
line 1261
;1261:			gun->customShader = cgs.media.battleWeaponShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+154388+448
INDIRI4
ASGNI4
line 1262
;1262:			trap_R_AddRefEntityToScene( gun );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1263
;1263:		}
LABELV $547
line 1264
;1264:		if ( powerups & ( 1 << PW_QUAD ) ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $551
line 1265
;1265:			gun->customShader = cgs.media.quadWeaponShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+154388+432
INDIRI4
ASGNI4
line 1266
;1266:			trap_R_AddRefEntityToScene( gun );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1267
;1267:		}
LABELV $551
line 1268
;1268:	}
LABELV $544
line 1272
;1269:
;1270:	
;1271:
;1272:}
LABELV $536
endproc CG_AddWeaponWithPowerups 12 4
export CG_AddPlayerWeapon
proc CG_AddPlayerWeapon 500 20
line 1284
;1273:
;1274:
;1275:/*
;1276:=============
;1277:CG_AddPlayerWeapon
;1278:
;1279:Used for both the view weapon (ps is valid) and the world modelother character models (ps is NULL)
;1280:The main player will have this called for BOTH cases, so effects like light and
;1281:sound should only be done on the world model case.
;1282:=============
;1283:*/
;1284:void CG_AddPlayerWeapon( refEntity_t *parent, playerState_t *ps, centity_t *cent, int team ) {
line 1294
;1285:	refEntity_t	gun;
;1286:	refEntity_t	barrel;
;1287:	refEntity_t	flash;
;1288:	vec3_t		angles;
;1289:	weapon_t	weaponNum;
;1290:	weaponInfo_t	*weapon;
;1291:	centity_t	*nonPredictedCent;
;1292://	int	col;
;1293:
;1294:	weaponNum = cent->currentState.weapon;
ADDRLP4 284
ADDRFP4 8
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 1296
;1295:
;1296:	CG_RegisterWeapon( weaponNum );
ADDRLP4 284
INDIRI4
ARGI4
ADDRGP4 CG_RegisterWeapon
CALLV
pop
line 1297
;1297:	weapon = &cg_weapons[weaponNum];
ADDRLP4 280
CNSTI4 136
ADDRLP4 284
INDIRI4
MULI4
ADDRGP4 cg_weapons
ADDP4
ASGNP4
line 1300
;1298:
;1299:	// add the weapon
;1300:	memset( &gun, 0, sizeof( gun ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1301
;1301:	VectorCopy( parent->lightingOrigin, gun.lightingOrigin );
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 1302
;1302:	gun.shadowPlane = parent->shadowPlane;
ADDRLP4 0+24
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1303
;1303:	gun.renderfx = parent->renderfx;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1306
;1304:
;1305:	// set custom shading for railgun refire rate
;1306:	if ( ps ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $559
line 1307
;1307:		if ( cg.predictedPlayerState.weapon == WP_RAILGUN 
ADDRLP4 444
CNSTI4 3
ASGNI4
ADDRGP4 cg+109684+144
INDIRI4
ADDRLP4 444
INDIRI4
NEI4 $561
ADDRGP4 cg+109684+148
INDIRI4
ADDRLP4 444
INDIRI4
NEI4 $561
line 1308
;1308:			&& cg.predictedPlayerState.weaponstate == WEAPON_FIRING ) {
line 1311
;1309:			float	f;
;1310:
;1311:			f = (float)cg.predictedPlayerState.weaponTime / 1500;
ADDRLP4 448
ADDRGP4 cg+109684+44
INDIRI4
CVIF4 4
CNSTF4 1153138688
DIVF4
ASGNF4
line 1312
;1312:			gun.shaderRGBA[1] = 0;
ADDRLP4 0+116+1
CNSTU1 0
ASGNU1
line 1313
;1313:			gun.shaderRGBA[0] = 
ADDRLP4 456
CNSTF4 1132396544
CNSTF4 1065353216
ADDRLP4 448
INDIRF4
SUBF4
MULF4
ASGNF4
ADDRLP4 460
CNSTF4 1325400064
ASGNF4
ADDRLP4 456
INDIRF4
ADDRLP4 460
INDIRF4
LTF4 $575
ADDRLP4 452
ADDRLP4 456
INDIRF4
ADDRLP4 460
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $576
JUMPV
LABELV $575
ADDRLP4 452
ADDRLP4 456
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $576
ADDRLP4 464
ADDRLP4 452
INDIRU4
CVUU1 4
ASGNU1
ADDRLP4 0+116+2
ADDRLP4 464
INDIRU1
ASGNU1
ADDRLP4 0+116
ADDRLP4 464
INDIRU1
ASGNU1
line 1315
;1314:			gun.shaderRGBA[2] = 255 * ( 1.0 - f );
;1315:		} else {
ADDRGP4 $562
JUMPV
LABELV $561
line 1316
;1316:			gun.shaderRGBA[0] = 255;
ADDRLP4 0+116
CNSTU1 255
ASGNU1
line 1317
;1317:			gun.shaderRGBA[1] = 255;
ADDRLP4 0+116+1
CNSTU1 255
ASGNU1
line 1318
;1318:			gun.shaderRGBA[2] = 255;
ADDRLP4 0+116+2
CNSTU1 255
ASGNU1
line 1319
;1319:			gun.shaderRGBA[3] = 255;
ADDRLP4 0+116+3
CNSTU1 255
ASGNU1
line 1320
;1320:		}
LABELV $562
line 1321
;1321:	}
LABELV $559
line 1323
;1322:
;1323:	gun.hModel = weapon->weaponModel;
ADDRLP4 0+8
ADDRLP4 280
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1324
;1324:	if (!gun.hModel) {
ADDRLP4 0+8
INDIRI4
CNSTI4 0
NEI4 $585
line 1325
;1325:		return;
ADDRGP4 $555
JUMPV
LABELV $585
line 1328
;1326:	}
;1327:
;1328:	if ( !ps ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $588
line 1330
;1329:		// add weapon ready sound
;1330:		cent->pe.lightningFiring = qfalse;
ADDRFP4 8
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 0
ASGNI4
line 1331
;1331:		if ( ( cent->currentState.eFlags & EF_FIRING ) && weapon->firingSound ) {
ADDRLP4 444
CNSTI4 0
ASGNI4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 256
BANDI4
ADDRLP4 444
INDIRI4
EQI4 $590
ADDRLP4 280
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
ADDRLP4 444
INDIRI4
EQI4 $590
line 1333
;1332:			// lightning gun and guantlet make a different sound when fire is held down
;1333:			trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, weapon->firingSound );
ADDRLP4 448
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 448
INDIRP4
INDIRI4
ARGI4
ADDRLP4 448
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
line 1334
;1334:			cent->pe.lightningFiring = qtrue;
ADDRFP4 8
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 1
ASGNI4
line 1335
;1335:		} else if ( weapon->readySound ) {
ADDRGP4 $591
JUMPV
LABELV $590
ADDRLP4 280
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 0
EQI4 $592
line 1336
;1336:			trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, weapon->readySound );
ADDRLP4 448
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 448
INDIRP4
INDIRI4
ARGI4
ADDRLP4 448
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
line 1337
;1337:		}
LABELV $592
LABELV $591
line 1338
;1338:	}
LABELV $588
line 1340
;1339:
;1340:	CG_PositionEntityOnTag( &gun, parent, parent->hModel, "tag_weapon");
ADDRLP4 0
ARGP4
ADDRLP4 444
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 444
INDIRP4
ARGP4
ADDRLP4 444
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $594
ARGP4
ADDRGP4 CG_PositionEntityOnTag
CALLV
pop
line 1342
;1341:
;1342:	CG_AddWeaponWithPowerups( &gun, cent->currentState.powerups, cent);
ADDRLP4 0
ARGP4
ADDRLP4 448
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 448
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
ADDRLP4 448
INDIRP4
ARGP4
ADDRGP4 CG_AddWeaponWithPowerups
CALLV
pop
line 1345
;1343:
;1344:	// add the spinning barrel
;1345:	if ( weapon->barrelModel ) {
ADDRLP4 280
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $595
line 1346
;1346:		memset( &barrel, 0, sizeof( barrel ) );
ADDRLP4 300
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1347
;1347:		VectorCopy( parent->lightingOrigin, barrel.lightingOrigin );
ADDRLP4 300+12
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 1348
;1348:		barrel.shadowPlane = parent->shadowPlane;
ADDRLP4 300+24
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1349
;1349:		barrel.renderfx = parent->renderfx;
ADDRLP4 300+4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1351
;1350:
;1351:		barrel.hModel = weapon->barrelModel;
ADDRLP4 300+8
ADDRLP4 280
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 1352
;1352:		angles[YAW] = 0;
ADDRLP4 288+4
CNSTF4 0
ASGNF4
line 1353
;1353:		angles[PITCH] = 0;
ADDRLP4 288
CNSTF4 0
ASGNF4
line 1354
;1354:		angles[ROLL] = CG_MachinegunSpinAngle( cent );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 452
ADDRGP4 CG_MachinegunSpinAngle
CALLF4
ASGNF4
ADDRLP4 288+8
ADDRLP4 452
INDIRF4
ASGNF4
line 1355
;1355:		AnglesToAxis( angles, barrel.axis );
ADDRLP4 288
ARGP4
ADDRLP4 300+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1357
;1356:
;1357:		CG_PositionRotatedEntityOnTag( &barrel, &gun, weapon->weaponModel, "tag_barrel" );
ADDRLP4 300
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 $604
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 1359
;1358:
;1359:		CG_AddWeaponWithPowerups( &barrel, cent->currentState.powerups, cent);
ADDRLP4 300
ARGP4
ADDRLP4 456
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 456
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
ADDRLP4 456
INDIRP4
ARGP4
ADDRGP4 CG_AddWeaponWithPowerups
CALLV
pop
line 1360
;1360:	}
LABELV $595
line 1363
;1361:
;1362:	// make sure we aren't looking at cg.predictedPlayerEntity for LG
;1363:	nonPredictedCent = &cg_entities[cent->currentState.clientNum];
ADDRLP4 440
CNSTI4 740
ADDRFP4 8
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 1368
;1364:
;1365:	// if the index of the nonPredictedCent is not the same as the clientNum
;1366:	// then this is a fake player (like on teh single player podiums), so
;1367:	// go ahead and use the cent
;1368:	if( ( nonPredictedCent - cg_entities ) != cent->currentState.clientNum ) {
ADDRLP4 440
INDIRP4
CVPU4 4
ADDRGP4 cg_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 740
DIVI4
ADDRFP4 8
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
EQI4 $605
line 1369
;1369:		nonPredictedCent = cent;
ADDRLP4 440
ADDRFP4 8
INDIRP4
ASGNP4
line 1370
;1370:	}
LABELV $605
line 1373
;1371:
;1372:	// add the flash
;1373:	if ( ( weaponNum == WP_LIGHTNING || weaponNum == WP_GAUNTLET || weaponNum == WP_GRAPPLING_HOOK )
ADDRLP4 284
INDIRI4
CNSTI4 6
EQI4 $610
ADDRLP4 284
INDIRI4
CNSTI4 1
EQI4 $610
ADDRLP4 284
INDIRI4
CNSTI4 10
NEI4 $607
LABELV $610
ADDRLP4 440
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $607
line 1375
;1374:		&& ( nonPredictedCent->currentState.eFlags & EF_FIRING ) ) 
;1375:	{
line 1377
;1376:		// continuous flash
;1377:	} else {
ADDRGP4 $608
JUMPV
LABELV $607
line 1379
;1378:		// impulse flash
;1379:		if ( cg.time - cent->muzzleFlashTime > MUZZLE_FLASH_TIME && !cent->pe.railgunFlash ) {
ADDRLP4 456
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 cg+109652
INDIRI4
ADDRLP4 456
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
SUBI4
CNSTI4 20
LEI4 $611
ADDRLP4 456
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 0
NEI4 $611
line 1380
;1380:			return;
ADDRGP4 $555
JUMPV
LABELV $611
line 1382
;1381:		}
;1382:	}
LABELV $608
line 1384
;1383:
;1384:	memset( &flash, 0, sizeof( flash ) );
ADDRLP4 140
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1385
;1385:	VectorCopy( parent->lightingOrigin, flash.lightingOrigin );
ADDRLP4 140+12
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 1386
;1386:	flash.shadowPlane = parent->shadowPlane;
ADDRLP4 140+24
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1387
;1387:	flash.renderfx = parent->renderfx;
ADDRLP4 140+4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1389
;1388:
;1389:	flash.hModel = weapon->flashModel;
ADDRLP4 140+8
ADDRLP4 280
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
line 1390
;1390:	if (!flash.hModel) {
ADDRLP4 140+8
INDIRI4
CNSTI4 0
NEI4 $618
line 1391
;1391:		return;
ADDRGP4 $555
JUMPV
LABELV $618
line 1393
;1392:	}
;1393:	angles[YAW] = 0;
ADDRLP4 288+4
CNSTF4 0
ASGNF4
line 1394
;1394:	angles[PITCH] = 0;
ADDRLP4 288
CNSTF4 0
ASGNF4
line 1395
;1395:	angles[ROLL] = crandom() * 10;
ADDRLP4 456
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 288+8
CNSTF4 1092616192
CNSTF4 1073741824
ADDRLP4 456
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
ASGNF4
line 1396
;1396:	AnglesToAxis( angles, flash.axis );
ADDRLP4 288
ARGP4
ADDRLP4 140+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1399
;1397:
;1398:	// colorize the railgun blast
;1399:	if ( weaponNum == WP_RAILGUN ) {
ADDRLP4 284
INDIRI4
CNSTI4 3
NEI4 $624
line 1402
;1400:		clientInfo_t	*ci;
;1401:
;1402:		ci = &cgs.clientinfo[ cent->currentState.clientNum ];
ADDRLP4 460
CNSTI4 1740
ADDRFP4 8
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 1403
;1403:		flash.shaderRGBA[0] = 255 * ci->color1[0];
ADDRLP4 468
CNSTF4 1132396544
ADDRLP4 460
INDIRP4
CNSTI4 76
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 472
CNSTF4 1325400064
ASGNF4
ADDRLP4 468
INDIRF4
ADDRLP4 472
INDIRF4
LTF4 $629
ADDRLP4 464
ADDRLP4 468
INDIRF4
ADDRLP4 472
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $630
JUMPV
LABELV $629
ADDRLP4 464
ADDRLP4 468
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $630
ADDRLP4 140+116
ADDRLP4 464
INDIRU4
CVUU1 4
ASGNU1
line 1404
;1404:		flash.shaderRGBA[1] = 255 * ci->color1[1];
ADDRLP4 480
CNSTF4 1132396544
ADDRLP4 460
INDIRP4
CNSTI4 80
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 484
CNSTF4 1325400064
ASGNF4
ADDRLP4 480
INDIRF4
ADDRLP4 484
INDIRF4
LTF4 $634
ADDRLP4 476
ADDRLP4 480
INDIRF4
ADDRLP4 484
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $635
JUMPV
LABELV $634
ADDRLP4 476
ADDRLP4 480
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $635
ADDRLP4 140+116+1
ADDRLP4 476
INDIRU4
CVUU1 4
ASGNU1
line 1405
;1405:		flash.shaderRGBA[2] = 255 * ci->color1[2];
ADDRLP4 492
CNSTF4 1132396544
ADDRLP4 460
INDIRP4
CNSTI4 84
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 496
CNSTF4 1325400064
ASGNF4
ADDRLP4 492
INDIRF4
ADDRLP4 496
INDIRF4
LTF4 $639
ADDRLP4 488
ADDRLP4 492
INDIRF4
ADDRLP4 496
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $640
JUMPV
LABELV $639
ADDRLP4 488
ADDRLP4 492
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $640
ADDRLP4 140+116+2
ADDRLP4 488
INDIRU4
CVUU1 4
ASGNU1
line 1406
;1406:	}
LABELV $624
line 1408
;1407:
;1408:	CG_PositionRotatedEntityOnTag( &flash, &gun, weapon->weaponModel, "tag_flash");
ADDRLP4 140
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 $641
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 1409
;1409:	trap_R_AddRefEntityToScene( &flash );
ADDRLP4 140
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1411
;1410:
;1411:	if ( ps || cg.renderingThirdPerson ||
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $648
ADDRGP4 cg+109676
INDIRI4
CNSTI4 0
NEI4 $648
ADDRFP4 8
INDIRP4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
EQI4 $642
LABELV $648
line 1412
;1412:		cent->currentState.number != cg.predictedPlayerState.clientNum ) {
line 1417
;1413:		// add lightning bolt
;1414:		//CG_LightningBolt( nonPredictedCent, flash.origin );  // Shafe - Trep - Lightning Bug 
;1415:
;1416:		// add rail trail
;1417:		CG_SpawnRailTrail( cent, flash.origin );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 140+68
ARGP4
ADDRGP4 CG_SpawnRailTrail
CALLV
pop
line 1419
;1418:
;1419:		if ( weapon->flashDlightColor[0] || weapon->flashDlightColor[1] || weapon->flashDlightColor[2] ) {
ADDRLP4 464
CNSTF4 0
ASGNF4
ADDRLP4 280
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 464
INDIRF4
NEF4 $653
ADDRLP4 280
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
ADDRLP4 464
INDIRF4
NEF4 $653
ADDRLP4 280
INDIRP4
CNSTI4 48
ADDP4
INDIRF4
ADDRLP4 464
INDIRF4
EQF4 $650
LABELV $653
line 1420
;1420:			trap_R_AddLightToScene( flash.origin, 300 + (rand()&31), weapon->flashDlightColor[0],
ADDRLP4 468
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 140+68
ARGP4
ADDRLP4 468
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 300
ADDI4
CVIF4 4
ARGF4
ADDRLP4 280
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 280
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
ARGF4
ADDRLP4 280
INDIRP4
CNSTI4 48
ADDP4
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 1422
;1421:				weapon->flashDlightColor[1], weapon->flashDlightColor[2] );
;1422:		}
LABELV $650
line 1423
;1423:	}
LABELV $642
line 1424
;1424:}
LABELV $555
endproc CG_AddPlayerWeapon 500 20
export CG_AddViewWeapon
proc CG_AddViewWeapon 176 16
line 1433
;1425:
;1426:/*
;1427:==============
;1428:CG_AddViewWeapon
;1429:
;1430:Add the weapon, and flash for the player's view
;1431:==============
;1432:*/
;1433:void CG_AddViewWeapon( playerState_t *ps ) {
line 1441
;1434:	refEntity_t	hand;
;1435:	centity_t	*cent;
;1436:	clientInfo_t	*ci;
;1437:	float		fovOffset;
;1438:	vec3_t		angles;
;1439:	weaponInfo_t	*weapon;
;1440:
;1441:	if ( ps->persistant[PERS_TEAM] == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 3
NEI4 $656
line 1442
;1442:		return;
ADDRGP4 $655
JUMPV
LABELV $656
line 1445
;1443:	}
;1444:
;1445:	if ( ps->pm_type == PM_INTERMISSION ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5
NEI4 $658
line 1446
;1446:		return;
ADDRGP4 $655
JUMPV
LABELV $658
line 1451
;1447:	}
;1448:
;1449:	// no gun if in third person view or a camera is active
;1450:	//if ( cg.renderingThirdPerson || cg.cameraMode) {
;1451:	if ( cg.renderingThirdPerson ) {
ADDRGP4 cg+109676
INDIRI4
CNSTI4 0
EQI4 $660
line 1452
;1452:		return;
ADDRGP4 $655
JUMPV
LABELV $660
line 1457
;1453:	}
;1454:
;1455:
;1456:	// allow the gun to be completely removed
;1457:	if ( !cg_drawGun.integer ) {
ADDRGP4 cg_drawGun+12
INDIRI4
CNSTI4 0
NEI4 $663
line 1460
;1458:	//	vec3_t		origin;
;1459:
;1460:		if ( cg.predictedPlayerState.eFlags & EF_FIRING ) {
ADDRGP4 cg+109684+104
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $655
line 1466
;1461:			// special hack for lightning gun...
;1462:			// Shafe - Trep - We dont have a ligning gun anymore so the next 3 lines aren't needed
;1463:			//VectorCopy( cg.refdef.vieworg, origin );
;1464:			//VectorMA( origin, -8, cg.refdef.viewaxis[2], origin );
;1465:			//CG_LightningBolt( &cg_entities[ps->clientNum], origin );
;1466:		}
line 1467
;1467:		return;
ADDRGP4 $655
JUMPV
LABELV $663
line 1471
;1468:	}
;1469:
;1470:	// don't draw if testing a gun model
;1471:	if ( cg.testGun ) {
ADDRGP4 cg+127056
INDIRI4
CNSTI4 0
EQI4 $670
line 1472
;1472:		return;
ADDRGP4 $655
JUMPV
LABELV $670
line 1476
;1473:	}
;1474:
;1475:	// drop gun lower at higher fov
;1476:	if ( cg_fov.integer > 90 ) {
ADDRGP4 cg_fov+12
INDIRI4
CNSTI4 90
LEI4 $673
line 1477
;1477:		fovOffset = -0.2 * ( cg_fov.integer - 90 );
ADDRLP4 140
CNSTF4 3192704205
ADDRGP4 cg_fov+12
INDIRI4
CNSTI4 90
SUBI4
CVIF4 4
MULF4
ASGNF4
line 1478
;1478:	} else {
ADDRGP4 $674
JUMPV
LABELV $673
line 1479
;1479:		fovOffset = 0;
ADDRLP4 140
CNSTF4 0
ASGNF4
line 1480
;1480:	}
LABELV $674
line 1482
;1481:
;1482:	cent = &cg.predictedPlayerEntity;	// &cg_entities[cg.snap->ps.clientNum];
ADDRLP4 144
ADDRGP4 cg+110152
ASGNP4
line 1483
;1483:	CG_RegisterWeapon( ps->weapon );
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_RegisterWeapon
CALLV
pop
line 1484
;1484:	weapon = &cg_weapons[ ps->weapon ];
ADDRLP4 160
CNSTI4 136
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons
ADDP4
ASGNP4
line 1486
;1485:
;1486:	memset (&hand, 0, sizeof(hand));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1489
;1487:
;1488:	// set up gun position
;1489:	CG_CalculateWeaponPosition( hand.origin, angles );
ADDRLP4 0+68
ARGP4
ADDRLP4 148
ARGP4
ADDRGP4 CG_CalculateWeaponPosition
CALLV
pop
line 1491
;1490:
;1491:	VectorMA( hand.origin, cg_gun_x.value, cg.refdef.viewaxis[0], hand.origin );
ADDRLP4 0+68
ADDRLP4 0+68
INDIRF4
ADDRGP4 cg+111104+36
INDIRF4
ADDRGP4 cg_gun_x+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+4
ADDRLP4 0+68+4
INDIRF4
ADDRGP4 cg+111104+36+4
INDIRF4
ADDRGP4 cg_gun_x+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
ADDRGP4 cg+111104+36+8
INDIRF4
ADDRGP4 cg_gun_x+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1492
;1492:	VectorMA( hand.origin, cg_gun_y.value, cg.refdef.viewaxis[1], hand.origin );
ADDRLP4 0+68
ADDRLP4 0+68
INDIRF4
ADDRGP4 cg+111104+36+12
INDIRF4
ADDRGP4 cg_gun_y+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+4
ADDRLP4 0+68+4
INDIRF4
ADDRGP4 cg+111104+36+12+4
INDIRF4
ADDRGP4 cg_gun_y+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
ADDRGP4 cg+111104+36+12+8
INDIRF4
ADDRGP4 cg_gun_y+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1493
;1493:	VectorMA( hand.origin, (cg_gun_z.value+fovOffset), cg.refdef.viewaxis[2], hand.origin );
ADDRLP4 0+68
ADDRLP4 0+68
INDIRF4
ADDRGP4 cg+111104+36+24
INDIRF4
ADDRGP4 cg_gun_z+8
INDIRF4
ADDRLP4 140
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+4
ADDRLP4 0+68+4
INDIRF4
ADDRGP4 cg+111104+36+24+4
INDIRF4
ADDRGP4 cg_gun_z+8
INDIRF4
ADDRLP4 140
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
ADDRGP4 cg+111104+36+24+8
INDIRF4
ADDRGP4 cg_gun_z+8
INDIRF4
ADDRLP4 140
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 1495
;1494:
;1495:	AnglesToAxis( angles, hand.axis );
ADDRLP4 148
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1498
;1496:
;1497:	// map torso animations to weapon animations
;1498:	if ( cg_gun_frame.integer ) {
ADDRGP4 cg_gun_frame+12
INDIRI4
CNSTI4 0
EQI4 $749
line 1500
;1499:		// development tool
;1500:		hand.frame = hand.oldframe = cg_gun_frame.integer;
ADDRLP4 168
ADDRGP4 cg_gun_frame+12
INDIRI4
ASGNI4
ADDRLP4 0+96
ADDRLP4 168
INDIRI4
ASGNI4
ADDRLP4 0+80
ADDRLP4 168
INDIRI4
ASGNI4
line 1501
;1501:		hand.backlerp = 0;
ADDRLP4 0+100
CNSTF4 0
ASGNF4
line 1502
;1502:	} else {
ADDRGP4 $750
JUMPV
LABELV $749
line 1504
;1503:		// get clientinfo for animation map
;1504:		ci = &cgs.clientinfo[ cent->currentState.clientNum ];
ADDRLP4 164
CNSTI4 1740
ADDRLP4 144
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 1505
;1505:		hand.frame = CG_MapTorsoToWeaponFrame( ci, cent->pe.torso.frame );
ADDRLP4 164
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
ARGI4
ADDRLP4 168
ADDRGP4 CG_MapTorsoToWeaponFrame
CALLI4
ASGNI4
ADDRLP4 0+80
ADDRLP4 168
INDIRI4
ASGNI4
line 1506
;1506:		hand.oldframe = CG_MapTorsoToWeaponFrame( ci, cent->pe.torso.oldFrame );
ADDRLP4 164
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
ARGI4
ADDRLP4 172
ADDRGP4 CG_MapTorsoToWeaponFrame
CALLI4
ASGNI4
ADDRLP4 0+96
ADDRLP4 172
INDIRI4
ASGNI4
line 1507
;1507:		hand.backlerp = cent->pe.torso.backlerp;
ADDRLP4 0+100
ADDRLP4 144
INDIRP4
CNSTI4 524
ADDP4
INDIRF4
ASGNF4
line 1508
;1508:	}
LABELV $750
line 1510
;1509:
;1510:	hand.hModel = weapon->handsModel;
ADDRLP4 0+8
ADDRLP4 160
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1511
;1511:	hand.renderfx = RF_DEPTHHACK | RF_FIRST_PERSON | RF_MINLIGHT;
ADDRLP4 0+4
CNSTI4 13
ASGNI4
line 1514
;1512:
;1513:	// add everything onto the hand
;1514:	CG_AddPlayerWeapon( &hand, ps, &cg.predictedPlayerEntity, ps->persistant[PERS_TEAM] );
ADDRLP4 0
ARGP4
ADDRLP4 168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 168
INDIRP4
ARGP4
ADDRGP4 cg+110152
ARGP4
ADDRLP4 168
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_AddPlayerWeapon
CALLV
pop
line 1515
;1515:}
LABELV $655
endproc CG_AddViewWeapon 176 16
export CG_DrawWeaponSelect
proc CG_DrawWeaponSelect 48 20
line 1530
;1516:
;1517:/*
;1518:==============================================================================
;1519:
;1520:WEAPON SELECTION
;1521:
;1522:==============================================================================
;1523:*/
;1524:
;1525:/*
;1526:===================
;1527:CG_DrawWeaponSelect
;1528:===================
;1529:*/
;1530:void CG_DrawWeaponSelect( void ) {
line 1539
;1531:	int		i;
;1532:	int		bits;
;1533:	int		count;
;1534:	int		x, y, w;
;1535:	char	*name;
;1536:	float	*color;
;1537:
;1538:	// don't display if dead
;1539:	if ( cg.predictedPlayerState.stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 cg+109684+184
INDIRI4
CNSTI4 0
GTI4 $764
line 1540
;1540:		return;
ADDRGP4 $763
JUMPV
LABELV $764
line 1543
;1541:	}
;1542:
;1543:	color = CG_FadeColor( cg.weaponSelectTime, WEAPON_SELECT_TIME );
ADDRGP4 cg+126744
INDIRI4
ARGI4
CNSTI4 1400
ARGI4
ADDRLP4 32
ADDRGP4 CG_FadeColor
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 32
INDIRP4
ASGNP4
line 1544
;1544:	if ( !color ) {
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $769
line 1545
;1545:		return;
ADDRGP4 $763
JUMPV
LABELV $769
line 1547
;1546:	}
;1547:	trap_R_SetColor( color );
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1550
;1548:
;1549:	// showing weapon select clears pickup item display, but not the blend blob
;1550:	cg.itemPickupTime = 0;
ADDRGP4 cg+126736
CNSTI4 0
ASGNI4
line 1553
;1551:
;1552:	// count the number of weapons owned
;1553:	bits = cg.snap->ps.stats[ STAT_WEAPONS ];
ADDRLP4 12
ADDRGP4 cg+36
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ASGNI4
line 1554
;1554:	count = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1555
;1555:	for ( i = 1 ; i < 16 ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $773
line 1556
;1556:		if ( bits & ( 1 << i ) ) {
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $777
line 1557
;1557:			count++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1558
;1558:		}
LABELV $777
line 1559
;1559:	}
LABELV $774
line 1555
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $773
line 1561
;1560:
;1561:	x = 320 - count * 20;
ADDRLP4 4
CNSTI4 320
CNSTI4 20
ADDRLP4 16
INDIRI4
MULI4
SUBI4
ASGNI4
line 1562
;1562:	y = 380;
ADDRLP4 8
CNSTI4 380
ASGNI4
line 1564
;1563:
;1564:	for ( i = 1 ; i < 16 ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $779
line 1565
;1565:		if ( !( bits & ( 1 << i ) ) ) {
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $783
line 1566
;1566:			continue;
ADDRGP4 $780
JUMPV
LABELV $783
line 1569
;1567:		}
;1568:
;1569:		CG_RegisterWeapon( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterWeapon
CALLV
pop
line 1572
;1570:
;1571:		// draw weapon icon
;1572:		CG_DrawPic( x, y, 32, 32, cg_weapons[i].weaponIcon );
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 36
CNSTF4 1107296256
ASGNF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
CNSTI4 136
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg_weapons+68
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1575
;1573:
;1574:		// draw selection marker
;1575:		if ( i == cg.weaponSelect ) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+111004
INDIRI4
NEI4 $786
line 1576
;1576:			CG_DrawPic( x-4, y-4, 40, 40, cgs.media.selectShader );
ADDRLP4 40
CNSTI4 4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 40
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
ADDRLP4 40
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 44
CNSTF4 1109393408
ASGNF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRGP4 cgs+154388+224
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1577
;1577:		}
LABELV $786
line 1580
;1578:
;1579:		// no ammo cross on top
;1580:		if ( !cg.snap->ps.ammo[ i ] ) {
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
CNSTI4 0
NEI4 $791
line 1581
;1581:			CG_DrawPic( x, y, 32, 32, cgs.media.noammoShader );
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 40
CNSTF4 1107296256
ASGNF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRGP4 cgs+154388+284
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1582
;1582:		}
LABELV $791
line 1584
;1583:
;1584:		x += 40;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 40
ADDI4
ASGNI4
line 1585
;1585:	}
LABELV $780
line 1564
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $779
line 1588
;1586:
;1587:	// draw the selected name
;1588:	if ( cg_weapons[ cg.weaponSelect ].item ) {
CNSTI4 136
ADDRGP4 cg+111004
INDIRI4
MULI4
ADDRGP4 cg_weapons+4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $796
line 1589
;1589:		name = cg_weapons[ cg.weaponSelect ].item->pickup_name;
ADDRLP4 24
CNSTI4 136
ADDRGP4 cg+111004
INDIRI4
MULI4
ADDRGP4 cg_weapons+4
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRP4
ASGNP4
line 1590
;1590:		if ( name ) {
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $802
line 1591
;1591:			w = CG_DrawStrlen( name ) * BIGCHAR_WIDTH;
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 36
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 1592
;1592:			x = ( SCREEN_WIDTH - w ) / 2;
ADDRLP4 4
CNSTI4 640
ADDRLP4 28
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 1593
;1593:			CG_DrawBigStringColor(x, y - 22, name, color);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
CNSTI4 22
SUBI4
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 CG_DrawBigStringColor
CALLV
pop
line 1594
;1594:		}
LABELV $802
line 1595
;1595:	}
LABELV $796
line 1598
;1596:
;1597:	// Reset The Zoom 
;1598:	CG_ResetZoom();
ADDRGP4 CG_ResetZoom
CALLV
pop
line 1599
;1599:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1600
;1600:}
LABELV $763
endproc CG_DrawWeaponSelect 48 20
proc CG_WeaponSelectable 0 0
line 1608
;1601:
;1602:
;1603:/*
;1604:===============
;1605:CG_WeaponSelectable
;1606:===============
;1607:*/
;1608:static qboolean CG_WeaponSelectable( int i ) {
line 1609
;1609:	if ( !cg.snap->ps.ammo[i] ) {
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 420
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $805
line 1610
;1610:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $804
JUMPV
LABELV $805
line 1612
;1611:	}
;1612:	if ( ! (cg.snap->ps.stats[ STAT_WEAPONS ] & ( 1 << i ) ) ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $808
line 1613
;1613:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $804
JUMPV
LABELV $808
line 1616
;1614:	}
;1615:
;1616:	return qtrue;
CNSTI4 1
RETI4
LABELV $804
endproc CG_WeaponSelectable 0 0
export CG_NextWeapon_f
proc CG_NextWeapon_f 16 4
line 1624
;1617:}
;1618:
;1619:/*
;1620:===============
;1621:CG_NextWeapon_f
;1622:===============
;1623:*/
;1624:void CG_NextWeapon_f( void ) {
line 1628
;1625:	int		i;
;1626:	int		original;
;1627:
;1628:	if ( !cg.snap ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $812
line 1629
;1629:		return;
ADDRGP4 $811
JUMPV
LABELV $812
line 1631
;1630:	}
;1631:	if ( cg.snap->ps.pm_flags & PMF_FOLLOW ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $815
line 1632
;1632:		return;
ADDRGP4 $811
JUMPV
LABELV $815
line 1635
;1633:	}
;1634:
;1635:   	CG_ResetZoom();
ADDRGP4 CG_ResetZoom
CALLV
pop
line 1637
;1636:
;1637:	cg.weaponSelectTime = cg.time;
ADDRGP4 cg+126744
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1638
;1638:	original = cg.weaponSelect;
ADDRLP4 4
ADDRGP4 cg+111004
INDIRI4
ASGNI4
line 1641
;1639:
;1640:
;1641:	for ( i = 0 ; i < 16 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $821
line 1642
;1642:		cg.weaponSelect++;
ADDRLP4 8
ADDRGP4 cg+111004
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1643
;1643:		if ( cg.weaponSelect == 16 ) {
ADDRGP4 cg+111004
INDIRI4
CNSTI4 16
NEI4 $826
line 1644
;1644:			cg.weaponSelect = 0;
ADDRGP4 cg+111004
CNSTI4 0
ASGNI4
line 1645
;1645:		}
LABELV $826
line 1650
;1646:		/* - You can now scroll wheel to the gauntlet
;1647:		if ( cg.weaponSelect == WP_GAUNTLET ) {
;1648:			continue;		// never cycle to gauntlet
;1649:		}*/ 
;1650:		if ( CG_WeaponSelectable( cg.weaponSelect ) ) {
ADDRGP4 cg+111004
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 CG_WeaponSelectable
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $830
line 1651
;1651:			break;
ADDRGP4 $823
JUMPV
LABELV $830
line 1653
;1652:		}
;1653:	}
LABELV $822
line 1641
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $821
LABELV $823
line 1654
;1654:	if ( i == 16 ) {
ADDRLP4 0
INDIRI4
CNSTI4 16
NEI4 $833
line 1655
;1655:		cg.weaponSelect = original;
ADDRGP4 cg+111004
ADDRLP4 4
INDIRI4
ASGNI4
line 1656
;1656:	}
LABELV $833
line 1657
;1657:}
LABELV $811
endproc CG_NextWeapon_f 16 4
export CG_PrevWeapon_f
proc CG_PrevWeapon_f 16 4
line 1664
;1658:
;1659:/*
;1660:===============
;1661:CG_PrevWeapon_f
;1662:===============
;1663:*/
;1664:void CG_PrevWeapon_f( void ) {
line 1668
;1665:	int		i;
;1666:	int		original;
;1667:
;1668:	if ( !cg.snap ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $837
line 1669
;1669:		return;
ADDRGP4 $836
JUMPV
LABELV $837
line 1671
;1670:	}
;1671:	if ( cg.snap->ps.pm_flags & PMF_FOLLOW ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $840
line 1672
;1672:		return;
ADDRGP4 $836
JUMPV
LABELV $840
line 1675
;1673:	}
;1674:
;1675:	CG_ResetZoom();
ADDRGP4 CG_ResetZoom
CALLV
pop
line 1677
;1676:
;1677:	cg.weaponSelectTime = cg.time;
ADDRGP4 cg+126744
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1678
;1678:	original = cg.weaponSelect;
ADDRLP4 4
ADDRGP4 cg+111004
INDIRI4
ASGNI4
line 1680
;1679:
;1680:	for ( i = 0 ; i < 16 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $846
line 1681
;1681:		cg.weaponSelect--;
ADDRLP4 8
ADDRGP4 cg+111004
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1682
;1682:		if ( cg.weaponSelect == -1 ) {
ADDRGP4 cg+111004
INDIRI4
CNSTI4 -1
NEI4 $851
line 1683
;1683:			cg.weaponSelect = 15;
ADDRGP4 cg+111004
CNSTI4 15
ASGNI4
line 1684
;1684:		}
LABELV $851
line 1691
;1685:		
;1686:		/*
;1687:		if ( cg.weaponSelect == WP_GAUNTLET ) {
;1688:			continue;		// never cycle to gauntlet
;1689:		}
;1690:		*/
;1691:		if ( CG_WeaponSelectable( cg.weaponSelect ) ) {
ADDRGP4 cg+111004
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 CG_WeaponSelectable
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $855
line 1692
;1692:			break;
ADDRGP4 $848
JUMPV
LABELV $855
line 1694
;1693:		}
;1694:	}
LABELV $847
line 1680
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $846
LABELV $848
line 1695
;1695:	if ( i == 16 ) {
ADDRLP4 0
INDIRI4
CNSTI4 16
NEI4 $858
line 1696
;1696:		cg.weaponSelect = original;
ADDRGP4 cg+111004
ADDRLP4 4
INDIRI4
ASGNI4
line 1697
;1697:	}
LABELV $858
line 1698
;1698:}
LABELV $836
endproc CG_PrevWeapon_f 16 4
export CG_Weapon_f
proc CG_Weapon_f 16 4
line 1705
;1699:
;1700:/*
;1701:===============
;1702:CG_Weapon_f
;1703:===============
;1704:*/
;1705:void CG_Weapon_f( void ) {
line 1708
;1706:	int		num;
;1707:
;1708:	if ( !cg.snap ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $862
line 1709
;1709:		return;
ADDRGP4 $861
JUMPV
LABELV $862
line 1711
;1710:	}
;1711:	if ( cg.snap->ps.pm_flags & PMF_FOLLOW ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $865
line 1712
;1712:		return;
ADDRGP4 $861
JUMPV
LABELV $865
line 1715
;1713:	}
;1714:
;1715:	num = atoi( CG_Argv( 1 ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1717
;1716:
;1717:	if ( num < 1 || num > 15 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $870
ADDRLP4 0
INDIRI4
CNSTI4 15
LEI4 $868
LABELV $870
line 1718
;1718:		return;
ADDRGP4 $861
JUMPV
LABELV $868
line 1721
;1719:	}
;1720:
;1721:	cg.weaponSelectTime = cg.time;
ADDRGP4 cg+126744
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1723
;1722:
;1723:	if ( ! ( cg.snap->ps.stats[STAT_WEAPONS] & ( 1 << num ) ) ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $873
line 1724
;1724:		return;		// don't have the weapon
ADDRGP4 $861
JUMPV
LABELV $873
line 1727
;1725:	}
;1726:
;1727:	cg.weaponSelect = num;
ADDRGP4 cg+111004
ADDRLP4 0
INDIRI4
ASGNI4
line 1728
;1728:}
LABELV $861
endproc CG_Weapon_f 16 4
export CG_OutOfAmmoChange
proc CG_OutOfAmmoChange 8 4
line 1737
;1729:
;1730:/*
;1731:===================
;1732:CG_OutOfAmmoChange
;1733:
;1734:The current weapon has just run out of ammo
;1735:===================
;1736:*/
;1737:void CG_OutOfAmmoChange( void ) {
line 1740
;1738:	int		i;
;1739:
;1740:	cg.weaponSelectTime = cg.time;
ADDRGP4 cg+126744
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1742
;1741:
;1742:	for ( i = 15 ; i > 0 ; i-- ) {
ADDRLP4 0
CNSTI4 15
ASGNI4
LABELV $880
line 1743
;1743:		if ( CG_WeaponSelectable( i ) ) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 CG_WeaponSelectable
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $884
line 1744
;1744:			cg.weaponSelect = i;
ADDRGP4 cg+111004
ADDRLP4 0
INDIRI4
ASGNI4
line 1745
;1745:			break;
ADDRGP4 $882
JUMPV
LABELV $884
line 1747
;1746:		}
;1747:	}
LABELV $881
line 1742
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $880
LABELV $882
line 1748
;1748:}
LABELV $877
endproc CG_OutOfAmmoChange 8 4
export CG_FireWeapon
proc CG_FireWeapon 20 16
line 1767
;1749:
;1750:
;1751:
;1752:/*
;1753:===================================================================================================
;1754:
;1755:WEAPON EVENTS
;1756:
;1757:===================================================================================================
;1758:*/
;1759:
;1760:/*
;1761:================
;1762:CG_FireWeapon
;1763:
;1764:Caused by an EV_FIRE_WEAPON event
;1765:================
;1766:*/
;1767:void CG_FireWeapon( centity_t *cent ) {
line 1772
;1768:	entityState_t *ent;
;1769:	int				c;
;1770:	weaponInfo_t	*weap;
;1771:
;1772:	ent = &cent->currentState;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
line 1773
;1773:	if ( ent->weapon == WP_NONE ) {
ADDRLP4 8
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 0
NEI4 $888
line 1774
;1774:		return;
ADDRGP4 $887
JUMPV
LABELV $888
line 1776
;1775:	}
;1776:	if ( ent->weapon >= WP_NUM_WEAPONS ) {
ADDRLP4 8
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 12
LTI4 $890
line 1777
;1777:		CG_Error( "CG_FireWeapon: ent->weapon >= WP_NUM_WEAPONS" );
ADDRGP4 $892
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 1778
;1778:		return;
ADDRGP4 $887
JUMPV
LABELV $890
line 1780
;1779:	}
;1780:	weap = &cg_weapons[ ent->weapon ];
ADDRLP4 4
CNSTI4 136
ADDRLP4 8
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons
ADDP4
ASGNP4
line 1784
;1781:
;1782:	// mark the entity as muzzle flashing, so when it is added it will
;1783:	// append the flash to the weapon model
;1784:	cent->muzzleFlashTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1798
;1785:
;1786:	// lightning gun only does this this on initial press
;1787:	// Shafe - We Replaced The Lightning Gun with the flame thrower so this is useless
;1788:	/*
;1789:	if ( ent->weapon == WP_LIGHTNING ) {
;1790:		if ( cent->pe.lightningFiring ) {
;1791:			return;
;1792:		}
;1793:	}
;1794:	*/
;1795:
;1796:
;1797:	// play quad sound if needed
;1798:	if ( cent->currentState.powerups & ( 1 << PW_QUAD ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $894
line 1799
;1799:		trap_S_StartSound (NULL, cent->currentState.number, CHAN_ITEM, cgs.media.quadSound );
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+154388+600
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1800
;1800:	}
LABELV $894
line 1803
;1801:
;1802:	// play a sound
;1803:	for ( c = 0 ; c < 4 ; c++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $898
line 1804
;1804:		if ( !weap->flashSound[c] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $902
line 1805
;1805:			break;
ADDRGP4 $900
JUMPV
LABELV $902
line 1807
;1806:		}
;1807:	}
LABELV $899
line 1803
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $898
LABELV $900
line 1808
;1808:	if ( c > 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $904
line 1809
;1809:		c = rand() % c;
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRI4
MODI4
ASGNI4
line 1810
;1810:		if ( weap->flashSound[c] )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $906
line 1811
;1811:		{
line 1812
;1812:			trap_S_StartSound( NULL, ent->number, CHAN_WEAPON, weap->flashSound[c] );
CNSTP4 0
ARGP4
ADDRLP4 8
INDIRP4
INDIRI4
ARGI4
ADDRLP4 16
CNSTI4 2
ASGNI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1813
;1813:		}
LABELV $906
line 1814
;1814:	}
LABELV $904
line 1817
;1815:
;1816:	// do brass ejection
;1817:	if ( weap->ejectBrassFunc && cg_brassTime.integer > 0 ) {
ADDRLP4 4
INDIRP4
CNSTI4 112
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $908
ADDRGP4 cg_brassTime+12
INDIRI4
CNSTI4 0
LEI4 $908
line 1818
;1818:		weap->ejectBrassFunc( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 112
ADDP4
INDIRP4
CALLV
pop
line 1819
;1819:	}
LABELV $908
line 1822
;1820:
;1821://unlagged - attack prediction #1
;1822:	CG_PredictWeaponEffects( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PredictWeaponEffects
CALLV
pop
line 1824
;1823://unlagged - attack prediction #1
;1824:}
LABELV $887
endproc CG_FireWeapon 20 16
export CG_FireWeapon2
proc CG_FireWeapon2 20 16
line 1834
;1825:
;1826:
;1827:/* 
;1828:================ 
;1829:CG_FireWeapon2 
;1830:Shafe - Trep - Alt Fire
;1831:Caused by an EV_FIRE_WEAPON2 event 
;1832:================ 
;1833:*/ 
;1834:void CG_FireWeapon2( centity_t *cent ) { 
line 1839
;1835: entityState_t *ent; 
;1836: int    c; 
;1837: weaponInfo_t *weap; 
;1838:
;1839: ent = &cent->currentState; 
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
line 1840
;1840: if ( ent->weapon == WP_NONE ) { 
ADDRLP4 8
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 0
NEI4 $912
line 1841
;1841:  return; 
ADDRGP4 $911
JUMPV
LABELV $912
line 1843
;1842: } 
;1843: if ( ent->weapon >= WP_NUM_WEAPONS ) { 
ADDRLP4 8
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 12
LTI4 $914
line 1844
;1844:  CG_Error( "CG_FireWeapon: ent->weapon >= WP_NUM_WEAPONS" ); 
ADDRGP4 $892
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 1845
;1845:  return; 
ADDRGP4 $911
JUMPV
LABELV $914
line 1847
;1846: } 
;1847: weap = &cg_weapons[ ent->weapon ]; 
ADDRLP4 4
CNSTI4 136
ADDRLP4 8
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons
ADDP4
ASGNP4
line 1851
;1848:
;1849: // mark the entity as muzzle flashing, so when it is added it will 
;1850: // append the flash to the weapon model 
;1851: cent->muzzleFlashTime = cg.time; 
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1859
;1852:
;1853:
;1854: // Shafe - We Replaced The Lightning Gun with the flame thrower so this is useless
;1855: // lightning gun only does this this on initial press 
;1856:
;1857: // Bringing this back for alt fire on plasma
;1858:	
;1859:	if ( ent->weapon == WP_PLASMAGUN ) { 
ADDRLP4 8
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 7
NEI4 $917
line 1860
;1860:		if ( cent->pe.lightningFiring ) { 
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
CNSTI4 0
EQI4 $919
line 1861
;1861:			return; 
ADDRGP4 $911
JUMPV
LABELV $919
line 1863
;1862:		} 
;1863:	} 
LABELV $917
line 1869
;1864:	
;1865:
;1866:
;1867:
;1868: // play quad sound if needed 
;1869: if ( cent->currentState.powerups & ( 1 << PW_QUAD ) ) { 
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $921
line 1870
;1870:  trap_S_StartSound (NULL, cent->currentState.number, CHAN_ITEM, cgs.media.quadSound ); 
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+154388+600
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1871
;1871: } 
LABELV $921
line 1874
;1872:
;1873: // play a sound 
;1874: for ( c = 0 ; c < 4 ; c++ ) { 
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $925
line 1875
;1875:  if ( !weap->flashSound[c] ) { 
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $929
line 1876
;1876:   break; 
ADDRGP4 $927
JUMPV
LABELV $929
line 1878
;1877:  } 
;1878: } 
LABELV $926
line 1874
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $925
LABELV $927
line 1879
;1879: if ( c > 0 ) { 
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $931
line 1880
;1880:  c = rand() % c; 
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRI4
MODI4
ASGNI4
line 1881
;1881:  if ( weap->flashSound[c] ) 
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $933
line 1882
;1882:  { 
line 1883
;1883:   trap_S_StartSound( NULL, ent->number, CHAN_WEAPON, weap->flashSound[c] ); 
CNSTP4 0
ARGP4
ADDRLP4 8
INDIRP4
INDIRI4
ARGI4
ADDRLP4 16
CNSTI4 2
ASGNI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1884
;1884:  } 
LABELV $933
line 1885
;1885: } 
LABELV $931
line 1888
;1886:
;1887: // do brass ejection 
;1888: if ( weap->ejectBrassFunc && cg_brassTime.integer > 0 ) { 
ADDRLP4 4
INDIRP4
CNSTI4 112
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $935
ADDRGP4 cg_brassTime+12
INDIRI4
CNSTI4 0
LEI4 $935
line 1889
;1889:  weap->ejectBrassFunc( cent ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 112
ADDP4
INDIRP4
CALLV
pop
line 1890
;1890: } 
LABELV $935
line 1893
;1891:
;1892: //unlagged - attack prediction #1
;1893:	CG_PredictWeaponEffects( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PredictWeaponEffects
CALLV
pop
line 1895
;1894://unlagged - attack prediction #1
;1895:}
LABELV $911
endproc CG_FireWeapon2 20 16
export CG_MissileHitWall
proc CG_MissileHitWall 120 44
line 1905
;1896:
;1897:
;1898:/*
;1899:=================
;1900:CG_MissileHitWall
;1901:
;1902:Caused by an EV_MISSILE_MISS event, or directly by local bullet tracing
;1903:=================
;1904:*/
;1905:void CG_MissileHitWall( centity_t *cent, int weapon, int clientNum, vec3_t origin, vec3_t dir, impactSound_t soundType ) {
line 1921
;1906:	qhandle_t		mod;
;1907:	qhandle_t		mark;
;1908:	qhandle_t		shader;
;1909:	sfxHandle_t		sfx;
;1910:	float			radius;
;1911:	float			light;
;1912:	vec3_t			lightColor;
;1913:	localEntity_t	*le;
;1914:	int				r;
;1915:	qboolean		alphaFade;
;1916:	qboolean		isSprite;
;1917:	int				duration;
;1918:	vec3_t			sprOrg;
;1919:	vec3_t			sprVel;
;1920:
;1921:	mark = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1922
;1922:	radius = 32;
ADDRLP4 24
CNSTF4 1107296256
ASGNF4
line 1923
;1923:	sfx = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1924
;1924:	mod = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 1925
;1925:	shader = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 1926
;1926:	light = 0;
ADDRLP4 40
CNSTF4 0
ASGNF4
line 1927
;1927:	lightColor[0] = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 1928
;1928:	lightColor[1] = 1;
ADDRLP4 0+4
CNSTF4 1065353216
ASGNF4
line 1929
;1929:	lightColor[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1932
;1930:
;1931:	// set defaults
;1932:	isSprite = qfalse;
ADDRLP4 36
CNSTI4 0
ASGNI4
line 1933
;1933:	duration = 600;
ADDRLP4 48
CNSTI4 600
ASGNI4
line 1935
;1934:
;1935:	switch ( weapon ) {
ADDRLP4 80
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 84
CNSTI4 2
ASGNI4
ADDRLP4 80
INDIRI4
ADDRLP4 84
INDIRI4
LTI4 $941
ADDRLP4 80
INDIRI4
CNSTI4 11
GTI4 $941
ADDRLP4 80
INDIRI4
ADDRLP4 84
INDIRI4
LSHI4
ADDRGP4 $1060-8
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1060
address $1041
address $980
address $1026
address $952
address $943
address $989
address $961
address $1009
address $941
address $998
code
LABELV $941
LABELV $943
line 1953
;1936:	default:
;1937:#ifdef MISSIONPACK
;1938:	case WP_NAILGUN:
;1939:		if( soundType == IMPACTSOUND_FLESH ) {
;1940:			sfx = cgs.media.sfx_nghitflesh;
;1941:		} else if( soundType == IMPACTSOUND_METAL ) {
;1942:			sfx = cgs.media.sfx_nghitmetal;
;1943:		} else {
;1944:			sfx = cgs.media.sfx_nghit;
;1945:		}
;1946:		mark = cgs.media.holeMarkShader;
;1947:		radius = 12;
;1948:		break;
;1949:#endif
;1950:	case WP_LIGHTNING:
;1951:		// Shafe - Trep - Flame Thrower
;1952:		
;1953:		shader = cgs.media.flameExplosionShader;
ADDRLP4 28
ADDRGP4 cgs+154388+520
INDIRI4
ASGNI4
line 1954
;1954:		sfx = cgs.media.sfx_plasmaexp;
ADDRLP4 12
ADDRGP4 cgs+154388+768
INDIRI4
ASGNI4
line 1955
;1955:		mark = cgs.media.burnMarkShader;
ADDRLP4 16
ADDRGP4 cgs+154388+404
INDIRI4
ASGNI4
line 1956
;1956:		isSprite = qtrue;
ADDRLP4 36
CNSTI4 1
ASGNI4
line 1957
;1957:		sfx = cgs.media.sfx_lghit2;
ADDRLP4 12
ADDRGP4 cgs+154388+736
INDIRI4
ASGNI4
line 1959
;1958:
;1959:		radius = 40; // was 16
ADDRLP4 24
CNSTF4 1109393408
ASGNF4
line 1973
;1960:		// no explosion at LG impact, it is added with the beam
;1961:		/*
;1962:		r = rand() & 3;
;1963:		if ( r < 2 ) {
;1964:			sfx = cgs.media.sfx_lghit2;
;1965:		} else if ( r == 2 ) {
;1966:			sfx = cgs.media.sfx_lghit1;
;1967:		} else {
;1968:			sfx = cgs.media.sfx_lghit3;
;1969:		}
;1970:		mark = cgs.media.holeMarkShader;
;1971:		radius = 12;
;1972:		*/
;1973:		break;
ADDRGP4 $942
JUMPV
LABELV $952
line 1986
;1974:#ifdef MISSIONPACK
;1975:	case WP_PROX_LAUNCHER:
;1976:		mod = cgs.media.dishFlashModel;
;1977:		shader = cgs.media.grenadeExplosionShader;
;1978:		sfx = cgs.media.sfx_proxexp;
;1979:		mark = cgs.media.burnMarkShader;
;1980:		radius = 64;
;1981:		light = 300;
;1982:		isSprite = qtrue;
;1983:		break;
;1984:#endif
;1985:	case WP_GRENADE_LAUNCHER:
;1986:		mod = cgs.media.dishFlashModel;
ADDRLP4 20
ADDRGP4 cgs+154388+480
INDIRI4
ASGNI4
line 1987
;1987:		shader = cgs.media.grenadeExplosionShader;
ADDRLP4 28
ADDRGP4 cgs+154388+504
INDIRI4
ASGNI4
line 1988
;1988:		sfx = cgs.media.sfx_rockexp;
ADDRLP4 12
ADDRGP4 cgs+154388+760
INDIRI4
ASGNI4
line 1989
;1989:		mark = cgs.media.burnMarkShader;
ADDRLP4 16
ADDRGP4 cgs+154388+404
INDIRI4
ASGNI4
line 1990
;1990:		radius = 64;
ADDRLP4 24
CNSTF4 1115684864
ASGNF4
line 1991
;1991:		light = 300;
ADDRLP4 40
CNSTF4 1133903872
ASGNF4
line 1992
;1992:		isSprite = qtrue;
ADDRLP4 36
CNSTI4 1
ASGNI4
line 1993
;1993:		break;
ADDRGP4 $942
JUMPV
LABELV $961
line 1995
;1994:	case WP_ROCKET_LAUNCHER:
;1995:		mod = cgs.media.dishFlashModel;
ADDRLP4 20
ADDRGP4 cgs+154388+480
INDIRI4
ASGNI4
line 1996
;1996:		shader = cgs.media.rocketExplosionShader;
ADDRLP4 28
ADDRGP4 cgs+154388+500
INDIRI4
ASGNI4
line 1997
;1997:		sfx = cgs.media.sfx_rockexp;
ADDRLP4 12
ADDRGP4 cgs+154388+760
INDIRI4
ASGNI4
line 1998
;1998:		mark = cgs.media.burnMarkShader;
ADDRLP4 16
ADDRGP4 cgs+154388+404
INDIRI4
ASGNI4
line 1999
;1999:		radius = 64;
ADDRLP4 24
CNSTF4 1115684864
ASGNF4
line 2000
;2000:		light = 300;
ADDRLP4 40
CNSTF4 1133903872
ASGNF4
line 2001
;2001:		isSprite = qtrue;
ADDRLP4 36
CNSTI4 1
ASGNI4
line 2002
;2002:		duration = 1000;
ADDRLP4 48
CNSTI4 1000
ASGNI4
line 2003
;2003:		lightColor[0] = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 2004
;2004:		lightColor[1] = 0.75;
ADDRLP4 0+4
CNSTF4 1061158912
ASGNF4
line 2005
;2005:		lightColor[2] = 0.0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 2006
;2006:		if (cg_oldRocket.integer == 0) {
ADDRGP4 cg_oldRocket+12
INDIRI4
CNSTI4 0
NEI4 $942
line 2008
;2007:			// explosion sprite animation
;2008:			VectorMA( origin, 24, dir, sprOrg );
ADDRLP4 88
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 92
CNSTF4 1103101952
ASGNF4
ADDRLP4 96
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 52
ADDRLP4 88
INDIRP4
INDIRF4
ADDRLP4 92
INDIRF4
ADDRLP4 96
INDIRP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 100
CNSTI4 4
ASGNI4
ADDRLP4 52+4
ADDRLP4 88
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRF4
ADDRLP4 92
INDIRF4
ADDRLP4 96
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 104
CNSTI4 8
ASGNI4
ADDRLP4 52+8
ADDRFP4 12
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRF4
CNSTF4 1103101952
ADDRFP4 16
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2009
;2009:			VectorScale( dir, 64, sprVel );
ADDRLP4 108
CNSTF4 1115684864
ASGNF4
ADDRLP4 112
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 108
INDIRF4
ADDRLP4 112
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 108
INDIRF4
ADDRLP4 112
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+8
CNSTF4 1115684864
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 2011
;2010:
;2011:			CG_ParticleExplosion( "explode1", sprOrg, sprVel, 1400, 20, 30 );
ADDRGP4 $979
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 64
ARGP4
CNSTI4 1400
ARGI4
CNSTI4 20
ARGI4
CNSTI4 30
ARGI4
ADDRGP4 CG_ParticleExplosion
CALLV
pop
line 2012
;2012:		}
line 2013
;2013:		break;
ADDRGP4 $942
JUMPV
LABELV $980
line 2015
;2014:	case WP_RAILGUN:
;2015:		mod = cgs.media.ringFlashModel;
ADDRLP4 20
ADDRGP4 cgs+154388+476
INDIRI4
ASGNI4
line 2016
;2016:		shader = cgs.media.railExplosionShader;
ADDRLP4 28
ADDRGP4 cgs+154388+488
INDIRI4
ASGNI4
line 2017
;2017:		sfx = cgs.media.sfx_plasmaexp;
ADDRLP4 12
ADDRGP4 cgs+154388+768
INDIRI4
ASGNI4
line 2018
;2018:		mark = cgs.media.energyMarkShader;
ADDRLP4 16
ADDRGP4 cgs+154388+412
INDIRI4
ASGNI4
line 2019
;2019:		radius = 24;
ADDRLP4 24
CNSTF4 1103101952
ASGNF4
line 2020
;2020:		break;
ADDRGP4 $942
JUMPV
LABELV $989
line 2022
;2021:	case WP_PLASMAGUN:
;2022:		mod = cgs.media.ringFlashModel;
ADDRLP4 20
ADDRGP4 cgs+154388+476
INDIRI4
ASGNI4
line 2023
;2023:		shader = cgs.media.plasmaExplosionShader;
ADDRLP4 28
ADDRGP4 cgs+154388+492
INDIRI4
ASGNI4
line 2024
;2024:		sfx = cgs.media.sfx_plasmaexp;
ADDRLP4 12
ADDRGP4 cgs+154388+768
INDIRI4
ASGNI4
line 2025
;2025:		mark = cgs.media.energyMarkShader;
ADDRLP4 16
ADDRGP4 cgs+154388+412
INDIRI4
ASGNI4
line 2026
;2026:		radius = 16;
ADDRLP4 24
CNSTF4 1098907648
ASGNF4
line 2027
;2027:		break;
ADDRGP4 $942
JUMPV
LABELV $998
line 2029
;2028:	case WP_TURRET:
;2029:		mod = cgs.media.ringFlashModel;
ADDRLP4 20
ADDRGP4 cgs+154388+476
INDIRI4
ASGNI4
line 2030
;2030:		shader = cgs.media.plasmaExplosionShader;
ADDRLP4 28
ADDRGP4 cgs+154388+492
INDIRI4
ASGNI4
line 2031
;2031:		sfx = cgs.media.sfx_plasmaexp;
ADDRLP4 12
ADDRGP4 cgs+154388+768
INDIRI4
ASGNI4
line 2032
;2032:		mark = cgs.media.energyMarkShader;
ADDRLP4 16
ADDRGP4 cgs+154388+412
INDIRI4
ASGNI4
line 2033
;2033:		if (cent->currentState.eFlags & EF_ALT_FIRING)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $1007
line 2034
;2034:		{
line 2035
;2035:			radius = 15;
ADDRLP4 24
CNSTF4 1097859072
ASGNF4
line 2036
;2036:		} 
ADDRGP4 $942
JUMPV
LABELV $1007
line 2038
;2037:		else
;2038:		{
line 2039
;2039:			radius = 5;
ADDRLP4 24
CNSTF4 1084227584
ASGNF4
line 2040
;2040:		}
line 2042
;2041:
;2042:		break;
ADDRGP4 $942
JUMPV
LABELV $1009
line 2044
;2043:	case WP_BFG:
;2044:		mod = cgs.media.dishFlashModel;
ADDRLP4 20
ADDRGP4 cgs+154388+480
INDIRI4
ASGNI4
line 2046
;2045:		//shader = cgs.media.bfgExplosionShader;
;2046:		shader = cgs.media.grenadeExplosionShader;
ADDRLP4 28
ADDRGP4 cgs+154388+504
INDIRI4
ASGNI4
line 2047
;2047:		sfx = cgs.media.sfx_devexp;
ADDRLP4 12
ADDRGP4 cgs+154388+764
INDIRI4
ASGNI4
line 2048
;2048:		mark = cgs.media.burnMarkShader;
ADDRLP4 16
ADDRGP4 cgs+154388+404
INDIRI4
ASGNI4
line 2051
;2049:
;2050:		//radius = 8;
;2051:		if (cent->currentState.eFlags & EF_ALT_FIRING)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $1018
line 2052
;2052:		{
line 2053
;2053:			radius = 350;
ADDRLP4 24
CNSTF4 1135542272
ASGNF4
line 2054
;2054:		} 
ADDRGP4 $1019
JUMPV
LABELV $1018
line 2056
;2055:		else
;2056:		{
line 2057
;2057:			radius = 150;
ADDRLP4 24
CNSTF4 1125515264
ASGNF4
line 2059
;2058:
;2059:		}
LABELV $1019
line 2061
;2060:		
;2061:		light = 300;
ADDRLP4 40
CNSTF4 1133903872
ASGNF4
line 2062
;2062:		isSprite = qtrue;
ADDRLP4 36
CNSTI4 1
ASGNI4
line 2063
;2063:		duration = 1500;
ADDRLP4 48
CNSTI4 1500
ASGNI4
line 2064
;2064:		lightColor[0] = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 2065
;2065:		lightColor[1] = 0.75;
ADDRLP4 0+4
CNSTF4 1061158912
ASGNF4
line 2066
;2066:		lightColor[2] = 0.0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 2069
;2067:		//if (cg_oldRocket.integer == 0) {
;2068:			// explosion sprite animation
;2069:			VectorMA( origin, 24, dir, sprOrg );
ADDRLP4 88
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 92
CNSTF4 1103101952
ASGNF4
ADDRLP4 96
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 52
ADDRLP4 88
INDIRP4
INDIRF4
ADDRLP4 92
INDIRF4
ADDRLP4 96
INDIRP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 100
CNSTI4 4
ASGNI4
ADDRLP4 52+4
ADDRLP4 88
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRF4
ADDRLP4 92
INDIRF4
ADDRLP4 96
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 104
CNSTI4 8
ASGNI4
ADDRLP4 52+8
ADDRFP4 12
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRF4
CNSTF4 1103101952
ADDRFP4 16
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2070
;2070:			VectorScale( dir, 64, sprVel );
ADDRLP4 108
CNSTF4 1115684864
ASGNF4
ADDRLP4 112
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 108
INDIRF4
ADDRLP4 112
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 108
INDIRF4
ADDRLP4 112
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+8
CNSTF4 1115684864
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 2072
;2071:
;2072:			CG_ParticleExplosion( "explode1", sprOrg, sprVel, 2000, 20, 430 );
ADDRGP4 $979
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 64
ARGP4
CNSTI4 2000
ARGI4
CNSTI4 20
ARGI4
CNSTI4 430
ARGI4
ADDRGP4 CG_ParticleExplosion
CALLV
pop
line 2075
;2073:		//}
;2074:		
;2075:		break;
ADDRGP4 $942
JUMPV
LABELV $1026
line 2078
;2076:	case WP_SHOTGUN:
;2077:
;2078:		if (cent->currentState.eFlags & EF_ALT_FIRING)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $1027
line 2079
;2079:		{
line 2081
;2080:			// Doesnt do anything now.
;2081:			break;
ADDRGP4 $942
JUMPV
LABELV $1027
line 2084
;2082:		} 
;2083:		else
;2084:		{
line 2085
;2085:		mod = cgs.media.bulletFlashModel;
ADDRLP4 20
ADDRGP4 cgs+154388+472
INDIRI4
ASGNI4
line 2086
;2086:		shader = cgs.media.bulletExplosionShader;
ADDRLP4 28
ADDRGP4 cgs+154388+496
INDIRI4
ASGNI4
line 2087
;2087:		mark = cgs.media.bulletMarkShader;
ADDRLP4 16
ADDRGP4 cgs+154388+400
INDIRI4
ASGNI4
line 2088
;2088:		sfx = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 2090
;2089:
;2090:		mod = cgs.media.bulletFlashModel;
ADDRLP4 20
ADDRGP4 cgs+154388+472
INDIRI4
ASGNI4
line 2091
;2091:		shader = cgs.media.bulletExplosionShader;
ADDRLP4 28
ADDRGP4 cgs+154388+496
INDIRI4
ASGNI4
line 2092
;2092:		mark = cgs.media.bulletMarkShader;
ADDRLP4 16
ADDRGP4 cgs+154388+400
INDIRI4
ASGNI4
line 2093
;2093:		radius = 10;
ADDRLP4 24
CNSTF4 1092616192
ASGNF4
line 2095
;2094:
;2095:		}
line 2096
;2096:		break;
ADDRGP4 $942
JUMPV
LABELV $1041
line 2124
;2097:
;2098:#ifdef MISSIONPACK
;2099:	case WP_CHAINGUN:
;2100:		mod = cgs.media.bulletFlashModel;
;2101:		if( soundType == IMPACTSOUND_FLESH ) {
;2102:			sfx = cgs.media.sfx_chghitflesh;
;2103:		} else if( soundType == IMPACTSOUND_METAL ) {
;2104:			sfx = cgs.media.sfx_chghitmetal;
;2105:		} else {
;2106:			sfx = cgs.media.sfx_chghit;
;2107:		}
;2108:		mark = cgs.media.bulletMarkShader;
;2109:
;2110:		r = rand() & 3;
;2111:		if ( r < 2 ) {
;2112:			sfx = cgs.media.sfx_ric1;
;2113:		} else if ( r == 2 ) {
;2114:			sfx = cgs.media.sfx_ric2;
;2115:		} else {
;2116:			sfx = cgs.media.sfx_ric3;
;2117:		}
;2118:
;2119:		radius = 8;
;2120:		break;
;2121:#endif
;2122:
;2123:	case WP_MACHINEGUN:
;2124:		mod = cgs.media.bulletFlashModel;
ADDRLP4 20
ADDRGP4 cgs+154388+472
INDIRI4
ASGNI4
line 2125
;2125:		shader = cgs.media.bulletExplosionShader;
ADDRLP4 28
ADDRGP4 cgs+154388+496
INDIRI4
ASGNI4
line 2126
;2126:		mark = cgs.media.bulletMarkShader;
ADDRLP4 16
ADDRGP4 cgs+154388+400
INDIRI4
ASGNI4
line 2128
;2127:
;2128:		r = rand() & 3;
ADDRLP4 116
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 76
ADDRLP4 116
INDIRI4
CNSTI4 3
BANDI4
ASGNI4
line 2129
;2129:		if ( r == 0 ) {
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $1048
line 2130
;2130:			sfx = cgs.media.sfx_ric1;
ADDRLP4 12
ADDRGP4 cgs+154388+744
INDIRI4
ASGNI4
line 2131
;2131:		} else if ( r == 1 ) {
ADDRGP4 $1049
JUMPV
LABELV $1048
ADDRLP4 76
INDIRI4
CNSTI4 1
NEI4 $1052
line 2132
;2132:			sfx = cgs.media.sfx_ric2;
ADDRLP4 12
ADDRGP4 cgs+154388+748
INDIRI4
ASGNI4
line 2133
;2133:		} else {
ADDRGP4 $1053
JUMPV
LABELV $1052
line 2134
;2134:			sfx = cgs.media.sfx_ric3;
ADDRLP4 12
ADDRGP4 cgs+154388+752
INDIRI4
ASGNI4
line 2135
;2135:		}
LABELV $1053
LABELV $1049
line 2139
;2136:
;2137:		
;2138:		//radius = 8;
;2139:		if (cent->currentState.eFlags & EF_ALT_FIRING)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $1058
line 2140
;2140:		{
line 2141
;2141:			radius = 10;
ADDRLP4 24
CNSTF4 1092616192
ASGNF4
line 2142
;2142:		} 
ADDRGP4 $942
JUMPV
LABELV $1058
line 2144
;2143:		else
;2144:		{
line 2145
;2145:			radius = 5;
ADDRLP4 24
CNSTF4 1084227584
ASGNF4
line 2147
;2146:
;2147:		}
line 2149
;2148:
;2149:		break;
LABELV $942
line 2152
;2150:	}
;2151:
;2152:	if ( sfx ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $1062
line 2155
;2153:		
;2154:		// This is a hack.. Move the devastator stuff where everything else is.
;2155:		if (sfx == cgs.media.sfx_devexp)
ADDRLP4 12
INDIRI4
ADDRGP4 cgs+154388+764
INDIRI4
NEI4 $1064
line 2156
;2156:		{
line 2157
;2157:			if (cent->currentState.eFlags & EF_ALT_FIRING)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $1068
line 2158
;2158:			{
line 2159
;2159:				trap_S_StartLocalSound(sfx, CHAN_AUTO);
ADDRLP4 12
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2160
;2160:			} 
ADDRGP4 $1065
JUMPV
LABELV $1068
line 2162
;2161:			else
;2162:			{
line 2163
;2163:				trap_S_StartSound( origin, ENTITYNUM_WORLD, CHAN_AUTO, sfx );
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 1022
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 2164
;2164:			}
line 2166
;2165:		
;2166:		} 
ADDRGP4 $1065
JUMPV
LABELV $1064
line 2168
;2167:		else 
;2168:		{
line 2169
;2169:			trap_S_StartSound( origin, ENTITYNUM_WORLD, CHAN_AUTO, sfx );
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 1022
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 2170
;2170:		}
LABELV $1065
line 2172
;2171:		
;2172:	}
LABELV $1062
line 2177
;2173:
;2174:	//
;2175:	// create the explosion
;2176:	//
;2177:	if ( mod ) {
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $1070
line 2178
;2178:		le = CG_MakeExplosion( origin, dir, 
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 CG_MakeExplosion
CALLP4
ASGNP4
ADDRLP4 44
ADDRLP4 88
INDIRP4
ASGNP4
line 2181
;2179:							   mod,	shader,
;2180:							   duration, isSprite );
;2181:		le->light = light;
ADDRLP4 44
INDIRP4
CNSTI4 128
ADDP4
ADDRLP4 40
INDIRF4
ASGNF4
line 2182
;2182:		VectorCopy( lightColor, le->lightColor );
ADDRLP4 44
INDIRP4
CNSTI4 132
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 2183
;2183:		if ( weapon == WP_RAILGUN ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
NEI4 $1072
line 2185
;2184:			// colorize with client color
;2185:			VectorCopy( cgs.clientinfo[clientNum].color1, le->color );
ADDRLP4 44
INDIRP4
CNSTI4 108
ADDP4
CNSTI4 1740
ADDRFP4 8
INDIRI4
MULI4
ADDRGP4 cgs+40972+76
ADDP4
INDIRB
ASGNB 12
line 2186
;2186:		}
LABELV $1072
line 2187
;2187:	}
LABELV $1070
line 2192
;2188:
;2189:	//
;2190:	// impact mark
;2191:	//
;2192:	alphaFade = (mark == cgs.media.energyMarkShader);	// plasma fades alpha, all others fade color
ADDRLP4 16
INDIRI4
ADDRGP4 cgs+154388+412
INDIRI4
NEI4 $1079
ADDRLP4 88
CNSTI4 1
ASGNI4
ADDRGP4 $1080
JUMPV
LABELV $1079
ADDRLP4 88
CNSTI4 0
ASGNI4
LABELV $1080
ADDRLP4 32
ADDRLP4 88
INDIRI4
ASGNI4
line 2193
;2193:	if ( weapon == WP_RAILGUN ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
NEI4 $1081
line 2197
;2194:		float	*color;
;2195:
;2196:		// colorize with client color
;2197:		color = cgs.clientinfo[clientNum].color2;
ADDRLP4 92
CNSTI4 1740
ADDRFP4 8
INDIRI4
MULI4
ADDRGP4 cgs+40972+88
ADDP4
ASGNP4
line 2198
;2198:		CG_ImpactMark( mark, origin, dir, random()*360, color[0],color[1], color[2],1, alphaFade, radius, qfalse );
ADDRLP4 96
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
CNSTF4 1135869952
ADDRLP4 96
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ARGF4
ADDRLP4 100
ADDRLP4 92
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
INDIRF4
ARGF4
ADDRLP4 100
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 100
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 24
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 CG_ImpactMark
CALLV
pop
line 2199
;2199:	} else {
ADDRGP4 $1082
JUMPV
LABELV $1081
line 2200
;2200:		CG_ImpactMark( mark, origin, dir, random()*360, 1,1,1,1, alphaFade, radius, qfalse );
ADDRLP4 92
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
CNSTF4 1135869952
ADDRLP4 92
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ARGF4
ADDRLP4 96
CNSTF4 1065353216
ASGNF4
ADDRLP4 96
INDIRF4
ARGF4
ADDRLP4 96
INDIRF4
ARGF4
ADDRLP4 96
INDIRF4
ARGF4
ADDRLP4 96
INDIRF4
ARGF4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 24
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 CG_ImpactMark
CALLV
pop
line 2201
;2201:	}
LABELV $1082
line 2205
;2202:
;2203:
;2204:
;2205:}
LABELV $938
endproc CG_MissileHitWall 120 44
export CG_MissileHitPlayer
proc CG_MissileHitPlayer 4 24
line 2213
;2206:
;2207:
;2208:/*
;2209:=================
;2210:CG_MissileHitPlayer
;2211:=================
;2212:*/
;2213:void CG_MissileHitPlayer( int weapon, vec3_t origin, vec3_t dir, int entityNum ) {
line 2214
;2214:	CG_Bleed( origin, entityNum );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_Bleed
CALLV
pop
line 2218
;2215:
;2216:	// some weapons will make an explosion with the blood, while
;2217:	// others will just make the blood
;2218:	switch ( weapon ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 5
EQI4 $1088
ADDRLP4 0
INDIRI4
CNSTI4 8
EQI4 $1088
ADDRGP4 $1087
JUMPV
LABELV $1088
line 2226
;2219:	case WP_GRENADE_LAUNCHER:
;2220:	case WP_ROCKET_LAUNCHER:
;2221:#ifdef MISSIONPACK
;2222:	case WP_NAILGUN:
;2223:	case WP_CHAINGUN:
;2224:	case WP_PROX_LAUNCHER:
;2225:#endif
;2226:		CG_MissileHitWall( NULL, weapon, 0, origin, dir, IMPACTSOUND_FLESH );
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 2227
;2227:		break;
line 2229
;2228:	default:
;2229:		break;
LABELV $1087
line 2231
;2230:	}
;2231:}
LABELV $1085
endproc CG_MissileHitPlayer 4 24
proc CG_ShotgunPellet 80 28
line 2248
;2232:
;2233:
;2234:
;2235:/*
;2236:============================================================================
;2237:
;2238:SHOTGUN TRACING
;2239:
;2240:============================================================================
;2241:*/
;2242:
;2243:/*
;2244:================
;2245:CG_ShotgunPellet
;2246:================
;2247:*/
;2248:static void CG_ShotgunPellet( vec3_t start, vec3_t end, int skipNum ) {
line 2252
;2249:	trace_t		tr;
;2250:	int sourceContentType, destContentType;
;2251:
;2252:	CG_Trace( &tr, start, NULL, NULL, end, skipNum, MASK_SHOT );
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
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
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 100664321
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 2254
;2253:
;2254:	sourceContentType = trap_CM_PointContents( start, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 68
ADDRGP4 trap_CM_PointContents
CALLI4
ASGNI4
ADDRLP4 56
ADDRLP4 68
INDIRI4
ASGNI4
line 2255
;2255:	destContentType = trap_CM_PointContents( tr.endpos, 0 );
ADDRLP4 0+12
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 72
ADDRGP4 trap_CM_PointContents
CALLI4
ASGNI4
ADDRLP4 60
ADDRLP4 72
INDIRI4
ASGNI4
line 2265
;2256:
;2257:	
;2258:
;2259:	/*
;2260:	// FIXME: should probably move this cruft into CG_BubbleTrail
;2261:	if ( sourceContentType == destContentType ) {
;2262:		if ( sourceContentType & CONTENTS_WATER ) {
;2263:	*/
;2264:	
;2265:			CG_ShotgunTrail( start, tr.endpos, 32 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+12
ARGP4
CNSTF4 1107296256
ARGF4
ADDRGP4 CG_ShotgunTrail
CALLV
pop
line 2283
;2266:	/*
;2267:		}
;2268:	} else if ( sourceContentType & CONTENTS_WATER ) {
;2269:		trace_t trace;
;2270:
;2271:		trap_CM_BoxTrace( &trace, end, start, NULL, NULL, 0, CONTENTS_WATER );
;2272:		
;2273:		CG_BubbleTrail( start, trace.endpos, 32 );
;2274:		
;2275:	} else if ( destContentType & CONTENTS_WATER ) {
;2276:		trace_t trace;
;2277:
;2278:		trap_CM_BoxTrace( &trace, start, end, NULL, NULL, 0, CONTENTS_WATER );
;2279:		CG_BubbleTrail( tr.endpos, trace.endpos, 32 );
;2280:	}
;2281:
;2282:	*/
;2283:	if (  tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1092
line 2284
;2284:		return;
ADDRGP4 $1089
JUMPV
LABELV $1092
line 2287
;2285:	}
;2286:
;2287:	if ( cg_entities[tr.entityNum].currentState.eType == ET_PLAYER ) {
CNSTI4 740
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 cg_entities+4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1095
line 2288
;2288:		CG_MissileHitPlayer( WP_SHOTGUN, tr.endpos, tr.plane.normal, tr.entityNum );
CNSTI4 4
ARGI4
ADDRLP4 0+12
ARGP4
ADDRLP4 0+24
ARGP4
ADDRLP4 0+52
INDIRI4
ARGI4
ADDRGP4 CG_MissileHitPlayer
CALLV
pop
line 2289
;2289:	} else {
ADDRGP4 $1096
JUMPV
LABELV $1095
line 2290
;2290:		if ( tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1102
line 2292
;2291:			// SURF_NOIMPACT will not make a flame puff or a mark
;2292:			return;
ADDRGP4 $1089
JUMPV
LABELV $1102
line 2294
;2293:		}
;2294:		if ( tr.surfaceFlags & SURF_METALSTEPS ) {
ADDRLP4 0+44
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1105
line 2295
;2295:			CG_MissileHitWall( NULL, WP_SHOTGUN, 0, tr.endpos, tr.plane.normal, IMPACTSOUND_METAL );
CNSTP4 0
ARGP4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0+12
ARGP4
ADDRLP4 0+24
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 2296
;2296:		} else {
ADDRGP4 $1106
JUMPV
LABELV $1105
line 2297
;2297:			CG_MissileHitWall( NULL, WP_SHOTGUN, 0, tr.endpos, tr.plane.normal, IMPACTSOUND_DEFAULT );
CNSTP4 0
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRLP4 0+12
ARGP4
ADDRLP4 0+24
ARGP4
ADDRLP4 76
INDIRI4
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 2298
;2298:		}
LABELV $1106
line 2299
;2299:	}
LABELV $1096
line 2300
;2300:}
LABELV $1089
endproc CG_ShotgunPellet 80 28
export CG_ShotgunPattern
proc CG_ShotgunPattern 84 12
line 2312
;2301:
;2302:/*
;2303:================
;2304:CG_ShotgunPattern
;2305:
;2306:Perform the same traces the server did to locate the
;2307:hit splashes
;2308:================
;2309:*/
;2310://unlagged - attack prediction
;2311:// made this non-static for access from cg_unlagged.c
;2312:void CG_ShotgunPattern( vec3_t origin, vec3_t origin2, int seed, int otherEntNum ) {
line 2320
;2313:	int			i;
;2314:	float		r, u;
;2315:	vec3_t		end;
;2316:	vec3_t		forward, right, up;
;2317:
;2318:	// derive the right and up vectors from the forward vector, because
;2319:	// the client won't have any other information
;2320:	VectorNormalize2( origin2, forward );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 VectorNormalize2
CALLF4
pop
line 2321
;2321:	PerpendicularVector( right, forward );
ADDRLP4 32
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 2322
;2322:	CrossProduct( forward, right, up );
ADDRLP4 20
ARGP4
ADDRLP4 32
ARGP4
ADDRLP4 44
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 2325
;2323:
;2324:	// generate the "random" spread pattern
;2325:	for ( i = 0 ; i < DEFAULT_SHOTGUN_COUNT ; i++ ) {
ADDRLP4 56
CNSTI4 0
ASGNI4
LABELV $1113
line 2326
;2326:		r = Q_crandom( &seed ) * DEFAULT_SHOTGUN_SPREAD * 16;
ADDRFP4 8
ARGP4
ADDRLP4 60
ADDRGP4 Q_crandom
CALLF4
ASGNF4
ADDRLP4 12
CNSTF4 1098907648
CNSTF4 1143930880
ADDRLP4 60
INDIRF4
MULF4
MULF4
ASGNF4
line 2327
;2327:		u = Q_crandom( &seed ) * DEFAULT_SHOTGUN_SPREAD * 16;
ADDRFP4 8
ARGP4
ADDRLP4 64
ADDRGP4 Q_crandom
CALLF4
ASGNF4
ADDRLP4 16
CNSTF4 1098907648
CNSTF4 1143930880
ADDRLP4 64
INDIRF4
MULF4
MULF4
ASGNF4
line 2328
;2328:		VectorMA( origin, 8192 * 16, forward, end);
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
CNSTF4 1207959552
ASGNF4
ADDRLP4 0
ADDRLP4 68
INDIRP4
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 68
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 20+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1207959552
ADDRLP4 20+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2329
;2329:		VectorMA (end, r, right, end);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 32
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 32+4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 32+8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 2330
;2330:		VectorMA (end, u, up, end);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 44
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 44+4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 44+8
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
line 2332
;2331:
;2332:		CG_ShotgunPellet( origin, end, otherEntNum );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_ShotgunPellet
CALLV
pop
line 2333
;2333:	}
LABELV $1114
line 2325
ADDRLP4 56
ADDRLP4 56
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 11
LTI4 $1113
line 2334
;2334:}
LABELV $1112
endproc CG_ShotgunPattern 84 12
export CG_ShotgunFire
proc CG_ShotgunFire 60 48
line 2341
;2335:
;2336:/*
;2337:==============
;2338:CG_ShotgunFire
;2339:==============
;2340:*/
;2341:void CG_ShotgunFire( entityState_t *es ) {
line 2345
;2342:	vec3_t	v;
;2343:	int		contents;
;2344:
;2345:	if (!cg.snap->ps.eFlags & EF_ALT_FIRING)
ADDRGP4 cg+36
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1138
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRGP4 $1139
JUMPV
LABELV $1138
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $1139
ADDRLP4 16
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $1134
line 2346
;2346:	{
line 2349
;2347:	
;2348:
;2349:		VectorSubtract( es->origin2, es->pos.trBase, v );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 20
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 24
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2350
;2350:		VectorNormalize( v );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2351
;2351:		VectorScale( v, 32, v );
ADDRLP4 28
CNSTF4 1107296256
ASGNF4
ADDRLP4 0
ADDRLP4 28
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 28
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1107296256
ADDRLP4 0+8
INDIRF4
MULF4
ASGNF4
line 2352
;2352:		VectorAdd( es->pos.trBase, v, v );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 32
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 32
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDF4
ASGNF4
line 2353
;2353:		if ( cgs.glconfig.hardwareType != GLHW_RAGEPRO ) {
ADDRGP4 cgs+20100+11288
INDIRI4
CNSTI4 3
EQI4 $1150
line 2357
;2354:			// ragepro can't alpha fade, so don't even bother with smoke
;2355:			vec3_t			up;
;2356:	
;2357:			contents = trap_CM_PointContents( es->pos.trBase, 0 );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 48
ADDRGP4 trap_CM_PointContents
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 48
INDIRI4
ASGNI4
line 2358
;2358:			if ( !( contents & CONTENTS_WATER ) ) {
ADDRLP4 12
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $1154
line 2359
;2359:				VectorSet( up, 0, 0, 8 );
ADDRLP4 52
CNSTF4 0
ASGNF4
ADDRLP4 36
ADDRLP4 52
INDIRF4
ASGNF4
ADDRLP4 36+4
ADDRLP4 52
INDIRF4
ASGNF4
ADDRLP4 36+8
CNSTF4 1090519040
ASGNF4
line 2360
;2360:				CG_SmokePuff( v, up, 32, 1, 1, 1, 0.33f, 900, cg.time, 0, LEF_PUFF_DONT_SCALE, cgs.media.shotgunSmokePuffShader );
ADDRLP4 0
ARGP4
ADDRLP4 36
ARGP4
CNSTF4 1107296256
ARGF4
ADDRLP4 56
CNSTF4 1065353216
ASGNF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
CNSTF4 1051260355
ARGF4
CNSTF4 1147207680
ARGF4
ADDRGP4 cg+109652
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 cgs+154388+304
INDIRI4
ARGI4
ADDRGP4 CG_SmokePuff
CALLP4
pop
line 2361
;2361:			}
LABELV $1154
line 2362
;2362:		}
LABELV $1150
line 2363
;2363:		CG_ShotgunPattern( es->pos.trBase, es->origin2, es->eventParm, es->otherEntityNum );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ShotgunPattern
CALLV
pop
line 2365
;2364:		
;2365:	}
LABELV $1134
line 2366
;2366:}
LABELV $1133
endproc CG_ShotgunFire 60 48
export CG_Tracer
proc CG_Tracer 224 16
line 2382
;2367:
;2368:/*
;2369:============================================================================
;2370:
;2371:BULLETS
;2372:
;2373:============================================================================
;2374:*/
;2375:
;2376:
;2377:/*
;2378:===============
;2379:CG_Tracer
;2380:===============
;2381:*/
;2382:void CG_Tracer( vec3_t source, vec3_t dest ) {
line 2391
;2383:	vec3_t		forward, right;
;2384:	polyVert_t	verts[4];
;2385:	vec3_t		line;
;2386:	float		len, begin, end;
;2387:	vec3_t		start, finish;
;2388:	vec3_t		midpoint;
;2389:
;2390:	// tracer
;2391:	VectorSubtract( dest, source, forward );
ADDRLP4 180
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
ADDRLP4 180
INDIRP4
INDIRF4
ADDRLP4 184
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 188
CNSTI4 4
ASGNI4
ADDRLP4 108+4
ADDRLP4 180
INDIRP4
ADDRLP4 188
INDIRI4
ADDP4
INDIRF4
ADDRLP4 184
INDIRP4
ADDRLP4 188
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 192
CNSTI4 8
ASGNI4
ADDRLP4 108+8
ADDRFP4 4
INDIRP4
ADDRLP4 192
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 192
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2392
;2392:	len = VectorNormalize( forward );
ADDRLP4 108
ARGP4
ADDRLP4 196
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 164
ADDRLP4 196
INDIRF4
ASGNF4
line 2395
;2393:
;2394:	// start at least a little ways from the muzzle
;2395:	if ( len < 100 ) {
ADDRLP4 164
INDIRF4
CNSTF4 1120403456
GEF4 $1164
line 2396
;2396:		return;
ADDRGP4 $1161
JUMPV
LABELV $1164
line 2398
;2397:	}
;2398:	begin = 50 + random() * (len - 60);
ADDRLP4 200
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 160
ADDRLP4 200
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 164
INDIRF4
CNSTF4 1114636288
SUBF4
MULF4
CNSTF4 1112014848
ADDF4
ASGNF4
line 2399
;2399:	end = begin + cg_tracerLength.value;
ADDRLP4 156
ADDRLP4 160
INDIRF4
ADDRGP4 cg_tracerLength+8
INDIRF4
ADDF4
ASGNF4
line 2400
;2400:	if ( end > len ) {
ADDRLP4 156
INDIRF4
ADDRLP4 164
INDIRF4
LEF4 $1167
line 2401
;2401:		end = len;
ADDRLP4 156
ADDRLP4 164
INDIRF4
ASGNF4
line 2402
;2402:	}
LABELV $1167
line 2403
;2403:	VectorMA( source, begin, forward, start );
ADDRLP4 204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 120
ADDRLP4 204
INDIRP4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 160
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 120+4
ADDRLP4 204
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 108+4
INDIRF4
ADDRLP4 160
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 120+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 108+8
INDIRF4
ADDRLP4 160
INDIRF4
MULF4
ADDF4
ASGNF4
line 2404
;2404:	VectorMA( source, end, forward, finish );
ADDRLP4 212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 132
ADDRLP4 212
INDIRP4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 156
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 132+4
ADDRLP4 212
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 108+4
INDIRF4
ADDRLP4 156
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 132+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 108+8
INDIRF4
ADDRLP4 156
INDIRF4
MULF4
ADDF4
ASGNF4
line 2406
;2405:
;2406:	line[0] = DotProduct( forward, cg.refdef.viewaxis[1] );
ADDRLP4 144
ADDRLP4 108
INDIRF4
ADDRGP4 cg+111104+36+12
INDIRF4
MULF4
ADDRLP4 108+4
INDIRF4
ADDRGP4 cg+111104+36+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 108+8
INDIRF4
ADDRGP4 cg+111104+36+12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2407
;2407:	line[1] = DotProduct( forward, cg.refdef.viewaxis[2] );
ADDRLP4 144+4
ADDRLP4 108
INDIRF4
ADDRGP4 cg+111104+36+24
INDIRF4
MULF4
ADDRLP4 108+4
INDIRF4
ADDRGP4 cg+111104+36+24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 108+8
INDIRF4
ADDRGP4 cg+111104+36+24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2409
;2408:
;2409:	VectorScale( cg.refdef.viewaxis[1], line[1], right );
ADDRLP4 96
ADDRGP4 cg+111104+36+12
INDIRF4
ADDRLP4 144+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 96+4
ADDRGP4 cg+111104+36+12+4
INDIRF4
ADDRLP4 144+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 96+8
ADDRGP4 cg+111104+36+12+8
INDIRF4
ADDRLP4 144+4
INDIRF4
MULF4
ASGNF4
line 2410
;2410:	VectorMA( right, -line[0], cg.refdef.viewaxis[2], right );
ADDRLP4 220
ADDRLP4 144
INDIRF4
NEGF4
ASGNF4
ADDRLP4 96
ADDRLP4 96
INDIRF4
ADDRGP4 cg+111104+36+24
INDIRF4
ADDRLP4 220
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 96+4
ADDRLP4 96+4
INDIRF4
ADDRGP4 cg+111104+36+24+4
INDIRF4
ADDRLP4 220
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 96+8
ADDRLP4 96+8
INDIRF4
ADDRGP4 cg+111104+36+24+8
INDIRF4
ADDRLP4 144
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 2411
;2411:	VectorNormalize( right );
ADDRLP4 96
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2413
;2412:
;2413:	VectorMA( finish, cg_tracerWidth.value, right, verts[0].xyz );
ADDRLP4 0
ADDRLP4 132
INDIRF4
ADDRLP4 96
INDIRF4
ADDRGP4 cg_tracerWidth+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 132+4
INDIRF4
ADDRLP4 96+4
INDIRF4
ADDRGP4 cg_tracerWidth+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 132+8
INDIRF4
ADDRLP4 96+8
INDIRF4
ADDRGP4 cg_tracerWidth+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2414
;2414:	verts[0].st[0] = 0;
ADDRLP4 0+12
CNSTF4 0
ASGNF4
line 2415
;2415:	verts[0].st[1] = 1;
ADDRLP4 0+12+4
CNSTF4 1065353216
ASGNF4
line 2416
;2416:	verts[0].modulate[0] = 255;
ADDRLP4 0+20
CNSTU1 255
ASGNU1
line 2417
;2417:	verts[0].modulate[1] = 255;
ADDRLP4 0+20+1
CNSTU1 255
ASGNU1
line 2418
;2418:	verts[0].modulate[2] = 255;
ADDRLP4 0+20+2
CNSTU1 255
ASGNU1
line 2419
;2419:	verts[0].modulate[3] = 255;
ADDRLP4 0+20+3
CNSTU1 255
ASGNU1
line 2421
;2420:
;2421:	VectorMA( finish, -cg_tracerWidth.value, right, verts[1].xyz );
ADDRLP4 0+24
ADDRLP4 132
INDIRF4
ADDRLP4 96
INDIRF4
ADDRGP4 cg_tracerWidth+8
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+24+4
ADDRLP4 132+4
INDIRF4
ADDRLP4 96+4
INDIRF4
ADDRGP4 cg_tracerWidth+8
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+24+8
ADDRLP4 132+8
INDIRF4
ADDRLP4 96+8
INDIRF4
ADDRGP4 cg_tracerWidth+8
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 2422
;2422:	verts[1].st[0] = 1;
ADDRLP4 0+24+12
CNSTF4 1065353216
ASGNF4
line 2423
;2423:	verts[1].st[1] = 0;
ADDRLP4 0+24+12+4
CNSTF4 0
ASGNF4
line 2424
;2424:	verts[1].modulate[0] = 255;
ADDRLP4 0+24+20
CNSTU1 255
ASGNU1
line 2425
;2425:	verts[1].modulate[1] = 255;
ADDRLP4 0+24+20+1
CNSTU1 255
ASGNU1
line 2426
;2426:	verts[1].modulate[2] = 255;
ADDRLP4 0+24+20+2
CNSTU1 255
ASGNU1
line 2427
;2427:	verts[1].modulate[3] = 255;
ADDRLP4 0+24+20+3
CNSTU1 255
ASGNU1
line 2429
;2428:
;2429:	VectorMA( start, -cg_tracerWidth.value, right, verts[2].xyz );
ADDRLP4 0+48
ADDRLP4 120
INDIRF4
ADDRLP4 96
INDIRF4
ADDRGP4 cg_tracerWidth+8
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+48+4
ADDRLP4 120+4
INDIRF4
ADDRLP4 96+4
INDIRF4
ADDRGP4 cg_tracerWidth+8
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+48+8
ADDRLP4 120+8
INDIRF4
ADDRLP4 96+8
INDIRF4
ADDRGP4 cg_tracerWidth+8
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 2430
;2430:	verts[2].st[0] = 1;
ADDRLP4 0+48+12
CNSTF4 1065353216
ASGNF4
line 2431
;2431:	verts[2].st[1] = 1;
ADDRLP4 0+48+12+4
CNSTF4 1065353216
ASGNF4
line 2432
;2432:	verts[2].modulate[0] = 255;
ADDRLP4 0+48+20
CNSTU1 255
ASGNU1
line 2433
;2433:	verts[2].modulate[1] = 255;
ADDRLP4 0+48+20+1
CNSTU1 255
ASGNU1
line 2434
;2434:	verts[2].modulate[2] = 255;
ADDRLP4 0+48+20+2
CNSTU1 255
ASGNU1
line 2435
;2435:	verts[2].modulate[3] = 255;
ADDRLP4 0+48+20+3
CNSTU1 255
ASGNU1
line 2437
;2436:
;2437:	VectorMA( start, cg_tracerWidth.value, right, verts[3].xyz );
ADDRLP4 0+72
ADDRLP4 120
INDIRF4
ADDRLP4 96
INDIRF4
ADDRGP4 cg_tracerWidth+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+72+4
ADDRLP4 120+4
INDIRF4
ADDRLP4 96+4
INDIRF4
ADDRGP4 cg_tracerWidth+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+72+8
ADDRLP4 120+8
INDIRF4
ADDRLP4 96+8
INDIRF4
ADDRGP4 cg_tracerWidth+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2438
;2438:	verts[3].st[0] = 0;
ADDRLP4 0+72+12
CNSTF4 0
ASGNF4
line 2439
;2439:	verts[3].st[1] = 0;
ADDRLP4 0+72+12+4
CNSTF4 0
ASGNF4
line 2440
;2440:	verts[3].modulate[0] = 255;
ADDRLP4 0+72+20
CNSTU1 255
ASGNU1
line 2441
;2441:	verts[3].modulate[1] = 255;
ADDRLP4 0+72+20+1
CNSTU1 255
ASGNU1
line 2442
;2442:	verts[3].modulate[2] = 255;
ADDRLP4 0+72+20+2
CNSTU1 255
ASGNU1
line 2443
;2443:	verts[3].modulate[3] = 255;
ADDRLP4 0+72+20+3
CNSTU1 255
ASGNU1
line 2445
;2444:
;2445:	trap_R_AddPolyToScene( cgs.media.tracerShader, 4, verts );
ADDRGP4 cgs+154388+232
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddPolyToScene
CALLV
pop
line 2447
;2446:
;2447:	midpoint[0] = ( start[0] + finish[0] ) * 0.5;
ADDRLP4 168
CNSTF4 1056964608
ADDRLP4 120
INDIRF4
ADDRLP4 132
INDIRF4
ADDF4
MULF4
ASGNF4
line 2448
;2448:	midpoint[1] = ( start[1] + finish[1] ) * 0.5;
ADDRLP4 168+4
CNSTF4 1056964608
ADDRLP4 120+4
INDIRF4
ADDRLP4 132+4
INDIRF4
ADDF4
MULF4
ASGNF4
line 2449
;2449:	midpoint[2] = ( start[2] + finish[2] ) * 0.5;
ADDRLP4 168+8
CNSTF4 1056964608
ADDRLP4 120+8
INDIRF4
ADDRLP4 132+8
INDIRF4
ADDF4
MULF4
ASGNF4
line 2452
;2450:
;2451:	// add the tracer sound
;2452:	trap_S_StartSound( midpoint, ENTITYNUM_WORLD, CHAN_AUTO, cgs.media.tracerSound );
ADDRLP4 168
ARGP4
CNSTI4 1022
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+154388+604
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 2454
;2453:
;2454:}
LABELV $1161
endproc CG_Tracer 224 16
proc CG_CalcMuzzlePoint 40 16
line 2462
;2455:
;2456:
;2457:/*
;2458:======================
;2459:CG_CalcMuzzlePoint
;2460:======================
;2461:*/
;2462:static qboolean	CG_CalcMuzzlePoint( int entityNum, vec3_t muzzle ) {
line 2467
;2463:	vec3_t		forward;
;2464:	centity_t	*cent;
;2465:	int			anim;
;2466:
;2467:	if ( entityNum == cg.snap->ps.clientNum ) {
ADDRFP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $1349
line 2468
;2468:		VectorCopy( cg.snap->ps.origin, muzzle );
ADDRFP4 4
INDIRP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 64
ADDP4
INDIRB
ASGNB 12
line 2469
;2469:		muzzle[2] += cg.snap->ps.viewheight;
ADDRLP4 20
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 2470
;2470:		AngleVectors( cg.snap->ps.viewangles, forward, NULL, NULL );
ADDRGP4 cg+36
INDIRP4
CNSTI4 196
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 24
CNSTP4 0
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2471
;2471:		VectorMA( muzzle, 14, forward, muzzle );
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 32
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 36
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2472
;2472:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1348
JUMPV
LABELV $1349
line 2475
;2473:	}
;2474:
;2475:	cent = &cg_entities[entityNum];
ADDRLP4 12
CNSTI4 740
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 2476
;2476:	if ( !cent->currentValid ) {
ADDRLP4 12
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1357
line 2477
;2477:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1348
JUMPV
LABELV $1357
line 2480
;2478:	}
;2479:
;2480:	VectorCopy( cent->currentState.pos.trBase, muzzle );
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 2482
;2481:
;2482:	AngleVectors( cent->currentState.apos.trBase, forward, NULL, NULL );
ADDRLP4 12
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 20
CNSTP4 0
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2483
;2483:	anim = cent->currentState.legsAnim & ~ANIM_TOGGLEBIT;
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 2484
;2484:	if ( anim == LEGS_WALKCR || anim == LEGS_IDLECR ) {
ADDRLP4 16
INDIRI4
CNSTI4 13
EQI4 $1361
ADDRLP4 16
INDIRI4
CNSTI4 23
NEI4 $1359
LABELV $1361
line 2485
;2485:		muzzle[2] += CROUCH_VIEWHEIGHT;
ADDRLP4 28
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
CNSTF4 1094713344
ADDF4
ASGNF4
line 2486
;2486:	} else {
ADDRGP4 $1360
JUMPV
LABELV $1359
line 2487
;2487:		muzzle[2] += DEFAULT_VIEWHEIGHT;
ADDRLP4 28
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
CNSTF4 1104150528
ADDF4
ASGNF4
line 2488
;2488:	}
LABELV $1360
line 2490
;2489:
;2490:	VectorMA( muzzle, 14, forward, muzzle );
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 32
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 36
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2492
;2491:
;2492:	return qtrue;
CNSTI4 1
RETI4
LABELV $1348
endproc CG_CalcMuzzlePoint 40 16
export CG_Bullet
proc CG_Bullet 96 28
line 2503
;2493:
;2494:}
;2495:
;2496:/*
;2497:======================
;2498:CG_Bullet
;2499:
;2500:Renders bullet effects.
;2501:======================
;2502:*/
;2503:void CG_Bullet( vec3_t end, int sourceEntityNum, vec3_t normal, qboolean flesh, int fleshEntityNum ) {
line 2510
;2504:	trace_t trace;
;2505:	int sourceContentType, destContentType;
;2506:	vec3_t		start;
;2507:
;2508:	// if the shooter is currently valid, calc a source point and possibly
;2509:	// do trail effects
;2510:	if ( sourceEntityNum >= 0 && cg_tracerChance.value > 0 ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
LTI4 $1365
ADDRGP4 cg_tracerChance+8
INDIRF4
CNSTF4 0
LEF4 $1365
line 2511
;2511:		if ( CG_CalcMuzzlePoint( sourceEntityNum, start ) ) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRGP4 CG_CalcMuzzlePoint
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $1368
line 2512
;2512:			sourceContentType = trap_CM_PointContents( start, 0 );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 80
ADDRGP4 trap_CM_PointContents
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 80
INDIRI4
ASGNI4
line 2513
;2513:			destContentType = trap_CM_PointContents( end, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 84
ADDRGP4 trap_CM_PointContents
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 84
INDIRI4
ASGNI4
line 2516
;2514:
;2515:			// do a complete bubble trail if necessary
;2516:			if ( ( sourceContentType == destContentType ) && ( sourceContentType & CONTENTS_WATER ) ) {
ADDRLP4 88
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 88
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $1370
ADDRLP4 88
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $1370
line 2517
;2517:				CG_BubbleTrail( start, end, 32 );
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1107296256
ARGF4
ADDRGP4 CG_BubbleTrail
CALLV
pop
line 2518
;2518:			}
ADDRGP4 $1371
JUMPV
LABELV $1370
line 2520
;2519:			// bubble trail from water into air
;2520:			else if ( ( sourceContentType & CONTENTS_WATER ) ) {
ADDRLP4 12
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $1372
line 2521
;2521:				trap_CM_BoxTrace( &trace, end, start, NULL, NULL, 0, CONTENTS_WATER );
ADDRLP4 20
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 92
CNSTP4 0
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 32
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
line 2522
;2522:				CG_BubbleTrail( start, trace.endpos, 32 );
ADDRLP4 0
ARGP4
ADDRLP4 20+12
ARGP4
CNSTF4 1107296256
ARGF4
ADDRGP4 CG_BubbleTrail
CALLV
pop
line 2523
;2523:			}
ADDRGP4 $1373
JUMPV
LABELV $1372
line 2525
;2524:			// bubble trail from air into water
;2525:			else if ( ( destContentType & CONTENTS_WATER ) ) {
ADDRLP4 16
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $1375
line 2526
;2526:				trap_CM_BoxTrace( &trace, start, end, NULL, NULL, 0, CONTENTS_WATER );
ADDRLP4 20
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 92
CNSTP4 0
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 32
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
line 2527
;2527:				CG_BubbleTrail( trace.endpos, end, 32 );
ADDRLP4 20+12
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1107296256
ARGF4
ADDRGP4 CG_BubbleTrail
CALLV
pop
line 2528
;2528:			}
LABELV $1375
LABELV $1373
LABELV $1371
line 2531
;2529:
;2530:			// draw a tracer
;2531:			if ( random() < cg_tracerChance.value ) {
ADDRLP4 92
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRGP4 cg_tracerChance+8
INDIRF4
GEF4 $1378
line 2532
;2532:				CG_Tracer( start, end );
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Tracer
CALLV
pop
line 2533
;2533:			}
LABELV $1378
line 2534
;2534:		}
LABELV $1368
line 2535
;2535:	}
LABELV $1365
line 2538
;2536:
;2537:	// impact splash and mark
;2538:	if ( flesh ) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $1381
line 2539
;2539:		CG_Bleed( end, fleshEntityNum );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_Bleed
CALLV
pop
line 2540
;2540:	} else {
ADDRGP4 $1382
JUMPV
LABELV $1381
line 2541
;2541:		CG_MissileHitWall( NULL, WP_MACHINEGUN, 0, end, normal, IMPACTSOUND_DEFAULT );
CNSTP4 0
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 76
INDIRI4
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 2542
;2542:	}
LABELV $1382
line 2544
;2543:
;2544:}
LABELV $1364
endproc CG_Bullet 96 28
export CG_ScannerOn_f
proc CG_ScannerOn_f 0 0
line 2553
;2545:
;2546:// Shafe - Trep Radar Functions Below
;2547:    /*
;2548:    =====================
;2549:    CG_ScannerOn_f - turns on the scanner
;2550:    =====================
;2551:    */
;2552:    void CG_ScannerOn_f( void )
;2553:    {
line 2556
;2554:        // This is now a toggle	
;2555:			
;2556:		if (cg.scanner == 1)
ADDRGP4 cg+157964
INDIRI4
CNSTI4 1
NEI4 $1384
line 2557
;2557:		{
line 2558
;2558:			cg.scanner = 0;
ADDRGP4 cg+157964
CNSTI4 0
ASGNI4
line 2559
;2559:		}
ADDRGP4 $1385
JUMPV
LABELV $1384
line 2561
;2560:		else
;2561:		{
line 2562
;2562:			cg.scanner = 1;
ADDRGP4 cg+157964
CNSTI4 1
ASGNI4
line 2563
;2563:		}
LABELV $1385
line 2567
;2564:		
;2565:
;2566:		
;2567:    }
LABELV $1383
endproc CG_ScannerOn_f 0 0
export CG_ScannerOff_f
proc CG_ScannerOff_f 0 0
line 2575
;2568:
;2569:    /*
;2570:    =====================
;2571:    CG_ScannerOff_f - turns off the scanner
;2572:    =====================
;2573:    */
;2574:    void CG_ScannerOff_f( void )
;2575:    {
line 2579
;2576:
;2577:		//	cg.scanner = 1;
;2578:		
;2579:    } 
LABELV $1389
endproc CG_ScannerOff_f 0 0
import CG_DrawScanner
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
LABELV $979
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 100
byte 1 101
byte 1 49
byte 1 0
align 1
LABELV $892
byte 1 67
byte 1 71
byte 1 95
byte 1 70
byte 1 105
byte 1 114
byte 1 101
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 45
byte 1 62
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 32
byte 1 62
byte 1 61
byte 1 32
byte 1 87
byte 1 80
byte 1 95
byte 1 78
byte 1 85
byte 1 77
byte 1 95
byte 1 87
byte 1 69
byte 1 65
byte 1 80
byte 1 79
byte 1 78
byte 1 83
byte 1 0
align 1
LABELV $641
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $604
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
LABELV $594
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $473
byte 1 67
byte 1 71
byte 1 95
byte 1 82
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 86
byte 1 105
byte 1 115
byte 1 117
byte 1 97
byte 1 108
byte 1 115
byte 1 58
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 78
byte 1 117
byte 1 109
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 91
byte 1 48
byte 1 45
byte 1 37
byte 1 100
byte 1 93
byte 1 0
align 1
LABELV $466
byte 1 98
byte 1 102
byte 1 103
byte 1 69
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $463
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 98
byte 1 102
byte 1 103
byte 1 47
byte 1 98
byte 1 102
byte 1 103
byte 1 95
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $462
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 98
byte 1 102
byte 1 103
byte 1 47
byte 1 98
byte 1 102
byte 1 103
byte 1 95
byte 1 104
byte 1 117
byte 1 109
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $460
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 67
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $455
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 69
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $452
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 102
byte 1 49
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $451
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 114
byte 1 103
byte 1 95
byte 1 104
byte 1 117
byte 1 109
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $449
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 68
byte 1 105
byte 1 115
byte 1 99
byte 1 0
align 1
LABELV $446
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 69
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $443
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 47
byte 1 104
byte 1 121
byte 1 112
byte 1 114
byte 1 98
byte 1 102
byte 1 49
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $442
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 47
byte 1 108
byte 1 97
byte 1 115
byte 1 102
byte 1 108
byte 1 121
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $441
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 47
byte 1 100
byte 1 105
byte 1 115
byte 1 99
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $439
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 69
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $436
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 47
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 108
byte 1 102
byte 1 49
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $435
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 47
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 49
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $431
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 47
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 108
byte 1 102
byte 1 49
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $430
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 47
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 102
byte 1 108
byte 1 121
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $428
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 115
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 102
byte 1 49
byte 1 98
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $423
byte 1 98
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 69
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $420
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 103
byte 1 102
byte 1 52
byte 1 98
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $419
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 103
byte 1 102
byte 1 51
byte 1 98
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $418
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 103
byte 1 102
byte 1 50
byte 1 98
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $417
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 103
byte 1 102
byte 1 49
byte 1 98
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $415
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 108
byte 1 101
byte 1 101
byte 1 47
byte 1 102
byte 1 115
byte 1 116
byte 1 104
byte 1 117
byte 1 109
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $414
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 47
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 47
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $412
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 66
byte 1 111
byte 1 108
byte 1 116
byte 1 78
byte 1 101
byte 1 119
byte 1 0
align 1
LABELV $409
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 69
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $406
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 104
byte 1 114
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 47
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 105
byte 1 109
byte 1 112
byte 1 99
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $405
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 47
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 114
byte 1 111
byte 1 46
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $403
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 108
byte 1 101
byte 1 101
byte 1 47
byte 1 102
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 99
byte 1 107
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $402
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 108
byte 1 101
byte 1 101
byte 1 47
byte 1 102
byte 1 115
byte 1 116
byte 1 114
byte 1 117
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $398
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $395
byte 1 95
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $394
byte 1 95
byte 1 98
byte 1 97
byte 1 114
byte 1 114
byte 1 101
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $393
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $379
byte 1 67
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 0
