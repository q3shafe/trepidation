export G_BounceProjectile
code
proc G_BounceProjectile 64 4
file "../g_weapon.c"
line 18
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// g_weapon.c 
;4:// perform the server side effects of a weapon firing
;5:
;6:#include "g_local.h"
;7:static	float	s_quadFactor;
;8:static	vec3_t	forward, right, up;
;9:static	vec3_t	muzzle;
;10:
;11:#define NUM_NAILSHOTS 15
;12:
;13:/*
;14:================
;15:G_BounceProjectile
;16:================
;17:*/
;18:void G_BounceProjectile( vec3_t start, vec3_t impact, vec3_t dir, vec3_t endout ) {
line 22
;19:	vec3_t v, newv;
;20:	float dot;
;21:
;22:	VectorSubtract( impact, start, v );
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
line 23
;23:	dot = DotProduct( v, dir );
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
line 24
;24:	VectorMA( v, -2*dot, dir, newv );
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
line 26
;25:
;26:	VectorNormalize(newv);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 27
;27:	VectorMA(impact, 8192, newv, endout);
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
line 28
;28:}
LABELV $55
endproc G_BounceProjectile 64 4
export Weapon_Gauntlet
proc Weapon_Gauntlet 0 0
line 39
;29:
;30:
;31:/*
;32:======================================================================
;33:
;34:GAUNTLET
;35:
;36:======================================================================
;37:*/
;38:
;39:void Weapon_Gauntlet( gentity_t *ent ) {
line 41
;40:
;41:}
LABELV $66
endproc Weapon_Gauntlet 0 0
export CheckGauntletAttack
proc CheckGauntletAttack 104 32
line 48
;42:
;43:/*
;44:===============
;45:CheckGauntletAttack
;46:===============
;47:*/
;48:qboolean CheckGauntletAttack( gentity_t *ent ) {
line 56
;49:	trace_t		tr;
;50:	vec3_t		end;
;51:	gentity_t	*tent;
;52:	gentity_t	*traceEnt;
;53:	int			damage;
;54:
;55:	// set aiming directions
;56:	AngleVectors (ent->client->ps.viewangles, forward, right, up);
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
line 58
;57:
;58:	CalcMuzzlePoint ( ent, forward, right, up, muzzle );
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
line 60
;59:
;60:	VectorMA (muzzle, 32, forward, end);
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
line 62
;61:
;62:	trap_Trace (&tr, muzzle, NULL, NULL, end, ent->s.number, MASK_SHOT);
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
line 63
;63:	if ( tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 4+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $74
line 64
;64:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $67
JUMPV
LABELV $74
line 67
;65:	}
;66:
;67:	traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 0
CNSTI4 924
ADDRLP4 4+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 70
;68:
;69:	// send blood impact
;70:	if ( traceEnt->takedamage && traceEnt->client ) {
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
line 71
;71:		tent = G_TempEntity( tr.endpos, EV_MISSILE_HIT );
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
line 72
;72:		tent->s.otherEntityNum = traceEnt->s.number;
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 73
;73:		tent->s.eventParm = DirToByte( tr.plane.normal );
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
line 74
;74:		tent->s.weapon = ent->s.weapon;
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
line 75
;75:	}
LABELV $78
line 77
;76:
;77:	if ( !traceEnt->takedamage) {
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
NEI4 $82
line 78
;78:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $67
JUMPV
LABELV $82
line 81
;79:	}
;80:
;81:	if (ent->client->ps.powerups[PW_QUAD] ) {
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
line 82
;82:		G_AddEvent( ent, EV_POWERUP_QUAD, 0 );
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
line 83
;83:		s_quadFactor = g_quadfactor.value;
ADDRGP4 s_quadFactor
ADDRGP4 g_quadfactor+8
INDIRF4
ASGNF4
line 84
;84:	} else {
ADDRGP4 $85
JUMPV
LABELV $84
line 85
;85:		s_quadFactor = 1;
ADDRGP4 s_quadFactor
CNSTF4 1065353216
ASGNF4
line 86
;86:	}
LABELV $85
line 93
;87:#ifdef MISSIONPACK
;88:	if( ent->client->persistantPowerup && ent->client->persistantPowerup->item && ent->client->persistantPowerup->item->giTag == PW_DOUBLER ) {
;89:		s_quadFactor *= 2;
;90:	}
;91:#endif
;92:
;93:	damage = 50 * s_quadFactor;
ADDRLP4 76
CNSTF4 1112014848
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 94
;94:	G_Damage( traceEnt, ent, ent, forward, tr.endpos,
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
line 97
;95:		damage, 0, MOD_GAUNTLET );
;96:
;97:	return qtrue;
CNSTI4 1
RETI4
LABELV $67
endproc CheckGauntletAttack 104 32
export Weapon_fire_flame
proc Weapon_fire_flame 16 16
line 107
;98:}
;99:
;100:
;101://
;102://=======================================================================
;103://FLAME_THROWER
;104://Shafe - Trep - Flame Thrower
;105://=======================================================================
;106://
;107:void Weapon_fire_flame (gentity_t *ent, qboolean alt ) {
line 110
;108:	gentity_t	*m;
;109:
;110:	m = fire_flame(ent, muzzle, forward, alt);
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
line 111
;111:	m->damage *= s_quadFactor;
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
line 112
;112:	m->splashDamage *= s_quadFactor;
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
line 113
;113:}	
LABELV $88
endproc Weapon_fire_flame 16 16
export Weapon_fire_mg
proc Weapon_fire_mg 16 16
line 157
;114:
;115:
;116:/*
;117:======================================================================
;118:
;119:MACHINEGUN
;120:
;121:======================================================================
;122:*/
;123:
;124:/*
;125:======================
;126:SnapVectorTowards
;127:
;128:Round a vector to integers for more efficient network
;129:transmission, but make sure that it rounds towards a given point
;130:rather than blindly truncating.  This prevents it from truncating 
;131:into a wall.
;132:======================
;133:*/
;134://unlagged - attack prediction #3
;135:// moved to q_shared.c
;136:/*
;137:void SnapVectorTowards( vec3_t v, vec3_t to ) {
;138:	int		i;
;139:
;140:	for ( i = 0 ; i < 3 ; i++ ) {
;141:		if ( to[i] <= v[i] ) {
;142:			v[i] = (int)v[i];
;143:		} else {
;144:			v[i] = (int)v[i] + 1;
;145:		}
;146:	}
;147:}
;148:*/
;149://unlagged - attack prediction #3
;150:
;151:
;152:/*
;153:=======================================================================
;154:MACHINE GUN
;155:=======================================================================
;156:*/
;157:void Weapon_fire_mg (gentity_t *ent, qboolean alt ) {
line 160
;158:	gentity_t *m;
;159:
;160:	m = fire_mg(ent, muzzle, forward, alt);
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
line 161
;161:	m->damage *= s_quadFactor;
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
line 162
;162:	m->splashDamage *= s_quadFactor;
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
line 163
;163:}
LABELV $89
endproc Weapon_fire_mg 16 16
export Bullet_Fire
proc Bullet_Fire 152 32
line 174
;164:
;165:
;166:
;167:#ifdef MISSIONPACK
;168:#define CHAINGUN_SPREAD		600
;169:#endif
;170:#define MACHINEGUN_SPREAD	64
;171:#define	MACHINEGUN_DAMAGE	7
;172:#define	MACHINEGUN_TEAM_DAMAGE	5		// wimpier MG in teamplay
;173:
;174:void Bullet_Fire (gentity_t *ent, float spread, int damage ) {
line 188
;175:	trace_t		tr;
;176:	vec3_t		end;
;177:#ifdef MISSIONPACK
;178:	vec3_t		impactpoint, bouncedir;
;179:#endif
;180:	float		r;
;181:	float		u;
;182:	gentity_t	*tent;
;183:	gentity_t	*traceEnt;
;184:	int			i, passent;
;185:
;186://unlagged - attack prediction #2
;187:	// we have to use something now that the client knows in advance
;188:	int			seed = ent->client->attackTime % 256;
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2740
ADDP4
INDIRI4
CNSTI4 256
MODI4
ASGNI4
line 191
;189://unlagged - attack prediction #2
;190:
;191:	damage *= s_quadFactor;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 200
;192:
;193://unlagged - attack prediction #2
;194:	// this has to match what's on the client
;195:/*
;196:	r = random() * M_PI * 2.0f;
;197:	u = sin(r) * crandom() * spread * 16;
;198:	r = cos(r) * crandom() * spread * 16;
;199:*/
;200:	r = Q_random(&seed) * M_PI * 2.0f;
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
line 201
;201:	u = sin(r) * Q_crandom(&seed) * spread * 16;
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
line 202
;202:	r = cos(r) * Q_crandom(&seed) * spread * 16;
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
line 204
;203://unlagged - attack prediction #2
;204:	VectorMA (muzzle, 8192*16, forward, end);
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
line 205
;205:	VectorMA (end, r, right, end);
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
line 206
;206:	VectorMA (end, u, up, end);
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
line 208
;207:
;208:	passent = ent->s.number;
ADDRLP4 80
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 209
;209:	for (i = 0; i < 10; i++) {
ADDRLP4 76
CNSTI4 0
ASGNI4
LABELV $109
line 213
;210:
;211://unlagged - backward reconciliation #2
;212:		// backward-reconcile the other clients
;213:		G_DoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 216
;214://unlagged - backward reconciliation #2
;215:
;216:		trap_Trace (&tr, muzzle, NULL, NULL, end, passent, MASK_SHOT);
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
line 220
;217:
;218://unlagged - backward reconciliation #2
;219:		// put them back
;220:		G_UndoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 223
;221://unlagged - backward reconciliation #2
;222:
;223:		if ( tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $113
line 224
;224:			return;
ADDRGP4 $90
JUMPV
LABELV $113
line 227
;225:		}
;226:
;227:		traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 56
CNSTI4 924
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 230
;228:
;229:		// snap the endpos to integers, but nudged towards the line
;230:		SnapVectorTowards( tr.endpos, muzzle );
ADDRLP4 0+12
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 233
;231:
;232:		// send bullet impact
;233:		if ( traceEnt->takedamage && traceEnt->client ) {
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
line 234
;234:			tent = G_TempEntity( tr.endpos, EV_BULLET_HIT_FLESH );
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
line 235
;235:			tent->s.eventParm = traceEnt->s.number;
ADDRLP4 60
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 56
INDIRP4
INDIRI4
ASGNI4
line 239
;236://unlagged - attack prediction #2
;237:			// we need the client number to determine whether or not to
;238:			// suppress this event
;239:			tent->s.clientNum = ent->s.clientNum;
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
line 241
;240://unlagged - attack prediction #2
;241:			if( LogAccuracyHit( traceEnt, ent ) ) {
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
line 242
;242:				ent->client->accuracy_hits++;
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
line 243
;243:			}
line 244
;244:		} else {
ADDRGP4 $119
JUMPV
LABELV $118
line 245
;245:			tent = G_TempEntity( tr.endpos, EV_BULLET_HIT_WALL );
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
line 246
;246:			tent->s.eventParm = DirToByte( tr.plane.normal );
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
line 250
;247://unlagged - attack prediction #2
;248:			// we need the client number to determine whether or not to
;249:			// suppress this event
;250:			tent->s.clientNum = ent->s.clientNum;
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
line 252
;251://unlagged - attack prediction #2
;252:		}
LABELV $119
line 253
;253:		tent->s.otherEntityNum = ent->s.number;
ADDRLP4 60
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 255
;254:
;255:		if ( traceEnt->takedamage) {
ADDRLP4 56
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $111
line 272
;256:#ifdef MISSIONPACK
;257:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
;258:				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
;259:					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
;260:					VectorCopy( impactpoint, muzzle );
;261:					// the player can hit him/herself with the bounced rail
;262:					passent = ENTITYNUM_NONE;
;263:				}
;264:				else {
;265:					VectorCopy( tr.endpos, muzzle );
;266:					passent = traceEnt->s.number;
;267:				}
;268:				continue;
;269:			}
;270:			else {
;271:#endif
;272:				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
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
line 277
;273:					damage, 0, MOD_MACHINEGUN);
;274:#ifdef MISSIONPACK
;275:			}
;276:#endif
;277:		}
line 278
;278:		break;
ADDRGP4 $111
JUMPV
LABELV $110
line 209
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
line 280
;279:	}
;280:}
LABELV $90
endproc Bullet_Fire 152 32
export BFG_Fire
proc BFG_Fire 20 16
line 291
;281:
;282:
;283:/*
;284:======================================================================
;285:
;286:BFG
;287:
;288:======================================================================
;289:*/
;290:
;291:void BFG_Fire ( gentity_t *ent, qboolean alt ) {
line 295
;292:	gentity_t	*m;
;293:
;294:	// Alt Fire Shoots Upward Just A Bit MOre
;295:	if (alt == qtrue)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $129
line 296
;296:	{
line 297
;297:		forward[2] += 0.2f;
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
line 298
;298:	}
LABELV $129
line 300
;299:	
;300:	forward[2] += 0.2f;
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
line 304
;301:
;302:
;303:	
;304:	VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 305
;305:	m = fire_bfg (ent, muzzle, forward, alt);
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
line 306
;306:	m->damage *= s_quadFactor;
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
line 307
;307:	m->splashDamage *= s_quadFactor;
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
line 310
;308:
;309://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;310:}
LABELV $128
endproc BFG_Fire 20 16
export ShotgunPellet
proc ShotgunPellet 108 32
line 325
;311:
;312:
;313:/*
;314:======================================================================
;315:
;316:SHOTGUN
;317:
;318:======================================================================
;319:*/
;320:
;321:// DEFAULT_SHOTGUN_SPREAD and DEFAULT_SHOTGUN_COUNT	are in bg_public.h, because
;322:// client predicts same spreads
;323:#define	DEFAULT_SHOTGUN_DAMAGE	10
;324:
;325:qboolean ShotgunPellet( vec3_t start, vec3_t end, gentity_t *ent, qboolean alt ) {
line 334
;326:	trace_t		tr;
;327:	int			damage, i, passent;
;328:	gentity_t	*traceEnt;
;329:#ifdef MISSIONPACK
;330:	vec3_t		impactpoint, bouncedir;
;331:#endif
;332:	vec3_t		tr_start, tr_end;
;333:
;334:	passent = ent->s.number;
ADDRLP4 64
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 335
;335:	VectorCopy( start, tr_start );
ADDRLP4 68
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 336
;336:	VectorCopy( end, tr_end );
ADDRLP4 80
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 337
;337:	for (i = 0; i < 10; i++) {
ADDRLP4 60
CNSTI4 0
ASGNI4
LABELV $134
line 338
;338:		trap_Trace (&tr, tr_start, NULL, NULL, tr_end, passent, MASK_SHOT);
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
line 339
;339:		traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 56
CNSTI4 924
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 342
;340:
;341:		// send bullet impact
;342:		if (  tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $139
line 343
;343:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $133
JUMPV
LABELV $139
line 346
;344:		}
;345:
;346:		if ( traceEnt->takedamage) {
ADDRLP4 56
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $142
line 348
;347:		
;348:				damage = DEFAULT_SHOTGUN_DAMAGE * s_quadFactor;
ADDRLP4 92
CNSTF4 1092616192
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 374
;349:		
;350:		
;351:			
;352:#ifdef MISSIONPACK
;353:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
;354:				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
;355:					G_BounceProjectile( tr_start, impactpoint, bouncedir, tr_end );
;356:					VectorCopy( impactpoint, tr_start );
;357:					// the player can hit him/herself with the bounced rail
;358:					passent = ENTITYNUM_NONE;
;359:				}
;360:				else {
;361:					VectorCopy( tr.endpos, tr_start );
;362:					passent = traceEnt->s.number;
;363:				}
;364:				continue;
;365:			}
;366:			else {
;367:				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
;368:					damage, 0, MOD_SHOTGUN);
;369:				if( LogAccuracyHit( traceEnt, ent ) ) {
;370:					return qtrue;
;371:				}
;372:			}
;373:#else
;374:			G_Damage( traceEnt, ent, ent, forward, tr.endpos,	damage, 0, MOD_SHOTGUN);
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
line 375
;375:				if( LogAccuracyHit( traceEnt, ent ) ) {
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
line 376
;376:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $133
JUMPV
LABELV $145
line 379
;377:				}
;378:#endif
;379:		}
LABELV $142
line 380
;380:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $133
JUMPV
LABELV $135
line 337
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
line 382
;381:	}
;382:	return qfalse;
CNSTI4 0
RETI4
LABELV $133
endproc ShotgunPellet 108 32
export ShotgunPattern
proc ShotgunPattern 104 16
line 386
;383:}
;384:
;385:// this should match CG_ShotgunPattern
;386:void ShotgunPattern( vec3_t origin, vec3_t origin2, int seed, gentity_t *ent, qboolean alt ) {
line 392
;387:	int			i;
;388:	float		r, u;
;389:	vec3_t		end;
;390:	vec3_t		forward, right, up;
;391:	int			oldScore;
;392:	qboolean	hitClient = qfalse;
ADDRLP4 60
CNSTI4 0
ASGNI4
line 401
;393:
;394://unlagged - attack prediction #2
;395:	// use this for testing
;396:	//Com_Printf( "Server seed: %d\n", seed );
;397://unlagged - attack prediction #2
;398:
;399:	// derive the right and up vectors from the forward vector, because
;400:	// the client won't have any other information
;401:	VectorNormalize2( origin2, forward );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 VectorNormalize2
CALLF4
pop
line 402
;402:	PerpendicularVector( right, forward );
ADDRLP4 32
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 403
;403:	CrossProduct( forward, right, up );
ADDRLP4 20
ARGP4
ADDRLP4 32
ARGP4
ADDRLP4 44
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 405
;404:
;405:	oldScore = ent->client->ps.persistant[PERS_SCORE];
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
line 409
;406:
;407://unlagged - backward reconciliation #2
;408:	// backward-reconcile the other clients
;409:	G_DoTimeShiftFor( ent );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 415
;410://unlagged - backward reconciliation #2
;411:
;412:	
;413:
;414:	// generate the "random" spread pattern
;415:		for ( i = 0 ; i < DEFAULT_SHOTGUN_COUNT ; i++ ) {
ADDRLP4 56
CNSTI4 0
ASGNI4
LABELV $148
line 416
;416:			r = Q_crandom( &seed ) * DEFAULT_SHOTGUN_SPREAD * 16;
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
line 417
;417:			u = Q_crandom( &seed ) * DEFAULT_SHOTGUN_SPREAD * 16;
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
line 418
;418:			VectorMA( origin, 8192 * 16, forward, end);
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
line 419
;419:			VectorMA (end, r, right, end);
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
line 420
;420:			VectorMA (end, u, up, end);
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
line 421
;421:			if( ShotgunPellet( origin, end, ent, alt ) && !hitClient ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
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
line 422
;422:				hitClient = qtrue;
ADDRLP4 60
CNSTI4 1
ASGNI4
line 423
;423:				ent->client->accuracy_hits++;
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
line 424
;424:			}
LABELV $168
line 425
;425:		}
LABELV $149
line 415
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
line 429
;426:
;427://unlagged - backward reconciliation #2
;428:	// put them back
;429:	G_UndoTimeShiftFor( ent );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 431
;430://unlagged - backward reconciliation #2
;431:}
LABELV $147
endproc ShotgunPattern 104 16
export weapon_supershotgun_fire
proc weapon_supershotgun_fire 32 20
line 434
;432:
;433:
;434:void weapon_supershotgun_fire (gentity_t *ent, qboolean alt) {
line 437
;435:	gentity_t		*tent;
;436:
;437:	if (alt == qtrue) { return; }
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $171
ADDRGP4 $170
JUMPV
LABELV $171
line 439
;438:	// send shotgun blast
;439:	tent = G_TempEntity( muzzle, EV_SHOTGUN );
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
line 440
;440:	VectorScale( forward, 4096, tent->s.origin2 );
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
line 441
;441:	SnapVector( tent->s.origin2 );
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
line 445
;442://unlagged - attack prediction #2
;443:	// this has to be something the client can predict now
;444:	//tent->s.eventParm = rand() & 255;		// seed for spread pattern
;445:	tent->s.eventParm = ent->client->attackTime % 256; // seed for spread pattern
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2740
ADDP4
INDIRI4
CNSTI4 256
MODI4
ASGNI4
line 447
;446://unlagged - attack prediction #2
;447:	tent->s.otherEntityNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 449
;448:
;449:	ShotgunPattern( tent->s.pos.trBase, tent->s.origin2, tent->s.eventParm, ent, alt );
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
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 ShotgunPattern
CALLV
pop
line 450
;450:}
LABELV $170
endproc weapon_supershotgun_fire 32 20
export weapon_bomblauncher_fire
proc weapon_bomblauncher_fire 24 16
line 462
;451:
;452:
;453:/*
;454:======================================================================
;455:
;456:BOMB
;457:
;458:======================================================================
;459:*/
;460:
;461:// Shafe - Bomb
;462:void weapon_bomblauncher_fire (gentity_t	*ent, qboolean alt) {
line 464
;463:	gentity_t	*m;
;464:	gentity_t	*grenades = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 468
;465:	 
;466:
;467:
;468:if (ent->client->bombfired == qfalse) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
CNSTI4 0
NEI4 $180
line 470
;469:		// extra vertical velocity
;470:		forward[2] += 0.2f;
ADDRLP4 8
ADDRGP4 forward+8
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CNSTF4 1045220557
ADDF4
ASGNF4
line 471
;471:		VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 473
;472: 
;473:		m = fire_bomb (ent, muzzle, forward, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 12
ADDRGP4 fire_bomb
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 474
;474:		m->damage *= s_quadFactor;
ADDRLP4 16
ADDRLP4 4
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
line 475
;475:		m->splashDamage *= s_quadFactor;
ADDRLP4 20
ADDRLP4 4
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
line 476
;476:		ent->client->bombfired = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2704
ADDP4
CNSTI4 1
ASGNI4
line 477
;477:		return;
ADDRGP4 $175
JUMPV
LABELV $179
line 481
;478:	}
;479:
;480: while ((grenades = G_Find (grenades, FOFS(classname), "bomb")) != NULL)
;481: {
line 482
;482:	if(grenades->r.ownerNum == ent->s.clientNum)  //make sure its ours
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
NEI4 $183
line 483
;483:	{
line 484
;484:		if (ent->client->bombfired == qtrue)
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
CNSTI4 1
NEI4 $185
line 485
;485:		{
line 486
;486:			G_ExplodeBomb(grenades);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_ExplodeBomb
CALLV
pop
line 487
;487:			ent->client->bombfired = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2704
ADDP4
CNSTI4 0
ASGNI4
line 489
;488:			
;489:		}
LABELV $185
line 491
;490:
;491:	}
LABELV $183
line 492
;492: }
LABELV $180
line 480
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 532
ARGI4
ADDRGP4 $182
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
NEU4 $179
line 496
;493:
;494: 	
;495:
;496:} 
LABELV $175
endproc weapon_bomblauncher_fire 24 16
export weapon_pdlauncher_fire
proc weapon_pdlauncher_fire 28 12
line 508
;497:
;498:
;499:/*
;500:======================================================================
;501:
;502:PDG
;503:
;504:======================================================================
;505:*/
;506:
;507:// Shafe - PDG
;508:void weapon_pdlauncher_fire (gentity_t	*ent) {
line 510
;509:	gentity_t	*m;
;510:	gentity_t	*grenades = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $189
JUMPV
LABELV $188
line 513
;511:	 
;512: while ((grenades = G_Find (grenades, FOFS(classname), "pdgrenade")) != NULL)
;513: {
line 514
;514:	if(grenades->r.ownerNum == ent->s.clientNum)  //make sure its ours
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
NEI4 $192
line 515
;515:	{
line 516
;516:		ent->istelepoint = 0; // client cannot teleport
ADDRFP4 0
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 0
ASGNI4
line 517
;517:		VectorClear( ent->teleloc ); // clear the teleport location
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
line 518
;518:		grenades->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 519
;519:		grenades->nextthink = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 520
;520:	}
LABELV $192
line 521
;521: }
LABELV $189
line 512
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 532
ARGI4
ADDRGP4 $191
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
NEU4 $188
line 523
;522: // extra vertical velocity
;523: forward[2] += 0.2f;
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
line 524
;524: VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 526
;525: 
;526: m = fire_pdgrenade (ent, muzzle, forward);
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
line 527
;527: m->damage *= s_quadFactor;
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
line 528
;528: m->splashDamage *= s_quadFactor;
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
line 529
;529: ent->client->pdgfired = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2700
ADDP4
CNSTI4 1
ASGNI4
line 530
;530:} 
LABELV $187
endproc weapon_pdlauncher_fire 28 12
export weapon_grenadelauncher_fire
proc weapon_grenadelauncher_fire 20 12
line 541
;531:
;532:
;533:/*
;534:======================================================================
;535:
;536:GRENADE LAUNCHER
;537:
;538:======================================================================
;539:*/
;540:
;541:void weapon_grenadelauncher_fire (gentity_t *ent) {
line 545
;542:	gentity_t	*m;
;543:
;544:	// extra vertical velocity
;545:	forward[2] += 0.2f;
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
line 546
;546:	VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 548
;547:
;548:	m = fire_grenade (ent, muzzle, forward);
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
line 549
;549:	m->damage *= s_quadFactor;
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
line 550
;550:	m->splashDamage *= s_quadFactor;
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
line 553
;551:
;552://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;553:}
LABELV $196
endproc weapon_grenadelauncher_fire 20 12
export weapon_altgrenadelauncher_fire
proc weapon_altgrenadelauncher_fire 20 12
line 564
;554:
;555:/*
;556:======================================================================
;557:
;558:ALT GRENADE LAUNCHER 
;559:Shafe - Trep - Alternate Fire Grenade
;560:
;561:======================================================================
;562:*/
;563:
;564:void weapon_altgrenadelauncher_fire (gentity_t *ent) {
line 568
;565:	gentity_t	*m;
;566:
;567:	// extra vertical velocity
;568:	forward[2] += 0.2f;
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
line 569
;569:	VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 571
;570:
;571:	m = fire_altgrenade (ent, muzzle, forward);
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
line 572
;572:	m->damage *= s_quadFactor;
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
line 573
;573:	m->splashDamage *= s_quadFactor;
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
line 576
;574:
;575://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;576:}
LABELV $198
endproc weapon_altgrenadelauncher_fire 20 12
export Weapon_RocketLauncher_Fire
proc Weapon_RocketLauncher_Fire 16 12
line 586
;577:
;578:/*
;579:======================================================================
;580:
;581:ROCKET
;582:
;583:======================================================================
;584:*/
;585:
;586:void Weapon_RocketLauncher_Fire (gentity_t *ent) {
line 589
;587:	gentity_t	*m;
;588:
;589:	m = fire_rocket (ent, muzzle, forward);
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
line 590
;590:	m->damage *= s_quadFactor;
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
line 591
;591:	m->splashDamage *= s_quadFactor;
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
line 594
;592:
;593://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;594:}
LABELV $200
endproc Weapon_RocketLauncher_Fire 16 12
export Weapon_RocketLauncher_AltFire
proc Weapon_RocketLauncher_AltFire 16 12
line 597
;595:
;596:// Shafe - Trep Alt Rocket Launcher
;597:void Weapon_RocketLauncher_AltFire (gentity_t *ent) {
line 600
;598:	gentity_t	*m;
;599:
;600:	m = fire_alt_rocket (ent, muzzle, forward);
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
line 601
;601:	m->damage *= s_quadFactor;
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
line 602
;602:	m->splashDamage *= s_quadFactor;
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
line 605
;603:
;604://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;605:}
LABELV $201
endproc Weapon_RocketLauncher_AltFire 16 12
export Weapon_Plasmagun_Fire
proc Weapon_Plasmagun_Fire 24 12
line 616
;606:
;607:
;608:/*
;609:======================================================================
;610:
;611:PLASMA GUN
;612:
;613:======================================================================
;614:*/
;615:
;616:void Weapon_Plasmagun_Fire (gentity_t *ent) {
line 622
;617:	gentity_t	*m;
;618:	int		i;
;619:	
;620:	// Shafe - Add Some Randomness so that 
;621:	// it doesnt fire straight every time
;622:	i = irandom(0,10);
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
line 623
;623:	if (i > 5)
ADDRLP4 4
INDIRI4
CNSTI4 5
LEI4 $203
line 624
;624:	{
line 625
;625:		forward[2] += 0.2f;
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
line 626
;626:		VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 627
;627:	}
LABELV $203
line 629
;628:
;629:	m = fire_plasma (ent, muzzle, forward);
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
line 630
;630:	m->damage *= s_quadFactor;
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
line 631
;631:	m->splashDamage *= s_quadFactor;
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
line 634
;632:
;633://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;634:}
LABELV $202
endproc Weapon_Plasmagun_Fire 24 12
export weapon_railgun_fire
proc weapon_railgun_fire 172 32
line 651
;635:
;636:/*
;637:======================================================================
;638:
;639:RAILGUN
;640:
;641:======================================================================
;642:*/
;643:
;644:
;645:/*
;646:=================
;647:weapon_railgun_fire
;648:=================
;649:*/
;650:#define	MAX_RAIL_HITS	4
;651:void weapon_railgun_fire (gentity_t *ent) {
line 667
;652:	vec3_t		end;
;653:#ifdef MISSIONPACK
;654:	vec3_t impactpoint, bouncedir;
;655:#endif
;656:	trace_t		trace;
;657:	gentity_t	*tent;
;658:	gentity_t	*traceEnt;
;659:	int			damage;
;660:	int			i;
;661:	int			hits;
;662:	int			unlinked;
;663:	int			passent;
;664:	gentity_t	*unlinkedEntities[MAX_RAIL_HITS];
;665:
;666:	// Shafe - Trep - Instagib
;667:	if (g_instagib.integer == 0)
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 0
NEI4 $207
line 668
;668:	{
line 669
;669:		damage = 100 * s_quadFactor;
ADDRLP4 104
CNSTF4 1120403456
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 670
;670:	} else {
ADDRGP4 $208
JUMPV
LABELV $207
line 671
;671:		damage = 1000 * s_quadFactor;
ADDRLP4 104
CNSTF4 1148846080
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 672
;672:	}
LABELV $208
line 675
;673:	/////////////////////////////////////
;674:
;675:	VectorMA (muzzle, 8192, forward, end);
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
line 679
;676:
;677://unlagged - backward reconciliation #2
;678:	// backward-reconcile the other clients
;679:	G_DoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 683
;680://unlagged - backward reconciliation #2
;681:
;682:	// trace only against the solids, so the railgun will go through people
;683:	unlinked = 0;
ADDRLP4 60
CNSTI4 0
ASGNI4
line 684
;684:	hits = 0;
ADDRLP4 108
CNSTI4 0
ASGNI4
line 685
;685:	passent = ent->s.number;
ADDRLP4 100
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
LABELV $216
line 686
;686:	do {
line 687
;687:		trap_Trace (&trace, muzzle, NULL, NULL, end, passent, MASK_SHOT );
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
line 688
;688:		if ( trace.entityNum >= ENTITYNUM_MAX_NORMAL ) {
ADDRLP4 4+52
INDIRI4
CNSTI4 1022
LTI4 $219
line 689
;689:			break;
ADDRGP4 $218
JUMPV
LABELV $219
line 691
;690:		}
;691:		traceEnt = &g_entities[ trace.entityNum ];
ADDRLP4 0
CNSTI4 924
ADDRLP4 4+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 692
;692:		if ( traceEnt->takedamage ) {
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $223
line 721
;693:#ifdef MISSIONPACK
;694:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
;695:				if ( G_InvulnerabilityEffect( traceEnt, forward, trace.endpos, impactpoint, bouncedir ) ) {
;696:					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
;697:					// snap the endpos to integers to save net bandwidth, but nudged towards the line
;698:					SnapVectorTowards( trace.endpos, muzzle );
;699:					// send railgun beam effect
;700:					tent = G_TempEntity( trace.endpos, EV_RAILTRAIL );
;701:					// set player number for custom colors on the railtrail
;702:					tent->s.clientNum = ent->s.clientNum;
;703:					VectorCopy( muzzle, tent->s.origin2 );
;704:					// move origin a bit to come closer to the drawn gun muzzle
;705:					VectorMA( tent->s.origin2, 4, right, tent->s.origin2 );
;706:					VectorMA( tent->s.origin2, -1, up, tent->s.origin2 );
;707:					tent->s.eventParm = 255;	// don't make the explosion at the end
;708:					//
;709:					VectorCopy( impactpoint, muzzle );
;710:					// the player can hit him/herself with the bounced rail
;711:					passent = ENTITYNUM_NONE;
;712:				}
;713:			}
;714:			else {
;715:				if( LogAccuracyHit( traceEnt, ent ) ) {
;716:					hits++;
;717:				}
;718:				G_Damage (traceEnt, ent, ent, forward, trace.endpos, damage, 0, MOD_RAILGUN);
;719:			}
;720:#else
;721:				if( LogAccuracyHit( traceEnt, ent ) ) {
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
EQI4 $225
line 722
;722:					hits++;
ADDRLP4 108
ADDRLP4 108
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 723
;723:				}
LABELV $225
line 724
;724:				G_Damage (traceEnt, ent, ent, forward, trace.endpos, damage, 0, MOD_RAILGUN);
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
line 726
;725:#endif
;726:		}
LABELV $223
line 727
;727:		if ( trace.contents & CONTENTS_SOLID ) {
ADDRLP4 4+48
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $228
line 728
;728:			break;		// we hit something solid enough to stop the beam
ADDRGP4 $218
JUMPV
LABELV $228
line 731
;729:		}
;730:		// unlink this entity, so the next trace will go past it
;731:		trap_UnlinkEntity( traceEnt );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 732
;732:		unlinkedEntities[unlinked] = traceEnt;
ADDRLP4 60
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 733
;733:		unlinked++;
ADDRLP4 60
ADDRLP4 60
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 734
;734:	} while ( unlinked < MAX_RAIL_HITS );
LABELV $217
ADDRLP4 60
INDIRI4
CNSTI4 4
LTI4 $216
LABELV $218
line 738
;735:
;736://unlagged - backward reconciliation #2
;737:	// put them back
;738:	G_UndoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 742
;739://unlagged - backward reconciliation #2
;740:
;741:	// link back in any entities we unlinked
;742:	for ( i = 0 ; i < unlinked ; i++ ) {
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 $234
JUMPV
LABELV $231
line 743
;743:		trap_LinkEntity( unlinkedEntities[i] );
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
line 744
;744:	}
LABELV $232
line 742
ADDRLP4 64
ADDRLP4 64
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $234
ADDRLP4 64
INDIRI4
ADDRLP4 60
INDIRI4
LTI4 $231
line 749
;745:
;746:	// the final trace endpos will be the terminal point of the rail trail
;747:
;748:	// snap the endpos to integers to save net bandwidth, but nudged towards the line
;749:	SnapVectorTowards( trace.endpos, muzzle );
ADDRLP4 4+12
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 752
;750:
;751:	// send railgun beam effect
;752:	tent = G_TempEntity( trace.endpos, EV_RAILTRAIL );
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
line 755
;753:
;754:	// set player number for custom colors on the railtrail
;755:	tent->s.clientNum = ent->s.clientNum;
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
line 757
;756:
;757:	VectorCopy( muzzle, tent->s.origin2 );
ADDRLP4 84
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 759
;758:	// move origin a bit to come closer to the drawn gun muzzle
;759:	VectorMA( tent->s.origin2, 4, right, tent->s.origin2 );
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
line 760
;760:	VectorMA( tent->s.origin2, -1, up, tent->s.origin2 );
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
line 763
;761:
;762:	// no explosion at end if SURF_NOIMPACT, but still make the trail
;763:	if ( trace.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 4+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $241
line 764
;764:		tent->s.eventParm = 255;	// don't make the explosion at the end
ADDRLP4 84
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 255
ASGNI4
line 765
;765:	} else {
ADDRGP4 $242
JUMPV
LABELV $241
line 766
;766:		tent->s.eventParm = DirToByte( trace.plane.normal );
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
line 767
;767:	}
LABELV $242
line 768
;768:	tent->s.clientNum = ent->s.clientNum;
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
line 771
;769:
;770:	// give the shooter a reward sound if they have made two railgun hits in a row
;771:	if ( hits == 0 ) {
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $245
line 773
;772:		// complete miss
;773:		ent->client->accurateCount = 0;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2640
ADDP4
CNSTI4 0
ASGNI4
line 774
;774:	} else {
ADDRGP4 $246
JUMPV
LABELV $245
line 776
;775:		// check for "impressive" reward sound
;776:		ent->client->accurateCount += hits;
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
line 777
;777:		if ( ent->client->accurateCount >= 2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2640
ADDP4
INDIRI4
CNSTI4 2
LTI4 $247
line 778
;778:			ent->client->accurateCount -= 2;
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
line 779
;779:			ent->client->ps.persistant[PERS_IMPRESSIVE_COUNT]++;
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
line 781
;780:			// add the sprite over the player's head
;781:			ent->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
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
line 782
;782:			ent->client->ps.eFlags |= EF_AWARD_IMPRESSIVE;
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
line 783
;783:			ent->client->rewardTime = level.time + REWARD_SPRITE_TIME;
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
line 784
;784:		}
LABELV $247
line 785
;785:		ent->client->accuracy_hits++;
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
line 786
;786:	}
LABELV $246
line 788
;787:
;788:}
LABELV $206
endproc weapon_railgun_fire 172 32
export Weapon_GrapplingHook_Fire
proc Weapon_GrapplingHook_Fire 4 20
line 800
;789:
;790:
;791:/*
;792:======================================================================
;793:
;794:GRAPPLING HOOK
;795:
;796:======================================================================
;797:*/
;798:
;799:void Weapon_GrapplingHook_Fire (gentity_t *ent)
;800:{
line 802
;801:	// Shafe - Trep  - Offhand Grappling Hook
;802:	AngleVectors (ent->client->ps.viewangles, forward, right, up);
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
line 803
;803:	CalcMuzzlePoint ( ent, forward, right, up, muzzle );
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
line 806
;804:	// End Shafe
;805:	
;806:	if (!ent->client->fireHeld && !ent->client->hook)
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
NEI4 $251
ADDRLP4 0
INDIRP4
CNSTI4 2692
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $251
line 807
;807:		fire_grapple (ent, muzzle, forward);
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
LABELV $251
line 809
;808:
;809:	ent->client->fireHeld = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 1
ASGNI4
line 810
;810:}
LABELV $250
endproc Weapon_GrapplingHook_Fire 4 20
export Weapon_HookFree
proc Weapon_HookFree 4 4
line 814
;811:
;812:
;813:void Weapon_HookFree (gentity_t *ent)
;814:{
line 815
;815:	ent->parent->client->hook = NULL;
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
line 816
;816:	ent->parent->client->ps.pm_flags &= ~PMF_GRAPPLE_PULL;
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
line 817
;817:	G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 818
;818:}
LABELV $253
endproc Weapon_HookFree 4 4
export Weapon_HookThink
proc Weapon_HookThink 36 8
line 821
;819:
;820:void Weapon_HookThink (gentity_t *ent)
;821:{
line 822
;822:	if (ent->enemy) {
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $255
line 825
;823:		vec3_t v, oldorigin;
;824:
;825:		VectorCopy(ent->r.currentOrigin, oldorigin);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRB
ASGNB 12
line 826
;826:		v[0] = ent->enemy->r.currentOrigin[0] + (ent->enemy->r.mins[0] + ent->enemy->r.maxs[0]) * 0.5;
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
line 827
;827:		v[1] = ent->enemy->r.currentOrigin[1] + (ent->enemy->r.mins[1] + ent->enemy->r.maxs[1]) * 0.5;
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
line 828
;828:		v[2] = ent->enemy->r.currentOrigin[2] + (ent->enemy->r.mins[2] + ent->enemy->r.maxs[2]) * 0.5;
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
line 829
;829:		SnapVectorTowards( v, oldorigin );	// save net bandwidth
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 831
;830:
;831:		G_SetOrigin( ent, v );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 832
;832:	}
LABELV $255
line 834
;833:
;834:	VectorCopy( ent->r.currentOrigin, ent->parent->client->ps.grapplePoint);
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
line 835
;835:}
LABELV $254
endproc Weapon_HookThink 36 8
lit
align 4
LABELV $260
byte 4 0
byte 4 0
byte 4 0
export Weapon_fire_turret
code
proc Weapon_fire_turret 76 20
line 842
;836:
;837:/*
;838:=======================================================================
;839:TURRET - Not Used but this would be good for a vehichle
;840:=======================================================================
;841:*/
;842:void Weapon_fire_turret (gentity_t *ent, qboolean alt ) {
line 844
;843:	gentity_t *m;
;844:	float newforward[] = {0,0,0};
ADDRLP4 0
ADDRGP4 $260
INDIRB
ASGNB 12
line 849
;845:
;846:
;847:	// All of this is useless.. for the turrets, but lets tweak it for use as a shotgun variant
;848:
;849:	m = fire_turret(ent, muzzle, forward, alt);
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
line 850
;850:	m->damage *= s_quadFactor;
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
line 851
;851:	m->splashDamage *= s_quadFactor;
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
line 853
;852:
;853:	if (alt == qtrue) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $261
line 857
;854:		
;855:		
;856:		//Second bullet goes to the right
;857:		AngleVectors( ent->client->ps.viewangles, forward, right, up );
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
line 858
;858:		VectorCopy( forward, newforward );
ADDRLP4 0
ADDRGP4 forward
INDIRB
ASGNB 12
line 859
;859:		if ( forward[0] >= 0.5 && forward[0] <= 1 ) 
ADDRLP4 28
ADDRGP4 forward
INDIRF4
ASGNF4
ADDRLP4 28
INDIRF4
CNSTF4 1056964608
LTF4 $263
ADDRLP4 28
INDIRF4
CNSTF4 1065353216
GTF4 $263
line 860
;860:		{
line 861
;861:			newforward[1] += .35f;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1051931443
ADDF4
ASGNF4
line 862
;862:		} 
ADDRGP4 $264
JUMPV
LABELV $263
line 863
;863:		else if ( forward[0] <= -0.5 && forward[0] >= -1 ) 
ADDRLP4 32
ADDRGP4 forward
INDIRF4
ASGNF4
ADDRLP4 32
INDIRF4
CNSTF4 3204448256
GTF4 $266
ADDRLP4 32
INDIRF4
CNSTF4 3212836864
LTF4 $266
line 864
;864:		{
line 865
;865:			newforward[1] += .35f;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1051931443
ADDF4
ASGNF4
line 866
;866:		} else {
ADDRGP4 $267
JUMPV
LABELV $266
line 867
;867:			newforward[0] += .35f;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1051931443
ADDF4
ASGNF4
line 868
;868:		}
LABELV $267
LABELV $264
line 870
;869:	
;870:		VectorNormalize( newforward );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 871
;871:		VectorAdd( newforward, forward, forward );
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
line 872
;872:		CalcMuzzlePoint( ent, forward, right, up, muzzle );
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
line 875
;873:	
;874:
;875:		m = fire_turret(ent, muzzle, forward, alt);
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
line 876
;876:		m->damage *= s_quadFactor;
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
line 877
;877:		m->splashDamage *= s_quadFactor;
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
line 882
;878:
;879:
;880:
;881:		//Third bullet goes to the left
;882:		AngleVectors (ent->client->ps.viewangles, forward, right, up);
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
line 883
;883:		VectorCopy( forward, newforward );
ADDRLP4 0
ADDRGP4 forward
INDIRB
ASGNB 12
line 884
;884:		if ( forward[0] >= 0.5 && forward[0] <= 1 ) {
ADDRLP4 52
ADDRGP4 forward
INDIRF4
ASGNF4
ADDRLP4 52
INDIRF4
CNSTF4 1056964608
LTF4 $275
ADDRLP4 52
INDIRF4
CNSTF4 1065353216
GTF4 $275
line 885
;885:		newforward[1] -= .35f;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1051931443
SUBF4
ASGNF4
line 886
;886:		} else if ( forward[0] <= -0.5 && forward[0] >= -1 ) {
ADDRGP4 $276
JUMPV
LABELV $275
ADDRLP4 56
ADDRGP4 forward
INDIRF4
ASGNF4
ADDRLP4 56
INDIRF4
CNSTF4 3204448256
GTF4 $278
ADDRLP4 56
INDIRF4
CNSTF4 3212836864
LTF4 $278
line 887
;887:		newforward[1] -= .35f;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1051931443
SUBF4
ASGNF4
line 888
;888:		} else {
ADDRGP4 $279
JUMPV
LABELV $278
line 889
;889:		newforward[0] -= .35f;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1051931443
SUBF4
ASGNF4
line 890
;890:		}
LABELV $279
LABELV $276
line 891
;891:		VectorNormalize( newforward );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 892
;892:		VectorAdd( newforward, forward, forward );
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
line 893
;893:		CalcMuzzlePoint ( ent, forward, right, up, muzzle );
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
line 895
;894:
;895:		m = fire_turret(ent, muzzle, forward, alt);
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
line 896
;896:		m->damage *= s_quadFactor;
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
line 897
;897:		m->splashDamage *= s_quadFactor;
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
line 898
;898:	}
LABELV $261
line 900
;899:
;900:}
LABELV $259
endproc Weapon_fire_turret 76 20
export Weapon_LightningFire
proc Weapon_LightningFire 120 32
line 910
;901:
;902:/*
;903:======================================================================
;904:
;905:LIGHTNING GUN
;906:
;907:======================================================================
;908:*/
;909:
;910:void Weapon_LightningFire( gentity_t *ent ) {
line 922
;911:	trace_t		tr;
;912:	vec3_t		end;
;913:#ifdef MISSIONPACK
;914:	vec3_t impactpoint, bouncedir;
;915:#endif
;916:	gentity_t	*traceEnt, *tent;
;917:	int			damage, i, passent;
;918:
;919://unlagged - server options
;920:	// this is configurable now
;921://	damage = 8 * s_quadFactor;
;922:	damage = g_lightningDamage.integer * s_quadFactor;
ADDRLP4 84
ADDRGP4 g_lightningDamage+12
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 925
;923://unlagged - server options
;924:
;925:	passent = ent->s.number;
ADDRLP4 80
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 926
;926:	for (i = 0; i < 10; i++) {
ADDRLP4 76
CNSTI4 0
ASGNI4
LABELV $289
line 927
;927:		VectorMA( muzzle, LIGHTNING_RANGE, forward, end );
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
line 931
;928:
;929://unlagged - backward reconciliation #2
;930:	// backward-reconcile the other clients
;931:	G_DoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 934
;932://unlagged - backward reconciliation #2
;933:
;934:		trap_Trace (&tr, muzzle, NULL, NULL, end, passent, MASK_SHOT);
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
line 938
;935:
;936://unlagged - backward reconciliation #2
;937:	// put them back
;938:	G_UndoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 953
;939://unlagged - backward reconciliation #2
;940:
;941:#ifdef MISSIONPACK
;942:		// if not the first trace (the lightning bounced of an invulnerability sphere)
;943:		if (i) {
;944:			// add bounced off lightning bolt temp entity
;945:			// the first lightning bolt is a cgame only visual
;946:			//
;947:			tent = G_TempEntity( muzzle, EV_LIGHTNINGBOLT );
;948:			VectorCopy( tr.endpos, end );
;949:			SnapVector( end );
;950:			VectorCopy( end, tent->s.origin2 );
;951:		}
;952:#endif
;953:		if ( tr.entityNum == ENTITYNUM_NONE ) {
ADDRLP4 0+52
INDIRI4
CNSTI4 1023
NEI4 $299
line 954
;954:			return;
ADDRGP4 $287
JUMPV
LABELV $299
line 957
;955:		}
;956:
;957:		traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 56
CNSTI4 924
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 959
;958:
;959:		if ( traceEnt->takedamage) {
ADDRLP4 56
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $303
line 981
;960:#ifdef MISSIONPACK
;961:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
;962:				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
;963:					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
;964:					VectorCopy( impactpoint, muzzle );
;965:					VectorSubtract( end, impactpoint, forward );
;966:					VectorNormalize(forward);
;967:					// the player can hit him/herself with the bounced lightning
;968:					passent = ENTITYNUM_NONE;
;969:				}
;970:				else {
;971:					VectorCopy( tr.endpos, muzzle );
;972:					passent = traceEnt->s.number;
;973:				}
;974:				continue;
;975:			}
;976:			else {
;977:				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
;978:					damage, 0, MOD_LIGHTNING);
;979:			}
;980:#else
;981:				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
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
line 984
;982:					damage, 0, MOD_LIGHTNING);
;983:#endif
;984:		}
LABELV $303
line 986
;985:
;986:		if ( traceEnt->takedamage && traceEnt->client ) {
ADDRLP4 56
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $306
ADDRLP4 56
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $306
line 987
;987:			tent = G_TempEntity( tr.endpos, EV_MISSILE_HIT );
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
line 988
;988:			tent->s.otherEntityNum = traceEnt->s.number;
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 56
INDIRP4
INDIRI4
ASGNI4
line 989
;989:			tent->s.eventParm = DirToByte( tr.plane.normal );
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
line 990
;990:			tent->s.weapon = ent->s.weapon;
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
line 991
;991:			if( LogAccuracyHit( traceEnt, ent ) ) {
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
EQI4 $291
line 992
;992:				ent->client->accuracy_hits++;
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
line 993
;993:			}
line 994
;994:		} else if ( !( tr.surfaceFlags & SURF_NOIMPACT ) ) {
ADDRGP4 $291
JUMPV
LABELV $306
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $291
line 995
;995:			tent = G_TempEntity( tr.endpos, EV_MISSILE_MISS );
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
line 996
;996:			tent->s.eventParm = DirToByte( tr.plane.normal );
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
line 997
;997:		}
line 999
;998:
;999:		break;
ADDRGP4 $291
JUMPV
LABELV $290
line 926
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 10
LTI4 $289
LABELV $291
line 1001
;1000:	}
;1001:}
LABELV $287
endproc Weapon_LightningFire 120 32
export LogAccuracyHit
proc LogAccuracyHit 4 8
line 1058
;1002:
;1003:#ifdef MISSIONPACK
;1004:/*
;1005:======================================================================
;1006:
;1007:NAILGUN
;1008:
;1009:======================================================================
;1010:*/
;1011:
;1012:void Weapon_Nailgun_Fire (gentity_t *ent) {
;1013:	gentity_t	*m;
;1014:	int			count;
;1015:
;1016:	for( count = 0; count < NUM_NAILSHOTS; count++ ) {
;1017:		m = fire_nail (ent, muzzle, forward, right, up );
;1018:		m->damage *= s_quadFactor;
;1019:		m->splashDamage *= s_quadFactor;
;1020:	}
;1021:
;1022://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;1023:}
;1024:
;1025:
;1026:/*
;1027:======================================================================
;1028:
;1029:PROXIMITY MINE LAUNCHER
;1030:
;1031:======================================================================
;1032:*/
;1033:
;1034:void weapon_proxlauncher_fire (gentity_t *ent) {
;1035:	gentity_t	*m;
;1036:
;1037:	// extra vertical velocity
;1038:	forward[2] += 0.2f;
;1039:	VectorNormalize( forward );
;1040:
;1041:	m = fire_prox (ent, muzzle, forward);
;1042:	m->damage *= s_quadFactor;
;1043:	m->splashDamage *= s_quadFactor;
;1044:
;1045://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;1046:}
;1047:
;1048:#endif
;1049:
;1050://======================================================================
;1051:
;1052:
;1053:/*
;1054:===============
;1055:LogAccuracyHit
;1056:===============
;1057:*/
;1058:qboolean LogAccuracyHit( gentity_t *target, gentity_t *attacker ) {
line 1059
;1059:	if( !target->takedamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
NEI4 $318
line 1060
;1060:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $317
JUMPV
LABELV $318
line 1063
;1061:	}
;1062:
;1063:	if ( target == attacker ) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
NEU4 $320
line 1064
;1064:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $317
JUMPV
LABELV $320
line 1067
;1065:	}
;1066:
;1067:	if( !target->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $322
line 1068
;1068:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $317
JUMPV
LABELV $322
line 1071
;1069:	}
;1070:
;1071:	if( !attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $324
line 1072
;1072:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $317
JUMPV
LABELV $324
line 1075
;1073:	}
;1074:
;1075:	if( target->client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $326
line 1076
;1076:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $317
JUMPV
LABELV $326
line 1079
;1077:	}
;1078:
;1079:	if ( OnSameTeam( target, attacker ) ) {
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
EQI4 $328
line 1080
;1080:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $317
JUMPV
LABELV $328
line 1083
;1081:	}
;1082:
;1083:	return qtrue;
CNSTI4 1
RETI4
LABELV $317
endproc LogAccuracyHit 4 8
export CalcMuzzlePoint
proc CalcMuzzlePoint 48 4
line 1094
;1084:}
;1085:
;1086:
;1087:/*
;1088:===============
;1089:CalcMuzzlePoint
;1090:
;1091:set muzzle location relative to pivoting eye
;1092:===============
;1093:*/
;1094:void CalcMuzzlePoint ( gentity_t *ent, vec3_t forward, vec3_t right, vec3_t up, vec3_t muzzlePoint ) {
line 1095
;1095:	VectorCopy( ent->s.pos.trBase, muzzlePoint );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1096
;1096:	muzzlePoint[2] += ent->client->ps.viewheight;
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
line 1097
;1097:	VectorMA( muzzlePoint, 14, forward, muzzlePoint );
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
line 1099
;1098:	// snap to integer coordinates for more efficient network bandwidth usage
;1099:	SnapVector( muzzlePoint );
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
line 1100
;1100:}
LABELV $330
endproc CalcMuzzlePoint 48 4
export CalcMuzzlePointOrigin
proc CalcMuzzlePointOrigin 48 4
line 1109
;1101:
;1102:/*
;1103:===============
;1104:CalcMuzzlePointOrigin
;1105:
;1106:set muzzle location relative to pivoting eye
;1107:===============
;1108:*/
;1109:void CalcMuzzlePointOrigin ( gentity_t *ent, vec3_t origin, vec3_t forward, vec3_t right, vec3_t up, vec3_t muzzlePoint ) {
line 1110
;1110:	VectorCopy( ent->s.pos.trBase, muzzlePoint );
ADDRFP4 20
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1111
;1111:	muzzlePoint[2] += ent->client->ps.viewheight;
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
line 1112
;1112:	VectorMA( muzzlePoint, 14, forward, muzzlePoint );
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
line 1114
;1113:	// snap to integer coordinates for more efficient network bandwidth usage
;1114:	SnapVector( muzzlePoint );
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
line 1115
;1115:}
LABELV $331
endproc CalcMuzzlePointOrigin 48 4
export FireWeapon
proc FireWeapon 16 24
line 1124
;1116:
;1117:
;1118:
;1119:/*
;1120:===============
;1121:FireWeapon
;1122:===============
;1123:*/
;1124:void FireWeapon( gentity_t *ent ) {
line 1125
;1125:	if (ent->client->ps.powerups[PW_QUAD] ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $333
line 1126
;1126:		s_quadFactor = g_quadfactor.value;
ADDRGP4 s_quadFactor
ADDRGP4 g_quadfactor+8
INDIRF4
ASGNF4
line 1127
;1127:	} else {
ADDRGP4 $334
JUMPV
LABELV $333
line 1128
;1128:		s_quadFactor = 1;
ADDRGP4 s_quadFactor
CNSTF4 1065353216
ASGNF4
line 1129
;1129:	}
LABELV $334
line 1137
;1130:#ifdef MISSIONPACK
;1131:	if( ent->client->persistantPowerup && ent->client->persistantPowerup->item && ent->client->persistantPowerup->item->giTag == PW_DOUBLER ) {
;1132:		s_quadFactor *= 2;
;1133:	}
;1134:#endif
;1135:
;1136:	// track shots taken for accuracy tracking.  Grapple is not a weapon and gauntet is just not tracked
;1137:	if( ent->s.weapon != WP_GRAPPLING_HOOK && ent->s.weapon != WP_GAUNTLET ) {
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
EQI4 $336
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $336
line 1145
;1138:#ifdef MISSIONPACK
;1139:		if( ent->s.weapon == WP_NAILGUN ) {
;1140:			ent->client->accuracy_shots += NUM_NAILSHOTS;
;1141:		} else {
;1142:			ent->client->accuracy_shots++;
;1143:		}
;1144:#else
;1145:		ent->client->accuracy_shots++;
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
line 1147
;1146:#endif
;1147:	}
LABELV $336
line 1150
;1148:
;1149:	// set aiming directions
;1150:	AngleVectors (ent->client->ps.viewangles, forward, right, up);
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
line 1152
;1151:
;1152:	CalcMuzzlePointOrigin ( ent, ent->client->oldOrigin, forward, right, up, muzzle );
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
line 1155
;1153:
;1154:	// fire the specific weapon
;1155:	switch( ent->s.weapon ) {
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
LTI4 $339
ADDRLP4 8
INDIRI4
CNSTI4 11
GTI4 $339
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $352-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $352
address $341
address $344
address $343
address $345
address $346
address $342
address $348
address $347
address $349
address $350
address $351
code
LABELV $341
line 1157
;1156:	case WP_GAUNTLET:
;1157:		Weapon_Gauntlet( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Gauntlet
CALLV
pop
line 1158
;1158:		break;
ADDRGP4 $339
JUMPV
LABELV $342
line 1161
;1159:	case WP_LIGHTNING:
;1160:		//Weapon_LightningFire( ent );
;1161:		Weapon_fire_flame(ent , qfalse );  // Shafe - Trep - Flame Thrower
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Weapon_fire_flame
CALLV
pop
line 1162
;1162:		break;
ADDRGP4 $339
JUMPV
LABELV $343
line 1164
;1163:	case WP_SHOTGUN:
;1164:		weapon_supershotgun_fire( ent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 weapon_supershotgun_fire
CALLV
pop
line 1165
;1165:		break;
ADDRGP4 $339
JUMPV
LABELV $344
line 1167
;1166:	case WP_MACHINEGUN:
;1167:		Weapon_fire_mg( ent, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Weapon_fire_mg
CALLV
pop
line 1175
;1168:		/*
;1169:		if ( g_gametype.integer != GT_TEAM ) {
;1170:			Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_DAMAGE );
;1171:		} else {
;1172:			Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_TEAM_DAMAGE );
;1173:		}
;1174:		*/
;1175:		break;
ADDRGP4 $339
JUMPV
LABELV $345
line 1178
;1176:	case WP_GRENADE_LAUNCHER:
;1177:		//weapon_grenadelauncher_fire( ent );
;1178:		weapon_bomblauncher_fire( ent, qtrue); 
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 weapon_bomblauncher_fire
CALLV
pop
line 1179
;1179:		break;
ADDRGP4 $339
JUMPV
LABELV $346
line 1181
;1180:	case WP_ROCKET_LAUNCHER:
;1181:		Weapon_RocketLauncher_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_RocketLauncher_Fire
CALLV
pop
line 1182
;1182:		break;
ADDRGP4 $339
JUMPV
LABELV $347
line 1184
;1183:	case WP_PLASMAGUN:
;1184:		Weapon_Plasmagun_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Plasmagun_Fire
CALLV
pop
line 1185
;1185:		break;
ADDRGP4 $339
JUMPV
LABELV $348
line 1187
;1186:	case WP_RAILGUN:
;1187:		weapon_railgun_fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_railgun_fire
CALLV
pop
line 1188
;1188:		break;
ADDRGP4 $339
JUMPV
LABELV $349
line 1190
;1189:	case WP_BFG:
;1190:		BFG_Fire( ent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BFG_Fire
CALLV
pop
line 1191
;1191:		break;
ADDRGP4 $339
JUMPV
LABELV $350
line 1193
;1192:	case WP_GRAPPLING_HOOK:
;1193:		Weapon_GrapplingHook_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_GrapplingHook_Fire
CALLV
pop
line 1194
;1194:		break;
ADDRGP4 $339
JUMPV
LABELV $351
line 1196
;1195:	case WP_TURRET:
;1196:		Weapon_fire_turret( ent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Weapon_fire_turret
CALLV
pop
line 1197
;1197:		break;	
line 1211
;1198:#ifdef MISSIONPACK
;1199:	case WP_NAILGUN:
;1200:		Weapon_Nailgun_Fire( ent );
;1201:		break;
;1202:	case WP_PROX_LAUNCHER:
;1203:		weapon_proxlauncher_fire( ent );
;1204:		break;
;1205:	case WP_CHAINGUN:
;1206:		Bullet_Fire( ent, CHAINGUN_SPREAD, MACHINEGUN_DAMAGE );
;1207:		break;
;1208:#endif
;1209:	default:
;1210:// FIXME		G_Error( "Bad ent->s.weapon" );
;1211:		break;
LABELV $339
line 1213
;1212:	}
;1213:}
LABELV $332
endproc FireWeapon 16 24
export FireWeapon2
proc FireWeapon2 12 20
line 1223
;1214:
;1215:
;1216:/* 
;1217:=============== 
;1218:FireWeapon2 
;1219:Shafe - Trep - Alt Fire FireWeapon2
;1220:Right now this just shoots rockets...
;1221:=============== 
;1222:*/ 
;1223:void FireWeapon2( gentity_t *ent ) { 
line 1224
;1224: if (ent->client->ps.powerups[PW_QUAD] ) { 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $355
line 1225
;1225:  s_quadFactor = g_quadfactor.value; 
ADDRGP4 s_quadFactor
ADDRGP4 g_quadfactor+8
INDIRF4
ASGNF4
line 1226
;1226: } else { 
ADDRGP4 $356
JUMPV
LABELV $355
line 1227
;1227:  s_quadFactor = 1; 
ADDRGP4 s_quadFactor
CNSTF4 1065353216
ASGNF4
line 1228
;1228: } 
LABELV $356
line 1231
;1229:
;1230: // track shots taken for accuracy tracking.  Grapple is not a weapon and gauntet is just not tracked 
;1231: if( ent->s.weapon != WP_GRAPPLING_HOOK && ent->s.weapon != WP_GAUNTLET ) { 
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
EQI4 $358
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $358
line 1234
;1232:   //ent->client->ps.persistant[PERS_ACCURACY_SHOTS]++;  // This doesnt exist?
;1233:	// ent->client->accuracy_shots++;
;1234: } 
LABELV $358
line 1237
;1235:
;1236: // set aiming directions 
;1237: AngleVectors (ent->client->ps.viewangles, forward, right, up); 
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
line 1239
;1238:
;1239: CalcMuzzlePoint ( ent, forward, right, up, muzzle ); 
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
line 1242
;1240:
;1241: // fire the specific weapon 
;1242: switch( ent->s.weapon ) { 
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
LTI4 $361
ADDRLP4 4
INDIRI4
CNSTI4 11
GTI4 $361
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $374-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $374
address $363
address $366
address $361
address $367
address $368
address $364
address $361
address $369
address $371
address $372
address $373
code
LABELV $363
line 1244
;1243: case WP_GAUNTLET: 
;1244:	Weapon_Gauntlet( ent ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Gauntlet
CALLV
pop
line 1245
;1245:	break; 
ADDRGP4 $361
JUMPV
LABELV $364
line 1247
;1246: case WP_LIGHTNING: 
;1247:	Weapon_fire_flame( ent, qtrue);  // Shafe - Trep - Flame Thrower
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Weapon_fire_flame
CALLV
pop
line 1248
;1248:	break; 
ADDRGP4 $361
JUMPV
line 1252
;1249: case WP_SHOTGUN: 
;1250:	 //weapon_bomblauncher_fire( ent, qtrue); // Not Ready Yet
;1251:	 //weapon_supershotgun_fire( ent, qtrue );
;1252:	break; 
LABELV $366
line 1256
;1253: case WP_MACHINEGUN: 
;1254:  //Weapon_RocketLauncher_Fire( ent );
;1255: 	//Weapon_fire_turret( ent );
;1256:	 Weapon_fire_mg( ent, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Weapon_fire_mg
CALLV
pop
line 1264
;1257:	/* 
;1258:	if ( g_gametype.integer != GT_TEAM ) { 
;1259:		Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_DAMAGE ); 
;1260:	} else { 
;1261:		Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_TEAM_DAMAGE ); 
;1262:	} 
;1263:	*/
;1264:  break; 
ADDRGP4 $361
JUMPV
LABELV $367
line 1266
;1265: case WP_GRENADE_LAUNCHER: 
;1266:	weapon_altgrenadelauncher_fire( ent ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_altgrenadelauncher_fire
CALLV
pop
line 1267
;1267:	break; 
ADDRGP4 $361
JUMPV
LABELV $368
line 1269
;1268: case WP_ROCKET_LAUNCHER: 
;1269:	Weapon_RocketLauncher_AltFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_RocketLauncher_AltFire
CALLV
pop
line 1270
;1270:	break; 
ADDRGP4 $361
JUMPV
LABELV $369
line 1272
;1271: case WP_PLASMAGUN: 
;1272:	weapon_pdlauncher_fire( ent); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_pdlauncher_fire
CALLV
pop
line 1273
;1273:	break; 
ADDRGP4 $361
JUMPV
line 1276
;1274: case WP_RAILGUN: 
;1275:	// This is just zoom
;1276:	break; 
LABELV $371
line 1278
;1277: case WP_BFG: 
;1278:	BFG_Fire( ent, qtrue); 
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BFG_Fire
CALLV
pop
line 1279
;1279:	break; 
ADDRGP4 $361
JUMPV
LABELV $372
line 1281
;1280: case WP_GRAPPLING_HOOK: 
;1281:	Weapon_GrapplingHook_Fire( ent ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_GrapplingHook_Fire
CALLV
pop
line 1282
;1282:	break;
ADDRGP4 $361
JUMPV
LABELV $373
line 1284
;1283: case WP_TURRET:
;1284:	Weapon_fire_turret( ent, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Weapon_fire_turret
CALLV
pop
line 1285
;1285:	break;	
line 1288
;1286: default: 
;1287:// FIXME  G_Error( "Bad ent->s.weapon" ); 
;1288:  break; 
LABELV $361
line 1290
;1289: } 
;1290:}
LABELV $354
endproc FireWeapon2 12 20
lit
align 4
LABELV $377
byte 4 3246391296
byte 4 3246391296
byte 4 0
align 4
LABELV $378
byte 4 1098907648
byte 4 1098907648
byte 4 1098907648
export CanBuildHere
code
proc CanBuildHere 136 28
line 1561
;1291:
;1292:
;1293:#ifdef MISSIONPACK
;1294:
;1295:/*
;1296:===============
;1297:KamikazeRadiusDamage
;1298:===============
;1299:*/
;1300:static void KamikazeRadiusDamage( vec3_t origin, gentity_t *attacker, float damage, float radius ) {
;1301:	float		dist;
;1302:	gentity_t	*ent;
;1303:	int			entityList[MAX_GENTITIES];
;1304:	int			numListedEntities;
;1305:	vec3_t		mins, maxs;
;1306:	vec3_t		v;
;1307:	vec3_t		dir;
;1308:	int			i, e;
;1309:
;1310:	if ( radius < 1 ) {
;1311:		radius = 1;
;1312:	}
;1313:
;1314:	for ( i = 0 ; i < 3 ; i++ ) {
;1315:		mins[i] = origin[i] - radius;
;1316:		maxs[i] = origin[i] + radius;
;1317:	}
;1318:
;1319:	numListedEntities = trap_EntitiesInBox( mins, maxs, entityList, MAX_GENTITIES );
;1320:
;1321:	for ( e = 0 ; e < numListedEntities ; e++ ) {
;1322:		ent = &g_entities[entityList[ e ]];
;1323:
;1324:		if (!ent->takedamage) {
;1325:			continue;
;1326:		}
;1327:
;1328:		// dont hit things we have already hit
;1329:		if( ent->kamikazeTime > level.time ) {
;1330:			continue;
;1331:		}
;1332:
;1333:		// find the distance from the edge of the bounding box
;1334:		for ( i = 0 ; i < 3 ; i++ ) {
;1335:			if ( origin[i] < ent->r.absmin[i] ) {
;1336:				v[i] = ent->r.absmin[i] - origin[i];
;1337:			} else if ( origin[i] > ent->r.absmax[i] ) {
;1338:				v[i] = origin[i] - ent->r.absmax[i];
;1339:			} else {
;1340:				v[i] = 0;
;1341:			}
;1342:		}
;1343:
;1344:		dist = VectorLength( v );
;1345:		if ( dist >= radius ) {
;1346:			continue;
;1347:		}
;1348:
;1349://		if( CanDamage (ent, origin) ) {
;1350:			VectorSubtract (ent->r.currentOrigin, origin, dir);
;1351:			// push the center of mass higher than the origin so players
;1352:			// get knocked into the air more
;1353:			dir[2] += 24;
;1354:			G_Damage( ent, NULL, attacker, dir, origin, damage, DAMAGE_RADIUS|DAMAGE_NO_TEAM_PROTECTION, MOD_KAMIKAZE );
;1355:			ent->kamikazeTime = level.time + 3000;
;1356://		}
;1357:	}
;1358:}
;1359:
;1360:/*
;1361:===============
;1362:KamikazeShockWave
;1363:===============
;1364:*/
;1365:static void KamikazeShockWave( vec3_t origin, gentity_t *attacker, float damage, float push, float radius ) {
;1366:	float		dist;
;1367:	gentity_t	*ent;
;1368:	int			entityList[MAX_GENTITIES];
;1369:	int			numListedEntities;
;1370:	vec3_t		mins, maxs;
;1371:	vec3_t		v;
;1372:	vec3_t		dir;
;1373:	int			i, e;
;1374:
;1375:	if ( radius < 1 )
;1376:		radius = 1;
;1377:
;1378:	for ( i = 0 ; i < 3 ; i++ ) {
;1379:		mins[i] = origin[i] - radius;
;1380:		maxs[i] = origin[i] + radius;
;1381:	}
;1382:
;1383:	numListedEntities = trap_EntitiesInBox( mins, maxs, entityList, MAX_GENTITIES );
;1384:
;1385:	for ( e = 0 ; e < numListedEntities ; e++ ) {
;1386:		ent = &g_entities[entityList[ e ]];
;1387:
;1388:		// dont hit things we have already hit
;1389:		if( ent->kamikazeShockTime > level.time ) {
;1390:			continue;
;1391:		}
;1392:
;1393:		// find the distance from the edge of the bounding box
;1394:		for ( i = 0 ; i < 3 ; i++ ) {
;1395:			if ( origin[i] < ent->r.absmin[i] ) {
;1396:				v[i] = ent->r.absmin[i] - origin[i];
;1397:			} else if ( origin[i] > ent->r.absmax[i] ) {
;1398:				v[i] = origin[i] - ent->r.absmax[i];
;1399:			} else {
;1400:				v[i] = 0;
;1401:			}
;1402:		}
;1403:
;1404:		dist = VectorLength( v );
;1405:		if ( dist >= radius ) {
;1406:			continue;
;1407:		}
;1408:
;1409://		if( CanDamage (ent, origin) ) {
;1410:			VectorSubtract (ent->r.currentOrigin, origin, dir);
;1411:			dir[2] += 24;
;1412:			G_Damage( ent, NULL, attacker, dir, origin, damage, DAMAGE_RADIUS|DAMAGE_NO_TEAM_PROTECTION, MOD_KAMIKAZE );
;1413:			//
;1414:			dir[2] = 0;
;1415:			VectorNormalize(dir);
;1416:			if ( ent->client ) {
;1417:				ent->client->ps.velocity[0] = dir[0] * push;
;1418:				ent->client->ps.velocity[1] = dir[1] * push;
;1419:				ent->client->ps.velocity[2] = 100;
;1420:			}
;1421:			ent->kamikazeShockTime = level.time + 3000;
;1422://		}
;1423:	}
;1424:}
;1425:
;1426:/*
;1427:===============
;1428:KamikazeDamage
;1429:===============
;1430:*/
;1431:static void KamikazeDamage( gentity_t *self ) {
;1432:	int i;
;1433:	float t;
;1434:	gentity_t *ent;
;1435:	vec3_t newangles;
;1436:
;1437:	self->count += 100;
;1438:
;1439:	if (self->count >= KAMI_SHOCKWAVE_STARTTIME) {
;1440:		// shockwave push back
;1441:		t = self->count - KAMI_SHOCKWAVE_STARTTIME;
;1442:		KamikazeShockWave(self->s.pos.trBase, self->activator, 25, 400,	(int) (float) t * KAMI_SHOCKWAVE_MAXRADIUS / (KAMI_SHOCKWAVE_ENDTIME - KAMI_SHOCKWAVE_STARTTIME) );
;1443:	}
;1444:	//
;1445:	if (self->count >= KAMI_EXPLODE_STARTTIME) {
;1446:		// do our damage
;1447:		t = self->count - KAMI_EXPLODE_STARTTIME;
;1448:		KamikazeRadiusDamage( self->s.pos.trBase, self->activator, 400,	(int) (float) t * KAMI_BOOMSPHERE_MAXRADIUS / (KAMI_IMPLODE_STARTTIME - KAMI_EXPLODE_STARTTIME) );
;1449:	}
;1450:
;1451:	// either cycle or kill self
;1452:	if( self->count >= KAMI_SHOCKWAVE_ENDTIME ) {
;1453:		G_FreeEntity( self );
;1454:		return;
;1455:	}
;1456:	self->nextthink = level.time + 100;
;1457:
;1458:	// add earth quake effect
;1459:	newangles[0] = crandom() * 2;
;1460:	newangles[1] = crandom() * 2;
;1461:	newangles[2] = 0;
;1462:	for (i = 0; i < MAX_CLIENTS; i++)
;1463:	{
;1464:		ent = &g_entities[i];
;1465:		if (!ent->inuse)
;1466:			continue;
;1467:		if (!ent->client)
;1468:			continue;
;1469:
;1470:		if (ent->client->ps.groundEntityNum != ENTITYNUM_NONE) {
;1471:			ent->client->ps.velocity[0] += crandom() * 120;
;1472:			ent->client->ps.velocity[1] += crandom() * 120;
;1473:			ent->client->ps.velocity[2] = 30 + random() * 25;
;1474:		}
;1475:
;1476:		ent->client->ps.delta_angles[0] += ANGLE2SHORT(newangles[0] - self->movedir[0]);
;1477:		ent->client->ps.delta_angles[1] += ANGLE2SHORT(newangles[1] - self->movedir[1]);
;1478:		ent->client->ps.delta_angles[2] += ANGLE2SHORT(newangles[2] - self->movedir[2]);
;1479:	}
;1480:	VectorCopy(newangles, self->movedir);
;1481:}
;1482:
;1483:/*
;1484:===============
;1485:G_StartKamikaze
;1486:===============
;1487:*/
;1488:void G_StartKamikaze( gentity_t *ent ) {
;1489:	gentity_t	*explosion;
;1490:	gentity_t	*te;
;1491:	vec3_t		snapped;
;1492:
;1493:	// start up the explosion logic
;1494:	explosion = G_Spawn();
;1495:
;1496:	explosion->s.eType = ET_EVENTS + EV_KAMIKAZE;
;1497:	explosion->eventTime = level.time;
;1498:
;1499:	if ( ent->client ) {
;1500:		VectorCopy( ent->s.pos.trBase, snapped );
;1501:	}
;1502:	else {
;1503:		VectorCopy( ent->activator->s.pos.trBase, snapped );
;1504:	}
;1505:	SnapVector( snapped );		// save network bandwidth
;1506:	G_SetOrigin( explosion, snapped );
;1507:
;1508:	explosion->classname = "kamikaze";
;1509:	explosion->s.pos.trType = TR_STATIONARY;
;1510:
;1511:	explosion->kamikazeTime = level.time;
;1512:
;1513:	explosion->think = KamikazeDamage;
;1514:	explosion->nextthink = level.time + 100;
;1515:	explosion->count = 0;
;1516:	VectorClear(explosion->movedir);
;1517:
;1518:	trap_LinkEntity( explosion );
;1519:
;1520:	if (ent->client) {
;1521:		//
;1522:		explosion->activator = ent;
;1523:		//
;1524:		ent->s.eFlags &= ~EF_KAMIKAZE;
;1525:		// nuke the guy that used it
;1526:		G_Damage( ent, ent, ent, NULL, NULL, 100000, DAMAGE_NO_PROTECTION, MOD_KAMIKAZE );
;1527:	}
;1528:	else {
;1529:		if ( !strcmp(ent->activator->classname, "bodyque") ) {
;1530:			explosion->activator = &g_entities[ent->activator->r.ownerNum];
;1531:		}
;1532:		else {
;1533:			explosion->activator = ent->activator;
;1534:		}
;1535:	}
;1536:
;1537:	// play global sound at all clients
;1538:	te = G_TempEntity(snapped, EV_GLOBAL_TEAM_SOUND );
;1539:	te->r.svFlags |= SVF_BROADCAST;
;1540:	te->s.eventParm = GTS_KAMIKAZE;
;1541:}
;1542:#endif
;1543:
;1544:
;1545:/*
;1546:====================================================
;1547:MORE BUILDABLE STUFF
;1548:Done here for those night forward, right, and up values 
;1549:=================
;1550:*/
;1551:#define PLACEDIST			64
;1552:
;1553:/*
;1554:=================
;1555:CanBuildHere
;1556:
;1557:This checks to see that we can build this thing
;1558:=================
;1559:*/
;1560:qboolean CanBuildHere(gentity_t *playerent)
;1561:{
line 1563
;1562:	trace_t		tr;
;1563:	vec3_t		fwd, pos, dest, mins = {-16,-16, 0}, maxs = {16,16,16};
ADDRLP4 92
ADDRGP4 $377
INDIRB
ASGNB 12
ADDRLP4 104
ADDRGP4 $378
INDIRB
ASGNB 12
line 1568
;1564:
;1565:	
;1566:
;1567:	// can we place this in front of us?
;1568:	AngleVectors (playerent->client->ps.viewangles, fwd, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRLP4 12
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
ADDRGP4 AngleVectors
CALLV
pop
line 1569
;1569:	fwd[2] = 0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 1570
;1570:	VectorMA(playerent->client->ps.origin, PLACEDIST, fwd, dest);
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ASGNP4
ADDRLP4 124
CNSTF4 1115684864
ASGNF4
ADDRLP4 0
ADDRLP4 120
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 124
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 120
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 124
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1571
;1571:	trap_Trace (&tr, playerent->client->ps.origin, mins, maxs, dest, playerent->s.number, MASK_SHOT );
ADDRLP4 24
ARGP4
ADDRLP4 128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 128
INDIRP4
INDIRI4
ARGI4
CNSTI4 100664321
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1572
;1572:	if (tr.fraction > 0.9)
ADDRLP4 24+8
INDIRF4
CNSTF4 1063675494
LEF4 $384
line 1573
;1573:	{//room in front
line 1574
;1574:		VectorCopy(tr.endpos, pos);
ADDRLP4 80
ADDRLP4 24+12
INDIRB
ASGNB 12
line 1576
;1575:		// drop to floor
;1576:		VectorSet( dest, pos[0], pos[1], pos[2] - 4096 );
ADDRLP4 0
ADDRLP4 80
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 80+4
INDIRF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 80+8
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 1577
;1577:		trap_Trace( &tr, pos, mins, maxs, dest, playerent->s.number, MASK_SOLID );
ADDRLP4 24
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 0
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
line 1578
;1578:		if ( !tr.startsolid && !tr.allsolid )
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRLP4 24+4
INDIRI4
ADDRLP4 132
INDIRI4
NEI4 $392
ADDRLP4 24
INDIRI4
ADDRLP4 132
INDIRI4
NEI4 $392
line 1579
;1579:		{	
line 1580
;1580:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $376
JUMPV
LABELV $392
line 1582
;1581:		}
;1582:	}
LABELV $384
line 1584
;1583:	// no room
;1584:	return qfalse;
CNSTI4 0
RETI4
LABELV $376
endproc CanBuildHere 136 28
lit
align 4
LABELV $396
byte 4 0
byte 4 0
byte 4 0
export BuildableSpawn
code
proc BuildableSpawn 280 28
line 1598
;1585:}
;1586:
;1587:
;1588:
;1589:
;1590:/*
;1591:=================
;1592:BuildableSpawn
;1593:
;1594:This checks puts it in front, drops it to the ground and angles it correctly
;1595:=================
;1596:*/
;1597:void BuildableSpawn( gentity_t *base )
;1598:{ // Done here for those night forward, right, and up values -Vincent	
line 1600
;1599:vec3_t		start, dir, angles; // Part 1 stuff
;1600:vec3_t		origin, slope, nvf, ovf, ovr, new_angles = {0, 0, 0 }; // Part 2
ADDRLP4 116
ADDRGP4 $396
INDIRB
ASGNB 12
line 1604
;1601:float		pitch, mod, dot; // Part 2
;1602:trace_t		tr1, tr2; // Part 2
;1603:
;1604:if( !base || !base->parent || !base->parent->client )
ADDRLP4 232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 236
CNSTU4 0
ASGNU4
ADDRLP4 232
INDIRP4
CVPU4 4
ADDRLP4 236
INDIRU4
EQU4 $400
ADDRLP4 240
ADDRLP4 232
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
ASGNP4
ADDRLP4 240
INDIRP4
CVPU4 4
ADDRLP4 236
INDIRU4
EQU4 $400
ADDRLP4 240
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 236
INDIRU4
NEU4 $397
LABELV $400
line 1605
;1605:	return; // Verify for both parts
ADDRGP4 $395
JUMPV
LABELV $397
line 1608
;1606:
;1607:// Part 1: Initial spawning in front of the player -Vincent
;1608:VectorCopy( base->parent->client->ps.viewangles, angles );
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 152
ADDP4
INDIRB
ASGNB 12
line 1609
;1609:angles[0] = 0; // Stay straight
ADDRLP4 92
CNSTF4 0
ASGNF4
line 1610
;1610:angles[2] = 0; // Stay straight
ADDRLP4 92+8
CNSTF4 0
ASGNF4
line 1612
;1611:
;1612:AngleVectors( angles, forward, right, up );
ADDRLP4 92
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
line 1613
;1613:CalcMuzzlePoint( base, forward, right, up, start ); // Actual start point, away from the owner
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
line 1614
;1614:VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1615
;1615:VectorMA( start, 32, forward, start ); // Go in front of the player
ADDRLP4 244
CNSTF4 1107296256
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 244
INDIRF4
ADDRGP4 forward
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 244
INDIRF4
ADDRGP4 forward+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1107296256
ADDRGP4 forward+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1618
;1616:
;1617:
;1618:G_SetOrigin( base, start ); // Start a bit in front of the player
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1619
;1619:base->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1621
;1620:	
;1621:VectorCopy( forward, dir ); // To tweak it below this...
ADDRLP4 12
ADDRGP4 forward
INDIRB
ASGNB 12
line 1622
;1622:VectorNormalize( dir );
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1623
;1623:VectorScale( dir, 300, base->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1133903872
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1133903872
ADDRLP4 12+4
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1133903872
ADDRLP4 12+8
INDIRF4
MULF4
ASGNF4
line 1624
;1624:base->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1625
;1625:vectoangles( dir, base->s.angles);
ADDRLP4 12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1626
;1626:VectorCopy( base->s.angles, base->s.apos.trBase );
ADDRLP4 248
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 248
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 248
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1627
;1627:VectorSet( base->s.apos.trDelta, 50, 0, 0 ); // Speed
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
CNSTF4 1112014848
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
CNSTF4 0
ASGNF4
line 1628
;1628:base->s.apos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1633
;1629:
;1630:
;1631:// Part 2: Put it on the ground and match it to slopes -Vincent
;1632:
;1633:VectorCopy( base->r.currentOrigin, origin );
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRB
ASGNB 12
line 1634
;1634:origin[2] -= 2500; // Trace it straight down
ADDRLP4 24+8
ADDRLP4 24+8
INDIRF4
CNSTF4 1159479296
SUBF4
ASGNF4
line 1637
;1635:// Trace for solids from the previous position to the new position on the ground, 
;1636:// but without getting stuck in the owner!
;1637:trap_Trace( &tr1, base->r.currentOrigin, base->r.mins, base->r.maxs, origin, 
ADDRLP4 36
ARGP4
ADDRLP4 256
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 256
INDIRP4
CNSTI4 496
ADDP4
ARGP4
ADDRLP4 256
INDIRP4
CNSTI4 444
ADDP4
ARGP4
ADDRLP4 256
INDIRP4
CNSTI4 456
ADDP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 256
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $415
ADDRLP4 252
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
INDIRI4
ASGNI4
ADDRGP4 $416
JUMPV
LABELV $415
ADDRLP4 252
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
LABELV $416
ADDRLP4 252
INDIRI4
ARGI4
CNSTI4 100664321
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1641
;1638:			base->parent ? base->parent->s.number : base->s.number, MASK_SHOT );
;1639:
;1640:
;1641:VectorCopy( base->r.currentOrigin, origin ); // Keep the old value for lava checking
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRB
ASGNB 12
line 1642
;1642:G_SetOrigin( base, tr1.endpos );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36+12
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1643
;1643:VectorCopy( base->r.currentOrigin, base->s.origin ); // Set it's new origin
ADDRLP4 260
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 260
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 260
INDIRP4
CNSTI4 496
ADDP4
INDIRB
ASGNB 12
line 1646
;1644:
;1645:
;1646:if( tr1.fraction < 1.0 && ( &tr1.plane ) )
ADDRLP4 36+8
INDIRF4
CNSTF4 1065353216
GEF4 $418
ADDRLP4 36+24
CVPU4 4
CNSTU4 0
EQU4 $418
line 1647
;1647:{ // Match to a slope when necessary
line 1648
;1648:VectorCopy( tr1.plane.normal, slope ); // Get the slopes' angles
ADDRLP4 220
ADDRLP4 36+24
INDIRB
ASGNB 12
line 1649
;1649:AngleVectors( base->s.angles, ovf, ovr, NULL ); // Already calculated in part 1
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 128
ARGP4
ADDRLP4 140
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1650
;1650:vectoangles( slope, new_angles );
ADDRLP4 220
ARGP4
ADDRLP4 116
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1651
;1651:pitch = new_angles[PITCH] + 90;
ADDRLP4 212
ADDRLP4 116
INDIRF4
CNSTF4 1119092736
ADDF4
ASGNF4
line 1652
;1652:new_angles[ROLL] = new_angles[PITCH] = 0;
ADDRLP4 264
CNSTF4 0
ASGNF4
ADDRLP4 116
ADDRLP4 264
INDIRF4
ASGNF4
ADDRLP4 116+8
ADDRLP4 264
INDIRF4
ASGNF4
line 1653
;1653:AngleVectors( new_angles, nvf, NULL, NULL );
ADDRLP4 116
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 268
CNSTP4 0
ASGNP4
ADDRLP4 268
INDIRP4
ARGP4
ADDRLP4 268
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1655
;1654:
;1655:mod = DotProduct( nvf, ovr );
ADDRLP4 152
ADDRLP4 104
INDIRF4
ADDRLP4 140
INDIRF4
MULF4
ADDRLP4 104+4
INDIRF4
ADDRLP4 140+4
INDIRF4
MULF4
ADDF4
ADDRLP4 104+8
INDIRF4
ADDRLP4 140+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1656
;1656:if( mod < 0 )
ADDRLP4 152
INDIRF4
CNSTF4 0
GEF4 $428
line 1657
;1657:	mod = -1;
ADDRLP4 152
CNSTF4 3212836864
ASGNF4
ADDRGP4 $429
JUMPV
LABELV $428
line 1659
;1658:else
;1659:	mod = 1;
ADDRLP4 152
CNSTF4 1065353216
ASGNF4
LABELV $429
line 1661
;1660:
;1661:dot = DotProduct( nvf, ovf );
ADDRLP4 216
ADDRLP4 104
INDIRF4
ADDRLP4 128
INDIRF4
MULF4
ADDRLP4 104+4
INDIRF4
ADDRLP4 128+4
INDIRF4
MULF4
ADDF4
ADDRLP4 104+8
INDIRF4
ADDRLP4 128+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1663
;1662:// Modify its actual angles
;1663:base->s.angles[PITCH] = dot * pitch;
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 216
INDIRF4
ADDRLP4 212
INDIRF4
MULF4
ASGNF4
line 1664
;1664:base->s.angles[ROLL] = ( ( 1-Q_fabs( dot ) ) * pitch * mod );
ADDRLP4 216
INDIRF4
ARGF4
ADDRLP4 272
ADDRGP4 Q_fabs
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
CNSTF4 1065353216
ADDRLP4 272
INDIRF4
SUBF4
ADDRLP4 212
INDIRF4
MULF4
ADDRLP4 152
INDIRF4
MULF4
ASGNF4
line 1665
;1665:VectorCopy( base->s.angles, base->s.apos.trBase );
ADDRLP4 276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 276
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 276
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1666
;1666:}
LABELV $418
line 1668
;1667:
;1668:trap_LinkEntity( base ); // Add it...
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1672
;1669:
;1670:// Trace back to its original point to see if the buildable hit any non-solid content on its way
;1671:// When it does, the buildable should be cleared!
;1672:trap_Trace( &tr2, origin, base->r.mins, base->r.maxs, base->r.currentOrigin, 
ADDRLP4 156
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 268
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 268
INDIRP4
CNSTI4 444
ADDP4
ARGP4
ADDRLP4 268
INDIRP4
CNSTI4 456
ADDP4
ARGP4
ADDRLP4 268
INDIRP4
CNSTI4 496
ADDP4
ARGP4
ADDRLP4 268
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $435
ADDRLP4 264
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
INDIRI4
ASGNI4
ADDRGP4 $436
JUMPV
LABELV $435
ADDRLP4 264
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
LABELV $436
ADDRLP4 264
INDIRI4
ARGI4
CNSTI4 25
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1675
;1673:		   	base->parent ? base->parent->s.number : base->s.number, CONTENTS_LAVA | CONTENTS_SLIME | CONTENTS_SOLID );
;1674:
;1675:if( tr2.fraction < 1.0 ) // It did go through a bad content
ADDRLP4 156+8
INDIRF4
CNSTF4 1065353216
GEF4 $437
line 1676
;1676:{
line 1677
;1677:base->s.eType = ET_GENERAL; // To go for a die in g_buildables
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 1678
;1678:}
ADDRGP4 $438
JUMPV
LABELV $437
line 1680
;1679:else
;1680:{
line 1681
;1681:base->s.eType = ET_BUILDABLE; // Initialize it
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 13
ASGNI4
line 1682
;1682:}
LABELV $438
line 1684
;1683:// The actual buildables' thinking happens in g_buildables again, after this func
;1684:}
LABELV $395
endproc BuildableSpawn 280 28
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
import fire_bomb
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
LABELV $191
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
align 1
LABELV $182
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 0
