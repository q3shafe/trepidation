export pdg_explode
code
proc pdg_explode 28 12
file "../g_missile.c"
line 19
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:
;5:#define	MISSILE_PRESTEP_TIME	50
;6:#define FIRST_HOMING_THINK		500
;7:#define HOMING_THINK			60
;8:#define HOMING_MISSILE_SPEED	800
;9:
;10:
;11:
;12:void G_ExplodeDevastatorFire( gentity_t *ent );
;13:gentity_t *fire_devparticle (gentity_t *self, vec3_t start, vec3_t dir, qboolean alt);
;14:
;15:// Shafe - Once everything works this file needs cleaned up
;16:
;17:
;18:
;19:void pdg_explode(gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod){
line 23
;20:
;21:	vec3_t dir; // needed by the event being added
;22:
;23:	dir[0] = dir[1] = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 0+4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 24
;24:	dir[2] = 1;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 25
;25:	if (self->chain)
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $58
line 26
;26:		G_FreeEntity(self->chain); // get rid of the gun. // the gun just vanishes
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
LABELV $58
line 27
;27:		self->s.weapon=WP_ROCKET_LAUNCHER; // to tell it what kind of explosion to use
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 5
ASGNI4
line 28
;28:		G_AddEvent( self, EV_MISSILE_MISS, DirToByte( dir ) ); // to tell it to spawn an explosion here	
ADDRLP4 0
ARGP4
ADDRLP4 16
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 53
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 29
;29:		self->freeAfterEvent = qtrue; // so it goes away after the explosion
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 31
;30:
;31:	if (self->parent->istelepoint != 0)
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
CNSTI4 0
EQI4 $60
line 32
;32:	{
line 33
;33:		trap_SendServerCommand( self->r.ownerNum, va("cp \"^9%s Destroyed your PDG!\n\"", attacker->client->pers.netname) );
ADDRGP4 $62
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 34
;34:	}
LABELV $60
line 35
;35:	self->parent->istelepoint = 0; // client cannot teleport
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 832
ADDP4
CNSTI4 0
ASGNI4
line 36
;36: 	VectorClear( self->parent->teleloc ); // clear the teleport location
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
CNSTF4 0
ASGNF4
ADDRLP4 20
INDIRP4
CNSTI4 828
ADDP4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 20
INDIRP4
CNSTI4 824
ADDP4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 20
INDIRP4
CNSTI4 820
ADDP4
ADDRLP4 24
INDIRF4
ASGNF4
line 40
;37:	//G_Printf( S_COLOR_GREEN "Particle Displacement Grenade Expired\n" );
;38:
;39:
;40:}
LABELV $55
endproc pdg_explode 28 12
export G_Missile_Die
proc G_Missile_Die 0 0
line 47
;41:
;42:/*
;43:================
;44:G_Missile_Die
;45:================
;46:*/
;47:void G_Missile_Die( gentity_t *ent, gentity_t *inflictor, gentity_t *attacker, int damage, int mod ) {
line 48
;48:	ent->nextthink = level.time + 1;
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 49
;49:	ent->think = G_ExplodeMissile;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 51
;50:
;51:}
LABELV $63
endproc G_Missile_Die 0 0
export G_BounceMissile
proc G_BounceMissile 52 12
line 59
;52:
;53:/*
;54:================
;55:G_BounceMissile
;56:
;57:================
;58:*/
;59:void G_BounceMissile( gentity_t *ent, trace_t *trace ) {
line 65
;60:	vec3_t	velocity;
;61:	float	dot;
;62:	int		hitTime;
;63:
;64:	// reflect the velocity on the trace plane
;65:	hitTime = level.previousTime + ( level.time - level.previousTime ) * trace->fraction;
ADDRLP4 16
ADDRGP4 level+36
INDIRI4
CVIF4 4
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+36
INDIRI4
SUBI4
CVIF4 4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 66
;66:	BG_EvaluateTrajectoryDelta( &ent->s.pos, hitTime, velocity );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectoryDelta
CALLV
pop
line 67
;67:	dot = DotProduct( velocity, trace->plane.normal );
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 68
;68:	VectorMA( velocity, -2*dot, trace->plane.normal, ent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CNSTF4 3221225472
ADDRLP4 12
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3221225472
ADDRLP4 12
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 3221225472
ADDRLP4 12
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 70
;69:
;70:	if ( ent->s.eFlags & EF_BOUNCE_HALF ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $73
line 71
;71:		VectorScale( ent->s.pos.trDelta, 0.65, ent->s.pos.trDelta );
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTF4 1059481190
ADDRLP4 24
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTF4 1059481190
ADDRLP4 28
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTF4 1059481190
ADDRLP4 32
INDIRP4
INDIRF4
MULF4
ASGNF4
line 73
;72:		// check for stop
;73:		if ( trace->plane.normal[2] > 0.2 && VectorLength( ent->s.pos.trDelta ) < 40 ) {
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 1045220557
LEF4 $75
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 36
INDIRF4
CNSTF4 1109393408
GEF4 $75
line 74
;74:			G_SetOrigin( ent, trace->endpos );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 77
;75:				
;76:			// Shafe - trep - pdg
;77:			if (ent->classname == "pdgrenade") {
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 $79
CVPU4 4
NEU4 $65
line 78
;78:			    ent->parent->istelepoint = 1;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 832
ADDP4
CNSTI4 1
ASGNI4
line 79
;79:				VectorCopy(ent->r.currentOrigin, ent->parent->teleloc);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 820
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 496
ADDP4
INDIRB
ASGNB 12
line 80
;80:				ent->parent->teleloc[2] += 20;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 828
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRF4
CNSTF4 1101004800
ADDF4
ASGNF4
line 83
;81:			
;82:				
;83:				trap_SendServerCommand( ent->r.ownerNum, va("cp \"^9Particle Displacement Grenade Lock!\n\"") );
ADDRGP4 $80
ARGP4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 85
;84:				//G_Printf( S_COLOR_RED "Particle Displacement Grenade Lock!\n" );
;85:			} // end shafe
line 87
;86:
;87:			return;
ADDRGP4 $65
JUMPV
LABELV $75
line 89
;88:		}
;89:	}
LABELV $73
line 91
;90:
;91:	VectorAdd( ent->r.currentOrigin, trace->plane.normal, ent->r.currentOrigin);
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDF4
ASGNF4
line 92
;92:	VectorCopy( ent->r.currentOrigin, ent->s.pos.trBase );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 36
INDIRP4
CNSTI4 496
ADDP4
INDIRB
ASGNB 12
line 93
;93:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 94
;94:}
LABELV $65
endproc G_BounceMissile 52 12
export G_HomingMissile
proc G_HomingMissile 100 12
line 98
;95:
;96:
;97:
;98:void G_HomingMissile( gentity_t *ent ) {
line 99
;99:	gentity_t	*target = NULL;
ADDRLP4 32
CNSTP4 0
ASGNP4
line 100
;100:	gentity_t	*blip = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 104
;101:	vec3_t		dir, blipdir;
;102:	vec_t		dot, cs;
;103:	qboolean	chaff;
;104:	qboolean	ignorechaff = qfalse;
ADDRLP4 44
CNSTI4 0
ASGNI4
line 106
;105:
;106:	if (ent->parent->health <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 0
GTI4 $87
line 107
;107:	{
line 108
;108:		ent->nextthink = level.time + 4000;
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 4000
ADDI4
ASGNI4
line 109
;109:		ent->think = G_ExplodeMissile;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 110
;110:		return;
ADDRGP4 $82
JUMPV
LABELV $86
line 114
;111:	}
;112:
;113:
;114:	while ((blip = findradius(blip, ent->r.currentOrigin, 2000 * 2000)) != NULL)	{
line 115
;115:			chaff = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 117
;116:
;117:			if (blip->client==NULL)			continue;
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $89
ADDRGP4 $87
JUMPV
LABELV $89
line 118
;118:			if (blip==ent->parent)			continue;
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CVPU4 4
NEU4 $91
ADDRGP4 $87
JUMPV
LABELV $91
line 119
;119:			if (blip->health<=0)			continue;
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 0
GTI4 $93
ADDRGP4 $87
JUMPV
LABELV $93
line 120
;120:			if (blip->client->sess.sessionTeam >= TEAM_SPECTATOR)
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 3
LTI4 $95
line 121
;121:				continue;
ADDRGP4 $87
JUMPV
LABELV $95
line 123
;122:
;123:			if ((g_gametype.integer == GT_TEAM || g_gametype.integer == GT_CTF) &&
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $101
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $97
LABELV $101
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $97
line 125
;124:				OnSameTeam( blip, ent->parent ) )
;125:				continue;
ADDRGP4 $87
JUMPV
LABELV $97
line 128
;126:		
;127:
;128:		if (!visible (ent, blip))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 visible
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $102
line 129
;129:			continue;
ADDRGP4 $87
JUMPV
LABELV $102
line 131
;130:
;131:		VectorSubtract(blip->r.currentOrigin, ent->r.currentOrigin, blipdir);
ADDRLP4 60
CNSTI4 496
ASGNI4
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 68
CNSTI4 500
ASGNI4
ADDRLP4 4+4
ADDRLP4 0
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 72
CNSTI4 504
ASGNI4
ADDRLP4 4+8
ADDRLP4 0
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 134
;132:
;133:		//NT - give chaff a higher weight
;134:		if (chaff)
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $106
line 135
;135:		{
line 136
;136:			VectorScale(blipdir, 0.5, blipdir);
ADDRLP4 76
CNSTF4 1056964608
ASGNF4
ADDRLP4 4
ADDRLP4 76
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 76
INDIRF4
ADDRLP4 4+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4+8
CNSTF4 1056964608
ADDRLP4 4+8
INDIRF4
MULF4
ASGNF4
line 137
;137:		}
LABELV $106
line 139
;138:
;139:		if ((target == NULL) || (VectorLength(blipdir) < VectorLength(dir)))
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $114
ADDRLP4 4
ARGP4
ADDRLP4 76
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ARGP4
ADDRLP4 80
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 76
INDIRF4
ADDRLP4 80
INDIRF4
GEF4 $112
LABELV $114
line 140
;140:		{
line 141
;141:			if (chaff)
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $115
line 142
;142:			{
line 143
;143:				VectorScale(blipdir, 2, blipdir);
ADDRLP4 84
CNSTF4 1073741824
ASGNF4
ADDRLP4 4
ADDRLP4 84
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 84
INDIRF4
ADDRLP4 4+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4+8
CNSTF4 1073741824
ADDRLP4 4+8
INDIRF4
MULF4
ASGNF4
line 144
;144:			}
LABELV $115
line 147
;145:
;146:			// E.B = |E||B|cos(theta)
;147:			dot = _DotProduct(ent->r.currentAngles, blipdir);
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 84
ADDRGP4 _DotProduct
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 84
INDIRF4
ASGNF4
line 150
;148:
;149:			// Divide E.B by |E||B| to get cos(theta)
;150:			cs = dot / (VectorLength(ent->r.currentAngles) * VectorLength(blipdir));
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 88
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 4
ARGP4
ADDRLP4 92
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 36
INDIRF4
ADDRLP4 88
INDIRF4
ADDRLP4 92
INDIRF4
MULF4
DIVF4
ASGNF4
line 153
;151:
;152:			// If angle is less than 120 degrees
;153:			if (cs > cos(120.0f * M_PI / 180.0f))
CNSTF4 1074137746
ARGF4
ADDRLP4 96
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 40
INDIRF4
ADDRLP4 96
INDIRF4
LEF4 $121
line 154
;154:			{
line 156
;155:				// We add it as our target
;156:				target = blip;
ADDRLP4 32
ADDRLP4 0
INDIRP4
ASGNP4
line 157
;157:				VectorCopy(blipdir, dir);
ADDRLP4 20
ADDRLP4 4
INDIRB
ASGNB 12
line 158
;158:			}
LABELV $121
line 159
;159:		}
LABELV $112
line 160
;160:	}
LABELV $87
line 114
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTF4 1249125376
ARGF4
ADDRLP4 48
ADDRGP4 findradius
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 48
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $86
line 162
;161:
;162:	if (target == NULL)	{
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $123
line 163
;163:		ent->nextthink = level.time + HOMING_THINK; // + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 60
ADDI4
ASGNI4
line 164
;164:		ent->think = G_HomingMissile;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 G_HomingMissile
ASGNP4
line 165
;165:	} else {
ADDRGP4 $124
JUMPV
LABELV $123
line 167
;166:		// for exact trajectory calculation, set current point to base.
;167:		VectorCopy(ent->r.currentOrigin, ent->s.pos.trBase );
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 52
INDIRP4
CNSTI4 496
ADDP4
INDIRB
ASGNB 12
line 169
;168:
;169:		VectorNormalize(dir);
ADDRLP4 20
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 171
;170:		// 0.5 is swing rate.
;171:		VectorScale(dir, 0.5, dir);
ADDRLP4 56
CNSTF4 1056964608
ASGNF4
ADDRLP4 20
ADDRLP4 56
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 56
INDIRF4
ADDRLP4 20+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 20+8
CNSTF4 1056964608
ADDRLP4 20+8
INDIRF4
MULF4
ASGNF4
line 172
;172:		VectorAdd(dir,ent->r.currentAngles,dir);
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 20
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 508
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 20+4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 512
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 20+8
ADDRLP4 20+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRF4
ADDF4
ASGNF4
line 175
;173:
;174:		// turn nozzle to target angle
;175:		VectorNormalize(dir);
ADDRLP4 20
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 176
;176:		VectorCopy(dir, ent->r.currentAngles);
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ADDRLP4 20
INDIRB
ASGNB 12
line 179
;177:
;178:		// scale direction, put into trDelta
;179:		VectorScale(dir, ent->constantSpeed, dir);
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 20
ADDRLP4 20
INDIRF4
ADDRLP4 64
INDIRP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 20+4
INDIRF4
ADDRLP4 64
INDIRP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
ADDRLP4 20+8
ADDRLP4 20+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 180
;180:		VectorCopy(dir, ent->s.pos.trDelta);
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 20
INDIRB
ASGNB 12
line 182
;181:
;182:		ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 184
;183:
;184:		SnapVector (ent->s.pos.trDelta);                      // save net bandwidth
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 68
INDIRP4
ADDRLP4 72
INDIRF4
ASGNF4
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
INDIRF4
ARGF4
ADDRLP4 80
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 76
INDIRP4
ADDRLP4 80
INDIRF4
ASGNF4
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
INDIRF4
ARGF4
ADDRLP4 88
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 84
INDIRP4
ADDRLP4 88
INDIRF4
ASGNF4
line 185
;185:		ent->nextthink = level.time + HOMING_THINK;	// decrease this value also makes fast swing
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 60
ADDI4
ASGNI4
line 186
;186:		ent->think = G_HomingMissile;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 G_HomingMissile
ASGNP4
line 187
;187:	}
LABELV $124
line 188
;188:}
LABELV $82
endproc G_HomingMissile 100 12
export G_ExplodeDevastatorFire2
proc G_ExplodeDevastatorFire2 96 24
line 197
;189:
;190:
;191:/*
;192:========================
;193:G_ExplodeDevastatorFire
;194:
;195:========================
;196:*/
;197:void G_ExplodeDevastatorFire2( gentity_t *ent ) {
line 208
;198:	vec3_t		dir;
;199:	vec3_t		origin;
;200:
;201:	//Gerbil!
;202:	vec3_t		dev1;
;203:	vec3_t		dev2;
;204:	vec3_t		dev3;
;205:	vec3_t		dev4;
;206:
;207:
;208:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 209
;209:	SnapVector( origin );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 72
INDIRF4
ASGNF4
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 76
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRLP4 80
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 80
INDIRF4
ASGNF4
line 210
;210:	G_SetOrigin( ent, origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 213
;211:
;212:	// we don't have a valid direction, so just point straight up
;213:	dir[0] = dir[1] = 0;
ADDRLP4 72
CNSTF4 0
ASGNF4
ADDRLP4 12+4
ADDRLP4 72
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 72
INDIRF4
ASGNF4
line 214
;214:	dir[2] = 10;
ADDRLP4 12+8
CNSTF4 1092616192
ASGNF4
line 216
;215:
;216:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 217
;217:	G_AddEvent( ent, EV_MISSILE_MISS, DirToByte( dir ) );
ADDRLP4 12
ARGP4
ADDRLP4 76
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 53
ARGI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 219
;218:
;219:	ent->s.time2++;
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 221
;220:	
;221:	ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 224
;222:
;223:	// splash damage
;224:	if ( ent->splashDamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $148
line 225
;225:		if( G_RadiusDamage( ent->r.currentOrigin, ent->parent, ent->splashDamage, ent->splashRadius, NULL
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 496
ADDP4
ARGP4
ADDRLP4 84
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 84
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
CVIF4 4
ARGF4
CNSTP4 0
ARGP4
ADDRLP4 84
INDIRP4
CNSTI4 772
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 G_RadiusDamage
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $150
line 226
;226:			, ent->splashMethodOfDeath ) ) {
line 228
;227:			//g_entities[ent->r.ownerNum].client->ps.persistant[PERS_ACCURACY_HITS]++;
;228:		}
LABELV $150
line 229
;229:	}
LABELV $148
line 232
;230:
;231:
;232:		VectorSet(dev1, 25, 25, (30+ irandom(10,35)));
ADDRLP4 84
CNSTF4 1103626240
ASGNF4
ADDRLP4 24
ADDRLP4 84
INDIRF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 84
INDIRF4
ASGNF4
CNSTI4 10
ARGI4
CNSTI4 35
ARGI4
ADDRLP4 88
ADDRGP4 irandom
CALLI4
ASGNI4
ADDRLP4 24+8
ADDRLP4 88
INDIRI4
CNSTI4 30
ADDI4
CVIF4 4
ASGNF4
line 233
;233:		VectorSet(dev2, -25, 25, (30+ irandom(10,35)));
ADDRLP4 36
CNSTF4 3251109888
ASGNF4
ADDRLP4 36+4
CNSTF4 1103626240
ASGNF4
CNSTI4 10
ARGI4
CNSTI4 35
ARGI4
ADDRLP4 92
ADDRGP4 irandom
CALLI4
ASGNI4
ADDRLP4 36+8
ADDRLP4 92
INDIRI4
CNSTI4 30
ADDI4
CVIF4 4
ASGNF4
line 234
;234:		fire_devparticle (ent, origin, dev1, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 24
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 fire_devparticle
CALLP4
pop
line 235
;235:		fire_devparticle (ent, origin, dev2, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 36
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 fire_devparticle
CALLP4
pop
line 238
;236:
;237:
;238:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 240
;239:	
;240:}
LABELV $140
endproc G_ExplodeDevastatorFire2 96 24
export G_ExplodeDevastatorFire
proc G_ExplodeDevastatorFire 116 24
line 243
;241:
;242:
;243:void G_ExplodeDevastatorFire( gentity_t *ent ) {
line 252
;244:	vec3_t		dir;
;245:	vec3_t		origin;
;246:	vec3_t		dev1;
;247:	vec3_t		dev2;
;248:	vec3_t		dev3;
;249:	vec3_t		dev4;
;250:
;251:
;252:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 253
;253:	SnapVector( origin );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 72
INDIRF4
ASGNF4
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 76
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRLP4 80
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 80
INDIRF4
ASGNF4
line 254
;254:	G_SetOrigin( ent, origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 257
;255:
;256:	// we don't have a valid direction, so just point straight up
;257:	dir[0] = dir[1] = 0;
ADDRLP4 72
CNSTF4 0
ASGNF4
ADDRLP4 12+4
ADDRLP4 72
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 72
INDIRF4
ASGNF4
line 258
;258:	dir[2] = 10;
ADDRLP4 12+8
CNSTF4 1092616192
ASGNF4
line 260
;259:
;260:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 261
;261:	G_AddEvent( ent, EV_MISSILE_MISS, DirToByte( dir ) );
ADDRLP4 12
ARGP4
ADDRLP4 76
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 53
ARGI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 263
;262:
;263:	ent->s.time2++;
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 265
;264:	
;265:	ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 268
;266:
;267:	// splash damage
;268:	if ( ent->splashDamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $164
line 269
;269:		if( G_RadiusDamage( ent->r.currentOrigin, ent->parent, ent->splashDamage, ent->splashRadius, NULL
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 496
ADDP4
ARGP4
ADDRLP4 84
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 84
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
CVIF4 4
ARGF4
CNSTP4 0
ARGP4
ADDRLP4 84
INDIRP4
CNSTI4 772
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 G_RadiusDamage
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $166
line 270
;270:			, ent->splashMethodOfDeath ) ) {
line 272
;271:			//g_entities[ent->r.ownerNum].client->ps.persistant[PERS_ACCURACY_HITS]++;
;272:		}
LABELV $166
line 273
;273:	}
LABELV $164
line 276
;274:
;275:
;276:		VectorSet(dev1, (25+ irandom(1,35)), (25+ irandom(10,35)), 30);
CNSTI4 1
ARGI4
CNSTI4 35
ARGI4
ADDRLP4 84
ADDRGP4 irandom
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 84
INDIRI4
CNSTI4 25
ADDI4
CVIF4 4
ASGNF4
CNSTI4 10
ARGI4
CNSTI4 35
ARGI4
ADDRLP4 88
ADDRGP4 irandom
CALLI4
ASGNI4
ADDRLP4 24+4
ADDRLP4 88
INDIRI4
CNSTI4 25
ADDI4
CVIF4 4
ASGNF4
ADDRLP4 24+8
CNSTF4 1106247680
ASGNF4
line 277
;277:		VectorSet(dev2, (-25 - irandom(1,35)), (25+ irandom(10,35)), 30);
CNSTI4 1
ARGI4
CNSTI4 35
ARGI4
ADDRLP4 92
ADDRGP4 irandom
CALLI4
ASGNI4
ADDRLP4 36
CNSTI4 -25
ADDRLP4 92
INDIRI4
SUBI4
CVIF4 4
ASGNF4
CNSTI4 10
ARGI4
CNSTI4 35
ARGI4
ADDRLP4 96
ADDRGP4 irandom
CALLI4
ASGNI4
ADDRLP4 36+4
ADDRLP4 96
INDIRI4
CNSTI4 25
ADDI4
CVIF4 4
ASGNF4
ADDRLP4 36+8
CNSTF4 1106247680
ASGNF4
line 278
;278:		VectorSet(dev3, (25 + irandom(1,35)), (-25+ irandom(10,35)), 30);
CNSTI4 1
ARGI4
CNSTI4 35
ARGI4
ADDRLP4 100
ADDRGP4 irandom
CALLI4
ASGNI4
ADDRLP4 48
ADDRLP4 100
INDIRI4
CNSTI4 25
ADDI4
CVIF4 4
ASGNF4
CNSTI4 10
ARGI4
CNSTI4 35
ARGI4
ADDRLP4 104
ADDRGP4 irandom
CALLI4
ASGNI4
ADDRLP4 48+4
ADDRLP4 104
INDIRI4
CNSTI4 -25
ADDI4
CVIF4 4
ASGNF4
ADDRLP4 48+8
CNSTF4 1106247680
ASGNF4
line 279
;279:		VectorSet(dev4, (-25 - + irandom(1,35)), (-25+ irandom(10,35)), 30);
CNSTI4 1
ARGI4
CNSTI4 35
ARGI4
ADDRLP4 108
ADDRGP4 irandom
CALLI4
ASGNI4
ADDRLP4 60
CNSTI4 -25
ADDRLP4 108
INDIRI4
SUBI4
CVIF4 4
ASGNF4
CNSTI4 10
ARGI4
CNSTI4 35
ARGI4
ADDRLP4 112
ADDRGP4 irandom
CALLI4
ASGNI4
ADDRLP4 60+4
ADDRLP4 112
INDIRI4
CNSTI4 -25
ADDI4
CVIF4 4
ASGNF4
ADDRLP4 60+8
CNSTF4 1106247680
ASGNF4
line 281
;280:		
;281:		fire_devparticle (ent, origin, dev1, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 24
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 fire_devparticle
CALLP4
pop
line 282
;282:		fire_devparticle (ent, origin, dev2, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 36
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 fire_devparticle
CALLP4
pop
line 283
;283:		fire_devparticle (ent, origin, dev3, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 48
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 fire_devparticle
CALLP4
pop
line 284
;284:		fire_devparticle (ent, origin, dev4, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 60
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 fire_devparticle
CALLP4
pop
line 286
;285:
;286:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 288
;287:	
;288:}
LABELV $156
endproc G_ExplodeDevastatorFire 116 24
export G_ExplodeMissile
proc G_ExplodeMissile 44 24
line 298
;289: 
;290:
;291:/*
;292:================
;293:G_ExplodeMissile
;294:
;295:Explode a missile without an impact
;296:================
;297:*/
;298:void G_ExplodeMissile( gentity_t *ent ) {
line 302
;299:	vec3_t		dir;
;300:	vec3_t		origin;
;301:
;302:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 303
;303:	SnapVector( origin );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 32
INDIRF4
ASGNF4
line 304
;304:	G_SetOrigin( ent, origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 307
;305:
;306:	// we don't have a valid direction, so just point straight up
;307:	dir[0] = dir[1] = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
ADDRLP4 12+4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 24
INDIRF4
ASGNF4
line 308
;308:	dir[2] = 1;
ADDRLP4 12+8
CNSTF4 1065353216
ASGNF4
line 310
;309:
;310:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 311
;311:	G_AddEvent( ent, EV_MISSILE_MISS, DirToByte( dir ) );
ADDRLP4 12
ARGP4
ADDRLP4 28
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 53
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 313
;312:
;313:	ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 316
;314:
;315:	// splash damage
;316:	if ( ent->splashDamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $184
line 317
;317:		if( G_RadiusDamage( ent->r.currentOrigin, ent->parent, ent->splashDamage, ent->splashRadius, ent
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 496
ADDP4
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 772
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 G_RadiusDamage
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $186
line 318
;318:			, ent->splashMethodOfDeath ) ) {
line 319
;319:			g_entities[ent->r.ownerNum].client->accuracy_hits++;
ADDRLP4 40
CNSTI4 872
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+524
ADDP4
INDIRP4
CNSTI4 2588
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 320
;320:		}
LABELV $186
line 321
;321:	}
LABELV $184
line 323
;322:
;323:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 325
;324:
;325:}
LABELV $176
endproc G_ExplodeMissile 44 24
export G_MissileImpact
proc G_MissileImpact 56 32
line 502
;326:
;327:
;328:#ifdef MISSIONPACK
;329:/*
;330:================
;331:ProximityMine_Explode
;332:================
;333:*/
;334:static void ProximityMine_Explode( gentity_t *mine ) {
;335:	G_ExplodeMissile( mine );
;336:	// if the prox mine has a trigger free it
;337:	if (mine->activator) {
;338:		G_FreeEntity(mine->activator);
;339:		mine->activator = NULL;
;340:	}
;341:}
;342:
;343:/*
;344:================
;345:ProximityMine_Die
;346:================
;347:*/
;348:static void ProximityMine_Die( gentity_t *ent, gentity_t *inflictor, gentity_t *attacker, int damage, int mod ) {
;349:	ent->think = ProximityMine_Explode;
;350:	ent->nextthink = level.time + 1;
;351:}
;352:
;353:/*
;354:================
;355:ProximityMine_Trigger
;356:================
;357:*/
;358:void ProximityMine_Trigger( gentity_t *trigger, gentity_t *other, trace_t *trace ) {
;359:	vec3_t		v;
;360:	gentity_t	*mine;
;361:
;362:	if( !other->client ) {
;363:		return;
;364:	}
;365:
;366:	// trigger is a cube, do a distance test now to act as if it's a sphere
;367:	VectorSubtract( trigger->s.pos.trBase, other->s.pos.trBase, v );
;368:	if( VectorLength( v ) > trigger->parent->splashRadius ) {
;369:		return;
;370:	}
;371:
;372:
;373:	if ( g_gametype.integer >= GT_TEAM ) {
;374:		// don't trigger same team mines
;375:		if (trigger->parent->s.generic1 == other->client->sess.sessionTeam) {
;376:			return;
;377:		}
;378:	}
;379:
;380:	// ok, now check for ability to damage so we don't get triggered thru walls, closed doors, etc...
;381:	if( !CanDamage( other, trigger->s.pos.trBase ) ) {
;382:		return;
;383:	}
;384:
;385:	// trigger the mine!
;386:	mine = trigger->parent;
;387:	mine->s.loopSound = 0;
;388:	G_AddEvent( mine, EV_PROXIMITY_MINE_TRIGGER, 0 );
;389:	mine->nextthink = level.time + 500;
;390:
;391:	G_FreeEntity( trigger );
;392:}
;393:
;394:/*
;395:================
;396:ProximityMine_Activate
;397:================
;398:*/
;399:static void ProximityMine_Activate( gentity_t *ent ) {
;400:	gentity_t	*trigger;
;401:	float		r;
;402:
;403:	ent->think = ProximityMine_Explode;
;404:	ent->nextthink = level.time + g_proxMineTimeout.integer;
;405:
;406:	ent->takedamage = qtrue;
;407:	ent->health = 1;
;408:	ent->die = ProximityMine_Die;
;409:
;410:	ent->s.loopSound = G_SoundIndex( "sound/weapons/proxmine/wstbtick.wav" );
;411:
;412:	// build the proximity trigger
;413:	trigger = G_Spawn ();
;414:
;415:	trigger->classname = "proxmine_trigger";
;416:
;417:	r = ent->splashRadius;
;418:	VectorSet( trigger->r.mins, -r, -r, -r );
;419:	VectorSet( trigger->r.maxs, r, r, r );
;420:
;421:	G_SetOrigin( trigger, ent->s.pos.trBase );
;422:
;423:	trigger->parent = ent;
;424:	trigger->r.contents = CONTENTS_TRIGGER;
;425:	trigger->touch = ProximityMine_Trigger;
;426:
;427:	trap_LinkEntity (trigger);
;428:
;429:	// set pointer to trigger so the entity can be freed when the mine explodes
;430:	ent->activator = trigger;
;431:}
;432:
;433:/*
;434:================
;435:ProximityMine_ExplodeOnPlayer
;436:================
;437:*/
;438:static void ProximityMine_ExplodeOnPlayer( gentity_t *mine ) {
;439:	gentity_t	*player;
;440:
;441:	player = mine->enemy;
;442:	player->client->ps.eFlags &= ~EF_TICKING;
;443:
;444:	if ( player->client->invulnerabilityTime > level.time ) {
;445:		G_Damage( player, mine->parent, mine->parent, vec3_origin, mine->s.origin, 1000, DAMAGE_NO_KNOCKBACK, MOD_JUICED );
;446:		player->client->invulnerabilityTime = 0;
;447:		G_TempEntity( player->client->ps.origin, EV_JUICED );
;448:	}
;449:	else {
;450:		G_SetOrigin( mine, player->s.pos.trBase );
;451:		// make sure the explosion gets to the client
;452:		mine->r.svFlags &= ~SVF_NOCLIENT;
;453:		mine->splashMethodOfDeath = MOD_PROXIMITY_MINE;
;454:		G_ExplodeMissile( mine );
;455:	}
;456:}
;457:
;458:/*
;459:================
;460:ProximityMine_Player
;461:================
;462:*/
;463:static void ProximityMine_Player( gentity_t *mine, gentity_t *player ) {
;464:	if( mine->s.eFlags & EF_NODRAW ) {
;465:		return;
;466:	}
;467:
;468:	G_AddEvent( mine, EV_PROXIMITY_MINE_STICK, 0 );
;469:
;470:	if( player->s.eFlags & EF_TICKING ) {
;471:		player->activator->splashDamage += mine->splashDamage;
;472:		player->activator->splashRadius *= 1.50;
;473:		mine->think = G_FreeEntity;
;474:		mine->nextthink = level.time;
;475:		return;
;476:	}
;477:
;478:	player->client->ps.eFlags |= EF_TICKING;
;479:	player->activator = mine;
;480:
;481:	mine->s.eFlags |= EF_NODRAW;
;482:	mine->r.svFlags |= SVF_NOCLIENT;
;483:	mine->s.pos.trType = TR_LINEAR;
;484:	VectorClear( mine->s.pos.trDelta );
;485:
;486:	mine->enemy = player;
;487:	mine->think = ProximityMine_ExplodeOnPlayer;
;488:	if ( player->client->invulnerabilityTime > level.time ) {
;489:		mine->nextthink = level.time + 2 * 1000;
;490:	}
;491:	else {
;492:		mine->nextthink = level.time + 10 * 1000;
;493:	}
;494:}
;495:#endif
;496:
;497:/*
;498:================
;499:G_MissileImpact
;500:================
;501:*/
;502:void G_MissileImpact( gentity_t *ent, trace_t *trace ) {
line 504
;503:	gentity_t		*other;
;504:	qboolean		hitClient = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 509
;505:#ifdef MISSIONPACK
;506:	vec3_t			forward, impactpoint, bouncedir;
;507:	int				eFlags;
;508:#endif
;509:	other = &g_entities[trace->entityNum];
ADDRLP4 0
CNSTI4 872
ADDRFP4 4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 512
;510:
;511:	// check for bounce
;512:	if ( !other->takedamage &&
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $190
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 48
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $190
line 513
;513:		( ent->s.eFlags & ( EF_BOUNCE | EF_BOUNCE_HALF ) ) ) {
line 514
;514:		G_BounceMissile( ent, trace );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_BounceMissile
CALLV
pop
line 516
;515:		
;516:		if (ent->classname == "plasma")
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 $194
CVPU4 4
NEU4 $192
line 517
;517:		{
line 518
;518:			G_AddEvent( ent, EV_PL_BOUNCE, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 46
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 519
;519:		} 
ADDRGP4 $189
JUMPV
LABELV $192
line 521
;520:		else
;521:		{
line 523
;522:			// Regular Grenade
;523:			G_AddEvent( ent, EV_GRENADE_BOUNCE, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 45
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 524
;524:		}
line 526
;525:
;526:		return;
ADDRGP4 $189
JUMPV
LABELV $190
line 551
;527:	}
;528:
;529:
;530:#ifdef MISSIONPACK
;531:	if ( other->takedamage ) {
;532:		if ( ent->s.weapon != WP_PROX_LAUNCHER ) {
;533:			if ( other->client && other->client->invulnerabilityTime > level.time ) {
;534:				//
;535:				VectorCopy( ent->s.pos.trDelta, forward );
;536:				VectorNormalize( forward );
;537:				if (G_InvulnerabilityEffect( other, forward, ent->s.pos.trBase, impactpoint, bouncedir )) {
;538:					VectorCopy( bouncedir, trace->plane.normal );
;539:					eFlags = ent->s.eFlags & EF_BOUNCE_HALF;
;540:					ent->s.eFlags &= ~EF_BOUNCE_HALF;
;541:					G_BounceMissile( ent, trace );
;542:					ent->s.eFlags |= eFlags;
;543:				}
;544:				ent->target_ent = other;
;545:				return;
;546:			}
;547:		}
;548:	}
;549:#endif
;550:	// impact damage
;551:	if (other->takedamage) {
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
CNSTI4 0
EQI4 $195
line 553
;552:		// FIXME: wrong damage direction?
;553:		if ( ent->damage ) {
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 0
EQI4 $197
line 556
;554:			vec3_t	velocity;
;555:
;556:			if( LogAccuracyHit( other, &g_entities[ent->r.ownerNum] ) ) {
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 872
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $199
line 557
;557:				g_entities[ent->r.ownerNum].client->accuracy_hits++;
ADDRLP4 28
CNSTI4 872
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+524
ADDP4
INDIRP4
CNSTI4 2588
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 558
;558:				hitClient = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 559
;559:			}
LABELV $199
line 560
;560:			BG_EvaluateTrajectoryDelta( &ent->s.pos, level.time, velocity );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BG_EvaluateTrajectoryDelta
CALLV
pop
line 561
;561:			if ( VectorLength( velocity ) == 0 ) {
ADDRLP4 12
ARGP4
ADDRLP4 28
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 28
INDIRF4
CNSTF4 0
NEF4 $203
line 562
;562:				velocity[2] = 1;	// stepped on a grenade
ADDRLP4 12+8
CNSTF4 1065353216
ASGNF4
line 563
;563:			}
LABELV $203
line 564
;564:			G_Damage (other, ent, &g_entities[ent->r.ownerNum], velocity,
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
CNSTI4 872
ADDRLP4 32
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 32
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 567
;565:				ent->s.origin, ent->damage, 
;566:				0, ent->methodOfDeath);
;567:		}
LABELV $197
line 568
;568:	}
LABELV $195
line 607
;569:
;570:#ifdef MISSIONPACK
;571:	if( ent->s.weapon == WP_PROX_LAUNCHER ) {
;572:		if( ent->s.pos.trType != TR_GRAVITY ) {
;573:			return;
;574:		}
;575:
;576:		// if it's a player, stick it on to them (flag them and remove this entity)
;577:		if( other->s.eType == ET_PLAYER && other->health > 0 ) {
;578:			ProximityMine_Player( ent, other );
;579:			return;
;580:		}
;581:
;582:		SnapVectorTowards( trace->endpos, ent->s.pos.trBase );
;583:		G_SetOrigin( ent, trace->endpos );
;584:		ent->s.pos.trType = TR_STATIONARY;
;585:		VectorClear( ent->s.pos.trDelta );
;586:
;587:		G_AddEvent( ent, EV_PROXIMITY_MINE_STICK, trace->surfaceFlags );
;588:
;589:		ent->think = ProximityMine_Activate;
;590:		ent->nextthink = level.time + 2000;
;591:
;592:		vectoangles( trace->plane.normal, ent->s.angles );
;593:		ent->s.angles[0] += 90;
;594:
;595:		// link the prox mine to the other entity
;596:		ent->enemy = other;
;597:		ent->die = ProximityMine_Die;
;598:		VectorCopy(trace->plane.normal, ent->movedir);
;599:		VectorSet(ent->r.mins, -4, -4, -4);
;600:		VectorSet(ent->r.maxs, 4, 4, 4);
;601:		trap_LinkEntity(ent);
;602:
;603:		return;
;604:	}
;605:#endif
;606:
;607:	if (!strcmp(ent->classname, "hook")) {
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRGP4 $208
ARGP4
ADDRLP4 12
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $206
line 611
;608:		gentity_t *nent;
;609:		vec3_t v;
;610:
;611:		nent = G_Spawn();
ADDRLP4 32
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 612
;612:		if ( other->takedamage && other->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
CNSTI4 0
EQI4 $209
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $209
line 614
;613:
;614:			G_AddEvent( nent, EV_MISSILE_HIT, DirToByte( trace->plane.normal ) );
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 40
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 52
ARGI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 615
;615:			nent->s.otherEntityNum = other->s.number;
ADDRLP4 16
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 617
;616:
;617:			ent->enemy = other;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 619
;618:
;619:			v[0] = other->r.currentOrigin[0] + (other->r.mins[0] + other->r.maxs[0]) * 0.5;
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 620
;620:			v[1] = other->r.currentOrigin[1] + (other->r.mins[1] + other->r.maxs[1]) * 0.5;
ADDRLP4 20+4
ADDRLP4 0
INDIRP4
CNSTI4 500
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 621
;621:			v[2] = other->r.currentOrigin[2] + (other->r.mins[2] + other->r.maxs[2]) * 0.5;
ADDRLP4 20+8
ADDRLP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 623
;622:
;623:			SnapVectorTowards( v, ent->s.pos.trBase );	// save net bandwidth
ADDRLP4 20
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 624
;624:		} else {
ADDRGP4 $210
JUMPV
LABELV $209
line 625
;625:			VectorCopy(trace->endpos, v);
ADDRLP4 20
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 626
;626:			G_AddEvent( nent, EV_MISSILE_MISS, DirToByte( trace->plane.normal ) );
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 40
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 53
ARGI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 627
;627:			ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
CNSTP4 0
ASGNP4
line 628
;628:		}
LABELV $210
line 630
;629:
;630:		SnapVectorTowards( v, ent->s.pos.trBase );	// save net bandwidth
ADDRLP4 20
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 632
;631:
;632:		nent->freeAfterEvent = qtrue;
ADDRLP4 16
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 634
;633:		// change over to a normal entity right at the point of impact
;634:		nent->s.eType = ET_GENERAL;
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 635
;635:		ent->s.eType = ET_GRAPPLE;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 11
ASGNI4
line 637
;636:
;637:		G_SetOrigin( ent, v );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 638
;638:		G_SetOrigin( nent, v );
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 640
;639:
;640:		ent->think = Weapon_HookThink;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Weapon_HookThink
ASGNP4
line 641
;641:		ent->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 643
;642:
;643:		ent->parent->client->ps.pm_flags |= PMF_GRAPPLE_PULL;
ADDRLP4 40
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
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 644
;644:		VectorCopy( ent->r.currentOrigin, ent->parent->client->ps.grapplePoint);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 496
ADDP4
INDIRB
ASGNB 12
line 646
;645:
;646:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 647
;647:		trap_LinkEntity( nent );
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 649
;648:
;649:		return;
ADDRGP4 $189
JUMPV
LABELV $206
line 655
;650:	}
;651:
;652:	// is it cheaper in bandwidth to just remove this ent and create a new
;653:	// one, rather than changing the missile into the explosion?
;654:
;655:	if ( other->takedamage && other->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
CNSTI4 0
EQI4 $214
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $214
line 656
;656:		G_AddEvent( ent, EV_MISSILE_HIT, DirToByte( trace->plane.normal ) );
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 52
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 657
;657:		ent->s.otherEntityNum = other->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 658
;658:	} else if( trace->surfaceFlags & SURF_METALSTEPS ) {
ADDRGP4 $215
JUMPV
LABELV $214
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $216
line 659
;659:		G_AddEvent( ent, EV_MISSILE_MISS_METAL, DirToByte( trace->plane.normal ) );
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 54
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 660
;660:	} else {
ADDRGP4 $217
JUMPV
LABELV $216
line 661
;661:		G_AddEvent( ent, EV_MISSILE_MISS, DirToByte( trace->plane.normal ) );
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 53
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 662
;662:	}
LABELV $217
LABELV $215
line 664
;663:
;664:	ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 667
;665:
;666:	// change over to a normal entity right at the point of impact
;667:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 669
;668:
;669:	SnapVectorTowards( trace->endpos, ent->s.pos.trBase );	// save net bandwidth
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 671
;670:
;671:	G_SetOrigin( ent, trace->endpos );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 674
;672:
;673:	// splash damage (doesn't apply to person directly hit)
;674:	if ( ent->splashDamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $218
line 675
;675:		if( G_RadiusDamage( trace->endpos, ent->parent, ent->splashDamage, ent->splashRadius, 
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 772
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 G_RadiusDamage
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $220
line 676
;676:			other, ent->splashMethodOfDeath ) ) {
line 677
;677:			if( !hitClient ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $222
line 678
;678:				g_entities[ent->r.ownerNum].client->accuracy_hits++;
ADDRLP4 28
CNSTI4 872
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+524
ADDP4
INDIRP4
CNSTI4 2588
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 679
;679:			}
LABELV $222
line 680
;680:		}
LABELV $220
line 681
;681:	}
LABELV $218
line 683
;682:
;683:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 684
;684:}
LABELV $189
endproc G_MissileImpact 56 32
export G_RunMissile
proc G_RunMissile 88 28
line 691
;685:
;686:/*
;687:================
;688:G_RunMissile
;689:================
;690:*/
;691:void G_RunMissile( gentity_t *ent ) {
line 697
;692:	vec3_t		origin;
;693:	trace_t		tr;
;694:	int			passent;
;695:
;696:	
;697:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 60
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 701
;698:
;699:
;700:	// if this missile bounced off an invulnerability sphere
;701:	if ( ent->target_ent ) {
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $227
line 702
;702:		passent = ent->target_ent->s.number;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRP4
INDIRI4
ASGNI4
line 703
;703:	}
ADDRGP4 $228
JUMPV
LABELV $227
line 710
;704:#ifdef MISSIONPACK
;705:	// prox mines that left the owner bbox will attach to anything, even the owner
;706:	else if (ent->s.weapon == WP_PROX_LAUNCHER && ent->count) {
;707:		passent = ENTITYNUM_NONE;
;708:	}
;709:#endif
;710:	else {
line 712
;711:		// ignore interactions with the missile owner
;712:		passent = ent->r.ownerNum;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ASGNI4
line 713
;713:	}
LABELV $228
line 715
;714:	// trace a line from the previous position to the current position
;715:	trap_Trace( &tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, origin, passent, ent->clipmask );
ADDRLP4 0
ARGP4
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 496
ADDP4
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 444
ADDP4
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 456
ADDP4
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 72
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 717
;716:
;717:	if ( tr.startsolid || tr.allsolid ) {
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 76
INDIRI4
NEI4 $232
ADDRLP4 0
INDIRI4
ADDRLP4 76
INDIRI4
EQI4 $229
LABELV $232
line 719
;718:		// make sure the tr.entityNum is set to the entity we're stuck in
;719:		trap_Trace( &tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, ent->r.currentOrigin, passent, ent->clipmask );
ADDRLP4 0
ARGP4
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
ADDRLP4 80
INDIRP4
CNSTI4 496
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
CNSTI4 444
ADDP4
ARGP4
ADDRLP4 80
INDIRP4
CNSTI4 456
ADDP4
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 80
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 720
;720:		tr.fraction = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 721
;721:	}
ADDRGP4 $230
JUMPV
LABELV $229
line 722
;722:	else {
line 723
;723:		VectorCopy( tr.endpos, ent->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 724
;724:	}
LABELV $230
line 726
;725:
;726:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 728
;727:
;728:	if ( tr.fraction != 1 ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $235
line 730
;729:		// never explode or bounce on sky
;730:		if ( tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $238
line 738
;731:			// If grapple, reset owner
;732:			/* Shafe - Trep - Comment this out for offhand grapple
;733:			if (ent->parent && ent->parent->client && ent->parent->client->hook == ent) {
;734:				ent->parent->client->hook = NULL;
;735:			}
;736:			*/
;737:			// Shafe - Trep - Offhand Grappling Hook
;738:			if (g_gametype.integer != GT_CTF) 
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
EQI4 $241
line 739
;739:			{
line 740
;740:				if (ent->parent && ent->parent->client->hook == ent)
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
ADDRLP4 80
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $244
ADDRLP4 84
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2632
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 80
INDIRP4
CVPU4 4
NEU4 $244
line 741
;741:				{
line 742
;742:					ent->parent->client->hook = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2632
ADDP4
CNSTP4 0
ASGNP4
line 743
;743:					ent->parent->client->hookhasbeenfired = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2636
ADDP4
CNSTI4 0
ASGNI4
line 744
;744:					ent->parent->client->fireHeld = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2628
ADDP4
CNSTI4 0
ASGNI4
line 745
;745:				}
LABELV $244
line 746
;746:			}
LABELV $241
line 749
;747:			// End Shafe
;748:
;749:			G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 750
;750:			return;
ADDRGP4 $225
JUMPV
LABELV $238
line 752
;751:		}
;752:		G_MissileImpact( ent, &tr );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_MissileImpact
CALLV
pop
line 753
;753:		if ( ent->s.eType != ET_MISSILE ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $246
line 754
;754:			return;		// exploded
ADDRGP4 $225
JUMPV
LABELV $246
line 756
;755:		}
;756:	}
LABELV $235
line 768
;757:#ifdef MISSIONPACK
;758:	// if the prox mine wasn't yet outside the player body
;759:	if (ent->s.weapon == WP_PROX_LAUNCHER && !ent->count) {
;760:		// check if the prox mine is outside the owner bbox
;761:		trap_Trace( &tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, ent->r.currentOrigin, ENTITYNUM_NONE, ent->clipmask );
;762:		if (!tr.startsolid || tr.entityNum != ent->r.ownerNum) {
;763:			ent->count = 1;
;764:		}
;765:	}
;766:#endif
;767:	// check think function after bouncing
;768:	G_RunThink( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 769
;769:}
LABELV $225
endproc G_RunMissile 88 28
export fire_plasma
proc fire_plasma 32 4
line 780
;770:
;771:
;772://=============================================================================
;773:
;774:/*
;775:=================
;776:fire_plasma
;777:
;778:=================
;779:*/
;780:gentity_t *fire_plasma (gentity_t *self, vec3_t start, vec3_t dir) {
line 783
;781:	gentity_t	*bolt;
;782:
;783:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 785
;784:
;785:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 786
;786:	bolt->classname = "plasma";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $194
ASGNP4
line 787
;787:	bolt->nextthink = level.time + 1200; //10000;
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1200
ADDI4
ASGNI4
line 788
;788:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 789
;789:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 790
;790:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 791
;791:	bolt->s.weapon = WP_PLASMAGUN;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 8
ASGNI4
line 792
;792:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 795
;793://unlagged - projectile nudge
;794:	// we'll need this for nudging projectiles later
;795:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 797
;796://unlagged - projectile nudge
;797:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 798
;798:	bolt->damage = 20;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 20
ASGNI4
line 799
;799:	bolt->splashDamage = 15;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 15
ASGNI4
line 800
;800:	bolt->splashRadius = 20;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 20
ASGNI4
line 801
;801:	bolt->methodOfDeath = MOD_PLASMA;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 8
ASGNI4
line 802
;802:	bolt->splashMethodOfDeath = MOD_PLASMA_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 9
ASGNI4
line 803
;803:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 804
;804:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 807
;805:
;806:	// Shafe - Make it bounce
;807:	bolt->s.eFlags = EF_BOUNCE;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 16
ASGNI4
line 809
;808:
;809:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 810
;810:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 811
;811:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 812
;812:	VectorScale( dir, 2000, bolt->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1157234688
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1157234688
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1157234688
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 813
;813:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 36
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
CNSTI4 40
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
CNSTI4 44
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
line 815
;814:
;815:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 817
;816:
;817:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $248
endproc fire_plasma 32 4
export G_ExplodePDGrenade
proc G_ExplodePDGrenade 8 8
line 825
;818:}	
;819:
;820://=============================================================================
;821:
;822:
;823:
;824:// Shafe - Trep 
;825:void G_ExplodePDGrenade( gentity_t *ent ) {
line 827
;826: 
;827:	if (ent->parent->istelepoint != 0)
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
CNSTI4 0
EQI4 $252
line 828
;828:	{
line 829
;829:		trap_SendServerCommand( ent->r.ownerNum, va("cp \"^9PDG Lock Expired!\n\"") );
ADDRGP4 $254
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 830
;830:	}
LABELV $252
line 831
;831:	ent->parent->istelepoint = 0; // client cannot teleport
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 832
ADDP4
CNSTI4 0
ASGNI4
line 832
;832: 	VectorClear( ent->parent->teleloc ); // clear the teleport location
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 828
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 824
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 820
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 835
;833:	//G_Printf( S_COLOR_GREEN "Particle Displacement Grenade Expired\n" );
;834:	
;835:	G_ExplodeMissile( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_ExplodeMissile
CALLV
pop
line 836
;836:}
LABELV $251
endproc G_ExplodePDGrenade 8 8
export fire_pdgrenade
proc fire_pdgrenade 36 4
line 843
;837:/*
;838:=================
;839: fire_pdgrenade
;840: Shafe - Trep 
;841:=================
;842:*/
;843:gentity_t *fire_pdgrenade (gentity_t *self, vec3_t start, vec3_t dir) {
line 847
;844:	gentity_t	*bolt;
;845:	//vec3_t		mins = { -8, -8, -8 }, maxs = { 8, 8, 8 };
;846:
;847:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 849
;848: 
;849:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 850
;850:	bolt->classname = "pdgrenade";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $79
ASGNP4
line 851
;851:	bolt->nextthink = level.time + 30000;
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 30000
ADDI4
ASGNI4
line 852
;852:	bolt->think = G_ExplodePDGrenade;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 G_ExplodePDGrenade
ASGNP4
line 853
;853:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 856
;854:	//tr.surfaceFlags & SURF_NOIMPACT
;855:	
;856:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 857
;857:	bolt->s.weapon = WP_GRENADE_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 4
ASGNI4
line 858
;858:	bolt->s.eFlags = EF_BOUNCE_HALF;  // Get rid of this for no bounce
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 32
ASGNI4
line 859
;859:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 863
;860:
;861:	//unlagged - projectile nudge
;862:	// we'll need this for nudging projectiles later
;863:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 865
;864:	//unlagged - projectile nudge
;865:	bolt->s.eFlags |= EF_ALT_FIRING;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 866
;866:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 867
;867:	bolt->damage = 1;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 1
ASGNI4
line 868
;868:	bolt->splashDamage = 0;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 0
ASGNI4
line 869
;869:	bolt->splashRadius = 0;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 0
ASGNI4
line 870
;870:	bolt->methodOfDeath = MOD_GRENADE;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 4
ASGNI4
line 871
;871:	bolt->splashMethodOfDeath = MOD_GRENADE_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 5
ASGNI4
line 872
;872:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 875
;873: 
;874:	// Health? Think it'll work?
;875:	bolt->takedamage=qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 1
ASGNI4
line 876
;876:	bolt->health = 35;
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 35
ASGNI4
line 877
;877:	bolt->die = pdg_explode;
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 pdg_explode
ASGNP4
line 879
;878:
;879:	bolt->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 880
;880:	 bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 881
;881:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 882
;882:	VectorScale( dir, 700, bolt->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1143930880
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1143930880
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1143930880
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 883
;883:	SnapVector( bolt->s.pos.trDelta );// save net bandwidth
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRF4
ASGNF4
line 885
;884: 
;885:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 887
;886: 
;887: return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $255
endproc fire_pdgrenade 36 4
export fire_grenade
proc fire_grenade 32 4
line 895
;888:}
;889:
;890:/*
;891:=================
;892:fire_grenade
;893:=================
;894:*/
;895:gentity_t *fire_grenade (gentity_t *self, vec3_t start, vec3_t dir) {
line 898
;896:	gentity_t	*bolt;
;897:
;898:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 900
;899:
;900:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 901
;901:	bolt->classname = "grenade";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $259
ASGNP4
line 902
;902:	bolt->nextthink = level.time + 2500;
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2500
ADDI4
ASGNI4
line 903
;903:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 904
;904:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 905
;905:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 906
;906:	bolt->s.weapon = WP_GRENADE_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 4
ASGNI4
line 907
;907:	bolt->s.eFlags = EF_BOUNCE_HALF;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 32
ASGNI4
line 908
;908:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 911
;909://unlagged - projectile nudge
;910:	// we'll need this for nudging projectiles later
;911:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 913
;912://unlagged - projectile nudge
;913:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 914
;914:	bolt->damage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 100
ASGNI4
line 915
;915:	bolt->splashDamage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 100
ASGNI4
line 916
;916:	bolt->splashRadius = 150;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 150
ASGNI4
line 917
;917:	bolt->methodOfDeath = MOD_GRENADE;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 4
ASGNI4
line 918
;918:	bolt->splashMethodOfDeath = MOD_GRENADE_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 5
ASGNI4
line 919
;919:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 920
;920:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 922
;921:
;922:	bolt->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 923
;923:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 924
;924:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 925
;925:	VectorScale( dir, 700, bolt->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1143930880
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1143930880
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1143930880
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 926
;926:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 36
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
CNSTI4 40
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
CNSTI4 44
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
line 928
;927:
;928:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 930
;929:
;930:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $258
endproc fire_grenade 32 4
export fire_flame
proc fire_flame 32 4
line 941
;931:}
;932:
;933://=============================================================================
;934:
;935:/*
;936:=================
;937:fire_flame
;938:Shafe - Trep - Flame Thrower
;939:=================
;940:*/
;941:gentity_t *fire_flame (gentity_t *self, vec3_t start, vec3_t dir, qboolean alt) {
line 945
;942:
;943:	gentity_t	*bolt;
;944:
;945:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 947
;946:
;947:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 948
;948:	bolt->classname = "flame";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $263
ASGNP4
line 949
;949:	bolt->nextthink = level.time + 1500;
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 950
;950:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 951
;951:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 952
;952:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 953
;953:	bolt->s.weapon = WP_LIGHTNING;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 6
ASGNI4
line 954
;954:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 957
;955://unlagged - projectile nudge
;956:	// we'll need this for nudging projectiles later
;957:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 959
;958://unlagged - projectile nudge
;959:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 962
;960:	
;961:	
;962:	if (alt == qfalse ) 
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $265
line 963
;963:	{
line 964
;964:		bolt->methodOfDeath = MOD_ALTFLAMER;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 26
ASGNI4
line 965
;965:		bolt->damage = 70;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 70
ASGNI4
line 966
;966:		bolt->splashDamage = 55;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 55
ASGNI4
line 967
;967:		bolt->splashRadius = 55;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 55
ASGNI4
line 968
;968:	} else
ADDRGP4 $266
JUMPV
LABELV $265
line 969
;969:	{
line 970
;970:		bolt->methodOfDeath = MOD_ALTFLAMER;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 26
ASGNI4
line 971
;971:		bolt->damage = 30;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 30
ASGNI4
line 972
;972:		bolt->splashDamage = 25;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 25
ASGNI4
line 973
;973:		bolt->splashRadius = 45;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 45
ASGNI4
line 974
;974:		bolt->s.eFlags |= EF_ALT_FIRING;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 975
;975:	}
LABELV $266
line 977
;976:
;977:	bolt->splashMethodOfDeath = MOD_ALTFLAMER;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 26
ASGNI4
line 978
;978:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 980
;979:
;980:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 981
;981:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 982
;982:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 983
;983:	VectorScale( dir, 300, bolt->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1133903872
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1133903872
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1133903872
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 984
;984:	SnapVector( bolt->s.pos.trDelta );// save net bandwidth
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 36
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
CNSTI4 40
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
CNSTI4 44
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
line 986
;985:
;986:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 988
;987:
;988:return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $262
endproc fire_flame 32 4
export fire_altgrenade
proc fire_altgrenade 36 4
line 1002
;989:}
;990:
;991:
;992:
;993:
;994:
;995:
;996:/*
;997:=================
;998:fire_altgrenade
;999:Shafe - Trep - Sticky Grenades for Alt
;1000:=================
;1001:*/
;1002:gentity_t *fire_altgrenade (gentity_t *self, vec3_t start, vec3_t dir) {
line 1005
;1003:	gentity_t	*bolt;
;1004:
;1005:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1007
;1006:
;1007:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1008
;1008:	bolt->classname = "grenade";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $259
ASGNP4
line 1009
;1009:	bolt->nextthink = level.time + 2500;
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2500
ADDI4
ASGNI4
line 1010
;1010:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 1011
;1011:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1012
;1012:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1013
;1013:	bolt->s.weapon = WP_GRENADE_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 4
ASGNI4
line 1015
;1014://	bolt->s.eFlags = EF_BOUNCE_HALF;  // Simple Change
;1015:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1018
;1016://unlagged - projectile nudge
;1017:	// we'll need this for nudging projectiles later
;1018:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1020
;1019://unlagged - projectile nudge
;1020:	bolt->s.eFlags |= EF_ALT_FIRING;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 1021
;1021:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1022
;1022:	bolt->damage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 100
ASGNI4
line 1023
;1023:	bolt->splashDamage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 100
ASGNI4
line 1024
;1024:	bolt->splashRadius = 150;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 150
ASGNI4
line 1025
;1025:	bolt->methodOfDeath = MOD_GRENADE;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 4
ASGNI4
line 1026
;1026:	bolt->splashMethodOfDeath = MOD_GRENADE_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 5
ASGNI4
line 1027
;1027:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1028
;1028:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1030
;1029:
;1030:	bolt->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 1031
;1031:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1032
;1032:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1033
;1033:	VectorScale( dir, 700, bolt->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1143930880
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1143930880
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1143930880
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 1034
;1034:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRF4
ASGNF4
line 1036
;1035:
;1036:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1038
;1037:
;1038:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $268
endproc fire_altgrenade 36 4
export fire_devparticle
proc fire_devparticle 36 4
line 1050
;1039:}
;1040:
;1041://=============================================================================
;1042:
;1043:
;1044:
;1045:/*
;1046:=================
;1047:fire_devparticle
;1048:=================
;1049:*/
;1050:gentity_t *fire_devparticle (gentity_t *self, vec3_t start, vec3_t dir, qboolean alt) {
line 1053
;1051:	gentity_t	*bolt;
;1052:	//int			speed;
;1053:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1055
;1054:
;1055:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1056
;1056:	bolt->classname = "bfg";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $272
ASGNP4
line 1058
;1057:
;1058:	if (alt == qfalse)
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $273
line 1059
;1059:	{
line 1060
;1060:	bolt->think = G_ExplodeDevastatorFire2;	
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 G_ExplodeDevastatorFire2
ASGNP4
line 1061
;1061:	bolt->nextthink = level.time + 1500;
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 1062
;1062:	} else {
ADDRGP4 $274
JUMPV
LABELV $273
line 1063
;1063:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 1064
;1064:	bolt->nextthink = level.time + 9000;
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 9000
ADDI4
ASGNI4
line 1065
;1065:	}
LABELV $274
line 1068
;1066:	
;1067:
;1068:	bolt->s.eFlags |= EF_ALT_FIRING;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 1069
;1069:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1071
;1070:	//bolt->s.eFlags = EF_BOUNCE_HALF;
;1071:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1072
;1072:	bolt->s.weapon = WP_BFG;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 9
ASGNI4
line 1073
;1073:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1076
;1074://unlagged - projectile nudge
;1075:	// we'll need this for nudging projectiles later
;1076:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1078
;1077://unlagged - projectile nudge
;1078:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1080
;1079:	
;1080:	bolt->methodOfDeath = MOD_BFG;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 12
ASGNI4
line 1081
;1081:	bolt->splashMethodOfDeath = MOD_BFG_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 13
ASGNI4
line 1082
;1082:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1083
;1083:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1084
;1084:	bolt->s.pos.trType = TR_ORBITAL;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 6
ASGNI4
line 1085
;1085:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1087
;1086:
;1087:	bolt->damage = 500;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 500
ASGNI4
line 1088
;1088:	bolt->splashDamage = 300;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 300
ASGNI4
line 1089
;1089:	bolt->splashRadius = 420;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 420
ASGNI4
line 1090
;1090:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1091
;1091:	VectorScale( dir, 60, bolt->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1114636288
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1114636288
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1114636288
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 1093
;1092:
;1093:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRF4
ASGNF4
line 1094
;1094:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1096
;1095:
;1096:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $271
endproc fire_devparticle 36 4
export fire_bfg
proc fire_bfg 32 4
line 1107
;1097:
;1098:
;1099:}
;1100:
;1101:
;1102:/*
;1103:=================
;1104:fire_bfg
;1105:=================
;1106:*/
;1107:gentity_t *fire_bfg (gentity_t *self, vec3_t start, vec3_t dir, qboolean alt) {
line 1110
;1108:	gentity_t	*bolt;
;1109:	//int			speed;
;1110:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1112
;1111:
;1112:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1113
;1113:	bolt->classname = "bfg";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $272
ASGNP4
line 1114
;1114:	bolt->s.time2 = 0;
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 1115
;1115:	bolt->nextthink = level.time + 3000;
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 1117
;1116:	
;1117:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1118
;1118:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1119
;1119:	bolt->s.weapon = WP_BFG;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 9
ASGNI4
line 1120
;1120:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1123
;1121://unlagged - projectile nudge
;1122:	// we'll need this for nudging projectiles later
;1123:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1125
;1124://unlagged - projectile nudge
;1125:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1127
;1126:	
;1127:	bolt->methodOfDeath = MOD_BFG;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 12
ASGNI4
line 1128
;1128:	bolt->splashMethodOfDeath = MOD_BFG_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 13
ASGNI4
line 1129
;1129:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1130
;1130:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1131
;1131:	bolt->s.pos.trType = TR_ORBITAL;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 6
ASGNI4
line 1132
;1132:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1134
;1133:
;1134:	if (alt == qtrue)
ADDRFP4 12
INDIRI4
CNSTI4 1
NEI4 $281
line 1135
;1135:	{
line 1137
;1136:		// Alt Fire
;1137:		bolt->damage = 500;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 500
ASGNI4
line 1138
;1138:		bolt->splashDamage = 300;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 300
ASGNI4
line 1139
;1139:		bolt->splashRadius = 420;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 420
ASGNI4
line 1140
;1140:		bolt->s.eFlags |= EF_ALT_FIRING;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 1141
;1141:		bolt->think = G_ExplodeDevastatorFire;		
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 G_ExplodeDevastatorFire
ASGNP4
line 1142
;1142:		VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1143
;1143:		VectorScale( dir, 325, bolt->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1134723072
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1134723072
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1134723072
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 1146
;1144:		
;1145:	
;1146:	} 
ADDRGP4 $282
JUMPV
LABELV $281
line 1148
;1147:	else
;1148:	{
line 1151
;1149:		// Regular Fire
;1150:
;1151:		bolt->damage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 100
ASGNI4
line 1152
;1152:		bolt->splashDamage = 200;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 200
ASGNI4
line 1153
;1153:		bolt->splashRadius = 220;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 220
ASGNI4
line 1154
;1154:		bolt->think = G_HomingMissile;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 G_HomingMissile
ASGNP4
line 1155
;1155:		VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1156
;1156:		VectorScale( dir, 325, bolt->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1134723072
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1134723072
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1134723072
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 1158
;1157:
;1158:	}
LABELV $282
line 1161
;1159:
;1160:	
;1161:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 36
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
CNSTI4 40
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
CNSTI4 44
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
line 1162
;1162:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1164
;1163:
;1164:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $278
endproc fire_bfg 32 4
export fire_rocket
proc fire_rocket 32 4
line 1177
;1165:
;1166:
;1167:}
;1168:
;1169://=============================================================================
;1170:
;1171:
;1172:/*
;1173:=================
;1174:fire_rocket
;1175:=================
;1176:*/
;1177:gentity_t *fire_rocket (gentity_t *self, vec3_t start, vec3_t dir) {
line 1180
;1178:	gentity_t	*bolt;
;1179:
;1180:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1182
;1181:
;1182:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1183
;1183:	bolt->classname = "rocket";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $284
ASGNP4
line 1184
;1184:	bolt->nextthink = level.time + 15000;
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 15000
ADDI4
ASGNI4
line 1185
;1185:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 1186
;1186:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1187
;1187:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1188
;1188:	bolt->s.weapon = WP_ROCKET_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 5
ASGNI4
line 1189
;1189:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1192
;1190://unlagged - projectile nudge
;1191:	// we'll need this for nudging projectiles later
;1192:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1194
;1193://unlagged - projectile nudge
;1194:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1195
;1195:	bolt->damage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 100
ASGNI4
line 1196
;1196:	bolt->splashDamage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 100
ASGNI4
line 1197
;1197:	bolt->splashRadius = 120;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 120
ASGNI4
line 1198
;1198:	bolt->methodOfDeath = MOD_ROCKET;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 6
ASGNI4
line 1199
;1199:	bolt->splashMethodOfDeath = MOD_ROCKET_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 7
ASGNI4
line 1200
;1200:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1201
;1201:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1203
;1202:
;1203:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 1204
;1204:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1205
;1205:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1206
;1206:	VectorScale( dir, 900, bolt->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1147207680
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1147207680
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1147207680
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 1207
;1207:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 36
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
CNSTI4 40
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
CNSTI4 44
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
line 1208
;1208:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1210
;1209:
;1210:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $283
endproc fire_rocket 32 4
lit
align 4
LABELV $288
byte 4 3238002688
byte 4 3238002688
byte 4 3238002688
align 4
LABELV $289
byte 4 1090519040
byte 4 1090519040
byte 4 1090519040
export fire_alt_rocket
code
proc fire_alt_rocket 72 4
line 1219
;1211:}
;1212:
;1213:
;1214:/*
;1215:=================
;1216:fire_alt_rocket
;1217:=================
;1218:*/
;1219:gentity_t *fire_alt_rocket (gentity_t *self, vec3_t start, vec3_t dir) {
line 1221
;1220:	gentity_t	*bolt;
;1221:	vec3_t		mins = { -8, -8, -8 }, maxs = { 8, 8, 8 };
ADDRLP4 4
ADDRGP4 $288
INDIRB
ASGNB 12
ADDRLP4 16
ADDRGP4 $289
INDIRB
ASGNB 12
line 1223
;1222:
;1223:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1225
;1224:
;1225:	bolt = G_Spawn();
ADDRLP4 28
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 1226
;1226:	bolt->classname = "rocket";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $284
ASGNP4
line 1227
;1227:	bolt->think = G_HomingMissile;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 G_HomingMissile
ASGNP4
line 1228
;1228:	bolt->nextthink = level.time + FIRST_HOMING_THINK;
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 1229
;1229:	bolt->lastthinktime = level.time + 15000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 15000
ADDI4
ASGNI4
line 1230
;1230:	bolt->lastthink = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 1231
;1231:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1232
;1232:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1233
;1233:	bolt->s.weapon = WP_ROCKET_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 5
ASGNI4
line 1234
;1234:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1237
;1235:	//unlagged - projectile nudge
;1236:	// we'll need this for nudging projectiles later
;1237:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1239
;1238:	//unlagged - projectile nudge
;1239:	bolt->s.eFlags |= EF_ALT_FIRING;
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 1240
;1240:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1241
;1241:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1242
;1242:	bolt->damage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 100
ASGNI4
line 1243
;1243:	bolt->splashDamage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 100
ASGNI4
line 1244
;1244:	bolt->splashRadius = 120;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 120
ASGNI4
line 1245
;1245:	bolt->methodOfDeath = MOD_ROCKET;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 6
ASGNI4
line 1246
;1246:	bolt->splashMethodOfDeath = MOD_ROCKET_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 7
ASGNI4
line 1247
;1247:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1248
;1248:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1249
;1249:	bolt->s.otherEntityNum2 = ENTITYNUM_WORLD;
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1022
ASGNI4
line 1253
;1250:
;1251:
;1252:
;1253:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 1254
;1254:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1255
;1255:	bolt->constantSpeed = HOMING_MISSILE_SPEED;
ADDRLP4 0
INDIRP4
CNSTI4 844
ADDP4
CNSTI4 800
ASGNI4
line 1256
;1256:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1257
;1257:	VectorScale( dir, bolt->constantSpeed, bolt->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 1258
;1258:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
ADDRLP4 48
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
INDIRF4
ARGF4
ADDRLP4 52
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 48
INDIRP4
ADDRLP4 52
INDIRF4
ASGNF4
ADDRLP4 56
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
INDIRF4
ARGF4
ADDRLP4 60
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 56
INDIRP4
ADDRLP4 60
INDIRF4
ASGNF4
ADDRLP4 64
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
INDIRF4
ARGF4
ADDRLP4 68
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 64
INDIRP4
ADDRLP4 68
INDIRF4
ASGNF4
line 1259
;1259:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1260
;1260:	VectorCopy (dir, bolt->r.currentAngles);		// this is new line.
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 1262
;1261:
;1262:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $287
endproc fire_alt_rocket 72 4
export fire_mg
proc fire_mg 32 4
line 1272
;1263:}
;1264:
;1265:
;1266:/*
;1267:=================
;1268:fire_mg
;1269:
;1270:=================
;1271:*/
;1272:gentity_t *fire_mg (gentity_t *self, vec3_t start, vec3_t dir, qboolean alt) {
line 1275
;1273:	gentity_t	*bolt;
;1274:
;1275:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1277
;1276:
;1277:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1278
;1278:	bolt->classname = "machinegun";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $294
ASGNP4
line 1279
;1279:	bolt->nextthink = level.time + 10000;
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 1280
;1280:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 1281
;1281:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1282
;1282:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1283
;1283:	bolt->s.weapon = WP_TURRET;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 11
ASGNI4
line 1284
;1284:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1287
;1285:	//unlagged - projectile nudge
;1286:	// we'll need this for nudging projectiles later
;1287:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1289
;1288:	//unlagged - projectile nudge
;1289:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1291
;1290:	
;1291:	if (alt == qtrue)
ADDRFP4 12
INDIRI4
CNSTI4 1
NEI4 $296
line 1292
;1292:	{
line 1293
;1293:		bolt->damage = 30;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 30
ASGNI4
line 1294
;1294:		bolt->splashDamage = 15;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 15
ASGNI4
line 1295
;1295:		bolt->splashRadius = 20;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 20
ASGNI4
line 1297
;1296:		//bolt->s.time2 = 555; // 555 is alt fire?
;1297:		bolt->s.eFlags |= EF_ALT_FIRING;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 1299
;1298:
;1299:	} 
ADDRGP4 $297
JUMPV
LABELV $296
line 1301
;1300:	else
;1301:	{
line 1302
;1302:		bolt->damage = 10;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 10
ASGNI4
line 1303
;1303:		bolt->splashDamage = 5;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 5
ASGNI4
line 1304
;1304:		bolt->splashRadius = 10;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 10
ASGNI4
line 1305
;1305:	}
LABELV $297
line 1306
;1306:	bolt->methodOfDeath = MOD_MACHINEGUN;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 3
ASGNI4
line 1307
;1307:	bolt->splashMethodOfDeath = MOD_MACHINEGUN;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 3
ASGNI4
line 1308
;1308:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1309
;1309:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1311
;1310:
;1311:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 1312
;1312:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1313
;1313:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1314
;1314:   	VectorScale( dir, 2000, bolt->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1157234688
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1157234688
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1157234688
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 1315
;1315:   	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 36
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
CNSTI4 40
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
CNSTI4 44
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
line 1317
;1316:   
;1317:   	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1319
;1318:   
;1319:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $293
endproc fire_mg 32 4
export fire_turret
proc fire_turret 32 4
line 1328
;1320:}
;1321:
;1322:/*
;1323:=================
;1324:fire_turret
;1325:
;1326:=================
;1327:*/
;1328:gentity_t *fire_turret (gentity_t *self, vec3_t start, vec3_t dir) {
line 1331
;1329:	gentity_t	*bolt;
;1330:
;1331:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1333
;1332:
;1333:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1334
;1334:	bolt->classname = "plasma";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $194
ASGNP4
line 1335
;1335:	bolt->nextthink = level.time + 10000;
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 1336
;1336:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 1337
;1337:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1338
;1338:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1339
;1339:	bolt->s.weapon = WP_TURRET;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 11
ASGNI4
line 1340
;1340:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1343
;1341:	//unlagged - projectile nudge
;1342:	// we'll need this for nudging projectiles later
;1343:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1345
;1344:	//unlagged - projectile nudge
;1345:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1346
;1346:	bolt->damage = 20;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 20
ASGNI4
line 1347
;1347:	bolt->splashDamage = 15;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 15
ASGNI4
line 1348
;1348:	bolt->splashRadius = 20;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 20
ASGNI4
line 1349
;1349:	bolt->methodOfDeath = MOD_TURRET;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 24
ASGNI4
line 1350
;1350:	bolt->splashMethodOfDeath = MOD_TURRET;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 24
ASGNI4
line 1351
;1351:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1352
;1352:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1354
;1353:
;1354:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 1355
;1355:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1356
;1356:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1357
;1357:   	VectorScale( dir, 2000, bolt->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1157234688
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1157234688
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1157234688
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 1358
;1358:   	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 36
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
CNSTI4 40
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
CNSTI4 44
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
line 1360
;1359:   
;1360:   	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1362
;1361:   
;1362:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $299
endproc fire_turret 32 4
export fire_grapple
proc fire_grapple 36 4
line 1370
;1363:}
;1364:
;1365:/*
;1366:=================
;1367:fire_grapple
;1368:=================
;1369:*/
;1370:gentity_t *fire_grapple (gentity_t *self, vec3_t start, vec3_t dir) {
line 1376
;1371:	gentity_t	*hook;
;1372://unlagged - grapple
;1373:	int hooktime;
;1374://unlagged - grapple
;1375:
;1376:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1378
;1377:
;1378:	hook = G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1379
;1379:	hook->classname = "hook";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $208
ASGNP4
line 1380
;1380:	hook->nextthink = level.time + 10000;
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 1381
;1381:	hook->think = Weapon_HookFree;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Weapon_HookFree
ASGNP4
line 1382
;1382:	hook->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1383
;1383:	hook->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1384
;1384:	hook->s.weapon = WP_GRAPPLING_HOOK;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 10
ASGNI4
line 1385
;1385:	hook->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1386
;1386:	hook->methodOfDeath = MOD_GRAPPLE;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 25
ASGNI4
line 1387
;1387:	hook->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1388
;1388:	hook->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1389
;1389:	hook->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1390
;1390:	hook->damage = 999;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 999
ASGNI4
line 1391
;1391:	hook->splashDamage = 50;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 50
ASGNI4
line 1392
;1392:	hook->splashRadius = 10;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 10
ASGNI4
line 1396
;1393:
;1394://unlagged - grapple
;1395:	// we might want this later
;1396:	hook->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1401
;1397:
;1398:	// setting the projectile base time back makes the hook's first
;1399:	// step larger
;1400:
;1401:	if ( self->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $304
line 1402
;1402:		hooktime = self->client->pers.cmd.serverTime + 50;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 1403
;1403:	}
ADDRGP4 $305
JUMPV
LABELV $304
line 1404
;1404:	else {
line 1405
;1405:		hooktime = level.time - MISSILE_PRESTEP_TIME;
ADDRLP4 4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1406
;1406:	}
LABELV $305
line 1408
;1407:
;1408:	hook->s.pos.trTime = hooktime;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1411
;1409://unlagged - grapple
;1410:
;1411:	hook->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 1415
;1412://unlagged - grapple
;1413:	//hook->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
;1414://unlagged - grapple
;1415:	hook->s.otherEntityNum = self->s.number; // use to match beam in client
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1416
;1416:	VectorCopy( start, hook->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1417
;1417:	VectorScale( dir, 800, hook->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1145569280
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1145569280
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1145569280
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 1418
;1418:	SnapVector( hook->s.pos.trDelta );			// save net bandwidth
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRF4
ASGNF4
line 1419
;1419:	VectorCopy (start, hook->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1421
;1420:
;1421:	self->client->hook = hook;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2632
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1423
;1422:
;1423:	return hook;
ADDRLP4 0
INDIRP4
RETP4
LABELV $302
endproc fire_grapple 36 4
import irandom
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
import TeamCount
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
import Touch_DoorTrigger
import G_RunMover
import fire_blaster
import TossClientCubes
import TossClientItems
import body_die
import G_InvulnerabilityEffect
import G_RadiusDamage
import G_Damage
import CanDamage
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
LABELV $294
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $284
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $272
byte 1 98
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $263
byte 1 102
byte 1 108
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $259
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $254
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 94
byte 1 57
byte 1 80
byte 1 68
byte 1 71
byte 1 32
byte 1 76
byte 1 111
byte 1 99
byte 1 107
byte 1 32
byte 1 69
byte 1 120
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 100
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $208
byte 1 104
byte 1 111
byte 1 111
byte 1 107
byte 1 0
align 1
LABELV $194
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 0
align 1
LABELV $80
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 94
byte 1 57
byte 1 80
byte 1 97
byte 1 114
byte 1 116
byte 1 105
byte 1 99
byte 1 108
byte 1 101
byte 1 32
byte 1 68
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 71
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 32
byte 1 76
byte 1 111
byte 1 99
byte 1 107
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $79
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
LABELV $62
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 94
byte 1 57
byte 1 37
byte 1 115
byte 1 32
byte 1 68
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 101
byte 1 100
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 80
byte 1 68
byte 1 71
byte 1 33
byte 1 10
byte 1 34
byte 1 0
