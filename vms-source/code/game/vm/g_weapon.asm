export G_BounceProjectile
code
proc G_BounceProjectile 64 4
file "../g_weapon.c"
line 29
;1:// 2016 Trepidation Licensed under the GPL2 - Team Trepidation
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
;13:#define FLAMER_K_SCALE              2.0f
;14:#define FLAMER_DMG                  HDM(20)
;15:#define FLAMER_SPLASHDAMAGE         HDM(10)
;16:#define FLAMER_RADIUS               50       // splash radius
;17:#define FLAMER_SIZE                 15        // missile bounding box
;18:#define FLAMER_LIFETIME             700.0f
;19:#define FLAMER_SPEED                500.0f
;20:#define FLAMER_LAG                  0.65f    // the amount of player velocity that is added to the fireball
;21:
;22:
;23:
;24:/*
;25:================
;26:G_BounceProjectile
;27:================
;28:*/
;29:void G_BounceProjectile( vec3_t start, vec3_t impact, vec3_t dir, vec3_t endout ) {
line 33
;30:	vec3_t v, newv;
;31:	float dot;
;32:
;33:	VectorSubtract( impact, start, v );
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
line 34
;34:	dot = DotProduct( v, dir );
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
line 35
;35:	VectorMA( v, -2*dot, dir, newv );
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
line 37
;36:
;37:	VectorNormalize(newv);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 38
;38:	VectorMA(impact, 8192, newv, endout);
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
line 39
;39:}
LABELV $55
endproc G_BounceProjectile 64 4
export Weapon_Gauntlet
proc Weapon_Gauntlet 0 0
line 50
;40:
;41:
;42:/*
;43:======================================================================
;44:
;45:GAUNTLET
;46:
;47:======================================================================
;48:*/
;49:
;50:void Weapon_Gauntlet( gentity_t *ent ) {
line 52
;51:
;52:}
LABELV $66
endproc Weapon_Gauntlet 0 0
export flamethrowerFire
proc flamethrowerFire 20 12
line 58
;53:
;54:
;55:
;56:// 2015 v2
;57:void flamethrowerFire( gentity_t *ent )
;58:{
line 62
;59:	vec3_t origin;
;60:
;61:  // Correct muzzle so that the missile does not start in the ceiling 
;62:  VectorMA( muzzle, -7.0f, up, origin );
ADDRLP4 12
CNSTF4 3235905536
ASGNF4
ADDRLP4 0
ADDRGP4 muzzle
INDIRF4
ADDRLP4 12
INDIRF4
ADDRGP4 up
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRGP4 muzzle+4
INDIRF4
ADDRLP4 12
INDIRF4
ADDRGP4 up+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 muzzle+8
INDIRF4
CNSTF4 3235905536
ADDRGP4 up+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 65
;63:
;64:  // Correct muzzle so that the missile fires from the player's hand
;65:  VectorMA( origin, 4.5f, right, origin );
ADDRLP4 16
CNSTF4 1083179008
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
ADDRGP4 right
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 16
INDIRF4
ADDRGP4 right+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1083179008
ADDRGP4 right+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 68
;66:
;67:
;68:fire_flamethrower2( ent, origin, forward );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 fire_flamethrower2
CALLI4
pop
line 70
;69:  
;70:}
LABELV $67
endproc flamethrowerFire 20 12
export CheckGauntletAttack
proc CheckGauntletAttack 104 32
line 78
;71:
;72:
;73:/*
;74:===============
;75:CheckGauntletAttack
;76:===============
;77:*/
;78:qboolean CheckGauntletAttack( gentity_t *ent ) {
line 86
;79:	trace_t		tr;
;80:	vec3_t		end;
;81:	gentity_t	*tent;
;82:	gentity_t	*traceEnt;
;83:	int			damage;
;84:
;85:	// set aiming directions
;86:	AngleVectors (ent->client->ps.viewangles, forward, right, up);
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
line 88
;87:
;88:	CalcMuzzlePoint ( ent, forward, right, up, muzzle );
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
line 90
;89:
;90:	VectorMA (muzzle, 32, forward, end);
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
line 92
;91:
;92:	trap_Trace (&tr, muzzle, NULL, NULL, end, ent->s.number, MASK_SHOT);
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
line 93
;93:	if ( tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 4+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $87
line 94
;94:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $80
JUMPV
LABELV $87
line 97
;95:	}
;96:
;97:	traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 0
CNSTI4 924
ADDRLP4 4+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 100
;98:
;99:	// send blood impact
;100:	if ( traceEnt->takedamage && traceEnt->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $91
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $91
line 101
;101:		tent = G_TempEntity( tr.endpos, EV_MISSILE_HIT );
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
line 102
;102:		tent->s.otherEntityNum = traceEnt->s.number;
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 103
;103:		tent->s.eventParm = DirToByte( tr.plane.normal );
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
line 104
;104:		tent->s.weapon = ent->s.weapon;
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
line 105
;105:	}
LABELV $91
line 107
;106:
;107:	if ( !traceEnt->takedamage) {
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
NEI4 $95
line 108
;108:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $80
JUMPV
LABELV $95
line 111
;109:	}
;110:
;111:	if (ent->client->ps.powerups[PW_QUAD] ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $97
line 112
;112:		G_AddEvent( ent, EV_POWERUP_QUAD, 0 );
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
line 113
;113:		s_quadFactor = g_quadfactor.value;
ADDRGP4 s_quadFactor
ADDRGP4 g_quadfactor+8
INDIRF4
ASGNF4
line 114
;114:	} else {
ADDRGP4 $98
JUMPV
LABELV $97
line 115
;115:		s_quadFactor = 1;
ADDRGP4 s_quadFactor
CNSTF4 1065353216
ASGNF4
line 116
;116:	}
LABELV $98
line 123
;117:#ifdef MISSIONPACK
;118:	if( ent->client->persistantPowerup && ent->client->persistantPowerup->item && ent->client->persistantPowerup->item->giTag == PW_DOUBLER ) {
;119:		s_quadFactor *= 2;
;120:	}
;121:#endif
;122:
;123:	damage = 50 * s_quadFactor;
ADDRLP4 76
CNSTF4 1112014848
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 124
;124:	G_Damage( traceEnt, ent, ent, forward, tr.endpos,
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
line 127
;125:		damage, 0, MOD_GAUNTLET );
;126:
;127:	return qtrue;
CNSTI4 1
RETI4
LABELV $80
endproc CheckGauntletAttack 104 32
export Weapon_fire_flame
proc Weapon_fire_flame 16 16
line 137
;128:}
;129:
;130:
;131://
;132://=======================================================================
;133://FLAME_THROWER
;134://Shafe - Trep - Flame Thrower
;135://=======================================================================
;136://
;137:void Weapon_fire_flame (gentity_t *ent, qboolean alt ) {
line 140
;138:	gentity_t	*m;
;139:
;140:	m = fire_flame(ent, muzzle, forward, alt);
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
line 141
;141:	m->damage *= s_quadFactor;
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
line 142
;142:	m->splashDamage *= s_quadFactor;
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
line 143
;143:}	
LABELV $101
endproc Weapon_fire_flame 16 16
export Weapon_fire_mg
proc Weapon_fire_mg 16 16
line 189
;144:
;145:
;146:
;147:
;148:/*
;149:======================================================================
;150:
;151:MACHINEGUN
;152:
;153:======================================================================
;154:*/
;155:
;156:/*
;157:======================
;158:SnapVectorTowards
;159:
;160:Round a vector to integers for more efficient network
;161:transmission, but make sure that it rounds towards a given point
;162:rather than blindly truncating.  This prevents it from truncating 
;163:into a wall.
;164:======================
;165:*/
;166://unlagged - attack prediction #3
;167:// moved to q_shared.c
;168:/*
;169:void SnapVectorTowards( vec3_t v, vec3_t to ) {
;170:	int		i;
;171:
;172:	for ( i = 0 ; i < 3 ; i++ ) {
;173:		if ( to[i] <= v[i] ) {
;174:			v[i] = (int)v[i];
;175:		} else {
;176:			v[i] = (int)v[i] + 1;
;177:		}
;178:	}
;179:}
;180:*/
;181://unlagged - attack prediction #3
;182:
;183:
;184:/*
;185:=======================================================================
;186:MACHINE GUN
;187:=======================================================================
;188:*/
;189:void Weapon_fire_mg (gentity_t *ent, qboolean alt ) {
line 192
;190:	gentity_t *m;
;191:
;192:	m = fire_mg(ent, muzzle, forward, alt);
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
line 193
;193:	m->damage *= s_quadFactor;
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
line 194
;194:	m->splashDamage *= s_quadFactor;
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
line 195
;195:}
LABELV $102
endproc Weapon_fire_mg 16 16
export Bullet_Fire
proc Bullet_Fire 152 32
line 206
;196:
;197:
;198:
;199:#ifdef MISSIONPACK
;200:#define CHAINGUN_SPREAD		600
;201:#endif
;202:#define MACHINEGUN_SPREAD	64
;203:#define	MACHINEGUN_DAMAGE	7
;204:#define	MACHINEGUN_TEAM_DAMAGE	5		// wimpier MG in teamplay
;205:
;206:void Bullet_Fire (gentity_t *ent, float spread, int damage ) {
line 220
;207:	trace_t		tr;
;208:	vec3_t		end;
;209:#ifdef MISSIONPACK
;210:	vec3_t		impactpoint, bouncedir;
;211:#endif
;212:	float		r;
;213:	float		u;
;214:	gentity_t	*tent;
;215:	gentity_t	*traceEnt;
;216:	int			i, passent;
;217:
;218://unlagged - attack prediction #2
;219:	// we have to use something now that the client knows in advance
;220:	int			seed = ent->client->attackTime % 256;
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2756
ADDP4
INDIRI4
CNSTI4 256
MODI4
ASGNI4
line 223
;221://unlagged - attack prediction #2
;222:
;223:	damage *= s_quadFactor;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 232
;224:
;225://unlagged - attack prediction #2
;226:	// this has to match what's on the client
;227:/*
;228:	r = random() * M_PI * 2.0f;
;229:	u = sin(r) * crandom() * spread * 16;
;230:	r = cos(r) * crandom() * spread * 16;
;231:*/
;232:	r = Q_random(&seed) * M_PI * 2.0f;
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
line 233
;233:	u = sin(r) * Q_crandom(&seed) * spread * 16;
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
line 234
;234:	r = cos(r) * Q_crandom(&seed) * spread * 16;
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
line 236
;235://unlagged - attack prediction #2
;236:	VectorMA (muzzle, 8192*16, forward, end);
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
line 237
;237:	VectorMA (end, r, right, end);
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
line 238
;238:	VectorMA (end, u, up, end);
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
line 240
;239:
;240:	passent = ent->s.number;
ADDRLP4 80
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 241
;241:	for (i = 0; i < 10; i++) {
ADDRLP4 76
CNSTI4 0
ASGNI4
LABELV $122
line 245
;242:
;243://unlagged - backward reconciliation #2
;244:		// backward-reconcile the other clients
;245:		G_DoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 248
;246://unlagged - backward reconciliation #2
;247:
;248:		trap_Trace (&tr, muzzle, NULL, NULL, end, passent, MASK_SHOT);
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
line 252
;249:
;250://unlagged - backward reconciliation #2
;251:		// put them back
;252:		G_UndoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 255
;253://unlagged - backward reconciliation #2
;254:
;255:		if ( tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $126
line 256
;256:			return;
ADDRGP4 $103
JUMPV
LABELV $126
line 259
;257:		}
;258:
;259:		traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 56
CNSTI4 924
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 262
;260:
;261:		// snap the endpos to integers, but nudged towards the line
;262:		SnapVectorTowards( tr.endpos, muzzle );
ADDRLP4 0+12
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 265
;263:
;264:		// send bullet impact
;265:		if ( traceEnt->takedamage && traceEnt->client ) {
ADDRLP4 56
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $131
ADDRLP4 56
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $131
line 266
;266:			tent = G_TempEntity( tr.endpos, EV_BULLET_HIT_FLESH );
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
line 267
;267:			tent->s.eventParm = traceEnt->s.number;
ADDRLP4 60
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 56
INDIRP4
INDIRI4
ASGNI4
line 271
;268://unlagged - attack prediction #2
;269:			// we need the client number to determine whether or not to
;270:			// suppress this event
;271:			tent->s.clientNum = ent->s.clientNum;
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
line 273
;272://unlagged - attack prediction #2
;273:			if( LogAccuracyHit( traceEnt, ent ) ) {
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
EQI4 $132
line 274
;274:				ent->client->accuracy_hits++;
ADDRLP4 148
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2664
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
line 275
;275:			}
line 276
;276:		} else {
ADDRGP4 $132
JUMPV
LABELV $131
line 277
;277:			tent = G_TempEntity( tr.endpos, EV_BULLET_HIT_WALL );
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
line 278
;278:			tent->s.eventParm = DirToByte( tr.plane.normal );
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
line 282
;279://unlagged - attack prediction #2
;280:			// we need the client number to determine whether or not to
;281:			// suppress this event
;282:			tent->s.clientNum = ent->s.clientNum;
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
line 284
;283://unlagged - attack prediction #2
;284:		}
LABELV $132
line 285
;285:		tent->s.otherEntityNum = ent->s.number;
ADDRLP4 60
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 287
;286:
;287:		if ( traceEnt->takedamage) {
ADDRLP4 56
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $124
line 304
;288:#ifdef MISSIONPACK
;289:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
;290:				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
;291:					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
;292:					VectorCopy( impactpoint, muzzle );
;293:					// the player can hit him/herself with the bounced rail
;294:					passent = ENTITYNUM_NONE;
;295:				}
;296:				else {
;297:					VectorCopy( tr.endpos, muzzle );
;298:					passent = traceEnt->s.number;
;299:				}
;300:				continue;
;301:			}
;302:			else {
;303:#endif
;304:				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
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
line 309
;305:					damage, 0, MOD_MACHINEGUN);
;306:#ifdef MISSIONPACK
;307:			}
;308:#endif
;309:		}
line 310
;310:		break;
ADDRGP4 $124
JUMPV
LABELV $123
line 241
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 10
LTI4 $122
LABELV $124
line 312
;311:	}
;312:}
LABELV $103
endproc Bullet_Fire 152 32
export BFG_Fire
proc BFG_Fire 20 16
line 323
;313:
;314:
;315:/*
;316:======================================================================
;317:
;318:BFG
;319:
;320:======================================================================
;321:*/
;322:
;323:void BFG_Fire ( gentity_t *ent, qboolean alt ) {
line 327
;324:	gentity_t	*m;
;325:
;326:	// Alt Fire Shoots Upward Just A Bit MOre
;327:	if (alt == qtrue)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $142
line 328
;328:	{
line 329
;329:		forward[2] += 0.2f;
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
line 330
;330:	}
LABELV $142
line 332
;331:	
;332:	forward[2] += 0.2f;
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
line 336
;333:
;334:
;335:	
;336:	VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 337
;337:	m = fire_bfg (ent, muzzle, forward, alt);
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
line 338
;338:	m->damage *= s_quadFactor;
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
line 339
;339:	m->splashDamage *= s_quadFactor;
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
line 342
;340:
;341://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;342:}
LABELV $141
endproc BFG_Fire 20 16
export ShotgunPellet
proc ShotgunPellet 108 32
line 357
;343:
;344:
;345:/*
;346:======================================================================
;347:
;348:SHOTGUN
;349:
;350:======================================================================
;351:*/
;352:
;353:// DEFAULT_SHOTGUN_SPREAD and DEFAULT_SHOTGUN_COUNT	are in bg_public.h, because
;354:// client predicts same spreads
;355:#define	DEFAULT_SHOTGUN_DAMAGE	15
;356:
;357:qboolean ShotgunPellet( vec3_t start, vec3_t end, gentity_t *ent, qboolean alt ) {
line 366
;358:	trace_t		tr;
;359:	int			damage, i, passent;
;360:	gentity_t	*traceEnt;
;361:#ifdef MISSIONPACK
;362:	vec3_t		impactpoint, bouncedir;
;363:#endif
;364:	vec3_t		tr_start, tr_end;
;365:
;366:	passent = ent->s.number;
ADDRLP4 64
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 367
;367:	VectorCopy( start, tr_start );
ADDRLP4 68
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 368
;368:	VectorCopy( end, tr_end );
ADDRLP4 80
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 369
;369:	for (i = 0; i < 10; i++) {
ADDRLP4 60
CNSTI4 0
ASGNI4
LABELV $147
line 370
;370:		trap_Trace (&tr, tr_start, NULL, NULL, tr_end, passent, MASK_SHOT);
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
line 371
;371:		traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 56
CNSTI4 924
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 374
;372:
;373:		// send bullet impact
;374:		if (  tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $152
line 375
;375:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $146
JUMPV
LABELV $152
line 378
;376:		}
;377:
;378:		if ( traceEnt->takedamage) {
ADDRLP4 56
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $155
line 380
;379:		
;380:				damage = DEFAULT_SHOTGUN_DAMAGE * s_quadFactor;
ADDRLP4 92
CNSTF4 1097859072
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 406
;381:		
;382:		
;383:			
;384:#ifdef MISSIONPACK
;385:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
;386:				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
;387:					G_BounceProjectile( tr_start, impactpoint, bouncedir, tr_end );
;388:					VectorCopy( impactpoint, tr_start );
;389:					// the player can hit him/herself with the bounced rail
;390:					passent = ENTITYNUM_NONE;
;391:				}
;392:				else {
;393:					VectorCopy( tr.endpos, tr_start );
;394:					passent = traceEnt->s.number;
;395:				}
;396:				continue;
;397:			}
;398:			else {
;399:				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
;400:					damage, 0, MOD_SHOTGUN);
;401:				if( LogAccuracyHit( traceEnt, ent ) ) {
;402:					return qtrue;
;403:				}
;404:			}
;405:#else
;406:			G_Damage( traceEnt, ent, ent, forward, tr.endpos,	damage, 0, MOD_SHOTGUN);
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
line 407
;407:				if( LogAccuracyHit( traceEnt, ent ) ) {
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
EQI4 $158
line 408
;408:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $146
JUMPV
LABELV $158
line 411
;409:				}
;410:#endif
;411:		}
LABELV $155
line 412
;412:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $146
JUMPV
LABELV $148
line 369
ADDRLP4 60
ADDRLP4 60
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 10
LTI4 $147
line 414
;413:	}
;414:	return qfalse;
CNSTI4 0
RETI4
LABELV $146
endproc ShotgunPellet 108 32
export ShotgunPattern
proc ShotgunPattern 104 16
line 418
;415:}
;416:
;417:// this should match CG_ShotgunPattern
;418:void ShotgunPattern( vec3_t origin, vec3_t origin2, int seed, gentity_t *ent, qboolean alt ) {
line 424
;419:	int			i;
;420:	float		r, u;
;421:	vec3_t		end;
;422:	vec3_t		forward, right, up;
;423:	int			oldScore;
;424:	qboolean	hitClient = qfalse;
ADDRLP4 60
CNSTI4 0
ASGNI4
line 433
;425:
;426://unlagged - attack prediction #2
;427:	// use this for testing
;428:	//Com_Printf( "Server seed: %d\n", seed );
;429://unlagged - attack prediction #2
;430:
;431:	// derive the right and up vectors from the forward vector, because
;432:	// the client won't have any other information
;433:	VectorNormalize2( origin2, forward );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 VectorNormalize2
CALLF4
pop
line 434
;434:	PerpendicularVector( right, forward );
ADDRLP4 32
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 435
;435:	CrossProduct( forward, right, up );
ADDRLP4 20
ARGP4
ADDRLP4 32
ARGP4
ADDRLP4 44
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 437
;436:
;437:	oldScore = ent->client->ps.persistant[PERS_SCORE];
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
line 441
;438:
;439://unlagged - backward reconciliation #2
;440:	// backward-reconcile the other clients
;441:	G_DoTimeShiftFor( ent );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 447
;442://unlagged - backward reconciliation #2
;443:
;444:	
;445:
;446:	// generate the "random" spread pattern
;447:		for ( i = 0 ; i < DEFAULT_SHOTGUN_COUNT ; i++ ) {
ADDRLP4 56
CNSTI4 0
ASGNI4
LABELV $161
line 448
;448:			r = Q_crandom( &seed ) * DEFAULT_SHOTGUN_SPREAD * 16;
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
line 449
;449:			u = Q_crandom( &seed ) * DEFAULT_SHOTGUN_SPREAD * 16;
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
line 450
;450:			VectorMA( origin, 8192 * 16, forward, end);
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
line 451
;451:			VectorMA (end, r, right, end);
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
line 452
;452:			VectorMA (end, u, up, end);
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
line 453
;453:			if( ShotgunPellet( origin, end, ent, alt ) && !hitClient ) {
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
EQI4 $181
ADDRLP4 60
INDIRI4
ADDRLP4 96
INDIRI4
NEI4 $181
line 454
;454:				hitClient = qtrue;
ADDRLP4 60
CNSTI4 1
ASGNI4
line 455
;455:				ent->client->accuracy_hits++;
ADDRLP4 100
ADDRFP4 12
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2664
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
line 456
;456:			}
LABELV $181
line 457
;457:		}
LABELV $162
line 447
ADDRLP4 56
ADDRLP4 56
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 11
LTI4 $161
line 461
;458:
;459://unlagged - backward reconciliation #2
;460:	// put them back
;461:	G_UndoTimeShiftFor( ent );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 463
;462://unlagged - backward reconciliation #2
;463:}
LABELV $160
endproc ShotgunPattern 104 16
export weapon_supershotgun_fire
proc weapon_supershotgun_fire 32 20
line 466
;464:
;465:
;466:void weapon_supershotgun_fire (gentity_t *ent, qboolean alt) {
line 469
;467:	gentity_t		*tent;
;468:
;469:	if (alt == qtrue) { return; }
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $184
ADDRGP4 $183
JUMPV
LABELV $184
line 471
;470:	// send shotgun blast
;471:	tent = G_TempEntity( muzzle, EV_SHOTGUN );
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
line 472
;472:	VectorScale( forward, 4096, tent->s.origin2 );
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
line 473
;473:	SnapVector( tent->s.origin2 );
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
line 477
;474://unlagged - attack prediction #2
;475:	// this has to be something the client can predict now
;476:	//tent->s.eventParm = rand() & 255;		// seed for spread pattern
;477:	tent->s.eventParm = ent->client->attackTime % 256; // seed for spread pattern
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2756
ADDP4
INDIRI4
CNSTI4 256
MODI4
ASGNI4
line 479
;478://unlagged - attack prediction #2
;479:	tent->s.otherEntityNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 481
;480:
;481:	ShotgunPattern( tent->s.pos.trBase, tent->s.origin2, tent->s.eventParm, ent, alt );
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
line 482
;482:}
LABELV $183
endproc weapon_supershotgun_fire 32 20
export weapon_bomblauncher_fire
proc weapon_bomblauncher_fire 24 16
line 494
;483:
;484:
;485:/*
;486:======================================================================
;487:
;488:BOMB
;489:
;490:======================================================================
;491:*/
;492:
;493:// Shafe - Bomb
;494:void weapon_bomblauncher_fire (gentity_t	*ent, qboolean alt) {
line 496
;495:	gentity_t	*m;
;496:	gentity_t	*grenades = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 500
;497:	 
;498:
;499:
;500:if (ent->client->bombfired == qfalse) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2720
ADDP4
INDIRI4
CNSTI4 0
NEI4 $193
line 502
;501:		// extra vertical velocity
;502:		forward[2] += 0.2f;
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
line 503
;503:		VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 505
;504: 
;505:		m = fire_bomb (ent, muzzle, forward, qtrue);
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
line 506
;506:		m->damage *= s_quadFactor;
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
line 507
;507:		m->splashDamage *= s_quadFactor;
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
line 508
;508:		ent->client->bombfired = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2720
ADDP4
CNSTI4 1
ASGNI4
line 509
;509:		return;
ADDRGP4 $188
JUMPV
LABELV $192
line 513
;510:	}
;511:
;512: while ((grenades = G_Find (grenades, FOFS(classname), "bomb")) != NULL)
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
NEI4 $196
line 515
;515:	{
line 516
;516:		if (ent->client->bombfired == qtrue)
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2720
ADDP4
INDIRI4
CNSTI4 1
NEI4 $198
line 517
;517:		{
line 518
;518:			G_ExplodeBomb(grenades);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_ExplodeBomb
CALLV
pop
line 519
;519:			ent->client->bombfired = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2720
ADDP4
CNSTI4 0
ASGNI4
line 521
;520:			
;521:		}
LABELV $198
line 523
;522:
;523:	}
LABELV $196
line 524
;524: }
LABELV $193
line 512
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 532
ARGI4
ADDRGP4 $195
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
NEU4 $192
line 528
;525:
;526: 	
;527:
;528:} 
LABELV $188
endproc weapon_bomblauncher_fire 24 16
export weapon_pdlauncher_fire
proc weapon_pdlauncher_fire 28 12
line 540
;529:
;530:
;531:/*
;532:======================================================================
;533:
;534:PDG
;535:
;536:======================================================================
;537:*/
;538:
;539:// Shafe - PDG
;540:void weapon_pdlauncher_fire (gentity_t	*ent) {
line 542
;541:	gentity_t	*m;
;542:	gentity_t	*grenades = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $202
JUMPV
LABELV $201
line 545
;543:	 
;544: while ((grenades = G_Find (grenades, FOFS(classname), "pdgrenade")) != NULL)
;545: {
line 546
;546:	if(grenades->r.ownerNum == ent->s.clientNum)  //make sure its ours
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
NEI4 $205
line 547
;547:	{
line 548
;548:		ent->istelepoint = 0; // client cannot teleport
ADDRFP4 0
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 0
ASGNI4
line 549
;549:		VectorClear( ent->teleloc ); // clear the teleport location
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
line 550
;550:		grenades->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 551
;551:		grenades->nextthink = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 552
;552:	}
LABELV $205
line 553
;553: }
LABELV $202
line 544
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 532
ARGI4
ADDRGP4 $204
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
NEU4 $201
line 555
;554: // extra vertical velocity
;555: forward[2] += 0.2f;
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
line 556
;556: VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 558
;557: 
;558: m = fire_pdgrenade (ent, muzzle, forward);
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
line 559
;559: m->damage *= s_quadFactor;
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
line 560
;560: m->splashDamage *= s_quadFactor;
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
line 561
;561: ent->client->pdgfired = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2716
ADDP4
CNSTI4 1
ASGNI4
line 562
;562:} 
LABELV $200
endproc weapon_pdlauncher_fire 28 12
export weapon_grenadelauncher_fire
proc weapon_grenadelauncher_fire 20 12
line 573
;563:
;564:
;565:/*
;566:======================================================================
;567:
;568:GRENADE LAUNCHER
;569:
;570:======================================================================
;571:*/
;572:
;573:void weapon_grenadelauncher_fire (gentity_t *ent) {
line 577
;574:	gentity_t	*m;
;575:
;576:	// extra vertical velocity
;577:	forward[2] += 0.2f;
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
line 578
;578:	VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 580
;579:
;580:	m = fire_grenade (ent, muzzle, forward);
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
line 581
;581:	m->damage *= s_quadFactor;
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
line 582
;582:	m->splashDamage *= s_quadFactor;
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
line 585
;583:
;584://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;585:}
LABELV $209
endproc weapon_grenadelauncher_fire 20 12
export weapon_altgrenadelauncher_fire
proc weapon_altgrenadelauncher_fire 20 12
line 596
;586:
;587:/*
;588:======================================================================
;589:
;590:ALT GRENADE LAUNCHER 
;591:Shafe - Trep - Alternate Fire Grenade
;592:
;593:======================================================================
;594:*/
;595:
;596:void weapon_altgrenadelauncher_fire (gentity_t *ent) {
line 600
;597:	gentity_t	*m;
;598:
;599:	// extra vertical velocity
;600:	forward[2] += 0.2f;
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
line 601
;601:	VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 603
;602:
;603:	m = fire_altgrenade (ent, muzzle, forward);
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
line 604
;604:	m->damage *= s_quadFactor;
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
line 605
;605:	m->splashDamage *= s_quadFactor;
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
line 608
;606:
;607://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;608:}
LABELV $211
endproc weapon_altgrenadelauncher_fire 20 12
export Weapon_RocketLauncher_Fire
proc Weapon_RocketLauncher_Fire 16 12
line 618
;609:
;610:/*
;611:======================================================================
;612:
;613:ROCKET
;614:
;615:======================================================================
;616:*/
;617:
;618:void Weapon_RocketLauncher_Fire (gentity_t *ent) {
line 621
;619:	gentity_t	*m;
;620:
;621:	m = fire_rocket (ent, muzzle, forward);
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
line 622
;622:	m->damage *= s_quadFactor;
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
line 623
;623:	m->splashDamage *= s_quadFactor;
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
line 626
;624:
;625://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;626:}
LABELV $213
endproc Weapon_RocketLauncher_Fire 16 12
export Weapon_RocketLauncher_AltFire
proc Weapon_RocketLauncher_AltFire 16 12
line 629
;627:
;628:// Shafe - Trep Alt Rocket Launcher
;629:void Weapon_RocketLauncher_AltFire (gentity_t *ent) {
line 632
;630:	gentity_t	*m;
;631:
;632:	m = fire_alt_rocket (ent, muzzle, forward);
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
line 633
;633:	m->damage *= s_quadFactor;
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
line 634
;634:	m->splashDamage *= s_quadFactor;
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
line 637
;635:
;636://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;637:}
LABELV $214
endproc Weapon_RocketLauncher_AltFire 16 12
export Weapon_Plasmagun_Fire
proc Weapon_Plasmagun_Fire 16 12
line 648
;638:
;639:
;640:/*
;641:======================================================================
;642:
;643:PLASMA GUN
;644:
;645:======================================================================
;646:*/
;647:
;648:void Weapon_Plasmagun_Fire (gentity_t *ent, qboolean alt) {
line 655
;649:	gentity_t	*m;
;650:	int		i;
;651:	
;652:	// Shafe - Add Some Randomness so that 
;653:	// it doesnt fire straight every time
;654:
;655:	if(alt)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $216
line 656
;656:	{
line 657
;657:		i = irandom(0,3);
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
line 658
;658:		if (i == 1)
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $218
line 659
;659:		{
line 660
;660:			forward[2] += 0.2f;
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
line 661
;661:			VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 662
;662:		}
LABELV $218
line 663
;663:		if (i == 2)
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $221
line 664
;664:		{
line 665
;665:			forward[1] += 0.2f;
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
line 666
;666:			VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 667
;667:		}
LABELV $221
line 669
;668:
;669:		if (i == 3)
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $224
line 670
;670:		{
line 671
;671:			forward[0] += 0.2f;
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
line 672
;672:			VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 673
;673:		}
LABELV $224
line 676
;674:
;675:		
;676:	}
LABELV $216
line 678
;677:
;678:	if(alt)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $226
line 679
;679:	{
line 680
;680:		m = fire_plasma (ent, muzzle, forward);
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
line 681
;681:	} else {
ADDRGP4 $227
JUMPV
LABELV $226
line 682
;682:		m = fire_plasma2 (ent, muzzle, forward);
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
line 683
;683:	}
LABELV $227
line 684
;684:	m->damage *= s_quadFactor;
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
line 685
;685:	m->splashDamage *= s_quadFactor;
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
line 688
;686:
;687://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;688:}
LABELV $215
endproc Weapon_Plasmagun_Fire 16 12
export weapon_railgun_fire
proc weapon_railgun_fire 180 32
line 705
;689:
;690:/*
;691:======================================================================
;692:
;693:RAILGUN
;694:
;695:======================================================================
;696:*/
;697:
;698:
;699:/*
;700:=================
;701:weapon_railgun_fire
;702:=================
;703:*/
;704:#define	MAX_RAIL_HITS	4
;705:void weapon_railgun_fire (gentity_t *ent) {
line 714
;706:	vec3_t		end;
;707:#ifdef MISSIONPACK
;708:	vec3_t impactpoint, bouncedir;
;709:#endif
;710:	trace_t		trace;
;711:	gentity_t	*tent;
;712:	gentity_t	*traceEnt;
;713:	int			damage;
;714:	int			splashDmg = 16;
ADDRLP4 108
CNSTI4 16
ASGNI4
line 715
;715:	int			splashRadius = 64;
ADDRLP4 104
CNSTI4 64
ASGNI4
line 723
;716:	int			i;
;717:	int			hits;
;718:	int			unlinked;
;719:	int			passent;
;720:	gentity_t	*unlinkedEntities[MAX_RAIL_HITS];
;721:
;722:	// Shafe - Trep - Instagib
;723:	if (g_instagib.integer == 0)
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 0
NEI4 $229
line 724
;724:	{
line 725
;725:		damage = 100 * s_quadFactor;
ADDRLP4 112
CNSTF4 1120403456
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 726
;726:	} else {
ADDRGP4 $230
JUMPV
LABELV $229
line 727
;727:		damage = 1000 * s_quadFactor;
ADDRLP4 112
CNSTF4 1148846080
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 729
;728:
;729:	}
LABELV $230
line 734
;730:	/////////////////////////////////////
;731:
;732:	// Rifle Jumping - Shafe
;733:		// Instagib Jumping
;734:		if (g_GaussJump.integer == 1) 
ADDRGP4 g_GaussJump+12
INDIRI4
CNSTI4 1
NEI4 $232
line 735
;735:		{
line 737
;736:			
;737:			splashRadius = g_GaussKnockBack.integer * 50; 
ADDRLP4 104
CNSTI4 50
ADDRGP4 g_GaussKnockBack+12
INDIRI4
MULI4
ASGNI4
line 738
;738:			splashDmg = splashRadius; 
ADDRLP4 108
ADDRLP4 104
INDIRI4
ASGNI4
line 740
;739:
;740:		} else {
ADDRGP4 $233
JUMPV
LABELV $232
line 741
;741:			splashDmg = 0; 
ADDRLP4 108
CNSTI4 0
ASGNI4
line 742
;742:			splashRadius = 0; 
ADDRLP4 104
CNSTI4 0
ASGNI4
line 743
;743:		}
LABELV $233
line 748
;744:
;745:		
;746:		
;747:
;748:	VectorMA (muzzle, 8192, forward, end);
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
line 752
;749:
;750://unlagged - backward reconciliation #2
;751:	// backward-reconcile the other clients
;752:	G_DoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 756
;753://unlagged - backward reconciliation #2
;754:
;755:	// trace only against the solids, so the railgun will go through people
;756:	unlinked = 0;
ADDRLP4 60
CNSTI4 0
ASGNI4
line 757
;757:	hits = 0;
ADDRLP4 116
CNSTI4 0
ASGNI4
line 758
;758:	passent = ent->s.number;
ADDRLP4 100
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
LABELV $242
line 759
;759:	do {
line 760
;760:		trap_Trace (&trace, muzzle, NULL, NULL, end, passent, MASK_SHOT );
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
line 761
;761:		if ( trace.entityNum >= ENTITYNUM_MAX_NORMAL ) {
ADDRLP4 0+52
INDIRI4
CNSTI4 1022
LTI4 $245
line 762
;762:			break;
ADDRGP4 $244
JUMPV
LABELV $245
line 764
;763:		}
;764:		traceEnt = &g_entities[ trace.entityNum ];
ADDRLP4 56
CNSTI4 924
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 765
;765:		if ( traceEnt->takedamage ) {
ADDRLP4 56
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $249
line 795
;766:#ifdef MISSIONPACK
;767:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
;768:				if ( G_InvulnerabilityEffect( traceEnt, forward, trace.endpos, impactpoint, bouncedir ) ) {
;769:					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
;770:					// snap the endpos to integers to save net bandwidth, but nudged towards the line
;771:					SnapVectorTowards( trace.endpos, muzzle );
;772:					// send railgun beam effect
;773:					tent = G_TempEntity( trace.endpos, EV_RAILTRAIL );
;774:					// set player number for custom colors on the railtrail
;775:					tent->s.clientNum = ent->s.clientNum;
;776:					VectorCopy( muzzle, tent->s.origin2 );
;777:					// move origin a bit to come closer to the drawn gun muzzle
;778:					VectorMA( tent->s.origin2, 4, right, tent->s.origin2 );
;779:					VectorMA( tent->s.origin2, -1, up, tent->s.origin2 );
;780:					tent->s.eventParm = 255;	// don't make the explosion at the end
;781:					//
;782:					VectorCopy( impactpoint, muzzle );
;783:					// the player can hit him/herself with the bounced rail
;784:					passent = ENTITYNUM_NONE;
;785:				}
;786:			}
;787:			else {
;788:				if( LogAccuracyHit( traceEnt, ent ) ) {
;789:					hits++;
;790:				}
;791:				G_Damage (traceEnt, ent, ent, forward, trace.endpos, damage, 0, MOD_RAILGUN);
;792:			}
;793:#else
;794:
;795:			if( G_RadiusDamage( trace.endpos, ent, splashDmg, splashRadius, NULL, MOD_RAILGUN ) ) // Shafe - Trying to get the rifle jumping to work.
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
CNSTI4 4
ARGI4
ADDRLP4 128
ADDRGP4 G_RadiusDamage
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 0
EQI4 $251
line 796
;796:			{
line 799
;797:				// Does a burst radius hit really count as a "hit"?  Not for Guass rifles...
;798:				//g_entities[ent->s.number].client->ps.persistant[PERS_ACCURACY_HITS]++;
;799:			}
LABELV $251
line 802
;800:
;801:			
;802:				if( LogAccuracyHit( traceEnt, ent ) ) {
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
EQI4 $254
line 803
;803:					hits++;
ADDRLP4 116
ADDRLP4 116
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 804
;804:				}
LABELV $254
line 805
;805:				G_Damage (traceEnt, ent, ent, forward, trace.endpos, damage, 0, MOD_RAILGUN);
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
CNSTI4 4
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 807
;806:#endif
;807:		}
LABELV $249
line 808
;808:		if ( trace.contents & CONTENTS_SOLID ) {
ADDRLP4 0+48
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $257
line 809
;809:			break;		// we hit something solid enough to stop the beam
ADDRGP4 $244
JUMPV
LABELV $257
line 812
;810:		}
;811:		// unlink this entity, so the next trace will go past it
;812:		trap_UnlinkEntity( traceEnt );
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 813
;813:		unlinkedEntities[unlinked] = traceEnt;
ADDRLP4 60
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
ADDRLP4 56
INDIRP4
ASGNP4
line 814
;814:		unlinked++;
ADDRLP4 60
ADDRLP4 60
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 815
;815:	} while ( unlinked < MAX_RAIL_HITS );
LABELV $243
ADDRLP4 60
INDIRI4
CNSTI4 4
LTI4 $242
LABELV $244
line 819
;816:
;817://unlagged - backward reconciliation #2
;818:	// put them back
;819:	G_UndoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 823
;820://unlagged - backward reconciliation #2
;821:
;822:	// link back in any entities we unlinked
;823:	for ( i = 0 ; i < unlinked ; i++ ) {
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 $263
JUMPV
LABELV $260
line 824
;824:		trap_LinkEntity( unlinkedEntities[i] );
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
line 825
;825:	}
LABELV $261
line 823
ADDRLP4 64
ADDRLP4 64
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $263
ADDRLP4 64
INDIRI4
ADDRLP4 60
INDIRI4
LTI4 $260
line 830
;826:
;827:	// the final trace endpos will be the terminal point of the rail trail
;828:
;829:	// snap the endpos to integers to save net bandwidth, but nudged towards the line
;830:	SnapVectorTowards( trace.endpos, muzzle );
ADDRLP4 0+12
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 833
;831:
;832:	// send railgun beam effect
;833:	tent = G_TempEntity( trace.endpos, EV_RAILTRAIL );
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
line 836
;834:
;835:	// set player number for custom colors on the railtrail
;836:	tent->s.clientNum = ent->s.clientNum;
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
line 838
;837:
;838:	VectorCopy( muzzle, tent->s.origin2 );
ADDRLP4 84
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 840
;839:	// move origin a bit to come closer to the drawn gun muzzle
;840:	VectorMA( tent->s.origin2, 4, right, tent->s.origin2 );
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
line 841
;841:	VectorMA( tent->s.origin2, -1, up, tent->s.origin2 );
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
line 844
;842:
;843:	// no explosion at end if SURF_NOIMPACT, but still make the trail
;844:	if ( trace.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $270
line 845
;845:		tent->s.eventParm = 255;	// don't make the explosion at the end
ADDRLP4 84
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 255
ASGNI4
line 846
;846:	} else {
ADDRGP4 $271
JUMPV
LABELV $270
line 847
;847:		tent->s.eventParm = DirToByte( trace.plane.normal );
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
line 848
;848:	}
LABELV $271
line 849
;849:	tent->s.clientNum = ent->s.clientNum;
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
line 852
;850:
;851:	// give the shooter a reward sound if they have made two railgun hits in a row
;852:	if ( hits == 0 ) {
ADDRLP4 116
INDIRI4
CNSTI4 0
NEI4 $274
line 854
;853:		// complete miss
;854:		ent->client->accurateCount = 0;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2656
ADDP4
CNSTI4 0
ASGNI4
line 855
;855:	} else {
ADDRGP4 $275
JUMPV
LABELV $274
line 857
;856:		// check for "impressive" reward sound
;857:		ent->client->accurateCount += hits;
ADDRLP4 160
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2656
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
line 858
;858:		if ( ent->client->accurateCount >= 2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2656
ADDP4
INDIRI4
CNSTI4 2
LTI4 $276
line 859
;859:			ent->client->accurateCount -= 2;
ADDRLP4 164
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2656
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
line 860
;860:			ent->client->ps.persistant[PERS_IMPRESSIVE_COUNT]++;
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
line 862
;861:			// add the sprite over the player's head
;862:			ent->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
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
line 863
;863:			ent->client->ps.eFlags |= EF_AWARD_IMPRESSIVE;
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
line 864
;864:			ent->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2692
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 865
;865:		}
LABELV $276
line 866
;866:		ent->client->accuracy_hits++;
ADDRLP4 164
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2664
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
line 867
;867:	}
LABELV $275
line 869
;868:
;869:	trap_SendServerCommand(ent->client->ps.clientNum, "+greset");
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 $279
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 871
;870:
;871:}
LABELV $228
endproc weapon_railgun_fire 180 32
export Weapon_GrapplingHook_Fire
proc Weapon_GrapplingHook_Fire 4 20
line 885
;872:
;873:
;874:
;875:
;876:/*
;877:======================================================================
;878:
;879:GRAPPLING HOOK
;880:
;881:======================================================================
;882:*/
;883:
;884:void Weapon_GrapplingHook_Fire (gentity_t *ent)
;885:{
line 887
;886:	// Shafe - Trep  - Offhand Grappling Hook
;887:	AngleVectors (ent->client->ps.viewangles, forward, right, up);
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
line 888
;888:	CalcMuzzlePoint ( ent, forward, right, up, muzzle );
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
line 891
;889:	// End Shafe
;890:	
;891:	if (!ent->client->fireHeld && !ent->client->hook)
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
CNSTI4 0
NEI4 $281
ADDRLP4 0
INDIRP4
CNSTI4 2708
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $281
line 892
;892:		fire_grapple (ent, muzzle, forward);
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
LABELV $281
line 894
;893:
;894:	ent->client->fireHeld = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2704
ADDP4
CNSTI4 1
ASGNI4
line 895
;895:}
LABELV $280
endproc Weapon_GrapplingHook_Fire 4 20
export Weapon_HookFree
proc Weapon_HookFree 4 4
line 899
;896:
;897:
;898:void Weapon_HookFree (gentity_t *ent)
;899:{
line 900
;900:	ent->parent->client->hook = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2708
ADDP4
CNSTP4 0
ASGNP4
line 901
;901:	ent->parent->client->ps.pm_flags &= ~PMF_GRAPPLE_PULL;
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
line 902
;902:	G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 903
;903:}
LABELV $283
endproc Weapon_HookFree 4 4
export Weapon_HookThink
proc Weapon_HookThink 36 8
line 906
;904:
;905:void Weapon_HookThink (gentity_t *ent)
;906:{
line 907
;907:	if (ent->enemy) {
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $285
line 910
;908:		vec3_t v, oldorigin;
;909:
;910:		VectorCopy(ent->r.currentOrigin, oldorigin);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRB
ASGNB 12
line 911
;911:		v[0] = ent->enemy->r.currentOrigin[0] + (ent->enemy->r.mins[0] + ent->enemy->r.maxs[0]) * 0.5;
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
line 912
;912:		v[1] = ent->enemy->r.currentOrigin[1] + (ent->enemy->r.mins[1] + ent->enemy->r.maxs[1]) * 0.5;
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
line 913
;913:		v[2] = ent->enemy->r.currentOrigin[2] + (ent->enemy->r.mins[2] + ent->enemy->r.maxs[2]) * 0.5;
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
line 914
;914:		SnapVectorTowards( v, oldorigin );	// save net bandwidth
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 916
;915:
;916:		G_SetOrigin( ent, v );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 917
;917:	}
LABELV $285
line 919
;918:
;919:	VectorCopy( ent->r.currentOrigin, ent->parent->client->ps.grapplePoint);
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
line 920
;920:}
LABELV $284
endproc Weapon_HookThink 36 8
lit
align 4
LABELV $290
byte 4 0
byte 4 0
byte 4 0
export Weapon_fire_turret
code
proc Weapon_fire_turret 76 20
line 928
;921:
;922:
;923:/*
;924:=======================================================================
;925:TURRET - Not Used but this would be good for a vehichle
;926:=======================================================================
;927:*/
;928:void Weapon_fire_turret (gentity_t *ent, qboolean alt ) {
line 930
;929:	gentity_t *m;
;930:	float newforward[] = {0,0,0};
ADDRLP4 0
ADDRGP4 $290
INDIRB
ASGNB 12
line 935
;931:
;932:
;933:	// All of this is useless.. for the turrets, but lets tweak it for use as a shotgun variant
;934:
;935:	m = fire_turret(ent, muzzle, forward, alt);
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
line 936
;936:	m->damage *= s_quadFactor;
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
line 937
;937:	m->splashDamage *= s_quadFactor;
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
line 939
;938:
;939:	if (alt == qtrue) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $291
line 943
;940:		
;941:		
;942:		//Second bullet goes to the right
;943:		AngleVectors( ent->client->ps.viewangles, forward, right, up );
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
line 944
;944:		VectorCopy( forward, newforward );
ADDRLP4 0
ADDRGP4 forward
INDIRB
ASGNB 12
line 945
;945:		if ( forward[0] >= 0.5 && forward[0] <= 1 ) 
ADDRLP4 28
ADDRGP4 forward
INDIRF4
ASGNF4
ADDRLP4 28
INDIRF4
CNSTF4 1056964608
LTF4 $293
ADDRLP4 28
INDIRF4
CNSTF4 1065353216
GTF4 $293
line 946
;946:		{
line 947
;947:			newforward[1] += .35f;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1051931443
ADDF4
ASGNF4
line 948
;948:		} 
ADDRGP4 $294
JUMPV
LABELV $293
line 949
;949:		else if ( forward[0] <= -0.5 && forward[0] >= -1 ) 
ADDRLP4 32
ADDRGP4 forward
INDIRF4
ASGNF4
ADDRLP4 32
INDIRF4
CNSTF4 3204448256
GTF4 $296
ADDRLP4 32
INDIRF4
CNSTF4 3212836864
LTF4 $296
line 950
;950:		{
line 951
;951:			newforward[1] += .35f;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1051931443
ADDF4
ASGNF4
line 952
;952:		} else {
ADDRGP4 $297
JUMPV
LABELV $296
line 953
;953:			newforward[0] += .35f;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1051931443
ADDF4
ASGNF4
line 954
;954:		}
LABELV $297
LABELV $294
line 956
;955:	
;956:		VectorNormalize( newforward );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 957
;957:		VectorAdd( newforward, forward, forward );
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
line 958
;958:		CalcMuzzlePoint( ent, forward, right, up, muzzle );
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
line 961
;959:	
;960:
;961:		m = fire_turret(ent, muzzle, forward, alt);
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
line 962
;962:		m->damage *= s_quadFactor;
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
line 963
;963:		m->splashDamage *= s_quadFactor;
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
line 968
;964:
;965:
;966:
;967:		//Third bullet goes to the left
;968:		AngleVectors (ent->client->ps.viewangles, forward, right, up);
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
line 969
;969:		VectorCopy( forward, newforward );
ADDRLP4 0
ADDRGP4 forward
INDIRB
ASGNB 12
line 970
;970:		if ( forward[0] >= 0.5 && forward[0] <= 1 ) {
ADDRLP4 52
ADDRGP4 forward
INDIRF4
ASGNF4
ADDRLP4 52
INDIRF4
CNSTF4 1056964608
LTF4 $305
ADDRLP4 52
INDIRF4
CNSTF4 1065353216
GTF4 $305
line 971
;971:		newforward[1] -= .35f;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1051931443
SUBF4
ASGNF4
line 972
;972:		} else if ( forward[0] <= -0.5 && forward[0] >= -1 ) {
ADDRGP4 $306
JUMPV
LABELV $305
ADDRLP4 56
ADDRGP4 forward
INDIRF4
ASGNF4
ADDRLP4 56
INDIRF4
CNSTF4 3204448256
GTF4 $308
ADDRLP4 56
INDIRF4
CNSTF4 3212836864
LTF4 $308
line 973
;973:		newforward[1] -= .35f;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1051931443
SUBF4
ASGNF4
line 974
;974:		} else {
ADDRGP4 $309
JUMPV
LABELV $308
line 975
;975:		newforward[0] -= .35f;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1051931443
SUBF4
ASGNF4
line 976
;976:		}
LABELV $309
LABELV $306
line 977
;977:		VectorNormalize( newforward );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 978
;978:		VectorAdd( newforward, forward, forward );
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
line 979
;979:		CalcMuzzlePoint ( ent, forward, right, up, muzzle );
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
line 981
;980:
;981:		m = fire_turret(ent, muzzle, forward, alt);
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
line 982
;982:		m->damage *= s_quadFactor;
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
line 983
;983:		m->splashDamage *= s_quadFactor;
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
line 984
;984:	}
LABELV $291
line 986
;985:
;986:}
LABELV $289
endproc Weapon_fire_turret 76 20
export WP_FireUltraBeam
proc WP_FireUltraBeam 116 32
line 994
;987:
;988:
;989:
;990:
;991://---------------------------------------------------------
;992:void WP_FireUltraBeam( gentity_t *ent )
;993://---------------------------------------------------------
;994:{
line 999
;995:	trace_t		tr;
;996:	vec3_t		end;
;997:	gentity_t	*traceEnt;
;998:	vec3_t		start;
;999:	qboolean	bHit = qfalse;
ADDRLP4 84
CNSTI4 0
ASGNI4
line 1002
;1000:
;1001:	// Trace once to the right...
;1002:	VectorMA( muzzle, 9, right, start);
ADDRLP4 88
CNSTF4 1091567616
ASGNF4
ADDRLP4 0
ADDRGP4 muzzle
INDIRF4
ADDRLP4 88
INDIRF4
ADDRGP4 right
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRGP4 muzzle+4
INDIRF4
ADDRLP4 88
INDIRF4
ADDRGP4 right+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 muzzle+8
INDIRF4
CNSTF4 1091567616
ADDRGP4 right+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1003
;1003:	VectorMA( start, 2048, forward, end );
ADDRLP4 92
CNSTF4 1157627904
ASGNF4
ADDRLP4 12
ADDRLP4 0
INDIRF4
ADDRLP4 92
INDIRF4
ADDRGP4 forward
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 92
INDIRF4
ADDRGP4 forward+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1157627904
ADDRGP4 forward+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1006
;1004:
;1005:	// Find out who we've hit
;1006:	trap_Trace( &tr, muzzle, NULL, NULL, end, ent->s.number, MASK_SHOT );
ADDRLP4 24
ARGP4
ADDRGP4 muzzle
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
ADDRLP4 12
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
line 1007
;1007:	traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 80
CNSTI4 924
ADDRLP4 24+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1009
;1008:
;1009:	if ( traceEnt->takedamage)
ADDRLP4 80
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $331
line 1010
;1010:	{
line 1011
;1011:		G_Damage( traceEnt, ent, ent, forward, tr.endpos, 8*s_quadFactor,0, MOD_LIGHTNING);
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 100
ADDRFP4 0
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
ADDRLP4 24+12
ARGP4
CNSTF4 1090519040
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 9
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1012
;1012:		bHit = qtrue;
ADDRLP4 84
CNSTI4 1
ASGNI4
line 1013
;1013:	}
LABELV $331
line 1016
;1014:
;1015:	// Now trace once to the left...
;1016:	VectorMA( muzzle, -9, right, start);
ADDRLP4 100
CNSTF4 3239051264
ASGNF4
ADDRLP4 0
ADDRGP4 muzzle
INDIRF4
ADDRLP4 100
INDIRF4
ADDRGP4 right
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRGP4 muzzle+4
INDIRF4
ADDRLP4 100
INDIRF4
ADDRGP4 right+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 muzzle+8
INDIRF4
CNSTF4 3239051264
ADDRGP4 right+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1017
;1017:	VectorMA( start, 2048, forward, end );
ADDRLP4 104
CNSTF4 1157627904
ASGNF4
ADDRLP4 12
ADDRLP4 0
INDIRF4
ADDRLP4 104
INDIRF4
ADDRGP4 forward
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 104
INDIRF4
ADDRGP4 forward+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1157627904
ADDRGP4 forward+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1020
;1018:
;1019:	// Find out who we've hit
;1020:	trap_Trace( &tr, muzzle, NULL, NULL, end, ent->s.number, MASK_SHOT );
ADDRLP4 24
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRLP4 108
CNSTP4 0
ASGNP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 12
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
line 1021
;1021:	traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 80
CNSTI4 924
ADDRLP4 24+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1023
;1022:
;1023:	if ( traceEnt->takedamage)
ADDRLP4 80
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $347
line 1024
;1024:	{
line 1025
;1025:		G_Damage( traceEnt, ent, ent, forward, tr.endpos, (8*s_quadFactor), 0, MOD_LIGHTNING);
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
ARGP4
ADDRLP4 112
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 24+12
ARGP4
CNSTF4 1090519040
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 9
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1026
;1026:		bHit = qtrue;
ADDRLP4 84
CNSTI4 1
ASGNI4
line 1027
;1027:	}
LABELV $347
line 1028
;1028:	if (bHit)
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $350
line 1029
;1029:	{
line 1031
;1030:		// log hit
;1031:		if (ent->client)
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $352
line 1032
;1032:		{
line 1034
;1033:			//ent->client->ps.persistant[PERS_ACCURACY_HITS]++;
;1034:		}
LABELV $352
line 1035
;1035:	}
LABELV $350
line 1036
;1036:}
LABELV $317
endproc WP_FireUltraBeam 116 32
export Weapon_AltGataFire
proc Weapon_AltGataFire 120 32
line 1047
;1037:
;1038:
;1039:/*
;1040:======================================================================
;1041:
;1042:ALT GATA
;1043:
;1044:======================================================================
;1045:*/
;1046:
;1047:void Weapon_AltGataFire( gentity_t *ent ) {
line 1059
;1048:	trace_t		tr;
;1049:	vec3_t		end;
;1050:#ifdef MISSIONPACK
;1051:	vec3_t impactpoint, bouncedir;
;1052:#endif
;1053:	gentity_t	*traceEnt, *tent;
;1054:	int			damage, i, passent;
;1055:
;1056://unlagged - server options
;1057:	// this is configurable now
;1058://	damage = 8 * s_quadFactor;
;1059:	damage = g_lightningDamage.integer * s_quadFactor;  // huh?
ADDRLP4 84
ADDRGP4 g_lightningDamage+12
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1062
;1060://unlagged - server options
;1061:
;1062:	passent = ent->s.number;
ADDRLP4 80
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1063
;1063:	for (i = 0; i < 10; i++) {
ADDRLP4 76
CNSTI4 0
ASGNI4
LABELV $356
line 1064
;1064:		VectorMA( muzzle, LIGHTNING_RANGE, forward, end );
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
line 1068
;1065:
;1066://unlagged - backward reconciliation #2
;1067:	// backward-reconcile the other clients
;1068:	G_DoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 1071
;1069://unlagged - backward reconciliation #2
;1070:
;1071:		trap_Trace (&tr, muzzle, NULL, NULL, end, passent, MASK_SHOT);
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
line 1075
;1072:
;1073://unlagged - backward reconciliation #2
;1074:	// put them back
;1075:	G_UndoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 1079
;1076://unlagged - backward reconciliation #2
;1077:
;1078:
;1079:		if ( tr.entityNum == ENTITYNUM_NONE ) {
ADDRLP4 0+52
INDIRI4
CNSTI4 1023
NEI4 $366
line 1080
;1080:			return;
ADDRGP4 $354
JUMPV
LABELV $366
line 1083
;1081:		}
;1082:
;1083:		traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 56
CNSTI4 924
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1085
;1084:
;1085:		if ( traceEnt->takedamage) {
ADDRLP4 56
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $370
line 1087
;1086:
;1087:				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
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
CNSTI4 7
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1090
;1088:					damage, 0, MOD_PLASMA);
;1089:
;1090:		}
LABELV $370
line 1092
;1091:
;1092:		if ( traceEnt->takedamage && traceEnt->client ) {
ADDRLP4 56
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $373
ADDRLP4 56
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $373
line 1093
;1093:			tent = G_TempEntity( tr.endpos, EV_MISSILE_HIT );
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
line 1094
;1094:			tent->s.otherEntityNum = traceEnt->s.number;
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 56
INDIRP4
INDIRI4
ASGNI4
line 1095
;1095:			tent->s.eventParm = DirToByte( tr.plane.normal );
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
line 1096
;1096:			tent->s.weapon = ent->s.weapon;
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
line 1097
;1097:			if( LogAccuracyHit( traceEnt, ent ) ) {
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
EQI4 $358
line 1098
;1098:				ent->client->accuracy_hits++;
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2664
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
line 1099
;1099:			}
line 1100
;1100:		} else if ( !( tr.surfaceFlags & SURF_NOIMPACT ) ) {
ADDRGP4 $358
JUMPV
LABELV $373
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $358
line 1101
;1101:			tent = G_TempEntity( tr.endpos, EV_MISSILE_MISS );
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
line 1102
;1102:			tent->s.eventParm = DirToByte( tr.plane.normal );
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
line 1103
;1103:		}
line 1105
;1104:
;1105:		break;
ADDRGP4 $358
JUMPV
LABELV $357
line 1063
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 10
LTI4 $356
LABELV $358
line 1107
;1106:	}
;1107:}
LABELV $354
endproc Weapon_AltGataFire 120 32
export Weapon_LightningFire
proc Weapon_LightningFire 120 32
line 1117
;1108:
;1109:/*
;1110:======================================================================
;1111:
;1112:LIGHTNING GUN
;1113:
;1114:======================================================================
;1115:*/
;1116:
;1117:void Weapon_LightningFire( gentity_t *ent ) {
line 1129
;1118:	trace_t		tr;
;1119:	vec3_t		end;
;1120:#ifdef MISSIONPACK
;1121:	vec3_t impactpoint, bouncedir;
;1122:#endif
;1123:	gentity_t	*traceEnt, *tent;
;1124:	int			damage, i, passent;
;1125:
;1126://unlagged - server options
;1127:	// this is configurable now
;1128://	damage = 8 * s_quadFactor;
;1129:	damage = g_lightningDamage.integer * s_quadFactor;
ADDRLP4 84
ADDRGP4 g_lightningDamage+12
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1132
;1130://unlagged - server options
;1131:
;1132:	passent = ent->s.number;
ADDRLP4 80
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1133
;1133:	for (i = 0; i < 10; i++) {
ADDRLP4 76
CNSTI4 0
ASGNI4
LABELV $386
line 1134
;1134:		VectorMA( muzzle, LIGHTNING_RANGE, forward, end );
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
line 1138
;1135:
;1136://unlagged - backward reconciliation #2
;1137:	// backward-reconcile the other clients
;1138:	G_DoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 1141
;1139://unlagged - backward reconciliation #2
;1140:
;1141:		trap_Trace (&tr, muzzle, NULL, NULL, end, passent, MASK_SHOT);
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
line 1145
;1142:
;1143://unlagged - backward reconciliation #2
;1144:	// put them back
;1145:	G_UndoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 1160
;1146://unlagged - backward reconciliation #2
;1147:
;1148:#ifdef MISSIONPACK
;1149:		// if not the first trace (the lightning bounced of an invulnerability sphere)
;1150:		if (i) {
;1151:			// add bounced off lightning bolt temp entity
;1152:			// the first lightning bolt is a cgame only visual
;1153:			//
;1154:			tent = G_TempEntity( muzzle, EV_LIGHTNINGBOLT );
;1155:			VectorCopy( tr.endpos, end );
;1156:			SnapVector( end );
;1157:			VectorCopy( end, tent->s.origin2 );
;1158:		}
;1159:#endif
;1160:		if ( tr.entityNum == ENTITYNUM_NONE ) {
ADDRLP4 0+52
INDIRI4
CNSTI4 1023
NEI4 $396
line 1161
;1161:			return;
ADDRGP4 $384
JUMPV
LABELV $396
line 1164
;1162:		}
;1163:
;1164:		traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 56
CNSTI4 924
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1166
;1165:
;1166:		if ( traceEnt->takedamage) {
ADDRLP4 56
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $400
line 1188
;1167:#ifdef MISSIONPACK
;1168:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
;1169:				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
;1170:					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
;1171:					VectorCopy( impactpoint, muzzle );
;1172:					VectorSubtract( end, impactpoint, forward );
;1173:					VectorNormalize(forward);
;1174:					// the player can hit him/herself with the bounced lightning
;1175:					passent = ENTITYNUM_NONE;
;1176:				}
;1177:				else {
;1178:					VectorCopy( tr.endpos, muzzle );
;1179:					passent = traceEnt->s.number;
;1180:				}
;1181:				continue;
;1182:			}
;1183:			else {
;1184:				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
;1185:					damage, 0, MOD_LIGHTNING);
;1186:			}
;1187:#else
;1188:				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
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
CNSTI4 9
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1191
;1189:					damage, 0, MOD_LIGHTNING);
;1190:#endif
;1191:		}
LABELV $400
line 1193
;1192:
;1193:		if ( traceEnt->takedamage && traceEnt->client ) {
ADDRLP4 56
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $403
ADDRLP4 56
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $403
line 1194
;1194:			tent = G_TempEntity( tr.endpos, EV_MISSILE_HIT );
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
line 1195
;1195:			tent->s.otherEntityNum = traceEnt->s.number;
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 56
INDIRP4
INDIRI4
ASGNI4
line 1196
;1196:			tent->s.eventParm = DirToByte( tr.plane.normal );
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
line 1197
;1197:			tent->s.weapon = ent->s.weapon;
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
line 1198
;1198:			if( LogAccuracyHit( traceEnt, ent ) ) {
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
EQI4 $388
line 1199
;1199:				ent->client->accuracy_hits++;
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2664
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
line 1200
;1200:			}
line 1201
;1201:		} else if ( !( tr.surfaceFlags & SURF_NOIMPACT ) ) {
ADDRGP4 $388
JUMPV
LABELV $403
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $388
line 1202
;1202:			tent = G_TempEntity( tr.endpos, EV_MISSILE_MISS );
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
line 1203
;1203:			tent->s.eventParm = DirToByte( tr.plane.normal );
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
line 1204
;1204:		}
line 1206
;1205:
;1206:		break;
ADDRGP4 $388
JUMPV
LABELV $387
line 1133
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 10
LTI4 $386
LABELV $388
line 1208
;1207:	}
;1208:}
LABELV $384
endproc Weapon_LightningFire 120 32
export LogAccuracyHit
proc LogAccuracyHit 4 8
line 1269
;1209:
;1210:
;1211:
;1212:
;1213:
;1214:#ifdef MISSIONPACK
;1215:/*
;1216:======================================================================
;1217:
;1218:NAILGUN
;1219:
;1220:======================================================================
;1221:*/
;1222:
;1223:void Weapon_Nailgun_Fire (gentity_t *ent) {
;1224:	gentity_t	*m;
;1225:	int			count;
;1226:
;1227:	for( count = 0; count < NUM_NAILSHOTS; count++ ) {
;1228:		m = fire_nail (ent, muzzle, forward, right, up );
;1229:		m->damage *= s_quadFactor;
;1230:		m->splashDamage *= s_quadFactor;
;1231:	}
;1232:
;1233://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;1234:}
;1235:
;1236:
;1237:/*
;1238:======================================================================
;1239:
;1240:PROXIMITY MINE LAUNCHER
;1241:
;1242:======================================================================
;1243:*/
;1244:
;1245:void weapon_proxlauncher_fire (gentity_t *ent) {
;1246:	gentity_t	*m;
;1247:
;1248:	// extra vertical velocity
;1249:	forward[2] += 0.2f;
;1250:	VectorNormalize( forward );
;1251:
;1252:	m = fire_prox (ent, muzzle, forward);
;1253:	m->damage *= s_quadFactor;
;1254:	m->splashDamage *= s_quadFactor;
;1255:
;1256://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;1257:}
;1258:
;1259:#endif
;1260:
;1261://======================================================================
;1262:
;1263:
;1264:/*
;1265:===============
;1266:LogAccuracyHit
;1267:===============
;1268:*/
;1269:qboolean LogAccuracyHit( gentity_t *target, gentity_t *attacker ) {
line 1270
;1270:	if( !target->takedamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
NEI4 $415
line 1271
;1271:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $414
JUMPV
LABELV $415
line 1274
;1272:	}
;1273:
;1274:	if ( target == attacker ) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
NEU4 $417
line 1275
;1275:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $414
JUMPV
LABELV $417
line 1278
;1276:	}
;1277:
;1278:	if( !target->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $419
line 1279
;1279:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $414
JUMPV
LABELV $419
line 1282
;1280:	}
;1281:
;1282:	if( !attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $421
line 1283
;1283:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $414
JUMPV
LABELV $421
line 1286
;1284:	}
;1285:
;1286:	if( target->client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $423
line 1287
;1287:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $414
JUMPV
LABELV $423
line 1290
;1288:	}
;1289:
;1290:	if ( OnSameTeam( target, attacker ) ) {
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
EQI4 $425
line 1291
;1291:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $414
JUMPV
LABELV $425
line 1294
;1292:	}
;1293:
;1294:	return qtrue;
CNSTI4 1
RETI4
LABELV $414
endproc LogAccuracyHit 4 8
export CalcMuzzlePoint
proc CalcMuzzlePoint 48 4
line 1305
;1295:}
;1296:
;1297:
;1298:/*
;1299:===============
;1300:CalcMuzzlePoint
;1301:
;1302:set muzzle location relative to pivoting eye
;1303:===============
;1304:*/
;1305:void CalcMuzzlePoint ( gentity_t *ent, vec3_t forward, vec3_t right, vec3_t up, vec3_t muzzlePoint ) {
line 1306
;1306:	VectorCopy( ent->s.pos.trBase, muzzlePoint );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1307
;1307:	muzzlePoint[2] += ent->client->ps.viewheight;
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
line 1308
;1308:	VectorMA( muzzlePoint, 14, forward, muzzlePoint );
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
line 1310
;1309:	// snap to integer coordinates for more efficient network bandwidth usage
;1310:	SnapVector( muzzlePoint );
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
line 1311
;1311:}
LABELV $427
endproc CalcMuzzlePoint 48 4
export CalcMuzzlePointOrigin
proc CalcMuzzlePointOrigin 48 4
line 1320
;1312:
;1313:/*
;1314:===============
;1315:CalcMuzzlePointOrigin
;1316:
;1317:set muzzle location relative to pivoting eye
;1318:===============
;1319:*/
;1320:void CalcMuzzlePointOrigin ( gentity_t *ent, vec3_t origin, vec3_t forward, vec3_t right, vec3_t up, vec3_t muzzlePoint ) {
line 1321
;1321:	VectorCopy( ent->s.pos.trBase, muzzlePoint );
ADDRFP4 20
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1322
;1322:	muzzlePoint[2] += ent->client->ps.viewheight;
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
line 1323
;1323:	VectorMA( muzzlePoint, 14, forward, muzzlePoint );
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
line 1325
;1324:	// snap to integer coordinates for more efficient network bandwidth usage
;1325:	SnapVector( muzzlePoint );
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
line 1326
;1326:}
LABELV $428
endproc CalcMuzzlePointOrigin 48 4
export FireWeapon
proc FireWeapon 16 24
line 1335
;1327:
;1328:
;1329:
;1330:/*
;1331:===============
;1332:FireWeapon
;1333:===============
;1334:*/
;1335:void FireWeapon( gentity_t *ent ) {
line 1336
;1336:	if (ent->client->ps.powerups[PW_QUAD] ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $430
line 1337
;1337:		s_quadFactor = g_quadfactor.value;
ADDRGP4 s_quadFactor
ADDRGP4 g_quadfactor+8
INDIRF4
ASGNF4
line 1338
;1338:	} else {
ADDRGP4 $431
JUMPV
LABELV $430
line 1339
;1339:		s_quadFactor = 1;
ADDRGP4 s_quadFactor
CNSTF4 1065353216
ASGNF4
line 1340
;1340:	}
LABELV $431
line 1348
;1341:#ifdef MISSIONPACK
;1342:	if( ent->client->persistantPowerup && ent->client->persistantPowerup->item && ent->client->persistantPowerup->item->giTag == PW_DOUBLER ) {
;1343:		s_quadFactor *= 2;
;1344:	}
;1345:#endif
;1346:
;1347:	// track shots taken for accuracy tracking.  Grapple is not a weapon and gauntet is just not tracked
;1348:	if( ent->s.weapon != WP_GRAPPLING_HOOK && ent->s.weapon != WP_GAUNTLET ) {
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
EQI4 $433
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $433
line 1356
;1349:#ifdef MISSIONPACK
;1350:		if( ent->s.weapon == WP_NAILGUN ) {
;1351:			ent->client->accuracy_shots += NUM_NAILSHOTS;
;1352:		} else {
;1353:			ent->client->accuracy_shots++;
;1354:		}
;1355:#else
;1356:		ent->client->accuracy_shots++;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2660
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
line 1358
;1357:#endif
;1358:	}
LABELV $433
line 1361
;1359:
;1360:	// set aiming directions
;1361:	AngleVectors (ent->client->ps.viewangles, forward, right, up);
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
line 1363
;1362:
;1363:	CalcMuzzlePointOrigin ( ent, ent->client->oldOrigin, forward, right, up, muzzle );
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
CNSTI4 2616
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
line 1366
;1364:
;1365:	// fire the specific weapon
;1366:	switch( ent->s.weapon ) {
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
LTI4 $436
ADDRLP4 8
INDIRI4
CNSTI4 11
GTI4 $436
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $452-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $452
address $438
address $441
address $445
address $440
address $442
address $439
address $444
address $443
address $446
address $447
address $451
code
LABELV $438
line 1368
;1367:	case WP_GAUNTLET:
;1368:		Weapon_Gauntlet( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Gauntlet
CALLV
pop
line 1369
;1369:		break;
ADDRGP4 $436
JUMPV
LABELV $439
line 1373
;1370:	case WP_LIGHTNING:
;1371:		//Weapon_LightningFire( ent );
;1372:		//Weapon_fire_flame(ent , qfalse );  // Shafe - Trep - Flame Thrower
;1373:		flamethrowerFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 flamethrowerFire
CALLV
pop
line 1374
;1374:		break;
ADDRGP4 $436
JUMPV
LABELV $440
line 1376
;1375:	case WP_SHOTGUN:
;1376:		weapon_supershotgun_fire( ent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 weapon_supershotgun_fire
CALLV
pop
line 1377
;1377:		break;
ADDRGP4 $436
JUMPV
LABELV $441
line 1379
;1378:	case WP_MACHINEGUN:
;1379:		Weapon_fire_mg( ent, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Weapon_fire_mg
CALLV
pop
line 1387
;1380:		/*
;1381:		if ( g_gametype.integer != GT_TEAM ) {
;1382:			Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_DAMAGE );
;1383:		} else {
;1384:			Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_TEAM_DAMAGE );
;1385:		}
;1386:		*/
;1387:		break;
ADDRGP4 $436
JUMPV
LABELV $442
line 1389
;1388:	case WP_GRENADE_LAUNCHER:
;1389:		weapon_grenadelauncher_fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_grenadelauncher_fire
CALLV
pop
line 1391
;1390:		//weapon_bomblauncher_fire( ent, qtrue);  // This is the 2 step grenades, may be worth revisiting - Shafe
;1391:		break;
ADDRGP4 $436
JUMPV
LABELV $443
line 1393
;1392:	case WP_ROCKET_LAUNCHER:
;1393:		Weapon_RocketLauncher_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_RocketLauncher_Fire
CALLV
pop
line 1394
;1394:		break;
ADDRGP4 $436
JUMPV
LABELV $444
line 1396
;1395:	case WP_PLASMAGUN:
;1396:		Weapon_Plasmagun_Fire( ent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Weapon_Plasmagun_Fire
CALLV
pop
line 1397
;1397:		break;
ADDRGP4 $436
JUMPV
LABELV $445
line 1399
;1398:	case WP_RAILGUN:
;1399:		weapon_railgun_fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_railgun_fire
CALLV
pop
line 1400
;1400:		break;
ADDRGP4 $436
JUMPV
LABELV $446
line 1402
;1401:	case WP_BFG:
;1402:		BFG_Fire( ent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BFG_Fire
CALLV
pop
line 1403
;1403:		break;
ADDRGP4 $436
JUMPV
LABELV $447
line 1405
;1404:	case WP_GRAPPLING_HOOK:
;1405:		if(g_allowGrapple.integer) {
ADDRGP4 g_allowGrapple+12
INDIRI4
CNSTI4 0
EQI4 $436
line 1406
;1406:			Weapon_GrapplingHook_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_GrapplingHook_Fire
CALLV
pop
line 1407
;1407:		}
line 1408
;1408:		break;
ADDRGP4 $436
JUMPV
LABELV $451
line 1410
;1409:	case WP_TURRET:
;1410:		Weapon_fire_turret( ent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Weapon_fire_turret
CALLV
pop
line 1411
;1411:		break;	
line 1425
;1412:#ifdef MISSIONPACK
;1413:	case WP_NAILGUN:
;1414:		Weapon_Nailgun_Fire( ent );
;1415:		break;
;1416:	case WP_PROX_LAUNCHER:
;1417:		weapon_proxlauncher_fire( ent );
;1418:		break;
;1419:	case WP_CHAINGUN:
;1420:		Bullet_Fire( ent, CHAINGUN_SPREAD, MACHINEGUN_DAMAGE );
;1421:		break;
;1422:#endif
;1423:	default:
;1424:// FIXME		G_Error( "Bad ent->s.weapon" );
;1425:		break;
LABELV $436
line 1427
;1426:	}
;1427:}
LABELV $429
endproc FireWeapon 16 24
export FireWeapon2
proc FireWeapon2 12 20
line 1437
;1428:
;1429:
;1430:/* 
;1431:=============== 
;1432:FireWeapon2 
;1433:Shafe - Trep - Alt Fire FireWeapon2
;1434:Right now this just shoots rockets...
;1435:=============== 
;1436:*/ 
;1437:void FireWeapon2( gentity_t *ent ) { 
line 1438
;1438: if (ent->client->ps.powerups[PW_QUAD] ) { 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $455
line 1439
;1439:  s_quadFactor = g_quadfactor.value; 
ADDRGP4 s_quadFactor
ADDRGP4 g_quadfactor+8
INDIRF4
ASGNF4
line 1440
;1440: } else { 
ADDRGP4 $456
JUMPV
LABELV $455
line 1441
;1441:  s_quadFactor = 1; 
ADDRGP4 s_quadFactor
CNSTF4 1065353216
ASGNF4
line 1442
;1442: } 
LABELV $456
line 1445
;1443:
;1444: // track shots taken for accuracy tracking.  Grapple is not a weapon and gauntet is just not tracked 
;1445: if( ent->s.weapon != WP_GRAPPLING_HOOK && ent->s.weapon != WP_GAUNTLET ) { 
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
EQI4 $458
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $458
line 1448
;1446:   //ent->client->ps.persistant[PERS_ACCURACY_SHOTS]++;  // This doesnt exist?
;1447:	// ent->client->accuracy_shots++;
;1448: } 
LABELV $458
line 1451
;1449:
;1450: // set aiming directions 
;1451: AngleVectors (ent->client->ps.viewangles, forward, right, up); 
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
line 1453
;1452:
;1453: CalcMuzzlePoint ( ent, forward, right, up, muzzle ); 
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
line 1456
;1454:
;1455: // fire the specific weapon 
;1456: switch( ent->s.weapon ) { 
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
LTI4 $461
ADDRLP4 4
INDIRI4
CNSTI4 11
GTI4 $461
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $477-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $477
address $463
address $466
address $461
address $465
address $467
address $464
address $469
address $468
address $471
address $472
address $476
code
LABELV $463
line 1458
;1457: case WP_GAUNTLET: 
;1458:	Weapon_Gauntlet( ent ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Gauntlet
CALLV
pop
line 1459
;1459:	break; 
ADDRGP4 $461
JUMPV
LABELV $464
line 1461
;1460: case WP_LIGHTNING: 
;1461:	Weapon_fire_flame( ent, qtrue);  // Shafe - Trep - Flame Thrower
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Weapon_fire_flame
CALLV
pop
line 1462
;1462:	break; 
ADDRGP4 $461
JUMPV
LABELV $465
line 1465
;1463: case WP_SHOTGUN: 
;1464:	 //weapon_supershotgun_fire( ent, qtrue );
;1465:	 weapon_pdlauncher_fire( ent); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_pdlauncher_fire
CALLV
pop
line 1466
;1466:	break; 
ADDRGP4 $461
JUMPV
LABELV $466
line 1469
;1467: case WP_MACHINEGUN: 
;1468:	//WP_FireUltraBeam(ent); // testing
;1469:	Weapon_fire_mg( ent, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Weapon_fire_mg
CALLV
pop
line 1477
;1470:	/* 
;1471:	if ( g_gametype.integer != GT_TEAM ) { 
;1472:		Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_DAMAGE ); 
;1473:	} else { 
;1474:		Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_TEAM_DAMAGE ); 
;1475:	} 
;1476:	*/
;1477:  break; 
ADDRGP4 $461
JUMPV
LABELV $467
line 1479
;1478: case WP_GRENADE_LAUNCHER: 
;1479:	weapon_altgrenadelauncher_fire( ent ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_altgrenadelauncher_fire
CALLV
pop
line 1480
;1480:	break; 
ADDRGP4 $461
JUMPV
LABELV $468
line 1482
;1481: case WP_ROCKET_LAUNCHER: 
;1482:	Weapon_RocketLauncher_AltFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_RocketLauncher_AltFire
CALLV
pop
line 1483
;1483:	break; 
ADDRGP4 $461
JUMPV
LABELV $469
line 1485
;1484: case WP_PLASMAGUN: 
;1485:	Weapon_Plasmagun_Fire( ent, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Weapon_Plasmagun_Fire
CALLV
pop
line 1486
;1486:	break; 
ADDRGP4 $461
JUMPV
line 1489
;1487: case WP_RAILGUN: 
;1488:	// This is just zoom
;1489:	break; 
LABELV $471
line 1491
;1490: case WP_BFG: 
;1491:	BFG_Fire( ent, qtrue); 
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BFG_Fire
CALLV
pop
line 1492
;1492:	break; 
ADDRGP4 $461
JUMPV
LABELV $472
line 1494
;1493: case WP_GRAPPLING_HOOK: 
;1494:	if(g_allowGrapple.integer) {
ADDRGP4 g_allowGrapple+12
INDIRI4
CNSTI4 0
EQI4 $461
line 1495
;1495:		Weapon_GrapplingHook_Fire( ent ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_GrapplingHook_Fire
CALLV
pop
line 1496
;1496:	}
line 1497
;1497:	break;
ADDRGP4 $461
JUMPV
LABELV $476
line 1499
;1498: case WP_TURRET:
;1499:	Weapon_fire_turret( ent, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Weapon_fire_turret
CALLV
pop
line 1500
;1500:	break;	
line 1503
;1501: default: 
;1502:// FIXME  G_Error( "Bad ent->s.weapon" ); 
;1503:  break; 
LABELV $461
line 1505
;1504: } 
;1505:}
LABELV $454
endproc FireWeapon2 12 20
lit
align 4
LABELV $480
byte 4 3246391296
byte 4 3246391296
byte 4 0
align 4
LABELV $481
byte 4 1098907648
byte 4 1098907648
byte 4 1098907648
export CanBuildHere
code
proc CanBuildHere 136 28
line 1776
;1506:
;1507:
;1508:#ifdef MISSIONPACK
;1509:
;1510:/*
;1511:===============
;1512:KamikazeRadiusDamage
;1513:===============
;1514:*/
;1515:static void KamikazeRadiusDamage( vec3_t origin, gentity_t *attacker, float damage, float radius ) {
;1516:	float		dist;
;1517:	gentity_t	*ent;
;1518:	int			entityList[MAX_GENTITIES];
;1519:	int			numListedEntities;
;1520:	vec3_t		mins, maxs;
;1521:	vec3_t		v;
;1522:	vec3_t		dir;
;1523:	int			i, e;
;1524:
;1525:	if ( radius < 1 ) {
;1526:		radius = 1;
;1527:	}
;1528:
;1529:	for ( i = 0 ; i < 3 ; i++ ) {
;1530:		mins[i] = origin[i] - radius;
;1531:		maxs[i] = origin[i] + radius;
;1532:	}
;1533:
;1534:	numListedEntities = trap_EntitiesInBox( mins, maxs, entityList, MAX_GENTITIES );
;1535:
;1536:	for ( e = 0 ; e < numListedEntities ; e++ ) {
;1537:		ent = &g_entities[entityList[ e ]];
;1538:
;1539:		if (!ent->takedamage) {
;1540:			continue;
;1541:		}
;1542:
;1543:		// dont hit things we have already hit
;1544:		if( ent->kamikazeTime > level.time ) {
;1545:			continue;
;1546:		}
;1547:
;1548:		// find the distance from the edge of the bounding box
;1549:		for ( i = 0 ; i < 3 ; i++ ) {
;1550:			if ( origin[i] < ent->r.absmin[i] ) {
;1551:				v[i] = ent->r.absmin[i] - origin[i];
;1552:			} else if ( origin[i] > ent->r.absmax[i] ) {
;1553:				v[i] = origin[i] - ent->r.absmax[i];
;1554:			} else {
;1555:				v[i] = 0;
;1556:			}
;1557:		}
;1558:
;1559:		dist = VectorLength( v );
;1560:		if ( dist >= radius ) {
;1561:			continue;
;1562:		}
;1563:
;1564://		if( CanDamage (ent, origin) ) {
;1565:			VectorSubtract (ent->r.currentOrigin, origin, dir);
;1566:			// push the center of mass higher than the origin so players
;1567:			// get knocked into the air more
;1568:			dir[2] += 24;
;1569:			G_Damage( ent, NULL, attacker, dir, origin, damage, DAMAGE_RADIUS|DAMAGE_NO_TEAM_PROTECTION, MOD_KAMIKAZE );
;1570:			ent->kamikazeTime = level.time + 3000;
;1571://		}
;1572:	}
;1573:}
;1574:
;1575:/*
;1576:===============
;1577:KamikazeShockWave
;1578:===============
;1579:*/
;1580:static void KamikazeShockWave( vec3_t origin, gentity_t *attacker, float damage, float push, float radius ) {
;1581:	float		dist;
;1582:	gentity_t	*ent;
;1583:	int			entityList[MAX_GENTITIES];
;1584:	int			numListedEntities;
;1585:	vec3_t		mins, maxs;
;1586:	vec3_t		v;
;1587:	vec3_t		dir;
;1588:	int			i, e;
;1589:
;1590:	if ( radius < 1 )
;1591:		radius = 1;
;1592:
;1593:	for ( i = 0 ; i < 3 ; i++ ) {
;1594:		mins[i] = origin[i] - radius;
;1595:		maxs[i] = origin[i] + radius;
;1596:	}
;1597:
;1598:	numListedEntities = trap_EntitiesInBox( mins, maxs, entityList, MAX_GENTITIES );
;1599:
;1600:	for ( e = 0 ; e < numListedEntities ; e++ ) {
;1601:		ent = &g_entities[entityList[ e ]];
;1602:
;1603:		// dont hit things we have already hit
;1604:		if( ent->kamikazeShockTime > level.time ) {
;1605:			continue;
;1606:		}
;1607:
;1608:		// find the distance from the edge of the bounding box
;1609:		for ( i = 0 ; i < 3 ; i++ ) {
;1610:			if ( origin[i] < ent->r.absmin[i] ) {
;1611:				v[i] = ent->r.absmin[i] - origin[i];
;1612:			} else if ( origin[i] > ent->r.absmax[i] ) {
;1613:				v[i] = origin[i] - ent->r.absmax[i];
;1614:			} else {
;1615:				v[i] = 0;
;1616:			}
;1617:		}
;1618:
;1619:		dist = VectorLength( v );
;1620:		if ( dist >= radius ) {
;1621:			continue;
;1622:		}
;1623:
;1624://		if( CanDamage (ent, origin) ) {
;1625:			VectorSubtract (ent->r.currentOrigin, origin, dir);
;1626:			dir[2] += 24;
;1627:			G_Damage( ent, NULL, attacker, dir, origin, damage, DAMAGE_RADIUS|DAMAGE_NO_TEAM_PROTECTION, MOD_KAMIKAZE );
;1628:			//
;1629:			dir[2] = 0;
;1630:			VectorNormalize(dir);
;1631:			if ( ent->client ) {
;1632:				ent->client->ps.velocity[0] = dir[0] * push;
;1633:				ent->client->ps.velocity[1] = dir[1] * push;
;1634:				ent->client->ps.velocity[2] = 100;
;1635:			}
;1636:			ent->kamikazeShockTime = level.time + 3000;
;1637://		}
;1638:	}
;1639:}
;1640:
;1641:/*
;1642:===============
;1643:KamikazeDamage
;1644:===============
;1645:*/
;1646:static void KamikazeDamage( gentity_t *self ) {
;1647:	int i;
;1648:	float t;
;1649:	gentity_t *ent;
;1650:	vec3_t newangles;
;1651:
;1652:	self->count += 100;
;1653:
;1654:	if (self->count >= KAMI_SHOCKWAVE_STARTTIME) {
;1655:		// shockwave push back
;1656:		t = self->count - KAMI_SHOCKWAVE_STARTTIME;
;1657:		KamikazeShockWave(self->s.pos.trBase, self->activator, 25, 400,	(int) (float) t * KAMI_SHOCKWAVE_MAXRADIUS / (KAMI_SHOCKWAVE_ENDTIME - KAMI_SHOCKWAVE_STARTTIME) );
;1658:	}
;1659:	//
;1660:	if (self->count >= KAMI_EXPLODE_STARTTIME) {
;1661:		// do our damage
;1662:		t = self->count - KAMI_EXPLODE_STARTTIME;
;1663:		KamikazeRadiusDamage( self->s.pos.trBase, self->activator, 400,	(int) (float) t * KAMI_BOOMSPHERE_MAXRADIUS / (KAMI_IMPLODE_STARTTIME - KAMI_EXPLODE_STARTTIME) );
;1664:	}
;1665:
;1666:	// either cycle or kill self
;1667:	if( self->count >= KAMI_SHOCKWAVE_ENDTIME ) {
;1668:		G_FreeEntity( self );
;1669:		return;
;1670:	}
;1671:	self->nextthink = level.time + 100;
;1672:
;1673:	// add earth quake effect
;1674:	newangles[0] = crandom() * 2;
;1675:	newangles[1] = crandom() * 2;
;1676:	newangles[2] = 0;
;1677:	for (i = 0; i < MAX_CLIENTS; i++)
;1678:	{
;1679:		ent = &g_entities[i];
;1680:		if (!ent->inuse)
;1681:			continue;
;1682:		if (!ent->client)
;1683:			continue;
;1684:
;1685:		if (ent->client->ps.groundEntityNum != ENTITYNUM_NONE) {
;1686:			ent->client->ps.velocity[0] += crandom() * 120;
;1687:			ent->client->ps.velocity[1] += crandom() * 120;
;1688:			ent->client->ps.velocity[2] = 30 + random() * 25;
;1689:		}
;1690:
;1691:		ent->client->ps.delta_angles[0] += ANGLE2SHORT(newangles[0] - self->movedir[0]);
;1692:		ent->client->ps.delta_angles[1] += ANGLE2SHORT(newangles[1] - self->movedir[1]);
;1693:		ent->client->ps.delta_angles[2] += ANGLE2SHORT(newangles[2] - self->movedir[2]);
;1694:	}
;1695:	VectorCopy(newangles, self->movedir);
;1696:}
;1697:
;1698:/*
;1699:===============
;1700:G_StartKamikaze
;1701:===============
;1702:*/
;1703:void G_StartKamikaze( gentity_t *ent ) {
;1704:	gentity_t	*explosion;
;1705:	gentity_t	*te;
;1706:	vec3_t		snapped;
;1707:
;1708:	// start up the explosion logic
;1709:	explosion = G_Spawn();
;1710:
;1711:	explosion->s.eType = ET_EVENTS + EV_KAMIKAZE;
;1712:	explosion->eventTime = level.time;
;1713:
;1714:	if ( ent->client ) {
;1715:		VectorCopy( ent->s.pos.trBase, snapped );
;1716:	}
;1717:	else {
;1718:		VectorCopy( ent->activator->s.pos.trBase, snapped );
;1719:	}
;1720:	SnapVector( snapped );		// save network bandwidth
;1721:	G_SetOrigin( explosion, snapped );
;1722:
;1723:	explosion->classname = "kamikaze";
;1724:	explosion->s.pos.trType = TR_STATIONARY;
;1725:
;1726:	explosion->kamikazeTime = level.time;
;1727:
;1728:	explosion->think = KamikazeDamage;
;1729:	explosion->nextthink = level.time + 100;
;1730:	explosion->count = 0;
;1731:	VectorClear(explosion->movedir);
;1732:
;1733:	trap_LinkEntity( explosion );
;1734:
;1735:	if (ent->client) {
;1736:		//
;1737:		explosion->activator = ent;
;1738:		//
;1739:		ent->s.eFlags &= ~EF_KAMIKAZE;
;1740:		// nuke the guy that used it
;1741:		G_Damage( ent, ent, ent, NULL, NULL, 100000, DAMAGE_NO_PROTECTION, MOD_KAMIKAZE );
;1742:	}
;1743:	else {
;1744:		if ( !strcmp(ent->activator->classname, "bodyque") ) {
;1745:			explosion->activator = &g_entities[ent->activator->r.ownerNum];
;1746:		}
;1747:		else {
;1748:			explosion->activator = ent->activator;
;1749:		}
;1750:	}
;1751:
;1752:	// play global sound at all clients
;1753:	te = G_TempEntity(snapped, EV_GLOBAL_TEAM_SOUND );
;1754:	te->r.svFlags |= SVF_BROADCAST;
;1755:	te->s.eventParm = GTS_KAMIKAZE;
;1756:}
;1757:#endif
;1758:
;1759:
;1760:/*
;1761:====================================================
;1762:MORE BUILDABLE STUFF
;1763:Done here for those night forward, right, and up values 
;1764:=================
;1765:*/
;1766:#define PLACEDIST			64
;1767:
;1768:/*
;1769:=================
;1770:CanBuildHere
;1771:
;1772:This checks to see that we can build this thing
;1773:=================
;1774:*/
;1775:qboolean CanBuildHere(gentity_t *playerent)
;1776:{
line 1778
;1777:	trace_t		tr;
;1778:	vec3_t		fwd, pos, dest, mins = {-16,-16, 0}, maxs = {16,16,16};
ADDRLP4 92
ADDRGP4 $480
INDIRB
ASGNB 12
ADDRLP4 104
ADDRGP4 $481
INDIRB
ASGNB 12
line 1783
;1779:
;1780:	
;1781:
;1782:	// can we place this in front of us?
;1783:	AngleVectors (playerent->client->ps.viewangles, fwd, NULL, NULL);
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
line 1784
;1784:	fwd[2] = 0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 1785
;1785:	VectorMA(playerent->client->ps.origin, PLACEDIST, fwd, dest);
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
line 1786
;1786:	trap_Trace (&tr, playerent->client->ps.origin, mins, maxs, dest, playerent->s.number, MASK_SHOT );
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
line 1787
;1787:	if (tr.fraction > 0.9)
ADDRLP4 24+8
INDIRF4
CNSTF4 1063675494
LEF4 $487
line 1788
;1788:	{//room in front
line 1789
;1789:		VectorCopy(tr.endpos, pos);
ADDRLP4 80
ADDRLP4 24+12
INDIRB
ASGNB 12
line 1791
;1790:		// drop to floor
;1791:		VectorSet( dest, pos[0], pos[1], pos[2] - 4096 );
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
line 1792
;1792:		trap_Trace( &tr, pos, mins, maxs, dest, playerent->s.number, MASK_SOLID );
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
line 1793
;1793:		if ( !tr.startsolid && !tr.allsolid )
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRLP4 24+4
INDIRI4
ADDRLP4 132
INDIRI4
NEI4 $495
ADDRLP4 24
INDIRI4
ADDRLP4 132
INDIRI4
NEI4 $495
line 1794
;1794:		{	
line 1795
;1795:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $479
JUMPV
LABELV $495
line 1797
;1796:		}
;1797:	}
LABELV $487
line 1799
;1798:	// no room
;1799:	return qfalse;
CNSTI4 0
RETI4
LABELV $479
endproc CanBuildHere 136 28
lit
align 4
LABELV $499
byte 4 0
byte 4 0
byte 4 0
export BuildableSpawn
code
proc BuildableSpawn 280 28
line 1813
;1800:}
;1801:
;1802:
;1803:
;1804:
;1805:/*
;1806:=================
;1807:BuildableSpawn
;1808:
;1809:This checks puts it in front, drops it to the ground and angles it correctly
;1810:=================
;1811:*/
;1812:void BuildableSpawn( gentity_t *base )
;1813:{ // Done here for those night forward, right, and up values -Vincent	
line 1815
;1814:vec3_t		start, dir, angles; // Part 1 stuff
;1815:vec3_t		origin, slope, nvf, ovf, ovr, new_angles = {0, 0, 0 }; // Part 2
ADDRLP4 116
ADDRGP4 $499
INDIRB
ASGNB 12
line 1819
;1816:float		pitch, mod, dot; // Part 2
;1817:trace_t		tr1, tr2; // Part 2
;1818:
;1819:if( !base || !base->parent || !base->parent->client )
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
EQU4 $503
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
EQU4 $503
ADDRLP4 240
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 236
INDIRU4
NEU4 $500
LABELV $503
line 1820
;1820:	return; // Verify for both parts
ADDRGP4 $498
JUMPV
LABELV $500
line 1823
;1821:
;1822:// Part 1: Initial spawning in front of the player -Vincent
;1823:VectorCopy( base->parent->client->ps.viewangles, angles );
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
line 1824
;1824:angles[0] = 0; // Stay straight
ADDRLP4 92
CNSTF4 0
ASGNF4
line 1825
;1825:angles[2] = 0; // Stay straight
ADDRLP4 92+8
CNSTF4 0
ASGNF4
line 1827
;1826:
;1827:AngleVectors( angles, forward, right, up );
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
line 1828
;1828:CalcMuzzlePoint( base, forward, right, up, start ); // Actual start point, away from the owner
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
line 1829
;1829:VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1830
;1830:VectorMA( start, 32, forward, start ); // Go in front of the player
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
line 1833
;1831:
;1832:
;1833:G_SetOrigin( base, start ); // Start a bit in front of the player
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1834
;1834:base->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1836
;1835:	
;1836:VectorCopy( forward, dir ); // To tweak it below this...
ADDRLP4 12
ADDRGP4 forward
INDIRB
ASGNB 12
line 1837
;1837:VectorNormalize( dir );
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1838
;1838:VectorScale( dir, 300, base->s.pos.trDelta );
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
line 1839
;1839:base->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1840
;1840:vectoangles( dir, base->s.angles);
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
line 1841
;1841:VectorCopy( base->s.angles, base->s.apos.trBase );
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
line 1842
;1842:VectorSet( base->s.apos.trDelta, 50, 0, 0 ); // Speed
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
line 1843
;1843:base->s.apos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1848
;1844:
;1845:
;1846:// Part 2: Put it on the ground and match it to slopes -Vincent
;1847:
;1848:VectorCopy( base->r.currentOrigin, origin );
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRB
ASGNB 12
line 1849
;1849:origin[2] -= 2500; // Trace it straight down
ADDRLP4 24+8
ADDRLP4 24+8
INDIRF4
CNSTF4 1159479296
SUBF4
ASGNF4
line 1852
;1850:// Trace for solids from the previous position to the new position on the ground, 
;1851:// but without getting stuck in the owner!
;1852:trap_Trace( &tr1, base->r.currentOrigin, base->r.mins, base->r.maxs, origin, 
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
EQU4 $518
ADDRLP4 252
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
INDIRI4
ASGNI4
ADDRGP4 $519
JUMPV
LABELV $518
ADDRLP4 252
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
LABELV $519
ADDRLP4 252
INDIRI4
ARGI4
CNSTI4 100664321
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1856
;1853:			base->parent ? base->parent->s.number : base->s.number, MASK_SHOT );
;1854:
;1855:
;1856:VectorCopy( base->r.currentOrigin, origin ); // Keep the old value for lava checking
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRB
ASGNB 12
line 1857
;1857:G_SetOrigin( base, tr1.endpos );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36+12
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1858
;1858:VectorCopy( base->r.currentOrigin, base->s.origin ); // Set it's new origin
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
line 1861
;1859:
;1860:
;1861:if( tr1.fraction < 1.0 && ( &tr1.plane ) )
ADDRLP4 36+8
INDIRF4
CNSTF4 1065353216
GEF4 $521
ADDRLP4 36+24
CVPU4 4
CNSTU4 0
EQU4 $521
line 1862
;1862:{ // Match to a slope when necessary
line 1863
;1863:VectorCopy( tr1.plane.normal, slope ); // Get the slopes' angles
ADDRLP4 220
ADDRLP4 36+24
INDIRB
ASGNB 12
line 1864
;1864:AngleVectors( base->s.angles, ovf, ovr, NULL ); // Already calculated in part 1
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
line 1865
;1865:vectoangles( slope, new_angles );
ADDRLP4 220
ARGP4
ADDRLP4 116
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1866
;1866:pitch = new_angles[PITCH] + 90;
ADDRLP4 212
ADDRLP4 116
INDIRF4
CNSTF4 1119092736
ADDF4
ASGNF4
line 1867
;1867:new_angles[ROLL] = new_angles[PITCH] = 0;
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
line 1868
;1868:AngleVectors( new_angles, nvf, NULL, NULL );
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
line 1870
;1869:
;1870:mod = DotProduct( nvf, ovr );
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
line 1871
;1871:if( mod < 0 )
ADDRLP4 152
INDIRF4
CNSTF4 0
GEF4 $531
line 1872
;1872:	mod = -1;
ADDRLP4 152
CNSTF4 3212836864
ASGNF4
ADDRGP4 $532
JUMPV
LABELV $531
line 1874
;1873:else
;1874:	mod = 1;
ADDRLP4 152
CNSTF4 1065353216
ASGNF4
LABELV $532
line 1876
;1875:
;1876:dot = DotProduct( nvf, ovf );
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
line 1878
;1877:// Modify its actual angles
;1878:base->s.angles[PITCH] = dot * pitch;
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
line 1879
;1879:base->s.angles[ROLL] = ( ( 1-Q_fabs( dot ) ) * pitch * mod );
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
line 1880
;1880:VectorCopy( base->s.angles, base->s.apos.trBase );
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
line 1881
;1881:}
LABELV $521
line 1883
;1882:
;1883:trap_LinkEntity( base ); // Add it...
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1887
;1884:
;1885:// Trace back to its original point to see if the buildable hit any non-solid content on its way
;1886:// When it does, the buildable should be cleared!
;1887:trap_Trace( &tr2, origin, base->r.mins, base->r.maxs, base->r.currentOrigin, 
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
EQU4 $538
ADDRLP4 264
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
INDIRI4
ASGNI4
ADDRGP4 $539
JUMPV
LABELV $538
ADDRLP4 264
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
LABELV $539
ADDRLP4 264
INDIRI4
ARGI4
CNSTI4 25
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1890
;1888:		   	base->parent ? base->parent->s.number : base->s.number, CONTENTS_LAVA | CONTENTS_SLIME | CONTENTS_SOLID );
;1889:
;1890:if( tr2.fraction < 1.0 ) // It did go through a bad content
ADDRLP4 156+8
INDIRF4
CNSTF4 1065353216
GEF4 $540
line 1891
;1891:{
line 1892
;1892:base->s.eType = ET_GENERAL; // To go for a die in g_buildables
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 1893
;1893:}
ADDRGP4 $541
JUMPV
LABELV $540
line 1895
;1894:else
;1895:{
line 1896
;1896:base->s.eType = ET_BUILDABLE; // Initialize it
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 13
ASGNI4
line 1897
;1897:}
LABELV $541
line 1899
;1898:// The actual buildables' thinking happens in g_buildables again, after this func
;1899:}
LABELV $498
endproc BuildableSpawn 280 28
import fire_flamethrower2
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
LABELV $279
byte 1 43
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $204
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
LABELV $195
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 0
