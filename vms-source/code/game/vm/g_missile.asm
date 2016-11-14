export pdg_explode
code
proc pdg_explode 28 12
file "../g_missile.c"
line 19
;1:// 2016 Trepidation Licensed under the GPL2
;2://
;3:#include "g_local.h"
;4:
;5:#define	MISSILE_PRESTEP_TIME	50
;6:#define FIRST_HOMING_THINK		500
;7:#define HOMING_THINK			125
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
export bomb_explode
proc bomb_explode 24 12
line 42
;41:
;42:void bomb_explode(gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod){
line 46
;43:
;44:	vec3_t dir; // needed by the event being added
;45:
;46:	dir[0] = dir[1] = 0;
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
line 47
;47:	dir[2] = 1;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 48
;48:	if (self->chain)
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $66
line 49
;49:		G_FreeEntity(self->chain); // get rid of the gun. // the gun just vanishes
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
LABELV $66
line 50
;50:		self->s.weapon=WP_ROCKET_LAUNCHER; // to tell it what kind of explosion to use
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 5
ASGNI4
line 51
;51:		G_AddEvent( self, EV_MISSILE_MISS, DirToByte( dir ) ); // to tell it to spawn an explosion here	
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
line 52
;52:		self->freeAfterEvent = qtrue; // so it goes away after the explosion
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 54
;53:
;54:	if (self->parent->istelepoint != 0)
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 840
ADDP4
INDIRI4
CNSTI4 0
EQI4 $68
line 55
;55:	{
line 56
;56:		trap_SendServerCommand( self->r.ownerNum, va("cp \"^9%s Destroyed your bomb!\n\"", attacker->client->pers.netname) );
ADDRGP4 $70
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
line 57
;57:	}
LABELV $68
line 58
;58:	self->parent->client->bombfired = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2720
ADDP4
CNSTI4 0
ASGNI4
line 64
;59:	
;60:
;61:	
;62:
;63:
;64:}
LABELV $63
endproc bomb_explode 24 12
export G_Missile_Die
proc G_Missile_Die 0 0
line 71
;65:
;66:/*
;67:================
;68:G_Missile_Die
;69:================
;70:*/
;71:void G_Missile_Die( gentity_t *ent, gentity_t *inflictor, gentity_t *attacker, int damage, int mod ) {
line 72
;72:	ent->nextthink = level.time + 1;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 73
;73:	ent->think = G_ExplodeMissile;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 75
;74:
;75:}
LABELV $71
endproc G_Missile_Die 0 0
export G_BounceMissile
proc G_BounceMissile 56 12
line 83
;76:
;77:/*
;78:================
;79:G_BounceMissile
;80:
;81:================
;82:*/
;83:void G_BounceMissile( gentity_t *ent, trace_t *trace ) {
line 89
;84:	vec3_t	velocity;
;85:	float	dot;
;86:	int		hitTime;
;87:
;88:	// reflect the velocity on the trace plane
;89:	hitTime = level.previousTime + ( level.time - level.previousTime ) * trace->fraction;
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
line 90
;90:	BG_EvaluateTrajectoryDelta( &ent->s.pos, hitTime, velocity );
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
line 91
;91:	dot = DotProduct( velocity, trace->plane.normal );
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
line 92
;92:	VectorMA( velocity, -2*dot, trace->plane.normal, ent->s.pos.trDelta );
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
line 94
;93:
;94:	if ( ent->s.eFlags & EF_BOUNCE_HALF ) 
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $81
line 95
;95:	{
line 96
;96:		VectorScale( ent->s.pos.trDelta, 0.65, ent->s.pos.trDelta );
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
line 98
;97:		// check for stop
;98:		if ( trace->plane.normal[2] > 0.2 && VectorLength( ent->s.pos.trDelta ) < 40 )
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 1045220557
LEF4 $83
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
GEF4 $83
line 99
;99:		{
line 100
;100:			G_SetOrigin( ent, trace->endpos );				
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
line 103
;101:			
;102:			// Shafe - trep - pdg
;103:			if ( !Q_stricmp( ent->classname, "pdgrenade") )
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRGP4 $87
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $73
line 104
;104:			{
line 105
;105:				if ( ent->client->ps.stats[STAT_HEALTH] <= 0 ) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $88
line 106
;106:				{ // Don't do anything when you are dead -Vincent
line 107
;107: 					if ( ent->parent->istelepoint != 0 )
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 840
ADDP4
INDIRI4
CNSTI4 0
EQI4 $73
line 108
;108:					{ // Failsafe
line 109
;109:					ent->parent->istelepoint = 0;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 0
ASGNI4
line 110
;110:					VectorClear( ent->parent->teleloc );
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
line 111
;111:					}
line 112
;112:					return;
ADDRGP4 $73
JUMPV
LABELV $88
line 114
;113:				}
;114:				ent->parent->istelepoint = 1;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 1
ASGNI4
line 115
;115:				VectorCopy(ent->r.currentOrigin, ent->parent->teleloc);
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
line 116
;116:				ent->parent->teleloc[2] += 20;
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
line 118
;117:							
;118:				trap_SendServerCommand( ent->r.ownerNum, va("cp \"^9Particle Displacement Grenade Lock!\n\"") );
ADDRGP4 $92
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
line 120
;119:				//G_Printf( S_COLOR_RED "Particle Displacement Grenade Lock!\n" );
;120:			} // end shafe
line 122
;121:			
;122:			return;
ADDRGP4 $73
JUMPV
LABELV $83
line 124
;123:		}
;124:	}
LABELV $81
line 126
;125:
;126:	VectorAdd( ent->r.currentOrigin, trace->plane.normal, ent->r.currentOrigin);
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
line 127
;127:	VectorCopy( ent->r.currentOrigin, ent->s.pos.trBase );
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
line 128
;128:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 129
;129:}
LABELV $73
endproc G_BounceMissile 56 12
export G_HomingMissile
proc G_HomingMissile 96 12
line 133
;130:
;131:
;132:
;133:void G_HomingMissile( gentity_t *ent ) {
line 134
;134:	gentity_t	*target = NULL;
ADDRLP4 32
CNSTP4 0
ASGNP4
line 135
;135:	gentity_t	*blip = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 140
;136:	vec3_t		dir, blipdir;
;137:	vec_t		dot, cs;
;138:	qboolean	chaff;
;139:
;140:	if (ent->parent->health <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 0
GTI4 $99
line 141
;141:	{
line 142
;142:		ent->nextthink = level.time + 4000;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 4000
ADDI4
ASGNI4
line 143
;143:		ent->think = G_ExplodeMissile;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 144
;144:		return;
ADDRGP4 $94
JUMPV
LABELV $98
line 148
;145:	}
;146:
;147:
;148:	while ((blip = findradius(blip, ent->r.currentOrigin, 2000 * 2000)) != NULL)	{
line 149
;149:			chaff = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 151
;150:
;151:			if (blip->client==NULL)			continue;
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $101
ADDRGP4 $99
JUMPV
LABELV $101
line 152
;152:			if (blip==ent->parent)			continue;
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CVPU4 4
NEU4 $103
ADDRGP4 $99
JUMPV
LABELV $103
line 153
;153:			if (blip->health<=0)			continue;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 0
GTI4 $105
ADDRGP4 $99
JUMPV
LABELV $105
line 154
;154:			if (blip->client->sess.sessionTeam >= TEAM_SPECTATOR)
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2568
ADDP4
INDIRI4
CNSTI4 3
LTI4 $107
line 155
;155:				continue;
ADDRGP4 $99
JUMPV
LABELV $107
line 157
;156:
;157:			if ((g_gametype.integer == GT_TEAM || g_gametype.integer == GT_CTF) &&
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $113
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $109
LABELV $113
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
EQI4 $109
line 159
;158:				OnSameTeam( blip, ent->parent ) )
;159:				continue;
ADDRGP4 $99
JUMPV
LABELV $109
line 162
;160:		
;161:
;162:		if (!visible (ent, blip))
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
NEI4 $114
line 163
;163:			continue;
ADDRGP4 $99
JUMPV
LABELV $114
line 165
;164:
;165:		VectorSubtract(blip->r.currentOrigin, ent->r.currentOrigin, blipdir);
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
line 168
;166:
;167:		//NT - give chaff a higher weight
;168:		if (chaff)
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $118
line 169
;169:		{
line 170
;170:			VectorScale(blipdir, 0.5, blipdir);
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
line 171
;171:		}
LABELV $118
line 173
;172:
;173:		if ((target == NULL) || (VectorLength(blipdir) < VectorLength(dir)))
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $126
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
GEF4 $124
LABELV $126
line 174
;174:		{
line 175
;175:			if (chaff)
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $127
line 176
;176:			{
line 177
;177:				VectorScale(blipdir, 2, blipdir);
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
line 178
;178:			}
LABELV $127
line 181
;179:
;180:			// E.B = |E||B|cos(theta)
;181:			dot = _DotProduct(ent->r.currentAngles, blipdir);
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
line 184
;182:
;183:			// Divide E.B by |E||B| to get cos(theta)
;184:			cs = dot / (VectorLength(ent->r.currentAngles) * VectorLength(blipdir));
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
line 187
;185:
;186:			// If angle is less than 120 degrees
;187:			if (cs > cos(120.0f * M_PI / 180.0f))
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
LEF4 $133
line 188
;188:			{
line 190
;189:				// We add it as our target
;190:				target = blip;
ADDRLP4 32
ADDRLP4 0
INDIRP4
ASGNP4
line 191
;191:				VectorCopy(blipdir, dir);
ADDRLP4 20
ADDRLP4 4
INDIRB
ASGNB 12
line 192
;192:			}
LABELV $133
line 193
;193:		}
LABELV $124
line 194
;194:	}
LABELV $99
line 148
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
NEU4 $98
line 196
;195:
;196:	if (target == NULL)	{
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $135
line 197
;197:		ent->nextthink = level.time + HOMING_THINK; // + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 125
ADDI4
ASGNI4
line 198
;198:		ent->think = G_HomingMissile;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_HomingMissile
ASGNP4
line 199
;199:	} else {
ADDRGP4 $136
JUMPV
LABELV $135
line 201
;200:		// for exact trajectory calculation, set current point to base.
;201:		VectorCopy(ent->r.currentOrigin, ent->s.pos.trBase );
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
line 203
;202:
;203:		VectorNormalize(dir);
ADDRLP4 20
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 205
;204:		// 0.5 is swing rate.
;205:		VectorScale(dir, 0.5, dir);
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
line 206
;206:		VectorAdd(dir,ent->r.currentAngles,dir);
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
line 209
;207:
;208:		// turn nozzle to target angle
;209:		VectorNormalize(dir);
ADDRLP4 20
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 210
;210:		VectorCopy(dir, ent->r.currentAngles);
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ADDRLP4 20
INDIRB
ASGNB 12
line 213
;211:
;212:		// scale direction, put into trDelta
;213:		VectorScale(dir, ent->constantSpeed, dir);
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
line 214
;214:		VectorCopy(dir, ent->s.pos.trDelta);
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 20
INDIRB
ASGNB 12
line 216
;215:
;216:		ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 218
;217:
;218:		SnapVector (ent->s.pos.trDelta);                      // save net bandwidth
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
line 219
;219:		ent->nextthink = level.time + HOMING_THINK;	// decrease this value also makes fast swing
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 125
ADDI4
ASGNI4
line 220
;220:		ent->think = G_HomingMissile;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_HomingMissile
ASGNP4
line 221
;221:	}
LABELV $136
line 222
;222:}
LABELV $94
endproc G_HomingMissile 96 12
export G_ExplodeDevastatorFire2
proc G_ExplodeDevastatorFire2 72 24
line 231
;223:
;224:
;225:/*
;226:========================
;227:G_ExplodeDevastatorFire
;228:
;229:========================
;230:*/
;231:void G_ExplodeDevastatorFire2( gentity_t *ent ) {
line 241
;232:	vec3_t		dir;
;233:	vec3_t		origin;
;234:	vec3_t		dev1;
;235:	vec3_t		dev2;
;236:	/*
;237:	vec3_t		dev3;
;238:	vec3_t		dev4;
;239:	*/
;240:
;241:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
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
line 242
;242:	SnapVector( origin );
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
line 243
;243:	G_SetOrigin( ent, origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 246
;244:
;245:	// we don't have a valid direction, so just point straight up
;246:	dir[0] = dir[1] = 0;
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
line 247
;247:	dir[2] = 10;
ADDRLP4 12+8
CNSTF4 1092616192
ASGNF4
line 249
;248:
;249:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 250
;250:	G_AddEvent( ent, EV_MISSILE_MISS, DirToByte( dir ) );
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
line 252
;251:
;252:	ent->s.time2++;
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
line 254
;253:	
;254:	ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 257
;255:
;256:	// splash damage
;257:	if ( ent->splashDamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
CNSTI4 0
EQI4 $160
line 258
;258:		if( G_RadiusDamage( ent->r.currentOrigin, ent->parent, ent->splashDamage, ent->splashRadius, NULL
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
EQI4 $162
line 259
;259:			, ent->splashMethodOfDeath ) ) {
line 261
;260:			//g_entities[ent->r.ownerNum].client->ps.persistant[PERS_ACCURACY_HITS]++;
;261:		}
LABELV $162
line 262
;262:	}
LABELV $160
line 265
;263:
;264:
;265:		VectorSet(dev1, 25, 25, (30+ irandom(10,35)));
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
line 266
;266:		VectorSet(dev2, -25, 25, (30+ irandom(10,35)));
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
line 267
;267:		fire_devparticle (ent, origin, dev1, qtrue);
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
line 268
;268:		fire_devparticle (ent->parent, origin, dev2, qtrue);
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
line 271
;269:
;270:
;271:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 273
;272:	
;273:}
LABELV $152
endproc G_ExplodeDevastatorFire2 72 24
export G_ExplodeDevastatorFire
proc G_ExplodeDevastatorFire 116 24
line 276
;274:
;275:
;276:void G_ExplodeDevastatorFire( gentity_t *ent ) {
line 285
;277:	vec3_t		dir;
;278:	vec3_t		origin;
;279:	vec3_t		dev1;
;280:	vec3_t		dev2;
;281:	vec3_t		dev3;
;282:	vec3_t		dev4;
;283:
;284:
;285:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
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
line 286
;286:	SnapVector( origin );
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
line 287
;287:	G_SetOrigin( ent, origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 290
;288:
;289:	// we don't have a valid direction, so just point straight up
;290:	dir[0] = dir[1] = 0;
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
line 291
;291:	dir[2] = 10;
ADDRLP4 12+8
CNSTF4 1092616192
ASGNF4
line 293
;292:
;293:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 294
;294:	G_AddEvent( ent, EV_MISSILE_MISS, DirToByte( dir ) );
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
line 296
;295:
;296:	ent->s.time2++;
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
line 298
;297:	
;298:	ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 301
;299:
;300:	// splash damage
;301:	if ( ent->splashDamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
CNSTI4 0
EQI4 $176
line 302
;302:		if( G_RadiusDamage( ent->r.currentOrigin, ent->parent, ent->splashDamage, ent->splashRadius, NULL
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
EQI4 $178
line 303
;303:			, ent->splashMethodOfDeath ) ) {
line 305
;304:			//g_entities[ent->r.ownerNum].client->ps.persistant[PERS_ACCURACY_HITS]++;
;305:		}
LABELV $178
line 306
;306:	}
LABELV $176
line 309
;307:
;308:
;309:		VectorSet(dev1, (25+ irandom(1,35)), (25+ irandom(10,35)), 30);
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
line 310
;310:		VectorSet(dev2, (-25 - irandom(1,35)), (25+ irandom(10,35)), 30);
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
line 311
;311:		VectorSet(dev3, (25 + irandom(1,35)), (-25+ irandom(10,35)), 30);
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
line 312
;312:		VectorSet(dev4, (-25 - + irandom(1,35)), (-25+ irandom(10,35)), 30);
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
line 314
;313:		
;314:		fire_devparticle (ent->parent, origin, dev1, qfalse);
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
line 315
;315:		fire_devparticle (ent->parent, origin, dev2, qfalse);
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
line 316
;316:		fire_devparticle (ent->parent, origin, dev3, qfalse);
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
line 317
;317:		fire_devparticle (ent->parent, origin, dev4, qfalse);
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
line 319
;318:
;319:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 321
;320:	
;321:}
LABELV $168
endproc G_ExplodeDevastatorFire 116 24
export G_ExplodeMissile
proc G_ExplodeMissile 44 24
line 332
;322: 
;323:
;324:/*
;325:================
;326:G_ExplodeMissile
;327:
;328:Explode a missile without an impact
;329:================
;330:*/
;331:void G_ExplodeMissile( gentity_t *ent )
;332:{
line 336
;333:	vec3_t		dir;
;334:	vec3_t		origin;
;335:
;336:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
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
line 337
;337:	SnapVector( origin );
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
line 338
;338:	G_SetOrigin( ent, origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 341
;339:
;340:	// we don't have a valid direction, so just point straight up
;341:	dir[0] = dir[1] = 0;
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
line 342
;342:	dir[2] = 1;
ADDRLP4 12+8
CNSTF4 1065353216
ASGNF4
line 344
;343:
;344:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 345
;345:	G_AddEvent( ent, EV_MISSILE_MISS, DirToByte( dir ) );
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
line 347
;346:
;347:	ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 350
;348:
;349:	// splash damage
;350:	if ( ent->splashDamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
CNSTI4 0
EQI4 $196
line 351
;351:		if( G_RadiusDamage( ent->r.currentOrigin, ent->parent, ent->splashDamage, ent->splashRadius, ent
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
EQI4 $198
line 352
;352:			, ent->splashMethodOfDeath ) ) {
line 353
;353:			g_entities[ent->r.ownerNum].client->accuracy_hits++;
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
CNSTI4 2664
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
line 354
;354:		}
LABELV $198
line 355
;355:	}
LABELV $196
line 357
;356:
;357:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 358
;358:}
LABELV $188
endproc G_ExplodeMissile 44 24
export G_MissileImpact
proc G_MissileImpact 56 32
line 535
;359:
;360:
;361:#ifdef MISSIONPACK
;362:/*
;363:================
;364:ProximityMine_Explode
;365:================
;366:*/
;367:static void ProximityMine_Explode( gentity_t *mine ) {
;368:	G_ExplodeMissile( mine );
;369:	// if the prox mine has a trigger free it
;370:	if (mine->activator) {
;371:		G_FreeEntity(mine->activator);
;372:		mine->activator = NULL;
;373:	}
;374:}
;375:
;376:/*
;377:================
;378:ProximityMine_Die
;379:================
;380:*/
;381:static void ProximityMine_Die( gentity_t *ent, gentity_t *inflictor, gentity_t *attacker, int damage, int mod ) {
;382:	ent->think = ProximityMine_Explode;
;383:	ent->nextthink = level.time + 1;
;384:}
;385:
;386:/*
;387:================
;388:ProximityMine_Trigger
;389:================
;390:*/
;391:void ProximityMine_Trigger( gentity_t *trigger, gentity_t *other, trace_t *trace ) {
;392:	vec3_t		v;
;393:	gentity_t	*mine;
;394:
;395:	if( !other->client ) {
;396:		return;
;397:	}
;398:
;399:	// trigger is a cube, do a distance test now to act as if it's a sphere
;400:	VectorSubtract( trigger->s.pos.trBase, other->s.pos.trBase, v );
;401:	if( VectorLength( v ) > trigger->parent->splashRadius ) {
;402:		return;
;403:	}
;404:
;405:
;406:	if ( g_gametype.integer >= GT_TEAM ) {
;407:		// don't trigger same team mines
;408:		if (trigger->parent->s.generic1 == other->client->sess.sessionTeam) {
;409:			return;
;410:		}
;411:	}
;412:
;413:	// ok, now check for ability to damage so we don't get triggered thru walls, closed doors, etc...
;414:	if( !CanDamage( other, trigger->s.pos.trBase ) ) {
;415:		return;
;416:	}
;417:
;418:	// trigger the mine!
;419:	mine = trigger->parent;
;420:	mine->s.loopSound = 0;
;421:	G_AddEvent( mine, EV_PROXIMITY_MINE_TRIGGER, 0 );
;422:	mine->nextthink = level.time + 500;
;423:
;424:	G_FreeEntity( trigger );
;425:}
;426:
;427:/*
;428:================
;429:ProximityMine_Activate
;430:================
;431:*/
;432:static void ProximityMine_Activate( gentity_t *ent ) {
;433:	gentity_t	*trigger;
;434:	float		r;
;435:
;436:	ent->think = ProximityMine_Explode;
;437:	ent->nextthink = level.time + g_proxMineTimeout.integer;
;438:
;439:	ent->takedamage = qtrue;
;440:	ent->health = 1;
;441:	ent->die = ProximityMine_Die;
;442:
;443:	ent->s.loopSound = G_SoundIndex( "sound/weapons/proxmine/wstbtick.wav" );
;444:
;445:	// build the proximity trigger
;446:	trigger = G_Spawn ();
;447:
;448:	trigger->classname = "proxmine_trigger";
;449:
;450:	r = ent->splashRadius;
;451:	VectorSet( trigger->r.mins, -r, -r, -r );
;452:	VectorSet( trigger->r.maxs, r, r, r );
;453:
;454:	G_SetOrigin( trigger, ent->s.pos.trBase );
;455:
;456:	trigger->parent = ent;
;457:	trigger->r.contents = CONTENTS_TRIGGER;
;458:	trigger->touch = ProximityMine_Trigger;
;459:
;460:	trap_LinkEntity (trigger);
;461:
;462:	// set pointer to trigger so the entity can be freed when the mine explodes
;463:	ent->activator = trigger;
;464:}
;465:
;466:/*
;467:================
;468:ProximityMine_ExplodeOnPlayer
;469:================
;470:*/
;471:static void ProximityMine_ExplodeOnPlayer( gentity_t *mine ) {
;472:	gentity_t	*player;
;473:
;474:	player = mine->enemy;
;475:	player->client->ps.eFlags &= ~EF_TICKING;
;476:
;477:	if ( player->client->invulnerabilityTime > level.time ) {
;478:		G_Damage( player, mine->parent, mine->parent, vec3_origin, mine->s.origin, 1000, DAMAGE_NO_KNOCKBACK, MOD_JUICED );
;479:		player->client->invulnerabilityTime = 0;
;480:		G_TempEntity( player->client->ps.origin, EV_JUICED );
;481:	}
;482:	else {
;483:		G_SetOrigin( mine, player->s.pos.trBase );
;484:		// make sure the explosion gets to the client
;485:		mine->r.svFlags &= ~SVF_NOCLIENT;
;486:		mine->splashMethodOfDeath = MOD_PROXIMITY_MINE;
;487:		G_ExplodeMissile( mine );
;488:	}
;489:}
;490:
;491:/*
;492:================
;493:ProximityMine_Player
;494:================
;495:*/
;496:static void ProximityMine_Player( gentity_t *mine, gentity_t *player ) {
;497:	if( mine->s.eFlags & EF_NODRAW ) {
;498:		return;
;499:	}
;500:
;501:	G_AddEvent( mine, EV_PROXIMITY_MINE_STICK, 0 );
;502:
;503:	if( player->s.eFlags & EF_TICKING ) {
;504:		player->activator->splashDamage += mine->splashDamage;
;505:		player->activator->splashRadius *= 1.50;
;506:		mine->think = G_FreeEntity;
;507:		mine->nextthink = level.time;
;508:		return;
;509:	}
;510:
;511:	player->client->ps.eFlags |= EF_TICKING;
;512:	player->activator = mine;
;513:
;514:	mine->s.eFlags |= EF_NODRAW;
;515:	mine->r.svFlags |= SVF_NOCLIENT;
;516:	mine->s.pos.trType = TR_LINEAR;
;517:	VectorClear( mine->s.pos.trDelta );
;518:
;519:	mine->enemy = player;
;520:	mine->think = ProximityMine_ExplodeOnPlayer;
;521:	if ( player->client->invulnerabilityTime > level.time ) {
;522:		mine->nextthink = level.time + 2 * 1000;
;523:	}
;524:	else {
;525:		mine->nextthink = level.time + 10 * 1000;
;526:	}
;527:}
;528:#endif
;529:
;530:/*
;531:================
;532:G_MissileImpact
;533:================
;534:*/
;535:void G_MissileImpact( gentity_t *ent, trace_t *trace ) {
line 537
;536:	gentity_t		*other;
;537:	qboolean		hitClient = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 542
;538:#ifdef MISSIONPACK
;539:	vec3_t			forward, impactpoint, bouncedir;
;540:	int				eFlags;
;541:#endif
;542:	other = &g_entities[trace->entityNum];
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
line 545
;543:
;544:	// check for bounce
;545:	if ( !other->takedamage &&
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
NEI4 $202
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 48
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $202
line 546
;546:		( ent->s.eFlags & ( EF_BOUNCE | EF_BOUNCE_HALF ) ) ) {
line 547
;547:		G_BounceMissile( ent, trace );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_BounceMissile
CALLV
pop
line 549
;548:		
;549:			if ( !Q_stricmp( ent->classname, "plasma") )
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRGP4 $206
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $204
line 550
;550:		{
line 551
;551:			G_AddEvent( ent, EV_PL_BOUNCE, 0 );
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
line 552
;552:		} 
ADDRGP4 $201
JUMPV
LABELV $204
line 554
;553:		else
;554:		{
line 556
;555:			// Regular Grenade
;556:			G_AddEvent( ent, EV_GRENADE_BOUNCE, 0 );
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
line 557
;557:		}
line 559
;558:
;559:		return;
ADDRGP4 $201
JUMPV
LABELV $202
line 584
;560:	}
;561:
;562:
;563:#ifdef MISSIONPACK
;564:	if ( other->takedamage ) {
;565:		if ( ent->s.weapon != WP_PROX_LAUNCHER ) {
;566:			if ( other->client && other->client->invulnerabilityTime > level.time ) {
;567:				//
;568:				VectorCopy( ent->s.pos.trDelta, forward );
;569:				VectorNormalize( forward );
;570:				if (G_InvulnerabilityEffect( other, forward, ent->s.pos.trBase, impactpoint, bouncedir )) {
;571:					VectorCopy( bouncedir, trace->plane.normal );
;572:					eFlags = ent->s.eFlags & EF_BOUNCE_HALF;
;573:					ent->s.eFlags &= ~EF_BOUNCE_HALF;
;574:					G_BounceMissile( ent, trace );
;575:					ent->s.eFlags |= eFlags;
;576:				}
;577:				ent->target_ent = other;
;578:				return;
;579:			}
;580:		}
;581:	}
;582:#endif
;583:	// impact damage
;584:	if (other->takedamage) {
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $207
line 586
;585:		// FIXME: wrong damage direction?
;586:		if ( ent->damage ) {
ADDRFP4 0
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
CNSTI4 0
EQI4 $209
line 589
;587:			vec3_t	velocity;
;588:
;589:			if( LogAccuracyHit( other, &g_entities[ent->r.ownerNum] ) ) {
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
EQI4 $211
line 590
;590:				g_entities[ent->r.ownerNum].client->accuracy_hits++;
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
CNSTI4 2664
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
line 591
;591:				hitClient = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 592
;592:			}
LABELV $211
line 593
;593:			BG_EvaluateTrajectoryDelta( &ent->s.pos, level.time, velocity );
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
line 594
;594:			if ( VectorLength( velocity ) == 0 ) {
ADDRLP4 12
ARGP4
ADDRLP4 28
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 28
INDIRF4
CNSTF4 0
NEF4 $215
line 595
;595:				velocity[2] = 1;	// stepped on a grenade
ADDRLP4 12+8
CNSTF4 1065353216
ASGNF4
line 596
;596:			}
LABELV $215
line 597
;597:			G_Damage (other, ent, &g_entities[ent->r.ownerNum], velocity,
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
line 600
;598:				ent->s.origin, ent->damage, 
;599:				0, ent->methodOfDeath);
;600:		}
LABELV $209
line 601
;601:	}
LABELV $207
line 640
;602:
;603:#ifdef MISSIONPACK
;604:	if( ent->s.weapon == WP_PROX_LAUNCHER ) {
;605:		if( ent->s.pos.trType != TR_GRAVITY ) {
;606:			return;
;607:		}
;608:
;609:		// if it's a player, stick it on to them (flag them and remove this entity)
;610:		if( other->s.eType == ET_PLAYER && other->health > 0 ) {
;611:			ProximityMine_Player( ent, other );
;612:			return;
;613:		}
;614:
;615:		SnapVectorTowards( trace->endpos, ent->s.pos.trBase );
;616:		G_SetOrigin( ent, trace->endpos );
;617:		ent->s.pos.trType = TR_STATIONARY;
;618:		VectorClear( ent->s.pos.trDelta );
;619:
;620:		G_AddEvent( ent, EV_PROXIMITY_MINE_STICK, trace->surfaceFlags );
;621:
;622:		ent->think = ProximityMine_Activate;
;623:		ent->nextthink = level.time + 2000;
;624:
;625:		vectoangles( trace->plane.normal, ent->s.angles );
;626:		ent->s.angles[0] += 90;
;627:
;628:		// link the prox mine to the other entity
;629:		ent->enemy = other;
;630:		ent->die = ProximityMine_Die;
;631:		VectorCopy(trace->plane.normal, ent->movedir);
;632:		VectorSet(ent->r.mins, -4, -4, -4);
;633:		VectorSet(ent->r.maxs, 4, 4, 4);
;634:		trap_LinkEntity(ent);
;635:
;636:		return;
;637:	}
;638:#endif
;639:
;640:	if (!strcmp(ent->classname, "hook")) {
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRGP4 $220
ARGP4
ADDRLP4 12
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $218
line 644
;641:		gentity_t *nent;
;642:		vec3_t v;
;643:
;644:		nent = G_Spawn();
ADDRLP4 32
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 645
;645:		if ( other->takedamage && other->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $221
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $221
line 647
;646:
;647:			G_AddEvent( nent, EV_MISSILE_HIT, DirToByte( trace->plane.normal ) );
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
line 648
;648:			nent->s.otherEntityNum = other->s.number;
ADDRLP4 16
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 650
;649:
;650:			ent->enemy = other;
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 652
;651:
;652:			v[0] = other->r.currentOrigin[0] + (other->r.mins[0] + other->r.maxs[0]) * 0.5;
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
line 653
;653:			v[1] = other->r.currentOrigin[1] + (other->r.mins[1] + other->r.maxs[1]) * 0.5;
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
line 654
;654:			v[2] = other->r.currentOrigin[2] + (other->r.mins[2] + other->r.maxs[2]) * 0.5;
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
line 656
;655:
;656:			SnapVectorTowards( v, ent->s.pos.trBase );	// save net bandwidth
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
line 657
;657:		} else {
ADDRGP4 $222
JUMPV
LABELV $221
line 658
;658:			VectorCopy(trace->endpos, v);
ADDRLP4 20
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 659
;659:			G_AddEvent( nent, EV_MISSILE_MISS, DirToByte( trace->plane.normal ) );
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
line 660
;660:			ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
CNSTP4 0
ASGNP4
line 661
;661:		}
LABELV $222
line 663
;662:
;663:		SnapVectorTowards( v, ent->s.pos.trBase );	// save net bandwidth
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
line 665
;664:
;665:		nent->freeAfterEvent = qtrue;
ADDRLP4 16
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 667
;666:		// change over to a normal entity right at the point of impact
;667:		nent->s.eType = ET_GENERAL;
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 668
;668:		ent->s.eType = ET_GRAPPLE;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 11
ASGNI4
line 670
;669:
;670:		G_SetOrigin( ent, v );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 671
;671:		G_SetOrigin( nent, v );
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 673
;672:
;673:		ent->think = Weapon_HookThink;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 Weapon_HookThink
ASGNP4
line 674
;674:		ent->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 676
;675:
;676:		ent->parent->client->ps.pm_flags |= PMF_GRAPPLE_PULL;
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
line 677
;677:		VectorCopy( ent->r.currentOrigin, ent->parent->client->ps.grapplePoint);
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
line 679
;678:
;679:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 680
;680:		trap_LinkEntity( nent );
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 682
;681:
;682:		return;
ADDRGP4 $201
JUMPV
LABELV $218
line 688
;683:	}
;684:
;685:	// is it cheaper in bandwidth to just remove this ent and create a new
;686:	// one, rather than changing the missile into the explosion?
;687:
;688:	if ( other->takedamage && other->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $226
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $226
line 689
;689:		G_AddEvent( ent, EV_MISSILE_HIT, DirToByte( trace->plane.normal ) );
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
line 690
;690:		ent->s.otherEntityNum = other->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 691
;691:	} else if( trace->surfaceFlags & SURF_METALSTEPS ) {
ADDRGP4 $227
JUMPV
LABELV $226
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $228
line 692
;692:		G_AddEvent( ent, EV_MISSILE_MISS_METAL, DirToByte( trace->plane.normal ) );
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
line 693
;693:	} else {
ADDRGP4 $229
JUMPV
LABELV $228
line 694
;694:		G_AddEvent( ent, EV_MISSILE_MISS, DirToByte( trace->plane.normal ) );
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
line 695
;695:	}
LABELV $229
LABELV $227
line 697
;696:
;697:	ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 700
;698:
;699:	// change over to a normal entity right at the point of impact
;700:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 702
;701:
;702:	SnapVectorTowards( trace->endpos, ent->s.pos.trBase );	// save net bandwidth
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
line 704
;703:
;704:	G_SetOrigin( ent, trace->endpos );
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
line 707
;705:
;706:	// splash damage (doesn't apply to person directly hit)
;707:	if ( ent->splashDamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
CNSTI4 0
EQI4 $230
line 708
;708:		if( G_RadiusDamage( trace->endpos, ent->parent, ent->splashDamage, ent->splashRadius, 
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
EQI4 $232
line 709
;709:			other, ent->splashMethodOfDeath ) ) {
line 710
;710:			if( !hitClient ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $234
line 711
;711:				g_entities[ent->r.ownerNum].client->accuracy_hits++;
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
CNSTI4 2664
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
line 712
;712:			}
LABELV $234
line 713
;713:		}
LABELV $232
line 714
;714:	}
LABELV $230
line 716
;715:
;716:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 717
;717:}
LABELV $201
endproc G_MissileImpact 56 32
export G_RunMissile
proc G_RunMissile 84 28
line 724
;718:
;719:/*
;720:================
;721:G_RunMissile
;722:================
;723:*/
;724:void G_RunMissile( gentity_t *ent ) {
line 730
;725:	vec3_t		origin;
;726:	trace_t		tr;
;727:	int			passent;
;728:
;729:	
;730:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 56
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 734
;731:
;732:
;733:	// if this missile bounced off an invulnerability sphere
;734:	if ( ent->target_ent ) {
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $239
line 735
;735:		passent = ent->target_ent->s.number;
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRP4
INDIRI4
ASGNI4
line 736
;736:	}
ADDRGP4 $240
JUMPV
LABELV $239
line 743
;737:#ifdef MISSIONPACK
;738:	// prox mines that left the owner bbox will attach to anything, even the owner
;739:	else if (ent->s.weapon == WP_PROX_LAUNCHER && ent->count) {
;740:		passent = ENTITYNUM_NONE;
;741:	}
;742:#endif
;743:	else {
line 745
;744:		// ignore interactions with the missile owner
;745:		passent = ent->r.ownerNum;
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ASGNI4
line 746
;746:	}
LABELV $240
line 748
;747:	// trace a line from the previous position to the current position
;748:	trap_Trace( &tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, origin, passent, ent->clipmask );
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
ADDRLP4 56
ARGP4
ADDRLP4 68
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
line 751
;749:
;750:	// Testing a fix for the "weird" missiles in water -Vincent
;751:	VectorCopy( tr.endpos, ent->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 753
;752:
;753:	if ( tr.startsolid ) {
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $242
line 754
;754:		tr.fraction = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 755
;755:	}
LABELV $242
line 757
;756:
;757:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 759
;758:
;759:	if ( tr.fraction != 1 && !tr.allsolid)  // 2nd parameter: -Vincent
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $246
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $246
line 760
;760:	{
line 762
;761:		// never explode or bounce on sky
;762:		if ( tr.surfaceFlags & SURF_NOIMPACT ) 
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $249
line 763
;763:		{
line 771
;764:			// If grapple, reset owner
;765:			/* Shafe - Trep - Comment this out for offhand grapple
;766:			if (ent->parent && ent->parent->client && ent->parent->client->hook == ent) {
;767:				ent->parent->client->hook = NULL;
;768:			}
;769:			*/
;770:			// Shafe - Trep - Offhand Grappling Hook
;771:			if (g_gametype.integer != GT_CTF) 
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
EQI4 $252
line 772
;772:			{
line 773
;773:				if (ent->parent && ent->parent->client->hook == ent)
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
ADDRLP4 76
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $255
ADDRLP4 80
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2708
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 76
INDIRP4
CVPU4 4
NEU4 $255
line 774
;774:				{
line 775
;775:					ent->parent->client->hook = NULL;
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
line 776
;776:					ent->parent->client->hookhasbeenfired = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2712
ADDP4
CNSTI4 0
ASGNI4
line 777
;777:					ent->parent->client->fireHeld = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2704
ADDP4
CNSTI4 0
ASGNI4
line 778
;778:				}
LABELV $255
line 779
;779:			}
LABELV $252
line 782
;780:			// End Shafe
;781:
;782:			G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 783
;783:			return;
ADDRGP4 $237
JUMPV
LABELV $249
line 785
;784:		}
;785:		G_MissileImpact( ent, &tr );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_MissileImpact
CALLV
pop
line 786
;786:		if ( ent->s.eType != ET_MISSILE ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $257
line 787
;787:			return;		// exploded
ADDRGP4 $237
JUMPV
LABELV $257
line 789
;788:		}
;789:	}
LABELV $246
line 801
;790:#ifdef MISSIONPACK
;791:	// if the prox mine wasn't yet outside the player body
;792:	if (ent->s.weapon == WP_PROX_LAUNCHER && !ent->count) {
;793:		// check if the prox mine is outside the owner bbox
;794:		trap_Trace( &tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, ent->r.currentOrigin, ENTITYNUM_NONE, ent->clipmask );
;795:		if (!tr.startsolid || tr.entityNum != ent->r.ownerNum) {
;796:			ent->count = 1;
;797:		}
;798:	}
;799:#endif
;800:	// check think function after bouncing
;801:	G_RunThink( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 802
;802:}
LABELV $237
endproc G_RunMissile 84 28
export fire_plasma
proc fire_plasma 32 4
line 813
;803:
;804:
;805://=============================================================================
;806:
;807:/*
;808:=================
;809:fire_plasma
;810:
;811:=================
;812:*/
;813:gentity_t *fire_plasma (gentity_t *self, vec3_t start, vec3_t dir) {
line 816
;814:	gentity_t	*bolt;
;815:
;816:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 818
;817:
;818:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 819
;819:	bolt->classname = "plasma";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $206
ASGNP4
line 820
;820:	bolt->nextthink = level.time + 1200; //10000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1200
ADDI4
ASGNI4
line 821
;821:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 822
;822:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 823
;823:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 824
;824:	bolt->s.weapon = WP_PLASMAGUN;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 8
ASGNI4
line 825
;825:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 828
;826://unlagged - projectile nudge
;827:	// we'll need this for nudging projectiles later
;828:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 830
;829://unlagged - projectile nudge
;830:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 831
;831:	bolt->damage = 20;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 20
ASGNI4
line 832
;832:	bolt->splashDamage = 15;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 15
ASGNI4
line 833
;833:	bolt->splashRadius = 20;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 20
ASGNI4
line 834
;834:	bolt->methodOfDeath = MOD_PLASMA;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 8
ASGNI4
line 835
;835:	bolt->splashMethodOfDeath = MOD_PLASMA_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 9
ASGNI4
line 836
;836:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 837
;837:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 840
;838:
;839:	// Shafe - Make it bounce
;840:	bolt->s.eFlags = EF_BOUNCE;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 16
ASGNI4
line 842
;841:
;842:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 843
;843:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 844
;844:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 845
;845:	VectorScale( dir, 2000, bolt->s.pos.trDelta );
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
line 846
;846:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 848
;847:
;848:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 850
;849:
;850:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $259
endproc fire_plasma 32 4
export fire_plasma2
proc fire_plasma2 32 4
line 859
;851:}	
;852:
;853:/*
;854:=================
;855:fire_plasma2 alt
;856:
;857:=================
;858:*/
;859:gentity_t *fire_plasma2 (gentity_t *self, vec3_t start, vec3_t dir) {
line 862
;860:	gentity_t	*bolt;
;861:
;862:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 864
;863:
;864:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 865
;865:	bolt->classname = "plasma";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $206
ASGNP4
line 866
;866:	bolt->nextthink = level.time + 1200; //10000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1200
ADDI4
ASGNI4
line 867
;867:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 868
;868:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 869
;869:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 870
;870:	bolt->s.weapon = WP_PLASMAGUN;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 8
ASGNI4
line 871
;871:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 874
;872://unlagged - projectile nudge
;873:	// we'll need this for nudging projectiles later
;874:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 876
;875://unlagged - projectile nudge
;876:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 877
;877:	bolt->damage = 20;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 20
ASGNI4
line 878
;878:	bolt->splashDamage = 15;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 15
ASGNI4
line 879
;879:	bolt->splashRadius = 20;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 20
ASGNI4
line 880
;880:	bolt->methodOfDeath = MOD_PLASMA;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 8
ASGNI4
line 881
;881:	bolt->splashMethodOfDeath = MOD_PLASMA_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 9
ASGNI4
line 882
;882:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 883
;883:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 885
;884:
;885:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 886
;886:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 887
;887:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 888
;888:	VectorScale( dir, 2000, bolt->s.pos.trDelta );
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
line 889
;889:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 891
;890:
;891:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 893
;892:
;893:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $262
endproc fire_plasma2 32 4
export G_ExplodeBomb
proc G_ExplodeBomb 0 4
line 902
;894:}	
;895:
;896:
;897://=============================================================================
;898:
;899:
;900:
;901:// Shafe - Trep 
;902:void G_ExplodeBomb( gentity_t *ent ) {
line 905
;903: 
;904:		
;905:	if ( ent->client->bombfired == qtrue )
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2720
ADDP4
INDIRI4
CNSTI4 1
NEI4 $266
line 906
;906:	{ // -Vincent
line 907
;907:	ent->client->bombfired = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2720
ADDP4
CNSTI4 0
ASGNI4
line 908
;908:	ent->parent->client->bombfired = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2720
ADDP4
CNSTI4 0
ASGNI4
line 909
;909:	}
LABELV $266
line 911
;910:
;911:	G_ExplodeMissile( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_ExplodeMissile
CALLV
pop
line 912
;912:}
LABELV $265
endproc G_ExplodeBomb 0 4
export fire_bomb
proc fire_bomb 36 4
line 919
;913:/*
;914:=================
;915: fire_bomb
;916: Shafe - Trep 
;917:=================
;918:*/
;919:gentity_t *fire_bomb (gentity_t *self, vec3_t start, vec3_t dir, qboolean alt) {
line 923
;920:	gentity_t	*bolt;
;921:	//vec3_t		mins = { -8, -8, -8 }, maxs = { 8, 8, 8 };
;922:
;923:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 925
;924: 
;925:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 926
;926:	bolt->classname = "bomb";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $269
ASGNP4
line 927
;927:	bolt->nextthink = level.time + 30000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 30000
ADDI4
ASGNI4
line 928
;928:	bolt->think = G_ExplodeBomb;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeBomb
ASGNP4
line 929
;929:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 932
;930:	//tr.surfaceFlags & SURF_NOIMPACT
;931:	
;932:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 933
;933:	bolt->s.weapon = WP_GRENADE_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 4
ASGNI4
line 934
;934:	bolt->s.eFlags = EF_BOUNCE_HALF;  // Get rid of this for no bounce
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 32
ASGNI4
line 935
;935:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 939
;936:
;937:	//unlagged - projectile nudge
;938:	// we'll need this for nudging projectiles later
;939:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 941
;940:	//unlagged - projectile nudge
;941:	bolt->s.eFlags |= EF_ALT_FIRING;
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
line 942
;942:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 943
;943:	bolt->damage = 150;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 150
ASGNI4
line 944
;944:	bolt->splashDamage = 200;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 200
ASGNI4
line 945
;945:	bolt->splashRadius = 200;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 200
ASGNI4
line 946
;946:	bolt->methodOfDeath = MOD_GRENADE;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 4
ASGNI4
line 947
;947:	bolt->splashMethodOfDeath = MOD_GRENADE_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 5
ASGNI4
line 948
;948:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 951
;949: 
;950:	// Health? Think it'll work?
;951:	bolt->takedamage=qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
line 952
;952:	bolt->health = 45;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 45
ASGNI4
line 953
;953:	bolt->die = bomb_explode;
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
ADDRGP4 bomb_explode
ASGNP4
line 955
;954:
;955:	bolt->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 956
;956:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 957
;957:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 958
;958:	VectorScale( dir, 900, bolt->s.pos.trDelta );
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
line 959
;959:	SnapVector( bolt->s.pos.trDelta );// save net bandwidth
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
line 961
;960: 
;961:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 963
;962: 
;963: return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $268
endproc fire_bomb 36 4
export G_ExplodePDGrenade
proc G_ExplodePDGrenade 8 8
line 971
;964:}
;965:
;966://=============================================================================
;967:
;968:
;969:
;970:// Shafe - Trep 
;971:void G_ExplodePDGrenade( gentity_t *ent ) {
line 973
;972: 
;973:	if (ent->parent->istelepoint != 0)
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 840
ADDP4
INDIRI4
CNSTI4 0
EQI4 $273
line 974
;974:	{
line 975
;975:		trap_SendServerCommand( ent->r.ownerNum, va("cp \"^9PDG Lock Expired!\n\"") );
ADDRGP4 $275
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
line 976
;976:	}
LABELV $273
line 977
;977:	ent->parent->istelepoint = 0; // client cannot teleport
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 0
ASGNI4
line 978
;978: 	VectorClear( ent->parent->teleloc ); // clear the teleport location
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
line 981
;979:	//G_Printf( S_COLOR_GREEN "Particle Displacement Grenade Expired\n" );
;980:	
;981:	if ( ent->client->pdgfired == qtrue )
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2716
ADDP4
INDIRI4
CNSTI4 1
NEI4 $276
line 982
;982:	{ // -Vincent
line 983
;983:	ent->client->pdgfired = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2716
ADDP4
CNSTI4 0
ASGNI4
line 984
;984:	}
LABELV $276
line 986
;985:
;986:	G_ExplodeMissile( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_ExplodeMissile
CALLV
pop
line 987
;987:}
LABELV $272
endproc G_ExplodePDGrenade 8 8
export fire_pdgrenade
proc fire_pdgrenade 36 4
line 994
;988:/*
;989:=================
;990: fire_pdgrenade
;991: Shafe - Trep 
;992:=================
;993:*/
;994:gentity_t *fire_pdgrenade (gentity_t *self, vec3_t start, vec3_t dir) {
line 998
;995:	gentity_t	*bolt;
;996:	//vec3_t		mins = { -8, -8, -8 }, maxs = { 8, 8, 8 };
;997:
;998:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1000
;999: 
;1000:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1001
;1001:	bolt->classname = "pdgrenade";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $87
ASGNP4
line 1002
;1002:	bolt->nextthink = level.time + 30000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 30000
ADDI4
ASGNI4
line 1003
;1003:	bolt->think = G_ExplodePDGrenade;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodePDGrenade
ASGNP4
line 1004
;1004:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1007
;1005:	//tr.surfaceFlags & SURF_NOIMPACT
;1006:	
;1007:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1008
;1008:	bolt->s.weapon = WP_GRENADE_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 4
ASGNI4
line 1009
;1009:	bolt->s.eFlags = EF_BOUNCE_HALF;  // Get rid of this for no bounce
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 32
ASGNI4
line 1010
;1010:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1014
;1011:
;1012:	//unlagged - projectile nudge
;1013:	// we'll need this for nudging projectiles later
;1014:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1016
;1015:	//unlagged - projectile nudge
;1016:	bolt->s.eFlags |= EF_ALT_FIRING;
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
line 1017
;1017:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1018
;1018:	bolt->damage = 1;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 1
ASGNI4
line 1019
;1019:	bolt->splashDamage = 0;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 0
ASGNI4
line 1020
;1020:	bolt->splashRadius = 0;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 0
ASGNI4
line 1021
;1021:	bolt->methodOfDeath = MOD_GRENADE;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 4
ASGNI4
line 1022
;1022:	bolt->splashMethodOfDeath = MOD_GRENADE_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 5
ASGNI4
line 1023
;1023:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1026
;1024: 
;1025:	// Health? Think it'll work?
;1026:	bolt->takedamage=qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
line 1027
;1027:	bolt->health = 35;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 35
ASGNI4
line 1028
;1028:	bolt->die = pdg_explode;
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
ADDRGP4 pdg_explode
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
;1031:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;
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
;1034:	SnapVector( bolt->s.pos.trDelta );// save net bandwidth
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
;1038: return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $278
endproc fire_pdgrenade 36 4
export fire_grenade
proc fire_grenade 32 4
line 1046
;1039:}
;1040:
;1041:/*
;1042:=================
;1043:fire_grenade
;1044:=================
;1045:*/
;1046:gentity_t *fire_grenade (gentity_t *self, vec3_t start, vec3_t dir) {
line 1049
;1047:	gentity_t	*bolt;
;1048:
;1049:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1051
;1050:
;1051:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1052
;1052:	bolt->classname = "grenade";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $282
ASGNP4
line 1053
;1053:	bolt->nextthink = level.time + 2500;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2500
ADDI4
ASGNI4
line 1054
;1054:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 1055
;1055:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1056
;1056:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1057
;1057:	bolt->s.weapon = WP_GRENADE_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 4
ASGNI4
line 1058
;1058:	bolt->s.eFlags = EF_BOUNCE_HALF;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 32
ASGNI4
line 1059
;1059:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1062
;1060://unlagged - projectile nudge
;1061:	// we'll need this for nudging projectiles later
;1062:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1064
;1063://unlagged - projectile nudge
;1064:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1065
;1065:	bolt->damage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 100
ASGNI4
line 1066
;1066:	bolt->splashDamage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 100
ASGNI4
line 1067
;1067:	bolt->splashRadius = 150;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 150
ASGNI4
line 1068
;1068:	bolt->methodOfDeath = MOD_GRENADE;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 4
ASGNI4
line 1069
;1069:	bolt->splashMethodOfDeath = MOD_GRENADE_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 5
ASGNI4
line 1070
;1070:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1071
;1071:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1073
;1072:
;1073:	bolt->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 1074
;1074:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1075
;1075:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1076
;1076:	VectorScale( dir, 700, bolt->s.pos.trDelta );
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
line 1077
;1077:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 1079
;1078:
;1079:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1081
;1080:
;1081:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $281
endproc fire_grenade 32 4
export fire_flame
proc fire_flame 32 4
line 1092
;1082:}
;1083:
;1084://=============================================================================
;1085:
;1086:/*
;1087:=================
;1088:fire_flame
;1089:Shafe - Trep - Flame Thrower
;1090:=================
;1091:*/
;1092:gentity_t *fire_flame (gentity_t *self, vec3_t start, vec3_t dir, qboolean alt) {
line 1096
;1093:
;1094:	gentity_t	*bolt;
;1095:
;1096:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1098
;1097:
;1098:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1099
;1099:	bolt->classname = "flame";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $286
ASGNP4
line 1100
;1100:	bolt->nextthink = level.time + 1000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 1101
;1101:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 1102
;1102:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1103
;1103:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1104
;1104:	bolt->s.weapon = WP_LIGHTNING;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 6
ASGNI4
line 1105
;1105:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1108
;1106://unlagged - projectile nudge
;1107:	// we'll need this for nudging projectiles later
;1108:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1110
;1109://unlagged - projectile nudge
;1110:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1113
;1111:	
;1112:	
;1113:	if (alt == qfalse ) 
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $288
line 1114
;1114:	{
line 1115
;1115:		bolt->methodOfDeath = MOD_ALTFLAMER;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 26
ASGNI4
line 1116
;1116:		bolt->damage = 70;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 70
ASGNI4
line 1117
;1117:		bolt->splashDamage = 55;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 55
ASGNI4
line 1118
;1118:		bolt->splashRadius = 55;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 55
ASGNI4
line 1119
;1119:	} else
ADDRGP4 $289
JUMPV
LABELV $288
line 1120
;1120:	{
line 1121
;1121:		bolt->methodOfDeath = MOD_ALTFLAMER;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 26
ASGNI4
line 1122
;1122:		bolt->damage = 40;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 40
ASGNI4
line 1123
;1123:		bolt->splashDamage = 25;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 25
ASGNI4
line 1124
;1124:		bolt->splashRadius = 45;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 45
ASGNI4
line 1125
;1125:		bolt->s.eFlags |= EF_ALT_FIRING;
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
line 1126
;1126:	}
LABELV $289
line 1128
;1127:
;1128:	bolt->splashMethodOfDeath = MOD_ALTFLAMER;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 26
ASGNI4
line 1129
;1129:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1131
;1130:
;1131:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 1132
;1132:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1133
;1133:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1134
;1134:	VectorScale( dir, 300, bolt->s.pos.trDelta );
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
line 1135
;1135:	SnapVector( bolt->s.pos.trDelta );// save net bandwidth
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
line 1137
;1136:
;1137:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1139
;1138:
;1139:return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $285
endproc fire_flame 32 4
export fire_altgrenade
proc fire_altgrenade 36 4
line 1153
;1140:}
;1141:
;1142:
;1143:
;1144:
;1145:
;1146:
;1147:/*
;1148:=================
;1149:fire_altgrenade
;1150:Shafe - Trep - Sticky Grenades for Alt
;1151:=================
;1152:*/
;1153:gentity_t *fire_altgrenade (gentity_t *self, vec3_t start, vec3_t dir) {
line 1156
;1154:	gentity_t	*bolt;
;1155:
;1156:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1158
;1157:
;1158:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1159
;1159:	bolt->classname = "grenade";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $282
ASGNP4
line 1160
;1160:	bolt->nextthink = level.time + 2500;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2500
ADDI4
ASGNI4
line 1161
;1161:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 1162
;1162:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1163
;1163:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1164
;1164:	bolt->s.weapon = WP_GRENADE_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 4
ASGNI4
line 1166
;1165://	bolt->s.eFlags = EF_BOUNCE_HALF;  // Simple Change
;1166:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1169
;1167://unlagged - projectile nudge
;1168:	// we'll need this for nudging projectiles later
;1169:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1171
;1170://unlagged - projectile nudge
;1171:	bolt->s.eFlags |= EF_ALT_FIRING;
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
line 1172
;1172:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1173
;1173:	bolt->damage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 100
ASGNI4
line 1174
;1174:	bolt->splashDamage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 100
ASGNI4
line 1175
;1175:	bolt->splashRadius = 150;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 150
ASGNI4
line 1176
;1176:	bolt->methodOfDeath = MOD_GRENADE;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 4
ASGNI4
line 1177
;1177:	bolt->splashMethodOfDeath = MOD_GRENADE_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 5
ASGNI4
line 1178
;1178:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1179
;1179:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1181
;1180:
;1181:	bolt->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 1182
;1182:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1183
;1183:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1184
;1184:	VectorScale( dir, 700, bolt->s.pos.trDelta );
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
line 1185
;1185:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 1187
;1186:
;1187:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1189
;1188:
;1189:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $291
endproc fire_altgrenade 36 4
export fire_devparticle
proc fire_devparticle 36 4
line 1201
;1190:}
;1191:
;1192://=============================================================================
;1193:
;1194:
;1195:
;1196:/*
;1197:=================
;1198:fire_devparticle
;1199:=================
;1200:*/
;1201:gentity_t *fire_devparticle (gentity_t *self, vec3_t start, vec3_t dir, qboolean alt) {
line 1204
;1202:	gentity_t	*bolt;
;1203:	//int			speed;
;1204:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1206
;1205:
;1206:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1207
;1207:	bolt->classname = "bfg";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $295
ASGNP4
line 1209
;1208:
;1209:	if (alt == qfalse)
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $296
line 1210
;1210:	{
line 1211
;1211:	bolt->think = G_ExplodeDevastatorFire2;	
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeDevastatorFire2
ASGNP4
line 1212
;1212:	bolt->nextthink = level.time + 1500;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 1213
;1213:	} else {
ADDRGP4 $297
JUMPV
LABELV $296
line 1214
;1214:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 1215
;1215:	bolt->nextthink = level.time + 9000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 9000
ADDI4
ASGNI4
line 1216
;1216:	}
LABELV $297
line 1219
;1217:	
;1218:
;1219:	bolt->s.eFlags |= EF_ALT_FIRING;
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
line 1220
;1220:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1222
;1221:	//bolt->s.eFlags = EF_BOUNCE_HALF;
;1222:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1223
;1223:	bolt->s.weapon = WP_BFG;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 9
ASGNI4
line 1224
;1224:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1227
;1225://unlagged - projectile nudge
;1226:	// we'll need this for nudging projectiles later
;1227:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1229
;1228://unlagged - projectile nudge
;1229:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1231
;1230:	
;1231:	bolt->methodOfDeath = MOD_BFG;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 12
ASGNI4
line 1232
;1232:	bolt->splashMethodOfDeath = MOD_BFG_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 13
ASGNI4
line 1233
;1233:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1234
;1234:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1235
;1235:	bolt->s.pos.trType = TR_ORBITAL;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 6
ASGNI4
line 1236
;1236:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1238
;1237:
;1238:	bolt->damage = 500;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 500
ASGNI4
line 1239
;1239:	bolt->splashDamage = 300;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 300
ASGNI4
line 1240
;1240:	bolt->splashRadius = 420;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 420
ASGNI4
line 1241
;1241:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1242
;1242:	VectorScale( dir, 60, bolt->s.pos.trDelta );
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
line 1244
;1243:
;1244:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 1245
;1245:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1247
;1246:
;1247:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $294
endproc fire_devparticle 36 4
export fire_bfg
proc fire_bfg 32 4
line 1258
;1248:
;1249:
;1250:}
;1251:
;1252:
;1253:/*
;1254:=================
;1255:fire_bfg
;1256:=================
;1257:*/
;1258:gentity_t *fire_bfg (gentity_t *self, vec3_t start, vec3_t dir, qboolean alt) {
line 1261
;1259:	gentity_t	*bolt;
;1260:	//int			speed;
;1261:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1263
;1262:
;1263:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1264
;1264:	bolt->classname = "bfg";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $295
ASGNP4
line 1265
;1265:	bolt->s.time2 = 0;
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 1267
;1266:
;1267:	if (alt == qtrue)
ADDRFP4 12
INDIRI4
CNSTI4 1
NEI4 $302
line 1268
;1268:	{
line 1269
;1269:		bolt->nextthink = level.time + 3000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 1270
;1270:	} else {
ADDRGP4 $303
JUMPV
LABELV $302
line 1271
;1271:		bolt->nextthink = level.time + 2000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 1272
;1272:	}
LABELV $303
line 1275
;1273:
;1274:	
;1275:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1276
;1276:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1277
;1277:	bolt->s.weapon = WP_BFG;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 9
ASGNI4
line 1278
;1278:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1281
;1279://unlagged - projectile nudge
;1280:	// we'll need this for nudging projectiles later
;1281:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1283
;1282://unlagged - projectile nudge
;1283:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1285
;1284:	
;1285:	bolt->methodOfDeath = MOD_BFG;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 12
ASGNI4
line 1286
;1286:	bolt->splashMethodOfDeath = MOD_BFG_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 13
ASGNI4
line 1287
;1287:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1288
;1288:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1289
;1289:	bolt->s.pos.trType = TR_ORBITAL;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 6
ASGNI4
line 1290
;1290:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1292
;1291:
;1292:	if (alt == qtrue)
ADDRFP4 12
INDIRI4
CNSTI4 1
NEI4 $307
line 1293
;1293:	{
line 1295
;1294:		// Alt Fire
;1295:		bolt->damage = 500;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 500
ASGNI4
line 1296
;1296:		bolt->splashDamage = 300;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 300
ASGNI4
line 1297
;1297:		bolt->splashRadius = 420;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 420
ASGNI4
line 1298
;1298:		bolt->s.eFlags |= EF_ALT_FIRING;
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
;1299:		bolt->think = G_ExplodeDevastatorFire;		
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeDevastatorFire
ASGNP4
line 1300
;1300:		VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1301
;1301:		VectorScale( dir, 325, bolt->s.pos.trDelta );
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
line 1304
;1302:		
;1303:	
;1304:	} 
ADDRGP4 $308
JUMPV
LABELV $307
line 1306
;1305:	else
;1306:	{
line 1309
;1307:		// Regular Fire
;1308:
;1309:		bolt->damage = 90;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 90
ASGNI4
line 1310
;1310:		bolt->splashDamage = 200;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 200
ASGNI4
line 1311
;1311:		bolt->splashRadius = 220;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 220
ASGNI4
line 1312
;1312:		bolt->think = G_HomingMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_HomingMissile
ASGNP4
line 1313
;1313:		VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1314
;1314:		VectorScale( dir, 325, bolt->s.pos.trDelta );
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
line 1316
;1315:
;1316:	}
LABELV $308
line 1319
;1317:
;1318:	
;1319:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 1320
;1320:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1322
;1321:
;1322:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $301
endproc fire_bfg 32 4
export fire_rocket
proc fire_rocket 32 4
line 1335
;1323:
;1324:
;1325:}
;1326:
;1327://=============================================================================
;1328:
;1329:
;1330:/*
;1331:=================
;1332:fire_rocket
;1333:=================
;1334:*/
;1335:gentity_t *fire_rocket (gentity_t *self, vec3_t start, vec3_t dir) {
line 1338
;1336:	gentity_t	*bolt;
;1337:
;1338:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1340
;1339:
;1340:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1341
;1341:	bolt->classname = "rocket";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $310
ASGNP4
line 1342
;1342:	bolt->nextthink = level.time + 15000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 15000
ADDI4
ASGNI4
line 1343
;1343:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 1344
;1344:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1345
;1345:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1346
;1346:	bolt->s.weapon = WP_ROCKET_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 5
ASGNI4
line 1347
;1347:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1350
;1348://unlagged - projectile nudge
;1349:	// we'll need this for nudging projectiles later
;1350:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1352
;1351://unlagged - projectile nudge
;1352:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1353
;1353:	bolt->damage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 100
ASGNI4
line 1354
;1354:	bolt->splashDamage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 100
ASGNI4
line 1355
;1355:	bolt->splashRadius = 120;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 120
ASGNI4
line 1356
;1356:	bolt->methodOfDeath = MOD_ROCKET;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 6
ASGNI4
line 1357
;1357:	bolt->splashMethodOfDeath = MOD_ROCKET_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 7
ASGNI4
line 1358
;1358:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1359
;1359:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1361
;1360:
;1361:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 1362
;1362:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1363
;1363:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1364
;1364:	VectorScale( dir, 900, bolt->s.pos.trDelta );
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
line 1365
;1365:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 1366
;1366:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1368
;1367:
;1368:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $309
endproc fire_rocket 32 4
export fire_alt_rocket
proc fire_alt_rocket 48 4
line 1377
;1369:}
;1370:
;1371:
;1372:/*
;1373:=================
;1374:fire_alt_rocket
;1375:=================
;1376:*/
;1377:gentity_t *fire_alt_rocket (gentity_t *self, vec3_t start, vec3_t dir) {
line 1380
;1378:	gentity_t	*bolt;
;1379:
;1380:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1382
;1381:
;1382:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1383
;1383:	bolt->classname = "rocket";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $310
ASGNP4
line 1384
;1384:	bolt->think = G_HomingMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_HomingMissile
ASGNP4
line 1385
;1385:	bolt->nextthink = level.time + FIRST_HOMING_THINK;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 1386
;1386:	bolt->lastthinktime = level.time + 15000;
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 15000
ADDI4
ASGNI4
line 1387
;1387:	bolt->lastthink = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 1388
;1388:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1389
;1389:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1390
;1390:	bolt->s.weapon = WP_ROCKET_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 5
ASGNI4
line 1391
;1391:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1394
;1392:	//unlagged - projectile nudge
;1393:	// we'll need this for nudging projectiles later
;1394:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1396
;1395:	//unlagged - projectile nudge
;1396:	bolt->s.eFlags |= EF_ALT_FIRING;
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
line 1397
;1397:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1398
;1398:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1399
;1399:	bolt->damage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 100
ASGNI4
line 1400
;1400:	bolt->splashDamage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 100
ASGNI4
line 1401
;1401:	bolt->splashRadius = 120;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 120
ASGNI4
line 1402
;1402:	bolt->methodOfDeath = MOD_ROCKET;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 6
ASGNI4
line 1403
;1403:	bolt->splashMethodOfDeath = MOD_ROCKET_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 7
ASGNI4
line 1404
;1404:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1405
;1405:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1406
;1406:	bolt->s.otherEntityNum2 = ENTITYNUM_WORLD;
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1022
ASGNI4
line 1410
;1407:
;1408:
;1409:
;1410:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 1411
;1411:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1412
;1412:	bolt->constantSpeed = HOMING_MISSILE_SPEED;
ADDRLP4 0
INDIRP4
CNSTI4 892
ADDP4
CNSTI4 800
ASGNI4
line 1413
;1413:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1414
;1414:	VectorScale( dir, bolt->constantSpeed, bolt->s.pos.trDelta );
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
line 1415
;1415:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 1416
;1416:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1417
;1417:	VectorCopy (dir, bolt->r.currentAngles);		// this is new line.
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 1419
;1418:
;1419:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $313
endproc fire_alt_rocket 48 4
export fire_mg
proc fire_mg 32 4
line 1429
;1420:}
;1421:
;1422:
;1423:/*
;1424:=================
;1425:fire_mg
;1426:
;1427:=================
;1428:*/
;1429:gentity_t *fire_mg (gentity_t *self, vec3_t start, vec3_t dir, qboolean alt) {
line 1432
;1430:	gentity_t	*bolt;
;1431:
;1432:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1434
;1433:
;1434:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1435
;1435:	bolt->classname = "machinegun";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $318
ASGNP4
line 1436
;1436:	bolt->nextthink = level.time + 10000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 1437
;1437:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 1438
;1438:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1439
;1439:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1440
;1440:	bolt->s.weapon = WP_MACHINEGUN;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 2
ASGNI4
line 1441
;1441:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1444
;1442:	//unlagged - projectile nudge
;1443:	// we'll need this for nudging projectiles later
;1444:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1446
;1445:	//unlagged - projectile nudge
;1446:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1448
;1447:	
;1448:	if (alt == qtrue)
ADDRFP4 12
INDIRI4
CNSTI4 1
NEI4 $320
line 1449
;1449:	{
line 1450
;1450:		bolt->damage = 20;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 20
ASGNI4
line 1451
;1451:		bolt->splashDamage = 10;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 10
ASGNI4
line 1452
;1452:		bolt->splashRadius = 10;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 10
ASGNI4
line 1454
;1453:		//bolt->s.time2 = 555; // 555 is alt fire?
;1454:		bolt->s.eFlags |= EF_ALT_FIRING;
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
line 1456
;1455:
;1456:	} 
ADDRGP4 $321
JUMPV
LABELV $320
line 1458
;1457:	else
;1458:	{
line 1459
;1459:		bolt->damage = 10;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 10
ASGNI4
line 1460
;1460:		bolt->splashDamage = 5;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 5
ASGNI4
line 1461
;1461:		bolt->splashRadius = 5;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 5
ASGNI4
line 1462
;1462:	}
LABELV $321
line 1463
;1463:	bolt->methodOfDeath = MOD_MACHINEGUN;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 3
ASGNI4
line 1464
;1464:	bolt->splashMethodOfDeath = MOD_MACHINEGUN;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 3
ASGNI4
line 1465
;1465:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1466
;1466:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1468
;1467:
;1468:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 1469
;1469:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1470
;1470:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1471
;1471:   	VectorScale( dir, 2000, bolt->s.pos.trDelta );
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
line 1472
;1472:   	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 1474
;1473:   
;1474:   	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1476
;1475:   
;1476:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $317
endproc fire_mg 32 4
export fire_turret
proc fire_turret 32 4
line 1485
;1477:}
;1478:
;1479:/*
;1480:=================
;1481:fire_turret
;1482:
;1483:=================
;1484:*/
;1485:gentity_t *fire_turret (gentity_t *self, vec3_t start, vec3_t dir, qboolean alt) {
line 1488
;1486:	gentity_t	*bolt;
;1487:
;1488:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1490
;1489:
;1490:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1491
;1491:	bolt->classname = "plasma";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $206
ASGNP4
line 1492
;1492:	bolt->nextthink = level.time + 10000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 1493
;1493:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 1494
;1494:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1495
;1495:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1496
;1496:	bolt->s.weapon = WP_MACHINEGUN;  // Shafe FIXME: Maybe this should be WP_TURRET?
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 2
ASGNI4
line 1497
;1497:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1500
;1498:	//unlagged - projectile nudge
;1499:	// we'll need this for nudging projectiles later
;1500:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1502
;1501:	//unlagged - projectile nudge
;1502:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1505
;1503:	
;1504:	
;1505:	if (alt == qtrue)
ADDRFP4 12
INDIRI4
CNSTI4 1
NEI4 $325
line 1506
;1506:	{
line 1507
;1507:		bolt->damage = 20;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 20
ASGNI4
line 1508
;1508:		bolt->splashDamage = 10;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 10
ASGNI4
line 1509
;1509:		bolt->splashRadius = 10;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 10
ASGNI4
line 1510
;1510:		bolt->s.eFlags |= EF_ALT_FIRING;
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
line 1512
;1511:
;1512:	} 
ADDRGP4 $326
JUMPV
LABELV $325
line 1514
;1513:	else
;1514:	{
line 1515
;1515:		bolt->damage = 10;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 10
ASGNI4
line 1516
;1516:		bolt->splashDamage = 5;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 5
ASGNI4
line 1517
;1517:		bolt->splashRadius = 5;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 5
ASGNI4
line 1518
;1518:	}
LABELV $326
line 1519
;1519:	bolt->methodOfDeath = MOD_TURRET;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 24
ASGNI4
line 1520
;1520:	bolt->splashMethodOfDeath = MOD_TURRET;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 24
ASGNI4
line 1521
;1521:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1522
;1522:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1524
;1523:
;1524:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 1525
;1525:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1526
;1526:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1527
;1527:   	VectorScale( dir, 2000, bolt->s.pos.trDelta );
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
line 1528
;1528:   	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 1530
;1529:   
;1530:   	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1532
;1531:   
;1532:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $323
endproc fire_turret 32 4
export fire_grapple
proc fire_grapple 36 4
line 1540
;1533:}
;1534:
;1535:/*
;1536:=================
;1537:fire_grapple
;1538:=================
;1539:*/
;1540:gentity_t *fire_grapple (gentity_t *self, vec3_t start, vec3_t dir) {
line 1546
;1541:	gentity_t	*hook;
;1542://unlagged - grapple
;1543:	int hooktime;
;1544://unlagged - grapple
;1545:
;1546:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1548
;1547:
;1548:	hook = G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1549
;1549:	hook->classname = "hook";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $220
ASGNP4
line 1550
;1550:	hook->nextthink = level.time + 10000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 1551
;1551:	hook->think = Weapon_HookFree;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 Weapon_HookFree
ASGNP4
line 1552
;1552:	hook->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1553
;1553:	hook->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1554
;1554:	hook->s.weapon = WP_GRAPPLING_HOOK;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 10
ASGNI4
line 1555
;1555:	hook->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1556
;1556:	hook->methodOfDeath = MOD_GRAPPLE;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 25
ASGNI4
line 1557
;1557:	hook->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1558
;1558:	hook->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1559
;1559:	hook->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1561
;1560:	
;1561:	if (g_GrappleMode.integer == 1) // 0 - Normal, 1 - Instagib, 2 - Holds People
ADDRGP4 g_GrappleMode+12
INDIRI4
CNSTI4 1
NEI4 $330
line 1562
;1562:	{
line 1563
;1563:		hook->damage = 999;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 999
ASGNI4
line 1564
;1564:		hook->splashDamage = 50;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 50
ASGNI4
line 1565
;1565:		hook->splashRadius = 10;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 10
ASGNI4
line 1566
;1566:	}
LABELV $330
line 1568
;1567:
;1568:	if (g_GrappleMode.integer == 2) // 0 - Normal, 1 - Instagib, 2 - Holds People
ADDRGP4 g_GrappleMode+12
INDIRI4
CNSTI4 2
NEI4 $333
line 1569
;1569:	{
line 1570
;1570:		hook->damage = 0.01;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 0
ASGNI4
line 1571
;1571:		hook->splashDamage = 1;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 1
ASGNI4
line 1572
;1572:		hook->splashRadius = 1;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 1
ASGNI4
line 1573
;1573:	}
LABELV $333
line 1577
;1574:
;1575://unlagged - grapple
;1576:	// we might want this later
;1577:	hook->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1582
;1578:
;1579:	// setting the projectile base time back makes the hook's first
;1580:	// step larger
;1581:
;1582:	if ( self->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $336
line 1583
;1583:		hooktime = self->client->pers.cmd.serverTime + 50;
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
line 1584
;1584:	}
ADDRGP4 $337
JUMPV
LABELV $336
line 1585
;1585:	else {
line 1586
;1586:		hooktime = level.time - MISSILE_PRESTEP_TIME;
ADDRLP4 4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1587
;1587:	}
LABELV $337
line 1589
;1588:
;1589:	hook->s.pos.trTime = hooktime;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1592
;1590://unlagged - grapple
;1591:
;1592:	hook->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 1596
;1593://unlagged - grapple
;1594:	//hook->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
;1595://unlagged - grapple
;1596:	hook->s.otherEntityNum = self->s.number; // use to match beam in client
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1597
;1597:	VectorCopy( start, hook->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1598
;1598:	VectorScale( dir, 800, hook->s.pos.trDelta );
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
line 1599
;1599:	SnapVector( hook->s.pos.trDelta );			// save net bandwidth
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
line 1600
;1600:	VectorCopy (start, hook->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1602
;1601:
;1602:	self->client->hook = hook;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2708
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1604
;1603:
;1604:	return hook;
ADDRLP4 0
INDIRP4
RETP4
LABELV $328
endproc fire_grapple 36 4
export fire_alt_gata
proc fire_alt_gata 36 4
line 1612
;1605:}
;1606:
;1607:/*
;1608:=================
;1609:fire_alt_gata
;1610:=================
;1611:*/
;1612:gentity_t *fire_alt_gata (gentity_t *self, vec3_t start, vec3_t dir) {
line 1618
;1613:	gentity_t	*hook;
;1614://unlagged - grapple
;1615:	int hooktime;
;1616://unlagged - grapple
;1617:
;1618:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1620
;1619:
;1620:	hook = G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1621
;1621:	hook->classname = "hook";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $220
ASGNP4
line 1622
;1622:	hook->nextthink = level.time + 10000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 1624
;1623:	//hook->think = Weapon_HookFree;
;1624:	hook->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1625
;1625:	hook->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1626
;1626:	hook->s.weapon = WP_PLASMAGUN;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 8
ASGNI4
line 1627
;1627:	hook->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1628
;1628:	hook->methodOfDeath = MOD_PLASMA;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 8
ASGNI4
line 1629
;1629:	hook->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1630
;1630:	hook->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1631
;1631:	hook->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1634
;1632:	
;1633:	
;1634:		hook->damage = 10;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 10
ASGNI4
line 1635
;1635:		hook->splashDamage = 50;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 50
ASGNI4
line 1636
;1636:		hook->splashRadius = 10;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 10
ASGNI4
line 1643
;1637:	
;1638:
;1639:	
;1640:
;1641://unlagged - grapple
;1642:	// we might want this later
;1643:	hook->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1648
;1644:
;1645:	// setting the projectile base time back makes the hook's first
;1646:	// step larger
;1647:
;1648:	if ( self->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $341
line 1649
;1649:		hooktime = self->client->pers.cmd.serverTime + 50;
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
line 1650
;1650:	}
ADDRGP4 $342
JUMPV
LABELV $341
line 1651
;1651:	else {
line 1652
;1652:		hooktime = level.time - MISSILE_PRESTEP_TIME;
ADDRLP4 4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1653
;1653:	}
LABELV $342
line 1655
;1654:
;1655:	hook->s.pos.trTime = hooktime;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1658
;1656://unlagged - grapple
;1657:
;1658:	hook->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 1662
;1659://unlagged - grapple
;1660:	//hook->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
;1661://unlagged - grapple
;1662:	hook->s.otherEntityNum = self->s.number; // use to match beam in client
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1663
;1663:	VectorCopy( start, hook->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1664
;1664:	VectorScale( dir, 800, hook->s.pos.trDelta );
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
line 1665
;1665:	SnapVector( hook->s.pos.trDelta );			// save net bandwidth
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
line 1666
;1666:	VectorCopy (start, hook->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1668
;1667:
;1668:	self->client->hook = hook;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2708
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1670
;1669:
;1670:	return hook;
ADDRLP4 0
INDIRP4
RETP4
LABELV $339
endproc fire_alt_gata 36 4
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
import g_CurrentRound
import g_NumRounds
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
LABELV $318
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
LABELV $310
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $295
byte 1 98
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $286
byte 1 102
byte 1 108
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $282
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $275
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
LABELV $269
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 0
align 1
LABELV $220
byte 1 104
byte 1 111
byte 1 111
byte 1 107
byte 1 0
align 1
LABELV $206
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 0
align 1
LABELV $92
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
LABELV $87
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
LABELV $70
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
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 33
byte 1 10
byte 1 34
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
