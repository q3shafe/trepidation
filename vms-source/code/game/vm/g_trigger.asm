export InitTrigger
code
proc InitTrigger 12 8
file "../g_trigger.c"
line 6
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:
;5:
;6:void InitTrigger( gentity_t *self ) {
line 7
;7:	if (!VectorCompare (self->s.angles, vec3_origin))
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 0
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $56
line 8
;8:		G_SetMovedir (self->s.angles, self->movedir);
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
LABELV $56
line 10
;9:
;10:	trap_SetBrushModel( self, self->model );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 11
;11:	self->r.contents = CONTENTS_TRIGGER;		// replaces the -1 from trap_SetBrushModel
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1073741824
ASGNI4
line 12
;12:	self->r.svFlags = SVF_NOCLIENT;
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 1
ASGNI4
line 13
;13:}
LABELV $55
endproc InitTrigger 12 8
export multi_wait
proc multi_wait 0 0
line 17
;14:
;15:
;16:// the wait time has passed, so set back up for another activation
;17:void multi_wait( gentity_t *ent ) {
line 18
;18:	ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 19
;19:}
LABELV $58
endproc multi_wait 0 0
export multi_trigger
proc multi_trigger 12 8
line 25
;20:
;21:
;22:// the trigger was just activated
;23:// ent->activator should be set to the activator so it can be held through a delay
;24:// so wait for the delay time before firing
;25:void multi_trigger( gentity_t *ent, gentity_t *activator ) {
line 26
;26:	ent->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 27
;27:	if ( ent->nextthink ) {
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
EQI4 $60
line 28
;28:		return;		// can't retrigger until the wait is over
ADDRGP4 $59
JUMPV
LABELV $60
line 31
;29:	}
;30:
;31:	if ( activator->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $62
line 32
;32:		if ( ( ent->spawnflags & 1 ) &&
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
BANDI4
CNSTI4 0
EQI4 $64
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $64
line 33
;33:			activator->client->sess.sessionTeam != TEAM_RED ) {
line 34
;34:			return;
ADDRGP4 $59
JUMPV
LABELV $64
line 36
;35:		}
;36:		if ( ( ent->spawnflags & 2 ) &&
ADDRLP4 4
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
BANDI4
CNSTI4 0
EQI4 $66
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $66
line 37
;37:			activator->client->sess.sessionTeam != TEAM_BLUE ) {
line 38
;38:			return;
ADDRGP4 $59
JUMPV
LABELV $66
line 40
;39:		}
;40:	}
LABELV $62
line 42
;41:
;42:	G_UseTargets (ent, ent->activator);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 44
;43:
;44:	if ( ent->wait > 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRF4
CNSTF4 0
LEF4 $68
line 45
;45:		ent->think = multi_wait;
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 multi_wait
ASGNP4
line 46
;46:		ent->nextthink = level.time + ( ent->wait + ent->random * crandom() ) * 1000;
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 8
INDIRP4
CNSTI4 804
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 808
ADDP4
INDIRF4
CNSTF4 1073741824
ADDRLP4 4
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
MULF4
ADDF4
CVFI4 4
ASGNI4
line 47
;47:	} else {
ADDRGP4 $69
JUMPV
LABELV $68
line 50
;48:		// we can't just remove (self) here, because this is a touch function
;49:		// called while looping through area links...
;50:		ent->touch = 0;
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTP4 0
ASGNP4
line 51
;51:		ent->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 52
;52:		ent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 53
;53:	}
LABELV $69
line 54
;54:}
LABELV $59
endproc multi_trigger 12 8
export Use_Multi
proc Use_Multi 0 8
line 56
;55:
;56:void Use_Multi( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 57
;57:	multi_trigger( ent, activator );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 multi_trigger
CALLV
pop
line 58
;58:}
LABELV $72
endproc Use_Multi 0 8
export Touch_Multi
proc Touch_Multi 0 8
line 60
;59:
;60:void Touch_Multi( gentity_t *self, gentity_t *other, trace_t *trace ) {
line 61
;61:	if( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $74
line 62
;62:		return;
ADDRGP4 $73
JUMPV
LABELV $74
line 64
;63:	}
;64:	multi_trigger( self, other );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 multi_trigger
CALLV
pop
line 65
;65:}
LABELV $73
endproc Touch_Multi 0 8
export SP_trigger_multiple
proc SP_trigger_multiple 12 12
line 74
;66:
;67:/*QUAKED trigger_multiple (.5 .5 .5) ?
;68:"wait" : Seconds between triggerings, 0.5 default, -1 = one time only.
;69:"random"	wait variance, default is 0
;70:Variable sized repeatable trigger.  Must be targeted at one or more entities.
;71:so, the basic time between firing is a random time between
;72:(wait - random) and (wait + random)
;73:*/
;74:void SP_trigger_multiple( gentity_t *ent ) {
line 75
;75:	G_SpawnFloat( "wait", "0.5", &ent->wait );
ADDRGP4 $77
ARGP4
ADDRGP4 $78
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 76
;76:	G_SpawnFloat( "random", "0", &ent->random );
ADDRGP4 $79
ARGP4
ADDRGP4 $80
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 78
;77:
;78:	if ( ent->random >= ent->wait && ent->wait >= 0 ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
LTF4 $81
ADDRLP4 4
INDIRF4
CNSTF4 0
LTF4 $81
line 79
;79:		ent->random = ent->wait - FRAMETIME;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 808
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 804
ADDP4
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 80
;80:		G_Printf( "trigger_multiple has random >= wait\n" );
ADDRGP4 $83
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 81
;81:	}
LABELV $81
line 83
;82:
;83:	ent->touch = Touch_Multi;
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ADDRGP4 Touch_Multi
ASGNP4
line 84
;84:	ent->use = Use_Multi;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 Use_Multi
ASGNP4
line 86
;85:
;86:	InitTrigger( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 87
;87:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 88
;88:}
LABELV $76
endproc SP_trigger_multiple 12 12
export trigger_always_think
proc trigger_always_think 4 8
line 100
;89:
;90:
;91:
;92:/*
;93:==============================================================================
;94:
;95:trigger_always
;96:
;97:==============================================================================
;98:*/
;99:
;100:void trigger_always_think( gentity_t *ent ) {
line 101
;101:	G_UseTargets(ent, ent);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 102
;102:	G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 103
;103:}
LABELV $84
endproc trigger_always_think 4 8
export SP_trigger_always
proc SP_trigger_always 0 0
line 108
;104:
;105:/*QUAKED trigger_always (.5 .5 .5) (-8 -8 -8) (8 8 8)
;106:This trigger will always fire.  It is activated by the world.
;107:*/
;108:void SP_trigger_always (gentity_t *ent) {
line 110
;109:	// we must have some delay to make sure our use targets are present
;110:	ent->nextthink = level.time + 300;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 111
;111:	ent->think = trigger_always_think;
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 trigger_always_think
ASGNP4
line 112
;112:}
LABELV $85
endproc SP_trigger_always 0 0
export trigger_push_touch
proc trigger_push_touch 0 8
line 123
;113:
;114:
;115:/*
;116:==============================================================================
;117:
;118:trigger_push
;119:
;120:==============================================================================
;121:*/
;122:
;123:void trigger_push_touch (gentity_t *self, gentity_t *other, trace_t *trace ) {
line 125
;124:
;125:	if ( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $88
line 126
;126:		return;
ADDRGP4 $87
JUMPV
LABELV $88
line 129
;127:	}
;128:
;129:	BG_TouchJumpPad( &other->client->ps, &self->s );
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BG_TouchJumpPad
CALLV
pop
line 130
;130:}
LABELV $87
endproc trigger_push_touch 0 8
export AimAtTarget
proc AimAtTarget 72 4
line 140
;131:
;132:
;133:/*
;134:=================
;135:AimAtTarget
;136:
;137:Calculate origin2 so the target apogee will be hit
;138:=================
;139:*/
;140:void AimAtTarget( gentity_t *self ) {
line 146
;141:	gentity_t	*ent;
;142:	vec3_t		origin;
;143:	float		height, gravity, time, forward;
;144:	float		dist;
;145:
;146:	VectorAdd( self->r.absmin, self->r.absmax, origin );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
CNSTI4 464
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 36
INDIRP4
CNSTI4 468
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 40
INDIRP4
CNSTI4 472
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 484
ADDP4
INDIRF4
ADDF4
ASGNF4
line 147
;147:	VectorScale ( origin, 0.5, origin );
ADDRLP4 44
CNSTF4 1056964608
ASGNF4
ADDRLP4 0
ADDRLP4 44
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 44
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1056964608
ADDRLP4 0+8
INDIRF4
MULF4
ASGNF4
line 149
;148:
;149:	ent = G_PickTarget( self->target );
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 48
INDIRP4
ASGNP4
line 150
;150:	if ( !ent ) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $97
line 151
;151:		G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 152
;152:		return;
ADDRGP4 $90
JUMPV
LABELV $97
line 155
;153:	}
;154:
;155:	height = ent->s.origin[2] - origin[2];
ADDRLP4 28
ADDRLP4 12
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 156
;156:	gravity = g_gravity.value;
ADDRLP4 24
ADDRGP4 g_gravity+8
INDIRF4
ASGNF4
line 157
;157:	time = sqrt( height / ( .5 * gravity ) );
ADDRLP4 28
INDIRF4
CNSTF4 1056964608
ADDRLP4 24
INDIRF4
MULF4
DIVF4
ARGF4
ADDRLP4 52
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 52
INDIRF4
ASGNF4
line 158
;158:	if ( !time ) {
ADDRLP4 16
INDIRF4
CNSTF4 0
NEF4 $101
line 159
;159:		G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 160
;160:		return;
ADDRGP4 $90
JUMPV
LABELV $101
line 164
;161:	}
;162:
;163:	// set s.origin2 to the push velocity
;164:	VectorSubtract ( ent->s.origin, origin, self->s.origin2 );
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 165
;165:	self->s.origin2[2] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
CNSTF4 0
ASGNF4
line 166
;166:	dist = VectorNormalize( self->s.origin2);
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 56
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 32
ADDRLP4 56
INDIRF4
ASGNF4
line 168
;167:
;168:	forward = dist / time;
ADDRLP4 20
ADDRLP4 32
INDIRF4
ADDRLP4 16
INDIRF4
DIVF4
ASGNF4
line 169
;169:	VectorScale( self->s.origin2, forward, self->s.origin2 );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
line 171
;170:
;171:	self->s.origin2[2] = time * gravity;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 16
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 172
;172:}
LABELV $90
endproc AimAtTarget 72 4
export SP_trigger_push
proc SP_trigger_push 4 4
line 179
;173:
;174:
;175:/*QUAKED trigger_push (.5 .5 .5) ?
;176:Must point at a target_position, which will be the apex of the leap.
;177:This will be client side predicted, unlike target_push
;178:*/
;179:void SP_trigger_push( gentity_t *self ) {
line 180
;180:	InitTrigger (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 183
;181:
;182:	// unlike other triggers, we need to send this one to the client
;183:	self->r.svFlags &= ~SVF_NOCLIENT;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 186
;184:
;185:	// make sure the client precaches this sound
;186:	G_SoundIndex("sound/world/jumppad.wav");
ADDRGP4 $106
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 188
;187:
;188:	self->s.eType = ET_PUSH_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 8
ASGNI4
line 189
;189:	self->touch = trigger_push_touch;
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ADDRGP4 trigger_push_touch
ASGNP4
line 190
;190:	self->think = AimAtTarget;
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 AimAtTarget
ASGNP4
line 191
;191:	self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 192
;192:	trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 193
;193:}
LABELV $105
endproc SP_trigger_push 4 4
export Use_target_push
proc Use_target_push 0 12
line 196
;194:
;195:
;196:void Use_target_push( gentity_t *self, gentity_t *other, gentity_t *activator ) {
line 197
;197:	if ( !activator->client ) {
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $109
line 198
;198:		return;
ADDRGP4 $108
JUMPV
LABELV $109
line 201
;199:	}
;200:
;201:	if ( activator->client->ps.pm_type != PM_NORMAL ) {
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $111
line 202
;202:		return;
ADDRGP4 $108
JUMPV
LABELV $111
line 204
;203:	}
;204:	if ( activator->client->ps.powerups[PW_FLIGHT] ) {
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $113
line 205
;205:		return;
ADDRGP4 $108
JUMPV
LABELV $113
line 208
;206:	}
;207:
;208:	VectorCopy (self->s.origin2, activator->client->ps.velocity);
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 211
;209:
;210:	// play fly sound every 1.5 seconds
;211:	if ( activator->fly_sound_debounce_time < level.time ) {
ADDRFP4 8
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $115
line 212
;212:		activator->fly_sound_debounce_time = level.time + 1500;
ADDRFP4 8
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 213
;213:		G_Sound( activator, CHAN_AUTO, self->noise_index );
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 214
;214:	}
LABELV $115
line 215
;215:}
LABELV $108
endproc Use_target_push 0 12
export SP_target_push
proc SP_target_push 36 8
line 222
;216:
;217:/*QUAKED target_push (.5 .5 .5) (-8 -8 -8) (8 8 8) bouncepad
;218:Pushes the activator in the direction.of angle, or towards a target apex.
;219:"speed"		defaults to 1000
;220:if "bouncepad", play bounce noise instead of windfly
;221:*/
;222:void SP_target_push( gentity_t *self ) {
line 223
;223:	if (!self->speed) {
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
CNSTF4 0
NEF4 $120
line 224
;224:		self->speed = 1000;
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
CNSTF4 1148846080
ASGNF4
line 225
;225:	}
LABELV $120
line 226
;226:	G_SetMovedir (self->s.angles, self->s.origin2);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
line 227
;227:	VectorScale (self->s.origin2, self->speed, self->s.origin2);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
MULF4
ASGNF4
line 229
;228:
;229:	if ( self->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $122
line 230
;230:		self->noise_index = G_SoundIndex("sound/world/jumppad.wav");
ADDRGP4 $106
ARGP4
ADDRLP4 28
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 231
;231:	} else {
ADDRGP4 $123
JUMPV
LABELV $122
line 232
;232:		self->noise_index = G_SoundIndex("sound/misc/windfly.wav");
ADDRGP4 $124
ARGP4
ADDRLP4 28
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 233
;233:	}
LABELV $123
line 234
;234:	if ( self->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $125
line 235
;235:		VectorCopy( self->s.origin, self->r.absmin );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 464
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 236
;236:		VectorCopy( self->s.origin, self->r.absmax );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 476
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 237
;237:		self->think = AimAtTarget;
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 AimAtTarget
ASGNP4
line 238
;238:		self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 239
;239:	}
LABELV $125
line 240
;240:	self->use = Use_target_push;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 Use_target_push
ASGNP4
line 241
;241:}
LABELV $119
endproc SP_target_push 36 8
export trigger_teleporter_touch
proc trigger_teleporter_touch 12 12
line 251
;242:
;243:/*
;244:==============================================================================
;245:
;246:trigger_teleport
;247:
;248:==============================================================================
;249:*/
;250:
;251:void trigger_teleporter_touch (gentity_t *self, gentity_t *other, trace_t *trace ) {
line 254
;252:	gentity_t	*dest;
;253:
;254:	if ( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $129
line 255
;255:		return;
ADDRGP4 $128
JUMPV
LABELV $129
line 257
;256:	}
;257:	if ( other->client->ps.pm_type == PM_DEAD ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $131
line 258
;258:		return;
ADDRGP4 $128
JUMPV
LABELV $131
line 261
;259:	}
;260:	// Spectators only?
;261:	if ( ( self->spawnflags & 1 ) && 
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $133
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 3
EQI4 $133
line 262
;262:		other->client->sess.sessionTeam != TEAM_SPECTATOR ) {
line 263
;263:		return;
ADDRGP4 $128
JUMPV
LABELV $133
line 267
;264:	}
;265:
;266:
;267:	dest = 	G_PickTarget( self->target );
ADDRFP4 0
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
ADDRLP4 4
INDIRP4
ASGNP4
line 268
;268:	if (!dest) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $135
line 269
;269:		G_Printf ("Couldn't find teleporter destination\n");
ADDRGP4 $137
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 270
;270:		return;
ADDRGP4 $128
JUMPV
LABELV $135
line 273
;271:	}
;272:
;273:	TeleportPlayer( other, dest->s.origin, dest->s.angles );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 274
;274:}
LABELV $128
endproc trigger_teleporter_touch 12 12
export SP_trigger_teleport
proc SP_trigger_teleport 4 4
line 285
;275:
;276:
;277:/*QUAKED trigger_teleport (.5 .5 .5) ? SPECTATOR
;278:Allows client side prediction of teleportation events.
;279:Must point at a target_position, which will be the teleport destination.
;280:
;281:If spectator is set, only spectators can use this teleport
;282:Spectator teleporters are not normally placed in the editor, but are created
;283:automatically near doors to allow spectators to move through them
;284:*/
;285:void SP_trigger_teleport( gentity_t *self ) {
line 286
;286:	InitTrigger (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 290
;287:
;288:	// unlike other triggers, we need to send this one to the client
;289:	// unless is a spectator trigger
;290:	if ( self->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $139
line 291
;291:		self->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 292
;292:	} else {
ADDRGP4 $140
JUMPV
LABELV $139
line 293
;293:		self->r.svFlags &= ~SVF_NOCLIENT;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 294
;294:	}
LABELV $140
line 297
;295:
;296:	// make sure the client precaches this sound
;297:	G_SoundIndex("sound/world/jumppad.wav");
ADDRGP4 $106
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 299
;298:
;299:	self->s.eType = ET_TELEPORT_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 9
ASGNI4
line 300
;300:	self->touch = trigger_teleporter_touch;
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ADDRGP4 trigger_teleporter_touch
ASGNP4
line 302
;301:
;302:	trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 303
;303:}
LABELV $138
endproc SP_trigger_teleport 4 4
export hurt_use
proc hurt_use 0 4
line 326
;304:
;305:
;306:/*
;307:==============================================================================
;308:
;309:trigger_hurt
;310:
;311:==============================================================================
;312:*/
;313:
;314:/*QUAKED trigger_hurt (.5 .5 .5) ? START_OFF - SILENT NO_PROTECTION SLOW
;315:Any entity that touches this will be hurt.
;316:It does dmg points of damage each server frame
;317:Targeting the trigger will toggle its on / off state.
;318:
;319:SILENT			supresses playing the sound
;320:SLOW			changes the damage rate to once per second
;321:NO_PROTECTION	*nothing* stops the damage
;322:
;323:"dmg"			default 5 (whole numbers only)
;324:
;325:*/
;326:void hurt_use( gentity_t *self, gentity_t *other, gentity_t *activator ) {
line 327
;327:	if ( self->r.linked ) {
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
EQI4 $142
line 328
;328:		trap_UnlinkEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 329
;329:	} else {
ADDRGP4 $143
JUMPV
LABELV $142
line 330
;330:		trap_LinkEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 331
;331:	}
LABELV $143
line 332
;332:}
LABELV $141
endproc hurt_use 0 4
export hurt_touch
proc hurt_touch 12 32
line 334
;333:
;334:void hurt_touch( gentity_t *self, gentity_t *other, trace_t *trace ) {
line 337
;335:	int		dflags;
;336:
;337:	if ( !other->takedamage ) {
ADDRFP4 4
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
NEI4 $145
line 338
;338:		return;
ADDRGP4 $144
JUMPV
LABELV $145
line 341
;339:	}
;340:
;341:	if ( self->timestamp > level.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $147
line 342
;342:		return;
ADDRGP4 $144
JUMPV
LABELV $147
line 345
;343:	}
;344:
;345:	if ( self->spawnflags & 16 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $150
line 346
;346:		self->timestamp = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 347
;347:	} else {
ADDRGP4 $151
JUMPV
LABELV $150
line 348
;348:		self->timestamp = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 349
;349:	}
LABELV $151
line 352
;350:
;351:	// play sound
;352:	if ( !(self->spawnflags & 4) ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $154
line 353
;353:		G_Sound( other, CHAN_AUTO, self->noise_index );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 354
;354:	}
LABELV $154
line 356
;355:
;356:	if (self->spawnflags & 8)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $156
line 357
;357:		dflags = DAMAGE_NO_PROTECTION;
ADDRLP4 0
CNSTI4 8
ASGNI4
ADDRGP4 $157
JUMPV
LABELV $156
line 359
;358:	else
;359:		dflags = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $157
line 360
;360:	G_Damage (other, self, self, NULL, NULL, self->damage, dflags, MOD_TRIGGER_HURT);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
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
ADDRLP4 4
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 22
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 361
;361:}
LABELV $144
endproc hurt_touch 12 32
export SP_trigger_hurt
proc SP_trigger_hurt 4 4
line 363
;362:
;363:void SP_trigger_hurt( gentity_t *self ) {
line 364
;364:	InitTrigger (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 366
;365:
;366:	self->noise_index = G_SoundIndex( "sound/world/electro.wav" );
ADDRGP4 $159
ARGP4
ADDRLP4 0
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 367
;367:	self->touch = hurt_touch;
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ADDRGP4 hurt_touch
ASGNP4
line 369
;368:
;369:	if ( !self->damage ) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 0
NEI4 $160
line 370
;370:		self->damage = 5;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 5
ASGNI4
line 371
;371:	}
LABELV $160
line 373
;372:
;373:	self->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1073741824
ASGNI4
line 375
;374:
;375:	if ( self->spawnflags & 2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $162
line 376
;376:		self->use = hurt_use;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 hurt_use
ASGNP4
line 377
;377:	}
LABELV $162
line 380
;378:
;379:	// link in to the world if starting active
;380:	if ( ! (self->spawnflags & 1) ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $164
line 381
;381:		trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 382
;382:	}
LABELV $164
line 383
;383:}
LABELV $158
endproc SP_trigger_hurt 4 4
export func_timer_think
proc func_timer_think 12 8
line 406
;384:
;385:
;386:/*
;387:==============================================================================
;388:
;389:timer
;390:
;391:==============================================================================
;392:*/
;393:
;394:
;395:/*QUAKED func_timer (0.3 0.1 0.6) (-8 -8 -8) (8 8 8) START_ON
;396:This should be renamed trigger_timer...
;397:Repeatedly fires its targets.
;398:Can be turned on or off by using.
;399:
;400:"wait"			base time between triggering all targets, default is 1
;401:"random"		wait variance, default is 0
;402:so, the basic time between firing is a random time between
;403:(wait - random) and (wait + random)
;404:
;405:*/
;406:void func_timer_think( gentity_t *self ) {
line 407
;407:	G_UseTargets (self, self->activator);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 409
;408:	// set time before next firing
;409:	self->nextthink = level.time + 1000 * ( self->wait + crandom() * self->random );
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 8
INDIRP4
CNSTI4 804
ADDP4
INDIRF4
CNSTF4 1073741824
ADDRLP4 4
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
ADDF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 410
;410:}
LABELV $166
endproc func_timer_think 12 8
export func_timer_use
proc func_timer_use 0 4
line 412
;411:
;412:void func_timer_use( gentity_t *self, gentity_t *other, gentity_t *activator ) {
line 413
;413:	self->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 416
;414:
;415:	// if on, turn it off
;416:	if ( self->nextthink ) {
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
EQI4 $169
line 417
;417:		self->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 418
;418:		return;
ADDRGP4 $168
JUMPV
LABELV $169
line 422
;419:	}
;420:
;421:	// turn it on
;422:	func_timer_think (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 func_timer_think
CALLV
pop
line 423
;423:}
LABELV $168
endproc func_timer_use 0 4
export SP_func_timer
proc SP_func_timer 12 12
line 425
;424:
;425:void SP_func_timer( gentity_t *self ) {
line 426
;426:	G_SpawnFloat( "random", "1", &self->random);
ADDRGP4 $79
ARGP4
ADDRGP4 $172
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 427
;427:	G_SpawnFloat( "wait", "1", &self->wait );
ADDRGP4 $77
ARGP4
ADDRGP4 $172
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 429
;428:
;429:	self->use = func_timer_use;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 func_timer_use
ASGNP4
line 430
;430:	self->think = func_timer_think;
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 func_timer_think
ASGNP4
line 432
;431:
;432:	if ( self->random >= self->wait ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRF4
LTF4 $173
line 433
;433:		self->random = self->wait - FRAMETIME;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 808
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 804
ADDP4
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 434
;434:		G_Printf( "func_timer at %s has random >= wait\n", vtos( self->s.origin ) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $175
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 435
;435:	}
LABELV $173
line 437
;436:
;437:	if ( self->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $176
line 438
;438:		self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 439
;439:		self->activator = self;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 780
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 440
;440:	}
LABELV $176
line 442
;441:
;442:	self->r.svFlags = SVF_NOCLIENT;
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 1
ASGNI4
line 443
;443:}
LABELV $171
endproc SP_func_timer 12 12
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
import g_MultiJumps
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
LABELV $175
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 32
byte 1 62
byte 1 61
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $172
byte 1 49
byte 1 0
align 1
LABELV $159
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 47
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 114
byte 1 111
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $137
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
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $124
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 119
byte 1 105
byte 1 110
byte 1 100
byte 1 102
byte 1 108
byte 1 121
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $106
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 47
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 112
byte 1 97
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $83
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 109
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 112
byte 1 108
byte 1 101
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 32
byte 1 62
byte 1 61
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $80
byte 1 48
byte 1 0
align 1
LABELV $79
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $78
byte 1 48
byte 1 46
byte 1 53
byte 1 0
align 1
LABELV $77
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
