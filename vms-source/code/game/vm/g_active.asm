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
proc ClientTimerActions 0 0
endproc ClientTimerActions 0 0
export ClientIntermissionThink
proc ClientIntermissionThink 0 0
endproc ClientIntermissionThink 0 0
export ClientEvents
proc ClientEvents 0 0
endproc ClientEvents 0 0
export SendPendingPredictableEvents
proc SendPendingPredictableEvents 0 0
endproc SendPendingPredictableEvents 0 0
export ClientThink_real
proc ClientThink_real 0 0
endproc ClientThink_real 0 0
export ClientThink
proc ClientThink 0 0
endproc ClientThink 0 0
export G_RunClient
proc G_RunClient 0 0
endproc G_RunClient 0 0
export SpectatorClientEndFrame
proc SpectatorClientEndFrame 0 0
endproc SpectatorClientEndFrame 0 0
export ClientEndFrame
proc ClientEndFrame 0 0
endproc ClientEndFrame 0 0
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
LABELV $404
byte 1 51
byte 1 51
byte 1 0
align 1
LABELV $400
byte 1 56
byte 1 0
align 1
LABELV $399
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
LABELV $317
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
LABELV $312
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
LABELV $307
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
LABELV $302
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
LABELV $297
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
LABELV $292
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
LABELV $284
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
LABELV $279
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
LABELV $274
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
LABELV $269
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
LABELV $264
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
LABELV $259
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
