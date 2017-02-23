export G_TestEntityPosition
code
proc G_TestEntityPosition 68 28
file "../g_mover.c"
line 33
;1:// 2016 Trepidation Licensed under the GPL2 - Team Trepidation
;2://
;3:
;4:#include "g_local.h"
;5:
;6:
;7:
;8:/*
;9:===============================================================================
;10:
;11:PUSHMOVE
;12:
;13:===============================================================================
;14:*/
;15:
;16:void MatchTeam( gentity_t *teamLeader, int moverState, int time );
;17:
;18:typedef struct {
;19:	gentity_t	*ent;
;20:	vec3_t	origin;
;21:	vec3_t	angles;
;22:	float	deltayaw;
;23:} pushed_t;
;24:pushed_t	pushed[MAX_GENTITIES], *pushed_p;
;25:
;26:
;27:/*
;28:============
;29:G_TestEntityPosition
;30:
;31:============
;32:*/
;33:gentity_t	*G_TestEntityPosition( gentity_t *ent ) {
line 37
;34:	trace_t	tr;
;35:	int		mask;
;36:
;37:	if ( ent->clipmask ) {
ADDRFP4 0
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
CNSTI4 0
EQI4 $57
line 38
;38:		mask = ent->clipmask;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
ASGNI4
line 39
;39:	} else {
ADDRGP4 $58
JUMPV
LABELV $57
line 40
;40:		mask = MASK_SOLID;
ADDRLP4 56
CNSTI4 1
ASGNI4
line 41
;41:	}
LABELV $58
line 42
;42:	if ( ent->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $59
line 43
;43:		trap_Trace( &tr, ent->client->ps.origin, ent->r.mins, ent->r.maxs, ent->client->ps.origin, ent->s.number, mask );
ADDRLP4 0
ARGP4
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 60
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 444
ADDP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 456
ADDP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
INDIRI4
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 44
;44:	} else {
ADDRGP4 $60
JUMPV
LABELV $59
line 45
;45:		trap_Trace( &tr, ent->s.pos.trBase, ent->r.mins, ent->r.maxs, ent->s.pos.trBase, ent->s.number, mask );
ADDRLP4 0
ARGP4
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 60
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 444
ADDP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 456
ADDP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
INDIRI4
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 46
;46:	}
LABELV $60
line 48
;47:	
;48:	if (tr.startsolid)
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $61
line 49
;49:		return &g_entities[ tr.entityNum ];
CNSTI4 924
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
RETP4
ADDRGP4 $56
JUMPV
LABELV $61
line 51
;50:		
;51:	return NULL;
CNSTP4 0
RETP4
LABELV $56
endproc G_TestEntityPosition 68 28
export G_CreateRotationMatrix
proc G_CreateRotationMatrix 4 16
line 59
;52:}
;53:
;54:/*
;55:================
;56:G_CreateRotationMatrix
;57:================
;58:*/
;59:void G_CreateRotationMatrix(vec3_t angles, vec3_t matrix[3]) {
line 60
;60:	AngleVectors(angles, matrix[0], matrix[1], matrix[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 61
;61:	VectorInverse(matrix[1]);
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 VectorInverse
CALLV
pop
line 62
;62:}
LABELV $65
endproc G_CreateRotationMatrix 4 16
export G_TransposeMatrix
proc G_TransposeMatrix 24 0
line 69
;63:
;64:/*
;65:================
;66:G_TransposeMatrix
;67:================
;68:*/
;69:void G_TransposeMatrix(vec3_t matrix[3], vec3_t transpose[3]) {
line 71
;70:	int i, j;
;71:	for (i = 0; i < 3; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $67
line 72
;72:		for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $71
line 73
;73:			transpose[i][j] = matrix[j][i];
ADDRLP4 12
CNSTI4 2
ASGNI4
ADDRLP4 16
CNSTI4 12
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
LSHI4
ADDRLP4 16
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
LSHI4
ADDRLP4 16
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
ADDP4
ADDP4
INDIRF4
ASGNF4
line 74
;74:		}
LABELV $72
line 72
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $71
line 75
;75:	}
LABELV $68
line 71
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $67
line 76
;76:}
LABELV $66
endproc G_TransposeMatrix 24 0
export G_RotatePoint
proc G_RotatePoint 24 0
line 83
;77:
;78:/*
;79:================
;80:G_RotatePoint
;81:================
;82:*/
;83:void G_RotatePoint(vec3_t point, vec3_t matrix[3]) {
line 86
;84:	vec3_t tvec;
;85:
;86:	VectorCopy(point, tvec);
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 87
;87:	point[0] = DotProduct(matrix[0], tvec);
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 88
;88:	point[1] = DotProduct(matrix[1], tvec);
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 16
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 16
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 89
;89:	point[2] = DotProduct(matrix[2], tvec);
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 20
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 90
;90:}
LABELV $75
endproc G_RotatePoint 24 0
export G_TryPushingEntity
proc G_TryPushingEntity 172 8
line 99
;91:
;92:/*
;93:==================
;94:G_TryPushingEntity
;95:
;96:Returns qfalse if the move is blocked
;97:==================
;98:*/
;99:qboolean	G_TryPushingEntity( gentity_t *check, gentity_t *pusher, vec3_t move, vec3_t amove ) {
line 106
;100:	vec3_t		matrix[3], transpose[3];
;101:	vec3_t		org, org2, move2;
;102:	gentity_t	*block;
;103:
;104:	// EF_MOVER_STOP will just stop when contacting another entity
;105:	// instead of pushing it, but entities can still ride on top of it
;106:	if ( ( pusher->s.eFlags & EF_MOVER_STOP ) && 
ADDRLP4 112
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $83
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRLP4 112
INDIRP4
INDIRI4
EQI4 $83
line 107
;107:		check->s.groundEntityNum != pusher->s.number ) {
line 108
;108:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $82
JUMPV
LABELV $83
line 112
;109:	}
;110:
;111:	// save off the old position
;112:	if (pushed_p > &pushed[MAX_GENTITIES]) {
ADDRGP4 pushed_p
INDIRP4
CVPU4 4
ADDRGP4 pushed+32768
CVPU4 4
LEU4 $85
line 113
;113:		G_Error( "pushed_p > &pushed[MAX_GENTITIES]" );
ADDRGP4 $88
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 114
;114:	}
LABELV $85
line 115
;115:	pushed_p->ent = check;
ADDRGP4 pushed_p
INDIRP4
ADDRFP4 0
INDIRP4
ASGNP4
line 116
;116:	VectorCopy (check->s.pos.trBase, pushed_p->origin);
ADDRGP4 pushed_p
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 117
;117:	VectorCopy (check->s.apos.trBase, pushed_p->angles);
ADDRGP4 pushed_p
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 118
;118:	if ( check->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $89
line 119
;119:		pushed_p->deltayaw = check->client->ps.delta_angles[YAW];
ADDRGP4 pushed_p
INDIRP4
CNSTI4 28
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 120
;120:		VectorCopy (check->client->ps.origin, pushed_p->origin);
ADDRGP4 pushed_p
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 121
;121:	}
LABELV $89
line 122
;122:	pushed_p++;
ADDRLP4 116
ADDRGP4 pushed_p
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
line 126
;123:
;124:	// try moving the contacted entity 
;125:	// figure movement due to the pusher's amove
;126:	G_CreateRotationMatrix( amove, transpose );
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 76
ARGP4
ADDRGP4 G_CreateRotationMatrix
CALLV
pop
line 127
;127:	G_TransposeMatrix( transpose, matrix );
ADDRLP4 76
ARGP4
ADDRLP4 40
ARGP4
ADDRGP4 G_TransposeMatrix
CALLV
pop
line 128
;128:	if ( check->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $91
line 129
;129:		VectorSubtract (check->client->ps.origin, pusher->r.currentOrigin, org);
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ASGNP4
ADDRLP4 124
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 120
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 124
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 120
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 124
INDIRP4
CNSTI4 500
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 504
ADDP4
INDIRF4
SUBF4
ASGNF4
line 130
;130:	}
ADDRGP4 $92
JUMPV
LABELV $91
line 131
;131:	else {
line 132
;132:		VectorSubtract (check->s.pos.trBase, pusher->r.currentOrigin, org);
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 120
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 124
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 120
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 124
INDIRP4
CNSTI4 500
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 504
ADDP4
INDIRF4
SUBF4
ASGNF4
line 133
;133:	}
LABELV $92
line 134
;134:	VectorCopy( org, org2 );
ADDRLP4 24
ADDRLP4 12
INDIRB
ASGNB 12
line 135
;135:	G_RotatePoint( org2, matrix );
ADDRLP4 24
ARGP4
ADDRLP4 40
ARGP4
ADDRGP4 G_RotatePoint
CALLV
pop
line 136
;136:	VectorSubtract (org2, org, move2);
ADDRLP4 0
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 24+4
INDIRF4
ADDRLP4 12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 24+8
INDIRF4
ADDRLP4 12+8
INDIRF4
SUBF4
ASGNF4
line 138
;137:	// add movement
;138:	VectorAdd (check->s.pos.trBase, move, check->s.pos.trBase);
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 124
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 124
INDIRP4
ADDRLP4 124
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 128
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 128
INDIRP4
ADDRLP4 128
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 139
;139:	VectorAdd (check->s.pos.trBase, move2, check->s.pos.trBase);
ADDRLP4 132
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
ADDRLP4 136
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 140
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDF4
ASGNF4
line 140
;140:	if ( check->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $105
line 141
;141:		VectorAdd (check->client->ps.origin, move, check->client->ps.origin);
ADDRLP4 144
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 148
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 148
INDIRP4
ADDRLP4 148
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 142
;142:		VectorAdd (check->client->ps.origin, move2, check->client->ps.origin);
ADDRLP4 156
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
ADDRLP4 160
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 164
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 164
INDIRP4
ADDRLP4 164
INDIRP4
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDF4
ASGNF4
line 144
;143:		// make sure the client's view rotates when on a rotating mover
;144:		check->client->ps.delta_angles[YAW] += ANGLE2SHORT(amove[YAW]);
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRI4
CNSTF4 1199570944
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ADDI4
ASGNI4
line 145
;145:	}
LABELV $105
line 148
;146:
;147:	// may have pushed them off an edge
;148:	if ( check->s.groundEntityNum != pusher->s.number ) {
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
INDIRI4
EQI4 $109
line 149
;149:		check->s.groundEntityNum = -1;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 -1
ASGNI4
line 150
;150:	}
LABELV $109
line 152
;151:
;152:	block = G_TestEntityPosition( check );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 G_TestEntityPosition
CALLP4
ASGNP4
ADDRLP4 36
ADDRLP4 144
INDIRP4
ASGNP4
line 153
;153:	if (!block) {
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $111
line 155
;154:		// pushed ok
;155:		if ( check->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $113
line 156
;156:			VectorCopy( check->client->ps.origin, check->r.currentOrigin );
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 148
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 157
;157:		} else {
ADDRGP4 $114
JUMPV
LABELV $113
line 158
;158:			VectorCopy( check->s.pos.trBase, check->r.currentOrigin );
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 148
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 159
;159:		}
LABELV $114
line 160
;160:		trap_LinkEntity (check);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 161
;161:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $111
line 167
;162:	}
;163:
;164:	// if it is ok to leave in the old position, do it
;165:	// this is only relevent for riding entities, not pushed
;166:	// Sliding trapdoors can cause this.
;167:	VectorCopy( (pushed_p-1)->origin, check->s.pos.trBase);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRGP4 pushed_p
INDIRP4
CNSTI4 -28
ADDP4
INDIRB
ASGNB 12
line 168
;168:	if ( check->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $115
line 169
;169:		VectorCopy( (pushed_p-1)->origin, check->client->ps.origin);
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ADDRGP4 pushed_p
INDIRP4
CNSTI4 -28
ADDP4
INDIRB
ASGNB 12
line 170
;170:	}
LABELV $115
line 171
;171:	VectorCopy( (pushed_p-1)->angles, check->s.apos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 pushed_p
INDIRP4
CNSTI4 -16
ADDP4
INDIRB
ASGNB 12
line 172
;172:	block = G_TestEntityPosition (check);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 148
ADDRGP4 G_TestEntityPosition
CALLP4
ASGNP4
ADDRLP4 36
ADDRLP4 148
INDIRP4
ASGNP4
line 173
;173:	if ( !block ) {
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $117
line 174
;174:		check->s.groundEntityNum = -1;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 -1
ASGNI4
line 175
;175:		pushed_p--;
ADDRLP4 152
ADDRGP4 pushed_p
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRP4
CNSTI4 -32
ADDP4
ASGNP4
line 176
;176:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $117
line 180
;177:	}
;178:
;179:	// blocked
;180:	return qfalse;
CNSTI4 0
RETI4
LABELV $82
endproc G_TryPushingEntity 172 8
export G_CheckProxMinePosition
proc G_CheckProxMinePosition 108 28
line 188
;181:}
;182:
;183:/*
;184:==================
;185:G_CheckProxMinePosition
;186:==================
;187:*/
;188:qboolean G_CheckProxMinePosition( gentity_t *check ) {
line 192
;189:	vec3_t		start, end;
;190:	trace_t	tr;
;191:
;192:	VectorMA(check->s.pos.trBase, 0.125, check->movedir, start);
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
CNSTF4 1040187392
ASGNF4
ADDRLP4 0
ADDRLP4 80
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 84
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 692
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 80
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 84
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 696
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 88
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 1040187392
ADDRLP4 88
INDIRP4
CNSTI4 700
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 193
;193:	VectorMA(check->s.pos.trBase, 2, check->movedir, end);
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
CNSTF4 1073741824
ASGNF4
ADDRLP4 12
ADDRLP4 92
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 96
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 692
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 92
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 96
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 696
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12+8
ADDRLP4 100
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 1073741824
ADDRLP4 100
INDIRP4
CNSTI4 700
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 194
;194:	trap_Trace( &tr, start, NULL, NULL, end, check->s.number, MASK_SOLID );
ADDRLP4 24
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 104
CNSTP4 0
ASGNP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 196
;195:	
;196:	if (tr.startsolid || tr.fraction < 1)
ADDRLP4 24+4
INDIRI4
CNSTI4 0
NEI4 $128
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
GEF4 $124
LABELV $128
line 197
;197:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $119
JUMPV
LABELV $124
line 199
;198:
;199:	return qtrue;
CNSTI4 1
RETI4
LABELV $119
endproc G_CheckProxMinePosition 108 28
export G_TryPushingProxMine
proc G_TryPushingProxMine 120 16
line 207
;200:}
;201:
;202:/*
;203:==================
;204:G_TryPushingProxMine
;205:==================
;206:*/
;207:qboolean G_TryPushingProxMine( gentity_t *check, gentity_t *pusher, vec3_t move, vec3_t amove ) {
line 213
;208:	vec3_t		forward, right, up;
;209:	vec3_t		org, org2, move2;
;210:	int ret;
;211:
;212:	// we need this for pushing things later
;213:	VectorSubtract (vec3_origin, amove, org);
ADDRLP4 76
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 0
ADDRGP4 vec3_origin
INDIRF4
ADDRLP4 76
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRGP4 vec3_origin+4
INDIRF4
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 vec3_origin+8
INDIRF4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 214
;214:	AngleVectors (org, forward, right, up);
ADDRLP4 0
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 60
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 217
;215:
;216:	// try moving the contacted entity 
;217:	VectorAdd (check->s.pos.trBase, move, check->s.pos.trBase);
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 220
;218:
;219:	// figure movement due to the pusher's amove
;220:	VectorSubtract (check->s.pos.trBase, pusher->r.currentOrigin, org);
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 92
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 92
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 500
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 504
ADDP4
INDIRF4
SUBF4
ASGNF4
line 221
;221:	org2[0] = DotProduct (org, forward);
ADDRLP4 12
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 222
;222:	org2[1] = -DotProduct (org, right);
ADDRLP4 12+4
ADDRLP4 0
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 48+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 48+8
INDIRF4
MULF4
ADDF4
NEGF4
ASGNF4
line 223
;223:	org2[2] = DotProduct (org, up);
ADDRLP4 12+8
ADDRLP4 0
INDIRF4
ADDRLP4 60
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 60+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 60+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 224
;224:	VectorSubtract (org2, org, move2);
ADDRLP4 24
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 225
;225:	VectorAdd (check->s.pos.trBase, move2, check->s.pos.trBase);
ADDRLP4 100
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRF4
ADDRLP4 24
INDIRF4
ADDF4
ASGNF4
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRF4
ADDRLP4 24+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRF4
ADDRLP4 24+8
INDIRF4
ADDF4
ASGNF4
line 227
;226:
;227:	ret = G_CheckProxMinePosition( check );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 G_CheckProxMinePosition
CALLI4
ASGNI4
ADDRLP4 72
ADDRLP4 112
INDIRI4
ASGNI4
line 228
;228:	if (ret) {
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $158
line 229
;229:		VectorCopy( check->s.pos.trBase, check->r.currentOrigin );
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 116
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 230
;230:		trap_LinkEntity (check);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 231
;231:	}
LABELV $158
line 232
;232:	return ret;
ADDRLP4 72
INDIRI4
RETI4
LABELV $129
endproc G_TryPushingProxMine 120 16
export G_MoverPush
proc G_MoverPush 4240 32
line 246
;233:}
;234:
;235:void G_ExplodeMissile( gentity_t *ent );
;236:
;237:/*
;238:============
;239:G_MoverPush
;240:
;241:Objects need to be moved back on a failed push,
;242:otherwise riders would continue to slide.
;243:If qfalse is returned, *obstacle will be the blocking entity
;244:============
;245:*/
;246:qboolean G_MoverPush( gentity_t *pusher, vec3_t move, vec3_t amove, gentity_t **obstacle ) {
line 255
;247:	int			i, e;
;248:	gentity_t	*check;
;249:	vec3_t		mins, maxs;
;250:	pushed_t	*p;
;251:	int			entityList[MAX_GENTITIES];
;252:	int			listedEntities;
;253:	vec3_t		totalMins, totalMaxs;
;254:
;255:	*obstacle = NULL;
ADDRFP4 12
INDIRP4
CNSTP4 0
ASGNP4
line 260
;256:
;257:
;258:	// mins/maxs are the bounds at the destination
;259:	// totalMins / totalMaxs are the bounds for the entire move
;260:	if ( pusher->r.currentAngles[0] || pusher->r.currentAngles[1] || pusher->r.currentAngles[2]
ADDRLP4 4164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4168
CNSTF4 0
ASGNF4
ADDRLP4 4164
INDIRP4
CNSTI4 508
ADDP4
INDIRF4
ADDRLP4 4168
INDIRF4
NEF4 $167
ADDRLP4 4164
INDIRP4
CNSTI4 512
ADDP4
INDIRF4
ADDRLP4 4168
INDIRF4
NEF4 $167
ADDRLP4 4164
INDIRP4
CNSTI4 516
ADDP4
INDIRF4
ADDRLP4 4168
INDIRF4
NEF4 $167
ADDRLP4 4172
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 4172
INDIRP4
INDIRF4
ADDRLP4 4168
INDIRF4
NEF4 $167
ADDRLP4 4172
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4168
INDIRF4
NEF4 $167
ADDRLP4 4172
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 4168
INDIRF4
EQF4 $161
LABELV $167
line 261
;261:		|| amove[0] || amove[1] || amove[2] ) {
line 264
;262:		float		radius;
;263:
;264:		radius = RadiusFromBounds( pusher->r.mins, pusher->r.maxs );
ADDRLP4 4180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4180
INDIRP4
CNSTI4 444
ADDP4
ARGP4
ADDRLP4 4180
INDIRP4
CNSTI4 456
ADDP4
ARGP4
ADDRLP4 4184
ADDRGP4 RadiusFromBounds
CALLF4
ASGNF4
ADDRLP4 4176
ADDRLP4 4184
INDIRF4
ASGNF4
line 265
;265:		for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $168
line 266
;266:			mins[i] = pusher->r.currentOrigin[i] + move[i] - radius;
ADDRLP4 4188
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4188
INDIRI4
ADDRLP4 16
ADDP4
ADDRLP4 4188
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDP4
INDIRF4
ADDRLP4 4188
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDF4
ADDRLP4 4176
INDIRF4
SUBF4
ASGNF4
line 267
;267:			maxs[i] = pusher->r.currentOrigin[i] + move[i] + radius;
ADDRLP4 4192
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4192
INDIRI4
ADDRLP4 28
ADDP4
ADDRLP4 4192
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDP4
INDIRF4
ADDRLP4 4192
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDF4
ADDRLP4 4176
INDIRF4
ADDF4
ASGNF4
line 268
;268:			totalMins[i] = mins[i] - move[i];
ADDRLP4 4196
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4196
INDIRI4
ADDRLP4 4140
ADDP4
ADDRLP4 4196
INDIRI4
ADDRLP4 16
ADDP4
INDIRF4
ADDRLP4 4196
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 269
;269:			totalMaxs[i] = maxs[i] - move[i];
ADDRLP4 4200
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4200
INDIRI4
ADDRLP4 4152
ADDP4
ADDRLP4 4200
INDIRI4
ADDRLP4 28
ADDP4
INDIRF4
ADDRLP4 4200
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 270
;270:		}
LABELV $169
line 265
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $168
line 271
;271:	} else {
ADDRGP4 $162
JUMPV
LABELV $161
line 272
;272:		for (i=0 ; i<3 ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $172
line 273
;273:			mins[i] = pusher->r.absmin[i] + move[i];
ADDRLP4 4176
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4176
INDIRI4
ADDRLP4 16
ADDP4
ADDRLP4 4176
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
ADDP4
INDIRF4
ADDRLP4 4176
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 274
;274:			maxs[i] = pusher->r.absmax[i] + move[i];
ADDRLP4 4180
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4180
INDIRI4
ADDRLP4 28
ADDP4
ADDRLP4 4180
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
ADDP4
INDIRF4
ADDRLP4 4180
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 275
;275:		}
LABELV $173
line 272
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $172
line 277
;276:
;277:		VectorCopy( pusher->r.absmin, totalMins );
ADDRLP4 4140
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRB
ASGNB 12
line 278
;278:		VectorCopy( pusher->r.absmax, totalMaxs );
ADDRLP4 4152
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
INDIRB
ASGNB 12
line 279
;279:		for (i=0 ; i<3 ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $176
line 280
;280:			if ( move[i] > 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
CNSTF4 0
LEF4 $180
line 281
;281:				totalMaxs[i] += move[i];
ADDRLP4 4176
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4180
ADDRLP4 4176
INDIRI4
ADDRLP4 4152
ADDP4
ASGNP4
ADDRLP4 4180
INDIRP4
ADDRLP4 4180
INDIRP4
INDIRF4
ADDRLP4 4176
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 282
;282:			} else {
ADDRGP4 $181
JUMPV
LABELV $180
line 283
;283:				totalMins[i] += move[i];
ADDRLP4 4176
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4180
ADDRLP4 4176
INDIRI4
ADDRLP4 4140
ADDP4
ASGNP4
ADDRLP4 4180
INDIRP4
ADDRLP4 4180
INDIRP4
INDIRF4
ADDRLP4 4176
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 284
;284:			}
LABELV $181
line 285
;285:		}
LABELV $177
line 279
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $176
line 286
;286:	}
LABELV $162
line 289
;287:
;288:	// unlink the pusher so we don't get it in the entityList
;289:	trap_UnlinkEntity( pusher );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 291
;290:
;291:	listedEntities = trap_EntitiesInBox( totalMins, totalMaxs, entityList, MAX_GENTITIES );
ADDRLP4 4140
ARGP4
ADDRLP4 4152
ARGP4
ADDRLP4 40
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4176
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4136
ADDRLP4 4176
INDIRI4
ASGNI4
line 294
;292:
;293:	// move the pusher to it's final position
;294:	VectorAdd( pusher->r.currentOrigin, move, pusher->r.currentOrigin );
ADDRLP4 4180
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ASGNP4
ADDRLP4 4180
INDIRP4
ADDRLP4 4180
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4184
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
ASGNP4
ADDRLP4 4184
INDIRP4
ADDRLP4 4184
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4188
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
ASGNP4
ADDRLP4 4188
INDIRP4
ADDRLP4 4188
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 295
;295:	VectorAdd( pusher->r.currentAngles, amove, pusher->r.currentAngles );
ADDRLP4 4192
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ASGNP4
ADDRLP4 4192
INDIRP4
ADDRLP4 4192
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4196
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
ASGNP4
ADDRLP4 4196
INDIRP4
ADDRLP4 4196
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4200
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRLP4 4200
INDIRP4
ADDRLP4 4200
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 296
;296:	trap_LinkEntity( pusher );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 299
;297:
;298:	// see if any solid entities are inside the final position
;299:	for ( e = 0 ; e < listedEntities ; e++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $185
JUMPV
LABELV $182
line 300
;300:		check = &g_entities[ entityList[ e ] ];
ADDRLP4 8
CNSTI4 924
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 40
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 339
;301:
;302:#ifdef MISSIONPACK
;303:		if ( check->s.eType == ET_MISSILE ) {
;304:			// if it is a prox mine
;305:			if ( !strcmp(check->classname, "prox mine") ) {
;306:				// if this prox mine is attached to this mover try to move it with the pusher
;307:				if ( check->enemy == pusher ) {
;308:					if (!G_TryPushingProxMine( check, pusher, move, amove )) {
;309:						//explode
;310:						check->s.loopSound = 0;
;311:						G_AddEvent( check, EV_PROXIMITY_MINE_TRIGGER, 0 );
;312:						G_ExplodeMissile(check);
;313:						if (check->activator) {
;314:							G_FreeEntity(check->activator);
;315:							check->activator = NULL;
;316:						}
;317:						//G_Printf("prox mine explodes\n");
;318:					}
;319:				}
;320:				else {
;321:					//check if the prox mine is crushed by the mover
;322:					if (!G_CheckProxMinePosition( check )) {
;323:						//explode
;324:						check->s.loopSound = 0;
;325:						G_AddEvent( check, EV_PROXIMITY_MINE_TRIGGER, 0 );
;326:						G_ExplodeMissile(check);
;327:						if (check->activator) {
;328:							G_FreeEntity(check->activator);
;329:							check->activator = NULL;
;330:						}
;331:						//G_Printf("prox mine explodes\n");
;332:					}
;333:				}
;334:				continue;
;335:			}
;336:		}
;337:#endif
;338:		// only push items and players
;339:		if ( check->s.eType != ET_ITEM && check->s.eType != ET_PLAYER && !check->physicsObject ) {
ADDRLP4 4208
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4208
INDIRI4
CNSTI4 2
EQI4 $186
ADDRLP4 4208
INDIRI4
CNSTI4 1
EQI4 $186
ADDRLP4 8
INDIRP4
CNSTI4 572
ADDP4
INDIRI4
CNSTI4 0
NEI4 $186
line 340
;340:			continue;
ADDRGP4 $183
JUMPV
LABELV $186
line 344
;341:		}
;342:
;343:		// if the entity is standing on the pusher, it will definitely be moved
;344:		if ( check->s.groundEntityNum != pusher->s.number ) {
ADDRLP4 8
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $188
line 346
;345:			// see if the ent needs to be tested
;346:			if ( check->r.absmin[0] >= maxs[0]
ADDRLP4 8
INDIRP4
CNSTI4 472
ADDP4
INDIRF4
ADDRLP4 28
INDIRF4
GEF4 $200
ADDRLP4 8
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
ADDRLP4 28+4
INDIRF4
GEF4 $200
ADDRLP4 8
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ADDRLP4 28+8
INDIRF4
GEF4 $200
ADDRLP4 8
INDIRP4
CNSTI4 484
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $200
ADDRLP4 8
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 16+4
INDIRF4
LEF4 $200
ADDRLP4 8
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 16+8
INDIRF4
GTF4 $190
LABELV $200
line 351
;347:			|| check->r.absmin[1] >= maxs[1]
;348:			|| check->r.absmin[2] >= maxs[2]
;349:			|| check->r.absmax[0] <= mins[0]
;350:			|| check->r.absmax[1] <= mins[1]
;351:			|| check->r.absmax[2] <= mins[2] ) {
line 352
;352:				continue;
ADDRGP4 $183
JUMPV
LABELV $190
line 356
;353:			}
;354:			// see if the ent's bbox is inside the pusher's final position
;355:			// this does allow a fast moving object to pass through a thin entity...
;356:			if (!G_TestEntityPosition (check)) {
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4216
ADDRGP4 G_TestEntityPosition
CALLP4
ASGNP4
ADDRLP4 4216
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $201
line 357
;357:				continue;
ADDRGP4 $183
JUMPV
LABELV $201
line 359
;358:			}
;359:		}
LABELV $188
line 362
;360:
;361:		// the entity needs to be pushed
;362:		if ( G_TryPushingEntity( check, pusher, move, amove ) ) {
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4212
ADDRGP4 G_TryPushingEntity
CALLI4
ASGNI4
ADDRLP4 4212
INDIRI4
CNSTI4 0
EQI4 $203
line 363
;363:			continue;
ADDRGP4 $183
JUMPV
LABELV $203
line 369
;364:		}
;365:
;366:		// the move was blocked an entity
;367:
;368:		// bobbing entities are instant-kill and never get blocked
;369:		if ( pusher->s.pos.trType == TR_SINE || pusher->s.apos.trType == TR_SINE ) {
ADDRLP4 4216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4220
CNSTI4 4
ASGNI4
ADDRLP4 4216
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 4220
INDIRI4
EQI4 $207
ADDRLP4 4216
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ADDRLP4 4220
INDIRI4
NEI4 $205
LABELV $207
line 370
;370:			G_Damage( check, pusher, pusher, NULL, NULL, 99999, 0, MOD_CRUSH );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4224
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4224
INDIRP4
ARGP4
ADDRLP4 4224
INDIRP4
ARGP4
ADDRLP4 4228
CNSTP4 0
ASGNP4
ADDRLP4 4228
INDIRP4
ARGP4
ADDRLP4 4228
INDIRP4
ARGP4
CNSTI4 99999
ARGI4
CNSTI4 0
ARGI4
CNSTI4 17
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 371
;371:			continue;
ADDRGP4 $183
JUMPV
LABELV $205
line 376
;372:		}
;373:
;374:		
;375:		// save off the obstacle so we can call the block function (crush, etc)
;376:		*obstacle = check;
ADDRFP4 12
INDIRP4
ADDRLP4 8
INDIRP4
ASGNP4
line 381
;377:
;378:		// move back any entities we already moved
;379:		// go backwards, so if the same entity was pushed
;380:		// twice, it goes back to the original position
;381:		for ( p=pushed_p-1 ; p>=pushed ; p-- ) {
ADDRLP4 0
ADDRGP4 pushed_p
INDIRP4
CNSTI4 -32
ADDP4
ASGNP4
ADDRGP4 $211
JUMPV
LABELV $208
line 382
;382:			VectorCopy (p->origin, p->ent->s.pos.trBase);
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRB
ASGNB 12
line 383
;383:			VectorCopy (p->angles, p->ent->s.apos.trBase);
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRB
ASGNB 12
line 384
;384:			if ( p->ent->client ) {
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $212
line 385
;385:				p->ent->client->ps.delta_angles[YAW] = p->deltayaw;
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 386
;386:				VectorCopy (p->origin, p->ent->client->ps.origin);
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRB
ASGNB 12
line 387
;387:			}
LABELV $212
line 388
;388:			trap_LinkEntity (p->ent);
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 389
;389:		}
LABELV $209
line 381
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 -32
ADDP4
ASGNP4
LABELV $211
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 pushed
CVPU4 4
GEU4 $208
line 390
;390:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $160
JUMPV
LABELV $183
line 299
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $185
ADDRLP4 12
INDIRI4
ADDRLP4 4136
INDIRI4
LTI4 $182
line 393
;391:	}
;392:
;393:	return qtrue;
CNSTI4 1
RETI4
LABELV $160
endproc G_MoverPush 4240 32
export G_MoverTeam
proc G_MoverTeam 72 16
line 402
;394:}
;395:
;396:
;397:/*
;398:=================
;399:G_MoverTeam
;400:=================
;401:*/
;402:void G_MoverTeam( gentity_t *ent ) {
line 407
;403:	vec3_t		move, amove;
;404:	gentity_t	*part, *obstacle;
;405:	vec3_t		origin, angles;
;406:
;407:	obstacle = NULL;
ADDRLP4 52
CNSTP4 0
ASGNP4
line 412
;408:
;409:	// make sure all team slaves can move before commiting
;410:	// any moves or calling any think functions
;411:	// if the move is blocked, all moved objects will be backed out
;412:	pushed_p = pushed;
ADDRGP4 pushed_p
ADDRGP4 pushed
ASGNP4
line 413
;413:	for (part = ent ; part ; part=part->teamchain) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $218
JUMPV
LABELV $215
line 415
;414:		// get current position
;415:		BG_EvaluateTrajectory( &part->s.pos, level.time, origin );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 28
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 416
;416:		BG_EvaluateTrajectory( &part->s.apos, level.time, angles );
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 40
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 417
;417:		VectorSubtract( origin, part->r.currentOrigin, move );
ADDRLP4 4
ADDRLP4 28
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 28+4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 500
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 28+8
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRF4
SUBF4
ASGNF4
line 418
;418:		VectorSubtract( angles, part->r.currentAngles, amove );
ADDRLP4 16
ADDRLP4 40
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 40+4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 40+8
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRF4
SUBF4
ASGNF4
line 419
;419:		if ( !G_MoverPush( part, move, amove, &obstacle ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 64
ADDRGP4 G_MoverPush
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $229
line 420
;420:			break;	// move was blocked
ADDRGP4 $217
JUMPV
LABELV $229
line 422
;421:		}
;422:	}
LABELV $216
line 413
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRP4
ASGNP4
LABELV $218
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $215
LABELV $217
line 424
;423:
;424:	if (part) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $231
line 426
;425:		// go back to the previous position
;426:		for ( part = ent ; part ; part = part->teamchain ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $236
JUMPV
LABELV $233
line 427
;427:			part->s.pos.trTime += level.time - level.previousTime;
ADDRLP4 56
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+36
INDIRI4
SUBI4
ADDI4
ASGNI4
line 428
;428:			part->s.apos.trTime += level.time - level.previousTime;
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+36
INDIRI4
SUBI4
ADDI4
ASGNI4
line 429
;429:			BG_EvaluateTrajectory( &part->s.pos, level.time, part->r.currentOrigin );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 430
;430:			BG_EvaluateTrajectory( &part->s.apos, level.time, part->r.currentAngles );
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 431
;431:			trap_LinkEntity( part );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 432
;432:		}
LABELV $234
line 426
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRP4
ASGNP4
LABELV $236
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $233
line 435
;433:
;434:		// if the pusher has a "blocked" function, call it
;435:		if (ent->blocked) {
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $214
line 436
;436:			ent->blocked( ent, obstacle );
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
CNSTI4 724
ADDP4
INDIRP4
CALLV
pop
line 437
;437:		}
line 438
;438:		return;
ADDRGP4 $214
JUMPV
LABELV $231
line 442
;439:	}
;440:
;441:	// the move succeeded
;442:	for ( part = ent ; part ; part = part->teamchain ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $248
JUMPV
LABELV $245
line 444
;443:		// call the reached function if time is at or past end point
;444:		if ( part->s.pos.trType == TR_LINEAR_STOP ) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 3
NEI4 $249
line 445
;445:			if ( level.time >= part->s.pos.trTime + part->s.pos.trDuration ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDI4
LTI4 $251
line 446
;446:				if ( part->reached ) {
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $254
line 447
;447:					part->reached( part );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
CALLV
pop
line 448
;448:				}
LABELV $254
line 449
;449:			}
LABELV $251
line 450
;450:		}
LABELV $249
line 451
;451:		if ( part->s.apos.trType == TR_LINEAR_STOP ) {
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 3
NEI4 $256
line 452
;452:			if ( level.time >= part->s.apos.trTime + part->s.apos.trDuration ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ADDI4
LTI4 $258
line 453
;453:				if ( part->reached ) {
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $261
line 454
;454:					part->reached( part );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
CALLV
pop
line 455
;455:				}
LABELV $261
line 456
;456:			}
LABELV $258
line 457
;457:		}
LABELV $256
line 458
;458:	}
LABELV $246
line 442
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRP4
ASGNP4
LABELV $248
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $245
line 459
;459:}
LABELV $214
endproc G_MoverTeam 72 16
export G_RunMover
proc G_RunMover 8 4
line 467
;460:
;461:/*
;462:================
;463:G_RunMover
;464:
;465:================
;466:*/
;467:void G_RunMover( gentity_t *ent ) {
line 470
;468:	// if not a team captain, don't do anything, because
;469:	// the captain will handle everything
;470:	if ( ent->flags & FL_TEAMSLAVE ) {
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $264
line 471
;471:		return;
ADDRGP4 $263
JUMPV
LABELV $264
line 475
;472:	}
;473:
;474:	// if stationary at one of the positions, don't move anything
;475:	if ( ent->s.pos.trType != TR_STATIONARY || ent->s.apos.trType != TR_STATIONARY ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $268
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $266
LABELV $268
line 476
;476:		G_MoverTeam( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_MoverTeam
CALLV
pop
line 477
;477:	}
LABELV $266
line 480
;478:
;479:	// check think function
;480:	G_RunThink( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 481
;481:}
LABELV $263
endproc G_RunMover 8 4
export SetMoverState
proc SetMoverState 88 12
line 498
;482:
;483:/*
;484:============================================================================
;485:
;486:GENERAL MOVERS
;487:
;488:Doors, plats, and buttons are all binary (two position) movers
;489:Pos1 is "at rest", pos2 is "activated"
;490:============================================================================
;491:*/
;492:
;493:/*
;494:===============
;495:SetMoverState
;496:===============
;497:*/
;498:void SetMoverState( gentity_t *ent, moverState_t moverState, int time ) {
line 502
;499:	vec3_t			delta;
;500:	float			f;
;501:
;502:	ent->moverState = moverState;
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 504
;503:
;504:	ent->s.pos.trTime = time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 505
;505:	ent->s.apos.trTime = time;
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 507
;506:
;507:	switch( moverState ) {
ADDRLP4 16
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $270
ADDRLP4 16
INDIRI4
CNSTI4 7
GTI4 $270
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $297
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $297
address $273
address $274
address $275
address $280
address $285
address $286
address $287
address $292
code
LABELV $273
line 509
;508:	case MOVER_POS1:
;509:		VectorCopy( ent->pos1, ent->s.pos.trBase );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 620
ADDP4
INDIRB
ASGNB 12
line 510
;510:		ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 511
;511:		break;
ADDRGP4 $271
JUMPV
LABELV $274
line 513
;512:	case MOVER_POS2:
;513:		VectorCopy( ent->pos2, ent->s.pos.trBase );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 632
ADDP4
INDIRB
ASGNB 12
line 514
;514:		ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 515
;515:		break;
ADDRGP4 $271
JUMPV
LABELV $275
line 517
;516:	case MOVER_1TO2:
;517:		VectorCopy( ent->pos1, ent->s.pos.trBase );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 620
ADDP4
INDIRB
ASGNB 12
line 518
;518:		VectorSubtract( ent->pos2, ent->pos1, delta );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 36
INDIRP4
CNSTI4 636
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 40
INDIRP4
CNSTI4 640
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
SUBF4
ASGNF4
line 519
;519:		f = 1000.0 / ent->s.pos.trDuration;
ADDRLP4 12
CNSTF4 1148846080
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 520
;520:		VectorScale( delta, f, ent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
line 521
;521:		ent->s.pos.trType = TR_LINEAR_STOP;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 3
ASGNI4
line 522
;522:		break;
ADDRGP4 $271
JUMPV
LABELV $280
line 524
;523:	case MOVER_2TO1:
;524:		VectorCopy( ent->pos2, ent->s.pos.trBase );
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 632
ADDP4
INDIRB
ASGNB 12
line 525
;525:		VectorSubtract( ent->pos1, ent->pos2, delta );
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 48
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 48
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 636
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 52
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 640
ADDP4
INDIRF4
SUBF4
ASGNF4
line 526
;526:		f = 1000.0 / ent->s.pos.trDuration;
ADDRLP4 12
CNSTF4 1148846080
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 527
;527:		VectorScale( delta, f, ent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
line 528
;528:		ent->s.pos.trType = TR_LINEAR_STOP;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 3
ASGNI4
line 529
;529:		break;
ADDRGP4 $271
JUMPV
LABELV $285
line 532
;530:
;531:	case ROTATOR_POS1:
;532:		VectorCopy( ent->pos1, ent->s.apos.trBase );
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 56
INDIRP4
CNSTI4 620
ADDP4
INDIRB
ASGNB 12
line 533
;533:		ent->s.apos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 534
;534:		break;
ADDRGP4 $271
JUMPV
LABELV $286
line 536
;535:	case ROTATOR_POS2:
;536:		VectorCopy( ent->pos2, ent->s.apos.trBase );
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 60
INDIRP4
CNSTI4 632
ADDP4
INDIRB
ASGNB 12
line 537
;537:		ent->s.apos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 538
;538:		break;
ADDRGP4 $271
JUMPV
LABELV $287
line 540
;539:	case ROTATOR_1TO2:
;540:		VectorCopy( ent->pos1, ent->s.apos.trBase );
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 620
ADDP4
INDIRB
ASGNB 12
line 541
;541:		VectorSubtract( ent->pos2, ent->pos1, delta );
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 68
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
ADDRLP4 68
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 68
INDIRP4
CNSTI4 636
ADDP4
INDIRF4
ADDRLP4 68
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 72
INDIRP4
CNSTI4 640
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
SUBF4
ASGNF4
line 542
;542:		f = 1000.0 / ent->s.apos.trDuration;
ADDRLP4 12
CNSTF4 1148846080
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 543
;543:		VectorScale( delta, f, ent->s.apos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
line 544
;544:		ent->s.apos.trType = TR_LINEAR_STOP;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 3
ASGNI4
line 545
;545:		break;
ADDRGP4 $271
JUMPV
LABELV $292
line 547
;546:	case ROTATOR_2TO1:
;547:		VectorCopy( ent->pos2, ent->s.apos.trBase );
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 76
INDIRP4
CNSTI4 632
ADDP4
INDIRB
ASGNB 12
line 548
;548:		VectorSubtract( ent->pos1, ent->pos2, delta );
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 80
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 80
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 636
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 84
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 640
ADDP4
INDIRF4
SUBF4
ASGNF4
line 549
;549:		f = 1000.0 / ent->s.apos.trDuration;
ADDRLP4 12
CNSTF4 1148846080
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 550
;550:		VectorScale( delta, f, ent->s.apos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
line 551
;551:		ent->s.apos.trType = TR_LINEAR_STOP;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 3
ASGNI4
line 552
;552:		break;
LABELV $270
LABELV $271
line 554
;553:	}
;554:	BG_EvaluateTrajectory( &ent->s.pos, level.time, ent->r.currentOrigin );	
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
CNSTI4 496
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 555
;555:	BG_EvaluateTrajectory( &ent->s.apos, level.time, ent->r.currentAngles );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 556
;556:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 557
;557:}
LABELV $269
endproc SetMoverState 88 12
export MatchTeam
proc MatchTeam 4 12
line 567
;558:
;559:/*
;560:================
;561:MatchTeam
;562:
;563:All entities in a mover team will move from pos1 to pos2
;564:in the same amount of time
;565:================
;566:*/
;567:void MatchTeam( gentity_t *teamLeader, int moverState, int time ) {
line 570
;568:	gentity_t		*slave;
;569:
;570:	for ( slave = teamLeader ; slave ; slave = slave->teamchain ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $304
JUMPV
LABELV $301
line 571
;571:		SetMoverState( slave, moverState, time );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 SetMoverState
CALLV
pop
line 572
;572:	}
LABELV $302
line 570
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRP4
ASGNP4
LABELV $304
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $301
line 573
;573:}
LABELV $300
endproc MatchTeam 4 12
export ReturnToPos1
proc ReturnToPos1 8 12
line 582
;574:
;575:
;576:
;577:/*
;578:================
;579:ReturnToPos1
;580:================
;581:*/
;582:void ReturnToPos1( gentity_t *ent ) {
line 583
;583:	MatchTeam( ent, MOVER_2TO1, level.time );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 586
;584:
;585:	// looping sound
;586:	ent->s.loopSound = ent->soundLoop;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ASGNI4
line 589
;587:
;588:	// starting sound
;589:	if ( ent->sound2to1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
CNSTI4 0
EQI4 $307
line 590
;590:		G_AddEvent( ent, EV_GENERAL_SOUND, ent->sound2to1 );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 591
;591:	}
LABELV $307
line 592
;592:}
LABELV $305
endproc ReturnToPos1 8 12
export ReturnToApos1
proc ReturnToApos1 8 12
line 599
;593:
;594:/*
;595:================
;596:ReturnToApos1
;597:================
;598:*/
;599:void ReturnToApos1( gentity_t *ent ) {
line 600
;600:	MatchTeam( ent, ROTATOR_2TO1, level.time );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 7
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 603
;601:
;602:	// looping sound
;603:	ent->s.loopSound = ent->soundLoop;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ASGNI4
line 606
;604:
;605:	// starting sound
;606:	if ( ent->sound2to1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
CNSTI4 0
EQI4 $311
line 607
;607:		G_AddEvent( ent, EV_GENERAL_SOUND, ent->sound2to1 );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 608
;608:	}
LABELV $311
line 609
;609:}
LABELV $309
endproc ReturnToApos1 8 12
export Reached_BinaryMover
proc Reached_BinaryMover 12 12
line 616
;610:
;611:/*
;612:================
;613:Reached_BinaryMover
;614:================
;615:*/
;616:void Reached_BinaryMover( gentity_t *ent ) {
line 619
;617:
;618:	// stop the looping sound
;619:	ent->s.loopSound = ent->soundLoop;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ASGNI4
line 621
;620:
;621:	if ( ent->moverState == MOVER_1TO2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
CNSTI4 2
NEI4 $314
line 623
;622:		// reached pos2
;623:		SetMoverState( ent, MOVER_POS2, level.time );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 SetMoverState
CALLV
pop
line 626
;624:
;625:		// play sound
;626:		if ( ent->soundPos2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRI4
CNSTI4 0
EQI4 $317
line 627
;627:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->soundPos2 );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 600
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 628
;628:		}
LABELV $317
line 631
;629:
;630:		// return to pos1 after a delay
;631:		ent->think = ReturnToPos1;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 ReturnToPos1
ASGNP4
line 632
;632:		ent->nextthink = level.time + ent->wait;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRP4
CNSTI4 820
ADDP4
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 635
;633:
;634:		// fire targets
;635:		if ( !ent->activator ) {
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $320
line 636
;636:			ent->activator = ent;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 796
ADDP4
ADDRLP4 8
INDIRP4
ASGNP4
line 637
;637:		}
LABELV $320
line 638
;638:		G_UseTargets( ent, ent->activator );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 796
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 639
;639:	} else if ( ent->moverState == MOVER_2TO1 ) {
ADDRGP4 $315
JUMPV
LABELV $314
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
CNSTI4 3
NEI4 $322
line 641
;640:		// reached pos1
;641:		SetMoverState( ent, MOVER_POS1, level.time );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 SetMoverState
CALLV
pop
line 644
;642:
;643:		// play sound
;644:		if ( ent->soundPos1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 588
ADDP4
INDIRI4
CNSTI4 0
EQI4 $325
line 645
;645:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->soundPos1 );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 588
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 646
;646:		}
LABELV $325
line 649
;647:
;648:		// close areaportals
;649:		if ( ent->teammaster == ent || !ent->teammaster ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 8
INDIRU4
ADDRLP4 4
INDIRP4
CVPU4 4
EQU4 $329
ADDRLP4 8
INDIRU4
CNSTU4 0
NEU4 $323
LABELV $329
line 650
;650:			trap_AdjustAreaPortalState( ent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_AdjustAreaPortalState
CALLV
pop
line 651
;651:		}
line 652
;652:	} else  if ( ent->moverState == ROTATOR_1TO2 ) {
ADDRGP4 $323
JUMPV
LABELV $322
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
CNSTI4 6
NEI4 $330
line 654
;653:		// reached pos2
;654:		SetMoverState( ent, ROTATOR_POS2, level.time );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 SetMoverState
CALLV
pop
line 657
;655:
;656:		// play sound
;657:		if ( ent->soundPos2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRI4
CNSTI4 0
EQI4 $333
line 658
;658:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->soundPos2 );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 600
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 659
;659:		}
LABELV $333
line 662
;660:
;661:		// return to apos1 after a delay
;662:		ent->think = ReturnToApos1;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 ReturnToApos1
ASGNP4
line 663
;663:		ent->nextthink = level.time + ent->wait;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRP4
CNSTI4 820
ADDP4
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 666
;664:
;665:		// fire targets
;666:		if ( !ent->activator ) {
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $336
line 667
;667:			ent->activator = ent;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 796
ADDP4
ADDRLP4 8
INDIRP4
ASGNP4
line 668
;668:		}
LABELV $336
line 669
;669:		G_UseTargets( ent, ent->activator );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 796
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 670
;670:	} else if ( ent->moverState == ROTATOR_2TO1 ) {
ADDRGP4 $331
JUMPV
LABELV $330
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
CNSTI4 7
NEI4 $338
line 672
;671:		// reached pos1
;672:		SetMoverState( ent, ROTATOR_POS1, level.time );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 SetMoverState
CALLV
pop
line 675
;673:
;674:		// play sound
;675:		if ( ent->soundPos1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 588
ADDP4
INDIRI4
CNSTI4 0
EQI4 $341
line 676
;676:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->soundPos1 );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 588
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 677
;677:		}
LABELV $341
line 680
;678:
;679:		// close areaportals
;680:		if ( ent->teammaster == ent || !ent->teammaster ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 8
INDIRU4
ADDRLP4 4
INDIRP4
CVPU4 4
EQU4 $345
ADDRLP4 8
INDIRU4
CNSTU4 0
NEU4 $339
LABELV $345
line 681
;681:			trap_AdjustAreaPortalState( ent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_AdjustAreaPortalState
CALLV
pop
line 682
;682:		}
line 683
;683:	} else {
ADDRGP4 $339
JUMPV
LABELV $338
line 684
;684:		G_Error( "Reached_BinaryMover: bad moverState" );
ADDRGP4 $346
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 685
;685:	}
LABELV $339
LABELV $331
LABELV $323
LABELV $315
line 686
;686:}
LABELV $313
endproc Reached_BinaryMover 12 12
export Use_BinaryMover
proc Use_BinaryMover 52 12
line 694
;687:
;688:
;689:/*
;690:================
;691:Use_BinaryMover
;692:================
;693:*/
;694:void Use_BinaryMover( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 701
;695:	int		total;
;696:	int		partial;
;697:	int		i; //-Vincent
;698:	gclient_t	*client; //-Vincent
;699:
;700:	// only the master should be used
;701:	if ( ent->flags & FL_TEAMSLAVE ) {
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $348
line 702
;702:		Use_BinaryMover( ent->teammaster, other, activator );
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Use_BinaryMover
CALLV
pop
line 703
;703:		return;
ADDRGP4 $347
JUMPV
LABELV $348
line 706
;704:	}
;705:
;706:	ent->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 708
;707:
;708:	if ( ent->moverState == MOVER_POS1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
CNSTI4 0
NEI4 $350
line 711
;709:		// start moving 50 msec later, becase if this was player
;710:		// triggered, level.time hasn't been advanced yet
;711:		MatchTeam( ent, MOVER_1TO2, level.time + 50 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 714
;712:
;713:		// starting sound
;714:		if ( ent->sound1to2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRI4
CNSTI4 0
EQI4 $353
line 715
;715:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->sound1to2 );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 592
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 716
;716:		}
LABELV $353
line 719
;717:
;718:		// looping sound
;719:		ent->s.loopSound = ent->soundLoop;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ASGNI4
line 722
;720:
;721:		// open areaportal
;722:		if ( ent->teammaster == ent || !ent->teammaster ) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 24
INDIRU4
ADDRLP4 20
INDIRP4
CVPU4 4
EQU4 $357
ADDRLP4 24
INDIRU4
CNSTU4 0
NEU4 $358
LABELV $357
line 723
;723:			trap_AdjustAreaPortalState( ent, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_AdjustAreaPortalState
CALLV
pop
line 724
;724:		}
line 725
;725:		goto finish;
ADDRGP4 $358
JUMPV
LABELV $350
line 728
;726:	}
;727:
;728:	if ( ent->moverState == ROTATOR_POS1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
CNSTI4 4
NEI4 $359
line 731
;729:		// start moving 50 msec later, becase if this was player
;730:		// triggered, level.time hasn't been advanced yet
;731:		MatchTeam( ent, ROTATOR_1TO2, level.time + 50 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 734
;732:
;733:		// starting sound
;734:		if ( ent->sound1to2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRI4
CNSTI4 0
EQI4 $362
line 735
;735:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->sound1to2 );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 592
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 736
;736:		}
LABELV $362
line 739
;737:
;738:		// looping sound
;739:		ent->s.loopSound = ent->soundLoop;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ASGNI4
line 742
;740:
;741:		// open areaportal
;742:		if ( ent->teammaster == ent || !ent->teammaster ) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 24
INDIRU4
ADDRLP4 20
INDIRP4
CVPU4 4
EQU4 $366
ADDRLP4 24
INDIRU4
CNSTU4 0
NEU4 $358
LABELV $366
line 743
;743:			trap_AdjustAreaPortalState( ent, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_AdjustAreaPortalState
CALLV
pop
line 744
;744:		}
line 745
;745:		goto finish;
ADDRGP4 $358
JUMPV
LABELV $359
line 749
;746:	}
;747:
;748:	// if all the way up, just delay before coming down
;749:	if ( ent->moverState == ROTATOR_POS2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
CNSTI4 5
NEI4 $367
line 750
;750:		ent->nextthink = level.time + ent->wait;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRP4
CNSTI4 820
ADDP4
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 751
;751:		goto finish;
ADDRGP4 $358
JUMPV
LABELV $367
line 755
;752:	}
;753:
;754:	// only partway down before reversing
;755:	if ( ent->moverState == ROTATOR_2TO1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
CNSTI4 7
NEI4 $370
line 756
;756:		total = ent->s.apos.trDuration;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ASGNI4
line 757
;757:		partial = level.time - ent->s.time;
ADDRLP4 12
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
SUBI4
ASGNI4
line 758
;758:		if ( partial > total ) {
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRI4
LEI4 $373
line 759
;759:			partial = total;
ADDRLP4 12
ADDRLP4 8
INDIRI4
ASGNI4
line 760
;760:		}
LABELV $373
line 762
;761:
;762:		MatchTeam( ent, ROTATOR_1TO2, level.time - ( total - partial ) );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 level+32
INDIRI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
SUBI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 764
;763:
;764:		if ( ent->sound1to2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRI4
CNSTI4 0
EQI4 $358
line 765
;765:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->sound1to2 );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 592
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 766
;766:		}
line 767
;767:		goto finish;
ADDRGP4 $358
JUMPV
LABELV $370
line 771
;768:	}
;769:
;770:	// only partway up before reversing
;771:	if ( ent->moverState == ROTATOR_1TO2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
CNSTI4 6
NEI4 $378
line 772
;772:		total = ent->s.apos.trDuration;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ASGNI4
line 773
;773:		partial = level.time - ent->s.time;
ADDRLP4 12
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
SUBI4
ASGNI4
line 774
;774:		if ( partial > total ) {
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRI4
LEI4 $381
line 775
;775:			partial = total;
ADDRLP4 12
ADDRLP4 8
INDIRI4
ASGNI4
line 776
;776:		}
LABELV $381
line 778
;777:
;778:		MatchTeam( ent, ROTATOR_2TO1, level.time - ( total - partial ) );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 7
ARGI4
ADDRGP4 level+32
INDIRI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
SUBI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 780
;779:
;780:		if ( ent->sound2to1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
CNSTI4 0
EQI4 $358
line 781
;781:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->sound2to1 );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 782
;782:		}
line 783
;783:		goto finish;
ADDRGP4 $358
JUMPV
LABELV $378
line 787
;784:	}
;785:
;786:	// if all the way up, just delay before coming down
;787:	if ( ent->moverState == MOVER_POS2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
CNSTI4 1
NEI4 $386
line 788
;788:		ent->nextthink = level.time + ent->wait;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRP4
CNSTI4 820
ADDP4
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 789
;789:		goto finish;
ADDRGP4 $358
JUMPV
LABELV $386
line 793
;790:	}
;791:
;792:	// only partway down before reversing
;793:	if ( ent->moverState == MOVER_2TO1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
CNSTI4 3
NEI4 $389
line 794
;794:		total = ent->s.pos.trDuration;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
line 795
;795:		partial = level.time - ent->s.pos.trTime;
ADDRLP4 12
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
SUBI4
ASGNI4
line 796
;796:		if ( partial > total ) {
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRI4
LEI4 $392
line 797
;797:			partial = total;
ADDRLP4 12
ADDRLP4 8
INDIRI4
ASGNI4
line 798
;798:		}
LABELV $392
line 800
;799:
;800:		MatchTeam( ent, MOVER_1TO2, level.time - ( total - partial ) );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 level+32
INDIRI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
SUBI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 802
;801:
;802:		if ( ent->sound1to2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRI4
CNSTI4 0
EQI4 $358
line 803
;803:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->sound1to2 );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 592
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 804
;804:		}
line 805
;805:		goto finish;
ADDRGP4 $358
JUMPV
LABELV $389
line 809
;806:	}
;807:
;808:	// only partway up before reversing
;809:	if ( ent->moverState == MOVER_1TO2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
CNSTI4 2
NEI4 $397
line 810
;810:		total = ent->s.pos.trDuration;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
line 811
;811:		partial = level.time - ent->s.pos.trTime;
ADDRLP4 12
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
SUBI4
ASGNI4
line 812
;812:		if ( partial > total ) {
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRI4
LEI4 $400
line 813
;813:			partial = total;
ADDRLP4 12
ADDRLP4 8
INDIRI4
ASGNI4
line 814
;814:		}
LABELV $400
line 816
;815:
;816:		MatchTeam( ent, MOVER_2TO1, level.time - ( total - partial ) );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 level+32
INDIRI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
SUBI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 818
;817:
;818:		if ( ent->sound2to1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
CNSTI4 0
EQI4 $358
line 819
;819:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->sound2to1 );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 820
;820:		}
line 821
;821:		goto finish;
LABELV $397
LABELV $358
line 826
;822:	}
;823:
;824:finish:
;825:	// Check if any client's grapplepoint is close to the mover's origin
;826:	for( i = 0; i < level.maxclients; i++ ) 
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $408
JUMPV
LABELV $405
line 827
;827:	{ //-Vincent
line 830
;828:	vec3_t		delta;
;829:	float		len;
;830:	client	=	&level.clients[i];
ADDRLP4 0
CNSTI4 3492
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 832
;831:
;832:		if( !client || !client->hook || !client->ps.grapplePoint ) // Don't bother then...
ADDRLP4 36
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $413
ADDRLP4 0
INDIRP4
CNSTI4 2708
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $413
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
CVPU4 4
ADDRLP4 36
INDIRU4
NEU4 $410
LABELV $413
line 833
;833:			continue;
ADDRGP4 $406
JUMPV
LABELV $410
line 836
;834:
;835:		// Compare the client's grapplepoint with the mover's origin
;836:		VectorSubtract( ent->s.pos.trBase, client->ps.grapplePoint, delta );
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 40
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 40
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+8
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 837
;837:		len = VectorNormalize( delta );
ADDRLP4 16
ARGP4
ADDRLP4 48
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 48
INDIRF4
ASGNF4
line 838
;838:		if ( len > 16 ) // Not nearby, so don't free it
ADDRLP4 28
INDIRF4
CNSTF4 1098907648
LEF4 $416
line 839
;839:			continue;
ADDRGP4 $406
JUMPV
LABELV $416
line 841
;840:
;841:		Weapon_HookFree( client->hook ); // Free it!
ADDRLP4 0
INDIRP4
CNSTI4 2708
ADDP4
INDIRP4
ARGP4
ADDRGP4 Weapon_HookFree
CALLV
pop
line 842
;842:	}
LABELV $406
line 826
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $408
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $405
line 843
;843:}
LABELV $347
endproc Use_BinaryMover 52 12
export InitMover
proc InitMover 100 12
line 855
;844:
;845:
;846:
;847:/*
;848:================
;849:InitMover
;850:
;851:"pos1", "pos2", and "speed" should be set before calling,
;852:so the movement delta can be calculated
;853:================
;854:*/
;855:void InitMover( gentity_t *ent ) {
line 865
;856:	vec3_t		move;
;857:	float		distance;
;858:	float		light;
;859:	vec3_t		color;
;860:	qboolean	lightSet, colorSet;
;861:	char		*sound;
;862:
;863:	// if the "model2" key is set, use a seperate model
;864:	// for drawing, but clip against the brushes
;865:	if ( ent->model2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $419
line 866
;866:		ent->s.modelindex2 = G_ModelIndex( ent->model2 );
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 552
ADDP4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 164
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 867
;867:	}
LABELV $419
line 870
;868:
;869:	// if the "loopsound" key is set, use a constant looping sound when moving
;870:	if ( G_SpawnString( "noise", "100", &sound ) ) {
ADDRGP4 $423
ARGP4
ADDRGP4 $424
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 44
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $421
line 871
;871:		ent->s.loopSound = G_SoundIndex( sound );
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 872
;872:	}
LABELV $421
line 875
;873:
;874:	// if the "color" or "light" keys are set, setup constantLight
;875:	lightSet = G_SpawnFloat( "light", "100", &light );
ADDRGP4 $425
ARGP4
ADDRGP4 $424
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ADDRGP4 G_SpawnFloat
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 48
INDIRI4
ASGNI4
line 876
;876:	colorSet = G_SpawnVector( "color", "1 1 1", color );
ADDRGP4 $426
ARGP4
ADDRGP4 $427
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 52
ADDRGP4 G_SpawnVector
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 52
INDIRI4
ASGNI4
line 877
;877:	if ( lightSet || colorSet ) {
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 56
INDIRI4
NEI4 $430
ADDRLP4 32
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $428
LABELV $430
line 880
;878:		int		r, g, b, i;
;879:
;880:		r = color[0] * 255;
ADDRLP4 60
CNSTF4 1132396544
ADDRLP4 12
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 881
;881:		if ( r > 255 ) {
ADDRLP4 60
INDIRI4
CNSTI4 255
LEI4 $431
line 882
;882:			r = 255;
ADDRLP4 60
CNSTI4 255
ASGNI4
line 883
;883:		}
LABELV $431
line 884
;884:		g = color[1] * 255;
ADDRLP4 64
CNSTF4 1132396544
ADDRLP4 12+4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 885
;885:		if ( g > 255 ) {
ADDRLP4 64
INDIRI4
CNSTI4 255
LEI4 $434
line 886
;886:			g = 255;
ADDRLP4 64
CNSTI4 255
ASGNI4
line 887
;887:		}
LABELV $434
line 888
;888:		b = color[2] * 255;
ADDRLP4 68
CNSTF4 1132396544
ADDRLP4 12+8
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 889
;889:		if ( b > 255 ) {
ADDRLP4 68
INDIRI4
CNSTI4 255
LEI4 $437
line 890
;890:			b = 255;
ADDRLP4 68
CNSTI4 255
ASGNI4
line 891
;891:		}
LABELV $437
line 892
;892:		i = light / 4;
ADDRLP4 72
ADDRLP4 36
INDIRF4
CNSTF4 1082130432
DIVF4
CVFI4 4
ASGNI4
line 893
;893:		if ( i > 255 ) {
ADDRLP4 72
INDIRI4
CNSTI4 255
LEI4 $439
line 894
;894:			i = 255;
ADDRLP4 72
CNSTI4 255
ASGNI4
line 895
;895:		}
LABELV $439
line 896
;896:		ent->s.constantLight = r | ( g << 8 ) | ( b << 16 ) | ( i << 24 );
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
ADDRLP4 60
INDIRI4
ADDRLP4 64
INDIRI4
CNSTI4 8
LSHI4
BORI4
ADDRLP4 68
INDIRI4
CNSTI4 16
LSHI4
BORI4
ADDRLP4 72
INDIRI4
CNSTI4 24
LSHI4
BORI4
ASGNI4
line 897
;897:	}
LABELV $428
line 900
;898:
;899:
;900:	ent->use = Use_BinaryMover;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 Use_BinaryMover
ASGNP4
line 901
;901:	ent->reached = Reached_BinaryMover;
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRGP4 Reached_BinaryMover
ASGNP4
line 903
;902:
;903:	ent->moverState = MOVER_POS1;
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
CNSTI4 0
ASGNI4
line 904
;904:	ent->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 905
;905:	ent->s.eType = ET_MOVER;
ADDRLP4 60
CNSTI4 4
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ADDRLP4 60
INDIRI4
ASGNI4
line 906
;906:	VectorCopy (ent->pos1, ent->r.currentOrigin);
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 620
ADDP4
INDIRB
ASGNB 12
line 907
;907:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 909
;908:
;909:	ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 910
;910:	VectorCopy( ent->pos1, ent->s.pos.trBase );
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 620
ADDP4
INDIRB
ASGNB 12
line 913
;911:
;912:	// calculate time to reach second position from speed
;913:	VectorSubtract( ent->pos2, ent->pos1, move );
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 72
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 72
INDIRP4
CNSTI4 636
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 76
INDIRP4
CNSTI4 640
ADDP4
INDIRF4
ADDRLP4 76
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
SUBF4
ASGNF4
line 914
;914:	distance = VectorLength( move );
ADDRLP4 0
ARGP4
ADDRLP4 80
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 80
INDIRF4
ASGNF4
line 915
;915:	if ( ! ent->speed ) {
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
CNSTF4 0
NEF4 $443
line 916
;916:		ent->speed = 100;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTF4 1120403456
ASGNF4
line 917
;917:	}
LABELV $443
line 918
;918:	VectorScale( move, ent->speed, ent->s.pos.trDelta );
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
MULF4
ASGNF4
line 919
;919:	ent->s.pos.trDuration = distance * 1000 / ent->speed;
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 1148846080
ADDRLP4 24
INDIRF4
MULF4
ADDRLP4 96
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 920
;920:	if ( ent->s.pos.trDuration <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
GTI4 $447
line 921
;921:		ent->s.pos.trDuration = 1;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 1
ASGNI4
line 922
;922:	}
LABELV $447
line 923
;923:}
LABELV $418
endproc InitMover 100 12
export InitRotator
proc InitRotator 100 12
line 933
;924:
;925:/*
;926:================
;927:InitRotator
;928:
;929:"pos1", "pos2", and "speed" should be set before calling,
;930:so the movement delta can be calculated
;931:================
;932:*/
;933:void InitRotator( gentity_t *ent ) {
line 943
;934:	vec3_t		move;
;935:	float		angle;
;936:	float		light;
;937:	vec3_t		color;
;938:	qboolean	lightSet, colorSet;
;939:	char		*sound;
;940:
;941:	// if the "model2" key is set, use a seperate model
;942:	// for drawing, but clip against the brushes
;943:	if ( ent->model2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $450
line 944
;944:		ent->s.modelindex2 = G_ModelIndex( ent->model2 );
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 552
ADDP4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 164
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 945
;945:	}
LABELV $450
line 948
;946:
;947:	// if the "loopsound" key is set, use a constant looping sound when moving
;948:	if ( G_SpawnString( "noise", "100", &sound ) ) {
ADDRGP4 $423
ARGP4
ADDRGP4 $424
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 44
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $452
line 949
;949:		ent->s.loopSound = G_SoundIndex( sound );
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 950
;950:	}
LABELV $452
line 953
;951:
;952:	// if the "color" or "light" keys are set, setup constantLight
;953:	lightSet = G_SpawnFloat( "light", "100", &light );
ADDRGP4 $425
ARGP4
ADDRGP4 $424
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ADDRGP4 G_SpawnFloat
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 48
INDIRI4
ASGNI4
line 954
;954:	colorSet = G_SpawnVector( "color", "1 1 1", color );
ADDRGP4 $426
ARGP4
ADDRGP4 $427
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 52
ADDRGP4 G_SpawnVector
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 52
INDIRI4
ASGNI4
line 955
;955:	if ( lightSet || colorSet ) {
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 56
INDIRI4
NEI4 $456
ADDRLP4 32
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $454
LABELV $456
line 958
;956:		int		r, g, b, i;
;957:
;958:		r = color[0] * 255;
ADDRLP4 60
CNSTF4 1132396544
ADDRLP4 12
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 959
;959:		if ( r > 255 ) {
ADDRLP4 60
INDIRI4
CNSTI4 255
LEI4 $457
line 960
;960:			r = 255;
ADDRLP4 60
CNSTI4 255
ASGNI4
line 961
;961:		}
LABELV $457
line 962
;962:		g = color[1] * 255;
ADDRLP4 64
CNSTF4 1132396544
ADDRLP4 12+4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 963
;963:		if ( g > 255 ) {
ADDRLP4 64
INDIRI4
CNSTI4 255
LEI4 $460
line 964
;964:			g = 255;
ADDRLP4 64
CNSTI4 255
ASGNI4
line 965
;965:		}
LABELV $460
line 966
;966:		b = color[2] * 255;
ADDRLP4 68
CNSTF4 1132396544
ADDRLP4 12+8
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 967
;967:		if ( b > 255 ) {
ADDRLP4 68
INDIRI4
CNSTI4 255
LEI4 $463
line 968
;968:			b = 255;
ADDRLP4 68
CNSTI4 255
ASGNI4
line 969
;969:		}
LABELV $463
line 970
;970:		i = light / 4;
ADDRLP4 72
ADDRLP4 36
INDIRF4
CNSTF4 1082130432
DIVF4
CVFI4 4
ASGNI4
line 971
;971:		if ( i > 255 ) {
ADDRLP4 72
INDIRI4
CNSTI4 255
LEI4 $465
line 972
;972:			i = 255;
ADDRLP4 72
CNSTI4 255
ASGNI4
line 973
;973:		}
LABELV $465
line 974
;974:		ent->s.constantLight = r | ( g << 8 ) | ( b << 16 ) | ( i << 24 );
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
ADDRLP4 60
INDIRI4
ADDRLP4 64
INDIRI4
CNSTI4 8
LSHI4
BORI4
ADDRLP4 68
INDIRI4
CNSTI4 16
LSHI4
BORI4
ADDRLP4 72
INDIRI4
CNSTI4 24
LSHI4
BORI4
ASGNI4
line 975
;975:	}
LABELV $454
line 978
;976:
;977:
;978:	ent->use = Use_BinaryMover;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 Use_BinaryMover
ASGNP4
line 979
;979:	ent->reached = Reached_BinaryMover;
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRGP4 Reached_BinaryMover
ASGNP4
line 981
;980:
;981:	ent->moverState = ROTATOR_POS1;
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
CNSTI4 4
ASGNI4
line 982
;982:	ent->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 983
;983:	ent->s.eType = ET_MOVER;
ADDRLP4 60
CNSTI4 4
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ADDRLP4 60
INDIRI4
ASGNI4
line 984
;984:	VectorCopy( ent->pos1, ent->r.currentAngles );
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 508
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 620
ADDP4
INDIRB
ASGNB 12
line 985
;985:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 987
;986:
;987:	ent->s.apos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 988
;988:	VectorCopy( ent->pos1, ent->s.apos.trBase );
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 620
ADDP4
INDIRB
ASGNB 12
line 991
;989:
;990:	// calculate time to reach second position from speed
;991:	VectorSubtract( ent->pos2, ent->pos1, move );
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 72
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 72
INDIRP4
CNSTI4 636
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 76
INDIRP4
CNSTI4 640
ADDP4
INDIRF4
ADDRLP4 76
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
SUBF4
ASGNF4
line 992
;992:	angle = VectorLength( move );
ADDRLP4 0
ARGP4
ADDRLP4 80
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 80
INDIRF4
ASGNF4
line 993
;993:	if ( ! ent->speed ) {
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
CNSTF4 0
NEF4 $469
line 994
;994:		ent->speed = 120;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTF4 1123024896
ASGNF4
line 995
;995:	}
LABELV $469
line 996
;996:	VectorScale( move, ent->speed, ent->s.apos.trDelta );
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 0
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
MULF4
ASGNF4
line 997
;997:	ent->s.apos.trDuration = angle * 1000 / ent->speed;
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 56
ADDP4
CNSTF4 1148846080
ADDRLP4 24
INDIRF4
MULF4
ADDRLP4 96
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 998
;998:	if ( ent->s.apos.trDuration <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 0
GTI4 $473
line 999
;999:		ent->s.apos.trDuration = 1;
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
CNSTI4 1
ASGNI4
line 1000
;1000:	}
LABELV $473
line 1001
;1001:}
LABELV $449
endproc InitRotator 100 12
export Blocked_Door
proc Blocked_Door 8 32
line 1020
;1002:
;1003:
;1004:/*
;1005:===============================================================================
;1006:
;1007:DOOR
;1008:
;1009:A use can be triggered either by a touch function, by being shot, or by being
;1010:targeted by another entity.
;1011:
;1012:===============================================================================
;1013:*/
;1014:
;1015:/*
;1016:================
;1017:Blocked_Door
;1018:================
;1019:*/
;1020:void Blocked_Door( gentity_t *ent, gentity_t *other ) {
line 1022
;1021:	// remove anything other than a client
;1022:	if ( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $476
line 1024
;1023:		// except CTF flags!!!!
;1024:		if( other->s.eType == ET_ITEM && other->item->giType == IT_TEAM ) {
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $478
ADDRLP4 0
INDIRP4
CNSTI4 884
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $478
line 1025
;1025:			Team_DroppedFlagThink( other );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Team_DroppedFlagThink
CALLV
pop
line 1026
;1026:			return;
ADDRGP4 $475
JUMPV
LABELV $478
line 1028
;1027:		}
;1028:		G_TempEntity( other->s.origin, EV_ITEM_POP );
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 42
ARGI4
ADDRGP4 G_TempEntity
CALLP4
pop
line 1029
;1029:		G_FreeEntity( other );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1030
;1030:		return;
ADDRGP4 $475
JUMPV
LABELV $476
line 1033
;1031:	}
;1032:
;1033:	if ( ent->damage ) {
ADDRFP4 0
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
CNSTI4 0
EQI4 $480
line 1034
;1034:		G_Damage( other, ent, ent, NULL, NULL, ent->damage, 0, MOD_CRUSH );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
CNSTP4 0
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 17
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1035
;1035:	}
LABELV $480
line 1036
;1036:	if ( ent->spawnflags & 4 ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $482
line 1037
;1037:		return;		// crushers don't reverse
ADDRGP4 $475
JUMPV
LABELV $482
line 1041
;1038:	}
;1039:
;1040:	// reverse direction
;1041:	Use_BinaryMover( ent, ent, other );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Use_BinaryMover
CALLV
pop
line 1042
;1042:}
LABELV $475
endproc Blocked_Door 8 32
proc Touch_DoorTriggerSpectator 72 12
line 1049
;1043:
;1044:/*
;1045:================
;1046:Touch_DoorTriggerSpectator
;1047:================
;1048:*/
;1049:static void Touch_DoorTriggerSpectator( gentity_t *ent, gentity_t *other, trace_t *trace ) {
line 1053
;1050:	int i, axis;
;1051:	vec3_t origin, dir, angles;
;1052:
;1053:	axis = ent->count;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
ASGNI4
line 1054
;1054:	VectorClear(dir);
ADDRLP4 44
CNSTF4 0
ASGNF4
ADDRLP4 20+8
ADDRLP4 44
INDIRF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 44
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 44
INDIRF4
ASGNF4
line 1055
;1055:	if (fabs(other->s.origin[axis] - ent->r.absmax[axis]) <
ADDRLP4 48
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 48
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
ADDP4
INDIRF4
ADDRLP4 48
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
ADDP4
INDIRF4
SUBF4
ARGF4
ADDRLP4 52
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 56
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 56
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
ADDP4
INDIRF4
ADDRLP4 56
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
ADDP4
INDIRF4
SUBF4
ARGF4
ADDRLP4 60
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 52
INDIRF4
ADDRLP4 60
INDIRF4
GEF4 $487
line 1056
;1056:		fabs(other->s.origin[axis] - ent->r.absmin[axis])) {
line 1057
;1057:		origin[axis] = ent->r.absmin[axis] - 10;
ADDRLP4 64
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 64
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 64
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
ADDP4
INDIRF4
CNSTF4 1092616192
SUBF4
ASGNF4
line 1058
;1058:		dir[axis] = -1;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
ADDP4
CNSTF4 3212836864
ASGNF4
line 1059
;1059:	}
ADDRGP4 $488
JUMPV
LABELV $487
line 1060
;1060:	else {
line 1061
;1061:		origin[axis] = ent->r.absmax[axis] + 10;
ADDRLP4 64
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 64
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 64
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
ADDP4
INDIRF4
CNSTF4 1092616192
ADDF4
ASGNF4
line 1062
;1062:		dir[axis] = 1;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
ADDP4
CNSTF4 1065353216
ASGNF4
line 1063
;1063:	}
LABELV $488
line 1064
;1064:	for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $489
line 1065
;1065:		if (i == axis) continue;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $493
ADDRGP4 $490
JUMPV
LABELV $493
line 1066
;1066:		origin[i] = (ent->r.absmin[i] + ent->r.absmax[i]) * 0.5;
ADDRLP4 64
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRI4
ADDRLP4 8
ADDP4
CNSTF4 1056964608
ADDRLP4 64
INDIRI4
ADDRLP4 68
INDIRP4
CNSTI4 472
ADDP4
ADDP4
INDIRF4
ADDRLP4 64
INDIRI4
ADDRLP4 68
INDIRP4
CNSTI4 484
ADDP4
ADDP4
INDIRF4
ADDF4
MULF4
ASGNF4
line 1067
;1067:	}
LABELV $490
line 1064
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $489
line 1068
;1068:	vectoangles(dir, angles);
ADDRLP4 20
ARGP4
ADDRLP4 32
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1069
;1069:	TeleportPlayer(other, origin, angles );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 32
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 1070
;1070:}
LABELV $484
endproc Touch_DoorTriggerSpectator 72 12
export Touch_DoorTrigger
proc Touch_DoorTrigger 12 12
line 1077
;1071:
;1072:/*
;1073:================
;1074:Touch_DoorTrigger
;1075:================
;1076:*/
;1077:void Touch_DoorTrigger( gentity_t *ent, gentity_t *other, trace_t *trace ) {
line 1078
;1078:	if ( other->client && other->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $496
ADDRLP4 0
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
CNSTI4 3
NEI4 $496
line 1080
;1079:		// if the door is not open and not opening
;1080:		if ( ent->parent->moverState != MOVER_1TO2 &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $497
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $497
ADDRLP4 4
INDIRI4
CNSTI4 6
EQI4 $497
ADDRLP4 4
INDIRI4
CNSTI4 5
EQI4 $497
line 1083
;1081:			ent->parent->moverState != MOVER_POS2 &&
;1082:			ent->parent->moverState != ROTATOR_1TO2 &&
;1083:			ent->parent->moverState != ROTATOR_POS2 ) {
line 1084
;1084:			Touch_DoorTriggerSpectator( ent, other, trace );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Touch_DoorTriggerSpectator
CALLV
pop
line 1085
;1085:		}
line 1086
;1086:	}
ADDRGP4 $497
JUMPV
LABELV $496
line 1087
;1087:	else if ( ent->parent->moverState != MOVER_1TO2 &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $500
ADDRLP4 4
INDIRI4
CNSTI4 6
EQI4 $500
line 1088
;1088:		ent->parent->moverState != ROTATOR_1TO2) {
line 1089
;1089:		Use_BinaryMover( ent->parent, ent, other );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Use_BinaryMover
CALLV
pop
line 1090
;1090:	}
LABELV $500
LABELV $497
line 1091
;1091:}
LABELV $495
endproc Touch_DoorTrigger 12 12
export Think_SpawnNewDoorTrigger
proc Think_SpawnNewDoorTrigger 52 12
line 1102
;1092:
;1093:
;1094:/*
;1095:======================
;1096:Think_SpawnNewDoorTrigger
;1097:
;1098:All of the parts of a door have been spawned, so create
;1099:a trigger that encloses all of them
;1100:======================
;1101:*/
;1102:void Think_SpawnNewDoorTrigger( gentity_t *ent ) {
line 1108
;1103:	gentity_t		*other;
;1104:	vec3_t		mins, maxs;
;1105:	int			i, best;
;1106:
;1107:	// set all of the slaves as shootable
;1108:	for ( other = ent ; other ; other = other->teamchain ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $506
JUMPV
LABELV $503
line 1109
;1109:		other->takedamage = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
line 1110
;1110:	}
LABELV $504
line 1108
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRP4
ASGNP4
LABELV $506
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $503
line 1113
;1111:
;1112:	// find the bounds of everything on the team
;1113:	VectorCopy (ent->r.absmin, mins);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRB
ASGNB 12
line 1114
;1114:	VectorCopy (ent->r.absmax, maxs);
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
INDIRB
ASGNB 12
line 1116
;1115:
;1116:	for (other = ent->teamchain ; other ; other=other->teamchain) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $510
JUMPV
LABELV $507
line 1117
;1117:		AddPointToBounds (other->r.absmin, mins, maxs);
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 AddPointToBounds
CALLV
pop
line 1118
;1118:		AddPointToBounds (other->r.absmax, mins, maxs);
ADDRLP4 0
INDIRP4
CNSTI4 484
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 AddPointToBounds
CALLV
pop
line 1119
;1119:	}
LABELV $508
line 1116
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRP4
ASGNP4
LABELV $510
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $507
line 1122
;1120:
;1121:	// find the thinnest axis, which will be the one we expand
;1122:	best = 0;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 1123
;1123:	for ( i = 1 ; i < 3 ; i++ ) {
ADDRLP4 4
CNSTI4 1
ASGNI4
LABELV $511
line 1124
;1124:		if ( maxs[i] - mins[i] < maxs[best] - mins[best] ) {
ADDRLP4 36
CNSTI4 2
ASGNI4
ADDRLP4 40
ADDRLP4 4
INDIRI4
ADDRLP4 36
INDIRI4
LSHI4
ASGNI4
ADDRLP4 44
ADDRLP4 32
INDIRI4
ADDRLP4 36
INDIRI4
LSHI4
ASGNI4
ADDRLP4 40
INDIRI4
ADDRLP4 20
ADDP4
INDIRF4
ADDRLP4 40
INDIRI4
ADDRLP4 8
ADDP4
INDIRF4
SUBF4
ADDRLP4 44
INDIRI4
ADDRLP4 20
ADDP4
INDIRF4
ADDRLP4 44
INDIRI4
ADDRLP4 8
ADDP4
INDIRF4
SUBF4
GEF4 $515
line 1125
;1125:			best = i;
ADDRLP4 32
ADDRLP4 4
INDIRI4
ASGNI4
line 1126
;1126:		}
LABELV $515
line 1127
;1127:	}
LABELV $512
line 1123
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $511
line 1128
;1128:	maxs[best] += 120;
ADDRLP4 36
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 1129
;1129:	mins[best] -= 120;
ADDRLP4 40
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
CNSTF4 1123024896
SUBF4
ASGNF4
line 1132
;1130:
;1131:	// create a trigger with this size
;1132:	other = G_Spawn ();
ADDRLP4 44
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 44
INDIRP4
ASGNP4
line 1133
;1133:	other->classname = "door_trigger";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $517
ASGNP4
line 1134
;1134:	VectorCopy (mins, other->r.mins);
ADDRLP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRLP4 8
INDIRB
ASGNB 12
line 1135
;1135:	VectorCopy (maxs, other->r.maxs);
ADDRLP4 0
INDIRP4
CNSTI4 456
ADDP4
ADDRLP4 20
INDIRB
ASGNB 12
line 1136
;1136:	other->parent = ent;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1137
;1137:	other->r.contents = CONTENTS_TRIGGER;
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 1073741824
ASGNI4
line 1138
;1138:	other->touch = Touch_DoorTrigger;
ADDRLP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRGP4 Touch_DoorTrigger
ASGNP4
line 1140
;1139:	// remember the thinnest axis
;1140:	other->count = best;
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 1141
;1141:	trap_LinkEntity (other);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1143
;1142:
;1143:	MatchTeam( ent, ent->moverState, level.time );
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 48
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 1144
;1144:}
LABELV $502
endproc Think_SpawnNewDoorTrigger 52 12
export Think_MatchTeam
proc Think_MatchTeam 4 12
line 1146
;1145:
;1146:void Think_MatchTeam( gentity_t *ent ) {
line 1147
;1147:	MatchTeam( ent, ent->moverState, level.time );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 1148
;1148:}
LABELV $519
endproc Think_MatchTeam 4 12
export SP_func_door
proc SP_func_door 112 12
line 1167
;1149:
;1150:
;1151:/*QUAKED func_door (0 .5 .8) ? START_OPEN x CRUSHER
;1152:TOGGLE		wait in both the start and end states for a trigger event.
;1153:START_OPEN	the door to moves to its destination when spawned, and operate in reverse.  It is used to temporarily or permanently close off an area when triggered (not useful for touch or takedamage doors).
;1154:NOMONSTER	monsters will not trigger this door
;1155:
;1156:"model2"	.md3 model to also draw
;1157:"angle"		determines the opening direction
;1158:"targetname" if set, no touch field will be spawned and a remote button or trigger field activates the door.
;1159:"speed"		movement speed (100 default)
;1160:"wait"		wait before returning (3 default, -1 = never return)
;1161:"lip"		lip remaining at end of move (8 default)
;1162:"dmg"		damage to inflict when blocked (2 default)
;1163:"color"		constantLight color
;1164:"light"		constantLight radius
;1165:"health"	if set, the door must be shot open
;1166:*/
;1167:void SP_func_door (gentity_t *ent) {
line 1173
;1168:	vec3_t	abs_movedir;
;1169:	float	distance;
;1170:	vec3_t	size;
;1171:	float	lip;
;1172:
;1173:	ent->sound1to2 = ent->sound2to1 = G_SoundIndex("sound/movers/doors/dr1_strt.wav");
ADDRGP4 $522
ARGP4
ADDRLP4 32
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 596
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
ADDRLP4 36
INDIRP4
CNSTI4 592
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 1174
;1174:	ent->soundPos1 = ent->soundPos2 = G_SoundIndex("sound/movers/doors/dr1_end.wav");
ADDRGP4 $523
ARGP4
ADDRLP4 40
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 600
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 588
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 1176
;1175:
;1176:	ent->blocked = Blocked_Door;
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
ADDRGP4 Blocked_Door
ASGNP4
line 1179
;1177:
;1178:	// default speed of 400
;1179:	if (!ent->speed)
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
CNSTF4 0
NEF4 $524
line 1180
;1180:		ent->speed = 400;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTF4 1137180672
ASGNF4
LABELV $524
line 1183
;1181:
;1182:	// default wait of 2 seconds
;1183:	if (!ent->wait)
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
INDIRF4
CNSTF4 0
NEF4 $526
line 1184
;1184:		ent->wait = 2;
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
CNSTF4 1073741824
ASGNF4
LABELV $526
line 1185
;1185:	ent->wait *= 1000;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTF4 1148846080
ADDRLP4 48
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1188
;1186:
;1187:	// default lip of 8 units
;1188:	G_SpawnFloat( "lip", "8", &lip );
ADDRGP4 $528
ARGP4
ADDRGP4 $529
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1191
;1189:
;1190:	// default damage of 2 points
;1191:	G_SpawnInt( "dmg", "2", &ent->damage );
ADDRGP4 $530
ARGP4
ADDRGP4 $531
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 764
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1194
;1192:
;1193:	// first position at start
;1194:	VectorCopy( ent->s.origin, ent->pos1 );
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 620
ADDP4
ADDRLP4 52
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1197
;1195:
;1196:	// calculate second position
;1197:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
CNSTI4 548
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1198
;1198:	G_SetMovedir (ent->s.angles, ent->movedir);
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 692
ADDP4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
line 1199
;1199:	abs_movedir[0] = fabs(ent->movedir[0]);
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
INDIRF4
ARGF4
ADDRLP4 64
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 64
INDIRF4
ASGNF4
line 1200
;1200:	abs_movedir[1] = fabs(ent->movedir[1]);
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
INDIRF4
ARGF4
ADDRLP4 68
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 68
INDIRF4
ASGNF4
line 1201
;1201:	abs_movedir[2] = fabs(ent->movedir[2]);
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 72
INDIRF4
ASGNF4
line 1202
;1202:	VectorSubtract( ent->r.maxs, ent->r.mins, size );
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 76
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDRLP4 76
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 76
INDIRP4
CNSTI4 460
ADDP4
INDIRF4
ADDRLP4 76
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12+8
ADDRLP4 80
INDIRP4
CNSTI4 464
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1203
;1203:	distance = DotProduct( abs_movedir, size ) - lip;
ADDRLP4 24
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ADDRLP4 28
INDIRF4
SUBF4
ASGNF4
line 1204
;1204:	VectorMA( ent->pos1, distance, ent->movedir, ent->pos2 );
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 632
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 692
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 636
ADDP4
ADDRLP4 88
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 696
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 640
ADDP4
ADDRLP4 92
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 700
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
line 1207
;1205:
;1206:	// if "start_open", reverse position 1 and 2
;1207:	if ( ent->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $540
line 1210
;1208:		vec3_t	temp;
;1209:
;1210:		VectorCopy( ent->pos2, temp );
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRB
ASGNB 12
line 1211
;1211:		VectorCopy( ent->s.origin, ent->pos2 );
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
CNSTI4 632
ADDP4
ADDRLP4 108
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1212
;1212:		VectorCopy( temp, ent->pos1 );
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
ADDRLP4 96
INDIRB
ASGNB 12
line 1213
;1213:	}
LABELV $540
line 1215
;1214:
;1215:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1217
;1216:
;1217:	ent->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1219
;1218:
;1219:	if ( ! (ent->flags & FL_TEAMSLAVE ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $543
line 1222
;1220:		int health;
;1221:
;1222:		G_SpawnInt( "health", "0", &health );
ADDRGP4 $545
ARGP4
ADDRGP4 $546
ARGP4
ADDRLP4 96
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1223
;1223:		if ( health ) {
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $547
line 1224
;1224:			ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
line 1225
;1225:		}
LABELV $547
line 1226
;1226:		if ( ent->targetname || health ) {
ADDRFP4 0
INDIRP4
CNSTI4 660
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $551
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $549
LABELV $551
line 1228
;1227:			// non touch/shoot doors
;1228:			ent->think = Think_MatchTeam;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 Think_MatchTeam
ASGNP4
line 1229
;1229:		} else {
ADDRGP4 $550
JUMPV
LABELV $549
line 1230
;1230:			ent->think = Think_SpawnNewDoorTrigger;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 Think_SpawnNewDoorTrigger
ASGNP4
line 1231
;1231:		}
LABELV $550
line 1232
;1232:	}
LABELV $543
line 1235
;1233:
;1234:
;1235:}
LABELV $521
endproc SP_func_door 112 12
export SP_func_door_rotating
proc SP_func_door_rotating 96 12
line 1257
;1236:
;1237:
;1238:/*QUAKED func_door_rotating (0 .5 .8) START_OPEN CRUSHER REVERSE TOGGLE X_AXIS Y_AXIS
;1239:This is the rotating door... just as the name suggests it's a door that rotates
;1240:START_OPEN	the door to moves to its destination when spawned, and operate in reverse.
;1241:REVERSE		if you want the door to open in the other direction, use this switch.
;1242:TOGGLE		wait in both the start and end states for a trigger event.
;1243:X_AXIS		open on the X-axis instead of the Z-axis
;1244:Y_AXIS		open on the Y-axis instead of the Z-axis
;1245:  
;1246:You need to have an origin brush as part of this entity.  The center of that brush will be
;1247:the point around which it is rotated. It will rotate around the Z axis by default.  You can
;1248:check either the X_AXIS or Y_AXIS box to change that.
;1249:
;1250:"model2"	.md3 model to also draw
;1251:"distance"	how many degrees the door will open
;1252:"speed"	 	how fast the door will open (degrees/second)
;1253:"color"		constantLight color
;1254:"light"		constantLight radius
;1255:*/
;1256:
;1257:void SP_func_door_rotating ( gentity_t *ent ) {
line 1258
;1258:	ent->sound1to2 = ent->sound2to1 = G_SoundIndex("sound/movers/doors/dr1_strt.wav");
ADDRGP4 $522
ARGP4
ADDRLP4 0
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 596
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 592
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1259
;1259:	ent->soundPos1 = ent->soundPos2 = G_SoundIndex("sound/movers/doors/dr1_end.wav");
ADDRGP4 $523
ARGP4
ADDRLP4 8
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 600
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 588
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1261
;1260:
;1261:	ent->blocked = Blocked_Door;
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
ADDRGP4 Blocked_Door
ASGNP4
line 1264
;1262:
;1263:	// default speed of 120
;1264:	if (!ent->speed)
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
CNSTF4 0
NEF4 $553
line 1265
;1265:		ent->speed = 120;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTF4 1123024896
ASGNF4
LABELV $553
line 1268
;1266:
;1267:	// if speed is negative, positize it and add reverse flag
;1268:	if ( ent->speed < 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
CNSTF4 0
GEF4 $555
line 1269
;1269:		ent->speed *= -1;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTF4 3212836864
ADDRLP4 16
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1270
;1270:		ent->spawnflags |= 8;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1271
;1271:	}
LABELV $555
line 1274
;1272:
;1273:	// default of 2 seconds
;1274:	if (!ent->wait)
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
INDIRF4
CNSTF4 0
NEF4 $557
line 1275
;1275:		ent->wait = 2;
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
CNSTF4 1073741824
ASGNF4
LABELV $557
line 1276
;1276:	ent->wait *= 1000;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTF4 1148846080
ADDRLP4 16
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1279
;1277:	
;1278:	// set the axis of rotation
;1279:	VectorClear( ent->movedir );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
CNSTF4 0
ASGNF4
ADDRLP4 20
INDIRP4
CNSTI4 700
ADDP4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 20
INDIRP4
CNSTI4 696
ADDP4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 20
INDIRP4
CNSTI4 692
ADDP4
ADDRLP4 24
INDIRF4
ASGNF4
line 1280
;1280:	VectorClear( ent->s.angles );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
CNSTF4 0
ASGNF4
ADDRLP4 28
INDIRP4
CNSTI4 124
ADDP4
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 28
INDIRP4
CNSTI4 120
ADDP4
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 28
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 32
INDIRF4
ASGNF4
line 1282
;1281:	
;1282:	if ( ent->spawnflags & 32 ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $559
line 1283
;1283:		ent->movedir[2] = 1.0;
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
CNSTF4 1065353216
ASGNF4
line 1284
;1284:	} else if ( ent->spawnflags & 64 ) {
ADDRGP4 $560
JUMPV
LABELV $559
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $561
line 1285
;1285:		ent->movedir[0] = 1.0;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTF4 1065353216
ASGNF4
line 1286
;1286:	} else {
ADDRGP4 $562
JUMPV
LABELV $561
line 1287
;1287:		ent->movedir[1] = 1.0;
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
CNSTF4 1065353216
ASGNF4
line 1288
;1288:	}
LABELV $562
LABELV $560
line 1291
;1289:
;1290:	// reverse direction if necessary
;1291:	if ( ent->spawnflags & 8 )
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $563
line 1292
;1292:		VectorNegate ( ent->movedir, ent->movedir );
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
NEGF4
ASGNF4
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
NEGF4
ASGNF4
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRF4
NEGF4
ASGNF4
LABELV $563
line 1296
;1293:
;1294:	// default distance of 90 degrees. This is something the mapper should not
;1295:	// leave out, so we'll tell him if he does.
;1296:	if ( !ent->distance ) {
ADDRFP4 0
INDIRP4
CNSTI4 888
ADDP4
INDIRF4
CNSTF4 0
NEF4 $565
line 1297
;1297:		G_Printf("%s at %s with no distance set.\n",
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 48
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $567
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1299
;1298:		ent->classname, vtos(ent->s.origin));
;1299:		ent->distance = 90.0;
ADDRFP4 0
INDIRP4
CNSTI4 888
ADDP4
CNSTF4 1119092736
ASGNF4
line 1300
;1300:	}
LABELV $565
line 1302
;1301:	
;1302:	VectorCopy( ent->s.angles, ent->pos1 );
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 620
ADDP4
ADDRLP4 48
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1303
;1303:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
CNSTI4 548
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1304
;1304:	VectorMA ( ent->pos1, ent->distance, ent->movedir, ent->pos2 );
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 632
ADDP4
ADDRLP4 56
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 692
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 888
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 636
ADDP4
ADDRLP4 60
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 696
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 888
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 640
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 700
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 888
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1307
;1305:
;1306:	// if "start_open", reverse position 1 and 2
;1307:	if ( ent->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $568
line 1310
;1308:		vec3_t	temp;
;1309:
;1310:		VectorCopy( ent->pos2, temp );
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRB
ASGNB 12
line 1311
;1311:		VectorCopy( ent->s.angles, ent->pos2 );
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 632
ADDP4
ADDRLP4 80
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1312
;1312:		VectorCopy( temp, ent->pos1 );
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
ADDRLP4 68
INDIRB
ASGNB 12
line 1313
;1313:		VectorNegate ( ent->movedir, ent->movedir );
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRF4
NEGF4
ASGNF4
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRF4
NEGF4
ASGNF4
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRF4
NEGF4
ASGNF4
line 1314
;1314:	}
LABELV $568
line 1317
;1315:	
;1316:	// set origin
;1317:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1318
;1318:	VectorCopy( ent->s.pos.trBase, ent->r.currentOrigin );
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1320
;1319:
;1320:	InitRotator( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitRotator
CALLV
pop
line 1322
;1321:
;1322:	ent->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1324
;1323:
;1324:	if ( ! (ent->flags & FL_TEAMSLAVE ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $571
line 1327
;1325:		int health;
;1326:
;1327:		G_SpawnInt( "health", "0", &health );
ADDRGP4 $545
ARGP4
ADDRGP4 $546
ARGP4
ADDRLP4 76
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1328
;1328:		if ( health ) {
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $573
line 1329
;1329:			ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
line 1330
;1330:		}
LABELV $573
line 1331
;1331:		if ( ent->targetname || health ) {
ADDRFP4 0
INDIRP4
CNSTI4 660
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $577
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $575
LABELV $577
line 1333
;1332:			// non touch/shoot doors
;1333:			ent->think = Think_MatchTeam;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 Think_MatchTeam
ASGNP4
line 1334
;1334:		} else {
ADDRGP4 $576
JUMPV
LABELV $575
line 1335
;1335:			ent->think = Think_SpawnNewDoorTrigger;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 Think_SpawnNewDoorTrigger
ASGNP4
line 1336
;1336:		}
LABELV $576
line 1337
;1337:	}
LABELV $571
line 1338
;1338:}
LABELV $552
endproc SP_func_door_rotating 96 12
export Touch_Plat
proc Touch_Plat 4 0
line 1355
;1339:
;1340:/*
;1341:===============================================================================
;1342:
;1343:PLAT
;1344:
;1345:===============================================================================
;1346:*/
;1347:
;1348:/*
;1349:==============
;1350:Touch_Plat
;1351:
;1352:Don't allow decent if a living player is on it
;1353:===============
;1354:*/
;1355:void Touch_Plat( gentity_t *ent, gentity_t *other, trace_t *trace ) {
line 1356
;1356:	if ( !other->client || other->client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $581
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $579
LABELV $581
line 1357
;1357:		return;
ADDRGP4 $578
JUMPV
LABELV $579
line 1361
;1358:	}
;1359:
;1360:	// delay return-to-pos1 by one second
;1361:	if ( ent->moverState == MOVER_POS2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
CNSTI4 1
NEI4 $582
line 1362
;1362:		ent->nextthink = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 1363
;1363:	}
LABELV $582
line 1364
;1364:}
LABELV $578
endproc Touch_Plat 4 0
export Touch_PlatCenterTrigger
proc Touch_PlatCenterTrigger 4 12
line 1373
;1365:
;1366:/*
;1367:==============
;1368:Touch_PlatCenterTrigger
;1369:
;1370:If the plat is at the bottom position, start it going up
;1371:===============
;1372:*/
;1373:void Touch_PlatCenterTrigger(gentity_t *ent, gentity_t *other, trace_t *trace ) {
line 1374
;1374:	if ( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $586
line 1375
;1375:		return;
ADDRGP4 $585
JUMPV
LABELV $586
line 1378
;1376:	}
;1377:
;1378:	if ( ent->parent->moverState == MOVER_POS1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
CNSTI4 0
NEI4 $588
line 1379
;1379:		Use_BinaryMover( ent->parent, ent, other );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Use_BinaryMover
CALLV
pop
line 1380
;1380:	}
LABELV $588
line 1381
;1381:}
LABELV $585
endproc Touch_PlatCenterTrigger 4 12
export SpawnPlatTrigger
proc SpawnPlatTrigger 60 4
line 1393
;1382:
;1383:
;1384:/*
;1385:================
;1386:SpawnPlatTrigger
;1387:
;1388:Spawn a trigger in the middle of the plat's low position
;1389:Elevator cars require that the trigger extend through the entire low position,
;1390:not just sit on top of it.
;1391:================
;1392:*/
;1393:void SpawnPlatTrigger( gentity_t *ent ) {
line 1399
;1394:	gentity_t	*trigger;
;1395:	vec3_t	tmin, tmax;
;1396:
;1397:	// the middle trigger will be a thin trigger just
;1398:	// above the starting position
;1399:	trigger = G_Spawn();
ADDRLP4 28
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 1400
;1400:	trigger->classname = "plat_trigger";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $591
ASGNP4
line 1401
;1401:	trigger->touch = Touch_PlatCenterTrigger;
ADDRLP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRGP4 Touch_PlatCenterTrigger
ASGNP4
line 1402
;1402:	trigger->r.contents = CONTENTS_TRIGGER;
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 1073741824
ASGNI4
line 1403
;1403:	trigger->parent = ent;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1405
;1404:	
;1405:	tmin[0] = ent->pos1[0] + ent->r.mins[0] + 33;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ADDF4
CNSTF4 1107558400
ADDF4
ASGNF4
line 1406
;1406:	tmin[1] = ent->pos1[1] + ent->r.mins[1] + 33;
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+4
ADDRLP4 36
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDF4
CNSTF4 1107558400
ADDF4
ASGNF4
line 1407
;1407:	tmin[2] = ent->pos1[2] + ent->r.mins[2];
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+8
ADDRLP4 40
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1409
;1408:
;1409:	tmax[0] = ent->pos1[0] + ent->r.maxs[0] - 33;
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 44
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDF4
CNSTF4 1107558400
SUBF4
ASGNF4
line 1410
;1410:	tmax[1] = ent->pos1[1] + ent->r.maxs[1] - 33;
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16+4
ADDRLP4 48
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 460
ADDP4
INDIRF4
ADDF4
CNSTF4 1107558400
SUBF4
ASGNF4
line 1411
;1411:	tmax[2] = ent->pos1[2] + ent->r.maxs[2] + 8;
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16+8
ADDRLP4 52
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 464
ADDP4
INDIRF4
ADDF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 1413
;1412:
;1413:	if ( tmax[0] <= tmin[0] ) {
ADDRLP4 16
INDIRF4
ADDRLP4 4
INDIRF4
GTF4 $596
line 1414
;1414:		tmin[0] = ent->pos1[0] + (ent->r.mins[0] + ent->r.maxs[0]) *0.5;
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 56
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 56
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 1415
;1415:		tmax[0] = tmin[0] + 1;
ADDRLP4 16
ADDRLP4 4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1416
;1416:	}
LABELV $596
line 1417
;1417:	if ( tmax[1] <= tmin[1] ) {
ADDRLP4 16+4
INDIRF4
ADDRLP4 4+4
INDIRF4
GTF4 $598
line 1418
;1418:		tmin[1] = ent->pos1[1] + (ent->r.mins[1] + ent->r.maxs[1]) *0.5;
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+4
ADDRLP4 56
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 56
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 460
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 1419
;1419:		tmax[1] = tmin[1] + 1;
ADDRLP4 16+4
ADDRLP4 4+4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1420
;1420:	}
LABELV $598
line 1422
;1421:	
;1422:	VectorCopy (tmin, trigger->r.mins);
ADDRLP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 1423
;1423:	VectorCopy (tmax, trigger->r.maxs);
ADDRLP4 0
INDIRP4
CNSTI4 456
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 1425
;1424:
;1425:	trap_LinkEntity (trigger);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1426
;1426:}
LABELV $590
endproc SpawnPlatTrigger 60 4
export SP_func_plat
proc SP_func_plat 56 12
line 1440
;1427:
;1428:
;1429:/*QUAKED func_plat (0 .5 .8) ?
;1430:Plats are always drawn in the extended position so they will light correctly.
;1431:
;1432:"lip"		default 8, protrusion above rest position
;1433:"height"	total height of movement, defaults to model height
;1434:"speed"		overrides default 200.
;1435:"dmg"		overrides default 2
;1436:"model2"	.md3 model to also draw
;1437:"color"		constantLight color
;1438:"light"		constantLight radius
;1439:*/
;1440:void SP_func_plat (gentity_t *ent) {
line 1443
;1441:	float		lip, height;
;1442:
;1443:	ent->sound1to2 = ent->sound2to1 = G_SoundIndex("sound/movers/plats/pt1_strt.wav");
ADDRGP4 $606
ARGP4
ADDRLP4 8
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 596
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 592
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1444
;1444:	ent->soundPos1 = ent->soundPos2 = G_SoundIndex("sound/movers/plats/pt1_end.wav");
ADDRGP4 $607
ARGP4
ADDRLP4 16
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 600
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 588
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1446
;1445:
;1446:	VectorClear (ent->s.angles);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
CNSTF4 0
ASGNF4
ADDRLP4 24
INDIRP4
CNSTI4 124
ADDP4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 24
INDIRP4
CNSTI4 120
ADDP4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 24
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 28
INDIRF4
ASGNF4
line 1448
;1447:
;1448:	G_SpawnFloat( "speed", "200", &ent->speed );
ADDRGP4 $608
ARGP4
ADDRGP4 $609
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1449
;1449:	G_SpawnInt( "dmg", "2", &ent->damage );
ADDRGP4 $530
ARGP4
ADDRGP4 $531
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 764
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1450
;1450:	G_SpawnFloat( "wait", "1", &ent->wait );
ADDRGP4 $610
ARGP4
ADDRGP4 $611
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1451
;1451:	G_SpawnFloat( "lip", "8", &lip );
ADDRGP4 $528
ARGP4
ADDRGP4 $529
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1453
;1452:
;1453:	ent->wait = 1000;
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
CNSTF4 1148846080
ASGNF4
line 1456
;1454:
;1455:	// create second position
;1456:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 548
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1458
;1457:
;1458:	if ( !G_SpawnFloat( "height", "0", &height ) ) {
ADDRGP4 $614
ARGP4
ADDRGP4 $546
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 36
ADDRGP4 G_SpawnFloat
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $612
line 1459
;1459:		height = (ent->r.maxs[2] - ent->r.mins[2]) - lip;
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 40
INDIRP4
CNSTI4 464
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
SUBF4
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
line 1460
;1460:	}
LABELV $612
line 1463
;1461:
;1462:	// pos1 is the rest (bottom) position, pos2 is the top
;1463:	VectorCopy( ent->s.origin, ent->pos2 );
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 632
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1464
;1464:	VectorCopy( ent->pos2, ent->pos1 );
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 620
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 632
ADDP4
INDIRB
ASGNB 12
line 1465
;1465:	ent->pos1[2] -= height;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 628
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
line 1467
;1466:
;1467:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1471
;1468:
;1469:	// touch function keeps the plat from returning while
;1470:	// a live player is standing on it
;1471:	ent->touch = Touch_Plat;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRGP4 Touch_Plat
ASGNP4
line 1473
;1472:
;1473:	ent->blocked = Blocked_Door;
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
ADDRGP4 Blocked_Door
ASGNP4
line 1475
;1474:
;1475:	ent->parent = ent;	// so it can be treated as a door
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 608
ADDP4
ADDRLP4 52
INDIRP4
ASGNP4
line 1478
;1476:
;1477:	// spawn the trigger if one hasn't been custom made
;1478:	if ( !ent->targetname ) {
ADDRFP4 0
INDIRP4
CNSTI4 660
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $615
line 1479
;1479:		SpawnPlatTrigger(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SpawnPlatTrigger
CALLV
pop
line 1480
;1480:	}
LABELV $615
line 1481
;1481:}
LABELV $605
endproc SP_func_plat 56 12
export Touch_Button
proc Touch_Button 4 12
line 1498
;1482:
;1483:
;1484:/*
;1485:===============================================================================
;1486:
;1487:BUTTON
;1488:
;1489:===============================================================================
;1490:*/
;1491:
;1492:/*
;1493:==============
;1494:Touch_Button
;1495:
;1496:===============
;1497:*/
;1498:void Touch_Button(gentity_t *ent, gentity_t *other, trace_t *trace ) {
line 1499
;1499:	if ( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $618
line 1500
;1500:		return;
ADDRGP4 $617
JUMPV
LABELV $618
line 1503
;1501:	}
;1502:
;1503:	if ( ent->moverState == MOVER_POS1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
CNSTI4 0
NEI4 $620
line 1504
;1504:		Use_BinaryMover( ent, other, other );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Use_BinaryMover
CALLV
pop
line 1505
;1505:	}
LABELV $620
line 1506
;1506:}
LABELV $617
endproc Touch_Button 4 12
export SP_func_button
proc SP_func_button 84 12
line 1522
;1507:
;1508:
;1509:/*QUAKED func_button (0 .5 .8) ?
;1510:When a button is touched, it moves some distance in the direction of it's angle, triggers all of it's targets, waits some time, then returns to it's original position where it can be triggered again.
;1511:
;1512:"model2"	.md3 model to also draw
;1513:"angle"		determines the opening direction
;1514:"target"	all entities with a matching targetname will be used
;1515:"speed"		override the default 40 speed
;1516:"wait"		override the default 1 second wait (-1 = never return)
;1517:"lip"		override the default 4 pixel lip remaining at end of move
;1518:"health"	if set, the button must be killed instead of touched
;1519:"color"		constantLight color
;1520:"light"		constantLight radius
;1521:*/
;1522:void SP_func_button( gentity_t *ent ) {
line 1528
;1523:	vec3_t		abs_movedir;
;1524:	float		distance;
;1525:	vec3_t		size;
;1526:	float		lip;
;1527:
;1528:	ent->sound1to2 = G_SoundIndex("sound/movers/switches/butn2.wav");
ADDRGP4 $623
ARGP4
ADDRLP4 32
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 1530
;1529:	
;1530:	if ( !ent->speed ) {
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
CNSTF4 0
NEF4 $624
line 1531
;1531:		ent->speed = 40;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTF4 1109393408
ASGNF4
line 1532
;1532:	}
LABELV $624
line 1534
;1533:
;1534:	if ( !ent->wait ) {
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
INDIRF4
CNSTF4 0
NEF4 $626
line 1535
;1535:		ent->wait = 1;
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
CNSTF4 1065353216
ASGNF4
line 1536
;1536:	}
LABELV $626
line 1537
;1537:	ent->wait *= 1000;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTF4 1148846080
ADDRLP4 36
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1540
;1538:
;1539:	// first position
;1540:	VectorCopy( ent->s.origin, ent->pos1 );
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 620
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1543
;1541:
;1542:	// calculate second position
;1543:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 548
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1545
;1544:
;1545:	G_SpawnFloat( "lip", "4", &lip );
ADDRGP4 $528
ARGP4
ADDRGP4 $628
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1547
;1546:
;1547:	G_SetMovedir( ent->s.angles, ent->movedir );
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 48
INDIRP4
CNSTI4 692
ADDP4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
line 1548
;1548:	abs_movedir[0] = fabs(ent->movedir[0]);
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
INDIRF4
ARGF4
ADDRLP4 52
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 52
INDIRF4
ASGNF4
line 1549
;1549:	abs_movedir[1] = fabs(ent->movedir[1]);
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
INDIRF4
ARGF4
ADDRLP4 56
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 56
INDIRF4
ASGNF4
line 1550
;1550:	abs_movedir[2] = fabs(ent->movedir[2]);
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 60
INDIRF4
ASGNF4
line 1551
;1551:	VectorSubtract( ent->r.maxs, ent->r.mins, size );
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 64
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 64
INDIRP4
CNSTI4 460
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12+8
ADDRLP4 68
INDIRP4
CNSTI4 464
ADDP4
INDIRF4
ADDRLP4 68
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1552
;1552:	distance = abs_movedir[0] * size[0] + abs_movedir[1] * size[1] + abs_movedir[2] * size[2] - lip;
ADDRLP4 24
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ADDRLP4 28
INDIRF4
SUBF4
ASGNF4
line 1553
;1553:	VectorMA (ent->pos1, distance, ent->movedir, ent->pos2);
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 632
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
CNSTI4 692
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 636
ADDP4
ADDRLP4 76
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
ADDRLP4 76
INDIRP4
CNSTI4 696
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 640
ADDP4
ADDRLP4 80
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 700
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
line 1555
;1554:
;1555:	if (ent->health) {
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 0
EQI4 $637
line 1557
;1556:		// shootable button
;1557:		ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
line 1558
;1558:	} else {
ADDRGP4 $638
JUMPV
LABELV $637
line 1560
;1559:		// touchable button
;1560:		ent->touch = Touch_Button;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRGP4 Touch_Button
ASGNP4
line 1561
;1561:	}
LABELV $638
line 1563
;1562:
;1563:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1564
;1564:}
LABELV $622
endproc SP_func_button 84 12
export Think_BeginMoving
proc Think_BeginMoving 0 0
line 1588
;1565:
;1566:
;1567:
;1568:/*
;1569:===============================================================================
;1570:
;1571:TRAIN
;1572:
;1573:===============================================================================
;1574:*/
;1575:
;1576:
;1577:#define TRAIN_START_ON		1
;1578:#define TRAIN_TOGGLE		2
;1579:#define TRAIN_BLOCK_STOPS	4
;1580:
;1581:/*
;1582:===============
;1583:Think_BeginMoving
;1584:
;1585:The wait time at a corner has completed, so start moving again
;1586:===============
;1587:*/
;1588:void Think_BeginMoving( gentity_t *ent ) {
line 1589
;1589:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1590
;1590:	ent->s.pos.trType = TR_LINEAR_STOP;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 3
ASGNI4
line 1591
;1591:}
LABELV $639
endproc Think_BeginMoving 0 0
export Reached_Train
proc Reached_Train 48 12
line 1598
;1592:
;1593:/*
;1594:===============
;1595:Reached_Train
;1596:===============
;1597:*/
;1598:void Reached_Train( gentity_t *ent ) {
line 1605
;1599:	gentity_t		*next;
;1600:	float			speed;
;1601:	vec3_t			move;
;1602:	float			length;
;1603:
;1604:	// copy the apropriate values
;1605:	next = ent->nextTrain;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
INDIRP4
ASGNP4
line 1606
;1606:	if ( !next || !next->nextTrain ) {
ADDRLP4 28
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $644
ADDRLP4 0
INDIRP4
CNSTI4 612
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
NEU4 $642
LABELV $644
line 1607
;1607:		return;		// just stop
ADDRGP4 $641
JUMPV
LABELV $642
line 1611
;1608:	}
;1609:
;1610:	// fire all other targets
;1611:	G_UseTargets( next, NULL );
ADDRLP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 1614
;1612:
;1613:	// set the new trajectory
;1614:	ent->nextTrain = next->nextTrain;
ADDRLP4 32
CNSTI4 612
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRP4
ASGNP4
line 1615
;1615:	VectorCopy( next->s.origin, ent->pos1 );
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1616
;1616:	VectorCopy( next->nextTrain->s.origin, ent->pos2 );
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 612
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1619
;1617:
;1618:	// if the path_corner has a speed, use that
;1619:	if ( next->speed ) {
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
CNSTF4 0
EQF4 $645
line 1620
;1620:		speed = next->speed;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
ASGNF4
line 1621
;1621:	} else {
ADDRGP4 $646
JUMPV
LABELV $645
line 1623
;1622:		// otherwise use the train's speed
;1623:		speed = ent->speed;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
ASGNF4
line 1624
;1624:	}
LABELV $646
line 1625
;1625:	if ( speed < 1 ) {
ADDRLP4 16
INDIRF4
CNSTF4 1065353216
GEF4 $647
line 1626
;1626:		speed = 1;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 1627
;1627:	}
LABELV $647
line 1630
;1628:
;1629:	// calculate duration
;1630:	VectorSubtract( ent->pos2, ent->pos1, move );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 36
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 36
INDIRP4
CNSTI4 636
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+8
ADDRLP4 40
INDIRP4
CNSTI4 640
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1631
;1631:	length = VectorLength( move );
ADDRLP4 4
ARGP4
ADDRLP4 44
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 44
INDIRF4
ASGNF4
line 1633
;1632:
;1633:	ent->s.pos.trDuration = length * 1000 / speed;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 1148846080
ADDRLP4 20
INDIRF4
MULF4
ADDRLP4 16
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 1636
;1634:
;1635:	// looping sound
;1636:	ent->s.loopSound = next->soundLoop;
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ASGNI4
line 1639
;1637:
;1638:	// start it going
;1639:	SetMoverState( ent, MOVER_1TO2, level.time );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 SetMoverState
CALLV
pop
line 1642
;1640:
;1641:	// if there is a "wait" value on the target, don't start moving yet
;1642:	if ( next->wait ) {
ADDRLP4 0
INDIRP4
CNSTI4 820
ADDP4
INDIRF4
CNSTF4 0
EQF4 $652
line 1643
;1643:		ent->nextthink = level.time + next->wait * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 0
INDIRP4
CNSTI4 820
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 1644
;1644:		ent->think = Think_BeginMoving;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 Think_BeginMoving
ASGNP4
line 1645
;1645:		ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 1646
;1646:	}
LABELV $652
line 1647
;1647:}
LABELV $641
endproc Reached_Train 48 12
export Think_SetupTrainTargets
proc Think_SetupTrainTargets 28 12
line 1657
;1648:
;1649:
;1650:/*
;1651:===============
;1652:Think_SetupTrainTargets
;1653:
;1654:Link all the corners together
;1655:===============
;1656:*/
;1657:void Think_SetupTrainTargets( gentity_t *ent ) {
line 1660
;1658:	gentity_t		*path, *next, *start;
;1659:
;1660:	ent->nextTrain = G_Find( NULL, FOFS(targetname), ent->target );
CNSTP4 0
ARGP4
CNSTI4 660
ARGI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 612
ADDP4
ADDRLP4 16
INDIRP4
ASGNP4
line 1661
;1661:	if ( !ent->nextTrain ) {
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $656
line 1662
;1662:		G_Printf( "func_train at %s with an unfound target\n",
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $658
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1664
;1663:			vtos(ent->r.absmin) );
;1664:		return;
ADDRGP4 $655
JUMPV
LABELV $656
line 1667
;1665:	}
;1666:
;1667:	start = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 1668
;1668:	for ( path = ent->nextTrain ; path != start ; path = next ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $662
JUMPV
LABELV $659
line 1669
;1669:		if ( !start ) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $663
line 1670
;1670:			start = path;
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
line 1671
;1671:		}
LABELV $663
line 1673
;1672:
;1673:		if ( !path->target ) {
ADDRLP4 4
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $665
line 1674
;1674:			G_Printf( "Train corner at %s without a target\n",
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $667
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1676
;1675:				vtos(path->s.origin) );
;1676:			return;
ADDRGP4 $655
JUMPV
LABELV $665
line 1682
;1677:		}
;1678:
;1679:		// find a path_corner among the targets
;1680:		// there may also be other targets that get fired when the corner
;1681:		// is reached
;1682:		next = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
LABELV $668
line 1683
;1683:		do {
line 1684
;1684:			next = G_Find( next, FOFS(targetname), path->target );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 660
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 1685
;1685:			if ( !next ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $671
line 1686
;1686:				G_Printf( "Train corner at %s without a target path_corner\n",
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $673
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1688
;1687:					vtos(path->s.origin) );
;1688:				return;
ADDRGP4 $655
JUMPV
LABELV $671
line 1690
;1689:			}
;1690:		} while ( strcmp( next->classname, "path_corner" ) );
LABELV $669
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRGP4 $674
ARGP4
ADDRLP4 20
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $668
line 1692
;1691:
;1692:		path->nextTrain = next;
ADDRLP4 4
INDIRP4
CNSTI4 612
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1693
;1693:	}
LABELV $660
line 1668
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $662
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
NEU4 $659
line 1696
;1694:
;1695:	// start the train moving from the first corner
;1696:	Reached_Train( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Reached_Train
CALLV
pop
line 1697
;1697:}
LABELV $655
endproc Think_SetupTrainTargets 28 12
export SP_path_corner
proc SP_path_corner 4 8
line 1707
;1698:
;1699:
;1700:
;1701:/*QUAKED path_corner (.5 .3 0) (-8 -8 -8) (8 8 8)
;1702:Train path corners.
;1703:Target: next path corner and other targets to fire
;1704:"speed" speed to move to the next corner
;1705:"wait" seconds to wait before behining move to next corner
;1706:*/
;1707:void SP_path_corner( gentity_t *self ) {
line 1708
;1708:	if ( !self->targetname ) {
ADDRFP4 0
INDIRP4
CNSTI4 660
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $676
line 1709
;1709:		G_Printf ("path_corner with no targetname at %s\n", vtos(self->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $678
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1710
;1710:		G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1711
;1711:		return;
LABELV $676
line 1714
;1712:	}
;1713:	// path corners don't need to be linked in
;1714:}
LABELV $675
endproc SP_path_corner 4 8
export SP_func_train
proc SP_func_train 12 8
line 1730
;1715:
;1716:
;1717:
;1718:/*QUAKED func_train (0 .5 .8) ? START_ON TOGGLE BLOCK_STOPS
;1719:A train is a mover that moves between path_corner target points.
;1720:Trains MUST HAVE AN ORIGIN BRUSH.
;1721:The train spawns at the first target it is pointing at.
;1722:"model2"	.md3 model to also draw
;1723:"speed"		default 100
;1724:"dmg"		default	2
;1725:"noise"		looping sound to play when the train is in motion
;1726:"target"	next path corner
;1727:"color"		constantLight color
;1728:"light"		constantLight radius
;1729:*/
;1730:void SP_func_train (gentity_t *self) {
line 1731
;1731:	VectorClear (self->s.angles);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 1733
;1732:
;1733:	if (self->spawnflags & TRAIN_BLOCK_STOPS) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $680
line 1734
;1734:		self->damage = 0;
ADDRFP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 0
ASGNI4
line 1735
;1735:	} else {
ADDRGP4 $681
JUMPV
LABELV $680
line 1736
;1736:		if (!self->damage) {
ADDRFP4 0
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
CNSTI4 0
NEI4 $682
line 1737
;1737:			self->damage = 2;
ADDRFP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 2
ASGNI4
line 1738
;1738:		}
LABELV $682
line 1739
;1739:	}
LABELV $681
line 1741
;1740:
;1741:	if ( !self->speed ) {
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
CNSTF4 0
NEF4 $684
line 1742
;1742:		self->speed = 100;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTF4 1120403456
ASGNF4
line 1743
;1743:	}
LABELV $684
line 1745
;1744:
;1745:	if ( !self->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $686
line 1746
;1746:		G_Printf ("func_train without a target at %s\n", vtos(self->r.absmin));
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $688
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1747
;1747:		G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1748
;1748:		return;
ADDRGP4 $679
JUMPV
LABELV $686
line 1751
;1749:	}
;1750:
;1751:	trap_SetBrushModel( self, self->model );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 548
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1752
;1752:	InitMover( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1754
;1753:
;1754:	self->reached = Reached_Train;
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRGP4 Reached_Train
ASGNP4
line 1758
;1755:
;1756:	// start trains on the second frame, to make sure their targets have had
;1757:	// a chance to spawn
;1758:	self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1759
;1759:	self->think = Think_SetupTrainTargets;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 Think_SetupTrainTargets
ASGNP4
line 1760
;1760:}
LABELV $679
endproc SP_func_train 12 8
export SP_func_static
proc SP_func_static 12 8
line 1777
;1761:
;1762:/*
;1763:===============================================================================
;1764:
;1765:STATIC
;1766:
;1767:===============================================================================
;1768:*/
;1769:
;1770:
;1771:/*QUAKED func_static (0 .5 .8) ?
;1772:A bmodel that just sits there, doing nothing.  Can be used for conditional walls and models.
;1773:"model2"	.md3 model to also draw
;1774:"color"		constantLight color
;1775:"light"		constantLight radius
;1776:*/
;1777:void SP_func_static( gentity_t *ent ) {
line 1778
;1778:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1779
;1779:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1780
;1780:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1781
;1781:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1782
;1782:}
LABELV $690
endproc SP_func_static 12 8
export SP_func_rotating
proc SP_func_rotating 16 8
line 1805
;1783:
;1784:
;1785:/*
;1786:===============================================================================
;1787:
;1788:ROTATING
;1789:
;1790:===============================================================================
;1791:*/
;1792:
;1793:
;1794:/*QUAKED func_rotating (0 .5 .8) ? START_ON - X_AXIS Y_AXIS
;1795:You need to have an origin brush as part of this entity.  The center of that brush will be
;1796:the point around which it is rotated. It will rotate around the Z axis by default.  You can
;1797:check either the X_AXIS or Y_AXIS box to change that.
;1798:
;1799:"model2"	.md3 model to also draw
;1800:"speed"		determines how fast it moves; default value is 100.
;1801:"dmg"		damage to inflict when blocked (2 default)
;1802:"color"		constantLight color
;1803:"light"		constantLight radius
;1804:*/
;1805:void SP_func_rotating (gentity_t *ent) {
line 1806
;1806:	if ( !ent->speed ) {
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
CNSTF4 0
NEF4 $692
line 1807
;1807:		ent->speed = 100;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTF4 1120403456
ASGNF4
line 1808
;1808:	}
LABELV $692
line 1811
;1809:
;1810:	// set the axis of rotation
;1811:	ent->s.apos.trType = TR_LINEAR;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 2
ASGNI4
line 1812
;1812:	if ( ent->spawnflags & 4 ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $694
line 1813
;1813:		ent->s.apos.trDelta[2] = ent->speed;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
ASGNF4
line 1814
;1814:	} else if ( ent->spawnflags & 8 ) {
ADDRGP4 $695
JUMPV
LABELV $694
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $696
line 1815
;1815:		ent->s.apos.trDelta[0] = ent->speed;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
ASGNF4
line 1816
;1816:	} else {
ADDRGP4 $697
JUMPV
LABELV $696
line 1817
;1817:		ent->s.apos.trDelta[1] = ent->speed;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
ASGNF4
line 1818
;1818:	}
LABELV $697
LABELV $695
line 1820
;1819:
;1820:	if (!ent->damage) {
ADDRFP4 0
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
CNSTI4 0
NEI4 $698
line 1821
;1821:		ent->damage = 2;
ADDRFP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 2
ASGNI4
line 1822
;1822:	}
LABELV $698
line 1824
;1823:
;1824:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1825
;1825:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1827
;1826:
;1827:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1828
;1828:	VectorCopy( ent->s.pos.trBase, ent->r.currentOrigin );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1829
;1829:	VectorCopy( ent->s.apos.trBase, ent->r.currentAngles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 508
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 1831
;1830:
;1831:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1832
;1832:}
LABELV $691
endproc SP_func_rotating 16 8
export SP_func_bobbing
proc SP_func_bobbing 28 12
line 1854
;1833:
;1834:
;1835:/*
;1836:===============================================================================
;1837:
;1838:BOBBING
;1839:
;1840:===============================================================================
;1841:*/
;1842:
;1843:
;1844:/*QUAKED func_bobbing (0 .5 .8) ? X_AXIS Y_AXIS
;1845:Normally bobs on the Z axis
;1846:"model2"	.md3 model to also draw
;1847:"height"	amplitude of bob (32 default)
;1848:"speed"		seconds to complete a bob cycle (4 default)
;1849:"phase"		the 0.0 to 1.0 offset in the cycle to start at
;1850:"dmg"		damage to inflict when blocked (2 default)
;1851:"color"		constantLight color
;1852:"light"		constantLight radius
;1853:*/
;1854:void SP_func_bobbing (gentity_t *ent) {
line 1858
;1855:	float		height;
;1856:	float		phase;
;1857:
;1858:	G_SpawnFloat( "speed", "4", &ent->speed );
ADDRGP4 $608
ARGP4
ADDRGP4 $628
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1859
;1859:	G_SpawnFloat( "height", "32", &height );
ADDRGP4 $614
ARGP4
ADDRGP4 $701
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1860
;1860:	G_SpawnInt( "dmg", "2", &ent->damage );
ADDRGP4 $530
ARGP4
ADDRGP4 $531
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 764
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1861
;1861:	G_SpawnFloat( "phase", "0", &phase );
ADDRGP4 $702
ARGP4
ADDRGP4 $546
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1863
;1862:
;1863:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 548
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1864
;1864:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1866
;1865:
;1866:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1867
;1867:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1869
;1868:
;1869:	ent->s.pos.trDuration = ent->speed * 1000;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 1148846080
ADDRLP4 20
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1870
;1870:	ent->s.pos.trTime = ent->s.pos.trDuration * phase;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1871
;1871:	ent->s.pos.trType = TR_SINE;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 4
ASGNI4
line 1874
;1872:
;1873:	// set the axis of bobbing
;1874:	if ( ent->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $703
line 1875
;1875:		ent->s.pos.trDelta[0] = height;
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRF4
ASGNF4
line 1876
;1876:	} else if ( ent->spawnflags & 2 ) {
ADDRGP4 $704
JUMPV
LABELV $703
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $705
line 1877
;1877:		ent->s.pos.trDelta[1] = height;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0
INDIRF4
ASGNF4
line 1878
;1878:	} else {
ADDRGP4 $706
JUMPV
LABELV $705
line 1879
;1879:		ent->s.pos.trDelta[2] = height;
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0
INDIRF4
ASGNF4
line 1880
;1880:	}
LABELV $706
LABELV $704
line 1881
;1881:}
LABELV $700
endproc SP_func_bobbing 28 12
export SP_func_pendulum
proc SP_func_pendulum 44 12
line 1903
;1882:
;1883:/*
;1884:===============================================================================
;1885:
;1886:PENDULUM
;1887:
;1888:===============================================================================
;1889:*/
;1890:
;1891:
;1892:/*QUAKED func_pendulum (0 .5 .8) ?
;1893:You need to have an origin brush as part of this entity.
;1894:Pendulums always swing north / south on unrotated models.  Add an angles field to the model to allow rotation in other directions.
;1895:Pendulum frequency is a physical constant based on the length of the beam and gravity.
;1896:"model2"	.md3 model to also draw
;1897:"speed"		the number of degrees each way the pendulum swings, (30 default)
;1898:"phase"		the 0.0 to 1.0 offset in the cycle to start at
;1899:"dmg"		damage to inflict when blocked (2 default)
;1900:"color"		constantLight color
;1901:"light"		constantLight radius
;1902:*/
;1903:void SP_func_pendulum(gentity_t *ent) {
line 1909
;1904:	float		freq;
;1905:	float		length;
;1906:	float		phase;
;1907:	float		speed;
;1908:
;1909:	G_SpawnFloat( "speed", "30", &speed );
ADDRGP4 $608
ARGP4
ADDRGP4 $708
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1910
;1910:	G_SpawnInt( "dmg", "2", &ent->damage );
ADDRGP4 $530
ARGP4
ADDRGP4 $531
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 764
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1911
;1911:	G_SpawnFloat( "phase", "0", &phase );
ADDRGP4 $702
ARGP4
ADDRGP4 $546
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1913
;1912:
;1913:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 548
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1916
;1914:
;1915:	// find pendulum length
;1916:	length = fabs( ent->r.mins[2] );
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 1917
;1917:	if ( length < 8 ) {
ADDRLP4 0
INDIRF4
CNSTF4 1090519040
GEF4 $709
line 1918
;1918:		length = 8;
ADDRLP4 0
CNSTF4 1090519040
ASGNF4
line 1919
;1919:	}
LABELV $709
line 1921
;1920:
;1921:	freq = 1 / ( M_PI * 2 ) * sqrt( g_gravity.value / ( 3 * length ) );
ADDRGP4 g_gravity+8
INDIRF4
CNSTF4 1077936128
ADDRLP4 0
INDIRF4
MULF4
DIVF4
ARGF4
ADDRLP4 24
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 4
CNSTF4 1042479491
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 1923
;1922:
;1923:	ent->s.pos.trDuration = ( 1000 / freq );
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 1148846080
ADDRLP4 4
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 1925
;1924:
;1925:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1927
;1926:
;1927:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1928
;1928:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1930
;1929:
;1930:	VectorCopy( ent->s.angles, ent->s.apos.trBase );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 36
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1932
;1931:
;1932:	ent->s.apos.trDuration = 1000 / freq;
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
CNSTF4 1148846080
ADDRLP4 4
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 1933
;1933:	ent->s.apos.trTime = ent->s.apos.trDuration * phase;
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 8
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1934
;1934:	ent->s.apos.trType = TR_SINE;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 4
ASGNI4
line 1935
;1935:	ent->s.apos.trDelta[2] = speed;
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 1936
;1936:}
LABELV $707
endproc SP_func_pendulum 44 12
bss
export pushed_p
align 4
LABELV pushed_p
skip 4
export pushed
align 4
LABELV pushed
skip 32768
import CheckPlayerPostions
import G_SendCommandToClient
import visible
import findradius
import trap_SnapVector
import trap_GeneticParentsAndChildSelection
import trap_BotResetWeaponState
import trap_BotFreeWeaponState
import trap_BotAllocWeaponState
import trap_BotLoadWeaponWeights
import trap_BotGetWeaponInfo
import trap_BotChooseBestFightWeapon
import trap_BotAddAvoidSpot
import trap_BotInitMoveState
import trap_BotFreeMoveState
import trap_BotAllocMoveState
import trap_BotPredictVisiblePosition
import trap_BotMovementViewTarget
import trap_BotReachabilityArea
import trap_BotResetLastAvoidReach
import trap_BotResetAvoidReach
import trap_BotMoveInDirection
import trap_BotMoveToGoal
import trap_BotResetMoveState
import trap_BotFreeGoalState
import trap_BotAllocGoalState
import trap_BotMutateGoalFuzzyLogic
import trap_BotSaveGoalFuzzyLogic
import trap_BotInterbreedGoalFuzzyLogic
import trap_BotFreeItemWeights
import trap_BotLoadItemWeights
import trap_BotUpdateEntityItems
import trap_BotInitLevelItems
import trap_BotSetAvoidGoalTime
import trap_BotAvoidGoalTime
import trap_BotGetLevelItemGoal
import trap_BotGetMapLocationGoal
import trap_BotGetNextCampSpotGoal
import trap_BotItemGoalInVisButNotVisible
import trap_BotTouchingGoal
import trap_BotChooseNBGItem
import trap_BotChooseLTGItem
import trap_BotGetSecondGoal
import trap_BotGetTopGoal
import trap_BotGoalName
import trap_BotDumpGoalStack
import trap_BotDumpAvoidGoals
import trap_BotEmptyGoalStack
import trap_BotPopGoal
import trap_BotPushGoal
import trap_BotResetAvoidGoals
import trap_BotRemoveFromAvoidGoals
import trap_BotResetGoalState
import trap_BotSetChatName
import trap_BotSetChatGender
import trap_BotLoadChatFile
import trap_BotReplaceSynonyms
import trap_UnifyWhiteSpaces
import trap_BotMatchVariable
import trap_BotFindMatch
import trap_StringContains
import trap_BotGetChatMessage
import trap_BotEnterChat
import trap_BotChatLength
import trap_BotReplyChat
import trap_BotNumInitialChats
import trap_BotInitialChat
import trap_BotNumConsoleMessages
import trap_BotNextConsoleMessage
import trap_BotRemoveConsoleMessage
import trap_BotQueueConsoleMessage
import trap_BotFreeChatState
import trap_BotAllocChatState
import trap_Characteristic_String
import trap_Characteristic_BInteger
import trap_Characteristic_Integer
import trap_Characteristic_BFloat
import trap_Characteristic_Float
import trap_BotFreeCharacter
import trap_BotLoadCharacter
import trap_EA_ResetInput
import trap_EA_GetInput
import trap_EA_EndRegular
import trap_EA_View
import trap_EA_Move
import trap_EA_DelayedJump
import trap_EA_Jump
import trap_EA_SelectWeapon
import trap_EA_MoveRight
import trap_EA_MoveLeft
import trap_EA_MoveBack
import trap_EA_MoveForward
import trap_EA_MoveDown
import trap_EA_MoveUp
import trap_EA_Crouch
import trap_EA_Respawn
import trap_EA_Use
import trap_EA_Attack
import trap_EA_Talk
import trap_EA_Gesture
import trap_EA_Action
import trap_EA_Command
import trap_EA_SayTeam
import trap_EA_Say
import trap_AAS_PredictClientMovement
import trap_AAS_Swimming
import trap_AAS_AlternativeRouteGoals
import trap_AAS_PredictRoute
import trap_AAS_EnableRoutingArea
import trap_AAS_AreaTravelTimeToGoalArea
import trap_AAS_AreaLadder
import trap_AAS_AreaReachability
import trap_AAS_IntForBSPEpairKey
import trap_AAS_FloatForBSPEpairKey
import trap_AAS_VectorForBSPEpairKey
import trap_AAS_ValueForBSPEpairKey
import trap_AAS_NextBSPEntity
import trap_AAS_PointContents
import trap_AAS_TraceAreas
import trap_AAS_PointReachabilityAreaIndex
import trap_AAS_PointAreaNum
import trap_AAS_Time
import trap_AAS_PresenceTypeBoundingBox
import trap_AAS_Initialized
import trap_AAS_EntityInfo
import trap_AAS_AreaInfo
import trap_AAS_BBoxAreas
import trap_BotUserCommand
import trap_BotGetServerCommand
import trap_BotGetSnapshotEntity
import trap_BotLibTest
import trap_BotLibUpdateEntity
import trap_BotLibLoadMap
import trap_BotLibStartFrame
import trap_BotLibDefine
import trap_BotLibVarGet
import trap_BotLibVarSet
import trap_BotLibShutdown
import trap_BotLibSetup
import trap_DebugPolygonDelete
import trap_DebugPolygonCreate
import trap_GetEntityToken
import trap_GetUsercmd
import trap_BotFreeClient
import trap_BotAllocateClient
import trap_EntityContact
import trap_EntitiesInBox
import trap_UnlinkEntity
import trap_LinkEntity
import trap_AreasConnected
import trap_AdjustAreaPortalState
import trap_InPVSIgnorePortals
import trap_InPVS
import trap_PointContents
import trap_Trace
import trap_SetBrushModel
import trap_GetServerinfo
import trap_SetUserinfo
import trap_GetUserinfo
import trap_GetConfigstring
import trap_SetConfigstring
import trap_SendServerCommand
import trap_DropClient
import trap_LocateGameData
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_VariableIntegerValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_SendConsoleCommand
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Milliseconds
import trap_Error
import trap_Printf
import trep_debug
import g_allowDevastator
import g_allowGrapple
import g_CurrentRound
import g_NumRounds
import g_RegenAmmo
import g_RegenHealth
import g_AutoChangeMap
import g_lastmap2
import g_lastmap
import g_randommap
import g_easymap
import g_mapfile
import g_ReverseCTF
import g_GaussRate
import g_GaussSelfDamage
import g_GaussKnockBack
import g_GaussJump
import g_PCTeamkills
import g_GrappleMode
import g_MaxTurrets
import g_Turrets
import g_StartRandom
import g_StartBFG
import g_StartPlasma
import g_StartGauss
import g_StartFlame
import g_StartSingCan
import g_StartGrenade
import g_StartSG
import g_StartMG
import g_StartGauntlet
import g_RedMC
import g_BlueMC
import g_GameMode
import g_instagib
import sv_fps
import g_lightningDamage
import g_truePing
import g_unlaggedVersion
import g_delagHitscan
import g_proxMineTimeout
import g_singlePlayer
import g_enableBreath
import g_enableDust
import g_rankings
import pmove_msec
import pmove_fixed
import g_smoothClients
import g_blueteam
import g_redteam
import g_cubeTimeout
import g_obeliskRespawnDelay
import g_obeliskRegenAmount
import g_obeliskRegenPeriod
import g_obeliskHealth
import g_filterBan
import g_banIPs
import g_teamForceBalance
import g_teamAutoJoin
import g_allowVote
import g_blood
import g_doWarmup
import g_warmup
import g_motd
import g_synchronousClients
import g_weaponTeamRespawn
import g_weaponRespawn
import g_debugDamage
import g_debugAlloc
import g_debugMove
import g_inactivity
import g_forcerespawn
import g_quadfactor
import g_knockback
import g_speed
import g_gravity
import g_needpass
import g_password
import g_friendlyFire
import g_capturelimit
import g_timelimit
import g_fraglimit
import g_dmflags
import g_restarted
import g_maxGameClients
import g_maxclients
import g_cheats
import g_dedicated
import g_gametype
import g_entities
import level
import Pickup_Team
import CheckTeamStatus
import TeamplayInfoMessage
import Team_GetLocationMsg
import Team_GetLocation
import SelectCTFSpawnPoint
import Team_FreeEntity
import Team_ReturnFlag
import Team_InitGame
import Team_CheckHurtCarrier
import Team_FragBonuses
import Team_DroppedFlagThink
import AddTeamScore
import TeamColorString
import OtherTeamName
import TeamName
import OtherTeam
import BotTestAAS
import BotAIStartFrame
import BotAIShutdownClient
import BotAISetupClient
import BotAILoadMap
import BotAIShutdown
import BotAISetup
import BotInterbreedEndMatch
import Svcmd_BotList_f
import Svcmd_AddBot_f
import G_BotConnect
import G_RemoveQueuedBotBegin
import G_CheckBotSpawn
import G_GetBotInfoByName
import G_GetBotInfoByNumber
import G_InitBots
import Svcmd_AbortPodium_f
import SpawnModelsOnVictoryPads
import UpdateTournamentInfo
import G_WriteSessionData
import G_InitWorldSession
import G_InitSessionData
import G_ReadSessionData
import Svcmd_GameMem_f
import G_InitMemory
import G_Alloc
import Team_DropFlags
import CheckObeliskAttack
import Team_CheckDroppedItem
import OnSameTeam
import G_RunClient
import ClientEndFrame
import ClientThink
import ClientCommand
import ClientBegin
import ClientDisconnect
import ClientUserinfoChanged
import ClientConnect
import Team_Point
import G_Error
import G_Printf
import SendScoreboardMessageToAllClients
import G_LogPrintf
import G_RunThink
import CheckTeamLeader
import SetLeader
import FindIntermissionPoint
import DeathmatchScoreboardMessage
import G_SetStats
import MoveClientToIntermission
import fire_flamer
import FireWeapon2
import FireWeapon
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import PlaceMC
import SpotWouldTelefrag
import CalculateRanks
import AddScore
import player_die
import ClientSpawn
import InitBodyQue
import InitClientResp
import InitClientPersistant
import BeginIntermission
import respawn
import CopyToBodyQue
import SelectSpawnPoint
import SetClientViewAngle
import PickTeam
import TeamLeader
import BalanceTeams
import TeamCount
import BuildDisplacer
import BuildMC
import BuildGenerator
import BuildTurret
import G_PredictPlayerMove
import G_UnTimeShiftClient
import G_UndoTimeShiftFor
import G_DoTimeShiftFor
import G_UnTimeShiftAllClients
import G_TimeShiftAllClients
import G_StoreHistory
import G_ResetHistory
import Weapon_HookThink
import Weapon_HookFree
import CheckGauntletAttack
import CalcMuzzlePoint
import LogAccuracyHit
import G_BreakGlass
import TeleportPlayer
import trigger_teleporter_touch
import fire_mg
import fire_turret
import fire_alt_gata
import fire_grapple
import fire_bfg
import fire_rocket
import fire_flame
import fire_alt_rocket
import fire_altgrenade
import fire_bomb
import fire_pdgrenade
import fire_grenade
import fire_plasma2
import fire_plasma
import fire_blaster
import G_RunMissile
import TossClientCubes
import TossClientItems
import body_die
import G_InvulnerabilityEffect
import G_RadiusDamage
import G_Damage
import CanDamage
import G_ExplodeBomb
import G_ExplodeMissile
import BuildShaderStateConfig
import AddRemap
import G_SetOrigin
import G_AddEvent
import G_AddPredictableEvent
import vectoyaw
import vtos
import tv
import G_TouchSolids
import G_TouchTriggers
import G_EntitiesFree
import G_FreeEntity
import G_Sound
import G_TempEntity
import G_Spawn
import G_InitGentity
import G_SetMovedir
import G_UseTargets
import G_PickTarget
import G_Find
import G_KillBox
import G_TeamCommand
import G_SoundIndex
import G_ModelIndex
import SaveRegisteredItems
import RegisterItem
import ClearRegisteredItems
import Touch_Item
import Add_Ammo
import ArmorIndex
import Think_Weapon
import FinishSpawningItem
import G_SpawnItem
import SetRespawn
import LaunchItem
import Drop_Item
import PrecacheItem
import UseHoldableItem
import RespawnItem
import G_RunItem
import G_CheckTeamItems
import Cmd_FollowCycle_f
import SetTeam
import BroadcastTeamChange
import StopFollowing
import Cmd_Score_f
import G_NewString
import G_SpawnEntitiesFromString
import G_SpawnVector
import G_SpawnInt
import G_SpawnFloat
import G_SpawnString
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
LABELV $708
byte 1 51
byte 1 48
byte 1 0
align 1
LABELV $702
byte 1 112
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $701
byte 1 51
byte 1 50
byte 1 0
align 1
LABELV $688
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $678
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 99
byte 1 111
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $674
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 99
byte 1 111
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $673
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 99
byte 1 111
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $667
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $658
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 117
byte 1 110
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $628
byte 1 52
byte 1 0
align 1
LABELV $623
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 101
byte 1 115
byte 1 47
byte 1 98
byte 1 117
byte 1 116
byte 1 110
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $614
byte 1 104
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $611
byte 1 49
byte 1 0
align 1
LABELV $610
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $609
byte 1 50
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $608
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $607
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 116
byte 1 115
byte 1 47
byte 1 112
byte 1 116
byte 1 49
byte 1 95
byte 1 101
byte 1 110
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $606
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 116
byte 1 115
byte 1 47
byte 1 112
byte 1 116
byte 1 49
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $591
byte 1 112
byte 1 108
byte 1 97
byte 1 116
byte 1 95
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $567
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $546
byte 1 48
byte 1 0
align 1
LABELV $545
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $531
byte 1 50
byte 1 0
align 1
LABELV $530
byte 1 100
byte 1 109
byte 1 103
byte 1 0
align 1
LABELV $529
byte 1 56
byte 1 0
align 1
LABELV $528
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $523
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 115
byte 1 47
byte 1 100
byte 1 114
byte 1 49
byte 1 95
byte 1 101
byte 1 110
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $522
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 115
byte 1 47
byte 1 100
byte 1 114
byte 1 49
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $517
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 95
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $427
byte 1 49
byte 1 32
byte 1 49
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $426
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $425
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $424
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $423
byte 1 110
byte 1 111
byte 1 105
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $346
byte 1 82
byte 1 101
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 100
byte 1 95
byte 1 66
byte 1 105
byte 1 110
byte 1 97
byte 1 114
byte 1 121
byte 1 77
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $88
byte 1 112
byte 1 117
byte 1 115
byte 1 104
byte 1 101
byte 1 100
byte 1 95
byte 1 112
byte 1 32
byte 1 62
byte 1 32
byte 1 38
byte 1 112
byte 1 117
byte 1 115
byte 1 104
byte 1 101
byte 1 100
byte 1 91
byte 1 77
byte 1 65
byte 1 88
byte 1 95
byte 1 71
byte 1 69
byte 1 78
byte 1 84
byte 1 73
byte 1 84
byte 1 73
byte 1 69
byte 1 83
byte 1 93
byte 1 0
