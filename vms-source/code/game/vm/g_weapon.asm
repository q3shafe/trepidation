export G_BounceProjectile
code
proc G_BounceProjectile 64 4
file "../g_weapon.c"
line 21
;1:// 2016 Trepidation Licensed under the GPL2
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
;13:
;14:
;15:
;16:/*
;17:================
;18:G_BounceProjectile
;19:================
;20:*/
;21:void G_BounceProjectile( vec3_t start, vec3_t impact, vec3_t dir, vec3_t endout ) {
line 25
;22:	vec3_t v, newv;
;23:	float dot;
;24:
;25:	VectorSubtract( impact, start, v );
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
line 26
;26:	dot = DotProduct( v, dir );
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
line 27
;27:	VectorMA( v, -2*dot, dir, newv );
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
line 29
;28:
;29:	VectorNormalize(newv);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 30
;30:	VectorMA(impact, 8192, newv, endout);
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
line 31
;31:}
LABELV $55
endproc G_BounceProjectile 64 4
export Weapon_Gauntlet
proc Weapon_Gauntlet 0 0
line 42
;32:
;33:
;34:/*
;35:======================================================================
;36:
;37:GAUNTLET
;38:
;39:======================================================================
;40:*/
;41:
;42:void Weapon_Gauntlet( gentity_t *ent ) {
line 44
;43:
;44:}
LABELV $66
endproc Weapon_Gauntlet 0 0
export CheckGauntletAttack
proc CheckGauntletAttack 104 32
line 51
;45:
;46:/*
;47:===============
;48:CheckGauntletAttack
;49:===============
;50:*/
;51:qboolean CheckGauntletAttack( gentity_t *ent ) {
line 59
;52:	trace_t		tr;
;53:	vec3_t		end;
;54:	gentity_t	*tent;
;55:	gentity_t	*traceEnt;
;56:	int			damage;
;57:
;58:	// set aiming directions
;59:	AngleVectors (ent->client->ps.viewangles, forward, right, up);
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
line 61
;60:
;61:	CalcMuzzlePoint ( ent, forward, right, up, muzzle );
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
line 63
;62:
;63:	VectorMA (muzzle, 32, forward, end);
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
line 65
;64:
;65:	trap_Trace (&tr, muzzle, NULL, NULL, end, ent->s.number, MASK_SHOT);
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
line 66
;66:	if ( tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 4+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $74
line 67
;67:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $67
JUMPV
LABELV $74
line 70
;68:	}
;69:
;70:	traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 0
CNSTI4 924
ADDRLP4 4+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 73
;71:
;72:	// send blood impact
;73:	if ( traceEnt->takedamage && traceEnt->client ) {
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
line 74
;74:		tent = G_TempEntity( tr.endpos, EV_MISSILE_HIT );
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
line 75
;75:		tent->s.otherEntityNum = traceEnt->s.number;
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 76
;76:		tent->s.eventParm = DirToByte( tr.plane.normal );
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
line 77
;77:		tent->s.weapon = ent->s.weapon;
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
line 78
;78:	}
LABELV $78
line 80
;79:
;80:	if ( !traceEnt->takedamage) {
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
NEI4 $82
line 81
;81:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $67
JUMPV
LABELV $82
line 84
;82:	}
;83:
;84:	if (ent->client->ps.powerups[PW_QUAD] ) {
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
line 85
;85:		G_AddEvent( ent, EV_POWERUP_QUAD, 0 );
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
line 86
;86:		s_quadFactor = g_quadfactor.value;
ADDRGP4 s_quadFactor
ADDRGP4 g_quadfactor+8
INDIRF4
ASGNF4
line 87
;87:	} else {
ADDRGP4 $85
JUMPV
LABELV $84
line 88
;88:		s_quadFactor = 1;
ADDRGP4 s_quadFactor
CNSTF4 1065353216
ASGNF4
line 89
;89:	}
LABELV $85
line 96
;90:#ifdef MISSIONPACK
;91:	if( ent->client->persistantPowerup && ent->client->persistantPowerup->item && ent->client->persistantPowerup->item->giTag == PW_DOUBLER ) {
;92:		s_quadFactor *= 2;
;93:	}
;94:#endif
;95:
;96:	damage = 50 * s_quadFactor;
ADDRLP4 76
CNSTF4 1112014848
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 97
;97:	G_Damage( traceEnt, ent, ent, forward, tr.endpos,
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
line 100
;98:		damage, 0, MOD_GAUNTLET );
;99:
;100:	return qtrue;
CNSTI4 1
RETI4
LABELV $67
endproc CheckGauntletAttack 104 32
export Weapon_fire_flame
proc Weapon_fire_flame 16 16
line 110
;101:}
;102:
;103:
;104://
;105://=======================================================================
;106://FLAME_THROWER
;107://Shafe - Trep - Flame Thrower
;108://=======================================================================
;109://
;110:void Weapon_fire_flame (gentity_t *ent, qboolean alt ) {
line 113
;111:	gentity_t	*m;
;112:
;113:	m = fire_flame(ent, muzzle, forward, alt);
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
line 114
;114:	m->damage *= s_quadFactor;
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
line 115
;115:	m->splashDamage *= s_quadFactor;
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
line 116
;116:}	
LABELV $88
endproc Weapon_fire_flame 16 16
export Weapon_fire_mg
proc Weapon_fire_mg 16 16
line 160
;117:
;118:
;119:/*
;120:======================================================================
;121:
;122:MACHINEGUN
;123:
;124:======================================================================
;125:*/
;126:
;127:/*
;128:======================
;129:SnapVectorTowards
;130:
;131:Round a vector to integers for more efficient network
;132:transmission, but make sure that it rounds towards a given point
;133:rather than blindly truncating.  This prevents it from truncating 
;134:into a wall.
;135:======================
;136:*/
;137://unlagged - attack prediction #3
;138:// moved to q_shared.c
;139:/*
;140:void SnapVectorTowards( vec3_t v, vec3_t to ) {
;141:	int		i;
;142:
;143:	for ( i = 0 ; i < 3 ; i++ ) {
;144:		if ( to[i] <= v[i] ) {
;145:			v[i] = (int)v[i];
;146:		} else {
;147:			v[i] = (int)v[i] + 1;
;148:		}
;149:	}
;150:}
;151:*/
;152://unlagged - attack prediction #3
;153:
;154:
;155:/*
;156:=======================================================================
;157:MACHINE GUN
;158:=======================================================================
;159:*/
;160:void Weapon_fire_mg (gentity_t *ent, qboolean alt ) {
line 163
;161:	gentity_t *m;
;162:
;163:	m = fire_mg(ent, muzzle, forward, alt);
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
line 164
;164:	m->damage *= s_quadFactor;
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
line 165
;165:	m->splashDamage *= s_quadFactor;
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
line 166
;166:}
LABELV $89
endproc Weapon_fire_mg 16 16
export Bullet_Fire
proc Bullet_Fire 152 32
line 177
;167:
;168:
;169:
;170:#ifdef MISSIONPACK
;171:#define CHAINGUN_SPREAD		600
;172:#endif
;173:#define MACHINEGUN_SPREAD	64
;174:#define	MACHINEGUN_DAMAGE	7
;175:#define	MACHINEGUN_TEAM_DAMAGE	5		// wimpier MG in teamplay
;176:
;177:void Bullet_Fire (gentity_t *ent, float spread, int damage ) {
line 191
;178:	trace_t		tr;
;179:	vec3_t		end;
;180:#ifdef MISSIONPACK
;181:	vec3_t		impactpoint, bouncedir;
;182:#endif
;183:	float		r;
;184:	float		u;
;185:	gentity_t	*tent;
;186:	gentity_t	*traceEnt;
;187:	int			i, passent;
;188:
;189://unlagged - attack prediction #2
;190:	// we have to use something now that the client knows in advance
;191:	int			seed = ent->client->attackTime % 256;
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2744
ADDP4
INDIRI4
CNSTI4 256
MODI4
ASGNI4
line 194
;192://unlagged - attack prediction #2
;193:
;194:	damage *= s_quadFactor;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 203
;195:
;196://unlagged - attack prediction #2
;197:	// this has to match what's on the client
;198:/*
;199:	r = random() * M_PI * 2.0f;
;200:	u = sin(r) * crandom() * spread * 16;
;201:	r = cos(r) * crandom() * spread * 16;
;202:*/
;203:	r = Q_random(&seed) * M_PI * 2.0f;
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
line 204
;204:	u = sin(r) * Q_crandom(&seed) * spread * 16;
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
line 205
;205:	r = cos(r) * Q_crandom(&seed) * spread * 16;
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
line 207
;206://unlagged - attack prediction #2
;207:	VectorMA (muzzle, 8192*16, forward, end);
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
line 208
;208:	VectorMA (end, r, right, end);
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
line 209
;209:	VectorMA (end, u, up, end);
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
line 211
;210:
;211:	passent = ent->s.number;
ADDRLP4 80
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 212
;212:	for (i = 0; i < 10; i++) {
ADDRLP4 76
CNSTI4 0
ASGNI4
LABELV $109
line 216
;213:
;214://unlagged - backward reconciliation #2
;215:		// backward-reconcile the other clients
;216:		G_DoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 219
;217://unlagged - backward reconciliation #2
;218:
;219:		trap_Trace (&tr, muzzle, NULL, NULL, end, passent, MASK_SHOT);
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
line 223
;220:
;221://unlagged - backward reconciliation #2
;222:		// put them back
;223:		G_UndoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 226
;224://unlagged - backward reconciliation #2
;225:
;226:		if ( tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $113
line 227
;227:			return;
ADDRGP4 $90
JUMPV
LABELV $113
line 230
;228:		}
;229:
;230:		traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 56
CNSTI4 924
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 233
;231:
;232:		// snap the endpos to integers, but nudged towards the line
;233:		SnapVectorTowards( tr.endpos, muzzle );
ADDRLP4 0+12
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 236
;234:
;235:		// send bullet impact
;236:		if ( traceEnt->takedamage && traceEnt->client ) {
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
line 237
;237:			tent = G_TempEntity( tr.endpos, EV_BULLET_HIT_FLESH );
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
line 238
;238:			tent->s.eventParm = traceEnt->s.number;
ADDRLP4 60
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 56
INDIRP4
INDIRI4
ASGNI4
line 242
;239://unlagged - attack prediction #2
;240:			// we need the client number to determine whether or not to
;241:			// suppress this event
;242:			tent->s.clientNum = ent->s.clientNum;
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
line 244
;243://unlagged - attack prediction #2
;244:			if( LogAccuracyHit( traceEnt, ent ) ) {
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
line 245
;245:				ent->client->accuracy_hits++;
ADDRLP4 148
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2652
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
line 246
;246:			}
line 247
;247:		} else {
ADDRGP4 $119
JUMPV
LABELV $118
line 248
;248:			tent = G_TempEntity( tr.endpos, EV_BULLET_HIT_WALL );
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
line 249
;249:			tent->s.eventParm = DirToByte( tr.plane.normal );
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
line 253
;250://unlagged - attack prediction #2
;251:			// we need the client number to determine whether or not to
;252:			// suppress this event
;253:			tent->s.clientNum = ent->s.clientNum;
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
line 255
;254://unlagged - attack prediction #2
;255:		}
LABELV $119
line 256
;256:		tent->s.otherEntityNum = ent->s.number;
ADDRLP4 60
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 258
;257:
;258:		if ( traceEnt->takedamage) {
ADDRLP4 56
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $111
line 275
;259:#ifdef MISSIONPACK
;260:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
;261:				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
;262:					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
;263:					VectorCopy( impactpoint, muzzle );
;264:					// the player can hit him/herself with the bounced rail
;265:					passent = ENTITYNUM_NONE;
;266:				}
;267:				else {
;268:					VectorCopy( tr.endpos, muzzle );
;269:					passent = traceEnt->s.number;
;270:				}
;271:				continue;
;272:			}
;273:			else {
;274:#endif
;275:				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
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
line 280
;276:					damage, 0, MOD_MACHINEGUN);
;277:#ifdef MISSIONPACK
;278:			}
;279:#endif
;280:		}
line 281
;281:		break;
ADDRGP4 $111
JUMPV
LABELV $110
line 212
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
line 283
;282:	}
;283:}
LABELV $90
endproc Bullet_Fire 152 32
export BFG_Fire
proc BFG_Fire 20 16
line 294
;284:
;285:
;286:/*
;287:======================================================================
;288:
;289:BFG
;290:
;291:======================================================================
;292:*/
;293:
;294:void BFG_Fire ( gentity_t *ent, qboolean alt ) {
line 298
;295:	gentity_t	*m;
;296:
;297:	// Alt Fire Shoots Upward Just A Bit MOre
;298:	if (alt == qtrue)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $129
line 299
;299:	{
line 300
;300:		forward[2] += 0.2f;
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
line 301
;301:	}
LABELV $129
line 303
;302:	
;303:	forward[2] += 0.2f;
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
line 307
;304:
;305:
;306:	
;307:	VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 308
;308:	m = fire_bfg (ent, muzzle, forward, alt);
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
line 309
;309:	m->damage *= s_quadFactor;
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
line 310
;310:	m->splashDamage *= s_quadFactor;
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
line 313
;311:
;312://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;313:}
LABELV $128
endproc BFG_Fire 20 16
export ShotgunPellet
proc ShotgunPellet 108 32
line 328
;314:
;315:
;316:/*
;317:======================================================================
;318:
;319:SHOTGUN
;320:
;321:======================================================================
;322:*/
;323:
;324:// DEFAULT_SHOTGUN_SPREAD and DEFAULT_SHOTGUN_COUNT	are in bg_public.h, because
;325:// client predicts same spreads
;326:#define	DEFAULT_SHOTGUN_DAMAGE	10
;327:
;328:qboolean ShotgunPellet( vec3_t start, vec3_t end, gentity_t *ent, qboolean alt ) {
line 337
;329:	trace_t		tr;
;330:	int			damage, i, passent;
;331:	gentity_t	*traceEnt;
;332:#ifdef MISSIONPACK
;333:	vec3_t		impactpoint, bouncedir;
;334:#endif
;335:	vec3_t		tr_start, tr_end;
;336:
;337:	passent = ent->s.number;
ADDRLP4 64
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 338
;338:	VectorCopy( start, tr_start );
ADDRLP4 68
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 339
;339:	VectorCopy( end, tr_end );
ADDRLP4 80
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 340
;340:	for (i = 0; i < 10; i++) {
ADDRLP4 60
CNSTI4 0
ASGNI4
LABELV $134
line 341
;341:		trap_Trace (&tr, tr_start, NULL, NULL, tr_end, passent, MASK_SHOT);
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
line 342
;342:		traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 56
CNSTI4 924
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 345
;343:
;344:		// send bullet impact
;345:		if (  tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $139
line 346
;346:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $133
JUMPV
LABELV $139
line 349
;347:		}
;348:
;349:		if ( traceEnt->takedamage) {
ADDRLP4 56
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $142
line 351
;350:		
;351:				damage = DEFAULT_SHOTGUN_DAMAGE * s_quadFactor;
ADDRLP4 92
CNSTF4 1092616192
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 377
;352:		
;353:		
;354:			
;355:#ifdef MISSIONPACK
;356:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
;357:				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
;358:					G_BounceProjectile( tr_start, impactpoint, bouncedir, tr_end );
;359:					VectorCopy( impactpoint, tr_start );
;360:					// the player can hit him/herself with the bounced rail
;361:					passent = ENTITYNUM_NONE;
;362:				}
;363:				else {
;364:					VectorCopy( tr.endpos, tr_start );
;365:					passent = traceEnt->s.number;
;366:				}
;367:				continue;
;368:			}
;369:			else {
;370:				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
;371:					damage, 0, MOD_SHOTGUN);
;372:				if( LogAccuracyHit( traceEnt, ent ) ) {
;373:					return qtrue;
;374:				}
;375:			}
;376:#else
;377:			G_Damage( traceEnt, ent, ent, forward, tr.endpos,	damage, 0, MOD_SHOTGUN);
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
line 378
;378:				if( LogAccuracyHit( traceEnt, ent ) ) {
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
line 379
;379:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $133
JUMPV
LABELV $145
line 382
;380:				}
;381:#endif
;382:		}
LABELV $142
line 383
;383:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $133
JUMPV
LABELV $135
line 340
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
line 385
;384:	}
;385:	return qfalse;
CNSTI4 0
RETI4
LABELV $133
endproc ShotgunPellet 108 32
export ShotgunPattern
proc ShotgunPattern 104 16
line 389
;386:}
;387:
;388:// this should match CG_ShotgunPattern
;389:void ShotgunPattern( vec3_t origin, vec3_t origin2, int seed, gentity_t *ent, qboolean alt ) {
line 395
;390:	int			i;
;391:	float		r, u;
;392:	vec3_t		end;
;393:	vec3_t		forward, right, up;
;394:	int			oldScore;
;395:	qboolean	hitClient = qfalse;
ADDRLP4 60
CNSTI4 0
ASGNI4
line 404
;396:
;397://unlagged - attack prediction #2
;398:	// use this for testing
;399:	//Com_Printf( "Server seed: %d\n", seed );
;400://unlagged - attack prediction #2
;401:
;402:	// derive the right and up vectors from the forward vector, because
;403:	// the client won't have any other information
;404:	VectorNormalize2( origin2, forward );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 VectorNormalize2
CALLF4
pop
line 405
;405:	PerpendicularVector( right, forward );
ADDRLP4 32
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 406
;406:	CrossProduct( forward, right, up );
ADDRLP4 20
ARGP4
ADDRLP4 32
ARGP4
ADDRLP4 44
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 408
;407:
;408:	oldScore = ent->client->ps.persistant[PERS_SCORE];
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
line 412
;409:
;410://unlagged - backward reconciliation #2
;411:	// backward-reconcile the other clients
;412:	G_DoTimeShiftFor( ent );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 418
;413://unlagged - backward reconciliation #2
;414:
;415:	
;416:
;417:	// generate the "random" spread pattern
;418:		for ( i = 0 ; i < DEFAULT_SHOTGUN_COUNT ; i++ ) {
ADDRLP4 56
CNSTI4 0
ASGNI4
LABELV $148
line 419
;419:			r = Q_crandom( &seed ) * DEFAULT_SHOTGUN_SPREAD * 16;
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
line 420
;420:			u = Q_crandom( &seed ) * DEFAULT_SHOTGUN_SPREAD * 16;
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
line 421
;421:			VectorMA( origin, 8192 * 16, forward, end);
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
line 422
;422:			VectorMA (end, r, right, end);
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
line 423
;423:			VectorMA (end, u, up, end);
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
line 424
;424:			if( ShotgunPellet( origin, end, ent, alt ) && !hitClient ) {
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
line 425
;425:				hitClient = qtrue;
ADDRLP4 60
CNSTI4 1
ASGNI4
line 426
;426:				ent->client->accuracy_hits++;
ADDRLP4 100
ADDRFP4 12
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2652
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
line 427
;427:			}
LABELV $168
line 428
;428:		}
LABELV $149
line 418
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
line 432
;429:
;430://unlagged - backward reconciliation #2
;431:	// put them back
;432:	G_UndoTimeShiftFor( ent );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 434
;433://unlagged - backward reconciliation #2
;434:}
LABELV $147
endproc ShotgunPattern 104 16
export weapon_supershotgun_fire
proc weapon_supershotgun_fire 32 20
line 437
;435:
;436:
;437:void weapon_supershotgun_fire (gentity_t *ent, qboolean alt) {
line 440
;438:	gentity_t		*tent;
;439:
;440:	if (alt == qtrue) { return; }
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $171
ADDRGP4 $170
JUMPV
LABELV $171
line 442
;441:	// send shotgun blast
;442:	tent = G_TempEntity( muzzle, EV_SHOTGUN );
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
line 443
;443:	VectorScale( forward, 4096, tent->s.origin2 );
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
line 444
;444:	SnapVector( tent->s.origin2 );
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
line 448
;445://unlagged - attack prediction #2
;446:	// this has to be something the client can predict now
;447:	//tent->s.eventParm = rand() & 255;		// seed for spread pattern
;448:	tent->s.eventParm = ent->client->attackTime % 256; // seed for spread pattern
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2744
ADDP4
INDIRI4
CNSTI4 256
MODI4
ASGNI4
line 450
;449://unlagged - attack prediction #2
;450:	tent->s.otherEntityNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 452
;451:
;452:	ShotgunPattern( tent->s.pos.trBase, tent->s.origin2, tent->s.eventParm, ent, alt );
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
line 453
;453:}
LABELV $170
endproc weapon_supershotgun_fire 32 20
export weapon_bomblauncher_fire
proc weapon_bomblauncher_fire 24 16
line 465
;454:
;455:
;456:/*
;457:======================================================================
;458:
;459:BOMB
;460:
;461:======================================================================
;462:*/
;463:
;464:// Shafe - Bomb
;465:void weapon_bomblauncher_fire (gentity_t	*ent, qboolean alt) {
line 467
;466:	gentity_t	*m;
;467:	gentity_t	*grenades = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 471
;468:	 
;469:
;470:
;471:if (ent->client->bombfired == qfalse) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2708
ADDP4
INDIRI4
CNSTI4 0
NEI4 $180
line 473
;472:		// extra vertical velocity
;473:		forward[2] += 0.2f;
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
line 474
;474:		VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 476
;475: 
;476:		m = fire_bomb (ent, muzzle, forward, qtrue);
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
line 477
;477:		m->damage *= s_quadFactor;
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
line 478
;478:		m->splashDamage *= s_quadFactor;
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
line 479
;479:		ent->client->bombfired = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2708
ADDP4
CNSTI4 1
ASGNI4
line 480
;480:		return;
ADDRGP4 $175
JUMPV
LABELV $179
line 484
;481:	}
;482:
;483: while ((grenades = G_Find (grenades, FOFS(classname), "bomb")) != NULL)
;484: {
line 485
;485:	if(grenades->r.ownerNum == ent->s.clientNum)  //make sure its ours
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
line 486
;486:	{
line 487
;487:		if (ent->client->bombfired == qtrue)
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2708
ADDP4
INDIRI4
CNSTI4 1
NEI4 $185
line 488
;488:		{
line 489
;489:			G_ExplodeBomb(grenades);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_ExplodeBomb
CALLV
pop
line 490
;490:			ent->client->bombfired = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2708
ADDP4
CNSTI4 0
ASGNI4
line 492
;491:			
;492:		}
LABELV $185
line 494
;493:
;494:	}
LABELV $183
line 495
;495: }
LABELV $180
line 483
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
line 499
;496:
;497: 	
;498:
;499:} 
LABELV $175
endproc weapon_bomblauncher_fire 24 16
export weapon_pdlauncher_fire
proc weapon_pdlauncher_fire 28 12
line 511
;500:
;501:
;502:/*
;503:======================================================================
;504:
;505:PDG
;506:
;507:======================================================================
;508:*/
;509:
;510:// Shafe - PDG
;511:void weapon_pdlauncher_fire (gentity_t	*ent) {
line 513
;512:	gentity_t	*m;
;513:	gentity_t	*grenades = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $189
JUMPV
LABELV $188
line 516
;514:	 
;515: while ((grenades = G_Find (grenades, FOFS(classname), "pdgrenade")) != NULL)
;516: {
line 517
;517:	if(grenades->r.ownerNum == ent->s.clientNum)  //make sure its ours
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
line 518
;518:	{
line 519
;519:		ent->istelepoint = 0; // client cannot teleport
ADDRFP4 0
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 0
ASGNI4
line 520
;520:		VectorClear( ent->teleloc ); // clear the teleport location
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
line 521
;521:		grenades->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 522
;522:		grenades->nextthink = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 523
;523:	}
LABELV $192
line 524
;524: }
LABELV $189
line 515
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
line 526
;525: // extra vertical velocity
;526: forward[2] += 0.2f;
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
line 527
;527: VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 529
;528: 
;529: m = fire_pdgrenade (ent, muzzle, forward);
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
line 530
;530: m->damage *= s_quadFactor;
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
line 531
;531: m->splashDamage *= s_quadFactor;
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
line 532
;532: ent->client->pdgfired = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2704
ADDP4
CNSTI4 1
ASGNI4
line 533
;533:} 
LABELV $187
endproc weapon_pdlauncher_fire 28 12
export weapon_grenadelauncher_fire
proc weapon_grenadelauncher_fire 20 12
line 544
;534:
;535:
;536:/*
;537:======================================================================
;538:
;539:GRENADE LAUNCHER
;540:
;541:======================================================================
;542:*/
;543:
;544:void weapon_grenadelauncher_fire (gentity_t *ent) {
line 548
;545:	gentity_t	*m;
;546:
;547:	// extra vertical velocity
;548:	forward[2] += 0.2f;
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
line 549
;549:	VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 551
;550:
;551:	m = fire_grenade (ent, muzzle, forward);
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
line 552
;552:	m->damage *= s_quadFactor;
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
line 553
;553:	m->splashDamage *= s_quadFactor;
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
line 556
;554:
;555://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;556:}
LABELV $196
endproc weapon_grenadelauncher_fire 20 12
export weapon_altgrenadelauncher_fire
proc weapon_altgrenadelauncher_fire 20 12
line 567
;557:
;558:/*
;559:======================================================================
;560:
;561:ALT GRENADE LAUNCHER 
;562:Shafe - Trep - Alternate Fire Grenade
;563:
;564:======================================================================
;565:*/
;566:
;567:void weapon_altgrenadelauncher_fire (gentity_t *ent) {
line 571
;568:	gentity_t	*m;
;569:
;570:	// extra vertical velocity
;571:	forward[2] += 0.2f;
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
line 572
;572:	VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 574
;573:
;574:	m = fire_altgrenade (ent, muzzle, forward);
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
line 575
;575:	m->damage *= s_quadFactor;
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
line 576
;576:	m->splashDamage *= s_quadFactor;
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
line 579
;577:
;578://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;579:}
LABELV $198
endproc weapon_altgrenadelauncher_fire 20 12
export Weapon_RocketLauncher_Fire
proc Weapon_RocketLauncher_Fire 16 12
line 589
;580:
;581:/*
;582:======================================================================
;583:
;584:ROCKET
;585:
;586:======================================================================
;587:*/
;588:
;589:void Weapon_RocketLauncher_Fire (gentity_t *ent) {
line 592
;590:	gentity_t	*m;
;591:
;592:	m = fire_rocket (ent, muzzle, forward);
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
line 593
;593:	m->damage *= s_quadFactor;
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
line 594
;594:	m->splashDamage *= s_quadFactor;
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
line 597
;595:
;596://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;597:}
LABELV $200
endproc Weapon_RocketLauncher_Fire 16 12
export Weapon_RocketLauncher_AltFire
proc Weapon_RocketLauncher_AltFire 16 12
line 600
;598:
;599:// Shafe - Trep Alt Rocket Launcher
;600:void Weapon_RocketLauncher_AltFire (gentity_t *ent) {
line 603
;601:	gentity_t	*m;
;602:
;603:	m = fire_alt_rocket (ent, muzzle, forward);
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
line 604
;604:	m->damage *= s_quadFactor;
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
line 605
;605:	m->splashDamage *= s_quadFactor;
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
line 608
;606:
;607://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;608:}
LABELV $201
endproc Weapon_RocketLauncher_AltFire 16 12
export Weapon_Plasmagun_Fire
proc Weapon_Plasmagun_Fire 16 12
line 619
;609:
;610:
;611:/*
;612:======================================================================
;613:
;614:PLASMA GUN
;615:
;616:======================================================================
;617:*/
;618:
;619:void Weapon_Plasmagun_Fire (gentity_t *ent, qboolean alt) {
line 626
;620:	gentity_t	*m;
;621:	int		i;
;622:	
;623:	// Shafe - Add Some Randomness so that 
;624:	// it doesnt fire straight every time
;625:
;626:	if(!alt)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $203
line 627
;627:	{
line 628
;628:		i = irandom(0,3);
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 8
ADDRGP4 irandom
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 629
;629:		if (i == 1)
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $205
line 630
;630:		{
line 631
;631:			forward[2] += 0.2f;
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
line 632
;632:			VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 633
;633:		}
LABELV $205
line 634
;634:		if (i == 2)
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $208
line 635
;635:		{
line 636
;636:			forward[1] += 0.2f;
ADDRLP4 12
ADDRGP4 forward+4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CNSTF4 1045220557
ADDF4
ASGNF4
line 637
;637:			VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 638
;638:		}
LABELV $208
line 640
;639:
;640:		if (i == 3)
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $211
line 641
;641:		{
line 642
;642:			forward[0] += 0.2f;
ADDRLP4 12
ADDRGP4 forward
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CNSTF4 1045220557
ADDF4
ASGNF4
line 643
;643:			VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 644
;644:		}
LABELV $211
line 647
;645:
;646:		
;647:	}
LABELV $203
line 649
;648:
;649:	if(!alt)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $213
line 650
;650:	{
line 651
;651:		m = fire_plasma (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 8
ADDRGP4 fire_plasma
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 652
;652:	} else {
ADDRGP4 $214
JUMPV
LABELV $213
line 653
;653:		m = fire_plasma2 (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 8
ADDRGP4 fire_plasma2
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 654
;654:	}
LABELV $214
line 655
;655:	m->damage *= s_quadFactor;
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
line 656
;656:	m->splashDamage *= s_quadFactor;
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
line 659
;657:
;658://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;659:}
LABELV $202
endproc Weapon_Plasmagun_Fire 16 12
export weapon_railgun_fire
proc weapon_railgun_fire 180 32
line 676
;660:
;661:/*
;662:======================================================================
;663:
;664:RAILGUN
;665:
;666:======================================================================
;667:*/
;668:
;669:
;670:/*
;671:=================
;672:weapon_railgun_fire
;673:=================
;674:*/
;675:#define	MAX_RAIL_HITS	4
;676:void weapon_railgun_fire (gentity_t *ent) {
line 685
;677:	vec3_t		end;
;678:#ifdef MISSIONPACK
;679:	vec3_t impactpoint, bouncedir;
;680:#endif
;681:	trace_t		trace;
;682:	gentity_t	*tent;
;683:	gentity_t	*traceEnt;
;684:	int			damage;
;685:	int			splashDmg = 16;
ADDRLP4 108
CNSTI4 16
ASGNI4
line 686
;686:	int			splashRadius = 64;
ADDRLP4 104
CNSTI4 64
ASGNI4
line 694
;687:	int			i;
;688:	int			hits;
;689:	int			unlinked;
;690:	int			passent;
;691:	gentity_t	*unlinkedEntities[MAX_RAIL_HITS];
;692:
;693:	// Shafe - Trep - Instagib
;694:	if (g_instagib.integer == 0)
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 0
NEI4 $216
line 695
;695:	{
line 696
;696:		damage = 100 * s_quadFactor;
ADDRLP4 112
CNSTF4 1120403456
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 697
;697:	} else {
ADDRGP4 $217
JUMPV
LABELV $216
line 698
;698:		damage = 1000 * s_quadFactor;
ADDRLP4 112
CNSTF4 1148846080
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 700
;699:
;700:	}
LABELV $217
line 705
;701:	/////////////////////////////////////
;702:
;703:	// Rifle Jumping - Shafe
;704:		// Instagib Jumping
;705:		if (g_GuassJump.integer == 1) 
ADDRGP4 g_GuassJump+12
INDIRI4
CNSTI4 1
NEI4 $219
line 706
;706:		{
line 708
;707:			
;708:			splashRadius = g_GuassKnockBack.integer * 50; 
ADDRLP4 104
CNSTI4 50
ADDRGP4 g_GuassKnockBack+12
INDIRI4
MULI4
ASGNI4
line 709
;709:			splashDmg = splashRadius; 
ADDRLP4 108
ADDRLP4 104
INDIRI4
ASGNI4
line 711
;710:
;711:		} else {
ADDRGP4 $220
JUMPV
LABELV $219
line 712
;712:			splashDmg = 0; 
ADDRLP4 108
CNSTI4 0
ASGNI4
line 713
;713:			splashRadius = 0; 
ADDRLP4 104
CNSTI4 0
ASGNI4
line 714
;714:		}
LABELV $220
line 719
;715:
;716:		
;717:		
;718:
;719:	VectorMA (muzzle, 8192, forward, end);
ADDRLP4 120
CNSTF4 1174405120
ASGNF4
ADDRLP4 88
ADDRGP4 muzzle
INDIRF4
ADDRLP4 120
INDIRF4
ADDRGP4 forward
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88+4
ADDRGP4 muzzle+4
INDIRF4
ADDRLP4 120
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
line 723
;720:
;721://unlagged - backward reconciliation #2
;722:	// backward-reconcile the other clients
;723:	G_DoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 727
;724://unlagged - backward reconciliation #2
;725:
;726:	// trace only against the solids, so the railgun will go through people
;727:	unlinked = 0;
ADDRLP4 60
CNSTI4 0
ASGNI4
line 728
;728:	hits = 0;
ADDRLP4 116
CNSTI4 0
ASGNI4
line 729
;729:	passent = ent->s.number;
ADDRLP4 100
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
LABELV $229
line 730
;730:	do {
line 731
;731:		trap_Trace (&trace, muzzle, NULL, NULL, end, passent, MASK_SHOT );
ADDRLP4 0
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRLP4 124
CNSTP4 0
ASGNP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRLP4 124
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
line 732
;732:		if ( trace.entityNum >= ENTITYNUM_MAX_NORMAL ) {
ADDRLP4 0+52
INDIRI4
CNSTI4 1022
LTI4 $232
line 733
;733:			break;
ADDRGP4 $231
JUMPV
LABELV $232
line 735
;734:		}
;735:		traceEnt = &g_entities[ trace.entityNum ];
ADDRLP4 56
CNSTI4 924
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 736
;736:		if ( traceEnt->takedamage ) {
ADDRLP4 56
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $236
line 766
;737:#ifdef MISSIONPACK
;738:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
;739:				if ( G_InvulnerabilityEffect( traceEnt, forward, trace.endpos, impactpoint, bouncedir ) ) {
;740:					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
;741:					// snap the endpos to integers to save net bandwidth, but nudged towards the line
;742:					SnapVectorTowards( trace.endpos, muzzle );
;743:					// send railgun beam effect
;744:					tent = G_TempEntity( trace.endpos, EV_RAILTRAIL );
;745:					// set player number for custom colors on the railtrail
;746:					tent->s.clientNum = ent->s.clientNum;
;747:					VectorCopy( muzzle, tent->s.origin2 );
;748:					// move origin a bit to come closer to the drawn gun muzzle
;749:					VectorMA( tent->s.origin2, 4, right, tent->s.origin2 );
;750:					VectorMA( tent->s.origin2, -1, up, tent->s.origin2 );
;751:					tent->s.eventParm = 255;	// don't make the explosion at the end
;752:					//
;753:					VectorCopy( impactpoint, muzzle );
;754:					// the player can hit him/herself with the bounced rail
;755:					passent = ENTITYNUM_NONE;
;756:				}
;757:			}
;758:			else {
;759:				if( LogAccuracyHit( traceEnt, ent ) ) {
;760:					hits++;
;761:				}
;762:				G_Damage (traceEnt, ent, ent, forward, trace.endpos, damage, 0, MOD_RAILGUN);
;763:			}
;764:#else
;765:
;766:			if( G_RadiusDamage( trace.endpos, ent, splashDmg, splashRadius, NULL, MOD_RAILGUN ) ) // Shafe - Trying to get the rifle jumping to work.
ADDRLP4 0+12
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 108
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 104
INDIRI4
CVIF4 4
ARGF4
CNSTP4 0
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 128
ADDRGP4 G_RadiusDamage
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 0
EQI4 $238
line 767
;767:			{
line 770
;768:				// Does a burst radius hit really count as a "hit"?  Not for Guass rifles...
;769:				//g_entities[ent->s.number].client->ps.persistant[PERS_ACCURACY_HITS]++;
;770:			}
LABELV $238
line 773
;771:
;772:			
;773:				if( LogAccuracyHit( traceEnt, ent ) ) {
ADDRLP4 56
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 132
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 0
EQI4 $241
line 774
;774:					hits++;
ADDRLP4 116
ADDRLP4 116
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 775
;775:				}
LABELV $241
line 776
;776:				G_Damage (traceEnt, ent, ent, forward, trace.endpos, damage, 0, MOD_RAILGUN);
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
ADDRLP4 112
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 10
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 778
;777:#endif
;778:		}
LABELV $236
line 779
;779:		if ( trace.contents & CONTENTS_SOLID ) {
ADDRLP4 0+48
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $244
line 780
;780:			break;		// we hit something solid enough to stop the beam
ADDRGP4 $231
JUMPV
LABELV $244
line 783
;781:		}
;782:		// unlink this entity, so the next trace will go past it
;783:		trap_UnlinkEntity( traceEnt );
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 784
;784:		unlinkedEntities[unlinked] = traceEnt;
ADDRLP4 60
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
ADDRLP4 56
INDIRP4
ASGNP4
line 785
;785:		unlinked++;
ADDRLP4 60
ADDRLP4 60
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 786
;786:	} while ( unlinked < MAX_RAIL_HITS );
LABELV $230
ADDRLP4 60
INDIRI4
CNSTI4 4
LTI4 $229
LABELV $231
line 790
;787:
;788://unlagged - backward reconciliation #2
;789:	// put them back
;790:	G_UndoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 794
;791://unlagged - backward reconciliation #2
;792:
;793:	// link back in any entities we unlinked
;794:	for ( i = 0 ; i < unlinked ; i++ ) {
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 $250
JUMPV
LABELV $247
line 795
;795:		trap_LinkEntity( unlinkedEntities[i] );
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
line 796
;796:	}
LABELV $248
line 794
ADDRLP4 64
ADDRLP4 64
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $250
ADDRLP4 64
INDIRI4
ADDRLP4 60
INDIRI4
LTI4 $247
line 801
;797:
;798:	// the final trace endpos will be the terminal point of the rail trail
;799:
;800:	// snap the endpos to integers to save net bandwidth, but nudged towards the line
;801:	SnapVectorTowards( trace.endpos, muzzle );
ADDRLP4 0+12
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 804
;802:
;803:	// send railgun beam effect
;804:	tent = G_TempEntity( trace.endpos, EV_RAILTRAIL );
ADDRLP4 0+12
ARGP4
CNSTI4 55
ARGI4
ADDRLP4 124
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 84
ADDRLP4 124
INDIRP4
ASGNP4
line 807
;805:
;806:	// set player number for custom colors on the railtrail
;807:	tent->s.clientNum = ent->s.clientNum;
ADDRLP4 128
CNSTI4 168
ASGNI4
ADDRLP4 84
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 809
;808:
;809:	VectorCopy( muzzle, tent->s.origin2 );
ADDRLP4 84
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 811
;810:	// move origin a bit to come closer to the drawn gun muzzle
;811:	VectorMA( tent->s.origin2, 4, right, tent->s.origin2 );
ADDRLP4 132
ADDRLP4 84
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRGP4 right
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 136
ADDRLP4 84
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRGP4 right+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 140
ADDRLP4 84
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRGP4 right+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 812
;812:	VectorMA( tent->s.origin2, -1, up, tent->s.origin2 );
ADDRLP4 144
ADDRLP4 84
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRF4
CNSTF4 3212836864
ADDRGP4 up
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 148
ADDRLP4 84
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 148
INDIRP4
ADDRLP4 148
INDIRP4
INDIRF4
CNSTF4 3212836864
ADDRGP4 up+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 152
ADDRLP4 84
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRF4
CNSTF4 3212836864
ADDRGP4 up+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 815
;813:
;814:	// no explosion at end if SURF_NOIMPACT, but still make the trail
;815:	if ( trace.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $257
line 816
;816:		tent->s.eventParm = 255;	// don't make the explosion at the end
ADDRLP4 84
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 255
ASGNI4
line 817
;817:	} else {
ADDRGP4 $258
JUMPV
LABELV $257
line 818
;818:		tent->s.eventParm = DirToByte( trace.plane.normal );
ADDRLP4 0+24
ARGP4
ADDRLP4 156
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 84
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 156
INDIRI4
ASGNI4
line 819
;819:	}
LABELV $258
line 820
;820:	tent->s.clientNum = ent->s.clientNum;
ADDRLP4 156
CNSTI4 168
ASGNI4
ADDRLP4 84
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
line 823
;821:
;822:	// give the shooter a reward sound if they have made two railgun hits in a row
;823:	if ( hits == 0 ) {
ADDRLP4 116
INDIRI4
CNSTI4 0
NEI4 $261
line 825
;824:		// complete miss
;825:		ent->client->accurateCount = 0;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2644
ADDP4
CNSTI4 0
ASGNI4
line 826
;826:	} else {
ADDRGP4 $262
JUMPV
LABELV $261
line 828
;827:		// check for "impressive" reward sound
;828:		ent->client->accurateCount += hits;
ADDRLP4 160
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2644
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRI4
ADDRLP4 116
INDIRI4
ADDI4
ASGNI4
line 829
;829:		if ( ent->client->accurateCount >= 2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2644
ADDP4
INDIRI4
CNSTI4 2
LTI4 $263
line 830
;830:			ent->client->accurateCount -= 2;
ADDRLP4 164
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2644
ADDP4
ASGNP4
ADDRLP4 164
INDIRP4
ADDRLP4 164
INDIRP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 831
;831:			ent->client->ps.persistant[PERS_IMPRESSIVE_COUNT]++;
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 284
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 833
;832:			// add the sprite over the player's head
;833:			ent->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 172
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 172
INDIRP4
ADDRLP4 172
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 834
;834:			ent->client->ps.eFlags |= EF_AWARD_IMPRESSIVE;
ADDRLP4 176
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 176
INDIRP4
ADDRLP4 176
INDIRP4
INDIRI4
CNSTI4 32768
BORI4
ASGNI4
line 835
;835:			ent->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2680
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 836
;836:		}
LABELV $263
line 837
;837:		ent->client->accuracy_hits++;
ADDRLP4 164
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2652
ADDP4
ASGNP4
ADDRLP4 164
INDIRP4
ADDRLP4 164
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 838
;838:	}
LABELV $262
line 840
;839:
;840:	trap_SendServerCommand(ent->client->ps.clientNum, "+greset");
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 $266
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 842
;841:
;842:}
LABELV $215
endproc weapon_railgun_fire 180 32
export Weapon_GrapplingHook_Fire
proc Weapon_GrapplingHook_Fire 4 20
line 856
;843:
;844:
;845:
;846:
;847:/*
;848:======================================================================
;849:
;850:GRAPPLING HOOK
;851:
;852:======================================================================
;853:*/
;854:
;855:void Weapon_GrapplingHook_Fire (gentity_t *ent)
;856:{
line 858
;857:	// Shafe - Trep  - Offhand Grappling Hook
;858:	AngleVectors (ent->client->ps.viewangles, forward, right, up);
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
line 859
;859:	CalcMuzzlePoint ( ent, forward, right, up, muzzle );
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
line 862
;860:	// End Shafe
;861:	
;862:	if (!ent->client->fireHeld && !ent->client->hook)
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 2692
ADDP4
INDIRI4
CNSTI4 0
NEI4 $268
ADDRLP4 0
INDIRP4
CNSTI4 2696
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $268
line 863
;863:		fire_grapple (ent, muzzle, forward);
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
LABELV $268
line 865
;864:
;865:	ent->client->fireHeld = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2692
ADDP4
CNSTI4 1
ASGNI4
line 866
;866:}
LABELV $267
endproc Weapon_GrapplingHook_Fire 4 20
export Weapon_HookFree
proc Weapon_HookFree 4 4
line 870
;867:
;868:
;869:void Weapon_HookFree (gentity_t *ent)
;870:{
line 871
;871:	ent->parent->client->hook = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2696
ADDP4
CNSTP4 0
ASGNP4
line 872
;872:	ent->parent->client->ps.pm_flags &= ~PMF_GRAPPLE_PULL;
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
line 873
;873:	G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 874
;874:}
LABELV $270
endproc Weapon_HookFree 4 4
export Weapon_HookThink
proc Weapon_HookThink 36 8
line 877
;875:
;876:void Weapon_HookThink (gentity_t *ent)
;877:{
line 878
;878:	if (ent->enemy) {
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $272
line 881
;879:		vec3_t v, oldorigin;
;880:
;881:		VectorCopy(ent->r.currentOrigin, oldorigin);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRB
ASGNB 12
line 882
;882:		v[0] = ent->enemy->r.currentOrigin[0] + (ent->enemy->r.mins[0] + ent->enemy->r.maxs[0]) * 0.5;
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
line 883
;883:		v[1] = ent->enemy->r.currentOrigin[1] + (ent->enemy->r.mins[1] + ent->enemy->r.maxs[1]) * 0.5;
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
line 884
;884:		v[2] = ent->enemy->r.currentOrigin[2] + (ent->enemy->r.mins[2] + ent->enemy->r.maxs[2]) * 0.5;
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
line 885
;885:		SnapVectorTowards( v, oldorigin );	// save net bandwidth
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 887
;886:
;887:		G_SetOrigin( ent, v );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 888
;888:	}
LABELV $272
line 890
;889:
;890:	VectorCopy( ent->r.currentOrigin, ent->parent->client->ps.grapplePoint);
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
line 891
;891:}
LABELV $271
endproc Weapon_HookThink 36 8
lit
align 4
LABELV $277
byte 4 0
byte 4 0
byte 4 0
export Weapon_fire_turret
code
proc Weapon_fire_turret 76 20
line 899
;892:
;893:
;894:/*
;895:=======================================================================
;896:TURRET - Not Used but this would be good for a vehichle
;897:=======================================================================
;898:*/
;899:void Weapon_fire_turret (gentity_t *ent, qboolean alt ) {
line 901
;900:	gentity_t *m;
;901:	float newforward[] = {0,0,0};
ADDRLP4 0
ADDRGP4 $277
INDIRB
ASGNB 12
line 906
;902:
;903:
;904:	// All of this is useless.. for the turrets, but lets tweak it for use as a shotgun variant
;905:
;906:	m = fire_turret(ent, muzzle, forward, alt);
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
line 907
;907:	m->damage *= s_quadFactor;
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
line 908
;908:	m->splashDamage *= s_quadFactor;
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
line 910
;909:
;910:	if (alt == qtrue) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $278
line 914
;911:		
;912:		
;913:		//Second bullet goes to the right
;914:		AngleVectors( ent->client->ps.viewangles, forward, right, up );
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
line 915
;915:		VectorCopy( forward, newforward );
ADDRLP4 0
ADDRGP4 forward
INDIRB
ASGNB 12
line 916
;916:		if ( forward[0] >= 0.5 && forward[0] <= 1 ) 
ADDRLP4 28
ADDRGP4 forward
INDIRF4
ASGNF4
ADDRLP4 28
INDIRF4
CNSTF4 1056964608
LTF4 $280
ADDRLP4 28
INDIRF4
CNSTF4 1065353216
GTF4 $280
line 917
;917:		{
line 918
;918:			newforward[1] += .35f;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1051931443
ADDF4
ASGNF4
line 919
;919:		} 
ADDRGP4 $281
JUMPV
LABELV $280
line 920
;920:		else if ( forward[0] <= -0.5 && forward[0] >= -1 ) 
ADDRLP4 32
ADDRGP4 forward
INDIRF4
ASGNF4
ADDRLP4 32
INDIRF4
CNSTF4 3204448256
GTF4 $283
ADDRLP4 32
INDIRF4
CNSTF4 3212836864
LTF4 $283
line 921
;921:		{
line 922
;922:			newforward[1] += .35f;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1051931443
ADDF4
ASGNF4
line 923
;923:		} else {
ADDRGP4 $284
JUMPV
LABELV $283
line 924
;924:			newforward[0] += .35f;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1051931443
ADDF4
ASGNF4
line 925
;925:		}
LABELV $284
LABELV $281
line 927
;926:	
;927:		VectorNormalize( newforward );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 928
;928:		VectorAdd( newforward, forward, forward );
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
line 929
;929:		CalcMuzzlePoint( ent, forward, right, up, muzzle );
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
line 932
;930:	
;931:
;932:		m = fire_turret(ent, muzzle, forward, alt);
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
line 933
;933:		m->damage *= s_quadFactor;
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
line 934
;934:		m->splashDamage *= s_quadFactor;
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
line 939
;935:
;936:
;937:
;938:		//Third bullet goes to the left
;939:		AngleVectors (ent->client->ps.viewangles, forward, right, up);
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
line 940
;940:		VectorCopy( forward, newforward );
ADDRLP4 0
ADDRGP4 forward
INDIRB
ASGNB 12
line 941
;941:		if ( forward[0] >= 0.5 && forward[0] <= 1 ) {
ADDRLP4 52
ADDRGP4 forward
INDIRF4
ASGNF4
ADDRLP4 52
INDIRF4
CNSTF4 1056964608
LTF4 $292
ADDRLP4 52
INDIRF4
CNSTF4 1065353216
GTF4 $292
line 942
;942:		newforward[1] -= .35f;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1051931443
SUBF4
ASGNF4
line 943
;943:		} else if ( forward[0] <= -0.5 && forward[0] >= -1 ) {
ADDRGP4 $293
JUMPV
LABELV $292
ADDRLP4 56
ADDRGP4 forward
INDIRF4
ASGNF4
ADDRLP4 56
INDIRF4
CNSTF4 3204448256
GTF4 $295
ADDRLP4 56
INDIRF4
CNSTF4 3212836864
LTF4 $295
line 944
;944:		newforward[1] -= .35f;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1051931443
SUBF4
ASGNF4
line 945
;945:		} else {
ADDRGP4 $296
JUMPV
LABELV $295
line 946
;946:		newforward[0] -= .35f;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1051931443
SUBF4
ASGNF4
line 947
;947:		}
LABELV $296
LABELV $293
line 948
;948:		VectorNormalize( newforward );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 949
;949:		VectorAdd( newforward, forward, forward );
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
line 950
;950:		CalcMuzzlePoint ( ent, forward, right, up, muzzle );
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
line 952
;951:
;952:		m = fire_turret(ent, muzzle, forward, alt);
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
line 953
;953:		m->damage *= s_quadFactor;
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
line 954
;954:		m->splashDamage *= s_quadFactor;
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
line 955
;955:	}
LABELV $278
line 957
;956:
;957:}
LABELV $276
endproc Weapon_fire_turret 76 20
export Weapon_AltGataFire
proc Weapon_AltGataFire 120 32
line 967
;958:
;959:/*
;960:======================================================================
;961:
;962:ALT GATA
;963:
;964:======================================================================
;965:*/
;966:
;967:void Weapon_AltGataFire( gentity_t *ent ) {
line 979
;968:	trace_t		tr;
;969:	vec3_t		end;
;970:#ifdef MISSIONPACK
;971:	vec3_t impactpoint, bouncedir;
;972:#endif
;973:	gentity_t	*traceEnt, *tent;
;974:	int			damage, i, passent;
;975:
;976://unlagged - server options
;977:	// this is configurable now
;978://	damage = 8 * s_quadFactor;
;979:	damage = g_lightningDamage.integer * s_quadFactor;
ADDRLP4 84
ADDRGP4 g_lightningDamage+12
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 982
;980://unlagged - server options
;981:
;982:	passent = ent->s.number;
ADDRLP4 80
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 983
;983:	for (i = 0; i < 10; i++) {
ADDRLP4 76
CNSTI4 0
ASGNI4
LABELV $306
line 984
;984:		VectorMA( muzzle, LIGHTNING_RANGE, forward, end );
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
line 988
;985:
;986://unlagged - backward reconciliation #2
;987:	// backward-reconcile the other clients
;988:	G_DoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 991
;989://unlagged - backward reconciliation #2
;990:
;991:		trap_Trace (&tr, muzzle, NULL, NULL, end, passent, MASK_SHOT);
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
line 995
;992:
;993://unlagged - backward reconciliation #2
;994:	// put them back
;995:	G_UndoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 999
;996://unlagged - backward reconciliation #2
;997:
;998:
;999:		if ( tr.entityNum == ENTITYNUM_NONE ) {
ADDRLP4 0+52
INDIRI4
CNSTI4 1023
NEI4 $316
line 1000
;1000:			return;
ADDRGP4 $304
JUMPV
LABELV $316
line 1003
;1001:		}
;1002:
;1003:		traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 56
CNSTI4 924
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1005
;1004:
;1005:		if ( traceEnt->takedamage) {
ADDRLP4 56
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $320
line 1007
;1006:
;1007:				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
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
CNSTI4 8
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1010
;1008:					damage, 0, MOD_PLASMA);
;1009:
;1010:		}
LABELV $320
line 1012
;1011:
;1012:		if ( traceEnt->takedamage && traceEnt->client ) {
ADDRLP4 56
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $323
ADDRLP4 56
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $323
line 1013
;1013:			tent = G_TempEntity( tr.endpos, EV_MISSILE_HIT );
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
line 1014
;1014:			tent->s.otherEntityNum = traceEnt->s.number;
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 56
INDIRP4
INDIRI4
ASGNI4
line 1015
;1015:			tent->s.eventParm = DirToByte( tr.plane.normal );
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
line 1016
;1016:			tent->s.weapon = ent->s.weapon;
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
line 1017
;1017:			if( LogAccuracyHit( traceEnt, ent ) ) {
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
EQI4 $308
line 1018
;1018:				ent->client->accuracy_hits++;
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2652
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
line 1019
;1019:			}
line 1020
;1020:		} else if ( !( tr.surfaceFlags & SURF_NOIMPACT ) ) {
ADDRGP4 $308
JUMPV
LABELV $323
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $308
line 1021
;1021:			tent = G_TempEntity( tr.endpos, EV_MISSILE_MISS );
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
line 1022
;1022:			tent->s.eventParm = DirToByte( tr.plane.normal );
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
line 1023
;1023:		}
line 1025
;1024:
;1025:		break;
ADDRGP4 $308
JUMPV
LABELV $307
line 983
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 10
LTI4 $306
LABELV $308
line 1027
;1026:	}
;1027:}
LABELV $304
endproc Weapon_AltGataFire 120 32
export Weapon_LightningFire
proc Weapon_LightningFire 120 32
line 1037
;1028:
;1029:/*
;1030:======================================================================
;1031:
;1032:LIGHTNING GUN
;1033:
;1034:======================================================================
;1035:*/
;1036:
;1037:void Weapon_LightningFire( gentity_t *ent ) {
line 1049
;1038:	trace_t		tr;
;1039:	vec3_t		end;
;1040:#ifdef MISSIONPACK
;1041:	vec3_t impactpoint, bouncedir;
;1042:#endif
;1043:	gentity_t	*traceEnt, *tent;
;1044:	int			damage, i, passent;
;1045:
;1046://unlagged - server options
;1047:	// this is configurable now
;1048://	damage = 8 * s_quadFactor;
;1049:	damage = g_lightningDamage.integer * s_quadFactor;
ADDRLP4 84
ADDRGP4 g_lightningDamage+12
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1052
;1050://unlagged - server options
;1051:
;1052:	passent = ent->s.number;
ADDRLP4 80
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1053
;1053:	for (i = 0; i < 10; i++) {
ADDRLP4 76
CNSTI4 0
ASGNI4
LABELV $336
line 1054
;1054:		VectorMA( muzzle, LIGHTNING_RANGE, forward, end );
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
line 1058
;1055:
;1056://unlagged - backward reconciliation #2
;1057:	// backward-reconcile the other clients
;1058:	G_DoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 1061
;1059://unlagged - backward reconciliation #2
;1060:
;1061:		trap_Trace (&tr, muzzle, NULL, NULL, end, passent, MASK_SHOT);
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
line 1065
;1062:
;1063://unlagged - backward reconciliation #2
;1064:	// put them back
;1065:	G_UndoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 1080
;1066://unlagged - backward reconciliation #2
;1067:
;1068:#ifdef MISSIONPACK
;1069:		// if not the first trace (the lightning bounced of an invulnerability sphere)
;1070:		if (i) {
;1071:			// add bounced off lightning bolt temp entity
;1072:			// the first lightning bolt is a cgame only visual
;1073:			//
;1074:			tent = G_TempEntity( muzzle, EV_LIGHTNINGBOLT );
;1075:			VectorCopy( tr.endpos, end );
;1076:			SnapVector( end );
;1077:			VectorCopy( end, tent->s.origin2 );
;1078:		}
;1079:#endif
;1080:		if ( tr.entityNum == ENTITYNUM_NONE ) {
ADDRLP4 0+52
INDIRI4
CNSTI4 1023
NEI4 $346
line 1081
;1081:			return;
ADDRGP4 $334
JUMPV
LABELV $346
line 1084
;1082:		}
;1083:
;1084:		traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 56
CNSTI4 924
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1086
;1085:
;1086:		if ( traceEnt->takedamage) {
ADDRLP4 56
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $350
line 1108
;1087:#ifdef MISSIONPACK
;1088:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
;1089:				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
;1090:					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
;1091:					VectorCopy( impactpoint, muzzle );
;1092:					VectorSubtract( end, impactpoint, forward );
;1093:					VectorNormalize(forward);
;1094:					// the player can hit him/herself with the bounced lightning
;1095:					passent = ENTITYNUM_NONE;
;1096:				}
;1097:				else {
;1098:					VectorCopy( tr.endpos, muzzle );
;1099:					passent = traceEnt->s.number;
;1100:				}
;1101:				continue;
;1102:			}
;1103:			else {
;1104:				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
;1105:					damage, 0, MOD_LIGHTNING);
;1106:			}
;1107:#else
;1108:				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
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
line 1111
;1109:					damage, 0, MOD_LIGHTNING);
;1110:#endif
;1111:		}
LABELV $350
line 1113
;1112:
;1113:		if ( traceEnt->takedamage && traceEnt->client ) {
ADDRLP4 56
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $353
ADDRLP4 56
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $353
line 1114
;1114:			tent = G_TempEntity( tr.endpos, EV_MISSILE_HIT );
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
line 1115
;1115:			tent->s.otherEntityNum = traceEnt->s.number;
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 56
INDIRP4
INDIRI4
ASGNI4
line 1116
;1116:			tent->s.eventParm = DirToByte( tr.plane.normal );
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
line 1117
;1117:			tent->s.weapon = ent->s.weapon;
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
line 1118
;1118:			if( LogAccuracyHit( traceEnt, ent ) ) {
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
EQI4 $338
line 1119
;1119:				ent->client->accuracy_hits++;
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2652
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
line 1120
;1120:			}
line 1121
;1121:		} else if ( !( tr.surfaceFlags & SURF_NOIMPACT ) ) {
ADDRGP4 $338
JUMPV
LABELV $353
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $338
line 1122
;1122:			tent = G_TempEntity( tr.endpos, EV_MISSILE_MISS );
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
line 1123
;1123:			tent->s.eventParm = DirToByte( tr.plane.normal );
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
line 1124
;1124:		}
line 1126
;1125:
;1126:		break;
ADDRGP4 $338
JUMPV
LABELV $337
line 1053
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 10
LTI4 $336
LABELV $338
line 1128
;1127:	}
;1128:}
LABELV $334
endproc Weapon_LightningFire 120 32
export LogAccuracyHit
proc LogAccuracyHit 4 8
line 1187
;1129:
;1130:
;1131:
;1132:#ifdef MISSIONPACK
;1133:/*
;1134:======================================================================
;1135:
;1136:NAILGUN
;1137:
;1138:======================================================================
;1139:*/
;1140:
;1141:void Weapon_Nailgun_Fire (gentity_t *ent) {
;1142:	gentity_t	*m;
;1143:	int			count;
;1144:
;1145:	for( count = 0; count < NUM_NAILSHOTS; count++ ) {
;1146:		m = fire_nail (ent, muzzle, forward, right, up );
;1147:		m->damage *= s_quadFactor;
;1148:		m->splashDamage *= s_quadFactor;
;1149:	}
;1150:
;1151://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;1152:}
;1153:
;1154:
;1155:/*
;1156:======================================================================
;1157:
;1158:PROXIMITY MINE LAUNCHER
;1159:
;1160:======================================================================
;1161:*/
;1162:
;1163:void weapon_proxlauncher_fire (gentity_t *ent) {
;1164:	gentity_t	*m;
;1165:
;1166:	// extra vertical velocity
;1167:	forward[2] += 0.2f;
;1168:	VectorNormalize( forward );
;1169:
;1170:	m = fire_prox (ent, muzzle, forward);
;1171:	m->damage *= s_quadFactor;
;1172:	m->splashDamage *= s_quadFactor;
;1173:
;1174://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;1175:}
;1176:
;1177:#endif
;1178:
;1179://======================================================================
;1180:
;1181:
;1182:/*
;1183:===============
;1184:LogAccuracyHit
;1185:===============
;1186:*/
;1187:qboolean LogAccuracyHit( gentity_t *target, gentity_t *attacker ) {
line 1188
;1188:	if( !target->takedamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
NEI4 $365
line 1189
;1189:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $364
JUMPV
LABELV $365
line 1192
;1190:	}
;1191:
;1192:	if ( target == attacker ) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
NEU4 $367
line 1193
;1193:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $364
JUMPV
LABELV $367
line 1196
;1194:	}
;1195:
;1196:	if( !target->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $369
line 1197
;1197:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $364
JUMPV
LABELV $369
line 1200
;1198:	}
;1199:
;1200:	if( !attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $371
line 1201
;1201:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $364
JUMPV
LABELV $371
line 1204
;1202:	}
;1203:
;1204:	if( target->client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $373
line 1205
;1205:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $364
JUMPV
LABELV $373
line 1208
;1206:	}
;1207:
;1208:	if ( OnSameTeam( target, attacker ) ) {
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
EQI4 $375
line 1209
;1209:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $364
JUMPV
LABELV $375
line 1212
;1210:	}
;1211:
;1212:	return qtrue;
CNSTI4 1
RETI4
LABELV $364
endproc LogAccuracyHit 4 8
export CalcMuzzlePoint
proc CalcMuzzlePoint 48 4
line 1223
;1213:}
;1214:
;1215:
;1216:/*
;1217:===============
;1218:CalcMuzzlePoint
;1219:
;1220:set muzzle location relative to pivoting eye
;1221:===============
;1222:*/
;1223:void CalcMuzzlePoint ( gentity_t *ent, vec3_t forward, vec3_t right, vec3_t up, vec3_t muzzlePoint ) {
line 1224
;1224:	VectorCopy( ent->s.pos.trBase, muzzlePoint );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1225
;1225:	muzzlePoint[2] += ent->client->ps.viewheight;
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
line 1226
;1226:	VectorMA( muzzlePoint, 14, forward, muzzlePoint );
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
line 1228
;1227:	// snap to integer coordinates for more efficient network bandwidth usage
;1228:	SnapVector( muzzlePoint );
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
line 1229
;1229:}
LABELV $377
endproc CalcMuzzlePoint 48 4
export CalcMuzzlePointOrigin
proc CalcMuzzlePointOrigin 48 4
line 1238
;1230:
;1231:/*
;1232:===============
;1233:CalcMuzzlePointOrigin
;1234:
;1235:set muzzle location relative to pivoting eye
;1236:===============
;1237:*/
;1238:void CalcMuzzlePointOrigin ( gentity_t *ent, vec3_t origin, vec3_t forward, vec3_t right, vec3_t up, vec3_t muzzlePoint ) {
line 1239
;1239:	VectorCopy( ent->s.pos.trBase, muzzlePoint );
ADDRFP4 20
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1240
;1240:	muzzlePoint[2] += ent->client->ps.viewheight;
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
line 1241
;1241:	VectorMA( muzzlePoint, 14, forward, muzzlePoint );
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
line 1243
;1242:	// snap to integer coordinates for more efficient network bandwidth usage
;1243:	SnapVector( muzzlePoint );
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
line 1244
;1244:}
LABELV $378
endproc CalcMuzzlePointOrigin 48 4
export FireWeapon
proc FireWeapon 16 24
line 1253
;1245:
;1246:
;1247:
;1248:/*
;1249:===============
;1250:FireWeapon
;1251:===============
;1252:*/
;1253:void FireWeapon( gentity_t *ent ) {
line 1254
;1254:	if (ent->client->ps.powerups[PW_QUAD] ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $380
line 1255
;1255:		s_quadFactor = g_quadfactor.value;
ADDRGP4 s_quadFactor
ADDRGP4 g_quadfactor+8
INDIRF4
ASGNF4
line 1256
;1256:	} else {
ADDRGP4 $381
JUMPV
LABELV $380
line 1257
;1257:		s_quadFactor = 1;
ADDRGP4 s_quadFactor
CNSTF4 1065353216
ASGNF4
line 1258
;1258:	}
LABELV $381
line 1266
;1259:#ifdef MISSIONPACK
;1260:	if( ent->client->persistantPowerup && ent->client->persistantPowerup->item && ent->client->persistantPowerup->item->giTag == PW_DOUBLER ) {
;1261:		s_quadFactor *= 2;
;1262:	}
;1263:#endif
;1264:
;1265:	// track shots taken for accuracy tracking.  Grapple is not a weapon and gauntet is just not tracked
;1266:	if( ent->s.weapon != WP_GRAPPLING_HOOK && ent->s.weapon != WP_GAUNTLET ) {
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
EQI4 $383
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $383
line 1274
;1267:#ifdef MISSIONPACK
;1268:		if( ent->s.weapon == WP_NAILGUN ) {
;1269:			ent->client->accuracy_shots += NUM_NAILSHOTS;
;1270:		} else {
;1271:			ent->client->accuracy_shots++;
;1272:		}
;1273:#else
;1274:		ent->client->accuracy_shots++;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2648
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
line 1276
;1275:#endif
;1276:	}
LABELV $383
line 1279
;1277:
;1278:	// set aiming directions
;1279:	AngleVectors (ent->client->ps.viewangles, forward, right, up);
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
line 1281
;1280:
;1281:	CalcMuzzlePointOrigin ( ent, ent->client->oldOrigin, forward, right, up, muzzle );
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
CNSTI4 2604
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
line 1284
;1282:
;1283:	// fire the specific weapon
;1284:	switch( ent->s.weapon ) {
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
LTI4 $386
ADDRLP4 8
INDIRI4
CNSTI4 11
GTI4 $386
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $399-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $399
address $388
address $391
address $390
address $392
address $393
address $389
address $395
address $394
address $396
address $397
address $398
code
LABELV $388
line 1286
;1285:	case WP_GAUNTLET:
;1286:		Weapon_Gauntlet( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Gauntlet
CALLV
pop
line 1287
;1287:		break;
ADDRGP4 $386
JUMPV
LABELV $389
line 1290
;1288:	case WP_LIGHTNING:
;1289:		//Weapon_LightningFire( ent );
;1290:		Weapon_fire_flame(ent , qfalse );  // Shafe - Trep - Flame Thrower
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Weapon_fire_flame
CALLV
pop
line 1291
;1291:		break;
ADDRGP4 $386
JUMPV
LABELV $390
line 1293
;1292:	case WP_SHOTGUN:
;1293:		weapon_supershotgun_fire( ent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 weapon_supershotgun_fire
CALLV
pop
line 1294
;1294:		break;
ADDRGP4 $386
JUMPV
LABELV $391
line 1296
;1295:	case WP_MACHINEGUN:
;1296:		Weapon_fire_mg( ent, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Weapon_fire_mg
CALLV
pop
line 1304
;1297:		/*
;1298:		if ( g_gametype.integer != GT_TEAM ) {
;1299:			Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_DAMAGE );
;1300:		} else {
;1301:			Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_TEAM_DAMAGE );
;1302:		}
;1303:		*/
;1304:		break;
ADDRGP4 $386
JUMPV
LABELV $392
line 1306
;1305:	case WP_GRENADE_LAUNCHER:
;1306:		weapon_grenadelauncher_fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_grenadelauncher_fire
CALLV
pop
line 1308
;1307:		//weapon_bomblauncher_fire( ent, qtrue);  // This is the 2 step grenades, may be worth revisiting - Shafe
;1308:		break;
ADDRGP4 $386
JUMPV
LABELV $393
line 1310
;1309:	case WP_ROCKET_LAUNCHER:
;1310:		Weapon_RocketLauncher_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_RocketLauncher_Fire
CALLV
pop
line 1311
;1311:		break;
ADDRGP4 $386
JUMPV
LABELV $394
line 1313
;1312:	case WP_PLASMAGUN:
;1313:		Weapon_Plasmagun_Fire( ent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Weapon_Plasmagun_Fire
CALLV
pop
line 1314
;1314:		break;
ADDRGP4 $386
JUMPV
LABELV $395
line 1316
;1315:	case WP_RAILGUN:
;1316:		weapon_railgun_fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_railgun_fire
CALLV
pop
line 1317
;1317:		break;
ADDRGP4 $386
JUMPV
LABELV $396
line 1319
;1318:	case WP_BFG:
;1319:		BFG_Fire( ent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BFG_Fire
CALLV
pop
line 1320
;1320:		break;
ADDRGP4 $386
JUMPV
LABELV $397
line 1322
;1321:	case WP_GRAPPLING_HOOK:
;1322:		Weapon_GrapplingHook_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_GrapplingHook_Fire
CALLV
pop
line 1323
;1323:		break;
ADDRGP4 $386
JUMPV
LABELV $398
line 1325
;1324:	case WP_TURRET:
;1325:		Weapon_fire_turret( ent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Weapon_fire_turret
CALLV
pop
line 1326
;1326:		break;	
line 1340
;1327:#ifdef MISSIONPACK
;1328:	case WP_NAILGUN:
;1329:		Weapon_Nailgun_Fire( ent );
;1330:		break;
;1331:	case WP_PROX_LAUNCHER:
;1332:		weapon_proxlauncher_fire( ent );
;1333:		break;
;1334:	case WP_CHAINGUN:
;1335:		Bullet_Fire( ent, CHAINGUN_SPREAD, MACHINEGUN_DAMAGE );
;1336:		break;
;1337:#endif
;1338:	default:
;1339:// FIXME		G_Error( "Bad ent->s.weapon" );
;1340:		break;
LABELV $386
line 1342
;1341:	}
;1342:}
LABELV $379
endproc FireWeapon 16 24
export FireWeapon2
proc FireWeapon2 12 20
line 1352
;1343:
;1344:
;1345:/* 
;1346:=============== 
;1347:FireWeapon2 
;1348:Shafe - Trep - Alt Fire FireWeapon2
;1349:Right now this just shoots rockets...
;1350:=============== 
;1351:*/ 
;1352:void FireWeapon2( gentity_t *ent ) { 
line 1353
;1353: if (ent->client->ps.powerups[PW_QUAD] ) { 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $402
line 1354
;1354:  s_quadFactor = g_quadfactor.value; 
ADDRGP4 s_quadFactor
ADDRGP4 g_quadfactor+8
INDIRF4
ASGNF4
line 1355
;1355: } else { 
ADDRGP4 $403
JUMPV
LABELV $402
line 1356
;1356:  s_quadFactor = 1; 
ADDRGP4 s_quadFactor
CNSTF4 1065353216
ASGNF4
line 1357
;1357: } 
LABELV $403
line 1360
;1358:
;1359: // track shots taken for accuracy tracking.  Grapple is not a weapon and gauntet is just not tracked 
;1360: if( ent->s.weapon != WP_GRAPPLING_HOOK && ent->s.weapon != WP_GAUNTLET ) { 
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
EQI4 $405
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $405
line 1363
;1361:   //ent->client->ps.persistant[PERS_ACCURACY_SHOTS]++;  // This doesnt exist?
;1362:	// ent->client->accuracy_shots++;
;1363: } 
LABELV $405
line 1366
;1364:
;1365: // set aiming directions 
;1366: AngleVectors (ent->client->ps.viewangles, forward, right, up); 
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
line 1368
;1367:
;1368: CalcMuzzlePoint ( ent, forward, right, up, muzzle ); 
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
line 1371
;1369:
;1370: // fire the specific weapon 
;1371: switch( ent->s.weapon ) { 
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
LTI4 $408
ADDRLP4 4
INDIRI4
CNSTI4 11
GTI4 $408
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $421-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $421
address $410
address $413
address $412
address $414
address $415
address $411
address $408
address $416
address $418
address $419
address $420
code
LABELV $410
line 1373
;1372: case WP_GAUNTLET: 
;1373:	Weapon_Gauntlet( ent ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Gauntlet
CALLV
pop
line 1374
;1374:	break; 
ADDRGP4 $408
JUMPV
LABELV $411
line 1376
;1375: case WP_LIGHTNING: 
;1376:	Weapon_fire_flame( ent, qtrue);  // Shafe - Trep - Flame Thrower
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Weapon_fire_flame
CALLV
pop
line 1377
;1377:	break; 
ADDRGP4 $408
JUMPV
LABELV $412
line 1381
;1378: case WP_SHOTGUN: 
;1379:	 //weapon_bomblauncher_fire( ent, qtrue); // Not Ready Yet
;1380:	 //weapon_supershotgun_fire( ent, qtrue );
;1381:	 weapon_pdlauncher_fire( ent); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_pdlauncher_fire
CALLV
pop
line 1382
;1382:	break; 
ADDRGP4 $408
JUMPV
LABELV $413
line 1386
;1383: case WP_MACHINEGUN: 
;1384:  //Weapon_RocketLauncher_Fire( ent );
;1385: 	//Weapon_fire_turret( ent );
;1386:	 Weapon_fire_mg( ent, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Weapon_fire_mg
CALLV
pop
line 1394
;1387:	/* 
;1388:	if ( g_gametype.integer != GT_TEAM ) { 
;1389:		Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_DAMAGE ); 
;1390:	} else { 
;1391:		Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_TEAM_DAMAGE ); 
;1392:	} 
;1393:	*/
;1394:  break; 
ADDRGP4 $408
JUMPV
LABELV $414
line 1396
;1395: case WP_GRENADE_LAUNCHER: 
;1396:	weapon_altgrenadelauncher_fire( ent ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_altgrenadelauncher_fire
CALLV
pop
line 1397
;1397:	break; 
ADDRGP4 $408
JUMPV
LABELV $415
line 1399
;1398: case WP_ROCKET_LAUNCHER: 
;1399:	Weapon_RocketLauncher_AltFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_RocketLauncher_AltFire
CALLV
pop
line 1400
;1400:	break; 
ADDRGP4 $408
JUMPV
LABELV $416
line 1402
;1401: case WP_PLASMAGUN: 
;1402:	Weapon_Plasmagun_Fire( ent, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Weapon_Plasmagun_Fire
CALLV
pop
line 1403
;1403:	break; 
ADDRGP4 $408
JUMPV
line 1406
;1404: case WP_RAILGUN: 
;1405:	// This is just zoom
;1406:	break; 
LABELV $418
line 1408
;1407: case WP_BFG: 
;1408:	BFG_Fire( ent, qtrue); 
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BFG_Fire
CALLV
pop
line 1409
;1409:	break; 
ADDRGP4 $408
JUMPV
LABELV $419
line 1411
;1410: case WP_GRAPPLING_HOOK: 
;1411:	Weapon_GrapplingHook_Fire( ent ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_GrapplingHook_Fire
CALLV
pop
line 1412
;1412:	break;
ADDRGP4 $408
JUMPV
LABELV $420
line 1414
;1413: case WP_TURRET:
;1414:	Weapon_fire_turret( ent, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Weapon_fire_turret
CALLV
pop
line 1415
;1415:	break;	
line 1418
;1416: default: 
;1417:// FIXME  G_Error( "Bad ent->s.weapon" ); 
;1418:  break; 
LABELV $408
line 1420
;1419: } 
;1420:}
LABELV $401
endproc FireWeapon2 12 20
lit
align 4
LABELV $424
byte 4 3246391296
byte 4 3246391296
byte 4 0
align 4
LABELV $425
byte 4 1098907648
byte 4 1098907648
byte 4 1098907648
export CanBuildHere
code
proc CanBuildHere 136 28
line 1691
;1421:
;1422:
;1423:#ifdef MISSIONPACK
;1424:
;1425:/*
;1426:===============
;1427:KamikazeRadiusDamage
;1428:===============
;1429:*/
;1430:static void KamikazeRadiusDamage( vec3_t origin, gentity_t *attacker, float damage, float radius ) {
;1431:	float		dist;
;1432:	gentity_t	*ent;
;1433:	int			entityList[MAX_GENTITIES];
;1434:	int			numListedEntities;
;1435:	vec3_t		mins, maxs;
;1436:	vec3_t		v;
;1437:	vec3_t		dir;
;1438:	int			i, e;
;1439:
;1440:	if ( radius < 1 ) {
;1441:		radius = 1;
;1442:	}
;1443:
;1444:	for ( i = 0 ; i < 3 ; i++ ) {
;1445:		mins[i] = origin[i] - radius;
;1446:		maxs[i] = origin[i] + radius;
;1447:	}
;1448:
;1449:	numListedEntities = trap_EntitiesInBox( mins, maxs, entityList, MAX_GENTITIES );
;1450:
;1451:	for ( e = 0 ; e < numListedEntities ; e++ ) {
;1452:		ent = &g_entities[entityList[ e ]];
;1453:
;1454:		if (!ent->takedamage) {
;1455:			continue;
;1456:		}
;1457:
;1458:		// dont hit things we have already hit
;1459:		if( ent->kamikazeTime > level.time ) {
;1460:			continue;
;1461:		}
;1462:
;1463:		// find the distance from the edge of the bounding box
;1464:		for ( i = 0 ; i < 3 ; i++ ) {
;1465:			if ( origin[i] < ent->r.absmin[i] ) {
;1466:				v[i] = ent->r.absmin[i] - origin[i];
;1467:			} else if ( origin[i] > ent->r.absmax[i] ) {
;1468:				v[i] = origin[i] - ent->r.absmax[i];
;1469:			} else {
;1470:				v[i] = 0;
;1471:			}
;1472:		}
;1473:
;1474:		dist = VectorLength( v );
;1475:		if ( dist >= radius ) {
;1476:			continue;
;1477:		}
;1478:
;1479://		if( CanDamage (ent, origin) ) {
;1480:			VectorSubtract (ent->r.currentOrigin, origin, dir);
;1481:			// push the center of mass higher than the origin so players
;1482:			// get knocked into the air more
;1483:			dir[2] += 24;
;1484:			G_Damage( ent, NULL, attacker, dir, origin, damage, DAMAGE_RADIUS|DAMAGE_NO_TEAM_PROTECTION, MOD_KAMIKAZE );
;1485:			ent->kamikazeTime = level.time + 3000;
;1486://		}
;1487:	}
;1488:}
;1489:
;1490:/*
;1491:===============
;1492:KamikazeShockWave
;1493:===============
;1494:*/
;1495:static void KamikazeShockWave( vec3_t origin, gentity_t *attacker, float damage, float push, float radius ) {
;1496:	float		dist;
;1497:	gentity_t	*ent;
;1498:	int			entityList[MAX_GENTITIES];
;1499:	int			numListedEntities;
;1500:	vec3_t		mins, maxs;
;1501:	vec3_t		v;
;1502:	vec3_t		dir;
;1503:	int			i, e;
;1504:
;1505:	if ( radius < 1 )
;1506:		radius = 1;
;1507:
;1508:	for ( i = 0 ; i < 3 ; i++ ) {
;1509:		mins[i] = origin[i] - radius;
;1510:		maxs[i] = origin[i] + radius;
;1511:	}
;1512:
;1513:	numListedEntities = trap_EntitiesInBox( mins, maxs, entityList, MAX_GENTITIES );
;1514:
;1515:	for ( e = 0 ; e < numListedEntities ; e++ ) {
;1516:		ent = &g_entities[entityList[ e ]];
;1517:
;1518:		// dont hit things we have already hit
;1519:		if( ent->kamikazeShockTime > level.time ) {
;1520:			continue;
;1521:		}
;1522:
;1523:		// find the distance from the edge of the bounding box
;1524:		for ( i = 0 ; i < 3 ; i++ ) {
;1525:			if ( origin[i] < ent->r.absmin[i] ) {
;1526:				v[i] = ent->r.absmin[i] - origin[i];
;1527:			} else if ( origin[i] > ent->r.absmax[i] ) {
;1528:				v[i] = origin[i] - ent->r.absmax[i];
;1529:			} else {
;1530:				v[i] = 0;
;1531:			}
;1532:		}
;1533:
;1534:		dist = VectorLength( v );
;1535:		if ( dist >= radius ) {
;1536:			continue;
;1537:		}
;1538:
;1539://		if( CanDamage (ent, origin) ) {
;1540:			VectorSubtract (ent->r.currentOrigin, origin, dir);
;1541:			dir[2] += 24;
;1542:			G_Damage( ent, NULL, attacker, dir, origin, damage, DAMAGE_RADIUS|DAMAGE_NO_TEAM_PROTECTION, MOD_KAMIKAZE );
;1543:			//
;1544:			dir[2] = 0;
;1545:			VectorNormalize(dir);
;1546:			if ( ent->client ) {
;1547:				ent->client->ps.velocity[0] = dir[0] * push;
;1548:				ent->client->ps.velocity[1] = dir[1] * push;
;1549:				ent->client->ps.velocity[2] = 100;
;1550:			}
;1551:			ent->kamikazeShockTime = level.time + 3000;
;1552://		}
;1553:	}
;1554:}
;1555:
;1556:/*
;1557:===============
;1558:KamikazeDamage
;1559:===============
;1560:*/
;1561:static void KamikazeDamage( gentity_t *self ) {
;1562:	int i;
;1563:	float t;
;1564:	gentity_t *ent;
;1565:	vec3_t newangles;
;1566:
;1567:	self->count += 100;
;1568:
;1569:	if (self->count >= KAMI_SHOCKWAVE_STARTTIME) {
;1570:		// shockwave push back
;1571:		t = self->count - KAMI_SHOCKWAVE_STARTTIME;
;1572:		KamikazeShockWave(self->s.pos.trBase, self->activator, 25, 400,	(int) (float) t * KAMI_SHOCKWAVE_MAXRADIUS / (KAMI_SHOCKWAVE_ENDTIME - KAMI_SHOCKWAVE_STARTTIME) );
;1573:	}
;1574:	//
;1575:	if (self->count >= KAMI_EXPLODE_STARTTIME) {
;1576:		// do our damage
;1577:		t = self->count - KAMI_EXPLODE_STARTTIME;
;1578:		KamikazeRadiusDamage( self->s.pos.trBase, self->activator, 400,	(int) (float) t * KAMI_BOOMSPHERE_MAXRADIUS / (KAMI_IMPLODE_STARTTIME - KAMI_EXPLODE_STARTTIME) );
;1579:	}
;1580:
;1581:	// either cycle or kill self
;1582:	if( self->count >= KAMI_SHOCKWAVE_ENDTIME ) {
;1583:		G_FreeEntity( self );
;1584:		return;
;1585:	}
;1586:	self->nextthink = level.time + 100;
;1587:
;1588:	// add earth quake effect
;1589:	newangles[0] = crandom() * 2;
;1590:	newangles[1] = crandom() * 2;
;1591:	newangles[2] = 0;
;1592:	for (i = 0; i < MAX_CLIENTS; i++)
;1593:	{
;1594:		ent = &g_entities[i];
;1595:		if (!ent->inuse)
;1596:			continue;
;1597:		if (!ent->client)
;1598:			continue;
;1599:
;1600:		if (ent->client->ps.groundEntityNum != ENTITYNUM_NONE) {
;1601:			ent->client->ps.velocity[0] += crandom() * 120;
;1602:			ent->client->ps.velocity[1] += crandom() * 120;
;1603:			ent->client->ps.velocity[2] = 30 + random() * 25;
;1604:		}
;1605:
;1606:		ent->client->ps.delta_angles[0] += ANGLE2SHORT(newangles[0] - self->movedir[0]);
;1607:		ent->client->ps.delta_angles[1] += ANGLE2SHORT(newangles[1] - self->movedir[1]);
;1608:		ent->client->ps.delta_angles[2] += ANGLE2SHORT(newangles[2] - self->movedir[2]);
;1609:	}
;1610:	VectorCopy(newangles, self->movedir);
;1611:}
;1612:
;1613:/*
;1614:===============
;1615:G_StartKamikaze
;1616:===============
;1617:*/
;1618:void G_StartKamikaze( gentity_t *ent ) {
;1619:	gentity_t	*explosion;
;1620:	gentity_t	*te;
;1621:	vec3_t		snapped;
;1622:
;1623:	// start up the explosion logic
;1624:	explosion = G_Spawn();
;1625:
;1626:	explosion->s.eType = ET_EVENTS + EV_KAMIKAZE;
;1627:	explosion->eventTime = level.time;
;1628:
;1629:	if ( ent->client ) {
;1630:		VectorCopy( ent->s.pos.trBase, snapped );
;1631:	}
;1632:	else {
;1633:		VectorCopy( ent->activator->s.pos.trBase, snapped );
;1634:	}
;1635:	SnapVector( snapped );		// save network bandwidth
;1636:	G_SetOrigin( explosion, snapped );
;1637:
;1638:	explosion->classname = "kamikaze";
;1639:	explosion->s.pos.trType = TR_STATIONARY;
;1640:
;1641:	explosion->kamikazeTime = level.time;
;1642:
;1643:	explosion->think = KamikazeDamage;
;1644:	explosion->nextthink = level.time + 100;
;1645:	explosion->count = 0;
;1646:	VectorClear(explosion->movedir);
;1647:
;1648:	trap_LinkEntity( explosion );
;1649:
;1650:	if (ent->client) {
;1651:		//
;1652:		explosion->activator = ent;
;1653:		//
;1654:		ent->s.eFlags &= ~EF_KAMIKAZE;
;1655:		// nuke the guy that used it
;1656:		G_Damage( ent, ent, ent, NULL, NULL, 100000, DAMAGE_NO_PROTECTION, MOD_KAMIKAZE );
;1657:	}
;1658:	else {
;1659:		if ( !strcmp(ent->activator->classname, "bodyque") ) {
;1660:			explosion->activator = &g_entities[ent->activator->r.ownerNum];
;1661:		}
;1662:		else {
;1663:			explosion->activator = ent->activator;
;1664:		}
;1665:	}
;1666:
;1667:	// play global sound at all clients
;1668:	te = G_TempEntity(snapped, EV_GLOBAL_TEAM_SOUND );
;1669:	te->r.svFlags |= SVF_BROADCAST;
;1670:	te->s.eventParm = GTS_KAMIKAZE;
;1671:}
;1672:#endif
;1673:
;1674:
;1675:/*
;1676:====================================================
;1677:MORE BUILDABLE STUFF
;1678:Done here for those night forward, right, and up values 
;1679:=================
;1680:*/
;1681:#define PLACEDIST			64
;1682:
;1683:/*
;1684:=================
;1685:CanBuildHere
;1686:
;1687:This checks to see that we can build this thing
;1688:=================
;1689:*/
;1690:qboolean CanBuildHere(gentity_t *playerent)
;1691:{
line 1693
;1692:	trace_t		tr;
;1693:	vec3_t		fwd, pos, dest, mins = {-16,-16, 0}, maxs = {16,16,16};
ADDRLP4 92
ADDRGP4 $424
INDIRB
ASGNB 12
ADDRLP4 104
ADDRGP4 $425
INDIRB
ASGNB 12
line 1698
;1694:
;1695:	
;1696:
;1697:	// can we place this in front of us?
;1698:	AngleVectors (playerent->client->ps.viewangles, fwd, NULL, NULL);
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
line 1699
;1699:	fwd[2] = 0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 1700
;1700:	VectorMA(playerent->client->ps.origin, PLACEDIST, fwd, dest);
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
line 1701
;1701:	trap_Trace (&tr, playerent->client->ps.origin, mins, maxs, dest, playerent->s.number, MASK_SHOT );
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
line 1702
;1702:	if (tr.fraction > 0.9)
ADDRLP4 24+8
INDIRF4
CNSTF4 1063675494
LEF4 $431
line 1703
;1703:	{//room in front
line 1704
;1704:		VectorCopy(tr.endpos, pos);
ADDRLP4 80
ADDRLP4 24+12
INDIRB
ASGNB 12
line 1706
;1705:		// drop to floor
;1706:		VectorSet( dest, pos[0], pos[1], pos[2] - 4096 );
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
line 1707
;1707:		trap_Trace( &tr, pos, mins, maxs, dest, playerent->s.number, MASK_SOLID );
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
line 1708
;1708:		if ( !tr.startsolid && !tr.allsolid )
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRLP4 24+4
INDIRI4
ADDRLP4 132
INDIRI4
NEI4 $439
ADDRLP4 24
INDIRI4
ADDRLP4 132
INDIRI4
NEI4 $439
line 1709
;1709:		{	
line 1710
;1710:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $423
JUMPV
LABELV $439
line 1712
;1711:		}
;1712:	}
LABELV $431
line 1714
;1713:	// no room
;1714:	return qfalse;
CNSTI4 0
RETI4
LABELV $423
endproc CanBuildHere 136 28
lit
align 4
LABELV $443
byte 4 0
byte 4 0
byte 4 0
export BuildableSpawn
code
proc BuildableSpawn 280 28
line 1728
;1715:}
;1716:
;1717:
;1718:
;1719:
;1720:/*
;1721:=================
;1722:BuildableSpawn
;1723:
;1724:This checks puts it in front, drops it to the ground and angles it correctly
;1725:=================
;1726:*/
;1727:void BuildableSpawn( gentity_t *base )
;1728:{ // Done here for those night forward, right, and up values -Vincent	
line 1730
;1729:vec3_t		start, dir, angles; // Part 1 stuff
;1730:vec3_t		origin, slope, nvf, ovf, ovr, new_angles = {0, 0, 0 }; // Part 2
ADDRLP4 116
ADDRGP4 $443
INDIRB
ASGNB 12
line 1734
;1731:float		pitch, mod, dot; // Part 2
;1732:trace_t		tr1, tr2; // Part 2
;1733:
;1734:if( !base || !base->parent || !base->parent->client )
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
EQU4 $447
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
EQU4 $447
ADDRLP4 240
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 236
INDIRU4
NEU4 $444
LABELV $447
line 1735
;1735:	return; // Verify for both parts
ADDRGP4 $442
JUMPV
LABELV $444
line 1738
;1736:
;1737:// Part 1: Initial spawning in front of the player -Vincent
;1738:VectorCopy( base->parent->client->ps.viewangles, angles );
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
line 1739
;1739:angles[0] = 0; // Stay straight
ADDRLP4 92
CNSTF4 0
ASGNF4
line 1740
;1740:angles[2] = 0; // Stay straight
ADDRLP4 92+8
CNSTF4 0
ASGNF4
line 1742
;1741:
;1742:AngleVectors( angles, forward, right, up );
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
line 1743
;1743:CalcMuzzlePoint( base, forward, right, up, start ); // Actual start point, away from the owner
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
line 1744
;1744:VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1745
;1745:VectorMA( start, 32, forward, start ); // Go in front of the player
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
line 1748
;1746:
;1747:
;1748:G_SetOrigin( base, start ); // Start a bit in front of the player
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1749
;1749:base->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1751
;1750:	
;1751:VectorCopy( forward, dir ); // To tweak it below this...
ADDRLP4 12
ADDRGP4 forward
INDIRB
ASGNB 12
line 1752
;1752:VectorNormalize( dir );
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1753
;1753:VectorScale( dir, 300, base->s.pos.trDelta );
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
line 1754
;1754:base->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1755
;1755:vectoangles( dir, base->s.angles);
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
line 1756
;1756:VectorCopy( base->s.angles, base->s.apos.trBase );
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
line 1757
;1757:VectorSet( base->s.apos.trDelta, 50, 0, 0 ); // Speed
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
line 1758
;1758:base->s.apos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1763
;1759:
;1760:
;1761:// Part 2: Put it on the ground and match it to slopes -Vincent
;1762:
;1763:VectorCopy( base->r.currentOrigin, origin );
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRB
ASGNB 12
line 1764
;1764:origin[2] -= 2500; // Trace it straight down
ADDRLP4 24+8
ADDRLP4 24+8
INDIRF4
CNSTF4 1159479296
SUBF4
ASGNF4
line 1767
;1765:// Trace for solids from the previous position to the new position on the ground, 
;1766:// but without getting stuck in the owner!
;1767:trap_Trace( &tr1, base->r.currentOrigin, base->r.mins, base->r.maxs, origin, 
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
EQU4 $462
ADDRLP4 252
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
INDIRI4
ASGNI4
ADDRGP4 $463
JUMPV
LABELV $462
ADDRLP4 252
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
LABELV $463
ADDRLP4 252
INDIRI4
ARGI4
CNSTI4 100664321
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1771
;1768:			base->parent ? base->parent->s.number : base->s.number, MASK_SHOT );
;1769:
;1770:
;1771:VectorCopy( base->r.currentOrigin, origin ); // Keep the old value for lava checking
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRB
ASGNB 12
line 1772
;1772:G_SetOrigin( base, tr1.endpos );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36+12
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1773
;1773:VectorCopy( base->r.currentOrigin, base->s.origin ); // Set it's new origin
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
line 1776
;1774:
;1775:
;1776:if( tr1.fraction < 1.0 && ( &tr1.plane ) )
ADDRLP4 36+8
INDIRF4
CNSTF4 1065353216
GEF4 $465
ADDRLP4 36+24
CVPU4 4
CNSTU4 0
EQU4 $465
line 1777
;1777:{ // Match to a slope when necessary
line 1778
;1778:VectorCopy( tr1.plane.normal, slope ); // Get the slopes' angles
ADDRLP4 220
ADDRLP4 36+24
INDIRB
ASGNB 12
line 1779
;1779:AngleVectors( base->s.angles, ovf, ovr, NULL ); // Already calculated in part 1
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
line 1780
;1780:vectoangles( slope, new_angles );
ADDRLP4 220
ARGP4
ADDRLP4 116
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1781
;1781:pitch = new_angles[PITCH] + 90;
ADDRLP4 212
ADDRLP4 116
INDIRF4
CNSTF4 1119092736
ADDF4
ASGNF4
line 1782
;1782:new_angles[ROLL] = new_angles[PITCH] = 0;
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
line 1783
;1783:AngleVectors( new_angles, nvf, NULL, NULL );
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
line 1785
;1784:
;1785:mod = DotProduct( nvf, ovr );
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
line 1786
;1786:if( mod < 0 )
ADDRLP4 152
INDIRF4
CNSTF4 0
GEF4 $475
line 1787
;1787:	mod = -1;
ADDRLP4 152
CNSTF4 3212836864
ASGNF4
ADDRGP4 $476
JUMPV
LABELV $475
line 1789
;1788:else
;1789:	mod = 1;
ADDRLP4 152
CNSTF4 1065353216
ASGNF4
LABELV $476
line 1791
;1790:
;1791:dot = DotProduct( nvf, ovf );
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
line 1793
;1792:// Modify its actual angles
;1793:base->s.angles[PITCH] = dot * pitch;
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
line 1794
;1794:base->s.angles[ROLL] = ( ( 1-Q_fabs( dot ) ) * pitch * mod );
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
line 1795
;1795:VectorCopy( base->s.angles, base->s.apos.trBase );
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
line 1796
;1796:}
LABELV $465
line 1798
;1797:
;1798:trap_LinkEntity( base ); // Add it...
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1802
;1799:
;1800:// Trace back to its original point to see if the buildable hit any non-solid content on its way
;1801:// When it does, the buildable should be cleared!
;1802:trap_Trace( &tr2, origin, base->r.mins, base->r.maxs, base->r.currentOrigin, 
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
EQU4 $482
ADDRLP4 264
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
INDIRI4
ASGNI4
ADDRGP4 $483
JUMPV
LABELV $482
ADDRLP4 264
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
LABELV $483
ADDRLP4 264
INDIRI4
ARGI4
CNSTI4 25
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1805
;1803:		   	base->parent ? base->parent->s.number : base->s.number, CONTENTS_LAVA | CONTENTS_SLIME | CONTENTS_SOLID );
;1804:
;1805:if( tr2.fraction < 1.0 ) // It did go through a bad content
ADDRLP4 156+8
INDIRF4
CNSTF4 1065353216
GEF4 $484
line 1806
;1806:{
line 1807
;1807:base->s.eType = ET_GENERAL; // To go for a die in g_buildables
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 1808
;1808:}
ADDRGP4 $485
JUMPV
LABELV $484
line 1810
;1809:else
;1810:{
line 1811
;1811:base->s.eType = ET_BUILDABLE; // Initialize it
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 13
ASGNI4
line 1812
;1812:}
LABELV $485
line 1814
;1813:// The actual buildables' thinking happens in g_buildables again, after this func
;1814:}
LABELV $442
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
import g_RegenAmmo
import g_RegenHealth
import g_AutoChangeMap
import g_lastmap2
import g_lastmap
import g_randommap
import g_mapfile
import g_ReverseCTF
import g_GuassRate
import g_GuassSelfDamage
import g_GuassKnockBack
import g_GuassJump
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
LABELV $266
byte 1 43
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 0
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
