export Use_Target_Give
code
proc Use_Target_Give 64 12
file "../g_target.c"
line 10
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:
;5://==========================================================
;6:
;7:/*QUAKED target_give (1 0 0) (-8 -8 -8) (8 8 8)
;8:Gives the activator all the items pointed to.
;9:*/
;10:void Use_Target_Give( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 14
;11:	gentity_t	*t;
;12:	trace_t		trace;
;13:
;14:	if ( !activator->client ) {
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $56
line 15
;15:		return;
ADDRGP4 $55
JUMPV
LABELV $56
line 18
;16:	}
;17:
;18:	if ( !ent->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $58
line 19
;19:		return;
ADDRGP4 $55
JUMPV
LABELV $58
line 22
;20:	}
;21:
;22:	memset( &trace, 0, sizeof( trace ) );
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 memset
CALLP4
pop
line 23
;23:	t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $61
JUMPV
LABELV $60
line 24
;24:	while ( (t = G_Find (t, FOFS(targetname), ent->target)) != NULL ) {
line 25
;25:		if ( !t->item ) {
ADDRLP4 0
INDIRP4
CNSTI4 884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $63
line 26
;26:			continue;
ADDRGP4 $61
JUMPV
LABELV $63
line 28
;27:		}
;28:		Touch_Item( t, activator, &trace );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Touch_Item
CALLV
pop
line 31
;29:
;30:		// make sure it isn't going to respawn or show any events
;31:		t->nextthink = 0;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 0
ASGNI4
line 32
;32:		trap_UnlinkEntity( t );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 33
;33:	}
LABELV $61
line 24
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 660
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 60
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $60
line 34
;34:}
LABELV $55
endproc Use_Target_Give 64 12
export SP_target_give
proc SP_target_give 0 0
line 36
;35:
;36:void SP_target_give( gentity_t *ent ) {
line 37
;37:	ent->use = Use_Target_Give;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 Use_Target_Give
ASGNP4
line 38
;38:}
LABELV $65
endproc SP_target_give 0 0
export Use_target_remove_powerups
proc Use_target_remove_powerups 0 12
line 47
;39:
;40:
;41://==========================================================
;42:
;43:/*QUAKED target_remove_powerups (1 0 0) (-8 -8 -8) (8 8 8)
;44:takes away all the activators powerups.
;45:Used to drop flight powerups into death puts.
;46:*/
;47:void Use_target_remove_powerups( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 48
;48:	if( !activator->client ) {
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $67
line 49
;49:		return;
ADDRGP4 $66
JUMPV
LABELV $67
line 52
;50:	}
;51:
;52:	if( activator->client->ps.powerups[PW_REDFLAG] ) {
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $69
line 53
;53:		Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 54
;54:	} else if( activator->client->ps.powerups[PW_BLUEFLAG] ) {
ADDRGP4 $70
JUMPV
LABELV $69
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $71
line 55
;55:		Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 56
;56:	} else if( activator->client->ps.powerups[PW_NEUTRALFLAG] ) {
ADDRGP4 $72
JUMPV
LABELV $71
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $73
line 57
;57:		Team_ReturnFlag( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 58
;58:	}
LABELV $73
LABELV $72
LABELV $70
line 60
;59:
;60:	memset( activator->client->ps.powerups, 0, sizeof( activator->client->ps.powerups ) );
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 memset
CALLP4
pop
line 61
;61:}
LABELV $66
endproc Use_target_remove_powerups 0 12
export SP_target_remove_powerups
proc SP_target_remove_powerups 0 0
line 63
;62:
;63:void SP_target_remove_powerups( gentity_t *ent ) {
line 64
;64:	ent->use = Use_target_remove_powerups;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 Use_target_remove_powerups
ASGNP4
line 65
;65:}
LABELV $75
endproc SP_target_remove_powerups 0 0
export Think_Target_Delay
proc Think_Target_Delay 4 8
line 74
;66:
;67:
;68://==========================================================
;69:
;70:/*QUAKED target_delay (1 0 0) (-8 -8 -8) (8 8 8)
;71:"wait" seconds to pause before firing targets.
;72:"random" delay variance, total delay = delay +/- random seconds
;73:*/
;74:void Think_Target_Delay( gentity_t *ent ) {
line 75
;75:	G_UseTargets( ent, ent->activator );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 76
;76:}
LABELV $76
endproc Think_Target_Delay 4 8
export Use_Target_Delay
proc Use_Target_Delay 8 0
line 78
;77:
;78:void Use_Target_Delay( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 79
;79:	ent->nextthink = level.time + ( ent->wait + ent->random * crandom() ) * 1000;
ADDRLP4 0
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 4
INDIRP4
CNSTI4 820
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 824
ADDP4
INDIRF4
CNSTF4 1073741824
ADDRLP4 0
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
line 80
;80:	ent->think = Think_Target_Delay;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 Think_Target_Delay
ASGNP4
line 81
;81:	ent->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 82
;82:}
LABELV $77
endproc Use_Target_Delay 8 0
export SP_target_delay
proc SP_target_delay 4 12
line 84
;83:
;84:void SP_target_delay( gentity_t *ent ) {
line 86
;85:	// check delay for backwards compatability
;86:	if ( !G_SpawnFloat( "delay", "0", &ent->wait ) ) {
ADDRGP4 $82
ARGP4
ADDRGP4 $83
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 G_SpawnFloat
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $80
line 87
;87:		G_SpawnFloat( "wait", "1", &ent->wait );
ADDRGP4 $84
ARGP4
ADDRGP4 $85
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 88
;88:	}
LABELV $80
line 90
;89:
;90:	if ( !ent->wait ) {
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
INDIRF4
CNSTF4 0
NEF4 $86
line 91
;91:		ent->wait = 1;
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
CNSTF4 1065353216
ASGNF4
line 92
;92:	}
LABELV $86
line 93
;93:	ent->use = Use_Target_Delay;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 Use_Target_Delay
ASGNP4
line 94
;94:}
LABELV $79
endproc SP_target_delay 4 12
export Use_Target_Score
proc Use_Target_Score 4 12
line 104
;95:
;96:
;97://==========================================================
;98:
;99:/*QUAKED target_score (1 0 0) (-8 -8 -8) (8 8 8)
;100:"count" number of points to add, default 1
;101:
;102:The activator is given this many points.
;103:*/
;104:void Use_Target_Score (gentity_t *ent, gentity_t *other, gentity_t *activator) {
line 105
;105:	AddScore( activator, ent->r.currentOrigin, ent->count );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 106
;106:}
LABELV $88
endproc Use_Target_Score 4 12
export SP_target_score
proc SP_target_score 0 0
line 108
;107:
;108:void SP_target_score( gentity_t *ent ) {
line 109
;109:	if ( !ent->count ) {
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
CNSTI4 0
NEI4 $90
line 110
;110:		ent->count = 1;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
CNSTI4 1
ASGNI4
line 111
;111:	}
LABELV $90
line 112
;112:	ent->use = Use_Target_Score;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 Use_Target_Score
ASGNP4
line 113
;113:}
LABELV $89
endproc SP_target_score 0 0
export Use_Target_Print
proc Use_Target_Print 4 8
line 122
;114:
;115:
;116://==========================================================
;117:
;118:/*QUAKED target_print (1 0 0) (-8 -8 -8) (8 8 8) redteam blueteam private
;119:"message"	text to print
;120:If "private", only the activator gets the message.  If no checks, all clients get the message.
;121:*/
;122:void Use_Target_Print (gentity_t *ent, gentity_t *other, gentity_t *activator) {
line 123
;123:	if ( activator->client && ( ent->spawnflags & 4 ) ) {
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $93
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $93
line 124
;124:		trap_SendServerCommand( activator-g_entities, va("cp \"%s\"", ent->message ));
ADDRGP4 $95
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 125
;125:		return;
ADDRGP4 $92
JUMPV
LABELV $93
line 128
;126:	}
;127:
;128:	if ( ent->spawnflags & 3 ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $96
line 129
;129:		if ( ent->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $98
line 130
;130:			G_TeamCommand( TEAM_RED, va("cp \"%s\"", ent->message) );
ADDRGP4 $95
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
line 131
;131:		}
LABELV $98
line 132
;132:		if ( ent->spawnflags & 2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $92
line 133
;133:			G_TeamCommand( TEAM_BLUE, va("cp \"%s\"", ent->message) );
ADDRGP4 $95
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
line 134
;134:		}
line 135
;135:		return;
ADDRGP4 $92
JUMPV
LABELV $96
line 138
;136:	}
;137:
;138:	trap_SendServerCommand( -1, va("cp \"%s\"", ent->message ));
ADDRGP4 $95
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 139
;139:}
LABELV $92
endproc Use_Target_Print 4 8
export SP_target_print
proc SP_target_print 0 0
line 141
;140:
;141:void SP_target_print( gentity_t *ent ) {
line 142
;142:	ent->use = Use_Target_Print;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 Use_Target_Print
ASGNP4
line 143
;143:}
LABELV $102
endproc SP_target_print 0 0
export Use_Target_Speaker
proc Use_Target_Speaker 4 12
line 161
;144:
;145:
;146://==========================================================
;147:
;148:
;149:/*QUAKED target_speaker (1 0 0) (-8 -8 -8) (8 8 8) looped-on looped-off global activator
;150:"noise"		wav file to play
;151:
;152:A global sound will play full volume throughout the level.
;153:Activator sounds will play on the player that activated the target.
;154:Global and activator sounds can't be combined with looping.
;155:Normal sounds play each time the target is used.
;156:Looped sounds will be toggled by use functions.
;157:Multiple identical looping sounds will just increase volume without any speed cost.
;158:"wait" : Seconds between auto triggerings, 0 = don't auto trigger
;159:"random"	wait variance, default is 0
;160:*/
;161:void Use_Target_Speaker (gentity_t *ent, gentity_t *other, gentity_t *activator) {
line 162
;162:	if (ent->spawnflags & 3) {	// looping sound toggles
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $104
line 163
;163:		if (ent->s.loopSound)
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
CNSTI4 0
EQI4 $106
line 164
;164:			ent->s.loopSound = 0;	// turn it off
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $105
JUMPV
LABELV $106
line 166
;165:		else
;166:			ent->s.loopSound = ent->noise_index;	// start it
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 816
ADDP4
INDIRI4
ASGNI4
line 167
;167:	}else {	// normal sound
ADDRGP4 $105
JUMPV
LABELV $104
line 168
;168:		if ( ent->spawnflags & 8 ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $108
line 169
;169:			G_AddEvent( activator, EV_GENERAL_SOUND, ent->noise_index );
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 170
;170:		} else if (ent->spawnflags & 4) {
ADDRGP4 $109
JUMPV
LABELV $108
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $110
line 171
;171:			G_AddEvent( ent, EV_GLOBAL_SOUND, ent->noise_index );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 48
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 816
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 172
;172:		} else {
ADDRGP4 $111
JUMPV
LABELV $110
line 173
;173:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->noise_index );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 816
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 174
;174:		}
LABELV $111
LABELV $109
line 175
;175:	}
LABELV $105
line 176
;176:}
LABELV $103
endproc Use_Target_Speaker 4 12
export SP_target_speaker
proc SP_target_speaker 100 16
line 178
;177:
;178:void SP_target_speaker( gentity_t *ent ) {
line 182
;179:	char	buffer[MAX_QPATH];
;180:	char	*s;
;181:
;182:	G_SpawnFloat( "wait", "0", &ent->wait );
ADDRGP4 $84
ARGP4
ADDRGP4 $83
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 183
;183:	G_SpawnFloat( "random", "0", &ent->random );
ADDRGP4 $113
ARGP4
ADDRGP4 $83
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 185
;184:
;185:	if ( !G_SpawnString( "noise", "NOSOUND", &s ) ) {
ADDRGP4 $116
ARGP4
ADDRGP4 $117
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 68
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $114
line 186
;186:		G_Error( "target_speaker without a noise key at %s", vtos( ent->s.origin ) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 72
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $118
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 187
;187:	}
LABELV $114
line 191
;188:
;189:	// force all client reletive sounds to be "activator" speakers that
;190:	// play on the entity that activates it
;191:	if ( s[0] == '*' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $119
line 192
;192:		ent->spawnflags |= 8;
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 193
;193:	}
LABELV $119
line 196
;194:
;195:	// Ogg Support
;196:	if (!strstr( s, ".ogg" )) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $123
ARGP4
ADDRLP4 72
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 72
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $121
line 197
;197:	Com_sprintf (buffer, sizeof(buffer), "%s.ogg", s );
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $124
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 198
;198:	} else {
ADDRGP4 $122
JUMPV
LABELV $121
line 199
;199:		Q_strncpyz( buffer, s, sizeof(buffer) );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 200
;200:	}
LABELV $122
line 202
;201:
;202:	if (!strstr( s, ".wav" )) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $127
ARGP4
ADDRLP4 76
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 76
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $125
line 203
;203:		Com_sprintf (buffer, sizeof(buffer), "%s.wav", s );
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $128
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 204
;204:	} else {
ADDRGP4 $126
JUMPV
LABELV $125
line 205
;205:		Q_strncpyz( buffer, s, sizeof(buffer) );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 206
;206:	}
LABELV $126
line 207
;207:	ent->noise_index = G_SoundIndex(buffer);
ADDRLP4 4
ARGP4
ADDRLP4 80
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ADDRLP4 80
INDIRI4
ASGNI4
line 210
;208:
;209:	// a repeating speaker can be done completely client side
;210:	ent->s.eType = ET_SPEAKER;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 7
ASGNI4
line 211
;211:	ent->s.eventParm = ent->noise_index;
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 816
ADDP4
INDIRI4
ASGNI4
line 212
;212:	ent->s.frame = ent->wait * 10;
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 172
ADDP4
CNSTF4 1092616192
ADDRLP4 88
INDIRP4
CNSTI4 820
ADDP4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 213
;213:	ent->s.clientNum = ent->random * 10;
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 168
ADDP4
CNSTF4 1092616192
ADDRLP4 92
INDIRP4
CNSTI4 824
ADDP4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 217
;214:
;215:
;216:	// check for prestarted looping sound
;217:	if ( ent->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $129
line 218
;218:		ent->s.loopSound = ent->noise_index;
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 96
INDIRP4
CNSTI4 816
ADDP4
INDIRI4
ASGNI4
line 219
;219:	}
LABELV $129
line 221
;220:
;221:	ent->use = Use_Target_Speaker;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 Use_Target_Speaker
ASGNP4
line 223
;222:
;223:	if (ent->spawnflags & 4) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $131
line 224
;224:		ent->r.svFlags |= SVF_BROADCAST;
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 225
;225:	}
LABELV $131
line 227
;226:
;227:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 96
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 231
;228:
;229:	// must link the entity so we get areas and clusters so
;230:	// the server can determine who to send updates to
;231:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 232
;232:}
LABELV $112
endproc SP_target_speaker 100 16
export target_laser_think
proc target_laser_think 120 32
line 241
;233:
;234:
;235:
;236://==========================================================
;237:
;238:/*QUAKED target_laser (0 .5 .8) (-8 -8 -8) (8 8 8) START_ON
;239:When triggered, fires a laser.  You can either set a target or a direction.
;240:*/
;241:void target_laser_think (gentity_t *self) {
line 247
;242:	vec3_t	end;
;243:	trace_t	tr;
;244:	vec3_t	point;
;245:
;246:	// if pointed at another entity, set movedir to point at it
;247:	if ( self->enemy ) {
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $134
line 248
;248:		VectorMA (self->enemy->s.origin, 0.5, self->enemy->r.mins, point);
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
ASGNP4
ADDRLP4 84
ADDRLP4 80
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 88
CNSTF4 1056964608
ASGNF4
ADDRLP4 0
ADDRLP4 84
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 88
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 92
ADDRLP4 80
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 0+4
ADDRLP4 92
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 88
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 96
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 96
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 249
;249:		VectorMA (point, 0.5, self->enemy->r.maxs, point);
ADDRLP4 100
CNSTF4 1056964608
ASGNF4
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 100
INDIRF4
ADDRLP4 104
INDIRP4
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 100
INDIRF4
ADDRLP4 104
INDIRP4
INDIRP4
CNSTI4 460
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1056964608
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRP4
CNSTI4 464
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 250
;250:		VectorSubtract (point, self->s.origin, self->movedir);
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
CNSTI4 692
ADDP4
ADDRLP4 0
INDIRF4
ADDRLP4 108
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI4 696
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRLP4 112
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
CNSTI4 700
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRLP4 116
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 251
;251:		VectorNormalize (self->movedir);
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 252
;252:	}
LABELV $134
line 255
;253:
;254:	// fire forward and see what we hit
;255:	VectorMA (self->s.origin, 2048, self->movedir, end);
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
CNSTF4 1157627904
ASGNF4
ADDRLP4 12
ADDRLP4 80
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 84
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 692
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 80
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 84
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 696
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12+8
ADDRLP4 88
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
CNSTF4 1157627904
ADDRLP4 88
INDIRP4
CNSTI4 700
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 257
;256:
;257:	trap_Trace( &tr, self->s.origin, NULL, NULL, end, self->s.number, CONTENTS_SOLID|CONTENTS_BODY|CONTENTS_CORPSE);
ADDRLP4 24
ARGP4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 92
ADDP4
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
ADDRLP4 92
INDIRP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 259
;258:
;259:	if ( tr.entityNum ) {
ADDRLP4 24+52
INDIRI4
CNSTI4 0
EQI4 $146
line 261
;260:		// hurt it if we can
;261:		G_Damage ( &g_entities[tr.entityNum], self, self->activator, self->movedir, 
CNSTI4 924
ADDRLP4 24+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
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
CNSTI4 796
ADDP4
INDIRP4
ARGP4
ADDRLP4 100
INDIRP4
CNSTI4 692
ADDP4
ARGP4
ADDRLP4 24+12
ARGP4
ADDRLP4 100
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 21
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 263
;262:			tr.endpos, self->damage, DAMAGE_NO_KNOCKBACK, MOD_TARGET_LASER);
;263:	}
LABELV $146
line 265
;264:
;265:	VectorCopy (tr.endpos, self->s.origin2);
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 24+12
INDIRB
ASGNB 12
line 267
;266:
;267:	trap_LinkEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 268
;268:	self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 269
;269:}
LABELV $133
endproc target_laser_think 120 32
export target_laser_on
proc target_laser_on 4 4
line 272
;270:
;271:void target_laser_on (gentity_t *self)
;272:{
line 273
;273:	if (!self->activator)
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $154
line 274
;274:		self->activator = self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $154
line 275
;275:	target_laser_think (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_think
CALLV
pop
line 276
;276:}
LABELV $153
endproc target_laser_on 4 4
export target_laser_off
proc target_laser_off 0 4
line 279
;277:
;278:void target_laser_off (gentity_t *self)
;279:{
line 280
;280:	trap_UnlinkEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 281
;281:	self->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 0
ASGNI4
line 282
;282:}
LABELV $156
endproc target_laser_off 0 4
export target_laser_use
proc target_laser_use 0 4
line 285
;283:
;284:void target_laser_use (gentity_t *self, gentity_t *other, gentity_t *activator)
;285:{
line 286
;286:	self->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 287
;287:	if ( self->nextthink > 0 )
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRI4
CNSTI4 0
LEI4 $158
line 288
;288:		target_laser_off (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_off
CALLV
pop
ADDRGP4 $159
JUMPV
LABELV $158
line 290
;289:	else
;290:		target_laser_on (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_on
CALLV
pop
LABELV $159
line 291
;291:}
LABELV $157
endproc target_laser_use 0 4
export target_laser_start
proc target_laser_start 16 16
line 294
;292:
;293:void target_laser_start (gentity_t *self)
;294:{
line 297
;295:	gentity_t *ent;
;296:
;297:	self->s.eType = ET_BEAM;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 5
ASGNI4
line 299
;298:
;299:	if (self->target) {
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $161
line 300
;300:		ent = G_Find (NULL, FOFS(targetname), self->target);
CNSTP4 0
ARGP4
CNSTI4 660
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 301
;301:		if (!ent) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $163
line 302
;302:			G_Printf ("%s at %s: %s is a bad target\n", self->classname, vtos(self->s.origin), self->target);
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $165
ARGP4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 303
;303:		}
LABELV $163
line 304
;304:		self->enemy = ent;
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 305
;305:	} else {
ADDRGP4 $162
JUMPV
LABELV $161
line 306
;306:		G_SetMovedir (self->s.angles, self->movedir);
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
CNSTI4 692
ADDP4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
line 307
;307:	}
LABELV $162
line 309
;308:
;309:	self->use = target_laser_use;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 target_laser_use
ASGNP4
line 310
;310:	self->think = target_laser_think;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 target_laser_think
ASGNP4
line 312
;311:
;312:	if ( !self->damage ) {
ADDRFP4 0
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
CNSTI4 0
NEI4 $166
line 313
;313:		self->damage = 1;
ADDRFP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 1
ASGNI4
line 314
;314:	}
LABELV $166
line 316
;315:
;316:	if (self->spawnflags & 1)
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $168
line 317
;317:		target_laser_on (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_on
CALLV
pop
ADDRGP4 $169
JUMPV
LABELV $168
line 319
;318:	else
;319:		target_laser_off (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_off
CALLV
pop
LABELV $169
line 320
;320:}
LABELV $160
endproc target_laser_start 16 16
export SP_target_laser
proc SP_target_laser 0 0
line 323
;321:
;322:void SP_target_laser (gentity_t *self)
;323:{
line 325
;324:	// let everything else get spawned before we start firing
;325:	self->think = target_laser_start;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 target_laser_start
ASGNP4
line 326
;326:	self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 327
;327:}
LABELV $170
endproc SP_target_laser 0 0
export target_teleporter_use
proc target_teleporter_use 12 12
line 332
;328:
;329:
;330://==========================================================
;331:
;332:void target_teleporter_use( gentity_t *self, gentity_t *other, gentity_t *activator ) {
line 335
;333:	gentity_t	*dest;
;334:
;335:	if (!activator->client)
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $173
line 336
;336:		return;
ADDRGP4 $172
JUMPV
LABELV $173
line 337
;337:	dest = 	G_PickTarget( self->target );
ADDRFP4 0
INDIRP4
CNSTI4 656
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
line 338
;338:	if (!dest) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $175
line 339
;339:		G_Printf ("Couldn't find teleporter destination\n");
ADDRGP4 $177
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 340
;340:		return;
ADDRGP4 $172
JUMPV
LABELV $175
line 343
;341:	}
;342:
;343:	TeleportPlayer( activator, dest->s.origin, dest->s.angles );
ADDRFP4 8
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
line 344
;344:}
LABELV $172
endproc target_teleporter_use 12 12
export SP_target_teleporter
proc SP_target_teleporter 4 12
line 349
;345:
;346:/*QUAKED target_teleporter (1 0 0) (-8 -8 -8) (8 8 8)
;347:The activator will be teleported away.
;348:*/
;349:void SP_target_teleporter( gentity_t *self ) {
line 350
;350:	if (!self->targetname)
ADDRFP4 0
INDIRP4
CNSTI4 660
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $179
line 351
;351:		G_Printf("untargeted %s at %s\n", self->classname, vtos(self->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $181
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $179
line 353
;352:
;353:	self->use = target_teleporter_use;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 target_teleporter_use
ASGNP4
line 354
;354:}
LABELV $178
endproc SP_target_teleporter 4 12
export target_relay_use
proc target_relay_use 36 12
line 364
;355:
;356://==========================================================
;357:
;358:
;359:/*QUAKED target_relay (.5 .5 .5) (-8 -8 -8) (8 8 8) RED_ONLY BLUE_ONLY RANDOM
;360:This doesn't perform any actions except fire its targets.
;361:The activator can be forced to be from a certain team.
;362:if RANDOM is checked, only one of the targets will be fired, not all of them
;363:*/
;364:void target_relay_use (gentity_t *self, gentity_t *other, gentity_t *activator) {
line 365
;365:	if ( ( self->spawnflags & 1 ) && activator->client 
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
BANDI4
CNSTI4 0
EQI4 $183
ADDRLP4 4
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $183
ADDRLP4 4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $183
line 366
;366:		&& activator->client->sess.sessionTeam != TEAM_RED ) {
line 367
;367:		return;
ADDRGP4 $182
JUMPV
LABELV $183
line 369
;368:	}
;369:	if ( ( self->spawnflags & 2 ) && activator->client 
ADDRLP4 8
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
BANDI4
CNSTI4 0
EQI4 $185
ADDRLP4 12
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $185
ADDRLP4 12
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $185
line 370
;370:		&& activator->client->sess.sessionTeam != TEAM_BLUE ) {
line 371
;371:		return;
ADDRGP4 $182
JUMPV
LABELV $185
line 373
;372:	}
;373:	if ( self->spawnflags & 4 ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $187
line 376
;374:		gentity_t	*ent;
;375:
;376:		ent = G_PickTarget( self->target );
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 20
INDIRP4
ASGNP4
line 377
;377:		if ( ent && ent->use ) {
ADDRLP4 24
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 28
CNSTU4 0
ASGNU4
ADDRLP4 24
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $182
ADDRLP4 24
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $182
line 378
;378:			ent->use( ent, self, activator );
ADDRLP4 32
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CALLV
pop
line 379
;379:		}
line 380
;380:		return;
ADDRGP4 $182
JUMPV
LABELV $187
line 382
;381:	}
;382:	G_UseTargets (self, activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 383
;383:}
LABELV $182
endproc target_relay_use 36 12
export SP_target_relay
proc SP_target_relay 0 0
line 385
;384:
;385:void SP_target_relay (gentity_t *self) {
line 386
;386:	self->use = target_relay_use;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 target_relay_use
ASGNP4
line 387
;387:}
LABELV $191
endproc SP_target_relay 0 0
export target_kill_use
proc target_kill_use 8 32
line 395
;388:
;389:
;390://==========================================================
;391:
;392:/*QUAKED target_kill (.5 .5 .5) (-8 -8 -8) (8 8 8)
;393:Kills the activator.
;394:*/
;395:void target_kill_use( gentity_t *self, gentity_t *other, gentity_t *activator ) {
line 396
;396:	G_Damage ( activator, NULL, NULL, NULL, NULL, 100000, DAMAGE_NO_PROTECTION, MOD_TELEFRAG);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
CNSTP4 0
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 8
ARGI4
CNSTI4 18
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 397
;397:}
LABELV $192
endproc target_kill_use 8 32
export SP_target_kill
proc SP_target_kill 0 0
line 399
;398:
;399:void SP_target_kill( gentity_t *self ) {
line 400
;400:	self->use = target_kill_use;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 target_kill_use
ASGNP4
line 401
;401:}
LABELV $193
endproc SP_target_kill 0 0
export SP_target_position
proc SP_target_position 4 8
line 406
;402:
;403:/*QUAKED target_position (0 0.5 0) (-4 -4 -4) (4 4 4)
;404:Used as a positional target for in-game calculation, like jumppad targets.
;405:*/
;406:void SP_target_position( gentity_t *self ){
line 407
;407:	G_SetOrigin( self, self->s.origin );
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
line 408
;408:}
LABELV $194
endproc SP_target_position 4 8
proc target_location_linkup 16 8
line 411
;409:
;410:static void target_location_linkup(gentity_t *ent)
;411:{
line 415
;412:	int i;
;413:	int n;
;414:
;415:	if (level.locationLinked) 
ADDRGP4 level+9180
INDIRI4
CNSTI4 0
EQI4 $196
line 416
;416:		return;
ADDRGP4 $195
JUMPV
LABELV $196
line 418
;417:
;418:	level.locationLinked = qtrue;
ADDRGP4 level+9180
CNSTI4 1
ASGNI4
line 420
;419:
;420:	level.locationHead = NULL;
ADDRGP4 level+9184
CNSTP4 0
ASGNP4
line 422
;421:
;422:	trap_SetConfigstring( CS_LOCATIONS, "unknown" );
CNSTI4 608
ARGI4
ADDRGP4 $201
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 424
;423:
;424:	for (i = 0, ent = g_entities, n = 1;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 0
ADDRGP4 g_entities
ASGNP4
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $205
JUMPV
LABELV $202
line 426
;425:			i < level.num_entities;
;426:			i++, ent++) {
line 427
;427:		if (ent->classname && !Q_stricmp(ent->classname, "target_location")) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $207
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $209
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $207
line 429
;428:			// lets overload some variables!
;429:			ent->health = n; // use for location marking
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 430
;430:			trap_SetConfigstring( CS_LOCATIONS + n, ent->message );
ADDRLP4 4
INDIRI4
CNSTI4 608
ADDI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 431
;431:			n++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 432
;432:			ent->nextTrain = level.locationHead;
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
ADDRGP4 level+9184
INDIRP4
ASGNP4
line 433
;433:			level.locationHead = ent;
ADDRGP4 level+9184
ADDRFP4 0
INDIRP4
ASGNP4
line 434
;434:		}
LABELV $207
line 435
;435:	}
LABELV $203
line 426
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 924
ADDP4
ASGNP4
LABELV $205
line 425
ADDRLP4 0
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $202
line 438
;436:
;437:	// All linked together now
;438:}
LABELV $195
endproc target_location_linkup 16 8
export SP_target_location
proc SP_target_location 4 8
line 448
;439:
;440:/*QUAKED target_location (0 0.5 0) (-8 -8 -8) (8 8 8)
;441:Set "message" to the name of this location.
;442:Set "count" to 0-7 for color.
;443:0:white 1:red 2:green 3:yellow 4:blue 5:cyan 6:magenta 7:white
;444:
;445:Closest target_location in sight used for the location, if none
;446:in site, closest in distance
;447:*/
;448:void SP_target_location( gentity_t *self ){
line 449
;449:	self->think = target_location_linkup;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 target_location_linkup
ASGNP4
line 450
;450:	self->nextthink = level.time + 200;  // Let them all spawn first
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 452
;451:
;452:	G_SetOrigin( self, self->s.origin );
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
line 453
;453:}
LABELV $212
endproc SP_target_location 4 8
export GravityResetCheck
proc GravityResetCheck 156 28
line 482
;454:
;455:/*QUAKED target_gravity_change (1 0 0) (-4 -4 -4) (4 4 4) GLOBAL
;456:
;457: GLOBAL - Apply to the entire world, and not just the activator
;458: 
;459: "gravity" -	 Normal = 800, valid range: >= 0
;460: "surfaceFlag" - Important setting. With this you can define on what surface the speed_change will work.
;461: As soon as the player hits another surface, the gravity_change will stop.
;462: Possible values:
;463: CONTENTS_NODROP		0 -> Recommended and default value, since lower-gravity will make things float anyway.
;464: CONTENTS_SOLID			1
;465: CONTENTS_LAVA			2
;466: CONTENTS_SLIME			3
;467: CONTENTS_WATER			4
;468: CONTENTS_FOG			5
;469: CONTENTS_DETAIL		6 -> Can easily be set in Radiant, so also quite easy.
;470: CONTENTS_STRUCTURAL	7 -> " " (also recommended as grav-surface, so something else can be set as detail (to reset))
;471: CONTENTS_TRANSLUCENT	8
;472: SURF_METALSTEPS		9
;473: SURF_NOSTEPS			10
;474: SURF_NOMARKS			11
;475: SURF_NOIMPACT			12
;476: SURF_SKY				13
;477: SURF_NODAMAGE			14
;478:
;479: Note: You have to make the ceiling of your gravity-room a CONTENTS_SOLID (standard brush), a SURF_SKY, or a SURF_NOIMPACT
;480: */
;481:void GravityResetCheck( gentity_t *self )
;482:{ //-Vincent
line 486
;483:vec3_t  begin, end;
;484:trace_t tr1, tr2;
;485:	
;486:	if( !self->activator->client || !self->s.origin )
ADDRLP4 136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
CNSTU4 0
ASGNU4
ADDRLP4 136
INDIRP4
CNSTI4 796
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 140
INDIRU4
EQU4 $217
ADDRLP4 136
INDIRP4
CNSTI4 92
ADDP4
CVPU4 4
ADDRLP4 140
INDIRU4
NEU4 $215
LABELV $217
line 487
;487:	{ // The activator might be dead / The entity might be gone
line 488
;488:		self->activator->client->ps.gravity = g_gravity.integer;
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 48
ADDP4
ADDRGP4 g_gravity+12
INDIRI4
ASGNI4
line 489
;489:		self->think		= 0;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTP4 0
ASGNP4
line 490
;490:		return;
ADDRGP4 $214
JUMPV
LABELV $215
line 494
;491:	}
;492:
;493:	// Trace up (in a straight line), until we hit a solid, playerclip, sky or noimpact content
;494:	VectorCopy( self->activator->s.origin, begin );
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 495
;495:	begin[2] += 1000;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1148846080
ADDF4
ASGNF4
line 496
;496:	trap_Trace( &tr1, self->activator->s.origin, NULL, NULL, end, -1, CONTENTS_SOLID | SURF_NOIMPACT | SURF_SKY );
ADDRLP4 24
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 144
CNSTP4 0
ASGNP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 21
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 498
;497:	// Trace back down (in a straight line), trying to hit the required content
;498:	VectorCopy( self->activator->s.origin, end );
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 499
;499:	end[2] -= 1000;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1148846080
SUBF4
ASGNF4
line 500
;500:	trap_Trace( &tr2, tr1.endpos,  NULL, NULL, self->activator->s.origin, -1, self->surfaceFlag );
ADDRLP4 80
ARGP4
ADDRLP4 24+12
ARGP4
ADDRLP4 148
CNSTP4 0
ASGNP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
CNSTI4 796
ADDP4
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 152
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 502
;501:
;502:	if( tr2.fraction <= 0 ) // The surface has not been found
ADDRLP4 80+8
INDIRF4
CNSTF4 0
GTF4 $222
line 503
;503:	{ // Stop doing the check and reset the gravity
line 504
;504:		self->activator->client->ps.gravity = g_gravity.integer;
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 48
ADDP4
ADDRGP4 g_gravity+12
INDIRI4
ASGNI4
line 505
;505:		self->think		= 0;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTP4 0
ASGNP4
line 506
;506:	}
ADDRGP4 $223
JUMPV
LABELV $222
line 508
;507:	else
;508:	{
line 509
;509:		self->nextthink = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 510
;510:	}
LABELV $223
line 511
;511:}
LABELV $214
endproc GravityResetCheck 156 28
export target_gravity_change_use
proc target_gravity_change_use 4 8
line 514
;512:
;513:void target_gravity_change_use( gentity_t *self, gentity_t *other, gentity_t *activator )
;514:{ //-Vincent
line 515
;515:	if( self->spawnflags & 1 )
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $228
line 516
;516:	{ // Global setting
line 517
;517:		trap_Cvar_Set( "g_gravity", va( "%f", self->gravity ) );
ADDRGP4 $231
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 684
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $230
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 518
;518:	}
ADDRGP4 $229
JUMPV
LABELV $228
line 519
;519:	else if( self->activator->client )
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $232
line 520
;520:	{ // Confirm
line 521
;521:		self->activator = activator; // Pass it on
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 522
;522:		self->activator->client->ps.gravity = self->gravity;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 48
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 684
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 523
;523:	}
LABELV $232
LABELV $229
line 525
;524:
;525:	if(		 self->surfaceFlag == 1 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 1
NEI4 $234
line 526
;526:			 self->surfaceFlag = CONTENTS_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $235
JUMPV
LABELV $234
line 527
;527:	else if( self->surfaceFlag == 2 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 2
NEI4 $236
line 528
;528:			 self->surfaceFlag = CONTENTS_LAVA;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 8
ASGNI4
ADDRGP4 $237
JUMPV
LABELV $236
line 529
;529:	else if( self->surfaceFlag == 3 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 3
NEI4 $238
line 530
;530:			 self->surfaceFlag = CONTENTS_SLIME;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 16
ASGNI4
ADDRGP4 $239
JUMPV
LABELV $238
line 531
;531:	else if( self->surfaceFlag == 4 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 4
NEI4 $240
line 532
;532:			 self->surfaceFlag = CONTENTS_WATER;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 32
ASGNI4
ADDRGP4 $241
JUMPV
LABELV $240
line 533
;533:	else if( self->surfaceFlag == 5 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 5
NEI4 $242
line 534
;534:			 self->surfaceFlag = CONTENTS_FOG;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 64
ASGNI4
ADDRGP4 $243
JUMPV
LABELV $242
line 535
;535:	else if( self->surfaceFlag == 6 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 6
NEI4 $244
line 536
;536:			 self->surfaceFlag = CONTENTS_DETAIL;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 134217728
ASGNI4
ADDRGP4 $245
JUMPV
LABELV $244
line 537
;537:	else if( self->surfaceFlag == 7 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 7
NEI4 $246
line 538
;538:			 self->surfaceFlag = CONTENTS_STRUCTURAL;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 268435456
ASGNI4
ADDRGP4 $247
JUMPV
LABELV $246
line 539
;539:	else if( self->surfaceFlag == 8 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 8
NEI4 $248
line 540
;540:			 self->surfaceFlag = CONTENTS_TRANSLUCENT;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 536870912
ASGNI4
ADDRGP4 $249
JUMPV
LABELV $248
line 541
;541:	else if( self->surfaceFlag == 9 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 9
NEI4 $250
line 542
;542:		 	 self->surfaceFlag = SURF_METALSTEPS;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 4096
ASGNI4
ADDRGP4 $251
JUMPV
LABELV $250
line 543
;543:	else if( self->surfaceFlag == 10 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 10
NEI4 $252
line 544
;544:			 self->surfaceFlag = SURF_NOSTEPS;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 8192
ASGNI4
ADDRGP4 $253
JUMPV
LABELV $252
line 545
;545:	else if( self->surfaceFlag == 11 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 11
NEI4 $254
line 546
;546:			 self->surfaceFlag = SURF_NOMARKS;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 32
ASGNI4
ADDRGP4 $255
JUMPV
LABELV $254
line 547
;547:	else if( self->surfaceFlag == 12 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 12
NEI4 $256
line 548
;548:			 self->surfaceFlag = SURF_NOIMPACT;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 16
ASGNI4
ADDRGP4 $257
JUMPV
LABELV $256
line 549
;549:	else if( self->surfaceFlag == 13 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 13
NEI4 $258
line 550
;550:			 self->surfaceFlag = SURF_SKY;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 4
ASGNI4
ADDRGP4 $259
JUMPV
LABELV $258
line 551
;551:	else if( self->surfaceFlag == 14 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 14
NEI4 $260
line 552
;552:			 self->surfaceFlag = SURF_NODAMAGE;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $261
JUMPV
LABELV $260
line 554
;553:	else // surfaceFlag == 0, default
;554:			 self->surfaceFlag = CONTENTS_NODROP;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTU4 2147483648
CVUI4 4
ASGNI4
LABELV $261
LABELV $259
LABELV $257
LABELV $255
LABELV $253
LABELV $251
LABELV $249
LABELV $247
LABELV $245
LABELV $243
LABELV $241
LABELV $239
LABELV $237
LABELV $235
line 556
;555:
;556:	self->think = GravityResetCheck;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 GravityResetCheck
ASGNP4
line 557
;557:	self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 558
;558:}
LABELV $227
endproc target_gravity_change_use 4 8
export SP_target_gravity_change
proc SP_target_gravity_change 4 8
line 561
;559:
;560:void SP_target_gravity_change( gentity_t *self )
;561:{ //-Vincent
line 562
;562:G_SetOrigin( self, self->s.origin );
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
line 564
;563:
;564:trap_LinkEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 565
;565:self->use = target_gravity_change_use;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 target_gravity_change_use
ASGNP4
line 566
;566:}
LABELV $263
endproc SP_target_gravity_change 4 8
export SpeedResetCheck
proc SpeedResetCheck 156 28
line 596
;567:
;568:
;569:/*QUAKED target_speed_change (1 0 0) (-4 -4 -4) (4 4 4) GLOBAL
;570:
;571: GLOBAL - Apply to the entire world, and not just the activator
;572: 
;573: "speed" - Normal = 320, valid range: > 0
;574: "surfaceFlag" - Important setting. With this you can define on what surface the speed_change will work.
;575: As soon as the player hits another surface, the speed_change will stop.
;576: Possible values:
;577: CONTENTS_STRUCTURAL	0 -> Recommended and default value, so something else can be set as detail (to reset)
;578: CONTENTS_DETAIL		1
;579: CONTENTS_LAVA			2
;580: CONTENTS_SLIME			3
;581: CONTENTS_WATER			4
;582: CONTENTS_FOG			5
;583: CONTENTS_NODROP		6
;584: CONTENTS_SOLID			7
;585: CONTENTS_TRANSLUCENT	8
;586: SURF_METALSTEPS		9
;587: SURF_NOSTEPS			10
;588: SURF_NOMARKS			11
;589: SURF_NOIMPACT			12
;590: SURF_SKY				13
;591: SURF_NODAMAGE			14
;592:
;593: Note: You have to make the ceiling of your speed-room a CONTENTS_SOLID (standard brush), a SURF_SKY, or a SURF_NOIMPACT
;594: */
;595:void SpeedResetCheck( gentity_t *self )
;596:{ //-Vincent
line 600
;597:vec3_t  begin, end;
;598:trace_t tr1, tr2;
;599:	
;600:	if( !self->activator->client || !self->s.origin )
ADDRLP4 136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
CNSTU4 0
ASGNU4
ADDRLP4 136
INDIRP4
CNSTI4 796
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 140
INDIRU4
EQU4 $267
ADDRLP4 136
INDIRP4
CNSTI4 92
ADDP4
CVPU4 4
ADDRLP4 140
INDIRU4
NEU4 $265
LABELV $267
line 601
;601:	{ // The activator might be dead / The entity might be gone
line 602
;602:		self->activator->client->ps.speed = g_speed.integer;
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 g_speed+12
INDIRI4
ASGNI4
line 603
;603:		self->think		=  0;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTP4 0
ASGNP4
line 604
;604:		return; 
ADDRGP4 $264
JUMPV
LABELV $265
line 608
;605:	}
;606:
;607:	// Trace up (in a straight line), until we hit a solid, playerclip, sky or noimpact content
;608:	VectorCopy( self->activator->s.origin, begin );
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 609
;609:	begin[2] += 1000;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1148846080
ADDF4
ASGNF4
line 610
;610:	trap_Trace( &tr1, self->activator->s.origin, NULL, NULL, end, -1, CONTENTS_SOLID | SURF_NOIMPACT | SURF_SKY );
ADDRLP4 24
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 144
CNSTP4 0
ASGNP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 21
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 612
;611:	// Trace back down (in a straight line), trying to hit the required content
;612:	VectorCopy( self->activator->s.origin, end );
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 613
;613:	end[2] -= 1000;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1148846080
SUBF4
ASGNF4
line 614
;614:	trap_Trace( &tr2, tr1.endpos,  NULL, NULL, self->activator->s.origin, -1, self->surfaceFlag );
ADDRLP4 80
ARGP4
ADDRLP4 24+12
ARGP4
ADDRLP4 148
CNSTP4 0
ASGNP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
CNSTI4 796
ADDP4
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 152
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 616
;615:
;616:	if( tr2.fraction <= 0 ) // The surface has not been found
ADDRLP4 80+8
INDIRF4
CNSTF4 0
GTF4 $272
line 617
;617:	{ // Stop doing the check and reset the speed
line 618
;618:		self->activator->client->ps.speed = g_speed.integer;
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 g_speed+12
INDIRI4
ASGNI4
line 619
;619:		self->think		=  0;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTP4 0
ASGNP4
line 620
;620:		return;
ADDRGP4 $264
JUMPV
LABELV $272
line 623
;621:	}
;622:	else
;623:	{
line 624
;624:		self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 625
;625:	}
line 626
;626:}
LABELV $264
endproc SpeedResetCheck 156 28
export target_speed_change_use
proc target_speed_change_use 4 8
line 629
;627:
;628:void target_speed_change_use( gentity_t *self, gentity_t *other, gentity_t *activator )
;629:{ //-Vincent
line 630
;630:	if( self->spawnflags & 1 )
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $278
line 631
;631:	{ // Global setting
line 632
;632:		trap_Cvar_Set( "g_speed", va( "%f", self->speed ) );
ADDRGP4 $231
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $280
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 633
;633:	}
ADDRGP4 $279
JUMPV
LABELV $278
line 634
;634:	else if( self->activator->client )
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $281
line 635
;635:	{ // Confirm
line 636
;636:		self->activator = activator; // Pass it on
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 637
;637:		self->activator->client->ps.speed = self->speed;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 638
;638:	}
LABELV $281
LABELV $279
line 640
;639:			
;640:	if(		 self->surfaceFlag == 1 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 1
NEI4 $283
line 641
;641:			 self->surfaceFlag = CONTENTS_DETAIL;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 134217728
ASGNI4
ADDRGP4 $284
JUMPV
LABELV $283
line 642
;642:	else if( self->surfaceFlag == 2 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 2
NEI4 $285
line 643
;643:			 self->surfaceFlag = CONTENTS_LAVA;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 8
ASGNI4
ADDRGP4 $286
JUMPV
LABELV $285
line 644
;644:	else if( self->surfaceFlag == 3 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 3
NEI4 $287
line 645
;645:			 self->surfaceFlag = CONTENTS_SLIME;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 16
ASGNI4
ADDRGP4 $288
JUMPV
LABELV $287
line 646
;646:	else if( self->surfaceFlag == 4 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 4
NEI4 $289
line 647
;647:			 self->surfaceFlag = CONTENTS_WATER;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 32
ASGNI4
ADDRGP4 $290
JUMPV
LABELV $289
line 648
;648:	else if( self->surfaceFlag == 5 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 5
NEI4 $291
line 649
;649:			 self->surfaceFlag = CONTENTS_FOG;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 64
ASGNI4
ADDRGP4 $292
JUMPV
LABELV $291
line 650
;650:	else if( self->surfaceFlag == 6 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 6
NEI4 $293
line 651
;651:			 self->surfaceFlag = CONTENTS_NODROP;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTU4 2147483648
CVUI4 4
ASGNI4
ADDRGP4 $294
JUMPV
LABELV $293
line 652
;652:	else if( self->surfaceFlag == 7 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 7
NEI4 $295
line 653
;653:			 self->surfaceFlag = CONTENTS_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $296
JUMPV
LABELV $295
line 654
;654:	else if( self->surfaceFlag == 8 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 8
NEI4 $297
line 655
;655:			 self->surfaceFlag = CONTENTS_TRANSLUCENT;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 536870912
ASGNI4
ADDRGP4 $298
JUMPV
LABELV $297
line 656
;656:	else if( self->surfaceFlag == 9 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 9
NEI4 $299
line 657
;657:			 self->surfaceFlag = SURF_METALSTEPS;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 4096
ASGNI4
ADDRGP4 $300
JUMPV
LABELV $299
line 658
;658:	else if( self->surfaceFlag == 10 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 10
NEI4 $301
line 659
;659:			 self->surfaceFlag = SURF_NOSTEPS;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 8192
ASGNI4
ADDRGP4 $302
JUMPV
LABELV $301
line 660
;660:	else if( self->surfaceFlag == 11 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 11
NEI4 $303
line 661
;661:			 self->surfaceFlag = SURF_NOMARKS;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 32
ASGNI4
ADDRGP4 $304
JUMPV
LABELV $303
line 662
;662:	else if( self->surfaceFlag == 12 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 12
NEI4 $305
line 663
;663:			 self->surfaceFlag = SURF_NOIMPACT;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 16
ASGNI4
ADDRGP4 $306
JUMPV
LABELV $305
line 664
;664:	else if( self->surfaceFlag == 13 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 13
NEI4 $307
line 665
;665:			 self->surfaceFlag = SURF_SKY;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 4
ASGNI4
ADDRGP4 $308
JUMPV
LABELV $307
line 666
;666:	else if( self->surfaceFlag == 14 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 14
NEI4 $309
line 667
;667:			 self->surfaceFlag = SURF_NODAMAGE;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $310
JUMPV
LABELV $309
line 669
;668:	else // surfaceFlag == 0, default
;669:			 self->surfaceFlag = CONTENTS_STRUCTURAL;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 268435456
ASGNI4
LABELV $310
LABELV $308
LABELV $306
LABELV $304
LABELV $302
LABELV $300
LABELV $298
LABELV $296
LABELV $294
LABELV $292
LABELV $290
LABELV $288
LABELV $286
LABELV $284
line 671
;670:
;671:	self->think = SpeedResetCheck;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 SpeedResetCheck
ASGNP4
line 672
;672:	self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 673
;673:}
LABELV $277
endproc target_speed_change_use 4 8
export SP_target_speed_change
proc SP_target_speed_change 4 8
line 676
;674:
;675:void SP_target_speed_change( gentity_t *self )
;676:{ //-Vincent
line 677
;677:G_SetOrigin( self, self->s.origin );
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
line 679
;678:
;679:trap_LinkEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 680
;680:self->use = target_speed_change_use;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 target_speed_change_use
ASGNP4
line 681
;681:}
LABELV $312
endproc SP_target_speed_change 4 8
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
import fire_mg
import fire_turret
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
LABELV $280
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $231
byte 1 37
byte 1 102
byte 1 0
align 1
LABELV $230
byte 1 103
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $209
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $201
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $181
byte 1 117
byte 1 110
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $177
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
LABELV $165
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $128
byte 1 37
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $127
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $124
byte 1 37
byte 1 115
byte 1 46
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $123
byte 1 46
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $118
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 97
byte 1 107
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 110
byte 1 111
byte 1 105
byte 1 115
byte 1 101
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $117
byte 1 78
byte 1 79
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $116
byte 1 110
byte 1 111
byte 1 105
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $113
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $95
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $85
byte 1 49
byte 1 0
align 1
LABELV $84
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $83
byte 1 48
byte 1 0
align 1
LABELV $82
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
