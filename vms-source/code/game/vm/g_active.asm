export P_DamageFeedback
code
proc P_DamageFeedback 36 12
file "../g_active.c"
line 17
;1:// 2016 Trepidation Licensed under the GPL2 - Team Trepidation
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
CNSTI4 2632
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 2628
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
CNSTI4 2652
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
CNSTI4 2652
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
CNSTI4 2640
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
CNSTI4 744
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
CNSTI4 744
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
CNSTI4 756
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
CNSTI4 2632
ADDP4
CNSTI4 0
ASGNI4
line 66
;66:	client->damage_armor = 0;
ADDRLP4 0
INDIRP4
CNSTI4 2628
ADDP4
CNSTI4 0
ASGNI4
line 67
;67:	client->damage_knockback = 0;
ADDRLP4 0
INDIRP4
CNSTI4 2636
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
CNSTI4 2600
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
CNSTI4 2696
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
CNSTI4 812
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
CNSTI4 2696
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
CNSTI4 2696
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
CNSTI4 2696
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
CNSTI4 756
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
CNSTI4 764
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
CNSTI4 764
ADDP4
INDIRI4
CNSTI4 15
LEI4 $87
line 109
;109:					ent->damage = 15;
ADDRFP4 0
INDIRP4
CNSTI4 764
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
CNSTI4 756
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 764
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
CNSTI4 744
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
CNSTI4 764
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
CNSTI4 2696
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
CNSTI4 764
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
CNSTI4 808
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
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 0
LEI4 $100
ADDRLP4 16
INDIRP4
CNSTI4 744
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
CNSTI4 808
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
CNSTI4 808
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
CNSTI4 812
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $110
ADDRLP4 0
INDIRP4
CNSTI4 808
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
CNSTI4 924
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
CNSTI4 728
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
CNSTI4 728
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
CNSTI4 728
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
CNSTI4 728
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
CNSTI4 924
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
CNSTI4 728
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
CNSTI4 2564
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
CNSTI4 728
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
CNSTI4 728
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
CNSTI4 728
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
CNSTI4 728
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
CNSTI4 728
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
CNSTI4 2572
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
CNSTI4 2608
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 2604
ADDP4
INDIRI4
ASGNI4
line 334
;334:	client->buttons = ucmd->buttons;
ADDRLP4 0
INDIRP4
CNSTI4 2604
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
CNSTI4 2604
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
CNSTI4 2608
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
CNSTI4 2604
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
CNSTI4 2608
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
CNSTI4 2572
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
CNSTI4 2684
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
CNSTI4 2688
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
CNSTI4 2684
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
CNSTI4 2688
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
CNSTI4 2684
ADDP4
INDIRI4
LEI4 $200
line 376
;374:			
;375:			// Dont kick bots for inactivity, causes recursive error
;376:			if(!g_entities[client->ps.clientNum].r.svFlags & SVF_BOT)
CNSTI4 924
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+212+220
ADDP4
INDIRI4
CNSTI4 0
NEI4 $208
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $209
JUMPV
LABELV $208
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $209
ADDRLP4 8
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $203
line 377
;377:			{
line 378
;378:				trap_DropClient( client - level.clients, "Dropped due to inactivity" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3492
DIVI4
ARGI4
ADDRGP4 $210
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
line 379
;379:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $186
JUMPV
LABELV $203
line 381
;380:			}
;381:		}
LABELV $200
line 382
;382:		if ( level.time > client->inactivityTime - 10000 && !client->inactivityWarning ) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 2684
ADDP4
INDIRI4
CNSTI4 10000
SUBI4
LEI4 $211
ADDRLP4 8
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 0
NEI4 $211
line 383
;383:			client->inactivityWarning = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 1
ASGNI4
line 384
;384:			trap_SendServerCommand( client - level.clients, "cp \"Ten seconds until inactivity drop!\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3492
DIVI4
ARGI4
ADDRGP4 $214
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 385
;385:		}
LABELV $211
line 386
;386:	}
LABELV $198
LABELV $192
LABELV $188
line 387
;387:	return qtrue;
CNSTI4 1
RETI4
LABELV $186
endproc ClientInactivityTimer 12 8
export ClientTimerActions
proc ClientTimerActions 20 12
line 397
;388:}
;389:
;390:/*
;391:==================
;392:ClientTimerActions
;393:
;394:Actions that happen once a second
;395:==================
;396:*/
;397:void ClientTimerActions( gentity_t *ent, int msec ) {
line 403
;398:	gclient_t	*client;
;399:#ifdef MISSIONPACK
;400:	int			maxHealth;
;401:#endif
;402:
;403:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 404
;404:	client->timeResidual += msec;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 2728
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
ADDRGP4 $217
JUMPV
LABELV $216
line 406
;405:
;406:	while ( client->timeResidual >= 1000 ) {
line 407
;407:		client->timeResidual -= 1000;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 2728
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
line 410
;408:
;409:
;410:	if (g_GameMode.integer == 3)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 3
NEI4 $219
line 411
;411:	{
line 412
;412:		if (client->sess.sessionTeam == TEAM_RED) 
ADDRLP4 0
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
CNSTI4 1
NEI4 $222
line 413
;413:		{
line 414
;414:			trap_SendConsoleCommand( EXEC_INSERT, va("g_RedMC \"%i\"\n", level.redCredits) );	
ADDRGP4 $224
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
line 415
;415:		}
ADDRGP4 $223
JUMPV
LABELV $222
line 417
;416:		else
;417:		{
line 418
;418:			trap_SendConsoleCommand( EXEC_INSERT, va("g_BlueMC \"%i\"\n", level.blueCredits) );
ADDRGP4 $226
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
line 419
;419:		}
LABELV $223
line 420
;420:	}
LABELV $219
line 450
;421:
;422:
;423:
;424:		// regenerate
;425:#ifdef MISSIONPACK
;426:		if( bg_itemlist[client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;427:			maxHealth = client->ps.stats[STAT_MAX_HEALTH] / 2;
;428:		}
;429:		else if ( client->ps.powerups[PW_REGEN] ) {
;430:			maxHealth = client->ps.stats[STAT_MAX_HEALTH];
;431:		}
;432:		else {
;433:			maxHealth = 0;
;434:		}
;435:		if( maxHealth ) {
;436:			if ( ent->health < maxHealth ) {
;437:				ent->health += 15;
;438:				if ( ent->health > maxHealth * 1.1 ) {
;439:					ent->health = maxHealth * 1.1;
;440:				}
;441:				G_AddEvent( ent, EV_POWERUP_REGEN, 0 );
;442:			} else if ( ent->health < maxHealth * 2) {
;443:				ent->health += 5;
;444:				if ( ent->health > maxHealth * 2 ) {
;445:					ent->health = maxHealth * 2;
;446:				}
;447:				G_AddEvent( ent, EV_POWERUP_REGEN, 0 );
;448:			}
;449:#else
;450:		if ( client->ps.powerups[PW_REGEN] ) {
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
INDIRI4
CNSTI4 0
EQI4 $228
line 451
;451:			if ( ent->health < client->ps.stats[STAT_MAX_HEALTH]) {
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
GEI4 $230
line 452
;452:				ent->health += 15;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 756
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
line 453
;453:				if ( ent->health > client->ps.stats[STAT_MAX_HEALTH] * 1.1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 756
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
LEF4 $232
line 454
;454:					ent->health = client->ps.stats[STAT_MAX_HEALTH] * 1.1;
ADDRFP4 0
INDIRP4
CNSTI4 756
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
line 455
;455:				}
LABELV $232
line 456
;456:				G_AddEvent( ent, EV_POWERUP_REGEN, 0 );
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
line 457
;457:			} else if ( ent->health < client->ps.stats[STAT_MAX_HEALTH] * 2) {
ADDRGP4 $229
JUMPV
LABELV $230
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
GEI4 $229
line 458
;458:				ent->health += 5;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 756
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
line 459
;459:				if ( ent->health > client->ps.stats[STAT_MAX_HEALTH] * 2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
LEI4 $236
line 460
;460:					ent->health = client->ps.stats[STAT_MAX_HEALTH] * 2;
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 461
;461:				}
LABELV $236
line 462
;462:				G_AddEvent( ent, EV_POWERUP_REGEN, 0 );
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
line 463
;463:			}
line 465
;464:#endif
;465:		} else {
ADDRGP4 $229
JUMPV
LABELV $228
line 467
;466:			// count down health when over max
;467:			if ( ent->health > client->ps.stats[STAT_MAX_HEALTH] ) {
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
LEI4 $238
line 468
;468:				ent->health--;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 756
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
line 469
;469:			}
LABELV $238
line 470
;470:		}
LABELV $229
line 474
;471:
;472:
;473:		// Pulse Rifle // Machine Gun Ammo Regenerates
;474:		if (client->ps.ammo[WP_MACHINEGUN] < Max_Ammo[WP_MACHINEGUN]) 
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
ADDRGP4 Max_Ammo+8
INDIRI4
GEI4 $240
line 475
;475:		{
line 476
;476:				client->ps.ammo[WP_MACHINEGUN]+=2;
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
line 477
;477:		}
LABELV $240
line 482
;478:
;479:
;480:
;481:		// Immobilized
;482:		if( g_entities[client->ps.clientNum].immobilized == qtrue )
CNSTI4 924
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+920
ADDP4
INDIRI4
CNSTI4 1
NEI4 $243
line 483
;483:		{
line 484
;484:			client->ps.speed = 100;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 100
ASGNI4
line 485
;485:			client->ps.gravity = 1000;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 1000
ASGNI4
line 486
;486:			g_entities[client->ps.clientNum].s.time2 = 9;
CNSTI4 924
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
line 487
;487:			g_entities[client->ps.clientNum].health--;
ADDRLP4 12
CNSTI4 924
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+756
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
line 489
;488:			// Let them go when they are about dead.
;489:			if( g_entities[client->ps.clientNum].health < 75 )
CNSTI4 924
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+756
ADDP4
INDIRI4
CNSTI4 75
GEI4 $244
line 490
;490:				g_entities[client->ps.clientNum].immobilized = qfalse;
CNSTI4 924
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+920
ADDP4
CNSTI4 0
ASGNI4
line 491
;491:		}
ADDRGP4 $244
JUMPV
LABELV $243
line 493
;492:		else
;493:		{
line 495
;494:			// Free them
;495:			if( !( ent->r.svFlags & SVF_CUSTOM_SPEED ) ) // Not doing this check caused trouble -Vincent
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
NEI4 $252
line 496
;496:			{
line 499
;497:				
;498:					// Reset correctly if they have haste
;499:					if ( client->ps.powerups[PW_HASTE] ) {
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
CNSTI4 0
EQI4 $254
line 500
;500:							client->ps.speed = g_speed.integer * 1.3;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
CNSTF4 1067869798
ADDRGP4 g_speed+12
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 501
;501:					} else
ADDRGP4 $255
JUMPV
LABELV $254
line 502
;502:					{
line 503
;503:						client->ps.speed = g_speed.integer;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 g_speed+12
INDIRI4
ASGNI4
line 504
;504:					}
LABELV $255
line 506
;505:				
;506:			}
LABELV $252
line 508
;507:			
;508:			if( !( ent->r.svFlags & SVF_CUSTOM_GRAVITY ) ) // Not doing this check caused trouble -Vincent
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $258
line 509
;509:				   client->ps.gravity = g_gravity.integer;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDRGP4 g_gravity+12
INDIRI4
ASGNI4
LABELV $258
line 510
;510:			g_entities[client->ps.clientNum].s.time2 = 0;
CNSTI4 924
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
line 511
;511:			g_entities[client->ps.clientNum].immobilized = qfalse;
CNSTI4 924
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+920
ADDP4
CNSTI4 0
ASGNI4
line 512
;512:		}
LABELV $244
line 516
;513:		
;514:
;515:		//Trepidation - Regenative Health
;516:		if (g_RegenHealth.value == 1) 
ADDRGP4 g_RegenHealth+8
INDIRF4
CNSTF4 1065353216
NEF4 $263
line 517
;517:		{
line 518
;518:			if ( ent->health < client->ps.stats[STAT_MAX_HEALTH] ) 
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
GEI4 $266
line 519
;519:					{
line 520
;520:						ent->health++;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 521
;521:					}
LABELV $266
line 522
;522:		}
LABELV $263
line 526
;523:		/////////////////////////////////////////////////
;524:
;525:		// Trepidation  - Regenerating Ammo
;526:		if (g_RegenAmmo.value == 1) {
ADDRGP4 g_RegenAmmo+8
INDIRF4
CNSTF4 1065353216
NEF4 $268
line 527
;527:			if (client->ps.ammo[WP_SHOTGUN] < Max_Ammo[WP_SHOTGUN]) 
ADDRLP4 0
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
ADDRGP4 Max_Ammo+16
INDIRI4
GEI4 $271
line 528
;528:			{
line 529
;529:				client->ps.ammo[WP_SHOTGUN]++;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 392
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 530
;530:			}
LABELV $271
line 531
;531:			if (client->ps.ammo[WP_GRENADE_LAUNCHER] < Max_Ammo[WP_GRENADE_LAUNCHER]) 
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
ADDRGP4 Max_Ammo+20
INDIRI4
GEI4 $274
line 532
;532:			{
line 533
;533:				client->ps.ammo[WP_GRENADE_LAUNCHER]++;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 534
;534:			}
LABELV $274
line 535
;535:			if (client->ps.ammo[WP_ROCKET_LAUNCHER] < Max_Ammo[WP_ROCKET_LAUNCHER]) 
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRI4
ADDRGP4 Max_Ammo+32
INDIRI4
GEI4 $277
line 536
;536:			{
line 537
;537:				client->ps.ammo[WP_ROCKET_LAUNCHER]++;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 538
;538:			}
LABELV $277
line 539
;539:			if (client->ps.ammo[WP_LIGHTNING] < Max_Ammo[WP_LIGHTNING]) 
ADDRLP4 0
INDIRP4
CNSTI4 400
ADDP4
INDIRI4
ADDRGP4 Max_Ammo+24
INDIRI4
GEI4 $280
line 540
;540:			{
line 541
;541:				client->ps.ammo[WP_LIGHTNING]++;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 400
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 542
;542:			}
LABELV $280
line 543
;543:			if (client->ps.ammo[WP_RAILGUN] < Max_Ammo[WP_RAILGUN]) 
ADDRLP4 0
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
ADDRGP4 Max_Ammo+12
INDIRI4
GEI4 $283
line 544
;544:			{
line 545
;545:				client->ps.ammo[WP_RAILGUN]++;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 388
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 546
;546:			}
LABELV $283
line 547
;547:			if (client->ps.ammo[WP_PLASMAGUN] < Max_Ammo[WP_PLASMAGUN]) 
ADDRLP4 0
INDIRP4
CNSTI4 404
ADDP4
INDIRI4
ADDRGP4 Max_Ammo+28
INDIRI4
GEI4 $286
line 548
;548:			{
line 549
;549:				client->ps.ammo[WP_PLASMAGUN]++;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 404
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 550
;550:			}
LABELV $286
line 551
;551:			if (client->ps.ammo[WP_BFG] < Max_Ammo[WP_BFG]) 
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRGP4 Max_Ammo+36
INDIRI4
GEI4 $289
line 552
;552:			{
line 553
;553:				client->ps.ammo[WP_BFG]++;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 554
;554:			}
LABELV $289
line 556
;555:
;556:		}
LABELV $268
line 561
;557:
;558:
;559:
;560:		// count down armor when over max
;561:		if ( client->ps.stats[STAT_ARMOR] > client->ps.stats[STAT_MAX_HEALTH] ) {
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
LEI4 $292
line 562
;562:			client->ps.stats[STAT_ARMOR]--;
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
line 563
;563:		}
LABELV $292
line 564
;564:	}
LABELV $217
line 406
ADDRLP4 0
INDIRP4
CNSTI4 2728
ADDP4
INDIRI4
CNSTI4 1000
GEI4 $216
line 604
;565:#ifdef MISSIONPACK
;566:	if( bg_itemlist[client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_AMMOREGEN ) {
;567:		int w, max, inc, t, i;
;568:    int weapList[]={WP_MACHINEGUN,WP_SHOTGUN,WP_GRENADE_LAUNCHER,WP_ROCKET_LAUNCHER,WP_LIGHTNING,WP_RAILGUN,WP_PLASMAGUN,WP_BFG,WP_NAILGUN,WP_PROX_LAUNCHER,WP_CHAINGUN};
;569:    int weapCount = sizeof(weapList) / sizeof(int);
;570:		//
;571:    for (i = 0; i < weapCount; i++) {
;572:		  w = weapList[i];
;573:
;574:		  switch(w) {
;575:			  case WP_MACHINEGUN: max = 50; inc = 4; t = 1000; break;
;576:			  case WP_SHOTGUN: max = 10; inc = 1; t = 1500; break;
;577:			  case WP_GRENADE_LAUNCHER: max = 10; inc = 1; t = 2000; break;
;578:			  case WP_ROCKET_LAUNCHER: max = 10; inc = 1; t = 1750; break;
;579:			  case WP_LIGHTNING: max = 50; inc = 5; t = 1500; break;
;580:			  case WP_RAILGUN: max = 10; inc = 1; t = 1750; break;
;581:			  case WP_PLASMAGUN: max = 50; inc = 5; t = 1500; break;
;582:			  case WP_BFG: max = 10; inc = 1; t = 4000; break;
;583:			  case WP_NAILGUN: max = 10; inc = 1; t = 1250; break;
;584:			  case WP_PROX_LAUNCHER: max = 5; inc = 1; t = 2000; break;
;585:			  case WP_CHAINGUN: max = 100; inc = 5; t = 1000; break;
;586:			  default: max = 0; inc = 0; t = 1000; break;
;587:		  }
;588:		  client->ammoTimes[w] += msec;
;589:		  if ( client->ps.ammo[w] >= max ) {
;590:			  client->ammoTimes[w] = 0;
;591:		  }
;592:		  if ( client->ammoTimes[w] >= t ) {
;593:			  while ( client->ammoTimes[w] >= t )
;594:				  client->ammoTimes[w] -= t;
;595:			  client->ps.ammo[w] += inc;
;596:			  if ( client->ps.ammo[w] > max ) {
;597:				  client->ps.ammo[w] = max;
;598:			  }
;599:		  }
;600:    }
;601:	}
;602:#endif
;603:
;604:	if (g_GameMode.integer == 3)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 3
NEI4 $294
line 605
;605:	{
line 609
;606:
;607:		// Give Warnings That An MC Is Needed
;608:		// Clean this up !
;609:		if ((client->sess.sessionTeam == TEAM_RED) && ( level.redNeedMC == 1))
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $297
ADDRGP4 level+9300
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $297
line 610
;610:		{
line 611
;611:			if(level.time-level.blueScoreTime == 50000)	{ trap_SendServerCommand( client - level.clients, "cp \"Red Team Has 5 Sec\n To Place Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+48
INDIRI4
SUBI4
CNSTI4 50000
NEI4 $300
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3492
DIVI4
ARGI4
ADDRGP4 $304
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $300
line 612
;612:			if(level.time-level.blueScoreTime == 45000)	{ trap_SendServerCommand( client - level.clients, "cp \"Red Team Has 10 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+48
INDIRI4
SUBI4
CNSTI4 45000
NEI4 $305
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3492
DIVI4
ARGI4
ADDRGP4 $309
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $305
line 613
;613:			if(level.time-level.blueScoreTime == 40000)	{ trap_SendServerCommand( client - level.clients, "cp \"Red Team Has 15 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+48
INDIRI4
SUBI4
CNSTI4 40000
NEI4 $310
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3492
DIVI4
ARGI4
ADDRGP4 $314
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $310
line 614
;614:			if(level.time-level.blueScoreTime == 35000)	{ trap_SendServerCommand( client - level.clients, "cp \"Red Team Has 20 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+48
INDIRI4
SUBI4
CNSTI4 35000
NEI4 $315
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3492
DIVI4
ARGI4
ADDRGP4 $319
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $315
line 615
;615:			if(level.time-level.blueScoreTime == 30000)	{ trap_SendServerCommand( client - level.clients, "cp \"Red Team Has 25 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+48
INDIRI4
SUBI4
CNSTI4 30000
NEI4 $320
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3492
DIVI4
ARGI4
ADDRGP4 $324
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $320
line 616
;616:			if(level.time-level.blueScoreTime == 25000)	{ trap_SendServerCommand( client - level.clients, "cp \"Red Team Has 30 Sec\n To Build Power Core!\n\"" ); }	
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+48
INDIRI4
SUBI4
CNSTI4 25000
NEI4 $325
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3492
DIVI4
ARGI4
ADDRGP4 $329
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $325
line 618
;617:
;618:		}
LABELV $297
line 619
;619:		if ((client->sess.sessionTeam == TEAM_BLUE) && ( level.blueNeedMC == 1))
ADDRLP4 0
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
CNSTI4 2
NEI4 $330
ADDRGP4 level+9296
INDIRI4
CNSTI4 1
NEI4 $330
line 620
;620:		{
line 621
;621:			if(level.time-level.redScoreTime == 50000)	{ trap_SendServerCommand( client - level.clients, "cp \"Blue Team Has 5 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+44
INDIRI4
SUBI4
CNSTI4 50000
NEI4 $333
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3492
DIVI4
ARGI4
ADDRGP4 $337
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $333
line 622
;622:			if(level.time-level.redScoreTime == 45000)	{ trap_SendServerCommand( client - level.clients, "cp \"Blue Team Has 10 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+44
INDIRI4
SUBI4
CNSTI4 45000
NEI4 $338
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3492
DIVI4
ARGI4
ADDRGP4 $342
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $338
line 623
;623:			if(level.time-level.redScoreTime == 40000)	{ trap_SendServerCommand( client - level.clients, "cp \"Blue Team Has 15 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+44
INDIRI4
SUBI4
CNSTI4 40000
NEI4 $343
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3492
DIVI4
ARGI4
ADDRGP4 $347
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $343
line 624
;624:			if(level.time-level.redScoreTime == 35000)	{ trap_SendServerCommand( client - level.clients, "cp \"Blue Team Has 20 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+44
INDIRI4
SUBI4
CNSTI4 35000
NEI4 $348
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3492
DIVI4
ARGI4
ADDRGP4 $352
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $348
line 625
;625:			if(level.time-level.redScoreTime == 30000)	{ trap_SendServerCommand( client - level.clients, "cp \"Blue Team Has 25 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+44
INDIRI4
SUBI4
CNSTI4 30000
NEI4 $353
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3492
DIVI4
ARGI4
ADDRGP4 $357
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $353
line 626
;626:			if(level.time-level.redScoreTime == 25000)	{ trap_SendServerCommand( client - level.clients, "cp \"Blue Team Has 30 Sec\n To Build Power Core!\n\"" ); }
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+44
INDIRI4
SUBI4
CNSTI4 25000
NEI4 $358
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3492
DIVI4
ARGI4
ADDRGP4 $362
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $358
line 627
;627:		}
LABELV $330
line 629
;628:
;629:	}
LABELV $294
line 634
;630:
;631:
;632:
;633:
;634:}
LABELV $215
endproc ClientTimerActions 20 12
export ClientIntermissionThink
proc ClientIntermissionThink 24 0
line 641
;635:
;636:/*
;637:====================
;638:ClientIntermissionThink
;639:====================
;640:*/
;641:void ClientIntermissionThink( gclient_t *client ) {
line 642
;642:	client->ps.eFlags &= ~EF_TALK;
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
line 643
;643:	client->ps.eFlags &= ~EF_FIRING;
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
line 648
;644:
;645:	// the level will exit when everyone wants to or after timeouts
;646:
;647:	// swap and latch button actions
;648:	client->oldbuttons = client->buttons;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 2608
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 2604
ADDP4
INDIRI4
ASGNI4
line 649
;649:	client->buttons = client->pers.cmd.buttons;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 2604
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
ASGNI4
line 650
;650:	if ( client->buttons & ( BUTTON_ATTACK | BUTTON_USE_HOLDABLE ) & ( client->oldbuttons ^ client->buttons ) ) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
CNSTI4 2604
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 5
BANDI4
ADDRLP4 16
INDIRP4
CNSTI4 2608
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
BXORI4
BANDI4
CNSTI4 0
EQI4 $364
line 652
;651:		// this used to be an ^1 but once a player says ready, it should stick
;652:		client->readyToExit = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2596
ADDP4
CNSTI4 1
ASGNI4
line 653
;653:	}
LABELV $364
line 654
;654:}
LABELV $363
endproc ClientIntermissionThink 24 0
export ClientEvents
proc ClientEvents 96 32
line 665
;655:
;656:
;657:/*
;658:================
;659:ClientEvents
;660:
;661:Events will be passed on to the clients for presentation,
;662:but any server game effects are handled here
;663:================
;664:*/
;665:void ClientEvents( gentity_t *ent, int oldEventSequence ) {
line 673
;666:	int		i;
;667:	int		event;
;668:	gclient_t *client;
;669:	int		damage;
;670:	vec3_t	dir;
;671:	vec3_t	origin, angles;
;672:
;673:	client = ent->client;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 675
;674:
;675:	if ( oldEventSequence < client->ps.eventSequence - MAX_PS_EVENTS ) {
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
GEI4 $367
line 676
;676:		oldEventSequence = client->ps.eventSequence - MAX_PS_EVENTS;
ADDRFP4 4
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 677
;677:	}
LABELV $367
line 681
;678:
;679:
;680:
;681:	for ( i = oldEventSequence ; i < client->ps.eventSequence ; i++ ) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 $372
JUMPV
LABELV $369
line 682
;682:		event = client->ps.events[ i & (MAX_PS_EVENTS-1) ];
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
line 685
;683:
;684:
;685:		switch ( event ) {
ADDRLP4 56
CNSTI4 11
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $375
ADDRLP4 4
INDIRI4
CNSTI4 12
EQI4 $375
ADDRLP4 4
INDIRI4
ADDRLP4 56
INDIRI4
LTI4 $374
LABELV $395
ADDRLP4 4
INDIRI4
CNSTI4 23
LTI4 $374
ADDRLP4 4
INDIRI4
CNSTI4 31
GTI4 $374
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $396-92
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $396
address $386
address $387
address $374
address $388
address $389
address $374
address $374
address $374
address $394
code
LABELV $375
line 688
;686:		case EV_FALL_MEDIUM:
;687:		case EV_FALL_FAR:
;688:			if ( ent->s.eType != ET_PLAYER ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
EQI4 $376
line 689
;689:				break;		// not in the player model
ADDRGP4 $374
JUMPV
LABELV $376
line 691
;690:			}
;691:			if ( g_dmflags.integer & DF_NO_FALLING ) {
ADDRGP4 g_dmflags+12
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $378
line 692
;692:				break;
ADDRGP4 $374
JUMPV
LABELV $378
line 694
;693:			}
;694:			if ( event == EV_FALL_FAR ) {
ADDRLP4 4
INDIRI4
CNSTI4 12
NEI4 $381
line 695
;695:				damage = 10;
ADDRLP4 24
CNSTI4 10
ASGNI4
line 696
;696:			} else {
ADDRGP4 $382
JUMPV
LABELV $381
line 697
;697:				damage = 5;
ADDRLP4 24
CNSTI4 5
ASGNI4
line 698
;698:			}
LABELV $382
line 699
;699:			VectorSet (dir, 0, 0, 1);
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
line 700
;700:			ent->pain_debounce_time = level.time + 200;	// no normal pain sound
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 701
;701:			G_Damage (ent, NULL, NULL, NULL, NULL, damage, 0, MOD_FALLING);
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
line 702
;702:			break;
ADDRGP4 $374
JUMPV
LABELV $386
line 705
;703:
;704:		case EV_FIRE_WEAPON:
;705:			FireWeapon( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 FireWeapon
CALLV
pop
line 706
;706:			break;
ADDRGP4 $374
JUMPV
LABELV $387
line 710
;707:
;708:		// Shafe - Trep - Alt Fire
;709:		case EV_FIRE_WEAPON2: 
;710:			FireWeapon2( ent ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 FireWeapon2
CALLV
pop
line 711
;711:			break;
ADDRGP4 $374
JUMPV
LABELV $388
line 764
;712:
;713:		case EV_USE_ITEM1:		// teleporter
;714:			// drop flags in CTF
;715:			//Team_DropFlags( ent );
;716:			/* Shafe - Trep - This is now in g_team.c - Keeping it here only for reference
;717:			item = NULL;
;718:			j = 0;
;719:
;720:			if ( ent->client->ps.powerups[ PW_REDFLAG ] ) {
;721:				item = BG_FindItemForPowerup( PW_REDFLAG );
;722:				j = PW_REDFLAG;
;723:			} else if ( ent->client->ps.powerups[ PW_BLUEFLAG ] ) {
;724:				item = BG_FindItemForPowerup( PW_BLUEFLAG );
;725:				j = PW_BLUEFLAG;
;726:			} else if ( ent->client->ps.powerups[ PW_NEUTRALFLAG ] ) {
;727:				item = BG_FindItemForPowerup( PW_NEUTRALFLAG );
;728:				j = PW_NEUTRALFLAG;
;729:			}
;730:
;731:			if ( item ) {
;732:				drop = Drop_Item( ent, item, 0 );
;733:				// decide how many seconds it has left
;734:				drop->count = ( ent->client->ps.powerups[ j ] - level.time ) / 1000;
;735:				if ( drop->count < 1 ) {
;736:					drop->count = 1;
;737:				}
;738:
;739:				ent->client->ps.powerups[ j ] = 0;
;740:			} */
;741:#ifdef MISSIONPACK
;742:			if ( g_gametype.integer == GT_HARVESTER ) {
;743:				if ( ent->client->ps.generic1 > 0 ) {
;744:					if ( ent->client->sess.sessionTeam == TEAM_RED ) {
;745:						item = BG_FindItem( "Blue Cube" );
;746:					} else {
;747:						item = BG_FindItem( "Red Cube" );
;748:					}
;749:					if ( item ) {
;750:						for ( j = 0; j < ent->client->ps.generic1; j++ ) {
;751:							drop = Drop_Item( ent, item, 0 );
;752:							if ( ent->client->sess.sessionTeam == TEAM_RED ) {
;753:								drop->spawnflags = TEAM_BLUE;
;754:							} else {
;755:								drop->spawnflags = TEAM_RED;
;756:							}
;757:						}
;758:					}
;759:					ent->client->ps.generic1 = 0;
;760:				}
;761:			}
;762:#endif
;763://			PrintMsg( NULL, "%i" S_COLOR_WHITE " DEBUG: USE Teleporter\n", ent->item->giTag ); // Shafe - Debug
;764:			SelectSpawnPoint( ent->client->ps.origin, origin, angles );
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
line 765
;765:			TeleportPlayer( ent, origin, angles );
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
line 768
;766:
;767:
;768:			break;
ADDRGP4 $374
JUMPV
LABELV $389
line 774
;769:
;770:		case EV_USE_ITEM2:		// holdable medkit now -Vincent
;771://			PrintMsg( NULL, "%i" S_COLOR_WHITE " DEBUG: USE Medkit\n", ent->item->giTag ); // Shafe - Debug
;772:			// New set of rules.  You get either 100 health, or an extra 25, whichever is higher.
;773:			// Give 1/4 health.
;774:			ent->health += ent->client->ps.stats[STAT_MAX_HEALTH]*0.25;
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
ADDRLP4 76
INDIRP4
CNSTI4 756
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CVIF4 4
CNSTF4 1048576000
ADDRLP4 76
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 776
;775:
;776:			if (ent->health < ent->client->ps.stats[STAT_MAX_HEALTH])
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
ADDRLP4 84
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
GEI4 $390
line 777
;777:			{	// If that doesn't bring us up to 100, make it go up to 100.
line 778
;778:				ent->health = ent->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 756
ADDP4
ADDRLP4 88
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ASGNI4
line 779
;779:			}
ADDRGP4 $374
JUMPV
LABELV $390
line 780
;780:			else if (ent->health > ent->client->ps.stats[STAT_MAX_HEALTH]*2)
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
ADDRLP4 88
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
LEI4 $374
line 781
;781:			{	// Otherwise, 25 is all you get.  Just make sure we don't go above 200.
line 782
;782:				ent->health = ent->client->ps.stats[STAT_MAX_HEALTH]*2;
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 756
ADDP4
ADDRLP4 92
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 783
;783:			}
line 784
;784:			break;
ADDRGP4 $374
JUMPV
LABELV $394
line 808
;785:
;786:		
;787:#ifdef MISSIONPACK
;788:		case EV_USE_ITEM3:		// kamikaze
;789:			// make sure the invulnerability is off
;790:			ent->client->invulnerabilityTime = 0;
;791:			// start the kamikze
;792:			G_StartKamikaze( ent );
;793:			break;
;794:
;795:		case EV_USE_ITEM4:		// portal
;796:			if( ent->client->portalID ) {
;797:				DropPortalSource( ent );
;798:			}
;799:			else {
;800:				DropPortalDestination( ent );
;801:			}
;802:			break;
;803:		case EV_USE_ITEM5:		// invulnerability
;804:			ent->client->invulnerabilityTime = level.time + 10000;
;805:			break;
;806:#endif
;807:		case EV_USE_ITEM6:		// drop flags? Shafe - Trep
;808:			Team_DropFlags( ent ); // Shafe - Trep - Drop Flags  - This doesnt seem to work.. 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Team_DropFlags
CALLV
pop
line 809
;809:			break;
line 812
;810:
;811:		default:
;812:		break;
LABELV $374
line 814
;813:		}
;814:	}
LABELV $370
line 681
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $372
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
LTI4 $369
line 816
;815:
;816:}
LABELV $366
endproc ClientEvents 96 32
export SendPendingPredictableEvents
proc SendPendingPredictableEvents 44 12
line 868
;817:
;818:#ifdef MISSIONPACK
;819:/*
;820:==============
;821:StuckInOtherClient
;822:==============
;823:*/
;824:static int StuckInOtherClient(gentity_t *ent) {
;825:	int i;
;826:	gentity_t	*ent2;
;827:
;828:	ent2 = &g_entities[0];
;829:	for ( i = 0; i < MAX_CLIENTS; i++, ent2++ ) {
;830:		if ( ent2 == ent ) {
;831:			continue;
;832:		}
;833:		if ( !ent2->inuse ) {
;834:			continue;
;835:		}
;836:		if ( !ent2->client ) {
;837:			continue;
;838:		}
;839:		if ( ent2->health <= 0 ) {
;840:			continue;
;841:		}
;842:		//
;843:		if (ent2->r.absmin[0] > ent->r.absmax[0])
;844:			continue;
;845:		if (ent2->r.absmin[1] > ent->r.absmax[1])
;846:			continue;
;847:		if (ent2->r.absmin[2] > ent->r.absmax[2])
;848:			continue;
;849:		if (ent2->r.absmax[0] < ent->r.absmin[0])
;850:			continue;
;851:		if (ent2->r.absmax[1] < ent->r.absmin[1])
;852:			continue;
;853:		if (ent2->r.absmax[2] < ent->r.absmin[2])
;854:			continue;
;855:		return qtrue;
;856:	}
;857:	return qfalse;
;858:}
;859:#endif
;860:
;861:void BotTestSolid(vec3_t origin);
;862:
;863:/*
;864:==============
;865:SendPendingPredictableEvents
;866:==============
;867:*/
;868:void SendPendingPredictableEvents( playerState_t *ps ) {
line 874
;869:	gentity_t *t;
;870:	int event, seq;
;871:	int extEvent, number;
;872:
;873:	// if there are still events pending
;874:	if ( ps->entityEventSequence < ps->eventSequence ) {
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
GEI4 $399
line 877
;875:		// create a temporary entity for this event which is sent to everyone
;876:		// except the client who generated the event
;877:		seq = ps->entityEventSequence & (MAX_PS_EVENTS-1);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 878
;878:		event = ps->events[ seq ] | ( ( ps->entityEventSequence & 3 ) << 8 );
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
line 880
;879:		// set external event to zero before calling BG_PlayerStateToEntityState
;880:		extEvent = ps->externalEvent;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
ASGNI4
line 881
;881:		ps->externalEvent = 0;
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
CNSTI4 0
ASGNI4
line 883
;882:		// create temporary entity for event
;883:		t = G_TempEntity( ps->origin, event );
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
line 884
;884:		number = t->s.number;
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 885
;885:		BG_PlayerStateToEntityState( ps, &t->s, qtrue );
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
line 886
;886:		t->s.number = number;
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ASGNI4
line 887
;887:		t->s.eType = ET_EVENTS + event;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 14
ADDI4
ASGNI4
line 888
;888:		t->s.eFlags |= EF_PLAYER_EVENT;
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
line 889
;889:		t->s.otherEntityNum = ps->clientNum;
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
line 891
;890:		// send to everyone except the client who generated the event
;891:		t->r.svFlags |= SVF_NOTSINGLECLIENT;
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
line 892
;892:		t->r.singleClient = ps->clientNum;
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
line 894
;893:		// set back external event
;894:		ps->externalEvent = extEvent;
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 895
;895:	}
LABELV $399
line 896
;896:}
LABELV $398
endproc SendPendingPredictableEvents 44 12
export ClientThink_real
proc ClientThink_real 336 12
line 909
;897:
;898:/*
;899:==============
;900:ClientThink
;901:
;902:This will be called once for each client frame, which will
;903:usually be a couple times for each server frame on fast clients.
;904:
;905:If "g_synchronousClients 1" is set, this will be called exactly
;906:once for each server frame, which makes for smooth demo recording.
;907:==============
;908:*/
;909:void ClientThink_real( gentity_t *ent ) {
line 916
;910:	gclient_t	*client;
;911:	pmove_t		pm;
;912:	int			oldEventSequence;
;913:	int			msec;
;914:	usercmd_t	*ucmd;
;915:
;916:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 919
;917:
;918:	// don't think if the client is not yet connected (and thus not yet spawned in)
;919:	if (client->pers.connected != CON_CONNECTED) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $402
line 920
;920:		return;
ADDRGP4 $401
JUMPV
LABELV $402
line 923
;921:	}
;922:	// mark the time, so the connection sprite can be removed
;923:	ucmd = &ent->client->pers.cmd;
ADDRLP4 236
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 472
ADDP4
ASGNP4
line 926
;924:
;925:	// sanity check the command time to prevent speedup cheating
;926:	if ( ucmd->serverTime > level.time + 200 ) {
ADDRLP4 236
INDIRP4
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
LEI4 $404
line 927
;927:		ucmd->serverTime = level.time + 200;
ADDRLP4 236
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 929
;928://		G_Printf("serverTime <<<<<\n" );
;929:	}
LABELV $404
line 930
;930:	if ( ucmd->serverTime < level.time - 1000 ) {
ADDRLP4 236
INDIRP4
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
SUBI4
GEI4 $408
line 931
;931:		ucmd->serverTime = level.time - 1000;
ADDRLP4 236
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
SUBI4
ASGNI4
line 933
;932://		G_Printf("serverTime >>>>>\n" );
;933:	} 
LABELV $408
line 940
;934:
;935:
;936://unlagged - backward reconciliation #4
;937:	// frameOffset should be about the number of milliseconds into a frame 
;938:	// this command packet was received, depending on how fast the server
;939:	// does a G_RunFrame()
;940:	client->frameOffset = trap_Milliseconds() - level.frameStartTime;
ADDRLP4 248
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 3484
ADDP4
ADDRLP4 248
INDIRI4
ADDRGP4 level+9224
INDIRI4
SUBI4
ASGNI4
line 946
;941://unlagged - backward reconciliation #4
;942:
;943:
;944://unlagged - lag simulation #3
;945:	// if the client wants to simulate outgoing packet loss
;946:	if ( client->pers.plOut ) {
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
CNSTI4 0
EQI4 $413
line 948
;947:		// see if a random value is below the threshhold
;948:		float thresh = (float)client->pers.plOut / 100.0f;
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
line 949
;949:		if ( random() < thresh ) {
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
GEF4 $415
line 951
;950:			// do nothing at all if it is - this is a lost command
;951:			return;
ADDRGP4 $401
JUMPV
LABELV $415
line 953
;952:		}
;953:	}
LABELV $413
line 962
;954://unlagged - lag simulation #3
;955:
;956:
;957://unlagged - true ping
;958:	// save the estimated ping in a queue for averaging later
;959:
;960:	// we use level.previousTime to account for 50ms lag correction
;961:	// besides, this will turn out numbers more like what players are used to
;962:	client->pers.pingsamples[client->pers.samplehead] = level.previousTime + client->frameOffset - ucmd->serverTime;
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
CNSTI4 3484
ADDP4
INDIRI4
ADDI4
ADDRLP4 236
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 963
;963:	client->pers.samplehead++;
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
line 964
;964:	if ( client->pers.samplehead >= NUM_PING_SAMPLES ) {
ADDRLP4 0
INDIRP4
CNSTI4 2440
ADDP4
INDIRI4
CNSTI4 64
LTI4 $418
line 965
;965:		client->pers.samplehead -= NUM_PING_SAMPLES;
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
line 966
;966:	}
LABELV $418
line 969
;967:
;968:	// initialize the real ping
;969:	if ( g_truePing.integer ) {
ADDRGP4 g_truePing+12
INDIRI4
CNSTI4 0
EQI4 $420
line 970
;970:		int i, sum = 0;
ADDRLP4 264
CNSTI4 0
ASGNI4
line 973
;971:
;972:		// get an average of the samples we saved up
;973:		for ( i = 0; i < NUM_PING_SAMPLES; i++ ) {
ADDRLP4 260
CNSTI4 0
ASGNI4
LABELV $423
line 974
;974:			sum += client->pers.pingsamples[i];
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
line 975
;975:		}
LABELV $424
line 973
ADDRLP4 260
ADDRLP4 260
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 64
LTI4 $423
line 977
;976:
;977:		client->pers.realPing = sum / NUM_PING_SAMPLES;
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
ADDRLP4 264
INDIRI4
CNSTI4 64
DIVI4
ASGNI4
line 978
;978:	}
ADDRGP4 $421
JUMPV
LABELV $420
line 979
;979:	else {
line 981
;980:		// if g_truePing is off, use the normal ping
;981:		client->pers.realPing = client->ps.ping;
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
line 982
;982:	}
LABELV $421
line 988
;983://unlagged - true ping
;984:
;985:
;986://unlagged - lag simulation #2
;987:	// keep a queue of past commands
;988:	client->pers.cmdqueue[client->pers.cmdhead] = client->pers.cmd;
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
line 989
;989:	client->pers.cmdhead++;
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
line 990
;990:	if ( client->pers.cmdhead >= MAX_LATENT_CMDS ) {
ADDRLP4 0
INDIRP4
CNSTI4 2176
ADDP4
INDIRI4
CNSTI4 64
LTI4 $427
line 991
;991:		client->pers.cmdhead -= MAX_LATENT_CMDS;
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
line 992
;992:	}
LABELV $427
line 995
;993:
;994:	// if the client wants latency in commands (client-to-server latency)
;995:	if ( client->pers.latentCmds ) {
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 0
EQI4 $429
line 997
;996:		// save the actual command time
;997:		int time = ucmd->serverTime;
ADDRLP4 272
ADDRLP4 236
INDIRP4
INDIRI4
ASGNI4
line 1000
;998:
;999:		// find out which index in the queue we want
;1000:		int cmdindex = client->pers.cmdhead - client->pers.latentCmds - 1;
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
ADDRGP4 $432
JUMPV
LABELV $431
line 1001
;1001:		while ( cmdindex < 0 ) {
line 1002
;1002:			cmdindex += MAX_LATENT_CMDS;
ADDRLP4 268
ADDRLP4 268
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 1003
;1003:		}
LABELV $432
line 1001
ADDRLP4 268
INDIRI4
CNSTI4 0
LTI4 $431
line 1006
;1004:
;1005:		// read in the old command
;1006:		client->pers.cmd = client->pers.cmdqueue[cmdindex];
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
line 1009
;1007:
;1008:		// adjust the real ping to reflect the new latency
;1009:		client->pers.realPing += time - ucmd->serverTime;
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
line 1010
;1010:	}
LABELV $429
line 1018
;1011://unlagged - lag simulation #2
;1012:
;1013:
;1014://unlagged - backward reconciliation #4
;1015:	// save the command time *before* pmove_fixed messes with the serverTime,
;1016:	// and *after* lag simulation messes with it :)
;1017:	// attackTime will be used for backward reconciliation later (time shift)
;1018:	client->attackTime = ucmd->serverTime;
ADDRLP4 0
INDIRP4
CNSTI4 2756
ADDP4
ADDRLP4 236
INDIRP4
INDIRI4
ASGNI4
line 1025
;1019://unlagged - backward reconciliation #4
;1020:
;1021:
;1022://unlagged - smooth clients #1
;1023:	// keep track of this for later - we'll use this to decide whether or not
;1024:	// to send extrapolated positions for this client
;1025:	client->lastUpdateFrame = level.framenum;
ADDRLP4 0
INDIRP4
CNSTI4 3488
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 1031
;1026://unlagged - smooth clients #1
;1027:
;1028:
;1029://unlagged - lag simulation #1
;1030:	// if the client is adding latency to received snapshots (server-to-client latency)
;1031:	if ( client->pers.latentSnaps ) {
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 0
EQI4 $435
line 1033
;1032:		// adjust the real ping
;1033:		client->pers.realPing += client->pers.latentSnaps * (1000 / sv_fps.integer);
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
line 1035
;1034:		// adjust the attack time so backward reconciliation will work
;1035:		client->attackTime -= client->pers.latentSnaps * (1000 / sv_fps.integer);
ADDRLP4 280
ADDRLP4 0
INDIRP4
CNSTI4 2756
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
line 1036
;1036:	}
LABELV $435
line 1042
;1037://unlagged - lag simulation #1
;1038:
;1039:
;1040://unlagged - true ping
;1041:	// make sure the true ping is over 0 - with cl_timenudge it can be less
;1042:	if ( client->pers.realPing < 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
INDIRI4
CNSTI4 0
GEI4 $439
line 1043
;1043:		client->pers.realPing = 0;
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
CNSTI4 0
ASGNI4
line 1044
;1044:	}
LABELV $439
line 1048
;1045://unlagged - true ping
;1046:
;1047:
;1048:	msec = ucmd->serverTime - client->ps.commandTime;
ADDRLP4 240
ADDRLP4 236
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 1051
;1049:	// following others may result in bad times, but we still want
;1050:	// to check for follow toggles
;1051:	if ( msec < 1 && client->sess.spectatorState != SPECTATOR_FOLLOW ) {
ADDRLP4 240
INDIRI4
CNSTI4 1
GEI4 $441
ADDRLP4 0
INDIRP4
CNSTI4 2572
ADDP4
INDIRI4
CNSTI4 2
EQI4 $441
line 1052
;1052:		return;
ADDRGP4 $401
JUMPV
LABELV $441
line 1054
;1053:	}
;1054:	if ( msec > 200 ) {
ADDRLP4 240
INDIRI4
CNSTI4 200
LEI4 $443
line 1055
;1055:		msec = 200;
ADDRLP4 240
CNSTI4 200
ASGNI4
line 1056
;1056:	}
LABELV $443
line 1058
;1057:
;1058:	if ( pmove_msec.integer < 8 ) {
ADDRGP4 pmove_msec+12
INDIRI4
CNSTI4 8
GEI4 $445
line 1059
;1059:		trap_Cvar_Set("pmove_msec", "8");
ADDRGP4 $448
ARGP4
ADDRGP4 $449
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1060
;1060:	}
ADDRGP4 $446
JUMPV
LABELV $445
line 1061
;1061:	else if (pmove_msec.integer > 33) {
ADDRGP4 pmove_msec+12
INDIRI4
CNSTI4 33
LEI4 $450
line 1062
;1062:		trap_Cvar_Set("pmove_msec", "33");
ADDRGP4 $448
ARGP4
ADDRGP4 $453
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1063
;1063:	}
LABELV $450
LABELV $446
line 1065
;1064:
;1065:	if ( pmove_fixed.integer || client->pers.pmoveFixed ) {
ADDRLP4 268
CNSTI4 0
ASGNI4
ADDRGP4 pmove_fixed+12
INDIRI4
ADDRLP4 268
INDIRI4
NEI4 $457
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
ADDRLP4 268
INDIRI4
EQI4 $454
LABELV $457
line 1066
;1066:		ucmd->serverTime = ((ucmd->serverTime + pmove_msec.integer-1) / pmove_msec.integer) * pmove_msec.integer;
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
line 1069
;1067:		//if (ucmd->serverTime - client->ps.commandTime <= 0)
;1068:		//	return;
;1069:	}
LABELV $454
line 1074
;1070:
;1071:	//
;1072:	// check for exiting intermission
;1073:	//
;1074:	if ( level.intermissiontime ) {
ADDRGP4 level+9140
INDIRI4
CNSTI4 0
EQI4 $461
line 1075
;1075:		ClientIntermissionThink( client );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ClientIntermissionThink
CALLV
pop
line 1076
;1076:		return;
ADDRGP4 $401
JUMPV
LABELV $461
line 1080
;1077:	}
;1078:
;1079:	// spectators don't do much
;1080:	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
CNSTI4 3
NEI4 $464
line 1081
;1081:		if ( client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRLP4 0
INDIRP4
CNSTI4 2572
ADDP4
INDIRI4
CNSTI4 3
NEI4 $466
line 1082
;1082:			return;
ADDRGP4 $401
JUMPV
LABELV $466
line 1084
;1083:		}
;1084:		SpectatorThink( ent, ucmd );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 236
INDIRP4
ARGP4
ADDRGP4 SpectatorThink
CALLV
pop
line 1085
;1085:		return;
ADDRGP4 $401
JUMPV
LABELV $464
line 1089
;1086:	}
;1087:
;1088:	// check for inactivity timer, but never drop the local client of a non-dedicated server
;1089:	if ( !ClientInactivityTimer( client ) ) {
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
NEI4 $468
line 1090
;1090:		return;
ADDRGP4 $401
JUMPV
LABELV $468
line 1094
;1091:	}
;1092:
;1093:	// clear the rewards if time
;1094:	if ( level.time > client->rewardTime ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 2692
ADDP4
INDIRI4
LEI4 $470
line 1095
;1095:		client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
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
line 1096
;1096:	}
LABELV $470
line 1098
;1097:
;1098:	if ( client->noclip ) {
ADDRLP4 0
INDIRP4
CNSTI4 2600
ADDP4
INDIRI4
CNSTI4 0
EQI4 $473
line 1099
;1099:		client->ps.pm_type = PM_NOCLIP;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 1
ASGNI4
line 1100
;1100:	} else if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 $474
JUMPV
LABELV $473
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $475
line 1101
;1101:		client->ps.pm_type = PM_DEAD;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1102
;1102:	} else {
ADDRGP4 $476
JUMPV
LABELV $475
line 1103
;1103:		client->ps.pm_type = PM_NORMAL;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 1104
;1104:	}
LABELV $476
LABELV $474
line 1115
;1105:
;1106:#ifdef MISSIONPACK
;1107:	if( bg_itemlist[client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_SCOUT ) {
;1108:		client->ps.speed *= 1.5;
;1109:	}
;1110:	else
;1111:#endif
;1112:
;1113:
;1114:
;1115:	if (( g_entities[client->ps.clientNum].immobilized == qtrue) && (g_entities[client->ps.clientNum].s.eType != ET_BUILDABLE)) 
ADDRLP4 276
CNSTI4 924
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 276
INDIRI4
ADDRGP4 g_entities+920
ADDP4
INDIRI4
CNSTI4 1
NEI4 $477
ADDRLP4 276
INDIRI4
ADDRGP4 g_entities+4
ADDP4
INDIRI4
CNSTI4 13
EQI4 $477
line 1116
;1116:	{
line 1118
;1117:		// Client only immobilized effects -Vincent
;1118:		if (g_entities[client->ps.clientNum].health > 8)
CNSTI4 924
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+756
ADDP4
INDIRI4
CNSTI4 8
LEI4 $481
line 1119
;1119:		{ // Don't do anything when your health is above 8, because you are free then
line 1120
;1120:		G_AddEvent( ent, EV_IMMOBILIZED, 0 ); // Visualise
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
line 1121
;1121:		}
ADDRGP4 $482
JUMPV
LABELV $481
line 1123
;1122:		else
;1123:		{ // Failsafe
line 1124
;1124:		G_AddEvent( ent, EV_IMMOBILIZED_FREE, 0 );
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
line 1125
;1125:		}
LABELV $482
line 1127
;1126:
;1127:		client->ps.speed = 50;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 50
ASGNI4
line 1128
;1128:		if (g_entities[client->ps.clientNum].health < 8) { g_entities[client->ps.clientNum].immobilized = qfalse; }
CNSTI4 924
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+756
ADDP4
INDIRI4
CNSTI4 8
GEI4 $478
CNSTI4 924
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+920
ADDP4
CNSTI4 0
ASGNI4
line 1129
;1129:	}
ADDRGP4 $478
JUMPV
LABELV $477
line 1131
;1130:	else
;1131:	{ // Free the effect if it exists (and isn't supposed to exist anymore)
line 1132
;1132:	G_AddEvent( ent, EV_IMMOBILIZED_FREE, 0 );
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
line 1133
;1133:	}
LABELV $478
line 1145
;1134:
;1135:
;1136:	// Let go of the hook if we aren't firing
;1137:	/*  - Shafe - Trep - Commented out for offhand grapple
;1138:	if ( client->ps.weapon == WP_GRAPPLING_HOOK &&
;1139:		client->hook && !( ucmd->buttons & BUTTON_ATTACK ) ) {
;1140:		Weapon_HookFree(client->hook);
;1141:	}
;1142:	*/ 
;1143:
;1144:	// Do a speedchange and gravitychange resetcheck -Vincent
;1145:		if( client->speedTime < level.time )
ADDRLP4 0
INDIRP4
CNSTI4 2744
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $488
line 1146
;1146:			ent->r.svFlags &= ~SVF_CUSTOM_SPEED;
ADDRLP4 280
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
ASGNP4
ADDRLP4 280
INDIRP4
ADDRLP4 280
INDIRP4
INDIRI4
CNSTI4 -8193
BANDI4
ASGNI4
LABELV $488
line 1147
;1147:		if( client->gravityTime < level.time )
ADDRLP4 0
INDIRP4
CNSTI4 2748
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $491
line 1148
;1148:			ent->r.svFlags &= ~SVF_CUSTOM_GRAVITY;
ADDRLP4 284
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
ASGNP4
ADDRLP4 284
INDIRP4
ADDRLP4 284
INDIRP4
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
LABELV $491
line 1153
;1149:		// Above: Actual reset is done at immobilizer thinking (prevents double checking, was fixed there)... -Vincent
;1150:
;1151:
;1152:	// Do this check after all the immobilizer stuff. - Shafe
;1153:	if ( client->ps.powerups[PW_HASTE] ) {
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
CNSTI4 0
EQI4 $494
line 1155
;1154:		//client->ps.speed *= 1.3;
;1155:		client->ps.speed = g_speed.integer * 1.3;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
CNSTF4 1067869798
ADDRGP4 g_speed+12
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1157
;1156://		PrintMsg( NULL, "%i" S_COLOR_WHITE " DEBUG: Speed \n", client->ps.speed); // Shafe - Debug
;1157:	}
LABELV $494
line 1160
;1158:
;1159:	// set up for pmove
;1160:	oldEventSequence = client->ps.eventSequence;
ADDRLP4 244
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 1162
;1161:
;1162:	memset (&pm, 0, sizeof(pm));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 232
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1166
;1163:
;1164:	// check for the hit-scan gauntlet, don't let the action
;1165:	// go through as an attack unless it actually hits something
;1166:	if ( client->ps.weapon == WP_GAUNTLET && !( ucmd->buttons & BUTTON_TALK ) &&
ADDRLP4 288
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ADDRLP4 288
INDIRI4
NEI4 $497
ADDRLP4 292
ADDRLP4 236
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
ADDRLP4 296
CNSTI4 0
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 296
INDIRI4
NEI4 $497
ADDRLP4 292
INDIRI4
ADDRLP4 288
INDIRI4
BANDI4
ADDRLP4 296
INDIRI4
NEI4 $499
ADDRLP4 292
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 296
INDIRI4
EQI4 $497
LABELV $499
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
GTI4 $497
line 1167
;1167:		( (ucmd->buttons & BUTTON_ATTACK) || (ucmd->buttons & 32) ) && client->ps.weaponTime <= 0 ) { // Shafe - Trep - Alt Fire
line 1169
;1168:		//( ucmd->buttons & BUTTON_ATTACK ) && client->ps.weaponTime <= 0 ) {
;1169:		pm.gauntletHit = CheckGauntletAttack( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 300
ADDRGP4 CheckGauntletAttack
CALLI4
ASGNI4
ADDRLP4 4+40
ADDRLP4 300
INDIRI4
ASGNI4
line 1170
;1170:	}
LABELV $497
line 1172
;1171:
;1172:	if ( ent->flags & FL_FORCE_GESTURE ) {
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $501
line 1173
;1173:		ent->flags &= ~FL_FORCE_GESTURE;
ADDRLP4 300
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
ASGNP4
ADDRLP4 300
INDIRP4
ADDRLP4 300
INDIRP4
INDIRI4
CNSTI4 -32769
BANDI4
ASGNI4
line 1174
;1174:		ent->client->pers.cmd.buttons |= BUTTON_GESTURE;
ADDRLP4 304
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 488
ADDP4
ASGNP4
ADDRLP4 304
INDIRP4
ADDRLP4 304
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1175
;1175:	}
LABELV $501
line 1190
;1176:
;1177:	// Github bug 54 -shafe - fixes stuck in zoom thingy
;1178:	/*
;1179:
;1180:		THIS DIDNT FIX THE PROBLEM
;1181:	if ((client->ps.weapon != WP_RAILGUN) && (client->Zoomed == qtrue))
;1182:	{
;1183:				client->ZoomTime = level.time;
;1184:				trap_SendServerCommand(client->ps.clientNum, "+greset");
;1185:				//PrintMsg( NULL, "%i" S_COLOR_WHITE " DEBUG: +greset\n", client->ps.weaponstate );
;1186:				client->Zoomed = qfalse;
;1187:	}
;1188:	*/ 
;1189:
;1190:	if ((client->Zoomed) && (client->ps.weapon != WP_RAILGUN))
ADDRLP4 0
INDIRP4
CNSTI4 2740
ADDP4
INDIRI4
CNSTI4 0
EQI4 $503
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 3
EQI4 $503
line 1191
;1191:	{
line 1192
;1192:		trap_SendServerCommand(client->ps.clientNum, "-gzoom");
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 $505
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1194
;1193:		//PrintMsg( NULL, "%i" S_COLOR_WHITE " DEBUG: -gzoom\n", client->ps.weaponstate );
;1194:		client->ps.weaponstate = WEAPON_CHARGING;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 4
ASGNI4
line 1195
;1195:		client->Zoomed = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 2740
ADDP4
CNSTI4 0
ASGNI4
line 1196
;1196:		client->ZoomTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 2736
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1198
;1197:
;1198:	}
LABELV $503
line 1200
;1199:
;1200:	if (client->ps.weapon == WP_RAILGUN )
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 3
NEI4 $507
line 1201
;1201:	{
line 1202
;1202:		if (ucmd->buttons & 32)
ADDRLP4 236
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $509
line 1203
;1203:		{
line 1205
;1204:
;1205:			if (!client->Zoomed)
ADDRLP4 0
INDIRP4
CNSTI4 2740
ADDP4
INDIRI4
CNSTI4 0
NEI4 $511
line 1206
;1206:			{					
line 1207
;1207:					if ((level.time - client->ZoomTime) > 500) // give it a second so that when we release zoom we automatically don't zoom back in.
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 2736
ADDP4
INDIRI4
SUBI4
CNSTI4 500
LEI4 $510
line 1208
;1208:					{
line 1209
;1209:						client->ps.weaponstate = WEAPON_FIRING;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 3
ASGNI4
line 1210
;1210:						trap_SendServerCommand(client->ps.clientNum, "+gzoom");
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 $516
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1212
;1211:						//PrintMsg( NULL, "%i" S_COLOR_WHITE " DEBUG: +gzoom\n", client->ps.weaponstate );
;1212:						client->ZoomTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 2736
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1213
;1213:						client->Zoomed = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 2740
ADDP4
CNSTI4 1
ASGNI4
line 1214
;1214:					}
line 1216
;1215:
;1216:			}
ADDRGP4 $510
JUMPV
LABELV $511
line 1218
;1217:			else
;1218:			{
line 1220
;1219:				
;1220:				if ((client->ps.weaponstate == WEAPON_FIRING) && ((level.time - client->ZoomTime) > 600)) 
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 3
NEI4 $510
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 2736
ADDP4
INDIRI4
SUBI4
CNSTI4 600
LEI4 $510
line 1221
;1221:				{
line 1222
;1222:					trap_SendServerCommand(client->ps.clientNum, "-gzoom");
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 $505
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1224
;1223:					//PrintMsg( NULL, "%i" S_COLOR_WHITE " DEBUG: -gzoom\n", client->ps.weaponstate );
;1224:					client->ps.weaponstate = WEAPON_CHARGING;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 4
ASGNI4
line 1225
;1225:					client->Zoomed = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 2740
ADDP4
CNSTI4 0
ASGNI4
line 1226
;1226:					client->ZoomTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 2736
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1228
;1227:
;1228:				}				
line 1230
;1229:				
;1230:			}
line 1232
;1231:	
;1232:		} else
LABELV $509
line 1233
;1233:		{
line 1247
;1234:
;1235:			/*
;1236:			if (client->ps.weaponstate == WEAPON_FIRING)
;1237:			{
;1238:				trap_SendServerCommand(client->ps.clientNum, "-gzoom");
;1239:				//PrintMsg( NULL, "%i" S_COLOR_WHITE " DEBUG: -gzoom\n", client->ps.weaponstate );
;1240:				client->ps.weaponstate = WEAPON_CHARGING;
;1241:				client->Zoomed = qfalse;
;1242:				client->ZoomTime = level.time;
;1243:
;1244:			}
;1245:			*/
;1246:			
;1247:		}
LABELV $510
line 1250
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
line 1252
;1251:
;1252:	}
LABELV $507
line 1281
;1253:
;1254:#ifdef MISSIONPACK
;1255:	// check for invulnerability expansion before doing the Pmove
;1256:	if (client->ps.powerups[PW_INVULNERABILITY] ) {
;1257:		if ( !(client->ps.pm_flags & PMF_INVULEXPAND) ) {
;1258:			vec3_t mins = { -42, -42, -42 };
;1259:			vec3_t maxs = { 42, 42, 42 };
;1260:			vec3_t oldmins, oldmaxs;
;1261:
;1262:			VectorCopy (ent->r.mins, oldmins);
;1263:			VectorCopy (ent->r.maxs, oldmaxs);
;1264:			// expand
;1265:			VectorCopy (mins, ent->r.mins);
;1266:			VectorCopy (maxs, ent->r.maxs);
;1267:			trap_LinkEntity(ent);
;1268:			// check if this would get anyone stuck in this player
;1269:			if ( !StuckInOtherClient(ent) ) {
;1270:				// set flag so the expanded size will be set in PM_CheckDuck
;1271:				client->ps.pm_flags |= PMF_INVULEXPAND;
;1272:			}
;1273:			// set back
;1274:			VectorCopy (oldmins, ent->r.mins);
;1275:			VectorCopy (oldmaxs, ent->r.maxs);
;1276:			trap_LinkEntity(ent);
;1277:		}
;1278:	}
;1279:#endif
;1280:
;1281:	pm.ps = &client->ps;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 1282
;1282:	pm.cmd = *ucmd;
ADDRLP4 4+4
ADDRLP4 236
INDIRP4
INDIRB
ASGNB 24
line 1283
;1283:	if ( pm.ps->pm_type == PM_DEAD ) {
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $523
line 1284
;1284:		pm.tracemask = MASK_PLAYERSOLID & ~CONTENTS_BODY;
ADDRLP4 4+28
CNSTI4 65537
ASGNI4
line 1285
;1285:	}
ADDRGP4 $524
JUMPV
LABELV $523
line 1286
;1286:	else if ( ent->r.svFlags & SVF_BOT ) {
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $526
line 1287
;1287:		pm.tracemask = MASK_PLAYERSOLID | CONTENTS_BOTCLIP;
ADDRLP4 4+28
CNSTI4 37814273
ASGNI4
line 1288
;1288:	}
ADDRGP4 $527
JUMPV
LABELV $526
line 1289
;1289:	else {
line 1290
;1290:		pm.tracemask = MASK_PLAYERSOLID;
ADDRLP4 4+28
CNSTI4 33619969
ASGNI4
line 1291
;1291:	}
LABELV $527
LABELV $524
line 1292
;1292:	pm.trace = trap_Trace;
ADDRLP4 4+224
ADDRGP4 trap_Trace
ASGNP4
line 1293
;1293:	pm.pointcontents = trap_PointContents;
ADDRLP4 4+228
ADDRGP4 trap_PointContents
ASGNP4
line 1294
;1294:	pm.debugLevel = g_debugMove.integer;
ADDRLP4 4+32
ADDRGP4 g_debugMove+12
INDIRI4
ASGNI4
line 1295
;1295:	pm.noFootsteps = ( g_dmflags.integer & DF_NO_FOOTSTEPS ) > 0;
ADDRGP4 g_dmflags+12
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
LEI4 $537
ADDRLP4 304
CNSTI4 1
ASGNI4
ADDRGP4 $538
JUMPV
LABELV $537
ADDRLP4 304
CNSTI4 0
ASGNI4
LABELV $538
ADDRLP4 4+36
ADDRLP4 304
INDIRI4
ASGNI4
line 1297
;1296:
;1297:	pm.pmove_fixed = pmove_fixed.integer | client->pers.pmoveFixed;
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
line 1298
;1298:	pm.pmove_msec = pmove_msec.integer;
ADDRLP4 4+220
ADDRGP4 pmove_msec+12
INDIRI4
ASGNI4
line 1300
;1299:
;1300:	VectorCopy( client->ps.origin, client->oldOrigin );
ADDRLP4 0
INDIRP4
CNSTI4 2616
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1317
;1301:
;1302:#ifdef MISSIONPACK
;1303:		if (level.intermissionQueued != 0 && g_singlePlayer.integer) {
;1304:			if ( level.time - level.intermissionQueued >= 1000  ) {
;1305:				pm.cmd.buttons = 0;
;1306:				pm.cmd.forwardmove = 0;
;1307:				pm.cmd.rightmove = 0;
;1308:				pm.cmd.upmove = 0;
;1309:				if ( level.time - level.intermissionQueued >= 2000 && level.time - level.intermissionQueued <= 2500 ) {
;1310:					trap_SendConsoleCommand( EXEC_APPEND, "centerview\n");
;1311:				}
;1312:				ent->client->ps.pm_type = PM_SPINTERMISSION;
;1313:			}
;1314:		}
;1315:		Pmove (&pm);
;1316:#else
;1317:		Pmove (&pm);
ADDRLP4 4
ARGP4
ADDRGP4 Pmove
CALLV
pop
line 1321
;1318:#endif
;1319:
;1320:	// save results of pmove
;1321:	if ( ent->client->ps.eventSequence != oldEventSequence ) {
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
EQI4 $543
line 1322
;1322:		ent->eventTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1323
;1323:	}
LABELV $543
line 1336
;1324:
;1325://unlagged - smooth clients #2
;1326:	// clients no longer do extrapolation if cg_smoothClients is 1, because
;1327:	// skip correction is all handled server-side now
;1328:	// since that's the case, it makes no sense to store the extra info
;1329:	// in the client's snapshot entity, so let's save a little bandwidth
;1330:/*
;1331:	if (g_smoothClients.integer) {
;1332:		BG_PlayerStateToEntityStateExtraPolate( &ent->client->ps, &ent->s, ent->client->ps.commandTime, qtrue );
;1333:	}
;1334:	else {
;1335:*/
;1336:		BG_PlayerStateToEntityState( &ent->client->ps, &ent->s, qtrue );
ADDRLP4 312
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 312
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 312
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 1340
;1337://	}
;1338://unlagged - smooth clients #2
;1339:
;1340:	SendPendingPredictableEvents( &ent->client->ps );
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 SendPendingPredictableEvents
CALLV
pop
line 1349
;1341:
;1342:	/* - Shafe - Trep - Commented out for Offhand Grapple
;1343:	if ( !( ent->client->ps.eFlags & EF_FIRING ) ) {
;1344:		client->fireHeld = qfalse;		// for grapple
;1345:	}
;1346:	*/
;1347:
;1348:	// Shafe - Trep  - Offhand Grappling Hook
;1349:	if (g_allowGrapple.integer == 1) { // Not in CTF Games
ADDRGP4 g_allowGrapple+12
INDIRI4
CNSTI4 1
NEI4 $546
line 1350
;1350:		if ( (pm.cmd.buttons & 64)  && ent->client->ps.pm_type != PM_DEAD && !ent->client->hookhasbeenfired)
ADDRLP4 316
CNSTI4 0
ASGNI4
ADDRLP4 4+4+16
INDIRI4
CNSTI4 64
BANDI4
ADDRLP4 316
INDIRI4
EQI4 $549
ADDRLP4 320
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 320
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $549
ADDRLP4 320
INDIRP4
CNSTI4 2712
ADDP4
INDIRI4
ADDRLP4 316
INDIRI4
NEI4 $549
line 1351
;1351:		{
line 1353
;1352:		
;1353:			Weapon_GrapplingHook_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_GrapplingHook_Fire
CALLV
pop
line 1354
;1354:			ent->client->hookhasbeenfired = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2712
ADDP4
CNSTI4 1
ASGNI4
line 1355
;1355:		}
LABELV $549
line 1356
;1356:		if ( !(pm.cmd.buttons & 64)  &&	ent->client->ps.pm_type != PM_DEAD && ent->client->hookhasbeenfired && ent->client->fireHeld)
ADDRLP4 324
CNSTI4 0
ASGNI4
ADDRLP4 4+4+16
INDIRI4
CNSTI4 64
BANDI4
ADDRLP4 324
INDIRI4
NEI4 $553
ADDRLP4 328
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 328
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $553
ADDRLP4 328
INDIRP4
CNSTI4 2712
ADDP4
INDIRI4
ADDRLP4 324
INDIRI4
EQI4 $553
ADDRLP4 328
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
ADDRLP4 324
INDIRI4
EQI4 $553
line 1357
;1357:		{
line 1358
;1358:			ent->client->fireHeld = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2704
ADDP4
CNSTI4 0
ASGNI4
line 1359
;1359:			ent->client->hookhasbeenfired = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2712
ADDP4
CNSTI4 0
ASGNI4
line 1360
;1360:		}
LABELV $553
line 1362
;1361:
;1362:		if ( client->hook && client->fireHeld == qfalse )
ADDRLP4 0
INDIRP4
CNSTI4 2708
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $557
ADDRLP4 0
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
CNSTI4 0
NEI4 $557
line 1363
;1363:		{
line 1364
;1364:			Weapon_HookFree(client->hook);
ADDRLP4 0
INDIRP4
CNSTI4 2708
ADDP4
INDIRP4
ARGP4
ADDRGP4 Weapon_HookFree
CALLV
pop
line 1365
;1365:		}
LABELV $557
line 1366
;1366:	}
LABELV $546
line 1370
;1367:	// End Shafe - Offhand Grapple //////////////////////////////////////////////
;1368:	
;1369:	// use the snapped origin for linking so it matches client predicted versions
;1370:	VectorCopy( ent->s.pos.trBase, ent->r.currentOrigin );
ADDRLP4 316
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 316
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 316
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1372
;1371:
;1372:	VectorCopy (pm.mins, ent->r.mins);
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRLP4 4+180
INDIRB
ASGNB 12
line 1373
;1373:	VectorCopy (pm.maxs, ent->r.maxs);
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
ADDRLP4 4+192
INDIRB
ASGNB 12
line 1375
;1374:
;1375:	ent->waterlevel = pm.waterlevel;
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
ADDRLP4 4+208
INDIRI4
ASGNI4
line 1376
;1376:	ent->watertype = pm.watertype;
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ADDRLP4 4+204
INDIRI4
ASGNI4
line 1382
;1377:
;1378:	// TryUse Here
;1379:	
;1380:
;1381:	// execute client events
;1382:	ClientEvents( ent, oldEventSequence );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 244
INDIRI4
ARGI4
ADDRGP4 ClientEvents
CALLV
pop
line 1385
;1383:
;1384:	// link entity now, after any personal teleporters have been used
;1385:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1386
;1386:	if ( !ent->client->noclip ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2600
ADDP4
INDIRI4
CNSTI4 0
NEI4 $563
line 1387
;1387:		G_TouchTriggers( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_TouchTriggers
CALLV
pop
line 1388
;1388:	}
LABELV $563
line 1391
;1389:
;1390:	// NOTE: now copy the exact origin over otherwise clients can be snapped into solid
;1391:	VectorCopy( ent->client->ps.origin, ent->r.currentOrigin );
ADDRLP4 320
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 320
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 320
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1394
;1392:
;1393:	//test for solid areas in the AAS file
;1394:	BotTestAAS(ent->r.currentOrigin);
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
ADDRGP4 BotTestAAS
CALLV
pop
line 1397
;1395:
;1396:	// touch other objects
;1397:	ClientImpacts( ent, &pm );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 ClientImpacts
CALLV
pop
line 1400
;1398:
;1399:	// save results of triggers and client events
;1400:	if (ent->client->ps.eventSequence != oldEventSequence) {
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
EQI4 $565
line 1401
;1401:		ent->eventTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1402
;1402:	}
LABELV $565
line 1405
;1403:
;1404:	// swap and latch button actions
;1405:	client->oldbuttons = client->buttons;
ADDRLP4 0
INDIRP4
CNSTI4 2608
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 2604
ADDP4
INDIRI4
ASGNI4
line 1406
;1406:	client->buttons = ucmd->buttons;
ADDRLP4 0
INDIRP4
CNSTI4 2604
ADDP4
ADDRLP4 236
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 1407
;1407:	client->latched_buttons |= client->buttons & ~client->oldbuttons;
ADDRLP4 332
ADDRLP4 0
INDIRP4
CNSTI4 2612
ADDP4
ASGNP4
ADDRLP4 332
INDIRP4
ADDRLP4 332
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 2604
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 2608
ADDP4
INDIRI4
BCOMI4
BANDI4
BORI4
ASGNI4
line 1410
;1408:
;1409:	// check for respawning
;1410:	if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $568
line 1412
;1411:		// wait for the attack button to be pressed
;1412:		if ( level.time > client->respawnTime ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 2680
ADDP4
INDIRI4
LEI4 $401
line 1414
;1413:			// forcerespawn is to prevent users from waiting out powerups
;1414:			if ( g_forcerespawn.integer > 0 && 
ADDRGP4 g_forcerespawn+12
INDIRI4
CNSTI4 0
LEI4 $573
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 2680
ADDP4
INDIRI4
SUBI4
CNSTI4 1000
ADDRGP4 g_forcerespawn+12
INDIRI4
MULI4
LEI4 $573
line 1415
;1415:				( level.time - client->respawnTime ) > g_forcerespawn.integer * 1000 ) {
line 1416
;1416:				respawn( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 1417
;1417:				return;
ADDRGP4 $401
JUMPV
LABELV $573
line 1421
;1418:			}
;1419:		
;1420:			// pressing attack or use is the normal respawn method
;1421:			if ( ucmd->buttons & ( BUTTON_ATTACK | BUTTON_USE_HOLDABLE ) ) {
ADDRLP4 236
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 5
BANDI4
CNSTI4 0
EQI4 $401
line 1422
;1422:				respawn( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 1423
;1423:			}
line 1424
;1424:		}
line 1425
;1425:		return;
ADDRGP4 $401
JUMPV
LABELV $568
line 1429
;1426:	}
;1427:
;1428:	// perform once-a-second actions
;1429:	ClientTimerActions( ent, msec );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 240
INDIRI4
ARGI4
ADDRGP4 ClientTimerActions
CALLV
pop
line 1430
;1430:}
LABELV $401
endproc ClientThink_real 336 12
export ClientThink
proc ClientThink 8 8
line 1442
;1431:
;1432:
;1433:
;1434:
;1435:/*
;1436:==================
;1437:ClientThink
;1438:
;1439:A new command has arrived from the client
;1440:==================
;1441:*/
;1442:void ClientThink( int clientNum ) {
line 1445
;1443:	gentity_t *ent;
;1444:
;1445:	ent = g_entities + clientNum;
ADDRLP4 0
CNSTI4 924
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1446
;1446:	trap_GetUsercmd( clientNum, &ent->client->pers.cmd );
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
line 1457
;1447:
;1448://unlagged - smooth clients #1
;1449:	// this is handled differently now
;1450:/*
;1451:	// mark the time we got info, so we can display the
;1452:	// phone jack if they don't get any for a while
;1453:	ent->client->lastCmdTime = level.time;
;1454:*/
;1455://unlagged - smooth clients #1
;1456:
;1457:	if ( !(ent->r.svFlags & SVF_BOT) && !g_synchronousClients.integer ) {
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
NEI4 $581
ADDRGP4 g_synchronousClients+12
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $581
line 1458
;1458:		ClientThink_real( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ClientThink_real
CALLV
pop
line 1459
;1459:	}
LABELV $581
line 1460
;1460:}
LABELV $580
endproc ClientThink 8 8
export G_RunClient
proc G_RunClient 4 4
line 1463
;1461:
;1462:
;1463:void G_RunClient( gentity_t *ent ) {
line 1464
;1464:	if ( !(ent->r.svFlags & SVF_BOT) && !g_synchronousClients.integer ) {
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
NEI4 $585
ADDRGP4 g_synchronousClients+12
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $585
line 1465
;1465:		return;
ADDRGP4 $584
JUMPV
LABELV $585
line 1467
;1466:	}
;1467:	ent->client->pers.cmd.serverTime = level.time;
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
line 1468
;1468:	ClientThink_real( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientThink_real
CALLV
pop
line 1469
;1469:}
LABELV $584
endproc G_RunClient 4 4
export SpectatorClientEndFrame
proc SpectatorClientEndFrame 24 4
line 1478
;1470:
;1471:
;1472:/*
;1473:==================
;1474:SpectatorClientEndFrame
;1475:
;1476:==================
;1477:*/
;1478:void SpectatorClientEndFrame( gentity_t *ent ) {
line 1482
;1479:	gclient_t	*cl;
;1480:
;1481:	// if we are doing a chase cam or a remote view, grab the latest info
;1482:	if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2572
ADDP4
INDIRI4
CNSTI4 2
NEI4 $590
line 1485
;1483:		int		clientNum, flags;
;1484:
;1485:		clientNum = ent->client->sess.spectatorClient;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2576
ADDP4
INDIRI4
ASGNI4
line 1488
;1486:
;1487:		// team follow1 and team follow2 go to whatever clients are playing
;1488:		if ( clientNum == -1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
NEI4 $592
line 1489
;1489:			clientNum = level.follow1;
ADDRLP4 4
ADDRGP4 level+352
INDIRI4
ASGNI4
line 1490
;1490:		} else if ( clientNum == -2 ) {
ADDRGP4 $593
JUMPV
LABELV $592
ADDRLP4 4
INDIRI4
CNSTI4 -2
NEI4 $595
line 1491
;1491:			clientNum = level.follow2;
ADDRLP4 4
ADDRGP4 level+356
INDIRI4
ASGNI4
line 1492
;1492:		}
LABELV $595
LABELV $593
line 1493
;1493:		if ( clientNum >= 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $598
line 1494
;1494:			cl = &level.clients[ clientNum ];
ADDRLP4 0
CNSTI4 3492
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1495
;1495:			if ( cl->pers.connected == CON_CONNECTED && cl->sess.sessionTeam != TEAM_SPECTATOR ) {
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
NEI4 $600
ADDRLP4 12
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
CNSTI4 3
EQI4 $600
line 1496
;1496:				flags = (cl->ps.eFlags & ~(EF_VOTED | EF_TEAMVOTED)) | (ent->client->ps.eFlags & (EF_VOTED | EF_TEAMVOTED));
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
line 1497
;1497:				ent->client->ps = cl->ps;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ADDRLP4 0
INDIRP4
INDIRB
ASGNB 468
line 1498
;1498:				ent->client->ps.pm_flags |= PMF_FOLLOW;
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
line 1499
;1499:				ent->client->ps.eFlags = flags;
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
line 1500
;1500:				return;
ADDRGP4 $589
JUMPV
LABELV $600
line 1501
;1501:			} else {
line 1503
;1502:				// drop them to free spectators unless they are dedicated camera followers
;1503:				if ( ent->client->sess.spectatorClient >= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2576
ADDP4
INDIRI4
CNSTI4 0
LTI4 $602
line 1504
;1504:					ent->client->sess.spectatorState = SPECTATOR_FREE;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2572
ADDP4
CNSTI4 1
ASGNI4
line 1505
;1505:					ClientBegin( ent->client - level.clients );
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
CNSTI4 3492
DIVI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 1506
;1506:				}
LABELV $602
line 1507
;1507:			}
line 1508
;1508:		}
LABELV $598
line 1509
;1509:	}
LABELV $590
line 1511
;1510:
;1511:	if ( ent->client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2572
ADDP4
INDIRI4
CNSTI4 3
NEI4 $604
line 1512
;1512:		ent->client->ps.pm_flags |= PMF_SCOREBOARD;
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
line 1513
;1513:	} else {
ADDRGP4 $605
JUMPV
LABELV $604
line 1514
;1514:		ent->client->ps.pm_flags &= ~PMF_SCOREBOARD;
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
line 1515
;1515:	}
LABELV $605
line 1516
;1516:}
LABELV $589
endproc SpectatorClientEndFrame 24 4
export ClientEndFrame
proc ClientEndFrame 52 12
line 1527
;1517:
;1518:/*
;1519:==============
;1520:ClientEndFrame
;1521:
;1522:Called at the end of each server frame for each connected client
;1523:A fast client will have multiple ClientThink for each ClientEdFrame,
;1524:while a slow client may have multiple ClientEndFrame between ClientThink.
;1525:==============
;1526:*/
;1527:void ClientEndFrame( gentity_t *ent ) {
line 1535
;1528:	int			i;
;1529:	clientPersistant_t	*pers;
;1530:
;1531://unlagged - smooth clients #1
;1532:	int frames;
;1533://unlagged - smooth clients #1
;1534:
;1535:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
CNSTI4 3
NEI4 $607
line 1536
;1536:		SpectatorClientEndFrame( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SpectatorClientEndFrame
CALLV
pop
line 1537
;1537:		return;
ADDRGP4 $606
JUMPV
LABELV $607
line 1540
;1538:	}
;1539:
;1540:	pers = &ent->client->pers;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 468
ADDP4
ASGNP4
line 1543
;1541:
;1542:	// turn off any expired powerups
;1543:	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $609
line 1544
;1544:		if ( ent->client->ps.powerups[ i ] < level.time ) {
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
GEI4 $613
line 1545
;1545:			ent->client->ps.powerups[ i ] = 0;
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
line 1546
;1546:		}
LABELV $613
line 1547
;1547:	}
LABELV $610
line 1543
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $609
line 1580
;1548:
;1549:#ifdef MISSIONPACK
;1550:	// set powerup for player animation
;1551:	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;1552:		ent->client->ps.powerups[PW_GUARD] = level.time;
;1553:	}
;1554:	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_SCOUT ) {
;1555:		ent->client->ps.powerups[PW_SCOUT] = level.time;
;1556:	}
;1557:	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_DOUBLER ) {
;1558:		ent->client->ps.powerups[PW_DOUBLER] = level.time;
;1559:	}
;1560:	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_AMMOREGEN ) {
;1561:		ent->client->ps.powerups[PW_AMMOREGEN] = level.time;
;1562:	}
;1563:	if ( ent->client->invulnerabilityTime > level.time ) {
;1564:		ent->client->ps.powerups[PW_INVULNERABILITY] = level.time;
;1565:	}
;1566:#endif
;1567:
;1568:	// save network bandwidth
;1569:#if 0
;1570:	if ( !g_synchronousClients->integer && ent->client->ps.pm_type == PM_NORMAL ) {
;1571:		// FIXME: this must change eventually for non-sync demo recording
;1572:		VectorClear( ent->client->ps.viewangles );
;1573:	}
;1574:#endif
;1575:
;1576:	//
;1577:	// If the end of unit layout is displayed, don't give
;1578:	// the player any normal movement attributes
;1579:	//
;1580:	if ( level.intermissiontime ) {
ADDRGP4 level+9140
INDIRI4
CNSTI4 0
EQI4 $616
line 1581
;1581:		return;
ADDRGP4 $606
JUMPV
LABELV $616
line 1585
;1582:	}
;1583:
;1584:	// burn from lava, etc
;1585:	P_WorldEffects (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 P_WorldEffects
CALLV
pop
line 1588
;1586:
;1587:	// apply all the damage taken this frame
;1588:	P_DamageFeedback (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 P_DamageFeedback
CALLV
pop
line 1602
;1589:
;1590://unlagged - smooth clients #1
;1591:	// this is handled differently now
;1592:/*
;1593:	// add the EF_CONNECTION flag if we haven't gotten commands recently
;1594:	if ( level.time - ent->client->lastCmdTime > 1000 ) {
;1595:		ent->client->ps.eFlags |= EF_CONNECTION;
;1596:	} else {
;1597:		ent->client->ps.eFlags &= ~EF_CONNECTION;
;1598:	}
;1599:*/
;1600://unlagged - smooth clients #1
;1601:
;1602:	ent->client->ps.stats[STAT_HEALTH] = ent->health;	// FIXME: get rid of ent->health...
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
CNSTI4 756
ADDP4
INDIRI4
ASGNI4
line 1604
;1603:
;1604:	G_SetClientSound (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_SetClientSound
CALLV
pop
line 1618
;1605:
;1606:	// set the latest information
;1607://unlagged - smooth clients #2
;1608:	// clients no longer do extrapolation if cg_smoothClients is 1, because
;1609:	// skip correction is all handled server-side now
;1610:	// since that's the case, it makes no sense to store the extra info
;1611:	// in the client's snapshot entity, so let's save a little bandwidth
;1612:/*
;1613:	if (g_smoothClients.integer) {
;1614:		BG_PlayerStateToEntityStateExtraPolate( &ent->client->ps, &ent->s, ent->client->ps.commandTime, qtrue );
;1615:	}
;1616:	else {
;1617:*/
;1618:		BG_PlayerStateToEntityState( &ent->client->ps, &ent->s, qtrue );
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
line 1622
;1619://	}
;1620://unlagged - smooth clients #2
;1621:
;1622:	SendPendingPredictableEvents( &ent->client->ps );
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 SendPendingPredictableEvents
CALLV
pop
line 1626
;1623:
;1624://unlagged - smooth clients #1
;1625:	// mark as not missing updates initially
;1626:	ent->client->ps.eFlags &= ~EF_CONNECTION;
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
line 1629
;1627:
;1628:	// see how many frames the client has missed
;1629:	frames = level.framenum - ent->client->lastUpdateFrame - 1;
ADDRLP4 4
ADDRGP4 level+28
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 3488
ADDP4
INDIRI4
SUBI4
CNSTI4 1
SUBI4
ASGNI4
line 1632
;1630:
;1631:	// don't extrapolate more than two frames
;1632:	if ( frames > 2 ) {
ADDRLP4 4
INDIRI4
CNSTI4 2
LEI4 $620
line 1633
;1633:		frames = 2;
ADDRLP4 4
CNSTI4 2
ASGNI4
line 1636
;1634:
;1635:		// if they missed more than two in a row, show the phone jack
;1636:		ent->client->ps.eFlags |= EF_CONNECTION;
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
line 1637
;1637:		ent->s.eFlags |= EF_CONNECTION;
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
line 1638
;1638:	}
LABELV $620
line 1641
;1639:
;1640:	// did the client miss any frames?
;1641:	if ( frames > 0 && g_smoothClients.integer ) {
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $622
ADDRGP4 g_smoothClients+12
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $622
line 1643
;1642:		// yep, missed one or more, so extrapolate the player's movement
;1643:		G_PredictPlayerMove( ent, (float)frames / sv_fps.integer );
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
line 1645
;1644:		// save network bandwidth
;1645:		SnapVector( ent->s.pos.trBase );
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
line 1646
;1646:	}
LABELV $622
line 1651
;1647://unlagged - smooth clients #1
;1648:
;1649://unlagged - backward reconciliation #1
;1650:	// store the client's position for backward reconciliation later
;1651:	G_StoreHistory( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_StoreHistory
CALLV
pop
line 1657
;1652://unlagged - backward reconciliation #1
;1653:
;1654:	// set the bit for the reachability area the client is currently in
;1655://	i = trap_AAS_PointReachabilityAreaIndex( ent->client->ps.origin );
;1656://	ent->client->areabits[i >> 3] |= 1 << (i & 7);
;1657:}
LABELV $606
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
import fire_mg
import fire_turret
import fire_alt_gata
import fire_grapple
import fire_bfg
import fire_rocket
import fire_flame
import fire_alt_rocket
import fire_altgrenade
import fire_bomb
import fire_pdgrenade
import fire_grenade
import fire_plasma2
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
import G_ExplodeBomb
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
LABELV $516
byte 1 43
byte 1 103
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $505
byte 1 45
byte 1 103
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $453
byte 1 51
byte 1 51
byte 1 0
align 1
LABELV $449
byte 1 56
byte 1 0
align 1
LABELV $448
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
LABELV $362
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
LABELV $357
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
LABELV $352
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
LABELV $347
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
LABELV $342
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
LABELV $337
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
LABELV $329
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
LABELV $324
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
LABELV $319
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
LABELV $314
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
LABELV $309
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
LABELV $304
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
LABELV $226
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
LABELV $224
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
LABELV $214
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
LABELV $210
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
