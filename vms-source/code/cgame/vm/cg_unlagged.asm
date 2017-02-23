export CG_PredictWeaponEffects
code
proc CG_PredictWeaponEffects 184 48
file "../cg_unlagged.c"
line 19
;1:#include "cg_local.h"
;2:
;3:// we'll need these prototypes
;4:void CG_ShotgunPattern( vec3_t origin, vec3_t origin2, int seed, int otherEntNum );
;5:void CG_Bullet( vec3_t end, int sourceEntityNum, vec3_t normal, qboolean flesh, int fleshEntityNum );
;6:
;7:// and this as well
;8:#define MACHINEGUN_SPREAD	100
;9:
;10:/*
;11:=======================
;12:CG_PredictWeaponEffects
;13:
;14:Draws predicted effects for the railgun, shotgun, and machinegun.  The
;15:lightning gun is done in CG_LightningBolt, since it was just a matter
;16:of setting the right origin and angles.
;17:=======================
;18:*/
;19:void CG_PredictWeaponEffects( centity_t *cent ) {
line 21
;20:	vec3_t		muzzlePoint, forward, right, up;
;21:	entityState_t *ent = &cent->currentState;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
line 24
;22:
;23:	// if the client isn't us, forget it
;24:	if ( cent->currentState.number != cg.predictedPlayerState.clientNum ) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
EQI4 $73
line 25
;25:		return;
ADDRGP4 $72
JUMPV
LABELV $73
line 29
;26:	}
;27:
;28:	// if it's not switched on server-side, forget it
;29:	if ( !cgs.delagHitscan ) {
ADDRGP4 cgs+155528
INDIRI4
CNSTI4 0
NEI4 $77
line 30
;30:		return;
ADDRGP4 $72
JUMPV
LABELV $77
line 34
;31:	}
;32:
;33:	// get the muzzle point
;34:	VectorCopy( cg.predictedPlayerState.origin, muzzlePoint );
ADDRLP4 0
ADDRGP4 cg+109684+20
INDIRB
ASGNB 12
line 35
;35:	muzzlePoint[2] += cg.predictedPlayerState.viewheight;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRGP4 cg+109684+164
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 38
;36:
;37:	// get forward, right, and up
;38:	AngleVectors( cg.predictedPlayerState.viewangles, forward, right, up );
ADDRGP4 cg+109684+152
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 40
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 39
;39:	VectorMA( muzzlePoint, 14, forward, muzzlePoint );
ADDRLP4 52
CNSTF4 1096810496
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 52
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 52
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1096810496
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 42
;40:
;41:	// was it a rail attack?
;42:	if ( ent->weapon == WP_RAILGUN ) {
ADDRLP4 24
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 3
NEI4 $93
line 44
;43:		// do we have it on for the rail gun?
;44:		if ( cg_delag.integer & 1 || cg_delag.integer & 16 ) {
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 56
INDIRI4
NEI4 $99
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 56
INDIRI4
EQI4 $94
LABELV $99
line 49
;45:			trace_t trace;
;46:			vec3_t endPoint;
;47:
;48:			// trace forward
;49:			VectorMA( muzzlePoint, 8192, forward, endPoint );
ADDRLP4 128
CNSTF4 1174405120
ASGNF4
ADDRLP4 116
ADDRLP4 0
INDIRF4
ADDRLP4 128
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 116+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 128
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 116+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1174405120
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 54
;50:
;51:			// THIS IS FOR DEBUGGING!
;52:			// you definitely *will* want something like this to test the backward reconciliation
;53:			// to make sure it's working *exactly* right
;54:			if ( cg_debugDelag.integer ) {
ADDRGP4 cg_debugDelag+12
INDIRI4
CNSTI4 0
EQI4 $106
line 56
;55:				// trace forward
;56:				CG_Trace( &trace, muzzlePoint, vec3_origin, vec3_origin, endPoint, cent->currentState.number, CONTENTS_BODY|CONTENTS_SOLID );
ADDRLP4 60
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 132
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRLP4 116
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 33554433
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 59
;57:
;58:				// did we hit another player?
;59:				if ( trace.fraction < 1.0f && (trace.contents & CONTENTS_BODY) ) {
ADDRLP4 60+8
INDIRF4
CNSTF4 1065353216
GEF4 $109
ADDRLP4 60+48
INDIRI4
CNSTI4 33554432
BANDI4
CNSTI4 0
EQI4 $109
line 61
;60:					// if we have two snapshots (we're interpolating)
;61:					if ( cg.nextSnap ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $113
line 62
;62:						centity_t *c = &cg_entities[trace.entityNum];
ADDRLP4 136
CNSTI4 740
ADDRLP4 60+52
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 66
;63:						vec3_t origin1, origin2;
;64:
;65:						// figure the two origins used for interpolation
;66:						BG_EvaluateTrajectory( &c->currentState.pos, cg.snap->serverTime, origin1 );
ADDRLP4 136
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
ADDRLP4 140
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 67
;67:						BG_EvaluateTrajectory( &c->nextState.pos, cg.nextSnap->serverTime, origin2 );
ADDRLP4 136
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
ADDRLP4 152
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 72
;68:
;69:						// print some debugging stuff exactly like what the server does
;70:
;71:						// it starts with "Int:" to let you know the target was interpolated
;72:						CG_Printf("^3Int: time: %d, j: %d, k: %d, origin: %0.2f %0.2f %0.2f\n",
ADDRGP4 $119
ARGP4
ADDRGP4 cg+109656
INDIRI4
ARGI4
ADDRLP4 164
CNSTI4 8
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 164
INDIRI4
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+40
INDIRP4
ADDRLP4 164
INDIRI4
ADDP4
INDIRI4
ARGI4
ADDRLP4 168
ADDRLP4 136
INDIRP4
ASGNP4
ADDRLP4 168
INDIRP4
CNSTI4 716
ADDP4
INDIRF4
ARGF4
ADDRLP4 168
INDIRP4
CNSTI4 720
ADDP4
INDIRF4
ARGF4
ADDRLP4 168
INDIRP4
CNSTI4 724
ADDP4
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 75
;73:								cg.oldTime, cg.snap->serverTime, cg.nextSnap->serverTime,
;74:								c->lerpOrigin[0], c->lerpOrigin[1], c->lerpOrigin[2]);
;75:						CG_Printf("^5frac: %0.4f, origin1: %0.2f %0.2f %0.2f, origin2: %0.2f %0.2f %0.2f\n",
ADDRGP4 $123
ARGP4
ADDRGP4 cg+109636
INDIRF4
ARGF4
ADDRLP4 140
INDIRF4
ARGF4
ADDRLP4 140+4
INDIRF4
ARGF4
ADDRLP4 140+8
INDIRF4
ARGF4
ADDRLP4 152
INDIRF4
ARGF4
ADDRLP4 152+4
INDIRF4
ARGF4
ADDRLP4 152+8
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 77
;76:							cg.frameInterpolation, origin1[0], origin1[1], origin1[2], origin2[0], origin2[1], origin2[2]);
;77:					}
ADDRGP4 $114
JUMPV
LABELV $113
line 78
;78:					else {
line 83
;79:						// we haven't got a next snapshot
;80:						// the client clock has either drifted ahead (seems to happen once per server frame
;81:						// when you play locally) or the client is using timenudge
;82:						// in any case, CG_CalcEntityLerpPositions extrapolated rather than interpolated
;83:						centity_t *c = &cg_entities[trace.entityNum];
ADDRLP4 136
CNSTI4 740
ADDRLP4 60+52
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 86
;84:						vec3_t origin1, origin2;
;85:
;86:						c->currentState.pos.trTime = TR_LINEAR_STOP;
ADDRLP4 136
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 3
ASGNI4
line 87
;87:						c->currentState.pos.trTime = cg.snap->serverTime;
ADDRLP4 136
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 88
;88:						c->currentState.pos.trDuration = 1000 / sv_fps.integer;
ADDRLP4 136
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 1000
ADDRGP4 sv_fps+12
INDIRI4
DIVI4
ASGNI4
line 90
;89:
;90:						BG_EvaluateTrajectory( &c->currentState.pos, cg.snap->serverTime, origin1 );
ADDRLP4 136
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
ADDRLP4 140
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 91
;91:						BG_EvaluateTrajectory( &c->currentState.pos, cg.snap->serverTime + 1000 / sv_fps.integer, origin2 );
ADDRLP4 136
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1000
ADDRGP4 sv_fps+12
INDIRI4
DIVI4
ADDI4
ARGI4
ADDRLP4 152
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 96
;92:
;93:						// print some debugging stuff exactly like what the server does
;94:
;95:						// it starts with "Ext:" to let you know the target was extrapolated
;96:						CG_Printf("^3Ext: time: %d, j: %d, k: %d, origin: %0.2f %0.2f %0.2f\n",
ADDRGP4 $135
ARGP4
ADDRGP4 cg+109656
INDIRI4
ARGI4
ADDRLP4 164
CNSTI4 8
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 164
INDIRI4
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 164
INDIRI4
ADDP4
INDIRI4
ARGI4
ADDRLP4 168
ADDRLP4 136
INDIRP4
ASGNP4
ADDRLP4 168
INDIRP4
CNSTI4 716
ADDP4
INDIRF4
ARGF4
ADDRLP4 168
INDIRP4
CNSTI4 720
ADDP4
INDIRF4
ARGF4
ADDRLP4 168
INDIRP4
CNSTI4 724
ADDP4
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 99
;97:								cg.oldTime, cg.snap->serverTime, cg.snap->serverTime,
;98:								c->lerpOrigin[0], c->lerpOrigin[1], c->lerpOrigin[2]);
;99:						CG_Printf("^5frac: %0.4f, origin1: %0.2f %0.2f %0.2f, origin2: %0.2f %0.2f %0.2f\n",
ADDRGP4 $123
ARGP4
ADDRGP4 cg+109636
INDIRF4
ARGF4
ADDRLP4 140
INDIRF4
ARGF4
ADDRLP4 140+4
INDIRF4
ARGF4
ADDRLP4 140+8
INDIRF4
ARGF4
ADDRLP4 152
INDIRF4
ARGF4
ADDRLP4 152+4
INDIRF4
ARGF4
ADDRLP4 152+8
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 101
;100:							cg.frameInterpolation, origin1[0], origin1[1], origin1[2], origin2[0], origin2[1], origin2[2]);
;101:					}
LABELV $114
line 102
;102:				}
LABELV $109
line 103
;103:			}
LABELV $106
line 106
;104:
;105:			// find the rail's end point
;106:			CG_Trace( &trace, muzzlePoint, vec3_origin, vec3_origin, endPoint, cg.predictedPlayerState.clientNum, CONTENTS_SOLID );
ADDRLP4 60
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 132
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRLP4 116
ARGP4
ADDRGP4 cg+109684+140
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 109
;107:
;108:			// do the magic-number adjustment
;109:			VectorMA( muzzlePoint, 4, right, muzzlePoint );
ADDRLP4 136
CNSTF4 1082130432
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 136
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 136
INDIRF4
ADDRLP4 28+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1082130432
ADDRLP4 28+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 110
;110:			VectorMA( muzzlePoint, -1, up, muzzlePoint );
ADDRLP4 140
CNSTF4 3212836864
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 140
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 140
INDIRF4
ADDRLP4 40+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 3212836864
ADDRLP4 40+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 113
;111:
;112:			// draw a rail trail
;113:			CG_RailTrail( &cgs.clientinfo[cent->currentState.number], muzzlePoint, trace.endpos );
CNSTI4 1740
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 60+12
ARGP4
ADDRGP4 CG_RailTrail
CALLV
pop
line 117
;114:			//Com_Printf( "Predicted rail trail\n" );
;115:
;116:			// explosion at end if not SURF_NOIMPACT
;117:			if ( !(trace.surfaceFlags & SURF_NOIMPACT) ) {
ADDRLP4 60+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $94
line 119
;118:				// predict an explosion
;119:				CG_MissileHitWall( cent, ent->weapon, cg.predictedPlayerState.clientNum, trace.endpos, trace.plane.normal, IMPACTSOUND_DEFAULT );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+109684+140
INDIRI4
ARGI4
ADDRLP4 60+12
ARGP4
ADDRLP4 60+24
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 120
;120:			}
line 121
;121:		}
line 122
;122:	}
ADDRGP4 $94
JUMPV
LABELV $93
line 124
;123:	// was it a shotgun attack?
;124:	else if ( ent->weapon == WP_SHOTGUN ) {
ADDRLP4 24
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 4
NEI4 $167
line 126
;125:		// do we have it on for the shotgun?
;126:		if ( cg_delag.integer & 1 || cg_delag.integer & 4 ) {
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 56
INDIRI4
NEI4 $173
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 56
INDIRI4
EQI4 $168
LABELV $173
line 132
;127:			int contents;
;128:			vec3_t endPoint, v;
;129:
;130:			// do everything like the server does
;131:
;132:			SnapVector( muzzlePoint );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 88
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 88
INDIRF4
ASGNF4
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 92
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 92
INDIRF4
ASGNF4
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRLP4 96
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 96
INDIRF4
ASGNF4
line 134
;133:
;134:			VectorScale( forward, 4096, endPoint );
ADDRLP4 88
CNSTF4 1166016512
ASGNF4
ADDRLP4 72
ADDRLP4 88
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRLP4 72+4
ADDRLP4 88
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 72+8
CNSTF4 1166016512
ADDRLP4 12+8
INDIRF4
MULF4
ASGNF4
line 135
;135:			SnapVector( endPoint );
ADDRLP4 72
INDIRF4
ARGF4
ADDRLP4 92
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 72
ADDRLP4 92
INDIRF4
ASGNF4
ADDRLP4 72+4
INDIRF4
ARGF4
ADDRLP4 96
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 72+4
ADDRLP4 96
INDIRF4
ASGNF4
ADDRLP4 72+8
INDIRF4
ARGF4
ADDRLP4 100
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 72+8
ADDRLP4 100
INDIRF4
ASGNF4
line 137
;136:
;137:			VectorSubtract( endPoint, muzzlePoint, v );
ADDRLP4 60
ADDRLP4 72
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 60+4
ADDRLP4 72+4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 60+8
ADDRLP4 72+8
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 138
;138:			VectorNormalize( v );
ADDRLP4 60
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 139
;139:			VectorScale( v, 32, v );
ADDRLP4 92
CNSTF4 1107296256
ASGNF4
ADDRLP4 60
ADDRLP4 92
INDIRF4
ADDRLP4 60
INDIRF4
MULF4
ASGNF4
ADDRLP4 60+4
ADDRLP4 92
INDIRF4
ADDRLP4 60+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 60+8
CNSTF4 1107296256
ADDRLP4 60+8
INDIRF4
MULF4
ASGNF4
line 140
;140:			VectorAdd( muzzlePoint, v, v );
ADDRLP4 60
ADDRLP4 0
INDIRF4
ADDRLP4 60
INDIRF4
ADDF4
ASGNF4
ADDRLP4 60+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 60+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 60+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 60+8
INDIRF4
ADDF4
ASGNF4
line 142
;141:
;142:			if ( cgs.glconfig.hardwareType != GLHW_RAGEPRO ) {
ADDRGP4 cgs+20100+11288
INDIRI4
CNSTI4 3
EQI4 $202
line 146
;143:				// ragepro can't alpha fade, so don't even bother with smoke
;144:				vec3_t			up;
;145:
;146:				contents = trap_CM_PointContents( muzzlePoint, 0 );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 108
ADDRGP4 trap_CM_PointContents
CALLI4
ASGNI4
ADDRLP4 84
ADDRLP4 108
INDIRI4
ASGNI4
line 147
;147:				if ( !( contents & CONTENTS_WATER ) ) {
ADDRLP4 84
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $206
line 148
;148:					VectorSet( up, 0, 0, 8 );
ADDRLP4 112
CNSTF4 0
ASGNF4
ADDRLP4 96
ADDRLP4 112
INDIRF4
ASGNF4
ADDRLP4 96+4
ADDRLP4 112
INDIRF4
ASGNF4
ADDRLP4 96+8
CNSTF4 1090519040
ASGNF4
line 149
;149:					CG_SmokePuff( v, up, 32, 1, 1, 1, 0.33f, 900, cg.time, 0, LEF_PUFF_DONT_SCALE, cgs.media.shotgunSmokePuffShader );
ADDRLP4 60
ARGP4
ADDRLP4 96
ARGP4
CNSTF4 1107296256
ARGF4
ADDRLP4 116
CNSTF4 1065353216
ASGNF4
ADDRLP4 116
INDIRF4
ARGF4
ADDRLP4 116
INDIRF4
ARGF4
ADDRLP4 116
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
line 150
;150:				}
LABELV $206
line 151
;151:			}
LABELV $202
line 154
;152:
;153:			// do the shotgun pellets
;154:			CG_ShotgunPattern( muzzlePoint, endPoint, cg.oldTime % 256, cg.predictedPlayerState.clientNum );
ADDRLP4 0
ARGP4
ADDRLP4 72
ARGP4
ADDRGP4 cg+109656
INDIRI4
CNSTI4 256
MODI4
ARGI4
ADDRGP4 cg+109684+140
INDIRI4
ARGI4
ADDRGP4 CG_ShotgunPattern
CALLV
pop
line 158
;155:			
;156:			
;157:			//Com_Printf( "Predicted shotgun pattern\n" );
;158:		}
line 159
;159:	}
ADDRGP4 $168
JUMPV
LABELV $167
line 161
;160:	// was it a machinegun attack?
;161:	else if ( ent->weapon == WP_MACHINEGUN ) {
ADDRLP4 24
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 2
NEI4 $216
line 163
;162:		// do we have it on for the machinegun?
;163:		if ( cg_delag.integer & 1 || cg_delag.integer & 2 ) {
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 56
INDIRI4
NEI4 $222
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 56
INDIRI4
EQI4 $218
LABELV $222
line 165
;164:			// the server will use this exact time (it'll be serverTime on that end)
;165:			int seed = cg.oldTime % 256;
ADDRLP4 60
ADDRGP4 cg+109656
INDIRI4
CNSTI4 256
MODI4
ASGNI4
line 169
;166:			float r, u;
;167:			trace_t tr;
;168:			qboolean flesh;
;169:			int fleshEntityNum = 0;
ADDRLP4 64
CNSTI4 0
ASGNI4
line 174
;170:			vec3_t endPoint;
;171:
;172:			// do everything exactly like the server does
;173:
;174:			r = Q_random(&seed) * M_PI * 2.0f;
ADDRLP4 60
ARGP4
ADDRLP4 148
ADDRGP4 Q_random
CALLF4
ASGNF4
ADDRLP4 80
CNSTF4 1073741824
CNSTF4 1078530011
ADDRLP4 148
INDIRF4
MULF4
MULF4
ASGNF4
line 175
;175:			u = sin(r) * Q_crandom(&seed) * MACHINEGUN_SPREAD * 16;
ADDRLP4 80
INDIRF4
ARGF4
ADDRLP4 152
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 60
ARGP4
ADDRLP4 156
ADDRGP4 Q_crandom
CALLF4
ASGNF4
ADDRLP4 140
CNSTF4 1098907648
CNSTF4 1120403456
ADDRLP4 152
INDIRF4
ADDRLP4 156
INDIRF4
MULF4
MULF4
MULF4
ASGNF4
line 176
;176:			r = cos(r) * Q_crandom(&seed) * MACHINEGUN_SPREAD * 16;
ADDRLP4 80
INDIRF4
ARGF4
ADDRLP4 160
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 60
ARGP4
ADDRLP4 164
ADDRGP4 Q_crandom
CALLF4
ASGNF4
ADDRLP4 80
CNSTF4 1098907648
CNSTF4 1120403456
ADDRLP4 160
INDIRF4
ADDRLP4 164
INDIRF4
MULF4
MULF4
MULF4
ASGNF4
line 178
;177:
;178:			VectorMA( muzzlePoint, 8192*16, forward, endPoint );
ADDRLP4 168
CNSTF4 1207959552
ASGNF4
ADDRLP4 68
ADDRLP4 0
INDIRF4
ADDRLP4 168
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 68+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 168
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 68+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1207959552
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 179
;179:			VectorMA( endPoint, r, right, endPoint );
ADDRLP4 172
ADDRLP4 80
INDIRF4
ASGNF4
ADDRLP4 68
ADDRLP4 68
INDIRF4
ADDRLP4 28
INDIRF4
ADDRLP4 172
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 68+4
ADDRLP4 68+4
INDIRF4
ADDRLP4 28+4
INDIRF4
ADDRLP4 172
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 68+8
ADDRLP4 68+8
INDIRF4
ADDRLP4 28+8
INDIRF4
ADDRLP4 80
INDIRF4
MULF4
ADDF4
ASGNF4
line 180
;180:			VectorMA( endPoint, u, up, endPoint );
ADDRLP4 176
ADDRLP4 140
INDIRF4
ASGNF4
ADDRLP4 68
ADDRLP4 68
INDIRF4
ADDRLP4 40
INDIRF4
ADDRLP4 176
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 68+4
ADDRLP4 68+4
INDIRF4
ADDRLP4 40+4
INDIRF4
ADDRLP4 176
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 68+8
ADDRLP4 68+8
INDIRF4
ADDRLP4 40+8
INDIRF4
ADDRLP4 140
INDIRF4
MULF4
ADDF4
ASGNF4
line 182
;181:
;182:			CG_Trace(&tr, muzzlePoint, NULL, NULL, endPoint, cg.predictedPlayerState.clientNum, MASK_SHOT );
ADDRLP4 84
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 180
CNSTP4 0
ASGNP4
ADDRLP4 180
INDIRP4
ARGP4
ADDRLP4 180
INDIRP4
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 cg+109684+140
INDIRI4
ARGI4
CNSTI4 100664321
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 184
;183:
;184:			if ( tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 84+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $244
line 185
;185:				return;
ADDRGP4 $72
JUMPV
LABELV $244
line 189
;186:			}
;187:
;188:			// snap the endpos to integers, but nudged towards the line
;189:			SnapVectorTowards( tr.endpos, muzzlePoint );
ADDRLP4 84+12
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 192
;190:
;191:			// do bullet impact
;192:			if ( tr.entityNum < MAX_CLIENTS ) {
ADDRLP4 84+52
INDIRI4
CNSTI4 64
GEI4 $248
line 193
;193:				flesh = qtrue;
ADDRLP4 144
CNSTI4 1
ASGNI4
line 194
;194:				fleshEntityNum = tr.entityNum;
ADDRLP4 64
ADDRLP4 84+52
INDIRI4
ASGNI4
line 195
;195:			} else {
ADDRGP4 $249
JUMPV
LABELV $248
line 196
;196:				flesh = qfalse;
ADDRLP4 144
CNSTI4 0
ASGNI4
line 197
;197:			}
LABELV $249
line 200
;198:
;199:			// do the bullet impact
;200:			CG_Bullet( tr.endpos, cg.predictedPlayerState.clientNum, tr.plane.normal, flesh, fleshEntityNum );
ADDRLP4 84+12
ARGP4
ADDRGP4 cg+109684+140
INDIRI4
ARGI4
ADDRLP4 84+24
ARGP4
ADDRLP4 144
INDIRI4
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 CG_Bullet
CALLV
pop
line 202
;201:			//Com_Printf( "Predicted bullet\n" );
;202:		}
LABELV $218
line 203
;203:	}
LABELV $216
LABELV $168
LABELV $94
line 204
;204:}
LABELV $72
endproc CG_PredictWeaponEffects 184 48
lit
align 4
LABELV $257
byte 4 3245342720
byte 4 3245342720
byte 4 3250585600
align 4
LABELV $258
byte 4 1097859072
byte 4 1097859072
byte 4 1107296256
export CG_AddBoundingBox
code
proc CG_AddBoundingBox 276 12
line 213
;205:
;206:/*
;207:=================
;208:CG_AddBoundingBox
;209:
;210:Draws a bounding box around a player.  Called from CG_Player.
;211:=================
;212:*/
;213:void CG_AddBoundingBox( centity_t *cent ) {
line 217
;214:	polyVert_t verts[4];
;215:	clientInfo_t *ci;
;216:	int i;
;217:	vec3_t mins = {-15, -15, -24};
ADDRLP4 216
ADDRGP4 $257
INDIRB
ASGNB 12
line 218
;218:	vec3_t maxs = {15, 15, 32};
ADDRLP4 200
ADDRGP4 $258
INDIRB
ASGNB 12
line 223
;219:	float extx, exty, extz;
;220:	vec3_t corners[8];
;221:	qhandle_t bboxShader, bboxShader_nocull;
;222:
;223:	if ( !cg_drawBBox.integer ) {
ADDRGP4 cg_drawBBox+12
INDIRI4
CNSTI4 0
NEI4 $259
line 224
;224:		return;
ADDRGP4 $256
JUMPV
LABELV $259
line 228
;225:	}
;226:
;227:	// don't draw it if it's us in first-person
;228:	if ( cent->currentState.number == cg.predictedPlayerState.clientNum &&
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $262
ADDRGP4 cg+109676
INDIRI4
CNSTI4 0
NEI4 $262
line 229
;229:			!cg.renderingThirdPerson ) {
line 230
;230:		return;
ADDRGP4 $256
JUMPV
LABELV $262
line 234
;231:	}
;232:
;233:	// don't draw it for dead players
;234:	if ( cent->currentState.eFlags & EF_DEAD ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $267
line 235
;235:		return;
ADDRGP4 $256
JUMPV
LABELV $267
line 239
;236:	}
;237:
;238:	// get the shader handles
;239:	bboxShader = trap_R_RegisterShader( "bbox" );
ADDRGP4 $269
ARGP4
ADDRLP4 244
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 228
ADDRLP4 244
INDIRI4
ASGNI4
line 240
;240:	bboxShader_nocull = trap_R_RegisterShader( "bbox_nocull" );
ADDRGP4 $270
ARGP4
ADDRLP4 248
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 212
ADDRLP4 248
INDIRI4
ASGNI4
line 243
;241:
;242:	// if they don't exist, forget it
;243:	if ( !bboxShader || !bboxShader_nocull ) {
ADDRLP4 252
CNSTI4 0
ASGNI4
ADDRLP4 228
INDIRI4
ADDRLP4 252
INDIRI4
EQI4 $273
ADDRLP4 212
INDIRI4
ADDRLP4 252
INDIRI4
NEI4 $271
LABELV $273
line 244
;244:		return;
ADDRGP4 $256
JUMPV
LABELV $271
line 248
;245:	}
;246:
;247:	// get the player's client info
;248:	ci = &cgs.clientinfo[cent->currentState.clientNum];
ADDRLP4 236
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
line 251
;249:
;250:	// if it's us
;251:	if ( cent->currentState.number == cg.predictedPlayerState.clientNum ) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $275
line 253
;252:		// use the view height
;253:		maxs[2] = cg.predictedPlayerState.viewheight + 6;
ADDRLP4 200+8
ADDRGP4 cg+109684+164
INDIRI4
CNSTI4 6
ADDI4
CVIF4 4
ASGNF4
line 254
;254:	}
ADDRGP4 $276
JUMPV
LABELV $275
line 255
;255:	else {
line 259
;256:		int x, zd, zu;
;257:
;258:		// otherwise grab the encoded bounding box
;259:		x = (cent->currentState.solid & 255);
ADDRLP4 256
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 260
;260:		zd = ((cent->currentState.solid>>8) & 255);
ADDRLP4 260
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
ASGNI4
line 261
;261:		zu = ((cent->currentState.solid>>16) & 255) - 32;
ADDRLP4 264
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16
RSHI4
CNSTI4 255
BANDI4
CNSTI4 32
SUBI4
ASGNI4
line 263
;262:
;263:		mins[0] = mins[1] = -x;
ADDRLP4 268
ADDRLP4 256
INDIRI4
NEGI4
CVIF4 4
ASGNF4
ADDRLP4 216+4
ADDRLP4 268
INDIRF4
ASGNF4
ADDRLP4 216
ADDRLP4 268
INDIRF4
ASGNF4
line 264
;264:		maxs[0] = maxs[1] = x;
ADDRLP4 272
ADDRLP4 256
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 200+4
ADDRLP4 272
INDIRF4
ASGNF4
ADDRLP4 200
ADDRLP4 272
INDIRF4
ASGNF4
line 265
;265:		mins[2] = -zd;
ADDRLP4 216+8
ADDRLP4 260
INDIRI4
NEGI4
CVIF4 4
ASGNF4
line 266
;266:		maxs[2] = zu;
ADDRLP4 200+8
ADDRLP4 264
INDIRI4
CVIF4 4
ASGNF4
line 267
;267:	}
LABELV $276
line 270
;268:
;269:	// get the extents (size)
;270:	extx = maxs[0] - mins[0];
ADDRLP4 232
ADDRLP4 200
INDIRF4
ADDRLP4 216
INDIRF4
SUBF4
ASGNF4
line 271
;271:	exty = maxs[1] - mins[1];
ADDRLP4 240
ADDRLP4 200+4
INDIRF4
ADDRLP4 216+4
INDIRF4
SUBF4
ASGNF4
line 272
;272:	extz = maxs[2] - mins[2];
ADDRLP4 196
ADDRLP4 200+8
INDIRF4
ADDRLP4 216+8
INDIRF4
SUBF4
ASGNF4
line 276
;273:
;274:	
;275:	// set the polygon's texture coordinates
;276:	verts[0].st[0] = 0;
ADDRLP4 4+12
CNSTF4 0
ASGNF4
line 277
;277:	verts[0].st[1] = 0;
ADDRLP4 4+12+4
CNSTF4 0
ASGNF4
line 278
;278:	verts[1].st[0] = 0;
ADDRLP4 4+24+12
CNSTF4 0
ASGNF4
line 279
;279:	verts[1].st[1] = 1;
ADDRLP4 4+24+12+4
CNSTF4 1065353216
ASGNF4
line 280
;280:	verts[2].st[0] = 1;
ADDRLP4 4+48+12
CNSTF4 1065353216
ASGNF4
line 281
;281:	verts[2].st[1] = 1;
ADDRLP4 4+48+12+4
CNSTF4 1065353216
ASGNF4
line 282
;282:	verts[3].st[0] = 1;
ADDRLP4 4+72+12
CNSTF4 1065353216
ASGNF4
line 283
;283:	verts[3].st[1] = 0;
ADDRLP4 4+72+12+4
CNSTF4 0
ASGNF4
line 286
;284:
;285:	// set the polygon's vertex colors
;286:	if ( ci->team == TEAM_RED ) {
ADDRLP4 236
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $308
line 287
;287:		for ( i = 0; i < 4; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $310
line 288
;288:			verts[i].modulate[0] = 160;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+20
ADDP4
CNSTU1 160
ASGNU1
line 289
;289:			verts[i].modulate[1] = 0;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+20+1
ADDP4
CNSTU1 0
ASGNU1
line 290
;290:			verts[i].modulate[2] = 0;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+20+2
ADDP4
CNSTU1 0
ASGNU1
line 291
;291:			verts[i].modulate[3] = 255;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+20+3
ADDP4
CNSTU1 255
ASGNU1
line 292
;292:		}
LABELV $311
line 287
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $310
line 293
;293:	}
ADDRGP4 $309
JUMPV
LABELV $308
line 294
;294:	else if ( ci->team == TEAM_BLUE ) {
ADDRLP4 236
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $321
line 295
;295:		for ( i = 0; i < 4; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $323
line 296
;296:			verts[i].modulate[0] = 0;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+20
ADDP4
CNSTU1 0
ASGNU1
line 297
;297:			verts[i].modulate[1] = 0;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+20+1
ADDP4
CNSTU1 0
ASGNU1
line 298
;298:			verts[i].modulate[2] = 192;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+20+2
ADDP4
CNSTU1 192
ASGNU1
line 299
;299:			verts[i].modulate[3] = 255;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+20+3
ADDP4
CNSTU1 255
ASGNU1
line 300
;300:		}
LABELV $324
line 295
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $323
line 301
;301:	}
ADDRGP4 $322
JUMPV
LABELV $321
line 302
;302:	else {
line 303
;303:		for ( i = 0; i < 4; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $334
line 304
;304:			verts[i].modulate[0] = 0;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+20
ADDP4
CNSTU1 0
ASGNU1
line 305
;305:			verts[i].modulate[1] = 128;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+20+1
ADDP4
CNSTU1 128
ASGNU1
line 306
;306:			verts[i].modulate[2] = 0;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+20+2
ADDP4
CNSTU1 0
ASGNU1
line 307
;307:			verts[i].modulate[3] = 255;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+20+3
ADDP4
CNSTU1 255
ASGNU1
line 308
;308:		}
LABELV $335
line 303
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $334
line 309
;309:	}
LABELV $322
LABELV $309
line 311
;310:
;311:	VectorAdd( cent->lerpOrigin, maxs, corners[3] );
ADDRLP4 100+36
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRF4
ADDRLP4 200
INDIRF4
ADDF4
ASGNF4
ADDRLP4 100+36+4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRF4
ADDRLP4 200+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 100+36+8
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRF4
ADDRLP4 200+8
INDIRF4
ADDF4
ASGNF4
line 313
;312:
;313:	VectorCopy( corners[3], corners[2] );
ADDRLP4 100+24
ADDRLP4 100+36
INDIRB
ASGNB 12
line 314
;314:	corners[2][0] -= extx;
ADDRLP4 100+24
ADDRLP4 100+24
INDIRF4
ADDRLP4 232
INDIRF4
SUBF4
ASGNF4
line 316
;315:
;316:	VectorCopy( corners[2], corners[1] );
ADDRLP4 100+12
ADDRLP4 100+24
INDIRB
ASGNB 12
line 317
;317:	corners[1][1] -= exty;
ADDRLP4 100+12+4
ADDRLP4 100+12+4
INDIRF4
ADDRLP4 240
INDIRF4
SUBF4
ASGNF4
line 319
;318:
;319:	VectorCopy( corners[1], corners[0] );
ADDRLP4 100
ADDRLP4 100+12
INDIRB
ASGNB 12
line 320
;320:	corners[0][0] += extx;
ADDRLP4 100
ADDRLP4 100
INDIRF4
ADDRLP4 232
INDIRF4
ADDF4
ASGNF4
line 322
;321:
;322:	for ( i = 0; i < 4; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $360
line 323
;323:		VectorCopy( corners[i], corners[i + 4] );
ADDRLP4 256
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 256
INDIRI4
ADDRLP4 100+48
ADDP4
ADDRLP4 256
INDIRI4
ADDRLP4 100
ADDP4
INDIRB
ASGNB 12
line 324
;324:		corners[i + 4][2] -= extz;
ADDRLP4 260
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 100+48+8
ADDP4
ASGNP4
ADDRLP4 260
INDIRP4
ADDRLP4 260
INDIRP4
INDIRF4
ADDRLP4 196
INDIRF4
SUBF4
ASGNF4
line 325
;325:	}
LABELV $361
line 322
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $360
line 328
;326:
;327:	// top
;328:	VectorCopy( corners[0], verts[0].xyz );
ADDRLP4 4
ADDRLP4 100
INDIRB
ASGNB 12
line 329
;329:	VectorCopy( corners[1], verts[1].xyz );
ADDRLP4 4+24
ADDRLP4 100+12
INDIRB
ASGNB 12
line 330
;330:	VectorCopy( corners[2], verts[2].xyz );
ADDRLP4 4+48
ADDRLP4 100+24
INDIRB
ASGNB 12
line 331
;331:	VectorCopy( corners[3], verts[3].xyz );
ADDRLP4 4+72
ADDRLP4 100+36
INDIRB
ASGNB 12
line 332
;332:	trap_R_AddPolyToScene( bboxShader, 4, verts );
ADDRLP4 228
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_AddPolyToScene
CALLV
pop
line 335
;333:
;334:	// bottom
;335:	VectorCopy( corners[7], verts[0].xyz );
ADDRLP4 4
ADDRLP4 100+84
INDIRB
ASGNB 12
line 336
;336:	VectorCopy( corners[6], verts[1].xyz );
ADDRLP4 4+24
ADDRLP4 100+72
INDIRB
ASGNB 12
line 337
;337:	VectorCopy( corners[5], verts[2].xyz );
ADDRLP4 4+48
ADDRLP4 100+60
INDIRB
ASGNB 12
line 338
;338:	VectorCopy( corners[4], verts[3].xyz );
ADDRLP4 4+72
ADDRLP4 100+48
INDIRB
ASGNB 12
line 339
;339:	trap_R_AddPolyToScene( bboxShader, 4, verts );
ADDRLP4 228
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_AddPolyToScene
CALLV
pop
line 342
;340:
;341:	// top side
;342:	VectorCopy( corners[3], verts[0].xyz );
ADDRLP4 4
ADDRLP4 100+36
INDIRB
ASGNB 12
line 343
;343:	VectorCopy( corners[2], verts[1].xyz );
ADDRLP4 4+24
ADDRLP4 100+24
INDIRB
ASGNB 12
line 344
;344:	VectorCopy( corners[6], verts[2].xyz );
ADDRLP4 4+48
ADDRLP4 100+72
INDIRB
ASGNB 12
line 345
;345:	VectorCopy( corners[7], verts[3].xyz );
ADDRLP4 4+72
ADDRLP4 100+84
INDIRB
ASGNB 12
line 346
;346:	trap_R_AddPolyToScene( bboxShader_nocull, 4, verts );
ADDRLP4 212
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_AddPolyToScene
CALLV
pop
line 349
;347:
;348:	// left side
;349:	VectorCopy( corners[2], verts[0].xyz );
ADDRLP4 4
ADDRLP4 100+24
INDIRB
ASGNB 12
line 350
;350:	VectorCopy( corners[1], verts[1].xyz );
ADDRLP4 4+24
ADDRLP4 100+12
INDIRB
ASGNB 12
line 351
;351:	VectorCopy( corners[5], verts[2].xyz );
ADDRLP4 4+48
ADDRLP4 100+60
INDIRB
ASGNB 12
line 352
;352:	VectorCopy( corners[6], verts[3].xyz );
ADDRLP4 4+72
ADDRLP4 100+72
INDIRB
ASGNB 12
line 353
;353:	trap_R_AddPolyToScene( bboxShader_nocull, 4, verts );
ADDRLP4 212
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_AddPolyToScene
CALLV
pop
line 356
;354:
;355:	// right side
;356:	VectorCopy( corners[0], verts[0].xyz );
ADDRLP4 4
ADDRLP4 100
INDIRB
ASGNB 12
line 357
;357:	VectorCopy( corners[3], verts[1].xyz );
ADDRLP4 4+24
ADDRLP4 100+36
INDIRB
ASGNB 12
line 358
;358:	VectorCopy( corners[7], verts[2].xyz );
ADDRLP4 4+48
ADDRLP4 100+84
INDIRB
ASGNB 12
line 359
;359:	VectorCopy( corners[4], verts[3].xyz );
ADDRLP4 4+72
ADDRLP4 100+48
INDIRB
ASGNB 12
line 360
;360:	trap_R_AddPolyToScene( bboxShader_nocull, 4, verts );
ADDRLP4 212
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_AddPolyToScene
CALLV
pop
line 363
;361:
;362:	// bottom side
;363:	VectorCopy( corners[1], verts[0].xyz );
ADDRLP4 4
ADDRLP4 100+12
INDIRB
ASGNB 12
line 364
;364:	VectorCopy( corners[0], verts[1].xyz );
ADDRLP4 4+24
ADDRLP4 100
INDIRB
ASGNB 12
line 365
;365:	VectorCopy( corners[4], verts[2].xyz );
ADDRLP4 4+48
ADDRLP4 100+48
INDIRB
ASGNB 12
line 366
;366:	VectorCopy( corners[5], verts[3].xyz );
ADDRLP4 4+72
ADDRLP4 100+60
INDIRB
ASGNB 12
line 367
;367:	trap_R_AddPolyToScene( bboxShader_nocull, 4, verts );
ADDRLP4 212
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_AddPolyToScene
CALLV
pop
line 368
;368:}
LABELV $256
endproc CG_AddBoundingBox 276 12
export CG_Cvar_ClampInt
proc CG_Cvar_ClampInt 0 16
line 377
;369:
;370:/*
;371:================
;372:CG_Cvar_ClampInt
;373:
;374:Clamps a cvar between two integer values, returns qtrue if it had to.
;375:================
;376:*/
;377:qboolean CG_Cvar_ClampInt( const char *name, vmCvar_t *vmCvar, int min, int max ) {
line 378
;378:	if ( vmCvar->integer > max ) {
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRFP4 12
INDIRI4
LEI4 $407
line 379
;379:		CG_Printf( "Allowed values are %d to %d.\n", min, max );
ADDRGP4 $409
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 381
;380:
;381:		Com_sprintf( vmCvar->string, MAX_CVAR_VALUE_STRING, "%d", max );
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $410
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 382
;382:		vmCvar->value = max;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 12
INDIRI4
CVIF4 4
ASGNF4
line 383
;383:		vmCvar->integer = max;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRFP4 12
INDIRI4
ASGNI4
line 385
;384:
;385:		trap_Cvar_Set( name, vmCvar->string );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 386
;386:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $406
JUMPV
LABELV $407
line 389
;387:	}
;388:
;389:	if ( vmCvar->integer < min ) {
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRFP4 8
INDIRI4
GEI4 $411
line 390
;390:		CG_Printf( "Allowed values are %d to %d.\n", min, max );
ADDRGP4 $409
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 392
;391:
;392:		Com_sprintf( vmCvar->string, MAX_CVAR_VALUE_STRING, "%d", min );
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $410
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 393
;393:		vmCvar->value = min;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 8
INDIRI4
CVIF4 4
ASGNF4
line 394
;394:		vmCvar->integer = min;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 396
;395:
;396:		trap_Cvar_Set( name, vmCvar->string );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 397
;397:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $406
JUMPV
LABELV $411
line 400
;398:	}
;399:
;400:	return qfalse;
CNSTI4 0
RETI4
LABELV $406
endproc CG_Cvar_ClampInt 0 16
import CG_ShotgunPattern
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
LABELV $410
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $409
byte 1 65
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $270
byte 1 98
byte 1 98
byte 1 111
byte 1 120
byte 1 95
byte 1 110
byte 1 111
byte 1 99
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $269
byte 1 98
byte 1 98
byte 1 111
byte 1 120
byte 1 0
align 1
LABELV $135
byte 1 94
byte 1 51
byte 1 69
byte 1 120
byte 1 116
byte 1 58
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 106
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 107
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 48
byte 1 46
byte 1 50
byte 1 102
byte 1 32
byte 1 37
byte 1 48
byte 1 46
byte 1 50
byte 1 102
byte 1 32
byte 1 37
byte 1 48
byte 1 46
byte 1 50
byte 1 102
byte 1 10
byte 1 0
align 1
LABELV $123
byte 1 94
byte 1 53
byte 1 102
byte 1 114
byte 1 97
byte 1 99
byte 1 58
byte 1 32
byte 1 37
byte 1 48
byte 1 46
byte 1 52
byte 1 102
byte 1 44
byte 1 32
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 49
byte 1 58
byte 1 32
byte 1 37
byte 1 48
byte 1 46
byte 1 50
byte 1 102
byte 1 32
byte 1 37
byte 1 48
byte 1 46
byte 1 50
byte 1 102
byte 1 32
byte 1 37
byte 1 48
byte 1 46
byte 1 50
byte 1 102
byte 1 44
byte 1 32
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 50
byte 1 58
byte 1 32
byte 1 37
byte 1 48
byte 1 46
byte 1 50
byte 1 102
byte 1 32
byte 1 37
byte 1 48
byte 1 46
byte 1 50
byte 1 102
byte 1 32
byte 1 37
byte 1 48
byte 1 46
byte 1 50
byte 1 102
byte 1 10
byte 1 0
align 1
LABELV $119
byte 1 94
byte 1 51
byte 1 73
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 106
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 107
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 48
byte 1 46
byte 1 50
byte 1 102
byte 1 32
byte 1 37
byte 1 48
byte 1 46
byte 1 50
byte 1 102
byte 1 32
byte 1 37
byte 1 48
byte 1 46
byte 1 50
byte 1 102
byte 1 10
byte 1 0
