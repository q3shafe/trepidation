export pdg_explode
code
proc pdg_explode 28 12
file "../g_missile.c"
line 26
;1:// 2016 Trepidation Licensed under the GPL2 - Team Trepidation
;2://
;3:#include "g_local.h"
;4:
;5:#define	MISSILE_PRESTEP_TIME	50
;6:#define FIRST_HOMING_THINK		500
;7:#define HOMING_THINK			125
;8:#define HOMING_MISSILE_SPEED	800
;9:
;10:
;11:#define FLAMER_K_SCALE              2.0f
;12:#define FLAMER_RADIUS               50       // splash radius
;13:#define FLAMER_SIZE                 15        // missile bounding box
;14:#define FLAMER_LIFETIME             800.0f
;15:#define FLAMER_SPEED                600.0f
;16:#define FLAMER_LAG                  0.65f    // the amount of player velocity that is added to the fireball
;17:
;18:
;19:void G_ExplodeDevastatorFire( gentity_t *ent );
;20:gentity_t *fire_devparticle (gentity_t *self, vec3_t start, vec3_t dir, qboolean alt);
;21:
;22:// Shafe - Once everything works this file needs cleaned up
;23:
;24:
;25:
;26:void pdg_explode(gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod){
line 30
;27:
;28:	vec3_t dir; // needed by the event being added
;29:
;30:	dir[0] = dir[1] = 0;
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
line 31
;31:	dir[2] = 1;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 32
;32:	if (self->chain)
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $58
line 33
;33:		G_FreeEntity(self->chain); // get rid of the gun. // the gun just vanishes
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
line 34
;34:		self->s.weapon=WP_ROCKET_LAUNCHER; // to tell it what kind of explosion to use
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 8
ASGNI4
line 35
;35:		G_AddEvent( self, EV_MISSILE_MISS, DirToByte( dir ) ); // to tell it to spawn an explosion here	
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
line 36
;36:		self->freeAfterEvent = qtrue; // so it goes away after the explosion
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 38
;37:
;38:	if (self->parent->istelepoint != 0)
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
line 39
;39:	{
line 40
;40:		trap_SendServerCommand( self->r.ownerNum, va("cp \"^9%s Destroyed your PDG!\n\"", attacker->client->pers.netname) );
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
line 41
;41:	}
LABELV $60
line 42
;42:	self->parent->istelepoint = 0; // client cannot teleport
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 0
ASGNI4
line 43
;43: 	VectorClear( self->parent->teleloc ); // clear the teleport location
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
line 47
;44:	//G_Printf( S_COLOR_GREEN "Particle Displacement Grenade Expired\n" );
;45:
;46:
;47:}
LABELV $55
endproc pdg_explode 28 12
export bomb_explode
proc bomb_explode 24 12
line 49
;48:
;49:void bomb_explode(gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod){
line 53
;50:
;51:	vec3_t dir; // needed by the event being added
;52:
;53:	dir[0] = dir[1] = 0;
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
line 54
;54:	dir[2] = 1;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 55
;55:	if (self->chain)
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $66
line 56
;56:		G_FreeEntity(self->chain); // get rid of the gun. // the gun just vanishes
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
line 57
;57:		self->s.weapon=WP_ROCKET_LAUNCHER; // to tell it what kind of explosion to use
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 8
ASGNI4
line 58
;58:		G_AddEvent( self, EV_MISSILE_MISS, DirToByte( dir ) ); // to tell it to spawn an explosion here	
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
line 59
;59:		self->freeAfterEvent = qtrue; // so it goes away after the explosion
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 61
;60:
;61:	if (self->parent->istelepoint != 0)
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
line 62
;62:	{
line 63
;63:		trap_SendServerCommand( self->r.ownerNum, va("cp \"^9%s Destroyed your bomb!\n\"", attacker->client->pers.netname) );
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
line 64
;64:	}
LABELV $68
line 65
;65:	self->parent->client->bombfired = qfalse;
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
line 71
;66:	
;67:
;68:	
;69:
;70:
;71:}
LABELV $63
endproc bomb_explode 24 12
export G_Missile_Die
proc G_Missile_Die 0 0
line 78
;72:
;73:/*
;74:================
;75:G_Missile_Die
;76:================
;77:*/
;78:void G_Missile_Die( gentity_t *ent, gentity_t *inflictor, gentity_t *attacker, int damage, int mod ) {
line 79
;79:	ent->nextthink = level.time + 1;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 80
;80:	ent->think = G_ExplodeMissile;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 82
;81:
;82:}
LABELV $71
endproc G_Missile_Die 0 0
export G_BounceMissile
proc G_BounceMissile 56 12
line 90
;83:
;84:/*
;85:================
;86:G_BounceMissile
;87:
;88:================
;89:*/
;90:void G_BounceMissile( gentity_t *ent, trace_t *trace ) {
line 96
;91:	vec3_t	velocity;
;92:	float	dot;
;93:	int		hitTime;
;94:
;95:	// reflect the velocity on the trace plane
;96:	hitTime = level.previousTime + ( level.time - level.previousTime ) * trace->fraction;
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
line 97
;97:	BG_EvaluateTrajectoryDelta( &ent->s.pos, hitTime, velocity );
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
line 98
;98:	dot = DotProduct( velocity, trace->plane.normal );
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
line 99
;99:	VectorMA( velocity, -2*dot, trace->plane.normal, ent->s.pos.trDelta );
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
line 101
;100:
;101:	if ( ent->s.eFlags & EF_BOUNCE_HALF ) 
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $81
line 102
;102:	{
line 103
;103:		VectorScale( ent->s.pos.trDelta, 0.65, ent->s.pos.trDelta );
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
line 105
;104:		// check for stop
;105:		if ( trace->plane.normal[2] > 0.2 && VectorLength( ent->s.pos.trDelta ) < 40 )
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
line 106
;106:		{
line 107
;107:			G_SetOrigin( ent, trace->endpos );				
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
line 110
;108:			
;109:			// Shafe - trep - pdg
;110:			if ( !Q_stricmp( ent->classname, "pdgrenade") )
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
line 111
;111:			{
line 112
;112:				if ( ent->client->ps.stats[STAT_HEALTH] <= 0 ) 
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
line 113
;113:				{ // Don't do anything when you are dead -Vincent
line 114
;114: 					if ( ent->parent->istelepoint != 0 )
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
line 115
;115:					{ // Failsafe
line 116
;116:					ent->parent->istelepoint = 0;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 0
ASGNI4
line 117
;117:					VectorClear( ent->parent->teleloc );
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
line 118
;118:					}
line 119
;119:					return;
ADDRGP4 $73
JUMPV
LABELV $88
line 121
;120:				}
;121:				ent->parent->istelepoint = 1;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 1
ASGNI4
line 122
;122:				VectorCopy(ent->r.currentOrigin, ent->parent->teleloc);
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
line 123
;123:				ent->parent->teleloc[2] += 20;
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
line 125
;124:							
;125:				trap_SendServerCommand( ent->r.ownerNum, va("cp \"^9Particle Displacement Grenade Lock!\n\"") );
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
line 127
;126:				//G_Printf( S_COLOR_RED "Particle Displacement Grenade Lock!\n" );
;127:			} // end shafe
line 129
;128:			
;129:			return;
ADDRGP4 $73
JUMPV
LABELV $83
line 131
;130:		}
;131:	}
LABELV $81
line 133
;132:
;133:	VectorAdd( ent->r.currentOrigin, trace->plane.normal, ent->r.currentOrigin);
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
line 134
;134:	VectorCopy( ent->r.currentOrigin, ent->s.pos.trBase );
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
line 135
;135:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 136
;136:}
LABELV $73
endproc G_BounceMissile 56 12
export G_HomingMissile
proc G_HomingMissile 96 12
line 140
;137:
;138:
;139:
;140:void G_HomingMissile( gentity_t *ent ) {
line 141
;141:	gentity_t	*target = NULL;
ADDRLP4 32
CNSTP4 0
ASGNP4
line 142
;142:	gentity_t	*blip = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 147
;143:	vec3_t		dir, blipdir;
;144:	vec_t		dot, cs;
;145:	qboolean	chaff;
;146:
;147:	if (ent->parent->health <= 0)
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
line 148
;148:	{
line 149
;149:		ent->nextthink = level.time + 4000;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 4000
ADDI4
ASGNI4
line 150
;150:		ent->think = G_ExplodeMissile;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 151
;151:		return;
ADDRGP4 $94
JUMPV
LABELV $98
line 155
;152:	}
;153:
;154:
;155:	while ((blip = findradius(blip, ent->r.currentOrigin, 2000 * 2000)) != NULL)	{
line 156
;156:			chaff = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 158
;157:
;158:			if (blip->client==NULL)			continue;
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
line 159
;159:			if (blip==ent->parent)			continue;
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
line 160
;160:			if (blip->health<=0)			continue;
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
line 161
;161:			if (blip->client->sess.sessionTeam >= TEAM_SPECTATOR)
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
CNSTI4 3
LTI4 $107
line 162
;162:				continue;
ADDRGP4 $99
JUMPV
LABELV $107
line 164
;163:
;164:			if ((g_gametype.integer == GT_TEAM || g_gametype.integer == GT_CTF) &&
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
line 166
;165:				OnSameTeam( blip, ent->parent ) )
;166:				continue;
ADDRGP4 $99
JUMPV
LABELV $109
line 169
;167:		
;168:
;169:		if (!visible (ent, blip))
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
line 170
;170:			continue;
ADDRGP4 $99
JUMPV
LABELV $114
line 172
;171:
;172:		VectorSubtract(blip->r.currentOrigin, ent->r.currentOrigin, blipdir);
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
line 175
;173:
;174:		//NT - give chaff a higher weight
;175:		if (chaff)
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $118
line 176
;176:		{
line 177
;177:			VectorScale(blipdir, 0.5, blipdir);
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
line 178
;178:		}
LABELV $118
line 180
;179:
;180:		if ((target == NULL) || (VectorLength(blipdir) < VectorLength(dir)))
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
line 181
;181:		{
line 182
;182:			if (chaff)
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $127
line 183
;183:			{
line 184
;184:				VectorScale(blipdir, 2, blipdir);
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
line 185
;185:			}
LABELV $127
line 188
;186:
;187:			// E.B = |E||B|cos(theta)
;188:			dot = _DotProduct(ent->r.currentAngles, blipdir);
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
line 191
;189:
;190:			// Divide E.B by |E||B| to get cos(theta)
;191:			cs = dot / (VectorLength(ent->r.currentAngles) * VectorLength(blipdir));
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
line 194
;192:
;193:			// If angle is less than 120 degrees
;194:			if (cs > cos(120.0f * M_PI / 180.0f))
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
line 195
;195:			{
line 197
;196:				// We add it as our target
;197:				target = blip;
ADDRLP4 32
ADDRLP4 0
INDIRP4
ASGNP4
line 198
;198:				VectorCopy(blipdir, dir);
ADDRLP4 20
ADDRLP4 4
INDIRB
ASGNB 12
line 199
;199:			}
LABELV $133
line 200
;200:		}
LABELV $124
line 201
;201:	}
LABELV $99
line 155
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
line 203
;202:
;203:	if (target == NULL)	{
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $135
line 204
;204:		ent->nextthink = level.time + HOMING_THINK; // + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 125
ADDI4
ASGNI4
line 205
;205:		ent->think = G_HomingMissile;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_HomingMissile
ASGNP4
line 206
;206:	} else {
ADDRGP4 $136
JUMPV
LABELV $135
line 208
;207:		// for exact trajectory calculation, set current point to base.
;208:		VectorCopy(ent->r.currentOrigin, ent->s.pos.trBase );
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
line 210
;209:
;210:		VectorNormalize(dir);
ADDRLP4 20
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 212
;211:		// 0.5 is swing rate.
;212:		VectorScale(dir, 0.5, dir);
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
line 213
;213:		VectorAdd(dir,ent->r.currentAngles,dir);
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
line 216
;214:
;215:		// turn nozzle to target angle
;216:		VectorNormalize(dir);
ADDRLP4 20
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 217
;217:		VectorCopy(dir, ent->r.currentAngles);
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ADDRLP4 20
INDIRB
ASGNB 12
line 220
;218:
;219:		// scale direction, put into trDelta
;220:		VectorScale(dir, ent->constantSpeed, dir);
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
line 221
;221:		VectorCopy(dir, ent->s.pos.trDelta);
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 20
INDIRB
ASGNB 12
line 223
;222:
;223:		ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 225
;224:
;225:		SnapVector (ent->s.pos.trDelta);                      // save net bandwidth
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
line 226
;226:		ent->nextthink = level.time + HOMING_THINK;	// decrease this value also makes fast swing
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 125
ADDI4
ASGNI4
line 227
;227:		ent->think = G_HomingMissile;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_HomingMissile
ASGNP4
line 228
;228:	}
LABELV $136
line 229
;229:}
LABELV $94
endproc G_HomingMissile 96 12
export G_ExplodeDevastatorFire2
proc G_ExplodeDevastatorFire2 72 24
line 238
;230:
;231:
;232:/*
;233:========================
;234:G_ExplodeDevastatorFire
;235:
;236:========================
;237:*/
;238:void G_ExplodeDevastatorFire2( gentity_t *ent ) {
line 248
;239:	vec3_t		dir;
;240:	vec3_t		origin;
;241:	vec3_t		dev1;
;242:	vec3_t		dev2;
;243:	/*
;244:	vec3_t		dev3;
;245:	vec3_t		dev4;
;246:	*/
;247:
;248:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
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
line 249
;249:	SnapVector( origin );
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
line 250
;250:	G_SetOrigin( ent, origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 253
;251:
;252:	// we don't have a valid direction, so just point straight up
;253:	dir[0] = dir[1] = 0;
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
line 254
;254:	dir[2] = 10;
ADDRLP4 12+8
CNSTF4 1092616192
ASGNF4
line 256
;255:
;256:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 257
;257:	G_AddEvent( ent, EV_MISSILE_MISS, DirToByte( dir ) );
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
line 259
;258:
;259:	ent->s.time2++;
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
line 261
;260:	
;261:	ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 264
;262:
;263:	// splash damage
;264:	if ( ent->splashDamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
CNSTI4 0
EQI4 $160
line 265
;265:		if( G_RadiusDamage( ent->r.currentOrigin, ent->parent, ent->splashDamage, ent->splashRadius, NULL
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
line 266
;266:			, ent->splashMethodOfDeath ) ) {
line 268
;267:			//g_entities[ent->r.ownerNum].client->ps.persistant[PERS_ACCURACY_HITS]++;
;268:		}
LABELV $162
line 269
;269:	}
LABELV $160
line 272
;270:
;271:
;272:		VectorSet(dev1, 25, 25, (30+ irandom(10,35)));
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
line 273
;273:		VectorSet(dev2, -25, 25, (30+ irandom(10,35)));
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
line 274
;274:		fire_devparticle (ent, origin, dev1, qtrue);
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
line 275
;275:		fire_devparticle (ent->parent, origin, dev2, qtrue);
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
line 278
;276:
;277:
;278:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 280
;279:	
;280:}
LABELV $152
endproc G_ExplodeDevastatorFire2 72 24
export G_ExplodeDevastatorFire
proc G_ExplodeDevastatorFire 116 24
line 283
;281:
;282:
;283:void G_ExplodeDevastatorFire( gentity_t *ent ) {
line 292
;284:	vec3_t		dir;
;285:	vec3_t		origin;
;286:	vec3_t		dev1;
;287:	vec3_t		dev2;
;288:	vec3_t		dev3;
;289:	vec3_t		dev4;
;290:
;291:
;292:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
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
line 293
;293:	SnapVector( origin );
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
line 294
;294:	G_SetOrigin( ent, origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 297
;295:
;296:	// we don't have a valid direction, so just point straight up
;297:	dir[0] = dir[1] = 0;
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
line 298
;298:	dir[2] = 10;
ADDRLP4 12+8
CNSTF4 1092616192
ASGNF4
line 300
;299:
;300:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 301
;301:	G_AddEvent( ent, EV_MISSILE_MISS, DirToByte( dir ) );
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
line 303
;302:
;303:	ent->s.time2++;
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
line 305
;304:	
;305:	ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 308
;306:
;307:	// splash damage
;308:	if ( ent->splashDamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
CNSTI4 0
EQI4 $176
line 309
;309:		if( G_RadiusDamage( ent->r.currentOrigin, ent->parent, ent->splashDamage, ent->splashRadius, NULL
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
line 310
;310:			, ent->splashMethodOfDeath ) ) {
line 312
;311:			//g_entities[ent->r.ownerNum].client->ps.persistant[PERS_ACCURACY_HITS]++;
;312:		}
LABELV $178
line 313
;313:	}
LABELV $176
line 316
;314:
;315:
;316:		VectorSet(dev1, (25+ irandom(1,35)), (25+ irandom(10,35)), 30);
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
line 317
;317:		VectorSet(dev2, (-25 - irandom(1,35)), (25+ irandom(10,35)), 30);
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
line 318
;318:		VectorSet(dev3, (25 + irandom(1,35)), (-25+ irandom(10,35)), 30);
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
line 319
;319:		VectorSet(dev4, (-25 - + irandom(1,35)), (-25+ irandom(10,35)), 30);
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
line 321
;320:		
;321:		fire_devparticle (ent->parent, origin, dev1, qfalse);
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
line 322
;322:		fire_devparticle (ent->parent, origin, dev2, qfalse);
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
line 323
;323:		fire_devparticle (ent->parent, origin, dev3, qfalse);
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
line 324
;324:		fire_devparticle (ent->parent, origin, dev4, qfalse);
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
line 326
;325:
;326:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 328
;327:	
;328:}
LABELV $168
endproc G_ExplodeDevastatorFire 116 24
export G_ExplodeMissile
proc G_ExplodeMissile 40 24
line 339
;329: 
;330:
;331:/*
;332:================
;333:G_ExplodeMissile
;334:
;335:Explode a missile without an impact
;336:================
;337:*/
;338:void G_ExplodeMissile( gentity_t *ent )
;339:{
line 343
;340:	vec3_t		dir;
;341:	vec3_t		origin;
;342:
;343:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
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
line 344
;344:	SnapVector( origin );
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
line 345
;345:	G_SetOrigin( ent, origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 348
;346:
;347:	// we don't have a valid direction, so just point straight up
;348:	dir[0] = dir[1] = 0;
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
line 349
;349:	dir[2] = 1;
ADDRLP4 12+8
CNSTF4 1065353216
ASGNF4
line 351
;350:
;351:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 353
;352:
;353:	if( ent->s.weapon != WP_LIGHTNING)
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 6
EQI4 $196
line 354
;354:	{
line 355
;355:    G_AddEvent( ent, EV_MISSILE_MISS, DirToByte( dir ) );
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
line 356
;356:	}
LABELV $196
line 360
;357:
;358:	//G_AddEvent( ent, EV_MISSILE_MISS, DirToByte( dir ) );
;359:
;360:	ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 363
;361:
;362:	// splash damage
;363:	if ( ent->splashDamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
CNSTI4 0
EQI4 $198
line 364
;364:		if( G_RadiusDamage( ent->r.currentOrigin, ent->parent, ent->splashDamage, ent->splashRadius, ent
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 496
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 772
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 780
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 G_RadiusDamage
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $200
line 365
;365:			, ent->splashMethodOfDeath ) ) {
line 366
;366:			g_entities[ent->r.ownerNum].client->accuracy_hits++;
ADDRLP4 36
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
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 367
;367:		}
LABELV $200
line 368
;368:	}
LABELV $198
line 370
;369:
;370:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 371
;371:}
LABELV $188
endproc G_ExplodeMissile 40 24
export G_MissileImpact
proc G_MissileImpact 56 32
line 548
;372:
;373:
;374:#ifdef MISSIONPACK
;375:/*
;376:================
;377:ProximityMine_Explode
;378:================
;379:*/
;380:static void ProximityMine_Explode( gentity_t *mine ) {
;381:	G_ExplodeMissile( mine );
;382:	// if the prox mine has a trigger free it
;383:	if (mine->activator) {
;384:		G_FreeEntity(mine->activator);
;385:		mine->activator = NULL;
;386:	}
;387:}
;388:
;389:/*
;390:================
;391:ProximityMine_Die
;392:================
;393:*/
;394:static void ProximityMine_Die( gentity_t *ent, gentity_t *inflictor, gentity_t *attacker, int damage, int mod ) {
;395:	ent->think = ProximityMine_Explode;
;396:	ent->nextthink = level.time + 1;
;397:}
;398:
;399:/*
;400:================
;401:ProximityMine_Trigger
;402:================
;403:*/
;404:void ProximityMine_Trigger( gentity_t *trigger, gentity_t *other, trace_t *trace ) {
;405:	vec3_t		v;
;406:	gentity_t	*mine;
;407:
;408:	if( !other->client ) {
;409:		return;
;410:	}
;411:
;412:	// trigger is a cube, do a distance test now to act as if it's a sphere
;413:	VectorSubtract( trigger->s.pos.trBase, other->s.pos.trBase, v );
;414:	if( VectorLength( v ) > trigger->parent->splashRadius ) {
;415:		return;
;416:	}
;417:
;418:
;419:	if ( g_gametype.integer >= GT_TEAM ) {
;420:		// don't trigger same team mines
;421:		if (trigger->parent->s.generic1 == other->client->sess.sessionTeam) {
;422:			return;
;423:		}
;424:	}
;425:
;426:	// ok, now check for ability to damage so we don't get triggered thru walls, closed doors, etc...
;427:	if( !CanDamage( other, trigger->s.pos.trBase ) ) {
;428:		return;
;429:	}
;430:
;431:	// trigger the mine!
;432:	mine = trigger->parent;
;433:	mine->s.loopSound = 0;
;434:	G_AddEvent( mine, EV_PROXIMITY_MINE_TRIGGER, 0 );
;435:	mine->nextthink = level.time + 500;
;436:
;437:	G_FreeEntity( trigger );
;438:}
;439:
;440:/*
;441:================
;442:ProximityMine_Activate
;443:================
;444:*/
;445:static void ProximityMine_Activate( gentity_t *ent ) {
;446:	gentity_t	*trigger;
;447:	float		r;
;448:
;449:	ent->think = ProximityMine_Explode;
;450:	ent->nextthink = level.time + g_proxMineTimeout.integer;
;451:
;452:	ent->takedamage = qtrue;
;453:	ent->health = 1;
;454:	ent->die = ProximityMine_Die;
;455:
;456:	ent->s.loopSound = G_SoundIndex( "sound/weapons/proxmine/wstbtick.wav" );
;457:
;458:	// build the proximity trigger
;459:	trigger = G_Spawn ();
;460:
;461:	trigger->classname = "proxmine_trigger";
;462:
;463:	r = ent->splashRadius;
;464:	VectorSet( trigger->r.mins, -r, -r, -r );
;465:	VectorSet( trigger->r.maxs, r, r, r );
;466:
;467:	G_SetOrigin( trigger, ent->s.pos.trBase );
;468:
;469:	trigger->parent = ent;
;470:	trigger->r.contents = CONTENTS_TRIGGER;
;471:	trigger->touch = ProximityMine_Trigger;
;472:
;473:	trap_LinkEntity (trigger);
;474:
;475:	// set pointer to trigger so the entity can be freed when the mine explodes
;476:	ent->activator = trigger;
;477:}
;478:
;479:/*
;480:================
;481:ProximityMine_ExplodeOnPlayer
;482:================
;483:*/
;484:static void ProximityMine_ExplodeOnPlayer( gentity_t *mine ) {
;485:	gentity_t	*player;
;486:
;487:	player = mine->enemy;
;488:	player->client->ps.eFlags &= ~EF_TICKING;
;489:
;490:	if ( player->client->invulnerabilityTime > level.time ) {
;491:		G_Damage( player, mine->parent, mine->parent, vec3_origin, mine->s.origin, 1000, DAMAGE_NO_KNOCKBACK, MOD_JUICED );
;492:		player->client->invulnerabilityTime = 0;
;493:		G_TempEntity( player->client->ps.origin, EV_JUICED );
;494:	}
;495:	else {
;496:		G_SetOrigin( mine, player->s.pos.trBase );
;497:		// make sure the explosion gets to the client
;498:		mine->r.svFlags &= ~SVF_NOCLIENT;
;499:		mine->splashMethodOfDeath = MOD_PROXIMITY_MINE;
;500:		G_ExplodeMissile( mine );
;501:	}
;502:}
;503:
;504:/*
;505:================
;506:ProximityMine_Player
;507:================
;508:*/
;509:static void ProximityMine_Player( gentity_t *mine, gentity_t *player ) {
;510:	if( mine->s.eFlags & EF_NODRAW ) {
;511:		return;
;512:	}
;513:
;514:	G_AddEvent( mine, EV_PROXIMITY_MINE_STICK, 0 );
;515:
;516:	if( player->s.eFlags & EF_TICKING ) {
;517:		player->activator->splashDamage += mine->splashDamage;
;518:		player->activator->splashRadius *= 1.50;
;519:		mine->think = G_FreeEntity;
;520:		mine->nextthink = level.time;
;521:		return;
;522:	}
;523:
;524:	player->client->ps.eFlags |= EF_TICKING;
;525:	player->activator = mine;
;526:
;527:	mine->s.eFlags |= EF_NODRAW;
;528:	mine->r.svFlags |= SVF_NOCLIENT;
;529:	mine->s.pos.trType = TR_LINEAR;
;530:	VectorClear( mine->s.pos.trDelta );
;531:
;532:	mine->enemy = player;
;533:	mine->think = ProximityMine_ExplodeOnPlayer;
;534:	if ( player->client->invulnerabilityTime > level.time ) {
;535:		mine->nextthink = level.time + 2 * 1000;
;536:	}
;537:	else {
;538:		mine->nextthink = level.time + 10 * 1000;
;539:	}
;540:}
;541:#endif
;542:
;543:/*
;544:================
;545:G_MissileImpact
;546:================
;547:*/
;548:void G_MissileImpact( gentity_t *ent, trace_t *trace ) {
line 550
;549:	gentity_t		*other;
;550:	qboolean		hitClient = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 555
;551:#ifdef MISSIONPACK
;552:	vec3_t			forward, impactpoint, bouncedir;
;553:	int				eFlags;
;554:#endif
;555:	other = &g_entities[trace->entityNum];
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
line 558
;556:
;557:	// check for bounce
;558:	if ( !other->takedamage &&
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
NEI4 $204
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 48
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $204
line 559
;559:		( ent->s.eFlags & ( EF_BOUNCE | EF_BOUNCE_HALF ) ) ) {
line 560
;560:		G_BounceMissile( ent, trace );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_BounceMissile
CALLV
pop
line 562
;561:		
;562:			if ( !Q_stricmp( ent->classname, "plasma") )
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRGP4 $208
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $206
line 563
;563:		{
line 564
;564:			G_AddEvent( ent, EV_PL_BOUNCE, 0 );
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
line 565
;565:		} 
ADDRGP4 $203
JUMPV
LABELV $206
line 567
;566:		else
;567:		{
line 569
;568:			// Regular Grenade
;569:			G_AddEvent( ent, EV_GRENADE_BOUNCE, 0 );
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
line 570
;570:		}
line 572
;571:
;572:		return;
ADDRGP4 $203
JUMPV
LABELV $204
line 597
;573:	}
;574:
;575:
;576:#ifdef MISSIONPACK
;577:	if ( other->takedamage ) {
;578:		if ( ent->s.weapon != WP_PROX_LAUNCHER ) {
;579:			if ( other->client && other->client->invulnerabilityTime > level.time ) {
;580:				//
;581:				VectorCopy( ent->s.pos.trDelta, forward );
;582:				VectorNormalize( forward );
;583:				if (G_InvulnerabilityEffect( other, forward, ent->s.pos.trBase, impactpoint, bouncedir )) {
;584:					VectorCopy( bouncedir, trace->plane.normal );
;585:					eFlags = ent->s.eFlags & EF_BOUNCE_HALF;
;586:					ent->s.eFlags &= ~EF_BOUNCE_HALF;
;587:					G_BounceMissile( ent, trace );
;588:					ent->s.eFlags |= eFlags;
;589:				}
;590:				ent->target_ent = other;
;591:				return;
;592:			}
;593:		}
;594:	}
;595:#endif
;596:	// impact damage
;597:	if (other->takedamage) {
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $209
line 599
;598:		// FIXME: wrong damage direction?
;599:		if ( ent->damage ) {
ADDRFP4 0
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
CNSTI4 0
EQI4 $211
line 602
;600:			vec3_t	velocity;
;601:
;602:			if( LogAccuracyHit( other, &g_entities[ent->r.ownerNum] ) ) {
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
EQI4 $213
line 603
;603:				g_entities[ent->r.ownerNum].client->accuracy_hits++;
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
line 604
;604:				hitClient = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 605
;605:			}
LABELV $213
line 606
;606:			BG_EvaluateTrajectoryDelta( &ent->s.pos, level.time, velocity );
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
line 607
;607:			if ( VectorLength( velocity ) == 0 ) {
ADDRLP4 12
ARGP4
ADDRLP4 28
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 28
INDIRF4
CNSTF4 0
NEF4 $217
line 608
;608:				velocity[2] = 1;	// stepped on a grenade
ADDRLP4 12+8
CNSTF4 1065353216
ASGNF4
line 609
;609:			}
LABELV $217
line 610
;610:			G_Damage (other, ent, &g_entities[ent->r.ownerNum], velocity,
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
line 613
;611:				ent->s.origin, ent->damage, 
;612:				0, ent->methodOfDeath);
;613:		}
LABELV $211
line 614
;614:	}
LABELV $209
line 653
;615:
;616:#ifdef MISSIONPACK
;617:	if( ent->s.weapon == WP_PROX_LAUNCHER ) {
;618:		if( ent->s.pos.trType != TR_GRAVITY ) {
;619:			return;
;620:		}
;621:
;622:		// if it's a player, stick it on to them (flag them and remove this entity)
;623:		if( other->s.eType == ET_PLAYER && other->health > 0 ) {
;624:			ProximityMine_Player( ent, other );
;625:			return;
;626:		}
;627:
;628:		SnapVectorTowards( trace->endpos, ent->s.pos.trBase );
;629:		G_SetOrigin( ent, trace->endpos );
;630:		ent->s.pos.trType = TR_STATIONARY;
;631:		VectorClear( ent->s.pos.trDelta );
;632:
;633:		G_AddEvent( ent, EV_PROXIMITY_MINE_STICK, trace->surfaceFlags );
;634:
;635:		ent->think = ProximityMine_Activate;
;636:		ent->nextthink = level.time + 2000;
;637:
;638:		vectoangles( trace->plane.normal, ent->s.angles );
;639:		ent->s.angles[0] += 90;
;640:
;641:		// link the prox mine to the other entity
;642:		ent->enemy = other;
;643:		ent->die = ProximityMine_Die;
;644:		VectorCopy(trace->plane.normal, ent->movedir);
;645:		VectorSet(ent->r.mins, -4, -4, -4);
;646:		VectorSet(ent->r.maxs, 4, 4, 4);
;647:		trap_LinkEntity(ent);
;648:
;649:		return;
;650:	}
;651:#endif
;652:
;653:	if (!strcmp(ent->classname, "hook")) {
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRGP4 $222
ARGP4
ADDRLP4 12
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $220
line 657
;654:		gentity_t *nent;
;655:		vec3_t v;
;656:
;657:		nent = G_Spawn();
ADDRLP4 32
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 658
;658:		if ( other->takedamage && other->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $223
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $223
line 660
;659:
;660:			G_AddEvent( nent, EV_MISSILE_HIT, DirToByte( trace->plane.normal ) );
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
line 661
;661:			nent->s.otherEntityNum = other->s.number;
ADDRLP4 16
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 663
;662:
;663:			ent->enemy = other;
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 665
;664:
;665:			v[0] = other->r.currentOrigin[0] + (other->r.mins[0] + other->r.maxs[0]) * 0.5;
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
line 666
;666:			v[1] = other->r.currentOrigin[1] + (other->r.mins[1] + other->r.maxs[1]) * 0.5;
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
line 667
;667:			v[2] = other->r.currentOrigin[2] + (other->r.mins[2] + other->r.maxs[2]) * 0.5;
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
line 669
;668:
;669:			SnapVectorTowards( v, ent->s.pos.trBase );	// save net bandwidth
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
line 670
;670:		} else {
ADDRGP4 $224
JUMPV
LABELV $223
line 671
;671:			VectorCopy(trace->endpos, v);
ADDRLP4 20
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 672
;672:			G_AddEvent( nent, EV_MISSILE_MISS, DirToByte( trace->plane.normal ) );
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
line 673
;673:			ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
CNSTP4 0
ASGNP4
line 674
;674:		}
LABELV $224
line 676
;675:
;676:		SnapVectorTowards( v, ent->s.pos.trBase );	// save net bandwidth
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
line 678
;677:
;678:		nent->freeAfterEvent = qtrue;
ADDRLP4 16
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 680
;679:		// change over to a normal entity right at the point of impact
;680:		nent->s.eType = ET_GENERAL;
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 681
;681:		ent->s.eType = ET_GRAPPLE;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 11
ASGNI4
line 683
;682:
;683:		G_SetOrigin( ent, v );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 684
;684:		G_SetOrigin( nent, v );
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 686
;685:
;686:		ent->think = Weapon_HookThink;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 Weapon_HookThink
ASGNP4
line 687
;687:		ent->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 689
;688:
;689:		ent->parent->client->ps.pm_flags |= PMF_GRAPPLE_PULL;
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
line 690
;690:		VectorCopy( ent->r.currentOrigin, ent->parent->client->ps.grapplePoint);
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
line 692
;691:
;692:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 693
;693:		trap_LinkEntity( nent );
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 695
;694:
;695:		return;
ADDRGP4 $203
JUMPV
LABELV $220
line 701
;696:	}
;697:
;698:	// is it cheaper in bandwidth to just remove this ent and create a new
;699:	// one, rather than changing the missile into the explosion?
;700:
;701:	if ( other->takedamage && other->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $228
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $228
line 702
;702:		G_AddEvent( ent, EV_MISSILE_HIT, DirToByte( trace->plane.normal ) );
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
line 703
;703:		ent->s.otherEntityNum = other->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 704
;704:	} else if( trace->surfaceFlags & SURF_METALSTEPS ) {
ADDRGP4 $229
JUMPV
LABELV $228
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $230
line 705
;705:		G_AddEvent( ent, EV_MISSILE_MISS_METAL, DirToByte( trace->plane.normal ) );
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
line 706
;706:	} else {
ADDRGP4 $231
JUMPV
LABELV $230
line 707
;707:		G_AddEvent( ent, EV_MISSILE_MISS, DirToByte( trace->plane.normal ) );
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
line 708
;708:	}
LABELV $231
LABELV $229
line 710
;709:
;710:	ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 713
;711:
;712:	// change over to a normal entity right at the point of impact
;713:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 715
;714:
;715:	SnapVectorTowards( trace->endpos, ent->s.pos.trBase );	// save net bandwidth
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
line 717
;716:
;717:	G_SetOrigin( ent, trace->endpos );
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
line 720
;718:
;719:	// splash damage (doesn't apply to person directly hit)
;720:	if ( ent->splashDamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
CNSTI4 0
EQI4 $232
line 721
;721:		if( G_RadiusDamage( trace->endpos, ent->parent, ent->splashDamage, ent->splashRadius, 
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
EQI4 $234
line 722
;722:			other, ent->splashMethodOfDeath ) ) {
line 723
;723:			if( !hitClient ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $236
line 724
;724:				g_entities[ent->r.ownerNum].client->accuracy_hits++;
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
line 725
;725:			}
LABELV $236
line 726
;726:		}
LABELV $234
line 727
;727:	}
LABELV $232
line 729
;728:
;729:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 730
;730:}
LABELV $203
endproc G_MissileImpact 56 32
export G_RunMissile
proc G_RunMissile 84 28
line 737
;731:
;732:/*
;733:================
;734:G_RunMissile
;735:================
;736:*/
;737:void G_RunMissile( gentity_t *ent ) {
line 743
;738:	vec3_t		origin;
;739:	trace_t		tr;
;740:	int			passent;
;741:
;742:	
;743:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
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
line 747
;744:
;745:
;746:	// if this missile bounced off an invulnerability sphere
;747:	if ( ent->target_ent ) {
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $241
line 748
;748:		passent = ent->target_ent->s.number;
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRP4
INDIRI4
ASGNI4
line 749
;749:	}
ADDRGP4 $242
JUMPV
LABELV $241
line 756
;750:#ifdef MISSIONPACK
;751:	// prox mines that left the owner bbox will attach to anything, even the owner
;752:	else if (ent->s.weapon == WP_PROX_LAUNCHER && ent->count) {
;753:		passent = ENTITYNUM_NONE;
;754:	}
;755:#endif
;756:	else {
line 758
;757:		// ignore interactions with the missile owner
;758:		passent = ent->r.ownerNum;
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ASGNI4
line 759
;759:	}
LABELV $242
line 761
;760:	// trace a line from the previous position to the current position
;761:	trap_Trace( &tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, origin, passent, ent->clipmask );
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
line 764
;762:
;763:	// Testing a fix for the "weird" missiles in water -Vincent
;764:	VectorCopy( tr.endpos, ent->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 766
;765:
;766:	if ( tr.startsolid ) {
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $244
line 767
;767:		tr.fraction = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 768
;768:	}
LABELV $244
line 770
;769:
;770:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 772
;771:
;772:	if ( tr.fraction != 1 && !tr.allsolid)  // 2nd parameter: -Vincent
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $248
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $248
line 773
;773:	{
line 775
;774:		// never explode or bounce on sky
;775:		if ( tr.surfaceFlags & SURF_NOIMPACT ) 
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $251
line 776
;776:		{
line 784
;777:			// If grapple, reset owner
;778:			/* Shafe - Trep - Comment this out for offhand grapple
;779:			if (ent->parent && ent->parent->client && ent->parent->client->hook == ent) {
;780:				ent->parent->client->hook = NULL;
;781:			}
;782:			*/
;783:			// Shafe - Trep - Offhand Grappling Hook
;784:			if (g_gametype.integer != GT_CTF) 
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
EQI4 $254
line 785
;785:			{
line 786
;786:				if (ent->parent && ent->parent->client->hook == ent)
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
EQU4 $257
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
NEU4 $257
line 787
;787:				{
line 788
;788:					ent->parent->client->hook = NULL;
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
line 789
;789:					ent->parent->client->hookhasbeenfired = qfalse;
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
line 790
;790:					ent->parent->client->fireHeld = qfalse;
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
line 791
;791:				}
LABELV $257
line 792
;792:			}
LABELV $254
line 795
;793:			// End Shafe
;794:
;795:			G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 796
;796:			return;
ADDRGP4 $239
JUMPV
LABELV $251
line 798
;797:		}
;798:		G_MissileImpact( ent, &tr );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_MissileImpact
CALLV
pop
line 799
;799:		if ( ent->s.eType != ET_MISSILE ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $259
line 800
;800:			return;		// exploded
ADDRGP4 $239
JUMPV
LABELV $259
line 802
;801:		}
;802:	}
LABELV $248
line 814
;803:#ifdef MISSIONPACK
;804:	// if the prox mine wasn't yet outside the player body
;805:	if (ent->s.weapon == WP_PROX_LAUNCHER && !ent->count) {
;806:		// check if the prox mine is outside the owner bbox
;807:		trap_Trace( &tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, ent->r.currentOrigin, ENTITYNUM_NONE, ent->clipmask );
;808:		if (!tr.startsolid || tr.entityNum != ent->r.ownerNum) {
;809:			ent->count = 1;
;810:		}
;811:	}
;812:#endif
;813:	// check think function after bouncing
;814:	G_RunThink( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 815
;815:}
LABELV $239
endproc G_RunMissile 84 28
export fire_plasma
proc fire_plasma 32 4
line 826
;816:
;817:
;818://=============================================================================
;819:
;820:/*
;821:=================
;822:fire_plasma
;823:This is actually alt fire now
;824:=================
;825:*/
;826:gentity_t *fire_plasma (gentity_t *self, vec3_t start, vec3_t dir) {
line 829
;827:	gentity_t	*bolt;
;828:
;829:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 831
;830:
;831:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 832
;832:	bolt->classname = "plasma";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $208
ASGNP4
line 833
;833:	bolt->nextthink = level.time + 1200; //10000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1200
ADDI4
ASGNI4
line 834
;834:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 835
;835:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 836
;836:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 837
;837:	bolt->s.weapon = WP_PLASMAGUN;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 7
ASGNI4
line 838
;838:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 841
;839://unlagged - projectile nudge
;840:	// we'll need this for nudging projectiles later
;841:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 843
;842://unlagged - projectile nudge
;843:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 844
;844:	bolt->damage = 20;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 20
ASGNI4
line 845
;845:	bolt->splashDamage = 15;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 15
ASGNI4
line 846
;846:	bolt->splashRadius = 20;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 20
ASGNI4
line 847
;847:	bolt->methodOfDeath = MOD_PLASMA;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 7
ASGNI4
line 848
;848:	bolt->splashMethodOfDeath = MOD_PLASMA_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 8
ASGNI4
line 849
;849:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 850
;850:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 853
;851:
;852:	// Shafe - Make it bounce
;853:	bolt->s.eFlags = EF_BOUNCE;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 16
ASGNI4
line 855
;854:
;855:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 856
;856:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 857
;857:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 858
;858:	VectorScale( dir, 2000, bolt->s.pos.trDelta );
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
line 859
;859:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 861
;860:
;861:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 863
;862:
;863:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $261
endproc fire_plasma 32 4
export fire_flamethrower2
proc fire_flamethrower2 72 4
line 884
;864:}	
;865:
;866:
;867:/*
;868:
;869:
;870:	2016 Weapons
;871:
;872:
;873:*/
;874:
;875:
;876:
;877:
;878:/*
;879:=================
;880:fire_flamethrower2
;881:=================
;882:*/
;883:gentity_t *fire_flamethrower2( gentity_t *self, vec3_t start, vec3_t dir )
;884:{
line 888
;885:  gentity_t *bolt;
;886:  vec3_t    pvel;
;887:
;888:  VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 890
;889:
;890:  bolt = G_Spawn();
ADDRLP4 16
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 891
;891:  bolt->classname = "flame";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $265
ASGNP4
line 892
;892:  bolt->nextthink = level.time + FLAMER_LIFETIME;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
CNSTF4 1145569280
ADDF4
CVFI4 4
ASGNI4
line 893
;893:  bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 894
;894:  bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 895
;895:  bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 896
;896:  bolt->s.weapon = WP_LIGHTNING;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 6
ASGNI4
line 897
;897:  bolt->s.generic1 = self->s.generic1; //weaponMode
ADDRLP4 20
CNSTI4 204
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 898
;898:  bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 899
;899:  bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 900
;900:  bolt->damage = 15;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 15
ASGNI4
line 901
;901:  bolt->splashDamage = 10;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 10
ASGNI4
line 902
;902:  bolt->splashRadius = FLAMER_RADIUS;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 50
ASGNI4
line 903
;903:  bolt->methodOfDeath = MOD_LIGHTNING;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 9
ASGNI4
line 904
;904:  bolt->splashMethodOfDeath = MOD_LIGHTNING;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 9
ASGNI4
line 905
;905:  bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 906
;906:  bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 907
;907:  bolt->r.mins[ 0 ] = bolt->r.mins[ 1 ] = bolt->r.mins[ 2 ] = -FLAMER_SIZE;
ADDRLP4 28
CNSTF4 3245342720
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRLP4 28
INDIRF4
ASGNF4
line 908
;908:  bolt->r.maxs[ 0 ] = bolt->r.maxs[ 1 ] = bolt->r.maxs[ 2 ] = FLAMER_SIZE;
ADDRLP4 36
CNSTF4 1097859072
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 464
ADDP4
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 456
ADDP4
ADDRLP4 36
INDIRF4
ASGNF4
line 910
;909:
;910:  bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 911
;911:  bolt->s.pos.trTime = level.time - 50;   // move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 912
;912:  VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 913
;913:  VectorScale( self->client->ps.velocity, FLAMER_LAG, pvel );
ADDRLP4 40
CNSTF4 1059481190
ASGNF4
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 40
INDIRF4
ADDRLP4 44
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 40
INDIRF4
ADDRLP4 44
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4+8
CNSTF4 1059481190
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ASGNF4
line 914
;914:  VectorMA( pvel, FLAMER_SPEED, dir, bolt->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 4
INDIRF4
CNSTF4 1142292480
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 4+4
INDIRF4
CNSTF4 1142292480
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 4+8
INDIRF4
CNSTF4 1142292480
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 915
;915:  SnapVector( bolt->s.pos.trDelta );      // save net bandwidth
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
line 917
;916:
;917:  VectorCopy( start, bolt->r.currentOrigin );
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 919
;918:
;919:  return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $264
endproc fire_flamethrower2 72 4
export fire_plasma2
proc fire_plasma2 32 4
line 930
;920:}
;921:
;922:
;923:
;924:/*
;925:=================
;926:fire_plasma2 alt
;927:
;928:=================
;929:*/
;930:gentity_t *fire_plasma2 (gentity_t *self, vec3_t start, vec3_t dir) {
line 933
;931:	gentity_t	*bolt;
;932:
;933:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 935
;934:
;935:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 936
;936:	bolt->classname = "plasma";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $208
ASGNP4
line 937
;937:	bolt->nextthink = level.time + 1200; //10000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1200
ADDI4
ASGNI4
line 938
;938:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 939
;939:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 940
;940:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 941
;941:	bolt->s.weapon = WP_PLASMAGUN;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 7
ASGNI4
line 942
;942:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 945
;943://unlagged - projectile nudge
;944:	// we'll need this for nudging projectiles later
;945:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 947
;946://unlagged - projectile nudge
;947:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 948
;948:	bolt->damage = 15;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 15
ASGNI4
line 949
;949:	bolt->splashDamage = 15;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 15
ASGNI4
line 950
;950:	bolt->splashRadius = 20;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 20
ASGNI4
line 951
;951:	bolt->methodOfDeath = MOD_PLASMA;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 7
ASGNI4
line 952
;952:	bolt->splashMethodOfDeath = MOD_PLASMA_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 8
ASGNI4
line 953
;953:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 954
;954:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 956
;955:
;956:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 957
;957:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 958
;958:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 959
;959:	VectorScale( dir, 2000, bolt->s.pos.trDelta );
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
line 960
;960:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 962
;961:
;962:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 964
;963:
;964:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $272
endproc fire_plasma2 32 4
export G_ExplodeBomb
proc G_ExplodeBomb 0 4
line 973
;965:}	
;966:
;967:
;968://=============================================================================
;969:
;970:
;971:
;972:// Shafe - Trep 
;973:void G_ExplodeBomb( gentity_t *ent ) {
line 976
;974: 
;975:		
;976:	if ( ent->client->bombfired == qtrue )
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2720
ADDP4
INDIRI4
CNSTI4 1
NEI4 $276
line 977
;977:	{ // -Vincent
line 978
;978:	ent->client->bombfired = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2720
ADDP4
CNSTI4 0
ASGNI4
line 979
;979:	ent->parent->client->bombfired = qfalse;
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
line 980
;980:	}
LABELV $276
line 982
;981:
;982:	G_ExplodeMissile( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_ExplodeMissile
CALLV
pop
line 983
;983:}
LABELV $275
endproc G_ExplodeBomb 0 4
export fire_bomb
proc fire_bomb 36 4
line 990
;984:/*
;985:=================
;986: fire_bomb
;987: Shafe - Trep 
;988:=================
;989:*/
;990:gentity_t *fire_bomb (gentity_t *self, vec3_t start, vec3_t dir, qboolean alt) {
line 994
;991:	gentity_t	*bolt;
;992:	//vec3_t		mins = { -8, -8, -8 }, maxs = { 8, 8, 8 };
;993:
;994:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 996
;995: 
;996:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 997
;997:	bolt->classname = "bomb";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $279
ASGNP4
line 998
;998:	bolt->nextthink = level.time + 30000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 30000
ADDI4
ASGNI4
line 999
;999:	bolt->think = G_ExplodeBomb;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeBomb
ASGNP4
line 1000
;1000:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1003
;1001:	//tr.surfaceFlags & SURF_NOIMPACT
;1002:	
;1003:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1004
;1004:	bolt->s.weapon = WP_GRENADE_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 5
ASGNI4
line 1005
;1005:	bolt->s.eFlags = EF_BOUNCE_HALF;  // Get rid of this for no bounce
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 32
ASGNI4
line 1006
;1006:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1010
;1007:
;1008:	//unlagged - projectile nudge
;1009:	// we'll need this for nudging projectiles later
;1010:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1012
;1011:	//unlagged - projectile nudge
;1012:	bolt->s.eFlags |= EF_ALT_FIRING;
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
line 1013
;1013:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1014
;1014:	bolt->damage = 150;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 150
ASGNI4
line 1015
;1015:	bolt->splashDamage = 200;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 200
ASGNI4
line 1016
;1016:	bolt->splashRadius = 200;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 200
ASGNI4
line 1017
;1017:	bolt->methodOfDeath = MOD_GRENADE;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 5
ASGNI4
line 1018
;1018:	bolt->splashMethodOfDeath = MOD_GRENADE_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 6
ASGNI4
line 1019
;1019:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1022
;1020: 
;1021:	// Health? Think it'll work?
;1022:	bolt->takedamage=qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
line 1023
;1023:	bolt->health = 45;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 45
ASGNI4
line 1024
;1024:	bolt->die = bomb_explode;
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
ADDRGP4 bomb_explode
ASGNP4
line 1026
;1025:
;1026:	bolt->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 1027
;1027:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1028
;1028:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1029
;1029:	VectorScale( dir, 900, bolt->s.pos.trDelta );
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
line 1030
;1030:	SnapVector( bolt->s.pos.trDelta );// save net bandwidth
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
line 1032
;1031: 
;1032:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1034
;1033: 
;1034: return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $278
endproc fire_bomb 36 4
export G_ExplodePDGrenade
proc G_ExplodePDGrenade 8 8
line 1042
;1035:}
;1036:
;1037://=============================================================================
;1038:
;1039:
;1040:
;1041:// Shafe - Trep 
;1042:void G_ExplodePDGrenade( gentity_t *ent ) {
line 1044
;1043: 
;1044:	if (ent->parent->istelepoint != 0)
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 840
ADDP4
INDIRI4
CNSTI4 0
EQI4 $283
line 1045
;1045:	{
line 1046
;1046:		trap_SendServerCommand( ent->r.ownerNum, va("cp \"^9PDG Lock Expired!\n\"") );
ADDRGP4 $285
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
line 1047
;1047:	}
LABELV $283
line 1048
;1048:	ent->parent->istelepoint = 0; // client cannot teleport
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 0
ASGNI4
line 1049
;1049: 	VectorClear( ent->parent->teleloc ); // clear the teleport location
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
line 1052
;1050:	//G_Printf( S_COLOR_GREEN "Particle Displacement Grenade Expired\n" );
;1051:	
;1052:	if ( ent->client->pdgfired == qtrue )
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2716
ADDP4
INDIRI4
CNSTI4 1
NEI4 $286
line 1053
;1053:	{ // -Vincent
line 1054
;1054:	ent->client->pdgfired = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2716
ADDP4
CNSTI4 0
ASGNI4
line 1055
;1055:	}
LABELV $286
line 1057
;1056:
;1057:	G_ExplodeMissile( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_ExplodeMissile
CALLV
pop
line 1058
;1058:}
LABELV $282
endproc G_ExplodePDGrenade 8 8
export fire_pdgrenade
proc fire_pdgrenade 36 4
line 1065
;1059:/*
;1060:=================
;1061: fire_pdgrenade
;1062: Shafe - Trep 
;1063:=================
;1064:*/
;1065:gentity_t *fire_pdgrenade (gentity_t *self, vec3_t start, vec3_t dir) {
line 1069
;1066:	gentity_t	*bolt;
;1067:	//vec3_t		mins = { -8, -8, -8 }, maxs = { 8, 8, 8 };
;1068:
;1069:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1071
;1070: 
;1071:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1072
;1072:	bolt->classname = "pdgrenade";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $87
ASGNP4
line 1073
;1073:	bolt->nextthink = level.time + 30000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 30000
ADDI4
ASGNI4
line 1074
;1074:	bolt->think = G_ExplodePDGrenade;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodePDGrenade
ASGNP4
line 1075
;1075:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1078
;1076:	//tr.surfaceFlags & SURF_NOIMPACT
;1077:	
;1078:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1079
;1079:	bolt->s.weapon = WP_GRENADE_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 5
ASGNI4
line 1080
;1080:	bolt->s.eFlags = EF_BOUNCE_HALF;  // Get rid of this for no bounce
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 32
ASGNI4
line 1081
;1081:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1085
;1082:
;1083:	//unlagged - projectile nudge
;1084:	// we'll need this for nudging projectiles later
;1085:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1087
;1086:	//unlagged - projectile nudge
;1087:	bolt->s.eFlags |= EF_ALT_FIRING;
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
line 1088
;1088:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1089
;1089:	bolt->damage = 1;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 1
ASGNI4
line 1090
;1090:	bolt->splashDamage = 0;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 0
ASGNI4
line 1091
;1091:	bolt->splashRadius = 0;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 0
ASGNI4
line 1092
;1092:	bolt->methodOfDeath = MOD_GRENADE;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 5
ASGNI4
line 1093
;1093:	bolt->splashMethodOfDeath = MOD_GRENADE_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 6
ASGNI4
line 1094
;1094:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1097
;1095: 
;1096:	// Health? Think it'll work?
;1097:	bolt->takedamage=qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
line 1098
;1098:	bolt->health = 35;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 35
ASGNI4
line 1099
;1099:	bolt->die = pdg_explode;
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
ADDRGP4 pdg_explode
ASGNP4
line 1101
;1100:
;1101:	bolt->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 1102
;1102:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1103
;1103:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1104
;1104:	VectorScale( dir, 700, bolt->s.pos.trDelta );
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
line 1105
;1105:	SnapVector( bolt->s.pos.trDelta );// save net bandwidth
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
line 1107
;1106: 
;1107:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1109
;1108: 
;1109: return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $288
endproc fire_pdgrenade 36 4
export fire_grenade
proc fire_grenade 32 4
line 1117
;1110:}
;1111:
;1112:/*
;1113:=================
;1114:fire_grenade
;1115:=================
;1116:*/
;1117:gentity_t *fire_grenade (gentity_t *self, vec3_t start, vec3_t dir) {
line 1120
;1118:	gentity_t	*bolt;
;1119:
;1120:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1122
;1121:
;1122:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1123
;1123:	bolt->classname = "grenade";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $292
ASGNP4
line 1124
;1124:	bolt->nextthink = level.time + 2500;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2500
ADDI4
ASGNI4
line 1125
;1125:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 1126
;1126:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1127
;1127:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1128
;1128:	bolt->s.weapon = WP_GRENADE_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 5
ASGNI4
line 1129
;1129:	bolt->s.eFlags = EF_BOUNCE_HALF;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 32
ASGNI4
line 1130
;1130:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1133
;1131://unlagged - projectile nudge
;1132:	// we'll need this for nudging projectiles later
;1133:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1135
;1134://unlagged - projectile nudge
;1135:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1136
;1136:	bolt->damage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 100
ASGNI4
line 1137
;1137:	bolt->splashDamage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 100
ASGNI4
line 1138
;1138:	bolt->splashRadius = 150;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 150
ASGNI4
line 1139
;1139:	bolt->methodOfDeath = MOD_GRENADE;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 5
ASGNI4
line 1140
;1140:	bolt->splashMethodOfDeath = MOD_GRENADE_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 6
ASGNI4
line 1141
;1141:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1142
;1142:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1144
;1143:
;1144:	bolt->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 1145
;1145:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1146
;1146:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1147
;1147:	VectorScale( dir, 700, bolt->s.pos.trDelta );
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
line 1148
;1148:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 1150
;1149:
;1150:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1152
;1151:
;1152:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $291
endproc fire_grenade 32 4
export fire_flame
proc fire_flame 32 4
line 1163
;1153:}
;1154:
;1155://=============================================================================
;1156:
;1157:/*
;1158:=================
;1159:fire_flame
;1160:Shafe - Trep - Flame Thrower
;1161:=================
;1162:*/
;1163:gentity_t *fire_flame (gentity_t *self, vec3_t start, vec3_t dir, qboolean alt) {
line 1167
;1164:
;1165:	gentity_t	*bolt;
;1166:
;1167:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1169
;1168:
;1169:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1170
;1170:	bolt->classname = "flame";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $265
ASGNP4
line 1171
;1171:	bolt->nextthink = level.time + 1000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 1172
;1172:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 1173
;1173:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1174
;1174:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1175
;1175:	bolt->s.weapon = WP_LIGHTNING;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 6
ASGNI4
line 1176
;1176:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1179
;1177://unlagged - projectile nudge
;1178:	// we'll need this for nudging projectiles later
;1179:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1181
;1180://unlagged - projectile nudge
;1181:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1184
;1182:	
;1183:	
;1184:	if (alt == qfalse ) 
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $297
line 1185
;1185:	{
line 1186
;1186:		bolt->methodOfDeath = MOD_ALTFLAMER;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 26
ASGNI4
line 1187
;1187:		bolt->damage = 60;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 60
ASGNI4
line 1188
;1188:		bolt->splashDamage = 55;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 55
ASGNI4
line 1189
;1189:		bolt->splashRadius = 55;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 55
ASGNI4
line 1190
;1190:	} else
ADDRGP4 $298
JUMPV
LABELV $297
line 1191
;1191:	{
line 1192
;1192:		bolt->methodOfDeath = MOD_ALTFLAMER;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 26
ASGNI4
line 1193
;1193:		bolt->damage = 40;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 40
ASGNI4
line 1194
;1194:		bolt->splashDamage = 25;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 25
ASGNI4
line 1195
;1195:		bolt->splashRadius = 45;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 45
ASGNI4
line 1196
;1196:		bolt->s.eFlags |= EF_ALT_FIRING;
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
line 1197
;1197:	}
LABELV $298
line 1199
;1198:
;1199:	bolt->splashMethodOfDeath = MOD_ALTFLAMER;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 26
ASGNI4
line 1200
;1200:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1202
;1201:
;1202:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 1203
;1203:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1204
;1204:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1205
;1205:	VectorScale( dir, 300, bolt->s.pos.trDelta );
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
line 1206
;1206:	SnapVector( bolt->s.pos.trDelta );// save net bandwidth
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
;1207:
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
;1210:return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $295
endproc fire_flame 32 4
export fire_altgrenade
proc fire_altgrenade 36 4
line 1224
;1211:}
;1212:
;1213:
;1214:
;1215:
;1216:
;1217:
;1218:/*
;1219:=================
;1220:fire_altgrenade
;1221:Shafe - Trep - Sticky Grenades for Alt
;1222:=================
;1223:*/
;1224:gentity_t *fire_altgrenade (gentity_t *self, vec3_t start, vec3_t dir) {
line 1227
;1225:	gentity_t	*bolt;
;1226:
;1227:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1229
;1228:
;1229:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1230
;1230:	bolt->classname = "grenade";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $292
ASGNP4
line 1231
;1231:	bolt->nextthink = level.time + 2500;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2500
ADDI4
ASGNI4
line 1232
;1232:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 1233
;1233:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1234
;1234:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1235
;1235:	bolt->s.weapon = WP_GRENADE_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 5
ASGNI4
line 1237
;1236://	bolt->s.eFlags = EF_BOUNCE_HALF;  // Simple Change
;1237:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1240
;1238://unlagged - projectile nudge
;1239:	// we'll need this for nudging projectiles later
;1240:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1242
;1241://unlagged - projectile nudge
;1242:	bolt->s.eFlags |= EF_ALT_FIRING;
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
line 1243
;1243:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1244
;1244:	bolt->damage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 100
ASGNI4
line 1245
;1245:	bolt->splashDamage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 100
ASGNI4
line 1246
;1246:	bolt->splashRadius = 150;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 150
ASGNI4
line 1247
;1247:	bolt->methodOfDeath = MOD_GRENADE;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 5
ASGNI4
line 1248
;1248:	bolt->splashMethodOfDeath = MOD_GRENADE_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 6
ASGNI4
line 1249
;1249:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1250
;1250:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1252
;1251:
;1252:	bolt->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 1253
;1253:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1254
;1254:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1255
;1255:	VectorScale( dir, 700, bolt->s.pos.trDelta );
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
line 1256
;1256:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 1258
;1257:
;1258:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1260
;1259:
;1260:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $300
endproc fire_altgrenade 36 4
export fire_devparticle
proc fire_devparticle 36 4
line 1272
;1261:}
;1262:
;1263://=============================================================================
;1264:
;1265:
;1266:
;1267:/*
;1268:=================
;1269:fire_devparticle
;1270:=================
;1271:*/
;1272:gentity_t *fire_devparticle (gentity_t *self, vec3_t start, vec3_t dir, qboolean alt) {
line 1275
;1273:	gentity_t	*bolt;
;1274:	//int			speed;
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
;1278:	bolt->classname = "bfg";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $304
ASGNP4
line 1280
;1279:
;1280:	if (alt == qfalse)
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $305
line 1281
;1281:	{
line 1282
;1282:	bolt->think = G_ExplodeDevastatorFire2;	
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeDevastatorFire2
ASGNP4
line 1283
;1283:	bolt->nextthink = level.time + 1500;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 1284
;1284:	} else {
ADDRGP4 $306
JUMPV
LABELV $305
line 1285
;1285:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 1286
;1286:	bolt->nextthink = level.time + 9000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 9000
ADDI4
ASGNI4
line 1287
;1287:	}
LABELV $306
line 1290
;1288:	
;1289:
;1290:	bolt->s.eFlags |= EF_ALT_FIRING;
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
line 1291
;1291:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1293
;1292:	//bolt->s.eFlags = EF_BOUNCE_HALF;
;1293:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1294
;1294:	bolt->s.weapon = WP_BFG;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 9
ASGNI4
line 1295
;1295:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1298
;1296://unlagged - projectile nudge
;1297:	// we'll need this for nudging projectiles later
;1298:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1300
;1299://unlagged - projectile nudge
;1300:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1302
;1301:	
;1302:	bolt->methodOfDeath = MOD_BFG;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 12
ASGNI4
line 1303
;1303:	bolt->splashMethodOfDeath = MOD_BFG_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 13
ASGNI4
line 1304
;1304:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1305
;1305:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1306
;1306:	bolt->s.pos.trType = TR_ORBITAL;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 6
ASGNI4
line 1307
;1307:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1309
;1308:
;1309:	bolt->damage = 500;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 500
ASGNI4
line 1310
;1310:	bolt->splashDamage = 300;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 300
ASGNI4
line 1311
;1311:	bolt->splashRadius = 420;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 420
ASGNI4
line 1312
;1312:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1313
;1313:	VectorScale( dir, 60, bolt->s.pos.trDelta );
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
line 1315
;1314:
;1315:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 1316
;1316:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1318
;1317:
;1318:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $303
endproc fire_devparticle 36 4
export fire_bfg
proc fire_bfg 32 4
line 1329
;1319:
;1320:
;1321:}
;1322:
;1323:
;1324:/*
;1325:=================
;1326:fire_bfg
;1327:=================
;1328:*/
;1329:gentity_t *fire_bfg (gentity_t *self, vec3_t start, vec3_t dir, qboolean alt) {
line 1332
;1330:	gentity_t	*bolt;
;1331:	//int			speed;
;1332:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1334
;1333:
;1334:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1335
;1335:	bolt->classname = "bfg";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $304
ASGNP4
line 1336
;1336:	bolt->s.time2 = 0;
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 1338
;1337:
;1338:	if (alt == qtrue)
ADDRFP4 12
INDIRI4
CNSTI4 1
NEI4 $311
line 1339
;1339:	{
line 1340
;1340:		bolt->nextthink = level.time + 3000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 1341
;1341:	} else {
ADDRGP4 $312
JUMPV
LABELV $311
line 1342
;1342:		bolt->nextthink = level.time + 2000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 1343
;1343:	}
LABELV $312
line 1346
;1344:
;1345:	
;1346:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1347
;1347:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1348
;1348:	bolt->s.weapon = WP_BFG;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 9
ASGNI4
line 1349
;1349:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1352
;1350://unlagged - projectile nudge
;1351:	// we'll need this for nudging projectiles later
;1352:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1354
;1353://unlagged - projectile nudge
;1354:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1356
;1355:	
;1356:	bolt->methodOfDeath = MOD_BFG;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 12
ASGNI4
line 1357
;1357:	bolt->splashMethodOfDeath = MOD_BFG_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 13
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
line 1360
;1360:	bolt->s.pos.trType = TR_ORBITAL;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 6
ASGNI4
line 1361
;1361:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
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
;1362:
;1363:	if (alt == qtrue)
ADDRFP4 12
INDIRI4
CNSTI4 1
NEI4 $316
line 1364
;1364:	{
line 1366
;1365:		// Alt Fire
;1366:		bolt->damage = 500;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 500
ASGNI4
line 1367
;1367:		bolt->splashDamage = 300;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 300
ASGNI4
line 1368
;1368:		bolt->splashRadius = 420;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 420
ASGNI4
line 1369
;1369:		bolt->s.eFlags |= EF_ALT_FIRING;
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
line 1370
;1370:		bolt->think = G_ExplodeDevastatorFire;		
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeDevastatorFire
ASGNP4
line 1371
;1371:		VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1372
;1372:		VectorScale( dir, 325, bolt->s.pos.trDelta );
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
line 1375
;1373:		
;1374:	
;1375:	} 
ADDRGP4 $317
JUMPV
LABELV $316
line 1377
;1376:	else
;1377:	{
line 1380
;1378:		// Regular Fire
;1379:
;1380:		bolt->damage = 90;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 90
ASGNI4
line 1381
;1381:		bolt->splashDamage = 200;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 200
ASGNI4
line 1382
;1382:		bolt->splashRadius = 220;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 220
ASGNI4
line 1383
;1383:		bolt->think = G_HomingMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_HomingMissile
ASGNP4
line 1384
;1384:		VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1385
;1385:		VectorScale( dir, 325, bolt->s.pos.trDelta );
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
line 1387
;1386:
;1387:	}
LABELV $317
line 1390
;1388:
;1389:	
;1390:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 1391
;1391:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1393
;1392:
;1393:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $310
endproc fire_bfg 32 4
export fire_rocket
proc fire_rocket 32 4
line 1406
;1394:
;1395:
;1396:}
;1397:
;1398://=============================================================================
;1399:
;1400:
;1401:/*
;1402:=================
;1403:fire_rocket
;1404:=================
;1405:*/
;1406:gentity_t *fire_rocket (gentity_t *self, vec3_t start, vec3_t dir) {
line 1409
;1407:	gentity_t	*bolt;
;1408:
;1409:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1411
;1410:
;1411:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1412
;1412:	bolt->classname = "rocket";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $319
ASGNP4
line 1413
;1413:	bolt->nextthink = level.time + 15000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 15000
ADDI4
ASGNI4
line 1414
;1414:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 1415
;1415:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1416
;1416:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1417
;1417:	bolt->s.weapon = WP_ROCKET_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 8
ASGNI4
line 1418
;1418:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1421
;1419://unlagged - projectile nudge
;1420:	// we'll need this for nudging projectiles later
;1421:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1423
;1422://unlagged - projectile nudge
;1423:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1424
;1424:	bolt->damage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 100
ASGNI4
line 1425
;1425:	bolt->splashDamage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 100
ASGNI4
line 1426
;1426:	bolt->splashRadius = 120;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 120
ASGNI4
line 1427
;1427:	bolt->methodOfDeath = MOD_ROCKET;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 10
ASGNI4
line 1428
;1428:	bolt->splashMethodOfDeath = MOD_ROCKET_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 11
ASGNI4
line 1429
;1429:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1430
;1430:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1432
;1431:
;1432:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 1433
;1433:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1434
;1434:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1435
;1435:	VectorScale( dir, 900, bolt->s.pos.trDelta );
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
line 1436
;1436:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 1437
;1437:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1439
;1438:
;1439:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $318
endproc fire_rocket 32 4
export fire_alt_rocket
proc fire_alt_rocket 48 4
line 1448
;1440:}
;1441:
;1442:
;1443:/*
;1444:=================
;1445:fire_alt_rocket
;1446:=================
;1447:*/
;1448:gentity_t *fire_alt_rocket (gentity_t *self, vec3_t start, vec3_t dir) {
line 1451
;1449:	gentity_t	*bolt;
;1450:
;1451:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1453
;1452:
;1453:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1454
;1454:	bolt->classname = "rocket";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $319
ASGNP4
line 1455
;1455:	bolt->think = G_HomingMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_HomingMissile
ASGNP4
line 1456
;1456:	bolt->nextthink = level.time + FIRST_HOMING_THINK;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 1457
;1457:	bolt->lastthinktime = level.time + 15000;
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 15000
ADDI4
ASGNI4
line 1458
;1458:	bolt->lastthink = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 1459
;1459:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1460
;1460:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1461
;1461:	bolt->s.weapon = WP_ROCKET_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 8
ASGNI4
line 1462
;1462:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1465
;1463:	//unlagged - projectile nudge
;1464:	// we'll need this for nudging projectiles later
;1465:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1467
;1466:	//unlagged - projectile nudge
;1467:	bolt->s.eFlags |= EF_ALT_FIRING;
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
line 1468
;1468:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1469
;1469:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1470
;1470:	bolt->damage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 100
ASGNI4
line 1471
;1471:	bolt->splashDamage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 100
ASGNI4
line 1472
;1472:	bolt->splashRadius = 120;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 120
ASGNI4
line 1473
;1473:	bolt->methodOfDeath = MOD_ROCKET;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 10
ASGNI4
line 1474
;1474:	bolt->splashMethodOfDeath = MOD_ROCKET_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 11
ASGNI4
line 1475
;1475:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1476
;1476:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1477
;1477:	bolt->s.otherEntityNum2 = ENTITYNUM_WORLD;
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1022
ASGNI4
line 1481
;1478:
;1479:
;1480:
;1481:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 1482
;1482:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1483
;1483:	bolt->constantSpeed = HOMING_MISSILE_SPEED;
ADDRLP4 0
INDIRP4
CNSTI4 892
ADDP4
CNSTI4 800
ASGNI4
line 1484
;1484:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1485
;1485:	VectorScale( dir, bolt->constantSpeed, bolt->s.pos.trDelta );
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
line 1486
;1486:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 1487
;1487:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1488
;1488:	VectorCopy (dir, bolt->r.currentAngles);		// this is new line.
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 1490
;1489:
;1490:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $322
endproc fire_alt_rocket 48 4
export fire_mg
proc fire_mg 32 4
line 1500
;1491:}
;1492:
;1493:
;1494:/*
;1495:=================
;1496:fire_mg
;1497:
;1498:=================
;1499:*/
;1500:gentity_t *fire_mg (gentity_t *self, vec3_t start, vec3_t dir, qboolean alt) {
line 1503
;1501:	gentity_t	*bolt;
;1502:
;1503:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1505
;1504:
;1505:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1506
;1506:	bolt->classname = "machinegun";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $327
ASGNP4
line 1507
;1507:	bolt->nextthink = level.time + 10000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 1508
;1508:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 1509
;1509:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1510
;1510:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1511
;1511:	bolt->s.weapon = WP_MACHINEGUN;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 2
ASGNI4
line 1512
;1512:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1515
;1513:	//unlagged - projectile nudge
;1514:	// we'll need this for nudging projectiles later
;1515:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1517
;1516:	//unlagged - projectile nudge
;1517:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1519
;1518:	
;1519:	if (alt == qtrue)
ADDRFP4 12
INDIRI4
CNSTI4 1
NEI4 $329
line 1520
;1520:	{
line 1521
;1521:		bolt->damage = 20;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 20
ASGNI4
line 1522
;1522:		bolt->splashDamage = 10;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 10
ASGNI4
line 1523
;1523:		bolt->splashRadius = 10;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 10
ASGNI4
line 1525
;1524:		//bolt->s.time2 = 555; // 555 is alt fire?
;1525:		bolt->s.eFlags |= EF_ALT_FIRING;
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
line 1527
;1526:
;1527:	} 
ADDRGP4 $330
JUMPV
LABELV $329
line 1529
;1528:	else
;1529:	{
line 1530
;1530:		bolt->damage = 10;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 10
ASGNI4
line 1531
;1531:		bolt->splashDamage = 5;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 5
ASGNI4
line 1532
;1532:		bolt->splashRadius = 5;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 5
ASGNI4
line 1533
;1533:	}
LABELV $330
line 1534
;1534:	bolt->methodOfDeath = MOD_MACHINEGUN;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 3
ASGNI4
line 1535
;1535:	bolt->splashMethodOfDeath = MOD_MACHINEGUN;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 3
ASGNI4
line 1536
;1536:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1537
;1537:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1539
;1538:
;1539:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 1540
;1540:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1541
;1541:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1542
;1542:   	VectorScale( dir, 2000, bolt->s.pos.trDelta );
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
line 1543
;1543:   	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 1545
;1544:   
;1545:   	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1547
;1546:   
;1547:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $326
endproc fire_mg 32 4
export fire_turret
proc fire_turret 32 4
line 1556
;1548:}
;1549:
;1550:/*
;1551:=================
;1552:fire_turret
;1553:
;1554:=================
;1555:*/
;1556:gentity_t *fire_turret (gentity_t *self, vec3_t start, vec3_t dir, qboolean alt) {
line 1559
;1557:	gentity_t	*bolt;
;1558:
;1559:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1561
;1560:
;1561:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1562
;1562:	bolt->classname = "plasma";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $208
ASGNP4
line 1563
;1563:	bolt->nextthink = level.time + 10000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 1564
;1564:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 1565
;1565:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1566
;1566:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1567
;1567:	bolt->s.weapon = WP_MACHINEGUN;  // Shafe FIXME: Maybe this should be WP_TURRET?
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 2
ASGNI4
line 1568
;1568:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1571
;1569:	//unlagged - projectile nudge
;1570:	// we'll need this for nudging projectiles later
;1571:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1573
;1572:	//unlagged - projectile nudge
;1573:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1576
;1574:	
;1575:	
;1576:	if (alt == qtrue)
ADDRFP4 12
INDIRI4
CNSTI4 1
NEI4 $334
line 1577
;1577:	{
line 1578
;1578:		bolt->damage = 20;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 20
ASGNI4
line 1579
;1579:		bolt->splashDamage = 10;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 10
ASGNI4
line 1580
;1580:		bolt->splashRadius = 10;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 10
ASGNI4
line 1581
;1581:		bolt->s.eFlags |= EF_ALT_FIRING;
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
line 1583
;1582:
;1583:	} 
ADDRGP4 $335
JUMPV
LABELV $334
line 1585
;1584:	else
;1585:	{
line 1586
;1586:		bolt->damage = 10;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 10
ASGNI4
line 1587
;1587:		bolt->splashDamage = 5;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 5
ASGNI4
line 1588
;1588:		bolt->splashRadius = 5;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 5
ASGNI4
line 1589
;1589:	}
LABELV $335
line 1590
;1590:	bolt->methodOfDeath = MOD_TURRET;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 24
ASGNI4
line 1591
;1591:	bolt->splashMethodOfDeath = MOD_TURRET;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 24
ASGNI4
line 1592
;1592:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1593
;1593:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1595
;1594:
;1595:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 1596
;1596:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1597
;1597:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1598
;1598:   	VectorScale( dir, 2000, bolt->s.pos.trDelta );
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
line 1599
;1599:   	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 1601
;1600:   
;1601:   	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1603
;1602:   
;1603:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $332
endproc fire_turret 32 4
export fire_grapple
proc fire_grapple 36 4
line 1611
;1604:}
;1605:
;1606:/*
;1607:=================
;1608:fire_grapple
;1609:=================
;1610:*/
;1611:gentity_t *fire_grapple (gentity_t *self, vec3_t start, vec3_t dir) {
line 1617
;1612:	gentity_t	*hook;
;1613://unlagged - grapple
;1614:	int hooktime;
;1615://unlagged - grapple
;1616:
;1617:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1619
;1618:
;1619:	hook = G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1620
;1620:	hook->classname = "hook";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $222
ASGNP4
line 1621
;1621:	hook->nextthink = level.time + 10000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 1622
;1622:	hook->think = Weapon_HookFree;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 Weapon_HookFree
ASGNP4
line 1623
;1623:	hook->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1624
;1624:	hook->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1625
;1625:	hook->s.weapon = WP_GRAPPLING_HOOK;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 10
ASGNI4
line 1626
;1626:	hook->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1627
;1627:	hook->methodOfDeath = MOD_GRAPPLE;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 25
ASGNI4
line 1628
;1628:	hook->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1629
;1629:	hook->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1630
;1630:	hook->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1632
;1631:	
;1632:	if (g_GrappleMode.integer == 1) // 0 - Normal, 1 - Instagib, 2 - Holds People
ADDRGP4 g_GrappleMode+12
INDIRI4
CNSTI4 1
NEI4 $339
line 1633
;1633:	{
line 1634
;1634:		hook->damage = 999;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 999
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
line 1637
;1637:	}
LABELV $339
line 1639
;1638:
;1639:	if (g_GrappleMode.integer == 2) // 0 - Normal, 1 - Instagib, 2 - Holds People
ADDRGP4 g_GrappleMode+12
INDIRI4
CNSTI4 2
NEI4 $342
line 1640
;1640:	{
line 1641
;1641:		hook->damage = 0.01;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 0
ASGNI4
line 1642
;1642:		hook->splashDamage = 1;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 1
ASGNI4
line 1643
;1643:		hook->splashRadius = 1;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 1
ASGNI4
line 1644
;1644:	}
LABELV $342
line 1648
;1645:
;1646://unlagged - grapple
;1647:	// we might want this later
;1648:	hook->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1653
;1649:
;1650:	// setting the projectile base time back makes the hook's first
;1651:	// step larger
;1652:
;1653:	if ( self->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $345
line 1654
;1654:		hooktime = self->client->pers.cmd.serverTime + 50;
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
line 1655
;1655:	}
ADDRGP4 $346
JUMPV
LABELV $345
line 1656
;1656:	else {
line 1657
;1657:		hooktime = level.time - MISSILE_PRESTEP_TIME;
ADDRLP4 4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1658
;1658:	}
LABELV $346
line 1660
;1659:
;1660:	hook->s.pos.trTime = hooktime;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1663
;1661://unlagged - grapple
;1662:
;1663:	hook->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 1667
;1664://unlagged - grapple
;1665:	//hook->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
;1666://unlagged - grapple
;1667:	hook->s.otherEntityNum = self->s.number; // use to match beam in client
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1668
;1668:	VectorCopy( start, hook->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1669
;1669:	VectorScale( dir, 2900, hook->s.pos.trDelta ); // How fast does it fire.
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1161117696
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1161117696
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
CNSTF4 1161117696
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 1670
;1670:	SnapVector( hook->s.pos.trDelta );			// save net bandwidth
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
line 1671
;1671:	VectorCopy (start, hook->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1673
;1672:
;1673:	self->client->hook = hook;
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
line 1675
;1674:
;1675:	return hook;
ADDRLP4 0
INDIRP4
RETP4
LABELV $337
endproc fire_grapple 36 4
export fire_alt_gata
proc fire_alt_gata 36 4
line 1683
;1676:}
;1677:
;1678:/*
;1679:=================
;1680:fire_alt_gata
;1681:=================
;1682:*/
;1683:gentity_t *fire_alt_gata (gentity_t *self, vec3_t start, vec3_t dir) {
line 1689
;1684:	gentity_t	*hook;
;1685://unlagged - grapple
;1686:	int hooktime;
;1687://unlagged - grapple
;1688:
;1689:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1691
;1690:
;1691:	hook = G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1692
;1692:	hook->classname = "hook";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $222
ASGNP4
line 1693
;1693:	hook->nextthink = level.time + 10000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 1695
;1694:	//hook->think = Weapon_HookFree;
;1695:	hook->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1696
;1696:	hook->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 128
ASGNI4
line 1697
;1697:	hook->s.weapon = WP_PLASMAGUN;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 7
ASGNI4
line 1698
;1698:	hook->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1699
;1699:	hook->methodOfDeath = MOD_PLASMA;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 7
ASGNI4
line 1700
;1700:	hook->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 100664321
ASGNI4
line 1701
;1701:	hook->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1702
;1702:	hook->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTP4 0
ASGNP4
line 1705
;1703:	
;1704:	
;1705:		hook->damage = 20;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 20
ASGNI4
line 1706
;1706:		hook->splashDamage = 50;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 50
ASGNI4
line 1707
;1707:		hook->splashRadius = 10;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 10
ASGNI4
line 1714
;1708:	
;1709:
;1710:	
;1711:
;1712://unlagged - grapple
;1713:	// we might want this later
;1714:	hook->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1719
;1715:
;1716:	// setting the projectile base time back makes the hook's first
;1717:	// step larger
;1718:
;1719:	if ( self->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $350
line 1720
;1720:		hooktime = self->client->pers.cmd.serverTime + 50;
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
line 1721
;1721:	}
ADDRGP4 $351
JUMPV
LABELV $350
line 1722
;1722:	else {
line 1723
;1723:		hooktime = level.time - MISSILE_PRESTEP_TIME;
ADDRLP4 4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1724
;1724:	}
LABELV $351
line 1726
;1725:
;1726:	hook->s.pos.trTime = hooktime;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1729
;1727://unlagged - grapple
;1728:
;1729:	hook->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 1733
;1730://unlagged - grapple
;1731:	//hook->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
;1732://unlagged - grapple
;1733:	hook->s.otherEntityNum = self->s.number; // use to match beam in client
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1734
;1734:	VectorCopy( start, hook->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1735
;1735:	VectorScale( dir, 800, hook->s.pos.trDelta );
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
line 1736
;1736:	SnapVector( hook->s.pos.trDelta );			// save net bandwidth
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
line 1737
;1737:	VectorCopy (start, hook->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1739
;1738:
;1739:	self->client->hook = hook;
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
line 1741
;1740:
;1741:	return hook;
ADDRLP4 0
INDIRP4
RETP4
LABELV $348
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
LABELV $327
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
LABELV $319
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $304
byte 1 98
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $292
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $285
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
LABELV $279
byte 1 98
byte 1 111
byte 1 109
byte 1 98
byte 1 0
align 1
LABELV $265
byte 1 102
byte 1 108
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $222
byte 1 104
byte 1 111
byte 1 111
byte 1 107
byte 1 0
align 1
LABELV $208
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
