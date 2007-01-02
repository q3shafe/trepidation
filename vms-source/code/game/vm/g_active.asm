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
proc SpectatorThink 264 12
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
;337:	if ( ( client->buttons & BUTTON_ATTACK ) && ! ( client->oldbuttons & BUTTON_ATTACK ) ) 
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
;338:	{
line 339
;339:		Cmd_FollowCycle_f( ent, 1 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
line 340
;340:	}
ADDRGP4 $181
JUMPV
LABELV $180
line 341
;341:	else if ( ( client->buttons & BUTTON_AFFIRMATIVE ) && ! ( client->oldbuttons & BUTTON_AFFIRMATIVE ) )
ADDRLP4 256
CNSTI4 32
ASGNI4
ADDRLP4 260
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 2588
ADDP4
INDIRI4
ADDRLP4 256
INDIRI4
BANDI4
ADDRLP4 260
INDIRI4
EQI4 $182
ADDRLP4 0
INDIRP4
CNSTI4 2592
ADDP4
INDIRI4
ADDRLP4 256
INDIRI4
BANDI4
ADDRLP4 260
INDIRI4
NEI4 $182
line 342
;342:	{
line 344
;343:		// Stop following when alt-fire is triggerd -Vincent
;344:		if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2560
ADDP4
INDIRI4
CNSTI4 2
NEI4 $184
line 345
;345:		{
line 346
;346:		StopFollowing( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 StopFollowing
CALLV
pop
line 347
;347:		}
LABELV $184
line 348
;348:	}
LABELV $182
LABELV $181
line 349
;349:}
LABELV $173
endproc SpectatorThink 264 12
export ClientInactivityTimer
proc ClientInactivityTimer 12 8
line 360
;350:
;351:
;352:
;353:/*
;354:=================
;355:ClientInactivityTimer
;356:
;357:Returns qfalse if the client is dropped
;358:=================
;359:*/
;360:qboolean ClientInactivityTimer( gclient_t *client ) {
line 361
;361:	if ( ! g_inactivity.integer ) {
ADDRGP4 g_inactivity+12
INDIRI4
CNSTI4 0
NEI4 $187
line 364
;362:		// give everyone some time, so if the operator sets g_inactivity during
;363:		// gameplay, everyone isn't kicked
;364:		client->inactivityTime = level.time + 60 * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 2668
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 60000
ADDI4
ASGNI4
line 365
;365:		client->inactivityWarning = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 2672
ADDP4
CNSTI4 0
ASGNI4
line 366
;366:	} else if ( client->pers.cmd.forwardmove || 
ADDRGP4 $188
JUMPV
LABELV $187
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
NEI4 $195
ADDRLP4 0
INDIRP4
CNSTI4 494
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
NEI4 $195
ADDRLP4 0
INDIRP4
CNSTI4 495
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
NEI4 $195
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 4
INDIRI4
EQI4 $191
LABELV $195
line 369
;367:		client->pers.cmd.rightmove || 
;368:		client->pers.cmd.upmove ||
;369:		(client->pers.cmd.buttons & BUTTON_ATTACK) ) {
line 370
;370:		client->inactivityTime = level.time + g_inactivity.integer * 1000;
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
line 371
;371:		client->inactivityWarning = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 2672
ADDP4
CNSTI4 0
ASGNI4
line 372
;372:	} else if ( !client->pers.localClient ) {
ADDRGP4 $192
JUMPV
LABELV $191
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 0
NEI4 $198
line 373
;373:		if ( level.time > client->inactivityTime ) {
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 2668
ADDP4
INDIRI4
LEI4 $200
line 374
;374:			trap_DropClient( client - level.clients, "Dropped due to inactivity" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3456
DIVI4
ARGI4
ADDRGP4 $203
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
line 375
;375:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $186
JUMPV
LABELV $200
line 377
;376:		}
;377:		if ( level.time > client->inactivityTime - 10000 && !client->inactivityWarning ) {
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
LEI4 $204
ADDRLP4 8
INDIRP4
CNSTI4 2672
ADDP4
INDIRI4
CNSTI4 0
NEI4 $204
line 378
;378:			client->inactivityWarning = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 2672
ADDP4
CNSTI4 1
ASGNI4
line 379
;379:			trap_SendServerCommand( client - level.clients, "cp \"Ten seconds until inactivity drop!\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3456
DIVI4
ARGI4
ADDRGP4 $207
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 380
;380:		}
LABELV $204
line 381
;381:	}
LABELV $198
LABELV $192
LABELV $188
line 382
;382:	return qtrue;
CNSTI4 1
RETI4
LABELV $186
endproc ClientInactivityTimer 12 8
export ClientTimerActions
proc ClientTimerActions 20 12
line 392
;383:}
;384:
;385:/*
;386:==================
;387:ClientTimerActions
;388:
;389:Actions that happen once a second
;390:==================
;391:*/
;392:void ClientTimerActions( gentity_t *ent, int msec ) {
line 398
;393:	gclient_t	*client;
;394:#ifdef MISSIONPACK
;395:	int			maxHealth;
;396:#endif
;397:
;398:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 399
;399:	client->timeResidual += msec;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 2708
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
ADDRGP4 $210
JUMPV
LABELV $209
line 401
;400:
;401:	while ( client->timeResidual >= 1000 ) {
line 402
;402:		client->timeResidual -= 1000;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 2708
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
line 405
;403:
;404:
;405:	if (g_GameMode.integer == 3)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 3
NEI4 $212
line 406
;406:	{
line 407
;407:		if (client->sess.sessionTeam == TEAM_RED) 
ADDRLP4 0
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 1
NEI4 $215
line 408
;408:		{
line 409
;409:			trap_SendConsoleCommand( EXEC_INSERT, va("g_RedMC \"%i\"\n", level.redCredits) );	
ADDRGP4 $217
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
line 410
;410:		}
ADDRGP4 $216
JUMPV
LABELV $215
line 412
;411:		else
;412:		{
line 413
;413:			trap_SendConsoleCommand( EXEC_INSERT, va("g_BlueMC \"%i\"\n", level.blueCredits) );
ADDRGP4 $219
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
line 414
;414:		}
LABELV $216
line 415
;415:	}
LABELV $212
line 445
;416:
;417:
;418:
;419:		// regenerate
;420:#ifdef MISSIONPACK
;421:		if( bg_itemlist[client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;422:			maxHealth = client->ps.stats[STAT_MAX_HEALTH] / 2;
;423:		}
;424:		else if ( client->ps.powerups[PW_REGEN] ) {
;425:			maxHealth = client->ps.stats[STAT_MAX_HEALTH];
;426:		}
;427:		else {
;428:			maxHealth = 0;
;429:		}
;430:		if( maxHealth ) {
;431:			if ( ent->health < maxHealth ) {
;432:				ent->health += 15;
;433:				if ( ent->health > maxHealth * 1.1 ) {
;434:					ent->health = maxHealth * 1.1;
;435:				}
;436:				G_AddEvent( ent, EV_POWERUP_REGEN, 0 );
;437:			} else if ( ent->health < maxHealth * 2) {
;438:				ent->health += 5;
;439:				if ( ent->health > maxHealth * 2 ) {
;440:					ent->health = maxHealth * 2;
;441:				}
;442:				G_AddEvent( ent, EV_POWERUP_REGEN, 0 );
;443:			}
;444:#else
;445:		if ( client->ps.powerups[PW_REGEN] ) {
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
INDIRI4
CNSTI4 0
EQI4 $221
line 446
;446:			if ( ent->health < client->ps.stats[STAT_MAX_HEALTH]) {
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
GEI4 $223
line 447
;447:				ent->health += 15;
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
line 448
;448:				if ( ent->health > client->ps.stats[STAT_MAX_HEALTH] * 1.1 ) {
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
LEF4 $225
line 449
;449:					ent->health = client->ps.stats[STAT_MAX_HEALTH] * 1.1;
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
line 450
;450:				}
LABELV $225
line 451
;451:				G_AddEvent( ent, EV_POWERUP_REGEN, 0 );
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
line 452
;452:			} else if ( ent->health < client->ps.stats[STAT_MAX_HEALTH] * 2) {
ADDRGP4 $222
JUMPV
LABELV $223
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
GEI4 $222
line 453
;453:				ent->health += 5;
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
line 454
;454:				if ( ent->health > client->ps.stats[STAT_MAX_HEALTH] * 2 ) {
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
LEI4 $229
line 455
;455:					ent->health = client->ps.stats[STAT_MAX_HEALTH] * 2;
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
line 456
;456:				}
LABELV $229
line 457
;457:				G_AddEvent( ent, EV_POWERUP_REGEN, 0 );
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
line 458
;458:			}
line 460
;459:#endif
;460:		} else {
ADDRGP4 $222
JUMPV
LABELV $221
line 462
;461:			// count down health when over max
;462:			if ( ent->health > client->ps.stats[STAT_MAX_HEALTH] ) {
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
LEI4 $231
line 463
;463:				ent->health--;
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
line 464
;464:			}
LABELV $231
line 465
;465:		}
LABELV $222
line 469
;466:
;467:
;468:		// Pulse Rifle // Machine Gun Ammo Regenerates
;469:		if (client->ps.ammo[WP_MACHINEGUN] < Max_Ammo[WP_MACHINEGUN]) 
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
ADDRGP4 Max_Ammo+8
INDIRI4
GEI4 $233
line 470
;470:		{
line 471
;471:				client->ps.ammo[WP_MACHINEGUN]+=2;
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
line 472
;472:		}
LABELV $233
line 477
;473:
;474:
;475:
;476:		// Immobilized
;477:		if ( g_entities[client->ps.clientNum].immobilized == qtrue)
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
NEI4 $236
line 478
;478:		{
line 479
;479:			client->ps.speed = 100;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 100
ASGNI4
line 480
;480:			client->ps.gravity = 1;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 1
ASGNI4
line 481
;481:			g_entities[client->ps.clientNum].s.time2 = 9;
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
line 482
;482:			g_entities[client->ps.clientNum].health--;
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
line 486
;483:			//G_Damage (g_entities[client->ps.clientNum], NULL, NULL, NULL, NULL, 1, 0, MOD_IMMOBILIZED);
;484:			//g_entities[client->ps.clientNum].s.team == TEAM_RED; // Where using this for a timer now - Typically used for buildables
;485:			// Let them go when they are about dead.
;486:			if (g_entities[client->ps.clientNum].health < 75) { g_entities[client->ps.clientNum].immobilized = qfalse; }
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
GEI4 $237
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
line 487
;487:		}	else
ADDRGP4 $237
JUMPV
LABELV $236
line 488
;488:		{
line 491
;489:			// Free them
;490:			//g_entities[client->ps.clientNum].s.team = TEAM_BLUE;
;491:			client->ps.speed = g_speed.integer;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 g_speed+12
INDIRI4
ASGNI4
line 492
;492:			client->ps.gravity = g_gravity.integer;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDRGP4 g_gravity+12
INDIRI4
ASGNI4
line 493
;493:			g_entities[client->ps.clientNum].s.time2 = 0;
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
line 494
;494:			g_entities[client->ps.clientNum].immobilized = qfalse;
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
line 495
;495:		}
LABELV $237
line 500
;496:		
;497:
;498:
;499:		// count down armor when over max
;500:		if ( client->ps.stats[STAT_ARMOR] > client->ps.stats[STAT_MAX_HEALTH] ) {
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
LEI4 $249
line 501
;501:			client->ps.stats[STAT_ARMOR]--;
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
line 502
;502:		}
LABELV $249
line 503
;503:	}
LABELV $210
line 401
ADDRLP4 0
INDIRP4
CNSTI4 2708
ADDP4
INDIRI4
CNSTI4 1000
GEI4 $209
line 543
;504:#ifdef MISSIONPACK
;505:	if( bg_itemlist[client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_AMMOREGEN ) {
;506:		int w, max, inc, t, i;
;507:    int weapList[]={WP_MACHINEGUN,WP_SHOTGUN,WP_GRENADE_LAUNCHER,WP_ROCKET_LAUNCHER,WP_LIGHTNING,WP_RAILGUN,WP_PLASMAGUN,WP_BFG,WP_NAILGUN,WP_PROX_LAUNCHER,WP_CHAINGUN};
;508:    int weapCount = sizeof(weapList) / sizeof(int);
;509:		//
;510:    for (i = 0; i < weapCount; i++) {
;511:		  w = weapList[i];
;512:
;513:		  switch(w) {
;514:			  case WP_MACHINEGUN: max = 50; inc = 4; t = 1000; break;
;515:			  case WP_SHOTGUN: max = 10; inc = 1; t = 1500; break;
;516:			  case WP_GRENADE_LAUNCHER: max = 10; inc = 1; t = 2000; break;
;517:			  case WP_ROCKET_LAUNCHER: max = 10; inc = 1; t = 1750; break;
;518:			  case WP_LIGHTNING: max = 50; inc = 5; t = 1500; break;
;519:			  case WP_RAILGUN: max = 10; inc = 1; t = 1750; break;
;520:			  case WP_PLASMAGUN: max = 50; inc = 5; t = 1500; break;
;521:			  case WP_BFG: max = 10; inc = 1; t = 4000; break;
;522:			  case WP_NAILGUN: max = 10; inc = 1; t = 1250; break;
;523:			  case WP_PROX_LAUNCHER: max = 5; inc = 1; t = 2000; break;
;524:			  case WP_CHAINGUN: max = 100; inc = 5; t = 1000; break;
;525:			  default: max = 0; inc = 0; t = 1000; break;
;526:		  }
;527:		  client->ammoTimes[w] += msec;
;528:		  if ( client->ps.ammo[w] >= max ) {
;529:			  client->ammoTimes[w] = 0;
;530:		  }
;531:		  if ( client->ammoTimes[w] >= t ) {
;532:			  while ( client->ammoTimes[w] >= t )
;533:				  client->ammoTimes[w] -= t;
;534:			  client->ps.ammo[w] += inc;
;535:			  if ( client->ps.ammo[w] > max ) {
;536:				  client->ps.ammo[w] = max;
;537:			  }
;538:		  }
;539:    }
;540:	}
;541:#endif
;542:
;543:	if (g_GameMode.integer == 3)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 3
NEI4 $251
line 544
;544:	{
line 548
;545:
;546:		// Give Warnings That An MC Is Needed
;547:		// Clean this up !
;548:		if ((client->sess.sessionTeam == TEAM_RED) && ( level.redNeedMC == 1))
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
NEI4 $254
ADDRGP4 level+9300
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $254
line 549
;549:		{
line 550
;550:			if(level.time-level.blueScoreTime == 50000)	{ trap_SendServerCommand( client - level.clients, "cp \"Red Team Has 5 Sec\n To Place Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+48
INDIRI4
SUBI4
CNSTI4 50000
NEI4 $257
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3456
DIVI4
ARGI4
ADDRGP4 $261
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $257
line 551
;551:			if(level.time-level.blueScoreTime == 45000)	{ trap_SendServerCommand( client - level.clients, "cp \"Red Team Has 10 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+48
INDIRI4
SUBI4
CNSTI4 45000
NEI4 $262
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3456
DIVI4
ARGI4
ADDRGP4 $266
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $262
line 552
;552:			if(level.time-level.blueScoreTime == 40000)	{ trap_SendServerCommand( client - level.clients, "cp \"Red Team Has 15 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+48
INDIRI4
SUBI4
CNSTI4 40000
NEI4 $267
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3456
DIVI4
ARGI4
ADDRGP4 $271
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $267
line 553
;553:			if(level.time-level.blueScoreTime == 35000)	{ trap_SendServerCommand( client - level.clients, "cp \"Red Team Has 20 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+48
INDIRI4
SUBI4
CNSTI4 35000
NEI4 $272
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3456
DIVI4
ARGI4
ADDRGP4 $276
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $272
line 554
;554:			if(level.time-level.blueScoreTime == 30000)	{ trap_SendServerCommand( client - level.clients, "cp \"Red Team Has 25 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+48
INDIRI4
SUBI4
CNSTI4 30000
NEI4 $277
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3456
DIVI4
ARGI4
ADDRGP4 $281
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $277
line 555
;555:			if(level.time-level.blueScoreTime == 25000)	{ trap_SendServerCommand( client - level.clients, "cp \"Red Team Has 30 Sec\n To Build Power Core!\n\"" ); }	
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+48
INDIRI4
SUBI4
CNSTI4 25000
NEI4 $282
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3456
DIVI4
ARGI4
ADDRGP4 $286
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $282
line 557
;556:
;557:		}
LABELV $254
line 558
;558:		if ((client->sess.sessionTeam == TEAM_BLUE) && ( level.blueNeedMC == 1))
ADDRLP4 0
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $287
ADDRGP4 level+9296
INDIRI4
CNSTI4 1
NEI4 $287
line 559
;559:		{
line 560
;560:			if(level.time-level.redScoreTime == 50000)	{ trap_SendServerCommand( client - level.clients, "cp \"Blue Team Has 5 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+44
INDIRI4
SUBI4
CNSTI4 50000
NEI4 $290
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3456
DIVI4
ARGI4
ADDRGP4 $294
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $290
line 561
;561:			if(level.time-level.redScoreTime == 45000)	{ trap_SendServerCommand( client - level.clients, "cp \"Blue Team Has 10 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+44
INDIRI4
SUBI4
CNSTI4 45000
NEI4 $295
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3456
DIVI4
ARGI4
ADDRGP4 $299
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $295
line 562
;562:			if(level.time-level.redScoreTime == 40000)	{ trap_SendServerCommand( client - level.clients, "cp \"Blue Team Has 15 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+44
INDIRI4
SUBI4
CNSTI4 40000
NEI4 $300
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3456
DIVI4
ARGI4
ADDRGP4 $304
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $300
line 563
;563:			if(level.time-level.redScoreTime == 35000)	{ trap_SendServerCommand( client - level.clients, "cp \"Blue Team Has 20 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+44
INDIRI4
SUBI4
CNSTI4 35000
NEI4 $305
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3456
DIVI4
ARGI4
ADDRGP4 $309
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $305
line 564
;564:			if(level.time-level.redScoreTime == 30000)	{ trap_SendServerCommand( client - level.clients, "cp \"Blue Team Has 25 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+44
INDIRI4
SUBI4
CNSTI4 30000
NEI4 $310
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3456
DIVI4
ARGI4
ADDRGP4 $314
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $310
line 565
;565:			if(level.time-level.redScoreTime == 25000)	{ trap_SendServerCommand( client - level.clients, "cp \"Blue Team Has 30 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+44
INDIRI4
SUBI4
CNSTI4 25000
NEI4 $315
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3456
DIVI4
ARGI4
ADDRGP4 $319
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $315
line 566
;566:		}
LABELV $287
line 568
;567:
;568:	}
LABELV $251
line 573
;569:
;570:
;571:
;572:
;573:}
LABELV $208
endproc ClientTimerActions 20 12
export ClientIntermissionThink
proc ClientIntermissionThink 24 0
line 580
;574:
;575:/*
;576:====================
;577:ClientIntermissionThink
;578:====================
;579:*/
;580:void ClientIntermissionThink( gclient_t *client ) {
line 581
;581:	client->ps.eFlags &= ~EF_TALK;
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
line 582
;582:	client->ps.eFlags &= ~EF_FIRING;
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
line 587
;583:
;584:	// the level will exit when everyone wants to or after timeouts
;585:
;586:	// swap and latch button actions
;587:	client->oldbuttons = client->buttons;
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
line 588
;588:	client->buttons = client->pers.cmd.buttons;
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
line 589
;589:	if ( client->buttons & ( BUTTON_ATTACK | BUTTON_USE_HOLDABLE ) & ( client->oldbuttons ^ client->buttons ) ) {
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
EQI4 $321
line 591
;590:		// this used to be an ^1 but once a player says ready, it should stick
;591:		client->readyToExit = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2580
ADDP4
CNSTI4 1
ASGNI4
line 592
;592:	}
LABELV $321
line 593
;593:}
LABELV $320
endproc ClientIntermissionThink 24 0
export ClientEvents
proc ClientEvents 80 32
line 604
;594:
;595:
;596:/*
;597:================
;598:ClientEvents
;599:
;600:Events will be passed on to the clients for presentation,
;601:but any server game effects are handled here
;602:================
;603:*/
;604:void ClientEvents( gentity_t *ent, int oldEventSequence ) {
line 612
;605:	int		i;
;606:	int		event;
;607:	gclient_t *client;
;608:	int		damage;
;609:	vec3_t	dir;
;610:	vec3_t	origin, angles;
;611:
;612:	client = ent->client;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 614
;613:
;614:	if ( oldEventSequence < client->ps.eventSequence - MAX_PS_EVENTS ) {
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
GEI4 $324
line 615
;615:		oldEventSequence = client->ps.eventSequence - MAX_PS_EVENTS;
ADDRFP4 4
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 616
;616:	}
LABELV $324
line 617
;617:	for ( i = oldEventSequence ; i < client->ps.eventSequence ; i++ ) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 $329
JUMPV
LABELV $326
line 618
;618:		event = client->ps.events[ i & (MAX_PS_EVENTS-1) ];
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
line 620
;619:
;620:		switch ( event ) {
ADDRLP4 56
CNSTI4 11
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $332
ADDRLP4 4
INDIRI4
CNSTI4 12
EQI4 $332
ADDRLP4 4
INDIRI4
ADDRLP4 56
INDIRI4
LTI4 $331
LABELV $348
ADDRLP4 4
INDIRI4
CNSTI4 23
LTI4 $331
ADDRLP4 4
INDIRI4
CNSTI4 31
GTI4 $331
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $349-92
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $349
address $343
address $344
address $331
address $345
address $346
address $331
address $331
address $331
address $347
code
LABELV $332
line 623
;621:		case EV_FALL_MEDIUM:
;622:		case EV_FALL_FAR:
;623:			if ( ent->s.eType != ET_PLAYER ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
EQI4 $333
line 624
;624:				break;		// not in the player model
ADDRGP4 $331
JUMPV
LABELV $333
line 626
;625:			}
;626:			if ( g_dmflags.integer & DF_NO_FALLING ) {
ADDRGP4 g_dmflags+12
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $335
line 627
;627:				break;
ADDRGP4 $331
JUMPV
LABELV $335
line 629
;628:			}
;629:			if ( event == EV_FALL_FAR ) {
ADDRLP4 4
INDIRI4
CNSTI4 12
NEI4 $338
line 630
;630:				damage = 10;
ADDRLP4 24
CNSTI4 10
ASGNI4
line 631
;631:			} else {
ADDRGP4 $339
JUMPV
LABELV $338
line 632
;632:				damage = 5;
ADDRLP4 24
CNSTI4 5
ASGNI4
line 633
;633:			}
LABELV $339
line 634
;634:			VectorSet (dir, 0, 0, 1);
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
line 635
;635:			ent->pain_debounce_time = level.time + 200;	// no normal pain sound
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 636
;636:			G_Damage (ent, NULL, NULL, NULL, NULL, damage, 0, MOD_FALLING);
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
line 637
;637:			break;
ADDRGP4 $331
JUMPV
LABELV $343
line 640
;638:
;639:		case EV_FIRE_WEAPON:
;640:			FireWeapon( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 FireWeapon
CALLV
pop
line 641
;641:			break;
ADDRGP4 $331
JUMPV
LABELV $344
line 645
;642:
;643:		// Shafe - Trep - Alt Fire
;644:		case EV_FIRE_WEAPON2: 
;645:			FireWeapon2( ent ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 FireWeapon2
CALLV
pop
line 646
;646:			break;
ADDRGP4 $331
JUMPV
LABELV $345
line 699
;647:
;648:		case EV_USE_ITEM1:		// teleporter
;649:			// drop flags in CTF
;650:			//Team_DropFlags( ent );
;651:			/* Shafe - Trep - This is now in g_team.c - Keeping it here only for reference
;652:			item = NULL;
;653:			j = 0;
;654:
;655:			if ( ent->client->ps.powerups[ PW_REDFLAG ] ) {
;656:				item = BG_FindItemForPowerup( PW_REDFLAG );
;657:				j = PW_REDFLAG;
;658:			} else if ( ent->client->ps.powerups[ PW_BLUEFLAG ] ) {
;659:				item = BG_FindItemForPowerup( PW_BLUEFLAG );
;660:				j = PW_BLUEFLAG;
;661:			} else if ( ent->client->ps.powerups[ PW_NEUTRALFLAG ] ) {
;662:				item = BG_FindItemForPowerup( PW_NEUTRALFLAG );
;663:				j = PW_NEUTRALFLAG;
;664:			}
;665:
;666:			if ( item ) {
;667:				drop = Drop_Item( ent, item, 0 );
;668:				// decide how many seconds it has left
;669:				drop->count = ( ent->client->ps.powerups[ j ] - level.time ) / 1000;
;670:				if ( drop->count < 1 ) {
;671:					drop->count = 1;
;672:				}
;673:
;674:				ent->client->ps.powerups[ j ] = 0;
;675:			} */
;676:#ifdef MISSIONPACK
;677:			if ( g_gametype.integer == GT_HARVESTER ) {
;678:				if ( ent->client->ps.generic1 > 0 ) {
;679:					if ( ent->client->sess.sessionTeam == TEAM_RED ) {
;680:						item = BG_FindItem( "Blue Cube" );
;681:					} else {
;682:						item = BG_FindItem( "Red Cube" );
;683:					}
;684:					if ( item ) {
;685:						for ( j = 0; j < ent->client->ps.generic1; j++ ) {
;686:							drop = Drop_Item( ent, item, 0 );
;687:							if ( ent->client->sess.sessionTeam == TEAM_RED ) {
;688:								drop->spawnflags = TEAM_BLUE;
;689:							} else {
;690:								drop->spawnflags = TEAM_RED;
;691:							}
;692:						}
;693:					}
;694:					ent->client->ps.generic1 = 0;
;695:				}
;696:			}
;697:#endif
;698://			PrintMsg( NULL, "%i" S_COLOR_WHITE " DEBUG: USE Teleporter\n", ent->item->giTag ); // Shafe - Debug
;699:			SelectSpawnPoint( ent->client->ps.origin, origin, angles );
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
line 700
;700:			TeleportPlayer( ent, origin, angles );
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
line 703
;701:
;702:
;703:			break;
ADDRGP4 $331
JUMPV
LABELV $346
line 707
;704:
;705:		case EV_USE_ITEM2:		// medkit
;706://			PrintMsg( NULL, "%i" S_COLOR_WHITE " DEBUG: USE Medkit\n", ent->item->giTag ); // Shafe - Debug
;707:			ent->health = ent->client->ps.stats[STAT_MAX_HEALTH] + 25;
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 748
ADDP4
ADDRLP4 76
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
line 708
;708:			break;
ADDRGP4 $331
JUMPV
LABELV $347
line 732
;709:
;710:		
;711:#ifdef MISSIONPACK
;712:		case EV_USE_ITEM3:		// kamikaze
;713:			// make sure the invulnerability is off
;714:			ent->client->invulnerabilityTime = 0;
;715:			// start the kamikze
;716:			G_StartKamikaze( ent );
;717:			break;
;718:
;719:		case EV_USE_ITEM4:		// portal
;720:			if( ent->client->portalID ) {
;721:				DropPortalSource( ent );
;722:			}
;723:			else {
;724:				DropPortalDestination( ent );
;725:			}
;726:			break;
;727:		case EV_USE_ITEM5:		// invulnerability
;728:			ent->client->invulnerabilityTime = level.time + 10000;
;729:			break;
;730:#endif
;731:		case EV_USE_ITEM6:		// drop flags? Shafe - Trep
;732:			Team_DropFlags( ent ); // Shafe - Trep - Drop Flags  - This doesnt seem to work.. 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Team_DropFlags
CALLV
pop
line 733
;733:			break;
line 736
;734:
;735:		default:
;736:			break;
LABELV $331
line 738
;737:		}
;738:	}
LABELV $327
line 617
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $329
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
LTI4 $326
line 740
;739:
;740:}
LABELV $323
endproc ClientEvents 80 32
export SendPendingPredictableEvents
proc SendPendingPredictableEvents 44 12
line 792
;741:
;742:#ifdef MISSIONPACK
;743:/*
;744:==============
;745:StuckInOtherClient
;746:==============
;747:*/
;748:static int StuckInOtherClient(gentity_t *ent) {
;749:	int i;
;750:	gentity_t	*ent2;
;751:
;752:	ent2 = &g_entities[0];
;753:	for ( i = 0; i < MAX_CLIENTS; i++, ent2++ ) {
;754:		if ( ent2 == ent ) {
;755:			continue;
;756:		}
;757:		if ( !ent2->inuse ) {
;758:			continue;
;759:		}
;760:		if ( !ent2->client ) {
;761:			continue;
;762:		}
;763:		if ( ent2->health <= 0 ) {
;764:			continue;
;765:		}
;766:		//
;767:		if (ent2->r.absmin[0] > ent->r.absmax[0])
;768:			continue;
;769:		if (ent2->r.absmin[1] > ent->r.absmax[1])
;770:			continue;
;771:		if (ent2->r.absmin[2] > ent->r.absmax[2])
;772:			continue;
;773:		if (ent2->r.absmax[0] < ent->r.absmin[0])
;774:			continue;
;775:		if (ent2->r.absmax[1] < ent->r.absmin[1])
;776:			continue;
;777:		if (ent2->r.absmax[2] < ent->r.absmin[2])
;778:			continue;
;779:		return qtrue;
;780:	}
;781:	return qfalse;
;782:}
;783:#endif
;784:
;785:void BotTestSolid(vec3_t origin);
;786:
;787:/*
;788:==============
;789:SendPendingPredictableEvents
;790:==============
;791:*/
;792:void SendPendingPredictableEvents( playerState_t *ps ) {
line 798
;793:	gentity_t *t;
;794:	int event, seq;
;795:	int extEvent, number;
;796:
;797:	// if there are still events pending
;798:	if ( ps->entityEventSequence < ps->eventSequence ) {
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
GEI4 $352
line 801
;799:		// create a temporary entity for this event which is sent to everyone
;800:		// except the client who generated the event
;801:		seq = ps->entityEventSequence & (MAX_PS_EVENTS-1);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 802
;802:		event = ps->events[ seq ] | ( ( ps->entityEventSequence & 3 ) << 8 );
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
line 804
;803:		// set external event to zero before calling BG_PlayerStateToEntityState
;804:		extEvent = ps->externalEvent;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
ASGNI4
line 805
;805:		ps->externalEvent = 0;
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
CNSTI4 0
ASGNI4
line 807
;806:		// create temporary entity for event
;807:		t = G_TempEntity( ps->origin, event );
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
line 808
;808:		number = t->s.number;
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 809
;809:		BG_PlayerStateToEntityState( ps, &t->s, qtrue );
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
line 810
;810:		t->s.number = number;
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ASGNI4
line 811
;811:		t->s.eType = ET_EVENTS + event;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 14
ADDI4
ASGNI4
line 812
;812:		t->s.eFlags |= EF_PLAYER_EVENT;
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
line 813
;813:		t->s.otherEntityNum = ps->clientNum;
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
line 815
;814:		// send to everyone except the client who generated the event
;815:		t->r.svFlags |= SVF_NOTSINGLECLIENT;
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
line 816
;816:		t->r.singleClient = ps->clientNum;
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
line 818
;817:		// set back external event
;818:		ps->externalEvent = extEvent;
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 819
;819:	}
LABELV $352
line 820
;820:}
LABELV $351
endproc SendPendingPredictableEvents 44 12
export ClientThink_real
proc ClientThink_real 324 12
line 833
;821:
;822:/*
;823:==============
;824:ClientThink
;825:
;826:This will be called once for each client frame, which will
;827:usually be a couple times for each server frame on fast clients.
;828:
;829:If "g_synchronousClients 1" is set, this will be called exactly
;830:once for each server frame, which makes for smooth demo recording.
;831:==============
;832:*/
;833:void ClientThink_real( gentity_t *ent ) {
line 840
;834:	gclient_t	*client;
;835:	pmove_t		pm;
;836:	int			oldEventSequence;
;837:	int			msec;
;838:	usercmd_t	*ucmd;
;839:
;840:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 843
;841:
;842:	// don't think if the client is not yet connected (and thus not yet spawned in)
;843:	if (client->pers.connected != CON_CONNECTED) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $355
line 844
;844:		return;
ADDRGP4 $354
JUMPV
LABELV $355
line 847
;845:	}
;846:	// mark the time, so the connection sprite can be removed
;847:	ucmd = &ent->client->pers.cmd;
ADDRLP4 236
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 472
ADDP4
ASGNP4
line 850
;848:
;849:	// sanity check the command time to prevent speedup cheating
;850:	if ( ucmd->serverTime > level.time + 200 ) {
ADDRLP4 236
INDIRP4
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
LEI4 $357
line 851
;851:		ucmd->serverTime = level.time + 200;
ADDRLP4 236
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 853
;852://		G_Printf("serverTime <<<<<\n" );
;853:	}
LABELV $357
line 854
;854:	if ( ucmd->serverTime < level.time - 1000 ) {
ADDRLP4 236
INDIRP4
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
SUBI4
GEI4 $361
line 855
;855:		ucmd->serverTime = level.time - 1000;
ADDRLP4 236
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
SUBI4
ASGNI4
line 857
;856://		G_Printf("serverTime >>>>>\n" );
;857:	} 
LABELV $361
line 864
;858:
;859:
;860://unlagged - backward reconciliation #4
;861:	// frameOffset should be about the number of milliseconds into a frame 
;862:	// this command packet was received, depending on how fast the server
;863:	// does a G_RunFrame()
;864:	client->frameOffset = trap_Milliseconds() - level.frameStartTime;
ADDRLP4 248
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 3448
ADDP4
ADDRLP4 248
INDIRI4
ADDRGP4 level+9224
INDIRI4
SUBI4
ASGNI4
line 870
;865://unlagged - backward reconciliation #4
;866:
;867:
;868://unlagged - lag simulation #3
;869:	// if the client wants to simulate outgoing packet loss
;870:	if ( client->pers.plOut ) {
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
CNSTI4 0
EQI4 $366
line 872
;871:		// see if a random value is below the threshhold
;872:		float thresh = (float)client->pers.plOut / 100.0f;
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
line 873
;873:		if ( random() < thresh ) {
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
GEF4 $368
line 875
;874:			// do nothing at all if it is - this is a lost command
;875:			return;
ADDRGP4 $354
JUMPV
LABELV $368
line 877
;876:		}
;877:	}
LABELV $366
line 886
;878://unlagged - lag simulation #3
;879:
;880:
;881://unlagged - true ping
;882:	// save the estimated ping in a queue for averaging later
;883:
;884:	// we use level.previousTime to account for 50ms lag correction
;885:	// besides, this will turn out numbers more like what players are used to
;886:	client->pers.pingsamples[client->pers.samplehead] = level.previousTime + client->frameOffset - ucmd->serverTime;
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
CNSTI4 3448
ADDP4
INDIRI4
ADDI4
ADDRLP4 236
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 887
;887:	client->pers.samplehead++;
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
line 888
;888:	if ( client->pers.samplehead >= NUM_PING_SAMPLES ) {
ADDRLP4 0
INDIRP4
CNSTI4 2440
ADDP4
INDIRI4
CNSTI4 64
LTI4 $371
line 889
;889:		client->pers.samplehead -= NUM_PING_SAMPLES;
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
line 890
;890:	}
LABELV $371
line 893
;891:
;892:	// initialize the real ping
;893:	if ( g_truePing.integer ) {
ADDRGP4 g_truePing+12
INDIRI4
CNSTI4 0
EQI4 $373
line 894
;894:		int i, sum = 0;
ADDRLP4 264
CNSTI4 0
ASGNI4
line 897
;895:
;896:		// get an average of the samples we saved up
;897:		for ( i = 0; i < NUM_PING_SAMPLES; i++ ) {
ADDRLP4 260
CNSTI4 0
ASGNI4
LABELV $376
line 898
;898:			sum += client->pers.pingsamples[i];
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
line 899
;899:		}
LABELV $377
line 897
ADDRLP4 260
ADDRLP4 260
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 64
LTI4 $376
line 901
;900:
;901:		client->pers.realPing = sum / NUM_PING_SAMPLES;
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
ADDRLP4 264
INDIRI4
CNSTI4 64
DIVI4
ASGNI4
line 902
;902:	}
ADDRGP4 $374
JUMPV
LABELV $373
line 903
;903:	else {
line 905
;904:		// if g_truePing is off, use the normal ping
;905:		client->pers.realPing = client->ps.ping;
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
line 906
;906:	}
LABELV $374
line 912
;907://unlagged - true ping
;908:
;909:
;910://unlagged - lag simulation #2
;911:	// keep a queue of past commands
;912:	client->pers.cmdqueue[client->pers.cmdhead] = client->pers.cmd;
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
line 913
;913:	client->pers.cmdhead++;
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
line 914
;914:	if ( client->pers.cmdhead >= MAX_LATENT_CMDS ) {
ADDRLP4 0
INDIRP4
CNSTI4 2176
ADDP4
INDIRI4
CNSTI4 64
LTI4 $380
line 915
;915:		client->pers.cmdhead -= MAX_LATENT_CMDS;
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
line 916
;916:	}
LABELV $380
line 919
;917:
;918:	// if the client wants latency in commands (client-to-server latency)
;919:	if ( client->pers.latentCmds ) {
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 0
EQI4 $382
line 921
;920:		// save the actual command time
;921:		int time = ucmd->serverTime;
ADDRLP4 272
ADDRLP4 236
INDIRP4
INDIRI4
ASGNI4
line 924
;922:
;923:		// find out which index in the queue we want
;924:		int cmdindex = client->pers.cmdhead - client->pers.latentCmds - 1;
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
ADDRGP4 $385
JUMPV
LABELV $384
line 925
;925:		while ( cmdindex < 0 ) {
line 926
;926:			cmdindex += MAX_LATENT_CMDS;
ADDRLP4 268
ADDRLP4 268
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 927
;927:		}
LABELV $385
line 925
ADDRLP4 268
INDIRI4
CNSTI4 0
LTI4 $384
line 930
;928:
;929:		// read in the old command
;930:		client->pers.cmd = client->pers.cmdqueue[cmdindex];
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
line 933
;931:
;932:		// adjust the real ping to reflect the new latency
;933:		client->pers.realPing += time - ucmd->serverTime;
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
line 934
;934:	}
LABELV $382
line 942
;935://unlagged - lag simulation #2
;936:
;937:
;938://unlagged - backward reconciliation #4
;939:	// save the command time *before* pmove_fixed messes with the serverTime,
;940:	// and *after* lag simulation messes with it :)
;941:	// attackTime will be used for backward reconciliation later (time shift)
;942:	client->attackTime = ucmd->serverTime;
ADDRLP4 0
INDIRP4
CNSTI4 2720
ADDP4
ADDRLP4 236
INDIRP4
INDIRI4
ASGNI4
line 949
;943://unlagged - backward reconciliation #4
;944:
;945:
;946://unlagged - smooth clients #1
;947:	// keep track of this for later - we'll use this to decide whether or not
;948:	// to send extrapolated positions for this client
;949:	client->lastUpdateFrame = level.framenum;
ADDRLP4 0
INDIRP4
CNSTI4 3452
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 955
;950://unlagged - smooth clients #1
;951:
;952:
;953://unlagged - lag simulation #1
;954:	// if the client is adding latency to received snapshots (server-to-client latency)
;955:	if ( client->pers.latentSnaps ) {
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 0
EQI4 $388
line 957
;956:		// adjust the real ping
;957:		client->pers.realPing += client->pers.latentSnaps * (1000 / sv_fps.integer);
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
line 959
;958:		// adjust the attack time so backward reconciliation will work
;959:		client->attackTime -= client->pers.latentSnaps * (1000 / sv_fps.integer);
ADDRLP4 280
ADDRLP4 0
INDIRP4
CNSTI4 2720
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
line 960
;960:	}
LABELV $388
line 966
;961://unlagged - lag simulation #1
;962:
;963:
;964://unlagged - true ping
;965:	// make sure the true ping is over 0 - with cl_timenudge it can be less
;966:	if ( client->pers.realPing < 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
INDIRI4
CNSTI4 0
GEI4 $392
line 967
;967:		client->pers.realPing = 0;
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
CNSTI4 0
ASGNI4
line 968
;968:	}
LABELV $392
line 972
;969://unlagged - true ping
;970:
;971:
;972:	msec = ucmd->serverTime - client->ps.commandTime;
ADDRLP4 240
ADDRLP4 236
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 975
;973:	// following others may result in bad times, but we still want
;974:	// to check for follow toggles
;975:	if ( msec < 1 && client->sess.spectatorState != SPECTATOR_FOLLOW ) {
ADDRLP4 240
INDIRI4
CNSTI4 1
GEI4 $394
ADDRLP4 0
INDIRP4
CNSTI4 2560
ADDP4
INDIRI4
CNSTI4 2
EQI4 $394
line 976
;976:		return;
ADDRGP4 $354
JUMPV
LABELV $394
line 978
;977:	}
;978:	if ( msec > 200 ) {
ADDRLP4 240
INDIRI4
CNSTI4 200
LEI4 $396
line 979
;979:		msec = 200;
ADDRLP4 240
CNSTI4 200
ASGNI4
line 980
;980:	}
LABELV $396
line 982
;981:
;982:	if ( pmove_msec.integer < 8 ) {
ADDRGP4 pmove_msec+12
INDIRI4
CNSTI4 8
GEI4 $398
line 983
;983:		trap_Cvar_Set("pmove_msec", "8");
ADDRGP4 $401
ARGP4
ADDRGP4 $402
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 984
;984:	}
ADDRGP4 $399
JUMPV
LABELV $398
line 985
;985:	else if (pmove_msec.integer > 33) {
ADDRGP4 pmove_msec+12
INDIRI4
CNSTI4 33
LEI4 $403
line 986
;986:		trap_Cvar_Set("pmove_msec", "33");
ADDRGP4 $401
ARGP4
ADDRGP4 $406
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 987
;987:	}
LABELV $403
LABELV $399
line 989
;988:
;989:	if ( pmove_fixed.integer || client->pers.pmoveFixed ) {
ADDRLP4 268
CNSTI4 0
ASGNI4
ADDRGP4 pmove_fixed+12
INDIRI4
ADDRLP4 268
INDIRI4
NEI4 $410
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
ADDRLP4 268
INDIRI4
EQI4 $407
LABELV $410
line 990
;990:		ucmd->serverTime = ((ucmd->serverTime + pmove_msec.integer-1) / pmove_msec.integer) * pmove_msec.integer;
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
line 993
;991:		//if (ucmd->serverTime - client->ps.commandTime <= 0)
;992:		//	return;
;993:	}
LABELV $407
line 998
;994:
;995:	//
;996:	// check for exiting intermission
;997:	//
;998:	if ( level.intermissiontime ) {
ADDRGP4 level+9140
INDIRI4
CNSTI4 0
EQI4 $414
line 999
;999:		ClientIntermissionThink( client );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ClientIntermissionThink
CALLV
pop
line 1000
;1000:		return;
ADDRGP4 $354
JUMPV
LABELV $414
line 1004
;1001:	}
;1002:
;1003:	// spectators don't do much
;1004:	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $417
line 1005
;1005:		if ( client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRLP4 0
INDIRP4
CNSTI4 2560
ADDP4
INDIRI4
CNSTI4 3
NEI4 $419
line 1006
;1006:			return;
ADDRGP4 $354
JUMPV
LABELV $419
line 1008
;1007:		}
;1008:		SpectatorThink( ent, ucmd );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 236
INDIRP4
ARGP4
ADDRGP4 SpectatorThink
CALLV
pop
line 1009
;1009:		return;
ADDRGP4 $354
JUMPV
LABELV $417
line 1013
;1010:	}
;1011:
;1012:	// check for inactivity timer, but never drop the local client of a non-dedicated server
;1013:	if ( !ClientInactivityTimer( client ) ) {
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
NEI4 $421
line 1014
;1014:		return;
ADDRGP4 $354
JUMPV
LABELV $421
line 1018
;1015:	}
;1016:
;1017:	// clear the rewards if time
;1018:	if ( level.time > client->rewardTime ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 2676
ADDP4
INDIRI4
LEI4 $423
line 1019
;1019:		client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
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
line 1020
;1020:	}
LABELV $423
line 1022
;1021:
;1022:	if ( client->noclip ) {
ADDRLP4 0
INDIRP4
CNSTI4 2584
ADDP4
INDIRI4
CNSTI4 0
EQI4 $426
line 1023
;1023:		client->ps.pm_type = PM_NOCLIP;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 1
ASGNI4
line 1024
;1024:	} else if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 $427
JUMPV
LABELV $426
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $428
line 1025
;1025:		client->ps.pm_type = PM_DEAD;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1026
;1026:	} else {
ADDRGP4 $429
JUMPV
LABELV $428
line 1027
;1027:		client->ps.pm_type = PM_NORMAL;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 1028
;1028:	}
LABELV $429
LABELV $427
line 1030
;1029:
;1030:	client->ps.gravity = g_gravity.value;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDRGP4 g_gravity+8
INDIRF4
CVFI4 4
ASGNI4
line 1033
;1031:
;1032:	// set speed
;1033:	client->ps.speed = g_speed.value;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 g_speed+8
INDIRF4
CVFI4 4
ASGNI4
line 1041
;1034:
;1035:#ifdef MISSIONPACK
;1036:	if( bg_itemlist[client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_SCOUT ) {
;1037:		client->ps.speed *= 1.5;
;1038:	}
;1039:	else
;1040:#endif
;1041:	if ( client->ps.powerups[PW_HASTE] ) {
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
CNSTI4 0
EQI4 $432
line 1042
;1042:		client->ps.speed *= 1.3;
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
line 1043
;1043:	}
LABELV $432
line 1045
;1044:
;1045:	if (( g_entities[client->ps.clientNum].immobilized == qtrue) && (g_entities[client->ps.clientNum].s.eType != ET_TURRET)) 
ADDRLP4 276
CNSTI4 916
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 276
INDIRI4
ADDRGP4 g_entities+912
ADDP4
INDIRI4
CNSTI4 1
NEI4 $434
ADDRLP4 276
INDIRI4
ADDRGP4 g_entities+4
ADDP4
INDIRI4
CNSTI4 13
EQI4 $434
line 1046
;1046:	{
line 1048
;1047:		// Client only immobilized effects -Vincent
;1048:		if (g_entities[client->ps.clientNum].health > 8)
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
LEI4 $438
line 1049
;1049:		{ // Don't do anything when your health is above 8, because you are free then
line 1050
;1050:		G_AddEvent( ent, EV_IMMOBILIZED, 0 ); // Visualise
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 66
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1051
;1051:		}
ADDRGP4 $439
JUMPV
LABELV $438
line 1053
;1052:		else
;1053:		{ // Failsafe
line 1054
;1054:		G_AddEvent( ent, EV_IMMOBILIZED_FREE, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 67
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1055
;1055:		}
LABELV $439
line 1057
;1056:
;1057:		client->ps.speed = 50;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 50
ASGNI4
line 1058
;1058:		if (g_entities[client->ps.clientNum].health < 8) { g_entities[client->ps.clientNum].immobilized = qfalse; }
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
GEI4 $435
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
line 1059
;1059:	}
ADDRGP4 $435
JUMPV
LABELV $434
line 1061
;1060:	else
;1061:	{ // Free the effect if it exists (and isn't supposed to exist anymore)
line 1062
;1062:	G_AddEvent( ent, EV_IMMOBILIZED_FREE, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 67
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1063
;1063:	}
LABELV $435
line 1075
;1064:
;1065:
;1066:	// Let go of the hook if we aren't firing
;1067:	/*  - Shafe - Trep - Commented out for offhand grapple
;1068:	if ( client->ps.weapon == WP_GRAPPLING_HOOK &&
;1069:		client->hook && !( ucmd->buttons & BUTTON_ATTACK ) ) {
;1070:		Weapon_HookFree(client->hook);
;1071:	}
;1072:	*/ 
;1073:
;1074:	// set up for pmove
;1075:	oldEventSequence = client->ps.eventSequence;
ADDRLP4 244
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 1077
;1076:
;1077:	memset (&pm, 0, sizeof(pm));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 232
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1081
;1078:
;1079:	// check for the hit-scan gauntlet, don't let the action
;1080:	// go through as an attack unless it actually hits something
;1081:	if ( client->ps.weapon == WP_GAUNTLET && !( ucmd->buttons & BUTTON_TALK ) &&
ADDRLP4 280
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ADDRLP4 280
INDIRI4
NEI4 $445
ADDRLP4 284
ADDRLP4 236
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
ADDRLP4 288
CNSTI4 0
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 288
INDIRI4
NEI4 $445
ADDRLP4 284
INDIRI4
ADDRLP4 280
INDIRI4
BANDI4
ADDRLP4 288
INDIRI4
NEI4 $447
ADDRLP4 284
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 288
INDIRI4
EQI4 $445
LABELV $447
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
GTI4 $445
line 1082
;1082:		( (ucmd->buttons & BUTTON_ATTACK) || (ucmd->buttons & 32) ) && client->ps.weaponTime <= 0 ) { // Shafe - Trep - Alt Fire
line 1084
;1083:		//( ucmd->buttons & BUTTON_ATTACK ) && client->ps.weaponTime <= 0 ) {
;1084:		pm.gauntletHit = CheckGauntletAttack( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 292
ADDRGP4 CheckGauntletAttack
CALLI4
ASGNI4
ADDRLP4 4+40
ADDRLP4 292
INDIRI4
ASGNI4
line 1085
;1085:	}
LABELV $445
line 1087
;1086:
;1087:	if ( ent->flags & FL_FORCE_GESTURE ) {
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $449
line 1088
;1088:		ent->flags &= ~FL_FORCE_GESTURE;
ADDRLP4 292
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
ASGNP4
ADDRLP4 292
INDIRP4
ADDRLP4 292
INDIRP4
INDIRI4
CNSTI4 -32769
BANDI4
ASGNI4
line 1089
;1089:		ent->client->pers.cmd.buttons |= BUTTON_GESTURE;
ADDRLP4 296
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 488
ADDP4
ASGNP4
ADDRLP4 296
INDIRP4
ADDRLP4 296
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1090
;1090:	}
LABELV $449
line 1119
;1091:
;1092:#ifdef MISSIONPACK
;1093:	// check for invulnerability expansion before doing the Pmove
;1094:	if (client->ps.powerups[PW_INVULNERABILITY] ) {
;1095:		if ( !(client->ps.pm_flags & PMF_INVULEXPAND) ) {
;1096:			vec3_t mins = { -42, -42, -42 };
;1097:			vec3_t maxs = { 42, 42, 42 };
;1098:			vec3_t oldmins, oldmaxs;
;1099:
;1100:			VectorCopy (ent->r.mins, oldmins);
;1101:			VectorCopy (ent->r.maxs, oldmaxs);
;1102:			// expand
;1103:			VectorCopy (mins, ent->r.mins);
;1104:			VectorCopy (maxs, ent->r.maxs);
;1105:			trap_LinkEntity(ent);
;1106:			// check if this would get anyone stuck in this player
;1107:			if ( !StuckInOtherClient(ent) ) {
;1108:				// set flag so the expanded size will be set in PM_CheckDuck
;1109:				client->ps.pm_flags |= PMF_INVULEXPAND;
;1110:			}
;1111:			// set back
;1112:			VectorCopy (oldmins, ent->r.mins);
;1113:			VectorCopy (oldmaxs, ent->r.maxs);
;1114:			trap_LinkEntity(ent);
;1115:		}
;1116:	}
;1117:#endif
;1118:
;1119:	pm.ps = &client->ps;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 1120
;1120:	pm.cmd = *ucmd;
ADDRLP4 4+4
ADDRLP4 236
INDIRP4
INDIRB
ASGNB 24
line 1121
;1121:	if ( pm.ps->pm_type == PM_DEAD ) {
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $452
line 1122
;1122:		pm.tracemask = MASK_PLAYERSOLID & ~CONTENTS_BODY;
ADDRLP4 4+28
CNSTI4 65537
ASGNI4
line 1123
;1123:	}
ADDRGP4 $453
JUMPV
LABELV $452
line 1124
;1124:	else if ( ent->r.svFlags & SVF_BOT ) {
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $455
line 1125
;1125:		pm.tracemask = MASK_PLAYERSOLID | CONTENTS_BOTCLIP;
ADDRLP4 4+28
CNSTI4 37814273
ASGNI4
line 1126
;1126:	}
ADDRGP4 $456
JUMPV
LABELV $455
line 1127
;1127:	else {
line 1128
;1128:		pm.tracemask = MASK_PLAYERSOLID;
ADDRLP4 4+28
CNSTI4 33619969
ASGNI4
line 1129
;1129:	}
LABELV $456
LABELV $453
line 1130
;1130:	pm.trace = trap_Trace;
ADDRLP4 4+224
ADDRGP4 trap_Trace
ASGNP4
line 1131
;1131:	pm.pointcontents = trap_PointContents;
ADDRLP4 4+228
ADDRGP4 trap_PointContents
ASGNP4
line 1132
;1132:	pm.debugLevel = g_debugMove.integer;
ADDRLP4 4+32
ADDRGP4 g_debugMove+12
INDIRI4
ASGNI4
line 1133
;1133:	pm.noFootsteps = ( g_dmflags.integer & DF_NO_FOOTSTEPS ) > 0;
ADDRGP4 g_dmflags+12
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
LEI4 $466
ADDRLP4 292
CNSTI4 1
ASGNI4
ADDRGP4 $467
JUMPV
LABELV $466
ADDRLP4 292
CNSTI4 0
ASGNI4
LABELV $467
ADDRLP4 4+36
ADDRLP4 292
INDIRI4
ASGNI4
line 1135
;1134:
;1135:	pm.pmove_fixed = pmove_fixed.integer | client->pers.pmoveFixed;
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
line 1136
;1136:	pm.pmove_msec = pmove_msec.integer;
ADDRLP4 4+220
ADDRGP4 pmove_msec+12
INDIRI4
ASGNI4
line 1138
;1137:
;1138:	VectorCopy( client->ps.origin, client->oldOrigin );
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
line 1155
;1139:
;1140:#ifdef MISSIONPACK
;1141:		if (level.intermissionQueued != 0 && g_singlePlayer.integer) {
;1142:			if ( level.time - level.intermissionQueued >= 1000  ) {
;1143:				pm.cmd.buttons = 0;
;1144:				pm.cmd.forwardmove = 0;
;1145:				pm.cmd.rightmove = 0;
;1146:				pm.cmd.upmove = 0;
;1147:				if ( level.time - level.intermissionQueued >= 2000 && level.time - level.intermissionQueued <= 2500 ) {
;1148:					trap_SendConsoleCommand( EXEC_APPEND, "centerview\n");
;1149:				}
;1150:				ent->client->ps.pm_type = PM_SPINTERMISSION;
;1151:			}
;1152:		}
;1153:		Pmove (&pm);
;1154:#else
;1155:		Pmove (&pm);
ADDRLP4 4
ARGP4
ADDRGP4 Pmove
CALLV
pop
line 1159
;1156:#endif
;1157:
;1158:	// save results of pmove
;1159:	if ( ent->client->ps.eventSequence != oldEventSequence ) {
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
EQI4 $472
line 1160
;1160:		ent->eventTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1161
;1161:	}
LABELV $472
line 1174
;1162:
;1163://unlagged - smooth clients #2
;1164:	// clients no longer do extrapolation if cg_smoothClients is 1, because
;1165:	// skip correction is all handled server-side now
;1166:	// since that's the case, it makes no sense to store the extra info
;1167:	// in the client's snapshot entity, so let's save a little bandwidth
;1168:/*
;1169:	if (g_smoothClients.integer) {
;1170:		BG_PlayerStateToEntityStateExtraPolate( &ent->client->ps, &ent->s, ent->client->ps.commandTime, qtrue );
;1171:	}
;1172:	else {
;1173:*/
;1174:		BG_PlayerStateToEntityState( &ent->client->ps, &ent->s, qtrue );
ADDRLP4 300
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 300
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 300
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 1178
;1175://	}
;1176://unlagged - smooth clients #2
;1177:
;1178:	SendPendingPredictableEvents( &ent->client->ps );
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 SendPendingPredictableEvents
CALLV
pop
line 1187
;1179:
;1180:	/* - Shafe - Trep - Commented out for Offhand Grapple
;1181:	if ( !( ent->client->ps.eFlags & EF_FIRING ) ) {
;1182:		client->fireHeld = qfalse;		// for grapple
;1183:	}
;1184:	*/
;1185:
;1186:	// Shafe - Trep  - Offhand Grappling Hook
;1187:	if (g_gametype.integer != GT_CTF) { // Not in CTF Games
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
EQI4 $475
line 1188
;1188:		if ( (pm.cmd.buttons & 64)  && ent->client->ps.pm_type != PM_DEAD && !ent->client->hookhasbeenfired)
ADDRLP4 304
CNSTI4 0
ASGNI4
ADDRLP4 4+4+16
INDIRI4
CNSTI4 64
BANDI4
ADDRLP4 304
INDIRI4
EQI4 $478
ADDRLP4 308
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 308
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $478
ADDRLP4 308
INDIRP4
CNSTI4 2696
ADDP4
INDIRI4
ADDRLP4 304
INDIRI4
NEI4 $478
line 1189
;1189:		{
line 1190
;1190:			Weapon_GrapplingHook_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_GrapplingHook_Fire
CALLV
pop
line 1191
;1191:			ent->client->hookhasbeenfired = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2696
ADDP4
CNSTI4 1
ASGNI4
line 1192
;1192:		}
LABELV $478
line 1193
;1193:		if ( !(pm.cmd.buttons & 64)  &&	ent->client->ps.pm_type != PM_DEAD && ent->client->hookhasbeenfired && ent->client->fireHeld)
ADDRLP4 312
CNSTI4 0
ASGNI4
ADDRLP4 4+4+16
INDIRI4
CNSTI4 64
BANDI4
ADDRLP4 312
INDIRI4
NEI4 $482
ADDRLP4 316
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 316
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $482
ADDRLP4 316
INDIRP4
CNSTI4 2696
ADDP4
INDIRI4
ADDRLP4 312
INDIRI4
EQI4 $482
ADDRLP4 316
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
ADDRLP4 312
INDIRI4
EQI4 $482
line 1194
;1194:		{
line 1195
;1195:			ent->client->fireHeld = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 0
ASGNI4
line 1196
;1196:			ent->client->hookhasbeenfired = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2696
ADDP4
CNSTI4 0
ASGNI4
line 1197
;1197:		}
LABELV $482
line 1199
;1198:
;1199:		if ( client->hook && client->fireHeld == qfalse )
ADDRLP4 0
INDIRP4
CNSTI4 2692
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $486
ADDRLP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 0
NEI4 $486
line 1200
;1200:		{
line 1201
;1201:			Weapon_HookFree(client->hook);
ADDRLP4 0
INDIRP4
CNSTI4 2692
ADDP4
INDIRP4
ARGP4
ADDRGP4 Weapon_HookFree
CALLV
pop
line 1202
;1202:		}
LABELV $486
line 1203
;1203:	}
LABELV $475
line 1207
;1204:	// End Shafe - Offhand Grapple //////////////////////////////////////////////
;1205:	
;1206:	// use the snapped origin for linking so it matches client predicted versions
;1207:	VectorCopy( ent->s.pos.trBase, ent->r.currentOrigin );
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
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1209
;1208:
;1209:	VectorCopy (pm.mins, ent->r.mins);
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRLP4 4+180
INDIRB
ASGNB 12
line 1210
;1210:	VectorCopy (pm.maxs, ent->r.maxs);
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
ADDRLP4 4+192
INDIRB
ASGNB 12
line 1212
;1211:
;1212:	ent->waterlevel = pm.waterlevel;
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
ADDRLP4 4+208
INDIRI4
ASGNI4
line 1213
;1213:	ent->watertype = pm.watertype;
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
ADDRLP4 4+204
INDIRI4
ASGNI4
line 1219
;1214:
;1215:	// TryUse Here
;1216:	
;1217:
;1218:	// execute client events
;1219:	ClientEvents( ent, oldEventSequence );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 244
INDIRI4
ARGI4
ADDRGP4 ClientEvents
CALLV
pop
line 1222
;1220:
;1221:	// link entity now, after any personal teleporters have been used
;1222:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1223
;1223:	if ( !ent->client->noclip ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2584
ADDP4
INDIRI4
CNSTI4 0
NEI4 $492
line 1224
;1224:		G_TouchTriggers( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_TouchTriggers
CALLV
pop
line 1225
;1225:	}
LABELV $492
line 1228
;1226:
;1227:	// NOTE: now copy the exact origin over otherwise clients can be snapped into solid
;1228:	VectorCopy( ent->client->ps.origin, ent->r.currentOrigin );
ADDRLP4 308
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 308
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 308
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1231
;1229:
;1230:	//test for solid areas in the AAS file
;1231:	BotTestAAS(ent->r.currentOrigin);
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
ADDRGP4 BotTestAAS
CALLV
pop
line 1234
;1232:
;1233:	// touch other objects
;1234:	ClientImpacts( ent, &pm );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 ClientImpacts
CALLV
pop
line 1237
;1235:
;1236:	// save results of triggers and client events
;1237:	if (ent->client->ps.eventSequence != oldEventSequence) {
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
EQI4 $494
line 1238
;1238:		ent->eventTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1239
;1239:	}
LABELV $494
line 1242
;1240:
;1241:	// swap and latch button actions
;1242:	client->oldbuttons = client->buttons;
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
line 1243
;1243:	client->buttons = ucmd->buttons;
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
line 1244
;1244:	client->latched_buttons |= client->buttons & ~client->oldbuttons;
ADDRLP4 320
ADDRLP4 0
INDIRP4
CNSTI4 2596
ADDP4
ASGNP4
ADDRLP4 320
INDIRP4
ADDRLP4 320
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
line 1247
;1245:
;1246:	// check for respawning
;1247:	if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $497
line 1249
;1248:		// wait for the attack button to be pressed
;1249:		if ( level.time > client->respawnTime ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 2664
ADDP4
INDIRI4
LEI4 $354
line 1251
;1250:			// forcerespawn is to prevent users from waiting out powerups
;1251:			if ( g_forcerespawn.integer > 0 && 
ADDRGP4 g_forcerespawn+12
INDIRI4
CNSTI4 0
LEI4 $502
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
LEI4 $502
line 1252
;1252:				( level.time - client->respawnTime ) > g_forcerespawn.integer * 1000 ) {
line 1253
;1253:				respawn( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 1254
;1254:				return;
ADDRGP4 $354
JUMPV
LABELV $502
line 1258
;1255:			}
;1256:		
;1257:			// pressing attack or use is the normal respawn method
;1258:			if ( ucmd->buttons & ( BUTTON_ATTACK | BUTTON_USE_HOLDABLE ) ) {
ADDRLP4 236
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 5
BANDI4
CNSTI4 0
EQI4 $354
line 1259
;1259:				respawn( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 1260
;1260:			}
line 1261
;1261:		}
line 1262
;1262:		return;
ADDRGP4 $354
JUMPV
LABELV $497
line 1266
;1263:	}
;1264:
;1265:	// perform once-a-second actions
;1266:	ClientTimerActions( ent, msec );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 240
INDIRI4
ARGI4
ADDRGP4 ClientTimerActions
CALLV
pop
line 1267
;1267:}
LABELV $354
endproc ClientThink_real 324 12
export ClientThink
proc ClientThink 8 8
line 1276
;1268:
;1269:/*
;1270:==================
;1271:ClientThink
;1272:
;1273:A new command has arrived from the client
;1274:==================
;1275:*/
;1276:void ClientThink( int clientNum ) {
line 1279
;1277:	gentity_t *ent;
;1278:
;1279:	ent = g_entities + clientNum;
ADDRLP4 0
CNSTI4 916
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1280
;1280:	trap_GetUsercmd( clientNum, &ent->client->pers.cmd );
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
line 1291
;1281:
;1282://unlagged - smooth clients #1
;1283:	// this is handled differently now
;1284:/*
;1285:	// mark the time we got info, so we can display the
;1286:	// phone jack if they don't get any for a while
;1287:	ent->client->lastCmdTime = level.time;
;1288:*/
;1289://unlagged - smooth clients #1
;1290:
;1291:	if ( !(ent->r.svFlags & SVF_BOT) && !g_synchronousClients.integer ) {
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
NEI4 $510
ADDRGP4 g_synchronousClients+12
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $510
line 1292
;1292:		ClientThink_real( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ClientThink_real
CALLV
pop
line 1293
;1293:	}
LABELV $510
line 1294
;1294:}
LABELV $509
endproc ClientThink 8 8
export G_RunClient
proc G_RunClient 4 4
line 1297
;1295:
;1296:
;1297:void G_RunClient( gentity_t *ent ) {
line 1298
;1298:	if ( !(ent->r.svFlags & SVF_BOT) && !g_synchronousClients.integer ) {
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
NEI4 $514
ADDRGP4 g_synchronousClients+12
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $514
line 1299
;1299:		return;
ADDRGP4 $513
JUMPV
LABELV $514
line 1301
;1300:	}
;1301:	ent->client->pers.cmd.serverTime = level.time;
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
line 1302
;1302:	ClientThink_real( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientThink_real
CALLV
pop
line 1303
;1303:}
LABELV $513
endproc G_RunClient 4 4
export SpectatorClientEndFrame
proc SpectatorClientEndFrame 24 4
line 1312
;1304:
;1305:
;1306:/*
;1307:==================
;1308:SpectatorClientEndFrame
;1309:
;1310:==================
;1311:*/
;1312:void SpectatorClientEndFrame( gentity_t *ent ) {
line 1316
;1313:	gclient_t	*cl;
;1314:
;1315:	// if we are doing a chase cam or a remote view, grab the latest info
;1316:	if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2560
ADDP4
INDIRI4
CNSTI4 2
NEI4 $519
line 1319
;1317:		int		clientNum, flags;
;1318:
;1319:		clientNum = ent->client->sess.spectatorClient;
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
line 1322
;1320:
;1321:		// team follow1 and team follow2 go to whatever clients are playing
;1322:		if ( clientNum == -1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
NEI4 $521
line 1323
;1323:			clientNum = level.follow1;
ADDRLP4 4
ADDRGP4 level+352
INDIRI4
ASGNI4
line 1324
;1324:		} else if ( clientNum == -2 ) {
ADDRGP4 $522
JUMPV
LABELV $521
ADDRLP4 4
INDIRI4
CNSTI4 -2
NEI4 $524
line 1325
;1325:			clientNum = level.follow2;
ADDRLP4 4
ADDRGP4 level+356
INDIRI4
ASGNI4
line 1326
;1326:		}
LABELV $524
LABELV $522
line 1327
;1327:		if ( clientNum >= 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $527
line 1328
;1328:			cl = &level.clients[ clientNum ];
ADDRLP4 0
CNSTI4 3456
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1329
;1329:			if ( cl->pers.connected == CON_CONNECTED && cl->sess.sessionTeam != TEAM_SPECTATOR ) {
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
NEI4 $529
ADDRLP4 12
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
EQI4 $529
line 1330
;1330:				flags = (cl->ps.eFlags & ~(EF_VOTED | EF_TEAMVOTED)) | (ent->client->ps.eFlags & (EF_VOTED | EF_TEAMVOTED));
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
line 1331
;1331:				ent->client->ps = cl->ps;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ADDRLP4 0
INDIRP4
INDIRB
ASGNB 468
line 1332
;1332:				ent->client->ps.pm_flags |= PMF_FOLLOW;
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
line 1333
;1333:				ent->client->ps.eFlags = flags;
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
line 1334
;1334:				return;
ADDRGP4 $518
JUMPV
LABELV $529
line 1335
;1335:			} else {
line 1337
;1336:				// drop them to free spectators unless they are dedicated camera followers
;1337:				if ( ent->client->sess.spectatorClient >= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
CNSTI4 0
LTI4 $531
line 1338
;1338:					ent->client->sess.spectatorState = SPECTATOR_FREE;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2560
ADDP4
CNSTI4 1
ASGNI4
line 1339
;1339:					ClientBegin( ent->client - level.clients );
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
CNSTI4 3456
DIVI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 1340
;1340:				}
LABELV $531
line 1341
;1341:			}
line 1342
;1342:		}
LABELV $527
line 1343
;1343:	}
LABELV $519
line 1345
;1344:
;1345:	if ( ent->client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2560
ADDP4
INDIRI4
CNSTI4 3
NEI4 $533
line 1346
;1346:		ent->client->ps.pm_flags |= PMF_SCOREBOARD;
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
line 1347
;1347:	} else {
ADDRGP4 $534
JUMPV
LABELV $533
line 1348
;1348:		ent->client->ps.pm_flags &= ~PMF_SCOREBOARD;
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
line 1349
;1349:	}
LABELV $534
line 1350
;1350:}
LABELV $518
endproc SpectatorClientEndFrame 24 4
export ClientEndFrame
proc ClientEndFrame 52 12
line 1361
;1351:
;1352:/*
;1353:==============
;1354:ClientEndFrame
;1355:
;1356:Called at the end of each server frame for each connected client
;1357:A fast client will have multiple ClientThink for each ClientEdFrame,
;1358:while a slow client may have multiple ClientEndFrame between ClientThink.
;1359:==============
;1360:*/
;1361:void ClientEndFrame( gentity_t *ent ) {
line 1369
;1362:	int			i;
;1363:	clientPersistant_t	*pers;
;1364:
;1365://unlagged - smooth clients #1
;1366:	int frames;
;1367://unlagged - smooth clients #1
;1368:
;1369:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $536
line 1370
;1370:		SpectatorClientEndFrame( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SpectatorClientEndFrame
CALLV
pop
line 1371
;1371:		return;
ADDRGP4 $535
JUMPV
LABELV $536
line 1374
;1372:	}
;1373:
;1374:	pers = &ent->client->pers;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 468
ADDP4
ASGNP4
line 1377
;1375:
;1376:	// turn off any expired powerups
;1377:	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $538
line 1378
;1378:		if ( ent->client->ps.powerups[ i ] < level.time ) {
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
GEI4 $542
line 1379
;1379:			ent->client->ps.powerups[ i ] = 0;
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
line 1380
;1380:		}
LABELV $542
line 1381
;1381:	}
LABELV $539
line 1377
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $538
line 1414
;1382:
;1383:#ifdef MISSIONPACK
;1384:	// set powerup for player animation
;1385:	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;1386:		ent->client->ps.powerups[PW_GUARD] = level.time;
;1387:	}
;1388:	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_SCOUT ) {
;1389:		ent->client->ps.powerups[PW_SCOUT] = level.time;
;1390:	}
;1391:	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_DOUBLER ) {
;1392:		ent->client->ps.powerups[PW_DOUBLER] = level.time;
;1393:	}
;1394:	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_AMMOREGEN ) {
;1395:		ent->client->ps.powerups[PW_AMMOREGEN] = level.time;
;1396:	}
;1397:	if ( ent->client->invulnerabilityTime > level.time ) {
;1398:		ent->client->ps.powerups[PW_INVULNERABILITY] = level.time;
;1399:	}
;1400:#endif
;1401:
;1402:	// save network bandwidth
;1403:#if 0
;1404:	if ( !g_synchronousClients->integer && ent->client->ps.pm_type == PM_NORMAL ) {
;1405:		// FIXME: this must change eventually for non-sync demo recording
;1406:		VectorClear( ent->client->ps.viewangles );
;1407:	}
;1408:#endif
;1409:
;1410:	//
;1411:	// If the end of unit layout is displayed, don't give
;1412:	// the player any normal movement attributes
;1413:	//
;1414:	if ( level.intermissiontime ) {
ADDRGP4 level+9140
INDIRI4
CNSTI4 0
EQI4 $545
line 1415
;1415:		return;
ADDRGP4 $535
JUMPV
LABELV $545
line 1419
;1416:	}
;1417:
;1418:	// burn from lava, etc
;1419:	P_WorldEffects (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 P_WorldEffects
CALLV
pop
line 1422
;1420:
;1421:	// apply all the damage taken this frame
;1422:	P_DamageFeedback (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 P_DamageFeedback
CALLV
pop
line 1436
;1423:
;1424://unlagged - smooth clients #1
;1425:	// this is handled differently now
;1426:/*
;1427:	// add the EF_CONNECTION flag if we haven't gotten commands recently
;1428:	if ( level.time - ent->client->lastCmdTime > 1000 ) {
;1429:		ent->client->ps.eFlags |= EF_CONNECTION;
;1430:	} else {
;1431:		ent->client->ps.eFlags &= ~EF_CONNECTION;
;1432:	}
;1433:*/
;1434://unlagged - smooth clients #1
;1435:
;1436:	ent->client->ps.stats[STAT_HEALTH] = ent->health;	// FIXME: get rid of ent->health...
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
line 1438
;1437:
;1438:	G_SetClientSound (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_SetClientSound
CALLV
pop
line 1452
;1439:
;1440:	// set the latest information
;1441://unlagged - smooth clients #2
;1442:	// clients no longer do extrapolation if cg_smoothClients is 1, because
;1443:	// skip correction is all handled server-side now
;1444:	// since that's the case, it makes no sense to store the extra info
;1445:	// in the client's snapshot entity, so let's save a little bandwidth
;1446:/*
;1447:	if (g_smoothClients.integer) {
;1448:		BG_PlayerStateToEntityStateExtraPolate( &ent->client->ps, &ent->s, ent->client->ps.commandTime, qtrue );
;1449:	}
;1450:	else {
;1451:*/
;1452:		BG_PlayerStateToEntityState( &ent->client->ps, &ent->s, qtrue );
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
line 1456
;1453://	}
;1454://unlagged - smooth clients #2
;1455:
;1456:	SendPendingPredictableEvents( &ent->client->ps );
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 SendPendingPredictableEvents
CALLV
pop
line 1460
;1457:
;1458://unlagged - smooth clients #1
;1459:	// mark as not missing updates initially
;1460:	ent->client->ps.eFlags &= ~EF_CONNECTION;
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
line 1463
;1461:
;1462:	// see how many frames the client has missed
;1463:	frames = level.framenum - ent->client->lastUpdateFrame - 1;
ADDRLP4 4
ADDRGP4 level+28
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 3452
ADDP4
INDIRI4
SUBI4
CNSTI4 1
SUBI4
ASGNI4
line 1466
;1464:
;1465:	// don't extrapolate more than two frames
;1466:	if ( frames > 2 ) {
ADDRLP4 4
INDIRI4
CNSTI4 2
LEI4 $549
line 1467
;1467:		frames = 2;
ADDRLP4 4
CNSTI4 2
ASGNI4
line 1470
;1468:
;1469:		// if they missed more than two in a row, show the phone jack
;1470:		ent->client->ps.eFlags |= EF_CONNECTION;
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
line 1471
;1471:		ent->s.eFlags |= EF_CONNECTION;
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
line 1472
;1472:	}
LABELV $549
line 1475
;1473:
;1474:	// did the client miss any frames?
;1475:	if ( frames > 0 && g_smoothClients.integer ) {
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $551
ADDRGP4 g_smoothClients+12
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $551
line 1477
;1476:		// yep, missed one or more, so extrapolate the player's movement
;1477:		G_PredictPlayerMove( ent, (float)frames / sv_fps.integer );
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
line 1479
;1478:		// save network bandwidth
;1479:		SnapVector( ent->s.pos.trBase );
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
line 1480
;1480:	}
LABELV $551
line 1485
;1481://unlagged - smooth clients #1
;1482:
;1483://unlagged - backward reconciliation #1
;1484:	// store the client's position for backward reconciliation later
;1485:	G_StoreHistory( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_StoreHistory
CALLV
pop
line 1491
;1486://unlagged - backward reconciliation #1
;1487:
;1488:	// set the bit for the reachability area the client is currently in
;1489://	i = trap_AAS_PointReachabilityAreaIndex( ent->client->ps.origin );
;1490://	ent->client->areabits[i >> 3] |= 1 << (i & 7);
;1491:}
LABELV $535
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
LABELV $406
byte 1 51
byte 1 51
byte 1 0
align 1
LABELV $402
byte 1 56
byte 1 0
align 1
LABELV $401
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
LABELV $319
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
LABELV $314
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
LABELV $309
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
LABELV $304
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
LABELV $299
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
LABELV $294
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
LABELV $286
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
LABELV $281
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
LABELV $276
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
LABELV $271
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
LABELV $266
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
LABELV $261
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
LABELV $219
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
LABELV $217
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
LABELV $207
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
LABELV $203
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
