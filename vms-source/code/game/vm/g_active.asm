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
CNSTI4 524
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
CNSTI4 2616
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 2612
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
CNSTI4 2636
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
CNSTI4 2636
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
CNSTI4 2624
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
CNSTI4 736
ADDP4
INDIRI4
LEI4 $65
ADDRLP4 24
INDIRP4
CNSTI4 544
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
CNSTI4 736
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
CNSTI4 748
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
CNSTI4 2616
ADDP4
CNSTI4 0
ASGNI4
line 66
;66:	client->damage_armor = 0;
ADDRLP4 0
INDIRP4
CNSTI4 2612
ADDP4
CNSTI4 0
ASGNI4
line 67
;67:	client->damage_knockback = 0;
ADDRLP4 0
INDIRP4
CNSTI4 2620
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
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2584
ADDP4
INDIRI4
CNSTI4 0
EQI4 $70
line 84
;84:		ent->client->airOutTime = level.time + 12000;	// don't need air
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2680
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
CNSTI4 804
ADDP4
INDIRI4
ASGNI4
line 90
;89:
;90:	envirosuit = ent->client->ps.powerups[PW_BATTLESUIT] > level.time;
ADDRFP4 0
INDIRP4
CNSTI4 524
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
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2680
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
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2680
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
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2680
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
CNSTI4 748
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
CNSTI4 756
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
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 15
LEI4 $87
line 109
;109:					ent->damage = 15;
ADDRFP4 0
INDIRP4
CNSTI4 756
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
CNSTI4 748
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 756
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
CNSTI4 736
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
CNSTI4 756
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
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2680
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
CNSTI4 756
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
CNSTI4 800
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
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 0
LEI4 $100
ADDRLP4 16
INDIRP4
CNSTI4 736
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
CNSTI4 800
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
CNSTI4 800
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
CNSTI4 804
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $110
ADDRLP4 0
INDIRP4
CNSTI4 800
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
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 444
ADDP4
ADDRGP4 level+360
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
CNSTI4 524
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
CNSTI4 916
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
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $126
ADDRLP4 68
INDIRP4
CNSTI4 720
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
CNSTI4 720
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
CNSTI4 720
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
CNSTI4 720
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
CNSTI4 524
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
CNSTI4 524
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
CNSTI4 524
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
CNSTI4 524
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
CNSTI4 524
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
CNSTI4 524
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
CNSTI4 524
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
CNSTI4 444
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
CNSTI4 448
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
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 4208
INDIRP4
CNSTI4 452
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
CNSTI4 524
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
CNSTI4 456
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
CNSTI4 460
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
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 4220
INDIRP4
CNSTI4 464
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
CNSTI4 916
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
CNSTI4 720
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
CNSTI4 468
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
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
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
CNSTI4 720
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
CNSTI4 524
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
CNSTI4 720
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
CNSTI4 720
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
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $169
ADDRLP4 4232
INDIRP4
CNSTI4 720
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
CNSTI4 720
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
CNSTI4 524
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
CNSTI4 524
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
CNSTI4 524
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
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 312
;311:
;312:	if ( client->sess.spectatorState != SPECTATOR_FOLLOW ) {
ADDRLP4 0
INDIRP4
CNSTI4 2560
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
CNSTI4 2592
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 2588
ADDP4
INDIRI4
ASGNI4
line 334
;334:	client->buttons = ucmd->buttons;
ADDRLP4 0
INDIRP4
CNSTI4 2588
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
CNSTI4 2588
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
CNSTI4 2592
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
CNSTI4 2668
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
CNSTI4 2672
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
CNSTI4 2668
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
CNSTI4 2672
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
CNSTI4 2668
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
CNSTI4 3452
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
CNSTI4 2668
ADDP4
INDIRI4
CNSTI4 10000
SUBI4
LEI4 $200
ADDRLP4 8
INDIRP4
CNSTI4 2672
ADDP4
INDIRI4
CNSTI4 0
NEI4 $200
line 369
;369:			client->inactivityWarning = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 2672
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
CNSTI4 3452
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
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 390
;390:	client->timeResidual += msec;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 2704
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
CNSTI4 2704
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
line 396
;394:
;395:
;396:	if (g_GameMode.integer == 3)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 3
NEI4 $208
line 397
;397:	{
line 398
;398:		if (client->sess.sessionTeam == TEAM_RED) 
ADDRLP4 0
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 1
NEI4 $211
line 399
;399:		{
line 400
;400:			trap_SendConsoleCommand( EXEC_INSERT, va("g_RedMC \"%i\"\n", level.redCredits) );	
ADDRGP4 $213
ARGP4
ADDRGP4 level+9272
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 401
;401:		}
ADDRGP4 $212
JUMPV
LABELV $211
line 403
;402:		else
;403:		{
line 404
;404:			trap_SendConsoleCommand( EXEC_INSERT, va("g_BlueMC \"%i\"\n", level.blueCredits) );
ADDRGP4 $215
ARGP4
ADDRGP4 level+9276
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 405
;405:		}
LABELV $212
line 406
;406:	}
LABELV $208
line 436
;407:
;408:
;409:
;410:		// regenerate
;411:#ifdef MISSIONPACK
;412:		if( bg_itemlist[client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;413:			maxHealth = client->ps.stats[STAT_MAX_HEALTH] / 2;
;414:		}
;415:		else if ( client->ps.powerups[PW_REGEN] ) {
;416:			maxHealth = client->ps.stats[STAT_MAX_HEALTH];
;417:		}
;418:		else {
;419:			maxHealth = 0;
;420:		}
;421:		if( maxHealth ) {
;422:			if ( ent->health < maxHealth ) {
;423:				ent->health += 15;
;424:				if ( ent->health > maxHealth * 1.1 ) {
;425:					ent->health = maxHealth * 1.1;
;426:				}
;427:				G_AddEvent( ent, EV_POWERUP_REGEN, 0 );
;428:			} else if ( ent->health < maxHealth * 2) {
;429:				ent->health += 5;
;430:				if ( ent->health > maxHealth * 2 ) {
;431:					ent->health = maxHealth * 2;
;432:				}
;433:				G_AddEvent( ent, EV_POWERUP_REGEN, 0 );
;434:			}
;435:#else
;436:		if ( client->ps.powerups[PW_REGEN] ) {
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
INDIRI4
CNSTI4 0
EQI4 $217
line 437
;437:			if ( ent->health < client->ps.stats[STAT_MAX_HEALTH]) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
GEI4 $219
line 438
;438:				ent->health += 15;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 748
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
line 439
;439:				if ( ent->health > client->ps.stats[STAT_MAX_HEALTH] * 1.1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 748
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
LEF4 $221
line 440
;440:					ent->health = client->ps.stats[STAT_MAX_HEALTH] * 1.1;
ADDRFP4 0
INDIRP4
CNSTI4 748
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
line 441
;441:				}
LABELV $221
line 442
;442:				G_AddEvent( ent, EV_POWERUP_REGEN, 0 );
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
line 443
;443:			} else if ( ent->health < client->ps.stats[STAT_MAX_HEALTH] * 2) {
ADDRGP4 $218
JUMPV
LABELV $219
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
GEI4 $218
line 444
;444:				ent->health += 5;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 748
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
line 445
;445:				if ( ent->health > client->ps.stats[STAT_MAX_HEALTH] * 2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
LEI4 $225
line 446
;446:					ent->health = client->ps.stats[STAT_MAX_HEALTH] * 2;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 447
;447:				}
LABELV $225
line 448
;448:				G_AddEvent( ent, EV_POWERUP_REGEN, 0 );
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
line 449
;449:			}
line 451
;450:#endif
;451:		} else {
ADDRGP4 $218
JUMPV
LABELV $217
line 453
;452:			// count down health when over max
;453:			if ( ent->health > client->ps.stats[STAT_MAX_HEALTH] ) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
LEI4 $227
line 454
;454:				ent->health--;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 748
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
line 455
;455:			}
LABELV $227
line 456
;456:		}
LABELV $218
line 460
;457:
;458:
;459:		// Pulse Rifle // Machine Gun Ammo Regenerates
;460:		if (client->ps.ammo[WP_MACHINEGUN] < Max_Ammo[WP_MACHINEGUN]) 
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
ADDRGP4 Max_Ammo+8
INDIRI4
GEI4 $229
line 461
;461:		{
line 462
;462:				client->ps.ammo[WP_MACHINEGUN]+=2;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 463
;463:		}
LABELV $229
line 468
;464:
;465:
;466:
;467:		// Immobilized
;468:		if ( g_entities[client->ps.clientNum].immobilized == qtrue)
CNSTI4 916
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+912
ADDP4
INDIRI4
CNSTI4 1
NEI4 $232
line 469
;469:		{
line 471
;470:			
;471:			client->ps.speed = 100;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 100
ASGNI4
line 472
;472:			client->ps.gravity = 1;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 1
ASGNI4
line 473
;473:			g_entities[client->ps.clientNum].s.time2 = 9;
CNSTI4 916
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+88
ADDP4
CNSTI4 9
ASGNI4
line 474
;474:			g_entities[client->ps.clientNum].health--;
ADDRLP4 12
CNSTI4 916
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+748
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
line 478
;475:			//G_Damage (g_entities[client->ps.clientNum], NULL, NULL, NULL, NULL, 1, 0, MOD_IMMOBILIZED);
;476:			//g_entities[client->ps.clientNum].s.team == TEAM_RED; // Where using this for a timer now - Typically used for buildables
;477:			// Let them go when they are about dead.
;478:			if (g_entities[client->ps.clientNum].health < 75) { g_entities[client->ps.clientNum].immobilized = qfalse; }
CNSTI4 916
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+748
ADDP4
INDIRI4
CNSTI4 75
GEI4 $233
CNSTI4 916
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+912
ADDP4
CNSTI4 0
ASGNI4
line 479
;479:		}	else
ADDRGP4 $233
JUMPV
LABELV $232
line 480
;480:		{
line 483
;481:			// Free them
;482:			//g_entities[client->ps.clientNum].s.team = TEAM_BLUE;
;483:			client->ps.speed = g_speed.integer;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 g_speed+12
INDIRI4
ASGNI4
line 484
;484:			client->ps.gravity = g_gravity.integer;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDRGP4 g_gravity+12
INDIRI4
ASGNI4
line 485
;485:			g_entities[client->ps.clientNum].s.time2 = 0;
CNSTI4 916
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+88
ADDP4
CNSTI4 0
ASGNI4
line 486
;486:			g_entities[client->ps.clientNum].immobilized == qfalse;
line 487
;487:		}
LABELV $233
line 492
;488:		
;489:
;490:
;491:		// count down armor when over max
;492:		if ( client->ps.stats[STAT_ARMOR] > client->ps.stats[STAT_MAX_HEALTH] ) {
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
LEI4 $245
line 493
;493:			client->ps.stats[STAT_ARMOR]--;
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
line 494
;494:		}
LABELV $245
line 495
;495:	}
LABELV $206
line 392
ADDRLP4 0
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
CNSTI4 1000
GEI4 $205
line 535
;496:#ifdef MISSIONPACK
;497:	if( bg_itemlist[client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_AMMOREGEN ) {
;498:		int w, max, inc, t, i;
;499:    int weapList[]={WP_MACHINEGUN,WP_SHOTGUN,WP_GRENADE_LAUNCHER,WP_ROCKET_LAUNCHER,WP_LIGHTNING,WP_RAILGUN,WP_PLASMAGUN,WP_BFG,WP_NAILGUN,WP_PROX_LAUNCHER,WP_CHAINGUN};
;500:    int weapCount = sizeof(weapList) / sizeof(int);
;501:		//
;502:    for (i = 0; i < weapCount; i++) {
;503:		  w = weapList[i];
;504:
;505:		  switch(w) {
;506:			  case WP_MACHINEGUN: max = 50; inc = 4; t = 1000; break;
;507:			  case WP_SHOTGUN: max = 10; inc = 1; t = 1500; break;
;508:			  case WP_GRENADE_LAUNCHER: max = 10; inc = 1; t = 2000; break;
;509:			  case WP_ROCKET_LAUNCHER: max = 10; inc = 1; t = 1750; break;
;510:			  case WP_LIGHTNING: max = 50; inc = 5; t = 1500; break;
;511:			  case WP_RAILGUN: max = 10; inc = 1; t = 1750; break;
;512:			  case WP_PLASMAGUN: max = 50; inc = 5; t = 1500; break;
;513:			  case WP_BFG: max = 10; inc = 1; t = 4000; break;
;514:			  case WP_NAILGUN: max = 10; inc = 1; t = 1250; break;
;515:			  case WP_PROX_LAUNCHER: max = 5; inc = 1; t = 2000; break;
;516:			  case WP_CHAINGUN: max = 100; inc = 5; t = 1000; break;
;517:			  default: max = 0; inc = 0; t = 1000; break;
;518:		  }
;519:		  client->ammoTimes[w] += msec;
;520:		  if ( client->ps.ammo[w] >= max ) {
;521:			  client->ammoTimes[w] = 0;
;522:		  }
;523:		  if ( client->ammoTimes[w] >= t ) {
;524:			  while ( client->ammoTimes[w] >= t )
;525:				  client->ammoTimes[w] -= t;
;526:			  client->ps.ammo[w] += inc;
;527:			  if ( client->ps.ammo[w] > max ) {
;528:				  client->ps.ammo[w] = max;
;529:			  }
;530:		  }
;531:    }
;532:	}
;533:#endif
;534:
;535:	if (g_GameMode.integer == 3)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 3
NEI4 $247
line 536
;536:	{
line 540
;537:
;538:		// Give Warnings That An MC Is Needed
;539:		// Clean this up !
;540:		if ((client->sess.sessionTeam == TEAM_RED) && ( level.redNeedMC == 1))
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $250
ADDRGP4 level+9300
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $250
line 541
;541:		{
line 542
;542:			if(level.time-level.blueScoreTime == 50000)	{ trap_SendServerCommand( client - level.clients, "cp \"Red Team Has 5 Sec\n To Place Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+48
INDIRI4
SUBI4
CNSTI4 50000
NEI4 $253
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3452
DIVI4
ARGI4
ADDRGP4 $257
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $253
line 543
;543:			if(level.time-level.blueScoreTime == 45000)	{ trap_SendServerCommand( client - level.clients, "cp \"Red Team Has 10 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+48
INDIRI4
SUBI4
CNSTI4 45000
NEI4 $258
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3452
DIVI4
ARGI4
ADDRGP4 $262
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $258
line 544
;544:			if(level.time-level.blueScoreTime == 40000)	{ trap_SendServerCommand( client - level.clients, "cp \"Red Team Has 15 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+48
INDIRI4
SUBI4
CNSTI4 40000
NEI4 $263
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3452
DIVI4
ARGI4
ADDRGP4 $267
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $263
line 545
;545:			if(level.time-level.blueScoreTime == 35000)	{ trap_SendServerCommand( client - level.clients, "cp \"Red Team Has 20 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+48
INDIRI4
SUBI4
CNSTI4 35000
NEI4 $268
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3452
DIVI4
ARGI4
ADDRGP4 $272
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $268
line 546
;546:			if(level.time-level.blueScoreTime == 30000)	{ trap_SendServerCommand( client - level.clients, "cp \"Red Team Has 25 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+48
INDIRI4
SUBI4
CNSTI4 30000
NEI4 $273
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3452
DIVI4
ARGI4
ADDRGP4 $277
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $273
line 547
;547:			if(level.time-level.blueScoreTime == 25000)	{ trap_SendServerCommand( client - level.clients, "cp \"Red Team Has 30 Sec\n To Build Power Core!\n\"" ); }	
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+48
INDIRI4
SUBI4
CNSTI4 25000
NEI4 $278
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3452
DIVI4
ARGI4
ADDRGP4 $282
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $278
line 549
;548:
;549:		}
LABELV $250
line 550
;550:		if ((client->sess.sessionTeam == TEAM_BLUE) && ( level.blueNeedMC == 1))
ADDRLP4 0
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $283
ADDRGP4 level+9296
INDIRI4
CNSTI4 1
NEI4 $283
line 551
;551:		{
line 552
;552:			if(level.time-level.redScoreTime == 50000)	{ trap_SendServerCommand( client - level.clients, "cp \"Blue Team Has 5 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+44
INDIRI4
SUBI4
CNSTI4 50000
NEI4 $286
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3452
DIVI4
ARGI4
ADDRGP4 $290
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $286
line 553
;553:			if(level.time-level.redScoreTime == 45000)	{ trap_SendServerCommand( client - level.clients, "cp \"Blue Team Has 10 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+44
INDIRI4
SUBI4
CNSTI4 45000
NEI4 $291
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3452
DIVI4
ARGI4
ADDRGP4 $295
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $291
line 554
;554:			if(level.time-level.redScoreTime == 40000)	{ trap_SendServerCommand( client - level.clients, "cp \"Blue Team Has 15 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+44
INDIRI4
SUBI4
CNSTI4 40000
NEI4 $296
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3452
DIVI4
ARGI4
ADDRGP4 $300
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $296
line 555
;555:			if(level.time-level.redScoreTime == 35000)	{ trap_SendServerCommand( client - level.clients, "cp \"Blue Team Has 20 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+44
INDIRI4
SUBI4
CNSTI4 35000
NEI4 $301
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3452
DIVI4
ARGI4
ADDRGP4 $305
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $301
line 556
;556:			if(level.time-level.redScoreTime == 30000)	{ trap_SendServerCommand( client - level.clients, "cp \"Blue Team Has 25 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+44
INDIRI4
SUBI4
CNSTI4 30000
NEI4 $306
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3452
DIVI4
ARGI4
ADDRGP4 $310
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $306
line 557
;557:			if(level.time-level.redScoreTime == 25000)	{ trap_SendServerCommand( client - level.clients, "cp \"Blue Team Has 30 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+44
INDIRI4
SUBI4
CNSTI4 25000
NEI4 $311
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3452
DIVI4
ARGI4
ADDRGP4 $315
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $311
line 558
;558:		}
LABELV $283
line 560
;559:
;560:	}
LABELV $247
line 565
;561:
;562:
;563:
;564:
;565:}
LABELV $204
endproc ClientTimerActions 20 12
export ClientIntermissionThink
proc ClientIntermissionThink 24 0
line 572
;566:
;567:/*
;568:====================
;569:ClientIntermissionThink
;570:====================
;571:*/
;572:void ClientIntermissionThink( gclient_t *client ) {
line 573
;573:	client->ps.eFlags &= ~EF_TALK;
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
line 574
;574:	client->ps.eFlags &= ~EF_FIRING;
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
line 579
;575:
;576:	// the level will exit when everyone wants to or after timeouts
;577:
;578:	// swap and latch button actions
;579:	client->oldbuttons = client->buttons;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 2592
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 2588
ADDP4
INDIRI4
ASGNI4
line 580
;580:	client->buttons = client->pers.cmd.buttons;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 2588
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
ASGNI4
line 581
;581:	if ( client->buttons & ( BUTTON_ATTACK | BUTTON_USE_HOLDABLE ) & ( client->oldbuttons ^ client->buttons ) ) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
CNSTI4 2588
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 5
BANDI4
ADDRLP4 16
INDIRP4
CNSTI4 2592
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
BXORI4
BANDI4
CNSTI4 0
EQI4 $317
line 583
;582:		// this used to be an ^1 but once a player says ready, it should stick
;583:		client->readyToExit = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2580
ADDP4
CNSTI4 1
ASGNI4
line 584
;584:	}
LABELV $317
line 585
;585:}
LABELV $316
endproc ClientIntermissionThink 24 0
export ClientEvents
proc ClientEvents 96 32
line 596
;586:
;587:
;588:/*
;589:================
;590:ClientEvents
;591:
;592:Events will be passed on to the clients for presentation,
;593:but any server game effects are handled here
;594:================
;595:*/
;596:void ClientEvents( gentity_t *ent, int oldEventSequence ) {
line 607
;597:	int		i,j; // , j; unreferenced - Shafe - trep
;598:	int		event;
;599:	gclient_t *client;
;600:	int		damage;
;601:	vec3_t	dir;
;602:	vec3_t	origin, angles;
;603:	qboolean	fired;
;604:	gitem_t *item; // unreferenced - Shafe - trep
;605:	gentity_t *drop; // unreferenced - Shafe - trep
;606:
;607:	client = ent->client;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 609
;608:
;609:	if ( oldEventSequence < client->ps.eventSequence - MAX_PS_EVENTS ) {
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
GEI4 $320
line 610
;610:		oldEventSequence = client->ps.eventSequence - MAX_PS_EVENTS;
ADDRFP4 4
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 611
;611:	}
LABELV $320
line 612
;612:	for ( i = oldEventSequence ; i < client->ps.eventSequence ; i++ ) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 $325
JUMPV
LABELV $322
line 613
;613:		event = client->ps.events[ i & (MAX_PS_EVENTS-1) ];
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
line 615
;614:
;615:		switch ( event ) {
ADDRLP4 72
CNSTI4 11
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 72
INDIRI4
EQI4 $328
ADDRLP4 4
INDIRI4
CNSTI4 12
EQI4 $328
ADDRLP4 4
INDIRI4
ADDRLP4 72
INDIRI4
LTI4 $327
LABELV $344
ADDRLP4 4
INDIRI4
CNSTI4 23
LTI4 $327
ADDRLP4 4
INDIRI4
CNSTI4 31
GTI4 $327
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $345-92
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $345
address $339
address $340
address $327
address $341
address $342
address $327
address $327
address $327
address $343
code
LABELV $328
line 618
;616:		case EV_FALL_MEDIUM:
;617:		case EV_FALL_FAR:
;618:			if ( ent->s.eType != ET_PLAYER ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
EQI4 $329
line 619
;619:				break;		// not in the player model
ADDRGP4 $327
JUMPV
LABELV $329
line 621
;620:			}
;621:			if ( g_dmflags.integer & DF_NO_FALLING ) {
ADDRGP4 g_dmflags+12
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $331
line 622
;622:				break;
ADDRGP4 $327
JUMPV
LABELV $331
line 624
;623:			}
;624:			if ( event == EV_FALL_FAR ) {
ADDRLP4 4
INDIRI4
CNSTI4 12
NEI4 $334
line 625
;625:				damage = 10;
ADDRLP4 24
CNSTI4 10
ASGNI4
line 626
;626:			} else {
ADDRGP4 $335
JUMPV
LABELV $334
line 627
;627:				damage = 5;
ADDRLP4 24
CNSTI4 5
ASGNI4
line 628
;628:			}
LABELV $335
line 629
;629:			VectorSet (dir, 0, 0, 1);
ADDRLP4 80
CNSTF4 0
ASGNF4
ADDRLP4 12
ADDRLP4 80
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 80
INDIRF4
ASGNF4
ADDRLP4 12+8
CNSTF4 1065353216
ASGNF4
line 630
;630:			ent->pain_debounce_time = level.time + 200;	// no normal pain sound
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 631
;631:			G_Damage (ent, NULL, NULL, NULL, NULL, damage, 0, MOD_FALLING);
ADDRFP4 0
INDIRP4
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
CNSTP4 0
ASGNP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 88
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
line 632
;632:			break;
ADDRGP4 $327
JUMPV
LABELV $339
line 635
;633:
;634:		case EV_FIRE_WEAPON:
;635:			FireWeapon( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 FireWeapon
CALLV
pop
line 636
;636:			break;
ADDRGP4 $327
JUMPV
LABELV $340
line 640
;637:
;638:		// Shafe - Trep - Alt Fire
;639:		case EV_FIRE_WEAPON2: 
;640:			FireWeapon2( ent ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 FireWeapon2
CALLV
pop
line 641
;641:			break;
ADDRGP4 $327
JUMPV
LABELV $341
line 694
;642:
;643:		case EV_USE_ITEM1:		// teleporter
;644:			// drop flags in CTF
;645:			//Team_DropFlags( ent );
;646:			/* Shafe - Trep - This is now in g_team.c - Keeping it here only for reference
;647:			item = NULL;
;648:			j = 0;
;649:
;650:			if ( ent->client->ps.powerups[ PW_REDFLAG ] ) {
;651:				item = BG_FindItemForPowerup( PW_REDFLAG );
;652:				j = PW_REDFLAG;
;653:			} else if ( ent->client->ps.powerups[ PW_BLUEFLAG ] ) {
;654:				item = BG_FindItemForPowerup( PW_BLUEFLAG );
;655:				j = PW_BLUEFLAG;
;656:			} else if ( ent->client->ps.powerups[ PW_NEUTRALFLAG ] ) {
;657:				item = BG_FindItemForPowerup( PW_NEUTRALFLAG );
;658:				j = PW_NEUTRALFLAG;
;659:			}
;660:
;661:			if ( item ) {
;662:				drop = Drop_Item( ent, item, 0 );
;663:				// decide how many seconds it has left
;664:				drop->count = ( ent->client->ps.powerups[ j ] - level.time ) / 1000;
;665:				if ( drop->count < 1 ) {
;666:					drop->count = 1;
;667:				}
;668:
;669:				ent->client->ps.powerups[ j ] = 0;
;670:			} */
;671:#ifdef MISSIONPACK
;672:			if ( g_gametype.integer == GT_HARVESTER ) {
;673:				if ( ent->client->ps.generic1 > 0 ) {
;674:					if ( ent->client->sess.sessionTeam == TEAM_RED ) {
;675:						item = BG_FindItem( "Blue Cube" );
;676:					} else {
;677:						item = BG_FindItem( "Red Cube" );
;678:					}
;679:					if ( item ) {
;680:						for ( j = 0; j < ent->client->ps.generic1; j++ ) {
;681:							drop = Drop_Item( ent, item, 0 );
;682:							if ( ent->client->sess.sessionTeam == TEAM_RED ) {
;683:								drop->spawnflags = TEAM_BLUE;
;684:							} else {
;685:								drop->spawnflags = TEAM_RED;
;686:							}
;687:						}
;688:					}
;689:					ent->client->ps.generic1 = 0;
;690:				}
;691:			}
;692:#endif
;693://			PrintMsg( NULL, "%i" S_COLOR_WHITE " DEBUG: USE Teleporter\n", ent->item->giTag ); // Shafe - Debug
;694:			SelectSpawnPoint( ent->client->ps.origin, origin, angles );
ADDRFP4 0
INDIRP4
CNSTI4 524
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
line 695
;695:			TeleportPlayer( ent, origin, angles );
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
line 698
;696:
;697:
;698:			break;
ADDRGP4 $327
JUMPV
LABELV $342
line 702
;699:
;700:		case EV_USE_ITEM2:		// medkit
;701://			PrintMsg( NULL, "%i" S_COLOR_WHITE " DEBUG: USE Medkit\n", ent->item->giTag ); // Shafe - Debug
;702:			ent->health = ent->client->ps.stats[STAT_MAX_HEALTH] + 25;
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 748
ADDP4
ADDRLP4 92
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 25
ADDI4
ASGNI4
line 703
;703:			break;
ADDRGP4 $327
JUMPV
LABELV $343
line 727
;704:
;705:		
;706:#ifdef MISSIONPACK
;707:		case EV_USE_ITEM3:		// kamikaze
;708:			// make sure the invulnerability is off
;709:			ent->client->invulnerabilityTime = 0;
;710:			// start the kamikze
;711:			G_StartKamikaze( ent );
;712:			break;
;713:
;714:		case EV_USE_ITEM4:		// portal
;715:			if( ent->client->portalID ) {
;716:				DropPortalSource( ent );
;717:			}
;718:			else {
;719:				DropPortalDestination( ent );
;720:			}
;721:			break;
;722:		case EV_USE_ITEM5:		// invulnerability
;723:			ent->client->invulnerabilityTime = level.time + 10000;
;724:			break;
;725:#endif
;726:		case EV_USE_ITEM6:		// drop flags? Shafe - Trep
;727:			Team_DropFlags( ent ); // Shafe - Trep - Drop Flags  - This doesnt seem to work.. 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Team_DropFlags
CALLV
pop
line 728
;728:			break;
line 731
;729:
;730:		default:
;731:			break;
LABELV $327
line 733
;732:		}
;733:	}
LABELV $323
line 612
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $325
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
LTI4 $322
line 735
;734:
;735:}
LABELV $319
endproc ClientEvents 96 32
export SendPendingPredictableEvents
proc SendPendingPredictableEvents 44 12
line 787
;736:
;737:#ifdef MISSIONPACK
;738:/*
;739:==============
;740:StuckInOtherClient
;741:==============
;742:*/
;743:static int StuckInOtherClient(gentity_t *ent) {
;744:	int i;
;745:	gentity_t	*ent2;
;746:
;747:	ent2 = &g_entities[0];
;748:	for ( i = 0; i < MAX_CLIENTS; i++, ent2++ ) {
;749:		if ( ent2 == ent ) {
;750:			continue;
;751:		}
;752:		if ( !ent2->inuse ) {
;753:			continue;
;754:		}
;755:		if ( !ent2->client ) {
;756:			continue;
;757:		}
;758:		if ( ent2->health <= 0 ) {
;759:			continue;
;760:		}
;761:		//
;762:		if (ent2->r.absmin[0] > ent->r.absmax[0])
;763:			continue;
;764:		if (ent2->r.absmin[1] > ent->r.absmax[1])
;765:			continue;
;766:		if (ent2->r.absmin[2] > ent->r.absmax[2])
;767:			continue;
;768:		if (ent2->r.absmax[0] < ent->r.absmin[0])
;769:			continue;
;770:		if (ent2->r.absmax[1] < ent->r.absmin[1])
;771:			continue;
;772:		if (ent2->r.absmax[2] < ent->r.absmin[2])
;773:			continue;
;774:		return qtrue;
;775:	}
;776:	return qfalse;
;777:}
;778:#endif
;779:
;780:void BotTestSolid(vec3_t origin);
;781:
;782:/*
;783:==============
;784:SendPendingPredictableEvents
;785:==============
;786:*/
;787:void SendPendingPredictableEvents( playerState_t *ps ) {
line 793
;788:	gentity_t *t;
;789:	int event, seq;
;790:	int extEvent, number;
;791:
;792:	// if there are still events pending
;793:	if ( ps->entityEventSequence < ps->eventSequence ) {
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
GEI4 $348
line 796
;794:		// create a temporary entity for this event which is sent to everyone
;795:		// except the client who generated the event
;796:		seq = ps->entityEventSequence & (MAX_PS_EVENTS-1);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 797
;797:		event = ps->events[ seq ] | ( ( ps->entityEventSequence & 3 ) << 8 );
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
line 799
;798:		// set external event to zero before calling BG_PlayerStateToEntityState
;799:		extEvent = ps->externalEvent;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
ASGNI4
line 800
;800:		ps->externalEvent = 0;
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
CNSTI4 0
ASGNI4
line 802
;801:		// create temporary entity for event
;802:		t = G_TempEntity( ps->origin, event );
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
line 803
;803:		number = t->s.number;
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 804
;804:		BG_PlayerStateToEntityState( ps, &t->s, qtrue );
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
line 805
;805:		t->s.number = number;
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ASGNI4
line 806
;806:		t->s.eType = ET_EVENTS + event;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 14
ADDI4
ASGNI4
line 807
;807:		t->s.eFlags |= EF_PLAYER_EVENT;
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
line 808
;808:		t->s.otherEntityNum = ps->clientNum;
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
line 810
;809:		// send to everyone except the client who generated the event
;810:		t->r.svFlags |= SVF_NOTSINGLECLIENT;
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 432
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
line 811
;811:		t->r.singleClient = ps->clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 813
;812:		// set back external event
;813:		ps->externalEvent = extEvent;
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 814
;814:	}
LABELV $348
line 815
;815:}
LABELV $347
endproc SendPendingPredictableEvents 44 12
export ClientThink_real
proc ClientThink_real 320 12
line 828
;816:
;817:/*
;818:==============
;819:ClientThink
;820:
;821:This will be called once for each client frame, which will
;822:usually be a couple times for each server frame on fast clients.
;823:
;824:If "g_synchronousClients 1" is set, this will be called exactly
;825:once for each server frame, which makes for smooth demo recording.
;826:==============
;827:*/
;828:void ClientThink_real( gentity_t *ent ) {
line 835
;829:	gclient_t	*client;
;830:	pmove_t		pm;
;831:	int			oldEventSequence;
;832:	int			msec;
;833:	usercmd_t	*ucmd;
;834:
;835:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 838
;836:
;837:	// don't think if the client is not yet connected (and thus not yet spawned in)
;838:	if (client->pers.connected != CON_CONNECTED) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $351
line 839
;839:		return;
ADDRGP4 $350
JUMPV
LABELV $351
line 842
;840:	}
;841:	// mark the time, so the connection sprite can be removed
;842:	ucmd = &ent->client->pers.cmd;
ADDRLP4 236
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 472
ADDP4
ASGNP4
line 845
;843:
;844:	// sanity check the command time to prevent speedup cheating
;845:	if ( ucmd->serverTime > level.time + 200 ) {
ADDRLP4 236
INDIRP4
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
LEI4 $353
line 846
;846:		ucmd->serverTime = level.time + 200;
ADDRLP4 236
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 848
;847://		G_Printf("serverTime <<<<<\n" );
;848:	}
LABELV $353
line 849
;849:	if ( ucmd->serverTime < level.time - 1000 ) {
ADDRLP4 236
INDIRP4
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
SUBI4
GEI4 $357
line 850
;850:		ucmd->serverTime = level.time - 1000;
ADDRLP4 236
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
SUBI4
ASGNI4
line 852
;851://		G_Printf("serverTime >>>>>\n" );
;852:	} 
LABELV $357
line 859
;853:
;854:
;855://unlagged - backward reconciliation #4
;856:	// frameOffset should be about the number of milliseconds into a frame 
;857:	// this command packet was received, depending on how fast the server
;858:	// does a G_RunFrame()
;859:	client->frameOffset = trap_Milliseconds() - level.frameStartTime;
ADDRLP4 248
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 3444
ADDP4
ADDRLP4 248
INDIRI4
ADDRGP4 level+9224
INDIRI4
SUBI4
ASGNI4
line 865
;860://unlagged - backward reconciliation #4
;861:
;862:
;863://unlagged - lag simulation #3
;864:	// if the client wants to simulate outgoing packet loss
;865:	if ( client->pers.plOut ) {
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
CNSTI4 0
EQI4 $362
line 867
;866:		// see if a random value is below the threshhold
;867:		float thresh = (float)client->pers.plOut / 100.0f;
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
line 868
;868:		if ( random() < thresh ) {
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
GEF4 $364
line 870
;869:			// do nothing at all if it is - this is a lost command
;870:			return;
ADDRGP4 $350
JUMPV
LABELV $364
line 872
;871:		}
;872:	}
LABELV $362
line 881
;873://unlagged - lag simulation #3
;874:
;875:
;876://unlagged - true ping
;877:	// save the estimated ping in a queue for averaging later
;878:
;879:	// we use level.previousTime to account for 50ms lag correction
;880:	// besides, this will turn out numbers more like what players are used to
;881:	client->pers.pingsamples[client->pers.samplehead] = level.previousTime + client->frameOffset - ucmd->serverTime;
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
CNSTI4 3444
ADDP4
INDIRI4
ADDI4
ADDRLP4 236
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 882
;882:	client->pers.samplehead++;
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
line 883
;883:	if ( client->pers.samplehead >= NUM_PING_SAMPLES ) {
ADDRLP4 0
INDIRP4
CNSTI4 2440
ADDP4
INDIRI4
CNSTI4 64
LTI4 $367
line 884
;884:		client->pers.samplehead -= NUM_PING_SAMPLES;
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
line 885
;885:	}
LABELV $367
line 888
;886:
;887:	// initialize the real ping
;888:	if ( g_truePing.integer ) {
ADDRGP4 g_truePing+12
INDIRI4
CNSTI4 0
EQI4 $369
line 889
;889:		int i, sum = 0;
ADDRLP4 264
CNSTI4 0
ASGNI4
line 892
;890:
;891:		// get an average of the samples we saved up
;892:		for ( i = 0; i < NUM_PING_SAMPLES; i++ ) {
ADDRLP4 260
CNSTI4 0
ASGNI4
LABELV $372
line 893
;893:			sum += client->pers.pingsamples[i];
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
line 894
;894:		}
LABELV $373
line 892
ADDRLP4 260
ADDRLP4 260
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 64
LTI4 $372
line 896
;895:
;896:		client->pers.realPing = sum / NUM_PING_SAMPLES;
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
ADDRLP4 264
INDIRI4
CNSTI4 64
DIVI4
ASGNI4
line 897
;897:	}
ADDRGP4 $370
JUMPV
LABELV $369
line 898
;898:	else {
line 900
;899:		// if g_truePing is off, use the normal ping
;900:		client->pers.realPing = client->ps.ping;
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
line 901
;901:	}
LABELV $370
line 907
;902://unlagged - true ping
;903:
;904:
;905://unlagged - lag simulation #2
;906:	// keep a queue of past commands
;907:	client->pers.cmdqueue[client->pers.cmdhead] = client->pers.cmd;
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
line 908
;908:	client->pers.cmdhead++;
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
line 909
;909:	if ( client->pers.cmdhead >= MAX_LATENT_CMDS ) {
ADDRLP4 0
INDIRP4
CNSTI4 2176
ADDP4
INDIRI4
CNSTI4 64
LTI4 $376
line 910
;910:		client->pers.cmdhead -= MAX_LATENT_CMDS;
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
line 911
;911:	}
LABELV $376
line 914
;912:
;913:	// if the client wants latency in commands (client-to-server latency)
;914:	if ( client->pers.latentCmds ) {
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 0
EQI4 $378
line 916
;915:		// save the actual command time
;916:		int time = ucmd->serverTime;
ADDRLP4 272
ADDRLP4 236
INDIRP4
INDIRI4
ASGNI4
line 919
;917:
;918:		// find out which index in the queue we want
;919:		int cmdindex = client->pers.cmdhead - client->pers.latentCmds - 1;
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
ADDRGP4 $381
JUMPV
LABELV $380
line 920
;920:		while ( cmdindex < 0 ) {
line 921
;921:			cmdindex += MAX_LATENT_CMDS;
ADDRLP4 268
ADDRLP4 268
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 922
;922:		}
LABELV $381
line 920
ADDRLP4 268
INDIRI4
CNSTI4 0
LTI4 $380
line 925
;923:
;924:		// read in the old command
;925:		client->pers.cmd = client->pers.cmdqueue[cmdindex];
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
line 928
;926:
;927:		// adjust the real ping to reflect the new latency
;928:		client->pers.realPing += time - ucmd->serverTime;
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
line 929
;929:	}
LABELV $378
line 937
;930://unlagged - lag simulation #2
;931:
;932:
;933://unlagged - backward reconciliation #4
;934:	// save the command time *before* pmove_fixed messes with the serverTime,
;935:	// and *after* lag simulation messes with it :)
;936:	// attackTime will be used for backward reconciliation later (time shift)
;937:	client->attackTime = ucmd->serverTime;
ADDRLP4 0
INDIRP4
CNSTI4 2716
ADDP4
ADDRLP4 236
INDIRP4
INDIRI4
ASGNI4
line 944
;938://unlagged - backward reconciliation #4
;939:
;940:
;941://unlagged - smooth clients #1
;942:	// keep track of this for later - we'll use this to decide whether or not
;943:	// to send extrapolated positions for this client
;944:	client->lastUpdateFrame = level.framenum;
ADDRLP4 0
INDIRP4
CNSTI4 3448
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 950
;945://unlagged - smooth clients #1
;946:
;947:
;948://unlagged - lag simulation #1
;949:	// if the client is adding latency to received snapshots (server-to-client latency)
;950:	if ( client->pers.latentSnaps ) {
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 0
EQI4 $384
line 952
;951:		// adjust the real ping
;952:		client->pers.realPing += client->pers.latentSnaps * (1000 / sv_fps.integer);
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
line 954
;953:		// adjust the attack time so backward reconciliation will work
;954:		client->attackTime -= client->pers.latentSnaps * (1000 / sv_fps.integer);
ADDRLP4 280
ADDRLP4 0
INDIRP4
CNSTI4 2716
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
line 955
;955:	}
LABELV $384
line 961
;956://unlagged - lag simulation #1
;957:
;958:
;959://unlagged - true ping
;960:	// make sure the true ping is over 0 - with cl_timenudge it can be less
;961:	if ( client->pers.realPing < 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
INDIRI4
CNSTI4 0
GEI4 $388
line 962
;962:		client->pers.realPing = 0;
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
CNSTI4 0
ASGNI4
line 963
;963:	}
LABELV $388
line 967
;964://unlagged - true ping
;965:
;966:
;967:	msec = ucmd->serverTime - client->ps.commandTime;
ADDRLP4 240
ADDRLP4 236
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 970
;968:	// following others may result in bad times, but we still want
;969:	// to check for follow toggles
;970:	if ( msec < 1 && client->sess.spectatorState != SPECTATOR_FOLLOW ) {
ADDRLP4 240
INDIRI4
CNSTI4 1
GEI4 $390
ADDRLP4 0
INDIRP4
CNSTI4 2560
ADDP4
INDIRI4
CNSTI4 2
EQI4 $390
line 971
;971:		return;
ADDRGP4 $350
JUMPV
LABELV $390
line 973
;972:	}
;973:	if ( msec > 200 ) {
ADDRLP4 240
INDIRI4
CNSTI4 200
LEI4 $392
line 974
;974:		msec = 200;
ADDRLP4 240
CNSTI4 200
ASGNI4
line 975
;975:	}
LABELV $392
line 977
;976:
;977:	if ( pmove_msec.integer < 8 ) {
ADDRGP4 pmove_msec+12
INDIRI4
CNSTI4 8
GEI4 $394
line 978
;978:		trap_Cvar_Set("pmove_msec", "8");
ADDRGP4 $397
ARGP4
ADDRGP4 $398
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 979
;979:	}
ADDRGP4 $395
JUMPV
LABELV $394
line 980
;980:	else if (pmove_msec.integer > 33) {
ADDRGP4 pmove_msec+12
INDIRI4
CNSTI4 33
LEI4 $399
line 981
;981:		trap_Cvar_Set("pmove_msec", "33");
ADDRGP4 $397
ARGP4
ADDRGP4 $402
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 982
;982:	}
LABELV $399
LABELV $395
line 984
;983:
;984:	if ( pmove_fixed.integer || client->pers.pmoveFixed ) {
ADDRLP4 268
CNSTI4 0
ASGNI4
ADDRGP4 pmove_fixed+12
INDIRI4
ADDRLP4 268
INDIRI4
NEI4 $406
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
ADDRLP4 268
INDIRI4
EQI4 $403
LABELV $406
line 985
;985:		ucmd->serverTime = ((ucmd->serverTime + pmove_msec.integer-1) / pmove_msec.integer) * pmove_msec.integer;
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
line 988
;986:		//if (ucmd->serverTime - client->ps.commandTime <= 0)
;987:		//	return;
;988:	}
LABELV $403
line 993
;989:
;990:	//
;991:	// check for exiting intermission
;992:	//
;993:	if ( level.intermissiontime ) {
ADDRGP4 level+9140
INDIRI4
CNSTI4 0
EQI4 $410
line 994
;994:		ClientIntermissionThink( client );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ClientIntermissionThink
CALLV
pop
line 995
;995:		return;
ADDRGP4 $350
JUMPV
LABELV $410
line 999
;996:	}
;997:
;998:	// spectators don't do much
;999:	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $413
line 1000
;1000:		if ( client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRLP4 0
INDIRP4
CNSTI4 2560
ADDP4
INDIRI4
CNSTI4 3
NEI4 $415
line 1001
;1001:			return;
ADDRGP4 $350
JUMPV
LABELV $415
line 1003
;1002:		}
;1003:		SpectatorThink( ent, ucmd );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 236
INDIRP4
ARGP4
ADDRGP4 SpectatorThink
CALLV
pop
line 1004
;1004:		return;
ADDRGP4 $350
JUMPV
LABELV $413
line 1008
;1005:	}
;1006:
;1007:	// check for inactivity timer, but never drop the local client of a non-dedicated server
;1008:	if ( !ClientInactivityTimer( client ) ) {
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
NEI4 $417
line 1009
;1009:		return;
ADDRGP4 $350
JUMPV
LABELV $417
line 1013
;1010:	}
;1011:
;1012:	// clear the rewards if time
;1013:	if ( level.time > client->rewardTime ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 2676
ADDP4
INDIRI4
LEI4 $419
line 1014
;1014:		client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
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
line 1015
;1015:	}
LABELV $419
line 1017
;1016:
;1017:	if ( client->noclip ) {
ADDRLP4 0
INDIRP4
CNSTI4 2584
ADDP4
INDIRI4
CNSTI4 0
EQI4 $422
line 1018
;1018:		client->ps.pm_type = PM_NOCLIP;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 1
ASGNI4
line 1019
;1019:	} else if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 $423
JUMPV
LABELV $422
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $424
line 1020
;1020:		client->ps.pm_type = PM_DEAD;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1021
;1021:	} else {
ADDRGP4 $425
JUMPV
LABELV $424
line 1022
;1022:		client->ps.pm_type = PM_NORMAL;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 1023
;1023:	}
LABELV $425
LABELV $423
line 1025
;1024:
;1025:	client->ps.gravity = g_gravity.value;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDRGP4 g_gravity+8
INDIRF4
CVFI4 4
ASGNI4
line 1028
;1026:
;1027:	// set speed
;1028:	client->ps.speed = g_speed.value;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 g_speed+8
INDIRF4
CVFI4 4
ASGNI4
line 1036
;1029:
;1030:#ifdef MISSIONPACK
;1031:	if( bg_itemlist[client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_SCOUT ) {
;1032:		client->ps.speed *= 1.5;
;1033:	}
;1034:	else
;1035:#endif
;1036:	if ( client->ps.powerups[PW_HASTE] ) {
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
CNSTI4 0
EQI4 $428
line 1037
;1037:		client->ps.speed *= 1.3;
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
line 1038
;1038:	}
LABELV $428
line 1040
;1039:
;1040:	if ( g_entities[client->ps.clientNum].immobilized == qtrue)
CNSTI4 916
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+912
ADDP4
INDIRI4
CNSTI4 1
NEI4 $430
line 1041
;1041:	{
line 1042
;1042:		client->ps.speed = 50;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 50
ASGNI4
line 1043
;1043:		if (g_entities[client->ps.clientNum].health < 8) { g_entities[client->ps.clientNum].immobilized = qfalse; }
CNSTI4 916
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+748
ADDP4
INDIRI4
CNSTI4 8
GEI4 $433
CNSTI4 916
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+912
ADDP4
CNSTI4 0
ASGNI4
LABELV $433
line 1044
;1044:	}
LABELV $430
line 1059
;1045:
;1046:
;1047:
;1048:
;1049:
;1050:	// Let go of the hook if we aren't firing
;1051:	/*  - Shafe - Trep - Commented out for offhand grapple
;1052:	if ( client->ps.weapon == WP_GRAPPLING_HOOK &&
;1053:		client->hook && !( ucmd->buttons & BUTTON_ATTACK ) ) {
;1054:		Weapon_HookFree(client->hook);
;1055:	}
;1056:	*/ 
;1057:
;1058:	// set up for pmove
;1059:	oldEventSequence = client->ps.eventSequence;
ADDRLP4 244
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 1061
;1060:
;1061:	memset (&pm, 0, sizeof(pm));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 232
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1065
;1062:
;1063:	// check for the hit-scan gauntlet, don't let the action
;1064:	// go through as an attack unless it actually hits something
;1065:	if ( client->ps.weapon == WP_GAUNTLET && !( ucmd->buttons & BUTTON_TALK ) &&
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
NEI4 $437
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
NEI4 $437
ADDRLP4 280
INDIRI4
ADDRLP4 276
INDIRI4
BANDI4
ADDRLP4 284
INDIRI4
NEI4 $439
ADDRLP4 280
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 284
INDIRI4
EQI4 $437
LABELV $439
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
GTI4 $437
line 1066
;1066:		( (ucmd->buttons & BUTTON_ATTACK) || (ucmd->buttons & 32) ) && client->ps.weaponTime <= 0 ) { // Shafe - Trep - Alt Fire
line 1068
;1067:		//( ucmd->buttons & BUTTON_ATTACK ) && client->ps.weaponTime <= 0 ) {
;1068:		pm.gauntletHit = CheckGauntletAttack( ent );
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
line 1069
;1069:	}
LABELV $437
line 1071
;1070:
;1071:	if ( ent->flags & FL_FORCE_GESTURE ) {
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $441
line 1072
;1072:		ent->flags &= ~FL_FORCE_GESTURE;
ADDRLP4 288
ADDRFP4 0
INDIRP4
CNSTI4 544
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
line 1073
;1073:		ent->client->pers.cmd.buttons |= BUTTON_GESTURE;
ADDRLP4 292
ADDRFP4 0
INDIRP4
CNSTI4 524
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
line 1074
;1074:	}
LABELV $441
line 1103
;1075:
;1076:#ifdef MISSIONPACK
;1077:	// check for invulnerability expansion before doing the Pmove
;1078:	if (client->ps.powerups[PW_INVULNERABILITY] ) {
;1079:		if ( !(client->ps.pm_flags & PMF_INVULEXPAND) ) {
;1080:			vec3_t mins = { -42, -42, -42 };
;1081:			vec3_t maxs = { 42, 42, 42 };
;1082:			vec3_t oldmins, oldmaxs;
;1083:
;1084:			VectorCopy (ent->r.mins, oldmins);
;1085:			VectorCopy (ent->r.maxs, oldmaxs);
;1086:			// expand
;1087:			VectorCopy (mins, ent->r.mins);
;1088:			VectorCopy (maxs, ent->r.maxs);
;1089:			trap_LinkEntity(ent);
;1090:			// check if this would get anyone stuck in this player
;1091:			if ( !StuckInOtherClient(ent) ) {
;1092:				// set flag so the expanded size will be set in PM_CheckDuck
;1093:				client->ps.pm_flags |= PMF_INVULEXPAND;
;1094:			}
;1095:			// set back
;1096:			VectorCopy (oldmins, ent->r.mins);
;1097:			VectorCopy (oldmaxs, ent->r.maxs);
;1098:			trap_LinkEntity(ent);
;1099:		}
;1100:	}
;1101:#endif
;1102:
;1103:	pm.ps = &client->ps;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 1104
;1104:	pm.cmd = *ucmd;
ADDRLP4 4+4
ADDRLP4 236
INDIRP4
INDIRB
ASGNB 24
line 1105
;1105:	if ( pm.ps->pm_type == PM_DEAD ) {
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $444
line 1106
;1106:		pm.tracemask = MASK_PLAYERSOLID & ~CONTENTS_BODY;
ADDRLP4 4+28
CNSTI4 65537
ASGNI4
line 1107
;1107:	}
ADDRGP4 $445
JUMPV
LABELV $444
line 1108
;1108:	else if ( ent->r.svFlags & SVF_BOT ) {
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $447
line 1109
;1109:		pm.tracemask = MASK_PLAYERSOLID | CONTENTS_BOTCLIP;
ADDRLP4 4+28
CNSTI4 37814273
ASGNI4
line 1110
;1110:	}
ADDRGP4 $448
JUMPV
LABELV $447
line 1111
;1111:	else {
line 1112
;1112:		pm.tracemask = MASK_PLAYERSOLID;
ADDRLP4 4+28
CNSTI4 33619969
ASGNI4
line 1113
;1113:	}
LABELV $448
LABELV $445
line 1114
;1114:	pm.trace = trap_Trace;
ADDRLP4 4+224
ADDRGP4 trap_Trace
ASGNP4
line 1115
;1115:	pm.pointcontents = trap_PointContents;
ADDRLP4 4+228
ADDRGP4 trap_PointContents
ASGNP4
line 1116
;1116:	pm.debugLevel = g_debugMove.integer;
ADDRLP4 4+32
ADDRGP4 g_debugMove+12
INDIRI4
ASGNI4
line 1117
;1117:	pm.noFootsteps = ( g_dmflags.integer & DF_NO_FOOTSTEPS ) > 0;
ADDRGP4 g_dmflags+12
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
LEI4 $458
ADDRLP4 288
CNSTI4 1
ASGNI4
ADDRGP4 $459
JUMPV
LABELV $458
ADDRLP4 288
CNSTI4 0
ASGNI4
LABELV $459
ADDRLP4 4+36
ADDRLP4 288
INDIRI4
ASGNI4
line 1119
;1118:
;1119:	pm.pmove_fixed = pmove_fixed.integer | client->pers.pmoveFixed;
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
line 1120
;1120:	pm.pmove_msec = pmove_msec.integer;
ADDRLP4 4+220
ADDRGP4 pmove_msec+12
INDIRI4
ASGNI4
line 1122
;1121:
;1122:	VectorCopy( client->ps.origin, client->oldOrigin );
ADDRLP4 0
INDIRP4
CNSTI4 2600
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1139
;1123:
;1124:#ifdef MISSIONPACK
;1125:		if (level.intermissionQueued != 0 && g_singlePlayer.integer) {
;1126:			if ( level.time - level.intermissionQueued >= 1000  ) {
;1127:				pm.cmd.buttons = 0;
;1128:				pm.cmd.forwardmove = 0;
;1129:				pm.cmd.rightmove = 0;
;1130:				pm.cmd.upmove = 0;
;1131:				if ( level.time - level.intermissionQueued >= 2000 && level.time - level.intermissionQueued <= 2500 ) {
;1132:					trap_SendConsoleCommand( EXEC_APPEND, "centerview\n");
;1133:				}
;1134:				ent->client->ps.pm_type = PM_SPINTERMISSION;
;1135:			}
;1136:		}
;1137:		Pmove (&pm);
;1138:#else
;1139:		Pmove (&pm);
ADDRLP4 4
ARGP4
ADDRGP4 Pmove
CALLV
pop
line 1143
;1140:#endif
;1141:
;1142:	// save results of pmove
;1143:	if ( ent->client->ps.eventSequence != oldEventSequence ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ADDRLP4 244
INDIRI4
EQI4 $464
line 1144
;1144:		ent->eventTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1145
;1145:	}
LABELV $464
line 1158
;1146:
;1147://unlagged - smooth clients #2
;1148:	// clients no longer do extrapolation if cg_smoothClients is 1, because
;1149:	// skip correction is all handled server-side now
;1150:	// since that's the case, it makes no sense to store the extra info
;1151:	// in the client's snapshot entity, so let's save a little bandwidth
;1152:/*
;1153:	if (g_smoothClients.integer) {
;1154:		BG_PlayerStateToEntityStateExtraPolate( &ent->client->ps, &ent->s, ent->client->ps.commandTime, qtrue );
;1155:	}
;1156:	else {
;1157:*/
;1158:		BG_PlayerStateToEntityState( &ent->client->ps, &ent->s, qtrue );
ADDRLP4 296
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 296
INDIRP4
CNSTI4 524
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
line 1162
;1159://	}
;1160://unlagged - smooth clients #2
;1161:
;1162:	SendPendingPredictableEvents( &ent->client->ps );
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 SendPendingPredictableEvents
CALLV
pop
line 1171
;1163:
;1164:	/* - Shafe - Trep - Commented out for Offhand Grapple
;1165:	if ( !( ent->client->ps.eFlags & EF_FIRING ) ) {
;1166:		client->fireHeld = qfalse;		// for grapple
;1167:	}
;1168:	*/
;1169:
;1170:	// Shafe - Trep  - Offhand Grappling Hook
;1171:	if (g_gametype.integer != GT_CTF) { // Not in CTF Games
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
EQI4 $467
line 1172
;1172:		if ( (pm.cmd.buttons & 64)  && ent->client->ps.pm_type != PM_DEAD && !ent->client->hookhasbeenfired)
ADDRLP4 300
CNSTI4 0
ASGNI4
ADDRLP4 4+4+16
INDIRI4
CNSTI4 64
BANDI4
ADDRLP4 300
INDIRI4
EQI4 $470
ADDRLP4 304
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 304
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $470
ADDRLP4 304
INDIRP4
CNSTI4 2696
ADDP4
INDIRI4
ADDRLP4 300
INDIRI4
NEI4 $470
line 1173
;1173:		{
line 1174
;1174:			Weapon_GrapplingHook_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_GrapplingHook_Fire
CALLV
pop
line 1175
;1175:			ent->client->hookhasbeenfired = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2696
ADDP4
CNSTI4 1
ASGNI4
line 1176
;1176:		}
LABELV $470
line 1177
;1177:		if ( !(pm.cmd.buttons & 64)  &&	ent->client->ps.pm_type != PM_DEAD && ent->client->hookhasbeenfired && ent->client->fireHeld)
ADDRLP4 308
CNSTI4 0
ASGNI4
ADDRLP4 4+4+16
INDIRI4
CNSTI4 64
BANDI4
ADDRLP4 308
INDIRI4
NEI4 $474
ADDRLP4 312
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 312
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $474
ADDRLP4 312
INDIRP4
CNSTI4 2696
ADDP4
INDIRI4
ADDRLP4 308
INDIRI4
EQI4 $474
ADDRLP4 312
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
ADDRLP4 308
INDIRI4
EQI4 $474
line 1178
;1178:		{
line 1179
;1179:			ent->client->fireHeld = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 0
ASGNI4
line 1180
;1180:			ent->client->hookhasbeenfired = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2696
ADDP4
CNSTI4 0
ASGNI4
line 1181
;1181:		}
LABELV $474
line 1183
;1182:
;1183:		if ( client->hook && client->fireHeld == qfalse )
ADDRLP4 0
INDIRP4
CNSTI4 2692
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $478
ADDRLP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 0
NEI4 $478
line 1184
;1184:		{
line 1185
;1185:			Weapon_HookFree(client->hook);
ADDRLP4 0
INDIRP4
CNSTI4 2692
ADDP4
INDIRP4
ARGP4
ADDRGP4 Weapon_HookFree
CALLV
pop
line 1186
;1186:		}
LABELV $478
line 1187
;1187:	}
LABELV $467
line 1191
;1188:	// End Shafe - Offhand Grapple //////////////////////////////////////////////
;1189:	
;1190:	// use the snapped origin for linking so it matches client predicted versions
;1191:	VectorCopy( ent->s.pos.trBase, ent->r.currentOrigin );
ADDRLP4 300
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 300
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 300
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1193
;1192:
;1193:	VectorCopy (pm.mins, ent->r.mins);
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRLP4 4+180
INDIRB
ASGNB 12
line 1194
;1194:	VectorCopy (pm.maxs, ent->r.maxs);
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
ADDRLP4 4+192
INDIRB
ASGNB 12
line 1196
;1195:
;1196:	ent->waterlevel = pm.waterlevel;
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
ADDRLP4 4+208
INDIRI4
ASGNI4
line 1197
;1197:	ent->watertype = pm.watertype;
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
ADDRLP4 4+204
INDIRI4
ASGNI4
line 1203
;1198:
;1199:	// TryUse Here
;1200:	
;1201:
;1202:	// execute client events
;1203:	ClientEvents( ent, oldEventSequence );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 244
INDIRI4
ARGI4
ADDRGP4 ClientEvents
CALLV
pop
line 1206
;1204:
;1205:	// link entity now, after any personal teleporters have been used
;1206:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1207
;1207:	if ( !ent->client->noclip ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2584
ADDP4
INDIRI4
CNSTI4 0
NEI4 $484
line 1208
;1208:		G_TouchTriggers( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_TouchTriggers
CALLV
pop
line 1209
;1209:	}
LABELV $484
line 1212
;1210:
;1211:	// NOTE: now copy the exact origin over otherwise clients can be snapped into solid
;1212:	VectorCopy( ent->client->ps.origin, ent->r.currentOrigin );
ADDRLP4 304
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 304
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 304
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1215
;1213:
;1214:	//test for solid areas in the AAS file
;1215:	BotTestAAS(ent->r.currentOrigin);
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
ADDRGP4 BotTestAAS
CALLV
pop
line 1218
;1216:
;1217:	// touch other objects
;1218:	ClientImpacts( ent, &pm );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 ClientImpacts
CALLV
pop
line 1221
;1219:
;1220:	// save results of triggers and client events
;1221:	if (ent->client->ps.eventSequence != oldEventSequence) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ADDRLP4 244
INDIRI4
EQI4 $486
line 1222
;1222:		ent->eventTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1223
;1223:	}
LABELV $486
line 1226
;1224:
;1225:	// swap and latch button actions
;1226:	client->oldbuttons = client->buttons;
ADDRLP4 0
INDIRP4
CNSTI4 2592
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 2588
ADDP4
INDIRI4
ASGNI4
line 1227
;1227:	client->buttons = ucmd->buttons;
ADDRLP4 0
INDIRP4
CNSTI4 2588
ADDP4
ADDRLP4 236
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 1228
;1228:	client->latched_buttons |= client->buttons & ~client->oldbuttons;
ADDRLP4 316
ADDRLP4 0
INDIRP4
CNSTI4 2596
ADDP4
ASGNP4
ADDRLP4 316
INDIRP4
ADDRLP4 316
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 2588
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 2592
ADDP4
INDIRI4
BCOMI4
BANDI4
BORI4
ASGNI4
line 1231
;1229:
;1230:	// check for respawning
;1231:	if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $489
line 1233
;1232:		// wait for the attack button to be pressed
;1233:		if ( level.time > client->respawnTime ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 2664
ADDP4
INDIRI4
LEI4 $350
line 1235
;1234:			// forcerespawn is to prevent users from waiting out powerups
;1235:			if ( g_forcerespawn.integer > 0 && 
ADDRGP4 g_forcerespawn+12
INDIRI4
CNSTI4 0
LEI4 $494
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 2664
ADDP4
INDIRI4
SUBI4
CNSTI4 1000
ADDRGP4 g_forcerespawn+12
INDIRI4
MULI4
LEI4 $494
line 1236
;1236:				( level.time - client->respawnTime ) > g_forcerespawn.integer * 1000 ) {
line 1237
;1237:				respawn( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 1238
;1238:				return;
ADDRGP4 $350
JUMPV
LABELV $494
line 1242
;1239:			}
;1240:		
;1241:			// pressing attack or use is the normal respawn method
;1242:			if ( ucmd->buttons & ( BUTTON_ATTACK | BUTTON_USE_HOLDABLE ) ) {
ADDRLP4 236
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 5
BANDI4
CNSTI4 0
EQI4 $350
line 1243
;1243:				respawn( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 1244
;1244:			}
line 1245
;1245:		}
line 1246
;1246:		return;
ADDRGP4 $350
JUMPV
LABELV $489
line 1250
;1247:	}
;1248:
;1249:	// perform once-a-second actions
;1250:	ClientTimerActions( ent, msec );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 240
INDIRI4
ARGI4
ADDRGP4 ClientTimerActions
CALLV
pop
line 1251
;1251:}
LABELV $350
endproc ClientThink_real 320 12
export ClientThink
proc ClientThink 8 8
line 1260
;1252:
;1253:/*
;1254:==================
;1255:ClientThink
;1256:
;1257:A new command has arrived from the client
;1258:==================
;1259:*/
;1260:void ClientThink( int clientNum ) {
line 1263
;1261:	gentity_t *ent;
;1262:
;1263:	ent = g_entities + clientNum;
ADDRLP4 0
CNSTI4 916
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1264
;1264:	trap_GetUsercmd( clientNum, &ent->client->pers.cmd );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 472
ADDP4
ARGP4
ADDRGP4 trap_GetUsercmd
CALLV
pop
line 1275
;1265:
;1266://unlagged - smooth clients #1
;1267:	// this is handled differently now
;1268:/*
;1269:	// mark the time we got info, so we can display the
;1270:	// phone jack if they don't get any for a while
;1271:	ent->client->lastCmdTime = level.time;
;1272:*/
;1273://unlagged - smooth clients #1
;1274:
;1275:	if ( !(ent->r.svFlags & SVF_BOT) && !g_synchronousClients.integer ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 4
INDIRI4
NEI4 $502
ADDRGP4 g_synchronousClients+12
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $502
line 1276
;1276:		ClientThink_real( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ClientThink_real
CALLV
pop
line 1277
;1277:	}
LABELV $502
line 1278
;1278:}
LABELV $501
endproc ClientThink 8 8
export G_RunClient
proc G_RunClient 4 4
line 1281
;1279:
;1280:
;1281:void G_RunClient( gentity_t *ent ) {
line 1282
;1282:	if ( !(ent->r.svFlags & SVF_BOT) && !g_synchronousClients.integer ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 0
INDIRI4
NEI4 $506
ADDRGP4 g_synchronousClients+12
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $506
line 1283
;1283:		return;
ADDRGP4 $505
JUMPV
LABELV $506
line 1285
;1284:	}
;1285:	ent->client->pers.cmd.serverTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 472
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1286
;1286:	ClientThink_real( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientThink_real
CALLV
pop
line 1287
;1287:}
LABELV $505
endproc G_RunClient 4 4
export SpectatorClientEndFrame
proc SpectatorClientEndFrame 24 4
line 1296
;1288:
;1289:
;1290:/*
;1291:==================
;1292:SpectatorClientEndFrame
;1293:
;1294:==================
;1295:*/
;1296:void SpectatorClientEndFrame( gentity_t *ent ) {
line 1300
;1297:	gclient_t	*cl;
;1298:
;1299:	// if we are doing a chase cam or a remote view, grab the latest info
;1300:	if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2560
ADDP4
INDIRI4
CNSTI4 2
NEI4 $511
line 1303
;1301:		int		clientNum, flags;
;1302:
;1303:		clientNum = ent->client->sess.spectatorClient;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
ASGNI4
line 1306
;1304:
;1305:		// team follow1 and team follow2 go to whatever clients are playing
;1306:		if ( clientNum == -1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
NEI4 $513
line 1307
;1307:			clientNum = level.follow1;
ADDRLP4 4
ADDRGP4 level+352
INDIRI4
ASGNI4
line 1308
;1308:		} else if ( clientNum == -2 ) {
ADDRGP4 $514
JUMPV
LABELV $513
ADDRLP4 4
INDIRI4
CNSTI4 -2
NEI4 $516
line 1309
;1309:			clientNum = level.follow2;
ADDRLP4 4
ADDRGP4 level+356
INDIRI4
ASGNI4
line 1310
;1310:		}
LABELV $516
LABELV $514
line 1311
;1311:		if ( clientNum >= 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $519
line 1312
;1312:			cl = &level.clients[ clientNum ];
ADDRLP4 0
CNSTI4 3452
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1313
;1313:			if ( cl->pers.connected == CON_CONNECTED && cl->sess.sessionTeam != TEAM_SPECTATOR ) {
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
NEI4 $521
ADDRLP4 12
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
EQI4 $521
line 1314
;1314:				flags = (cl->ps.eFlags & ~(EF_VOTED | EF_TEAMVOTED)) | (ent->client->ps.eFlags & (EF_VOTED | EF_TEAMVOTED));
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
CNSTI4 524
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
line 1315
;1315:				ent->client->ps = cl->ps;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ADDRLP4 0
INDIRP4
INDIRB
ASGNB 468
line 1316
;1316:				ent->client->ps.pm_flags |= PMF_FOLLOW;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 524
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
line 1317
;1317:				ent->client->ps.eFlags = flags;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1318
;1318:				return;
ADDRGP4 $510
JUMPV
LABELV $521
line 1319
;1319:			} else {
line 1321
;1320:				// drop them to free spectators unless they are dedicated camera followers
;1321:				if ( ent->client->sess.spectatorClient >= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
CNSTI4 0
LTI4 $523
line 1322
;1322:					ent->client->sess.spectatorState = SPECTATOR_FREE;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2560
ADDP4
CNSTI4 1
ASGNI4
line 1323
;1323:					ClientBegin( ent->client - level.clients );
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3452
DIVI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 1324
;1324:				}
LABELV $523
line 1325
;1325:			}
line 1326
;1326:		}
LABELV $519
line 1327
;1327:	}
LABELV $511
line 1329
;1328:
;1329:	if ( ent->client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2560
ADDP4
INDIRI4
CNSTI4 3
NEI4 $525
line 1330
;1330:		ent->client->ps.pm_flags |= PMF_SCOREBOARD;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 524
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
line 1331
;1331:	} else {
ADDRGP4 $526
JUMPV
LABELV $525
line 1332
;1332:		ent->client->ps.pm_flags &= ~PMF_SCOREBOARD;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 524
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
line 1333
;1333:	}
LABELV $526
line 1334
;1334:}
LABELV $510
endproc SpectatorClientEndFrame 24 4
export ClientEndFrame
proc ClientEndFrame 52 12
line 1345
;1335:
;1336:/*
;1337:==============
;1338:ClientEndFrame
;1339:
;1340:Called at the end of each server frame for each connected client
;1341:A fast client will have multiple ClientThink for each ClientEdFrame,
;1342:while a slow client may have multiple ClientEndFrame between ClientThink.
;1343:==============
;1344:*/
;1345:void ClientEndFrame( gentity_t *ent ) {
line 1353
;1346:	int			i;
;1347:	clientPersistant_t	*pers;
;1348:
;1349://unlagged - smooth clients #1
;1350:	int frames;
;1351://unlagged - smooth clients #1
;1352:
;1353:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $528
line 1354
;1354:		SpectatorClientEndFrame( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SpectatorClientEndFrame
CALLV
pop
line 1355
;1355:		return;
ADDRGP4 $527
JUMPV
LABELV $528
line 1358
;1356:	}
;1357:
;1358:	pers = &ent->client->pers;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 468
ADDP4
ASGNP4
line 1361
;1359:
;1360:	// turn off any expired powerups
;1361:	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $530
line 1362
;1362:		if ( ent->client->ps.powerups[ i ] < level.time ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $534
line 1363
;1363:			ent->client->ps.powerups[ i ] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 1364
;1364:		}
LABELV $534
line 1365
;1365:	}
LABELV $531
line 1361
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $530
line 1398
;1366:
;1367:#ifdef MISSIONPACK
;1368:	// set powerup for player animation
;1369:	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;1370:		ent->client->ps.powerups[PW_GUARD] = level.time;
;1371:	}
;1372:	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_SCOUT ) {
;1373:		ent->client->ps.powerups[PW_SCOUT] = level.time;
;1374:	}
;1375:	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_DOUBLER ) {
;1376:		ent->client->ps.powerups[PW_DOUBLER] = level.time;
;1377:	}
;1378:	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_AMMOREGEN ) {
;1379:		ent->client->ps.powerups[PW_AMMOREGEN] = level.time;
;1380:	}
;1381:	if ( ent->client->invulnerabilityTime > level.time ) {
;1382:		ent->client->ps.powerups[PW_INVULNERABILITY] = level.time;
;1383:	}
;1384:#endif
;1385:
;1386:	// save network bandwidth
;1387:#if 0
;1388:	if ( !g_synchronousClients->integer && ent->client->ps.pm_type == PM_NORMAL ) {
;1389:		// FIXME: this must change eventually for non-sync demo recording
;1390:		VectorClear( ent->client->ps.viewangles );
;1391:	}
;1392:#endif
;1393:
;1394:	//
;1395:	// If the end of unit layout is displayed, don't give
;1396:	// the player any normal movement attributes
;1397:	//
;1398:	if ( level.intermissiontime ) {
ADDRGP4 level+9140
INDIRI4
CNSTI4 0
EQI4 $537
line 1399
;1399:		return;
ADDRGP4 $527
JUMPV
LABELV $537
line 1403
;1400:	}
;1401:
;1402:	// burn from lava, etc
;1403:	P_WorldEffects (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 P_WorldEffects
CALLV
pop
line 1406
;1404:
;1405:	// apply all the damage taken this frame
;1406:	P_DamageFeedback (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 P_DamageFeedback
CALLV
pop
line 1420
;1407:
;1408://unlagged - smooth clients #1
;1409:	// this is handled differently now
;1410:/*
;1411:	// add the EF_CONNECTION flag if we haven't gotten commands recently
;1412:	if ( level.time - ent->client->lastCmdTime > 1000 ) {
;1413:		ent->client->ps.eFlags |= EF_CONNECTION;
;1414:	} else {
;1415:		ent->client->ps.eFlags &= ~EF_CONNECTION;
;1416:	}
;1417:*/
;1418://unlagged - smooth clients #1
;1419:
;1420:	ent->client->ps.stats[STAT_HEALTH] = ent->health;	// FIXME: get rid of ent->health...
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
ASGNI4
line 1422
;1421:
;1422:	G_SetClientSound (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_SetClientSound
CALLV
pop
line 1436
;1423:
;1424:	// set the latest information
;1425://unlagged - smooth clients #2
;1426:	// clients no longer do extrapolation if cg_smoothClients is 1, because
;1427:	// skip correction is all handled server-side now
;1428:	// since that's the case, it makes no sense to store the extra info
;1429:	// in the client's snapshot entity, so let's save a little bandwidth
;1430:/*
;1431:	if (g_smoothClients.integer) {
;1432:		BG_PlayerStateToEntityStateExtraPolate( &ent->client->ps, &ent->s, ent->client->ps.commandTime, qtrue );
;1433:	}
;1434:	else {
;1435:*/
;1436:		BG_PlayerStateToEntityState( &ent->client->ps, &ent->s, qtrue );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 524
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
line 1440
;1437://	}
;1438://unlagged - smooth clients #2
;1439:
;1440:	SendPendingPredictableEvents( &ent->client->ps );
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 SendPendingPredictableEvents
CALLV
pop
line 1444
;1441:
;1442://unlagged - smooth clients #1
;1443:	// mark as not missing updates initially
;1444:	ent->client->ps.eFlags &= ~EF_CONNECTION;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 524
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
line 1447
;1445:
;1446:	// see how many frames the client has missed
;1447:	frames = level.framenum - ent->client->lastUpdateFrame - 1;
ADDRLP4 4
ADDRGP4 level+28
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 3448
ADDP4
INDIRI4
SUBI4
CNSTI4 1
SUBI4
ASGNI4
line 1450
;1448:
;1449:	// don't extrapolate more than two frames
;1450:	if ( frames > 2 ) {
ADDRLP4 4
INDIRI4
CNSTI4 2
LEI4 $541
line 1451
;1451:		frames = 2;
ADDRLP4 4
CNSTI4 2
ASGNI4
line 1454
;1452:
;1453:		// if they missed more than two in a row, show the phone jack
;1454:		ent->client->ps.eFlags |= EF_CONNECTION;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 524
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
line 1455
;1455:		ent->s.eFlags |= EF_CONNECTION;
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
line 1456
;1456:	}
LABELV $541
line 1459
;1457:
;1458:	// did the client miss any frames?
;1459:	if ( frames > 0 && g_smoothClients.integer ) {
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $543
ADDRGP4 g_smoothClients+12
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $543
line 1461
;1460:		// yep, missed one or more, so extrapolate the player's movement
;1461:		G_PredictPlayerMove( ent, (float)frames / sv_fps.integer );
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
line 1463
;1462:		// save network bandwidth
;1463:		SnapVector( ent->s.pos.trBase );
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
line 1464
;1464:	}
LABELV $543
line 1469
;1465://unlagged - smooth clients #1
;1466:
;1467://unlagged - backward reconciliation #1
;1468:	// store the client's position for backward reconciliation later
;1469:	G_StoreHistory( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_StoreHistory
CALLV
pop
line 1475
;1470://unlagged - backward reconciliation #1
;1471:
;1472:	// set the bit for the reachability area the client is currently in
;1473://	i = trap_AAS_PointReachabilityAreaIndex( ent->client->ps.origin );
;1474://	ent->client->areabits[i >> 3] |= 1 << (i & 7);
;1475:}
LABELV $527
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
LABELV $402
byte 1 51
byte 1 51
byte 1 0
align 1
LABELV $398
byte 1 56
byte 1 0
align 1
LABELV $397
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
LABELV $315
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 72
byte 1 97
byte 1 115
byte 1 32
byte 1 51
byte 1 48
byte 1 32
byte 1 83
byte 1 101
byte 1 99
byte 1 10
byte 1 32
byte 1 84
byte 1 111
byte 1 32
byte 1 66
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 80
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 32
byte 1 67
byte 1 111
byte 1 114
byte 1 101
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $310
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 72
byte 1 97
byte 1 115
byte 1 32
byte 1 50
byte 1 53
byte 1 32
byte 1 83
byte 1 101
byte 1 99
byte 1 10
byte 1 32
byte 1 84
byte 1 111
byte 1 32
byte 1 66
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 80
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 32
byte 1 67
byte 1 111
byte 1 114
byte 1 101
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $305
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 72
byte 1 97
byte 1 115
byte 1 32
byte 1 50
byte 1 48
byte 1 32
byte 1 83
byte 1 101
byte 1 99
byte 1 10
byte 1 32
byte 1 84
byte 1 111
byte 1 32
byte 1 66
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 80
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 32
byte 1 67
byte 1 111
byte 1 114
byte 1 101
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $300
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 72
byte 1 97
byte 1 115
byte 1 32
byte 1 49
byte 1 53
byte 1 32
byte 1 83
byte 1 101
byte 1 99
byte 1 10
byte 1 32
byte 1 84
byte 1 111
byte 1 32
byte 1 66
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 80
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 32
byte 1 67
byte 1 111
byte 1 114
byte 1 101
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $295
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 72
byte 1 97
byte 1 115
byte 1 32
byte 1 49
byte 1 48
byte 1 32
byte 1 83
byte 1 101
byte 1 99
byte 1 10
byte 1 32
byte 1 84
byte 1 111
byte 1 32
byte 1 66
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 80
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 32
byte 1 67
byte 1 111
byte 1 114
byte 1 101
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $290
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 72
byte 1 97
byte 1 115
byte 1 32
byte 1 53
byte 1 32
byte 1 83
byte 1 101
byte 1 99
byte 1 10
byte 1 32
byte 1 84
byte 1 111
byte 1 32
byte 1 66
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 80
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 32
byte 1 67
byte 1 111
byte 1 114
byte 1 101
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $282
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 72
byte 1 97
byte 1 115
byte 1 32
byte 1 51
byte 1 48
byte 1 32
byte 1 83
byte 1 101
byte 1 99
byte 1 10
byte 1 32
byte 1 84
byte 1 111
byte 1 32
byte 1 66
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 80
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 32
byte 1 67
byte 1 111
byte 1 114
byte 1 101
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $277
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 72
byte 1 97
byte 1 115
byte 1 32
byte 1 50
byte 1 53
byte 1 32
byte 1 83
byte 1 101
byte 1 99
byte 1 10
byte 1 32
byte 1 84
byte 1 111
byte 1 32
byte 1 66
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 80
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 32
byte 1 67
byte 1 111
byte 1 114
byte 1 101
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $272
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 72
byte 1 97
byte 1 115
byte 1 32
byte 1 50
byte 1 48
byte 1 32
byte 1 83
byte 1 101
byte 1 99
byte 1 10
byte 1 32
byte 1 84
byte 1 111
byte 1 32
byte 1 66
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 80
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 32
byte 1 67
byte 1 111
byte 1 114
byte 1 101
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $267
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 72
byte 1 97
byte 1 115
byte 1 32
byte 1 49
byte 1 53
byte 1 32
byte 1 83
byte 1 101
byte 1 99
byte 1 10
byte 1 32
byte 1 84
byte 1 111
byte 1 32
byte 1 66
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 80
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 32
byte 1 67
byte 1 111
byte 1 114
byte 1 101
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $262
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 72
byte 1 97
byte 1 115
byte 1 32
byte 1 49
byte 1 48
byte 1 32
byte 1 83
byte 1 101
byte 1 99
byte 1 10
byte 1 32
byte 1 84
byte 1 111
byte 1 32
byte 1 66
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 80
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 32
byte 1 67
byte 1 111
byte 1 114
byte 1 101
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $257
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 72
byte 1 97
byte 1 115
byte 1 32
byte 1 53
byte 1 32
byte 1 83
byte 1 101
byte 1 99
byte 1 10
byte 1 32
byte 1 84
byte 1 111
byte 1 32
byte 1 80
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 80
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 32
byte 1 67
byte 1 111
byte 1 114
byte 1 101
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $215
byte 1 103
byte 1 95
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 77
byte 1 67
byte 1 32
byte 1 34
byte 1 37
byte 1 105
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $213
byte 1 103
byte 1 95
byte 1 82
byte 1 101
byte 1 100
byte 1 77
byte 1 67
byte 1 32
byte 1 34
byte 1 37
byte 1 105
byte 1 34
byte 1 10
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
