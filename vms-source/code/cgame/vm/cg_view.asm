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
ADDRGP4 cg+126852
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
ADDRGP4 cg+126992
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
ADDRGP4 cg+126992
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cg+126852+8
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
ADDRGP4 cg+126852+100
ADDRLP4 32
INDIRF4
ASGNF4
line 64
;64:		cg.testModelEntity.frame = 1;
ADDRGP4 cg+126852+80
CNSTI4 1
ASGNI4
line 65
;65:		cg.testModelEntity.oldframe = 0;
ADDRGP4 cg+126852+96
CNSTI4 0
ASGNI4
line 66
;66:	}
LABELV $81
line 67
;67:	if (! cg.testModelEntity.hModel ) {
ADDRGP4 cg+126852+8
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
ADDRGP4 cg+126852+68
ADDRGP4 cg+111104+24
INDIRF4
CNSTF4 1120403456
ADDRGP4 cg+111104+36
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+126852+68+4
ADDRGP4 cg+111104+24+4
INDIRF4
CNSTF4 1120403456
ADDRGP4 cg+111104+36+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+126852+68+8
ADDRGP4 cg+111104+24+8
INDIRF4
CNSTF4 1120403456
ADDRGP4 cg+111104+36+8
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
ADDRGP4 cg+111472+4
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
ADDRGP4 cg+126852+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 79
;79:	cg.testGun = qfalse;
ADDRGP4 cg+127056
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
ADDRGP4 cg+127056
CNSTI4 1
ASGNI4
line 92
;92:	cg.testModelEntity.renderfx = RF_MINLIGHT | RF_DEPTHHACK | RF_FIRST_PERSON;
ADDRGP4 cg+126852+4
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
ADDRGP4 cg+126852+80
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
ADDRGP4 cg+126852+80
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
ADDRGP4 cg+126852+80
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
ADDRGP4 cg+126852+80
INDIRI4
CNSTI4 0
GEI4 $138
line 104
;104:		cg.testModelEntity.frame = 0;
ADDRGP4 cg+126852+80
CNSTI4 0
ASGNI4
line 105
;105:	}
LABELV $138
line 106
;106:	CG_Printf( "frame %i\n", cg.testModelEntity.frame );
ADDRGP4 $132
ARGP4
ADDRGP4 cg+126852+80
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
ADDRGP4 cg+126852+104
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
ADDRGP4 cg+126852+104
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
ADDRGP4 cg+126852+104
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
ADDRGP4 cg+126852+104
INDIRI4
CNSTI4 0
GEI4 $155
line 117
;117:		cg.testModelEntity.skinNum = 0;
ADDRGP4 cg+126852+104
CNSTI4 0
ASGNI4
line 118
;118:	}
LABELV $155
line 119
;119:	CG_Printf( "skin %i\n", cg.testModelEntity.skinNum );
ADDRGP4 $149
ARGP4
ADDRGP4 cg+126852+104
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
ADDRGP4 cg+126992
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cg+126852+8
ADDRLP4 4
INDIRI4
ASGNI4
line 127
;127:	if (! cg.testModelEntity.hModel ) {
ADDRGP4 cg+126852+8
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
ADDRGP4 cg+127056
INDIRI4
CNSTI4 0
EQI4 $171
line 134
;134:		VectorCopy( cg.refdef.vieworg, cg.testModelEntity.origin );
ADDRGP4 cg+126852+68
ADDRGP4 cg+111104+24
INDIRB
ASGNB 12
line 135
;135:		VectorCopy( cg.refdef.viewaxis[0], cg.testModelEntity.axis[0] );
ADDRGP4 cg+126852+28
ADDRGP4 cg+111104+36
INDIRB
ASGNB 12
line 136
;136:		VectorCopy( cg.refdef.viewaxis[1], cg.testModelEntity.axis[1] );
ADDRGP4 cg+126852+28+12
ADDRGP4 cg+111104+36+12
INDIRB
ASGNB 12
line 137
;137:		VectorCopy( cg.refdef.viewaxis[2], cg.testModelEntity.axis[2] );
ADDRGP4 cg+126852+28+24
ADDRGP4 cg+111104+36+24
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
ADDRGP4 cg+126852+68
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 8
INDIRI4
ADDRGP4 cg+111104+36
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
ADDRGP4 cg+126852+68
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 16
INDIRI4
ADDRGP4 cg+111104+36+12
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
ADDRGP4 cg+126852+68
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 24
INDIRI4
ADDRGP4 cg+111104+36+24
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
ADDRGP4 cg+126852
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
ADDRGP4 cg+111104+8
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
ADDRGP4 cg+111104+8
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
ADDRGP4 cg+111104+12
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
ADDRGP4 cg+111104+12
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
ADDRGP4 cg+111104
ADDRGP4 cgs+20100+11304
INDIRI4
ADDRGP4 cg+111104+8
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 188
;188:	cg.refdef.y = (cgs.glconfig.vidHeight - cg.refdef.height)/2;
ADDRGP4 cg+111104+4
ADDRGP4 cgs+20100+11308
INDIRI4
ADDRGP4 cg+111104+12
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
ADDRGP4 cg+111104+24+8
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRF4
ADDRGP4 cg+109684+164
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 214
;213:
;214:	VectorCopy( cg.refdefViewAngles, focusAngles );
ADDRLP4 48
ADDRGP4 cg+111472
INDIRB
ASGNB 12
line 217
;215:
;216:	// if dead, look at killer
;217:	if ( cg.predictedPlayerState.stats[STAT_HEALTH] <= 0 ) 
ADDRGP4 cg+109684+184
INDIRI4
CNSTI4 0
GTI4 $262
line 218
;218:	{
line 219
;219:		focusAngles[YAW] = cg.predictedPlayerState.stats[STAT_DEAD_YAW];
ADDRLP4 48+4
ADDRGP4 cg+109684+184+16
INDIRI4
CVIF4 4
ASGNF4
line 220
;220:		cg.refdefViewAngles[YAW] = cg.predictedPlayerState.stats[STAT_DEAD_YAW];
ADDRGP4 cg+111472+4
ADDRGP4 cg+109684+184+16
INDIRI4
CVIF4 4
ASGNF4
line 221
;221:	}
LABELV $262
line 223
;222:
;223:	if ( focusAngles[PITCH] > 45 ) {
ADDRLP4 48
INDIRF4
CNSTF4 1110704128
LEF4 $275
line 224
;224:		focusAngles[PITCH] = 45;		// don't go too far overhead
ADDRLP4 48
CNSTF4 1110704128
ASGNF4
line 225
;225:	}
LABELV $275
line 226
;226:	AngleVectors( focusAngles, forward, NULL, NULL );
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
line 228
;227:
;228:	VectorMA( cg.refdef.vieworg, FOCUS_DISTANCE, forward, focusPoint );
ADDRLP4 148
CNSTF4 1140850688
ASGNF4
ADDRLP4 12
ADDRGP4 cg+111104+24
INDIRF4
ADDRLP4 148
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRGP4 cg+111104+24+4
INDIRF4
ADDRLP4 148
INDIRF4
ADDRLP4 24+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRGP4 cg+111104+24+8
INDIRF4
CNSTF4 1140850688
ADDRLP4 24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 230
;229:
;230:	VectorCopy( cg.refdef.vieworg, view );
ADDRLP4 0
ADDRGP4 cg+111104+24
INDIRB
ASGNB 12
line 232
;231:
;232:	view[2] += 8;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 234
;233:
;234:	cg.refdefViewAngles[PITCH] *= 0.5;
ADDRLP4 152
ADDRGP4 cg+111472
ASGNP4
ADDRLP4 152
INDIRP4
CNSTF4 1056964608
ADDRLP4 152
INDIRP4
INDIRF4
MULF4
ASGNF4
line 236
;235:
;236:	AngleVectors( cg.refdefViewAngles, forward, right, up );
ADDRGP4 cg+111472
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
line 238
;237:
;238:	forwardScale = cos( cg_thirdPersonAngle.value / 180 * M_PI );
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
line 239
;239:	sideScale = sin( cg_thirdPersonAngle.value / 180 * M_PI );
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
line 240
;240:	VectorMA( view, -cg_thirdPersonRange.value * forwardScale, forward, view );
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
line 241
;241:	VectorMA( view, -cg_thirdPersonRange.value * sideScale, right, view );
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
line 246
;242:
;243:	// trace a ray from the origin to the viewpoint to make sure the view isn't
;244:	// in a solid block.  Use an 8 by 8 block to prevent the view from near clipping anything
;245:
;246:	if (!cg_cameraMode.integer) {
ADDRGP4 cg_cameraMode+12
INDIRI4
CNSTI4 0
NEI4 $314
line 247
;247:		CG_Trace( &trace, cg.refdef.vieworg, mins, maxs, view, cg.predictedPlayerState.clientNum, MASK_SOLID );
ADDRLP4 72
ARGP4
ADDRGP4 cg+111104+24
ARGP4
ADDRGP4 $254
ARGP4
ADDRGP4 $255
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 cg+109684+140
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 249
;248:
;249:		if ( trace.fraction != 1.0 ) {
ADDRLP4 72+8
INDIRF4
CNSTF4 1065353216
EQF4 $321
line 250
;250:			VectorCopy( trace.endpos, view );
ADDRLP4 0
ADDRLP4 72+12
INDIRB
ASGNB 12
line 251
;251:			view[2] += (1.0 - trace.fraction) * 32;
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
line 255
;252:			// try another trace to this position, because a tunnel may have the ceiling
;253:			// close enogh that this is poking out
;254:
;255:			CG_Trace( &trace, cg.refdef.vieworg, mins, maxs, view, cg.predictedPlayerState.clientNum, MASK_SOLID );
ADDRLP4 72
ARGP4
ADDRGP4 cg+111104+24
ARGP4
ADDRGP4 $254
ARGP4
ADDRGP4 $255
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 cg+109684+140
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 256
;256:			VectorCopy( trace.endpos, view );
ADDRLP4 0
ADDRLP4 72+12
INDIRB
ASGNB 12
line 257
;257:		}
LABELV $321
line 258
;258:	}
LABELV $314
line 261
;259:
;260:
;261:	VectorCopy( view, cg.refdef.vieworg );
ADDRGP4 cg+111104+24
ADDRLP4 0
INDIRB
ASGNB 12
line 264
;262:
;263:	// select pitch to look at focus point from vieword
;264:	VectorSubtract( focusPoint, cg.refdef.vieworg, focusPoint );
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRGP4 cg+111104+24
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRGP4 cg+111104+24+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
ADDRGP4 cg+111104+24+8
INDIRF4
SUBF4
ASGNF4
line 265
;265:	focusDist = sqrt( focusPoint[0] * focusPoint[0] + focusPoint[1] * focusPoint[1] );
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
line 266
;266:	if ( focusDist < 1 ) {
ADDRLP4 68
INDIRF4
CNSTF4 1065353216
GEF4 $348
line 267
;267:		focusDist = 1;	// should never happen
ADDRLP4 68
CNSTF4 1065353216
ASGNF4
line 268
;268:	}
LABELV $348
line 269
;269:	cg.refdefViewAngles[PITCH] = -180 / M_PI * atan2( focusPoint[2], focusDist );
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
ADDRGP4 cg+111472
CNSTF4 3261411041
ADDRLP4 180
INDIRF4
MULF4
ASGNF4
line 270
;270:	cg.refdefViewAngles[YAW] -= cg_thirdPersonAngle.value;
ADDRLP4 184
ADDRGP4 cg+111472+4
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
line 271
;271:}
LABELV $253
endproc CG_OffsetThirdPersonView 188 28
proc CG_StepOffset 8 0
line 275
;272:
;273:
;274:// this causes a compiler bug on mac MrC compiler
;275:static void CG_StepOffset( void ) {
line 279
;276:	int		timeDelta;
;277:	
;278:	// smooth out stair climbing
;279:	timeDelta = cg.time - cg.stepTime;
ADDRLP4 0
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cg+110984
INDIRI4
SUBI4
ASGNI4
line 280
;280:	if ( timeDelta < STEP_TIME ) {
ADDRLP4 0
INDIRI4
CNSTI4 200
GEI4 $358
line 281
;281:		cg.refdef.vieworg[2] -= cg.stepChange 
ADDRLP4 4
ADDRGP4 cg+111104+24+8
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRGP4 cg+110980
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
line 283
;282:			* (STEP_TIME - timeDelta) / STEP_TIME;
;283:	}
LABELV $358
line 284
;284:}
LABELV $355
endproc CG_StepOffset 8 0
proc CG_OffsetFirstPersonView 96 0
line 292
;285:
;286:/*
;287:===============
;288:CG_OffsetFirstPersonView
;289:
;290:===============
;291:*/
;292:static void CG_OffsetFirstPersonView( void ) {
line 303
;293:	float			*origin;
;294:	float			*angles;
;295:	float			bob;
;296:	float			ratio;
;297:	float			delta;
;298:	float			speed;
;299:	float			f;
;300:	vec3_t			predictedVelocity;
;301:	int				timeDelta;
;302:	
;303:	if ( cg.snap->ps.pm_type == PM_INTERMISSION ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 5
NEI4 $365
line 304
;304:		return;
ADDRGP4 $364
JUMPV
LABELV $365
line 307
;305:	}
;306:
;307:	origin = cg.refdef.vieworg;
ADDRLP4 8
ADDRGP4 cg+111104+24
ASGNP4
line 308
;308:	angles = cg.refdefViewAngles;
ADDRLP4 4
ADDRGP4 cg+111472
ASGNP4
line 311
;309:
;310:	// if dead, fix the angle and don't add any kick
;311:	if ( cg.snap->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
GTI4 $371
line 312
;312:		angles[ROLL] = 40;
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1109393408
ASGNF4
line 313
;313:		angles[PITCH] = -15;
ADDRLP4 4
INDIRP4
CNSTF4 3245342720
ASGNF4
line 314
;314:		angles[YAW] = cg.snap->ps.stats[STAT_DEAD_YAW];
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 244
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 315
;315:		origin[2] += cg.predictedPlayerState.viewheight;
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
ADDRGP4 cg+109684+164
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 316
;316:		return;
ADDRGP4 $364
JUMPV
LABELV $371
line 320
;317:	}
;318:
;319:	// add angles based on weapon kick
;320:	VectorAdd (angles, cg.kick_angles, angles);
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRGP4 cg+126812
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
ADDRGP4 cg+126812+4
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
ADDRGP4 cg+126812+8
INDIRF4
ADDF4
ASGNF4
line 323
;321:
;322:	// add angles based on damage kick
;323:	if ( cg.damageTime ) {
ADDRGP4 cg+126756
INDIRF4
CNSTF4 0
EQF4 $382
line 324
;324:		ratio = cg.time - cg.damageTime;
ADDRLP4 32
ADDRGP4 cg+109652
INDIRI4
CVIF4 4
ADDRGP4 cg+126756
INDIRF4
SUBF4
ASGNF4
line 325
;325:		if ( ratio < DAMAGE_DEFLECT_TIME ) {
ADDRLP4 32
INDIRF4
CNSTF4 1120403456
GEF4 $387
line 326
;326:			ratio /= DAMAGE_DEFLECT_TIME;
ADDRLP4 32
ADDRLP4 32
INDIRF4
CNSTF4 1120403456
DIVF4
ASGNF4
line 327
;327:			angles[PITCH] += ratio * cg.v_dmg_pitch;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 32
INDIRF4
ADDRGP4 cg+126804
INDIRF4
MULF4
ADDF4
ASGNF4
line 328
;328:			angles[ROLL] += ratio * cg.v_dmg_roll;
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
ADDRGP4 cg+126808
INDIRF4
MULF4
ADDF4
ASGNF4
line 329
;329:		} else {
ADDRGP4 $388
JUMPV
LABELV $387
line 330
;330:			ratio = 1.0 - ( ratio - DAMAGE_DEFLECT_TIME ) / DAMAGE_RETURN_TIME;
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
line 331
;331:			if ( ratio > 0 ) {
ADDRLP4 32
INDIRF4
CNSTF4 0
LEF4 $391
line 332
;332:				angles[PITCH] += ratio * cg.v_dmg_pitch;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 32
INDIRF4
ADDRGP4 cg+126804
INDIRF4
MULF4
ADDF4
ASGNF4
line 333
;333:				angles[ROLL] += ratio * cg.v_dmg_roll;
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
ADDRGP4 cg+126808
INDIRF4
MULF4
ADDF4
ASGNF4
line 334
;334:			}
LABELV $391
line 335
;335:		}
LABELV $388
line 336
;336:	}
LABELV $382
line 347
;337:
;338:	// add pitch based on fall kick
;339:#if 0
;340:	ratio = ( cg.time - cg.landTime) / FALL_TIME;
;341:	if (ratio < 0)
;342:		ratio = 0;
;343:	angles[PITCH] += ratio * cg.fall_value;
;344:#endif
;345:
;346:	// add angles based on velocity
;347:	VectorCopy( cg.predictedPlayerState.velocity, predictedVelocity );
ADDRLP4 12
ADDRGP4 cg+109684+32
INDIRB
ASGNB 12
line 349
;348:
;349:	delta = DotProduct ( predictedVelocity, cg.refdef.viewaxis[0]);
ADDRLP4 0
ADDRLP4 12
INDIRF4
ADDRGP4 cg+111104+36
INDIRF4
MULF4
ADDRLP4 12+4
INDIRF4
ADDRGP4 cg+111104+36+4
INDIRF4
MULF4
ADDF4
ADDRLP4 12+8
INDIRF4
ADDRGP4 cg+111104+36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 350
;350:	angles[PITCH] += delta * cg_runpitch.value;
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
line 352
;351:	
;352:	delta = DotProduct ( predictedVelocity, cg.refdef.viewaxis[1]);
ADDRLP4 0
ADDRLP4 12
INDIRF4
ADDRGP4 cg+111104+36+12
INDIRF4
MULF4
ADDRLP4 12+4
INDIRF4
ADDRGP4 cg+111104+36+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 12+8
INDIRF4
ADDRGP4 cg+111104+36+12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 353
;353:	angles[ROLL] -= delta * cg_runroll.value;
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
line 358
;354:
;355:	// add angles based on bob
;356:
;357:	// make sure the bob is visible even at low speeds
;358:	speed = cg.xyspeed > 200 ? cg.xyspeed : 200;
ADDRGP4 cg+126844
INDIRF4
CNSTF4 1128792064
LEF4 $425
ADDRLP4 64
ADDRGP4 cg+126844
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
line 360
;359:
;360:	delta = cg.bobfracsin * cg_bobpitch.value * speed;
ADDRLP4 0
ADDRGP4 cg+126836
INDIRF4
ADDRGP4 cg_bobpitch+8
INDIRF4
MULF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 361
;361:	if (cg.predictedPlayerState.pm_flags & PMF_DUCKED)
ADDRGP4 cg+109684+12
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $429
line 362
;362:		delta *= 3;		// crouching
ADDRLP4 0
CNSTF4 1077936128
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
LABELV $429
line 363
;363:	angles[PITCH] += delta;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
line 364
;364:	delta = cg.bobfracsin * cg_bobroll.value * speed;
ADDRLP4 0
ADDRGP4 cg+126836
INDIRF4
ADDRGP4 cg_bobroll+8
INDIRF4
MULF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 365
;365:	if (cg.predictedPlayerState.pm_flags & PMF_DUCKED)
ADDRGP4 cg+109684+12
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $435
line 366
;366:		delta *= 3;		// crouching accentuates roll
ADDRLP4 0
CNSTF4 1077936128
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
LABELV $435
line 367
;367:	if (cg.bobcycle & 1)
ADDRGP4 cg+126840
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $439
line 368
;368:		delta = -delta;
ADDRLP4 0
ADDRLP4 0
INDIRF4
NEGF4
ASGNF4
LABELV $439
line 369
;369:	angles[ROLL] += delta;
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
line 374
;370:
;371://===================================
;372:
;373:	// add view height
;374:	origin[2] += cg.predictedPlayerState.viewheight;
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
ADDRGP4 cg+109684+164
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 377
;375:
;376:	// smooth out duck height changes
;377:	timeDelta = cg.time - cg.duckTime;
ADDRLP4 36
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cg+110992
INDIRI4
SUBI4
ASGNI4
line 378
;378:	if ( timeDelta < DUCK_TIME) {
ADDRLP4 36
INDIRI4
CNSTI4 100
GEI4 $446
line 379
;379:		cg.refdef.vieworg[2] -= cg.duckChange 
ADDRLP4 80
ADDRGP4 cg+111104+24+8
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRF4
ADDRGP4 cg+110988
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
line 381
;380:			* (DUCK_TIME - timeDelta) / DUCK_TIME;
;381:	}
LABELV $446
line 384
;382:
;383:	// add bob height
;384:	bob = cg.bobfracsin * cg.xyspeed * cg_bobup.value;
ADDRLP4 24
ADDRGP4 cg+126836
INDIRF4
ADDRGP4 cg+126844
INDIRF4
MULF4
ADDRGP4 cg_bobup+8
INDIRF4
MULF4
ASGNF4
line 385
;385:	if (bob > 6) {
ADDRLP4 24
INDIRF4
CNSTF4 1086324736
LEF4 $455
line 386
;386:		bob = 6;
ADDRLP4 24
CNSTF4 1086324736
ASGNF4
line 387
;387:	}
LABELV $455
line 389
;388:
;389:	origin[2] += bob;
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
line 393
;390:
;391:
;392:	// add fall height
;393:	delta = cg.time - cg.landTime;
ADDRLP4 0
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cg+111000
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 394
;394:	if ( delta < LAND_DEFLECT_TIME ) {
ADDRLP4 0
INDIRF4
CNSTF4 1125515264
GEF4 $459
line 395
;395:		f = delta / LAND_DEFLECT_TIME;
ADDRLP4 40
ADDRLP4 0
INDIRF4
CNSTF4 1125515264
DIVF4
ASGNF4
line 396
;396:		cg.refdef.vieworg[2] += cg.landChange * f;
ADDRLP4 84
ADDRGP4 cg+111104+24+8
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRF4
ADDRGP4 cg+110996
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ADDF4
ASGNF4
line 397
;397:	} else if ( delta < LAND_DEFLECT_TIME + LAND_RETURN_TIME ) {
ADDRGP4 $460
JUMPV
LABELV $459
ADDRLP4 0
INDIRF4
CNSTF4 1138819072
GEF4 $465
line 398
;398:		delta -= LAND_DEFLECT_TIME;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1125515264
SUBF4
ASGNF4
line 399
;399:		f = 1.0 - ( delta / LAND_RETURN_TIME );
ADDRLP4 40
CNSTF4 1065353216
ADDRLP4 0
INDIRF4
CNSTF4 1133903872
DIVF4
SUBF4
ASGNF4
line 400
;400:		cg.refdef.vieworg[2] += cg.landChange * f;
ADDRLP4 84
ADDRGP4 cg+111104+24+8
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRF4
ADDRGP4 cg+110996
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ADDF4
ASGNF4
line 401
;401:	}
LABELV $465
LABELV $460
line 404
;402:
;403:	// add step offset
;404:	CG_StepOffset();
ADDRGP4 CG_StepOffset
CALLV
pop
line 408
;405:
;406:	// add kick offset
;407:
;408:	VectorAdd (origin, cg.kick_origin, origin);
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRGP4 cg+126824
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
ADDRGP4 cg+126824+4
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
ADDRGP4 cg+126824+8
INDIRF4
ADDF4
ASGNF4
line 422
;409:
;410:	// pivot the eye based on a neck length
;411:#if 0
;412:	{
;413:#define	NECK_LENGTH		8
;414:	vec3_t			forward, up;
;415: 
;416:	cg.refdef.vieworg[2] -= NECK_LENGTH;
;417:	AngleVectors( cg.refdefViewAngles, forward, NULL, up );
;418:	VectorMA( cg.refdef.vieworg, 3, forward, cg.refdef.vieworg );
;419:	VectorMA( cg.refdef.vieworg, NECK_LENGTH, up, cg.refdef.vieworg );
;420:	}
;421:#endif
;422:}
LABELV $364
endproc CG_OffsetFirstPersonView 96 0
export CG_ZoomDown_f
proc CG_ZoomDown_f 4 16
line 429
;423:
;424://======================================================================
;425:
;426:// Shafe - Trep - Improved Zoom 
;427:
;428:void CG_ZoomDown_f( void ) 
;429:{ 
line 432
;430:
;431:	//CG_Printf ("Zoom Function!\n");
;432:	if ( cg.snap->ps.stats[STAT_HEALTH] <= 0 )
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
GTI4 $477
line 433
;433:	{// Don't do anything when you are dead -Vincent
line 434
;434:		return;
ADDRGP4 $476
JUMPV
LABELV $477
line 438
;435:	}
;436:
;437:	// Only The Guass Rifle Can Zoom
;438:	if (cg.snap->ps.weapon != 7)
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 7
EQI4 $480
line 439
;439:	{
line 440
;440:		if(cg.zoomed || !cg.zooming)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 cg+111484
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $487
ADDRGP4 cg+111496
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $476
LABELV $487
line 441
;441:		{
line 442
;442:			cg.zoomTime=0;
ADDRGP4 cg+111488
CNSTI4 0
ASGNI4
line 443
;443:			cg.zooming=qfalse;
ADDRGP4 cg+111496
CNSTI4 0
ASGNI4
line 444
;444:		}
line 445
;445:		return;
ADDRGP4 $476
JUMPV
LABELV $480
line 448
;446:	}
;447:	
;448:	if ( cg.zoomed && !cg.zooming ) 
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 cg+111484
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $490
ADDRGP4 cg+111496
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $490
line 449
;449:	{
line 450
;450:		cg.zoomed = qfalse;
ADDRGP4 cg+111484
CNSTI4 0
ASGNI4
line 451
;451:		cg.zoomTime = cg.time;
ADDRGP4 cg+111488
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 452
;452:	} else {
ADDRGP4 $491
JUMPV
LABELV $490
line 453
;453:		if(cg.zoomed)
ADDRGP4 cg+111484
INDIRI4
CNSTI4 0
EQI4 $497
line 454
;454:			return;
ADDRGP4 $476
JUMPV
LABELV $497
line 456
;455:
;456:		cg.zoomed = qtrue;
ADDRGP4 cg+111484
CNSTI4 1
ASGNI4
line 457
;457:		cg.zooming = qtrue;
ADDRGP4 cg+111496
CNSTI4 1
ASGNI4
line 458
;458:		cg.zoomTime = cg.time;
ADDRGP4 cg+111488
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 459
;459:		trap_S_StartSound( cg.refdef.vieworg, ENTITYNUM_WORLD, CHAN_AUTO, cgs.media.zoomStart );
ADDRGP4 cg+111104+24
ARGP4
CNSTI4 1022
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+154388+1060
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 460
;460:	}
LABELV $491
line 461
;461:}
LABELV $476
endproc CG_ZoomDown_f 4 16
export CG_ZoomUp_f
proc CG_ZoomUp_f 0 0
line 465
;462:
;463:
;464:void CG_ZoomUp_f( void ) 
;465:{
line 466
;466:	if(cg.zoomed)
ADDRGP4 cg+111484
INDIRI4
CNSTI4 0
EQI4 $509
line 467
;467:	{
line 468
;468:		cg.zoomTime=0;
ADDRGP4 cg+111488
CNSTI4 0
ASGNI4
line 469
;469:		cg.zooming=qfalse;
ADDRGP4 cg+111496
CNSTI4 0
ASGNI4
line 470
;470:	}
LABELV $509
line 471
;471:}
LABELV $508
endproc CG_ZoomUp_f 0 0
export CG_ResetZoom
proc CG_ResetZoom 8 0
line 474
;472:
;473:void CG_ResetZoom( void ) 
;474:{ // This one can be used when dead, used for resetting the zoom at death and respawn -Vincent
line 475
;475:	if ( cg.zoomed == qtrue || cg.zooming == qtrue )
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 cg+111484
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $519
ADDRGP4 cg+111496
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $515
LABELV $519
line 476
;476:	{
line 477
;477:		if ( cg.zoomed && !cg.zooming ) 
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 cg+111484
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $520
ADDRGP4 cg+111496
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $520
line 478
;478:		{
line 479
;479:			cg.zoomed = qfalse;
ADDRGP4 cg+111484
CNSTI4 0
ASGNI4
line 480
;480:			cg.zoomTime = cg.time;
ADDRGP4 cg+111488
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 481
;481:		} 
ADDRGP4 $521
JUMPV
LABELV $520
line 483
;482:		else 
;483:		{
line 484
;484:		if(cg.zoomed)
ADDRGP4 cg+111484
INDIRI4
CNSTI4 0
EQI4 $527
line 485
;485:		{
line 486
;486:			return;
ADDRGP4 $514
JUMPV
LABELV $527
line 488
;487:		}
;488:			cg.zoomed = qtrue;
ADDRGP4 cg+111484
CNSTI4 1
ASGNI4
line 489
;489:			cg.zooming = qtrue;
ADDRGP4 cg+111496
CNSTI4 1
ASGNI4
line 490
;490:			cg.zoomTime = cg.time;
ADDRGP4 cg+111488
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 491
;491:		}
LABELV $521
line 492
;492:	}
LABELV $515
line 493
;493:}
LABELV $514
endproc CG_ResetZoom 8 0
export CG_DoZoom_f
proc CG_DoZoom_f 0 0
line 496
;494:
;495:void CG_DoZoom_f( void ) 
;496:{
line 499
;497:
;498:
;499:	if ( !cg.zoomed ) 
ADDRGP4 cg+111484
INDIRI4
CNSTI4 0
NEI4 $535
line 500
;500:	{
line 501
;501:		CG_ZoomDown_f();
ADDRGP4 CG_ZoomDown_f
CALLV
pop
line 502
;502:	} else
ADDRGP4 $536
JUMPV
LABELV $535
line 503
;503:	{
line 504
;504:		CG_ZoomUp_f();
ADDRGP4 CG_ZoomUp_f
CALLV
pop
line 505
;505:	}
LABELV $536
line 509
;506:
;507:
;508:
;509:}
LABELV $534
endproc CG_DoZoom_f 0 0
proc CG_CalcFov 52 8
line 539
;510:
;511:/*  Original Zoom Functions
;512:void CG_ZoomDown_f( void ) { 
;513:	if ( cg.zoomed ) {
;514:		return;
;515:	}
;516:	cg.zoomed = qtrue;
;517:	cg.zoomTime = cg.time;
;518:}
;519:
;520:void CG_ZoomUp_f( void ) { 
;521:	if ( !cg.zoomed ) {
;522:		return;
;523:	}
;524:	cg.zoomed = qfalse;
;525:	cg.zoomTime = cg.time;
;526:}
;527:*/
;528:
;529:/*
;530:====================
;531:CG_CalcFov
;532:
;533:Fixed fov at intermissions, otherwise account for fov variable and zooms.
;534:====================
;535:*/
;536:#define	WAVE_AMPLITUDE	1
;537:#define	WAVE_FREQUENCY	0.4
;538:
;539:static int CG_CalcFov( void ) {
line 549
;540:	float	x;
;541:	float	phase;
;542:	float	v;
;543:	int		contents;
;544:	float	fov_x, fov_y;
;545:	float	zoomFov;
;546:	float	f;
;547:	int		inwater;
;548:
;549:	if ( cg.predictedPlayerState.pm_type == PM_INTERMISSION ) {
ADDRGP4 cg+109684+4
INDIRI4
CNSTI4 5
NEI4 $539
line 551
;550:		// if in intermission, use a fixed value
;551:		fov_x = 90;
ADDRLP4 0
CNSTF4 1119092736
ASGNF4
line 552
;552:	} else {
ADDRGP4 $540
JUMPV
LABELV $539
line 554
;553:		// user selectable
;554:		if ( cgs.dmflags & DF_FIXED_FOV ) {
ADDRGP4 cgs+31460
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $543
line 556
;555:			// dmflag to prevent wide fov for all clients
;556:			fov_x = 90;
ADDRLP4 0
CNSTF4 1119092736
ASGNF4
line 557
;557:		} else {
ADDRGP4 $544
JUMPV
LABELV $543
line 558
;558:			fov_x = cg_fov.value;
ADDRLP4 0
ADDRGP4 cg_fov+8
INDIRF4
ASGNF4
line 559
;559:			if ( fov_x < 1 ) {
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
GEF4 $547
line 560
;560:				fov_x = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 561
;561:			} else if ( fov_x > 160 ) {
ADDRGP4 $548
JUMPV
LABELV $547
ADDRLP4 0
INDIRF4
CNSTF4 1126170624
LEF4 $549
line 562
;562:				fov_x = 160;
ADDRLP4 0
CNSTF4 1126170624
ASGNF4
line 563
;563:			}
LABELV $549
LABELV $548
line 564
;564:		}
LABELV $544
line 567
;565:
;566:		// account for zooms
;567:		zoomFov = cg_zoomFov.value;
ADDRLP4 20
ADDRGP4 cg_zoomFov+8
INDIRF4
ASGNF4
line 568
;568:		if ( zoomFov < 1 ) {
ADDRLP4 20
INDIRF4
CNSTF4 1065353216
GEF4 $552
line 569
;569:			zoomFov = 1;
ADDRLP4 20
CNSTF4 1065353216
ASGNF4
line 570
;570:		} else if ( zoomFov > 160 ) {
ADDRGP4 $553
JUMPV
LABELV $552
ADDRLP4 20
INDIRF4
CNSTF4 1126170624
LEF4 $554
line 571
;571:			zoomFov = 160;
ADDRLP4 20
CNSTF4 1126170624
ASGNF4
line 572
;572:		}
LABELV $554
LABELV $553
line 575
;573:
;574:		// Shafe - Trep - Improved Zoom
;575:		if ( cg.zoomed ) {
ADDRGP4 cg+111484
INDIRI4
CNSTI4 0
EQI4 $556
line 576
;576:			if (cg.zoomTime != 0)
ADDRGP4 cg+111488
INDIRI4
CNSTI4 0
EQI4 $559
line 577
;577:				f = ( cg.time - cg.zoomTime ) / (float)ZOOM_TIME;
ADDRLP4 28
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cg+111488
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1137180672
DIVF4
ASGNF4
ADDRGP4 $560
JUMPV
LABELV $559
line 579
;578:			else
;579:				f=-1;
ADDRLP4 28
CNSTF4 3212836864
ASGNF4
LABELV $560
line 580
;580:			if ( f > 1.0 ) {
ADDRLP4 28
INDIRF4
CNSTF4 1065353216
LEF4 $564
line 581
;581:				fov_x = zoomFov;
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 582
;582:				cg.setZoomFov = fov_x;
ADDRGP4 cg+111500
ADDRLP4 0
INDIRF4
CVFI4 4
ASGNI4
line 583
;583:			} else {
ADDRGP4 $557
JUMPV
LABELV $564
line 584
;584:				if(f!=-1){
ADDRLP4 28
INDIRF4
CNSTF4 3212836864
EQF4 $567
line 585
;585:					fov_x = fov_x + f * ( zoomFov - fov_x );
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
line 586
;586:					cg.setZoomFov = fov_x;
ADDRGP4 cg+111500
ADDRLP4 0
INDIRF4
CVFI4 4
ASGNI4
line 587
;587:				}
ADDRGP4 $557
JUMPV
LABELV $567
line 589
;588:			else
;589:				fov_x = cg.setZoomFov;
ADDRLP4 0
ADDRGP4 cg+111500
INDIRI4
CVIF4 4
ASGNF4
line 590
;590:			}
line 591
;591:			} else {
ADDRGP4 $557
JUMPV
LABELV $556
line 592
;592:				f = ( cg.time - cg.zoomTime ) / (float)ZOOM_TIME_OUT;
ADDRLP4 28
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cg+111488
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1109393408
DIVF4
ASGNF4
line 593
;593:				if ( f > 1.0 ) {
ADDRLP4 28
INDIRF4
CNSTF4 1065353216
LEF4 $573
line 594
;594:					fov_x = fov_x;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ASGNF4
line 595
;595:				} else {
ADDRGP4 $574
JUMPV
LABELV $573
line 596
;596:					fov_x = cg.setZoomFov + f * ( fov_x - cg.setZoomFov );
ADDRLP4 0
ADDRGP4 cg+111500
INDIRI4
CVIF4 4
ADDRLP4 28
INDIRF4
ADDRLP4 0
INDIRF4
ADDRGP4 cg+111500
INDIRI4
CVIF4 4
SUBF4
MULF4
ADDF4
ASGNF4
line 597
;597:			}
LABELV $574
line 598
;598:		}
LABELV $557
line 615
;599:		/*if ( cg.zoomed ) {
;600:			f = ( cg.time - cg.zoomTime ) / (float)ZOOM_TIME;
;601:			if ( f > 1.0 ) {
;602:				fov_x = zoomFov;
;603:			} else {
;604:				fov_x = fov_x + f * ( zoomFov - fov_x );
;605:			}
;606:		} else {
;607:			f = ( cg.time - cg.zoomTime ) / (float)ZOOM_TIME;
;608:			if ( f > 1.0 ) {
;609:				fov_x = fov_x;
;610:			} else {
;611:				fov_x = zoomFov + f * ( fov_x - zoomFov );
;612:			}
;613:		} */
;614:
;615:	}
LABELV $540
line 617
;616:
;617:	x = cg.refdef.width / tan( fov_x / 360 * M_PI );
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
ADDRGP4 cg+111104+8
INDIRI4
CVIF4 4
ADDRLP4 36
INDIRF4
DIVF4
ASGNF4
line 618
;618:	fov_y = atan2( cg.refdef.height, x );
ADDRGP4 cg+111104+12
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
line 619
;619:	fov_y = fov_y * 360 / M_PI;
ADDRLP4 4
CNSTF4 1135869952
ADDRLP4 4
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
ASGNF4
line 622
;620:
;621:	// warp if underwater
;622:	contents = CG_PointContents( cg.refdef.vieworg, -1 );
ADDRGP4 cg+111104+24
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
line 623
;623:	if ( contents & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ){
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $583
line 624
;624:		phase = cg.time / 1000.0 * WAVE_FREQUENCY * M_PI * 2;
ADDRLP4 32
CNSTF4 1073741824
CNSTF4 1078530011
CNSTF4 1053609165
ADDRGP4 cg+109652
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
MULF4
MULF4
MULF4
ASGNF4
line 625
;625:		v = WAVE_AMPLITUDE * sin( phase );
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
line 626
;626:		fov_x += v;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
ADDF4
ASGNF4
line 627
;627:		fov_y -= v;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 24
INDIRF4
SUBF4
ASGNF4
line 628
;628:		inwater = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 629
;629:	}
ADDRGP4 $584
JUMPV
LABELV $583
line 630
;630:	else {
line 631
;631:		inwater = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 632
;632:	}
LABELV $584
line 636
;633:
;634:
;635:	// set it
;636:	cg.refdef.fov_x = fov_x;
ADDRGP4 cg+111104+16
ADDRLP4 0
INDIRF4
ASGNF4
line 637
;637:	cg.refdef.fov_y = fov_y;
ADDRGP4 cg+111104+20
ADDRLP4 4
INDIRF4
ASGNF4
line 639
;638:
;639:	if ( !cg.zoomed ) {
ADDRGP4 cg+111484
INDIRI4
CNSTI4 0
NEI4 $590
line 640
;640:		cg.zoomSensitivity = 1;
ADDRGP4 cg+111492
CNSTF4 1065353216
ASGNF4
line 641
;641:	} else {
ADDRGP4 $591
JUMPV
LABELV $590
line 642
;642:		cg.zoomSensitivity = cg.refdef.fov_y / 75.0;
ADDRGP4 cg+111492
ADDRGP4 cg+111104+20
INDIRF4
CNSTF4 1117126656
DIVF4
ASGNF4
line 643
;643:	}
LABELV $591
line 645
;644:
;645:	return inwater;
ADDRLP4 16
INDIRI4
RETI4
LABELV $538
endproc CG_CalcFov 52 8
proc CG_DamageBlendBlob 164 12
line 655
;646:}
;647:
;648:
;649:/*
;650:===============
;651:CG_DamageBlendBlob
;652:
;653:===============
;654:*/
;655:static void CG_DamageBlendBlob( void ) {
line 660
;656:	int			t;
;657:	int			maxTime;
;658:	refEntity_t		ent;
;659:
;660:	if ( !cg.damageValue ) {
ADDRGP4 cg+126768
INDIRF4
CNSTF4 0
NEF4 $598
line 661
;661:		return;
ADDRGP4 $597
JUMPV
LABELV $598
line 669
;662:	}
;663:
;664:	//if (cg.cameraMode) {
;665:	//	return;
;666:	//}
;667:
;668:	// ragePro systems can't fade blends, so don't obscure the screen
;669:	if ( cgs.glconfig.hardwareType == GLHW_RAGEPRO ) {
ADDRGP4 cgs+20100+11288
INDIRI4
CNSTI4 3
NEI4 $601
line 670
;670:		return;
ADDRGP4 $597
JUMPV
LABELV $601
line 673
;671:	}
;672:
;673:	maxTime = DAMAGE_TIME;
ADDRLP4 144
CNSTI4 500
ASGNI4
line 674
;674:	t = cg.time - cg.damageTime;
ADDRLP4 140
ADDRGP4 cg+109652
INDIRI4
CVIF4 4
ADDRGP4 cg+126756
INDIRF4
SUBF4
CVFI4 4
ASGNI4
line 675
;675:	if ( t <= 0 || t >= maxTime ) {
ADDRLP4 140
INDIRI4
CNSTI4 0
LEI4 $609
ADDRLP4 140
INDIRI4
ADDRLP4 144
INDIRI4
LTI4 $607
LABELV $609
line 676
;676:		return;
ADDRGP4 $597
JUMPV
LABELV $607
line 680
;677:	}
;678:
;679:
;680:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 681
;681:	ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 682
;682:	ent.renderfx = RF_FIRST_PERSON;
ADDRLP4 0+4
CNSTI4 4
ASGNI4
line 684
;683:
;684:	VectorMA( cg.refdef.vieworg, 8, cg.refdef.viewaxis[0], ent.origin );
ADDRLP4 0+68
ADDRGP4 cg+111104+24
INDIRF4
CNSTF4 1090519040
ADDRGP4 cg+111104+36
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+4
ADDRGP4 cg+111104+24+4
INDIRF4
CNSTF4 1090519040
ADDRGP4 cg+111104+36+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+8
ADDRGP4 cg+111104+24+8
INDIRF4
CNSTF4 1090519040
ADDRGP4 cg+111104+36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 685
;685:	VectorMA( ent.origin, cg.damageX * -8, cg.refdef.viewaxis[1], ent.origin );
ADDRLP4 0+68
ADDRLP4 0+68
INDIRF4
ADDRGP4 cg+111104+36+12
INDIRF4
CNSTF4 3238002688
ADDRGP4 cg+126760
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+4
ADDRLP4 0+68+4
INDIRF4
ADDRGP4 cg+111104+36+12+4
INDIRF4
CNSTF4 3238002688
ADDRGP4 cg+126760
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
ADDRGP4 cg+111104+36+12+8
INDIRF4
CNSTF4 3238002688
ADDRGP4 cg+126760
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 686
;686:	VectorMA( ent.origin, cg.damageY * 8, cg.refdef.viewaxis[2], ent.origin );
ADDRLP4 0+68
ADDRLP4 0+68
INDIRF4
ADDRGP4 cg+111104+36+24
INDIRF4
CNSTF4 1090519040
ADDRGP4 cg+126764
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+4
ADDRLP4 0+68+4
INDIRF4
ADDRGP4 cg+111104+36+24+4
INDIRF4
CNSTF4 1090519040
ADDRGP4 cg+126764
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
ADDRGP4 cg+111104+36+24+8
INDIRF4
CNSTF4 1090519040
ADDRGP4 cg+126764
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 688
;687:
;688:	ent.radius = cg.damageValue * 3;
ADDRLP4 0+132
CNSTF4 1077936128
ADDRGP4 cg+126768
INDIRF4
MULF4
ASGNF4
line 689
;689:	ent.customShader = cgs.media.viewBloodShader;
ADDRLP4 0+112
ADDRGP4 cgs+154388+228
INDIRI4
ASGNI4
line 690
;690:	ent.shaderRGBA[0] = 255;
ADDRLP4 0+116
CNSTU1 255
ASGNU1
line 691
;691:	ent.shaderRGBA[1] = 255;
ADDRLP4 0+116+1
CNSTU1 255
ASGNU1
line 692
;692:	ent.shaderRGBA[2] = 255;
ADDRLP4 0+116+2
CNSTU1 255
ASGNU1
line 693
;693:	ent.shaderRGBA[3] = 200 * ( 1.0 - ((float)t / maxTime) );
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
LTF4 $693
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
ADDRGP4 $694
JUMPV
LABELV $693
ADDRLP4 152
ADDRLP4 156
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $694
ADDRLP4 0+116+3
ADDRLP4 152
INDIRU4
CVUU1 4
ASGNU1
line 694
;694:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 695
;695:}
LABELV $597
endproc CG_DamageBlendBlob 164 12
proc CG_CalcViewValues 40 12
line 705
;696:
;697:
;698:/*
;699:===============
;700:CG_CalcViewValues
;701:
;702:Sets cg.refdef view values
;703:===============
;704:*/
;705:static int CG_CalcViewValues( void ) {
line 708
;706:	playerState_t	*ps;
;707:
;708:	memset( &cg.refdef, 0, sizeof( cg.refdef ) );
ADDRGP4 cg+111104
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 715
;709:
;710:	// strings for in game rendering
;711:	// Q_strncpyz( cg.refdef.text[0], "Park Ranger", sizeof(cg.refdef.text[0]) );
;712:	// Q_strncpyz( cg.refdef.text[1], "19", sizeof(cg.refdef.text[1]) );
;713:
;714:	// calculate size of 3D view
;715:	CG_CalcVrect();
ADDRGP4 CG_CalcVrect
CALLV
pop
line 717
;716:
;717:	ps = &cg.predictedPlayerState;
ADDRLP4 0
ADDRGP4 cg+109684
ASGNP4
line 733
;718:/*
;719:	if (cg.cameraMode) {
;720:		vec3_t origin, angles;
;721:		if (trap_getCameraInfo(cg.time, &origin, &angles)) {
;722:			VectorCopy(origin, cg.refdef.vieworg);
;723:			angles[ROLL] = 0;
;724:			VectorCopy(angles, cg.refdefViewAngles);
;725:			AnglesToAxis( cg.refdefViewAngles, cg.refdef.viewaxis );
;726:			return CG_CalcFov();
;727:		} else {
;728:			cg.cameraMode = qfalse;
;729:		}
;730:	}
;731:*/
;732:	// intermission view
;733:	if ( ps->pm_type == PM_INTERMISSION ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5
NEI4 $699
line 734
;734:		VectorCopy( ps->origin, cg.refdef.vieworg );
ADDRGP4 cg+111104+24
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 735
;735:		VectorCopy( ps->viewangles, cg.refdefViewAngles );
ADDRGP4 cg+111472
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRB
ASGNB 12
line 736
;736:		AnglesToAxis( cg.refdefViewAngles, cg.refdef.viewaxis );
ADDRGP4 cg+111472
ARGP4
ADDRGP4 cg+111104+36
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 737
;737:		return CG_CalcFov();
ADDRLP4 4
ADDRGP4 CG_CalcFov
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $695
JUMPV
LABELV $699
line 740
;738:	}
;739:
;740:	cg.bobcycle = ( ps->bobCycle & 128 ) >> 7;
ADDRGP4 cg+126840
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
line 741
;741:	cg.bobfracsin = fabs( sin( ( ps->bobCycle & 127 ) / 127.0 * M_PI ) );
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
ADDRGP4 cg+126836
ADDRLP4 8
INDIRF4
ASGNF4
line 742
;742:	cg.xyspeed = sqrt( ps->velocity[0] * ps->velocity[0] +
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
ADDRGP4 cg+126844
ADDRLP4 24
INDIRF4
ASGNF4
line 746
;743:		ps->velocity[1] * ps->velocity[1] );
;744:
;745:
;746:	VectorCopy( ps->origin, cg.refdef.vieworg );
ADDRGP4 cg+111104+24
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 747
;747:	VectorCopy( ps->viewangles, cg.refdefViewAngles );
ADDRGP4 cg+111472
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRB
ASGNB 12
line 749
;748:
;749:	if (cg_cameraOrbit.integer) {
ADDRGP4 cg_cameraOrbit+12
INDIRI4
CNSTI4 0
EQI4 $713
line 750
;750:		if (cg.time > cg.nextOrbitTime) {
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cg+126848
INDIRI4
LEI4 $716
line 751
;751:			cg.nextOrbitTime = cg.time + cg_cameraOrbitDelay.integer;
ADDRGP4 cg+126848
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cg_cameraOrbitDelay+12
INDIRI4
ADDI4
ASGNI4
line 752
;752:			cg_thirdPersonAngle.value += cg_cameraOrbit.value;
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
line 753
;753:		}
LABELV $716
line 754
;754:	}
LABELV $713
line 756
;755:	// add error decay
;756:	if ( cg_errorDecay.value > 0 ) {
ADDRGP4 cg_errorDecay+8
INDIRF4
CNSTF4 0
LEF4 $725
line 760
;757:		int		t;
;758:		float	f;
;759:
;760:		t = cg.time - cg.predictedErrorTime;
ADDRLP4 32
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cg+110896
INDIRI4
SUBI4
ASGNI4
line 761
;761:		f = ( cg_errorDecay.value - t ) / cg_errorDecay.value;
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
line 762
;762:		if ( f > 0 && f < 1 ) {
ADDRLP4 36
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 36
INDIRF4
CNSTF4 0
LEF4 $732
ADDRLP4 36
INDIRF4
CNSTF4 1065353216
GEF4 $732
line 763
;763:			VectorMA( cg.refdef.vieworg, f, cg.predictedError, cg.refdef.vieworg );
ADDRGP4 cg+111104+24
ADDRGP4 cg+111104+24
INDIRF4
ADDRGP4 cg+110900
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+111104+24+4
ADDRGP4 cg+111104+24+4
INDIRF4
ADDRGP4 cg+110900+4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+111104+24+8
ADDRGP4 cg+111104+24+8
INDIRF4
ADDRGP4 cg+110900+8
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ADDF4
ASGNF4
line 764
;764:		} else {
ADDRGP4 $733
JUMPV
LABELV $732
line 765
;765:			cg.predictedErrorTime = 0;
ADDRGP4 cg+110896
CNSTI4 0
ASGNI4
line 766
;766:		}
LABELV $733
line 767
;767:	}
LABELV $725
line 769
;768:
;769:	if ( cg.renderingThirdPerson ) {
ADDRGP4 cg+109676
INDIRI4
CNSTI4 0
EQI4 $756
line 771
;770:		// back away from character
;771:		CG_OffsetThirdPersonView();
ADDRGP4 CG_OffsetThirdPersonView
CALLV
pop
line 772
;772:	} else {
ADDRGP4 $757
JUMPV
LABELV $756
line 774
;773:		// offset for local bobbing and kicks
;774:		CG_OffsetFirstPersonView();
ADDRGP4 CG_OffsetFirstPersonView
CALLV
pop
line 775
;775:	}
LABELV $757
line 778
;776:
;777:	// position eye reletive to origin
;778:	AnglesToAxis( cg.refdefViewAngles, cg.refdef.viewaxis );
ADDRGP4 cg+111472
ARGP4
ADDRGP4 cg+111104+36
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 780
;779:
;780:	if ( cg.hyperspace ) {
ADDRGP4 cg+109680
INDIRI4
CNSTI4 0
EQI4 $762
line 781
;781:		cg.refdef.rdflags |= RDF_NOWORLDMODEL | RDF_HYPERSPACE;
ADDRLP4 28
ADDRGP4 cg+111104+76
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 5
BORI4
ASGNI4
line 782
;782:	}
LABELV $762
line 785
;783:
;784:	// field of view
;785:	return CG_CalcFov();
ADDRLP4 28
ADDRGP4 CG_CalcFov
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
RETI4
LABELV $695
endproc CG_CalcViewValues 40 12
proc CG_PowerupTimerSounds 16 16
line 794
;786:}
;787:
;788:
;789:/*
;790:=====================
;791:CG_PowerupTimerSounds
;792:=====================
;793:*/
;794:static void CG_PowerupTimerSounds( void ) {
line 799
;795:	int		i;
;796:	int		t;
;797:
;798:	// powerup timers going away
;799:	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $768
line 800
;800:		t = cg.snap->ps.powerups[i];
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
line 801
;801:		if ( t <= cg.time ) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+109652
INDIRI4
GTI4 $773
line 802
;802:			continue;
ADDRGP4 $769
JUMPV
LABELV $773
line 804
;803:		}
;804:		if ( t - cg.time >= POWERUP_BLINKS * POWERUP_BLINK_TIME ) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+109652
INDIRI4
SUBI4
CNSTI4 5000
LTI4 $776
line 805
;805:			continue;
ADDRGP4 $769
JUMPV
LABELV $776
line 807
;806:		}
;807:		if ( ( t - cg.time ) / POWERUP_BLINK_TIME != ( t - cg.oldTime ) / POWERUP_BLINK_TIME ) {
ADDRLP4 12
CNSTI4 1000
ASGNI4
ADDRLP4 0
INDIRI4
ADDRGP4 cg+109652
INDIRI4
SUBI4
ADDRLP4 12
INDIRI4
DIVI4
ADDRLP4 0
INDIRI4
ADDRGP4 cg+109656
INDIRI4
SUBI4
ADDRLP4 12
INDIRI4
DIVI4
EQI4 $779
line 808
;808:			trap_S_StartSound( NULL, cg.snap->ps.clientNum, CHAN_ITEM, cgs.media.wearOffSound );
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
ADDRGP4 cgs+154388+616
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 809
;809:		}
LABELV $779
line 810
;810:	}
LABELV $769
line 799
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 16
LTI4 $768
line 811
;811:}
LABELV $767
endproc CG_PowerupTimerSounds 16 16
export CG_AddBufferedSound
proc CG_AddBufferedSound 4 0
line 818
;812:
;813:/*
;814:=====================
;815:CG_AddBufferedSound
;816:=====================
;817:*/
;818:void CG_AddBufferedSound( sfxHandle_t sfx ) {
line 819
;819:	if ( !sfx )
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $787
line 820
;820:		return;
ADDRGP4 $786
JUMPV
LABELV $787
line 821
;821:	cg.soundBuffer[cg.soundBufferIn] = sfx;
ADDRGP4 cg+126620
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+126632
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 822
;822:	cg.soundBufferIn = (cg.soundBufferIn + 1) % MAX_SOUNDBUFFER;
ADDRGP4 cg+126620
ADDRGP4 cg+126620
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 20
MODI4
ASGNI4
line 823
;823:	if (cg.soundBufferIn == cg.soundBufferOut) {
ADDRGP4 cg+126620
INDIRI4
ADDRGP4 cg+126624
INDIRI4
NEI4 $793
line 824
;824:		cg.soundBufferOut++;
ADDRLP4 0
ADDRGP4 cg+126624
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 825
;825:	}
LABELV $793
line 826
;826:}
LABELV $786
endproc CG_AddBufferedSound 4 0
proc CG_PlayBufferedSounds 0 8
line 833
;827:
;828:/*
;829:=====================
;830:CG_PlayBufferedSounds
;831:=====================
;832:*/
;833:static void CG_PlayBufferedSounds( void ) {
line 834
;834:	if ( cg.soundTime < cg.time ) {
ADDRGP4 cg+126628
INDIRI4
ADDRGP4 cg+109652
INDIRI4
GEI4 $799
line 835
;835:		if (cg.soundBufferOut != cg.soundBufferIn && cg.soundBuffer[cg.soundBufferOut]) {
ADDRGP4 cg+126624
INDIRI4
ADDRGP4 cg+126620
INDIRI4
EQI4 $803
ADDRGP4 cg+126624
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+126632
ADDP4
INDIRI4
CNSTI4 0
EQI4 $803
line 836
;836:			trap_S_StartLocalSound(cg.soundBuffer[cg.soundBufferOut], CHAN_ANNOUNCER);
ADDRGP4 cg+126624
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+126632
ADDP4
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 837
;837:			cg.soundBuffer[cg.soundBufferOut] = 0;
ADDRGP4 cg+126624
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+126632
ADDP4
CNSTI4 0
ASGNI4
line 838
;838:			cg.soundBufferOut = (cg.soundBufferOut + 1) % MAX_SOUNDBUFFER;
ADDRGP4 cg+126624
ADDRGP4 cg+126624
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 20
MODI4
ASGNI4
line 839
;839:			cg.soundTime = cg.time + 750;
ADDRGP4 cg+126628
ADDRGP4 cg+109652
INDIRI4
CNSTI4 750
ADDI4
ASGNI4
line 840
;840:		}
LABELV $803
line 841
;841:	}
LABELV $799
line 842
;842:}
LABELV $798
endproc CG_PlayBufferedSounds 0 8
export CG_DrawActiveFrame
proc CG_DrawActiveFrame 28 16
line 853
;843:
;844://=========================================================================
;845:
;846:/*
;847:=================
;848:CG_DrawActiveFrame
;849:
;850:Generates and draws a game scene and status information at the given time.
;851:=================
;852:*/
;853:void CG_DrawActiveFrame( int serverTime, stereoFrame_t stereoView, qboolean demoPlayback ) {
line 856
;854:	int		inwater;
;855:
;856:	cg.time = serverTime;
ADDRGP4 cg+109652
ADDRFP4 0
INDIRI4
ASGNI4
line 860
;857:
;858://unlagged - lag simulation #1
;859:	// adjust the clock to reflect latent snaps
;860:	cg.time -= cg_latentSnaps.integer * (1000 / sv_fps.integer);
ADDRLP4 4
ADDRGP4 cg+109652
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
line 863
;861://unlagged - lag simulation #1
;862:
;863:	cg.demoPlayback = demoPlayback;
ADDRGP4 cg+8
ADDRFP4 8
INDIRI4
ASGNI4
line 866
;864:
;865:	// update cvars
;866:	CG_UpdateCvars();
ADDRGP4 CG_UpdateCvars
CALLV
pop
line 870
;867:
;868:	// if we are only updating the screen as a loading
;869:	// pacifier, don't even try to read snapshots
;870:	if ( cg.infoScreenText[0] != 0 ) {
ADDRGP4 cg+111504
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $823
line 871
;871:		CG_DrawInformation();
ADDRGP4 CG_DrawInformation
CALLV
pop
line 872
;872:		return;
ADDRGP4 $817
JUMPV
LABELV $823
line 877
;873:	}
;874:
;875:	// any looped sounds will be respecified as entities
;876:	// are added to the render list
;877:	trap_S_ClearLoopingSounds(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 trap_S_ClearLoopingSounds
CALLV
pop
line 880
;878:
;879:	// clear all the render lists
;880:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 883
;881:
;882:	// set up cg.snap and possibly cg.nextSnap
;883:	CG_ProcessSnapshots();
ADDRGP4 CG_ProcessSnapshots
CALLV
pop
line 887
;884:
;885:	// if we haven't received any snapshots yet, all
;886:	// we can draw is the information screen
;887:	if ( !cg.snap || ( cg.snap->snapFlags & SNAPFLAG_NOT_ACTIVE ) ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $830
ADDRGP4 cg+36
INDIRP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $826
LABELV $830
line 888
;888:		CG_DrawInformation();
ADDRGP4 CG_DrawInformation
CALLV
pop
line 889
;889:		return;
ADDRGP4 $817
JUMPV
LABELV $826
line 893
;890:	}
;891:
;892:	// let the client system know what our weapon and zoom settings are
;893:	trap_SetUserCmdValue( cg.weaponSelect, cg.zoomSensitivity );
ADDRGP4 cg+111004
INDIRI4
ARGI4
ADDRGP4 cg+111492
INDIRF4
ARGF4
ADDRGP4 trap_SetUserCmdValue
CALLV
pop
line 896
;894:
;895:	// this counter will be bumped for every valid scene we generate
;896:	cg.clientFrame++;
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
line 899
;897:
;898:	// update cg.predictedPlayerState
;899:	CG_PredictPlayerState();
ADDRGP4 CG_PredictPlayerState
CALLV
pop
line 902
;900:
;901:	// decide on third person view
;902:	cg.renderingThirdPerson = cg_thirdPerson.integer || (cg.snap->ps.stats[STAT_HEALTH] <= 0);
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 cg_thirdPerson+12
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $839
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
GTI4 $837
LABELV $839
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $838
JUMPV
LABELV $837
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $838
ADDRGP4 cg+109676
ADDRLP4 12
INDIRI4
ASGNI4
line 905
;903:
;904:	// build cg.refdef
;905:	inwater = CG_CalcViewValues();
ADDRLP4 20
ADDRGP4 CG_CalcViewValues
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
line 908
;906:
;907:	// first person blend blobs, done after AnglesToAxis
;908:	if ( !cg.renderingThirdPerson ) {
ADDRGP4 cg+109676
INDIRI4
CNSTI4 0
NEI4 $840
line 909
;909:		CG_DamageBlendBlob();
ADDRGP4 CG_DamageBlendBlob
CALLV
pop
line 910
;910:	}
LABELV $840
line 913
;911:
;912:	// build the render lists
;913:	if ( !cg.hyperspace ) {
ADDRGP4 cg+109680
INDIRI4
CNSTI4 0
NEI4 $843
line 914
;914:		CG_AddPacketEntities();			// adter calcViewValues, so predicted player state is correct
ADDRGP4 CG_AddPacketEntities
CALLV
pop
line 915
;915:		CG_AddMarks();
ADDRGP4 CG_AddMarks
CALLV
pop
line 916
;916:		CG_AddParticles ();
ADDRGP4 CG_AddParticles
CALLV
pop
line 917
;917:		CG_AddLocalEntities();
ADDRGP4 CG_AddLocalEntities
CALLV
pop
line 918
;918:	}
LABELV $843
line 919
;919:	CG_AddViewWeapon( &cg.predictedPlayerState );
ADDRGP4 cg+109684
ARGP4
ADDRGP4 CG_AddViewWeapon
CALLV
pop
line 922
;920:
;921:	// add buffered sounds
;922:	CG_PlayBufferedSounds();
ADDRGP4 CG_PlayBufferedSounds
CALLV
pop
line 925
;923:
;924:	// play buffered voice chats
;925:	CG_PlayBufferedVoiceChats();
ADDRGP4 CG_PlayBufferedVoiceChats
CALLV
pop
line 928
;926:
;927:	// finish up the rest of the refdef
;928:	if ( cg.testModelEntity.hModel ) {
ADDRGP4 cg+126852+8
INDIRI4
CNSTI4 0
EQI4 $847
line 929
;929:		CG_AddTestModel();
ADDRGP4 CG_AddTestModel
CALLV
pop
line 930
;930:	}
LABELV $847
line 931
;931:	cg.refdef.time = cg.time;
ADDRGP4 cg+111104+72
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 932
;932:	memcpy( cg.refdef.areamask, cg.snap->areamask, sizeof( cg.refdef.areamask ) );
ADDRGP4 cg+111104+80
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
line 935
;933:
;934:	// warning sounds when powerup is wearing off
;935:	CG_PowerupTimerSounds();
ADDRGP4 CG_PowerupTimerSounds
CALLV
pop
line 938
;936:
;937:	// update audio positions
;938:	trap_S_Respatialize( cg.snap->ps.clientNum, cg.refdef.vieworg, cg.refdef.viewaxis, inwater );
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+111104+24
ARGP4
ADDRGP4 cg+111104+36
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_S_Respatialize
CALLV
pop
line 941
;939:
;940:	// make sure the lagometerSample and frame timing isn't done twice when in stereo
;941:	if ( stereoView != STEREO_RIGHT ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
EQI4 $864
line 942
;942:		cg.frametime = cg.time - cg.oldTime;
ADDRGP4 cg+109648
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cg+109656
INDIRI4
SUBI4
ASGNI4
line 943
;943:		if ( cg.frametime < 0 ) {
ADDRGP4 cg+109648
INDIRI4
CNSTI4 0
GEI4 $869
line 944
;944:			cg.frametime = 0;
ADDRGP4 cg+109648
CNSTI4 0
ASGNI4
line 945
;945:		}
LABELV $869
line 946
;946:		cg.oldTime = cg.time;
ADDRGP4 cg+109656
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 947
;947:		CG_AddLagometerFrameInfo();
ADDRGP4 CG_AddLagometerFrameInfo
CALLV
pop
line 948
;948:	}
LABELV $864
line 949
;949:	if (cg_timescale.value != cg_timescaleFadeEnd.value) {
ADDRGP4 cg_timescale+8
INDIRF4
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
EQF4 $875
line 950
;950:		if (cg_timescale.value < cg_timescaleFadeEnd.value) {
ADDRGP4 cg_timescale+8
INDIRF4
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
GEF4 $879
line 951
;951:			cg_timescale.value += cg_timescaleFadeSpeed.value * ((float)cg.frametime) / 1000;
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
ADDRGP4 cg+109648
INDIRI4
CVIF4 4
MULF4
CNSTF4 1148846080
DIVF4
ADDF4
ASGNF4
line 952
;952:			if (cg_timescale.value > cg_timescaleFadeEnd.value)
ADDRGP4 cg_timescale+8
INDIRF4
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
LEF4 $880
line 953
;953:				cg_timescale.value = cg_timescaleFadeEnd.value;
ADDRGP4 cg_timescale+8
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
ASGNF4
line 954
;954:		}
ADDRGP4 $880
JUMPV
LABELV $879
line 955
;955:		else {
line 956
;956:			cg_timescale.value -= cg_timescaleFadeSpeed.value * ((float)cg.frametime) / 1000;
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
ADDRGP4 cg+109648
INDIRI4
CVIF4 4
MULF4
CNSTF4 1148846080
DIVF4
SUBF4
ASGNF4
line 957
;957:			if (cg_timescale.value < cg_timescaleFadeEnd.value)
ADDRGP4 cg_timescale+8
INDIRF4
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
GEF4 $895
line 958
;958:				cg_timescale.value = cg_timescaleFadeEnd.value;
ADDRGP4 cg_timescale+8
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
ASGNF4
LABELV $895
line 959
;959:		}
LABELV $880
line 960
;960:		if (cg_timescaleFadeSpeed.value) {
ADDRGP4 cg_timescaleFadeSpeed+8
INDIRF4
CNSTF4 0
EQF4 $901
line 961
;961:			trap_Cvar_Set("timescale", va("%f", cg_timescale.value));
ADDRGP4 $905
ARGP4
ADDRGP4 cg_timescale+8
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $904
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 962
;962:		}
LABELV $901
line 963
;963:	}
LABELV $875
line 966
;964:
;965:	// actually issue the rendering calls
;966:	CG_DrawActive( stereoView );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 CG_DrawActive
CALLV
pop
line 968
;967:
;968:	if( cg.snap->ps.stats[STAT_HEALTH] <= 0 || cg.snap->ps.weapon != 7 )
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
LEI4 $911
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 7
EQI4 $907
LABELV $911
line 969
;969:		CG_ResetZoom(); // Dead or no sniper? No zoom! -Vincent
ADDRGP4 CG_ResetZoom
CALLV
pop
LABELV $907
line 971
;970:
;971:	if ( cg_stats.integer ) {
ADDRGP4 cg_stats+12
INDIRI4
CNSTI4 0
EQI4 $912
line 972
;972:		CG_Printf( "cg.clientFrame:%i\n", cg.clientFrame );
ADDRGP4 $915
ARGP4
ADDRGP4 cg
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 973
;973:	}
LABELV $912
line 976
;974:
;975:
;976:}
LABELV $817
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
LABELV $915
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
LABELV $905
byte 1 37
byte 1 102
byte 1 0
align 1
LABELV $904
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
