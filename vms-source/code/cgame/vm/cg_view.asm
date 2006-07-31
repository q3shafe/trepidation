export CG_TestModel_f
code
proc CG_TestModel_f 36 12
file "../cg_view.c"
line 51
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_view.c -- setup all the parameters (position, angle, etc)
;4:// for a 3D rendering
;5:#include "cg_local.h"
;6:
;7:
;8:/*
;9:=============================================================================
;10:
;11:  MODEL TESTING
;12:
;13:The viewthing and gun positioning tools from Q2 have been integrated and
;14:enhanced into a single model testing facility.
;15:
;16:Model viewing can begin with either "testmodel <modelname>" or "testgun <modelname>".
;17:
;18:The names must be the full pathname after the basedir, like 
;19:"models/weapons/v_launch/tris.md3" or "players/male/tris.md3"
;20:
;21:Testmodel will create a fake entity 100 units in front of the current view
;22:position, directly facing the viewer.  It will remain immobile, so you can
;23:move around it to view it from different angles.
;24:
;25:Testgun will cause the model to follow the player around and supress the real
;26:view weapon model.  The default frame 0 of most guns is completely off screen,
;27:so you will probably have to cycle a couple frames to see it.
;28:
;29:"nextframe", "prevframe", "nextskin", and "prevskin" commands will change the
;30:frame or skin of the testmodel.  These are bound to F5, F6, F7, and F8 in
;31:q3default.cfg.
;32:
;33:If a gun is being tested, the "gun_x", "gun_y", and "gun_z" variables will let
;34:you adjust the positioning.
;35:
;36:Note that none of the model testing features update while the game is paused, so
;37:it may be convenient to test with deathmatch set to 1 so that bringing down the
;38:console doesn't pause the game.
;39:
;40:=============================================================================
;41:*/
;42:
;43:/*
;44:=================
;45:CG_TestModel_f
;46:
;47:Creates an entity in front of the current position, which
;48:can then be moved around
;49:=================
;50:*/
;51:void CG_TestModel_f (void) {
line 54
;52:	vec3_t		angles;
;53:
;54:	memset( &cg.testModelEntity, 0, sizeof(cg.testModelEntity) );
ADDRGP4 cg+124796
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 55
;55:	if ( trap_Argc() < 2 ) {
ADDRLP4 12
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 2
GEI4 $75
line 56
;56:		return;
ADDRGP4 $72
JUMPV
LABELV $75
line 59
;57:	}
;58:
;59:	Q_strncpyz (cg.testModelName, CG_Argv( 1 ), MAX_QPATH );
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRGP4 cg+124936
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 60
;60:	cg.testModelEntity.hModel = trap_R_RegisterModel( cg.testModelName );
ADDRGP4 cg+124936
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cg+124796+8
ADDRLP4 20
INDIRI4
ASGNI4
line 62
;61:
;62:	if ( trap_Argc() == 3 ) {
ADDRLP4 24
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 3
NEI4 $81
line 63
;63:		cg.testModelEntity.backlerp = atof( CG_Argv( 2 ) );
CNSTI4 2
ARGI4
ADDRLP4 28
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 atof
CALLF4
ASGNF4
ADDRGP4 cg+124796+100
ADDRLP4 32
INDIRF4
ASGNF4
line 64
;64:		cg.testModelEntity.frame = 1;
ADDRGP4 cg+124796+80
CNSTI4 1
ASGNI4
line 65
;65:		cg.testModelEntity.oldframe = 0;
ADDRGP4 cg+124796+96
CNSTI4 0
ASGNI4
line 66
;66:	}
LABELV $81
line 67
;67:	if (! cg.testModelEntity.hModel ) {
ADDRGP4 cg+124796+8
INDIRI4
CNSTI4 0
NEI4 $89
line 68
;68:		CG_Printf( "Can't register model\n" );
ADDRGP4 $93
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 69
;69:		return;
ADDRGP4 $72
JUMPV
LABELV $89
line 72
;70:	}
;71:
;72:	VectorMA( cg.refdef.vieworg, 100, cg.refdef.viewaxis[0], cg.testModelEntity.origin );
ADDRGP4 cg+124796+68
ADDRGP4 cg+109048+24
INDIRF4
CNSTF4 1120403456
ADDRGP4 cg+109048+36
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+124796+68+4
ADDRGP4 cg+109048+24+4
INDIRF4
CNSTF4 1120403456
ADDRGP4 cg+109048+36+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+124796+68+8
ADDRGP4 cg+109048+24+8
INDIRF4
CNSTF4 1120403456
ADDRGP4 cg+109048+36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 74
;73:
;74:	angles[PITCH] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 75
;75:	angles[YAW] = 180 + cg.refdefViewAngles[1];
ADDRLP4 0+4
ADDRGP4 cg+109416+4
INDIRF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 76
;76:	angles[ROLL] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 78
;77:
;78:	AnglesToAxis( angles, cg.testModelEntity.axis );
ADDRLP4 0
ARGP4
ADDRGP4 cg+124796+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 79
;79:	cg.testGun = qfalse;
ADDRGP4 cg+125000
CNSTI4 0
ASGNI4
line 80
;80:}
LABELV $72
endproc CG_TestModel_f 36 12
export CG_TestGun_f
proc CG_TestGun_f 0 0
line 89
;81:
;82:/*
;83:=================
;84:CG_TestGun_f
;85:
;86:Replaces the current view weapon with the given model
;87:=================
;88:*/
;89:void CG_TestGun_f (void) {
line 90
;90:	CG_TestModel_f();
ADDRGP4 CG_TestModel_f
CALLV
pop
line 91
;91:	cg.testGun = qtrue;
ADDRGP4 cg+125000
CNSTI4 1
ASGNI4
line 92
;92:	cg.testModelEntity.renderfx = RF_MINLIGHT | RF_DEPTHHACK | RF_FIRST_PERSON;
ADDRGP4 cg+124796+4
CNSTI4 13
ASGNI4
line 93
;93:}
LABELV $125
endproc CG_TestGun_f 0 0
export CG_TestModelNextFrame_f
proc CG_TestModelNextFrame_f 4 8
line 96
;94:
;95:
;96:void CG_TestModelNextFrame_f (void) {
line 97
;97:	cg.testModelEntity.frame++;
ADDRLP4 0
ADDRGP4 cg+124796+80
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 98
;98:	CG_Printf( "frame %i\n", cg.testModelEntity.frame );
ADDRGP4 $132
ARGP4
ADDRGP4 cg+124796+80
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 99
;99:}
LABELV $129
endproc CG_TestModelNextFrame_f 4 8
export CG_TestModelPrevFrame_f
proc CG_TestModelPrevFrame_f 4 8
line 101
;100:
;101:void CG_TestModelPrevFrame_f (void) {
line 102
;102:	cg.testModelEntity.frame--;
ADDRLP4 0
ADDRGP4 cg+124796+80
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 103
;103:	if ( cg.testModelEntity.frame < 0 ) {
ADDRGP4 cg+124796+80
INDIRI4
CNSTI4 0
GEI4 $138
line 104
;104:		cg.testModelEntity.frame = 0;
ADDRGP4 cg+124796+80
CNSTI4 0
ASGNI4
line 105
;105:	}
LABELV $138
line 106
;106:	CG_Printf( "frame %i\n", cg.testModelEntity.frame );
ADDRGP4 $132
ARGP4
ADDRGP4 cg+124796+80
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 107
;107:}
LABELV $135
endproc CG_TestModelPrevFrame_f 4 8
export CG_TestModelNextSkin_f
proc CG_TestModelNextSkin_f 4 8
line 109
;108:
;109:void CG_TestModelNextSkin_f (void) {
line 110
;110:	cg.testModelEntity.skinNum++;
ADDRLP4 0
ADDRGP4 cg+124796+104
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 111
;111:	CG_Printf( "skin %i\n", cg.testModelEntity.skinNum );
ADDRGP4 $149
ARGP4
ADDRGP4 cg+124796+104
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 112
;112:}
LABELV $146
endproc CG_TestModelNextSkin_f 4 8
export CG_TestModelPrevSkin_f
proc CG_TestModelPrevSkin_f 4 8
line 114
;113:
;114:void CG_TestModelPrevSkin_f (void) {
line 115
;115:	cg.testModelEntity.skinNum--;
ADDRLP4 0
ADDRGP4 cg+124796+104
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 116
;116:	if ( cg.testModelEntity.skinNum < 0 ) {
ADDRGP4 cg+124796+104
INDIRI4
CNSTI4 0
GEI4 $155
line 117
;117:		cg.testModelEntity.skinNum = 0;
ADDRGP4 cg+124796+104
CNSTI4 0
ASGNI4
line 118
;118:	}
LABELV $155
line 119
;119:	CG_Printf( "skin %i\n", cg.testModelEntity.skinNum );
ADDRGP4 $149
ARGP4
ADDRGP4 cg+124796+104
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 120
;120:}
LABELV $152
endproc CG_TestModelPrevSkin_f 4 8
proc CG_AddTestModel 32 4
line 122
;121:
;122:static void CG_AddTestModel (void) {
line 126
;123:	int		i;
;124:
;125:	// re-register the model, because the level may have changed
;126:	cg.testModelEntity.hModel = trap_R_RegisterModel( cg.testModelName );
ADDRGP4 cg+124936
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cg+124796+8
ADDRLP4 4
INDIRI4
ASGNI4
line 127
;127:	if (! cg.testModelEntity.hModel ) {
ADDRGP4 cg+124796+8
INDIRI4
CNSTI4 0
NEI4 $167
line 128
;128:		CG_Printf ("Can't register model\n");
ADDRGP4 $93
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 129
;129:		return;
ADDRGP4 $163
JUMPV
LABELV $167
line 133
;130:	}
;131:
;132:	// if testing a gun, set the origin reletive to the view origin
;133:	if ( cg.testGun ) {
ADDRGP4 cg+125000
INDIRI4
CNSTI4 0
EQI4 $171
line 134
;134:		VectorCopy( cg.refdef.vieworg, cg.testModelEntity.origin );
ADDRGP4 cg+124796+68
ADDRGP4 cg+109048+24
INDIRB
ASGNB 12
line 135
;135:		VectorCopy( cg.refdef.viewaxis[0], cg.testModelEntity.axis[0] );
ADDRGP4 cg+124796+28
ADDRGP4 cg+109048+36
INDIRB
ASGNB 12
line 136
;136:		VectorCopy( cg.refdef.viewaxis[1], cg.testModelEntity.axis[1] );
ADDRGP4 cg+124796+28+12
ADDRGP4 cg+109048+36+12
INDIRB
ASGNB 12
line 137
;137:		VectorCopy( cg.refdef.viewaxis[2], cg.testModelEntity.axis[2] );
ADDRGP4 cg+124796+28+24
ADDRGP4 cg+109048+36+24
INDIRB
ASGNB 12
line 140
;138:
;139:		// allow the position to be adjusted
;140:		for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $194
line 141
;141:			cg.testModelEntity.origin[i] += cg.refdef.viewaxis[0][i] * cg_gun_x.value;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
ADDRLP4 8
INDIRI4
ADDRGP4 cg+124796+68
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 8
INDIRI4
ADDRGP4 cg+109048+36
ADDP4
INDIRF4
ADDRGP4 cg_gun_x+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 142
;142:			cg.testModelEntity.origin[i] += cg.refdef.viewaxis[1][i] * cg_gun_y.value;
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 20
ADDRLP4 16
INDIRI4
ADDRGP4 cg+124796+68
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 16
INDIRI4
ADDRGP4 cg+109048+36+12
ADDP4
INDIRF4
ADDRGP4 cg_gun_y+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 143
;143:			cg.testModelEntity.origin[i] += cg.refdef.viewaxis[2][i] * cg_gun_z.value;
ADDRLP4 24
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 28
ADDRLP4 24
INDIRI4
ADDRGP4 cg+124796+68
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 24
INDIRI4
ADDRGP4 cg+109048+36+24
ADDP4
INDIRF4
ADDRGP4 cg_gun_z+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 144
;144:		}
LABELV $195
line 140
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $194
line 145
;145:	}
LABELV $171
line 147
;146:
;147:	trap_R_AddRefEntityToScene( &cg.testModelEntity );
ADDRGP4 cg+124796
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 148
;148:}
LABELV $163
endproc CG_AddTestModel 32 4
proc CG_CalcVrect 12 8
line 162
;149:
;150:
;151:
;152://============================================================================
;153:
;154:
;155:/*
;156:=================
;157:CG_CalcVrect
;158:
;159:Sets the coordinates of the rendered window
;160:=================
;161:*/
;162:static void CG_CalcVrect (void) {
line 166
;163:	int		size;
;164:
;165:	// the intermission should allways be full screen
;166:	if ( cg.snap->ps.pm_type == PM_INTERMISSION ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 5
NEI4 $217
line 167
;167:		size = 100;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 168
;168:	} else {
ADDRGP4 $218
JUMPV
LABELV $217
line 170
;169:		// bound normal viewsize
;170:		if (cg_viewsize.integer < 30) {
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 30
GEI4 $220
line 171
;171:			trap_Cvar_Set ("cg_viewsize","30");
ADDRGP4 $223
ARGP4
ADDRGP4 $224
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 172
;172:			size = 30;
ADDRLP4 0
CNSTI4 30
ASGNI4
line 173
;173:		} else if (cg_viewsize.integer > 100) {
ADDRGP4 $221
JUMPV
LABELV $220
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 100
LEI4 $225
line 174
;174:			trap_Cvar_Set ("cg_viewsize","100");
ADDRGP4 $223
ARGP4
ADDRGP4 $228
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 175
;175:			size = 100;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 176
;176:		} else {
ADDRGP4 $226
JUMPV
LABELV $225
line 177
;177:			size = cg_viewsize.integer;
ADDRLP4 0
ADDRGP4 cg_viewsize+12
INDIRI4
ASGNI4
line 178
;178:		}
LABELV $226
LABELV $221
line 180
;179:
;180:	}
LABELV $218
line 181
;181:	cg.refdef.width = cgs.glconfig.vidWidth*size/100;
ADDRGP4 cg+109048+8
ADDRGP4 cgs+20100+11304
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 100
DIVI4
ASGNI4
line 182
;182:	cg.refdef.width &= ~1;
ADDRLP4 4
ADDRGP4 cg+109048+8
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 184
;183:
;184:	cg.refdef.height = cgs.glconfig.vidHeight*size/100;
ADDRGP4 cg+109048+12
ADDRGP4 cgs+20100+11308
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 100
DIVI4
ASGNI4
line 185
;185:	cg.refdef.height &= ~1;
ADDRLP4 8
ADDRGP4 cg+109048+12
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 187
;186:
;187:	cg.refdef.x = (cgs.glconfig.vidWidth - cg.refdef.width)/2;
ADDRGP4 cg+109048
ADDRGP4 cgs+20100+11304
INDIRI4
ADDRGP4 cg+109048+8
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 188
;188:	cg.refdef.y = (cgs.glconfig.vidHeight - cg.refdef.height)/2;
ADDRGP4 cg+109048+4
ADDRGP4 cgs+20100+11308
INDIRI4
ADDRGP4 cg+109048+12
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 189
;189:}
LABELV $216
endproc CG_CalcVrect 12 8
data
align 4
LABELV $254
byte 4 3229614080
byte 4 3229614080
byte 4 3229614080
align 4
LABELV $255
byte 4 1082130432
byte 4 1082130432
byte 4 1082130432
code
proc CG_OffsetThirdPersonView 188 28
line 201
;190:
;191://==============================================================================
;192:
;193:
;194:/*
;195:===============
;196:CG_OffsetThirdPersonView
;197:
;198:===============
;199:*/
;200:#define	FOCUS_DISTANCE	512
;201:static void CG_OffsetThirdPersonView( void ) {
line 212
;202:	vec3_t		forward, right, up;
;203:	vec3_t		view;
;204:	vec3_t		focusAngles;
;205:	trace_t		trace;
;206:	static vec3_t	mins = { -4, -4, -4 };
;207:	static vec3_t	maxs = { 4, 4, 4 };
;208:	vec3_t		focusPoint;
;209:	float		focusDist;
;210:	float		forwardScale, sideScale;
;211:
;212:	cg.refdef.vieworg[2] += cg.predictedPlayerState.viewheight;
ADDRLP4 140
ADDRGP4 cg+109048+24+8
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRF4
ADDRGP4 cg+107636+164
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 214
;213:
;214:	VectorCopy( cg.refdefViewAngles, focusAngles );
ADDRLP4 48
ADDRGP4 cg+109416
INDIRB
ASGNB 12
line 217
;215:
;216:	// if dead, look at killer
;217:	if ( cg.predictedPlayerState.stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 cg+107636+184
INDIRI4
CNSTI4 0
GTI4 $262
line 218
;218:		focusAngles[YAW] = cg.predictedPlayerState.stats[STAT_DEAD_YAW];
ADDRLP4 48+4
ADDRGP4 cg+107636+184+20
INDIRI4
CVIF4 4
ASGNF4
line 219
;219:		cg.refdefViewAngles[YAW] = cg.predictedPlayerState.stats[STAT_DEAD_YAW];
ADDRGP4 cg+109416+4
ADDRGP4 cg+107636+184+20
INDIRI4
CVIF4 4
ASGNF4
line 220
;220:	}
LABELV $262
line 222
;221:
;222:	if ( focusAngles[PITCH] > 45 ) {
ADDRLP4 48
INDIRF4
CNSTF4 1110704128
LEF4 $275
line 223
;223:		focusAngles[PITCH] = 45;		// don't go too far overhead
ADDRLP4 48
CNSTF4 1110704128
ASGNF4
line 224
;224:	}
LABELV $275
line 225
;225:	AngleVectors( focusAngles, forward, NULL, NULL );
ADDRLP4 48
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 144
CNSTP4 0
ASGNP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 227
;226:
;227:	VectorMA( cg.refdef.vieworg, FOCUS_DISTANCE, forward, focusPoint );
ADDRLP4 148
CNSTF4 1140850688
ASGNF4
ADDRLP4 12
ADDRGP4 cg+109048+24
INDIRF4
ADDRLP4 148
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRGP4 cg+109048+24+4
INDIRF4
ADDRLP4 148
INDIRF4
ADDRLP4 24+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRGP4 cg+109048+24+8
INDIRF4
CNSTF4 1140850688
ADDRLP4 24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 229
;228:
;229:	VectorCopy( cg.refdef.vieworg, view );
ADDRLP4 0
ADDRGP4 cg+109048+24
INDIRB
ASGNB 12
line 231
;230:
;231:	view[2] += 8;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 233
;232:
;233:	cg.refdefViewAngles[PITCH] *= 0.5;
ADDRLP4 152
ADDRGP4 cg+109416
ASGNP4
ADDRLP4 152
INDIRP4
CNSTF4 1056964608
ADDRLP4 152
INDIRP4
INDIRF4
MULF4
ASGNF4
line 235
;234:
;235:	AngleVectors( cg.refdefViewAngles, forward, right, up );
ADDRGP4 cg+109416
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 128
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 237
;236:
;237:	forwardScale = cos( cg_thirdPersonAngle.value / 180 * M_PI );
CNSTF4 1078530011
ADDRGP4 cg_thirdPersonAngle+8
INDIRF4
CNSTF4 1127481344
DIVF4
MULF4
ARGF4
ADDRLP4 156
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 60
ADDRLP4 156
INDIRF4
ASGNF4
line 238
;238:	sideScale = sin( cg_thirdPersonAngle.value / 180 * M_PI );
CNSTF4 1078530011
ADDRGP4 cg_thirdPersonAngle+8
INDIRF4
CNSTF4 1127481344
DIVF4
MULF4
ARGF4
ADDRLP4 160
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 64
ADDRLP4 160
INDIRF4
ASGNF4
line 239
;239:	VectorMA( view, -cg_thirdPersonRange.value * forwardScale, forward, view );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
NEGF4
ADDRLP4 60
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24+4
INDIRF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
NEGF4
ADDRLP4 60
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 24+8
INDIRF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
NEGF4
ADDRLP4 60
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 240
;240:	VectorMA( view, -cg_thirdPersonRange.value * sideScale, right, view );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
NEGF4
ADDRLP4 64
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
NEGF4
ADDRLP4 64
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
NEGF4
ADDRLP4 64
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 245
;241:
;242:	// trace a ray from the origin to the viewpoint to make sure the view isn't
;243:	// in a solid block.  Use an 8 by 8 block to prevent the view from near clipping anything
;244:
;245:	if (!cg_cameraMode.integer) {
ADDRGP4 cg_cameraMode+12
INDIRI4
CNSTI4 0
NEI4 $314
line 246
;246:		CG_Trace( &trace, cg.refdef.vieworg, mins, maxs, view, cg.predictedPlayerState.clientNum, MASK_SOLID );
ADDRLP4 72
ARGP4
ADDRGP4 cg+109048+24
ARGP4
ADDRGP4 $254
ARGP4
ADDRGP4 $255
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 cg+107636+140
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 248
;247:
;248:		if ( trace.fraction != 1.0 ) {
ADDRLP4 72+8
INDIRF4
CNSTF4 1065353216
EQF4 $321
line 249
;249:			VectorCopy( trace.endpos, view );
ADDRLP4 0
ADDRLP4 72+12
INDIRB
ASGNB 12
line 250
;250:			view[2] += (1.0 - trace.fraction) * 32;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1107296256
CNSTF4 1065353216
ADDRLP4 72+8
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 254
;251:			// try another trace to this position, because a tunnel may have the ceiling
;252:			// close enogh that this is poking out
;253:
;254:			CG_Trace( &trace, cg.refdef.vieworg, mins, maxs, view, cg.predictedPlayerState.clientNum, MASK_SOLID );
ADDRLP4 72
ARGP4
ADDRGP4 cg+109048+24
ARGP4
ADDRGP4 $254
ARGP4
ADDRGP4 $255
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 cg+107636+140
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 255
;255:			VectorCopy( trace.endpos, view );
ADDRLP4 0
ADDRLP4 72+12
INDIRB
ASGNB 12
line 256
;256:		}
LABELV $321
line 257
;257:	}
LABELV $314
line 260
;258:
;259:
;260:	VectorCopy( view, cg.refdef.vieworg );
ADDRGP4 cg+109048+24
ADDRLP4 0
INDIRB
ASGNB 12
line 263
;261:
;262:	// select pitch to look at focus point from vieword
;263:	VectorSubtract( focusPoint, cg.refdef.vieworg, focusPoint );
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRGP4 cg+109048+24
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRGP4 cg+109048+24+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
ADDRGP4 cg+109048+24+8
INDIRF4
SUBF4
ASGNF4
line 264
;264:	focusDist = sqrt( focusPoint[0] * focusPoint[0] + focusPoint[1] * focusPoint[1] );
ADDRLP4 172
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 172
INDIRF4
ADDRLP4 172
INDIRF4
MULF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 176
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 68
ADDRLP4 176
INDIRF4
ASGNF4
line 265
;265:	if ( focusDist < 1 ) {
ADDRLP4 68
INDIRF4
CNSTF4 1065353216
GEF4 $348
line 266
;266:		focusDist = 1;	// should never happen
ADDRLP4 68
CNSTF4 1065353216
ASGNF4
line 267
;267:	}
LABELV $348
line 268
;268:	cg.refdefViewAngles[PITCH] = -180 / M_PI * atan2( focusPoint[2], focusDist );
ADDRLP4 12+8
INDIRF4
ARGF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRLP4 180
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRGP4 cg+109416
CNSTF4 3261411041
ADDRLP4 180
INDIRF4
MULF4
ASGNF4
line 269
;269:	cg.refdefViewAngles[YAW] -= cg_thirdPersonAngle.value;
ADDRLP4 184
ADDRGP4 cg+109416+4
ASGNP4
ADDRLP4 184
INDIRP4
ADDRLP4 184
INDIRP4
INDIRF4
ADDRGP4 cg_thirdPersonAngle+8
INDIRF4
SUBF4
ASGNF4
line 270
;270:}
LABELV $253
endproc CG_OffsetThirdPersonView 188 28
proc CG_StepOffset 8 0
line 274
;271:
;272:
;273:// this causes a compiler bug on mac MrC compiler
;274:static void CG_StepOffset( void ) {
line 278
;275:	int		timeDelta;
;276:	
;277:	// smooth out stair climbing
;278:	timeDelta = cg.time - cg.stepTime;
ADDRLP4 0
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+108928
INDIRI4
SUBI4
ASGNI4
line 279
;279:	if ( timeDelta < STEP_TIME ) {
ADDRLP4 0
INDIRI4
CNSTI4 200
GEI4 $358
line 280
;280:		cg.refdef.vieworg[2] -= cg.stepChange 
ADDRLP4 4
ADDRGP4 cg+109048+24+8
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRGP4 cg+108924
INDIRF4
CNSTI4 200
ADDRLP4 0
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1128792064
DIVF4
SUBF4
ASGNF4
line 282
;281:			* (STEP_TIME - timeDelta) / STEP_TIME;
;282:	}
LABELV $358
line 283
;283:}
LABELV $355
endproc CG_StepOffset 8 0
proc CG_OffsetFirstPersonView 96 0
line 291
;284:
;285:/*
;286:===============
;287:CG_OffsetFirstPersonView
;288:
;289:===============
;290:*/
;291:static void CG_OffsetFirstPersonView( void ) {
line 302
;292:	float			*origin;
;293:	float			*angles;
;294:	float			bob;
;295:	float			ratio;
;296:	float			delta;
;297:	float			speed;
;298:	float			f;
;299:	vec3_t			predictedVelocity;
;300:	int				timeDelta;
;301:	
;302:	if ( cg.snap->ps.pm_type == PM_INTERMISSION ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 5
NEI4 $365
line 303
;303:		return;
ADDRGP4 $364
JUMPV
LABELV $365
line 306
;304:	}
;305:
;306:	origin = cg.refdef.vieworg;
ADDRLP4 8
ADDRGP4 cg+109048+24
ASGNP4
line 307
;307:	angles = cg.refdefViewAngles;
ADDRLP4 4
ADDRGP4 cg+109416
ASGNP4
line 310
;308:
;309:	// if dead, fix the angle and don't add any kick
;310:	if ( cg.snap->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
GTI4 $371
line 311
;311:		angles[ROLL] = 40;
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1109393408
ASGNF4
line 312
;312:		angles[PITCH] = -15;
ADDRLP4 4
INDIRP4
CNSTF4 3245342720
ASGNF4
line 313
;313:		angles[YAW] = cg.snap->ps.stats[STAT_DEAD_YAW];
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 314
;314:		origin[2] += cg.predictedPlayerState.viewheight;
ADDRLP4 44
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRF4
ADDRGP4 cg+107636+164
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 315
;315:		return;
ADDRGP4 $364
JUMPV
LABELV $371
line 319
;316:	}
;317:
;318:	// add angles based on weapon kick
;319:	VectorAdd (angles, cg.kick_angles, angles);
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRGP4 cg+124756
INDIRF4
ADDF4
ASGNF4
ADDRLP4 48
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRGP4 cg+124756+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 52
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRF4
ADDRGP4 cg+124756+8
INDIRF4
ADDF4
ASGNF4
line 322
;320:
;321:	// add angles based on damage kick
;322:	if ( cg.damageTime ) {
ADDRGP4 cg+124700
INDIRF4
CNSTF4 0
EQF4 $382
line 323
;323:		ratio = cg.time - cg.damageTime;
ADDRLP4 32
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
ADDRGP4 cg+124700
INDIRF4
SUBF4
ASGNF4
line 324
;324:		if ( ratio < DAMAGE_DEFLECT_TIME ) {
ADDRLP4 32
INDIRF4
CNSTF4 1120403456
GEF4 $387
line 325
;325:			ratio /= DAMAGE_DEFLECT_TIME;
ADDRLP4 32
ADDRLP4 32
INDIRF4
CNSTF4 1120403456
DIVF4
ASGNF4
line 326
;326:			angles[PITCH] += ratio * cg.v_dmg_pitch;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 32
INDIRF4
ADDRGP4 cg+124748
INDIRF4
MULF4
ADDF4
ASGNF4
line 327
;327:			angles[ROLL] += ratio * cg.v_dmg_roll;
ADDRLP4 60
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
ADDRLP4 32
INDIRF4
ADDRGP4 cg+124752
INDIRF4
MULF4
ADDF4
ASGNF4
line 328
;328:		} else {
ADDRGP4 $388
JUMPV
LABELV $387
line 329
;329:			ratio = 1.0 - ( ratio - DAMAGE_DEFLECT_TIME ) / DAMAGE_RETURN_TIME;
ADDRLP4 32
CNSTF4 1065353216
ADDRLP4 32
INDIRF4
CNSTF4 1120403456
SUBF4
CNSTF4 1137180672
DIVF4
SUBF4
ASGNF4
line 330
;330:			if ( ratio > 0 ) {
ADDRLP4 32
INDIRF4
CNSTF4 0
LEF4 $391
line 331
;331:				angles[PITCH] += ratio * cg.v_dmg_pitch;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 32
INDIRF4
ADDRGP4 cg+124748
INDIRF4
MULF4
ADDF4
ASGNF4
line 332
;332:				angles[ROLL] += ratio * cg.v_dmg_roll;
ADDRLP4 60
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
ADDRLP4 32
INDIRF4
ADDRGP4 cg+124752
INDIRF4
MULF4
ADDF4
ASGNF4
line 333
;333:			}
LABELV $391
line 334
;334:		}
LABELV $388
line 335
;335:	}
LABELV $382
line 346
;336:
;337:	// add pitch based on fall kick
;338:#if 0
;339:	ratio = ( cg.time - cg.landTime) / FALL_TIME;
;340:	if (ratio < 0)
;341:		ratio = 0;
;342:	angles[PITCH] += ratio * cg.fall_value;
;343:#endif
;344:
;345:	// add angles based on velocity
;346:	VectorCopy( cg.predictedPlayerState.velocity, predictedVelocity );
ADDRLP4 12
ADDRGP4 cg+107636+32
INDIRB
ASGNB 12
line 348
;347:
;348:	delta = DotProduct ( predictedVelocity, cg.refdef.viewaxis[0]);
ADDRLP4 0
ADDRLP4 12
INDIRF4
ADDRGP4 cg+109048+36
INDIRF4
MULF4
ADDRLP4 12+4
INDIRF4
ADDRGP4 cg+109048+36+4
INDIRF4
MULF4
ADDF4
ADDRLP4 12+8
INDIRF4
ADDRGP4 cg+109048+36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 349
;349:	angles[PITCH] += delta * cg_runpitch.value;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDRGP4 cg_runpitch+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 351
;350:	
;351:	delta = DotProduct ( predictedVelocity, cg.refdef.viewaxis[1]);
ADDRLP4 0
ADDRLP4 12
INDIRF4
ADDRGP4 cg+109048+36+12
INDIRF4
MULF4
ADDRLP4 12+4
INDIRF4
ADDRGP4 cg+109048+36+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 12+8
INDIRF4
ADDRGP4 cg+109048+36+12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 352
;352:	angles[ROLL] -= delta * cg_runroll.value;
ADDRLP4 60
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDRGP4 cg_runroll+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 357
;353:
;354:	// add angles based on bob
;355:
;356:	// make sure the bob is visible even at low speeds
;357:	speed = cg.xyspeed > 200 ? cg.xyspeed : 200;
ADDRGP4 cg+124788
INDIRF4
CNSTF4 1128792064
LEF4 $425
ADDRLP4 64
ADDRGP4 cg+124788
INDIRF4
ASGNF4
ADDRGP4 $426
JUMPV
LABELV $425
ADDRLP4 64
CNSTF4 1128792064
ASGNF4
LABELV $426
ADDRLP4 28
ADDRLP4 64
INDIRF4
ASGNF4
line 359
;358:
;359:	delta = cg.bobfracsin * cg_bobpitch.value * speed;
ADDRLP4 0
ADDRGP4 cg+124780
INDIRF4
ADDRGP4 cg_bobpitch+8
INDIRF4
MULF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 360
;360:	if (cg.predictedPlayerState.pm_flags & PMF_DUCKED)
ADDRGP4 cg+107636+12
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $429
line 361
;361:		delta *= 3;		// crouching
ADDRLP4 0
CNSTF4 1077936128
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
LABELV $429
line 362
;362:	angles[PITCH] += delta;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
line 363
;363:	delta = cg.bobfracsin * cg_bobroll.value * speed;
ADDRLP4 0
ADDRGP4 cg+124780
INDIRF4
ADDRGP4 cg_bobroll+8
INDIRF4
MULF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 364
;364:	if (cg.predictedPlayerState.pm_flags & PMF_DUCKED)
ADDRGP4 cg+107636+12
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $435
line 365
;365:		delta *= 3;		// crouching accentuates roll
ADDRLP4 0
CNSTF4 1077936128
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
LABELV $435
line 366
;366:	if (cg.bobcycle & 1)
ADDRGP4 cg+124784
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $439
line 367
;367:		delta = -delta;
ADDRLP4 0
ADDRLP4 0
INDIRF4
NEGF4
ASGNF4
LABELV $439
line 368
;368:	angles[ROLL] += delta;
ADDRLP4 72
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
line 373
;369:
;370://===================================
;371:
;372:	// add view height
;373:	origin[2] += cg.predictedPlayerState.viewheight;
ADDRLP4 76
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRF4
ADDRGP4 cg+107636+164
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 376
;374:
;375:	// smooth out duck height changes
;376:	timeDelta = cg.time - cg.duckTime;
ADDRLP4 36
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+108936
INDIRI4
SUBI4
ASGNI4
line 377
;377:	if ( timeDelta < DUCK_TIME) {
ADDRLP4 36
INDIRI4
CNSTI4 100
GEI4 $446
line 378
;378:		cg.refdef.vieworg[2] -= cg.duckChange 
ADDRLP4 80
ADDRGP4 cg+109048+24+8
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRF4
ADDRGP4 cg+108932
INDIRF4
CNSTI4 100
ADDRLP4 36
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1120403456
DIVF4
SUBF4
ASGNF4
line 380
;379:			* (DUCK_TIME - timeDelta) / DUCK_TIME;
;380:	}
LABELV $446
line 383
;381:
;382:	// add bob height
;383:	bob = cg.bobfracsin * cg.xyspeed * cg_bobup.value;
ADDRLP4 24
ADDRGP4 cg+124780
INDIRF4
ADDRGP4 cg+124788
INDIRF4
MULF4
ADDRGP4 cg_bobup+8
INDIRF4
MULF4
ASGNF4
line 384
;384:	if (bob > 6) {
ADDRLP4 24
INDIRF4
CNSTF4 1086324736
LEF4 $455
line 385
;385:		bob = 6;
ADDRLP4 24
CNSTF4 1086324736
ASGNF4
line 386
;386:	}
LABELV $455
line 388
;387:
;388:	origin[2] += bob;
ADDRLP4 80
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRF4
ADDRLP4 24
INDIRF4
ADDF4
ASGNF4
line 392
;389:
;390:
;391:	// add fall height
;392:	delta = cg.time - cg.landTime;
ADDRLP4 0
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+108944
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 393
;393:	if ( delta < LAND_DEFLECT_TIME ) {
ADDRLP4 0
INDIRF4
CNSTF4 1125515264
GEF4 $459
line 394
;394:		f = delta / LAND_DEFLECT_TIME;
ADDRLP4 40
ADDRLP4 0
INDIRF4
CNSTF4 1125515264
DIVF4
ASGNF4
line 395
;395:		cg.refdef.vieworg[2] += cg.landChange * f;
ADDRLP4 84
ADDRGP4 cg+109048+24+8
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRF4
ADDRGP4 cg+108940
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ADDF4
ASGNF4
line 396
;396:	} else if ( delta < LAND_DEFLECT_TIME + LAND_RETURN_TIME ) {
ADDRGP4 $460
JUMPV
LABELV $459
ADDRLP4 0
INDIRF4
CNSTF4 1138819072
GEF4 $465
line 397
;397:		delta -= LAND_DEFLECT_TIME;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1125515264
SUBF4
ASGNF4
line 398
;398:		f = 1.0 - ( delta / LAND_RETURN_TIME );
ADDRLP4 40
CNSTF4 1065353216
ADDRLP4 0
INDIRF4
CNSTF4 1133903872
DIVF4
SUBF4
ASGNF4
line 399
;399:		cg.refdef.vieworg[2] += cg.landChange * f;
ADDRLP4 84
ADDRGP4 cg+109048+24+8
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRF4
ADDRGP4 cg+108940
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ADDF4
ASGNF4
line 400
;400:	}
LABELV $465
LABELV $460
line 403
;401:
;402:	// add step offset
;403:	CG_StepOffset();
ADDRGP4 CG_StepOffset
CALLV
pop
line 407
;404:
;405:	// add kick offset
;406:
;407:	VectorAdd (origin, cg.kick_origin, origin);
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRGP4 cg+124768
INDIRF4
ADDF4
ASGNF4
ADDRLP4 88
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRF4
ADDRGP4 cg+124768+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 92
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRF4
ADDRGP4 cg+124768+8
INDIRF4
ADDF4
ASGNF4
line 421
;408:
;409:	// pivot the eye based on a neck length
;410:#if 0
;411:	{
;412:#define	NECK_LENGTH		8
;413:	vec3_t			forward, up;
;414: 
;415:	cg.refdef.vieworg[2] -= NECK_LENGTH;
;416:	AngleVectors( cg.refdefViewAngles, forward, NULL, up );
;417:	VectorMA( cg.refdef.vieworg, 3, forward, cg.refdef.vieworg );
;418:	VectorMA( cg.refdef.vieworg, NECK_LENGTH, up, cg.refdef.vieworg );
;419:	}
;420:#endif
;421:}
LABELV $364
endproc CG_OffsetFirstPersonView 96 0
export CG_ZoomDown_f
proc CG_ZoomDown_f 4 0
line 427
;422:
;423://======================================================================
;424:
;425:// Shafe - Trep - Improved Zoom 
;426:void CG_ZoomDown_f( void ) 
;427:{ 
line 428
;428:	if ( cg.zoomed && !cg.zooming ) 
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 cg+109428
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $477
ADDRGP4 cg+109440
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $477
line 429
;429:	{
line 430
;430:		cg.zoomed = qfalse;
ADDRGP4 cg+109428
CNSTI4 0
ASGNI4
line 431
;431:		cg.zoomTime = cg.time;
ADDRGP4 cg+109432
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 432
;432:	} else {
ADDRGP4 $478
JUMPV
LABELV $477
line 433
;433:		if(cg.zoomed)
ADDRGP4 cg+109428
INDIRI4
CNSTI4 0
EQI4 $484
line 434
;434:			return;
ADDRGP4 $476
JUMPV
LABELV $484
line 436
;435:
;436:		cg.zoomed = qtrue;
ADDRGP4 cg+109428
CNSTI4 1
ASGNI4
line 437
;437:		cg.zooming = qtrue;
ADDRGP4 cg+109440
CNSTI4 1
ASGNI4
line 438
;438:		cg.zoomTime = cg.time;
ADDRGP4 cg+109432
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 439
;439:	}
LABELV $478
line 440
;440:}
LABELV $476
endproc CG_ZoomDown_f 4 0
export CG_ZoomUp_f
proc CG_ZoomUp_f 0 0
line 443
;441:
;442:void CG_ZoomUp_f( void ) 
;443:{
line 444
;444:	if(cg.zoomed)
ADDRGP4 cg+109428
INDIRI4
CNSTI4 0
EQI4 $492
line 445
;445:	{
line 446
;446:		cg.zoomTime=0;
ADDRGP4 cg+109432
CNSTI4 0
ASGNI4
line 447
;447:		cg.zooming=qfalse;
ADDRGP4 cg+109440
CNSTI4 0
ASGNI4
line 448
;448:	}
LABELV $492
line 449
;449:}
LABELV $491
endproc CG_ZoomUp_f 0 0
proc CG_CalcFov 52 8
line 480
;450:
;451:
;452:/*  Original Zoom Functions
;453:void CG_ZoomDown_f( void ) { 
;454:	if ( cg.zoomed ) {
;455:		return;
;456:	}
;457:	cg.zoomed = qtrue;
;458:	cg.zoomTime = cg.time;
;459:}
;460:
;461:void CG_ZoomUp_f( void ) { 
;462:	if ( !cg.zoomed ) {
;463:		return;
;464:	}
;465:	cg.zoomed = qfalse;
;466:	cg.zoomTime = cg.time;
;467:}
;468:*/
;469:
;470:/*
;471:====================
;472:CG_CalcFov
;473:
;474:Fixed fov at intermissions, otherwise account for fov variable and zooms.
;475:====================
;476:*/
;477:#define	WAVE_AMPLITUDE	1
;478:#define	WAVE_FREQUENCY	0.4
;479:
;480:static int CG_CalcFov( void ) {
line 490
;481:	float	x;
;482:	float	phase;
;483:	float	v;
;484:	int		contents;
;485:	float	fov_x, fov_y;
;486:	float	zoomFov;
;487:	float	f;
;488:	int		inwater;
;489:
;490:	if ( cg.predictedPlayerState.pm_type == PM_INTERMISSION ) {
ADDRGP4 cg+107636+4
INDIRI4
CNSTI4 5
NEI4 $498
line 492
;491:		// if in intermission, use a fixed value
;492:		fov_x = 90;
ADDRLP4 0
CNSTF4 1119092736
ASGNF4
line 493
;493:	} else {
ADDRGP4 $499
JUMPV
LABELV $498
line 495
;494:		// user selectable
;495:		if ( cgs.dmflags & DF_FIXED_FOV ) {
ADDRGP4 cgs+31460
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $502
line 497
;496:			// dmflag to prevent wide fov for all clients
;497:			fov_x = 90;
ADDRLP4 0
CNSTF4 1119092736
ASGNF4
line 498
;498:		} else {
ADDRGP4 $503
JUMPV
LABELV $502
line 499
;499:			fov_x = cg_fov.value;
ADDRLP4 0
ADDRGP4 cg_fov+8
INDIRF4
ASGNF4
line 500
;500:			if ( fov_x < 1 ) {
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
GEF4 $506
line 501
;501:				fov_x = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 502
;502:			} else if ( fov_x > 160 ) {
ADDRGP4 $507
JUMPV
LABELV $506
ADDRLP4 0
INDIRF4
CNSTF4 1126170624
LEF4 $508
line 503
;503:				fov_x = 160;
ADDRLP4 0
CNSTF4 1126170624
ASGNF4
line 504
;504:			}
LABELV $508
LABELV $507
line 505
;505:		}
LABELV $503
line 508
;506:
;507:		// account for zooms
;508:		zoomFov = cg_zoomFov.value;
ADDRLP4 20
ADDRGP4 cg_zoomFov+8
INDIRF4
ASGNF4
line 509
;509:		if ( zoomFov < 1 ) {
ADDRLP4 20
INDIRF4
CNSTF4 1065353216
GEF4 $511
line 510
;510:			zoomFov = 1;
ADDRLP4 20
CNSTF4 1065353216
ASGNF4
line 511
;511:		} else if ( zoomFov > 160 ) {
ADDRGP4 $512
JUMPV
LABELV $511
ADDRLP4 20
INDIRF4
CNSTF4 1126170624
LEF4 $513
line 512
;512:			zoomFov = 160;
ADDRLP4 20
CNSTF4 1126170624
ASGNF4
line 513
;513:		}
LABELV $513
LABELV $512
line 516
;514:
;515:		// Shafe - Trep - Improved Zoom
;516:		if ( cg.zoomed ) {
ADDRGP4 cg+109428
INDIRI4
CNSTI4 0
EQI4 $515
line 517
;517:			if (cg.zoomTime != 0)
ADDRGP4 cg+109432
INDIRI4
CNSTI4 0
EQI4 $518
line 518
;518:				f = ( cg.time - cg.zoomTime ) / (float)ZOOM_TIME;
ADDRLP4 28
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+109432
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1140457472
DIVF4
ASGNF4
ADDRGP4 $519
JUMPV
LABELV $518
line 520
;519:			else
;520:				f=-1;
ADDRLP4 28
CNSTF4 3212836864
ASGNF4
LABELV $519
line 521
;521:			if ( f > 1.0 ) {
ADDRLP4 28
INDIRF4
CNSTF4 1065353216
LEF4 $523
line 522
;522:				fov_x = zoomFov;
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 523
;523:				cg.setZoomFov = fov_x;
ADDRGP4 cg+109444
ADDRLP4 0
INDIRF4
CVFI4 4
ASGNI4
line 524
;524:			} else {
ADDRGP4 $516
JUMPV
LABELV $523
line 525
;525:				if(f!=-1){
ADDRLP4 28
INDIRF4
CNSTF4 3212836864
EQF4 $526
line 526
;526:					fov_x = fov_x + f * ( zoomFov - fov_x );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 28
INDIRF4
ADDRLP4 20
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 527
;527:					cg.setZoomFov = fov_x;
ADDRGP4 cg+109444
ADDRLP4 0
INDIRF4
CVFI4 4
ASGNI4
line 528
;528:				}
ADDRGP4 $516
JUMPV
LABELV $526
line 530
;529:			else
;530:				fov_x = cg.setZoomFov;
ADDRLP4 0
ADDRGP4 cg+109444
INDIRI4
CVIF4 4
ASGNF4
line 531
;531:			}
line 532
;532:			} else {
ADDRGP4 $516
JUMPV
LABELV $515
line 533
;533:				f = ( cg.time - cg.zoomTime ) / (float)ZOOM_TIME_OUT;
ADDRLP4 28
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+109432
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1128792064
DIVF4
ASGNF4
line 534
;534:				if ( f > 1.0 ) {
ADDRLP4 28
INDIRF4
CNSTF4 1065353216
LEF4 $532
line 535
;535:					fov_x = fov_x;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ASGNF4
line 536
;536:				} else {
ADDRGP4 $533
JUMPV
LABELV $532
line 537
;537:					fov_x = cg.setZoomFov + f * ( fov_x - cg.setZoomFov );
ADDRLP4 0
ADDRGP4 cg+109444
INDIRI4
CVIF4 4
ADDRLP4 28
INDIRF4
ADDRLP4 0
INDIRF4
ADDRGP4 cg+109444
INDIRI4
CVIF4 4
SUBF4
MULF4
ADDF4
ASGNF4
line 538
;538:			}
LABELV $533
line 539
;539:		}
LABELV $516
line 556
;540:		/*if ( cg.zoomed ) {
;541:			f = ( cg.time - cg.zoomTime ) / (float)ZOOM_TIME;
;542:			if ( f > 1.0 ) {
;543:				fov_x = zoomFov;
;544:			} else {
;545:				fov_x = fov_x + f * ( zoomFov - fov_x );
;546:			}
;547:		} else {
;548:			f = ( cg.time - cg.zoomTime ) / (float)ZOOM_TIME;
;549:			if ( f > 1.0 ) {
;550:				fov_x = fov_x;
;551:			} else {
;552:				fov_x = zoomFov + f * ( fov_x - zoomFov );
;553:			}
;554:		} */
;555:
;556:	}
LABELV $499
line 558
;557:
;558:	x = cg.refdef.width / tan( fov_x / 360 * M_PI );
CNSTF4 1078530011
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
DIVF4
MULF4
ARGF4
ADDRLP4 36
ADDRGP4 tan
CALLF4
ASGNF4
ADDRLP4 8
ADDRGP4 cg+109048+8
INDIRI4
CVIF4 4
ADDRLP4 36
INDIRF4
DIVF4
ASGNF4
line 559
;559:	fov_y = atan2( cg.refdef.height, x );
ADDRGP4 cg+109048+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 40
INDIRF4
ASGNF4
line 560
;560:	fov_y = fov_y * 360 / M_PI;
ADDRLP4 4
CNSTF4 1135869952
ADDRLP4 4
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
ASGNF4
line 563
;561:
;562:	// warp if underwater
;563:	contents = CG_PointContents( cg.refdef.vieworg, -1 );
ADDRGP4 cg+109048+24
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 44
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 44
INDIRI4
ASGNI4
line 564
;564:	if ( contents & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ){
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $542
line 565
;565:		phase = cg.time / 1000.0 * WAVE_FREQUENCY * M_PI * 2;
ADDRLP4 32
CNSTF4 1073741824
CNSTF4 1078530011
CNSTF4 1053609165
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
MULF4
MULF4
MULF4
ASGNF4
line 566
;566:		v = WAVE_AMPLITUDE * sin( phase );
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 24
CNSTF4 1065353216
ADDRLP4 48
INDIRF4
MULF4
ASGNF4
line 567
;567:		fov_x += v;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
ADDF4
ASGNF4
line 568
;568:		fov_y -= v;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 24
INDIRF4
SUBF4
ASGNF4
line 569
;569:		inwater = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 570
;570:	}
ADDRGP4 $543
JUMPV
LABELV $542
line 571
;571:	else {
line 572
;572:		inwater = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 573
;573:	}
LABELV $543
line 577
;574:
;575:
;576:	// set it
;577:	cg.refdef.fov_x = fov_x;
ADDRGP4 cg+109048+16
ADDRLP4 0
INDIRF4
ASGNF4
line 578
;578:	cg.refdef.fov_y = fov_y;
ADDRGP4 cg+109048+20
ADDRLP4 4
INDIRF4
ASGNF4
line 580
;579:
;580:	if ( !cg.zoomed ) {
ADDRGP4 cg+109428
INDIRI4
CNSTI4 0
NEI4 $549
line 581
;581:		cg.zoomSensitivity = 1;
ADDRGP4 cg+109436
CNSTF4 1065353216
ASGNF4
line 582
;582:	} else {
ADDRGP4 $550
JUMPV
LABELV $549
line 583
;583:		cg.zoomSensitivity = cg.refdef.fov_y / 75.0;
ADDRGP4 cg+109436
ADDRGP4 cg+109048+20
INDIRF4
CNSTF4 1117126656
DIVF4
ASGNF4
line 584
;584:	}
LABELV $550
line 586
;585:
;586:	return inwater;
ADDRLP4 16
INDIRI4
RETI4
LABELV $497
endproc CG_CalcFov 52 8
proc CG_DamageBlendBlob 164 12
line 597
;587:}
;588:
;589:
;590:
;591:/*
;592:===============
;593:CG_DamageBlendBlob
;594:
;595:===============
;596:*/
;597:static void CG_DamageBlendBlob( void ) {
line 602
;598:	int			t;
;599:	int			maxTime;
;600:	refEntity_t		ent;
;601:
;602:	if ( !cg.damageValue ) {
ADDRGP4 cg+124712
INDIRF4
CNSTF4 0
NEF4 $557
line 603
;603:		return;
ADDRGP4 $556
JUMPV
LABELV $557
line 611
;604:	}
;605:
;606:	//if (cg.cameraMode) {
;607:	//	return;
;608:	//}
;609:
;610:	// ragePro systems can't fade blends, so don't obscure the screen
;611:	if ( cgs.glconfig.hardwareType == GLHW_RAGEPRO ) {
ADDRGP4 cgs+20100+11288
INDIRI4
CNSTI4 3
NEI4 $560
line 612
;612:		return;
ADDRGP4 $556
JUMPV
LABELV $560
line 615
;613:	}
;614:
;615:	maxTime = DAMAGE_TIME;
ADDRLP4 144
CNSTI4 500
ASGNI4
line 616
;616:	t = cg.time - cg.damageTime;
ADDRLP4 140
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
ADDRGP4 cg+124700
INDIRF4
SUBF4
CVFI4 4
ASGNI4
line 617
;617:	if ( t <= 0 || t >= maxTime ) {
ADDRLP4 140
INDIRI4
CNSTI4 0
LEI4 $568
ADDRLP4 140
INDIRI4
ADDRLP4 144
INDIRI4
LTI4 $566
LABELV $568
line 618
;618:		return;
ADDRGP4 $556
JUMPV
LABELV $566
line 622
;619:	}
;620:
;621:
;622:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 623
;623:	ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 624
;624:	ent.renderfx = RF_FIRST_PERSON;
ADDRLP4 0+4
CNSTI4 4
ASGNI4
line 626
;625:
;626:	VectorMA( cg.refdef.vieworg, 8, cg.refdef.viewaxis[0], ent.origin );
ADDRLP4 0+68
ADDRGP4 cg+109048+24
INDIRF4
CNSTF4 1090519040
ADDRGP4 cg+109048+36
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+4
ADDRGP4 cg+109048+24+4
INDIRF4
CNSTF4 1090519040
ADDRGP4 cg+109048+36+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+8
ADDRGP4 cg+109048+24+8
INDIRF4
CNSTF4 1090519040
ADDRGP4 cg+109048+36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 627
;627:	VectorMA( ent.origin, cg.damageX * -8, cg.refdef.viewaxis[1], ent.origin );
ADDRLP4 0+68
ADDRLP4 0+68
INDIRF4
ADDRGP4 cg+109048+36+12
INDIRF4
CNSTF4 3238002688
ADDRGP4 cg+124704
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+4
ADDRLP4 0+68+4
INDIRF4
ADDRGP4 cg+109048+36+12+4
INDIRF4
CNSTF4 3238002688
ADDRGP4 cg+124704
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
ADDRGP4 cg+109048+36+12+8
INDIRF4
CNSTF4 3238002688
ADDRGP4 cg+124704
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 628
;628:	VectorMA( ent.origin, cg.damageY * 8, cg.refdef.viewaxis[2], ent.origin );
ADDRLP4 0+68
ADDRLP4 0+68
INDIRF4
ADDRGP4 cg+109048+36+24
INDIRF4
CNSTF4 1090519040
ADDRGP4 cg+124708
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+4
ADDRLP4 0+68+4
INDIRF4
ADDRGP4 cg+109048+36+24+4
INDIRF4
CNSTF4 1090519040
ADDRGP4 cg+124708
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
ADDRGP4 cg+109048+36+24+8
INDIRF4
CNSTF4 1090519040
ADDRGP4 cg+124708
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 630
;629:
;630:	ent.radius = cg.damageValue * 3;
ADDRLP4 0+132
CNSTF4 1077936128
ADDRGP4 cg+124712
INDIRF4
MULF4
ASGNF4
line 631
;631:	ent.customShader = cgs.media.viewBloodShader;
ADDRLP4 0+112
ADDRGP4 cgs+152852+248
INDIRI4
ASGNI4
line 632
;632:	ent.shaderRGBA[0] = 255;
ADDRLP4 0+116
CNSTU1 255
ASGNU1
line 633
;633:	ent.shaderRGBA[1] = 255;
ADDRLP4 0+116+1
CNSTU1 255
ASGNU1
line 634
;634:	ent.shaderRGBA[2] = 255;
ADDRLP4 0+116+2
CNSTU1 255
ASGNU1
line 635
;635:	ent.shaderRGBA[3] = 200 * ( 1.0 - ((float)t / maxTime) );
ADDRLP4 156
CNSTF4 1128792064
CNSTF4 1065353216
ADDRLP4 140
INDIRI4
CVIF4 4
ADDRLP4 144
INDIRI4
CVIF4 4
DIVF4
SUBF4
MULF4
ASGNF4
ADDRLP4 160
CNSTF4 1325400064
ASGNF4
ADDRLP4 156
INDIRF4
ADDRLP4 160
INDIRF4
LTF4 $652
ADDRLP4 152
ADDRLP4 156
INDIRF4
ADDRLP4 160
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $653
JUMPV
LABELV $652
ADDRLP4 152
ADDRLP4 156
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $653
ADDRLP4 0+116+3
ADDRLP4 152
INDIRU4
CVUU1 4
ASGNU1
line 636
;636:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 637
;637:}
LABELV $556
endproc CG_DamageBlendBlob 164 12
proc CG_CalcViewValues 40 12
line 647
;638:
;639:
;640:/*
;641:===============
;642:CG_CalcViewValues
;643:
;644:Sets cg.refdef view values
;645:===============
;646:*/
;647:static int CG_CalcViewValues( void ) {
line 650
;648:	playerState_t	*ps;
;649:
;650:	memset( &cg.refdef, 0, sizeof( cg.refdef ) );
ADDRGP4 cg+109048
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 657
;651:
;652:	// strings for in game rendering
;653:	// Q_strncpyz( cg.refdef.text[0], "Park Ranger", sizeof(cg.refdef.text[0]) );
;654:	// Q_strncpyz( cg.refdef.text[1], "19", sizeof(cg.refdef.text[1]) );
;655:
;656:	// calculate size of 3D view
;657:	CG_CalcVrect();
ADDRGP4 CG_CalcVrect
CALLV
pop
line 659
;658:
;659:	ps = &cg.predictedPlayerState;
ADDRLP4 0
ADDRGP4 cg+107636
ASGNP4
line 675
;660:/*
;661:	if (cg.cameraMode) {
;662:		vec3_t origin, angles;
;663:		if (trap_getCameraInfo(cg.time, &origin, &angles)) {
;664:			VectorCopy(origin, cg.refdef.vieworg);
;665:			angles[ROLL] = 0;
;666:			VectorCopy(angles, cg.refdefViewAngles);
;667:			AnglesToAxis( cg.refdefViewAngles, cg.refdef.viewaxis );
;668:			return CG_CalcFov();
;669:		} else {
;670:			cg.cameraMode = qfalse;
;671:		}
;672:	}
;673:*/
;674:	// intermission view
;675:	if ( ps->pm_type == PM_INTERMISSION ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5
NEI4 $658
line 676
;676:		VectorCopy( ps->origin, cg.refdef.vieworg );
ADDRGP4 cg+109048+24
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 677
;677:		VectorCopy( ps->viewangles, cg.refdefViewAngles );
ADDRGP4 cg+109416
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRB
ASGNB 12
line 678
;678:		AnglesToAxis( cg.refdefViewAngles, cg.refdef.viewaxis );
ADDRGP4 cg+109416
ARGP4
ADDRGP4 cg+109048+36
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 679
;679:		return CG_CalcFov();
ADDRLP4 4
ADDRGP4 CG_CalcFov
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $654
JUMPV
LABELV $658
line 682
;680:	}
;681:
;682:	cg.bobcycle = ( ps->bobCycle & 128 ) >> 7;
ADDRGP4 cg+124784
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 7
RSHI4
ASGNI4
line 683
;683:	cg.bobfracsin = fabs( sin( ( ps->bobCycle & 127 ) / 127.0 * M_PI ) );
CNSTF4 1078530011
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 127
BANDI4
CVIF4 4
CNSTF4 1123942400
DIVF4
MULF4
ARGF4
ADDRLP4 4
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRGP4 cg+124780
ADDRLP4 8
INDIRF4
ASGNF4
line 684
;684:	cg.xyspeed = sqrt( ps->velocity[0] * ps->velocity[0] +
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ASGNF4
ADDRLP4 16
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 20
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRGP4 cg+124788
ADDRLP4 24
INDIRF4
ASGNF4
line 688
;685:		ps->velocity[1] * ps->velocity[1] );
;686:
;687:
;688:	VectorCopy( ps->origin, cg.refdef.vieworg );
ADDRGP4 cg+109048+24
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 689
;689:	VectorCopy( ps->viewangles, cg.refdefViewAngles );
ADDRGP4 cg+109416
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRB
ASGNB 12
line 691
;690:
;691:	if (cg_cameraOrbit.integer) {
ADDRGP4 cg_cameraOrbit+12
INDIRI4
CNSTI4 0
EQI4 $672
line 692
;692:		if (cg.time > cg.nextOrbitTime) {
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+124792
INDIRI4
LEI4 $675
line 693
;693:			cg.nextOrbitTime = cg.time + cg_cameraOrbitDelay.integer;
ADDRGP4 cg+124792
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg_cameraOrbitDelay+12
INDIRI4
ADDI4
ASGNI4
line 694
;694:			cg_thirdPersonAngle.value += cg_cameraOrbit.value;
ADDRLP4 28
ADDRGP4 cg_thirdPersonAngle+8
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRGP4 cg_cameraOrbit+8
INDIRF4
ADDF4
ASGNF4
line 695
;695:		}
LABELV $675
line 696
;696:	}
LABELV $672
line 698
;697:	// add error decay
;698:	if ( cg_errorDecay.value > 0 ) {
ADDRGP4 cg_errorDecay+8
INDIRF4
CNSTF4 0
LEF4 $684
line 702
;699:		int		t;
;700:		float	f;
;701:
;702:		t = cg.time - cg.predictedErrorTime;
ADDRLP4 32
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+108840
INDIRI4
SUBI4
ASGNI4
line 703
;703:		f = ( cg_errorDecay.value - t ) / cg_errorDecay.value;
ADDRLP4 28
ADDRGP4 cg_errorDecay+8
INDIRF4
ADDRLP4 32
INDIRI4
CVIF4 4
SUBF4
ADDRGP4 cg_errorDecay+8
INDIRF4
DIVF4
ASGNF4
line 704
;704:		if ( f > 0 && f < 1 ) {
ADDRLP4 36
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 36
INDIRF4
CNSTF4 0
LEF4 $691
ADDRLP4 36
INDIRF4
CNSTF4 1065353216
GEF4 $691
line 705
;705:			VectorMA( cg.refdef.vieworg, f, cg.predictedError, cg.refdef.vieworg );
ADDRGP4 cg+109048+24
ADDRGP4 cg+109048+24
INDIRF4
ADDRGP4 cg+108844
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+109048+24+4
ADDRGP4 cg+109048+24+4
INDIRF4
ADDRGP4 cg+108844+4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+109048+24+8
ADDRGP4 cg+109048+24+8
INDIRF4
ADDRGP4 cg+108844+8
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ADDF4
ASGNF4
line 706
;706:		} else {
ADDRGP4 $692
JUMPV
LABELV $691
line 707
;707:			cg.predictedErrorTime = 0;
ADDRGP4 cg+108840
CNSTI4 0
ASGNI4
line 708
;708:		}
LABELV $692
line 709
;709:	}
LABELV $684
line 711
;710:
;711:	if ( cg.renderingThirdPerson ) {
ADDRGP4 cg+107628
INDIRI4
CNSTI4 0
EQI4 $715
line 713
;712:		// back away from character
;713:		CG_OffsetThirdPersonView();
ADDRGP4 CG_OffsetThirdPersonView
CALLV
pop
line 714
;714:	} else {
ADDRGP4 $716
JUMPV
LABELV $715
line 716
;715:		// offset for local bobbing and kicks
;716:		CG_OffsetFirstPersonView();
ADDRGP4 CG_OffsetFirstPersonView
CALLV
pop
line 717
;717:	}
LABELV $716
line 720
;718:
;719:	// position eye reletive to origin
;720:	AnglesToAxis( cg.refdefViewAngles, cg.refdef.viewaxis );
ADDRGP4 cg+109416
ARGP4
ADDRGP4 cg+109048+36
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 722
;721:
;722:	if ( cg.hyperspace ) {
ADDRGP4 cg+107632
INDIRI4
CNSTI4 0
EQI4 $721
line 723
;723:		cg.refdef.rdflags |= RDF_NOWORLDMODEL | RDF_HYPERSPACE;
ADDRLP4 28
ADDRGP4 cg+109048+76
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 5
BORI4
ASGNI4
line 724
;724:	}
LABELV $721
line 727
;725:
;726:	// field of view
;727:	return CG_CalcFov();
ADDRLP4 28
ADDRGP4 CG_CalcFov
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
RETI4
LABELV $654
endproc CG_CalcViewValues 40 12
proc CG_PowerupTimerSounds 16 16
line 736
;728:}
;729:
;730:
;731:/*
;732:=====================
;733:CG_PowerupTimerSounds
;734:=====================
;735:*/
;736:static void CG_PowerupTimerSounds( void ) {
line 741
;737:	int		i;
;738:	int		t;
;739:
;740:	// powerup timers going away
;741:	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $727
line 742
;742:		t = cg.snap->ps.powerups[i];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRI4
ASGNI4
line 743
;743:		if ( t <= cg.time ) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GTI4 $732
line 744
;744:			continue;
ADDRGP4 $728
JUMPV
LABELV $732
line 746
;745:		}
;746:		if ( t - cg.time >= POWERUP_BLINKS * POWERUP_BLINK_TIME ) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
CNSTI4 5000
LTI4 $735
line 747
;747:			continue;
ADDRGP4 $728
JUMPV
LABELV $735
line 749
;748:		}
;749:		if ( ( t - cg.time ) / POWERUP_BLINK_TIME != ( t - cg.oldTime ) / POWERUP_BLINK_TIME ) {
ADDRLP4 12
CNSTI4 1000
ASGNI4
ADDRLP4 0
INDIRI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
ADDRLP4 12
INDIRI4
DIVI4
ADDRLP4 0
INDIRI4
ADDRGP4 cg+107608
INDIRI4
SUBI4
ADDRLP4 12
INDIRI4
DIVI4
EQI4 $738
line 750
;750:			trap_S_StartSound( NULL, cg.snap->ps.clientNum, CHAN_ITEM, cgs.media.wearOffSound );
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+152852+656
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 751
;751:		}
LABELV $738
line 752
;752:	}
LABELV $728
line 741
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 16
LTI4 $727
line 753
;753:}
LABELV $726
endproc CG_PowerupTimerSounds 16 16
export CG_AddBufferedSound
proc CG_AddBufferedSound 4 0
line 760
;754:
;755:/*
;756:=====================
;757:CG_AddBufferedSound
;758:=====================
;759:*/
;760:void CG_AddBufferedSound( sfxHandle_t sfx ) {
line 761
;761:	if ( !sfx )
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $746
line 762
;762:		return;
ADDRGP4 $745
JUMPV
LABELV $746
line 763
;763:	cg.soundBuffer[cg.soundBufferIn] = sfx;
ADDRGP4 cg+124564
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+124576
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 764
;764:	cg.soundBufferIn = (cg.soundBufferIn + 1) % MAX_SOUNDBUFFER;
ADDRGP4 cg+124564
ADDRGP4 cg+124564
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 20
MODI4
ASGNI4
line 765
;765:	if (cg.soundBufferIn == cg.soundBufferOut) {
ADDRGP4 cg+124564
INDIRI4
ADDRGP4 cg+124568
INDIRI4
NEI4 $752
line 766
;766:		cg.soundBufferOut++;
ADDRLP4 0
ADDRGP4 cg+124568
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 767
;767:	}
LABELV $752
line 768
;768:}
LABELV $745
endproc CG_AddBufferedSound 4 0
proc CG_PlayBufferedSounds 0 8
line 775
;769:
;770:/*
;771:=====================
;772:CG_PlayBufferedSounds
;773:=====================
;774:*/
;775:static void CG_PlayBufferedSounds( void ) {
line 776
;776:	if ( cg.soundTime < cg.time ) {
ADDRGP4 cg+124572
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $758
line 777
;777:		if (cg.soundBufferOut != cg.soundBufferIn && cg.soundBuffer[cg.soundBufferOut]) {
ADDRGP4 cg+124568
INDIRI4
ADDRGP4 cg+124564
INDIRI4
EQI4 $762
ADDRGP4 cg+124568
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+124576
ADDP4
INDIRI4
CNSTI4 0
EQI4 $762
line 778
;778:			trap_S_StartLocalSound(cg.soundBuffer[cg.soundBufferOut], CHAN_ANNOUNCER);
ADDRGP4 cg+124568
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+124576
ADDP4
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 779
;779:			cg.soundBuffer[cg.soundBufferOut] = 0;
ADDRGP4 cg+124568
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+124576
ADDP4
CNSTI4 0
ASGNI4
line 780
;780:			cg.soundBufferOut = (cg.soundBufferOut + 1) % MAX_SOUNDBUFFER;
ADDRGP4 cg+124568
ADDRGP4 cg+124568
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 20
MODI4
ASGNI4
line 781
;781:			cg.soundTime = cg.time + 750;
ADDRGP4 cg+124572
ADDRGP4 cg+107604
INDIRI4
CNSTI4 750
ADDI4
ASGNI4
line 782
;782:		}
LABELV $762
line 783
;783:	}
LABELV $758
line 784
;784:}
LABELV $757
endproc CG_PlayBufferedSounds 0 8
export CG_DrawActiveFrame
proc CG_DrawActiveFrame 28 16
line 795
;785:
;786://=========================================================================
;787:
;788:/*
;789:=================
;790:CG_DrawActiveFrame
;791:
;792:Generates and draws a game scene and status information at the given time.
;793:=================
;794:*/
;795:void CG_DrawActiveFrame( int serverTime, stereoFrame_t stereoView, qboolean demoPlayback ) {
line 798
;796:	int		inwater;
;797:
;798:	cg.time = serverTime;
ADDRGP4 cg+107604
ADDRFP4 0
INDIRI4
ASGNI4
line 802
;799:
;800://unlagged - lag simulation #1
;801:	// adjust the clock to reflect latent snaps
;802:	cg.time -= cg_latentSnaps.integer * (1000 / sv_fps.integer);
ADDRLP4 4
ADDRGP4 cg+107604
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRGP4 cg_latentSnaps+12
INDIRI4
CNSTI4 1000
ADDRGP4 sv_fps+12
INDIRI4
DIVI4
MULI4
SUBI4
ASGNI4
line 805
;803://unlagged - lag simulation #1
;804:
;805:	cg.demoPlayback = demoPlayback;
ADDRGP4 cg+8
ADDRFP4 8
INDIRI4
ASGNI4
line 808
;806:
;807:	// update cvars
;808:	CG_UpdateCvars();
ADDRGP4 CG_UpdateCvars
CALLV
pop
line 812
;809:
;810:	// if we are only updating the screen as a loading
;811:	// pacifier, don't even try to read snapshots
;812:	if ( cg.infoScreenText[0] != 0 ) {
ADDRGP4 cg+109448
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $782
line 813
;813:		CG_DrawInformation();
ADDRGP4 CG_DrawInformation
CALLV
pop
line 814
;814:		return;
ADDRGP4 $776
JUMPV
LABELV $782
line 819
;815:	}
;816:
;817:	// any looped sounds will be respecified as entities
;818:	// are added to the render list
;819:	trap_S_ClearLoopingSounds(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 trap_S_ClearLoopingSounds
CALLV
pop
line 822
;820:
;821:	// clear all the render lists
;822:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 825
;823:
;824:	// set up cg.snap and possibly cg.nextSnap
;825:	CG_ProcessSnapshots();
ADDRGP4 CG_ProcessSnapshots
CALLV
pop
line 829
;826:
;827:	// if we haven't received any snapshots yet, all
;828:	// we can draw is the information screen
;829:	if ( !cg.snap || ( cg.snap->snapFlags & SNAPFLAG_NOT_ACTIVE ) ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $789
ADDRGP4 cg+36
INDIRP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $785
LABELV $789
line 830
;830:		CG_DrawInformation();
ADDRGP4 CG_DrawInformation
CALLV
pop
line 831
;831:		return;
ADDRGP4 $776
JUMPV
LABELV $785
line 835
;832:	}
;833:
;834:	// let the client system know what our weapon and zoom settings are
;835:	trap_SetUserCmdValue( cg.weaponSelect, cg.zoomSensitivity );
ADDRGP4 cg+108948
INDIRI4
ARGI4
ADDRGP4 cg+109436
INDIRF4
ARGF4
ADDRGP4 trap_SetUserCmdValue
CALLV
pop
line 838
;836:
;837:	// this counter will be bumped for every valid scene we generate
;838:	cg.clientFrame++;
ADDRLP4 8
ADDRGP4 cg
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 841
;839:
;840:	// update cg.predictedPlayerState
;841:	CG_PredictPlayerState();
ADDRGP4 CG_PredictPlayerState
CALLV
pop
line 844
;842:
;843:	// decide on third person view
;844:	cg.renderingThirdPerson = cg_thirdPerson.integer || (cg.snap->ps.stats[STAT_HEALTH] <= 0);
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 cg_thirdPerson+12
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $798
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
GTI4 $796
LABELV $798
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $797
JUMPV
LABELV $796
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $797
ADDRGP4 cg+107628
ADDRLP4 12
INDIRI4
ASGNI4
line 847
;845:
;846:	// build cg.refdef
;847:	inwater = CG_CalcViewValues();
ADDRLP4 20
ADDRGP4 CG_CalcViewValues
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
line 850
;848:
;849:	// first person blend blobs, done after AnglesToAxis
;850:	if ( !cg.renderingThirdPerson ) {
ADDRGP4 cg+107628
INDIRI4
CNSTI4 0
NEI4 $799
line 851
;851:		CG_DamageBlendBlob();
ADDRGP4 CG_DamageBlendBlob
CALLV
pop
line 852
;852:	}
LABELV $799
line 855
;853:
;854:	// build the render lists
;855:	if ( !cg.hyperspace ) {
ADDRGP4 cg+107632
INDIRI4
CNSTI4 0
NEI4 $802
line 856
;856:		CG_AddPacketEntities();			// adter calcViewValues, so predicted player state is correct
ADDRGP4 CG_AddPacketEntities
CALLV
pop
line 857
;857:		CG_AddMarks();
ADDRGP4 CG_AddMarks
CALLV
pop
line 858
;858:		CG_AddParticles ();
ADDRGP4 CG_AddParticles
CALLV
pop
line 859
;859:		CG_AddLocalEntities();
ADDRGP4 CG_AddLocalEntities
CALLV
pop
line 860
;860:	}
LABELV $802
line 861
;861:	CG_AddViewWeapon( &cg.predictedPlayerState );
ADDRGP4 cg+107636
ARGP4
ADDRGP4 CG_AddViewWeapon
CALLV
pop
line 864
;862:
;863:	// add buffered sounds
;864:	CG_PlayBufferedSounds();
ADDRGP4 CG_PlayBufferedSounds
CALLV
pop
line 867
;865:
;866:	// play buffered voice chats
;867:	CG_PlayBufferedVoiceChats();
ADDRGP4 CG_PlayBufferedVoiceChats
CALLV
pop
line 870
;868:
;869:	// finish up the rest of the refdef
;870:	if ( cg.testModelEntity.hModel ) {
ADDRGP4 cg+124796+8
INDIRI4
CNSTI4 0
EQI4 $806
line 871
;871:		CG_AddTestModel();
ADDRGP4 CG_AddTestModel
CALLV
pop
line 872
;872:	}
LABELV $806
line 873
;873:	cg.refdef.time = cg.time;
ADDRGP4 cg+109048+72
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 874
;874:	memcpy( cg.refdef.areamask, cg.snap->areamask, sizeof( cg.refdef.areamask ) );
ADDRGP4 cg+109048+80
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 12
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 877
;875:
;876:	// warning sounds when powerup is wearing off
;877:	CG_PowerupTimerSounds();
ADDRGP4 CG_PowerupTimerSounds
CALLV
pop
line 880
;878:
;879:	// update audio positions
;880:	trap_S_Respatialize( cg.snap->ps.clientNum, cg.refdef.vieworg, cg.refdef.viewaxis, inwater );
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+109048+24
ARGP4
ADDRGP4 cg+109048+36
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_S_Respatialize
CALLV
pop
line 883
;881:
;882:	// make sure the lagometerSample and frame timing isn't done twice when in stereo
;883:	if ( stereoView != STEREO_RIGHT ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
EQI4 $823
line 884
;884:		cg.frametime = cg.time - cg.oldTime;
ADDRGP4 cg+107600
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+107608
INDIRI4
SUBI4
ASGNI4
line 885
;885:		if ( cg.frametime < 0 ) {
ADDRGP4 cg+107600
INDIRI4
CNSTI4 0
GEI4 $828
line 886
;886:			cg.frametime = 0;
ADDRGP4 cg+107600
CNSTI4 0
ASGNI4
line 887
;887:		}
LABELV $828
line 888
;888:		cg.oldTime = cg.time;
ADDRGP4 cg+107608
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 889
;889:		CG_AddLagometerFrameInfo();
ADDRGP4 CG_AddLagometerFrameInfo
CALLV
pop
line 890
;890:	}
LABELV $823
line 891
;891:	if (cg_timescale.value != cg_timescaleFadeEnd.value) {
ADDRGP4 cg_timescale+8
INDIRF4
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
EQF4 $834
line 892
;892:		if (cg_timescale.value < cg_timescaleFadeEnd.value) {
ADDRGP4 cg_timescale+8
INDIRF4
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
GEF4 $838
line 893
;893:			cg_timescale.value += cg_timescaleFadeSpeed.value * ((float)cg.frametime) / 1000;
ADDRLP4 24
ADDRGP4 cg_timescale+8
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRGP4 cg_timescaleFadeSpeed+8
INDIRF4
ADDRGP4 cg+107600
INDIRI4
CVIF4 4
MULF4
CNSTF4 1148846080
DIVF4
ADDF4
ASGNF4
line 894
;894:			if (cg_timescale.value > cg_timescaleFadeEnd.value)
ADDRGP4 cg_timescale+8
INDIRF4
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
LEF4 $839
line 895
;895:				cg_timescale.value = cg_timescaleFadeEnd.value;
ADDRGP4 cg_timescale+8
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
ASGNF4
line 896
;896:		}
ADDRGP4 $839
JUMPV
LABELV $838
line 897
;897:		else {
line 898
;898:			cg_timescale.value -= cg_timescaleFadeSpeed.value * ((float)cg.frametime) / 1000;
ADDRLP4 24
ADDRGP4 cg_timescale+8
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRGP4 cg_timescaleFadeSpeed+8
INDIRF4
ADDRGP4 cg+107600
INDIRI4
CVIF4 4
MULF4
CNSTF4 1148846080
DIVF4
SUBF4
ASGNF4
line 899
;899:			if (cg_timescale.value < cg_timescaleFadeEnd.value)
ADDRGP4 cg_timescale+8
INDIRF4
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
GEF4 $854
line 900
;900:				cg_timescale.value = cg_timescaleFadeEnd.value;
ADDRGP4 cg_timescale+8
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
ASGNF4
LABELV $854
line 901
;901:		}
LABELV $839
line 902
;902:		if (cg_timescaleFadeSpeed.value) {
ADDRGP4 cg_timescaleFadeSpeed+8
INDIRF4
CNSTF4 0
EQF4 $860
line 903
;903:			trap_Cvar_Set("timescale", va("%f", cg_timescale.value));
ADDRGP4 $864
ARGP4
ADDRGP4 cg_timescale+8
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $863
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 904
;904:		}
LABELV $860
line 905
;905:	}
LABELV $834
line 908
;906:
;907:	// actually issue the rendering calls
;908:	CG_DrawActive( stereoView );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 CG_DrawActive
CALLV
pop
line 910
;909:
;910:	if ( cg_stats.integer ) {
ADDRGP4 cg_stats+12
INDIRI4
CNSTI4 0
EQI4 $866
line 911
;911:		CG_Printf( "cg.clientFrame:%i\n", cg.clientFrame );
ADDRGP4 $869
ARGP4
ADDRGP4 cg
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 912
;912:	}
LABELV $866
line 915
;913:
;914:
;915:}
LABELV $776
endproc CG_DrawActiveFrame 28 16
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
LABELV $869
byte 1 99
byte 1 103
byte 1 46
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 70
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $864
byte 1 37
byte 1 102
byte 1 0
align 1
LABELV $863
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $228
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $224
byte 1 51
byte 1 48
byte 1 0
align 1
LABELV $223
byte 1 99
byte 1 103
byte 1 95
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $149
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $132
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $93
byte 1 67
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 10
byte 1 0
