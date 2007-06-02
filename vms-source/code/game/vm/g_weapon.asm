export G_BounceProjectile
code
proc G_BounceProjectile 64 4
file "../g_weapon.c"
line 19
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// g_weapon.c 
;4:// perform the server side effects of a weapon firing
;5:
;6:#include "g_local.h"
;7:
;8:static	float	s_quadFactor;
;9:static	vec3_t	forward, right, up;
;10:static	vec3_t	muzzle;
;11:
;12:#define NUM_NAILSHOTS 15
;13:
;14:/*
;15:================
;16:G_BounceProjectile
;17:================
;18:*/
;19:void G_BounceProjectile( vec3_t start, vec3_t impact, vec3_t dir, vec3_t endout ) {
line 23
;20:	vec3_t v, newv;
;21:	float dot;
;22:
;23:	VectorSubtract( impact, start, v );
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 32
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36
CNSTI4 4
ASGNI4
ADDRLP4 0+4
ADDRLP4 28
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 40
CNSTI4 8
ASGNI4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 24
;24:	dot = DotProduct( v, dir );
ADDRLP4 44
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 0
INDIRF4
ADDRLP4 44
INDIRP4
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 25
;25:	VectorMA( v, -2*dot, dir, newv );
ADDRLP4 48
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 52
CNSTF4 3221225472
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
ADDRLP4 12
ADDRLP4 0
INDIRF4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 52
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 52
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 0+8
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 3221225472
ADDRLP4 24
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 27
;26:
;27:	VectorNormalize(newv);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 28
;28:	VectorMA(impact, 8192, newv, endout);
ADDRFP4 12
INDIRP4
ADDRFP4 4
INDIRP4
INDIRF4
CNSTF4 1174405120
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 56
CNSTI4 4
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
CNSTF4 1174405120
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 60
CNSTI4 8
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRF4
CNSTF4 1174405120
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 29
;29:}
LABELV $55
endproc G_BounceProjectile 64 4
export Weapon_Gauntlet
proc Weapon_Gauntlet 0 0
line 40
;30:
;31:
;32:/*
;33:======================================================================
;34:
;35:GAUNTLET
;36:
;37:======================================================================
;38:*/
;39:
;40:void Weapon_Gauntlet( gentity_t *ent ) {
line 42
;41:
;42:}
LABELV $66
endproc Weapon_Gauntlet 0 0
export CheckGauntletAttack
proc CheckGauntletAttack 104 32
line 49
;43:
;44:/*
;45:===============
;46:CheckGauntletAttack
;47:===============
;48:*/
;49:qboolean CheckGauntletAttack( gentity_t *ent ) {
line 57
;50:	trace_t		tr;
;51:	vec3_t		end;
;52:	gentity_t	*tent;
;53:	gentity_t	*traceEnt;
;54:	int			damage;
;55:
;56:	// set aiming directions
;57:	AngleVectors (ent->client->ps.viewangles, forward, right, up);
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 59
;58:
;59:	CalcMuzzlePoint ( ent, forward, right, up, muzzle );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
line 61
;60:
;61:	VectorMA (muzzle, 32, forward, end);
ADDRLP4 80
CNSTF4 1107296256
ASGNF4
ADDRLP4 60
ADDRGP4 muzzle
INDIRF4
ADDRLP4 80
INDIRF4
ADDRGP4 forward
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 60+4
ADDRGP4 muzzle+4
INDIRF4
ADDRLP4 80
INDIRF4
ADDRGP4 forward+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 60+8
ADDRGP4 muzzle+8
INDIRF4
CNSTF4 1107296256
ADDRGP4 forward+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 63
;62:
;63:	trap_Trace (&tr, muzzle, NULL, NULL, end, ent->s.number, MASK_SHOT);
ADDRLP4 4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRLP4 84
CNSTP4 0
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 60
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 100664321
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 64
;64:	if ( tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 4+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $74
line 65
;65:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $67
JUMPV
LABELV $74
line 68
;66:	}
;67:
;68:	traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 0
CNSTI4 924
ADDRLP4 4+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 71
;69:
;70:	// send blood impact
;71:	if ( traceEnt->takedamage && traceEnt->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $78
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $78
line 72
;72:		tent = G_TempEntity( tr.endpos, EV_MISSILE_HIT );
ADDRLP4 4+12
ARGP4
CNSTI4 52
ARGI4
ADDRLP4 92
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 92
INDIRP4
ASGNP4
line 73
;73:		tent->s.otherEntityNum = traceEnt->s.number;
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 74
;74:		tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 96
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 96
INDIRI4
ASGNI4
line 75
;75:		tent->s.weapon = ent->s.weapon;
ADDRLP4 100
CNSTI4 192
ASGNI4
ADDRLP4 72
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 76
;76:	}
LABELV $78
line 78
;77:
;78:	if ( !traceEnt->takedamage) {
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
NEI4 $82
line 79
;79:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $67
JUMPV
LABELV $82
line 82
;80:	}
;81:
;82:	if (ent->client->ps.powerups[PW_QUAD] ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $84
line 83
;83:		G_AddEvent( ent, EV_POWERUP_QUAD, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 63
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 84
;84:		s_quadFactor = g_quadfactor.value;
ADDRGP4 s_quadFactor
ADDRGP4 g_quadfactor+8
INDIRF4
ASGNF4
line 85
;85:	} else {
ADDRGP4 $85
JUMPV
LABELV $84
line 86
;86:		s_quadFactor = 1;
ADDRGP4 s_quadFactor
CNSTF4 1065353216
ASGNF4
line 87
;87:	}
LABELV $85
line 94
;88:#ifdef MISSIONPACK
;89:	if( ent->client->persistantPowerup && ent->client->persistantPowerup->item && ent->client->persistantPowerup->item->giTag == PW_DOUBLER ) {
;90:		s_quadFactor *= 2;
;91:	}
;92:#endif
;93:
;94:	damage = 50 * s_quadFactor;
ADDRLP4 76
CNSTF4 1112014848
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 95
;95:	G_Damage( traceEnt, ent, ent, forward, tr.endpos,
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 76
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 98
;96:		damage, 0, MOD_GAUNTLET );
;97:
;98:	return qtrue;
CNSTI4 1
RETI4
LABELV $67
endproc CheckGauntletAttack 104 32
export Weapon_fire_flame
proc Weapon_fire_flame 16 16
line 108
;99:}
;100:
;101:
;102://
;103://=======================================================================
;104://FLAME_THROWER
;105://Shafe - Trep - Flame Thrower
;106://=======================================================================
;107://
;108:void Weapon_fire_flame (gentity_t *ent, qboolean alt ) {
line 111
;109:	gentity_t	*m;
;110:
;111:	m = fire_flame(ent, muzzle, forward, alt);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 fire_flame
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 112
;112:	m->damage *= s_quadFactor;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 113
;113:	m->splashDamage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 114
;114:}	
LABELV $88
endproc Weapon_fire_flame 16 16
export Weapon_fire_mg
proc Weapon_fire_mg 16 16
line 158
;115:
;116:
;117:/*
;118:======================================================================
;119:
;120:MACHINEGUN
;121:
;122:======================================================================
;123:*/
;124:
;125:/*
;126:======================
;127:SnapVectorTowards
;128:
;129:Round a vector to integers for more efficient network
;130:transmission, but make sure that it rounds towards a given point
;131:rather than blindly truncating.  This prevents it from truncating 
;132:into a wall.
;133:======================
;134:*/
;135://unlagged - attack prediction #3
;136:// moved to q_shared.c
;137:/*
;138:void SnapVectorTowards( vec3_t v, vec3_t to ) {
;139:	int		i;
;140:
;141:	for ( i = 0 ; i < 3 ; i++ ) {
;142:		if ( to[i] <= v[i] ) {
;143:			v[i] = (int)v[i];
;144:		} else {
;145:			v[i] = (int)v[i] + 1;
;146:		}
;147:	}
;148:}
;149:*/
;150://unlagged - attack prediction #3
;151:
;152:
;153:/*
;154:=======================================================================
;155:MACHINE GUN
;156:=======================================================================
;157:*/
;158:void Weapon_fire_mg (gentity_t *ent, qboolean alt ) {
line 161
;159:	gentity_t *m;
;160:
;161:	m = fire_mg(ent, muzzle, forward, alt);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 fire_mg
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 162
;162:	m->damage *= s_quadFactor;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 163
;163:	m->splashDamage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 164
;164:}
LABELV $89
endproc Weapon_fire_mg 16 16
export Bullet_Fire
proc Bullet_Fire 152 32
line 175
;165:
;166:
;167:
;168:#ifdef MISSIONPACK
;169:#define CHAINGUN_SPREAD		600
;170:#endif
;171:#define MACHINEGUN_SPREAD	64
;172:#define	MACHINEGUN_DAMAGE	7
;173:#define	MACHINEGUN_TEAM_DAMAGE	5		// wimpier MG in teamplay
;174:
;175:void Bullet_Fire (gentity_t *ent, float spread, int damage ) {
line 189
;176:	trace_t		tr;
;177:	vec3_t		end;
;178:#ifdef MISSIONPACK
;179:	vec3_t		impactpoint, bouncedir;
;180:#endif
;181:	float		r;
;182:	float		u;
;183:	gentity_t	*tent;
;184:	gentity_t	*traceEnt;
;185:	int			i, passent;
;186:
;187://unlagged - attack prediction #2
;188:	// we have to use something now that the client knows in advance
;189:	int			seed = ent->client->attackTime % 256;
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2728
ADDP4
INDIRI4
CNSTI4 256
MODI4
ASGNI4
line 192
;190://unlagged - attack prediction #2
;191:
;192:	damage *= s_quadFactor;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 201
;193:
;194://unlagged - attack prediction #2
;195:	// this has to match what's on the client
;196:/*
;197:	r = random() * M_PI * 2.0f;
;198:	u = sin(r) * crandom() * spread * 16;
;199:	r = cos(r) * crandom() * spread * 16;
;200:*/
;201:	r = Q_random(&seed) * M_PI * 2.0f;
ADDRLP4 92
ARGP4
ADDRLP4 96
ADDRGP4 Q_random
CALLF4
ASGNF4
ADDRLP4 84
CNSTF4 1073741824
CNSTF4 1078530011
ADDRLP4 96
INDIRF4
MULF4
MULF4
ASGNF4
line 202
;202:	u = sin(r) * Q_crandom(&seed) * spread * 16;
ADDRLP4 84
INDIRF4
ARGF4
ADDRLP4 100
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 92
ARGP4
ADDRLP4 104
ADDRGP4 Q_crandom
CALLF4
ASGNF4
ADDRLP4 88
CNSTF4 1098907648
ADDRLP4 100
INDIRF4
ADDRLP4 104
INDIRF4
MULF4
ADDRFP4 4
INDIRF4
MULF4
MULF4
ASGNF4
line 203
;203:	r = cos(r) * Q_crandom(&seed) * spread * 16;
ADDRLP4 84
INDIRF4
ARGF4
ADDRLP4 108
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 92
ARGP4
ADDRLP4 112
ADDRGP4 Q_crandom
CALLF4
ASGNF4
ADDRLP4 84
CNSTF4 1098907648
ADDRLP4 108
INDIRF4
ADDRLP4 112
INDIRF4
MULF4
ADDRFP4 4
INDIRF4
MULF4
MULF4
ASGNF4
line 205
;204://unlagged - attack prediction #2
;205:	VectorMA (muzzle, 8192*16, forward, end);
ADDRLP4 116
CNSTF4 1207959552
ASGNF4
ADDRLP4 64
ADDRGP4 muzzle
INDIRF4
ADDRLP4 116
INDIRF4
ADDRGP4 forward
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+4
ADDRGP4 muzzle+4
INDIRF4
ADDRLP4 116
INDIRF4
ADDRGP4 forward+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+8
ADDRGP4 muzzle+8
INDIRF4
CNSTF4 1207959552
ADDRGP4 forward+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 206
;206:	VectorMA (end, r, right, end);
ADDRLP4 64
ADDRLP4 64
INDIRF4
ADDRGP4 right
INDIRF4
ADDRLP4 84
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 64+4
INDIRF4
ADDRGP4 right+4
INDIRF4
ADDRLP4 84
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 64+8
INDIRF4
ADDRGP4 right+8
INDIRF4
ADDRLP4 84
INDIRF4
MULF4
ADDF4
ASGNF4
line 207
;207:	VectorMA (end, u, up, end);
ADDRLP4 64
ADDRLP4 64
INDIRF4
ADDRGP4 up
INDIRF4
ADDRLP4 88
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 64+4
INDIRF4
ADDRGP4 up+4
INDIRF4
ADDRLP4 88
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 64+8
INDIRF4
ADDRGP4 up+8
INDIRF4
ADDRLP4 88
INDIRF4
MULF4
ADDF4
ASGNF4
line 209
;208:
;209:	passent = ent->s.number;
ADDRLP4 80
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 210
;210:	for (i = 0; i < 10; i++) {
ADDRLP4 76
CNSTI4 0
ASGNI4
LABELV $109
line 214
;211:
;212://unlagged - backward reconciliation #2
;213:		// backward-reconcile the other clients
;214:		G_DoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 217
;215://unlagged - backward reconciliation #2
;216:
;217:		trap_Trace (&tr, muzzle, NULL, NULL, end, passent, MASK_SHOT);
ADDRLP4 0
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRLP4 128
CNSTP4 0
ASGNP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 80
INDIRI4
ARGI4
CNSTI4 100664321
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 221
;218:
;219://unlagged - backward reconciliation #2
;220:		// put them back
;221:		G_UndoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 224
;222://unlagged - backward reconciliation #2
;223:
;224:		if ( tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $113
line 225
;225:			return;
ADDRGP4 $90
JUMPV
LABELV $113
line 228
;226:		}
;227:
;228:		traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 56
CNSTI4 924
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 231
;229:
;230:		// snap the endpos to integers, but nudged towards the line
;231:		SnapVectorTowards( tr.endpos, muzzle );
ADDRLP4 0+12
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 234
;232:
;233:		// send bullet impact
;234:		if ( traceEnt->takedamage && traceEnt->client ) {
ADDRLP4 56
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $118
ADDRLP4 56
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $118
line 235
;235:			tent = G_TempEntity( tr.endpos, EV_BULLET_HIT_FLESH );
ADDRLP4 0+12
ARGP4
CNSTI4 50
ARGI4
ADDRLP4 136
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 136
INDIRP4
ASGNP4
line 236
;236:			tent->s.eventParm = traceEnt->s.number;
ADDRLP4 60
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 56
INDIRP4
INDIRI4
ASGNI4
line 240
;237://unlagged - attack prediction #2
;238:			// we need the client number to determine whether or not to
;239:			// suppress this event
;240:			tent->s.clientNum = ent->s.clientNum;
ADDRLP4 140
CNSTI4 168
ASGNI4
ADDRLP4 60
INDIRP4
ADDRLP4 140
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 140
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 242
;241://unlagged - attack prediction #2
;242:			if( LogAccuracyHit( traceEnt, ent ) ) {
ADDRLP4 56
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $119
line 243
;243:				ent->client->accuracy_hits++;
ADDRLP4 148
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2648
ADDP4
ASGNP4
ADDRLP4 148
INDIRP4
ADDRLP4 148
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 244
;244:			}
line 245
;245:		} else {
ADDRGP4 $119
JUMPV
LABELV $118
line 246
;246:			tent = G_TempEntity( tr.endpos, EV_BULLET_HIT_WALL );
ADDRLP4 0+12
ARGP4
CNSTI4 51
ARGI4
ADDRLP4 136
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 136
INDIRP4
ASGNP4
line 247
;247:			tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 0+24
ARGP4
ADDRLP4 140
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
line 251
;248://unlagged - attack prediction #2
;249:			// we need the client number to determine whether or not to
;250:			// suppress this event
;251:			tent->s.clientNum = ent->s.clientNum;
ADDRLP4 144
CNSTI4 168
ASGNI4
ADDRLP4 60
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 253
;252://unlagged - attack prediction #2
;253:		}
LABELV $119
line 254
;254:		tent->s.otherEntityNum = ent->s.number;
ADDRLP4 60
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 256
;255:
;256:		if ( traceEnt->takedamage) {
ADDRLP4 56
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $111
line 273
;257:#ifdef MISSIONPACK
;258:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
;259:				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
;260:					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
;261:					VectorCopy( impactpoint, muzzle );
;262:					// the player can hit him/herself with the bounced rail
;263:					passent = ENTITYNUM_NONE;
;264:				}
;265:				else {
;266:					VectorCopy( tr.endpos, muzzle );
;267:					passent = traceEnt->s.number;
;268:				}
;269:				continue;
;270:			}
;271:			else {
;272:#endif
;273:				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 136
INDIRP4
ARGP4
ADDRLP4 136
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 0+12
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 278
;274:					damage, 0, MOD_MACHINEGUN);
;275:#ifdef MISSIONPACK
;276:			}
;277:#endif
;278:		}
line 279
;279:		break;
ADDRGP4 $111
JUMPV
LABELV $110
line 210
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 10
LTI4 $109
LABELV $111
line 281
;280:	}
;281:}
LABELV $90
endproc Bullet_Fire 152 32
export BFG_Fire
proc BFG_Fire 20 16
line 292
;282:
;283:
;284:/*
;285:======================================================================
;286:
;287:BFG
;288:
;289:======================================================================
;290:*/
;291:
;292:void BFG_Fire ( gentity_t *ent, qboolean alt ) {
line 296
;293:	gentity_t	*m;
;294:
;295:	// Alt Fire Shoots Upward Just A Bit MOre
;296:	if (alt == qtrue)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $129
line 297
;297:	{
line 298
;298:		forward[2] += 0.2f;
ADDRLP4 4
ADDRGP4 forward+8
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
CNSTF4 1045220557
ADDF4
ASGNF4
line 299
;299:	}
LABELV $129
line 301
;300:	
;301:	forward[2] += 0.2f;
ADDRLP4 4
ADDRGP4 forward+8
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
CNSTF4 1045220557
ADDF4
ASGNF4
line 305
;302:
;303:
;304:	
;305:	VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 306
;306:	m = fire_bfg (ent, muzzle, forward, alt);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 fire_bfg
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 307
;307:	m->damage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 308
;308:	m->splashDamage *= s_quadFactor;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 311
;309:
;310://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;311:}
LABELV $128
endproc BFG_Fire 20 16
export ShotgunPellet
proc ShotgunPellet 108 32
line 326
;312:
;313:
;314:/*
;315:======================================================================
;316:
;317:SHOTGUN
;318:
;319:======================================================================
;320:*/
;321:
;322:// DEFAULT_SHOTGUN_SPREAD and DEFAULT_SHOTGUN_COUNT	are in bg_public.h, because
;323:// client predicts same spreads
;324:#define	DEFAULT_SHOTGUN_DAMAGE	10
;325:
;326:qboolean ShotgunPellet( vec3_t start, vec3_t end, gentity_t *ent ) {
line 335
;327:	trace_t		tr;
;328:	int			damage, i, passent;
;329:	gentity_t	*traceEnt;
;330:#ifdef MISSIONPACK
;331:	vec3_t		impactpoint, bouncedir;
;332:#endif
;333:	vec3_t		tr_start, tr_end;
;334:
;335:	passent = ent->s.number;
ADDRLP4 64
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 336
;336:	VectorCopy( start, tr_start );
ADDRLP4 68
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 337
;337:	VectorCopy( end, tr_end );
ADDRLP4 80
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 338
;338:	for (i = 0; i < 10; i++) {
ADDRLP4 60
CNSTI4 0
ASGNI4
LABELV $134
line 339
;339:		trap_Trace (&tr, tr_start, NULL, NULL, tr_end, passent, MASK_SHOT);
ADDRLP4 0
ARGP4
ADDRLP4 68
ARGP4
ADDRLP4 96
CNSTP4 0
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 64
INDIRI4
ARGI4
CNSTI4 100664321
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 340
;340:		traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 56
CNSTI4 924
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 343
;341:
;342:		// send bullet impact
;343:		if (  tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $139
line 344
;344:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $133
JUMPV
LABELV $139
line 347
;345:		}
;346:
;347:		if ( traceEnt->takedamage) {
ADDRLP4 56
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $142
line 348
;348:			damage = DEFAULT_SHOTGUN_DAMAGE * s_quadFactor;
ADDRLP4 92
CNSTF4 1092616192
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 371
;349:#ifdef MISSIONPACK
;350:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
;351:				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
;352:					G_BounceProjectile( tr_start, impactpoint, bouncedir, tr_end );
;353:					VectorCopy( impactpoint, tr_start );
;354:					// the player can hit him/herself with the bounced rail
;355:					passent = ENTITYNUM_NONE;
;356:				}
;357:				else {
;358:					VectorCopy( tr.endpos, tr_start );
;359:					passent = traceEnt->s.number;
;360:				}
;361:				continue;
;362:			}
;363:			else {
;364:				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
;365:					damage, 0, MOD_SHOTGUN);
;366:				if( LogAccuracyHit( traceEnt, ent ) ) {
;367:					return qtrue;
;368:				}
;369:			}
;370:#else
;371:			G_Damage( traceEnt, ent, ent, forward, tr.endpos,	damage, 0, MOD_SHOTGUN);
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 100
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 92
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 372
;372:				if( LogAccuracyHit( traceEnt, ent ) ) {
ADDRLP4 56
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $145
line 373
;373:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $133
JUMPV
LABELV $145
line 376
;374:				}
;375:#endif
;376:		}
LABELV $142
line 377
;377:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $133
JUMPV
LABELV $135
line 338
ADDRLP4 60
ADDRLP4 60
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 10
LTI4 $134
line 379
;378:	}
;379:	return qfalse;
CNSTI4 0
RETI4
LABELV $133
endproc ShotgunPellet 108 32
export ShotgunPattern
proc ShotgunPattern 104 12
line 383
;380:}
;381:
;382:// this should match CG_ShotgunPattern
;383:void ShotgunPattern( vec3_t origin, vec3_t origin2, int seed, gentity_t *ent ) {
line 389
;384:	int			i;
;385:	float		r, u;
;386:	vec3_t		end;
;387:	vec3_t		forward, right, up;
;388:	int			oldScore;
;389:	qboolean	hitClient = qfalse;
ADDRLP4 60
CNSTI4 0
ASGNI4
line 398
;390:
;391://unlagged - attack prediction #2
;392:	// use this for testing
;393:	//Com_Printf( "Server seed: %d\n", seed );
;394://unlagged - attack prediction #2
;395:
;396:	// derive the right and up vectors from the forward vector, because
;397:	// the client won't have any other information
;398:	VectorNormalize2( origin2, forward );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 VectorNormalize2
CALLF4
pop
line 399
;399:	PerpendicularVector( right, forward );
ADDRLP4 32
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 400
;400:	CrossProduct( forward, right, up );
ADDRLP4 20
ARGP4
ADDRLP4 32
ARGP4
ADDRLP4 44
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 402
;401:
;402:	oldScore = ent->client->ps.persistant[PERS_SCORE];
ADDRLP4 64
ADDRFP4 12
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 406
;403:
;404://unlagged - backward reconciliation #2
;405:	// backward-reconcile the other clients
;406:	G_DoTimeShiftFor( ent );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 410
;407://unlagged - backward reconciliation #2
;408:
;409:	// generate the "random" spread pattern
;410:	for ( i = 0 ; i < DEFAULT_SHOTGUN_COUNT ; i++ ) {
ADDRLP4 56
CNSTI4 0
ASGNI4
LABELV $148
line 411
;411:		r = Q_crandom( &seed ) * DEFAULT_SHOTGUN_SPREAD * 16;
ADDRFP4 8
ARGP4
ADDRLP4 68
ADDRGP4 Q_crandom
CALLF4
ASGNF4
ADDRLP4 12
CNSTF4 1098907648
CNSTF4 1143930880
ADDRLP4 68
INDIRF4
MULF4
MULF4
ASGNF4
line 412
;412:		u = Q_crandom( &seed ) * DEFAULT_SHOTGUN_SPREAD * 16;
ADDRFP4 8
ARGP4
ADDRLP4 72
ADDRGP4 Q_crandom
CALLF4
ASGNF4
ADDRLP4 16
CNSTF4 1098907648
CNSTF4 1143930880
ADDRLP4 72
INDIRF4
MULF4
MULF4
ASGNF4
line 413
;413:		VectorMA( origin, 8192 * 16, forward, end);
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
CNSTF4 1207959552
ASGNF4
ADDRLP4 0
ADDRLP4 76
INDIRP4
INDIRF4
ADDRLP4 80
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 80
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
line 414
;414:		VectorMA (end, r, right, end);
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
line 415
;415:		VectorMA (end, u, up, end);
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
line 416
;416:		if( ShotgunPellet( origin, end, ent ) && !hitClient ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 ShotgunPellet
CALLI4
ASGNI4
ADDRLP4 96
CNSTI4 0
ASGNI4
ADDRLP4 92
INDIRI4
ADDRLP4 96
INDIRI4
EQI4 $168
ADDRLP4 60
INDIRI4
ADDRLP4 96
INDIRI4
NEI4 $168
line 417
;417:			hitClient = qtrue;
ADDRLP4 60
CNSTI4 1
ASGNI4
line 418
;418:			ent->client->accuracy_hits++;
ADDRLP4 100
ADDRFP4 12
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2648
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 419
;419:		}
LABELV $168
line 420
;420:	}
LABELV $149
line 410
ADDRLP4 56
ADDRLP4 56
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 11
LTI4 $148
line 424
;421:
;422://unlagged - backward reconciliation #2
;423:	// put them back
;424:	G_UndoTimeShiftFor( ent );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 426
;425://unlagged - backward reconciliation #2
;426:}
LABELV $147
endproc ShotgunPattern 104 12
export weapon_supershotgun_fire
proc weapon_supershotgun_fire 32 16
line 429
;427:
;428:
;429:void weapon_supershotgun_fire (gentity_t *ent) {
line 433
;430:	gentity_t		*tent;
;431:
;432:	// send shotgun blast
;433:	tent = G_TempEntity( muzzle, EV_SHOTGUN );
ADDRGP4 muzzle
ARGP4
CNSTI4 56
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 434
;434:	VectorScale( forward, 4096, tent->s.origin2 );
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
CNSTF4 1166016512
ADDRGP4 forward
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
CNSTF4 1166016512
ADDRGP4 forward+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
CNSTF4 1166016512
ADDRGP4 forward+8
INDIRF4
MULF4
ASGNF4
line 435
;435:	SnapVector( tent->s.origin2 );
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 24
INDIRP4
ADDRLP4 28
INDIRF4
ASGNF4
line 439
;436://unlagged - attack prediction #2
;437:	// this has to be something the client can predict now
;438:	//tent->s.eventParm = rand() & 255;		// seed for spread pattern
;439:	tent->s.eventParm = ent->client->attackTime % 256; // seed for spread pattern
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2728
ADDP4
INDIRI4
CNSTI4 256
MODI4
ASGNI4
line 441
;440://unlagged - attack prediction #2
;441:	tent->s.otherEntityNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 443
;442:
;443:	ShotgunPattern( tent->s.pos.trBase, tent->s.origin2, tent->s.eventParm, ent );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ShotgunPattern
CALLV
pop
line 444
;444:}
LABELV $170
endproc weapon_supershotgun_fire 32 16
export weapon_pdlauncher_fire
proc weapon_pdlauncher_fire 28 12
line 456
;445:
;446:
;447:/*
;448:======================================================================
;449:
;450:GRENADE LAUNCHER
;451:
;452:======================================================================
;453:*/
;454:
;455:// Shafe - PDG
;456:void weapon_pdlauncher_fire (gentity_t	*ent) {
line 458
;457:	gentity_t	*m;
;458:	gentity_t	*grenades = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $175
JUMPV
LABELV $174
line 461
;459:	 
;460: while ((grenades = G_Find (grenades, FOFS(classname), "pdgrenade")) != NULL)
;461: {
line 462
;462:	if(grenades->r.ownerNum == ent->s.clientNum)  //make sure its ours
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
NEI4 $178
line 463
;463:	{
line 464
;464:		ent->istelepoint = 0; // client cannot teleport
ADDRFP4 0
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 0
ASGNI4
line 465
;465:		VectorClear( ent->teleloc ); // clear the teleport location
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 836
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 832
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 828
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 466
;466:		grenades->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 467
;467:		grenades->nextthink = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 468
;468:	}
LABELV $178
line 469
;469: }
LABELV $175
line 460
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 532
ARGI4
ADDRGP4 $177
ARGP4
ADDRLP4 8
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $174
line 471
;470: // extra vertical velocity
;471: forward[2] += 0.2f;
ADDRLP4 12
ADDRGP4 forward+8
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CNSTF4 1045220557
ADDF4
ASGNF4
line 472
;472: VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 474
;473: 
;474: m = fire_pdgrenade (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 16
ADDRGP4 fire_pdgrenade
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ASGNP4
line 475
;475: m->damage *= s_quadFactor;
ADDRLP4 20
ADDRLP4 4
INDIRP4
CNSTI4 764
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 476
;476: m->splashDamage *= s_quadFactor;
ADDRLP4 24
ADDRLP4 4
INDIRP4
CNSTI4 768
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 477
;477: ent->client->pdgfired = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2700
ADDP4
CNSTI4 1
ASGNI4
line 478
;478:} 
LABELV $173
endproc weapon_pdlauncher_fire 28 12
export weapon_grenadelauncher_fire
proc weapon_grenadelauncher_fire 20 12
line 480
;479:
;480:void weapon_grenadelauncher_fire (gentity_t *ent) {
line 484
;481:	gentity_t	*m;
;482:
;483:	// extra vertical velocity
;484:	forward[2] += 0.2f;
ADDRLP4 4
ADDRGP4 forward+8
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
CNSTF4 1045220557
ADDF4
ASGNF4
line 485
;485:	VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 487
;486:
;487:	m = fire_grenade (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 8
ADDRGP4 fire_grenade
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 488
;488:	m->damage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 489
;489:	m->splashDamage *= s_quadFactor;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 492
;490:
;491://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;492:}
LABELV $182
endproc weapon_grenadelauncher_fire 20 12
export weapon_altgrenadelauncher_fire
proc weapon_altgrenadelauncher_fire 20 12
line 503
;493:
;494:/*
;495:======================================================================
;496:
;497:ALT GRENADE LAUNCHER 
;498:Shafe - Trep - Alternate Fire Grenade
;499:
;500:======================================================================
;501:*/
;502:
;503:void weapon_altgrenadelauncher_fire (gentity_t *ent) {
line 507
;504:	gentity_t	*m;
;505:
;506:	// extra vertical velocity
;507:	forward[2] += 0.2f;
ADDRLP4 4
ADDRGP4 forward+8
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
CNSTF4 1045220557
ADDF4
ASGNF4
line 508
;508:	VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 510
;509:
;510:	m = fire_altgrenade (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 8
ADDRGP4 fire_altgrenade
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 511
;511:	m->damage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 512
;512:	m->splashDamage *= s_quadFactor;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 515
;513:
;514://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;515:}
LABELV $184
endproc weapon_altgrenadelauncher_fire 20 12
export Weapon_RocketLauncher_Fire
proc Weapon_RocketLauncher_Fire 16 12
line 525
;516:
;517:/*
;518:======================================================================
;519:
;520:ROCKET
;521:
;522:======================================================================
;523:*/
;524:
;525:void Weapon_RocketLauncher_Fire (gentity_t *ent) {
line 528
;526:	gentity_t	*m;
;527:
;528:	m = fire_rocket (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4
ADDRGP4 fire_rocket
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 529
;529:	m->damage *= s_quadFactor;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 530
;530:	m->splashDamage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 533
;531:
;532://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;533:}
LABELV $186
endproc Weapon_RocketLauncher_Fire 16 12
export Weapon_RocketLauncher_AltFire
proc Weapon_RocketLauncher_AltFire 16 12
line 536
;534:
;535:// Shafe - Trep Alt Rocket Launcher
;536:void Weapon_RocketLauncher_AltFire (gentity_t *ent) {
line 539
;537:	gentity_t	*m;
;538:
;539:	m = fire_alt_rocket (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4
ADDRGP4 fire_alt_rocket
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 540
;540:	m->damage *= s_quadFactor;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 541
;541:	m->splashDamage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 544
;542:
;543://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;544:}
LABELV $187
endproc Weapon_RocketLauncher_AltFire 16 12
export Weapon_Plasmagun_Fire
proc Weapon_Plasmagun_Fire 24 12
line 555
;545:
;546:
;547:/*
;548:======================================================================
;549:
;550:PLASMA GUN
;551:
;552:======================================================================
;553:*/
;554:
;555:void Weapon_Plasmagun_Fire (gentity_t *ent) {
line 561
;556:	gentity_t	*m;
;557:	int		i;
;558:	
;559:	// Shafe - Add Some Randomness so that 
;560:	// it doesnt fire straight every time
;561:	i = irandom(0,10);
CNSTI4 0
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 8
ADDRGP4 irandom
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 562
;562:	if (i > 5)
ADDRLP4 4
INDIRI4
CNSTI4 5
LEI4 $189
line 563
;563:	{
line 564
;564:		forward[2] += 0.2f;
ADDRLP4 12
ADDRGP4 forward+8
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CNSTF4 1045220557
ADDF4
ASGNF4
line 565
;565:		VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 566
;566:	}
LABELV $189
line 568
;567:
;568:	m = fire_plasma (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 12
ADDRGP4 fire_plasma
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 569
;569:	m->damage *= s_quadFactor;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 570
;570:	m->splashDamage *= s_quadFactor;
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 573
;571:
;572://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;573:}
LABELV $188
endproc Weapon_Plasmagun_Fire 24 12
export weapon_railgun_fire
proc weapon_railgun_fire 172 32
line 590
;574:
;575:/*
;576:======================================================================
;577:
;578:RAILGUN
;579:
;580:======================================================================
;581:*/
;582:
;583:
;584:/*
;585:=================
;586:weapon_railgun_fire
;587:=================
;588:*/
;589:#define	MAX_RAIL_HITS	4
;590:void weapon_railgun_fire (gentity_t *ent) {
line 606
;591:	vec3_t		end;
;592:#ifdef MISSIONPACK
;593:	vec3_t impactpoint, bouncedir;
;594:#endif
;595:	trace_t		trace;
;596:	gentity_t	*tent;
;597:	gentity_t	*traceEnt;
;598:	int			damage;
;599:	int			i;
;600:	int			hits;
;601:	int			unlinked;
;602:	int			passent;
;603:	gentity_t	*unlinkedEntities[MAX_RAIL_HITS];
;604:
;605:	// Shafe - Trep - Instagib
;606:	if (g_instagib.integer == 0)
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 0
NEI4 $193
line 607
;607:	{
line 608
;608:		damage = 100 * s_quadFactor;
ADDRLP4 104
CNSTF4 1120403456
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 609
;609:	} else {
ADDRGP4 $194
JUMPV
LABELV $193
line 610
;610:		damage = 1000 * s_quadFactor;
ADDRLP4 104
CNSTF4 1148846080
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 611
;611:	}
LABELV $194
line 614
;612:	/////////////////////////////////////
;613:
;614:	VectorMA (muzzle, 8192, forward, end);
ADDRLP4 112
CNSTF4 1174405120
ASGNF4
ADDRLP4 88
ADDRGP4 muzzle
INDIRF4
ADDRLP4 112
INDIRF4
ADDRGP4 forward
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88+4
ADDRGP4 muzzle+4
INDIRF4
ADDRLP4 112
INDIRF4
ADDRGP4 forward+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88+8
ADDRGP4 muzzle+8
INDIRF4
CNSTF4 1174405120
ADDRGP4 forward+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 618
;615:
;616://unlagged - backward reconciliation #2
;617:	// backward-reconcile the other clients
;618:	G_DoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 622
;619://unlagged - backward reconciliation #2
;620:
;621:	// trace only against the solids, so the railgun will go through people
;622:	unlinked = 0;
ADDRLP4 60
CNSTI4 0
ASGNI4
line 623
;623:	hits = 0;
ADDRLP4 108
CNSTI4 0
ASGNI4
line 624
;624:	passent = ent->s.number;
ADDRLP4 100
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
LABELV $202
line 625
;625:	do {
line 626
;626:		trap_Trace (&trace, muzzle, NULL, NULL, end, passent, MASK_SHOT );
ADDRLP4 4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRLP4 116
CNSTP4 0
ASGNP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 100
INDIRI4
ARGI4
CNSTI4 100664321
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 627
;627:		if ( trace.entityNum >= ENTITYNUM_MAX_NORMAL ) {
ADDRLP4 4+52
INDIRI4
CNSTI4 1022
LTI4 $205
line 628
;628:			break;
ADDRGP4 $204
JUMPV
LABELV $205
line 630
;629:		}
;630:		traceEnt = &g_entities[ trace.entityNum ];
ADDRLP4 0
CNSTI4 924
ADDRLP4 4+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 631
;631:		if ( traceEnt->takedamage ) {
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $209
line 660
;632:#ifdef MISSIONPACK
;633:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
;634:				if ( G_InvulnerabilityEffect( traceEnt, forward, trace.endpos, impactpoint, bouncedir ) ) {
;635:					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
;636:					// snap the endpos to integers to save net bandwidth, but nudged towards the line
;637:					SnapVectorTowards( trace.endpos, muzzle );
;638:					// send railgun beam effect
;639:					tent = G_TempEntity( trace.endpos, EV_RAILTRAIL );
;640:					// set player number for custom colors on the railtrail
;641:					tent->s.clientNum = ent->s.clientNum;
;642:					VectorCopy( muzzle, tent->s.origin2 );
;643:					// move origin a bit to come closer to the drawn gun muzzle
;644:					VectorMA( tent->s.origin2, 4, right, tent->s.origin2 );
;645:					VectorMA( tent->s.origin2, -1, up, tent->s.origin2 );
;646:					tent->s.eventParm = 255;	// don't make the explosion at the end
;647:					//
;648:					VectorCopy( impactpoint, muzzle );
;649:					// the player can hit him/herself with the bounced rail
;650:					passent = ENTITYNUM_NONE;
;651:				}
;652:			}
;653:			else {
;654:				if( LogAccuracyHit( traceEnt, ent ) ) {
;655:					hits++;
;656:				}
;657:				G_Damage (traceEnt, ent, ent, forward, trace.endpos, damage, 0, MOD_RAILGUN);
;658:			}
;659:#else
;660:				if( LogAccuracyHit( traceEnt, ent ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
EQI4 $211
line 661
;661:					hits++;
ADDRLP4 108
ADDRLP4 108
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 662
;662:				}
LABELV $211
line 663
;663:				G_Damage (traceEnt, ent, ent, forward, trace.endpos, damage, 0, MOD_RAILGUN);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 104
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 10
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 665
;664:#endif
;665:		}
LABELV $209
line 666
;666:		if ( trace.contents & CONTENTS_SOLID ) {
ADDRLP4 4+48
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $214
line 667
;667:			break;		// we hit something solid enough to stop the beam
ADDRGP4 $204
JUMPV
LABELV $214
line 670
;668:		}
;669:		// unlink this entity, so the next trace will go past it
;670:		trap_UnlinkEntity( traceEnt );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 671
;671:		unlinkedEntities[unlinked] = traceEnt;
ADDRLP4 60
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 672
;672:		unlinked++;
ADDRLP4 60
ADDRLP4 60
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 673
;673:	} while ( unlinked < MAX_RAIL_HITS );
LABELV $203
ADDRLP4 60
INDIRI4
CNSTI4 4
LTI4 $202
LABELV $204
line 677
;674:
;675://unlagged - backward reconciliation #2
;676:	// put them back
;677:	G_UndoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 681
;678://unlagged - backward reconciliation #2
;679:
;680:	// link back in any entities we unlinked
;681:	for ( i = 0 ; i < unlinked ; i++ ) {
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 $220
JUMPV
LABELV $217
line 682
;682:		trap_LinkEntity( unlinkedEntities[i] );
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 683
;683:	}
LABELV $218
line 681
ADDRLP4 64
ADDRLP4 64
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $220
ADDRLP4 64
INDIRI4
ADDRLP4 60
INDIRI4
LTI4 $217
line 688
;684:
;685:	// the final trace endpos will be the terminal point of the rail trail
;686:
;687:	// snap the endpos to integers to save net bandwidth, but nudged towards the line
;688:	SnapVectorTowards( trace.endpos, muzzle );
ADDRLP4 4+12
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 691
;689:
;690:	// send railgun beam effect
;691:	tent = G_TempEntity( trace.endpos, EV_RAILTRAIL );
ADDRLP4 4+12
ARGP4
CNSTI4 55
ARGI4
ADDRLP4 116
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 84
ADDRLP4 116
INDIRP4
ASGNP4
line 694
;692:
;693:	// set player number for custom colors on the railtrail
;694:	tent->s.clientNum = ent->s.clientNum;
ADDRLP4 120
CNSTI4 168
ASGNI4
ADDRLP4 84
INDIRP4
ADDRLP4 120
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 120
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 696
;695:
;696:	VectorCopy( muzzle, tent->s.origin2 );
ADDRLP4 84
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 698
;697:	// move origin a bit to come closer to the drawn gun muzzle
;698:	VectorMA( tent->s.origin2, 4, right, tent->s.origin2 );
ADDRLP4 124
ADDRLP4 84
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 124
INDIRP4
ADDRLP4 124
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRGP4 right
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 128
ADDRLP4 84
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 128
INDIRP4
ADDRLP4 128
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRGP4 right+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 132
ADDRLP4 84
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRGP4 right+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 699
;699:	VectorMA( tent->s.origin2, -1, up, tent->s.origin2 );
ADDRLP4 136
ADDRLP4 84
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRF4
CNSTF4 3212836864
ADDRGP4 up
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 140
ADDRLP4 84
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRF4
CNSTF4 3212836864
ADDRGP4 up+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 144
ADDRLP4 84
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRF4
CNSTF4 3212836864
ADDRGP4 up+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 702
;700:
;701:	// no explosion at end if SURF_NOIMPACT, but still make the trail
;702:	if ( trace.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 4+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $227
line 703
;703:		tent->s.eventParm = 255;	// don't make the explosion at the end
ADDRLP4 84
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 255
ASGNI4
line 704
;704:	} else {
ADDRGP4 $228
JUMPV
LABELV $227
line 705
;705:		tent->s.eventParm = DirToByte( trace.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 148
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 84
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 148
INDIRI4
ASGNI4
line 706
;706:	}
LABELV $228
line 707
;707:	tent->s.clientNum = ent->s.clientNum;
ADDRLP4 148
CNSTI4 168
ASGNI4
ADDRLP4 84
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 710
;708:
;709:	// give the shooter a reward sound if they have made two railgun hits in a row
;710:	if ( hits == 0 ) {
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $231
line 712
;711:		// complete miss
;712:		ent->client->accurateCount = 0;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2640
ADDP4
CNSTI4 0
ASGNI4
line 713
;713:	} else {
ADDRGP4 $232
JUMPV
LABELV $231
line 715
;714:		// check for "impressive" reward sound
;715:		ent->client->accurateCount += hits;
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2640
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRI4
ADDRLP4 108
INDIRI4
ADDI4
ASGNI4
line 716
;716:		if ( ent->client->accurateCount >= 2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2640
ADDP4
INDIRI4
CNSTI4 2
LTI4 $233
line 717
;717:			ent->client->accurateCount -= 2;
ADDRLP4 156
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2640
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 718
;718:			ent->client->ps.persistant[PERS_IMPRESSIVE_COUNT]++;
ADDRLP4 160
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 284
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 720
;719:			// add the sprite over the player's head
;720:			ent->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 164
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 164
INDIRP4
ADDRLP4 164
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 721
;721:			ent->client->ps.eFlags |= EF_AWARD_IMPRESSIVE;
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRI4
CNSTI4 32768
BORI4
ASGNI4
line 722
;722:			ent->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2676
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 723
;723:		}
LABELV $233
line 724
;724:		ent->client->accuracy_hits++;
ADDRLP4 156
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2648
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 725
;725:	}
LABELV $232
line 727
;726:
;727:}
LABELV $192
endproc weapon_railgun_fire 172 32
export Weapon_GrapplingHook_Fire
proc Weapon_GrapplingHook_Fire 4 20
line 739
;728:
;729:
;730:/*
;731:======================================================================
;732:
;733:GRAPPLING HOOK
;734:
;735:======================================================================
;736:*/
;737:
;738:void Weapon_GrapplingHook_Fire (gentity_t *ent)
;739:{
line 741
;740:	// Shafe - Trep  - Offhand Grappling Hook
;741:	AngleVectors (ent->client->ps.viewangles, forward, right, up);
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 742
;742:	CalcMuzzlePoint ( ent, forward, right, up, muzzle );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
line 745
;743:	// End Shafe
;744:	
;745:	if (!ent->client->fireHeld && !ent->client->hook)
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 0
NEI4 $237
ADDRLP4 0
INDIRP4
CNSTI4 2692
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $237
line 746
;746:		fire_grapple (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 fire_grapple
CALLP4
pop
LABELV $237
line 748
;747:
;748:	ent->client->fireHeld = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 1
ASGNI4
line 749
;749:}
LABELV $236
endproc Weapon_GrapplingHook_Fire 4 20
export Weapon_HookFree
proc Weapon_HookFree 4 4
line 753
;750:
;751:
;752:void Weapon_HookFree (gentity_t *ent)
;753:{
line 754
;754:	ent->parent->client->hook = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2692
ADDP4
CNSTP4 0
ASGNP4
line 755
;755:	ent->parent->client->ps.pm_flags &= ~PMF_GRAPPLE_PULL;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 756
;756:	G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 757
;757:}
LABELV $239
endproc Weapon_HookFree 4 4
export Weapon_HookThink
proc Weapon_HookThink 36 8
line 760
;758:
;759:void Weapon_HookThink (gentity_t *ent)
;760:{
line 761
;761:	if (ent->enemy) {
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $241
line 764
;762:		vec3_t v, oldorigin;
;763:
;764:		VectorCopy(ent->r.currentOrigin, oldorigin);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRB
ASGNB 12
line 765
;765:		v[0] = ent->enemy->r.currentOrigin[0] + (ent->enemy->r.mins[0] + ent->enemy->r.maxs[0]) * 0.5;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 24
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 766
;766:		v[1] = ent->enemy->r.currentOrigin[1] + (ent->enemy->r.mins[1] + ent->enemy->r.maxs[1]) * 0.5;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0+4
ADDRLP4 28
INDIRP4
CNSTI4 500
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 28
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 460
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 767
;767:		v[2] = ent->enemy->r.currentOrigin[2] + (ent->enemy->r.mins[2] + ent->enemy->r.maxs[2]) * 0.5;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 32
INDIRP4
CNSTI4 504
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 32
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 464
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 768
;768:		SnapVectorTowards( v, oldorigin );	// save net bandwidth
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 770
;769:
;770:		G_SetOrigin( ent, v );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 771
;771:	}
LABELV $241
line 773
;772:
;773:	VectorCopy( ent->r.currentOrigin, ent->parent->client->ps.grapplePoint);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRB
ASGNB 12
line 774
;774:}
LABELV $240
endproc Weapon_HookThink 36 8
lit
align 4
LABELV $246
byte 4 0
byte 4 0
byte 4 0
export Weapon_fire_turret
code
proc Weapon_fire_turret 76 20
line 781
;775:
;776:/*
;777:=======================================================================
;778:TURRET - Not Used but this would be good for a vehichle
;779:=======================================================================
;780:*/
;781:void Weapon_fire_turret (gentity_t *ent, qboolean alt ) {
line 783
;782:	gentity_t *m;
;783:	float newforward[] = {0,0,0};
ADDRLP4 0
ADDRGP4 $246
INDIRB
ASGNB 12
line 788
;784:
;785:
;786:	// All of this is useless.. for the turrets, but lets tweak it for use as a shotgun variant
;787:
;788:	m = fire_turret(ent, muzzle, forward, alt);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 fire_turret
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
ASGNP4
line 789
;789:	m->damage *= s_quadFactor;
ADDRLP4 20
ADDRLP4 12
INDIRP4
CNSTI4 764
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 790
;790:	m->splashDamage *= s_quadFactor;
ADDRLP4 24
ADDRLP4 12
INDIRP4
CNSTI4 768
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 792
;791:
;792:	if (alt == qtrue) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $247
line 796
;793:		
;794:		
;795:		//Second bullet goes to the right
;796:		AngleVectors( ent->client->ps.viewangles, forward, right, up );
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 797
;797:		VectorCopy( forward, newforward );
ADDRLP4 0
ADDRGP4 forward
INDIRB
ASGNB 12
line 798
;798:		if ( forward[0] >= 0.5 && forward[0] <= 1 ) 
ADDRLP4 28
ADDRGP4 forward
INDIRF4
ASGNF4
ADDRLP4 28
INDIRF4
CNSTF4 1056964608
LTF4 $249
ADDRLP4 28
INDIRF4
CNSTF4 1065353216
GTF4 $249
line 799
;799:		{
line 800
;800:			newforward[1] += .35f;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1051931443
ADDF4
ASGNF4
line 801
;801:		} 
ADDRGP4 $250
JUMPV
LABELV $249
line 802
;802:		else if ( forward[0] <= -0.5 && forward[0] >= -1 ) 
ADDRLP4 32
ADDRGP4 forward
INDIRF4
ASGNF4
ADDRLP4 32
INDIRF4
CNSTF4 3204448256
GTF4 $252
ADDRLP4 32
INDIRF4
CNSTF4 3212836864
LTF4 $252
line 803
;803:		{
line 804
;804:			newforward[1] += .35f;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1051931443
ADDF4
ASGNF4
line 805
;805:		} else {
ADDRGP4 $253
JUMPV
LABELV $252
line 806
;806:			newforward[0] += .35f;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1051931443
ADDF4
ASGNF4
line 807
;807:		}
LABELV $253
LABELV $250
line 809
;808:	
;809:		VectorNormalize( newforward );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 810
;810:		VectorAdd( newforward, forward, forward );
ADDRLP4 36
ADDRGP4 forward
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRGP4 forward+4
ADDRLP4 0+4
INDIRF4
ADDRGP4 forward+4
INDIRF4
ADDF4
ASGNF4
ADDRGP4 forward+8
ADDRLP4 0+8
INDIRF4
ADDRGP4 forward+8
INDIRF4
ADDF4
ASGNF4
line 811
;811:		CalcMuzzlePoint( ent, forward, right, up, muzzle );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
line 814
;812:	
;813:
;814:		m = fire_turret(ent, muzzle, forward, alt);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 fire_turret
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 40
INDIRP4
ASGNP4
line 815
;815:		m->damage *= s_quadFactor;
ADDRLP4 44
ADDRLP4 12
INDIRP4
CNSTI4 764
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 816
;816:		m->splashDamage *= s_quadFactor;
ADDRLP4 48
ADDRLP4 12
INDIRP4
CNSTI4 768
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 821
;817:
;818:
;819:
;820:		//Third bullet goes to the left
;821:		AngleVectors (ent->client->ps.viewangles, forward, right, up);
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 822
;822:		VectorCopy( forward, newforward );
ADDRLP4 0
ADDRGP4 forward
INDIRB
ASGNB 12
line 823
;823:		if ( forward[0] >= 0.5 && forward[0] <= 1 ) {
ADDRLP4 52
ADDRGP4 forward
INDIRF4
ASGNF4
ADDRLP4 52
INDIRF4
CNSTF4 1056964608
LTF4 $261
ADDRLP4 52
INDIRF4
CNSTF4 1065353216
GTF4 $261
line 824
;824:		newforward[1] -= .35f;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1051931443
SUBF4
ASGNF4
line 825
;825:		} else if ( forward[0] <= -0.5 && forward[0] >= -1 ) {
ADDRGP4 $262
JUMPV
LABELV $261
ADDRLP4 56
ADDRGP4 forward
INDIRF4
ASGNF4
ADDRLP4 56
INDIRF4
CNSTF4 3204448256
GTF4 $264
ADDRLP4 56
INDIRF4
CNSTF4 3212836864
LTF4 $264
line 826
;826:		newforward[1] -= .35f;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1051931443
SUBF4
ASGNF4
line 827
;827:		} else {
ADDRGP4 $265
JUMPV
LABELV $264
line 828
;828:		newforward[0] -= .35f;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1051931443
SUBF4
ASGNF4
line 829
;829:		}
LABELV $265
LABELV $262
line 830
;830:		VectorNormalize( newforward );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 831
;831:		VectorAdd( newforward, forward, forward );
ADDRLP4 60
ADDRGP4 forward
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 0
INDIRF4
ADDRLP4 60
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRGP4 forward+4
ADDRLP4 0+4
INDIRF4
ADDRGP4 forward+4
INDIRF4
ADDF4
ASGNF4
ADDRGP4 forward+8
ADDRLP4 0+8
INDIRF4
ADDRGP4 forward+8
INDIRF4
ADDF4
ASGNF4
line 832
;832:		CalcMuzzlePoint ( ent, forward, right, up, muzzle );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
line 834
;833:
;834:		m = fire_turret(ent, muzzle, forward, alt);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 fire_turret
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 64
INDIRP4
ASGNP4
line 835
;835:		m->damage *= s_quadFactor;
ADDRLP4 68
ADDRLP4 12
INDIRP4
CNSTI4 764
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 836
;836:		m->splashDamage *= s_quadFactor;
ADDRLP4 72
ADDRLP4 12
INDIRP4
CNSTI4 768
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 837
;837:	}
LABELV $247
line 839
;838:
;839:}
LABELV $245
endproc Weapon_fire_turret 76 20
export Weapon_LightningFire
proc Weapon_LightningFire 120 32
line 849
;840:
;841:/*
;842:======================================================================
;843:
;844:LIGHTNING GUN
;845:
;846:======================================================================
;847:*/
;848:
;849:void Weapon_LightningFire( gentity_t *ent ) {
line 861
;850:	trace_t		tr;
;851:	vec3_t		end;
;852:#ifdef MISSIONPACK
;853:	vec3_t impactpoint, bouncedir;
;854:#endif
;855:	gentity_t	*traceEnt, *tent;
;856:	int			damage, i, passent;
;857:
;858://unlagged - server options
;859:	// this is configurable now
;860://	damage = 8 * s_quadFactor;
;861:	damage = g_lightningDamage.integer * s_quadFactor;
ADDRLP4 84
ADDRGP4 g_lightningDamage+12
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 864
;862://unlagged - server options
;863:
;864:	passent = ent->s.number;
ADDRLP4 80
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 865
;865:	for (i = 0; i < 10; i++) {
ADDRLP4 76
CNSTI4 0
ASGNI4
LABELV $275
line 866
;866:		VectorMA( muzzle, LIGHTNING_RANGE, forward, end );
ADDRLP4 88
CNSTF4 1145044992
ASGNF4
ADDRLP4 60
ADDRGP4 muzzle
INDIRF4
ADDRLP4 88
INDIRF4
ADDRGP4 forward
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 60+4
ADDRGP4 muzzle+4
INDIRF4
ADDRLP4 88
INDIRF4
ADDRGP4 forward+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 60+8
ADDRGP4 muzzle+8
INDIRF4
CNSTF4 1145044992
ADDRGP4 forward+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 870
;867:
;868://unlagged - backward reconciliation #2
;869:	// backward-reconcile the other clients
;870:	G_DoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 873
;871://unlagged - backward reconciliation #2
;872:
;873:		trap_Trace (&tr, muzzle, NULL, NULL, end, passent, MASK_SHOT);
ADDRLP4 0
ARGP4
ADDRGP4 muzzle
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
ADDRLP4 60
ARGP4
ADDRLP4 80
INDIRI4
ARGI4
CNSTI4 100664321
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 877
;874:
;875://unlagged - backward reconciliation #2
;876:	// put them back
;877:	G_UndoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 892
;878://unlagged - backward reconciliation #2
;879:
;880:#ifdef MISSIONPACK
;881:		// if not the first trace (the lightning bounced of an invulnerability sphere)
;882:		if (i) {
;883:			// add bounced off lightning bolt temp entity
;884:			// the first lightning bolt is a cgame only visual
;885:			//
;886:			tent = G_TempEntity( muzzle, EV_LIGHTNINGBOLT );
;887:			VectorCopy( tr.endpos, end );
;888:			SnapVector( end );
;889:			VectorCopy( end, tent->s.origin2 );
;890:		}
;891:#endif
;892:		if ( tr.entityNum == ENTITYNUM_NONE ) {
ADDRLP4 0+52
INDIRI4
CNSTI4 1023
NEI4 $285
line 893
;893:			return;
ADDRGP4 $273
JUMPV
LABELV $285
line 896
;894:		}
;895:
;896:		traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 56
CNSTI4 924
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 898
;897:
;898:		if ( traceEnt->takedamage) {
ADDRLP4 56
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $289
line 920
;899:#ifdef MISSIONPACK
;900:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
;901:				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
;902:					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
;903:					VectorCopy( impactpoint, muzzle );
;904:					VectorSubtract( end, impactpoint, forward );
;905:					VectorNormalize(forward);
;906:					// the player can hit him/herself with the bounced lightning
;907:					passent = ENTITYNUM_NONE;
;908:				}
;909:				else {
;910:					VectorCopy( tr.endpos, muzzle );
;911:					passent = traceEnt->s.number;
;912:				}
;913:				continue;
;914:			}
;915:			else {
;916:				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
;917:					damage, 0, MOD_LIGHTNING);
;918:			}
;919:#else
;920:				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 84
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 11
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 923
;921:					damage, 0, MOD_LIGHTNING);
;922:#endif
;923:		}
LABELV $289
line 925
;924:
;925:		if ( traceEnt->takedamage && traceEnt->client ) {
ADDRLP4 56
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $292
ADDRLP4 56
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $292
line 926
;926:			tent = G_TempEntity( tr.endpos, EV_MISSILE_HIT );
ADDRLP4 0+12
ARGP4
CNSTI4 52
ARGI4
ADDRLP4 100
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 100
INDIRP4
ASGNP4
line 927
;927:			tent->s.otherEntityNum = traceEnt->s.number;
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 56
INDIRP4
INDIRI4
ASGNI4
line 928
;928:			tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 0+24
ARGP4
ADDRLP4 104
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
line 929
;929:			tent->s.weapon = ent->s.weapon;
ADDRLP4 108
CNSTI4 192
ASGNI4
ADDRLP4 72
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 930
;930:			if( LogAccuracyHit( traceEnt, ent ) ) {
ADDRLP4 56
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
EQI4 $277
line 931
;931:				ent->client->accuracy_hits++;
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2648
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 932
;932:			}
line 933
;933:		} else if ( !( tr.surfaceFlags & SURF_NOIMPACT ) ) {
ADDRGP4 $277
JUMPV
LABELV $292
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $277
line 934
;934:			tent = G_TempEntity( tr.endpos, EV_MISSILE_MISS );
ADDRLP4 0+12
ARGP4
CNSTI4 53
ARGI4
ADDRLP4 100
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 100
INDIRP4
ASGNP4
line 935
;935:			tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 0+24
ARGP4
ADDRLP4 104
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
line 936
;936:		}
line 938
;937:
;938:		break;
ADDRGP4 $277
JUMPV
LABELV $276
line 865
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 10
LTI4 $275
LABELV $277
line 940
;939:	}
;940:}
LABELV $273
endproc Weapon_LightningFire 120 32
export LogAccuracyHit
proc LogAccuracyHit 4 8
line 997
;941:
;942:#ifdef MISSIONPACK
;943:/*
;944:======================================================================
;945:
;946:NAILGUN
;947:
;948:======================================================================
;949:*/
;950:
;951:void Weapon_Nailgun_Fire (gentity_t *ent) {
;952:	gentity_t	*m;
;953:	int			count;
;954:
;955:	for( count = 0; count < NUM_NAILSHOTS; count++ ) {
;956:		m = fire_nail (ent, muzzle, forward, right, up );
;957:		m->damage *= s_quadFactor;
;958:		m->splashDamage *= s_quadFactor;
;959:	}
;960:
;961://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;962:}
;963:
;964:
;965:/*
;966:======================================================================
;967:
;968:PROXIMITY MINE LAUNCHER
;969:
;970:======================================================================
;971:*/
;972:
;973:void weapon_proxlauncher_fire (gentity_t *ent) {
;974:	gentity_t	*m;
;975:
;976:	// extra vertical velocity
;977:	forward[2] += 0.2f;
;978:	VectorNormalize( forward );
;979:
;980:	m = fire_prox (ent, muzzle, forward);
;981:	m->damage *= s_quadFactor;
;982:	m->splashDamage *= s_quadFactor;
;983:
;984://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;985:}
;986:
;987:#endif
;988:
;989://======================================================================
;990:
;991:
;992:/*
;993:===============
;994:LogAccuracyHit
;995:===============
;996:*/
;997:qboolean LogAccuracyHit( gentity_t *target, gentity_t *attacker ) {
line 998
;998:	if( !target->takedamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
NEI4 $304
line 999
;999:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $303
JUMPV
LABELV $304
line 1002
;1000:	}
;1001:
;1002:	if ( target == attacker ) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
NEU4 $306
line 1003
;1003:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $303
JUMPV
LABELV $306
line 1006
;1004:	}
;1005:
;1006:	if( !target->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $308
line 1007
;1007:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $303
JUMPV
LABELV $308
line 1010
;1008:	}
;1009:
;1010:	if( !attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $310
line 1011
;1011:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $303
JUMPV
LABELV $310
line 1014
;1012:	}
;1013:
;1014:	if( target->client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $312
line 1015
;1015:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $303
JUMPV
LABELV $312
line 1018
;1016:	}
;1017:
;1018:	if ( OnSameTeam( target, attacker ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $314
line 1019
;1019:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $303
JUMPV
LABELV $314
line 1022
;1020:	}
;1021:
;1022:	return qtrue;
CNSTI4 1
RETI4
LABELV $303
endproc LogAccuracyHit 4 8
export CalcMuzzlePoint
proc CalcMuzzlePoint 48 4
line 1033
;1023:}
;1024:
;1025:
;1026:/*
;1027:===============
;1028:CalcMuzzlePoint
;1029:
;1030:set muzzle location relative to pivoting eye
;1031:===============
;1032:*/
;1033:void CalcMuzzlePoint ( gentity_t *ent, vec3_t forward, vec3_t right, vec3_t up, vec3_t muzzlePoint ) {
line 1034
;1034:	VectorCopy( ent->s.pos.trBase, muzzlePoint );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1035
;1035:	muzzlePoint[2] += ent->client->ps.viewheight;
ADDRLP4 0
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1036
;1036:	VectorMA( muzzlePoint, 14, forward, muzzlePoint );
ADDRLP4 4
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRFP4 4
INDIRP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 8
CNSTI4 4
ASGNI4
ADDRLP4 12
ADDRFP4 16
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 16
CNSTI4 8
ASGNI4
ADDRLP4 20
ADDRFP4 16
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRFP4 4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1038
;1037:	// snap to integer coordinates for more efficient network bandwidth usage
;1038:	SnapVector( muzzlePoint );
ADDRLP4 24
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 24
INDIRP4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 32
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 40
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRF4
ARGF4
ADDRLP4 44
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 40
INDIRP4
ADDRLP4 44
INDIRF4
ASGNF4
line 1039
;1039:}
LABELV $316
endproc CalcMuzzlePoint 48 4
export CalcMuzzlePointOrigin
proc CalcMuzzlePointOrigin 48 4
line 1048
;1040:
;1041:/*
;1042:===============
;1043:CalcMuzzlePointOrigin
;1044:
;1045:set muzzle location relative to pivoting eye
;1046:===============
;1047:*/
;1048:void CalcMuzzlePointOrigin ( gentity_t *ent, vec3_t origin, vec3_t forward, vec3_t right, vec3_t up, vec3_t muzzlePoint ) {
line 1049
;1049:	VectorCopy( ent->s.pos.trBase, muzzlePoint );
ADDRFP4 20
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1050
;1050:	muzzlePoint[2] += ent->client->ps.viewheight;
ADDRLP4 0
ADDRFP4 20
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1051
;1051:	VectorMA( muzzlePoint, 14, forward, muzzlePoint );
ADDRLP4 4
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 8
CNSTI4 4
ASGNI4
ADDRLP4 12
ADDRFP4 20
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRFP4 8
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 16
CNSTI4 8
ASGNI4
ADDRLP4 20
ADDRFP4 20
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRFP4 8
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1053
;1052:	// snap to integer coordinates for more efficient network bandwidth usage
;1053:	SnapVector( muzzlePoint );
ADDRLP4 24
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 24
INDIRP4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 32
ADDRFP4 20
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 40
ADDRFP4 20
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRF4
ARGF4
ADDRLP4 44
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 40
INDIRP4
ADDRLP4 44
INDIRF4
ASGNF4
line 1054
;1054:}
LABELV $317
endproc CalcMuzzlePointOrigin 48 4
export FireWeapon
proc FireWeapon 16 24
line 1063
;1055:
;1056:
;1057:
;1058:/*
;1059:===============
;1060:FireWeapon
;1061:===============
;1062:*/
;1063:void FireWeapon( gentity_t *ent ) {
line 1064
;1064:	if (ent->client->ps.powerups[PW_QUAD] ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $319
line 1065
;1065:		s_quadFactor = g_quadfactor.value;
ADDRGP4 s_quadFactor
ADDRGP4 g_quadfactor+8
INDIRF4
ASGNF4
line 1066
;1066:	} else {
ADDRGP4 $320
JUMPV
LABELV $319
line 1067
;1067:		s_quadFactor = 1;
ADDRGP4 s_quadFactor
CNSTF4 1065353216
ASGNF4
line 1068
;1068:	}
LABELV $320
line 1076
;1069:#ifdef MISSIONPACK
;1070:	if( ent->client->persistantPowerup && ent->client->persistantPowerup->item && ent->client->persistantPowerup->item->giTag == PW_DOUBLER ) {
;1071:		s_quadFactor *= 2;
;1072:	}
;1073:#endif
;1074:
;1075:	// track shots taken for accuracy tracking.  Grapple is not a weapon and gauntet is just not tracked
;1076:	if( ent->s.weapon != WP_GRAPPLING_HOOK && ent->s.weapon != WP_GAUNTLET ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $322
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $322
line 1084
;1077:#ifdef MISSIONPACK
;1078:		if( ent->s.weapon == WP_NAILGUN ) {
;1079:			ent->client->accuracy_shots += NUM_NAILSHOTS;
;1080:		} else {
;1081:			ent->client->accuracy_shots++;
;1082:		}
;1083:#else
;1084:		ent->client->accuracy_shots++;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2644
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1086
;1085:#endif
;1086:	}
LABELV $322
line 1089
;1087:
;1088:	// set aiming directions
;1089:	AngleVectors (ent->client->ps.viewangles, forward, right, up);
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1091
;1090:
;1091:	CalcMuzzlePointOrigin ( ent, ent->client->oldOrigin, forward, right, up, muzzle );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2600
ADDP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 CalcMuzzlePointOrigin
CALLV
pop
line 1094
;1092:
;1093:	// fire the specific weapon
;1094:	switch( ent->s.weapon ) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $325
ADDRLP4 8
INDIRI4
CNSTI4 11
GTI4 $325
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $338-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $338
address $327
address $330
address $329
address $331
address $332
address $328
address $334
address $333
address $335
address $336
address $337
code
LABELV $327
line 1096
;1095:	case WP_GAUNTLET:
;1096:		Weapon_Gauntlet( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Gauntlet
CALLV
pop
line 1097
;1097:		break;
ADDRGP4 $325
JUMPV
LABELV $328
line 1100
;1098:	case WP_LIGHTNING:
;1099:		//Weapon_LightningFire( ent );
;1100:		Weapon_fire_flame(ent , qfalse );  // Shafe - Trep - Flame Thrower
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Weapon_fire_flame
CALLV
pop
line 1101
;1101:		break;
ADDRGP4 $325
JUMPV
LABELV $329
line 1103
;1102:	case WP_SHOTGUN:
;1103:		weapon_supershotgun_fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_supershotgun_fire
CALLV
pop
line 1104
;1104:		break;
ADDRGP4 $325
JUMPV
LABELV $330
line 1106
;1105:	case WP_MACHINEGUN:
;1106:		Weapon_fire_mg( ent, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Weapon_fire_mg
CALLV
pop
line 1114
;1107:		/*
;1108:		if ( g_gametype.integer != GT_TEAM ) {
;1109:			Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_DAMAGE );
;1110:		} else {
;1111:			Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_TEAM_DAMAGE );
;1112:		}
;1113:		*/
;1114:		break;
ADDRGP4 $325
JUMPV
LABELV $331
line 1116
;1115:	case WP_GRENADE_LAUNCHER:
;1116:		weapon_grenadelauncher_fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_grenadelauncher_fire
CALLV
pop
line 1117
;1117:		break;
ADDRGP4 $325
JUMPV
LABELV $332
line 1119
;1118:	case WP_ROCKET_LAUNCHER:
;1119:		Weapon_RocketLauncher_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_RocketLauncher_Fire
CALLV
pop
line 1120
;1120:		break;
ADDRGP4 $325
JUMPV
LABELV $333
line 1122
;1121:	case WP_PLASMAGUN:
;1122:		Weapon_Plasmagun_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Plasmagun_Fire
CALLV
pop
line 1123
;1123:		break;
ADDRGP4 $325
JUMPV
LABELV $334
line 1125
;1124:	case WP_RAILGUN:
;1125:		weapon_railgun_fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_railgun_fire
CALLV
pop
line 1126
;1126:		break;
ADDRGP4 $325
JUMPV
LABELV $335
line 1128
;1127:	case WP_BFG:
;1128:		BFG_Fire( ent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BFG_Fire
CALLV
pop
line 1129
;1129:		break;
ADDRGP4 $325
JUMPV
LABELV $336
line 1131
;1130:	case WP_GRAPPLING_HOOK:
;1131:		Weapon_GrapplingHook_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_GrapplingHook_Fire
CALLV
pop
line 1132
;1132:		break;
ADDRGP4 $325
JUMPV
LABELV $337
line 1134
;1133:	case WP_TURRET:
;1134:		Weapon_fire_turret( ent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Weapon_fire_turret
CALLV
pop
line 1135
;1135:		break;	
line 1149
;1136:#ifdef MISSIONPACK
;1137:	case WP_NAILGUN:
;1138:		Weapon_Nailgun_Fire( ent );
;1139:		break;
;1140:	case WP_PROX_LAUNCHER:
;1141:		weapon_proxlauncher_fire( ent );
;1142:		break;
;1143:	case WP_CHAINGUN:
;1144:		Bullet_Fire( ent, CHAINGUN_SPREAD, MACHINEGUN_DAMAGE );
;1145:		break;
;1146:#endif
;1147:	default:
;1148:// FIXME		G_Error( "Bad ent->s.weapon" );
;1149:		break;
LABELV $325
line 1151
;1150:	}
;1151:}
LABELV $318
endproc FireWeapon 16 24
export FireWeapon2
proc FireWeapon2 12 20
line 1161
;1152:
;1153:
;1154:/* 
;1155:=============== 
;1156:FireWeapon2 
;1157:Shafe - Trep - Alt Fire FireWeapon2
;1158:Right now this just shoots rockets...
;1159:=============== 
;1160:*/ 
;1161:void FireWeapon2( gentity_t *ent ) { 
line 1162
;1162: if (ent->client->ps.powerups[PW_QUAD] ) { 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $341
line 1163
;1163:  s_quadFactor = g_quadfactor.value; 
ADDRGP4 s_quadFactor
ADDRGP4 g_quadfactor+8
INDIRF4
ASGNF4
line 1164
;1164: } else { 
ADDRGP4 $342
JUMPV
LABELV $341
line 1165
;1165:  s_quadFactor = 1; 
ADDRGP4 s_quadFactor
CNSTF4 1065353216
ASGNF4
line 1166
;1166: } 
LABELV $342
line 1169
;1167:
;1168: // track shots taken for accuracy tracking.  Grapple is not a weapon and gauntet is just not tracked 
;1169: if( ent->s.weapon != WP_GRAPPLING_HOOK && ent->s.weapon != WP_GAUNTLET ) { 
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $344
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $344
line 1172
;1170:   //ent->client->ps.persistant[PERS_ACCURACY_SHOTS]++;  // This doesnt exist?
;1171:	// ent->client->accuracy_shots++;
;1172: } 
LABELV $344
line 1175
;1173:
;1174: // set aiming directions 
;1175: AngleVectors (ent->client->ps.viewangles, forward, right, up); 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1177
;1176:
;1177: CalcMuzzlePoint ( ent, forward, right, up, muzzle ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
line 1180
;1178:
;1179: // fire the specific weapon 
;1180: switch( ent->s.weapon ) { 
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $347
ADDRLP4 4
INDIRI4
CNSTI4 11
GTI4 $347
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $360-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $360
address $349
address $352
address $351
address $353
address $354
address $350
address $347
address $355
address $357
address $358
address $359
code
LABELV $349
line 1182
;1181: case WP_GAUNTLET: 
;1182:	Weapon_Gauntlet( ent ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Gauntlet
CALLV
pop
line 1183
;1183:	break; 
ADDRGP4 $347
JUMPV
LABELV $350
line 1185
;1184: case WP_LIGHTNING: 
;1185:	Weapon_fire_flame( ent, qtrue);  // Shafe - Trep - Flame Thrower
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Weapon_fire_flame
CALLV
pop
line 1186
;1186:	break; 
ADDRGP4 $347
JUMPV
LABELV $351
line 1189
;1187: case WP_SHOTGUN: 
;1188:	//Weapon_RocketLauncher_Fire( ent );
;1189:	weapon_supershotgun_fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_supershotgun_fire
CALLV
pop
line 1190
;1190:	break; 
ADDRGP4 $347
JUMPV
LABELV $352
line 1194
;1191: case WP_MACHINEGUN: 
;1192:  //Weapon_RocketLauncher_Fire( ent );
;1193: 	//Weapon_fire_turret( ent );
;1194:	 Weapon_fire_mg( ent, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Weapon_fire_mg
CALLV
pop
line 1202
;1195:	/* 
;1196:	if ( g_gametype.integer != GT_TEAM ) { 
;1197:		Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_DAMAGE ); 
;1198:	} else { 
;1199:		Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_TEAM_DAMAGE ); 
;1200:	} 
;1201:	*/
;1202:  break; 
ADDRGP4 $347
JUMPV
LABELV $353
line 1204
;1203: case WP_GRENADE_LAUNCHER: 
;1204:	weapon_altgrenadelauncher_fire( ent ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_altgrenadelauncher_fire
CALLV
pop
line 1205
;1205:	break; 
ADDRGP4 $347
JUMPV
LABELV $354
line 1207
;1206: case WP_ROCKET_LAUNCHER: 
;1207:	Weapon_RocketLauncher_AltFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_RocketLauncher_AltFire
CALLV
pop
line 1208
;1208:	break; 
ADDRGP4 $347
JUMPV
LABELV $355
line 1210
;1209: case WP_PLASMAGUN: 
;1210:	weapon_pdlauncher_fire( ent); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_pdlauncher_fire
CALLV
pop
line 1211
;1211:	break; 
ADDRGP4 $347
JUMPV
line 1214
;1212: case WP_RAILGUN: 
;1213:	// This is just zoom
;1214:	break; 
LABELV $357
line 1216
;1215: case WP_BFG: 
;1216:	BFG_Fire( ent, qtrue); 
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BFG_Fire
CALLV
pop
line 1217
;1217:	break; 
ADDRGP4 $347
JUMPV
LABELV $358
line 1219
;1218: case WP_GRAPPLING_HOOK: 
;1219:	Weapon_GrapplingHook_Fire( ent ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_GrapplingHook_Fire
CALLV
pop
line 1220
;1220:	break;
ADDRGP4 $347
JUMPV
LABELV $359
line 1222
;1221: case WP_TURRET:
;1222:	Weapon_fire_turret( ent, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Weapon_fire_turret
CALLV
pop
line 1223
;1223:	break;	
line 1226
;1224: default: 
;1225:// FIXME  G_Error( "Bad ent->s.weapon" ); 
;1226:  break; 
LABELV $347
line 1228
;1227: } 
;1228:}
LABELV $340
endproc FireWeapon2 12 20
bss
align 4
LABELV muzzle
skip 12
align 4
LABELV up
skip 12
align 4
LABELV right
skip 12
align 4
LABELV forward
skip 12
align 4
LABELV s_quadFactor
skip 4
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
import g_PCTeamkills
import g_GrappleMode
import g_Turrets
import g_StartBFG
import g_StartPlasma
import g_StartGauss
import g_StartFlame
import g_StartSingCan
import g_StartGrenade
import g_StartSG
import g_StartMG
import g_StartGauntlet
import g_MultiJumps
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
import G_BreakGlass
import TeleportPlayer
import trigger_teleporter_touch
import Touch_DoorTrigger
import G_RunMover
import fire_mg
import fire_turret
import fire_grapple
import fire_bfg
import fire_rocket
import fire_flame
import fire_alt_rocket
import fire_altgrenade
import fire_pdgrenade
import fire_grenade
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
LABELV $177
byte 1 112
byte 1 100
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
