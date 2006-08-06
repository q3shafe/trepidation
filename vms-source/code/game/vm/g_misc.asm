export SP_info_camp
code
proc SP_info_camp 4 8
file "../g_misc.c"
line 16
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// g_misc.c
;4:
;5:#include "g_local.h"
;6:
;7:
;8:/*QUAKED func_group (0 0 0) ?
;9:Used to group brushes together just for editor convenience.  They are turned into normal brushes by the utilities.
;10:*/
;11:
;12:
;13:/*QUAKED info_camp (0 0.5 0) (-4 -4 -4) (4 4 4)
;14:Used as a positional target for calculations in the utilities (spotlights, etc), but removed during gameplay.
;15:*/
;16:void SP_info_camp( gentity_t *self ) {
line 17
;17:	G_SetOrigin( self, self->s.origin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 18
;18:}
LABELV $55
endproc SP_info_camp 4 8
export SP_info_null
proc SP_info_null 0 4
line 24
;19:
;20:
;21:/*QUAKED info_null (0 0.5 0) (-4 -4 -4) (4 4 4)
;22:Used as a positional target for calculations in the utilities (spotlights, etc), but removed during gameplay.
;23:*/
;24:void SP_info_null( gentity_t *self ) {
line 25
;25:	G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 26
;26:}
LABELV $56
endproc SP_info_null 0 4
export SP_info_notnull
proc SP_info_notnull 4 8
line 33
;27:
;28:
;29:/*QUAKED info_notnull (0 0.5 0) (-4 -4 -4) (4 4 4)
;30:Used as a positional target for in-game calculation, like jumppad targets.
;31:target_position does the same thing
;32:*/
;33:void SP_info_notnull( gentity_t *self ){
line 34
;34:	G_SetOrigin( self, self->s.origin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 35
;35:}
LABELV $57
endproc SP_info_notnull 4 8
export SP_light
proc SP_light 0 4
line 45
;36:
;37:
;38:/*QUAKED light (0 1 0) (-8 -8 -8) (8 8 8) linear
;39:Non-displayed light.
;40:"light" overrides the default 300 intensity.
;41:Linear checbox gives linear falloff instead of inverse square
;42:Lights pointed at a target will be spotlights.
;43:"radius" overrides the default 64 unit radius of a spotlight at the target point.
;44:*/
;45:void SP_light( gentity_t *self ) {
line 46
;46:	G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 47
;47:}
LABELV $58
endproc SP_light 0 4
export TeleportPlayer
proc TeleportPlayer 40 16
line 59
;48:
;49:
;50:
;51:/*
;52:=================================================================================
;53:
;54:TELEPORTERS
;55:
;56:=================================================================================
;57:*/
;58:
;59:void TeleportPlayer( gentity_t *player, vec3_t origin, vec3_t angles ) {
line 64
;60:	gentity_t	*tent;
;61:
;62:	// use temp events at source and destination to prevent the effect
;63:	// from getting dropped by a second player event
;64:	if ( player->client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 3
EQI4 $60
line 65
;65:		tent = G_TempEntity( player->client->ps.origin, EV_PLAYER_TELEPORT_OUT );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 44
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 66
;66:		tent->s.clientNum = player->s.clientNum;
ADDRLP4 8
CNSTI4 168
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 68
;67:
;68:		tent = G_TempEntity( origin, EV_PLAYER_TELEPORT_IN );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 43
ARGI4
ADDRLP4 12
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 69
;69:		tent->s.clientNum = player->s.clientNum;
ADDRLP4 16
CNSTI4 168
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 70
;70:	}
LABELV $60
line 73
;71:
;72:	// unlink to make sure it can't possibly interfere with G_KillBox
;73:	trap_UnlinkEntity (player);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 75
;74:
;75:	VectorCopy ( origin, player->client->ps.origin );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 76
;76:	player->client->ps.origin[2] += 1;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 79
;77:
;78:	// spit the player out
;79:	AngleVectors( angles, player->client->ps.velocity, NULL, NULL );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 8
CNSTP4 0
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 80
;80:	VectorScale( player->client->ps.velocity, 400, player->client->ps.velocity );
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTF4 1137180672
ADDRLP4 12
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTF4 1137180672
ADDRLP4 16
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTF4 1137180672
ADDRLP4 20
INDIRP4
INDIRF4
MULF4
ASGNF4
line 81
;81:	player->client->ps.pm_time = 160;		// hold time
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 160
ASGNI4
line 82
;82:	player->client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 85
;83:
;84:	// toggle the teleport bit so the client knows to not lerp
;85:	player->client->ps.eFlags ^= EF_TELEPORT_BIT;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 89
;86:
;87://unlagged - backward reconciliation #3
;88:	// we don't want players being backward-reconciled back through teleporters
;89:	G_ResetHistory( player );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_ResetHistory
CALLV
pop
line 93
;90://unlagged - backward reconciliation #3
;91:
;92:	// set angles
;93:	SetClientViewAngle( player, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 96
;94:
;95:	// kill anything at the destination
;96:	if ( player->client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 3
EQI4 $62
line 97
;97:		G_KillBox (player);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_KillBox
CALLV
pop
line 98
;98:	}
LABELV $62
line 101
;99:
;100:	// save results of pmove
;101:	BG_PlayerStateToEntityState( &player->client->ps, &player->s, qtrue );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 104
;102:
;103:	// use the precise origin for linking
;104:	VectorCopy( player->client->ps.origin, player->r.currentOrigin );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 36
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 106
;105:
;106:	if ( player->client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 3
EQI4 $64
line 107
;107:		trap_LinkEntity (player);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 108
;108:	}
LABELV $64
line 109
;109:}
LABELV $59
endproc TeleportPlayer 40 16
export SP_misc_teleporter_dest
proc SP_misc_teleporter_dest 0 0
line 117
;110:
;111:
;112:/*QUAKED misc_teleporter_dest (1 0 0) (-32 -32 -24) (32 32 -16)
;113:Point teleporters at these.
;114:Now that we don't have teleport destination pads, this is just
;115:an info_notnull
;116:*/
;117:void SP_misc_teleporter_dest( gentity_t *ent ) {
line 118
;118:}
LABELV $66
endproc SP_misc_teleporter_dest 0 0
export SP_misc_model
proc SP_misc_model 0 4
line 126
;119:
;120:
;121://===========================================================
;122:
;123:/*QUAKED misc_model (1 0 0) (-16 -16 -16) (16 16 16)
;124:"model"		arbitrary .md3 file to display
;125:*/
;126:void SP_misc_model( gentity_t *ent ) {
line 137
;127:
;128:#if 0
;129:	ent->s.modelindex = G_ModelIndex( ent->model );
;130:	VectorSet (ent->mins, -16, -16, -16);
;131:	VectorSet (ent->maxs, 16, 16, 16);
;132:	trap_LinkEntity (ent);
;133:
;134:	G_SetOrigin( ent, ent->s.origin );
;135:	VectorCopy( ent->s.angles, ent->s.apos.trBase );
;136:#else
;137:	G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 139
;138:#endif
;139:}
LABELV $67
endproc SP_misc_model 0 4
export locateCamera
proc locateCamera 52 8
line 143
;140:
;141://===========================================================
;142:
;143:void locateCamera( gentity_t *ent ) {
line 148
;144:	vec3_t		dir;
;145:	gentity_t	*target;
;146:	gentity_t	*owner;
;147:
;148:	owner = G_PickTarget( ent->target );
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 149
;149:	if ( !owner ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $69
line 150
;150:		G_Printf( "Couldn't find target for misc_partal_surface\n" );
ADDRGP4 $71
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 151
;151:		G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 152
;152:		return;
ADDRGP4 $68
JUMPV
LABELV $69
line 154
;153:	}
;154:	ent->r.ownerNum = owner->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 157
;155:
;156:	// frame holds the rotate speed
;157:	if ( owner->spawnflags & 1 ) {
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $72
line 158
;158:		ent->s.frame = 25;
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
CNSTI4 25
ASGNI4
line 159
;159:	} else if ( owner->spawnflags & 2 ) {
ADDRGP4 $73
JUMPV
LABELV $72
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $74
line 160
;160:		ent->s.frame = 75;
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
CNSTI4 75
ASGNI4
line 161
;161:	}
LABELV $74
LABELV $73
line 164
;162:
;163:	// swing camera ?
;164:	if ( owner->spawnflags & 4 ) {
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $76
line 166
;165:		// set to 0 for no rotation at all
;166:		ent->s.powerups = 0;
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 167
;167:	}
ADDRGP4 $77
JUMPV
LABELV $76
line 168
;168:	else {
line 169
;169:		ent->s.powerups = 1;
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 1
ASGNI4
line 170
;170:	}
LABELV $77
line 173
;171:
;172:	// clientNum holds the rotate offset
;173:	ent->s.clientNum = owner->s.clientNum;
ADDRLP4 24
CNSTI4 168
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 175
;174:
;175:	VectorCopy( owner->s.origin, ent->s.origin2 );
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 178
;176:
;177:	// see if the portal_camera has a target
;178:	target = G_PickTarget( owner->target );
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 28
INDIRP4
ASGNP4
line 179
;179:	if ( target ) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $78
line 180
;180:		VectorSubtract( target->s.origin, owner->s.origin, dir );
ADDRLP4 36
CNSTI4 92
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 44
CNSTI4 96
ASGNI4
ADDRLP4 4+4
ADDRLP4 16
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48
CNSTI4 100
ASGNI4
ADDRLP4 4+8
ADDRLP4 16
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 181
;181:		VectorNormalize( dir );
ADDRLP4 4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 182
;182:	} else {
ADDRGP4 $79
JUMPV
LABELV $78
line 183
;183:		G_SetMovedir( owner->s.angles, dir );
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
line 184
;184:	}
LABELV $79
line 186
;185:
;186:	ent->s.eventParm = DirToByte( dir );
ADDRLP4 4
ARGP4
ADDRLP4 32
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 187
;187:}
LABELV $68
endproc locateCamera 52 8
export SP_misc_portal_surface
proc SP_misc_portal_surface 20 4
line 193
;188:
;189:/*QUAKED misc_portal_surface (0 0 1) (-8 -8 -8) (8 8 8)
;190:The portal surface nearest this entity will show a view from the targeted misc_portal_camera, or a mirror view if untargeted.
;191:This must be within 64 world units of the surface!
;192:*/
;193:void SP_misc_portal_surface(gentity_t *ent) {
line 194
;194:	VectorClear( ent->r.mins );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 440
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 195
;195:	VectorClear( ent->r.maxs );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 456
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 452
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 448
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 196
;196:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 198
;197:
;198:	ent->r.svFlags = SVF_PORTAL;
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 64
ASGNI4
line 199
;199:	ent->s.eType = ET_PORTAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 6
ASGNI4
line 201
;200:
;201:	if ( !ent->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $83
line 202
;202:		VectorCopy( ent->s.origin, ent->s.origin2 );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 203
;203:	} else {
ADDRGP4 $84
JUMPV
LABELV $83
line 204
;204:		ent->think = locateCamera;
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 locateCamera
ASGNP4
line 205
;205:		ent->nextthink = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 206
;206:	}
LABELV $84
line 207
;207:}
LABELV $82
endproc SP_misc_portal_surface 20 4
export SP_misc_portal_camera
proc SP_misc_portal_camera 20 12
line 213
;208:
;209:/*QUAKED misc_portal_camera (0 0 1) (-8 -8 -8) (8 8 8) slowrotate fastrotate noswing
;210:The target for a misc_portal_director.  You can set either angles or target another entity to determine the direction of view.
;211:"roll" an angle modifier to orient the camera around the target vector;
;212:*/
;213:void SP_misc_portal_camera(gentity_t *ent) {
line 216
;214:	float	roll;
;215:
;216:	VectorClear( ent->r.mins );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 444
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 440
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 436
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 217
;217:	VectorClear( ent->r.maxs );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 456
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 452
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 448
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
line 218
;218:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 220
;219:
;220:	G_SpawnFloat( "roll", "0", &roll );
ADDRGP4 $87
ARGP4
ADDRGP4 $88
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 222
;221:
;222:	ent->s.clientNum = roll/360.0 * 256;
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
CNSTF4 1132462080
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
DIVF4
MULF4
CVFI4 4
ASGNI4
line 223
;223:}
LABELV $86
endproc SP_misc_portal_camera 20 12
export Use_Shooter
proc Use_Shooter 76 12
line 233
;224:
;225:/*
;226:======================================================================
;227:
;228:  SHOOTERS
;229:
;230:======================================================================
;231:*/
;232:
;233:void Use_Shooter( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 239
;234:	vec3_t		dir;
;235:	float		deg;
;236:	vec3_t		up, right;
;237:
;238:	// see if we have a target
;239:	if ( ent->enemy ) {
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $90
line 240
;240:		VectorSubtract( ent->enemy->r.currentOrigin, ent->s.origin, dir );
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 776
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 44
INDIRP4
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 44
INDIRP4
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 48
INDIRP4
CNSTI4 776
ADDP4
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 241
;241:		VectorNormalize( dir );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 242
;242:	} else {
ADDRGP4 $91
JUMPV
LABELV $90
line 243
;243:		VectorCopy( ent->movedir, dir );
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRB
ASGNB 12
line 244
;244:	}
LABELV $91
line 247
;245:
;246:	// randomize a bit
;247:	PerpendicularVector( up, dir );
ADDRLP4 16
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 248
;248:	CrossProduct( up, dir, right );
ADDRLP4 16
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 250
;249:
;250:	deg = crandom() * ent->random;
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12
CNSTF4 1073741824
ADDRLP4 40
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRF4
MULF4
ASGNF4
line 251
;251:	VectorMA( dir, deg, up, dir );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 16+4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 16+8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 253
;252:
;253:	deg = crandom() * ent->random;
ADDRLP4 48
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12
CNSTF4 1073741824
ADDRLP4 48
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRF4
MULF4
ASGNF4
line 254
;254:	VectorMA( dir, deg, right, dir );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 28
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 28+4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 28+8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 256
;255:
;256:	VectorNormalize( dir );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 258
;257:
;258:	switch ( ent->s.weapon ) {
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 4
EQI4 $109
ADDRLP4 56
INDIRI4
CNSTI4 5
EQI4 $110
ADDRLP4 56
INDIRI4
CNSTI4 8
EQI4 $111
ADDRGP4 $106
JUMPV
LABELV $109
line 260
;259:	case WP_GRENADE_LAUNCHER:
;260:		fire_grenade( ent, ent->s.origin, dir );
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 fire_grenade
CALLP4
pop
line 261
;261:		break;
ADDRGP4 $107
JUMPV
LABELV $110
line 263
;262:	case WP_ROCKET_LAUNCHER:
;263:		fire_rocket( ent, ent->s.origin, dir );
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 fire_rocket
CALLP4
pop
line 264
;264:		break;
ADDRGP4 $107
JUMPV
LABELV $111
line 266
;265:	case WP_PLASMAGUN:
;266:		fire_plasma( ent, ent->s.origin, dir );
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 fire_plasma
CALLP4
pop
line 267
;267:		break;
LABELV $106
LABELV $107
line 270
;268:	}
;269:
;270:	G_AddEvent( ent, EV_FIRE_WEAPON, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 23
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 271
;271:}
LABELV $89
endproc Use_Shooter 76 12
proc InitShooter_Finish 8 4
line 274
;272:
;273:
;274:static void InitShooter_Finish( gentity_t *ent ) {
line 275
;275:	ent->enemy = G_PickTarget( ent->target );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 276
;276:	ent->think = 0;
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
CNSTP4 0
ASGNP4
line 277
;277:	ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 278
;278:}
LABELV $112
endproc InitShooter_Finish 8 4
export InitShooter
proc InitShooter 16 8
line 280
;279:
;280:void InitShooter( gentity_t *ent, int weapon ) {
line 281
;281:	ent->use = Use_Shooter;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 Use_Shooter
ASGNP4
line 282
;282:	ent->s.weapon = weapon;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 284
;283:
;284:	RegisterItem( BG_FindItemForWeapon( weapon ) );
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 286
;285:
;286:	G_SetMovedir( ent->s.angles, ent->movedir );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
line 288
;287:
;288:	if ( !ent->random ) {
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRF4
CNSTF4 0
NEF4 $114
line 289
;289:		ent->random = 1.0;
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
CNSTF4 1065353216
ASGNF4
line 290
;290:	}
LABELV $114
line 291
;291:	ent->random = sin( M_PI * ent->random / 180 );
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ASGNP4
CNSTF4 1078530011
ADDRLP4 8
INDIRP4
INDIRF4
MULF4
CNSTF4 1127481344
DIVF4
ARGF4
ADDRLP4 12
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
line 293
;292:	// target might be a moving object, so we can't set movedir for it
;293:	if ( ent->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $116
line 294
;294:		ent->think = InitShooter_Finish;
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 InitShooter_Finish
ASGNP4
line 295
;295:		ent->nextthink = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 296
;296:	}
LABELV $116
line 297
;297:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 298
;298:}
LABELV $113
endproc InitShooter 16 8
export SP_shooter_rocket
proc SP_shooter_rocket 0 8
line 304
;299:
;300:/*QUAKED shooter_rocket (1 0 0) (-16 -16 -16) (16 16 16)
;301:Fires at either the target or the current direction.
;302:"random" the number of degrees of deviance from the taget. (1.0 default)
;303:*/
;304:void SP_shooter_rocket( gentity_t *ent ) {
line 305
;305:	InitShooter( ent, WP_ROCKET_LAUNCHER );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 InitShooter
CALLV
pop
line 306
;306:}
LABELV $119
endproc SP_shooter_rocket 0 8
export SP_shooter_plasma
proc SP_shooter_plasma 0 8
line 312
;307:
;308:/*QUAKED shooter_plasma (1 0 0) (-16 -16 -16) (16 16 16)
;309:Fires at either the target or the current direction.
;310:"random" is the number of degrees of deviance from the taget. (1.0 default)
;311:*/
;312:void SP_shooter_plasma( gentity_t *ent ) {
line 313
;313:	InitShooter( ent, WP_PLASMAGUN);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 InitShooter
CALLV
pop
line 314
;314:}
LABELV $120
endproc SP_shooter_plasma 0 8
export SP_shooter_grenade
proc SP_shooter_grenade 0 8
line 320
;315:
;316:/*QUAKED shooter_grenade (1 0 0) (-16 -16 -16) (16 16 16)
;317:Fires at either the target or the current direction.
;318:"random" is the number of degrees of deviance from the taget. (1.0 default)
;319:*/
;320:void SP_shooter_grenade( gentity_t *ent ) {
line 321
;321:	InitShooter( ent, WP_GRENADE_LAUNCHER);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 InitShooter
CALLV
pop
line 322
;322:}
LABELV $121
endproc SP_shooter_grenade 0 8
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
import FireWeapon2
import FireWeapon
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
import Weapon_HookThink
import Weapon_HookFree
import CheckGauntletAttack
import CalcMuzzlePoint
import LogAccuracyHit
import trigger_teleporter_touch
import Touch_DoorTrigger
import G_RunMover
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
LABELV $88
byte 1 48
byte 1 0
align 1
LABELV $87
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $71
byte 1 67
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 112
byte 1 97
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 95
byte 1 115
byte 1 117
byte 1 114
byte 1 102
byte 1 97
byte 1 99
byte 1 101
byte 1 10
byte 1 0
