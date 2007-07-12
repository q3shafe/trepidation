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
line 438
;435:	gentity_t		*tent;
;436:
;437:	// send shotgun blast
;438:	tent = G_TempEntity( muzzle, EV_SHOTGUN );
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
line 439
;439:	VectorScale( forward, 4096, tent->s.origin2 );
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
line 440
;440:	SnapVector( tent->s.origin2 );
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
line 444
;441://unlagged - attack prediction #2
;442:	// this has to be something the client can predict now
;443:	//tent->s.eventParm = rand() & 255;		// seed for spread pattern
;444:	tent->s.eventParm = ent->client->attackTime % 256; // seed for spread pattern
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
line 446
;445://unlagged - attack prediction #2
;446:	tent->s.otherEntityNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 448
;447:
;448:	ShotgunPattern( tent->s.pos.trBase, tent->s.origin2, tent->s.eventParm, ent, alt );
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
line 449
;449:}
LABELV $170
endproc weapon_supershotgun_fire 32 20
export weapon_bomblauncher_fire
proc weapon_bomblauncher_fire 24 12
line 461
;450:
;451:
;452:/*
;453:======================================================================
;454:
;455:BOMB
;456:
;457:======================================================================
;458:*/
;459:
;460:// Shafe - Bomb
;461:void weapon_bomblauncher_fire (gentity_t	*ent) {
line 463
;462:	gentity_t	*m;
;463:	gentity_t	*grenades = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 467
;464:	 
;465:
;466:
;467:if (ent->client->bombfired == qfalse) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
CNSTI4 0
NEI4 $178
line 469
;468:		// extra vertical velocity
;469:		forward[2] += 0.2f;
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
line 470
;470:		VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 472
;471: 
;472:		m = fire_bomb (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 12
ADDRGP4 fire_bomb
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 473
;473:		m->damage *= s_quadFactor;
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
line 474
;474:		m->splashDamage *= s_quadFactor;
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
line 475
;475:		ent->client->bombfired = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2704
ADDP4
CNSTI4 1
ASGNI4
line 476
;476:		return;
ADDRGP4 $173
JUMPV
LABELV $177
line 480
;477:	}
;478:
;479: while ((grenades = G_Find (grenades, FOFS(classname), "bomb")) != NULL)
;480: {
line 481
;481:	if(grenades->r.ownerNum == ent->s.clientNum)  //make sure its ours
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
NEI4 $181
line 482
;482:	{
line 483
;483:		if (ent->client->bombfired == qtrue)
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
CNSTI4 1
NEI4 $183
line 484
;484:		{
line 485
;485:			G_ExplodeBomb(grenades);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_ExplodeBomb
CALLV
pop
line 486
;486:			ent->client->bombfired = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2704
ADDP4
CNSTI4 0
ASGNI4
line 488
;487:			
;488:		}
LABELV $183
line 490
;489:
;490:	}
LABELV $181
line 491
;491: }
LABELV $178
line 479
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 532
ARGI4
ADDRGP4 $180
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
NEU4 $177
line 495
;492:
;493: 	
;494:
;495:} 
LABELV $173
endproc weapon_bomblauncher_fire 24 12
export weapon_pdlauncher_fire
proc weapon_pdlauncher_fire 28 12
line 507
;496:
;497:
;498:/*
;499:======================================================================
;500:
;501:PDG
;502:
;503:======================================================================
;504:*/
;505:
;506:// Shafe - PDG
;507:void weapon_pdlauncher_fire (gentity_t	*ent) {
line 509
;508:	gentity_t	*m;
;509:	gentity_t	*grenades = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $187
JUMPV
LABELV $186
line 512
;510:	 
;511: while ((grenades = G_Find (grenades, FOFS(classname), "pdgrenade")) != NULL)
;512: {
line 513
;513:	if(grenades->r.ownerNum == ent->s.clientNum)  //make sure its ours
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
NEI4 $190
line 514
;514:	{
line 515
;515:		ent->istelepoint = 0; // client cannot teleport
ADDRFP4 0
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 0
ASGNI4
line 516
;516:		VectorClear( ent->teleloc ); // clear the teleport location
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
line 517
;517:		grenades->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 518
;518:		grenades->nextthink = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 519
;519:	}
LABELV $190
line 520
;520: }
LABELV $187
line 511
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 532
ARGI4
ADDRGP4 $189
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
NEU4 $186
line 522
;521: // extra vertical velocity
;522: forward[2] += 0.2f;
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
line 523
;523: VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 525
;524: 
;525: m = fire_pdgrenade (ent, muzzle, forward);
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
line 526
;526: m->damage *= s_quadFactor;
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
line 527
;527: m->splashDamage *= s_quadFactor;
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
line 528
;528: ent->client->pdgfired = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2700
ADDP4
CNSTI4 1
ASGNI4
line 529
;529:} 
LABELV $185
endproc weapon_pdlauncher_fire 28 12
export weapon_grenadelauncher_fire
proc weapon_grenadelauncher_fire 20 12
line 540
;530:
;531:
;532:/*
;533:======================================================================
;534:
;535:GRENADE LAUNCHER
;536:
;537:======================================================================
;538:*/
;539:
;540:void weapon_grenadelauncher_fire (gentity_t *ent) {
line 544
;541:	gentity_t	*m;
;542:
;543:	// extra vertical velocity
;544:	forward[2] += 0.2f;
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
line 545
;545:	VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 547
;546:
;547:	m = fire_grenade (ent, muzzle, forward);
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
line 548
;548:	m->damage *= s_quadFactor;
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
line 549
;549:	m->splashDamage *= s_quadFactor;
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
line 552
;550:
;551://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;552:}
LABELV $194
endproc weapon_grenadelauncher_fire 20 12
export weapon_altgrenadelauncher_fire
proc weapon_altgrenadelauncher_fire 20 12
line 563
;553:
;554:/*
;555:======================================================================
;556:
;557:ALT GRENADE LAUNCHER 
;558:Shafe - Trep - Alternate Fire Grenade
;559:
;560:======================================================================
;561:*/
;562:
;563:void weapon_altgrenadelauncher_fire (gentity_t *ent) {
line 567
;564:	gentity_t	*m;
;565:
;566:	// extra vertical velocity
;567:	forward[2] += 0.2f;
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
line 568
;568:	VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 570
;569:
;570:	m = fire_altgrenade (ent, muzzle, forward);
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
line 571
;571:	m->damage *= s_quadFactor;
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
line 572
;572:	m->splashDamage *= s_quadFactor;
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
line 575
;573:
;574://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;575:}
LABELV $196
endproc weapon_altgrenadelauncher_fire 20 12
export Weapon_RocketLauncher_Fire
proc Weapon_RocketLauncher_Fire 16 12
line 585
;576:
;577:/*
;578:======================================================================
;579:
;580:ROCKET
;581:
;582:======================================================================
;583:*/
;584:
;585:void Weapon_RocketLauncher_Fire (gentity_t *ent) {
line 588
;586:	gentity_t	*m;
;587:
;588:	m = fire_rocket (ent, muzzle, forward);
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
line 589
;589:	m->damage *= s_quadFactor;
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
line 590
;590:	m->splashDamage *= s_quadFactor;
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
line 593
;591:
;592://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;593:}
LABELV $198
endproc Weapon_RocketLauncher_Fire 16 12
export Weapon_RocketLauncher_AltFire
proc Weapon_RocketLauncher_AltFire 16 12
line 596
;594:
;595:// Shafe - Trep Alt Rocket Launcher
;596:void Weapon_RocketLauncher_AltFire (gentity_t *ent) {
line 599
;597:	gentity_t	*m;
;598:
;599:	m = fire_alt_rocket (ent, muzzle, forward);
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
line 600
;600:	m->damage *= s_quadFactor;
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
line 601
;601:	m->splashDamage *= s_quadFactor;
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
line 604
;602:
;603://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;604:}
LABELV $199
endproc Weapon_RocketLauncher_AltFire 16 12
export Weapon_Plasmagun_Fire
proc Weapon_Plasmagun_Fire 24 12
line 615
;605:
;606:
;607:/*
;608:======================================================================
;609:
;610:PLASMA GUN
;611:
;612:======================================================================
;613:*/
;614:
;615:void Weapon_Plasmagun_Fire (gentity_t *ent) {
line 621
;616:	gentity_t	*m;
;617:	int		i;
;618:	
;619:	// Shafe - Add Some Randomness so that 
;620:	// it doesnt fire straight every time
;621:	i = irandom(0,10);
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
line 622
;622:	if (i > 5)
ADDRLP4 4
INDIRI4
CNSTI4 5
LEI4 $201
line 623
;623:	{
line 624
;624:		forward[2] += 0.2f;
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
line 625
;625:		VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 626
;626:	}
LABELV $201
line 628
;627:
;628:	m = fire_plasma (ent, muzzle, forward);
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
line 629
;629:	m->damage *= s_quadFactor;
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
line 630
;630:	m->splashDamage *= s_quadFactor;
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
line 633
;631:
;632://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;633:}
LABELV $200
endproc Weapon_Plasmagun_Fire 24 12
export weapon_railgun_fire
proc weapon_railgun_fire 172 32
line 650
;634:
;635:/*
;636:======================================================================
;637:
;638:RAILGUN
;639:
;640:======================================================================
;641:*/
;642:
;643:
;644:/*
;645:=================
;646:weapon_railgun_fire
;647:=================
;648:*/
;649:#define	MAX_RAIL_HITS	4
;650:void weapon_railgun_fire (gentity_t *ent) {
line 666
;651:	vec3_t		end;
;652:#ifdef MISSIONPACK
;653:	vec3_t impactpoint, bouncedir;
;654:#endif
;655:	trace_t		trace;
;656:	gentity_t	*tent;
;657:	gentity_t	*traceEnt;
;658:	int			damage;
;659:	int			i;
;660:	int			hits;
;661:	int			unlinked;
;662:	int			passent;
;663:	gentity_t	*unlinkedEntities[MAX_RAIL_HITS];
;664:
;665:	// Shafe - Trep - Instagib
;666:	if (g_instagib.integer == 0)
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 0
NEI4 $205
line 667
;667:	{
line 668
;668:		damage = 100 * s_quadFactor;
ADDRLP4 104
CNSTF4 1120403456
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 669
;669:	} else {
ADDRGP4 $206
JUMPV
LABELV $205
line 670
;670:		damage = 1000 * s_quadFactor;
ADDRLP4 104
CNSTF4 1148846080
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 671
;671:	}
LABELV $206
line 674
;672:	/////////////////////////////////////
;673:
;674:	VectorMA (muzzle, 8192, forward, end);
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
line 678
;675:
;676://unlagged - backward reconciliation #2
;677:	// backward-reconcile the other clients
;678:	G_DoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 682
;679://unlagged - backward reconciliation #2
;680:
;681:	// trace only against the solids, so the railgun will go through people
;682:	unlinked = 0;
ADDRLP4 60
CNSTI4 0
ASGNI4
line 683
;683:	hits = 0;
ADDRLP4 108
CNSTI4 0
ASGNI4
line 684
;684:	passent = ent->s.number;
ADDRLP4 100
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
LABELV $214
line 685
;685:	do {
line 686
;686:		trap_Trace (&trace, muzzle, NULL, NULL, end, passent, MASK_SHOT );
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
line 687
;687:		if ( trace.entityNum >= ENTITYNUM_MAX_NORMAL ) {
ADDRLP4 4+52
INDIRI4
CNSTI4 1022
LTI4 $217
line 688
;688:			break;
ADDRGP4 $216
JUMPV
LABELV $217
line 690
;689:		}
;690:		traceEnt = &g_entities[ trace.entityNum ];
ADDRLP4 0
CNSTI4 924
ADDRLP4 4+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 691
;691:		if ( traceEnt->takedamage ) {
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $221
line 720
;692:#ifdef MISSIONPACK
;693:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
;694:				if ( G_InvulnerabilityEffect( traceEnt, forward, trace.endpos, impactpoint, bouncedir ) ) {
;695:					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
;696:					// snap the endpos to integers to save net bandwidth, but nudged towards the line
;697:					SnapVectorTowards( trace.endpos, muzzle );
;698:					// send railgun beam effect
;699:					tent = G_TempEntity( trace.endpos, EV_RAILTRAIL );
;700:					// set player number for custom colors on the railtrail
;701:					tent->s.clientNum = ent->s.clientNum;
;702:					VectorCopy( muzzle, tent->s.origin2 );
;703:					// move origin a bit to come closer to the drawn gun muzzle
;704:					VectorMA( tent->s.origin2, 4, right, tent->s.origin2 );
;705:					VectorMA( tent->s.origin2, -1, up, tent->s.origin2 );
;706:					tent->s.eventParm = 255;	// don't make the explosion at the end
;707:					//
;708:					VectorCopy( impactpoint, muzzle );
;709:					// the player can hit him/herself with the bounced rail
;710:					passent = ENTITYNUM_NONE;
;711:				}
;712:			}
;713:			else {
;714:				if( LogAccuracyHit( traceEnt, ent ) ) {
;715:					hits++;
;716:				}
;717:				G_Damage (traceEnt, ent, ent, forward, trace.endpos, damage, 0, MOD_RAILGUN);
;718:			}
;719:#else
;720:				if( LogAccuracyHit( traceEnt, ent ) ) {
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
EQI4 $223
line 721
;721:					hits++;
ADDRLP4 108
ADDRLP4 108
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 722
;722:				}
LABELV $223
line 723
;723:				G_Damage (traceEnt, ent, ent, forward, trace.endpos, damage, 0, MOD_RAILGUN);
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
line 725
;724:#endif
;725:		}
LABELV $221
line 726
;726:		if ( trace.contents & CONTENTS_SOLID ) {
ADDRLP4 4+48
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $226
line 727
;727:			break;		// we hit something solid enough to stop the beam
ADDRGP4 $216
JUMPV
LABELV $226
line 730
;728:		}
;729:		// unlink this entity, so the next trace will go past it
;730:		trap_UnlinkEntity( traceEnt );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 731
;731:		unlinkedEntities[unlinked] = traceEnt;
ADDRLP4 60
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 732
;732:		unlinked++;
ADDRLP4 60
ADDRLP4 60
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 733
;733:	} while ( unlinked < MAX_RAIL_HITS );
LABELV $215
ADDRLP4 60
INDIRI4
CNSTI4 4
LTI4 $214
LABELV $216
line 737
;734:
;735://unlagged - backward reconciliation #2
;736:	// put them back
;737:	G_UndoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 741
;738://unlagged - backward reconciliation #2
;739:
;740:	// link back in any entities we unlinked
;741:	for ( i = 0 ; i < unlinked ; i++ ) {
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 $232
JUMPV
LABELV $229
line 742
;742:		trap_LinkEntity( unlinkedEntities[i] );
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
line 743
;743:	}
LABELV $230
line 741
ADDRLP4 64
ADDRLP4 64
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $232
ADDRLP4 64
INDIRI4
ADDRLP4 60
INDIRI4
LTI4 $229
line 748
;744:
;745:	// the final trace endpos will be the terminal point of the rail trail
;746:
;747:	// snap the endpos to integers to save net bandwidth, but nudged towards the line
;748:	SnapVectorTowards( trace.endpos, muzzle );
ADDRLP4 4+12
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 751
;749:
;750:	// send railgun beam effect
;751:	tent = G_TempEntity( trace.endpos, EV_RAILTRAIL );
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
line 754
;752:
;753:	// set player number for custom colors on the railtrail
;754:	tent->s.clientNum = ent->s.clientNum;
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
line 756
;755:
;756:	VectorCopy( muzzle, tent->s.origin2 );
ADDRLP4 84
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 758
;757:	// move origin a bit to come closer to the drawn gun muzzle
;758:	VectorMA( tent->s.origin2, 4, right, tent->s.origin2 );
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
line 759
;759:	VectorMA( tent->s.origin2, -1, up, tent->s.origin2 );
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
line 762
;760:
;761:	// no explosion at end if SURF_NOIMPACT, but still make the trail
;762:	if ( trace.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 4+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $239
line 763
;763:		tent->s.eventParm = 255;	// don't make the explosion at the end
ADDRLP4 84
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 255
ASGNI4
line 764
;764:	} else {
ADDRGP4 $240
JUMPV
LABELV $239
line 765
;765:		tent->s.eventParm = DirToByte( trace.plane.normal );
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
line 766
;766:	}
LABELV $240
line 767
;767:	tent->s.clientNum = ent->s.clientNum;
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
line 770
;768:
;769:	// give the shooter a reward sound if they have made two railgun hits in a row
;770:	if ( hits == 0 ) {
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $243
line 772
;771:		// complete miss
;772:		ent->client->accurateCount = 0;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2640
ADDP4
CNSTI4 0
ASGNI4
line 773
;773:	} else {
ADDRGP4 $244
JUMPV
LABELV $243
line 775
;774:		// check for "impressive" reward sound
;775:		ent->client->accurateCount += hits;
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
line 776
;776:		if ( ent->client->accurateCount >= 2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2640
ADDP4
INDIRI4
CNSTI4 2
LTI4 $245
line 777
;777:			ent->client->accurateCount -= 2;
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
line 778
;778:			ent->client->ps.persistant[PERS_IMPRESSIVE_COUNT]++;
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
line 780
;779:			// add the sprite over the player's head
;780:			ent->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
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
line 781
;781:			ent->client->ps.eFlags |= EF_AWARD_IMPRESSIVE;
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
line 782
;782:			ent->client->rewardTime = level.time + REWARD_SPRITE_TIME;
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
line 783
;783:		}
LABELV $245
line 784
;784:		ent->client->accuracy_hits++;
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
line 785
;785:	}
LABELV $244
line 787
;786:
;787:}
LABELV $204
endproc weapon_railgun_fire 172 32
export Weapon_GrapplingHook_Fire
proc Weapon_GrapplingHook_Fire 4 20
line 799
;788:
;789:
;790:/*
;791:======================================================================
;792:
;793:GRAPPLING HOOK
;794:
;795:======================================================================
;796:*/
;797:
;798:void Weapon_GrapplingHook_Fire (gentity_t *ent)
;799:{
line 801
;800:	// Shafe - Trep  - Offhand Grappling Hook
;801:	AngleVectors (ent->client->ps.viewangles, forward, right, up);
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
line 802
;802:	CalcMuzzlePoint ( ent, forward, right, up, muzzle );
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
line 805
;803:	// End Shafe
;804:	
;805:	if (!ent->client->fireHeld && !ent->client->hook)
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
NEI4 $249
ADDRLP4 0
INDIRP4
CNSTI4 2692
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $249
line 806
;806:		fire_grapple (ent, muzzle, forward);
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
LABELV $249
line 808
;807:
;808:	ent->client->fireHeld = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 1
ASGNI4
line 809
;809:}
LABELV $248
endproc Weapon_GrapplingHook_Fire 4 20
export Weapon_HookFree
proc Weapon_HookFree 4 4
line 813
;810:
;811:
;812:void Weapon_HookFree (gentity_t *ent)
;813:{
line 814
;814:	ent->parent->client->hook = NULL;
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
line 815
;815:	ent->parent->client->ps.pm_flags &= ~PMF_GRAPPLE_PULL;
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
line 816
;816:	G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 817
;817:}
LABELV $251
endproc Weapon_HookFree 4 4
export Weapon_HookThink
proc Weapon_HookThink 36 8
line 820
;818:
;819:void Weapon_HookThink (gentity_t *ent)
;820:{
line 821
;821:	if (ent->enemy) {
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $253
line 824
;822:		vec3_t v, oldorigin;
;823:
;824:		VectorCopy(ent->r.currentOrigin, oldorigin);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRB
ASGNB 12
line 825
;825:		v[0] = ent->enemy->r.currentOrigin[0] + (ent->enemy->r.mins[0] + ent->enemy->r.maxs[0]) * 0.5;
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
line 826
;826:		v[1] = ent->enemy->r.currentOrigin[1] + (ent->enemy->r.mins[1] + ent->enemy->r.maxs[1]) * 0.5;
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
line 827
;827:		v[2] = ent->enemy->r.currentOrigin[2] + (ent->enemy->r.mins[2] + ent->enemy->r.maxs[2]) * 0.5;
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
line 828
;828:		SnapVectorTowards( v, oldorigin );	// save net bandwidth
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 830
;829:
;830:		G_SetOrigin( ent, v );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 831
;831:	}
LABELV $253
line 833
;832:
;833:	VectorCopy( ent->r.currentOrigin, ent->parent->client->ps.grapplePoint);
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
line 834
;834:}
LABELV $252
endproc Weapon_HookThink 36 8
lit
align 4
LABELV $258
byte 4 0
byte 4 0
byte 4 0
export Weapon_fire_turret
code
proc Weapon_fire_turret 76 20
line 841
;835:
;836:/*
;837:=======================================================================
;838:TURRET - Not Used but this would be good for a vehichle
;839:=======================================================================
;840:*/
;841:void Weapon_fire_turret (gentity_t *ent, qboolean alt ) {
line 843
;842:	gentity_t *m;
;843:	float newforward[] = {0,0,0};
ADDRLP4 0
ADDRGP4 $258
INDIRB
ASGNB 12
line 848
;844:
;845:
;846:	// All of this is useless.. for the turrets, but lets tweak it for use as a shotgun variant
;847:
;848:	m = fire_turret(ent, muzzle, forward, alt);
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
line 849
;849:	m->damage *= s_quadFactor;
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
line 850
;850:	m->splashDamage *= s_quadFactor;
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
line 852
;851:
;852:	if (alt == qtrue) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $259
line 856
;853:		
;854:		
;855:		//Second bullet goes to the right
;856:		AngleVectors( ent->client->ps.viewangles, forward, right, up );
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
line 857
;857:		VectorCopy( forward, newforward );
ADDRLP4 0
ADDRGP4 forward
INDIRB
ASGNB 12
line 858
;858:		if ( forward[0] >= 0.5 && forward[0] <= 1 ) 
ADDRLP4 28
ADDRGP4 forward
INDIRF4
ASGNF4
ADDRLP4 28
INDIRF4
CNSTF4 1056964608
LTF4 $261
ADDRLP4 28
INDIRF4
CNSTF4 1065353216
GTF4 $261
line 859
;859:		{
line 860
;860:			newforward[1] += .35f;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1051931443
ADDF4
ASGNF4
line 861
;861:		} 
ADDRGP4 $262
JUMPV
LABELV $261
line 862
;862:		else if ( forward[0] <= -0.5 && forward[0] >= -1 ) 
ADDRLP4 32
ADDRGP4 forward
INDIRF4
ASGNF4
ADDRLP4 32
INDIRF4
CNSTF4 3204448256
GTF4 $264
ADDRLP4 32
INDIRF4
CNSTF4 3212836864
LTF4 $264
line 863
;863:		{
line 864
;864:			newforward[1] += .35f;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1051931443
ADDF4
ASGNF4
line 865
;865:		} else {
ADDRGP4 $265
JUMPV
LABELV $264
line 866
;866:			newforward[0] += .35f;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1051931443
ADDF4
ASGNF4
line 867
;867:		}
LABELV $265
LABELV $262
line 869
;868:	
;869:		VectorNormalize( newforward );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 870
;870:		VectorAdd( newforward, forward, forward );
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
line 871
;871:		CalcMuzzlePoint( ent, forward, right, up, muzzle );
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
line 874
;872:	
;873:
;874:		m = fire_turret(ent, muzzle, forward, alt);
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
line 875
;875:		m->damage *= s_quadFactor;
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
line 876
;876:		m->splashDamage *= s_quadFactor;
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
line 881
;877:
;878:
;879:
;880:		//Third bullet goes to the left
;881:		AngleVectors (ent->client->ps.viewangles, forward, right, up);
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
line 882
;882:		VectorCopy( forward, newforward );
ADDRLP4 0
ADDRGP4 forward
INDIRB
ASGNB 12
line 883
;883:		if ( forward[0] >= 0.5 && forward[0] <= 1 ) {
ADDRLP4 52
ADDRGP4 forward
INDIRF4
ASGNF4
ADDRLP4 52
INDIRF4
CNSTF4 1056964608
LTF4 $273
ADDRLP4 52
INDIRF4
CNSTF4 1065353216
GTF4 $273
line 884
;884:		newforward[1] -= .35f;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1051931443
SUBF4
ASGNF4
line 885
;885:		} else if ( forward[0] <= -0.5 && forward[0] >= -1 ) {
ADDRGP4 $274
JUMPV
LABELV $273
ADDRLP4 56
ADDRGP4 forward
INDIRF4
ASGNF4
ADDRLP4 56
INDIRF4
CNSTF4 3204448256
GTF4 $276
ADDRLP4 56
INDIRF4
CNSTF4 3212836864
LTF4 $276
line 886
;886:		newforward[1] -= .35f;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1051931443
SUBF4
ASGNF4
line 887
;887:		} else {
ADDRGP4 $277
JUMPV
LABELV $276
line 888
;888:		newforward[0] -= .35f;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1051931443
SUBF4
ASGNF4
line 889
;889:		}
LABELV $277
LABELV $274
line 890
;890:		VectorNormalize( newforward );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 891
;891:		VectorAdd( newforward, forward, forward );
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
line 892
;892:		CalcMuzzlePoint ( ent, forward, right, up, muzzle );
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
line 894
;893:
;894:		m = fire_turret(ent, muzzle, forward, alt);
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
line 895
;895:		m->damage *= s_quadFactor;
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
line 896
;896:		m->splashDamage *= s_quadFactor;
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
line 897
;897:	}
LABELV $259
line 899
;898:
;899:}
LABELV $257
endproc Weapon_fire_turret 76 20
export Weapon_LightningFire
proc Weapon_LightningFire 120 32
line 909
;900:
;901:/*
;902:======================================================================
;903:
;904:LIGHTNING GUN
;905:
;906:======================================================================
;907:*/
;908:
;909:void Weapon_LightningFire( gentity_t *ent ) {
line 921
;910:	trace_t		tr;
;911:	vec3_t		end;
;912:#ifdef MISSIONPACK
;913:	vec3_t impactpoint, bouncedir;
;914:#endif
;915:	gentity_t	*traceEnt, *tent;
;916:	int			damage, i, passent;
;917:
;918://unlagged - server options
;919:	// this is configurable now
;920://	damage = 8 * s_quadFactor;
;921:	damage = g_lightningDamage.integer * s_quadFactor;
ADDRLP4 84
ADDRGP4 g_lightningDamage+12
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 924
;922://unlagged - server options
;923:
;924:	passent = ent->s.number;
ADDRLP4 80
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 925
;925:	for (i = 0; i < 10; i++) {
ADDRLP4 76
CNSTI4 0
ASGNI4
LABELV $287
line 926
;926:		VectorMA( muzzle, LIGHTNING_RANGE, forward, end );
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
line 930
;927:
;928://unlagged - backward reconciliation #2
;929:	// backward-reconcile the other clients
;930:	G_DoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 933
;931://unlagged - backward reconciliation #2
;932:
;933:		trap_Trace (&tr, muzzle, NULL, NULL, end, passent, MASK_SHOT);
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
line 937
;934:
;935://unlagged - backward reconciliation #2
;936:	// put them back
;937:	G_UndoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 952
;938://unlagged - backward reconciliation #2
;939:
;940:#ifdef MISSIONPACK
;941:		// if not the first trace (the lightning bounced of an invulnerability sphere)
;942:		if (i) {
;943:			// add bounced off lightning bolt temp entity
;944:			// the first lightning bolt is a cgame only visual
;945:			//
;946:			tent = G_TempEntity( muzzle, EV_LIGHTNINGBOLT );
;947:			VectorCopy( tr.endpos, end );
;948:			SnapVector( end );
;949:			VectorCopy( end, tent->s.origin2 );
;950:		}
;951:#endif
;952:		if ( tr.entityNum == ENTITYNUM_NONE ) {
ADDRLP4 0+52
INDIRI4
CNSTI4 1023
NEI4 $297
line 953
;953:			return;
ADDRGP4 $285
JUMPV
LABELV $297
line 956
;954:		}
;955:
;956:		traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 56
CNSTI4 924
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 958
;957:
;958:		if ( traceEnt->takedamage) {
ADDRLP4 56
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $301
line 980
;959:#ifdef MISSIONPACK
;960:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
;961:				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
;962:					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
;963:					VectorCopy( impactpoint, muzzle );
;964:					VectorSubtract( end, impactpoint, forward );
;965:					VectorNormalize(forward);
;966:					// the player can hit him/herself with the bounced lightning
;967:					passent = ENTITYNUM_NONE;
;968:				}
;969:				else {
;970:					VectorCopy( tr.endpos, muzzle );
;971:					passent = traceEnt->s.number;
;972:				}
;973:				continue;
;974:			}
;975:			else {
;976:				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
;977:					damage, 0, MOD_LIGHTNING);
;978:			}
;979:#else
;980:				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
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
line 983
;981:					damage, 0, MOD_LIGHTNING);
;982:#endif
;983:		}
LABELV $301
line 985
;984:
;985:		if ( traceEnt->takedamage && traceEnt->client ) {
ADDRLP4 56
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $304
ADDRLP4 56
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $304
line 986
;986:			tent = G_TempEntity( tr.endpos, EV_MISSILE_HIT );
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
line 987
;987:			tent->s.otherEntityNum = traceEnt->s.number;
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 56
INDIRP4
INDIRI4
ASGNI4
line 988
;988:			tent->s.eventParm = DirToByte( tr.plane.normal );
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
line 989
;989:			tent->s.weapon = ent->s.weapon;
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
line 990
;990:			if( LogAccuracyHit( traceEnt, ent ) ) {
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
EQI4 $289
line 991
;991:				ent->client->accuracy_hits++;
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
line 992
;992:			}
line 993
;993:		} else if ( !( tr.surfaceFlags & SURF_NOIMPACT ) ) {
ADDRGP4 $289
JUMPV
LABELV $304
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $289
line 994
;994:			tent = G_TempEntity( tr.endpos, EV_MISSILE_MISS );
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
line 995
;995:			tent->s.eventParm = DirToByte( tr.plane.normal );
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
line 996
;996:		}
line 998
;997:
;998:		break;
ADDRGP4 $289
JUMPV
LABELV $288
line 925
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 10
LTI4 $287
LABELV $289
line 1000
;999:	}
;1000:}
LABELV $285
endproc Weapon_LightningFire 120 32
export LogAccuracyHit
proc LogAccuracyHit 4 8
line 1057
;1001:
;1002:#ifdef MISSIONPACK
;1003:/*
;1004:======================================================================
;1005:
;1006:NAILGUN
;1007:
;1008:======================================================================
;1009:*/
;1010:
;1011:void Weapon_Nailgun_Fire (gentity_t *ent) {
;1012:	gentity_t	*m;
;1013:	int			count;
;1014:
;1015:	for( count = 0; count < NUM_NAILSHOTS; count++ ) {
;1016:		m = fire_nail (ent, muzzle, forward, right, up );
;1017:		m->damage *= s_quadFactor;
;1018:		m->splashDamage *= s_quadFactor;
;1019:	}
;1020:
;1021://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;1022:}
;1023:
;1024:
;1025:/*
;1026:======================================================================
;1027:
;1028:PROXIMITY MINE LAUNCHER
;1029:
;1030:======================================================================
;1031:*/
;1032:
;1033:void weapon_proxlauncher_fire (gentity_t *ent) {
;1034:	gentity_t	*m;
;1035:
;1036:	// extra vertical velocity
;1037:	forward[2] += 0.2f;
;1038:	VectorNormalize( forward );
;1039:
;1040:	m = fire_prox (ent, muzzle, forward);
;1041:	m->damage *= s_quadFactor;
;1042:	m->splashDamage *= s_quadFactor;
;1043:
;1044://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;1045:}
;1046:
;1047:#endif
;1048:
;1049://======================================================================
;1050:
;1051:
;1052:/*
;1053:===============
;1054:LogAccuracyHit
;1055:===============
;1056:*/
;1057:qboolean LogAccuracyHit( gentity_t *target, gentity_t *attacker ) {
line 1058
;1058:	if( !target->takedamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
NEI4 $316
line 1059
;1059:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $315
JUMPV
LABELV $316
line 1062
;1060:	}
;1061:
;1062:	if ( target == attacker ) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
NEU4 $318
line 1063
;1063:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $315
JUMPV
LABELV $318
line 1066
;1064:	}
;1065:
;1066:	if( !target->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $320
line 1067
;1067:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $315
JUMPV
LABELV $320
line 1070
;1068:	}
;1069:
;1070:	if( !attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $322
line 1071
;1071:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $315
JUMPV
LABELV $322
line 1074
;1072:	}
;1073:
;1074:	if( target->client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $324
line 1075
;1075:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $315
JUMPV
LABELV $324
line 1078
;1076:	}
;1077:
;1078:	if ( OnSameTeam( target, attacker ) ) {
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
EQI4 $326
line 1079
;1079:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $315
JUMPV
LABELV $326
line 1082
;1080:	}
;1081:
;1082:	return qtrue;
CNSTI4 1
RETI4
LABELV $315
endproc LogAccuracyHit 4 8
export CalcMuzzlePoint
proc CalcMuzzlePoint 48 4
line 1093
;1083:}
;1084:
;1085:
;1086:/*
;1087:===============
;1088:CalcMuzzlePoint
;1089:
;1090:set muzzle location relative to pivoting eye
;1091:===============
;1092:*/
;1093:void CalcMuzzlePoint ( gentity_t *ent, vec3_t forward, vec3_t right, vec3_t up, vec3_t muzzlePoint ) {
line 1094
;1094:	VectorCopy( ent->s.pos.trBase, muzzlePoint );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1095
;1095:	muzzlePoint[2] += ent->client->ps.viewheight;
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
line 1096
;1096:	VectorMA( muzzlePoint, 14, forward, muzzlePoint );
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
line 1098
;1097:	// snap to integer coordinates for more efficient network bandwidth usage
;1098:	SnapVector( muzzlePoint );
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
line 1099
;1099:}
LABELV $328
endproc CalcMuzzlePoint 48 4
export CalcMuzzlePointOrigin
proc CalcMuzzlePointOrigin 48 4
line 1108
;1100:
;1101:/*
;1102:===============
;1103:CalcMuzzlePointOrigin
;1104:
;1105:set muzzle location relative to pivoting eye
;1106:===============
;1107:*/
;1108:void CalcMuzzlePointOrigin ( gentity_t *ent, vec3_t origin, vec3_t forward, vec3_t right, vec3_t up, vec3_t muzzlePoint ) {
line 1109
;1109:	VectorCopy( ent->s.pos.trBase, muzzlePoint );
ADDRFP4 20
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1110
;1110:	muzzlePoint[2] += ent->client->ps.viewheight;
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
line 1111
;1111:	VectorMA( muzzlePoint, 14, forward, muzzlePoint );
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
line 1113
;1112:	// snap to integer coordinates for more efficient network bandwidth usage
;1113:	SnapVector( muzzlePoint );
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
line 1114
;1114:}
LABELV $329
endproc CalcMuzzlePointOrigin 48 4
export FireWeapon
proc FireWeapon 16 24
line 1123
;1115:
;1116:
;1117:
;1118:/*
;1119:===============
;1120:FireWeapon
;1121:===============
;1122:*/
;1123:void FireWeapon( gentity_t *ent ) {
line 1124
;1124:	if (ent->client->ps.powerups[PW_QUAD] ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $331
line 1125
;1125:		s_quadFactor = g_quadfactor.value;
ADDRGP4 s_quadFactor
ADDRGP4 g_quadfactor+8
INDIRF4
ASGNF4
line 1126
;1126:	} else {
ADDRGP4 $332
JUMPV
LABELV $331
line 1127
;1127:		s_quadFactor = 1;
ADDRGP4 s_quadFactor
CNSTF4 1065353216
ASGNF4
line 1128
;1128:	}
LABELV $332
line 1136
;1129:#ifdef MISSIONPACK
;1130:	if( ent->client->persistantPowerup && ent->client->persistantPowerup->item && ent->client->persistantPowerup->item->giTag == PW_DOUBLER ) {
;1131:		s_quadFactor *= 2;
;1132:	}
;1133:#endif
;1134:
;1135:	// track shots taken for accuracy tracking.  Grapple is not a weapon and gauntet is just not tracked
;1136:	if( ent->s.weapon != WP_GRAPPLING_HOOK && ent->s.weapon != WP_GAUNTLET ) {
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
EQI4 $334
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $334
line 1144
;1137:#ifdef MISSIONPACK
;1138:		if( ent->s.weapon == WP_NAILGUN ) {
;1139:			ent->client->accuracy_shots += NUM_NAILSHOTS;
;1140:		} else {
;1141:			ent->client->accuracy_shots++;
;1142:		}
;1143:#else
;1144:		ent->client->accuracy_shots++;
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
line 1146
;1145:#endif
;1146:	}
LABELV $334
line 1149
;1147:
;1148:	// set aiming directions
;1149:	AngleVectors (ent->client->ps.viewangles, forward, right, up);
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
line 1151
;1150:
;1151:	CalcMuzzlePointOrigin ( ent, ent->client->oldOrigin, forward, right, up, muzzle );
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
line 1154
;1152:
;1153:	// fire the specific weapon
;1154:	switch( ent->s.weapon ) {
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
LTI4 $337
ADDRLP4 8
INDIRI4
CNSTI4 11
GTI4 $337
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $350-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $350
address $339
address $342
address $341
address $343
address $344
address $340
address $346
address $345
address $347
address $348
address $349
code
LABELV $339
line 1156
;1155:	case WP_GAUNTLET:
;1156:		Weapon_Gauntlet( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Gauntlet
CALLV
pop
line 1157
;1157:		break;
ADDRGP4 $337
JUMPV
LABELV $340
line 1160
;1158:	case WP_LIGHTNING:
;1159:		//Weapon_LightningFire( ent );
;1160:		Weapon_fire_flame(ent , qfalse );  // Shafe - Trep - Flame Thrower
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Weapon_fire_flame
CALLV
pop
line 1161
;1161:		break;
ADDRGP4 $337
JUMPV
LABELV $341
line 1163
;1162:	case WP_SHOTGUN:
;1163:		weapon_supershotgun_fire( ent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 weapon_supershotgun_fire
CALLV
pop
line 1164
;1164:		break;
ADDRGP4 $337
JUMPV
LABELV $342
line 1166
;1165:	case WP_MACHINEGUN:
;1166:		Weapon_fire_mg( ent, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Weapon_fire_mg
CALLV
pop
line 1174
;1167:		/*
;1168:		if ( g_gametype.integer != GT_TEAM ) {
;1169:			Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_DAMAGE );
;1170:		} else {
;1171:			Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_TEAM_DAMAGE );
;1172:		}
;1173:		*/
;1174:		break;
ADDRGP4 $337
JUMPV
LABELV $343
line 1176
;1175:	case WP_GRENADE_LAUNCHER:
;1176:		weapon_grenadelauncher_fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_grenadelauncher_fire
CALLV
pop
line 1177
;1177:		break;
ADDRGP4 $337
JUMPV
LABELV $344
line 1179
;1178:	case WP_ROCKET_LAUNCHER:
;1179:		Weapon_RocketLauncher_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_RocketLauncher_Fire
CALLV
pop
line 1180
;1180:		break;
ADDRGP4 $337
JUMPV
LABELV $345
line 1182
;1181:	case WP_PLASMAGUN:
;1182:		Weapon_Plasmagun_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Plasmagun_Fire
CALLV
pop
line 1183
;1183:		break;
ADDRGP4 $337
JUMPV
LABELV $346
line 1185
;1184:	case WP_RAILGUN:
;1185:		weapon_railgun_fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_railgun_fire
CALLV
pop
line 1186
;1186:		break;
ADDRGP4 $337
JUMPV
LABELV $347
line 1188
;1187:	case WP_BFG:
;1188:		BFG_Fire( ent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BFG_Fire
CALLV
pop
line 1189
;1189:		break;
ADDRGP4 $337
JUMPV
LABELV $348
line 1191
;1190:	case WP_GRAPPLING_HOOK:
;1191:		Weapon_GrapplingHook_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_GrapplingHook_Fire
CALLV
pop
line 1192
;1192:		break;
ADDRGP4 $337
JUMPV
LABELV $349
line 1194
;1193:	case WP_TURRET:
;1194:		Weapon_fire_turret( ent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Weapon_fire_turret
CALLV
pop
line 1195
;1195:		break;	
line 1209
;1196:#ifdef MISSIONPACK
;1197:	case WP_NAILGUN:
;1198:		Weapon_Nailgun_Fire( ent );
;1199:		break;
;1200:	case WP_PROX_LAUNCHER:
;1201:		weapon_proxlauncher_fire( ent );
;1202:		break;
;1203:	case WP_CHAINGUN:
;1204:		Bullet_Fire( ent, CHAINGUN_SPREAD, MACHINEGUN_DAMAGE );
;1205:		break;
;1206:#endif
;1207:	default:
;1208:// FIXME		G_Error( "Bad ent->s.weapon" );
;1209:		break;
LABELV $337
line 1211
;1210:	}
;1211:}
LABELV $330
endproc FireWeapon 16 24
export FireWeapon2
proc FireWeapon2 12 20
line 1221
;1212:
;1213:
;1214:/* 
;1215:=============== 
;1216:FireWeapon2 
;1217:Shafe - Trep - Alt Fire FireWeapon2
;1218:Right now this just shoots rockets...
;1219:=============== 
;1220:*/ 
;1221:void FireWeapon2( gentity_t *ent ) { 
line 1222
;1222: if (ent->client->ps.powerups[PW_QUAD] ) { 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $353
line 1223
;1223:  s_quadFactor = g_quadfactor.value; 
ADDRGP4 s_quadFactor
ADDRGP4 g_quadfactor+8
INDIRF4
ASGNF4
line 1224
;1224: } else { 
ADDRGP4 $354
JUMPV
LABELV $353
line 1225
;1225:  s_quadFactor = 1; 
ADDRGP4 s_quadFactor
CNSTF4 1065353216
ASGNF4
line 1226
;1226: } 
LABELV $354
line 1229
;1227:
;1228: // track shots taken for accuracy tracking.  Grapple is not a weapon and gauntet is just not tracked 
;1229: if( ent->s.weapon != WP_GRAPPLING_HOOK && ent->s.weapon != WP_GAUNTLET ) { 
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
EQI4 $356
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $356
line 1232
;1230:   //ent->client->ps.persistant[PERS_ACCURACY_SHOTS]++;  // This doesnt exist?
;1231:	// ent->client->accuracy_shots++;
;1232: } 
LABELV $356
line 1235
;1233:
;1234: // set aiming directions 
;1235: AngleVectors (ent->client->ps.viewangles, forward, right, up); 
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
line 1237
;1236:
;1237: CalcMuzzlePoint ( ent, forward, right, up, muzzle ); 
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
line 1240
;1238:
;1239: // fire the specific weapon 
;1240: switch( ent->s.weapon ) { 
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
LTI4 $359
ADDRLP4 4
INDIRI4
CNSTI4 11
GTI4 $359
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $372-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $372
address $361
address $364
address $363
address $365
address $366
address $362
address $359
address $367
address $369
address $370
address $371
code
LABELV $361
line 1242
;1241: case WP_GAUNTLET: 
;1242:	Weapon_Gauntlet( ent ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Gauntlet
CALLV
pop
line 1243
;1243:	break; 
ADDRGP4 $359
JUMPV
LABELV $362
line 1245
;1244: case WP_LIGHTNING: 
;1245:	Weapon_fire_flame( ent, qtrue);  // Shafe - Trep - Flame Thrower
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Weapon_fire_flame
CALLV
pop
line 1246
;1246:	break; 
ADDRGP4 $359
JUMPV
LABELV $363
line 1248
;1247: case WP_SHOTGUN: 
;1248:	 weapon_bomblauncher_fire( ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_bomblauncher_fire
CALLV
pop
line 1250
;1249:	 //weapon_supershotgun_fire( ent, qtrue );
;1250:	break; 
ADDRGP4 $359
JUMPV
LABELV $364
line 1254
;1251: case WP_MACHINEGUN: 
;1252:  //Weapon_RocketLauncher_Fire( ent );
;1253: 	//Weapon_fire_turret( ent );
;1254:	 Weapon_fire_mg( ent, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Weapon_fire_mg
CALLV
pop
line 1262
;1255:	/* 
;1256:	if ( g_gametype.integer != GT_TEAM ) { 
;1257:		Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_DAMAGE ); 
;1258:	} else { 
;1259:		Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_TEAM_DAMAGE ); 
;1260:	} 
;1261:	*/
;1262:  break; 
ADDRGP4 $359
JUMPV
LABELV $365
line 1264
;1263: case WP_GRENADE_LAUNCHER: 
;1264:	weapon_altgrenadelauncher_fire( ent ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_altgrenadelauncher_fire
CALLV
pop
line 1265
;1265:	break; 
ADDRGP4 $359
JUMPV
LABELV $366
line 1267
;1266: case WP_ROCKET_LAUNCHER: 
;1267:	Weapon_RocketLauncher_AltFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_RocketLauncher_AltFire
CALLV
pop
line 1268
;1268:	break; 
ADDRGP4 $359
JUMPV
LABELV $367
line 1270
;1269: case WP_PLASMAGUN: 
;1270:	weapon_pdlauncher_fire( ent); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_pdlauncher_fire
CALLV
pop
line 1271
;1271:	break; 
ADDRGP4 $359
JUMPV
line 1274
;1272: case WP_RAILGUN: 
;1273:	// This is just zoom
;1274:	break; 
LABELV $369
line 1276
;1275: case WP_BFG: 
;1276:	BFG_Fire( ent, qtrue); 
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BFG_Fire
CALLV
pop
line 1277
;1277:	break; 
ADDRGP4 $359
JUMPV
LABELV $370
line 1279
;1278: case WP_GRAPPLING_HOOK: 
;1279:	Weapon_GrapplingHook_Fire( ent ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_GrapplingHook_Fire
CALLV
pop
line 1280
;1280:	break;
ADDRGP4 $359
JUMPV
LABELV $371
line 1282
;1281: case WP_TURRET:
;1282:	Weapon_fire_turret( ent, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Weapon_fire_turret
CALLV
pop
line 1283
;1283:	break;	
line 1286
;1284: default: 
;1285:// FIXME  G_Error( "Bad ent->s.weapon" ); 
;1286:  break; 
LABELV $359
line 1288
;1287: } 
;1288:}
LABELV $352
endproc FireWeapon2 12 20
lit
align 4
LABELV $375
byte 4 0
byte 4 0
byte 4 0
export BuildableSpawn
code
proc BuildableSpawn 280 28
line 1544
;1289:
;1290:
;1291:#ifdef MISSIONPACK
;1292:
;1293:/*
;1294:===============
;1295:KamikazeRadiusDamage
;1296:===============
;1297:*/
;1298:static void KamikazeRadiusDamage( vec3_t origin, gentity_t *attacker, float damage, float radius ) {
;1299:	float		dist;
;1300:	gentity_t	*ent;
;1301:	int			entityList[MAX_GENTITIES];
;1302:	int			numListedEntities;
;1303:	vec3_t		mins, maxs;
;1304:	vec3_t		v;
;1305:	vec3_t		dir;
;1306:	int			i, e;
;1307:
;1308:	if ( radius < 1 ) {
;1309:		radius = 1;
;1310:	}
;1311:
;1312:	for ( i = 0 ; i < 3 ; i++ ) {
;1313:		mins[i] = origin[i] - radius;
;1314:		maxs[i] = origin[i] + radius;
;1315:	}
;1316:
;1317:	numListedEntities = trap_EntitiesInBox( mins, maxs, entityList, MAX_GENTITIES );
;1318:
;1319:	for ( e = 0 ; e < numListedEntities ; e++ ) {
;1320:		ent = &g_entities[entityList[ e ]];
;1321:
;1322:		if (!ent->takedamage) {
;1323:			continue;
;1324:		}
;1325:
;1326:		// dont hit things we have already hit
;1327:		if( ent->kamikazeTime > level.time ) {
;1328:			continue;
;1329:		}
;1330:
;1331:		// find the distance from the edge of the bounding box
;1332:		for ( i = 0 ; i < 3 ; i++ ) {
;1333:			if ( origin[i] < ent->r.absmin[i] ) {
;1334:				v[i] = ent->r.absmin[i] - origin[i];
;1335:			} else if ( origin[i] > ent->r.absmax[i] ) {
;1336:				v[i] = origin[i] - ent->r.absmax[i];
;1337:			} else {
;1338:				v[i] = 0;
;1339:			}
;1340:		}
;1341:
;1342:		dist = VectorLength( v );
;1343:		if ( dist >= radius ) {
;1344:			continue;
;1345:		}
;1346:
;1347://		if( CanDamage (ent, origin) ) {
;1348:			VectorSubtract (ent->r.currentOrigin, origin, dir);
;1349:			// push the center of mass higher than the origin so players
;1350:			// get knocked into the air more
;1351:			dir[2] += 24;
;1352:			G_Damage( ent, NULL, attacker, dir, origin, damage, DAMAGE_RADIUS|DAMAGE_NO_TEAM_PROTECTION, MOD_KAMIKAZE );
;1353:			ent->kamikazeTime = level.time + 3000;
;1354://		}
;1355:	}
;1356:}
;1357:
;1358:/*
;1359:===============
;1360:KamikazeShockWave
;1361:===============
;1362:*/
;1363:static void KamikazeShockWave( vec3_t origin, gentity_t *attacker, float damage, float push, float radius ) {
;1364:	float		dist;
;1365:	gentity_t	*ent;
;1366:	int			entityList[MAX_GENTITIES];
;1367:	int			numListedEntities;
;1368:	vec3_t		mins, maxs;
;1369:	vec3_t		v;
;1370:	vec3_t		dir;
;1371:	int			i, e;
;1372:
;1373:	if ( radius < 1 )
;1374:		radius = 1;
;1375:
;1376:	for ( i = 0 ; i < 3 ; i++ ) {
;1377:		mins[i] = origin[i] - radius;
;1378:		maxs[i] = origin[i] + radius;
;1379:	}
;1380:
;1381:	numListedEntities = trap_EntitiesInBox( mins, maxs, entityList, MAX_GENTITIES );
;1382:
;1383:	for ( e = 0 ; e < numListedEntities ; e++ ) {
;1384:		ent = &g_entities[entityList[ e ]];
;1385:
;1386:		// dont hit things we have already hit
;1387:		if( ent->kamikazeShockTime > level.time ) {
;1388:			continue;
;1389:		}
;1390:
;1391:		// find the distance from the edge of the bounding box
;1392:		for ( i = 0 ; i < 3 ; i++ ) {
;1393:			if ( origin[i] < ent->r.absmin[i] ) {
;1394:				v[i] = ent->r.absmin[i] - origin[i];
;1395:			} else if ( origin[i] > ent->r.absmax[i] ) {
;1396:				v[i] = origin[i] - ent->r.absmax[i];
;1397:			} else {
;1398:				v[i] = 0;
;1399:			}
;1400:		}
;1401:
;1402:		dist = VectorLength( v );
;1403:		if ( dist >= radius ) {
;1404:			continue;
;1405:		}
;1406:
;1407://		if( CanDamage (ent, origin) ) {
;1408:			VectorSubtract (ent->r.currentOrigin, origin, dir);
;1409:			dir[2] += 24;
;1410:			G_Damage( ent, NULL, attacker, dir, origin, damage, DAMAGE_RADIUS|DAMAGE_NO_TEAM_PROTECTION, MOD_KAMIKAZE );
;1411:			//
;1412:			dir[2] = 0;
;1413:			VectorNormalize(dir);
;1414:			if ( ent->client ) {
;1415:				ent->client->ps.velocity[0] = dir[0] * push;
;1416:				ent->client->ps.velocity[1] = dir[1] * push;
;1417:				ent->client->ps.velocity[2] = 100;
;1418:			}
;1419:			ent->kamikazeShockTime = level.time + 3000;
;1420://		}
;1421:	}
;1422:}
;1423:
;1424:/*
;1425:===============
;1426:KamikazeDamage
;1427:===============
;1428:*/
;1429:static void KamikazeDamage( gentity_t *self ) {
;1430:	int i;
;1431:	float t;
;1432:	gentity_t *ent;
;1433:	vec3_t newangles;
;1434:
;1435:	self->count += 100;
;1436:
;1437:	if (self->count >= KAMI_SHOCKWAVE_STARTTIME) {
;1438:		// shockwave push back
;1439:		t = self->count - KAMI_SHOCKWAVE_STARTTIME;
;1440:		KamikazeShockWave(self->s.pos.trBase, self->activator, 25, 400,	(int) (float) t * KAMI_SHOCKWAVE_MAXRADIUS / (KAMI_SHOCKWAVE_ENDTIME - KAMI_SHOCKWAVE_STARTTIME) );
;1441:	}
;1442:	//
;1443:	if (self->count >= KAMI_EXPLODE_STARTTIME) {
;1444:		// do our damage
;1445:		t = self->count - KAMI_EXPLODE_STARTTIME;
;1446:		KamikazeRadiusDamage( self->s.pos.trBase, self->activator, 400,	(int) (float) t * KAMI_BOOMSPHERE_MAXRADIUS / (KAMI_IMPLODE_STARTTIME - KAMI_EXPLODE_STARTTIME) );
;1447:	}
;1448:
;1449:	// either cycle or kill self
;1450:	if( self->count >= KAMI_SHOCKWAVE_ENDTIME ) {
;1451:		G_FreeEntity( self );
;1452:		return;
;1453:	}
;1454:	self->nextthink = level.time + 100;
;1455:
;1456:	// add earth quake effect
;1457:	newangles[0] = crandom() * 2;
;1458:	newangles[1] = crandom() * 2;
;1459:	newangles[2] = 0;
;1460:	for (i = 0; i < MAX_CLIENTS; i++)
;1461:	{
;1462:		ent = &g_entities[i];
;1463:		if (!ent->inuse)
;1464:			continue;
;1465:		if (!ent->client)
;1466:			continue;
;1467:
;1468:		if (ent->client->ps.groundEntityNum != ENTITYNUM_NONE) {
;1469:			ent->client->ps.velocity[0] += crandom() * 120;
;1470:			ent->client->ps.velocity[1] += crandom() * 120;
;1471:			ent->client->ps.velocity[2] = 30 + random() * 25;
;1472:		}
;1473:
;1474:		ent->client->ps.delta_angles[0] += ANGLE2SHORT(newangles[0] - self->movedir[0]);
;1475:		ent->client->ps.delta_angles[1] += ANGLE2SHORT(newangles[1] - self->movedir[1]);
;1476:		ent->client->ps.delta_angles[2] += ANGLE2SHORT(newangles[2] - self->movedir[2]);
;1477:	}
;1478:	VectorCopy(newangles, self->movedir);
;1479:}
;1480:
;1481:/*
;1482:===============
;1483:G_StartKamikaze
;1484:===============
;1485:*/
;1486:void G_StartKamikaze( gentity_t *ent ) {
;1487:	gentity_t	*explosion;
;1488:	gentity_t	*te;
;1489:	vec3_t		snapped;
;1490:
;1491:	// start up the explosion logic
;1492:	explosion = G_Spawn();
;1493:
;1494:	explosion->s.eType = ET_EVENTS + EV_KAMIKAZE;
;1495:	explosion->eventTime = level.time;
;1496:
;1497:	if ( ent->client ) {
;1498:		VectorCopy( ent->s.pos.trBase, snapped );
;1499:	}
;1500:	else {
;1501:		VectorCopy( ent->activator->s.pos.trBase, snapped );
;1502:	}
;1503:	SnapVector( snapped );		// save network bandwidth
;1504:	G_SetOrigin( explosion, snapped );
;1505:
;1506:	explosion->classname = "kamikaze";
;1507:	explosion->s.pos.trType = TR_STATIONARY;
;1508:
;1509:	explosion->kamikazeTime = level.time;
;1510:
;1511:	explosion->think = KamikazeDamage;
;1512:	explosion->nextthink = level.time + 100;
;1513:	explosion->count = 0;
;1514:	VectorClear(explosion->movedir);
;1515:
;1516:	trap_LinkEntity( explosion );
;1517:
;1518:	if (ent->client) {
;1519:		//
;1520:		explosion->activator = ent;
;1521:		//
;1522:		ent->s.eFlags &= ~EF_KAMIKAZE;
;1523:		// nuke the guy that used it
;1524:		G_Damage( ent, ent, ent, NULL, NULL, 100000, DAMAGE_NO_PROTECTION, MOD_KAMIKAZE );
;1525:	}
;1526:	else {
;1527:		if ( !strcmp(ent->activator->classname, "bodyque") ) {
;1528:			explosion->activator = &g_entities[ent->activator->r.ownerNum];
;1529:		}
;1530:		else {
;1531:			explosion->activator = ent->activator;
;1532:		}
;1533:	}
;1534:
;1535:	// play global sound at all clients
;1536:	te = G_TempEntity(snapped, EV_GLOBAL_TEAM_SOUND );
;1537:	te->r.svFlags |= SVF_BROADCAST;
;1538:	te->s.eventParm = GTS_KAMIKAZE;
;1539:}
;1540:#endif
;1541:
;1542:
;1543:void BuildableSpawn( gentity_t *base )
;1544:{ // Done here for those night forward, right, and up values -Vincent	
line 1546
;1545:vec3_t		start, dir, angles; // Part 1 stuff
;1546:vec3_t		origin, slope, nvf, ovf, ovr, new_angles = {0, 0, 0 }; // Part 2
ADDRLP4 116
ADDRGP4 $375
INDIRB
ASGNB 12
line 1550
;1547:float		pitch, mod, dot; // Part 2
;1548:trace_t		tr1, tr2; // Part 2
;1549:
;1550:if( !base || !base->parent || !base->parent->client )
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
EQU4 $379
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
EQU4 $379
ADDRLP4 240
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 236
INDIRU4
NEU4 $376
LABELV $379
line 1551
;1551:	return; // Verify for both parts
ADDRGP4 $374
JUMPV
LABELV $376
line 1554
;1552:
;1553:// Part 1: Initial spawning in front of the player -Vincent
;1554:VectorCopy( base->parent->client->ps.viewangles, angles );
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
line 1555
;1555:angles[0] = 0; // Stay straight
ADDRLP4 92
CNSTF4 0
ASGNF4
line 1556
;1556:angles[2] = 0; // Stay straight
ADDRLP4 92+8
CNSTF4 0
ASGNF4
line 1558
;1557:
;1558:AngleVectors( angles, forward, right, up );
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
line 1559
;1559:CalcMuzzlePoint( base, forward, right, up, start ); // Actual start point, away from the owner
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
line 1560
;1560:VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1561
;1561:VectorMA( start, 32, forward, start ); // Go in front of the player
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
line 1562
;1562:G_SetOrigin( base, start ); // Start a bit in front of the player
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1563
;1563:base->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1565
;1564:	
;1565:VectorCopy( forward, dir ); // To tweak it below this...
ADDRLP4 12
ADDRGP4 forward
INDIRB
ASGNB 12
line 1566
;1566:VectorNormalize( dir );
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1567
;1567:VectorScale( dir, 300, base->s.pos.trDelta );
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
line 1568
;1568:base->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1569
;1569:vectoangles( dir, base->s.angles);
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
line 1570
;1570:VectorCopy( base->s.angles, base->s.apos.trBase );
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
line 1571
;1571:VectorSet( base->s.apos.trDelta, 300, 0, 0 ); // Speed
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
CNSTF4 1133903872
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
line 1572
;1572:base->s.apos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1576
;1573:
;1574:
;1575:// Part 2: Put it on the ground and match it to slopes -Vincent
;1576:VectorCopy( base->r.currentOrigin, origin );
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRB
ASGNB 12
line 1577
;1577:origin[2] -= 2500; // Trace it straight down
ADDRLP4 24+8
ADDRLP4 24+8
INDIRF4
CNSTF4 1159479296
SUBF4
ASGNF4
line 1580
;1578:// Trace for solids from the previous position to the new position on the ground, 
;1579:// but without getting stuck in the owner!
;1580:trap_Trace( &tr1, base->r.currentOrigin, base->r.mins, base->r.maxs, origin, 
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
EQU4 $394
ADDRLP4 252
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
INDIRI4
ASGNI4
ADDRGP4 $395
JUMPV
LABELV $394
ADDRLP4 252
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
LABELV $395
ADDRLP4 252
INDIRI4
ARGI4
CNSTI4 100664321
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1583
;1581:			base->parent ? base->parent->s.number : base->s.number, MASK_SHOT );
;1582:
;1583:VectorCopy( base->r.currentOrigin, origin ); // Keep the old value for lava checking
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRB
ASGNB 12
line 1584
;1584:G_SetOrigin( base, tr1.endpos );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36+12
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1585
;1585:VectorCopy( base->r.currentOrigin, base->s.origin ); // Set it's new origin
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
line 1587
;1586:
;1587:if( tr1.fraction < 1.0 && ( &tr1.plane ) )
ADDRLP4 36+8
INDIRF4
CNSTF4 1065353216
GEF4 $397
ADDRLP4 36+24
CVPU4 4
CNSTU4 0
EQU4 $397
line 1588
;1588:{ // Match to a slope when necessary
line 1589
;1589:VectorCopy( tr1.plane.normal, slope ); // Get the slopes' angles
ADDRLP4 220
ADDRLP4 36+24
INDIRB
ASGNB 12
line 1590
;1590:AngleVectors( base->s.angles, ovf, ovr, NULL ); // Already calculated in part 1
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
line 1591
;1591:vectoangles( slope, new_angles );
ADDRLP4 220
ARGP4
ADDRLP4 116
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1592
;1592:pitch = new_angles[PITCH] + 90;
ADDRLP4 212
ADDRLP4 116
INDIRF4
CNSTF4 1119092736
ADDF4
ASGNF4
line 1593
;1593:new_angles[ROLL] = new_angles[PITCH] = 0;
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
line 1594
;1594:AngleVectors( new_angles, nvf, NULL, NULL );
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
line 1596
;1595:
;1596:mod = DotProduct( nvf, ovr );
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
line 1597
;1597:if( mod < 0 )
ADDRLP4 152
INDIRF4
CNSTF4 0
GEF4 $407
line 1598
;1598:	mod = -1;
ADDRLP4 152
CNSTF4 3212836864
ASGNF4
ADDRGP4 $408
JUMPV
LABELV $407
line 1600
;1599:else
;1600:	mod = 1;
ADDRLP4 152
CNSTF4 1065353216
ASGNF4
LABELV $408
line 1602
;1601:
;1602:dot = DotProduct( nvf, ovf );
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
line 1604
;1603:// Modify its actual angles
;1604:base->s.angles[PITCH] = dot * pitch;
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
line 1605
;1605:base->s.angles[ROLL] = ( ( 1-Q_fabs( dot ) ) * pitch * mod );
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
line 1606
;1606:VectorCopy( base->s.angles, base->s.apos.trBase );
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
line 1607
;1607:}
LABELV $397
line 1609
;1608:
;1609:trap_LinkEntity( base ); // Add it...
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1613
;1610:
;1611:// Trace back to its original point to see if the buildable hit any non-solid content on its way
;1612:// When it does, the buildable should be cleared!
;1613:trap_Trace( &tr2, origin, base->r.mins, base->r.maxs, base->r.currentOrigin, 
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
EQU4 $414
ADDRLP4 264
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
INDIRI4
ASGNI4
ADDRGP4 $415
JUMPV
LABELV $414
ADDRLP4 264
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
LABELV $415
ADDRLP4 264
INDIRI4
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1616
;1614:		   	base->parent ? base->parent->s.number : base->s.number, CONTENTS_LAVA | CONTENTS_SLIME | CONTENTS_WATER );
;1615:
;1616:if( tr2.fraction < 1.0 ) // It did go through a bad content
ADDRLP4 156+8
INDIRF4
CNSTF4 1065353216
GEF4 $416
line 1617
;1617:{
line 1618
;1618:base->s.eType = ET_GENERAL; // To go for a die in g_buildables
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 1619
;1619:}
ADDRGP4 $417
JUMPV
LABELV $416
line 1621
;1620:else
;1621:{
line 1622
;1622:base->s.eType = ET_BUILDABLE; // Initialize it
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 13
ASGNI4
line 1623
;1623:}
LABELV $417
line 1625
;1624:// The actual buildables' thinking happens in g_buildables again, after this func
;1625:}
LABELV $374
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
LABELV $189
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
LABELV $180
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 0
