export P_DamageFeedback
code
proc P_DamageFeedback 36 12
file "../g_active.c"
line 17
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:#include "g_local.h"
;5:void Weapon_GrapplingHook_Fire (gentity_t *ent); // Shafe - Trep - Offhand Grapple
;6:
;7:/*
;8:===============
;9:G_DamageFeedback
;10:
;11:Called just before a snapshot is sent to the given player.
;12:Totals up all damage and generates both the player_state_t
;13:damage values to that client for pain blends and kicks, and
;14:global pain sound events for all clients.
;15:===============
;16:*/
;17:void P_DamageFeedback( gentity_t *player ) {
line 22
;18:	gclient_t	*client;
;19:	float	count;
;20:	vec3_t	angles;
;21:
;22:	client = player->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 23
;23:	if ( client->ps.pm_type == PM_DEAD ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $56
line 24
;24:		return;
ADDRGP4 $55
JUMPV
LABELV $56
line 28
;25:	}
;26:
;27:	// total points of damage shot at the player this frame
;28:	count = client->damage_blood + client->damage_armor;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 29
;29:	if ( count == 0 ) {
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $58
line 30
;30:		return;		// didn't take any damage
ADDRGP4 $55
JUMPV
LABELV $58
line 33
;31:	}
;32:
;33:	if ( count > 255 ) {
ADDRLP4 4
INDIRF4
CNSTF4 1132396544
LEF4 $60
line 34
;34:		count = 255;
ADDRLP4 4
CNSTF4 1132396544
ASGNF4
line 35
;35:	}
LABELV $60
line 41
;36:
;37:	// send the information to the client
;38:
;39:	// world damage (falling, slime, etc) uses a special code
;40:	// to make the blend blob centered instead of positional
;41:	if ( client->damage_fromWorld ) {
ADDRLP4 0
INDIRP4
CNSTI4 2576
ADDP4
INDIRI4
CNSTI4 0
EQI4 $62
line 42
;42:		client->ps.damagePitch = 255;
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
CNSTI4 255
ASGNI4
line 43
;43:		client->ps.damageYaw = 255;
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
CNSTI4 255
ASGNI4
line 45
;44:
;45:		client->damage_fromWorld = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 2576
ADDP4
CNSTI4 0
ASGNI4
line 46
;46:	} else {
ADDRGP4 $63
JUMPV
LABELV $62
line 47
;47:		vectoangles( client->damage_from, angles );
ADDRLP4 0
INDIRP4
CNSTI4 2564
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 48
;48:		client->ps.damagePitch = angles[PITCH]/360.0 * 256;
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
CNSTF4 1132462080
ADDRLP4 8
INDIRF4
CNSTF4 1135869952
DIVF4
MULF4
CVFI4 4
ASGNI4
line 49
;49:		client->ps.damageYaw = angles[YAW]/360.0 * 256;
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
CNSTF4 1132462080
ADDRLP4 8+4
INDIRF4
CNSTF4 1135869952
DIVF4
MULF4
CVFI4 4
ASGNI4
line 50
;50:	}
LABELV $63
line 53
;51:
;52:	// play an apropriate pain sound
;53:	if ( (level.time > player->pain_debounce_time) && !(player->flags & FL_GODMODE) ) {
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
LEI4 $65
ADDRLP4 24
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $65
line 54
;54:		player->pain_debounce_time = level.time + 700;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 700
ADDI4
ASGNI4
line 55
;55:		G_AddEvent( player, EV_PAIN, player->health );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
CNSTI4 58
ARGI4
ADDRLP4 28
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 56
;56:		client->ps.damageEvent++;
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 57
;57:	}
LABELV $65
line 60
;58:
;59:
;60:	client->ps.damageCount = count;
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 65
;61:
;62:	//
;63:	// clear totals
;64:	//
;65:	client->damage_blood = 0;
ADDRLP4 0
INDIRP4
CNSTI4 2556
ADDP4
CNSTI4 0
ASGNI4
line 66
;66:	client->damage_armor = 0;
ADDRLP4 0
INDIRP4
CNSTI4 2552
ADDP4
CNSTI4 0
ASGNI4
line 67
;67:	client->damage_knockback = 0;
ADDRLP4 0
INDIRP4
CNSTI4 2560
ADDP4
CNSTI4 0
ASGNI4
line 68
;68:}
LABELV $55
endproc P_DamageFeedback 36 12
export P_WorldEffects
proc P_WorldEffects 40 32
line 79
;69:
;70:
;71:
;72:/*
;73:=============
;74:P_WorldEffects
;75:
;76:Check for lava / slime contents and drowning
;77:=============
;78:*/
;79:void P_WorldEffects( gentity_t *ent ) {
line 83
;80:	qboolean	envirosuit;
;81:	int			waterlevel;
;82:
;83:	if ( ent->client->noclip ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2524
ADDP4
INDIRI4
CNSTI4 0
EQI4 $70
line 84
;84:		ent->client->airOutTime = level.time + 12000;	// don't need air
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2620
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 85
;85:		return;
ADDRGP4 $69
JUMPV
LABELV $70
line 88
;86:	}
;87:
;88:	waterlevel = ent->waterlevel;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRI4
ASGNI4
line 90
;89:
;90:	envirosuit = ent->client->ps.powerups[PW_BATTLESUIT] > level.time;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 320
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $75
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $76
JUMPV
LABELV $75
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $76
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 95
;91:
;92:	//
;93:	// check for drowning
;94:	//
;95:	if ( waterlevel == 3 ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
NEI4 $77
line 97
;96:		// envirosuit give air
;97:		if ( envirosuit ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $79
line 98
;98:			ent->client->airOutTime = level.time + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2620
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 99
;99:		}
LABELV $79
line 102
;100:
;101:		// if out of air, start drowning
;102:		if ( ent->client->airOutTime < level.time) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2620
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $78
line 104
;103:			// drown!
;104:			ent->client->airOutTime += 1000;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2620
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 105
;105:			if ( ent->health > 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 0
LEI4 $78
line 107
;106:				// take more damage the longer underwater
;107:				ent->damage += 2;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 108
;108:				if (ent->damage > 15)
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 15
LEI4 $87
line 109
;109:					ent->damage = 15;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 15
ASGNI4
LABELV $87
line 112
;110:
;111:				// play a gurp sound instead of a normal pain sound
;112:				if (ent->health <= ent->damage) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
GTI4 $89
line 113
;113:					G_Sound(ent, CHAN_VOICE, G_SoundIndex("*drown.wav"));
ADDRGP4 $91
ARGP4
ADDRLP4 24
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 114
;114:				} else if (rand()&1) {
ADDRGP4 $90
JUMPV
LABELV $89
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $92
line 115
;115:					G_Sound(ent, CHAN_VOICE, G_SoundIndex("sound/player/gurp1.wav"));
ADDRGP4 $94
ARGP4
ADDRLP4 28
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 116
;116:				} else {
ADDRGP4 $93
JUMPV
LABELV $92
line 117
;117:					G_Sound(ent, CHAN_VOICE, G_SoundIndex("sound/player/gurp2.wav"));
ADDRGP4 $95
ARGP4
ADDRLP4 28
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 118
;118:				}
LABELV $93
LABELV $90
line 121
;119:
;120:				// don't play a normal pain sound
;121:				ent->pain_debounce_time = level.time + 200;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 123
;122:
;123:				G_Damage (ent, NULL, NULL, NULL, NULL, 
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
CNSTP4 0
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 36
CNSTP4 0
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
CNSTI4 14
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 125
;124:					ent->damage, DAMAGE_NO_ARMOR, MOD_WATER);
;125:			}
line 126
;126:		}
line 127
;127:	} else {
ADDRGP4 $78
JUMPV
LABELV $77
line 128
;128:		ent->client->airOutTime = level.time + 12000;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2620
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 129
;129:		ent->damage = 2;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 2
ASGNI4
line 130
;130:	}
LABELV $78
line 135
;131:
;132:	//
;133:	// check for sizzle damage (move to pmove?)
;134:	//
;135:	if (waterlevel && 
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $98
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 24
BANDI4
ADDRLP4 12
INDIRI4
EQI4 $98
line 136
;136:		(ent->watertype&(CONTENTS_LAVA|CONTENTS_SLIME)) ) {
line 137
;137:		if (ent->health > 0
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 0
LEI4 $100
ADDRLP4 16
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GTI4 $100
line 138
;138:			&& ent->pain_debounce_time <= level.time	) {
line 140
;139:
;140:			if ( envirosuit ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $103
line 141
;141:				G_AddEvent( ent, EV_POWERUP_BATTLESUIT, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 142
;142:			} else {
ADDRGP4 $104
JUMPV
LABELV $103
line 143
;143:				if (ent->watertype & CONTENTS_LAVA) {
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $105
line 144
;144:					G_Damage (ent, NULL, NULL, NULL, NULL, 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
CNSTP4 0
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
CNSTP4 0
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 30
ADDRLP4 0
INDIRI4
MULI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 146
;145:						30*waterlevel, 0, MOD_LAVA);
;146:				}
LABELV $105
line 148
;147:
;148:				if (ent->watertype & CONTENTS_SLIME) {
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $107
line 149
;149:					G_Damage (ent, NULL, NULL, NULL, NULL, 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
CNSTP4 0
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
CNSTP4 0
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 10
ADDRLP4 0
INDIRI4
MULI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 15
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 151
;150:						10*waterlevel, 0, MOD_SLIME);
;151:				}
LABELV $107
line 152
;152:			}
LABELV $104
line 153
;153:		}
LABELV $100
line 154
;154:	}
LABELV $98
line 155
;155:}
LABELV $69
endproc P_WorldEffects 40 32
export G_SetClientSound
proc G_SetClientSound 8 0
line 164
;156:
;157:
;158:
;159:/*
;160:===============
;161:G_SetClientSound
;162:===============
;163:*/
;164:void G_SetClientSound( gentity_t *ent ) {
line 171
;165:#ifdef MISSIONPACK
;166:	if( ent->s.eFlags & EF_TICKING ) {
;167:		ent->client->ps.loopSound = G_SoundIndex( "sound/weapons/proxmine/wstbtick.wav");
;168:	}
;169:	else
;170:#endif
;171:	if (ent->waterlevel && (ent->watertype&(CONTENTS_LAVA|CONTENTS_SLIME)) ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $110
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 24
BANDI4
ADDRLP4 4
INDIRI4
EQI4 $110
line 172
;172:		ent->client->ps.loopSound = level.snd_fry;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 444
ADDP4
ADDRGP4 level+352
INDIRI4
ASGNI4
line 173
;173:	} else {
ADDRGP4 $111
JUMPV
LABELV $110
line 174
;174:		ent->client->ps.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 444
ADDP4
CNSTI4 0
ASGNI4
line 175
;175:	}
LABELV $111
line 176
;176:}
LABELV $109
endproc G_SetClientSound 8 0
export ClientImpacts
proc ClientImpacts 76 12
line 187
;177:
;178:
;179:
;180://==============================================================
;181:
;182:/*
;183:==============
;184:ClientImpacts
;185:==============
;186:*/
;187:void ClientImpacts( gentity_t *ent, pmove_t *pm ) {
line 192
;188:	int		i, j;
;189:	trace_t	trace;
;190:	gentity_t	*other;
;191:
;192:	memset( &trace, 0, sizeof( trace ) );
ADDRLP4 12
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 memset
CALLP4
pop
line 193
;193:	for (i=0 ; i<pm->numtouch ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $117
JUMPV
LABELV $114
line 194
;194:		for (j=0 ; j<i ; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $121
JUMPV
LABELV $118
line 195
;195:			if (pm->touchents[j] == pm->touchents[i] ) {
ADDRLP4 68
CNSTI4 2
ASGNI4
ADDRLP4 72
ADDRFP4 4
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
ADDRLP4 0
INDIRI4
ADDRLP4 68
INDIRI4
LSHI4
ADDRLP4 72
INDIRP4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDRLP4 68
INDIRI4
LSHI4
ADDRLP4 72
INDIRP4
ADDP4
INDIRI4
NEI4 $122
line 196
;196:				break;
ADDRGP4 $120
JUMPV
LABELV $122
line 198
;197:			}
;198:		}
LABELV $119
line 194
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $121
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $118
LABELV $120
line 199
;199:		if (j != i) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $124
line 200
;200:			continue;	// duplicated
ADDRGP4 $115
JUMPV
LABELV $124
line 202
;201:		}
;202:		other = &g_entities[ pm->touchents[i] ];
ADDRLP4 8
CNSTI4 836
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 52
ADDP4
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 204
;203:
;204:		if ( ( ent->r.svFlags & SVF_BOT ) && ( ent->touch ) ) {
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $126
ADDRLP4 68
INDIRP4
CNSTI4 712
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $126
line 205
;205:			ent->touch( ent, other, &trace );
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 712
ADDP4
INDIRP4
CALLV
pop
line 206
;206:		}
LABELV $126
line 208
;207:
;208:		if ( !other->touch ) {
ADDRLP4 8
INDIRP4
CNSTI4 712
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $128
line 209
;209:			continue;
ADDRGP4 $115
JUMPV
LABELV $128
line 212
;210:		}
;211:
;212:		other->touch( other, ent, &trace );
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 712
ADDP4
INDIRP4
CALLV
pop
line 213
;213:	}
LABELV $115
line 193
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $117
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
LTI4 $114
line 215
;214:
;215:}
LABELV $113
endproc ClientImpacts 76 12
data
align 4
LABELV $131
byte 4 1109393408
byte 4 1109393408
byte 4 1112539136
export G_TouchTriggers
code
proc G_TouchTriggers 4240 16
line 225
;216:
;217:/*
;218:============
;219:G_TouchTriggers
;220:
;221:Find all trigger entities that ent's current position touches.
;222:Spectators will only interact with teleporters.
;223:============
;224:*/
;225:void	G_TouchTriggers( gentity_t *ent ) {
line 233
;226:	int			i, num;
;227:	int			touch[MAX_GENTITIES];
;228:	gentity_t	*hit;
;229:	trace_t		trace;
;230:	vec3_t		mins, maxs;
;231:	static vec3_t	range = { 40, 40, 52 };
;232:
;233:	if ( !ent->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $132
line 234
;234:		return;
ADDRGP4 $130
JUMPV
LABELV $132
line 238
;235:	}
;236:
;237:	// dead clients don't activate triggers!
;238:	if ( ent->client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $134
line 239
;239:		return;
ADDRGP4 $130
JUMPV
LABELV $134
line 242
;240:	}
;241:
;242:	VectorSubtract( ent->client->ps.origin, range, mins );
ADDRLP4 4188
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRLP4 64
ADDRLP4 4188
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRGP4 $131
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 4188
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRGP4 $131+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64+8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRGP4 $131+8
INDIRF4
SUBF4
ASGNF4
line 243
;243:	VectorAdd( ent->client->ps.origin, range, maxs );
ADDRLP4 4192
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRLP4 76
ADDRLP4 4192
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRGP4 $131
INDIRF4
ADDF4
ASGNF4
ADDRLP4 76+4
ADDRLP4 4192
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRGP4 $131+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 76+8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRGP4 $131+8
INDIRF4
ADDF4
ASGNF4
line 245
;244:
;245:	num = trap_EntitiesInBox( mins, maxs, touch, MAX_GENTITIES );
ADDRLP4 64
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 92
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4196
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 88
ADDRLP4 4196
INDIRI4
ASGNI4
line 248
;246:
;247:	// can't use ent->absmin, because that has a one unit pad
;248:	VectorAdd( ent->client->ps.origin, ent->r.mins, mins );
ADDRLP4 4200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4204
ADDRLP4 4200
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRLP4 64
ADDRLP4 4204
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 4200
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 4204
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 4200
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4208
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64+8
ADDRLP4 4208
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 4208
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ADDF4
ASGNF4
line 249
;249:	VectorAdd( ent->client->ps.origin, ent->r.maxs, maxs );
ADDRLP4 4212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4216
ADDRLP4 4212
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRLP4 76
ADDRLP4 4216
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 4212
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 76+4
ADDRLP4 4216
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 4212
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76+8
ADDRLP4 4220
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 4220
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDF4
ASGNF4
line 251
;250:
;251:	for ( i=0 ; i<num ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $151
JUMPV
LABELV $148
line 252
;252:		hit = &g_entities[touch[i]];
ADDRLP4 0
CNSTI4 836
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 92
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 254
;253:
;254:		if ( !hit->touch && !ent->touch ) {
ADDRLP4 4224
CNSTI4 712
ASGNI4
ADDRLP4 4228
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
ADDRLP4 4224
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4228
INDIRU4
NEU4 $152
ADDRFP4 0
INDIRP4
ADDRLP4 4224
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4228
INDIRU4
NEU4 $152
line 255
;255:			continue;
ADDRGP4 $149
JUMPV
LABELV $152
line 257
;256:		}
;257:		if ( !( hit->r.contents & CONTENTS_TRIGGER ) ) {
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
CNSTI4 1073741824
BANDI4
CNSTI4 0
NEI4 $154
line 258
;258:			continue;
ADDRGP4 $149
JUMPV
LABELV $154
line 262
;259:		}
;260:
;261:		// ignore most entities if a spectator
;262:		if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 3
NEI4 $156
line 263
;263:			if ( hit->s.eType != ET_TELEPORT_TRIGGER &&
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 9
EQI4 $158
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 Touch_DoorTrigger
CVPU4 4
EQU4 $158
line 266
;264:				// this is ugly but adding a new ET_? type will
;265:				// most likely cause network incompatibilities
;266:				hit->touch != Touch_DoorTrigger) {
line 267
;267:				continue;
ADDRGP4 $149
JUMPV
LABELV $158
line 269
;268:			}
;269:		}
LABELV $156
line 273
;270:
;271:		// use seperate code for determining if an item is picked up
;272:		// so you don't have to actually contact its bounding box
;273:		if ( hit->s.eType == ET_ITEM ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $160
line 274
;274:			if ( !BG_PlayerTouchesItem( &ent->client->ps, &hit->s, level.time ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 4232
ADDRGP4 BG_PlayerTouchesItem
CALLI4
ASGNI4
ADDRLP4 4232
INDIRI4
CNSTI4 0
NEI4 $161
line 275
;275:				continue;
ADDRGP4 $149
JUMPV
line 277
;276:			}
;277:		} else {
LABELV $160
line 278
;278:			if ( !trap_EntityContact( mins, maxs, hit ) ) {
ADDRLP4 64
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4232
ADDRGP4 trap_EntityContact
CALLI4
ASGNI4
ADDRLP4 4232
INDIRI4
CNSTI4 0
NEI4 $165
line 279
;279:				continue;
ADDRGP4 $149
JUMPV
LABELV $165
line 281
;280:			}
;281:		}
LABELV $161
line 283
;282:
;283:		memset( &trace, 0, sizeof(trace) );
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 memset
CALLP4
pop
line 285
;284:
;285:		if ( hit->touch ) {
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $167
line 286
;286:			hit->touch (hit, ent, &trace);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRP4
CALLV
pop
line 287
;287:		}
LABELV $167
line 289
;288:
;289:		if ( ( ent->r.svFlags & SVF_BOT ) && ( ent->touch ) ) {
ADDRLP4 4232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4232
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $169
ADDRLP4 4232
INDIRP4
CNSTI4 712
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $169
line 290
;290:			ent->touch( ent, hit, &trace );
ADDRLP4 4236
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4236
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 4236
INDIRP4
CNSTI4 712
ADDP4
INDIRP4
CALLV
pop
line 291
;291:		}
LABELV $169
line 292
;292:	}
LABELV $149
line 251
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $151
ADDRLP4 4
INDIRI4
ADDRLP4 88
INDIRI4
LTI4 $148
line 295
;293:
;294:	// if we didn't touch a jump pad this pmove frame
;295:	if ( ent->client->ps.jumppad_frame != ent->client->ps.pmove_framecount ) {
ADDRLP4 4224
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4224
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
ADDRLP4 4224
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
EQI4 $171
line 296
;296:		ent->client->ps.jumppad_frame = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 297
;297:		ent->client->ps.jumppad_ent = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 448
ADDP4
CNSTI4 0
ASGNI4
line 298
;298:	}
LABELV $171
line 299
;299:}
LABELV $130
endproc G_TouchTriggers 4240 16
export SpectatorThink
proc SpectatorThink 252 12
line 306
;300:
;301:/*
;302:=================
;303:SpectatorThink
;304:=================
;305:*/
;306:void SpectatorThink( gentity_t *ent, usercmd_t *ucmd ) {
line 310
;307:	pmove_t	pm;
;308:	gclient_t	*client;
;309:
;310:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 312
;311:
;312:	if ( client->sess.spectatorState != SPECTATOR_FOLLOW ) {
ADDRLP4 0
INDIRP4
CNSTI4 2500
ADDP4
INDIRI4
CNSTI4 2
EQI4 $174
line 313
;313:		client->ps.pm_type = PM_SPECTATOR;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 314
;314:		client->ps.speed = 400;	// faster than normal
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 400
ASGNI4
line 317
;315:
;316:		// set up for pmove
;317:		memset (&pm, 0, sizeof(pm));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 232
ARGI4
ADDRGP4 memset
CALLP4
pop
line 318
;318:		pm.ps = &client->ps;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 319
;319:		pm.cmd = *ucmd;
ADDRLP4 4+4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 24
line 320
;320:		pm.tracemask = MASK_PLAYERSOLID & ~CONTENTS_BODY;	// spectators can fly through bodies
ADDRLP4 4+28
CNSTI4 65537
ASGNI4
line 321
;321:		pm.trace = trap_Trace;
ADDRLP4 4+224
ADDRGP4 trap_Trace
ASGNP4
line 322
;322:		pm.pointcontents = trap_PointContents;
ADDRLP4 4+228
ADDRGP4 trap_PointContents
ASGNP4
line 325
;323:
;324:		// perform a pmove
;325:		Pmove (&pm);
ADDRLP4 4
ARGP4
ADDRGP4 Pmove
CALLV
pop
line 327
;326:		// save results of pmove
;327:		VectorCopy( client->ps.origin, ent->s.origin );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 329
;328:
;329:		G_TouchTriggers( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_TouchTriggers
CALLV
pop
line 330
;330:		trap_UnlinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 331
;331:	}
LABELV $174
line 333
;332:
;333:	client->oldbuttons = client->buttons;
ADDRLP4 0
INDIRP4
CNSTI4 2532
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 2528
ADDP4
INDIRI4
ASGNI4
line 334
;334:	client->buttons = ucmd->buttons;
ADDRLP4 0
INDIRP4
CNSTI4 2528
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 337
;335:
;336:	// attack button cycles through spectators
;337:	if ( ( client->buttons & BUTTON_ATTACK ) && ! ( client->oldbuttons & BUTTON_ATTACK ) ) {
ADDRLP4 244
CNSTI4 1
ASGNI4
ADDRLP4 248
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 2528
ADDP4
INDIRI4
ADDRLP4 244
INDIRI4
BANDI4
ADDRLP4 248
INDIRI4
EQI4 $180
ADDRLP4 0
INDIRP4
CNSTI4 2532
ADDP4
INDIRI4
ADDRLP4 244
INDIRI4
BANDI4
ADDRLP4 248
INDIRI4
NEI4 $180
line 338
;338:		Cmd_FollowCycle_f( ent, 1 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
line 339
;339:	}
LABELV $180
line 340
;340:}
LABELV $173
endproc SpectatorThink 252 12
export ClientInactivityTimer
proc ClientInactivityTimer 12 8
line 351
;341:
;342:
;343:
;344:/*
;345:=================
;346:ClientInactivityTimer
;347:
;348:Returns qfalse if the client is dropped
;349:=================
;350:*/
;351:qboolean ClientInactivityTimer( gclient_t *client ) {
line 352
;352:	if ( ! g_inactivity.integer ) {
ADDRGP4 g_inactivity+12
INDIRI4
CNSTI4 0
NEI4 $183
line 355
;353:		// give everyone some time, so if the operator sets g_inactivity during
;354:		// gameplay, everyone isn't kicked
;355:		client->inactivityTime = level.time + 60 * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 2608
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 60000
ADDI4
ASGNI4
line 356
;356:		client->inactivityWarning = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 2612
ADDP4
CNSTI4 0
ASGNI4
line 357
;357:	} else if ( client->pers.cmd.forwardmove || 
ADDRGP4 $184
JUMPV
LABELV $183
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 493
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
NEI4 $191
ADDRLP4 0
INDIRP4
CNSTI4 494
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
NEI4 $191
ADDRLP4 0
INDIRP4
CNSTI4 495
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
NEI4 $191
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 4
INDIRI4
EQI4 $187
LABELV $191
line 360
;358:		client->pers.cmd.rightmove || 
;359:		client->pers.cmd.upmove ||
;360:		(client->pers.cmd.buttons & BUTTON_ATTACK) ) {
line 361
;361:		client->inactivityTime = level.time + g_inactivity.integer * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 2608
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDRGP4 g_inactivity+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 362
;362:		client->inactivityWarning = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 2612
ADDP4
CNSTI4 0
ASGNI4
line 363
;363:	} else if ( !client->pers.localClient ) {
ADDRGP4 $188
JUMPV
LABELV $187
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 0
NEI4 $194
line 364
;364:		if ( level.time > client->inactivityTime ) {
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 2608
ADDP4
INDIRI4
LEI4 $196
line 365
;365:			trap_DropClient( client - level.clients, "Dropped due to inactivity" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3392
DIVI4
ARGI4
ADDRGP4 $199
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
line 366
;366:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $182
JUMPV
LABELV $196
line 368
;367:		}
;368:		if ( level.time > client->inactivityTime - 10000 && !client->inactivityWarning ) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 2608
ADDP4
INDIRI4
CNSTI4 10000
SUBI4
LEI4 $200
ADDRLP4 8
INDIRP4
CNSTI4 2612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $200
line 369
;369:			client->inactivityWarning = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 2612
ADDP4
CNSTI4 1
ASGNI4
line 370
;370:			trap_SendServerCommand( client - level.clients, "cp \"Ten seconds until inactivity drop!\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3392
DIVI4
ARGI4
ADDRGP4 $203
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 371
;371:		}
LABELV $200
line 372
;372:	}
LABELV $194
LABELV $188
LABELV $184
line 373
;373:	return qtrue;
CNSTI4 1
RETI4
LABELV $182
endproc ClientInactivityTimer 12 8
export ClientTimerActions
proc ClientTimerActions 20 12
line 383
;374:}
;375:
;376:/*
;377:==================
;378:ClientTimerActions
;379:
;380:Actions that happen once a second
;381:==================
;382:*/
;383:void ClientTimerActions( gentity_t *ent, int msec ) {
line 389
;384:	gclient_t	*client;
;385:#ifdef MISSIONPACK
;386:	int			maxHealth;
;387:#endif
;388:
;389:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 390
;390:	client->timeResidual += msec;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 2644
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $206
JUMPV
LABELV $205
line 392
;391:
;392:	while ( client->timeResidual >= 1000 ) {
line 393
;393:		client->timeResidual -= 1000;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 2644
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1000
SUBI4
ASGNI4
line 421
;394:
;395:		// regenerate
;396:#ifdef MISSIONPACK
;397:		if( bg_itemlist[client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;398:			maxHealth = client->ps.stats[STAT_MAX_HEALTH] / 2;
;399:		}
;400:		else if ( client->ps.powerups[PW_REGEN] ) {
;401:			maxHealth = client->ps.stats[STAT_MAX_HEALTH];
;402:		}
;403:		else {
;404:			maxHealth = 0;
;405:		}
;406:		if( maxHealth ) {
;407:			if ( ent->health < maxHealth ) {
;408:				ent->health += 15;
;409:				if ( ent->health > maxHealth * 1.1 ) {
;410:					ent->health = maxHealth * 1.1;
;411:				}
;412:				G_AddEvent( ent, EV_POWERUP_REGEN, 0 );
;413:			} else if ( ent->health < maxHealth * 2) {
;414:				ent->health += 5;
;415:				if ( ent->health > maxHealth * 2 ) {
;416:					ent->health = maxHealth * 2;
;417:				}
;418:				G_AddEvent( ent, EV_POWERUP_REGEN, 0 );
;419:			}
;420:#else
;421:		if ( client->ps.powerups[PW_REGEN] ) {
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
INDIRI4
CNSTI4 0
EQI4 $208
line 422
;422:			if ( ent->health < client->ps.stats[STAT_MAX_HEALTH]) {
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
GEI4 $210
line 423
;423:				ent->health += 15;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 15
ADDI4
ASGNI4
line 424
;424:				if ( ent->health > client->ps.stats[STAT_MAX_HEALTH] * 1.1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1066192077
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CVIF4 4
MULF4
LEF4 $212
line 425
;425:					ent->health = client->ps.stats[STAT_MAX_HEALTH] * 1.1;
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTF4 1066192077
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 426
;426:				}
LABELV $212
line 427
;427:				G_AddEvent( ent, EV_POWERUP_REGEN, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 65
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 428
;428:			} else if ( ent->health < client->ps.stats[STAT_MAX_HEALTH] * 2) {
ADDRGP4 $209
JUMPV
LABELV $210
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
GEI4 $209
line 429
;429:				ent->health += 5;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 5
ADDI4
ASGNI4
line 430
;430:				if ( ent->health > client->ps.stats[STAT_MAX_HEALTH] * 2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
LEI4 $216
line 431
;431:					ent->health = client->ps.stats[STAT_MAX_HEALTH] * 2;
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 432
;432:				}
LABELV $216
line 433
;433:				G_AddEvent( ent, EV_POWERUP_REGEN, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 65
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 434
;434:			}
line 436
;435:#endif
;436:		} else {
ADDRGP4 $209
JUMPV
LABELV $208
line 438
;437:			// count down health when over max
;438:			if ( ent->health > client->ps.stats[STAT_MAX_HEALTH] ) {
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
LEI4 $218
line 439
;439:				ent->health--;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 440
;440:			}
LABELV $218
line 441
;441:		}
LABELV $209
line 444
;442:
;443:		// count down armor when over max
;444:		if ( client->ps.stats[STAT_ARMOR] > client->ps.stats[STAT_MAX_HEALTH] ) {
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
LEI4 $220
line 445
;445:			client->ps.stats[STAT_ARMOR]--;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 446
;446:		}
LABELV $220
line 447
;447:	}
LABELV $206
line 392
ADDRLP4 0
INDIRP4
CNSTI4 2644
ADDP4
INDIRI4
CNSTI4 1000
GEI4 $205
line 486
;448:#ifdef MISSIONPACK
;449:	if( bg_itemlist[client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_AMMOREGEN ) {
;450:		int w, max, inc, t, i;
;451:    int weapList[]={WP_MACHINEGUN,WP_SHOTGUN,WP_GRENADE_LAUNCHER,WP_ROCKET_LAUNCHER,WP_LIGHTNING,WP_RAILGUN,WP_PLASMAGUN,WP_BFG,WP_NAILGUN,WP_PROX_LAUNCHER,WP_CHAINGUN};
;452:    int weapCount = sizeof(weapList) / sizeof(int);
;453:		//
;454:    for (i = 0; i < weapCount; i++) {
;455:		  w = weapList[i];
;456:
;457:		  switch(w) {
;458:			  case WP_MACHINEGUN: max = 50; inc = 4; t = 1000; break;
;459:			  case WP_SHOTGUN: max = 10; inc = 1; t = 1500; break;
;460:			  case WP_GRENADE_LAUNCHER: max = 10; inc = 1; t = 2000; break;
;461:			  case WP_ROCKET_LAUNCHER: max = 10; inc = 1; t = 1750; break;
;462:			  case WP_LIGHTNING: max = 50; inc = 5; t = 1500; break;
;463:			  case WP_RAILGUN: max = 10; inc = 1; t = 1750; break;
;464:			  case WP_PLASMAGUN: max = 50; inc = 5; t = 1500; break;
;465:			  case WP_BFG: max = 10; inc = 1; t = 4000; break;
;466:			  case WP_NAILGUN: max = 10; inc = 1; t = 1250; break;
;467:			  case WP_PROX_LAUNCHER: max = 5; inc = 1; t = 2000; break;
;468:			  case WP_CHAINGUN: max = 100; inc = 5; t = 1000; break;
;469:			  default: max = 0; inc = 0; t = 1000; break;
;470:		  }
;471:		  client->ammoTimes[w] += msec;
;472:		  if ( client->ps.ammo[w] >= max ) {
;473:			  client->ammoTimes[w] = 0;
;474:		  }
;475:		  if ( client->ammoTimes[w] >= t ) {
;476:			  while ( client->ammoTimes[w] >= t )
;477:				  client->ammoTimes[w] -= t;
;478:			  client->ps.ammo[w] += inc;
;479:			  if ( client->ps.ammo[w] > max ) {
;480:				  client->ps.ammo[w] = max;
;481:			  }
;482:		  }
;483:    }
;484:	}
;485:#endif
;486:}
LABELV $204
endproc ClientTimerActions 20 12
export ClientIntermissionThink
proc ClientIntermissionThink 24 0
line 493
;487:
;488:/*
;489:====================
;490:ClientIntermissionThink
;491:====================
;492:*/
;493:void ClientIntermissionThink( gclient_t *client ) {
line 494
;494:	client->ps.eFlags &= ~EF_TALK;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
line 495
;495:	client->ps.eFlags &= ~EF_FIRING;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -257
BANDI4
ASGNI4
line 500
;496:
;497:	// the level will exit when everyone wants to or after timeouts
;498:
;499:	// swap and latch button actions
;500:	client->oldbuttons = client->buttons;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 2532
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 2528
ADDP4
INDIRI4
ASGNI4
line 501
;501:	client->buttons = client->pers.cmd.buttons;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 2528
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
ASGNI4
line 502
;502:	if ( client->buttons & ( BUTTON_ATTACK | BUTTON_USE_HOLDABLE ) & ( client->oldbuttons ^ client->buttons ) ) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
CNSTI4 2528
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 5
BANDI4
ADDRLP4 16
INDIRP4
CNSTI4 2532
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
BXORI4
BANDI4
CNSTI4 0
EQI4 $223
line 504
;503:		// this used to be an ^1 but once a player says ready, it should stick
;504:		client->readyToExit = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2520
ADDP4
CNSTI4 1
ASGNI4
line 505
;505:	}
LABELV $223
line 506
;506:}
LABELV $222
endproc ClientIntermissionThink 24 0
export ClientEvents
proc ClientEvents 80 32
line 517
;507:
;508:
;509:/*
;510:================
;511:ClientEvents
;512:
;513:Events will be passed on to the clients for presentation,
;514:but any server game effects are handled here
;515:================
;516:*/
;517:void ClientEvents( gentity_t *ent, int oldEventSequence ) {
line 528
;518:	int		i; // , j; unreferenced - Shafe - trep
;519:	int		event;
;520:	gclient_t *client;
;521:	int		damage;
;522:	vec3_t	dir;
;523:	vec3_t	origin, angles;
;524://	qboolean	fired;
;525://	gitem_t *item; // unreferenced - Shafe - trep
;526://	gentity_t *drop; // unreferenced - Shafe - trep
;527:
;528:	client = ent->client;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 530
;529:
;530:	if ( oldEventSequence < client->ps.eventSequence - MAX_PS_EVENTS ) {
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
GEI4 $226
line 531
;531:		oldEventSequence = client->ps.eventSequence - MAX_PS_EVENTS;
ADDRFP4 4
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 532
;532:	}
LABELV $226
line 533
;533:	for ( i = oldEventSequence ; i < client->ps.eventSequence ; i++ ) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 $231
JUMPV
LABELV $228
line 534
;534:		event = client->ps.events[ i & (MAX_PS_EVENTS-1) ];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ASGNI4
line 536
;535:
;536:		switch ( event ) {
ADDRLP4 56
CNSTI4 11
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $234
ADDRLP4 4
INDIRI4
CNSTI4 12
EQI4 $234
ADDRLP4 4
INDIRI4
ADDRLP4 56
INDIRI4
LTI4 $233
LABELV $250
ADDRLP4 4
INDIRI4
CNSTI4 23
LTI4 $233
ADDRLP4 4
INDIRI4
CNSTI4 31
GTI4 $233
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $251-92
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $251
address $245
address $246
address $233
address $247
address $248
address $233
address $233
address $233
address $249
code
LABELV $234
line 539
;537:		case EV_FALL_MEDIUM:
;538:		case EV_FALL_FAR:
;539:			if ( ent->s.eType != ET_PLAYER ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
EQI4 $235
line 540
;540:				break;		// not in the player model
ADDRGP4 $233
JUMPV
LABELV $235
line 542
;541:			}
;542:			if ( g_dmflags.integer & DF_NO_FALLING ) {
ADDRGP4 g_dmflags+12
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $237
line 543
;543:				break;
ADDRGP4 $233
JUMPV
LABELV $237
line 545
;544:			}
;545:			if ( event == EV_FALL_FAR ) {
ADDRLP4 4
INDIRI4
CNSTI4 12
NEI4 $240
line 546
;546:				damage = 10;
ADDRLP4 24
CNSTI4 10
ASGNI4
line 547
;547:			} else {
ADDRGP4 $241
JUMPV
LABELV $240
line 548
;548:				damage = 5;
ADDRLP4 24
CNSTI4 5
ASGNI4
line 549
;549:			}
LABELV $241
line 550
;550:			VectorSet (dir, 0, 0, 1);
ADDRLP4 64
CNSTF4 0
ASGNF4
ADDRLP4 12
ADDRLP4 64
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 64
INDIRF4
ASGNF4
ADDRLP4 12+8
CNSTF4 1065353216
ASGNF4
line 551
;551:			ent->pain_debounce_time = level.time + 200;	// no normal pain sound
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 552
;552:			G_Damage (ent, NULL, NULL, NULL, NULL, damage, 0, MOD_FALLING);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 68
CNSTP4 0
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 72
CNSTP4 0
ASGNP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 19
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 553
;553:			break;
ADDRGP4 $233
JUMPV
LABELV $245
line 556
;554:
;555:		case EV_FIRE_WEAPON:
;556:			FireWeapon( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 FireWeapon
CALLV
pop
line 557
;557:			break;
ADDRGP4 $233
JUMPV
LABELV $246
line 561
;558:
;559:		// Shafe - Trep - Alt Fire
;560:		case EV_FIRE_WEAPON2: 
;561:			FireWeapon2( ent ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 FireWeapon2
CALLV
pop
line 562
;562:			break;
ADDRGP4 $233
JUMPV
LABELV $247
line 566
;563:
;564:		case EV_USE_ITEM1:		// teleporter
;565:			// drop flags in CTF
;566:			Team_DropFlags( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Team_DropFlags
CALLV
pop
line 615
;567:			/* Shafe - Trep - This is now in g_team.c - Keeping it here only for reference
;568:			item = NULL;
;569:			j = 0;
;570:
;571:			if ( ent->client->ps.powerups[ PW_REDFLAG ] ) {
;572:				item = BG_FindItemForPowerup( PW_REDFLAG );
;573:				j = PW_REDFLAG;
;574:			} else if ( ent->client->ps.powerups[ PW_BLUEFLAG ] ) {
;575:				item = BG_FindItemForPowerup( PW_BLUEFLAG );
;576:				j = PW_BLUEFLAG;
;577:			} else if ( ent->client->ps.powerups[ PW_NEUTRALFLAG ] ) {
;578:				item = BG_FindItemForPowerup( PW_NEUTRALFLAG );
;579:				j = PW_NEUTRALFLAG;
;580:			}
;581:
;582:			if ( item ) {
;583:				drop = Drop_Item( ent, item, 0 );
;584:				// decide how many seconds it has left
;585:				drop->count = ( ent->client->ps.powerups[ j ] - level.time ) / 1000;
;586:				if ( drop->count < 1 ) {
;587:					drop->count = 1;
;588:				}
;589:
;590:				ent->client->ps.powerups[ j ] = 0;
;591:			} */
;592:#ifdef MISSIONPACK
;593:			if ( g_gametype.integer == GT_HARVESTER ) {
;594:				if ( ent->client->ps.generic1 > 0 ) {
;595:					if ( ent->client->sess.sessionTeam == TEAM_RED ) {
;596:						item = BG_FindItem( "Blue Cube" );
;597:					} else {
;598:						item = BG_FindItem( "Red Cube" );
;599:					}
;600:					if ( item ) {
;601:						for ( j = 0; j < ent->client->ps.generic1; j++ ) {
;602:							drop = Drop_Item( ent, item, 0 );
;603:							if ( ent->client->sess.sessionTeam == TEAM_RED ) {
;604:								drop->spawnflags = TEAM_BLUE;
;605:							} else {
;606:								drop->spawnflags = TEAM_RED;
;607:							}
;608:						}
;609:					}
;610:					ent->client->ps.generic1 = 0;
;611:				}
;612:			}
;613:#endif
;614://			PrintMsg( NULL, "%i" S_COLOR_WHITE " DEBUG: USE Teleporter\n", ent->item->giTag ); // Shafe - Debug
;615:			SelectSpawnPoint( ent->client->ps.origin, origin, angles );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 40
ARGP4
ADDRGP4 SelectSpawnPoint
CALLP4
pop
line 616
;616:			TeleportPlayer( ent, origin, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 40
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 617
;617:			break;
ADDRGP4 $233
JUMPV
LABELV $248
line 621
;618:
;619:		case EV_USE_ITEM2:		// medkit
;620://			PrintMsg( NULL, "%i" S_COLOR_WHITE " DEBUG: USE Medkit\n", ent->item->giTag ); // Shafe - Debug
;621:			ent->health = ent->client->ps.stats[STAT_MAX_HEALTH] + 25;
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 740
ADDP4
ADDRLP4 76
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 25
ADDI4
ASGNI4
line 622
;622:			break;
ADDRGP4 $233
JUMPV
LABELV $249
line 646
;623:
;624:		
;625:#ifdef MISSIONPACK
;626:		case EV_USE_ITEM3:		// kamikaze
;627:			// make sure the invulnerability is off
;628:			ent->client->invulnerabilityTime = 0;
;629:			// start the kamikze
;630:			G_StartKamikaze( ent );
;631:			break;
;632:
;633:		case EV_USE_ITEM4:		// portal
;634:			if( ent->client->portalID ) {
;635:				DropPortalSource( ent );
;636:			}
;637:			else {
;638:				DropPortalDestination( ent );
;639:			}
;640:			break;
;641:		case EV_USE_ITEM5:		// invulnerability
;642:			ent->client->invulnerabilityTime = level.time + 10000;
;643:			break;
;644:#endif
;645:		case EV_USE_ITEM6:		// drop flags? Shafe - Trep
;646:			Team_DropFlags( ent ); // Shafe - Trep - Drop Flags  - This doesnt seem to work.. 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Team_DropFlags
CALLV
pop
line 647
;647:			break;
line 650
;648:
;649:		default:
;650:			break;
LABELV $233
line 652
;651:		}
;652:	}
LABELV $229
line 533
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $231
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
LTI4 $228
line 654
;653:
;654:}
LABELV $225
endproc ClientEvents 80 32
export SendPendingPredictableEvents
proc SendPendingPredictableEvents 44 12
line 706
;655:
;656:#ifdef MISSIONPACK
;657:/*
;658:==============
;659:StuckInOtherClient
;660:==============
;661:*/
;662:static int StuckInOtherClient(gentity_t *ent) {
;663:	int i;
;664:	gentity_t	*ent2;
;665:
;666:	ent2 = &g_entities[0];
;667:	for ( i = 0; i < MAX_CLIENTS; i++, ent2++ ) {
;668:		if ( ent2 == ent ) {
;669:			continue;
;670:		}
;671:		if ( !ent2->inuse ) {
;672:			continue;
;673:		}
;674:		if ( !ent2->client ) {
;675:			continue;
;676:		}
;677:		if ( ent2->health <= 0 ) {
;678:			continue;
;679:		}
;680:		//
;681:		if (ent2->r.absmin[0] > ent->r.absmax[0])
;682:			continue;
;683:		if (ent2->r.absmin[1] > ent->r.absmax[1])
;684:			continue;
;685:		if (ent2->r.absmin[2] > ent->r.absmax[2])
;686:			continue;
;687:		if (ent2->r.absmax[0] < ent->r.absmin[0])
;688:			continue;
;689:		if (ent2->r.absmax[1] < ent->r.absmin[1])
;690:			continue;
;691:		if (ent2->r.absmax[2] < ent->r.absmin[2])
;692:			continue;
;693:		return qtrue;
;694:	}
;695:	return qfalse;
;696:}
;697:#endif
;698:
;699:void BotTestSolid(vec3_t origin);
;700:
;701:/*
;702:==============
;703:SendPendingPredictableEvents
;704:==============
;705:*/
;706:void SendPendingPredictableEvents( playerState_t *ps ) {
line 712
;707:	gentity_t *t;
;708:	int event, seq;
;709:	int extEvent, number;
;710:
;711:	// if there are still events pending
;712:	if ( ps->entityEventSequence < ps->eventSequence ) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
GEI4 $254
line 715
;713:		// create a temporary entity for this event which is sent to everyone
;714:		// except the client who generated the event
;715:		seq = ps->entityEventSequence & (MAX_PS_EVENTS-1);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 716
;716:		event = ps->events[ seq ] | ( ( ps->entityEventSequence & 3 ) << 8 );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 8
LSHI4
BORI4
ASGNI4
line 718
;717:		// set external event to zero before calling BG_PlayerStateToEntityState
;718:		extEvent = ps->externalEvent;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
ASGNI4
line 719
;719:		ps->externalEvent = 0;
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
CNSTI4 0
ASGNI4
line 721
;720:		// create temporary entity for event
;721:		t = G_TempEntity( ps->origin, event );
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 722
;722:		number = t->s.number;
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 723
;723:		BG_PlayerStateToEntityState( ps, &t->s, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 724
;724:		t->s.number = number;
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ASGNI4
line 725
;725:		t->s.eType = ET_EVENTS + event;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 13
ADDI4
ASGNI4
line 726
;726:		t->s.eFlags |= EF_PLAYER_EVENT;
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
CNSTI4 16
BORI4
ASGNI4
line 727
;727:		t->s.otherEntityNum = ps->clientNum;
ADDRLP4 36
CNSTI4 140
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 729
;728:		// send to everyone except the client who generated the event
;729:		t->r.svFlags |= SVF_NOTSINGLECLIENT;
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 424
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
line 730
;730:		t->r.singleClient = ps->clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 428
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 732
;731:		// set back external event
;732:		ps->externalEvent = extEvent;
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 733
;733:	}
LABELV $254
line 734
;734:}
LABELV $253
endproc SendPendingPredictableEvents 44 12
export ClientThink_real
proc ClientThink_real 320 12
line 747
;735:
;736:/*
;737:==============
;738:ClientThink
;739:
;740:This will be called once for each client frame, which will
;741:usually be a couple times for each server frame on fast clients.
;742:
;743:If "g_synchronousClients 1" is set, this will be called exactly
;744:once for each server frame, which makes for smooth demo recording.
;745:==============
;746:*/
;747:void ClientThink_real( gentity_t *ent ) {
line 754
;748:	gclient_t	*client;
;749:	pmove_t		pm;
;750:	int			oldEventSequence;
;751:	int			msec;
;752:	usercmd_t	*ucmd;
;753:
;754:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 757
;755:
;756:	// don't think if the client is not yet connected (and thus not yet spawned in)
;757:	if (client->pers.connected != CON_CONNECTED) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $257
line 758
;758:		return;
ADDRGP4 $256
JUMPV
LABELV $257
line 761
;759:	}
;760:	// mark the time, so the connection sprite can be removed
;761:	ucmd = &ent->client->pers.cmd;
ADDRLP4 236
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 472
ADDP4
ASGNP4
line 764
;762:
;763:	// sanity check the command time to prevent speedup cheating
;764:	if ( ucmd->serverTime > level.time + 200 ) {
ADDRLP4 236
INDIRP4
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
LEI4 $259
line 765
;765:		ucmd->serverTime = level.time + 200;
ADDRLP4 236
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 767
;766://		G_Printf("serverTime <<<<<\n" );
;767:	}
LABELV $259
line 768
;768:	if ( ucmd->serverTime < level.time - 1000 ) {
ADDRLP4 236
INDIRP4
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
SUBI4
GEI4 $263
line 769
;769:		ucmd->serverTime = level.time - 1000;
ADDRLP4 236
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
SUBI4
ASGNI4
line 771
;770://		G_Printf("serverTime >>>>>\n" );
;771:	} 
LABELV $263
line 778
;772:
;773:
;774://unlagged - backward reconciliation #4
;775:	// frameOffset should be about the number of milliseconds into a frame 
;776:	// this command packet was received, depending on how fast the server
;777:	// does a G_RunFrame()
;778:	client->frameOffset = trap_Milliseconds() - level.frameStartTime;
ADDRLP4 248
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 3384
ADDP4
ADDRLP4 248
INDIRI4
ADDRGP4 level+9216
INDIRI4
SUBI4
ASGNI4
line 784
;779://unlagged - backward reconciliation #4
;780:
;781:
;782://unlagged - lag simulation #3
;783:	// if the client wants to simulate outgoing packet loss
;784:	if ( client->pers.plOut ) {
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
CNSTI4 0
EQI4 $268
line 786
;785:		// see if a random value is below the threshhold
;786:		float thresh = (float)client->pers.plOut / 100.0f;
ADDRLP4 252
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1120403456
DIVF4
ASGNF4
line 787
;787:		if ( random() < thresh ) {
ADDRLP4 256
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 252
INDIRF4
GEF4 $270
line 789
;788:			// do nothing at all if it is - this is a lost command
;789:			return;
ADDRGP4 $256
JUMPV
LABELV $270
line 791
;790:		}
;791:	}
LABELV $268
line 800
;792://unlagged - lag simulation #3
;793:
;794:
;795://unlagged - true ping
;796:	// save the estimated ping in a queue for averaging later
;797:
;798:	// we use level.previousTime to account for 50ms lag correction
;799:	// besides, this will turn out numbers more like what players are used to
;800:	client->pers.pingsamples[client->pers.samplehead] = level.previousTime + client->frameOffset - ucmd->serverTime;
ADDRLP4 0
INDIRP4
CNSTI4 2440
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 2184
ADDP4
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 3384
ADDP4
INDIRI4
ADDI4
ADDRLP4 236
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 801
;801:	client->pers.samplehead++;
ADDRLP4 256
ADDRLP4 0
INDIRP4
CNSTI4 2440
ADDP4
ASGNP4
ADDRLP4 256
INDIRP4
ADDRLP4 256
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 802
;802:	if ( client->pers.samplehead >= NUM_PING_SAMPLES ) {
ADDRLP4 0
INDIRP4
CNSTI4 2440
ADDP4
INDIRI4
CNSTI4 64
LTI4 $273
line 803
;803:		client->pers.samplehead -= NUM_PING_SAMPLES;
ADDRLP4 260
ADDRLP4 0
INDIRP4
CNSTI4 2440
ADDP4
ASGNP4
ADDRLP4 260
INDIRP4
ADDRLP4 260
INDIRP4
INDIRI4
CNSTI4 64
SUBI4
ASGNI4
line 804
;804:	}
LABELV $273
line 807
;805:
;806:	// initialize the real ping
;807:	if ( g_truePing.integer ) {
ADDRGP4 g_truePing+12
INDIRI4
CNSTI4 0
EQI4 $275
line 808
;808:		int i, sum = 0;
ADDRLP4 264
CNSTI4 0
ASGNI4
line 811
;809:
;810:		// get an average of the samples we saved up
;811:		for ( i = 0; i < NUM_PING_SAMPLES; i++ ) {
ADDRLP4 260
CNSTI4 0
ASGNI4
LABELV $278
line 812
;812:			sum += client->pers.pingsamples[i];
ADDRLP4 264
ADDRLP4 264
INDIRI4
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 2184
ADDP4
ADDP4
INDIRI4
ADDI4
ASGNI4
line 813
;813:		}
LABELV $279
line 811
ADDRLP4 260
ADDRLP4 260
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 64
LTI4 $278
line 815
;814:
;815:		client->pers.realPing = sum / NUM_PING_SAMPLES;
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
ADDRLP4 264
INDIRI4
CNSTI4 64
DIVI4
ASGNI4
line 816
;816:	}
ADDRGP4 $276
JUMPV
LABELV $275
line 817
;817:	else {
line 819
;818:		// if g_truePing is off, use the normal ping
;819:		client->pers.realPing = client->ps.ping;
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
ASGNI4
line 820
;820:	}
LABELV $276
line 826
;821://unlagged - true ping
;822:
;823:
;824://unlagged - lag simulation #2
;825:	// keep a queue of past commands
;826:	client->pers.cmdqueue[client->pers.cmdhead] = client->pers.cmd;
CNSTI4 24
ADDRLP4 0
INDIRP4
CNSTI4 2176
ADDP4
INDIRI4
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRB
ASGNB 24
line 827
;827:	client->pers.cmdhead++;
ADDRLP4 264
ADDRLP4 0
INDIRP4
CNSTI4 2176
ADDP4
ASGNP4
ADDRLP4 264
INDIRP4
ADDRLP4 264
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 828
;828:	if ( client->pers.cmdhead >= MAX_LATENT_CMDS ) {
ADDRLP4 0
INDIRP4
CNSTI4 2176
ADDP4
INDIRI4
CNSTI4 64
LTI4 $282
line 829
;829:		client->pers.cmdhead -= MAX_LATENT_CMDS;
ADDRLP4 268
ADDRLP4 0
INDIRP4
CNSTI4 2176
ADDP4
ASGNP4
ADDRLP4 268
INDIRP4
ADDRLP4 268
INDIRP4
INDIRI4
CNSTI4 64
SUBI4
ASGNI4
line 830
;830:	}
LABELV $282
line 833
;831:
;832:	// if the client wants latency in commands (client-to-server latency)
;833:	if ( client->pers.latentCmds ) {
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 0
EQI4 $284
line 835
;834:		// save the actual command time
;835:		int time = ucmd->serverTime;
ADDRLP4 272
ADDRLP4 236
INDIRP4
INDIRI4
ASGNI4
line 838
;836:
;837:		// find out which index in the queue we want
;838:		int cmdindex = client->pers.cmdhead - client->pers.latentCmds - 1;
ADDRLP4 268
ADDRLP4 0
INDIRP4
CNSTI4 2176
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
SUBI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $287
JUMPV
LABELV $286
line 839
;839:		while ( cmdindex < 0 ) {
line 840
;840:			cmdindex += MAX_LATENT_CMDS;
ADDRLP4 268
ADDRLP4 268
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 841
;841:		}
LABELV $287
line 839
ADDRLP4 268
INDIRI4
CNSTI4 0
LTI4 $286
line 844
;842:
;843:		// read in the old command
;844:		client->pers.cmd = client->pers.cmdqueue[cmdindex];
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
CNSTI4 24
ADDRLP4 268
INDIRI4
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDP4
INDIRB
ASGNB 24
line 847
;845:
;846:		// adjust the real ping to reflect the new latency
;847:		client->pers.realPing += time - ucmd->serverTime;
ADDRLP4 284
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
ASGNP4
ADDRLP4 284
INDIRP4
ADDRLP4 284
INDIRP4
INDIRI4
ADDRLP4 272
INDIRI4
ADDRLP4 236
INDIRP4
INDIRI4
SUBI4
ADDI4
ASGNI4
line 848
;848:	}
LABELV $284
line 856
;849://unlagged - lag simulation #2
;850:
;851:
;852://unlagged - backward reconciliation #4
;853:	// save the command time *before* pmove_fixed messes with the serverTime,
;854:	// and *after* lag simulation messes with it :)
;855:	// attackTime will be used for backward reconciliation later (time shift)
;856:	client->attackTime = ucmd->serverTime;
ADDRLP4 0
INDIRP4
CNSTI4 2656
ADDP4
ADDRLP4 236
INDIRP4
INDIRI4
ASGNI4
line 863
;857://unlagged - backward reconciliation #4
;858:
;859:
;860://unlagged - smooth clients #1
;861:	// keep track of this for later - we'll use this to decide whether or not
;862:	// to send extrapolated positions for this client
;863:	client->lastUpdateFrame = level.framenum;
ADDRLP4 0
INDIRP4
CNSTI4 3388
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 869
;864://unlagged - smooth clients #1
;865:
;866:
;867://unlagged - lag simulation #1
;868:	// if the client is adding latency to received snapshots (server-to-client latency)
;869:	if ( client->pers.latentSnaps ) {
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 0
EQI4 $290
line 871
;870:		// adjust the real ping
;871:		client->pers.realPing += client->pers.latentSnaps * (1000 / sv_fps.integer);
ADDRLP4 272
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
ASGNP4
ADDRLP4 272
INDIRP4
ADDRLP4 272
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 1000
ADDRGP4 sv_fps+12
INDIRI4
DIVI4
MULI4
ADDI4
ASGNI4
line 873
;872:		// adjust the attack time so backward reconciliation will work
;873:		client->attackTime -= client->pers.latentSnaps * (1000 / sv_fps.integer);
ADDRLP4 280
ADDRLP4 0
INDIRP4
CNSTI4 2656
ADDP4
ASGNP4
ADDRLP4 280
INDIRP4
ADDRLP4 280
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 1000
ADDRGP4 sv_fps+12
INDIRI4
DIVI4
MULI4
SUBI4
ASGNI4
line 874
;874:	}
LABELV $290
line 880
;875://unlagged - lag simulation #1
;876:
;877:
;878://unlagged - true ping
;879:	// make sure the true ping is over 0 - with cl_timenudge it can be less
;880:	if ( client->pers.realPing < 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
INDIRI4
CNSTI4 0
GEI4 $294
line 881
;881:		client->pers.realPing = 0;
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
CNSTI4 0
ASGNI4
line 882
;882:	}
LABELV $294
line 886
;883://unlagged - true ping
;884:
;885:
;886:	msec = ucmd->serverTime - client->ps.commandTime;
ADDRLP4 240
ADDRLP4 236
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 889
;887:	// following others may result in bad times, but we still want
;888:	// to check for follow toggles
;889:	if ( msec < 1 && client->sess.spectatorState != SPECTATOR_FOLLOW ) {
ADDRLP4 240
INDIRI4
CNSTI4 1
GEI4 $296
ADDRLP4 0
INDIRP4
CNSTI4 2500
ADDP4
INDIRI4
CNSTI4 2
EQI4 $296
line 890
;890:		return;
ADDRGP4 $256
JUMPV
LABELV $296
line 892
;891:	}
;892:	if ( msec > 200 ) {
ADDRLP4 240
INDIRI4
CNSTI4 200
LEI4 $298
line 893
;893:		msec = 200;
ADDRLP4 240
CNSTI4 200
ASGNI4
line 894
;894:	}
LABELV $298
line 896
;895:
;896:	if ( pmove_msec.integer < 8 ) {
ADDRGP4 pmove_msec+12
INDIRI4
CNSTI4 8
GEI4 $300
line 897
;897:		trap_Cvar_Set("pmove_msec", "8");
ADDRGP4 $303
ARGP4
ADDRGP4 $304
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 898
;898:	}
ADDRGP4 $301
JUMPV
LABELV $300
line 899
;899:	else if (pmove_msec.integer > 33) {
ADDRGP4 pmove_msec+12
INDIRI4
CNSTI4 33
LEI4 $305
line 900
;900:		trap_Cvar_Set("pmove_msec", "33");
ADDRGP4 $303
ARGP4
ADDRGP4 $308
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 901
;901:	}
LABELV $305
LABELV $301
line 903
;902:
;903:	if ( pmove_fixed.integer || client->pers.pmoveFixed ) {
ADDRLP4 268
CNSTI4 0
ASGNI4
ADDRGP4 pmove_fixed+12
INDIRI4
ADDRLP4 268
INDIRI4
NEI4 $312
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
ADDRLP4 268
INDIRI4
EQI4 $309
LABELV $312
line 904
;904:		ucmd->serverTime = ((ucmd->serverTime + pmove_msec.integer-1) / pmove_msec.integer) * pmove_msec.integer;
ADDRLP4 236
INDIRP4
ADDRLP4 236
INDIRP4
INDIRI4
ADDRGP4 pmove_msec+12
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRGP4 pmove_msec+12
INDIRI4
DIVI4
ADDRGP4 pmove_msec+12
INDIRI4
MULI4
ASGNI4
line 907
;905:		//if (ucmd->serverTime - client->ps.commandTime <= 0)
;906:		//	return;
;907:	}
LABELV $309
line 912
;908:
;909:	//
;910:	// check for exiting intermission
;911:	//
;912:	if ( level.intermissiontime ) {
ADDRGP4 level+9132
INDIRI4
CNSTI4 0
EQI4 $316
line 913
;913:		ClientIntermissionThink( client );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ClientIntermissionThink
CALLV
pop
line 914
;914:		return;
ADDRGP4 $256
JUMPV
LABELV $316
line 918
;915:	}
;916:
;917:	// spectators don't do much
;918:	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 3
NEI4 $319
line 919
;919:		if ( client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRLP4 0
INDIRP4
CNSTI4 2500
ADDP4
INDIRI4
CNSTI4 3
NEI4 $321
line 920
;920:			return;
ADDRGP4 $256
JUMPV
LABELV $321
line 922
;921:		}
;922:		SpectatorThink( ent, ucmd );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 236
INDIRP4
ARGP4
ADDRGP4 SpectatorThink
CALLV
pop
line 923
;923:		return;
ADDRGP4 $256
JUMPV
LABELV $319
line 927
;924:	}
;925:
;926:	// check for inactivity timer, but never drop the local client of a non-dedicated server
;927:	if ( !ClientInactivityTimer( client ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 272
ADDRGP4 ClientInactivityTimer
CALLI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 0
NEI4 $323
line 928
;928:		return;
ADDRGP4 $256
JUMPV
LABELV $323
line 932
;929:	}
;930:
;931:	// clear the rewards if time
;932:	if ( level.time > client->rewardTime ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 2616
ADDP4
INDIRI4
LEI4 $325
line 933
;933:		client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 276
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 276
INDIRP4
ADDRLP4 276
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 934
;934:	}
LABELV $325
line 936
;935:
;936:	if ( client->noclip ) {
ADDRLP4 0
INDIRP4
CNSTI4 2524
ADDP4
INDIRI4
CNSTI4 0
EQI4 $328
line 937
;937:		client->ps.pm_type = PM_NOCLIP;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 1
ASGNI4
line 938
;938:	} else if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 $329
JUMPV
LABELV $328
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $330
line 939
;939:		client->ps.pm_type = PM_DEAD;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 940
;940:	} else {
ADDRGP4 $331
JUMPV
LABELV $330
line 941
;941:		client->ps.pm_type = PM_NORMAL;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 942
;942:	}
LABELV $331
LABELV $329
line 944
;943:
;944:	client->ps.gravity = g_gravity.value;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDRGP4 g_gravity+8
INDIRF4
CVFI4 4
ASGNI4
line 947
;945:
;946:	// set speed
;947:	client->ps.speed = g_speed.value;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 g_speed+8
INDIRF4
CVFI4 4
ASGNI4
line 955
;948:
;949:#ifdef MISSIONPACK
;950:	if( bg_itemlist[client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_SCOUT ) {
;951:		client->ps.speed *= 1.5;
;952:	}
;953:	else
;954:#endif
;955:	if ( client->ps.powerups[PW_HASTE] ) {
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
CNSTI4 0
EQI4 $334
line 956
;956:		client->ps.speed *= 1.3;
ADDRLP4 276
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
ADDRLP4 276
INDIRP4
CNSTF4 1067869798
ADDRLP4 276
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 957
;957:	}
LABELV $334
line 968
;958:
;959:	// Let go of the hook if we aren't firing
;960:	/*  - Shafe - Trep - Commented out for offhand grapple
;961:	if ( client->ps.weapon == WP_GRAPPLING_HOOK &&
;962:		client->hook && !( ucmd->buttons & BUTTON_ATTACK ) ) {
;963:		Weapon_HookFree(client->hook);
;964:	}
;965:	*/ 
;966:
;967:	// set up for pmove
;968:	oldEventSequence = client->ps.eventSequence;
ADDRLP4 244
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 970
;969:
;970:	memset (&pm, 0, sizeof(pm));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 232
ARGI4
ADDRGP4 memset
CALLP4
pop
line 974
;971:
;972:	// check for the hit-scan gauntlet, don't let the action
;973:	// go through as an attack unless it actually hits something
;974:	if ( client->ps.weapon == WP_GAUNTLET && !( ucmd->buttons & BUTTON_TALK ) &&
ADDRLP4 276
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ADDRLP4 276
INDIRI4
NEI4 $336
ADDRLP4 280
ADDRLP4 236
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
ADDRLP4 284
CNSTI4 0
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 284
INDIRI4
NEI4 $336
ADDRLP4 280
INDIRI4
ADDRLP4 276
INDIRI4
BANDI4
ADDRLP4 284
INDIRI4
NEI4 $338
ADDRLP4 280
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 284
INDIRI4
EQI4 $336
LABELV $338
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
GTI4 $336
line 975
;975:		( (ucmd->buttons & BUTTON_ATTACK) || (ucmd->buttons & 32) ) && client->ps.weaponTime <= 0 ) { // Shafe - Trep - Alt Fire
line 977
;976:		//( ucmd->buttons & BUTTON_ATTACK ) && client->ps.weaponTime <= 0 ) {
;977:		pm.gauntletHit = CheckGauntletAttack( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 288
ADDRGP4 CheckGauntletAttack
CALLI4
ASGNI4
ADDRLP4 4+40
ADDRLP4 288
INDIRI4
ASGNI4
line 978
;978:	}
LABELV $336
line 980
;979:
;980:	if ( ent->flags & FL_FORCE_GESTURE ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $340
line 981
;981:		ent->flags &= ~FL_FORCE_GESTURE;
ADDRLP4 288
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 288
INDIRP4
ADDRLP4 288
INDIRP4
INDIRI4
CNSTI4 -32769
BANDI4
ASGNI4
line 982
;982:		ent->client->pers.cmd.buttons |= BUTTON_GESTURE;
ADDRLP4 292
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 488
ADDP4
ASGNP4
ADDRLP4 292
INDIRP4
ADDRLP4 292
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 983
;983:	}
LABELV $340
line 1012
;984:
;985:#ifdef MISSIONPACK
;986:	// check for invulnerability expansion before doing the Pmove
;987:	if (client->ps.powerups[PW_INVULNERABILITY] ) {
;988:		if ( !(client->ps.pm_flags & PMF_INVULEXPAND) ) {
;989:			vec3_t mins = { -42, -42, -42 };
;990:			vec3_t maxs = { 42, 42, 42 };
;991:			vec3_t oldmins, oldmaxs;
;992:
;993:			VectorCopy (ent->r.mins, oldmins);
;994:			VectorCopy (ent->r.maxs, oldmaxs);
;995:			// expand
;996:			VectorCopy (mins, ent->r.mins);
;997:			VectorCopy (maxs, ent->r.maxs);
;998:			trap_LinkEntity(ent);
;999:			// check if this would get anyone stuck in this player
;1000:			if ( !StuckInOtherClient(ent) ) {
;1001:				// set flag so the expanded size will be set in PM_CheckDuck
;1002:				client->ps.pm_flags |= PMF_INVULEXPAND;
;1003:			}
;1004:			// set back
;1005:			VectorCopy (oldmins, ent->r.mins);
;1006:			VectorCopy (oldmaxs, ent->r.maxs);
;1007:			trap_LinkEntity(ent);
;1008:		}
;1009:	}
;1010:#endif
;1011:
;1012:	pm.ps = &client->ps;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 1013
;1013:	pm.cmd = *ucmd;
ADDRLP4 4+4
ADDRLP4 236
INDIRP4
INDIRB
ASGNB 24
line 1014
;1014:	if ( pm.ps->pm_type == PM_DEAD ) {
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $343
line 1015
;1015:		pm.tracemask = MASK_PLAYERSOLID & ~CONTENTS_BODY;
ADDRLP4 4+28
CNSTI4 65537
ASGNI4
line 1016
;1016:	}
ADDRGP4 $344
JUMPV
LABELV $343
line 1017
;1017:	else if ( ent->r.svFlags & SVF_BOT ) {
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $346
line 1018
;1018:		pm.tracemask = MASK_PLAYERSOLID | CONTENTS_BOTCLIP;
ADDRLP4 4+28
CNSTI4 37814273
ASGNI4
line 1019
;1019:	}
ADDRGP4 $347
JUMPV
LABELV $346
line 1020
;1020:	else {
line 1021
;1021:		pm.tracemask = MASK_PLAYERSOLID;
ADDRLP4 4+28
CNSTI4 33619969
ASGNI4
line 1022
;1022:	}
LABELV $347
LABELV $344
line 1023
;1023:	pm.trace = trap_Trace;
ADDRLP4 4+224
ADDRGP4 trap_Trace
ASGNP4
line 1024
;1024:	pm.pointcontents = trap_PointContents;
ADDRLP4 4+228
ADDRGP4 trap_PointContents
ASGNP4
line 1025
;1025:	pm.debugLevel = g_debugMove.integer;
ADDRLP4 4+32
ADDRGP4 g_debugMove+12
INDIRI4
ASGNI4
line 1026
;1026:	pm.noFootsteps = ( g_dmflags.integer & DF_NO_FOOTSTEPS ) > 0;
ADDRGP4 g_dmflags+12
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
LEI4 $357
ADDRLP4 288
CNSTI4 1
ASGNI4
ADDRGP4 $358
JUMPV
LABELV $357
ADDRLP4 288
CNSTI4 0
ASGNI4
LABELV $358
ADDRLP4 4+36
ADDRLP4 288
INDIRI4
ASGNI4
line 1028
;1027:
;1028:	pm.pmove_fixed = pmove_fixed.integer | client->pers.pmoveFixed;
ADDRLP4 4+216
ADDRGP4 pmove_fixed+12
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
BORI4
ASGNI4
line 1029
;1029:	pm.pmove_msec = pmove_msec.integer;
ADDRLP4 4+220
ADDRGP4 pmove_msec+12
INDIRI4
ASGNI4
line 1031
;1030:
;1031:	VectorCopy( client->ps.origin, client->oldOrigin );
ADDRLP4 0
INDIRP4
CNSTI4 2540
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1048
;1032:
;1033:#ifdef MISSIONPACK
;1034:		if (level.intermissionQueued != 0 && g_singlePlayer.integer) {
;1035:			if ( level.time - level.intermissionQueued >= 1000  ) {
;1036:				pm.cmd.buttons = 0;
;1037:				pm.cmd.forwardmove = 0;
;1038:				pm.cmd.rightmove = 0;
;1039:				pm.cmd.upmove = 0;
;1040:				if ( level.time - level.intermissionQueued >= 2000 && level.time - level.intermissionQueued <= 2500 ) {
;1041:					trap_SendConsoleCommand( EXEC_APPEND, "centerview\n");
;1042:				}
;1043:				ent->client->ps.pm_type = PM_SPINTERMISSION;
;1044:			}
;1045:		}
;1046:		Pmove (&pm);
;1047:#else
;1048:		Pmove (&pm);
ADDRLP4 4
ARGP4
ADDRGP4 Pmove
CALLV
pop
line 1052
;1049:#endif
;1050:
;1051:	// save results of pmove
;1052:	if ( ent->client->ps.eventSequence != oldEventSequence ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ADDRLP4 244
INDIRI4
EQI4 $363
line 1053
;1053:		ent->eventTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1054
;1054:	}
LABELV $363
line 1067
;1055:
;1056://unlagged - smooth clients #2
;1057:	// clients no longer do extrapolation if cg_smoothClients is 1, because
;1058:	// skip correction is all handled server-side now
;1059:	// since that's the case, it makes no sense to store the extra info
;1060:	// in the client's snapshot entity, so let's save a little bandwidth
;1061:/*
;1062:	if (g_smoothClients.integer) {
;1063:		BG_PlayerStateToEntityStateExtraPolate( &ent->client->ps, &ent->s, ent->client->ps.commandTime, qtrue );
;1064:	}
;1065:	else {
;1066:*/
;1067:		BG_PlayerStateToEntityState( &ent->client->ps, &ent->s, qtrue );
ADDRLP4 296
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 296
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 296
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 1071
;1068://	}
;1069://unlagged - smooth clients #2
;1070:
;1071:	SendPendingPredictableEvents( &ent->client->ps );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRGP4 SendPendingPredictableEvents
CALLV
pop
line 1080
;1072:
;1073:	/* - Shafe - Trep - Commented out for Offhand Grapple
;1074:	if ( !( ent->client->ps.eFlags & EF_FIRING ) ) {
;1075:		client->fireHeld = qfalse;		// for grapple
;1076:	}
;1077:	*/
;1078:
;1079:	// Shafe - Trep  - Offhand Grappling Hook
;1080:	if (g_gametype.integer != GT_CTF) { // Not in CTF Games
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
EQI4 $366
line 1081
;1081:		if ( (pm.cmd.buttons & 64)  && ent->client->ps.pm_type != PM_DEAD && !ent->client->hookhasbeenfired)
ADDRLP4 300
CNSTI4 0
ASGNI4
ADDRLP4 4+4+16
INDIRI4
CNSTI4 64
BANDI4
ADDRLP4 300
INDIRI4
EQI4 $369
ADDRLP4 304
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 304
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $369
ADDRLP4 304
INDIRP4
CNSTI4 2636
ADDP4
INDIRI4
ADDRLP4 300
INDIRI4
NEI4 $369
line 1082
;1082:		{
line 1083
;1083:			Weapon_GrapplingHook_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_GrapplingHook_Fire
CALLV
pop
line 1084
;1084:			ent->client->hookhasbeenfired = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2636
ADDP4
CNSTI4 1
ASGNI4
line 1085
;1085:		}
LABELV $369
line 1086
;1086:		if ( !(pm.cmd.buttons & 64)  &&	ent->client->ps.pm_type != PM_DEAD && ent->client->hookhasbeenfired && ent->client->fireHeld)
ADDRLP4 308
CNSTI4 0
ASGNI4
ADDRLP4 4+4+16
INDIRI4
CNSTI4 64
BANDI4
ADDRLP4 308
INDIRI4
NEI4 $373
ADDRLP4 312
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 312
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $373
ADDRLP4 312
INDIRP4
CNSTI4 2636
ADDP4
INDIRI4
ADDRLP4 308
INDIRI4
EQI4 $373
ADDRLP4 312
INDIRP4
CNSTI4 2628
ADDP4
INDIRI4
ADDRLP4 308
INDIRI4
EQI4 $373
line 1087
;1087:		{
line 1088
;1088:			ent->client->fireHeld = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2628
ADDP4
CNSTI4 0
ASGNI4
line 1089
;1089:			ent->client->hookhasbeenfired = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2636
ADDP4
CNSTI4 0
ASGNI4
line 1090
;1090:		}
LABELV $373
line 1092
;1091:
;1092:		if ( client->hook && client->fireHeld == qfalse )
ADDRLP4 0
INDIRP4
CNSTI4 2632
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $377
ADDRLP4 0
INDIRP4
CNSTI4 2628
ADDP4
INDIRI4
CNSTI4 0
NEI4 $377
line 1093
;1093:		{
line 1094
;1094:			Weapon_HookFree(client->hook);
ADDRLP4 0
INDIRP4
CNSTI4 2632
ADDP4
INDIRP4
ARGP4
ADDRGP4 Weapon_HookFree
CALLV
pop
line 1095
;1095:		}
LABELV $377
line 1096
;1096:	}
LABELV $366
line 1100
;1097:	// End Shafe - Offhand Grapple //////////////////////////////////////////////
;1098:	
;1099:	// use the snapped origin for linking so it matches client predicted versions
;1100:	VectorCopy( ent->s.pos.trBase, ent->r.currentOrigin );
ADDRLP4 300
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 300
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 300
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1102
;1101:
;1102:	VectorCopy (pm.mins, ent->r.mins);
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRLP4 4+180
INDIRB
ASGNB 12
line 1103
;1103:	VectorCopy (pm.maxs, ent->r.maxs);
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
ADDRLP4 4+192
INDIRB
ASGNB 12
line 1105
;1104:
;1105:	ent->waterlevel = pm.waterlevel;
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ADDRLP4 4+208
INDIRI4
ASGNI4
line 1106
;1106:	ent->watertype = pm.watertype;
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRLP4 4+204
INDIRI4
ASGNI4
line 1112
;1107:
;1108:	// TryUse Here
;1109:	
;1110:
;1111:	// execute client events
;1112:	ClientEvents( ent, oldEventSequence );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 244
INDIRI4
ARGI4
ADDRGP4 ClientEvents
CALLV
pop
line 1115
;1113:
;1114:	// link entity now, after any personal teleporters have been used
;1115:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1116
;1116:	if ( !ent->client->noclip ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2524
ADDP4
INDIRI4
CNSTI4 0
NEI4 $383
line 1117
;1117:		G_TouchTriggers( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_TouchTriggers
CALLV
pop
line 1118
;1118:	}
LABELV $383
line 1121
;1119:
;1120:	// NOTE: now copy the exact origin over otherwise clients can be snapped into solid
;1121:	VectorCopy( ent->client->ps.origin, ent->r.currentOrigin );
ADDRLP4 304
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 304
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 304
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1124
;1122:
;1123:	//test for solid areas in the AAS file
;1124:	BotTestAAS(ent->r.currentOrigin);
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRGP4 BotTestAAS
CALLV
pop
line 1127
;1125:
;1126:	// touch other objects
;1127:	ClientImpacts( ent, &pm );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 ClientImpacts
CALLV
pop
line 1130
;1128:
;1129:	// save results of triggers and client events
;1130:	if (ent->client->ps.eventSequence != oldEventSequence) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ADDRLP4 244
INDIRI4
EQI4 $385
line 1131
;1131:		ent->eventTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1132
;1132:	}
LABELV $385
line 1135
;1133:
;1134:	// swap and latch button actions
;1135:	client->oldbuttons = client->buttons;
ADDRLP4 0
INDIRP4
CNSTI4 2532
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 2528
ADDP4
INDIRI4
ASGNI4
line 1136
;1136:	client->buttons = ucmd->buttons;
ADDRLP4 0
INDIRP4
CNSTI4 2528
ADDP4
ADDRLP4 236
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 1137
;1137:	client->latched_buttons |= client->buttons & ~client->oldbuttons;
ADDRLP4 316
ADDRLP4 0
INDIRP4
CNSTI4 2536
ADDP4
ASGNP4
ADDRLP4 316
INDIRP4
ADDRLP4 316
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 2528
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 2532
ADDP4
INDIRI4
BCOMI4
BANDI4
BORI4
ASGNI4
line 1140
;1138:
;1139:	// check for respawning
;1140:	if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $388
line 1142
;1141:		// wait for the attack button to be pressed
;1142:		if ( level.time > client->respawnTime ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 2604
ADDP4
INDIRI4
LEI4 $256
line 1144
;1143:			// forcerespawn is to prevent users from waiting out powerups
;1144:			if ( g_forcerespawn.integer > 0 && 
ADDRGP4 g_forcerespawn+12
INDIRI4
CNSTI4 0
LEI4 $393
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 2604
ADDP4
INDIRI4
SUBI4
CNSTI4 1000
ADDRGP4 g_forcerespawn+12
INDIRI4
MULI4
LEI4 $393
line 1145
;1145:				( level.time - client->respawnTime ) > g_forcerespawn.integer * 1000 ) {
line 1146
;1146:				respawn( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 1147
;1147:				return;
ADDRGP4 $256
JUMPV
LABELV $393
line 1151
;1148:			}
;1149:		
;1150:			// pressing attack or use is the normal respawn method
;1151:			if ( ucmd->buttons & ( BUTTON_ATTACK | BUTTON_USE_HOLDABLE ) ) {
ADDRLP4 236
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 5
BANDI4
CNSTI4 0
EQI4 $256
line 1152
;1152:				respawn( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 1153
;1153:			}
line 1154
;1154:		}
line 1155
;1155:		return;
ADDRGP4 $256
JUMPV
LABELV $388
line 1159
;1156:	}
;1157:
;1158:	// perform once-a-second actions
;1159:	ClientTimerActions( ent, msec );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 240
INDIRI4
ARGI4
ADDRGP4 ClientTimerActions
CALLV
pop
line 1160
;1160:}
LABELV $256
endproc ClientThink_real 320 12
export ClientThink
proc ClientThink 8 8
line 1169
;1161:
;1162:/*
;1163:==================
;1164:ClientThink
;1165:
;1166:A new command has arrived from the client
;1167:==================
;1168:*/
;1169:void ClientThink( int clientNum ) {
line 1172
;1170:	gentity_t *ent;
;1171:
;1172:	ent = g_entities + clientNum;
ADDRLP4 0
CNSTI4 836
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1173
;1173:	trap_GetUsercmd( clientNum, &ent->client->pers.cmd );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 472
ADDP4
ARGP4
ADDRGP4 trap_GetUsercmd
CALLV
pop
line 1184
;1174:
;1175://unlagged - smooth clients #1
;1176:	// this is handled differently now
;1177:/*
;1178:	// mark the time we got info, so we can display the
;1179:	// phone jack if they don't get any for a while
;1180:	ent->client->lastCmdTime = level.time;
;1181:*/
;1182://unlagged - smooth clients #1
;1183:
;1184:	if ( !(ent->r.svFlags & SVF_BOT) && !g_synchronousClients.integer ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 4
INDIRI4
NEI4 $401
ADDRGP4 g_synchronousClients+12
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $401
line 1185
;1185:		ClientThink_real( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ClientThink_real
CALLV
pop
line 1186
;1186:	}
LABELV $401
line 1187
;1187:}
LABELV $400
endproc ClientThink 8 8
export G_RunClient
proc G_RunClient 4 4
line 1190
;1188:
;1189:
;1190:void G_RunClient( gentity_t *ent ) {
line 1191
;1191:	if ( !(ent->r.svFlags & SVF_BOT) && !g_synchronousClients.integer ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 0
INDIRI4
NEI4 $405
ADDRGP4 g_synchronousClients+12
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $405
line 1192
;1192:		return;
ADDRGP4 $404
JUMPV
LABELV $405
line 1194
;1193:	}
;1194:	ent->client->pers.cmd.serverTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 472
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1195
;1195:	ClientThink_real( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientThink_real
CALLV
pop
line 1196
;1196:}
LABELV $404
endproc G_RunClient 4 4
export SpectatorClientEndFrame
proc SpectatorClientEndFrame 24 4
line 1205
;1197:
;1198:
;1199:/*
;1200:==================
;1201:SpectatorClientEndFrame
;1202:
;1203:==================
;1204:*/
;1205:void SpectatorClientEndFrame( gentity_t *ent ) {
line 1209
;1206:	gclient_t	*cl;
;1207:
;1208:	// if we are doing a chase cam or a remote view, grab the latest info
;1209:	if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2500
ADDP4
INDIRI4
CNSTI4 2
NEI4 $410
line 1212
;1210:		int		clientNum, flags;
;1211:
;1212:		clientNum = ent->client->sess.spectatorClient;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2504
ADDP4
INDIRI4
ASGNI4
line 1215
;1213:
;1214:		// team follow1 and team follow2 go to whatever clients are playing
;1215:		if ( clientNum == -1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
NEI4 $412
line 1216
;1216:			clientNum = level.follow1;
ADDRLP4 4
ADDRGP4 level+344
INDIRI4
ASGNI4
line 1217
;1217:		} else if ( clientNum == -2 ) {
ADDRGP4 $413
JUMPV
LABELV $412
ADDRLP4 4
INDIRI4
CNSTI4 -2
NEI4 $415
line 1218
;1218:			clientNum = level.follow2;
ADDRLP4 4
ADDRGP4 level+348
INDIRI4
ASGNI4
line 1219
;1219:		}
LABELV $415
LABELV $413
line 1220
;1220:		if ( clientNum >= 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $418
line 1221
;1221:			cl = &level.clients[ clientNum ];
ADDRLP4 0
CNSTI4 3392
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1222
;1222:			if ( cl->pers.connected == CON_CONNECTED && cl->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
NEI4 $420
ADDRLP4 12
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 3
EQI4 $420
line 1223
;1223:				flags = (cl->ps.eFlags & ~(EF_VOTED | EF_TEAMVOTED)) | (ent->client->ps.eFlags & (EF_VOTED | EF_TEAMVOTED));
ADDRLP4 16
CNSTI4 104
ASGNI4
ADDRLP4 8
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
CNSTI4 -540673
BANDI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
CNSTI4 540672
BANDI4
BORI4
ASGNI4
line 1224
;1224:				ent->client->ps = cl->ps;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ADDRLP4 0
INDIRP4
INDIRB
ASGNB 468
line 1225
;1225:				ent->client->ps.pm_flags |= PMF_FOLLOW;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 1226
;1226:				ent->client->ps.eFlags = flags;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1227
;1227:				return;
ADDRGP4 $409
JUMPV
LABELV $420
line 1228
;1228:			} else {
line 1230
;1229:				// drop them to free spectators unless they are dedicated camera followers
;1230:				if ( ent->client->sess.spectatorClient >= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2504
ADDP4
INDIRI4
CNSTI4 0
LTI4 $422
line 1231
;1231:					ent->client->sess.spectatorState = SPECTATOR_FREE;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2500
ADDP4
CNSTI4 1
ASGNI4
line 1232
;1232:					ClientBegin( ent->client - level.clients );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3392
DIVI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 1233
;1233:				}
LABELV $422
line 1234
;1234:			}
line 1235
;1235:		}
LABELV $418
line 1236
;1236:	}
LABELV $410
line 1238
;1237:
;1238:	if ( ent->client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2500
ADDP4
INDIRI4
CNSTI4 3
NEI4 $424
line 1239
;1239:		ent->client->ps.pm_flags |= PMF_SCOREBOARD;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 1240
;1240:	} else {
ADDRGP4 $425
JUMPV
LABELV $424
line 1241
;1241:		ent->client->ps.pm_flags &= ~PMF_SCOREBOARD;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -8193
BANDI4
ASGNI4
line 1242
;1242:	}
LABELV $425
line 1243
;1243:}
LABELV $409
endproc SpectatorClientEndFrame 24 4
export ClientEndFrame
proc ClientEndFrame 52 12
line 1254
;1244:
;1245:/*
;1246:==============
;1247:ClientEndFrame
;1248:
;1249:Called at the end of each server frame for each connected client
;1250:A fast client will have multiple ClientThink for each ClientEdFrame,
;1251:while a slow client may have multiple ClientEndFrame between ClientThink.
;1252:==============
;1253:*/
;1254:void ClientEndFrame( gentity_t *ent ) {
line 1262
;1255:	int			i;
;1256:	clientPersistant_t	*pers;
;1257:
;1258://unlagged - smooth clients #1
;1259:	int frames;
;1260://unlagged - smooth clients #1
;1261:
;1262:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 3
NEI4 $427
line 1263
;1263:		SpectatorClientEndFrame( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SpectatorClientEndFrame
CALLV
pop
line 1264
;1264:		return;
ADDRGP4 $426
JUMPV
LABELV $427
line 1267
;1265:	}
;1266:
;1267:	pers = &ent->client->pers;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
ASGNP4
line 1270
;1268:
;1269:	// turn off any expired powerups
;1270:	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $429
line 1271
;1271:		if ( ent->client->ps.powerups[ i ] < level.time ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $433
line 1272
;1272:			ent->client->ps.powerups[ i ] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 1273
;1273:		}
LABELV $433
line 1274
;1274:	}
LABELV $430
line 1270
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $429
line 1307
;1275:
;1276:#ifdef MISSIONPACK
;1277:	// set powerup for player animation
;1278:	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;1279:		ent->client->ps.powerups[PW_GUARD] = level.time;
;1280:	}
;1281:	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_SCOUT ) {
;1282:		ent->client->ps.powerups[PW_SCOUT] = level.time;
;1283:	}
;1284:	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_DOUBLER ) {
;1285:		ent->client->ps.powerups[PW_DOUBLER] = level.time;
;1286:	}
;1287:	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_AMMOREGEN ) {
;1288:		ent->client->ps.powerups[PW_AMMOREGEN] = level.time;
;1289:	}
;1290:	if ( ent->client->invulnerabilityTime > level.time ) {
;1291:		ent->client->ps.powerups[PW_INVULNERABILITY] = level.time;
;1292:	}
;1293:#endif
;1294:
;1295:	// save network bandwidth
;1296:#if 0
;1297:	if ( !g_synchronousClients->integer && ent->client->ps.pm_type == PM_NORMAL ) {
;1298:		// FIXME: this must change eventually for non-sync demo recording
;1299:		VectorClear( ent->client->ps.viewangles );
;1300:	}
;1301:#endif
;1302:
;1303:	//
;1304:	// If the end of unit layout is displayed, don't give
;1305:	// the player any normal movement attributes
;1306:	//
;1307:	if ( level.intermissiontime ) {
ADDRGP4 level+9132
INDIRI4
CNSTI4 0
EQI4 $436
line 1308
;1308:		return;
ADDRGP4 $426
JUMPV
LABELV $436
line 1312
;1309:	}
;1310:
;1311:	// burn from lava, etc
;1312:	P_WorldEffects (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 P_WorldEffects
CALLV
pop
line 1315
;1313:
;1314:	// apply all the damage taken this frame
;1315:	P_DamageFeedback (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 P_DamageFeedback
CALLV
pop
line 1329
;1316:
;1317://unlagged - smooth clients #1
;1318:	// this is handled differently now
;1319:/*
;1320:	// add the EF_CONNECTION flag if we haven't gotten commands recently
;1321:	if ( level.time - ent->client->lastCmdTime > 1000 ) {
;1322:		ent->client->ps.eFlags |= EF_CONNECTION;
;1323:	} else {
;1324:		ent->client->ps.eFlags &= ~EF_CONNECTION;
;1325:	}
;1326:*/
;1327://unlagged - smooth clients #1
;1328:
;1329:	ent->client->ps.stats[STAT_HEALTH] = ent->health;	// FIXME: get rid of ent->health...
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ASGNI4
line 1331
;1330:
;1331:	G_SetClientSound (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_SetClientSound
CALLV
pop
line 1345
;1332:
;1333:	// set the latest information
;1334://unlagged - smooth clients #2
;1335:	// clients no longer do extrapolation if cg_smoothClients is 1, because
;1336:	// skip correction is all handled server-side now
;1337:	// since that's the case, it makes no sense to store the extra info
;1338:	// in the client's snapshot entity, so let's save a little bandwidth
;1339:/*
;1340:	if (g_smoothClients.integer) {
;1341:		BG_PlayerStateToEntityStateExtraPolate( &ent->client->ps, &ent->s, ent->client->ps.commandTime, qtrue );
;1342:	}
;1343:	else {
;1344:*/
;1345:		BG_PlayerStateToEntityState( &ent->client->ps, &ent->s, qtrue );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 1349
;1346://	}
;1347://unlagged - smooth clients #2
;1348:
;1349:	SendPendingPredictableEvents( &ent->client->ps );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRGP4 SendPendingPredictableEvents
CALLV
pop
line 1353
;1350:
;1351://unlagged - smooth clients #1
;1352:	// mark as not missing updates initially
;1353:	ent->client->ps.eFlags &= ~EF_CONNECTION;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 -8193
BANDI4
ASGNI4
line 1356
;1354:
;1355:	// see how many frames the client has missed
;1356:	frames = level.framenum - ent->client->lastUpdateFrame - 1;
ADDRLP4 4
ADDRGP4 level+28
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 3388
ADDP4
INDIRI4
SUBI4
CNSTI4 1
SUBI4
ASGNI4
line 1359
;1357:
;1358:	// don't extrapolate more than two frames
;1359:	if ( frames > 2 ) {
ADDRLP4 4
INDIRI4
CNSTI4 2
LEI4 $440
line 1360
;1360:		frames = 2;
ADDRLP4 4
CNSTI4 2
ASGNI4
line 1363
;1361:
;1362:		// if they missed more than two in a row, show the phone jack
;1363:		ent->client->ps.eFlags |= EF_CONNECTION;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 1364
;1364:		ent->s.eFlags |= EF_CONNECTION;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 1365
;1365:	}
LABELV $440
line 1368
;1366:
;1367:	// did the client miss any frames?
;1368:	if ( frames > 0 && g_smoothClients.integer ) {
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $442
ADDRGP4 g_smoothClients+12
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $442
line 1370
;1369:		// yep, missed one or more, so extrapolate the player's movement
;1370:		G_PredictPlayerMove( ent, (float)frames / sv_fps.integer );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRGP4 sv_fps+12
INDIRI4
CVIF4 4
DIVF4
ARGF4
ADDRGP4 G_PredictPlayerMove
CALLV
pop
line 1372
;1371:		// save network bandwidth
;1372:		SnapVector( ent->s.pos.trBase );
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 24
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
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 36
INDIRP4
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 44
INDIRP4
ADDRLP4 48
INDIRF4
ASGNF4
line 1373
;1373:	}
LABELV $442
line 1378
;1374://unlagged - smooth clients #1
;1375:
;1376://unlagged - backward reconciliation #1
;1377:	// store the client's position for backward reconciliation later
;1378:	G_StoreHistory( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_StoreHistory
CALLV
pop
line 1384
;1379://unlagged - backward reconciliation #1
;1380:
;1381:	// set the bit for the reachability area the client is currently in
;1382://	i = trap_AAS_PointReachabilityAreaIndex( ent->client->ps.origin );
;1383://	ent->client->areabits[i >> 3] |= 1 << (i & 7);
;1384:}
LABELV $426
endproc ClientEndFrame 52 12
import BotTestSolid
import Weapon_GrapplingHook_Fire
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
import TeleportPlayer
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
LABELV $308
byte 1 51
byte 1 51
byte 1 0
align 1
LABELV $304
byte 1 56
byte 1 0
align 1
LABELV $303
byte 1 112
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 95
byte 1 109
byte 1 115
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $203
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 84
byte 1 101
byte 1 110
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 117
byte 1 110
byte 1 116
byte 1 105
byte 1 108
byte 1 32
byte 1 105
byte 1 110
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 100
byte 1 114
byte 1 111
byte 1 112
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $199
byte 1 68
byte 1 114
byte 1 111
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 105
byte 1 110
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $95
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 103
byte 1 117
byte 1 114
byte 1 112
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $94
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 103
byte 1 117
byte 1 114
byte 1 112
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $91
byte 1 42
byte 1 100
byte 1 114
byte 1 111
byte 1 119
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
