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
CNSTI4 788
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $58
line 26
;26:		G_FreeEntity(self->chain); // get rid of the gun. // the gun just vanishes
ADDRFP4 0
INDIRP4
CNSTI4 788
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
CNSTI4 840
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
CNSTI4 840
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
CNSTI4 836
ADDP4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 20
INDIRP4
CNSTI4 832
ADDP4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 20
INDIRP4
CNSTI4 828
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
CNSTI4 704
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
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 51
;50:
;51:}
LABELV $63
endproc G_Missile_Die 0 0
export G_BounceMissile
proc G_BounceMissile 56 12
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
;70:	if ( ent->s.eFlags & EF_BOUNCE_HALF ) 
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
;71:	{
line 72
;72:		VectorScale( ent->s.pos.trDelta, 0.65, ent->s.pos.trDelta );
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
line 74
;73:		// check for stop
;74:		if ( trace->plane.normal[2] > 0.2 && VectorLength( ent->s.pos.trDelta ) < 40 )
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
line 75
;75:		{
line 76
;76:			G_SetOrigin( ent, trace->endpos );				
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
line 79
;77:			
;78:			// Shafe - trep - pdg
;79:			if ( !Q_stricmp( ent->classname, "pdgrenade") )
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRGP4 $79
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $65
line 80
;80:			{
line 81
;81:				if ( ent->client->ps.stats[STAT_HEALTH] <= 0 ) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $80
line 82
;82:				{ // Don't do anything when you are dead -Vincent
line 83
;83: 					if ( ent->parent->istelepoint != 0 )
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 840
ADDP4
INDIRI4
CNSTI4 0
EQI4 $65
line 84
;84:					{ // Failsafe
line 85
;85:					ent->parent->istelepoint = 0;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 0
ASGNI4
line 86
;86:					VectorClear( ent->parent->teleloc );
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
ASGNP4
ADDRLP4 48
CNSTF4 0
ASGNF4
ADDRLP4 44
INDIRP4
CNSTI4 836
ADDP4
ADDRLP4 48
INDIRF4
ASGNF4
ADDRLP4 44
INDIRP4
CNSTI4 832
ADDP4
ADDRLP4 48
INDIRF4
ASGNF4
ADDRLP4 44
INDIRP4
CNSTI4 828
ADDP4
ADDRLP4 48
INDIRF4
ASGNF4
line 87
;87:					}
line 88
;88:					return;
ADDRGP4 $65
JUMPV
LABELV $80
line 90
;89:				}
;90:				ent->parent->istelepoint = 1;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 1
ASGNI4
line 91
;91:				VectorCopy(ent->r.currentOrigin, ent->parent->teleloc);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 828
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 496
ADDP4
INDIRB
ASGNB 12
line 92
;92:				ent->parent->teleloc[2] += 20;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 836
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
CNSTF4 1101004800
ADDF4
ASGNF4
line 94
;93:							
;94:				trap_SendServerCommand( ent->r.ownerNum, va("cp \"^9Particle Displacement Grenade Lock!\n\"") );
ADDRGP4 $84
ARGP4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 96
;95:				//G_Printf( S_COLOR_RED "Particle Displacement Grenade Lock!\n" );
;96:			} // end shafe
line 98
;97:			
;98:			return;
ADDRGP4 $65
JUMPV
LABELV $75
line 100
;99:		}
;100:	}
LABELV $73
line 102
;101:
;102:	VectorAdd( ent->r.currentOrigin, trace->plane.normal, ent->r.currentOrigin);
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
line 103
;103:	VectorCopy( ent->r.currentOrigin, ent->s.pos.trBase );
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
line 104
;104:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 105
;105:}
LABELV $65
endproc G_BounceMissile 56 12
export G_HomingMissile
proc G_HomingMissile 96 12
line 109
;106:
;107:
;108:
;109:void G_HomingMissile( gentity_t *ent ) {
line 110
;110:	gentity_t	*target = NULL;
ADDRLP4 32
CNSTP4 0
ASGNP4
line 111
;111:	gentity_t	*blip = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 116
;112:	vec3_t		dir, blipdir;
;113:	vec_t		dot, cs;
;114:	qboolean	chaff;
;115:
;116:	if (ent->parent->health <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 0
GTI4 $91
line 117
;117:	{
line 118
;118:		ent->nextthink = level.time + 4000;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 4000
ADDI4
ASGNI4
line 119
;119:		ent->think = G_ExplodeMissile;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 120
;120:		return;
ADDRGP4 $86
JUMPV
LABELV $90
line 124
;121:	}
;122:
;123:
;124:	while ((blip = findradius(blip, ent->r.currentOrigin, 2000 * 2000)) != NULL)	{
line 125
;125:			chaff = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 127
;126:
;127:			if (blip->client==NULL)			continue;
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $93
ADDRGP4 $91
JUMPV
LABELV $93
line 128
;128:			if (blip==ent->parent)			continue;
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CVPU4 4
NEU4 $95
ADDRGP4 $91
JUMPV
LABELV $95
line 129
;129:			if (blip->health<=0)			continue;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 0
GTI4 $97
ADDRGP4 $91
JUMPV
LABELV $97
line 130
;130:			if (blip->client->sess.sessionTeam >= TEAM_SPECTATOR)
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
LTI4 $99
line 131
;131:				continue;
ADDRGP4 $91
JUMPV
LABELV $99
line 133
;132:
;133:			if ((g_gametype.integer == GT_TEAM || g_gametype.integer == GT_CTF) &&
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $105
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $101
LABELV $105
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $101
line 135
;134:				OnSameTeam( blip, ent->parent ) )
;135:				continue;
ADDRGP4 $91
JUMPV
LABELV $101
line 138
;136:		
;137:
;138:		if (!visible (ent, blip))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 visible
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $106
line 139
;139:			continue;
ADDRGP4 $91
JUMPV
LABELV $106
line 141
;140:
;141:		VectorSubtract(blip->r.currentOrigin, ent->r.currentOrigin, blipdir);
ADDRLP4 56
CNSTI4 496
ASGNI4
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64
CNSTI4 500
ASGNI4
ADDRLP4 4+4
ADDRLP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 68
CNSTI4 504
ASGNI4
ADDRLP4 4+8
ADDRLP4 0
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 144
;142:
;143:		//NT - give chaff a higher weight
;144:		if (chaff)
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $110
line 145
;145:		{
line 146
;146:			VectorScale(blipdir, 0.5, blipdir);
ADDRLP4 72
CNSTF4 1056964608
ASGNF4
ADDRLP4 4
ADDRLP4 72
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 72
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
line 147
;147:		}
LABELV $110
line 149
;148:
;149:		if ((target == NULL) || (VectorLength(blipdir) < VectorLength(dir)))
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $118
ADDRLP4 4
ARGP4
ADDRLP4 72
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ARGP4
ADDRLP4 76
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRF4
GEF4 $116
LABELV $118
line 150
;150:		{
line 151
;151:			if (chaff)
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $119
line 152
;152:			{
line 153
;153:				VectorScale(blipdir, 2, blipdir);
ADDRLP4 80
CNSTF4 1073741824
ASGNF4
ADDRLP4 4
ADDRLP4 80
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 80
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
line 154
;154:			}
LABELV $119
line 157
;155:
;156:			// E.B = |E||B|cos(theta)
;157:			dot = _DotProduct(ent->r.currentAngles, blipdir);
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 80
ADDRGP4 _DotProduct
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 80
INDIRF4
ASGNF4
line 160
;158:
;159:			// Divide E.B by |E||B| to get cos(theta)
;160:			cs = dot / (VectorLength(ent->r.currentAngles) * VectorLength(blipdir));
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 84
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 4
ARGP4
ADDRLP4 88
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 36
INDIRF4
ADDRLP4 84
INDIRF4
ADDRLP4 88
INDIRF4
MULF4
DIVF4
ASGNF4
line 163
;161:
;162:			// If angle is less than 120 degrees
;163:			if (cs > cos(120.0f * M_PI / 180.0f))
CNSTF4 1074137746
ARGF4
ADDRLP4 92
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 40
INDIRF4
ADDRLP4 92
INDIRF4
LEF4 $125
line 164
;164:			{
line 166
;165:				// We add it as our target
;166:				target = blip;
ADDRLP4 32
ADDRLP4 0
INDIRP4
ASGNP4
line 167
;167:				VectorCopy(blipdir, dir);
ADDRLP4 20
ADDRLP4 4
INDIRB
ASGNB 12
line 168
;168:			}
LABELV $125
line 169
;169:		}
LABELV $116
line 170
;170:	}
LABELV $91
line 124
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
ADDRLP4 44
ADDRGP4 findradius
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 44
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $90
line 172
;171:
;172:	if (target == NULL)	{
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $127
line 173
;173:		ent->nextthink = level.time + HOMING_THINK; // + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 60
ADDI4
ASGNI4
line 174
;174:		ent->think = G_HomingMissile;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_HomingMissile
ASGNP4
line 175
;175:	} else {
ADDRGP4 $128
JUMPV
LABELV $127
line 177
;176:		// for exact trajectory calculation, set current point to base.
;177:		VectorCopy(ent->r.currentOrigin, ent->s.pos.trBase );
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 48
INDIRP4
CNSTI4 496
ADDP4
INDIRB
ASGNB 12
line 179
;178:
;179:		VectorNormalize(dir);
ADDRLP4 20
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 181
;180:		// 0.5 is swing rate.
;181:		VectorScale(dir, 0.5, dir);
ADDRLP4 52
CNSTF4 1056964608
ASGNF4
ADDRLP4 20
ADDRLP4 52
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 52
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
line 182
;182:		VectorAdd(dir,ent->r.currentAngles,dir);
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 20
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 508
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 20+4
INDIRF4
ADDRLP4 56
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
line 185
;183:
;184:		// turn nozzle to target angle
;185:		VectorNormalize(dir);
ADDRLP4 20
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 186
;186:		VectorCopy(dir, ent->r.currentAngles);
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ADDRLP4 20
INDIRB
ASGNB 12
line 189
;187:
;188:		// scale direction, put into trDelta
;189:		VectorScale(dir, ent->constantSpeed, dir);
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 892
ADDP4
ASGNP4
ADDRLP4 20
ADDRLP4 20
INDIRF4
ADDRLP4 60
INDIRP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 20+4
INDIRF4
ADDRLP4 60
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
CNSTI4 892
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 190
;190:		VectorCopy(dir, ent->s.pos.trDelta);
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 20
INDIRB
ASGNB 12
line 192
;191:
;192:		ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 194
;193:
;194:		SnapVector (ent->s.pos.trDelta);                      // save net bandwidth
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 36
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
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
INDIRF4
ARGF4
ADDRLP4 76
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 72
INDIRP4
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
INDIRF4
ARGF4
ADDRLP4 84
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 80
INDIRP4
ADDRLP4 84
INDIRF4
ASGNF4
line 195
;195:		ent->nextthink = level.time + HOMING_THINK;	// decrease this value also makes fast swing
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 60
ADDI4
ASGNI4
line 196
;196:		ent->think = G_HomingMissile;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_HomingMissile
ASGNP4
line 197
;197:	}
LABELV $128
line 198
;198:}
LABELV $86
endproc G_HomingMissile 96 12
export G_ExplodeDevastatorFire2
proc G_ExplodeDevastatorFire2 72 24
line 207
;199:
;200:
;201:/*
;202:========================
;203:G_ExplodeDevastatorFire
;204:
;205:========================
;206:*/
;207:void G_ExplodeDevastatorFire2( gentity_t *ent ) {
line 217
;208:	vec3_t		dir;
;209:	vec3_t		origin;
;210:	vec3_t		dev1;
;211:	vec3_t		dev2;
;212:	/*
;213:	vec3_t		dev3;
;214:	vec3_t		dev4;
;215:	*/
;216:
;217:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
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
line 218
;218:	SnapVector( origin );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 48
INDIRF4
ASGNF4
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 52
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 52
INDIRF4
ASGNF4
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRLP4 56
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 56
INDIRF4
ASGNF4
line 219
;219:	G_SetOrigin( ent, origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 222
;220:
;221:	// we don't have a valid direction, so just point straight up
;222:	dir[0] = dir[1] = 0;
ADDRLP4 48
CNSTF4 0
ASGNF4
ADDRLP4 12+4
ADDRLP4 48
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 48
INDIRF4
ASGNF4
line 223
;223:	dir[2] = 10;
ADDRLP4 12+8
CNSTF4 1092616192
ASGNF4
line 225
;224:
;225:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 226
;226:	G_AddEvent( ent, EV_MISSILE_MISS, DirToByte( dir ) );
ADDRLP4 12
ARGP4
ADDRLP4 52
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 53
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 228
;227:
;228:	ent->s.time2++;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 230
;229:	
;230:	ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 233
;231:
;232:	// splash damage
;233:	if ( ent->splashDamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
CNSTI4 0
EQI4 $152
line 234
;234:		if( G_RadiusDamage( ent->r.currentOrigin, ent->parent, ent->splashDamage, ent->splashRadius, NULL
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 496
ADDP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 772
ADDP4
INDIRI4
CVIF4 4
ARGF4
CNSTP4 0
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 780
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 G_RadiusDamage
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $154
line 235
;235:			, ent->splashMethodOfDeath ) ) {
line 237
;236:			//g_entities[ent->r.ownerNum].client->ps.persistant[PERS_ACCURACY_HITS]++;
;237:		}
LABELV $154
line 238
;238:	}
LABELV $152
line 241
;239:
;240:
;241:		VectorSet(dev1, 25, 25, (30+ irandom(10,35)));
ADDRLP4 60
CNSTF4 1103626240
ASGNF4
ADDRLP4 24
ADDRLP4 60
INDIRF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 60
INDIRF4
ASGNF4
CNSTI4 10
ARGI4
CNSTI4 35
ARGI4
ADDRLP4 64
ADDRGP4 irandom
CALLI4
ASGNI4
ADDRLP4 24+8
ADDRLP4 64
INDIRI4
CNSTI4 30
ADDI4
CVIF4 4
ASGNF4
line 242
;242:		VectorSet(dev2, -25, 25, (30+ irandom(10,35)));
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
ADDRLP4 68
ADDRGP4 irandom
CALLI4
ASGNI4
ADDRLP4 36+8
ADDRLP4 68
INDIRI4
CNSTI4 30
ADDI4
CVIF4 4
ASGNF4
line 243
;243:		fire_devparticle (ent, origin, dev1, qtrue);
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
line 244
;244:		fire_devparticle (ent->parent, origin, dev2, qtrue);
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
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
line 247
;245:
;246:
;247:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 249
;248:	
;249:}
LABELV $144
endproc G_ExplodeDevastatorFire2 72 24
export G_ExplodeDevastatorFire
proc G_ExplodeDevastatorFire 116 24
line 252
;250:
;251:
;252:void G_ExplodeDevastatorFire( gentity_t *ent ) {
line 261
;253:	vec3_t		dir;
;254:	vec3_t		origin;
;255:	vec3_t		dev1;
;256:	vec3_t		dev2;
;257:	vec3_t		dev3;
;258:	vec3_t		dev4;
;259:
;260:
;261:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
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
line 262
;262:	SnapVector( origin );
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
line 263
;263:	G_SetOrigin( ent, origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 266
;264:
;265:	// we don't have a valid direction, so just point straight up
;266:	dir[0] = dir[1] = 0;
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
line 267
;267:	dir[2] = 10;
ADDRLP4 12+8
CNSTF4 1092616192
ASGNF4
line 269
;268:
;269:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 270
;270:	G_AddEvent( ent, EV_MISSILE_MISS, DirToByte( dir ) );
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
line 272
;271:
;272:	ent->s.time2++;
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
line 274
;273:	
;274:	ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 277
;275:
;276:	// splash damage
;277:	if ( ent->splashDamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
CNSTI4 0
EQI4 $168
line 278
;278:		if( G_RadiusDamage( ent->r.currentOrigin, ent->parent, ent->splashDamage, ent->splashRadius, NULL
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
CNSTI4 768
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 84
INDIRP4
CNSTI4 772
ADDP4
INDIRI4
CVIF4 4
ARGF4
CNSTP4 0
ARGP4
ADDRLP4 84
INDIRP4
CNSTI4 780
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
EQI4 $170
line 279
;279:			, ent->splashMethodOfDeath ) ) {
line 281
;280:			//g_entities[ent->r.ownerNum].client->ps.persistant[PERS_ACCURACY_HITS]++;
;281:		}
LABELV $170
line 282
;282:	}
LABELV $168
line 285
;283:
;284:
;285:		VectorSet(dev1, (25+ irandom(1,35)), (25+ irandom(10,35)), 30);
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
line 286
;286:		VectorSet(dev2, (-25 - irandom(1,35)), (25+ irandom(10,35)), 30);
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
line 287
;287:		VectorSet(dev3, (25 + irandom(1,35)), (-25+ irandom(10,35)), 30);
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
line 288
;288:		VectorSet(dev4, (-25 - + irandom(1,35)), (-25+ irandom(10,35)), 30);
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
line 290
;289:		
;290:		fire_devparticle (ent->parent, origin, dev1, qfalse);
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
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
line 291
;291:		fire_devparticle (ent->parent, origin, dev2, qfalse);
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
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
line 292
;292:		fire_devparticle (ent->parent, origin, dev3, qfalse);
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
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
line 293
;293:		fire_devparticle (ent->parent, origin, dev4, qfalse);
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
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
line 295
;294:
;295:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 297
;296:	
;297:}
LABELV $160
endproc G_ExplodeDevastatorFire 116 24
export G_ExplodeMissile
proc G_ExplodeMissile 44 24
line 308
;298: 
;299:
;300:/*
;301:================
;302:G_ExplodeMissile
;303:
;304:Explode a missile without an impact
;305:================
;306:*/
;307:void G_ExplodeMissile( gentity_t *ent )
;308:{
line 312
;309:	vec3_t		dir;
;310:	vec3_t		origin;
;311:
;312:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
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
line 313
;313:	SnapVector( origin );
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
line 314
;314:	G_SetOrigin( ent, origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 317
;315:
;316:	// we don't have a valid direction, so just point straight up
;317:	dir[0] = dir[1] = 0;
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
line 318
;318:	dir[2] = 1;
ADDRLP4 12+8
CNSTF4 1065353216
ASGNF4
line 320
;319:
;320:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 321
;321:	G_AddEvent( ent, EV_MISSILE_MISS, DirToByte( dir ) );
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
line 323
;322:
;323:	ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 326
;324:
;325:	// splash damage
;326:	if ( ent->splashDamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
CNSTI4 0
EQI4 $188
line 327
;327:		if( G_RadiusDamage( ent->r.currentOrigin, ent->parent, ent->splashDamage, ent->splashRadius, ent
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
CNSTI4 768
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 772
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 780
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
EQI4 $190
line 328
;328:			, ent->splashMethodOfDeath ) ) {
line 329
;329:			g_entities[ent->r.ownerNum].client->accuracy_hits++;
ADDRLP4 40
CNSTI4 924
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+524
ADDP4
INDIRP4
CNSTI4 2648
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
line 330
;330:		}
LABELV $190
line 331
;331:	}
LABELV $188
line 333
;332:
;333:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 334
;334:}
LABELV $180
endproc G_ExplodeMissile 44 24
export G_MissileImpact
proc G_MissileImpact 56 32
line 511
;335:
;336:
;337:#ifdef MISSIONPACK
;338:/*
;339:================
;340:ProximityMine_Explode
;341:================
;342:*/
;343:static void ProximityMine_Explode( gentity_t *mine ) {
;344:	G_ExplodeMissile( mine );
;345:	// if the prox mine has a trigger free it
;346:	if (mine->activator) {
;347:		G_FreeEntity(mine->activator);
;348:		mine->activator = NULL;
;349:	}
;350:}
;351:
;352:/*
;353:================
;354:ProximityMine_Die
;355:================
;356:*/
;357:static void ProximityMine_Die( gentity_t *ent, gentity_t *inflictor, gentity_t *attacker, int damage, int mod ) {
;358:	ent->think = ProximityMine_Explode;
;359:	ent->nextthink = level.time + 1;
;360:}
;361:
;362:/*
;363:================
;364:ProximityMine_Trigger
;365:================
;366:*/
;367:void ProximityMine_Trigger( gentity_t *trigger, gentity_t *other, trace_t *trace ) {
;368:	vec3_t		v;
;369:	gentity_t	*mine;
;370:
;371:	if( !other->client ) {
;372:		return;
;373:	}
;374:
;375:	// trigger is a cube, do a distance test now to act as if it's a sphere
;376:	VectorSubtract( trigger->s.pos.trBase, other->s.pos.trBase, v );
;377:	if( VectorLength( v ) > trigger->parent->splashRadius ) {
;378:		return;
;379:	}
;380:
;381:
;382:	if ( g_gametype.integer >= GT_TEAM ) {
;383:		// don't trigger same team mines
;384:		if (trigger->parent->s.generic1 == other->client->sess.sessionTeam) {
;385:			return;
;386:		}
;387:	}
;388:
;389:	// ok, now check for ability to damage so we don't get triggered thru walls, closed doors, etc...
;390:	if( !CanDamage( other, trigger->s.pos.trBase ) ) {
;391:		return;
;392:	}
;393:
;394:	// trigger the mine!
;395:	mine = trigger->parent;
;396:	mine->s.loopSound = 0;
;397:	G_AddEvent( mine, EV_PROXIMITY_MINE_TRIGGER, 0 );
;398:	mine->nextthink = level.time + 500;
;399:
;400:	G_FreeEntity( trigger );
;401:}
;402:
;403:/*
;404:================
;405:ProximityMine_Activate
;406:================
;407:*/
;408:static void ProximityMine_Activate( gentity_t *ent ) {
;409:	gentity_t	*trigger;
;410:	float		r;
;411:
;412:	ent->think = ProximityMine_Explode;
;413:	ent->nextthink = level.time + g_proxMineTimeout.integer;
;414:
;415:	ent->takedamage = qtrue;
;416:	ent->health = 1;
;417:	ent->die = ProximityMine_Die;
;418:
;419:	ent->s.loopSound = G_SoundIndex( "sound/weapons/proxmine/wstbtick.wav" );
;420:
;421:	// build the proximity trigger
;422:	trigger = G_Spawn ();
;423:
;424:	trigger->classname = "proxmine_trigger";
;425:
;426:	r = ent->splashRadius;
;427:	VectorSet( trigger->r.mins, -r, -r, -r );
;428:	VectorSet( trigger->r.maxs, r, r, r );
;429:
;430:	G_SetOrigin( trigger, ent->s.pos.trBase );
;431:
;432:	trigger->parent = ent;
;433:	trigger->r.contents = CONTENTS_TRIGGER;
;434:	trigger->touch = ProximityMine_Trigger;
;435:
;436:	trap_LinkEntity (trigger);
;437:
;438:	// set pointer to trigger so the entity can be freed when the mine explodes
;439:	ent->activator = trigger;
;440:}
;441:
;442:/*
;443:================
;444:ProximityMine_ExplodeOnPlayer
;445:================
;446:*/
;447:static void ProximityMine_ExplodeOnPlayer( gentity_t *mine ) {
;448:	gentity_t	*player;
;449:
;450:	player = mine->enemy;
;451:	player->client->ps.eFlags &= ~EF_TICKING;
;452:
;453:	if ( player->client->invulnerabilityTime > level.time ) {
;454:		G_Damage( player, mine->parent, mine->parent, vec3_origin, mine->s.origin, 1000, DAMAGE_NO_KNOCKBACK, MOD_JUICED );
;455:		player->client->invulnerabilityTime = 0;
;456:		G_TempEntity( player->client->ps.origin, EV_JUICED );
;457:	}
;458:	else {
;459:		G_SetOrigin( mine, player->s.pos.trBase );
;460:		// make sure the explosion gets to the client
;461:		mine->r.svFlags &= ~SVF_NOCLIENT;
;462:		mine->splashMethodOfDeath = MOD_PROXIMITY_MINE;
;463:		G_ExplodeMissile( mine );
;464:	}
;465:}
;466:
;467:/*
;468:================
;469:ProximityMine_Player
;470:================
;471:*/
;472:static void ProximityMine_Player( gentity_t *mine, gentity_t *player ) {
;473:	if( mine->s.eFlags & EF_NODRAW ) {
;474:		return;
;475:	}
;476:
;477:	G_AddEvent( mine, EV_PROXIMITY_MINE_STICK, 0 );
;478:
;479:	if( player->s.eFlags & EF_TICKING ) {
;480:		player->activator->splashDamage += mine->splashDamage;
;481:		player->activator->splashRadius *= 1.50;
;482:		mine->think = G_FreeEntity;
;483:		mine->nextthink = level.time;
;484:		return;
;485:	}
;486:
;487:	player->client->ps.eFlags |= EF_TICKING;
;488:	player->activator = mine;
;489:
;490:	mine->s.eFlags |= EF_NODRAW;
;491:	mine->r.svFlags |= SVF_NOCLIENT;
;492:	mine->s.pos.trType = TR_LINEAR;
;493:	VectorClear( mine->s.pos.trDelta );
;494:
;495:	mine->enemy = player;
;496:	mine->think = ProximityMine_ExplodeOnPlayer;
;497:	if ( player->client->invulnerabilityTime > level.time ) {
;498:		mine->nextthink = level.time + 2 * 1000;
;499:	}
;500:	else {
;501:		mine->nextthink = level.time + 10 * 1000;
;502:	}
;503:}
;504:#endif
;505:
;506:/*
;507:================
;508:G_MissileImpact
;509:================
;510:*/
;511:void G_MissileImpact( gentity_t *ent, trace_t *trace ) {
line 513
;512:	gentity_t		*other;
;513:	qboolean		hitClient = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 518
;514:#ifdef MISSIONPACK
;515:	vec3_t			forward, impactpoint, bouncedir;
;516:	int				eFlags;
;517:#endif
;518:	other = &g_entities[trace->entityNum];
ADDRLP4 0
CNSTI4 924
ADDRFP4 4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 521
;519:
;520:	// check for bounce
;521:	if ( !other->takedamage &&
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $194
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 48
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $194
line 522
;522:		( ent->s.eFlags & ( EF_BOUNCE | EF_BOUNCE_HALF ) ) ) {
line 523
;523:		G_BounceMissile( ent, trace );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_BounceMissile
CALLV
pop
line 525
;524:		
;525:			if ( !Q_stricmp( ent->classname, "plasma") )
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $196
line 526
;526:		{
line 527
;527:			G_AddEvent( ent, EV_PL_BOUNCE, 0 );
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
line 528
;528:		} 
ADDRGP4 $193
JUMPV
LABELV $196
line 530
;529:		else
;530:		{
line 532
;531:			// Regular Grenade
;532:			G_AddEvent( ent, EV_GRENADE_BOUNCE, 0 );
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
line 533
;533:		}
line 535
;534:
;535:		return;
ADDRGP4 $193
JUMPV
LABELV $194
line 560
;536:	}
;537:
;538:
;539:#ifdef MISSIONPACK
;540:	if ( other->takedamage ) {
;541:		if ( ent->s.weapon != WP_PROX_LAUNCHER ) {
;542:			if ( other->client && other->client->invulnerabilityTime > level.time ) {
;543:				//
;544:				VectorCopy( ent->s.pos.trDelta, forward );
;545:				VectorNormalize( forward );
;546:				if (G_InvulnerabilityEffect( other, forward, ent->s.pos.trBase, impactpoint, bouncedir )) {
;547:					VectorCopy( bouncedir, trace->plane.normal );
;548:					eFlags = ent->s.eFlags & EF_BOUNCE_HALF;
;549:					ent->s.eFlags &= ~EF_BOUNCE_HALF;
;550:					G_BounceMissile( ent, trace );
;551:					ent->s.eFlags |= eFlags;
;552:				}
;553:				ent->target_ent = other;
;554:				return;
;555:			}
;556:		}
;557:	}
;558:#endif
;559:	// impact damage
;560:	if (other->takedamage) {
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $199
line 562
;561:		// FIXME: wrong damage direction?
;562:		if ( ent->damage ) {
ADDRFP4 0
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
CNSTI4 0
EQI4 $201
line 565
;563:			vec3_t	velocity;
;564:
;565:			if( LogAccuracyHit( other, &g_entities[ent->r.ownerNum] ) ) {
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 924
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
EQI4 $203
line 566
;566:				g_entities[ent->r.ownerNum].client->accuracy_hits++;
ADDRLP4 28
CNSTI4 924
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+524
ADDP4
INDIRP4
CNSTI4 2648
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
line 567
;567:				hitClient = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 568
;568:			}
LABELV $203
line 569
;569:			BG_EvaluateTrajectoryDelta( &ent->s.pos, level.time, velocity );
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
line 570
;570:			if ( VectorLength( velocity ) == 0 ) {
ADDRLP4 12
ARGP4
ADDRLP4 28
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 28
INDIRF4
CNSTF4 0
NEF4 $207
line 571
;571:				velocity[2] = 1;	// stepped on a grenade
ADDRLP4 12+8
CNSTF4 1065353216
ASGNF4
line 572
;572:			}
LABELV $207
line 573
;573:			G_Damage (other, ent, &g_entities[ent->r.ownerNum], velocity,
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
CNSTI4 924
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
CNSTI4 764
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 32
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 576
;574:				ent->s.origin, ent->damage, 
;575:				0, ent->methodOfDeath);
;576:		}
LABELV $201
line 577
;577:	}
LABELV $199
line 616
;578:
;579:#ifdef MISSIONPACK
;580:	if( ent->s.weapon == WP_PROX_LAUNCHER ) {
;581:		if( ent->s.pos.trType != TR_GRAVITY ) {
;582:			return;
;583:		}
;584:
;585:		// if it's a player, stick it on to them (flag them and remove this entity)
;586:		if( other->s.eType == ET_PLAYER && other->health > 0 ) {
;587:			ProximityMine_Player( ent, other );
;588:			return;
;589:		}
;590:
;591:		SnapVectorTowards( trace->endpos, ent->s.pos.trBase );
;592:		G_SetOrigin( ent, trace->endpos );
;593:		ent->s.pos.trType = TR_STATIONARY;
;594:		VectorClear( ent->s.pos.trDelta );
;595:
;596:		G_AddEvent( ent, EV_PROXIMITY_MINE_STICK, trace->surfaceFlags );
;597:
;598:		ent->think = ProximityMine_Activate;
;599:		ent->nextthink = level.time + 2000;
;600:
;601:		vectoangles( trace->plane.normal, ent->s.angles );
;602:		ent->s.angles[0] += 90;
;603:
;604:		// link the prox mine to the other entity
;605:		ent->enemy = other;
;606:		ent->die = ProximityMine_Die;
;607:		VectorCopy(trace->plane.normal, ent->movedir);
;608:		VectorSet(ent->r.mins, -4, -4, -4);
;609:		VectorSet(ent->r.maxs, 4, 4, 4);
;610:		trap_LinkEntity(ent);
;611:
;612:		return;
;613:	}
;614:#endif
;615:
;616:	if (!strcmp(ent->classname, "hook")) {
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRGP4 $212
ARGP4
ADDRLP4 12
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $210
line 620
;617:		gentity_t *nent;
;618:		vec3_t v;
;619:
;620:		nent = G_Spawn();
ADDRLP4 32
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 621
;621:		if ( other->takedamage && other->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $213
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $213
line 623
;622:
;623:			G_AddEvent( nent, EV_MISSILE_HIT, DirToByte( trace->plane.normal ) );
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
line 624
;624:			nent->s.otherEntityNum = other->s.number;
ADDRLP4 16
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 626
;625:
;626:			ent->enemy = other;
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 628
;627:
;628:			v[0] = other->r.currentOrigin[0] + (other->r.mins[0] + other->r.maxs[0]) * 0.5;
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
line 629
;629:			v[1] = other->r.currentOrigin[1] + (other->r.mins[1] + other->r.maxs[1]) * 0.5;
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
line 630
;630:			v[2] = other->r.currentOrigin[2] + (other->r.mins[2] + other->r.maxs[2]) * 0.5;
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
line 632
;631:
;632:			SnapVectorTowards( v, ent->s.pos.trBase );	// save net bandwidth
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
line 633
;633:		} else {
ADDRGP4 $214
JUMPV
LABELV $213
line 634
;634:			VectorCopy(trace->endpos, v);
ADDRLP4 20
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 635
;635:			G_AddEvent( nent, EV_MISSILE_MISS, DirToByte( trace->plane.normal ) );
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
line 636
;636:			ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
CNSTP4 0
ASGNP4
line 637
;637:		}
LABELV $214
line 639
;638:
;639:		SnapVectorTowards( v, ent->s.pos.trBase );	// save net bandwidth
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
line 641
;640:
;641:		nent->freeAfterEvent = qtrue;
ADDRLP4 16
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 643
;642:		// change over to a normal entity right at the point of impact
;643:		nent->s.eType = ET_GENERAL;
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 644
;644:		ent->s.eType = ET_GRAPPLE;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 11
ASGNI4
line 646
;645:
;646:		G_SetOrigin( ent, v );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 647
;647:		G_SetOrigin( nent, v );
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 649
;648:
;649:		ent->think = Weapon_HookThink;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 Weapon_HookThink
ASGNP4
line 650
;650:		ent->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 652
;651:
;652:		ent->parent->client->ps.pm_flags |= PMF_GRAPPLE_PULL;
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
line 653
;653:		VectorCopy( ent->r.currentOrigin, ent->parent->client->ps.grapplePoint);
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
line 655
;654:
;655:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 656
;656:		trap_LinkEntity( nent );
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 658
;657:
;658:		return;
ADDRGP4 $193
JUMPV
LABELV $210
line 664
;659:	}
;660:
;661:	// is it cheaper in bandwidth to just remove this ent and create a new
;662:	// one, rather than changing the missile into the explosion?
;663:
;664:	if ( other->takedamage && other->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $218
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $218
line 665
;665:		G_AddEvent( ent, EV_MISSILE_HIT, DirToByte( trace->plane.normal ) );
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
line 666
;666:		ent->s.otherEntityNum = other->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 667
;667:	} else if( trace->surfaceFlags & SURF_METALSTEPS ) {
ADDRGP4 $219
JUMPV
LABELV $218
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $220
line 668
;668:		G_AddEvent( ent, EV_MISSILE_MISS_METAL, DirToByte( trace->plane.normal ) );
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
line 669
;669:	} else {
ADDRGP4 $221
JUMPV
LABELV $220
line 670
;670:		G_AddEvent( ent, EV_MISSILE_MISS, DirToByte( trace->plane.normal ) );
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
line 671
;671:	}
LABELV $221
LABELV $219
line 673
;672:
;673:	ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 676
;674:
;675:	// change over to a normal entity right at the point of impact
;676:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 678
;677:
;678:	SnapVectorTowards( trace->endpos, ent->s.pos.trBase );	// save net bandwidth
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
line 680
;679:
;680:	G_SetOrigin( ent, trace->endpos );
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
line 683
;681:
;682:	// splash damage (doesn't apply to person directly hit)
;683:	if ( ent->splashDamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
CNSTI4 0
EQI4 $222
line 684
;684:		if( G_RadiusDamage( trace->endpos, ent->parent, ent->splashDamage, ent->splashRadius, 
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
CNSTI4 768
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 772
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 780
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
EQI4 $224
line 685
;685:			other, ent->splashMethodOfDeath ) ) {
line 686
;686:			if( !hitClient ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $226
line 687
;687:				g_entities[ent->r.ownerNum].client->accuracy_hits++;
ADDRLP4 28
CNSTI4 924
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+524
ADDP4
INDIRP4
CNSTI4 2648
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
line 688
;688:			}
LABELV $226
line 689
;689:		}
LABELV $224
line 690
;690:	}
LABELV $222
line 692
;691:
;692:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 693
;693:}
LABELV $193
endproc G_MissileImpact 56 32
export G_RunMissile
proc G_RunMissile 88 28
line 700
;694:
;695:/*
;696:================
;697:G_RunMissile
;698:================
;699:*/
;700:void G_RunMissile( gentity_t *ent ) {
line 706
;701:	vec3_t		origin;
;702:	trace_t		tr;
;703:	int			passent;
;704:
;705:	
;706:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
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
line 710
;707:
;708:
;709:	// if this missile bounced off an invulnerability sphere
;710:	if ( ent->target_ent ) {
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $231
line 711
;711:		passent = ent->target_ent->s.number;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRP4
INDIRI4
ASGNI4
line 712
;712:	}
ADDRGP4 $232
JUMPV
LABELV $231
line 719
;713:#ifdef MISSIONPACK
;714:	// prox mines that left the owner bbox will attach to anything, even the owner
;715:	else if (ent->s.weapon == WP_PROX_LAUNCHER && ent->count) {
;716:		passent = ENTITYNUM_NONE;
;717:	}
;718:#endif
;719:	else {
line 721
;720:		// ignore interactions with the missile owner
;721:		passent = ent->r.ownerNum;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ASGNI4
line 722
;722:	}
LABELV $232
line 724
;723:	// trace a line from the previous position to the current position
;724:	trap_Trace( &tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, origin, passent, ent->clipmask );
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
line 726
;725:
;726:	if ( tr.startsolid || tr.allsolid ) {
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 76
INDIRI4
NEI4 $236
ADDRLP4 0
INDIRI4
ADDRLP4 76
INDIRI4
EQI4 $233
LABELV $236
line 728
;727:		// make sure the tr.entityNum is set to the entity we're stuck in
;728:		trap_Trace( &tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, ent->r.currentOrigin, passent, ent->clipmask );
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
line 729
;729:		tr.fraction = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 730
;730:	}
ADDRGP4 $234
JUMPV
LABELV $233
line 731
;731:	else {
line 732
;732:		VectorCopy( tr.endpos, ent->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 733
;733:	}
LABELV $234
line 735
;734:
;735:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 737
;736:
;737:	if ( tr.fraction != 1 ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $239
line 739
;738:		// never explode or bounce on sky
;739:		if ( tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $242
line 747
;740:			// If grapple, reset owner
;741:			/* Shafe - Trep - Comment this out for offhand grapple
;742:			if (ent->parent && ent->parent->client && ent->parent->client->hook == ent) {
;743:				ent->parent->client->hook = NULL;
;744:			}
;745:			*/
;746:			// Shafe - Trep - Offhand Grappling Hook
;747:			if (g_gametype.integer != GT_CTF) 
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
EQI4 $245
line 748
;748:			{
line 749
;749:				if (ent->parent && ent->parent->client->hook == ent)
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
EQU4 $248
ADDRLP4 84
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2692
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 80
INDIRP4
CVPU4 4
NEU4 $248
line 750
;750:				{
line 751
;751:					ent->parent->client->hook = NULL;
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
line 752
;752:					ent->parent->client->hookhasbeenfired = qfalse;
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
CNSTI4 0
ASGNI4
line 753
;753:					ent->parent->client->fireHeld = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 0
ASGNI4
line 754
;754:				}
LABELV $248
line 755
;755:			}
LABELV $245
line 758
;756:			// End Shafe
;757:
;758:			G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 759
;759:			return;
ADDRGP4 $229
JUMPV
LABELV $242
line 761
;760:		}
;761:		G_MissileImpact( ent, &tr );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_MissileImpact
CALLV
pop
line 762
;762:		if ( ent->s.eType != ET_MISSILE ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $250
line 763
;763:			return;		// exploded
ADDRGP4 $229
JUMPV
LABELV $250
line 765
;764:		}
;765:	}
LABELV $239
line 777
;766:#ifdef MISSIONPACK
;767:	// if the prox mine wasn't yet outside the player body
;768:	if (ent->s.weapon == WP_PROX_LAUNCHER && !ent->count) {
;769:		// check if the prox mine is outside the owner bbox
;770:		trap_Trace( &tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, ent->r.currentOrigin, ENTITYNUM_NONE, ent->clipmask );
;771:		if (!tr.startsolid || tr.entityNum != ent->r.ownerNum) {
;772:			ent->count = 1;
;773:		}
;774:	}
;775:#endif
;776:	// check think function after bouncing
;777:	G_RunThink( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 778
;778:}
LABELV $229
endproc G_RunMissile 88 28
export fire_plasma
proc fire_plasma 32 4
line 789
;779:
;780:
;781://=============================================================================
;782:
;783:/*
;784:=================
;785:fire_plasma
;786:
;787:=================
;788:*/
;789:gentity_t *fire_plasma (gentity_t *self, vec3_t start, vec3_t dir) {
line 792
;790:	gentity_t	*bolt;
;791:
;792:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 794
;793:
;794:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 795
;795:	bolt->classname = "plasma";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $198
ASGNP4
line 796
;796:	bolt->nextthink = level.time + 1200; //10000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1200
ADDI4
ASGNI4
line 797
;797:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 798
;798:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 799
;799:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 800
;800:	bolt->s.weapon = WP_PLASMAGUN;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 8
ASGNI4
line 801
;801:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 804
;802://unlagged - projectile nudge
;803:	// we'll need this for nudging projectiles later
;804:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 806
;805://unlagged - projectile nudge
;806:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 807
;807:	bolt->damage = 20;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 20
ASGNI4
line 808
;808:	bolt->splashDamage = 15;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 15
ASGNI4
line 809
;809:	bolt->splashRadius = 20;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 20
ASGNI4
line 810
;810:	bolt->methodOfDeath = MOD_PLASMA;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 8
ASGNI4
line 811
;811:	bolt->splashMethodOfDeath = MOD_PLASMA_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 9
ASGNI4
line 812
;812:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 813
;813:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 816
;814:
;815:	// Shafe - Make it bounce
;816:	bolt->s.eFlags = EF_BOUNCE;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 16
ASGNI4
line 818
;817:
;818:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 819
;819:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 820
;820:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 821
;821:	VectorScale( dir, 2000, bolt->s.pos.trDelta );
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
line 822
;822:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 824
;823:
;824:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 826
;825:
;826:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $252
endproc fire_plasma 32 4
export G_ExplodePDGrenade
proc G_ExplodePDGrenade 8 8
line 834
;827:}	
;828:
;829://=============================================================================
;830:
;831:
;832:
;833:// Shafe - Trep 
;834:void G_ExplodePDGrenade( gentity_t *ent ) {
line 836
;835: 
;836:	if (ent->parent->istelepoint != 0)
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 840
ADDP4
INDIRI4
CNSTI4 0
EQI4 $256
line 837
;837:	{
line 838
;838:		trap_SendServerCommand( ent->r.ownerNum, va("cp \"^9PDG Lock Expired!\n\"") );
ADDRGP4 $258
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
line 839
;839:	}
LABELV $256
line 840
;840:	ent->parent->istelepoint = 0; // client cannot teleport
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 0
ASGNI4
line 841
;841: 	VectorClear( ent->parent->teleloc ); // clear the teleport location
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
CNSTI4 836
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 832
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 828
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 844
;842:	//G_Printf( S_COLOR_GREEN "Particle Displacement Grenade Expired\n" );
;843:	
;844:	if ( ent->client->pdgfired == qtrue )
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2700
ADDP4
INDIRI4
CNSTI4 1
NEI4 $259
line 845
;845:	{ // -Vincent
line 846
;846:	ent->client->pdgfired = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2700
ADDP4
CNSTI4 0
ASGNI4
line 847
;847:	}
LABELV $259
line 849
;848:
;849:	G_ExplodeMissile( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_ExplodeMissile
CALLV
pop
line 850
;850:}
LABELV $255
endproc G_ExplodePDGrenade 8 8
export fire_pdgrenade
proc fire_pdgrenade 36 4
line 857
;851:/*
;852:=================
;853: fire_pdgrenade
;854: Shafe - Trep 
;855:=================
;856:*/
;857:gentity_t *fire_pdgrenade (gentity_t *self, vec3_t start, vec3_t dir) {
line 861
;858:	gentity_t	*bolt;
;859:	//vec3_t		mins = { -8, -8, -8 }, maxs = { 8, 8, 8 };
;860:
;861:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 863
;862: 
;863:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 864
;864:	bolt->classname = "pdgrenade";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $79
ASGNP4
line 865
;865:	bolt->nextthink = level.time + 30000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 30000
ADDI4
ASGNI4
line 866
;866:	bolt->think = G_ExplodePDGrenade;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodePDGrenade
ASGNP4
line 867
;867:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 870
;868:	//tr.surfaceFlags & SURF_NOIMPACT
;869:	
;870:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 871
;871:	bolt->s.weapon = WP_GRENADE_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 4
ASGNI4
line 872
;872:	bolt->s.eFlags = EF_BOUNCE_HALF;  // Get rid of this for no bounce
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 32
ASGNI4
line 873
;873:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 877
;874:
;875:	//unlagged - projectile nudge
;876:	// we'll need this for nudging projectiles later
;877:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 879
;878:	//unlagged - projectile nudge
;879:	bolt->s.eFlags |= EF_ALT_FIRING;
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
line 880
;880:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 881
;881:	bolt->damage = 1;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 1
ASGNI4
line 882
;882:	bolt->splashDamage = 0;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 0
ASGNI4
line 883
;883:	bolt->splashRadius = 0;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 0
ASGNI4
line 884
;884:	bolt->methodOfDeath = MOD_GRENADE;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 4
ASGNI4
line 885
;885:	bolt->splashMethodOfDeath = MOD_GRENADE_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 5
ASGNI4
line 886
;886:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 889
;887: 
;888:	// Health? Think it'll work?
;889:	bolt->takedamage=qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
line 890
;890:	bolt->health = 35;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 35
ASGNI4
line 891
;891:	bolt->die = pdg_explode;
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
ADDRGP4 pdg_explode
ASGNP4
line 893
;892:
;893:	bolt->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 894
;894:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 895
;895:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 896
;896:	VectorScale( dir, 700, bolt->s.pos.trDelta );
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
line 897
;897:	SnapVector( bolt->s.pos.trDelta );// save net bandwidth
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
line 899
;898: 
;899:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 901
;900: 
;901: return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $261
endproc fire_pdgrenade 36 4
export fire_grenade
proc fire_grenade 32 4
line 909
;902:}
;903:
;904:/*
;905:=================
;906:fire_grenade
;907:=================
;908:*/
;909:gentity_t *fire_grenade (gentity_t *self, vec3_t start, vec3_t dir) {
line 912
;910:	gentity_t	*bolt;
;911:
;912:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 914
;913:
;914:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 915
;915:	bolt->classname = "grenade";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $265
ASGNP4
line 916
;916:	bolt->nextthink = level.time + 2500;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2500
ADDI4
ASGNI4
line 917
;917:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 918
;918:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 919
;919:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 920
;920:	bolt->s.weapon = WP_GRENADE_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 4
ASGNI4
line 921
;921:	bolt->s.eFlags = EF_BOUNCE_HALF;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 32
ASGNI4
line 922
;922:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 925
;923://unlagged - projectile nudge
;924:	// we'll need this for nudging projectiles later
;925:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 927
;926://unlagged - projectile nudge
;927:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 928
;928:	bolt->damage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 100
ASGNI4
line 929
;929:	bolt->splashDamage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 100
ASGNI4
line 930
;930:	bolt->splashRadius = 150;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 150
ASGNI4
line 931
;931:	bolt->methodOfDeath = MOD_GRENADE;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 4
ASGNI4
line 932
;932:	bolt->splashMethodOfDeath = MOD_GRENADE_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 5
ASGNI4
line 933
;933:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 934
;934:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 936
;935:
;936:	bolt->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 937
;937:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 938
;938:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 939
;939:	VectorScale( dir, 700, bolt->s.pos.trDelta );
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
line 940
;940:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 942
;941:
;942:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 944
;943:
;944:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $264
endproc fire_grenade 32 4
export fire_flame
proc fire_flame 32 4
line 955
;945:}
;946:
;947://=============================================================================
;948:
;949:/*
;950:=================
;951:fire_flame
;952:Shafe - Trep - Flame Thrower
;953:=================
;954:*/
;955:gentity_t *fire_flame (gentity_t *self, vec3_t start, vec3_t dir, qboolean alt) {
line 959
;956:
;957:	gentity_t	*bolt;
;958:
;959:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 961
;960:
;961:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 962
;962:	bolt->classname = "flame";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $269
ASGNP4
line 963
;963:	bolt->nextthink = level.time + 1500;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 964
;964:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 965
;965:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 966
;966:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 967
;967:	bolt->s.weapon = WP_LIGHTNING;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 6
ASGNI4
line 968
;968:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 971
;969://unlagged - projectile nudge
;970:	// we'll need this for nudging projectiles later
;971:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 973
;972://unlagged - projectile nudge
;973:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 976
;974:	
;975:	
;976:	if (alt == qfalse ) 
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $271
line 977
;977:	{
line 978
;978:		bolt->methodOfDeath = MOD_ALTFLAMER;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 26
ASGNI4
line 979
;979:		bolt->damage = 70;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 70
ASGNI4
line 980
;980:		bolt->splashDamage = 55;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 55
ASGNI4
line 981
;981:		bolt->splashRadius = 55;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 55
ASGNI4
line 982
;982:	} else
ADDRGP4 $272
JUMPV
LABELV $271
line 983
;983:	{
line 984
;984:		bolt->methodOfDeath = MOD_ALTFLAMER;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 26
ASGNI4
line 985
;985:		bolt->damage = 30;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 30
ASGNI4
line 986
;986:		bolt->splashDamage = 25;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 25
ASGNI4
line 987
;987:		bolt->splashRadius = 45;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 45
ASGNI4
line 988
;988:		bolt->s.eFlags |= EF_ALT_FIRING;
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
line 989
;989:	}
LABELV $272
line 991
;990:
;991:	bolt->splashMethodOfDeath = MOD_ALTFLAMER;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 26
ASGNI4
line 992
;992:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 994
;993:
;994:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 995
;995:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 996
;996:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 997
;997:	VectorScale( dir, 300, bolt->s.pos.trDelta );
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
line 998
;998:	SnapVector( bolt->s.pos.trDelta );// save net bandwidth
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
line 1000
;999:
;1000:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1002
;1001:
;1002:return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $268
endproc fire_flame 32 4
export fire_altgrenade
proc fire_altgrenade 36 4
line 1016
;1003:}
;1004:
;1005:
;1006:
;1007:
;1008:
;1009:
;1010:/*
;1011:=================
;1012:fire_altgrenade
;1013:Shafe - Trep - Sticky Grenades for Alt
;1014:=================
;1015:*/
;1016:gentity_t *fire_altgrenade (gentity_t *self, vec3_t start, vec3_t dir) {
line 1019
;1017:	gentity_t	*bolt;
;1018:
;1019:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1021
;1020:
;1021:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1022
;1022:	bolt->classname = "grenade";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $265
ASGNP4
line 1023
;1023:	bolt->nextthink = level.time + 2500;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2500
ADDI4
ASGNI4
line 1024
;1024:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 1025
;1025:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1026
;1026:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1027
;1027:	bolt->s.weapon = WP_GRENADE_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 4
ASGNI4
line 1029
;1028://	bolt->s.eFlags = EF_BOUNCE_HALF;  // Simple Change
;1029:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1032
;1030://unlagged - projectile nudge
;1031:	// we'll need this for nudging projectiles later
;1032:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1034
;1033://unlagged - projectile nudge
;1034:	bolt->s.eFlags |= EF_ALT_FIRING;
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
line 1035
;1035:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1036
;1036:	bolt->damage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 100
ASGNI4
line 1037
;1037:	bolt->splashDamage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 100
ASGNI4
line 1038
;1038:	bolt->splashRadius = 150;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 150
ASGNI4
line 1039
;1039:	bolt->methodOfDeath = MOD_GRENADE;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 4
ASGNI4
line 1040
;1040:	bolt->splashMethodOfDeath = MOD_GRENADE_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 5
ASGNI4
line 1041
;1041:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1042
;1042:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1044
;1043:
;1044:	bolt->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 1045
;1045:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1046
;1046:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1047
;1047:	VectorScale( dir, 700, bolt->s.pos.trDelta );
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
line 1048
;1048:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 1050
;1049:
;1050:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1052
;1051:
;1052:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $274
endproc fire_altgrenade 36 4
export fire_devparticle
proc fire_devparticle 36 4
line 1064
;1053:}
;1054:
;1055://=============================================================================
;1056:
;1057:
;1058:
;1059:/*
;1060:=================
;1061:fire_devparticle
;1062:=================
;1063:*/
;1064:gentity_t *fire_devparticle (gentity_t *self, vec3_t start, vec3_t dir, qboolean alt) {
line 1067
;1065:	gentity_t	*bolt;
;1066:	//int			speed;
;1067:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1069
;1068:
;1069:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1070
;1070:	bolt->classname = "bfg";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $278
ASGNP4
line 1072
;1071:
;1072:	if (alt == qfalse)
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $279
line 1073
;1073:	{
line 1074
;1074:	bolt->think = G_ExplodeDevastatorFire2;	
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeDevastatorFire2
ASGNP4
line 1075
;1075:	bolt->nextthink = level.time + 1500;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 1076
;1076:	} else {
ADDRGP4 $280
JUMPV
LABELV $279
line 1077
;1077:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 1078
;1078:	bolt->nextthink = level.time + 9000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 9000
ADDI4
ASGNI4
line 1079
;1079:	}
LABELV $280
line 1082
;1080:	
;1081:
;1082:	bolt->s.eFlags |= EF_ALT_FIRING;
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
line 1083
;1083:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1085
;1084:	//bolt->s.eFlags = EF_BOUNCE_HALF;
;1085:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1086
;1086:	bolt->s.weapon = WP_BFG;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 9
ASGNI4
line 1087
;1087:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1090
;1088://unlagged - projectile nudge
;1089:	// we'll need this for nudging projectiles later
;1090:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1092
;1091://unlagged - projectile nudge
;1092:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1094
;1093:	
;1094:	bolt->methodOfDeath = MOD_BFG;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 12
ASGNI4
line 1095
;1095:	bolt->splashMethodOfDeath = MOD_BFG_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 13
ASGNI4
line 1096
;1096:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1097
;1097:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1098
;1098:	bolt->s.pos.trType = TR_ORBITAL;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 6
ASGNI4
line 1099
;1099:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1101
;1100:
;1101:	bolt->damage = 500;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 500
ASGNI4
line 1102
;1102:	bolt->splashDamage = 300;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 300
ASGNI4
line 1103
;1103:	bolt->splashRadius = 420;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 420
ASGNI4
line 1104
;1104:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1105
;1105:	VectorScale( dir, 60, bolt->s.pos.trDelta );
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
line 1107
;1106:
;1107:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 1108
;1108:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1110
;1109:
;1110:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $277
endproc fire_devparticle 36 4
export fire_bfg
proc fire_bfg 32 4
line 1121
;1111:
;1112:
;1113:}
;1114:
;1115:
;1116:/*
;1117:=================
;1118:fire_bfg
;1119:=================
;1120:*/
;1121:gentity_t *fire_bfg (gentity_t *self, vec3_t start, vec3_t dir, qboolean alt) {
line 1124
;1122:	gentity_t	*bolt;
;1123:	//int			speed;
;1124:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1126
;1125:
;1126:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1127
;1127:	bolt->classname = "bfg";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $278
ASGNP4
line 1128
;1128:	bolt->s.time2 = 0;
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 1129
;1129:	bolt->nextthink = level.time + 3000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 1131
;1130:	
;1131:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1132
;1132:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1133
;1133:	bolt->s.weapon = WP_BFG;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 9
ASGNI4
line 1134
;1134:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1137
;1135://unlagged - projectile nudge
;1136:	// we'll need this for nudging projectiles later
;1137:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1139
;1138://unlagged - projectile nudge
;1139:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1141
;1140:	
;1141:	bolt->methodOfDeath = MOD_BFG;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 12
ASGNI4
line 1142
;1142:	bolt->splashMethodOfDeath = MOD_BFG_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 13
ASGNI4
line 1143
;1143:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1144
;1144:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1145
;1145:	bolt->s.pos.trType = TR_ORBITAL;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 6
ASGNI4
line 1146
;1146:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1148
;1147:
;1148:	if (alt == qtrue)
ADDRFP4 12
INDIRI4
CNSTI4 1
NEI4 $287
line 1149
;1149:	{
line 1151
;1150:		// Alt Fire
;1151:		bolt->damage = 500;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 500
ASGNI4
line 1152
;1152:		bolt->splashDamage = 300;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 300
ASGNI4
line 1153
;1153:		bolt->splashRadius = 420;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 420
ASGNI4
line 1154
;1154:		bolt->s.eFlags |= EF_ALT_FIRING;
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
line 1155
;1155:		bolt->think = G_ExplodeDevastatorFire;		
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeDevastatorFire
ASGNP4
line 1156
;1156:		VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1157
;1157:		VectorScale( dir, 325, bolt->s.pos.trDelta );
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
line 1160
;1158:		
;1159:	
;1160:	} 
ADDRGP4 $288
JUMPV
LABELV $287
line 1162
;1161:	else
;1162:	{
line 1165
;1163:		// Regular Fire
;1164:
;1165:		bolt->damage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 100
ASGNI4
line 1166
;1166:		bolt->splashDamage = 200;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 200
ASGNI4
line 1167
;1167:		bolt->splashRadius = 220;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 220
ASGNI4
line 1168
;1168:		bolt->think = G_HomingMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_HomingMissile
ASGNP4
line 1169
;1169:		VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1170
;1170:		VectorScale( dir, 325, bolt->s.pos.trDelta );
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
line 1172
;1171:
;1172:	}
LABELV $288
line 1175
;1173:
;1174:	
;1175:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 1176
;1176:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1178
;1177:
;1178:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $284
endproc fire_bfg 32 4
export fire_rocket
proc fire_rocket 32 4
line 1191
;1179:
;1180:
;1181:}
;1182:
;1183://=============================================================================
;1184:
;1185:
;1186:/*
;1187:=================
;1188:fire_rocket
;1189:=================
;1190:*/
;1191:gentity_t *fire_rocket (gentity_t *self, vec3_t start, vec3_t dir) {
line 1194
;1192:	gentity_t	*bolt;
;1193:
;1194:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1196
;1195:
;1196:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1197
;1197:	bolt->classname = "rocket";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $290
ASGNP4
line 1198
;1198:	bolt->nextthink = level.time + 15000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 15000
ADDI4
ASGNI4
line 1199
;1199:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 1200
;1200:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1201
;1201:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1202
;1202:	bolt->s.weapon = WP_ROCKET_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 5
ASGNI4
line 1203
;1203:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1206
;1204://unlagged - projectile nudge
;1205:	// we'll need this for nudging projectiles later
;1206:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1208
;1207://unlagged - projectile nudge
;1208:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1209
;1209:	bolt->damage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 100
ASGNI4
line 1210
;1210:	bolt->splashDamage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 100
ASGNI4
line 1211
;1211:	bolt->splashRadius = 120;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 120
ASGNI4
line 1212
;1212:	bolt->methodOfDeath = MOD_ROCKET;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 6
ASGNI4
line 1213
;1213:	bolt->splashMethodOfDeath = MOD_ROCKET_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 7
ASGNI4
line 1214
;1214:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1215
;1215:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1217
;1216:
;1217:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 1218
;1218:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1219
;1219:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1220
;1220:	VectorScale( dir, 900, bolt->s.pos.trDelta );
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
line 1221
;1221:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 1222
;1222:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1224
;1223:
;1224:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $289
endproc fire_rocket 32 4
export fire_alt_rocket
proc fire_alt_rocket 48 4
line 1233
;1225:}
;1226:
;1227:
;1228:/*
;1229:=================
;1230:fire_alt_rocket
;1231:=================
;1232:*/
;1233:gentity_t *fire_alt_rocket (gentity_t *self, vec3_t start, vec3_t dir) {
line 1236
;1234:	gentity_t	*bolt;
;1235:
;1236:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1238
;1237:
;1238:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1239
;1239:	bolt->classname = "rocket";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $290
ASGNP4
line 1240
;1240:	bolt->think = G_HomingMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_HomingMissile
ASGNP4
line 1241
;1241:	bolt->nextthink = level.time + FIRST_HOMING_THINK;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 1242
;1242:	bolt->lastthinktime = level.time + 15000;
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 15000
ADDI4
ASGNI4
line 1243
;1243:	bolt->lastthink = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 1244
;1244:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1245
;1245:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1246
;1246:	bolt->s.weapon = WP_ROCKET_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 5
ASGNI4
line 1247
;1247:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1250
;1248:	//unlagged - projectile nudge
;1249:	// we'll need this for nudging projectiles later
;1250:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1252
;1251:	//unlagged - projectile nudge
;1252:	bolt->s.eFlags |= EF_ALT_FIRING;
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
line 1253
;1253:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1254
;1254:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1255
;1255:	bolt->damage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 100
ASGNI4
line 1256
;1256:	bolt->splashDamage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 100
ASGNI4
line 1257
;1257:	bolt->splashRadius = 120;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 120
ASGNI4
line 1258
;1258:	bolt->methodOfDeath = MOD_ROCKET;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 6
ASGNI4
line 1259
;1259:	bolt->splashMethodOfDeath = MOD_ROCKET_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 7
ASGNI4
line 1260
;1260:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1261
;1261:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1262
;1262:	bolt->s.otherEntityNum2 = ENTITYNUM_WORLD;
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1022
ASGNI4
line 1266
;1263:
;1264:
;1265:
;1266:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 1267
;1267:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1268
;1268:	bolt->constantSpeed = HOMING_MISSILE_SPEED;
ADDRLP4 0
INDIRP4
CNSTI4 892
ADDP4
CNSTI4 800
ASGNI4
line 1269
;1269:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1270
;1270:	VectorScale( dir, bolt->constantSpeed, bolt->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 892
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
CNSTI4 892
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
CNSTI4 892
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 1271
;1271:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 36
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
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 40
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
ADDRLP4 0
INDIRP4
CNSTI4 44
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
line 1272
;1272:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1273
;1273:	VectorCopy (dir, bolt->r.currentAngles);		// this is new line.
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 1275
;1274:
;1275:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $293
endproc fire_alt_rocket 48 4
export fire_mg
proc fire_mg 32 4
line 1285
;1276:}
;1277:
;1278:
;1279:/*
;1280:=================
;1281:fire_mg
;1282:
;1283:=================
;1284:*/
;1285:gentity_t *fire_mg (gentity_t *self, vec3_t start, vec3_t dir, qboolean alt) {
line 1288
;1286:	gentity_t	*bolt;
;1287:
;1288:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1290
;1289:
;1290:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1291
;1291:	bolt->classname = "machinegun";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $298
ASGNP4
line 1292
;1292:	bolt->nextthink = level.time + 10000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 1293
;1293:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 1294
;1294:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1295
;1295:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1296
;1296:	bolt->s.weapon = WP_MACHINEGUN;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 2
ASGNI4
line 1297
;1297:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1300
;1298:	//unlagged - projectile nudge
;1299:	// we'll need this for nudging projectiles later
;1300:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1302
;1301:	//unlagged - projectile nudge
;1302:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1304
;1303:	
;1304:	if (alt == qtrue)
ADDRFP4 12
INDIRI4
CNSTI4 1
NEI4 $300
line 1305
;1305:	{
line 1306
;1306:		bolt->damage = 20;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 20
ASGNI4
line 1307
;1307:		bolt->splashDamage = 10;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 10
ASGNI4
line 1308
;1308:		bolt->splashRadius = 10;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 10
ASGNI4
line 1310
;1309:		//bolt->s.time2 = 555; // 555 is alt fire?
;1310:		bolt->s.eFlags |= EF_ALT_FIRING;
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
line 1312
;1311:
;1312:	} 
ADDRGP4 $301
JUMPV
LABELV $300
line 1314
;1313:	else
;1314:	{
line 1315
;1315:		bolt->damage = 10;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 10
ASGNI4
line 1316
;1316:		bolt->splashDamage = 5;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 5
ASGNI4
line 1317
;1317:		bolt->splashRadius = 5;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 5
ASGNI4
line 1318
;1318:	}
LABELV $301
line 1319
;1319:	bolt->methodOfDeath = MOD_MACHINEGUN;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 3
ASGNI4
line 1320
;1320:	bolt->splashMethodOfDeath = MOD_MACHINEGUN;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 3
ASGNI4
line 1321
;1321:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1322
;1322:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1324
;1323:
;1324:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 1325
;1325:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1326
;1326:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1327
;1327:   	VectorScale( dir, 2000, bolt->s.pos.trDelta );
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
line 1328
;1328:   	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 1330
;1329:   
;1330:   	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1332
;1331:   
;1332:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $297
endproc fire_mg 32 4
export fire_turret
proc fire_turret 32 4
line 1341
;1333:}
;1334:
;1335:/*
;1336:=================
;1337:fire_turret
;1338:
;1339:=================
;1340:*/
;1341:gentity_t *fire_turret (gentity_t *self, vec3_t start, vec3_t dir, qboolean alt) {
line 1344
;1342:	gentity_t	*bolt;
;1343:
;1344:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1346
;1345:
;1346:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1347
;1347:	bolt->classname = "plasma";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $198
ASGNP4
line 1348
;1348:	bolt->nextthink = level.time + 10000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 1349
;1349:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 1350
;1350:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1351
;1351:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1352
;1352:	bolt->s.weapon = WP_MACHINEGUN;  // Shafe FIXME: Maybe this should be WP_TURRET?
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 2
ASGNI4
line 1353
;1353:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1356
;1354:	//unlagged - projectile nudge
;1355:	// we'll need this for nudging projectiles later
;1356:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1358
;1357:	//unlagged - projectile nudge
;1358:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1361
;1359:	
;1360:	
;1361:	if (alt == qtrue)
ADDRFP4 12
INDIRI4
CNSTI4 1
NEI4 $305
line 1362
;1362:	{
line 1363
;1363:		bolt->damage = 20;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 20
ASGNI4
line 1364
;1364:		bolt->splashDamage = 10;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 10
ASGNI4
line 1365
;1365:		bolt->splashRadius = 10;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 10
ASGNI4
line 1366
;1366:		bolt->s.eFlags |= EF_ALT_FIRING;
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
line 1368
;1367:
;1368:	} 
ADDRGP4 $306
JUMPV
LABELV $305
line 1370
;1369:	else
;1370:	{
line 1371
;1371:		bolt->damage = 10;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 10
ASGNI4
line 1372
;1372:		bolt->splashDamage = 5;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 5
ASGNI4
line 1373
;1373:		bolt->splashRadius = 5;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 5
ASGNI4
line 1374
;1374:	}
LABELV $306
line 1375
;1375:	bolt->methodOfDeath = MOD_TURRET;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 24
ASGNI4
line 1376
;1376:	bolt->splashMethodOfDeath = MOD_TURRET;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 24
ASGNI4
line 1377
;1377:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1378
;1378:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1380
;1379:
;1380:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 1381
;1381:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1382
;1382:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1383
;1383:   	VectorScale( dir, 2000, bolt->s.pos.trDelta );
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
line 1384
;1384:   	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 1386
;1385:   
;1386:   	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1388
;1387:   
;1388:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $303
endproc fire_turret 32 4
export fire_grapple
proc fire_grapple 36 4
line 1396
;1389:}
;1390:
;1391:/*
;1392:=================
;1393:fire_grapple
;1394:=================
;1395:*/
;1396:gentity_t *fire_grapple (gentity_t *self, vec3_t start, vec3_t dir) {
line 1402
;1397:	gentity_t	*hook;
;1398://unlagged - grapple
;1399:	int hooktime;
;1400://unlagged - grapple
;1401:
;1402:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1404
;1403:
;1404:	hook = G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1405
;1405:	hook->classname = "hook";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $212
ASGNP4
line 1406
;1406:	hook->nextthink = level.time + 10000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 1407
;1407:	hook->think = Weapon_HookFree;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 Weapon_HookFree
ASGNP4
line 1408
;1408:	hook->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1409
;1409:	hook->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1410
;1410:	hook->s.weapon = WP_GRAPPLING_HOOK;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 10
ASGNI4
line 1411
;1411:	hook->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1412
;1412:	hook->methodOfDeath = MOD_GRAPPLE;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 25
ASGNI4
line 1413
;1413:	hook->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1414
;1414:	hook->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1415
;1415:	hook->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1417
;1416:	
;1417:	if (g_GrappleMode.integer == 1) // 0 - Normal, 1 - Instagib, 2 - Holds People
ADDRGP4 g_GrappleMode+12
INDIRI4
CNSTI4 1
NEI4 $310
line 1418
;1418:	{
line 1419
;1419:		hook->damage = 999;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 999
ASGNI4
line 1420
;1420:		hook->splashDamage = 50;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 50
ASGNI4
line 1421
;1421:		hook->splashRadius = 10;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 10
ASGNI4
line 1422
;1422:	}
LABELV $310
line 1424
;1423:
;1424:	if (g_GrappleMode.integer == 2) // 0 - Normal, 1 - Instagib, 2 - Holds People
ADDRGP4 g_GrappleMode+12
INDIRI4
CNSTI4 2
NEI4 $313
line 1425
;1425:	{
line 1426
;1426:		hook->damage = 0.01;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 0
ASGNI4
line 1427
;1427:		hook->splashDamage = 1;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 1
ASGNI4
line 1428
;1428:		hook->splashRadius = 1;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 1
ASGNI4
line 1429
;1429:	}
LABELV $313
line 1433
;1430:
;1431://unlagged - grapple
;1432:	// we might want this later
;1433:	hook->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1438
;1434:
;1435:	// setting the projectile base time back makes the hook's first
;1436:	// step larger
;1437:
;1438:	if ( self->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $316
line 1439
;1439:		hooktime = self->client->pers.cmd.serverTime + 50;
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
line 1440
;1440:	}
ADDRGP4 $317
JUMPV
LABELV $316
line 1441
;1441:	else {
line 1442
;1442:		hooktime = level.time - MISSILE_PRESTEP_TIME;
ADDRLP4 4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1443
;1443:	}
LABELV $317
line 1445
;1444:
;1445:	hook->s.pos.trTime = hooktime;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1448
;1446://unlagged - grapple
;1447:
;1448:	hook->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 1452
;1449://unlagged - grapple
;1450:	//hook->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
;1451://unlagged - grapple
;1452:	hook->s.otherEntityNum = self->s.number; // use to match beam in client
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1453
;1453:	VectorCopy( start, hook->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1454
;1454:	VectorScale( dir, 800, hook->s.pos.trDelta );
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
line 1455
;1455:	SnapVector( hook->s.pos.trDelta );			// save net bandwidth
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
line 1456
;1456:	VectorCopy (start, hook->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1458
;1457:
;1458:	self->client->hook = hook;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2692
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1460
;1459:
;1460:	return hook;
ADDRLP4 0
INDIRP4
RETP4
LABELV $308
endproc fire_grapple 36 4
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
LABELV $298
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
LABELV $290
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $278
byte 1 98
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $269
byte 1 102
byte 1 108
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $265
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $258
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
LABELV $212
byte 1 104
byte 1 111
byte 1 111
byte 1 107
byte 1 0
align 1
LABELV $198
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 0
align 1
LABELV $84
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
