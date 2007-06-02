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
proc SP_target_speaker 96 16
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
line 195
;194:
;195:	if (!strstr( s, ".wav" )) {
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
line 196
;196:		Com_sprintf (buffer, sizeof(buffer), "%s.wav", s );
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
line 197
;197:	} else {
ADDRGP4 $122
JUMPV
LABELV $121
line 198
;198:		Q_strncpyz( buffer, s, sizeof(buffer) );
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
line 199
;199:	}
LABELV $122
line 200
;200:	ent->noise_index = G_SoundIndex(buffer);
ADDRLP4 4
ARGP4
ADDRLP4 76
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ADDRLP4 76
INDIRI4
ASGNI4
line 203
;201:
;202:	// a repeating speaker can be done completely client side
;203:	ent->s.eType = ET_SPEAKER;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 7
ASGNI4
line 204
;204:	ent->s.eventParm = ent->noise_index;
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 80
INDIRP4
CNSTI4 816
ADDP4
INDIRI4
ASGNI4
line 205
;205:	ent->s.frame = ent->wait * 10;
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 172
ADDP4
CNSTF4 1092616192
ADDRLP4 84
INDIRP4
CNSTI4 820
ADDP4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 206
;206:	ent->s.clientNum = ent->random * 10;
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 168
ADDP4
CNSTF4 1092616192
ADDRLP4 88
INDIRP4
CNSTI4 824
ADDP4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 210
;207:
;208:
;209:	// check for prestarted looping sound
;210:	if ( ent->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $125
line 211
;211:		ent->s.loopSound = ent->noise_index;
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 92
INDIRP4
CNSTI4 816
ADDP4
INDIRI4
ASGNI4
line 212
;212:	}
LABELV $125
line 214
;213:
;214:	ent->use = Use_Target_Speaker;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 Use_Target_Speaker
ASGNP4
line 216
;215:
;216:	if (ent->spawnflags & 4) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $127
line 217
;217:		ent->r.svFlags |= SVF_BROADCAST;
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 218
;218:	}
LABELV $127
line 220
;219:
;220:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 92
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 224
;221:
;222:	// must link the entity so we get areas and clusters so
;223:	// the server can determine who to send updates to
;224:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 225
;225:}
LABELV $112
endproc SP_target_speaker 96 16
export target_laser_think
proc target_laser_think 120 32
line 234
;226:
;227:
;228:
;229://==========================================================
;230:
;231:/*QUAKED target_laser (0 .5 .8) (-8 -8 -8) (8 8 8) START_ON
;232:When triggered, fires a laser.  You can either set a target or a direction.
;233:*/
;234:void target_laser_think (gentity_t *self) {
line 240
;235:	vec3_t	end;
;236:	trace_t	tr;
;237:	vec3_t	point;
;238:
;239:	// if pointed at another entity, set movedir to point at it
;240:	if ( self->enemy ) {
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $130
line 241
;241:		VectorMA (self->enemy->s.origin, 0.5, self->enemy->r.mins, point);
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
line 242
;242:		VectorMA (point, 0.5, self->enemy->r.maxs, point);
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
line 243
;243:		VectorSubtract (point, self->s.origin, self->movedir);
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
line 244
;244:		VectorNormalize (self->movedir);
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 245
;245:	}
LABELV $130
line 248
;246:
;247:	// fire forward and see what we hit
;248:	VectorMA (self->s.origin, 2048, self->movedir, end);
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
line 250
;249:
;250:	trap_Trace( &tr, self->s.origin, NULL, NULL, end, self->s.number, CONTENTS_SOLID|CONTENTS_BODY|CONTENTS_CORPSE);
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
line 252
;251:
;252:	if ( tr.entityNum ) {
ADDRLP4 24+52
INDIRI4
CNSTI4 0
EQI4 $142
line 254
;253:		// hurt it if we can
;254:		G_Damage ( &g_entities[tr.entityNum], self, self->activator, self->movedir, 
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
line 256
;255:			tr.endpos, self->damage, DAMAGE_NO_KNOCKBACK, MOD_TARGET_LASER);
;256:	}
LABELV $142
line 258
;257:
;258:	VectorCopy (tr.endpos, self->s.origin2);
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 24+12
INDIRB
ASGNB 12
line 260
;259:
;260:	trap_LinkEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 261
;261:	self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 262
;262:}
LABELV $129
endproc target_laser_think 120 32
export target_laser_on
proc target_laser_on 4 4
line 265
;263:
;264:void target_laser_on (gentity_t *self)
;265:{
line 266
;266:	if (!self->activator)
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $150
line 267
;267:		self->activator = self;
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
LABELV $150
line 268
;268:	target_laser_think (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_think
CALLV
pop
line 269
;269:}
LABELV $149
endproc target_laser_on 4 4
export target_laser_off
proc target_laser_off 0 4
line 272
;270:
;271:void target_laser_off (gentity_t *self)
;272:{
line 273
;273:	trap_UnlinkEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 274
;274:	self->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 0
ASGNI4
line 275
;275:}
LABELV $152
endproc target_laser_off 0 4
export target_laser_use
proc target_laser_use 0 4
line 278
;276:
;277:void target_laser_use (gentity_t *self, gentity_t *other, gentity_t *activator)
;278:{
line 279
;279:	self->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 280
;280:	if ( self->nextthink > 0 )
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRI4
CNSTI4 0
LEI4 $154
line 281
;281:		target_laser_off (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_off
CALLV
pop
ADDRGP4 $155
JUMPV
LABELV $154
line 283
;282:	else
;283:		target_laser_on (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_on
CALLV
pop
LABELV $155
line 284
;284:}
LABELV $153
endproc target_laser_use 0 4
export target_laser_start
proc target_laser_start 16 16
line 287
;285:
;286:void target_laser_start (gentity_t *self)
;287:{
line 290
;288:	gentity_t *ent;
;289:
;290:	self->s.eType = ET_BEAM;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 5
ASGNI4
line 292
;291:
;292:	if (self->target) {
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $157
line 293
;293:		ent = G_Find (NULL, FOFS(targetname), self->target);
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
line 294
;294:		if (!ent) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $159
line 295
;295:			G_Printf ("%s at %s: %s is a bad target\n", self->classname, vtos(self->s.origin), self->target);
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $161
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
line 296
;296:		}
LABELV $159
line 297
;297:		self->enemy = ent;
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 298
;298:	} else {
ADDRGP4 $158
JUMPV
LABELV $157
line 299
;299:		G_SetMovedir (self->s.angles, self->movedir);
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
line 300
;300:	}
LABELV $158
line 302
;301:
;302:	self->use = target_laser_use;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 target_laser_use
ASGNP4
line 303
;303:	self->think = target_laser_think;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 target_laser_think
ASGNP4
line 305
;304:
;305:	if ( !self->damage ) {
ADDRFP4 0
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
CNSTI4 0
NEI4 $162
line 306
;306:		self->damage = 1;
ADDRFP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 1
ASGNI4
line 307
;307:	}
LABELV $162
line 309
;308:
;309:	if (self->spawnflags & 1)
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $164
line 310
;310:		target_laser_on (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_on
CALLV
pop
ADDRGP4 $165
JUMPV
LABELV $164
line 312
;311:	else
;312:		target_laser_off (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_off
CALLV
pop
LABELV $165
line 313
;313:}
LABELV $156
endproc target_laser_start 16 16
export SP_target_laser
proc SP_target_laser 0 0
line 316
;314:
;315:void SP_target_laser (gentity_t *self)
;316:{
line 318
;317:	// let everything else get spawned before we start firing
;318:	self->think = target_laser_start;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 target_laser_start
ASGNP4
line 319
;319:	self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 320
;320:}
LABELV $166
endproc SP_target_laser 0 0
export target_teleporter_use
proc target_teleporter_use 12 12
line 325
;321:
;322:
;323://==========================================================
;324:
;325:void target_teleporter_use( gentity_t *self, gentity_t *other, gentity_t *activator ) {
line 328
;326:	gentity_t	*dest;
;327:
;328:	if (!activator->client)
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $169
line 329
;329:		return;
ADDRGP4 $168
JUMPV
LABELV $169
line 330
;330:	dest = 	G_PickTarget( self->target );
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
line 331
;331:	if (!dest) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $171
line 332
;332:		G_Printf ("Couldn't find teleporter destination\n");
ADDRGP4 $173
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 333
;333:		return;
ADDRGP4 $168
JUMPV
LABELV $171
line 336
;334:	}
;335:
;336:	TeleportPlayer( activator, dest->s.origin, dest->s.angles );
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
line 337
;337:}
LABELV $168
endproc target_teleporter_use 12 12
export SP_target_teleporter
proc SP_target_teleporter 4 12
line 342
;338:
;339:/*QUAKED target_teleporter (1 0 0) (-8 -8 -8) (8 8 8)
;340:The activator will be teleported away.
;341:*/
;342:void SP_target_teleporter( gentity_t *self ) {
line 343
;343:	if (!self->targetname)
ADDRFP4 0
INDIRP4
CNSTI4 660
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $175
line 344
;344:		G_Printf("untargeted %s at %s\n", self->classname, vtos(self->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $177
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
LABELV $175
line 346
;345:
;346:	self->use = target_teleporter_use;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 target_teleporter_use
ASGNP4
line 347
;347:}
LABELV $174
endproc SP_target_teleporter 4 12
export target_relay_use
proc target_relay_use 36 12
line 357
;348:
;349://==========================================================
;350:
;351:
;352:/*QUAKED target_relay (.5 .5 .5) (-8 -8 -8) (8 8 8) RED_ONLY BLUE_ONLY RANDOM
;353:This doesn't perform any actions except fire its targets.
;354:The activator can be forced to be from a certain team.
;355:if RANDOM is checked, only one of the targets will be fired, not all of them
;356:*/
;357:void target_relay_use (gentity_t *self, gentity_t *other, gentity_t *activator) {
line 358
;358:	if ( ( self->spawnflags & 1 ) && activator->client 
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
EQI4 $179
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
EQU4 $179
ADDRLP4 4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $179
line 359
;359:		&& activator->client->sess.sessionTeam != TEAM_RED ) {
line 360
;360:		return;
ADDRGP4 $178
JUMPV
LABELV $179
line 362
;361:	}
;362:	if ( ( self->spawnflags & 2 ) && activator->client 
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
EQI4 $181
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
EQU4 $181
ADDRLP4 12
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $181
line 363
;363:		&& activator->client->sess.sessionTeam != TEAM_BLUE ) {
line 364
;364:		return;
ADDRGP4 $178
JUMPV
LABELV $181
line 366
;365:	}
;366:	if ( self->spawnflags & 4 ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $183
line 369
;367:		gentity_t	*ent;
;368:
;369:		ent = G_PickTarget( self->target );
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
line 370
;370:		if ( ent && ent->use ) {
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
EQU4 $178
ADDRLP4 24
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $178
line 371
;371:			ent->use( ent, self, activator );
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
line 372
;372:		}
line 373
;373:		return;
ADDRGP4 $178
JUMPV
LABELV $183
line 375
;374:	}
;375:	G_UseTargets (self, activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 376
;376:}
LABELV $178
endproc target_relay_use 36 12
export SP_target_relay
proc SP_target_relay 0 0
line 378
;377:
;378:void SP_target_relay (gentity_t *self) {
line 379
;379:	self->use = target_relay_use;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 target_relay_use
ASGNP4
line 380
;380:}
LABELV $187
endproc SP_target_relay 0 0
export target_kill_use
proc target_kill_use 8 32
line 388
;381:
;382:
;383://==========================================================
;384:
;385:/*QUAKED target_kill (.5 .5 .5) (-8 -8 -8) (8 8 8)
;386:Kills the activator.
;387:*/
;388:void target_kill_use( gentity_t *self, gentity_t *other, gentity_t *activator ) {
line 389
;389:	G_Damage ( activator, NULL, NULL, NULL, NULL, 100000, DAMAGE_NO_PROTECTION, MOD_TELEFRAG);
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
line 390
;390:}
LABELV $188
endproc target_kill_use 8 32
export SP_target_kill
proc SP_target_kill 0 0
line 392
;391:
;392:void SP_target_kill( gentity_t *self ) {
line 393
;393:	self->use = target_kill_use;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 target_kill_use
ASGNP4
line 394
;394:}
LABELV $189
endproc SP_target_kill 0 0
export SP_target_position
proc SP_target_position 4 8
line 399
;395:
;396:/*QUAKED target_position (0 0.5 0) (-4 -4 -4) (4 4 4)
;397:Used as a positional target for in-game calculation, like jumppad targets.
;398:*/
;399:void SP_target_position( gentity_t *self ){
line 400
;400:	G_SetOrigin( self, self->s.origin );
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
line 401
;401:}
LABELV $190
endproc SP_target_position 4 8
proc target_location_linkup 16 8
line 404
;402:
;403:static void target_location_linkup(gentity_t *ent)
;404:{
line 408
;405:	int i;
;406:	int n;
;407:
;408:	if (level.locationLinked) 
ADDRGP4 level+9180
INDIRI4
CNSTI4 0
EQI4 $192
line 409
;409:		return;
ADDRGP4 $191
JUMPV
LABELV $192
line 411
;410:
;411:	level.locationLinked = qtrue;
ADDRGP4 level+9180
CNSTI4 1
ASGNI4
line 413
;412:
;413:	level.locationHead = NULL;
ADDRGP4 level+9184
CNSTP4 0
ASGNP4
line 415
;414:
;415:	trap_SetConfigstring( CS_LOCATIONS, "unknown" );
CNSTI4 608
ARGI4
ADDRGP4 $197
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 417
;416:
;417:	for (i = 0, ent = g_entities, n = 1;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 0
ADDRGP4 g_entities
ASGNP4
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $201
JUMPV
LABELV $198
line 419
;418:			i < level.num_entities;
;419:			i++, ent++) {
line 420
;420:		if (ent->classname && !Q_stricmp(ent->classname, "target_location")) {
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
EQU4 $203
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $205
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $203
line 422
;421:			// lets overload some variables!
;422:			ent->health = n; // use for location marking
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 423
;423:			trap_SetConfigstring( CS_LOCATIONS + n, ent->message );
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
line 424
;424:			n++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 425
;425:			ent->nextTrain = level.locationHead;
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
ADDRGP4 level+9184
INDIRP4
ASGNP4
line 426
;426:			level.locationHead = ent;
ADDRGP4 level+9184
ADDRFP4 0
INDIRP4
ASGNP4
line 427
;427:		}
LABELV $203
line 428
;428:	}
LABELV $199
line 419
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
LABELV $201
line 418
ADDRLP4 0
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $198
line 431
;429:
;430:	// All linked together now
;431:}
LABELV $191
endproc target_location_linkup 16 8
export SP_target_location
proc SP_target_location 4 8
line 441
;432:
;433:/*QUAKED target_location (0 0.5 0) (-8 -8 -8) (8 8 8)
;434:Set "message" to the name of this location.
;435:Set "count" to 0-7 for color.
;436:0:white 1:red 2:green 3:yellow 4:blue 5:cyan 6:magenta 7:white
;437:
;438:Closest target_location in sight used for the location, if none
;439:in site, closest in distance
;440:*/
;441:void SP_target_location( gentity_t *self ){
line 442
;442:	self->think = target_location_linkup;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 target_location_linkup
ASGNP4
line 443
;443:	self->nextthink = level.time + 200;  // Let them all spawn first
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 445
;444:
;445:	G_SetOrigin( self, self->s.origin );
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
line 446
;446:}
LABELV $208
endproc SP_target_location 4 8
export GravityResetCheck
proc GravityResetCheck 96 28
line 476
;447:
;448:/*QUAKED target_gravity_change (1 0 0) (-4 -4 -4) (4 4 4) GLOBAL
;449:
;450: GLOBAL - Apply to the entire world, and not just the activator
;451: 
;452: "gravity" -	 Normal = 800, valid range: >= 0
;453: "surfaceFlag" - Important setting. With this you can define on what surface the gravity_change will work.
;454: As soon as the player hits another surface, the gravity_change will be stopped. 
;455: Don't change the surface too close below, since this check will go down!
;456: The gravity_change also stops at player-respawn. Possible values:
;457: CONTENTS_NODROP		0 -> Recommended and default value, since lower-gravity will make things float anyway.
;458: CONTENTS_SOLID			1
;459: CONTENTS_LAVA			2
;460: CONTENTS_SLIME			3
;461: CONTENTS_WATER			4
;462: CONTENTS_FOG			5
;463: CONTENTS_DETAIL		6 -> Can easily be set in Radiant, so also quite easy.
;464: CONTENTS_STRUCTURAL	7 -> " " (also recommended as grav-surface, so something else can be set as detail (to reset))
;465: CONTENTS_TRANSLUCENT	8
;466: SURF_METALSTEPS		9
;467: SURF_NOSTEPS			10
;468: SURF_NOMARKS			11
;469: SURF_NOIMPACT			12
;470: SURF_SKY				13
;471: SURF_NODAMAGE			14
;472:
;473: Note: You have to make the ceiling of your anti-grav room a CONTENTS_SOLID, CONTENTS_PLAYERCLIP, a SURF_SKY, or a SURF_NOIMPACT.
;474: */
;475:void GravityResetCheck( gentity_t *self, gentity_t *activator )
;476:{ //-Vincent
line 480
;477:vec3_t  end;
;478:trace_t tr;
;479:	
;480:	if( !activator || !activator->client )
ADDRLP4 68
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 72
CNSTU4 0
ASGNU4
ADDRLP4 68
INDIRP4
CVPU4 4
ADDRLP4 72
INDIRU4
EQU4 $213
ADDRLP4 68
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 72
INDIRU4
NEU4 $211
LABELV $213
line 481
;481:	{ // The activator might be dead
line 482
;482:		activator->r.svFlags &= ~SVF_CUSTOM_GRAVITY;
ADDRLP4 76
ADDRFP4 4
INDIRP4
CNSTI4 432
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
line 483
;483:		return; 
ADDRGP4 $210
JUMPV
LABELV $211
line 487
;484:	}
;485:
;486:	// Trace up (in a straight line), until we hit a solid, playerclip, sky or noimpact content
;487:	VectorCopy( activator->s.origin, end );
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 488
;488:	end[2] += 1000;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1148846080
ADDF4
ASGNF4
line 489
;489:	trap_Trace( &tr, activator->s.origin, NULL, NULL, end, activator->s.number, 
ADDRLP4 12
ARGP4
ADDRLP4 76
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 80
CNSTP4 0
ASGNP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 76
INDIRP4
INDIRI4
ARGI4
CNSTI4 65557
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 492
;490:			    CONTENTS_SOLID | CONTENTS_PLAYERCLIP | SURF_NOIMPACT | SURF_SKY );
;491:	// Trace back down (in a straight line), trying to hit the required content
;492:	VectorCopy( tr.endpos, end );
ADDRLP4 0
ADDRLP4 12+12
INDIRB
ASGNB 12
line 493
;493:	trap_Trace( &tr, end,  NULL, NULL, activator->s.origin, activator->s.number, self->surfaceFlag );
ADDRLP4 12
ARGP4
ADDRLP4 0
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
ADDRLP4 88
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 88
INDIRP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 495
;494:
;495:	if( tr.fraction <= 0 ) // The surface has not been found
ADDRLP4 12+8
INDIRF4
CNSTF4 0
GTF4 $216
line 496
;496:		activator->r.svFlags &= ~SVF_CUSTOM_GRAVITY;
ADDRLP4 92
ADDRFP4 4
INDIRP4
CNSTI4 432
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
LABELV $216
line 497
;497:}
LABELV $210
endproc GravityResetCheck 96 28
export target_gravity_change
proc target_gravity_change 12 8
line 500
;498:
;499:void target_gravity_change( gentity_t *self )
;500:{ //-Vincent
line 501
;501:if(		 self->surfaceFlag == 1 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 1
NEI4 $220
line 502
;502:		 self->surfaceFlag = CONTENTS_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $221
JUMPV
LABELV $220
line 503
;503:else if( self->surfaceFlag == 2 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 2
NEI4 $222
line 504
;504:		 self->surfaceFlag = CONTENTS_LAVA;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 8
ASGNI4
ADDRGP4 $223
JUMPV
LABELV $222
line 505
;505:else if( self->surfaceFlag == 3 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 3
NEI4 $224
line 506
;506:		 self->surfaceFlag = CONTENTS_SLIME;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 16
ASGNI4
ADDRGP4 $225
JUMPV
LABELV $224
line 507
;507:else if( self->surfaceFlag == 4 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 4
NEI4 $226
line 508
;508:		 self->surfaceFlag = CONTENTS_WATER;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 32
ASGNI4
ADDRGP4 $227
JUMPV
LABELV $226
line 509
;509:else if( self->surfaceFlag == 5 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 5
NEI4 $228
line 510
;510:		 self->surfaceFlag = CONTENTS_FOG;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 64
ASGNI4
ADDRGP4 $229
JUMPV
LABELV $228
line 511
;511:else if( self->surfaceFlag == 6 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 6
NEI4 $230
line 512
;512:		 self->surfaceFlag = CONTENTS_DETAIL;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 134217728
ASGNI4
ADDRGP4 $231
JUMPV
LABELV $230
line 513
;513:else if( self->surfaceFlag == 7 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 7
NEI4 $232
line 514
;514:		 self->surfaceFlag = CONTENTS_STRUCTURAL;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 268435456
ASGNI4
ADDRGP4 $233
JUMPV
LABELV $232
line 515
;515:else if( self->surfaceFlag == 8 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 8
NEI4 $234
line 516
;516:		 self->surfaceFlag = CONTENTS_TRANSLUCENT;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 536870912
ASGNI4
ADDRGP4 $235
JUMPV
LABELV $234
line 517
;517:else if( self->surfaceFlag == 9 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 9
NEI4 $236
line 518
;518:		 self->surfaceFlag = SURF_METALSTEPS;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 4096
ASGNI4
ADDRGP4 $237
JUMPV
LABELV $236
line 519
;519:else if( self->surfaceFlag == 10 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 10
NEI4 $238
line 520
;520:		 self->surfaceFlag = SURF_NOSTEPS;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 8192
ASGNI4
ADDRGP4 $239
JUMPV
LABELV $238
line 521
;521:else if( self->surfaceFlag == 11 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 11
NEI4 $240
line 522
;522:		 self->surfaceFlag = SURF_NOMARKS;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 32
ASGNI4
ADDRGP4 $241
JUMPV
LABELV $240
line 523
;523:else if( self->surfaceFlag == 12 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 12
NEI4 $242
line 524
;524:		 self->surfaceFlag = SURF_NOIMPACT;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 16
ASGNI4
ADDRGP4 $243
JUMPV
LABELV $242
line 525
;525:else if( self->surfaceFlag == 13 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 13
NEI4 $244
line 526
;526:		 self->surfaceFlag = SURF_SKY;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 4
ASGNI4
ADDRGP4 $245
JUMPV
LABELV $244
line 527
;527:else if( self->surfaceFlag == 14 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 14
NEI4 $246
line 528
;528:		 self->surfaceFlag = SURF_NODAMAGE;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $247
JUMPV
LABELV $246
line 530
;529:else // surfaceFlag == 0, default
;530:		 self->surfaceFlag = CONTENTS_NODROP;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTU4 2147483648
CVUI4 4
ASGNI4
LABELV $247
LABELV $245
LABELV $243
LABELV $241
LABELV $239
LABELV $237
LABELV $235
LABELV $233
LABELV $231
LABELV $229
LABELV $227
LABELV $225
LABELV $223
LABELV $221
line 532
;531:
;532:	if( self->spawnflags & 1 )
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $248
line 533
;533:	{ // Global setting
line 534
;534:		trap_Cvar_Set( "g_gravity", va( "%f", self->gravity ) );
ADDRGP4 $251
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
ADDRGP4 $250
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 535
;535:	}
ADDRGP4 $249
JUMPV
LABELV $248
line 536
;536:	else if( self->activator->client )
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
EQU4 $252
line 537
;537:	{
line 538
;538:		int	gravity = floor( self->gravity );
ADDRFP4 0
INDIRP4
CNSTI4 684
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 floor
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 539
;539:		self->activator->client->ps.gravity = gravity;
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
ADDRLP4 0
INDIRI4
ASGNI4
line 540
;540:		self->activator->r.svFlags |= SVF_CUSTOM_GRAVITY;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRP4
CNSTI4 432
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 541
;541:	}
LABELV $252
LABELV $249
line 543
;542:	
;543:	GravityResetCheck( self, self->activator );
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
ADDRGP4 GravityResetCheck
CALLV
pop
line 544
;544:	if( !( self->activator->r.svFlags & SVF_CUSTOM_GRAVITY ) )
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $254
line 545
;545:	{ // Stop doing this gravity_change (reset happens in ClientThink_Real )
line 546
;546:		self->think		= 0;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTP4 0
ASGNP4
line 547
;547:		self->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 0
ASGNI4
line 548
;548:	}
LABELV $254
line 549
;549:}
LABELV $219
endproc target_gravity_change 12 8
export target_gravity_change_use
proc target_gravity_change_use 0 0
line 552
;550:
;551:void target_gravity_change_use( gentity_t *self, gentity_t *other, gentity_t *activator )
;552:{ //-Vincent
line 553
;553:self->activator = activator; // Pass it on
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 554
;554:self->think		= target_gravity_change;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 target_gravity_change
ASGNP4
line 555
;555:self->nextthink = level.time + FRAMETIME;  // Let everything get spawned
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 556
;556:}
LABELV $256
endproc target_gravity_change_use 0 0
export SP_target_gravity_change
proc SP_target_gravity_change 4 8
line 559
;557:
;558:void SP_target_gravity_change( gentity_t *self )
;559:{ //-Vincent
line 560
;560:G_SetOrigin( self, self->s.origin );
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
line 561
;561:self->use = target_gravity_change_use;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 target_gravity_change_use
ASGNP4
line 562
;562:}
LABELV $258
endproc SP_target_gravity_change 4 8
export SpeedResetCheck
proc SpeedResetCheck 96 28
line 593
;563:
;564:
;565:/*QUAKED target_speed_change (1 0 0) (-4 -4 -4) (4 4 4) GLOBAL
;566:
;567: GLOBAL - Apply to the entire world, and not just the activator
;568: 
;569: "speed" - Normal = 320, valid range: > 0
;570: "surfaceFlag" - Important setting. With this you can define on what surface the speed_change will work.
;571: As soon as the player hits another surface, the speed_change will be stopped. 
;572: Don't change the surface too close below, since this check will go down!
;573: The speed_change also stops at player-respawn. Possible values:
;574: CONTENTS_STRUCTURAL	0 -> Recommended and default value, so something else can be set as detail (to reset)
;575: CONTENTS_DETAIL		1
;576: CONTENTS_LAVA			2
;577: CONTENTS_SLIME			3
;578: CONTENTS_WATER			4
;579: CONTENTS_FOG			5
;580: CONTENTS_NODROP		6
;581: CONTENTS_SOLID			7
;582: CONTENTS_TRANSLUCENT	8
;583: SURF_METALSTEPS		9
;584: SURF_NOSTEPS			10
;585: SURF_NOMARKS			11
;586: SURF_NOIMPACT			12
;587: SURF_SKY				13
;588: SURF_NODAMAGE			14
;589:
;590: Note: You have to make the ceiling of your anti-grav room a CONTENTS_SOLID, CONTENTS_PLAYERCLIP, a SURF_SKY, or a SURF_NOIMPACT.
;591: */
;592:void SpeedResetCheck( gentity_t *self, gentity_t *activator )
;593:{ //-Vincent
line 597
;594:vec3_t  end;
;595:trace_t tr;
;596:	
;597:	if( !activator || !activator->client )
ADDRLP4 68
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 72
CNSTU4 0
ASGNU4
ADDRLP4 68
INDIRP4
CVPU4 4
ADDRLP4 72
INDIRU4
EQU4 $262
ADDRLP4 68
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 72
INDIRU4
NEU4 $260
LABELV $262
line 598
;598:	{ // The activator might be dead
line 599
;599:		activator->r.svFlags &= ~SVF_CUSTOM_SPEED;
ADDRLP4 76
ADDRFP4 4
INDIRP4
CNSTI4 432
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 -8193
BANDI4
ASGNI4
line 600
;600:		return; 
ADDRGP4 $259
JUMPV
LABELV $260
line 604
;601:	}
;602:
;603:	// Trace up (in a straight line), until we hit a solid, playerclip, sky or noimpact content
;604:	VectorCopy( activator->s.origin, end );
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 605
;605:	end[2] += 1000;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1148846080
ADDF4
ASGNF4
line 606
;606:	trap_Trace( &tr, activator->s.origin, NULL, NULL, end, activator->s.number, 
ADDRLP4 12
ARGP4
ADDRLP4 76
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 80
CNSTP4 0
ASGNP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 76
INDIRP4
INDIRI4
ARGI4
CNSTI4 65557
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 609
;607:			    CONTENTS_SOLID | CONTENTS_PLAYERCLIP | SURF_NOIMPACT | SURF_SKY );
;608:	// Trace back down (in a straight line), trying to hit the required content
;609:	VectorCopy( tr.endpos, end );
ADDRLP4 0
ADDRLP4 12+12
INDIRB
ASGNB 12
line 610
;610:	trap_Trace( &tr, end,  NULL, NULL, activator->s.origin, activator->s.number, self->surfaceFlag );
ADDRLP4 12
ARGP4
ADDRLP4 0
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
ADDRLP4 88
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 88
INDIRP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 612
;611:
;612:	if( tr.fraction <= 0 ) // The surface has not been found
ADDRLP4 12+8
INDIRF4
CNSTF4 0
GTF4 $265
line 613
;613:		activator->r.svFlags &= ~SVF_CUSTOM_SPEED;
ADDRLP4 92
ADDRFP4 4
INDIRP4
CNSTI4 432
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 -8193
BANDI4
ASGNI4
LABELV $265
line 614
;614:}
LABELV $259
endproc SpeedResetCheck 96 28
export target_speed_change
proc target_speed_change 12 8
line 617
;615:
;616:void target_speed_change( gentity_t *self )
;617:{ //-Vincent
line 618
;618:if(		 self->surfaceFlag == 1 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 1
NEI4 $269
line 619
;619:		 self->surfaceFlag = CONTENTS_DETAIL;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 134217728
ASGNI4
ADDRGP4 $270
JUMPV
LABELV $269
line 620
;620:else if( self->surfaceFlag == 2 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 2
NEI4 $271
line 621
;621:		 self->surfaceFlag = CONTENTS_LAVA;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 8
ASGNI4
ADDRGP4 $272
JUMPV
LABELV $271
line 622
;622:else if( self->surfaceFlag == 3 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 3
NEI4 $273
line 623
;623:		 self->surfaceFlag = CONTENTS_SLIME;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 16
ASGNI4
ADDRGP4 $274
JUMPV
LABELV $273
line 624
;624:else if( self->surfaceFlag == 4 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 4
NEI4 $275
line 625
;625:		 self->surfaceFlag = CONTENTS_WATER;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 32
ASGNI4
ADDRGP4 $276
JUMPV
LABELV $275
line 626
;626:else if( self->surfaceFlag == 5 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 5
NEI4 $277
line 627
;627:		 self->surfaceFlag = CONTENTS_FOG;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 64
ASGNI4
ADDRGP4 $278
JUMPV
LABELV $277
line 628
;628:else if( self->surfaceFlag == 6 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 6
NEI4 $279
line 629
;629:		 self->surfaceFlag = CONTENTS_NODROP;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTU4 2147483648
CVUI4 4
ASGNI4
ADDRGP4 $280
JUMPV
LABELV $279
line 630
;630:else if( self->surfaceFlag == 7 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 7
NEI4 $281
line 631
;631:		 self->surfaceFlag = CONTENTS_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $282
JUMPV
LABELV $281
line 632
;632:else if( self->surfaceFlag == 8 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 8
NEI4 $283
line 633
;633:		 self->surfaceFlag = CONTENTS_TRANSLUCENT;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 536870912
ASGNI4
ADDRGP4 $284
JUMPV
LABELV $283
line 634
;634:else if( self->surfaceFlag == 9 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 9
NEI4 $285
line 635
;635:		 self->surfaceFlag = SURF_METALSTEPS;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 4096
ASGNI4
ADDRGP4 $286
JUMPV
LABELV $285
line 636
;636:else if( self->surfaceFlag == 10 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 10
NEI4 $287
line 637
;637:		 self->surfaceFlag = SURF_NOSTEPS;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 8192
ASGNI4
ADDRGP4 $288
JUMPV
LABELV $287
line 638
;638:else if( self->surfaceFlag == 11 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 11
NEI4 $289
line 639
;639:		 self->surfaceFlag = SURF_NOMARKS;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 32
ASGNI4
ADDRGP4 $290
JUMPV
LABELV $289
line 640
;640:else if( self->surfaceFlag == 12 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 12
NEI4 $291
line 641
;641:		 self->surfaceFlag = SURF_NOIMPACT;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 16
ASGNI4
ADDRGP4 $292
JUMPV
LABELV $291
line 642
;642:else if( self->surfaceFlag == 13 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 13
NEI4 $293
line 643
;643:		 self->surfaceFlag = SURF_SKY;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 4
ASGNI4
ADDRGP4 $294
JUMPV
LABELV $293
line 644
;644:else if( self->surfaceFlag == 14 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 14
NEI4 $295
line 645
;645:		 self->surfaceFlag = SURF_NODAMAGE;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $296
JUMPV
LABELV $295
line 647
;646:else // surfaceFlag == 0, default
;647:		 self->surfaceFlag = CONTENTS_STRUCTURAL;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 268435456
ASGNI4
LABELV $296
LABELV $294
LABELV $292
LABELV $290
LABELV $288
LABELV $286
LABELV $284
LABELV $282
LABELV $280
LABELV $278
LABELV $276
LABELV $274
LABELV $272
LABELV $270
line 649
;648:
;649:	if( self->spawnflags & 1 )
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $297
line 650
;650:	{ // Global setting
line 651
;651:		trap_Cvar_Set( "g_speed", va( "%f", self->speed ) );
ADDRGP4 $251
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
ADDRGP4 $299
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 652
;652:	}
ADDRGP4 $298
JUMPV
LABELV $297
line 653
;653:	else if( self->activator->client )
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
EQU4 $300
line 654
;654:	{
line 655
;655:		int	speed = floor( self->speed );
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 floor
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 656
;656:		self->activator->client->ps.speed = speed;
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
ADDRLP4 0
INDIRI4
ASGNI4
line 657
;657:		self->activator->r.svFlags |= SVF_CUSTOM_SPEED;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRP4
CNSTI4 432
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 658
;658:	}
LABELV $300
LABELV $298
line 660
;659:
;660:	SpeedResetCheck( self, self->activator );
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
ADDRGP4 SpeedResetCheck
CALLV
pop
line 661
;661:	if( !( self->activator->r.svFlags & SVF_CUSTOM_SPEED ) )
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
NEI4 $302
line 662
;662:	{ // Stop doing this speed_change (reset happens in ClientThink_Real )
line 663
;663:		self->think		= 0;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTP4 0
ASGNP4
line 664
;664:		self->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 0
ASGNI4
line 665
;665:	}
LABELV $302
line 666
;666:}
LABELV $268
endproc target_speed_change 12 8
export target_speed_change_use
proc target_speed_change_use 0 0
line 669
;667:
;668:void target_speed_change_use( gentity_t *self, gentity_t *other, gentity_t *activator )
;669:{ //-Vincent
line 670
;670:self->activator = activator; // Pass it on
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 671
;671:self->think		= target_speed_change;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 target_speed_change
ASGNP4
line 672
;672:self->nextthink = level.time + FRAMETIME;  // Let everything get spawned
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
LABELV $304
endproc target_speed_change_use 0 0
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
line 678
;678:self->use = target_speed_change_use;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 target_speed_change_use
ASGNP4
line 679
;679:}
LABELV $306
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
LABELV $299
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $251
byte 1 37
byte 1 102
byte 1 0
align 1
LABELV $250
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
LABELV $205
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
LABELV $197
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $177
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
LABELV $173
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
LABELV $161
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
LABELV $124
byte 1 37
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $123
byte 1 46
byte 1 119
byte 1 97
byte 1 118
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
