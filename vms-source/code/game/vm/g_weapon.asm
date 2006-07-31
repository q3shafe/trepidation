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
proc CheckGauntletAttack 108 32
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
CNSTI4 516
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
CNSTI4 868
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
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
EQI4 $78
ADDRLP4 0
INDIRP4
CNSTI4 516
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
CNSTI4 744
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
CNSTI4 516
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
line 89
;88:#ifdef MISSIONPACK
;89:	if( ent->client->persistantPowerup && ent->client->persistantPowerup->item && ent->client->persistantPowerup->item->giTag == PW_DOUBLER ) {
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2652
ADDP4
INDIRP4
ASGNP4
ADDRLP4 96
CNSTU4 0
ASGNU4
ADDRLP4 92
INDIRP4
CVPU4 4
ADDRLP4 96
INDIRU4
EQU4 $87
ADDRLP4 100
ADDRLP4 92
INDIRP4
CNSTI4 836
ADDP4
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CVPU4 4
ADDRLP4 96
INDIRU4
EQU4 $87
ADDRLP4 100
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 12
NEI4 $87
line 90
;90:		s_quadFactor *= 2;
ADDRLP4 104
ADDRGP4 s_quadFactor
ASGNP4
ADDRLP4 104
INDIRP4
CNSTF4 1073741824
ADDRLP4 104
INDIRP4
INDIRF4
MULF4
ASGNF4
line 91
;91:	}
LABELV $87
line 94
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
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 104
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
endproc CheckGauntletAttack 108 32
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
CNSTI4 748
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
CNSTI4 752
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
LABELV $90
endproc Weapon_fire_flame 16 16
export Bullet_Fire
proc Bullet_Fire 176 32
line 159
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
;152:#ifdef MISSIONPACK
;153:#define CHAINGUN_SPREAD		600
;154:#endif
;155:#define MACHINEGUN_SPREAD	100
;156:#define	MACHINEGUN_DAMAGE	7
;157:#define	MACHINEGUN_TEAM_DAMAGE	5		// wimpier MG in teamplay
;158:
;159:void Bullet_Fire (gentity_t *ent, float spread, int damage ) {
line 173
;160:	trace_t		tr;
;161:	vec3_t		end;
;162:#ifdef MISSIONPACK
;163:	vec3_t		impactpoint, bouncedir;
;164:#endif
;165:	float		r;
;166:	float		u;
;167:	gentity_t	*tent;
;168:	gentity_t	*traceEnt;
;169:	int			i, passent;
;170:
;171://unlagged - attack prediction #2
;172:	// we have to use something now that the client knows in advance
;173:	int			seed = ent->client->attackTime % 256;
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2724
ADDP4
INDIRI4
CNSTI4 256
MODI4
ASGNI4
line 176
;174://unlagged - attack prediction #2
;175:
;176:	damage *= s_quadFactor;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 185
;177:
;178://unlagged - attack prediction #2
;179:	// this has to match what's on the client
;180:/*
;181:	r = random() * M_PI * 2.0f;
;182:	u = sin(r) * crandom() * spread * 16;
;183:	r = cos(r) * crandom() * spread * 16;
;184:*/
;185:	r = Q_random(&seed) * M_PI * 2.0f;
ADDRLP4 104
ARGP4
ADDRLP4 120
ADDRGP4 Q_random
CALLF4
ASGNF4
ADDRLP4 84
CNSTF4 1073741824
CNSTF4 1078530011
ADDRLP4 120
INDIRF4
MULF4
MULF4
ASGNF4
line 186
;186:	u = sin(r) * Q_crandom(&seed) * spread * 16;
ADDRLP4 84
INDIRF4
ARGF4
ADDRLP4 124
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 104
ARGP4
ADDRLP4 128
ADDRGP4 Q_crandom
CALLF4
ASGNF4
ADDRLP4 100
CNSTF4 1098907648
ADDRLP4 124
INDIRF4
ADDRLP4 128
INDIRF4
MULF4
ADDRFP4 4
INDIRF4
MULF4
MULF4
ASGNF4
line 187
;187:	r = cos(r) * Q_crandom(&seed) * spread * 16;
ADDRLP4 84
INDIRF4
ARGF4
ADDRLP4 132
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 104
ARGP4
ADDRLP4 136
ADDRGP4 Q_crandom
CALLF4
ASGNF4
ADDRLP4 84
CNSTF4 1098907648
ADDRLP4 132
INDIRF4
ADDRLP4 136
INDIRF4
MULF4
ADDRFP4 4
INDIRF4
MULF4
MULF4
ASGNF4
line 189
;188://unlagged - attack prediction #2
;189:	VectorMA (muzzle, 8192*16, forward, end);
ADDRLP4 140
CNSTF4 1207959552
ASGNF4
ADDRLP4 64
ADDRGP4 muzzle
INDIRF4
ADDRLP4 140
INDIRF4
ADDRGP4 forward
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+4
ADDRGP4 muzzle+4
INDIRF4
ADDRLP4 140
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
line 190
;190:	VectorMA (end, r, right, end);
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
line 191
;191:	VectorMA (end, u, up, end);
ADDRLP4 64
ADDRLP4 64
INDIRF4
ADDRGP4 up
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 64+4
INDIRF4
ADDRGP4 up+4
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 64+8
INDIRF4
ADDRGP4 up+8
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ADDF4
ASGNF4
line 193
;192:
;193:	passent = ent->s.number;
ADDRLP4 80
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 194
;194:	for (i = 0; i < 10; i++) {
ADDRLP4 76
CNSTI4 0
ASGNI4
LABELV $110
line 198
;195:
;196://unlagged - backward reconciliation #2
;197:		// backward-reconcile the other clients
;198:		G_DoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 201
;199://unlagged - backward reconciliation #2
;200:
;201:		trap_Trace (&tr, muzzle, NULL, NULL, end, passent, MASK_SHOT);
ADDRLP4 4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRLP4 152
CNSTP4 0
ASGNP4
ADDRLP4 152
INDIRP4
ARGP4
ADDRLP4 152
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
line 205
;202:
;203://unlagged - backward reconciliation #2
;204:		// put them back
;205:		G_UndoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 208
;206://unlagged - backward reconciliation #2
;207:
;208:		if ( tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 4+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $114
line 209
;209:			return;
ADDRGP4 $91
JUMPV
LABELV $114
line 212
;210:		}
;211:
;212:		traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 0
CNSTI4 868
ADDRLP4 4+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 215
;213:
;214:		// snap the endpos to integers, but nudged towards the line
;215:		SnapVectorTowards( tr.endpos, muzzle );
ADDRLP4 4+12
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 218
;216:
;217:		// send bullet impact
;218:		if ( traceEnt->takedamage && traceEnt->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
EQI4 $119
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $119
line 219
;219:			tent = G_TempEntity( tr.endpos, EV_BULLET_HIT_FLESH );
ADDRLP4 4+12
ARGP4
CNSTI4 50
ARGI4
ADDRLP4 160
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 160
INDIRP4
ASGNP4
line 220
;220:			tent->s.eventParm = traceEnt->s.number;
ADDRLP4 60
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 224
;221://unlagged - attack prediction #2
;222:			// we need the client number to determine whether or not to
;223:			// suppress this event
;224:			tent->s.clientNum = ent->s.clientNum;
ADDRLP4 164
CNSTI4 168
ASGNI4
ADDRLP4 60
INDIRP4
ADDRLP4 164
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 164
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 226
;225://unlagged - attack prediction #2
;226:			if( LogAccuracyHit( traceEnt, ent ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 168
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 0
EQI4 $120
line 227
;227:				ent->client->accuracy_hits++;
ADDRLP4 172
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2588
ADDP4
ASGNP4
ADDRLP4 172
INDIRP4
ADDRLP4 172
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 228
;228:			}
line 229
;229:		} else {
ADDRGP4 $120
JUMPV
LABELV $119
line 230
;230:			tent = G_TempEntity( tr.endpos, EV_BULLET_HIT_WALL );
ADDRLP4 4+12
ARGP4
CNSTI4 51
ARGI4
ADDRLP4 160
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 160
INDIRP4
ASGNP4
line 231
;231:			tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 164
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 164
INDIRI4
ASGNI4
line 235
;232://unlagged - attack prediction #2
;233:			// we need the client number to determine whether or not to
;234:			// suppress this event
;235:			tent->s.clientNum = ent->s.clientNum;
ADDRLP4 168
CNSTI4 168
ASGNI4
ADDRLP4 60
INDIRP4
ADDRLP4 168
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 168
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 237
;236://unlagged - attack prediction #2
;237:		}
LABELV $120
line 238
;238:		tent->s.otherEntityNum = ent->s.number;
ADDRLP4 60
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 240
;239:
;240:		if ( traceEnt->takedamage) {
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
EQI4 $112
line 242
;241:#ifdef MISSIONPACK
;242:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
ADDRLP4 160
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 160
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $128
ADDRLP4 160
INDIRP4
CNSTI4 2716
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $128
line 243
;243:				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 108
ARGP4
ADDRLP4 164
ADDRGP4 G_InvulnerabilityEffect
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
EQI4 $131
line 244
;244:					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
ADDRGP4 muzzle
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 108
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 G_BounceProjectile
CALLV
pop
line 245
;245:					VectorCopy( impactpoint, muzzle );
ADDRGP4 muzzle
ADDRLP4 88
INDIRB
ASGNB 12
line 247
;246:					// the player can hit him/herself with the bounced rail
;247:					passent = ENTITYNUM_NONE;
ADDRLP4 80
CNSTI4 1023
ASGNI4
line 248
;248:				}
ADDRGP4 $111
JUMPV
LABELV $131
line 249
;249:				else {
line 250
;250:					VectorCopy( tr.endpos, muzzle );
ADDRGP4 muzzle
ADDRLP4 4+12
INDIRB
ASGNB 12
line 251
;251:					passent = traceEnt->s.number;
ADDRLP4 80
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 252
;252:				}
line 253
;253:				continue;
ADDRGP4 $111
JUMPV
LABELV $128
line 255
;254:			}
;255:			else {
line 257
;256:#endif
;257:				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 164
INDIRP4
ARGP4
ADDRLP4 164
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4+12
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
line 260
;258:					damage, 0, MOD_MACHINEGUN);
;259:#ifdef MISSIONPACK
;260:			}
line 262
;261:#endif
;262:		}
line 263
;263:		break;
ADDRGP4 $112
JUMPV
LABELV $111
line 194
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 10
LTI4 $110
LABELV $112
line 265
;264:	}
;265:}
LABELV $91
endproc Bullet_Fire 176 32
export BFG_Fire
proc BFG_Fire 16 16
line 276
;266:
;267:
;268:/*
;269:======================================================================
;270:
;271:BFG
;272:
;273:======================================================================
;274:*/
;275:
;276:void BFG_Fire ( gentity_t *ent, qboolean alt ) {
line 280
;277:	gentity_t	*m;
;278:
;279:	// Alt Fire Shoots Upward Just A Bit MOre
;280:	if (alt == qtrue)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $137
line 281
;281:	{
line 282
;282:		forward[2] += 0.2f;
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
line 283
;283:		forward[2] += 0.2f;
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
line 284
;284:	}
LABELV $137
line 286
;285:	
;286:	VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 287
;287:	m = fire_bfg (ent, muzzle, forward, alt);
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
ADDRGP4 fire_bfg
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 288
;288:	m->damage *= s_quadFactor;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 748
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
line 289
;289:	m->splashDamage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 752
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
line 292
;290:
;291://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;292:}
LABELV $136
endproc BFG_Fire 16 16
export ShotgunPellet
proc ShotgunPellet 136 32
line 307
;293:
;294:
;295:/*
;296:======================================================================
;297:
;298:SHOTGUN
;299:
;300:======================================================================
;301:*/
;302:
;303:// DEFAULT_SHOTGUN_SPREAD and DEFAULT_SHOTGUN_COUNT	are in bg_public.h, because
;304:// client predicts same spreads
;305:#define	DEFAULT_SHOTGUN_DAMAGE	10
;306:
;307:qboolean ShotgunPellet( vec3_t start, vec3_t end, gentity_t *ent ) {
line 316
;308:	trace_t		tr;
;309:	int			damage, i, passent;
;310:	gentity_t	*traceEnt;
;311:#ifdef MISSIONPACK
;312:	vec3_t		impactpoint, bouncedir;
;313:#endif
;314:	vec3_t		tr_start, tr_end;
;315:
;316:	passent = ent->s.number;
ADDRLP4 76
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 317
;317:	VectorCopy( start, tr_start );
ADDRLP4 64
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 318
;318:	VectorCopy( end, tr_end );
ADDRLP4 80
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 319
;319:	for (i = 0; i < 10; i++) {
ADDRLP4 60
CNSTI4 0
ASGNI4
LABELV $142
line 320
;320:		trap_Trace (&tr, tr_start, NULL, NULL, tr_end, passent, MASK_SHOT);
ADDRLP4 4
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 120
CNSTP4 0
ASGNP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 76
INDIRI4
ARGI4
CNSTI4 100664321
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 321
;321:		traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 0
CNSTI4 868
ADDRLP4 4+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 324
;322:
;323:		// send bullet impact
;324:		if (  tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 4+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $147
line 325
;325:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $141
JUMPV
LABELV $147
line 328
;326:		}
;327:
;328:		if ( traceEnt->takedamage) {
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
EQI4 $150
line 329
;329:			damage = DEFAULT_SHOTGUN_DAMAGE * s_quadFactor;
ADDRLP4 92
CNSTF4 1092616192
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 331
;330:#ifdef MISSIONPACK
;331:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
ADDRLP4 124
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 124
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $152
ADDRLP4 124
INDIRP4
CNSTI4 2716
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $152
line 332
;332:				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 96
ARGP4
ADDRLP4 108
ARGP4
ADDRLP4 128
ADDRGP4 G_InvulnerabilityEffect
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 0
EQI4 $155
line 333
;333:					G_BounceProjectile( tr_start, impactpoint, bouncedir, tr_end );
ADDRLP4 64
ARGP4
ADDRLP4 96
ARGP4
ADDRLP4 108
ARGP4
ADDRLP4 80
ARGP4
ADDRGP4 G_BounceProjectile
CALLV
pop
line 334
;334:					VectorCopy( impactpoint, tr_start );
ADDRLP4 64
ADDRLP4 96
INDIRB
ASGNB 12
line 336
;335:					// the player can hit him/herself with the bounced rail
;336:					passent = ENTITYNUM_NONE;
ADDRLP4 76
CNSTI4 1023
ASGNI4
line 337
;337:				}
ADDRGP4 $143
JUMPV
LABELV $155
line 338
;338:				else {
line 339
;339:					VectorCopy( tr.endpos, tr_start );
ADDRLP4 64
ADDRLP4 4+12
INDIRB
ASGNB 12
line 340
;340:					passent = traceEnt->s.number;
ADDRLP4 76
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 341
;341:				}
line 342
;342:				continue;
ADDRGP4 $143
JUMPV
LABELV $152
line 344
;343:			}
;344:			else {
line 345
;345:				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 128
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4+12
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
line 347
;346:					damage, 0, MOD_SHOTGUN);
;347:				if( LogAccuracyHit( traceEnt, ent ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 132
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 0
EQI4 $160
line 348
;348:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $141
JUMPV
LABELV $160
line 350
;349:				}
;350:			}
line 357
;351:#else
;352:			G_Damage( traceEnt, ent, ent, forward, tr.endpos,	damage, 0, MOD_SHOTGUN);
;353:				if( LogAccuracyHit( traceEnt, ent ) ) {
;354:					return qtrue;
;355:				}
;356:#endif
;357:		}
LABELV $150
line 358
;358:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $141
JUMPV
LABELV $143
line 319
ADDRLP4 60
ADDRLP4 60
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 10
LTI4 $142
line 360
;359:	}
;360:	return qfalse;
CNSTI4 0
RETI4
LABELV $141
endproc ShotgunPellet 136 32
export ShotgunPattern
proc ShotgunPattern 104 12
line 364
;361:}
;362:
;363:// this should match CG_ShotgunPattern
;364:void ShotgunPattern( vec3_t origin, vec3_t origin2, int seed, gentity_t *ent ) {
line 370
;365:	int			i;
;366:	float		r, u;
;367:	vec3_t		end;
;368:	vec3_t		forward, right, up;
;369:	int			oldScore;
;370:	qboolean	hitClient = qfalse;
ADDRLP4 60
CNSTI4 0
ASGNI4
line 379
;371:
;372://unlagged - attack prediction #2
;373:	// use this for testing
;374:	//Com_Printf( "Server seed: %d\n", seed );
;375://unlagged - attack prediction #2
;376:
;377:	// derive the right and up vectors from the forward vector, because
;378:	// the client won't have any other information
;379:	VectorNormalize2( origin2, forward );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 VectorNormalize2
CALLF4
pop
line 380
;380:	PerpendicularVector( right, forward );
ADDRLP4 32
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 381
;381:	CrossProduct( forward, right, up );
ADDRLP4 20
ARGP4
ADDRLP4 32
ARGP4
ADDRLP4 44
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 383
;382:
;383:	oldScore = ent->client->ps.persistant[PERS_SCORE];
ADDRLP4 64
ADDRFP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 387
;384:
;385://unlagged - backward reconciliation #2
;386:	// backward-reconcile the other clients
;387:	G_DoTimeShiftFor( ent );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 391
;388://unlagged - backward reconciliation #2
;389:
;390:	// generate the "random" spread pattern
;391:	for ( i = 0 ; i < DEFAULT_SHOTGUN_COUNT ; i++ ) {
ADDRLP4 56
CNSTI4 0
ASGNI4
LABELV $163
line 392
;392:		r = Q_crandom( &seed ) * DEFAULT_SHOTGUN_SPREAD * 16;
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
line 393
;393:		u = Q_crandom( &seed ) * DEFAULT_SHOTGUN_SPREAD * 16;
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
line 394
;394:		VectorMA( origin, 8192 * 16, forward, end);
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
line 395
;395:		VectorMA (end, r, right, end);
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
line 396
;396:		VectorMA (end, u, up, end);
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
line 397
;397:		if( ShotgunPellet( origin, end, ent ) && !hitClient ) {
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
EQI4 $183
ADDRLP4 60
INDIRI4
ADDRLP4 96
INDIRI4
NEI4 $183
line 398
;398:			hitClient = qtrue;
ADDRLP4 60
CNSTI4 1
ASGNI4
line 399
;399:			ent->client->accuracy_hits++;
ADDRLP4 100
ADDRFP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2588
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
line 400
;400:		}
LABELV $183
line 401
;401:	}
LABELV $164
line 391
ADDRLP4 56
ADDRLP4 56
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 11
LTI4 $163
line 405
;402:
;403://unlagged - backward reconciliation #2
;404:	// put them back
;405:	G_UndoTimeShiftFor( ent );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 407
;406://unlagged - backward reconciliation #2
;407:}
LABELV $162
endproc ShotgunPattern 104 12
export weapon_supershotgun_fire
proc weapon_supershotgun_fire 32 16
line 410
;408:
;409:
;410:void weapon_supershotgun_fire (gentity_t *ent) {
line 414
;411:	gentity_t		*tent;
;412:
;413:	// send shotgun blast
;414:	tent = G_TempEntity( muzzle, EV_SHOTGUN );
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
line 415
;415:	VectorScale( forward, 4096, tent->s.origin2 );
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
line 416
;416:	SnapVector( tent->s.origin2 );
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
line 420
;417://unlagged - attack prediction #2
;418:	// this has to be something the client can predict now
;419:	//tent->s.eventParm = rand() & 255;		// seed for spread pattern
;420:	tent->s.eventParm = ent->client->attackTime % 256; // seed for spread pattern
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2724
ADDP4
INDIRI4
CNSTI4 256
MODI4
ASGNI4
line 422
;421://unlagged - attack prediction #2
;422:	tent->s.otherEntityNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 424
;423:
;424:	ShotgunPattern( tent->s.pos.trBase, tent->s.origin2, tent->s.eventParm, ent );
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
line 425
;425:}
LABELV $185
endproc weapon_supershotgun_fire 32 16
export weapon_pdlauncher_fire
proc weapon_pdlauncher_fire 28 12
line 437
;426:
;427:
;428:/*
;429:======================================================================
;430:
;431:GRENADE LAUNCHER
;432:
;433:======================================================================
;434:*/
;435:
;436:// Shafe - PDG
;437:void weapon_pdlauncher_fire (gentity_t	*ent) {
line 439
;438:	gentity_t	*m;
;439:	gentity_t	*grenades = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $190
JUMPV
LABELV $189
line 442
;440:	 
;441: while ((grenades = G_Find (grenades, FOFS(classname), "pdgrenade")) != NULL)
;442: {
line 443
;443:	if(grenades->r.ownerNum == ent->s.clientNum)  //make sure its ours
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
NEI4 $193
line 444
;444:	{
line 445
;445:		ent->istelepoint = 0; // client cannot teleport
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
CNSTI4 0
ASGNI4
line 446
;446:		VectorClear( ent->teleloc ); // clear the teleport location
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 828
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 824
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 820
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 447
;447:		grenades->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 448
;448:		grenades->nextthink = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 449
;449:	}
LABELV $193
line 450
;450: }
LABELV $190
line 441
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 524
ARGI4
ADDRGP4 $192
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
NEU4 $189
line 452
;451: // extra vertical velocity
;452: forward[2] += 0.2;
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
line 453
;453: VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 455
;454: 
;455: m = fire_pdgrenade (ent, muzzle, forward);
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
line 456
;456: m->damage *= s_quadFactor;
ADDRLP4 20
ADDRLP4 4
INDIRP4
CNSTI4 748
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
line 457
;457: m->splashDamage *= s_quadFactor;
ADDRLP4 24
ADDRLP4 4
INDIRP4
CNSTI4 752
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
line 458
;458:} 
LABELV $188
endproc weapon_pdlauncher_fire 28 12
export weapon_grenadelauncher_fire
proc weapon_grenadelauncher_fire 20 12
line 460
;459:
;460:void weapon_grenadelauncher_fire (gentity_t *ent) {
line 464
;461:	gentity_t	*m;
;462:
;463:	// extra vertical velocity
;464:	forward[2] += 0.2f;
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
line 465
;465:	VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 467
;466:
;467:	m = fire_grenade (ent, muzzle, forward);
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
line 468
;468:	m->damage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 748
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
line 469
;469:	m->splashDamage *= s_quadFactor;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 752
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
line 472
;470:
;471://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;472:}
LABELV $197
endproc weapon_grenadelauncher_fire 20 12
export weapon_altgrenadelauncher_fire
proc weapon_altgrenadelauncher_fire 20 12
line 483
;473:
;474:/*
;475:======================================================================
;476:
;477:ALT GRENADE LAUNCHER 
;478:Shafe - Trep - Alternate Fire Grenade
;479:
;480:======================================================================
;481:*/
;482:
;483:void weapon_altgrenadelauncher_fire (gentity_t *ent) {
line 487
;484:	gentity_t	*m;
;485:
;486:	// extra vertical velocity
;487:	forward[2] += 0.2f;
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
line 488
;488:	VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 490
;489:
;490:	m = fire_altgrenade (ent, muzzle, forward);
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
line 491
;491:	m->damage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 748
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
line 492
;492:	m->splashDamage *= s_quadFactor;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 752
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
line 495
;493:
;494://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;495:}
LABELV $199
endproc weapon_altgrenadelauncher_fire 20 12
export Weapon_RocketLauncher_Fire
proc Weapon_RocketLauncher_Fire 16 12
line 505
;496:
;497:/*
;498:======================================================================
;499:
;500:ROCKET
;501:
;502:======================================================================
;503:*/
;504:
;505:void Weapon_RocketLauncher_Fire (gentity_t *ent) {
line 508
;506:	gentity_t	*m;
;507:
;508:	m = fire_rocket (ent, muzzle, forward);
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
line 509
;509:	m->damage *= s_quadFactor;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 748
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
line 510
;510:	m->splashDamage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 752
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
line 513
;511:
;512://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;513:}
LABELV $201
endproc Weapon_RocketLauncher_Fire 16 12
export Weapon_RocketLauncher_AltFire
proc Weapon_RocketLauncher_AltFire 16 12
line 516
;514:
;515:// Shafe - Trep Alt Rocket Launcher
;516:void Weapon_RocketLauncher_AltFire (gentity_t *ent) {
line 519
;517:	gentity_t	*m;
;518:
;519:	m = fire_alt_rocket (ent, muzzle, forward);
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
line 520
;520:	m->damage *= s_quadFactor;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 748
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
line 521
;521:	m->splashDamage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 752
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
line 524
;522:
;523://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;524:}
LABELV $202
endproc Weapon_RocketLauncher_AltFire 16 12
export Weapon_Plasmagun_Fire
proc Weapon_Plasmagun_Fire 24 12
line 535
;525:
;526:
;527:/*
;528:======================================================================
;529:
;530:PLASMA GUN
;531:
;532:======================================================================
;533:*/
;534:
;535:void Weapon_Plasmagun_Fire (gentity_t *ent) {
line 541
;536:	gentity_t	*m;
;537:	int		i;
;538:	
;539:	// Shafe - Add Some Randomness so that 
;540:	// it doesnt fire straight every time
;541:	i = irandom(0,10);
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
line 542
;542:	if (i > 5)
ADDRLP4 4
INDIRI4
CNSTI4 5
LEI4 $204
line 543
;543:	{
line 544
;544:		forward[2] += 0.2f;
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
line 545
;545:		VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 546
;546:	}
LABELV $204
line 548
;547:
;548:	m = fire_plasma (ent, muzzle, forward);
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
line 549
;549:	m->damage *= s_quadFactor;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 748
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
line 550
;550:	m->splashDamage *= s_quadFactor;
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 752
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
line 553
;551:
;552://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;553:}
LABELV $203
endproc Weapon_Plasmagun_Fire 24 12
export weapon_railgun_fire
proc weapon_railgun_fire 196 32
line 570
;554:
;555:/*
;556:======================================================================
;557:
;558:RAILGUN
;559:
;560:======================================================================
;561:*/
;562:
;563:
;564:/*
;565:=================
;566:weapon_railgun_fire
;567:=================
;568:*/
;569:#define	MAX_RAIL_HITS	4
;570:void weapon_railgun_fire (gentity_t *ent) {
line 586
;571:	vec3_t		end;
;572:#ifdef MISSIONPACK
;573:	vec3_t impactpoint, bouncedir;
;574:#endif
;575:	trace_t		trace;
;576:	gentity_t	*tent;
;577:	gentity_t	*traceEnt;
;578:	int			damage;
;579:	int			i;
;580:	int			hits;
;581:	int			unlinked;
;582:	int			passent;
;583:	gentity_t	*unlinkedEntities[MAX_RAIL_HITS];
;584:
;585:	// Shafe - Trep - Instagib
;586:	if (g_instagib.integer == 0)
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 0
NEI4 $208
line 587
;587:	{
line 588
;588:		damage = 100 * s_quadFactor;
ADDRLP4 132
CNSTF4 1120403456
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 589
;589:	} else {
ADDRGP4 $209
JUMPV
LABELV $208
line 590
;590:		damage = 1000 * s_quadFactor;
ADDRLP4 132
CNSTF4 1148846080
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 591
;591:	}
LABELV $209
line 594
;592:	/////////////////////////////////////
;593:
;594:	VectorMA (muzzle, 8192, forward, end);
ADDRLP4 136
CNSTF4 1174405120
ASGNF4
ADDRLP4 88
ADDRGP4 muzzle
INDIRF4
ADDRLP4 136
INDIRF4
ADDRGP4 forward
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88+4
ADDRGP4 muzzle+4
INDIRF4
ADDRLP4 136
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
line 598
;595:
;596://unlagged - backward reconciliation #2
;597:	// backward-reconcile the other clients
;598:	G_DoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 602
;599://unlagged - backward reconciliation #2
;600:
;601:	// trace only against the solids, so the railgun will go through people
;602:	unlinked = 0;
ADDRLP4 60
CNSTI4 0
ASGNI4
line 603
;603:	hits = 0;
ADDRLP4 128
CNSTI4 0
ASGNI4
line 604
;604:	passent = ent->s.number;
ADDRLP4 100
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
LABELV $217
line 605
;605:	do {
line 606
;606:		trap_Trace (&trace, muzzle, NULL, NULL, end, passent, MASK_SHOT );
ADDRLP4 4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRLP4 140
CNSTP4 0
ASGNP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRLP4 140
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
line 607
;607:		if ( trace.entityNum >= ENTITYNUM_MAX_NORMAL ) {
ADDRLP4 4+52
INDIRI4
CNSTI4 1022
LTI4 $220
line 608
;608:			break;
ADDRGP4 $219
JUMPV
LABELV $220
line 610
;609:		}
;610:		traceEnt = &g_entities[ trace.entityNum ];
ADDRLP4 0
CNSTI4 868
ADDRLP4 4+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 611
;611:		if ( traceEnt->takedamage ) {
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
EQI4 $224
line 613
;612:#ifdef MISSIONPACK
;613:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
ADDRLP4 144
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $226
ADDRLP4 144
INDIRP4
CNSTI4 2716
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $226
line 614
;614:				if ( G_InvulnerabilityEffect( traceEnt, forward, trace.endpos, impactpoint, bouncedir ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 116
ARGP4
ADDRLP4 148
ADDRGP4 G_InvulnerabilityEffect
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $227
line 615
;615:					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
ADDRGP4 muzzle
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 116
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 G_BounceProjectile
CALLV
pop
line 617
;616:					// snap the endpos to integers to save net bandwidth, but nudged towards the line
;617:					SnapVectorTowards( trace.endpos, muzzle );
ADDRLP4 4+12
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 619
;618:					// send railgun beam effect
;619:					tent = G_TempEntity( trace.endpos, EV_RAILTRAIL );
ADDRLP4 4+12
ARGP4
CNSTI4 55
ARGI4
ADDRLP4 152
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 64
ADDRLP4 152
INDIRP4
ASGNP4
line 621
;620:					// set player number for custom colors on the railtrail
;621:					tent->s.clientNum = ent->s.clientNum;
ADDRLP4 156
CNSTI4 168
ASGNI4
ADDRLP4 64
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 622
;622:					VectorCopy( muzzle, tent->s.origin2 );
ADDRLP4 64
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 624
;623:					// move origin a bit to come closer to the drawn gun muzzle
;624:					VectorMA( tent->s.origin2, 4, right, tent->s.origin2 );
ADDRLP4 160
ADDRLP4 64
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRGP4 right
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 164
ADDRLP4 64
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 164
INDIRP4
ADDRLP4 164
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRGP4 right+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 168
ADDRLP4 64
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRGP4 right+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 625
;625:					VectorMA( tent->s.origin2, -1, up, tent->s.origin2 );
ADDRLP4 172
ADDRLP4 64
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 172
INDIRP4
ADDRLP4 172
INDIRP4
INDIRF4
CNSTF4 3212836864
ADDRGP4 up
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 176
ADDRLP4 64
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 176
INDIRP4
ADDRLP4 176
INDIRP4
INDIRF4
CNSTF4 3212836864
ADDRGP4 up+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 180
ADDRLP4 64
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
ADDRLP4 180
INDIRP4
ADDRLP4 180
INDIRP4
INDIRF4
CNSTF4 3212836864
ADDRGP4 up+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 626
;626:					tent->s.eventParm = 255;	// don't make the explosion at the end
ADDRLP4 64
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 255
ASGNI4
line 628
;627:					//
;628:					VectorCopy( impactpoint, muzzle );
ADDRGP4 muzzle
ADDRLP4 104
INDIRB
ASGNB 12
line 630
;629:					// the player can hit him/herself with the bounced rail
;630:					passent = ENTITYNUM_NONE;
ADDRLP4 100
CNSTI4 1023
ASGNI4
line 631
;631:				}
line 632
;632:			}
ADDRGP4 $227
JUMPV
LABELV $226
line 633
;633:			else {
line 634
;634:				if( LogAccuracyHit( traceEnt, ent ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 148
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $238
line 635
;635:					hits++;
ADDRLP4 128
ADDRLP4 128
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 636
;636:				}
LABELV $238
line 637
;637:				G_Damage (traceEnt, ent, ent, forward, trace.endpos, damage, 0, MOD_RAILGUN);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
ARGP4
ADDRLP4 152
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 132
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 10
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 638
;638:			}
LABELV $227
line 645
;639:#else
;640:				if( LogAccuracyHit( traceEnt, ent ) ) {
;641:					hits++;
;642:				}
;643:				G_Damage (traceEnt, ent, ent, forward, trace.endpos, damage, 0, MOD_RAILGUN);
;644:#endif
;645:		}
LABELV $224
line 646
;646:		if ( trace.contents & CONTENTS_SOLID ) {
ADDRLP4 4+48
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $241
line 647
;647:			break;		// we hit something solid enough to stop the beam
ADDRGP4 $219
JUMPV
LABELV $241
line 650
;648:		}
;649:		// unlink this entity, so the next trace will go past it
;650:		trap_UnlinkEntity( traceEnt );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 651
;651:		unlinkedEntities[unlinked] = traceEnt;
ADDRLP4 60
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 72
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 652
;652:		unlinked++;
ADDRLP4 60
ADDRLP4 60
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 653
;653:	} while ( unlinked < MAX_RAIL_HITS );
LABELV $218
ADDRLP4 60
INDIRI4
CNSTI4 4
LTI4 $217
LABELV $219
line 657
;654:
;655://unlagged - backward reconciliation #2
;656:	// put them back
;657:	G_UndoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 661
;658://unlagged - backward reconciliation #2
;659:
;660:	// link back in any entities we unlinked
;661:	for ( i = 0 ; i < unlinked ; i++ ) {
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRGP4 $247
JUMPV
LABELV $244
line 662
;662:		trap_LinkEntity( unlinkedEntities[i] );
ADDRLP4 68
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 72
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 663
;663:	}
LABELV $245
line 661
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $247
ADDRLP4 68
INDIRI4
ADDRLP4 60
INDIRI4
LTI4 $244
line 668
;664:
;665:	// the final trace endpos will be the terminal point of the rail trail
;666:
;667:	// snap the endpos to integers to save net bandwidth, but nudged towards the line
;668:	SnapVectorTowards( trace.endpos, muzzle );
ADDRLP4 4+12
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 671
;669:
;670:	// send railgun beam effect
;671:	tent = G_TempEntity( trace.endpos, EV_RAILTRAIL );
ADDRLP4 4+12
ARGP4
CNSTI4 55
ARGI4
ADDRLP4 140
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 64
ADDRLP4 140
INDIRP4
ASGNP4
line 674
;672:
;673:	// set player number for custom colors on the railtrail
;674:	tent->s.clientNum = ent->s.clientNum;
ADDRLP4 144
CNSTI4 168
ASGNI4
ADDRLP4 64
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
line 676
;675:
;676:	VectorCopy( muzzle, tent->s.origin2 );
ADDRLP4 64
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 678
;677:	// move origin a bit to come closer to the drawn gun muzzle
;678:	VectorMA( tent->s.origin2, 4, right, tent->s.origin2 );
ADDRLP4 148
ADDRLP4 64
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 148
INDIRP4
ADDRLP4 148
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRGP4 right
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 152
ADDRLP4 64
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRGP4 right+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 156
ADDRLP4 64
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRGP4 right+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 679
;679:	VectorMA( tent->s.origin2, -1, up, tent->s.origin2 );
ADDRLP4 160
ADDRLP4 64
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRF4
CNSTF4 3212836864
ADDRGP4 up
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 164
ADDRLP4 64
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 164
INDIRP4
ADDRLP4 164
INDIRP4
INDIRF4
CNSTF4 3212836864
ADDRGP4 up+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 168
ADDRLP4 64
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRF4
CNSTF4 3212836864
ADDRGP4 up+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 682
;680:
;681:	// no explosion at end if SURF_NOIMPACT, but still make the trail
;682:	if ( trace.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 4+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $254
line 683
;683:		tent->s.eventParm = 255;	// don't make the explosion at the end
ADDRLP4 64
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 255
ASGNI4
line 684
;684:	} else {
ADDRGP4 $255
JUMPV
LABELV $254
line 685
;685:		tent->s.eventParm = DirToByte( trace.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 172
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 64
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 172
INDIRI4
ASGNI4
line 686
;686:	}
LABELV $255
line 687
;687:	tent->s.clientNum = ent->s.clientNum;
ADDRLP4 172
CNSTI4 168
ASGNI4
ADDRLP4 64
INDIRP4
ADDRLP4 172
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 172
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 690
;688:
;689:	// give the shooter a reward sound if they have made two railgun hits in a row
;690:	if ( hits == 0 ) {
ADDRLP4 128
INDIRI4
CNSTI4 0
NEI4 $258
line 692
;691:		// complete miss
;692:		ent->client->accurateCount = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2580
ADDP4
CNSTI4 0
ASGNI4
line 693
;693:	} else {
ADDRGP4 $259
JUMPV
LABELV $258
line 695
;694:		// check for "impressive" reward sound
;695:		ent->client->accurateCount += hits;
ADDRLP4 176
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2580
ADDP4
ASGNP4
ADDRLP4 176
INDIRP4
ADDRLP4 176
INDIRP4
INDIRI4
ADDRLP4 128
INDIRI4
ADDI4
ASGNI4
line 696
;696:		if ( ent->client->accurateCount >= 2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2580
ADDP4
INDIRI4
CNSTI4 2
LTI4 $260
line 697
;697:			ent->client->accurateCount -= 2;
ADDRLP4 180
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2580
ADDP4
ASGNP4
ADDRLP4 180
INDIRP4
ADDRLP4 180
INDIRP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 698
;698:			ent->client->ps.persistant[PERS_IMPRESSIVE_COUNT]++;
ADDRLP4 184
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 284
ADDP4
ASGNP4
ADDRLP4 184
INDIRP4
ADDRLP4 184
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 700
;699:			// add the sprite over the player's head
;700:			ent->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 188
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 188
INDIRP4
ADDRLP4 188
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 701
;701:			ent->client->ps.eFlags |= EF_AWARD_IMPRESSIVE;
ADDRLP4 192
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 192
INDIRP4
ADDRLP4 192
INDIRP4
INDIRI4
CNSTI4 32768
BORI4
ASGNI4
line 702
;702:			ent->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2616
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 703
;703:		}
LABELV $260
line 704
;704:		ent->client->accuracy_hits++;
ADDRLP4 180
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2588
ADDP4
ASGNP4
ADDRLP4 180
INDIRP4
ADDRLP4 180
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 705
;705:	}
LABELV $259
line 707
;706:
;707:}
LABELV $207
endproc weapon_railgun_fire 196 32
export Weapon_GrapplingHook_Fire
proc Weapon_GrapplingHook_Fire 4 20
line 719
;708:
;709:
;710:/*
;711:======================================================================
;712:
;713:GRAPPLING HOOK
;714:
;715:======================================================================
;716:*/
;717:
;718:void Weapon_GrapplingHook_Fire (gentity_t *ent)
;719:{
line 721
;720:	// Shafe - Trep  - Offhand Grappling Hook
;721:	AngleVectors (ent->client->ps.viewangles, forward, right, up);
ADDRFP4 0
INDIRP4
CNSTI4 516
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
line 722
;722:	CalcMuzzlePoint ( ent, forward, right, up, muzzle );
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
line 725
;723:	// End Shafe
;724:	
;725:	if (!ent->client->fireHeld && !ent->client->hook)
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 2628
ADDP4
INDIRI4
CNSTI4 0
NEI4 $264
ADDRLP4 0
INDIRP4
CNSTI4 2632
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $264
line 726
;726:		fire_grapple (ent, muzzle, forward);
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
LABELV $264
line 728
;727:
;728:	ent->client->fireHeld = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2628
ADDP4
CNSTI4 1
ASGNI4
line 729
;729:}
LABELV $263
endproc Weapon_GrapplingHook_Fire 4 20
export Weapon_HookFree
proc Weapon_HookFree 4 4
line 733
;730:
;731:
;732:void Weapon_HookFree (gentity_t *ent)
;733:{
line 734
;734:	ent->parent->client->hook = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2632
ADDP4
CNSTP4 0
ASGNP4
line 735
;735:	ent->parent->client->ps.pm_flags &= ~PMF_GRAPPLE_PULL;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 516
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
line 736
;736:	G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 737
;737:}
LABELV $266
endproc Weapon_HookFree 4 4
export Weapon_HookThink
proc Weapon_HookThink 36 8
line 740
;738:
;739:void Weapon_HookThink (gentity_t *ent)
;740:{
line 741
;741:	if (ent->enemy) {
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $268
line 744
;742:		vec3_t v, oldorigin;
;743:
;744:		VectorCopy(ent->r.currentOrigin, oldorigin);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 745
;745:		v[0] = ent->enemy->r.currentOrigin[0] + (ent->enemy->r.mins[0] + ent->enemy->r.maxs[0]) * 0.5;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 24
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 746
;746:		v[1] = ent->enemy->r.currentOrigin[1] + (ent->enemy->r.mins[1] + ent->enemy->r.maxs[1]) * 0.5;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0+4
ADDRLP4 28
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 28
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 747
;747:		v[2] = ent->enemy->r.currentOrigin[2] + (ent->enemy->r.mins[2] + ent->enemy->r.maxs[2]) * 0.5;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 32
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 32
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 748
;748:		SnapVectorTowards( v, oldorigin );	// save net bandwidth
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 750
;749:
;750:		G_SetOrigin( ent, v );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 751
;751:	}
LABELV $268
line 753
;752:
;753:	VectorCopy( ent->r.currentOrigin, ent->parent->client->ps.grapplePoint);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 754
;754:}
LABELV $267
endproc Weapon_HookThink 36 8
export Weapon_LightningFire
proc Weapon_LightningFire 144 32
line 764
;755:
;756:/*
;757:======================================================================
;758:
;759:LIGHTNING GUN
;760:
;761:======================================================================
;762:*/
;763:
;764:void Weapon_LightningFire( gentity_t *ent ) {
line 776
;765:	trace_t		tr;
;766:	vec3_t		end;
;767:#ifdef MISSIONPACK
;768:	vec3_t impactpoint, bouncedir;
;769:#endif
;770:	gentity_t	*traceEnt, *tent;
;771:	int			damage, i, passent;
;772:
;773://unlagged - server options
;774:	// this is configurable now
;775://	damage = 8 * s_quadFactor;
;776:	damage = g_lightningDamage.integer * s_quadFactor;
ADDRLP4 108
ADDRGP4 g_lightningDamage+12
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 779
;777://unlagged - server options
;778:
;779:	passent = ent->s.number;
ADDRLP4 80
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 780
;780:	for (i = 0; i < 10; i++) {
ADDRLP4 76
CNSTI4 0
ASGNI4
LABELV $274
line 781
;781:		VectorMA( muzzle, LIGHTNING_RANGE, forward, end );
ADDRLP4 112
CNSTF4 1145044992
ASGNF4
ADDRLP4 0
ADDRGP4 muzzle
INDIRF4
ADDRLP4 112
INDIRF4
ADDRGP4 forward
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRGP4 muzzle+4
INDIRF4
ADDRLP4 112
INDIRF4
ADDRGP4 forward+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 muzzle+8
INDIRF4
CNSTF4 1145044992
ADDRGP4 forward+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 785
;782:
;783://unlagged - backward reconciliation #2
;784:	// backward-reconcile the other clients
;785:	G_DoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 788
;786://unlagged - backward reconciliation #2
;787:
;788:		trap_Trace (&tr, muzzle, NULL, NULL, end, passent, MASK_SHOT);
ADDRLP4 16
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
ADDRLP4 0
ARGP4
ADDRLP4 80
INDIRI4
ARGI4
CNSTI4 100664321
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 792
;789:
;790://unlagged - backward reconciliation #2
;791:	// put them back
;792:	G_UndoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 797
;793://unlagged - backward reconciliation #2
;794:
;795:#ifdef MISSIONPACK
;796:		// if not the first trace (the lightning bounced of an invulnerability sphere)
;797:		if (i) {
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $284
line 801
;798:			// add bounced off lightning bolt temp entity
;799:			// the first lightning bolt is a cgame only visual
;800:			//
;801:			tent = G_TempEntity( muzzle, EV_LIGHTNINGBOLT );
ADDRGP4 muzzle
ARGP4
CNSTI4 77
ARGI4
ADDRLP4 120
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 120
INDIRP4
ASGNP4
line 802
;802:			VectorCopy( tr.endpos, end );
ADDRLP4 0
ADDRLP4 16+12
INDIRB
ASGNB 12
line 803
;803:			SnapVector( end );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 124
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 124
INDIRF4
ASGNF4
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 128
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 128
INDIRF4
ASGNF4
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRLP4 132
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 132
INDIRF4
ASGNF4
line 804
;804:			VectorCopy( end, tent->s.origin2 );
ADDRLP4 72
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 805
;805:		}
LABELV $284
line 807
;806:#endif
;807:		if ( tr.entityNum == ENTITYNUM_NONE ) {
ADDRLP4 16+52
INDIRI4
CNSTI4 1023
NEI4 $291
line 808
;808:			return;
ADDRGP4 $272
JUMPV
LABELV $291
line 811
;809:		}
;810:
;811:		traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 12
CNSTI4 868
ADDRLP4 16+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 813
;812:
;813:		if ( traceEnt->takedamage) {
ADDRLP4 12
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
EQI4 $295
line 815
;814:#ifdef MISSIONPACK
;815:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
ADDRLP4 120
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 120
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $297
ADDRLP4 120
INDIRP4
CNSTI4 2716
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $297
line 816
;816:				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 16+12
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 96
ARGP4
ADDRLP4 124
ADDRGP4 G_InvulnerabilityEffect
CALLI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 0
EQI4 $300
line 817
;817:					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
ADDRGP4 muzzle
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 96
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_BounceProjectile
CALLV
pop
line 818
;818:					VectorCopy( impactpoint, muzzle );
ADDRGP4 muzzle
ADDRLP4 84
INDIRB
ASGNB 12
line 819
;819:					VectorSubtract( end, impactpoint, forward );
ADDRGP4 forward
ADDRLP4 0
INDIRF4
ADDRLP4 84
INDIRF4
SUBF4
ASGNF4
ADDRGP4 forward+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 84+4
INDIRF4
SUBF4
ASGNF4
ADDRGP4 forward+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 84+8
INDIRF4
SUBF4
ASGNF4
line 820
;820:					VectorNormalize(forward);
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 822
;821:					// the player can hit him/herself with the bounced lightning
;822:					passent = ENTITYNUM_NONE;
ADDRLP4 80
CNSTI4 1023
ASGNI4
line 823
;823:				}
ADDRGP4 $275
JUMPV
LABELV $300
line 824
;824:				else {
line 825
;825:					VectorCopy( tr.endpos, muzzle );
ADDRGP4 muzzle
ADDRLP4 16+12
INDIRB
ASGNB 12
line 826
;826:					passent = traceEnt->s.number;
ADDRLP4 80
ADDRLP4 12
INDIRP4
INDIRI4
ASGNI4
line 827
;827:				}
line 828
;828:				continue;
ADDRGP4 $275
JUMPV
LABELV $297
line 830
;829:			}
;830:			else {
line 831
;831:				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
ADDRLP4 12
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
ADDRLP4 16+12
ARGP4
ADDRLP4 108
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 11
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 833
;832:					damage, 0, MOD_LIGHTNING);
;833:			}
line 838
;834:#else
;835:				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
;836:					damage, 0, MOD_LIGHTNING);
;837:#endif
;838:		}
LABELV $295
line 840
;839:
;840:		if ( traceEnt->takedamage && traceEnt->client ) {
ADDRLP4 12
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
EQI4 $311
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $311
line 841
;841:			tent = G_TempEntity( tr.endpos, EV_MISSILE_HIT );
ADDRLP4 16+12
ARGP4
CNSTI4 52
ARGI4
ADDRLP4 124
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 124
INDIRP4
ASGNP4
line 842
;842:			tent->s.otherEntityNum = traceEnt->s.number;
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 12
INDIRP4
INDIRI4
ASGNI4
line 843
;843:			tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 16+24
ARGP4
ADDRLP4 128
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 128
INDIRI4
ASGNI4
line 844
;844:			tent->s.weapon = ent->s.weapon;
ADDRLP4 132
CNSTI4 192
ASGNI4
ADDRLP4 72
INDIRP4
ADDRLP4 132
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 132
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 845
;845:			if( LogAccuracyHit( traceEnt, ent ) ) {
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 0
EQI4 $276
line 846
;846:				ent->client->accuracy_hits++;
ADDRLP4 140
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2588
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 847
;847:			}
line 848
;848:		} else if ( !( tr.surfaceFlags & SURF_NOIMPACT ) ) {
ADDRGP4 $276
JUMPV
LABELV $311
ADDRLP4 16+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $276
line 849
;849:			tent = G_TempEntity( tr.endpos, EV_MISSILE_MISS );
ADDRLP4 16+12
ARGP4
CNSTI4 53
ARGI4
ADDRLP4 124
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 124
INDIRP4
ASGNP4
line 850
;850:			tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 16+24
ARGP4
ADDRLP4 128
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 128
INDIRI4
ASGNI4
line 851
;851:		}
line 853
;852:
;853:		break;
ADDRGP4 $276
JUMPV
LABELV $275
line 780
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 10
LTI4 $274
LABELV $276
line 855
;854:	}
;855:}
LABELV $272
endproc Weapon_LightningFire 144 32
export Weapon_Nailgun_Fire
proc Weapon_Nailgun_Fire 20 20
line 866
;856:
;857:#ifdef MISSIONPACK
;858:/*
;859:======================================================================
;860:
;861:NAILGUN
;862:
;863:======================================================================
;864:*/
;865:
;866:void Weapon_Nailgun_Fire (gentity_t *ent) {
line 870
;867:	gentity_t	*m;
;868:	int			count;
;869:
;870:	for( count = 0; count < NUM_NAILSHOTS; count++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $323
line 871
;871:		m = fire_nail (ent, muzzle, forward, right, up );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRLP4 8
ADDRGP4 fire_nail
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 872
;872:		m->damage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 748
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
line 873
;873:		m->splashDamage *= s_quadFactor;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 752
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
line 874
;874:	}
LABELV $324
line 870
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 15
LTI4 $323
line 877
;875:
;876://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;877:}
LABELV $322
endproc Weapon_Nailgun_Fire 20 20
export weapon_proxlauncher_fire
proc weapon_proxlauncher_fire 20 12
line 888
;878:
;879:
;880:/*
;881:======================================================================
;882:
;883:PROXIMITY MINE LAUNCHER
;884:
;885:======================================================================
;886:*/
;887:
;888:void weapon_proxlauncher_fire (gentity_t *ent) {
line 892
;889:	gentity_t	*m;
;890:
;891:	// extra vertical velocity
;892:	forward[2] += 0.2f;
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
line 893
;893:	VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 895
;894:
;895:	m = fire_prox (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 8
ADDRGP4 fire_prox
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 896
;896:	m->damage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 748
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
line 897
;897:	m->splashDamage *= s_quadFactor;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 752
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
line 900
;898:
;899://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;900:}
LABELV $327
endproc weapon_proxlauncher_fire 20 12
export LogAccuracyHit
proc LogAccuracyHit 4 8
line 912
;901:
;902:#endif
;903:
;904://======================================================================
;905:
;906:
;907:/*
;908:===============
;909:LogAccuracyHit
;910:===============
;911:*/
;912:qboolean LogAccuracyHit( gentity_t *target, gentity_t *attacker ) {
line 913
;913:	if( !target->takedamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
NEI4 $330
line 914
;914:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $329
JUMPV
LABELV $330
line 917
;915:	}
;916:
;917:	if ( target == attacker ) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
NEU4 $332
line 918
;918:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $329
JUMPV
LABELV $332
line 921
;919:	}
;920:
;921:	if( !target->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $334
line 922
;922:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $329
JUMPV
LABELV $334
line 925
;923:	}
;924:
;925:	if( !attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $336
line 926
;926:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $329
JUMPV
LABELV $336
line 929
;927:	}
;928:
;929:	if( target->client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $338
line 930
;930:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $329
JUMPV
LABELV $338
line 933
;931:	}
;932:
;933:	if ( OnSameTeam( target, attacker ) ) {
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
EQI4 $340
line 934
;934:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $329
JUMPV
LABELV $340
line 937
;935:	}
;936:
;937:	return qtrue;
CNSTI4 1
RETI4
LABELV $329
endproc LogAccuracyHit 4 8
export CalcMuzzlePoint
proc CalcMuzzlePoint 48 4
line 948
;938:}
;939:
;940:
;941:/*
;942:===============
;943:CalcMuzzlePoint
;944:
;945:set muzzle location relative to pivoting eye
;946:===============
;947:*/
;948:void CalcMuzzlePoint ( gentity_t *ent, vec3_t forward, vec3_t right, vec3_t up, vec3_t muzzlePoint ) {
line 949
;949:	VectorCopy( ent->s.pos.trBase, muzzlePoint );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 950
;950:	muzzlePoint[2] += ent->client->ps.viewheight;
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
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 951
;951:	VectorMA( muzzlePoint, 14, forward, muzzlePoint );
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
line 953
;952:	// snap to integer coordinates for more efficient network bandwidth usage
;953:	SnapVector( muzzlePoint );
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
line 954
;954:}
LABELV $342
endproc CalcMuzzlePoint 48 4
export CalcMuzzlePointOrigin
proc CalcMuzzlePointOrigin 48 4
line 963
;955:
;956:/*
;957:===============
;958:CalcMuzzlePointOrigin
;959:
;960:set muzzle location relative to pivoting eye
;961:===============
;962:*/
;963:void CalcMuzzlePointOrigin ( gentity_t *ent, vec3_t origin, vec3_t forward, vec3_t right, vec3_t up, vec3_t muzzlePoint ) {
line 964
;964:	VectorCopy( ent->s.pos.trBase, muzzlePoint );
ADDRFP4 20
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 965
;965:	muzzlePoint[2] += ent->client->ps.viewheight;
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
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 966
;966:	VectorMA( muzzlePoint, 14, forward, muzzlePoint );
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
line 968
;967:	// snap to integer coordinates for more efficient network bandwidth usage
;968:	SnapVector( muzzlePoint );
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
line 969
;969:}
LABELV $343
endproc CalcMuzzlePointOrigin 48 4
export FireWeapon
proc FireWeapon 28 24
line 978
;970:
;971:
;972:
;973:/*
;974:===============
;975:FireWeapon
;976:===============
;977:*/
;978:void FireWeapon( gentity_t *ent ) {
line 979
;979:	if (ent->client->ps.powerups[PW_QUAD] ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $345
line 980
;980:		s_quadFactor = g_quadfactor.value;
ADDRGP4 s_quadFactor
ADDRGP4 g_quadfactor+8
INDIRF4
ASGNF4
line 981
;981:	} else {
ADDRGP4 $346
JUMPV
LABELV $345
line 982
;982:		s_quadFactor = 1;
ADDRGP4 s_quadFactor
CNSTF4 1065353216
ASGNF4
line 983
;983:	}
LABELV $346
line 985
;984:#ifdef MISSIONPACK
;985:	if( ent->client->persistantPowerup && ent->client->persistantPowerup->item && ent->client->persistantPowerup->item->giTag == PW_DOUBLER ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2652
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $348
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 836
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $348
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 12
NEI4 $348
line 986
;986:		s_quadFactor *= 2;
ADDRLP4 12
ADDRGP4 s_quadFactor
ASGNP4
ADDRLP4 12
INDIRP4
CNSTF4 1073741824
ADDRLP4 12
INDIRP4
INDIRF4
MULF4
ASGNF4
line 987
;987:	}
LABELV $348
line 991
;988:#endif
;989:
;990:	// track shots taken for accuracy tracking.  Grapple is not a weapon and gauntet is just not tracked
;991:	if( ent->s.weapon != WP_GRAPPLING_HOOK && ent->s.weapon != WP_GAUNTLET ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 10
EQI4 $350
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $350
line 993
;992:#ifdef MISSIONPACK
;993:		if( ent->s.weapon == WP_NAILGUN ) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 11
NEI4 $352
line 994
;994:			ent->client->accuracy_shots += NUM_NAILSHOTS;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2584
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 15
ADDI4
ASGNI4
line 995
;995:		} else {
ADDRGP4 $353
JUMPV
LABELV $352
line 996
;996:			ent->client->accuracy_shots++;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2584
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 997
;997:		}
LABELV $353
line 1001
;998:#else
;999:		ent->client->accuracy_shots++;
;1000:#endif
;1001:	}
LABELV $350
line 1004
;1002:
;1003:	// set aiming directions
;1004:	AngleVectors (ent->client->ps.viewangles, forward, right, up);
ADDRFP4 0
INDIRP4
CNSTI4 516
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
line 1006
;1005:
;1006:	CalcMuzzlePointOrigin ( ent, ent->client->oldOrigin, forward, right, up, muzzle );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2540
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
line 1009
;1007:
;1008:	// fire the specific weapon
;1009:	switch( ent->s.weapon ) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 1
LTI4 $355
ADDRLP4 20
INDIRI4
CNSTI4 13
GTI4 $355
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $373-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $373
address $357
address $360
address $359
address $364
address $365
address $358
address $367
address $366
address $368
address $369
address $370
address $371
address $372
code
LABELV $357
line 1011
;1010:	case WP_GAUNTLET:
;1011:		Weapon_Gauntlet( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Gauntlet
CALLV
pop
line 1012
;1012:		break;
ADDRGP4 $355
JUMPV
LABELV $358
line 1015
;1013:	case WP_LIGHTNING:
;1014:		//Weapon_LightningFire( ent );
;1015:		Weapon_fire_flame(ent , qfalse );  // Shafe - Trep - Flame Thrower
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Weapon_fire_flame
CALLV
pop
line 1016
;1016:		break;
ADDRGP4 $355
JUMPV
LABELV $359
line 1018
;1017:	case WP_SHOTGUN:
;1018:		weapon_supershotgun_fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_supershotgun_fire
CALLV
pop
line 1019
;1019:		break;
ADDRGP4 $355
JUMPV
LABELV $360
line 1021
;1020:	case WP_MACHINEGUN:
;1021:		if ( g_gametype.integer != GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $361
line 1022
;1022:			Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_DAMAGE );
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1120403456
ARGF4
CNSTI4 7
ARGI4
ADDRGP4 Bullet_Fire
CALLV
pop
line 1023
;1023:		} else {
ADDRGP4 $355
JUMPV
LABELV $361
line 1024
;1024:			Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_TEAM_DAMAGE );
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1120403456
ARGF4
CNSTI4 5
ARGI4
ADDRGP4 Bullet_Fire
CALLV
pop
line 1025
;1025:		}
line 1026
;1026:		break;
ADDRGP4 $355
JUMPV
LABELV $364
line 1028
;1027:	case WP_GRENADE_LAUNCHER:
;1028:		weapon_grenadelauncher_fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_grenadelauncher_fire
CALLV
pop
line 1029
;1029:		break;
ADDRGP4 $355
JUMPV
LABELV $365
line 1031
;1030:	case WP_ROCKET_LAUNCHER:
;1031:		Weapon_RocketLauncher_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_RocketLauncher_Fire
CALLV
pop
line 1032
;1032:		break;
ADDRGP4 $355
JUMPV
LABELV $366
line 1034
;1033:	case WP_PLASMAGUN:
;1034:		Weapon_Plasmagun_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Plasmagun_Fire
CALLV
pop
line 1035
;1035:		break;
ADDRGP4 $355
JUMPV
LABELV $367
line 1037
;1036:	case WP_RAILGUN:
;1037:		weapon_railgun_fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_railgun_fire
CALLV
pop
line 1038
;1038:		break;
ADDRGP4 $355
JUMPV
LABELV $368
line 1040
;1039:	case WP_BFG:
;1040:		BFG_Fire( ent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BFG_Fire
CALLV
pop
line 1041
;1041:		break;
ADDRGP4 $355
JUMPV
LABELV $369
line 1043
;1042:	case WP_GRAPPLING_HOOK:
;1043:		Weapon_GrapplingHook_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_GrapplingHook_Fire
CALLV
pop
line 1044
;1044:		break;
ADDRGP4 $355
JUMPV
LABELV $370
line 1047
;1045:#ifdef MISSIONPACK
;1046:	case WP_NAILGUN:
;1047:		Weapon_Nailgun_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Nailgun_Fire
CALLV
pop
line 1048
;1048:		break;
ADDRGP4 $355
JUMPV
LABELV $371
line 1050
;1049:	case WP_PROX_LAUNCHER:
;1050:		weapon_proxlauncher_fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_proxlauncher_fire
CALLV
pop
line 1051
;1051:		break;
ADDRGP4 $355
JUMPV
LABELV $372
line 1053
;1052:	case WP_CHAINGUN:
;1053:		Bullet_Fire( ent, CHAINGUN_SPREAD, MACHINEGUN_DAMAGE );
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1142292480
ARGF4
CNSTI4 7
ARGI4
ADDRGP4 Bullet_Fire
CALLV
pop
line 1054
;1054:		break;
line 1058
;1055:#endif
;1056:	default:
;1057:// FIXME		G_Error( "Bad ent->s.weapon" );
;1058:		break;
LABELV $355
line 1060
;1059:	}
;1060:}
LABELV $344
endproc FireWeapon 28 24
export FireWeapon2
proc FireWeapon2 12 20
line 1070
;1061:
;1062:
;1063:/* 
;1064:=============== 
;1065:FireWeapon2 
;1066:Shafe - Trep - Alt Fire FireWeapon2
;1067:Right now this just shoots rockets...
;1068:=============== 
;1069:*/ 
;1070:void FireWeapon2( gentity_t *ent ) { 
line 1071
;1071: if (ent->client->ps.powerups[PW_QUAD] ) { 
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $376
line 1072
;1072:  s_quadFactor = g_quadfactor.value; 
ADDRGP4 s_quadFactor
ADDRGP4 g_quadfactor+8
INDIRF4
ASGNF4
line 1073
;1073: } else { 
ADDRGP4 $377
JUMPV
LABELV $376
line 1074
;1074:  s_quadFactor = 1; 
ADDRGP4 s_quadFactor
CNSTF4 1065353216
ASGNF4
line 1075
;1075: } 
LABELV $377
line 1078
;1076:
;1077: // track shots taken for accuracy tracking.  Grapple is not a weapon and gauntet is just not tracked 
;1078: if( ent->s.weapon != WP_GRAPPLING_HOOK && ent->s.weapon != WP_GAUNTLET ) { 
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
EQI4 $379
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $379
line 1081
;1079:   //ent->client->ps.persistant[PERS_ACCURACY_SHOTS]++;  // This doesnt exist?
;1080:	// ent->client->accuracy_shots++;
;1081: } 
LABELV $379
line 1084
;1082:
;1083: // set aiming directions 
;1084: AngleVectors (ent->client->ps.viewangles, forward, right, up); 
ADDRFP4 0
INDIRP4
CNSTI4 516
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
line 1086
;1085:
;1086: CalcMuzzlePoint ( ent, forward, right, up, muzzle ); 
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
line 1089
;1087:
;1088: // fire the specific weapon 
;1089: switch( ent->s.weapon ) { 
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
LTI4 $382
ADDRLP4 4
INDIRI4
CNSTI4 10
GTI4 $382
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $397-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $397
address $384
address $387
address $386
address $391
address $392
address $385
address $394
address $393
address $395
address $396
code
LABELV $384
line 1091
;1090: case WP_GAUNTLET: 
;1091:	Weapon_Gauntlet( ent ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Gauntlet
CALLV
pop
line 1092
;1092:	break; 
ADDRGP4 $382
JUMPV
LABELV $385
line 1094
;1093: case WP_LIGHTNING: 
;1094:	Weapon_fire_flame( ent, qtrue);  // Shafe - Trep - Flame Thrower
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Weapon_fire_flame
CALLV
pop
line 1095
;1095:	break; 
ADDRGP4 $382
JUMPV
LABELV $386
line 1098
;1096: case WP_SHOTGUN: 
;1097:	//Weapon_RocketLauncher_Fire( ent );
;1098:	weapon_supershotgun_fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_supershotgun_fire
CALLV
pop
line 1099
;1099:	break; 
ADDRGP4 $382
JUMPV
LABELV $387
line 1103
;1100: case WP_MACHINEGUN: 
;1101:  //Weapon_RocketLauncher_Fire( ent );
;1102: 
;1103:	 if ( g_gametype.integer != GT_TEAM ) { 
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $388
line 1104
;1104:   Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_DAMAGE ); 
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1120403456
ARGF4
CNSTI4 7
ARGI4
ADDRGP4 Bullet_Fire
CALLV
pop
line 1105
;1105:  } else { 
ADDRGP4 $382
JUMPV
LABELV $388
line 1106
;1106:   Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_TEAM_DAMAGE ); 
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1120403456
ARGF4
CNSTI4 5
ARGI4
ADDRGP4 Bullet_Fire
CALLV
pop
line 1107
;1107:  } 
line 1108
;1108:  break; 
ADDRGP4 $382
JUMPV
LABELV $391
line 1110
;1109: case WP_GRENADE_LAUNCHER: 
;1110:	weapon_altgrenadelauncher_fire( ent ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_altgrenadelauncher_fire
CALLV
pop
line 1111
;1111:	break; 
ADDRGP4 $382
JUMPV
LABELV $392
line 1113
;1112: case WP_ROCKET_LAUNCHER: 
;1113:	Weapon_RocketLauncher_AltFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_RocketLauncher_AltFire
CALLV
pop
line 1114
;1114:	break; 
ADDRGP4 $382
JUMPV
LABELV $393
line 1116
;1115: case WP_PLASMAGUN: 
;1116:	weapon_pdlauncher_fire( ent); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_pdlauncher_fire
CALLV
pop
line 1117
;1117:	break; 
ADDRGP4 $382
JUMPV
LABELV $394
line 1119
;1118: case WP_RAILGUN: 
;1119:	Weapon_RocketLauncher_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_RocketLauncher_Fire
CALLV
pop
line 1120
;1120:	break; 
ADDRGP4 $382
JUMPV
LABELV $395
line 1122
;1121: case WP_BFG: 
;1122:	BFG_Fire( ent, qtrue); 
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BFG_Fire
CALLV
pop
line 1123
;1123:	break; 
ADDRGP4 $382
JUMPV
LABELV $396
line 1125
;1124: case WP_GRAPPLING_HOOK: 
;1125:	Weapon_GrapplingHook_Fire( ent ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_GrapplingHook_Fire
CALLV
pop
line 1126
;1126:	break; 
line 1129
;1127: default: 
;1128:// FIXME  G_Error( "Bad ent->s.weapon" ); 
;1129:  break; 
LABELV $382
line 1131
;1130: } 
;1131:}
LABELV $375
endproc FireWeapon2 12 20
proc KamikazeRadiusDamage 4180 32
line 1141
;1132:
;1133:
;1134:#ifdef MISSIONPACK
;1135:
;1136:/*
;1137:===============
;1138:KamikazeRadiusDamage
;1139:===============
;1140:*/
;1141:static void KamikazeRadiusDamage( vec3_t origin, gentity_t *attacker, float damage, float radius ) {
line 1151
;1142:	float		dist;
;1143:	gentity_t	*ent;
;1144:	int			entityList[MAX_GENTITIES];
;1145:	int			numListedEntities;
;1146:	vec3_t		mins, maxs;
;1147:	vec3_t		v;
;1148:	vec3_t		dir;
;1149:	int			i, e;
;1150:
;1151:	if ( radius < 1 ) {
ADDRFP4 12
INDIRF4
CNSTF4 1065353216
GEF4 $400
line 1152
;1152:		radius = 1;
ADDRFP4 12
CNSTF4 1065353216
ASGNF4
line 1153
;1153:	}
LABELV $400
line 1155
;1154:
;1155:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $402
line 1156
;1156:		mins[i] = origin[i] - radius;
ADDRLP4 4164
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4164
INDIRI4
ADDRLP4 4140
ADDP4
ADDRLP4 4164
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRFP4 12
INDIRF4
SUBF4
ASGNF4
line 1157
;1157:		maxs[i] = origin[i] + radius;
ADDRLP4 4168
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4168
INDIRI4
ADDRLP4 4152
ADDP4
ADDRLP4 4168
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ASGNF4
line 1158
;1158:	}
LABELV $403
line 1155
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $402
line 1160
;1159:
;1160:	numListedEntities = trap_EntitiesInBox( mins, maxs, entityList, MAX_GENTITIES );
ADDRLP4 4140
ARGP4
ADDRLP4 4152
ARGP4
ADDRLP4 40
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4164
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4136
ADDRLP4 4164
INDIRI4
ASGNI4
line 1162
;1161:
;1162:	for ( e = 0 ; e < numListedEntities ; e++ ) {
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRGP4 $409
JUMPV
LABELV $406
line 1163
;1163:		ent = &g_entities[entityList[ e ]];
ADDRLP4 4
CNSTI4 868
ADDRLP4 32
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
line 1165
;1164:
;1165:		if (!ent->takedamage) {
ADDRLP4 4
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
NEI4 $410
line 1166
;1166:			continue;
ADDRGP4 $407
JUMPV
LABELV $410
line 1170
;1167:		}
;1168:
;1169:		// dont hit things we have already hit
;1170:		if( ent->kamikazeTime > level.time ) {
ADDRLP4 4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $412
line 1171
;1171:			continue;
ADDRGP4 $407
JUMPV
LABELV $412
line 1175
;1172:		}
;1173:
;1174:		// find the distance from the edge of the bounding box
;1175:		for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $415
line 1176
;1176:			if ( origin[i] < ent->r.absmin[i] ) {
ADDRLP4 4168
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4168
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4168
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 464
ADDP4
ADDP4
INDIRF4
GEF4 $419
line 1177
;1177:				v[i] = ent->r.absmin[i] - origin[i];
ADDRLP4 4172
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4172
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 4172
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 464
ADDP4
ADDP4
INDIRF4
ADDRLP4 4172
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1178
;1178:			} else if ( origin[i] > ent->r.absmax[i] ) {
ADDRGP4 $420
JUMPV
LABELV $419
ADDRLP4 4172
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4172
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4172
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 476
ADDP4
ADDP4
INDIRF4
LEF4 $421
line 1179
;1179:				v[i] = origin[i] - ent->r.absmax[i];
ADDRLP4 4176
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4176
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 4176
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4176
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 476
ADDP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1180
;1180:			} else {
ADDRGP4 $422
JUMPV
LABELV $421
line 1181
;1181:				v[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTF4 0
ASGNF4
line 1182
;1182:			}
LABELV $422
LABELV $420
line 1183
;1183:		}
LABELV $416
line 1175
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $415
line 1185
;1184:
;1185:		dist = VectorLength( v );
ADDRLP4 8
ARGP4
ADDRLP4 4168
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 4168
INDIRF4
ASGNF4
line 1186
;1186:		if ( dist >= radius ) {
ADDRLP4 36
INDIRF4
ADDRFP4 12
INDIRF4
LTF4 $423
line 1187
;1187:			continue;
ADDRGP4 $407
JUMPV
LABELV $423
line 1191
;1188:		}
;1189:
;1190://		if( CanDamage (ent, origin) ) {
;1191:			VectorSubtract (ent->r.currentOrigin, origin, dir);
ADDRLP4 4176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 4
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 4176
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 4
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 4176
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 20+8
ADDRLP4 4
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1194
;1192:			// push the center of mass higher than the origin so players
;1193:			// get knocked into the air more
;1194:			dir[2] += 24;
ADDRLP4 20+8
ADDRLP4 20+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 1195
;1195:			G_Damage( ent, NULL, attacker, dir, origin, damage, DAMAGE_RADIUS|DAMAGE_NO_TEAM_PROTECTION, MOD_KAMIKAZE );
ADDRLP4 4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRF4
CVFI4 4
ARGI4
CNSTI4 17
ARGI4
CNSTI4 27
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1196
;1196:			ent->kamikazeTime = level.time + 3000;
ADDRLP4 4
INDIRP4
CNSTI4 792
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 1198
;1197://		}
;1198:	}
LABELV $407
line 1162
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $409
ADDRLP4 32
INDIRI4
ADDRLP4 4136
INDIRI4
LTI4 $406
line 1199
;1199:}
LABELV $399
endproc KamikazeRadiusDamage 4180 32
proc KamikazeShockWave 4180 32
line 1206
;1200:
;1201:/*
;1202:===============
;1203:KamikazeShockWave
;1204:===============
;1205:*/
;1206:static void KamikazeShockWave( vec3_t origin, gentity_t *attacker, float damage, float push, float radius ) {
line 1216
;1207:	float		dist;
;1208:	gentity_t	*ent;
;1209:	int			entityList[MAX_GENTITIES];
;1210:	int			numListedEntities;
;1211:	vec3_t		mins, maxs;
;1212:	vec3_t		v;
;1213:	vec3_t		dir;
;1214:	int			i, e;
;1215:
;1216:	if ( radius < 1 )
ADDRFP4 16
INDIRF4
CNSTF4 1065353216
GEF4 $430
line 1217
;1217:		radius = 1;
ADDRFP4 16
CNSTF4 1065353216
ASGNF4
LABELV $430
line 1219
;1218:
;1219:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $432
line 1220
;1220:		mins[i] = origin[i] - radius;
ADDRLP4 4164
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4164
INDIRI4
ADDRLP4 4140
ADDP4
ADDRLP4 4164
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRFP4 16
INDIRF4
SUBF4
ASGNF4
line 1221
;1221:		maxs[i] = origin[i] + radius;
ADDRLP4 4168
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4168
INDIRI4
ADDRLP4 4152
ADDP4
ADDRLP4 4168
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRFP4 16
INDIRF4
ADDF4
ASGNF4
line 1222
;1222:	}
LABELV $433
line 1219
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $432
line 1224
;1223:
;1224:	numListedEntities = trap_EntitiesInBox( mins, maxs, entityList, MAX_GENTITIES );
ADDRLP4 4140
ARGP4
ADDRLP4 4152
ARGP4
ADDRLP4 40
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4164
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4136
ADDRLP4 4164
INDIRI4
ASGNI4
line 1226
;1225:
;1226:	for ( e = 0 ; e < numListedEntities ; e++ ) {
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRGP4 $439
JUMPV
LABELV $436
line 1227
;1227:		ent = &g_entities[entityList[ e ]];
ADDRLP4 4
CNSTI4 868
ADDRLP4 32
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
line 1230
;1228:
;1229:		// dont hit things we have already hit
;1230:		if( ent->kamikazeShockTime > level.time ) {
ADDRLP4 4
INDIRP4
CNSTI4 796
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $440
line 1231
;1231:			continue;
ADDRGP4 $437
JUMPV
LABELV $440
line 1235
;1232:		}
;1233:
;1234:		// find the distance from the edge of the bounding box
;1235:		for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $443
line 1236
;1236:			if ( origin[i] < ent->r.absmin[i] ) {
ADDRLP4 4168
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4168
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4168
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 464
ADDP4
ADDP4
INDIRF4
GEF4 $447
line 1237
;1237:				v[i] = ent->r.absmin[i] - origin[i];
ADDRLP4 4172
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4172
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 4172
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 464
ADDP4
ADDP4
INDIRF4
ADDRLP4 4172
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1238
;1238:			} else if ( origin[i] > ent->r.absmax[i] ) {
ADDRGP4 $448
JUMPV
LABELV $447
ADDRLP4 4172
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4172
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4172
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 476
ADDP4
ADDP4
INDIRF4
LEF4 $449
line 1239
;1239:				v[i] = origin[i] - ent->r.absmax[i];
ADDRLP4 4176
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4176
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 4176
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4176
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 476
ADDP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1240
;1240:			} else {
ADDRGP4 $450
JUMPV
LABELV $449
line 1241
;1241:				v[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTF4 0
ASGNF4
line 1242
;1242:			}
LABELV $450
LABELV $448
line 1243
;1243:		}
LABELV $444
line 1235
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $443
line 1245
;1244:
;1245:		dist = VectorLength( v );
ADDRLP4 8
ARGP4
ADDRLP4 4168
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 4168
INDIRF4
ASGNF4
line 1246
;1246:		if ( dist >= radius ) {
ADDRLP4 36
INDIRF4
ADDRFP4 16
INDIRF4
LTF4 $451
line 1247
;1247:			continue;
ADDRGP4 $437
JUMPV
LABELV $451
line 1251
;1248:		}
;1249:
;1250://		if( CanDamage (ent, origin) ) {
;1251:			VectorSubtract (ent->r.currentOrigin, origin, dir);
ADDRLP4 4176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 4
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 4176
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 4
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 4176
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 20+8
ADDRLP4 4
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1252
;1252:			dir[2] += 24;
ADDRLP4 20+8
ADDRLP4 20+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 1253
;1253:			G_Damage( ent, NULL, attacker, dir, origin, damage, DAMAGE_RADIUS|DAMAGE_NO_TEAM_PROTECTION, MOD_KAMIKAZE );
ADDRLP4 4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRF4
CVFI4 4
ARGI4
CNSTI4 17
ARGI4
CNSTI4 27
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1255
;1254:			//
;1255:			dir[2] = 0;
ADDRLP4 20+8
CNSTF4 0
ASGNF4
line 1256
;1256:			VectorNormalize(dir);
ADDRLP4 20
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1257
;1257:			if ( ent->client ) {
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $457
line 1258
;1258:				ent->client->ps.velocity[0] = dir[0] * push;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 20
INDIRF4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 1259
;1259:				ent->client->ps.velocity[1] = dir[1] * push;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 20+4
INDIRF4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 1260
;1260:				ent->client->ps.velocity[2] = 100;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1120403456
ASGNF4
line 1261
;1261:			}
LABELV $457
line 1262
;1262:			ent->kamikazeShockTime = level.time + 3000;
ADDRLP4 4
INDIRP4
CNSTI4 796
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 1264
;1263://		}
;1264:	}
LABELV $437
line 1226
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $439
ADDRLP4 32
INDIRI4
ADDRLP4 4136
INDIRI4
LTI4 $436
line 1265
;1265:}
LABELV $429
endproc KamikazeShockWave 4180 32
proc KamikazeDamage 64 20
line 1272
;1266:
;1267:/*
;1268:===============
;1269:KamikazeDamage
;1270:===============
;1271:*/
;1272:static void KamikazeDamage( gentity_t *self ) {
line 1278
;1273:	int i;
;1274:	float t;
;1275:	gentity_t *ent;
;1276:	vec3_t newangles;
;1277:
;1278:	self->count += 100;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1280
;1279:
;1280:	if (self->count >= KAMI_SHOCKWAVE_STARTTIME) {
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
CNSTI4 0
LTI4 $462
line 1282
;1281:		// shockwave push back
;1282:		t = self->count - KAMI_SHOCKWAVE_STARTTIME;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1283
;1283:		KamikazeShockWave(self->s.pos.trBase, self->activator, 25, 400,	(int) (float) t * KAMI_SHOCKWAVE_MAXRADIUS / (KAMI_SHOCKWAVE_ENDTIME - KAMI_SHOCKWAVE_STARTTIME) );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 780
ADDP4
INDIRP4
ARGP4
CNSTF4 1103626240
ARGF4
CNSTF4 1137180672
ARGF4
CNSTI4 1320
ADDRLP4 20
INDIRF4
CVFI4 4
MULI4
CNSTI4 2000
DIVI4
CVIF4 4
ARGF4
ADDRGP4 KamikazeShockWave
CALLV
pop
line 1284
;1284:	}
LABELV $462
line 1286
;1285:	//
;1286:	if (self->count >= KAMI_EXPLODE_STARTTIME) {
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
CNSTI4 250
LTI4 $464
line 1288
;1287:		// do our damage
;1288:		t = self->count - KAMI_EXPLODE_STARTTIME;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
CNSTI4 250
SUBI4
CVIF4 4
ASGNF4
line 1289
;1289:		KamikazeRadiusDamage( self->s.pos.trBase, self->activator, 400,	(int) (float) t * KAMI_BOOMSPHERE_MAXRADIUS / (KAMI_IMPLODE_STARTTIME - KAMI_EXPLODE_STARTTIME) );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 780
ADDP4
INDIRP4
ARGP4
CNSTF4 1137180672
ARGF4
CNSTI4 720
ADDRLP4 20
INDIRF4
CVFI4 4
MULI4
CNSTI4 1750
DIVI4
CVIF4 4
ARGF4
ADDRGP4 KamikazeRadiusDamage
CALLV
pop
line 1290
;1290:	}
LABELV $464
line 1293
;1291:
;1292:	// either cycle or kill self
;1293:	if( self->count >= KAMI_SHOCKWAVE_ENDTIME ) {
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
CNSTI4 2000
LTI4 $466
line 1294
;1294:		G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1295
;1295:		return;
ADDRGP4 $461
JUMPV
LABELV $466
line 1297
;1296:	}
;1297:	self->nextthink = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1300
;1298:
;1299:	// add earth quake effect
;1300:	newangles[0] = crandom() * 2;
ADDRLP4 28
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 32
CNSTF4 1073741824
ASGNF4
ADDRLP4 4
ADDRLP4 32
INDIRF4
ADDRLP4 32
INDIRF4
ADDRLP4 28
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
line 1301
;1301:	newangles[1] = crandom() * 2;
ADDRLP4 36
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 40
CNSTF4 1073741824
ASGNF4
ADDRLP4 4+4
ADDRLP4 40
INDIRF4
ADDRLP4 40
INDIRF4
ADDRLP4 36
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
line 1302
;1302:	newangles[2] = 0;
ADDRLP4 4+8
CNSTF4 0
ASGNF4
line 1303
;1303:	for (i = 0; i < MAX_CLIENTS; i++)
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $471
line 1304
;1304:	{
line 1305
;1305:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 868
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1306
;1306:		if (!ent->inuse)
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $475
line 1307
;1307:			continue;
ADDRGP4 $472
JUMPV
LABELV $475
line 1308
;1308:		if (!ent->client)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $477
line 1309
;1309:			continue;
ADDRGP4 $472
JUMPV
LABELV $477
line 1311
;1310:
;1311:		if (ent->client->ps.groundEntityNum != ENTITYNUM_NONE) {
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $479
line 1312
;1312:			ent->client->ps.velocity[0] += crandom() * 120;
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 48
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
CNSTF4 1123024896
CNSTF4 1073741824
ADDRLP4 44
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
ASGNF4
line 1313
;1313:			ent->client->ps.velocity[1] += crandom() * 120;
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 56
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
CNSTF4 1123024896
CNSTF4 1073741824
ADDRLP4 52
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
ASGNF4
line 1314
;1314:			ent->client->ps.velocity[2] = 30 + random() * 25;
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1103626240
ADDRLP4 60
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1106247680
ADDF4
ASGNF4
line 1315
;1315:		}
LABELV $479
line 1317
;1316:
;1317:		ent->client->ps.delta_angles[0] += ANGLE2SHORT(newangles[0] - self->movedir[0]);
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 56
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTF4 1199570944
ADDRLP4 4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRF4
SUBF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ADDI4
ASGNI4
line 1318
;1318:		ent->client->ps.delta_angles[1] += ANGLE2SHORT(newangles[1] - self->movedir[1]);
ADDRLP4 48
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTF4 1199570944
ADDRLP4 4+4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
SUBF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ADDI4
ASGNI4
line 1319
;1319:		ent->client->ps.delta_angles[2] += ANGLE2SHORT(newangles[2] - self->movedir[2]);
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTF4 1199570944
ADDRLP4 4+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 684
ADDP4
INDIRF4
SUBF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ADDI4
ASGNI4
line 1320
;1320:	}
LABELV $472
line 1303
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 64
LTI4 $471
line 1321
;1321:	VectorCopy(newangles, self->movedir);
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 1322
;1322:}
LABELV $461
endproc KamikazeDamage 64 20
export G_StartKamikaze
proc G_StartKamikaze 44 32
line 1329
;1323:
;1324:/*
;1325:===============
;1326:G_StartKamikaze
;1327:===============
;1328:*/
;1329:void G_StartKamikaze( gentity_t *ent ) {
line 1335
;1330:	gentity_t	*explosion;
;1331:	gentity_t	*te;
;1332:	vec3_t		snapped;
;1333:
;1334:	// start up the explosion logic
;1335:	explosion = G_Spawn();
ADDRLP4 20
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 1337
;1336:
;1337:	explosion->s.eType = ET_EVENTS + EV_KAMIKAZE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 86
ASGNI4
line 1338
;1338:	explosion->eventTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1340
;1339:
;1340:	if ( ent->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $485
line 1341
;1341:		VectorCopy( ent->s.pos.trBase, snapped );
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1342
;1342:	}
ADDRGP4 $486
JUMPV
LABELV $485
line 1343
;1343:	else {
line 1344
;1344:		VectorCopy( ent->activator->s.pos.trBase, snapped );
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1345
;1345:	}
LABELV $486
line 1346
;1346:	SnapVector( snapped );		// save network bandwidth
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 4+4
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 4+8
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 32
INDIRF4
ASGNF4
line 1347
;1347:	G_SetOrigin( explosion, snapped );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1349
;1348:
;1349:	explosion->classname = "kamikaze";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $491
ASGNP4
line 1350
;1350:	explosion->s.pos.trType = TR_STATIONARY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 1352
;1351:
;1352:	explosion->kamikazeTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1354
;1353:
;1354:	explosion->think = KamikazeDamage;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 KamikazeDamage
ASGNP4
line 1355
;1355:	explosion->nextthink = level.time + 100;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1356
;1356:	explosion->count = 0;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 0
ASGNI4
line 1357
;1357:	VectorClear(explosion->movedir);
ADDRLP4 28
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 684
ADDP4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 28
INDIRF4
ASGNF4
line 1359
;1358:
;1359:	trap_LinkEntity( explosion );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1361
;1360:
;1361:	if (ent->client) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $494
line 1363
;1362:		//
;1363:		explosion->activator = ent;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1365
;1364:		//
;1365:		ent->s.eFlags &= ~EF_KAMIKAZE;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
line 1367
;1366:		// nuke the guy that used it
;1367:		G_Damage( ent, ent, ent, NULL, NULL, 100000, DAMAGE_NO_PROTECTION, MOD_KAMIKAZE );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
CNSTP4 0
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 8
ARGI4
CNSTI4 27
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1368
;1368:	}
ADDRGP4 $495
JUMPV
LABELV $494
line 1369
;1369:	else {
line 1370
;1370:		if ( !strcmp(ent->activator->classname, "bodyque") ) {
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $498
ARGP4
ADDRLP4 32
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $496
line 1371
;1371:			explosion->activator = &g_entities[ent->activator->r.ownerNum];
ADDRLP4 36
CNSTI4 780
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
CNSTI4 868
ADDRFP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1372
;1372:		}
ADDRGP4 $497
JUMPV
LABELV $496
line 1373
;1373:		else {
line 1374
;1374:			explosion->activator = ent->activator;
ADDRLP4 36
CNSTI4 780
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRP4
ASGNP4
line 1375
;1375:		}
LABELV $497
line 1376
;1376:	}
LABELV $495
line 1379
;1377:
;1378:	// play global sound at all clients
;1379:	te = G_TempEntity(snapped, EV_GLOBAL_TEAM_SOUND );
ADDRLP4 4
ARGP4
CNSTI4 49
ARGI4
ADDRLP4 32
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 1380
;1380:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 36
ADDRLP4 16
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 1381
;1381:	te->s.eventParm = GTS_KAMIKAZE;
ADDRLP4 16
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 13
ASGNI4
line 1382
;1382:}
LABELV $483
endproc G_StartKamikaze 44 32
import irandom
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
import g_StartBFG
import g_StartPlasma
import g_StartGauss
import g_StartFlame
import g_StartSingCan
import g_StartGrenade
import g_StartSG
import g_StartMG
import g_StartGauntlet
import g_MultiJump
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
import TeamCount
import G_PredictPlayerMove
import G_UnTimeShiftClient
import G_UndoTimeShiftFor
import G_DoTimeShiftFor
import G_UnTimeShiftAllClients
import G_TimeShiftAllClients
import G_StoreHistory
import G_ResetHistory
import DropPortalDestination
import DropPortalSource
import TeleportPlayer
import trigger_teleporter_touch
import Touch_DoorTrigger
import G_RunMover
import fire_prox
import fire_nail
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
import TossClientPersistantPowerups
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
LABELV $498
byte 1 98
byte 1 111
byte 1 100
byte 1 121
byte 1 113
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $491
byte 1 107
byte 1 97
byte 1 109
byte 1 105
byte 1 107
byte 1 97
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $192
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
