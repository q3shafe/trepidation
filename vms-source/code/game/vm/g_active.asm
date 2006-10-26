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
CNSTI4 876
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
CNSTI4 876
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
CNSTI4 876
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+872
ADDP4
INDIRI4
CNSTI4 1
NEI4 $232
line 469
;469:		{
line 470
;470:			client->ps.speed = 50;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 50
ASGNI4
line 471
;471:			g_entities[client->ps.clientNum].health=-3;
CNSTI4 876
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+748
ADDP4
CNSTI4 -3
ASGNI4
line 473
;472:			// Let them go when they are about dead.
;473:			if (g_entities[client->ps.clientNum].health < 8) { g_entities[client->ps.clientNum].immobilized = qfalse; }
CNSTI4 876
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
GEI4 $236
CNSTI4 876
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+872
ADDP4
CNSTI4 0
ASGNI4
LABELV $236
line 474
;474:		}
LABELV $232
line 477
;475:
;476:		// count down armor when over max
;477:		if ( client->ps.stats[STAT_ARMOR] > client->ps.stats[STAT_MAX_HEALTH] ) {
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
LEI4 $240
line 478
;478:			client->ps.stats[STAT_ARMOR]--;
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
line 479
;479:		}
LABELV $240
line 480
;480:	}
LABELV $206
line 392
ADDRLP4 0
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
CNSTI4 1000
GEI4 $205
line 520
;481:#ifdef MISSIONPACK
;482:	if( bg_itemlist[client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_AMMOREGEN ) {
;483:		int w, max, inc, t, i;
;484:    int weapList[]={WP_MACHINEGUN,WP_SHOTGUN,WP_GRENADE_LAUNCHER,WP_ROCKET_LAUNCHER,WP_LIGHTNING,WP_RAILGUN,WP_PLASMAGUN,WP_BFG,WP_NAILGUN,WP_PROX_LAUNCHER,WP_CHAINGUN};
;485:    int weapCount = sizeof(weapList) / sizeof(int);
;486:		//
;487:    for (i = 0; i < weapCount; i++) {
;488:		  w = weapList[i];
;489:
;490:		  switch(w) {
;491:			  case WP_MACHINEGUN: max = 50; inc = 4; t = 1000; break;
;492:			  case WP_SHOTGUN: max = 10; inc = 1; t = 1500; break;
;493:			  case WP_GRENADE_LAUNCHER: max = 10; inc = 1; t = 2000; break;
;494:			  case WP_ROCKET_LAUNCHER: max = 10; inc = 1; t = 1750; break;
;495:			  case WP_LIGHTNING: max = 50; inc = 5; t = 1500; break;
;496:			  case WP_RAILGUN: max = 10; inc = 1; t = 1750; break;
;497:			  case WP_PLASMAGUN: max = 50; inc = 5; t = 1500; break;
;498:			  case WP_BFG: max = 10; inc = 1; t = 4000; break;
;499:			  case WP_NAILGUN: max = 10; inc = 1; t = 1250; break;
;500:			  case WP_PROX_LAUNCHER: max = 5; inc = 1; t = 2000; break;
;501:			  case WP_CHAINGUN: max = 100; inc = 5; t = 1000; break;
;502:			  default: max = 0; inc = 0; t = 1000; break;
;503:		  }
;504:		  client->ammoTimes[w] += msec;
;505:		  if ( client->ps.ammo[w] >= max ) {
;506:			  client->ammoTimes[w] = 0;
;507:		  }
;508:		  if ( client->ammoTimes[w] >= t ) {
;509:			  while ( client->ammoTimes[w] >= t )
;510:				  client->ammoTimes[w] -= t;
;511:			  client->ps.ammo[w] += inc;
;512:			  if ( client->ps.ammo[w] > max ) {
;513:				  client->ps.ammo[w] = max;
;514:			  }
;515:		  }
;516:    }
;517:	}
;518:#endif
;519:
;520:	if (g_GameMode.integer == 3)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 3
NEI4 $242
line 521
;521:	{
line 525
;522:
;523:		// Give Warnings That An MC Is Needed
;524:		// Clean this up !
;525:		if ((client->sess.sessionTeam == TEAM_RED) && ( level.redNeedMC == 1))
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
NEI4 $245
ADDRGP4 level+9300
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $245
line 526
;526:		{
line 527
;527:			if(level.time-level.blueScoreTime == 50000)	{ trap_SendServerCommand( client - level.clients, "cp \"Red Team Has 5 Sec\n To Place Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+48
INDIRI4
SUBI4
CNSTI4 50000
NEI4 $248
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
ADDRGP4 $252
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $248
line 528
;528:			if(level.time-level.blueScoreTime == 45000)	{ trap_SendServerCommand( client - level.clients, "cp \"Red Team Has 10 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+48
INDIRI4
SUBI4
CNSTI4 45000
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
line 529
;529:			if(level.time-level.blueScoreTime == 40000)	{ trap_SendServerCommand( client - level.clients, "cp \"Red Team Has 15 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+48
INDIRI4
SUBI4
CNSTI4 40000
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
line 530
;530:			if(level.time-level.blueScoreTime == 35000)	{ trap_SendServerCommand( client - level.clients, "cp \"Red Team Has 20 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+48
INDIRI4
SUBI4
CNSTI4 35000
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
line 531
;531:			if(level.time-level.blueScoreTime == 30000)	{ trap_SendServerCommand( client - level.clients, "cp \"Red Team Has 25 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+48
INDIRI4
SUBI4
CNSTI4 30000
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
line 532
;532:			if(level.time-level.blueScoreTime == 25000)	{ trap_SendServerCommand( client - level.clients, "cp \"Red Team Has 30 Sec\n To Build Power Core!\n\"" ); }	
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+48
INDIRI4
SUBI4
CNSTI4 25000
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
line 534
;533:
;534:		}
LABELV $245
line 535
;535:		if ((client->sess.sessionTeam == TEAM_BLUE) && ( level.blueNeedMC == 1))
ADDRLP4 0
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $278
ADDRGP4 level+9296
INDIRI4
CNSTI4 1
NEI4 $278
line 536
;536:		{
line 537
;537:			if(level.time-level.redScoreTime == 50000)	{ trap_SendServerCommand( client - level.clients, "cp \"Blue Team Has 5 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+44
INDIRI4
SUBI4
CNSTI4 50000
NEI4 $281
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
ADDRGP4 $285
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $281
line 538
;538:			if(level.time-level.redScoreTime == 45000)	{ trap_SendServerCommand( client - level.clients, "cp \"Blue Team Has 10 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+44
INDIRI4
SUBI4
CNSTI4 45000
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
line 539
;539:			if(level.time-level.redScoreTime == 40000)	{ trap_SendServerCommand( client - level.clients, "cp \"Blue Team Has 15 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+44
INDIRI4
SUBI4
CNSTI4 40000
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
line 540
;540:			if(level.time-level.redScoreTime == 35000)	{ trap_SendServerCommand( client - level.clients, "cp \"Blue Team Has 20 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+44
INDIRI4
SUBI4
CNSTI4 35000
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
line 541
;541:			if(level.time-level.redScoreTime == 30000)	{ trap_SendServerCommand( client - level.clients, "cp \"Blue Team Has 25 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+44
INDIRI4
SUBI4
CNSTI4 30000
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
line 542
;542:			if(level.time-level.redScoreTime == 25000)	{ trap_SendServerCommand( client - level.clients, "cp \"Blue Team Has 30 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+44
INDIRI4
SUBI4
CNSTI4 25000
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
line 543
;543:		}
LABELV $278
line 545
;544:
;545:	}
LABELV $242
line 548
;546:
;547:
;548:}
LABELV $204
endproc ClientTimerActions 20 12
export ClientIntermissionThink
proc ClientIntermissionThink 24 0
line 555
;549:
;550:/*
;551:====================
;552:ClientIntermissionThink
;553:====================
;554:*/
;555:void ClientIntermissionThink( gclient_t *client ) {
line 556
;556:	client->ps.eFlags &= ~EF_TALK;
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
line 557
;557:	client->ps.eFlags &= ~EF_FIRING;
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
line 562
;558:
;559:	// the level will exit when everyone wants to or after timeouts
;560:
;561:	// swap and latch button actions
;562:	client->oldbuttons = client->buttons;
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
line 563
;563:	client->buttons = client->pers.cmd.buttons;
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
line 564
;564:	if ( client->buttons & ( BUTTON_ATTACK | BUTTON_USE_HOLDABLE ) & ( client->oldbuttons ^ client->buttons ) ) {
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
EQI4 $312
line 566
;565:		// this used to be an ^1 but once a player says ready, it should stick
;566:		client->readyToExit = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2580
ADDP4
CNSTI4 1
ASGNI4
line 567
;567:	}
LABELV $312
line 568
;568:}
LABELV $311
endproc ClientIntermissionThink 24 0
export ClientEvents
proc ClientEvents 96 32
line 579
;569:
;570:
;571:/*
;572:================
;573:ClientEvents
;574:
;575:Events will be passed on to the clients for presentation,
;576:but any server game effects are handled here
;577:================
;578:*/
;579:void ClientEvents( gentity_t *ent, int oldEventSequence ) {
line 590
;580:	int		i,j; // , j; unreferenced - Shafe - trep
;581:	int		event;
;582:	gclient_t *client;
;583:	int		damage;
;584:	vec3_t	dir;
;585:	vec3_t	origin, angles;
;586:	qboolean	fired;
;587:	gitem_t *item; // unreferenced - Shafe - trep
;588:	gentity_t *drop; // unreferenced - Shafe - trep
;589:
;590:	client = ent->client;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 592
;591:
;592:	if ( oldEventSequence < client->ps.eventSequence - MAX_PS_EVENTS ) {
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
GEI4 $315
line 593
;593:		oldEventSequence = client->ps.eventSequence - MAX_PS_EVENTS;
ADDRFP4 4
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 594
;594:	}
LABELV $315
line 595
;595:	for ( i = oldEventSequence ; i < client->ps.eventSequence ; i++ ) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 $320
JUMPV
LABELV $317
line 596
;596:		event = client->ps.events[ i & (MAX_PS_EVENTS-1) ];
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
line 598
;597:
;598:		switch ( event ) {
ADDRLP4 72
CNSTI4 11
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 72
INDIRI4
EQI4 $323
ADDRLP4 4
INDIRI4
CNSTI4 12
EQI4 $323
ADDRLP4 4
INDIRI4
ADDRLP4 72
INDIRI4
LTI4 $322
LABELV $339
ADDRLP4 4
INDIRI4
CNSTI4 23
LTI4 $322
ADDRLP4 4
INDIRI4
CNSTI4 31
GTI4 $322
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $340-92
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $340
address $334
address $335
address $322
address $336
address $337
address $322
address $322
address $322
address $338
code
LABELV $323
line 601
;599:		case EV_FALL_MEDIUM:
;600:		case EV_FALL_FAR:
;601:			if ( ent->s.eType != ET_PLAYER ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
EQI4 $324
line 602
;602:				break;		// not in the player model
ADDRGP4 $322
JUMPV
LABELV $324
line 604
;603:			}
;604:			if ( g_dmflags.integer & DF_NO_FALLING ) {
ADDRGP4 g_dmflags+12
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $326
line 605
;605:				break;
ADDRGP4 $322
JUMPV
LABELV $326
line 607
;606:			}
;607:			if ( event == EV_FALL_FAR ) {
ADDRLP4 4
INDIRI4
CNSTI4 12
NEI4 $329
line 608
;608:				damage = 10;
ADDRLP4 24
CNSTI4 10
ASGNI4
line 609
;609:			} else {
ADDRGP4 $330
JUMPV
LABELV $329
line 610
;610:				damage = 5;
ADDRLP4 24
CNSTI4 5
ASGNI4
line 611
;611:			}
LABELV $330
line 612
;612:			VectorSet (dir, 0, 0, 1);
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
line 613
;613:			ent->pain_debounce_time = level.time + 200;	// no normal pain sound
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 614
;614:			G_Damage (ent, NULL, NULL, NULL, NULL, damage, 0, MOD_FALLING);
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
line 615
;615:			break;
ADDRGP4 $322
JUMPV
LABELV $334
line 618
;616:
;617:		case EV_FIRE_WEAPON:
;618:			FireWeapon( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 FireWeapon
CALLV
pop
line 619
;619:			break;
ADDRGP4 $322
JUMPV
LABELV $335
line 623
;620:
;621:		// Shafe - Trep - Alt Fire
;622:		case EV_FIRE_WEAPON2: 
;623:			FireWeapon2( ent ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 FireWeapon2
CALLV
pop
line 624
;624:			break;
ADDRGP4 $322
JUMPV
LABELV $336
line 677
;625:
;626:		case EV_USE_ITEM1:		// teleporter
;627:			// drop flags in CTF
;628:			//Team_DropFlags( ent );
;629:			/* Shafe - Trep - This is now in g_team.c - Keeping it here only for reference
;630:			item = NULL;
;631:			j = 0;
;632:
;633:			if ( ent->client->ps.powerups[ PW_REDFLAG ] ) {
;634:				item = BG_FindItemForPowerup( PW_REDFLAG );
;635:				j = PW_REDFLAG;
;636:			} else if ( ent->client->ps.powerups[ PW_BLUEFLAG ] ) {
;637:				item = BG_FindItemForPowerup( PW_BLUEFLAG );
;638:				j = PW_BLUEFLAG;
;639:			} else if ( ent->client->ps.powerups[ PW_NEUTRALFLAG ] ) {
;640:				item = BG_FindItemForPowerup( PW_NEUTRALFLAG );
;641:				j = PW_NEUTRALFLAG;
;642:			}
;643:
;644:			if ( item ) {
;645:				drop = Drop_Item( ent, item, 0 );
;646:				// decide how many seconds it has left
;647:				drop->count = ( ent->client->ps.powerups[ j ] - level.time ) / 1000;
;648:				if ( drop->count < 1 ) {
;649:					drop->count = 1;
;650:				}
;651:
;652:				ent->client->ps.powerups[ j ] = 0;
;653:			} */
;654:#ifdef MISSIONPACK
;655:			if ( g_gametype.integer == GT_HARVESTER ) {
;656:				if ( ent->client->ps.generic1 > 0 ) {
;657:					if ( ent->client->sess.sessionTeam == TEAM_RED ) {
;658:						item = BG_FindItem( "Blue Cube" );
;659:					} else {
;660:						item = BG_FindItem( "Red Cube" );
;661:					}
;662:					if ( item ) {
;663:						for ( j = 0; j < ent->client->ps.generic1; j++ ) {
;664:							drop = Drop_Item( ent, item, 0 );
;665:							if ( ent->client->sess.sessionTeam == TEAM_RED ) {
;666:								drop->spawnflags = TEAM_BLUE;
;667:							} else {
;668:								drop->spawnflags = TEAM_RED;
;669:							}
;670:						}
;671:					}
;672:					ent->client->ps.generic1 = 0;
;673:				}
;674:			}
;675:#endif
;676://			PrintMsg( NULL, "%i" S_COLOR_WHITE " DEBUG: USE Teleporter\n", ent->item->giTag ); // Shafe - Debug
;677:			SelectSpawnPoint( ent->client->ps.origin, origin, angles );
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
line 678
;678:			TeleportPlayer( ent, origin, angles );
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
line 681
;679:
;680:
;681:			break;
ADDRGP4 $322
JUMPV
LABELV $337
line 685
;682:
;683:		case EV_USE_ITEM2:		// medkit
;684://			PrintMsg( NULL, "%i" S_COLOR_WHITE " DEBUG: USE Medkit\n", ent->item->giTag ); // Shafe - Debug
;685:			ent->health = ent->client->ps.stats[STAT_MAX_HEALTH] + 25;
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
line 686
;686:			break;
ADDRGP4 $322
JUMPV
LABELV $338
line 710
;687:
;688:		
;689:#ifdef MISSIONPACK
;690:		case EV_USE_ITEM3:		// kamikaze
;691:			// make sure the invulnerability is off
;692:			ent->client->invulnerabilityTime = 0;
;693:			// start the kamikze
;694:			G_StartKamikaze( ent );
;695:			break;
;696:
;697:		case EV_USE_ITEM4:		// portal
;698:			if( ent->client->portalID ) {
;699:				DropPortalSource( ent );
;700:			}
;701:			else {
;702:				DropPortalDestination( ent );
;703:			}
;704:			break;
;705:		case EV_USE_ITEM5:		// invulnerability
;706:			ent->client->invulnerabilityTime = level.time + 10000;
;707:			break;
;708:#endif
;709:		case EV_USE_ITEM6:		// drop flags? Shafe - Trep
;710:			Team_DropFlags( ent ); // Shafe - Trep - Drop Flags  - This doesnt seem to work.. 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Team_DropFlags
CALLV
pop
line 711
;711:			break;
line 714
;712:
;713:		default:
;714:			break;
LABELV $322
line 716
;715:		}
;716:	}
LABELV $318
line 595
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $320
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
LTI4 $317
line 718
;717:
;718:}
LABELV $314
endproc ClientEvents 96 32
export SendPendingPredictableEvents
proc SendPendingPredictableEvents 44 12
line 770
;719:
;720:#ifdef MISSIONPACK
;721:/*
;722:==============
;723:StuckInOtherClient
;724:==============
;725:*/
;726:static int StuckInOtherClient(gentity_t *ent) {
;727:	int i;
;728:	gentity_t	*ent2;
;729:
;730:	ent2 = &g_entities[0];
;731:	for ( i = 0; i < MAX_CLIENTS; i++, ent2++ ) {
;732:		if ( ent2 == ent ) {
;733:			continue;
;734:		}
;735:		if ( !ent2->inuse ) {
;736:			continue;
;737:		}
;738:		if ( !ent2->client ) {
;739:			continue;
;740:		}
;741:		if ( ent2->health <= 0 ) {
;742:			continue;
;743:		}
;744:		//
;745:		if (ent2->r.absmin[0] > ent->r.absmax[0])
;746:			continue;
;747:		if (ent2->r.absmin[1] > ent->r.absmax[1])
;748:			continue;
;749:		if (ent2->r.absmin[2] > ent->r.absmax[2])
;750:			continue;
;751:		if (ent2->r.absmax[0] < ent->r.absmin[0])
;752:			continue;
;753:		if (ent2->r.absmax[1] < ent->r.absmin[1])
;754:			continue;
;755:		if (ent2->r.absmax[2] < ent->r.absmin[2])
;756:			continue;
;757:		return qtrue;
;758:	}
;759:	return qfalse;
;760:}
;761:#endif
;762:
;763:void BotTestSolid(vec3_t origin);
;764:
;765:/*
;766:==============
;767:SendPendingPredictableEvents
;768:==============
;769:*/
;770:void SendPendingPredictableEvents( playerState_t *ps ) {
line 776
;771:	gentity_t *t;
;772:	int event, seq;
;773:	int extEvent, number;
;774:
;775:	// if there are still events pending
;776:	if ( ps->entityEventSequence < ps->eventSequence ) {
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
GEI4 $343
line 779
;777:		// create a temporary entity for this event which is sent to everyone
;778:		// except the client who generated the event
;779:		seq = ps->entityEventSequence & (MAX_PS_EVENTS-1);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 780
;780:		event = ps->events[ seq ] | ( ( ps->entityEventSequence & 3 ) << 8 );
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
line 782
;781:		// set external event to zero before calling BG_PlayerStateToEntityState
;782:		extEvent = ps->externalEvent;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
ASGNI4
line 783
;783:		ps->externalEvent = 0;
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
CNSTI4 0
ASGNI4
line 785
;784:		// create temporary entity for event
;785:		t = G_TempEntity( ps->origin, event );
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
line 786
;786:		number = t->s.number;
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 787
;787:		BG_PlayerStateToEntityState( ps, &t->s, qtrue );
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
line 788
;788:		t->s.number = number;
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ASGNI4
line 789
;789:		t->s.eType = ET_EVENTS + event;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 14
ADDI4
ASGNI4
line 790
;790:		t->s.eFlags |= EF_PLAYER_EVENT;
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
line 791
;791:		t->s.otherEntityNum = ps->clientNum;
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
line 793
;792:		// send to everyone except the client who generated the event
;793:		t->r.svFlags |= SVF_NOTSINGLECLIENT;
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
line 794
;794:		t->r.singleClient = ps->clientNum;
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
line 796
;795:		// set back external event
;796:		ps->externalEvent = extEvent;
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 797
;797:	}
LABELV $343
line 798
;798:}
LABELV $342
endproc SendPendingPredictableEvents 44 12
export ClientThink_real
proc ClientThink_real 320 12
line 811
;799:
;800:/*
;801:==============
;802:ClientThink
;803:
;804:This will be called once for each client frame, which will
;805:usually be a couple times for each server frame on fast clients.
;806:
;807:If "g_synchronousClients 1" is set, this will be called exactly
;808:once for each server frame, which makes for smooth demo recording.
;809:==============
;810:*/
;811:void ClientThink_real( gentity_t *ent ) {
line 818
;812:	gclient_t	*client;
;813:	pmove_t		pm;
;814:	int			oldEventSequence;
;815:	int			msec;
;816:	usercmd_t	*ucmd;
;817:
;818:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 821
;819:
;820:	// don't think if the client is not yet connected (and thus not yet spawned in)
;821:	if (client->pers.connected != CON_CONNECTED) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $346
line 822
;822:		return;
ADDRGP4 $345
JUMPV
LABELV $346
line 825
;823:	}
;824:	// mark the time, so the connection sprite can be removed
;825:	ucmd = &ent->client->pers.cmd;
ADDRLP4 236
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 472
ADDP4
ASGNP4
line 828
;826:
;827:	// sanity check the command time to prevent speedup cheating
;828:	if ( ucmd->serverTime > level.time + 200 ) {
ADDRLP4 236
INDIRP4
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
LEI4 $348
line 829
;829:		ucmd->serverTime = level.time + 200;
ADDRLP4 236
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 831
;830://		G_Printf("serverTime <<<<<\n" );
;831:	}
LABELV $348
line 832
;832:	if ( ucmd->serverTime < level.time - 1000 ) {
ADDRLP4 236
INDIRP4
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
SUBI4
GEI4 $352
line 833
;833:		ucmd->serverTime = level.time - 1000;
ADDRLP4 236
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
SUBI4
ASGNI4
line 835
;834://		G_Printf("serverTime >>>>>\n" );
;835:	} 
LABELV $352
line 842
;836:
;837:
;838://unlagged - backward reconciliation #4
;839:	// frameOffset should be about the number of milliseconds into a frame 
;840:	// this command packet was received, depending on how fast the server
;841:	// does a G_RunFrame()
;842:	client->frameOffset = trap_Milliseconds() - level.frameStartTime;
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
line 848
;843://unlagged - backward reconciliation #4
;844:
;845:
;846://unlagged - lag simulation #3
;847:	// if the client wants to simulate outgoing packet loss
;848:	if ( client->pers.plOut ) {
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
CNSTI4 0
EQI4 $357
line 850
;849:		// see if a random value is below the threshhold
;850:		float thresh = (float)client->pers.plOut / 100.0f;
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
line 851
;851:		if ( random() < thresh ) {
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
GEF4 $359
line 853
;852:			// do nothing at all if it is - this is a lost command
;853:			return;
ADDRGP4 $345
JUMPV
LABELV $359
line 855
;854:		}
;855:	}
LABELV $357
line 864
;856://unlagged - lag simulation #3
;857:
;858:
;859://unlagged - true ping
;860:	// save the estimated ping in a queue for averaging later
;861:
;862:	// we use level.previousTime to account for 50ms lag correction
;863:	// besides, this will turn out numbers more like what players are used to
;864:	client->pers.pingsamples[client->pers.samplehead] = level.previousTime + client->frameOffset - ucmd->serverTime;
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
line 865
;865:	client->pers.samplehead++;
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
line 866
;866:	if ( client->pers.samplehead >= NUM_PING_SAMPLES ) {
ADDRLP4 0
INDIRP4
CNSTI4 2440
ADDP4
INDIRI4
CNSTI4 64
LTI4 $362
line 867
;867:		client->pers.samplehead -= NUM_PING_SAMPLES;
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
line 868
;868:	}
LABELV $362
line 871
;869:
;870:	// initialize the real ping
;871:	if ( g_truePing.integer ) {
ADDRGP4 g_truePing+12
INDIRI4
CNSTI4 0
EQI4 $364
line 872
;872:		int i, sum = 0;
ADDRLP4 264
CNSTI4 0
ASGNI4
line 875
;873:
;874:		// get an average of the samples we saved up
;875:		for ( i = 0; i < NUM_PING_SAMPLES; i++ ) {
ADDRLP4 260
CNSTI4 0
ASGNI4
LABELV $367
line 876
;876:			sum += client->pers.pingsamples[i];
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
line 877
;877:		}
LABELV $368
line 875
ADDRLP4 260
ADDRLP4 260
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 64
LTI4 $367
line 879
;878:
;879:		client->pers.realPing = sum / NUM_PING_SAMPLES;
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
ADDRLP4 264
INDIRI4
CNSTI4 64
DIVI4
ASGNI4
line 880
;880:	}
ADDRGP4 $365
JUMPV
LABELV $364
line 881
;881:	else {
line 883
;882:		// if g_truePing is off, use the normal ping
;883:		client->pers.realPing = client->ps.ping;
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
line 884
;884:	}
LABELV $365
line 890
;885://unlagged - true ping
;886:
;887:
;888://unlagged - lag simulation #2
;889:	// keep a queue of past commands
;890:	client->pers.cmdqueue[client->pers.cmdhead] = client->pers.cmd;
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
line 891
;891:	client->pers.cmdhead++;
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
line 892
;892:	if ( client->pers.cmdhead >= MAX_LATENT_CMDS ) {
ADDRLP4 0
INDIRP4
CNSTI4 2176
ADDP4
INDIRI4
CNSTI4 64
LTI4 $371
line 893
;893:		client->pers.cmdhead -= MAX_LATENT_CMDS;
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
line 894
;894:	}
LABELV $371
line 897
;895:
;896:	// if the client wants latency in commands (client-to-server latency)
;897:	if ( client->pers.latentCmds ) {
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 0
EQI4 $373
line 899
;898:		// save the actual command time
;899:		int time = ucmd->serverTime;
ADDRLP4 272
ADDRLP4 236
INDIRP4
INDIRI4
ASGNI4
line 902
;900:
;901:		// find out which index in the queue we want
;902:		int cmdindex = client->pers.cmdhead - client->pers.latentCmds - 1;
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
ADDRGP4 $376
JUMPV
LABELV $375
line 903
;903:		while ( cmdindex < 0 ) {
line 904
;904:			cmdindex += MAX_LATENT_CMDS;
ADDRLP4 268
ADDRLP4 268
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 905
;905:		}
LABELV $376
line 903
ADDRLP4 268
INDIRI4
CNSTI4 0
LTI4 $375
line 908
;906:
;907:		// read in the old command
;908:		client->pers.cmd = client->pers.cmdqueue[cmdindex];
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
line 911
;909:
;910:		// adjust the real ping to reflect the new latency
;911:		client->pers.realPing += time - ucmd->serverTime;
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
line 912
;912:	}
LABELV $373
line 920
;913://unlagged - lag simulation #2
;914:
;915:
;916://unlagged - backward reconciliation #4
;917:	// save the command time *before* pmove_fixed messes with the serverTime,
;918:	// and *after* lag simulation messes with it :)
;919:	// attackTime will be used for backward reconciliation later (time shift)
;920:	client->attackTime = ucmd->serverTime;
ADDRLP4 0
INDIRP4
CNSTI4 2716
ADDP4
ADDRLP4 236
INDIRP4
INDIRI4
ASGNI4
line 927
;921://unlagged - backward reconciliation #4
;922:
;923:
;924://unlagged - smooth clients #1
;925:	// keep track of this for later - we'll use this to decide whether or not
;926:	// to send extrapolated positions for this client
;927:	client->lastUpdateFrame = level.framenum;
ADDRLP4 0
INDIRP4
CNSTI4 3448
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 933
;928://unlagged - smooth clients #1
;929:
;930:
;931://unlagged - lag simulation #1
;932:	// if the client is adding latency to received snapshots (server-to-client latency)
;933:	if ( client->pers.latentSnaps ) {
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 0
EQI4 $379
line 935
;934:		// adjust the real ping
;935:		client->pers.realPing += client->pers.latentSnaps * (1000 / sv_fps.integer);
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
line 937
;936:		// adjust the attack time so backward reconciliation will work
;937:		client->attackTime -= client->pers.latentSnaps * (1000 / sv_fps.integer);
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
line 938
;938:	}
LABELV $379
line 944
;939://unlagged - lag simulation #1
;940:
;941:
;942://unlagged - true ping
;943:	// make sure the true ping is over 0 - with cl_timenudge it can be less
;944:	if ( client->pers.realPing < 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
INDIRI4
CNSTI4 0
GEI4 $383
line 945
;945:		client->pers.realPing = 0;
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
CNSTI4 0
ASGNI4
line 946
;946:	}
LABELV $383
line 950
;947://unlagged - true ping
;948:
;949:
;950:	msec = ucmd->serverTime - client->ps.commandTime;
ADDRLP4 240
ADDRLP4 236
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 953
;951:	// following others may result in bad times, but we still want
;952:	// to check for follow toggles
;953:	if ( msec < 1 && client->sess.spectatorState != SPECTATOR_FOLLOW ) {
ADDRLP4 240
INDIRI4
CNSTI4 1
GEI4 $385
ADDRLP4 0
INDIRP4
CNSTI4 2560
ADDP4
INDIRI4
CNSTI4 2
EQI4 $385
line 954
;954:		return;
ADDRGP4 $345
JUMPV
LABELV $385
line 956
;955:	}
;956:	if ( msec > 200 ) {
ADDRLP4 240
INDIRI4
CNSTI4 200
LEI4 $387
line 957
;957:		msec = 200;
ADDRLP4 240
CNSTI4 200
ASGNI4
line 958
;958:	}
LABELV $387
line 960
;959:
;960:	if ( pmove_msec.integer < 8 ) {
ADDRGP4 pmove_msec+12
INDIRI4
CNSTI4 8
GEI4 $389
line 961
;961:		trap_Cvar_Set("pmove_msec", "8");
ADDRGP4 $392
ARGP4
ADDRGP4 $393
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 962
;962:	}
ADDRGP4 $390
JUMPV
LABELV $389
line 963
;963:	else if (pmove_msec.integer > 33) {
ADDRGP4 pmove_msec+12
INDIRI4
CNSTI4 33
LEI4 $394
line 964
;964:		trap_Cvar_Set("pmove_msec", "33");
ADDRGP4 $392
ARGP4
ADDRGP4 $397
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 965
;965:	}
LABELV $394
LABELV $390
line 967
;966:
;967:	if ( pmove_fixed.integer || client->pers.pmoveFixed ) {
ADDRLP4 268
CNSTI4 0
ASGNI4
ADDRGP4 pmove_fixed+12
INDIRI4
ADDRLP4 268
INDIRI4
NEI4 $401
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
ADDRLP4 268
INDIRI4
EQI4 $398
LABELV $401
line 968
;968:		ucmd->serverTime = ((ucmd->serverTime + pmove_msec.integer-1) / pmove_msec.integer) * pmove_msec.integer;
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
line 971
;969:		//if (ucmd->serverTime - client->ps.commandTime <= 0)
;970:		//	return;
;971:	}
LABELV $398
line 976
;972:
;973:	//
;974:	// check for exiting intermission
;975:	//
;976:	if ( level.intermissiontime ) {
ADDRGP4 level+9140
INDIRI4
CNSTI4 0
EQI4 $405
line 977
;977:		ClientIntermissionThink( client );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ClientIntermissionThink
CALLV
pop
line 978
;978:		return;
ADDRGP4 $345
JUMPV
LABELV $405
line 982
;979:	}
;980:
;981:	// spectators don't do much
;982:	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $408
line 983
;983:		if ( client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRLP4 0
INDIRP4
CNSTI4 2560
ADDP4
INDIRI4
CNSTI4 3
NEI4 $410
line 984
;984:			return;
ADDRGP4 $345
JUMPV
LABELV $410
line 986
;985:		}
;986:		SpectatorThink( ent, ucmd );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 236
INDIRP4
ARGP4
ADDRGP4 SpectatorThink
CALLV
pop
line 987
;987:		return;
ADDRGP4 $345
JUMPV
LABELV $408
line 991
;988:	}
;989:
;990:	// check for inactivity timer, but never drop the local client of a non-dedicated server
;991:	if ( !ClientInactivityTimer( client ) ) {
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
NEI4 $412
line 992
;992:		return;
ADDRGP4 $345
JUMPV
LABELV $412
line 996
;993:	}
;994:
;995:	// clear the rewards if time
;996:	if ( level.time > client->rewardTime ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 2676
ADDP4
INDIRI4
LEI4 $414
line 997
;997:		client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
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
line 998
;998:	}
LABELV $414
line 1000
;999:
;1000:	if ( client->noclip ) {
ADDRLP4 0
INDIRP4
CNSTI4 2584
ADDP4
INDIRI4
CNSTI4 0
EQI4 $417
line 1001
;1001:		client->ps.pm_type = PM_NOCLIP;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 1
ASGNI4
line 1002
;1002:	} else if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 $418
JUMPV
LABELV $417
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $419
line 1003
;1003:		client->ps.pm_type = PM_DEAD;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1004
;1004:	} else {
ADDRGP4 $420
JUMPV
LABELV $419
line 1005
;1005:		client->ps.pm_type = PM_NORMAL;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 1006
;1006:	}
LABELV $420
LABELV $418
line 1008
;1007:
;1008:	client->ps.gravity = g_gravity.value;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDRGP4 g_gravity+8
INDIRF4
CVFI4 4
ASGNI4
line 1011
;1009:
;1010:	// set speed
;1011:	client->ps.speed = g_speed.value;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 g_speed+8
INDIRF4
CVFI4 4
ASGNI4
line 1019
;1012:
;1013:#ifdef MISSIONPACK
;1014:	if( bg_itemlist[client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_SCOUT ) {
;1015:		client->ps.speed *= 1.5;
;1016:	}
;1017:	else
;1018:#endif
;1019:	if ( client->ps.powerups[PW_HASTE] ) {
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
CNSTI4 0
EQI4 $423
line 1020
;1020:		client->ps.speed *= 1.3;
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
line 1021
;1021:	}
LABELV $423
line 1023
;1022:
;1023:	if ( g_entities[client->ps.clientNum].immobilized == qtrue)
CNSTI4 876
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+872
ADDP4
INDIRI4
CNSTI4 1
NEI4 $425
line 1024
;1024:	{
line 1025
;1025:		client->ps.speed = 50;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 50
ASGNI4
line 1026
;1026:		if (g_entities[client->ps.clientNum].health < 8) { g_entities[client->ps.clientNum].immobilized = qfalse; }
CNSTI4 876
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
GEI4 $428
CNSTI4 876
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+872
ADDP4
CNSTI4 0
ASGNI4
LABELV $428
line 1027
;1027:	}
LABELV $425
line 1042
;1028:
;1029:
;1030:
;1031:
;1032:
;1033:	// Let go of the hook if we aren't firing
;1034:	/*  - Shafe - Trep - Commented out for offhand grapple
;1035:	if ( client->ps.weapon == WP_GRAPPLING_HOOK &&
;1036:		client->hook && !( ucmd->buttons & BUTTON_ATTACK ) ) {
;1037:		Weapon_HookFree(client->hook);
;1038:	}
;1039:	*/ 
;1040:
;1041:	// set up for pmove
;1042:	oldEventSequence = client->ps.eventSequence;
ADDRLP4 244
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 1044
;1043:
;1044:	memset (&pm, 0, sizeof(pm));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 232
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1048
;1045:
;1046:	// check for the hit-scan gauntlet, don't let the action
;1047:	// go through as an attack unless it actually hits something
;1048:	if ( client->ps.weapon == WP_GAUNTLET && !( ucmd->buttons & BUTTON_TALK ) &&
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
NEI4 $432
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
NEI4 $432
ADDRLP4 280
INDIRI4
ADDRLP4 276
INDIRI4
BANDI4
ADDRLP4 284
INDIRI4
NEI4 $434
ADDRLP4 280
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 284
INDIRI4
EQI4 $432
LABELV $434
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
GTI4 $432
line 1049
;1049:		( (ucmd->buttons & BUTTON_ATTACK) || (ucmd->buttons & 32) ) && client->ps.weaponTime <= 0 ) { // Shafe - Trep - Alt Fire
line 1051
;1050:		//( ucmd->buttons & BUTTON_ATTACK ) && client->ps.weaponTime <= 0 ) {
;1051:		pm.gauntletHit = CheckGauntletAttack( ent );
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
line 1052
;1052:	}
LABELV $432
line 1054
;1053:
;1054:	if ( ent->flags & FL_FORCE_GESTURE ) {
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $436
line 1055
;1055:		ent->flags &= ~FL_FORCE_GESTURE;
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
line 1056
;1056:		ent->client->pers.cmd.buttons |= BUTTON_GESTURE;
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
line 1057
;1057:	}
LABELV $436
line 1086
;1058:
;1059:#ifdef MISSIONPACK
;1060:	// check for invulnerability expansion before doing the Pmove
;1061:	if (client->ps.powerups[PW_INVULNERABILITY] ) {
;1062:		if ( !(client->ps.pm_flags & PMF_INVULEXPAND) ) {
;1063:			vec3_t mins = { -42, -42, -42 };
;1064:			vec3_t maxs = { 42, 42, 42 };
;1065:			vec3_t oldmins, oldmaxs;
;1066:
;1067:			VectorCopy (ent->r.mins, oldmins);
;1068:			VectorCopy (ent->r.maxs, oldmaxs);
;1069:			// expand
;1070:			VectorCopy (mins, ent->r.mins);
;1071:			VectorCopy (maxs, ent->r.maxs);
;1072:			trap_LinkEntity(ent);
;1073:			// check if this would get anyone stuck in this player
;1074:			if ( !StuckInOtherClient(ent) ) {
;1075:				// set flag so the expanded size will be set in PM_CheckDuck
;1076:				client->ps.pm_flags |= PMF_INVULEXPAND;
;1077:			}
;1078:			// set back
;1079:			VectorCopy (oldmins, ent->r.mins);
;1080:			VectorCopy (oldmaxs, ent->r.maxs);
;1081:			trap_LinkEntity(ent);
;1082:		}
;1083:	}
;1084:#endif
;1085:
;1086:	pm.ps = &client->ps;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 1087
;1087:	pm.cmd = *ucmd;
ADDRLP4 4+4
ADDRLP4 236
INDIRP4
INDIRB
ASGNB 24
line 1088
;1088:	if ( pm.ps->pm_type == PM_DEAD ) {
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $439
line 1089
;1089:		pm.tracemask = MASK_PLAYERSOLID & ~CONTENTS_BODY;
ADDRLP4 4+28
CNSTI4 65537
ASGNI4
line 1090
;1090:	}
ADDRGP4 $440
JUMPV
LABELV $439
line 1091
;1091:	else if ( ent->r.svFlags & SVF_BOT ) {
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $442
line 1092
;1092:		pm.tracemask = MASK_PLAYERSOLID | CONTENTS_BOTCLIP;
ADDRLP4 4+28
CNSTI4 37814273
ASGNI4
line 1093
;1093:	}
ADDRGP4 $443
JUMPV
LABELV $442
line 1094
;1094:	else {
line 1095
;1095:		pm.tracemask = MASK_PLAYERSOLID;
ADDRLP4 4+28
CNSTI4 33619969
ASGNI4
line 1096
;1096:	}
LABELV $443
LABELV $440
line 1097
;1097:	pm.trace = trap_Trace;
ADDRLP4 4+224
ADDRGP4 trap_Trace
ASGNP4
line 1098
;1098:	pm.pointcontents = trap_PointContents;
ADDRLP4 4+228
ADDRGP4 trap_PointContents
ASGNP4
line 1099
;1099:	pm.debugLevel = g_debugMove.integer;
ADDRLP4 4+32
ADDRGP4 g_debugMove+12
INDIRI4
ASGNI4
line 1100
;1100:	pm.noFootsteps = ( g_dmflags.integer & DF_NO_FOOTSTEPS ) > 0;
ADDRGP4 g_dmflags+12
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
LEI4 $453
ADDRLP4 288
CNSTI4 1
ASGNI4
ADDRGP4 $454
JUMPV
LABELV $453
ADDRLP4 288
CNSTI4 0
ASGNI4
LABELV $454
ADDRLP4 4+36
ADDRLP4 288
INDIRI4
ASGNI4
line 1102
;1101:
;1102:	pm.pmove_fixed = pmove_fixed.integer | client->pers.pmoveFixed;
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
line 1103
;1103:	pm.pmove_msec = pmove_msec.integer;
ADDRLP4 4+220
ADDRGP4 pmove_msec+12
INDIRI4
ASGNI4
line 1105
;1104:
;1105:	VectorCopy( client->ps.origin, client->oldOrigin );
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
line 1122
;1106:
;1107:#ifdef MISSIONPACK
;1108:		if (level.intermissionQueued != 0 && g_singlePlayer.integer) {
;1109:			if ( level.time - level.intermissionQueued >= 1000  ) {
;1110:				pm.cmd.buttons = 0;
;1111:				pm.cmd.forwardmove = 0;
;1112:				pm.cmd.rightmove = 0;
;1113:				pm.cmd.upmove = 0;
;1114:				if ( level.time - level.intermissionQueued >= 2000 && level.time - level.intermissionQueued <= 2500 ) {
;1115:					trap_SendConsoleCommand( EXEC_APPEND, "centerview\n");
;1116:				}
;1117:				ent->client->ps.pm_type = PM_SPINTERMISSION;
;1118:			}
;1119:		}
;1120:		Pmove (&pm);
;1121:#else
;1122:		Pmove (&pm);
ADDRLP4 4
ARGP4
ADDRGP4 Pmove
CALLV
pop
line 1126
;1123:#endif
;1124:
;1125:	// save results of pmove
;1126:	if ( ent->client->ps.eventSequence != oldEventSequence ) {
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
EQI4 $459
line 1127
;1127:		ent->eventTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1128
;1128:	}
LABELV $459
line 1141
;1129:
;1130://unlagged - smooth clients #2
;1131:	// clients no longer do extrapolation if cg_smoothClients is 1, because
;1132:	// skip correction is all handled server-side now
;1133:	// since that's the case, it makes no sense to store the extra info
;1134:	// in the client's snapshot entity, so let's save a little bandwidth
;1135:/*
;1136:	if (g_smoothClients.integer) {
;1137:		BG_PlayerStateToEntityStateExtraPolate( &ent->client->ps, &ent->s, ent->client->ps.commandTime, qtrue );
;1138:	}
;1139:	else {
;1140:*/
;1141:		BG_PlayerStateToEntityState( &ent->client->ps, &ent->s, qtrue );
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
line 1145
;1142://	}
;1143://unlagged - smooth clients #2
;1144:
;1145:	SendPendingPredictableEvents( &ent->client->ps );
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 SendPendingPredictableEvents
CALLV
pop
line 1154
;1146:
;1147:	/* - Shafe - Trep - Commented out for Offhand Grapple
;1148:	if ( !( ent->client->ps.eFlags & EF_FIRING ) ) {
;1149:		client->fireHeld = qfalse;		// for grapple
;1150:	}
;1151:	*/
;1152:
;1153:	// Shafe - Trep  - Offhand Grappling Hook
;1154:	if (g_gametype.integer != GT_CTF) { // Not in CTF Games
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
EQI4 $462
line 1155
;1155:		if ( (pm.cmd.buttons & 64)  && ent->client->ps.pm_type != PM_DEAD && !ent->client->hookhasbeenfired)
ADDRLP4 300
CNSTI4 0
ASGNI4
ADDRLP4 4+4+16
INDIRI4
CNSTI4 64
BANDI4
ADDRLP4 300
INDIRI4
EQI4 $465
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
EQI4 $465
ADDRLP4 304
INDIRP4
CNSTI4 2696
ADDP4
INDIRI4
ADDRLP4 300
INDIRI4
NEI4 $465
line 1156
;1156:		{
line 1157
;1157:			Weapon_GrapplingHook_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_GrapplingHook_Fire
CALLV
pop
line 1158
;1158:			ent->client->hookhasbeenfired = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2696
ADDP4
CNSTI4 1
ASGNI4
line 1159
;1159:		}
LABELV $465
line 1160
;1160:		if ( !(pm.cmd.buttons & 64)  &&	ent->client->ps.pm_type != PM_DEAD && ent->client->hookhasbeenfired && ent->client->fireHeld)
ADDRLP4 308
CNSTI4 0
ASGNI4
ADDRLP4 4+4+16
INDIRI4
CNSTI4 64
BANDI4
ADDRLP4 308
INDIRI4
NEI4 $469
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
EQI4 $469
ADDRLP4 312
INDIRP4
CNSTI4 2696
ADDP4
INDIRI4
ADDRLP4 308
INDIRI4
EQI4 $469
ADDRLP4 312
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
ADDRLP4 308
INDIRI4
EQI4 $469
line 1161
;1161:		{
line 1162
;1162:			ent->client->fireHeld = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 0
ASGNI4
line 1163
;1163:			ent->client->hookhasbeenfired = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2696
ADDP4
CNSTI4 0
ASGNI4
line 1164
;1164:		}
LABELV $469
line 1166
;1165:
;1166:		if ( client->hook && client->fireHeld == qfalse )
ADDRLP4 0
INDIRP4
CNSTI4 2692
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $473
ADDRLP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 0
NEI4 $473
line 1167
;1167:		{
line 1168
;1168:			Weapon_HookFree(client->hook);
ADDRLP4 0
INDIRP4
CNSTI4 2692
ADDP4
INDIRP4
ARGP4
ADDRGP4 Weapon_HookFree
CALLV
pop
line 1169
;1169:		}
LABELV $473
line 1170
;1170:	}
LABELV $462
line 1174
;1171:	// End Shafe - Offhand Grapple //////////////////////////////////////////////
;1172:	
;1173:	// use the snapped origin for linking so it matches client predicted versions
;1174:	VectorCopy( ent->s.pos.trBase, ent->r.currentOrigin );
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
line 1176
;1175:
;1176:	VectorCopy (pm.mins, ent->r.mins);
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRLP4 4+180
INDIRB
ASGNB 12
line 1177
;1177:	VectorCopy (pm.maxs, ent->r.maxs);
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
ADDRLP4 4+192
INDIRB
ASGNB 12
line 1179
;1178:
;1179:	ent->waterlevel = pm.waterlevel;
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
ADDRLP4 4+208
INDIRI4
ASGNI4
line 1180
;1180:	ent->watertype = pm.watertype;
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
ADDRLP4 4+204
INDIRI4
ASGNI4
line 1186
;1181:
;1182:	// TryUse Here
;1183:	
;1184:
;1185:	// execute client events
;1186:	ClientEvents( ent, oldEventSequence );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 244
INDIRI4
ARGI4
ADDRGP4 ClientEvents
CALLV
pop
line 1189
;1187:
;1188:	// link entity now, after any personal teleporters have been used
;1189:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1190
;1190:	if ( !ent->client->noclip ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2584
ADDP4
INDIRI4
CNSTI4 0
NEI4 $479
line 1191
;1191:		G_TouchTriggers( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_TouchTriggers
CALLV
pop
line 1192
;1192:	}
LABELV $479
line 1195
;1193:
;1194:	// NOTE: now copy the exact origin over otherwise clients can be snapped into solid
;1195:	VectorCopy( ent->client->ps.origin, ent->r.currentOrigin );
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
line 1198
;1196:
;1197:	//test for solid areas in the AAS file
;1198:	BotTestAAS(ent->r.currentOrigin);
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
ADDRGP4 BotTestAAS
CALLV
pop
line 1201
;1199:
;1200:	// touch other objects
;1201:	ClientImpacts( ent, &pm );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 ClientImpacts
CALLV
pop
line 1204
;1202:
;1203:	// save results of triggers and client events
;1204:	if (ent->client->ps.eventSequence != oldEventSequence) {
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
EQI4 $481
line 1205
;1205:		ent->eventTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1206
;1206:	}
LABELV $481
line 1209
;1207:
;1208:	// swap and latch button actions
;1209:	client->oldbuttons = client->buttons;
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
line 1210
;1210:	client->buttons = ucmd->buttons;
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
line 1211
;1211:	client->latched_buttons |= client->buttons & ~client->oldbuttons;
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
line 1214
;1212:
;1213:	// check for respawning
;1214:	if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $484
line 1216
;1215:		// wait for the attack button to be pressed
;1216:		if ( level.time > client->respawnTime ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 2664
ADDP4
INDIRI4
LEI4 $345
line 1218
;1217:			// forcerespawn is to prevent users from waiting out powerups
;1218:			if ( g_forcerespawn.integer > 0 && 
ADDRGP4 g_forcerespawn+12
INDIRI4
CNSTI4 0
LEI4 $489
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
LEI4 $489
line 1219
;1219:				( level.time - client->respawnTime ) > g_forcerespawn.integer * 1000 ) {
line 1220
;1220:				respawn( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 1221
;1221:				return;
ADDRGP4 $345
JUMPV
LABELV $489
line 1225
;1222:			}
;1223:		
;1224:			// pressing attack or use is the normal respawn method
;1225:			if ( ucmd->buttons & ( BUTTON_ATTACK | BUTTON_USE_HOLDABLE ) ) {
ADDRLP4 236
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 5
BANDI4
CNSTI4 0
EQI4 $345
line 1226
;1226:				respawn( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 1227
;1227:			}
line 1228
;1228:		}
line 1229
;1229:		return;
ADDRGP4 $345
JUMPV
LABELV $484
line 1233
;1230:	}
;1231:
;1232:	// perform once-a-second actions
;1233:	ClientTimerActions( ent, msec );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 240
INDIRI4
ARGI4
ADDRGP4 ClientTimerActions
CALLV
pop
line 1234
;1234:}
LABELV $345
endproc ClientThink_real 320 12
export ClientThink
proc ClientThink 8 8
line 1243
;1235:
;1236:/*
;1237:==================
;1238:ClientThink
;1239:
;1240:A new command has arrived from the client
;1241:==================
;1242:*/
;1243:void ClientThink( int clientNum ) {
line 1246
;1244:	gentity_t *ent;
;1245:
;1246:	ent = g_entities + clientNum;
ADDRLP4 0
CNSTI4 876
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1247
;1247:	trap_GetUsercmd( clientNum, &ent->client->pers.cmd );
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
line 1258
;1248:
;1249://unlagged - smooth clients #1
;1250:	// this is handled differently now
;1251:/*
;1252:	// mark the time we got info, so we can display the
;1253:	// phone jack if they don't get any for a while
;1254:	ent->client->lastCmdTime = level.time;
;1255:*/
;1256://unlagged - smooth clients #1
;1257:
;1258:	if ( !(ent->r.svFlags & SVF_BOT) && !g_synchronousClients.integer ) {
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
NEI4 $497
ADDRGP4 g_synchronousClients+12
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $497
line 1259
;1259:		ClientThink_real( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ClientThink_real
CALLV
pop
line 1260
;1260:	}
LABELV $497
line 1261
;1261:}
LABELV $496
endproc ClientThink 8 8
export G_RunClient
proc G_RunClient 4 4
line 1264
;1262:
;1263:
;1264:void G_RunClient( gentity_t *ent ) {
line 1265
;1265:	if ( !(ent->r.svFlags & SVF_BOT) && !g_synchronousClients.integer ) {
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
NEI4 $501
ADDRGP4 g_synchronousClients+12
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $501
line 1266
;1266:		return;
ADDRGP4 $500
JUMPV
LABELV $501
line 1268
;1267:	}
;1268:	ent->client->pers.cmd.serverTime = level.time;
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
line 1269
;1269:	ClientThink_real( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientThink_real
CALLV
pop
line 1270
;1270:}
LABELV $500
endproc G_RunClient 4 4
export SpectatorClientEndFrame
proc SpectatorClientEndFrame 24 4
line 1279
;1271:
;1272:
;1273:/*
;1274:==================
;1275:SpectatorClientEndFrame
;1276:
;1277:==================
;1278:*/
;1279:void SpectatorClientEndFrame( gentity_t *ent ) {
line 1283
;1280:	gclient_t	*cl;
;1281:
;1282:	// if we are doing a chase cam or a remote view, grab the latest info
;1283:	if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2560
ADDP4
INDIRI4
CNSTI4 2
NEI4 $506
line 1286
;1284:		int		clientNum, flags;
;1285:
;1286:		clientNum = ent->client->sess.spectatorClient;
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
line 1289
;1287:
;1288:		// team follow1 and team follow2 go to whatever clients are playing
;1289:		if ( clientNum == -1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
NEI4 $508
line 1290
;1290:			clientNum = level.follow1;
ADDRLP4 4
ADDRGP4 level+352
INDIRI4
ASGNI4
line 1291
;1291:		} else if ( clientNum == -2 ) {
ADDRGP4 $509
JUMPV
LABELV $508
ADDRLP4 4
INDIRI4
CNSTI4 -2
NEI4 $511
line 1292
;1292:			clientNum = level.follow2;
ADDRLP4 4
ADDRGP4 level+356
INDIRI4
ASGNI4
line 1293
;1293:		}
LABELV $511
LABELV $509
line 1294
;1294:		if ( clientNum >= 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $514
line 1295
;1295:			cl = &level.clients[ clientNum ];
ADDRLP4 0
CNSTI4 3452
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1296
;1296:			if ( cl->pers.connected == CON_CONNECTED && cl->sess.sessionTeam != TEAM_SPECTATOR ) {
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
NEI4 $516
ADDRLP4 12
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
EQI4 $516
line 1297
;1297:				flags = (cl->ps.eFlags & ~(EF_VOTED | EF_TEAMVOTED)) | (ent->client->ps.eFlags & (EF_VOTED | EF_TEAMVOTED));
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
line 1298
;1298:				ent->client->ps = cl->ps;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ADDRLP4 0
INDIRP4
INDIRB
ASGNB 468
line 1299
;1299:				ent->client->ps.pm_flags |= PMF_FOLLOW;
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
line 1300
;1300:				ent->client->ps.eFlags = flags;
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
line 1301
;1301:				return;
ADDRGP4 $505
JUMPV
LABELV $516
line 1302
;1302:			} else {
line 1304
;1303:				// drop them to free spectators unless they are dedicated camera followers
;1304:				if ( ent->client->sess.spectatorClient >= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
CNSTI4 0
LTI4 $518
line 1305
;1305:					ent->client->sess.spectatorState = SPECTATOR_FREE;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2560
ADDP4
CNSTI4 1
ASGNI4
line 1306
;1306:					ClientBegin( ent->client - level.clients );
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
line 1307
;1307:				}
LABELV $518
line 1308
;1308:			}
line 1309
;1309:		}
LABELV $514
line 1310
;1310:	}
LABELV $506
line 1312
;1311:
;1312:	if ( ent->client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2560
ADDP4
INDIRI4
CNSTI4 3
NEI4 $520
line 1313
;1313:		ent->client->ps.pm_flags |= PMF_SCOREBOARD;
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
line 1314
;1314:	} else {
ADDRGP4 $521
JUMPV
LABELV $520
line 1315
;1315:		ent->client->ps.pm_flags &= ~PMF_SCOREBOARD;
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
line 1316
;1316:	}
LABELV $521
line 1317
;1317:}
LABELV $505
endproc SpectatorClientEndFrame 24 4
export ClientEndFrame
proc ClientEndFrame 52 12
line 1328
;1318:
;1319:/*
;1320:==============
;1321:ClientEndFrame
;1322:
;1323:Called at the end of each server frame for each connected client
;1324:A fast client will have multiple ClientThink for each ClientEdFrame,
;1325:while a slow client may have multiple ClientEndFrame between ClientThink.
;1326:==============
;1327:*/
;1328:void ClientEndFrame( gentity_t *ent ) {
line 1336
;1329:	int			i;
;1330:	clientPersistant_t	*pers;
;1331:
;1332://unlagged - smooth clients #1
;1333:	int frames;
;1334://unlagged - smooth clients #1
;1335:
;1336:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $523
line 1337
;1337:		SpectatorClientEndFrame( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SpectatorClientEndFrame
CALLV
pop
line 1338
;1338:		return;
ADDRGP4 $522
JUMPV
LABELV $523
line 1341
;1339:	}
;1340:
;1341:	pers = &ent->client->pers;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 468
ADDP4
ASGNP4
line 1344
;1342:
;1343:	// turn off any expired powerups
;1344:	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $525
line 1345
;1345:		if ( ent->client->ps.powerups[ i ] < level.time ) {
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
GEI4 $529
line 1346
;1346:			ent->client->ps.powerups[ i ] = 0;
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
line 1347
;1347:		}
LABELV $529
line 1348
;1348:	}
LABELV $526
line 1344
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $525
line 1381
;1349:
;1350:#ifdef MISSIONPACK
;1351:	// set powerup for player animation
;1352:	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;1353:		ent->client->ps.powerups[PW_GUARD] = level.time;
;1354:	}
;1355:	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_SCOUT ) {
;1356:		ent->client->ps.powerups[PW_SCOUT] = level.time;
;1357:	}
;1358:	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_DOUBLER ) {
;1359:		ent->client->ps.powerups[PW_DOUBLER] = level.time;
;1360:	}
;1361:	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_AMMOREGEN ) {
;1362:		ent->client->ps.powerups[PW_AMMOREGEN] = level.time;
;1363:	}
;1364:	if ( ent->client->invulnerabilityTime > level.time ) {
;1365:		ent->client->ps.powerups[PW_INVULNERABILITY] = level.time;
;1366:	}
;1367:#endif
;1368:
;1369:	// save network bandwidth
;1370:#if 0
;1371:	if ( !g_synchronousClients->integer && ent->client->ps.pm_type == PM_NORMAL ) {
;1372:		// FIXME: this must change eventually for non-sync demo recording
;1373:		VectorClear( ent->client->ps.viewangles );
;1374:	}
;1375:#endif
;1376:
;1377:	//
;1378:	// If the end of unit layout is displayed, don't give
;1379:	// the player any normal movement attributes
;1380:	//
;1381:	if ( level.intermissiontime ) {
ADDRGP4 level+9140
INDIRI4
CNSTI4 0
EQI4 $532
line 1382
;1382:		return;
ADDRGP4 $522
JUMPV
LABELV $532
line 1386
;1383:	}
;1384:
;1385:	// burn from lava, etc
;1386:	P_WorldEffects (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 P_WorldEffects
CALLV
pop
line 1389
;1387:
;1388:	// apply all the damage taken this frame
;1389:	P_DamageFeedback (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 P_DamageFeedback
CALLV
pop
line 1403
;1390:
;1391://unlagged - smooth clients #1
;1392:	// this is handled differently now
;1393:/*
;1394:	// add the EF_CONNECTION flag if we haven't gotten commands recently
;1395:	if ( level.time - ent->client->lastCmdTime > 1000 ) {
;1396:		ent->client->ps.eFlags |= EF_CONNECTION;
;1397:	} else {
;1398:		ent->client->ps.eFlags &= ~EF_CONNECTION;
;1399:	}
;1400:*/
;1401://unlagged - smooth clients #1
;1402:
;1403:	ent->client->ps.stats[STAT_HEALTH] = ent->health;	// FIXME: get rid of ent->health...
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
line 1405
;1404:
;1405:	G_SetClientSound (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_SetClientSound
CALLV
pop
line 1419
;1406:
;1407:	// set the latest information
;1408://unlagged - smooth clients #2
;1409:	// clients no longer do extrapolation if cg_smoothClients is 1, because
;1410:	// skip correction is all handled server-side now
;1411:	// since that's the case, it makes no sense to store the extra info
;1412:	// in the client's snapshot entity, so let's save a little bandwidth
;1413:/*
;1414:	if (g_smoothClients.integer) {
;1415:		BG_PlayerStateToEntityStateExtraPolate( &ent->client->ps, &ent->s, ent->client->ps.commandTime, qtrue );
;1416:	}
;1417:	else {
;1418:*/
;1419:		BG_PlayerStateToEntityState( &ent->client->ps, &ent->s, qtrue );
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
line 1423
;1420://	}
;1421://unlagged - smooth clients #2
;1422:
;1423:	SendPendingPredictableEvents( &ent->client->ps );
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 SendPendingPredictableEvents
CALLV
pop
line 1427
;1424:
;1425://unlagged - smooth clients #1
;1426:	// mark as not missing updates initially
;1427:	ent->client->ps.eFlags &= ~EF_CONNECTION;
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
line 1430
;1428:
;1429:	// see how many frames the client has missed
;1430:	frames = level.framenum - ent->client->lastUpdateFrame - 1;
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
line 1433
;1431:
;1432:	// don't extrapolate more than two frames
;1433:	if ( frames > 2 ) {
ADDRLP4 4
INDIRI4
CNSTI4 2
LEI4 $536
line 1434
;1434:		frames = 2;
ADDRLP4 4
CNSTI4 2
ASGNI4
line 1437
;1435:
;1436:		// if they missed more than two in a row, show the phone jack
;1437:		ent->client->ps.eFlags |= EF_CONNECTION;
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
line 1438
;1438:		ent->s.eFlags |= EF_CONNECTION;
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
line 1439
;1439:	}
LABELV $536
line 1442
;1440:
;1441:	// did the client miss any frames?
;1442:	if ( frames > 0 && g_smoothClients.integer ) {
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $538
ADDRGP4 g_smoothClients+12
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $538
line 1444
;1443:		// yep, missed one or more, so extrapolate the player's movement
;1444:		G_PredictPlayerMove( ent, (float)frames / sv_fps.integer );
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
line 1446
;1445:		// save network bandwidth
;1446:		SnapVector( ent->s.pos.trBase );
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
line 1447
;1447:	}
LABELV $538
line 1452
;1448://unlagged - smooth clients #1
;1449:
;1450://unlagged - backward reconciliation #1
;1451:	// store the client's position for backward reconciliation later
;1452:	G_StoreHistory( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_StoreHistory
CALLV
pop
line 1458
;1453://unlagged - backward reconciliation #1
;1454:
;1455:	// set the bit for the reachability area the client is currently in
;1456://	i = trap_AAS_PointReachabilityAreaIndex( ent->client->ps.origin );
;1457://	ent->client->areabits[i >> 3] |= 1 << (i & 7);
;1458:}
LABELV $522
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
LABELV $397
byte 1 51
byte 1 51
byte 1 0
align 1
LABELV $393
byte 1 56
byte 1 0
align 1
LABELV $392
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
LABELV $285
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
LABELV $252
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
