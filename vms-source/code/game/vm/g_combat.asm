export BroadCastSound
code
proc BroadCastSound 36 8
file "../g_combat.c"
line 9
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// g_combat.c
;4:
;5:#include "g_local.h"
;6:
;7:
;8:// Shafe - Trep - Utility Function - Move this!  
;9:void BroadCastSound(char *path) {
line 12
;10:	gentity_t*te;
;11:	vec3_t origin;
;12:	if(!strlen(path))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $56
line 13
;13:	return;
ADDRGP4 $55
JUMPV
LABELV $56
line 14
;14:	origin[0] = origin[1] = origin[2] = 0;
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 15
;15:	te = G_TempEntity(origin, EV_GLOBAL_SOUND);
ADDRLP4 0
ARGP4
CNSTI4 48
ARGI4
ADDRLP4 24
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 24
INDIRP4
ASGNP4
line 16
;16:	te->s.eventParm = G_SoundIndex(path);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 17
;17:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 32
ADDRLP4 12
INDIRP4
CNSTI4 432
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 18
;18:}
LABELV $55
endproc BroadCastSound 36 8
export ScorePlum
proc ScorePlum 12 8
line 26
;19:
;20:
;21:/*
;22:============
;23:ScorePlum
;24:============
;25:*/
;26:void ScorePlum( gentity_t *ent, vec3_t origin, int score ) {
line 29
;27:	gentity_t *plum;
;28:
;29:	plum = G_TempEntity( origin, EV_SCOREPLUM );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 69
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 31
;30:	// only send this temp entity to a single client
;31:	plum->r.svFlags |= SVF_SINGLECLIENT;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 32
;32:	plum->r.singleClient = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 34
;33:	//
;34:	plum->s.otherEntityNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 35
;35:	plum->s.time = score;
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 36
;36:}
LABELV $60
endproc ScorePlum 12 8
export AddScore
proc AddScore 12 12
line 45
;37:
;38:/*
;39:============
;40:AddScore
;41:
;42:Adds score to both the client and his team
;43:============
;44:*/
;45:void AddScore( gentity_t *ent, vec3_t origin, int score ) {
line 47
;46:
;47:		if ( !ent->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $62
line 48
;48:			return;
ADDRGP4 $61
JUMPV
LABELV $62
line 51
;49:		}
;50:		// no scoring during pre-match warmup
;51:		if ( level.warmupTime ) {
ADDRGP4 level+16
INDIRI4
CNSTI4 0
EQI4 $64
line 52
;52:			return;
ADDRGP4 $61
JUMPV
LABELV $64
line 55
;53:		}
;54:		// show score plum
;55:		ScorePlum(ent, origin, score);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 ScorePlum
CALLV
pop
line 57
;56:		//
;57:		ent->client->ps.persistant[PERS_SCORE] += score;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 248
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ASGNI4
line 58
;58:		ent->client->pers.TrueScore = ent->client->ps.persistant[PERS_SCORE];
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 2488
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 60
;59:
;60:	if (g_GameMode.integer != 3)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 3
EQI4 $67
line 61
;61:	{
line 62
;62:		if ( g_gametype.integer == GT_TEAM )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $70
line 63
;63:			level.teamScores[ ent->client->ps.persistant[PERS_TEAM] ] += score;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+52
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ASGNI4
LABELV $70
line 65
;64:	
;65:	}
LABELV $67
line 66
;66:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 67
;67:}
LABELV $61
endproc AddScore 12 12
export TossClientItems
proc TossClientItems 36 12
line 76
;68:
;69:/*
;70:=================
;71:TossClientItems
;72:
;73:Toss the weapon and powerups for the killed player
;74:=================
;75:*/
;76:void TossClientItems( gentity_t *self ) {
line 84
;77:	gitem_t		*item;
;78:	int			weapon;
;79:	float		angle;
;80:	int			i;
;81:	gentity_t	*drop;
;82:
;83:	// drop the weapon if not a gauntlet or machinegun
;84:	weapon = self->s.weapon;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 92
;85:
;86:	// make a special check to see if they are changing to a new
;87:	// weapon that isn't the mg or gauntlet.  Without this, a client
;88:	// can pick up a weapon, be killed, and not drop the weapon because
;89:	// their weapon change hasn't completed yet and they are still holding the MG.
;90:	
;91:
;92:		if ( weapon == WP_MACHINEGUN || weapon == WP_GRAPPLING_HOOK ) 
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $77
ADDRLP4 12
INDIRI4
CNSTI4 10
NEI4 $75
LABELV $77
line 93
;93:		{
line 94
;94:			if ( self->client->ps.weaponstate == WEAPON_DROPPING ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $78
line 95
;95:				weapon = self->client->pers.cmd.weapon;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 492
ADDP4
INDIRU1
CVUI4 1
ASGNI4
line 96
;96:			}
LABELV $78
line 97
;97:			if ( !( self->client->ps.stats[STAT_WEAPONS] & ( 1 << weapon ) ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 12
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $80
line 98
;98:				weapon = WP_NONE;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 99
;99:			}
LABELV $80
line 100
;100:		}
LABELV $75
line 103
;101:
;102:	// Shafe - Trep - Dont drop weapons In Instagib -- 
;103:	if (g_instagib.integer == 0)
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 0
NEI4 $82
line 104
;104:	{
line 106
;105:		
;106:		if ( weapon > WP_MACHINEGUN && weapon != WP_GRAPPLING_HOOK && self->client->ps.ammo[ weapon ] ) 
ADDRLP4 28
CNSTI4 2
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 28
INDIRI4
LEI4 $85
ADDRLP4 12
INDIRI4
CNSTI4 10
EQI4 $85
ADDRLP4 12
INDIRI4
ADDRLP4 28
INDIRI4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $85
line 107
;107:		{
line 109
;108:			// find the item type for this weapon
;109:			item = BG_FindItemForWeapon( weapon );
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 32
INDIRP4
ASGNP4
line 112
;110:	
;111:			// spawn the item
;112:			Drop_Item( self, item, 0 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Drop_Item
CALLP4
pop
line 113
;113:		} else 
ADDRGP4 $86
JUMPV
LABELV $85
line 114
;114:		{
line 116
;115:			// Else if it's arsenal or survival drop it anyway.
;116:			if (g_GameMode.integer == 2 || g_GameMode.integer == 1)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
EQI4 $91
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
NEI4 $87
LABELV $91
line 117
;117:			{
line 119
;118:				// find the item type for this weapon
;119:				item = BG_FindItemForWeapon( weapon );
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 32
INDIRP4
ASGNP4
line 122
;120:	
;121:				// spawn the item
;122:				Drop_Item( self, item, 0 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Drop_Item
CALLP4
pop
line 124
;123:
;124:			}
LABELV $87
line 125
;125:		}
LABELV $86
line 126
;126:	} // End Shafe - Trep instagib
LABELV $82
line 132
;127:
;128:
;129:	
;130:
;131:	// drop all the powerups if not in teamplay
;132:	if ( g_gametype.integer != GT_TEAM && g_GameMode.integer != 3 ) {
ADDRLP4 24
CNSTI4 3
ASGNI4
ADDRGP4 g_gametype+12
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $92
ADDRGP4 g_GameMode+12
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $92
line 133
;133:		angle = 45;
ADDRLP4 16
CNSTF4 1110704128
ASGNF4
line 134
;134:		for ( i = 1 ; i < PW_NUM_POWERUPS ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $96
line 135
;135:			if ( self->client->ps.powerups[ i ] > level.time ) {
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
LEI4 $100
line 136
;136:				item = BG_FindItemForPowerup( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
ASGNP4
line 137
;137:				if ( !item ) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $103
line 138
;138:					continue;
ADDRGP4 $97
JUMPV
LABELV $103
line 140
;139:				}
;140:				drop = Drop_Item( self, item, angle );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 Drop_Item
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
ASGNP4
line 142
;141:				// decide how many seconds it has left
;142:				drop->count = ( self->client->ps.powerups[ i ] - level.time ) / 1000;
ADDRLP4 4
INDIRP4
CNSTI4 776
ADDP4
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
SUBI4
CNSTI4 1000
DIVI4
ASGNI4
line 143
;143:				if ( drop->count < 1 ) {
ADDRLP4 4
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 1
GEI4 $106
line 144
;144:					drop->count = 1;
ADDRLP4 4
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 1
ASGNI4
line 145
;145:				}
LABELV $106
line 146
;146:				angle += 45;
ADDRLP4 16
ADDRLP4 16
INDIRF4
CNSTF4 1110704128
ADDF4
ASGNF4
line 147
;147:			}
LABELV $100
line 148
;148:		}
LABELV $97
line 134
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 15
LTI4 $96
line 149
;149:	}
LABELV $92
line 150
;150:}
LABELV $74
endproc TossClientItems 36 12
export LookAtKiller
proc LookAtKiller 52 4
line 240
;151:
;152:#ifdef MISSIONPACK
;153:
;154:/*
;155:=================
;156:TossClientCubes
;157:=================
;158:*/
;159:extern gentity_t	*neutralObelisk;
;160:
;161:void TossClientCubes( gentity_t *self ) {
;162:	gitem_t		*item;
;163:	gentity_t	*drop;
;164:	vec3_t		velocity;
;165:	vec3_t		angles;
;166:	vec3_t		origin;
;167:
;168:	self->client->ps.generic1 = 0;
;169:
;170:	// this should never happen but we should never
;171:	// get the server to crash due to skull being spawned in
;172:	if (!G_EntitiesFree()) {
;173:		return;
;174:	}
;175:
;176:	if( self->client->sess.sessionTeam == TEAM_RED ) {
;177:		item = BG_FindItem( "Red Cube" );
;178:	}
;179:	else {
;180:		item = BG_FindItem( "Blue Cube" );
;181:	}
;182:
;183:	angles[YAW] = (float)(level.time % 360);
;184:	angles[PITCH] = 0;	// always forward
;185:	angles[ROLL] = 0;
;186:
;187:	AngleVectors( angles, velocity, NULL, NULL );
;188:	VectorScale( velocity, 150, velocity );
;189:	velocity[2] += 200 + crandom() * 50;
;190:
;191:	if( neutralObelisk ) {
;192:		VectorCopy( neutralObelisk->s.pos.trBase, origin );
;193:		origin[2] += 44;
;194:	} else {
;195:		VectorClear( origin ) ;
;196:	}
;197:
;198:	drop = LaunchItem( item, origin, velocity );
;199:
;200:	drop->nextthink = level.time + g_cubeTimeout.integer * 1000;
;201:	drop->think = G_FreeEntity;
;202:	drop->spawnflags = self->client->sess.sessionTeam;
;203:}
;204:
;205:
;206:/*
;207:=================
;208:TossClientPersistantPowerups
;209:=================
;210:*/
;211:void TossClientPersistantPowerups( gentity_t *ent ) {
;212:	gentity_t	*powerup;
;213:
;214:	if( !ent->client ) {
;215:		return;
;216:	}
;217:
;218:	if( !ent->client->persistantPowerup ) {
;219:		return;
;220:	}
;221:
;222:	powerup = ent->client->persistantPowerup;
;223:
;224:	powerup->r.svFlags &= ~SVF_NOCLIENT;
;225:	powerup->s.eFlags &= ~EF_NODRAW;
;226:	powerup->r.contents = CONTENTS_TRIGGER;
;227:	trap_LinkEntity( powerup );
;228:
;229:	ent->client->ps.stats[STAT_PERSISTANT_POWERUP] = 0;
;230:	ent->client->persistantPowerup = NULL;
;231:}
;232:#endif
;233:
;234:
;235:/*
;236:==================
;237:LookAtKiller
;238:==================
;239:*/
;240:void LookAtKiller( gentity_t *self, gentity_t *inflictor, gentity_t *attacker ) {
line 244
;241:	vec3_t		dir;
;242:	vec3_t		angles;
;243:
;244:	if ( attacker && attacker != self ) {
ADDRLP4 24
ADDRFP4 8
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 24
INDIRU4
CNSTU4 0
EQU4 $109
ADDRLP4 24
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $109
line 245
;245:		VectorSubtract (attacker->s.pos.trBase, self->s.pos.trBase, dir);
ADDRLP4 28
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 32
CNSTI4 24
ASGNI4
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 40
CNSTI4 28
ASGNI4
ADDRLP4 0+4
ADDRLP4 28
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 44
CNSTI4 32
ASGNI4
ADDRLP4 0+8
ADDRFP4 8
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 246
;246:	} else if ( inflictor && inflictor != self ) {
ADDRGP4 $110
JUMPV
LABELV $109
ADDRLP4 28
ADDRFP4 4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 28
INDIRU4
CNSTU4 0
EQU4 $113
ADDRLP4 28
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $113
line 247
;247:		VectorSubtract (inflictor->s.pos.trBase, self->s.pos.trBase, dir);
ADDRLP4 32
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 24
ASGNI4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 44
CNSTI4 28
ASGNI4
ADDRLP4 0+4
ADDRLP4 32
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48
CNSTI4 32
ASGNI4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 248
;248:	} else {
ADDRGP4 $114
JUMPV
LABELV $113
line 249
;249:		self->client->ps.stats[STAT_DEAD_YAW] = self->s.angles[YAW];
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 250
;250:		return;
ADDRGP4 $108
JUMPV
LABELV $114
LABELV $110
line 253
;251:	}
;252:
;253:	self->client->ps.stats[STAT_DEAD_YAW] = vectoyaw ( dir );
ADDRLP4 0
ARGP4
ADDRLP4 32
ADDRGP4 vectoyaw
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 255
;254:
;255:	angles[YAW] = vectoyaw ( dir );
ADDRLP4 0
ARGP4
ADDRLP4 36
ADDRGP4 vectoyaw
CALLF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 36
INDIRF4
ASGNF4
line 256
;256:	angles[PITCH] = 0; 
ADDRLP4 12
CNSTF4 0
ASGNF4
line 257
;257:	angles[ROLL] = 0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 258
;258:}
LABELV $108
endproc LookAtKiller 52 4
export GibEntity
proc GibEntity 8 12
line 265
;259:
;260:/*
;261:==================
;262:GibEntity
;263:==================
;264:*/
;265:void GibEntity( gentity_t *self, int killer ) {
line 286
;266:	gentity_t *ent;
;267:	int i;
;268:
;269:	//if this entity still has kamikaze
;270:	/*
;271:	if (self->s.eFlags & EF_KAMIKAZE) {
;272:		// check if there is a kamikaze timer around for this owner
;273:		for (i = 0; i < MAX_GENTITIES; i++) {
;274:			ent = &g_entities[i];
;275:			if (!ent->inuse)
;276:				continue;
;277:			if (ent->activator != self)
;278:				continue;
;279:			if (strcmp(ent->classname, "kamikaze timer"))
;280:				continue;
;281:			G_FreeEntity(ent);
;282:			break;
;283:		}
;284:	}
;285:	*/
;286:	G_AddEvent( self, EV_GIB_PLAYER, killer );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 66
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 287
;287:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 0
ASGNI4
line 288
;288:	self->s.eType = ET_INVISIBLE;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 10
ASGNI4
line 289
;289:	self->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 0
ASGNI4
line 290
;290:}
LABELV $119
endproc GibEntity 8 12
export GibEntity_Headshot
proc GibEntity_Headshot 0 12
line 294
;291:
;292:
;293:// Shafe - Trep - Headshot Function
;294:void GibEntity_Headshot( gentity_t *self, int killer ) {
line 295
;295:	G_AddEvent( self, EV_GIB_PLAYER_HEADSHOT, 0 );
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
line 296
;296:	self->client->noHead = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2708
ADDP4
CNSTI4 1
ASGNI4
line 297
;297:}
LABELV $120
endproc GibEntity_Headshot 0 12
export body_die
proc body_die 0 8
line 305
;298:// Shafe - Trep - End Headshot Function
;299:
;300:/*
;301:==================
;302:body_die
;303:==================
;304:*/
;305:void body_die( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath ) {
line 306
;306:	if ( self->health > GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 -40
LEI4 $122
line 307
;307:		return;
ADDRGP4 $121
JUMPV
LABELV $122
line 309
;308:	}
;309:	if ( !g_blood.integer ) {
ADDRGP4 g_blood+12
INDIRI4
CNSTI4 0
NEI4 $124
line 310
;310:		self->health = GIB_HEALTH+1;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 -39
ASGNI4
line 311
;311:		return;
ADDRGP4 $121
JUMPV
LABELV $124
line 314
;312:	}
;313:
;314:	GibEntity( self, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 GibEntity
CALLV
pop
line 315
;315:}
LABELV $121
endproc body_die 0 8
export IsOutOfWeapons
proc IsOutOfWeapons 0 0
line 318
;316:
;317:// Shafe - Trep - Arsenal Mod
;318:extern qboolean IsOutOfWeapons( gentity_t *ent ) {
line 320
;319:
;320:	if (g_GameMode.integer != 1) { return qfalse; } // Do nothing unless it's arsenal
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
EQI4 $128
CNSTI4 0
RETI4
ADDRGP4 $127
JUMPV
LABELV $128
line 322
;321:
;322:	if (ent->client->pers.h_gauntlet) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2448
ADDP4
INDIRI4
CNSTI4 0
EQI4 $131
CNSTI4 0
RETI4
ADDRGP4 $127
JUMPV
LABELV $131
line 323
;323:	if (ent->client->pers.h_mg) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2452
ADDP4
INDIRI4
CNSTI4 0
EQI4 $133
CNSTI4 0
RETI4
ADDRGP4 $127
JUMPV
LABELV $133
line 324
;324:	if (ent->client->pers.h_sg) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2456
ADDP4
INDIRI4
CNSTI4 0
EQI4 $135
CNSTI4 0
RETI4
ADDRGP4 $127
JUMPV
LABELV $135
line 325
;325:	if (ent->client->pers.h_grenade) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2460
ADDP4
INDIRI4
CNSTI4 0
EQI4 $137
CNSTI4 0
RETI4
ADDRGP4 $127
JUMPV
LABELV $137
line 326
;326:	if (ent->client->pers.h_singcan) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2464
ADDP4
INDIRI4
CNSTI4 0
EQI4 $139
CNSTI4 0
RETI4
ADDRGP4 $127
JUMPV
LABELV $139
line 327
;327:	if (ent->client->pers.h_flame) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2468
ADDP4
INDIRI4
CNSTI4 0
EQI4 $141
CNSTI4 0
RETI4
ADDRGP4 $127
JUMPV
LABELV $141
line 328
;328:	if (ent->client->pers.h_gauss) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2472
ADDP4
INDIRI4
CNSTI4 0
EQI4 $143
CNSTI4 0
RETI4
ADDRGP4 $127
JUMPV
LABELV $143
line 329
;329:	if (ent->client->pers.h_plasma) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2476
ADDP4
INDIRI4
CNSTI4 0
EQI4 $145
CNSTI4 0
RETI4
ADDRGP4 $127
JUMPV
LABELV $145
line 330
;330:	if (ent->client->pers.h_bfg) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2480
ADDP4
INDIRI4
CNSTI4 0
EQI4 $147
CNSTI4 0
RETI4
ADDRGP4 $127
JUMPV
LABELV $147
line 332
;331:
;332:	return qtrue;
CNSTI4 1
RETI4
LABELV $127
endproc IsOutOfWeapons 0 0
data
export modNames
align 4
LABELV modNames
address $149
address $150
address $151
address $152
address $153
address $154
address $155
address $156
address $157
address $158
address $159
address $160
address $161
address $162
address $163
address $164
address $165
address $166
address $167
address $168
address $169
address $170
address $171
address $172
address $173
address $174
export CheckAlmostCapture
code
proc CheckAlmostCapture 56 12
line 407
;333:}
;334:
;335:
;336:// these are just for logging, the client prints its own messages
;337:char	*modNames[] = {
;338:	"MOD_UNKNOWN",
;339:	"MOD_SHOTGUN",
;340:	"MOD_GAUNTLET",
;341:	"MOD_MACHINEGUN",
;342:	"MOD_GRENADE",
;343:	"MOD_GRENADE_SPLASH",
;344:	"MOD_ROCKET",
;345:	"MOD_ROCKET_SPLASH",
;346:	"MOD_PLASMA",
;347:	"MOD_PLASMA_SPLASH",
;348:	"MOD_RAILGUN",
;349:	"MOD_LIGHTNING",
;350:	"MOD_BFG",
;351:	"MOD_BFG_SPLASH",
;352:	"MOD_WATER",
;353:	"MOD_SLIME",
;354:	"MOD_LAVA",
;355:	"MOD_CRUSH",
;356:	"MOD_TELEFRAG",
;357:	"MOD_FALLING",
;358:	"MOD_SUICIDE",
;359:	"MOD_TARGET_LASER",
;360:	"MOD_TRIGGER_HURT",
;361:	"MOD_HEADSHOT",		// Shafe - Trep - Headshot
;362:	"MOD_TURRET",
;363:#ifdef MISSIONPACK
;364:	"MOD_NAIL",
;365:	"MOD_CHAINGUN",
;366:	"MOD_PROXIMITY_MINE",
;367:#endif
;368:	"MOD_GRAPPLE"
;369:};
;370:
;371:#ifdef MISSIONPACK
;372:/*
;373:==================
;374:Kamikaze_DeathActivate
;375:==================
;376:*/
;377:void Kamikaze_DeathActivate( gentity_t *ent ) {
;378:	G_StartKamikaze(ent);
;379:	G_FreeEntity(ent);
;380:}
;381:
;382:/*
;383:==================
;384:Kamikaze_DeathTimer
;385:==================
;386:*/
;387:void Kamikaze_DeathTimer( gentity_t *self ) {
;388:	gentity_t *ent;
;389:
;390:	ent = G_Spawn();
;391:	ent->classname = "kamikaze timer";
;392:	VectorCopy(self->s.pos.trBase, ent->s.pos.trBase);
;393:	ent->r.svFlags |= SVF_NOCLIENT;
;394:	ent->think = Kamikaze_DeathActivate;
;395:	ent->nextthink = level.time + 5 * 1000;
;396:
;397:	ent->activator = self;
;398:}
;399:
;400:#endif
;401:
;402:/*
;403:==================
;404:CheckAlmostCapture
;405:==================
;406:*/
;407:void CheckAlmostCapture( gentity_t *self, gentity_t *attacker ) {
line 413
;408:	gentity_t	*ent;
;409:	vec3_t		dir;
;410:	char		*classname;
;411:
;412:	// if this player was carrying a flag
;413:	if ( self->client->ps.powerups[PW_REDFLAG] ||
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $179
ADDRLP4 20
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $179
ADDRLP4 20
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $176
LABELV $179
line 415
;414:		self->client->ps.powerups[PW_BLUEFLAG] ||
;415:		self->client->ps.powerups[PW_NEUTRALFLAG] ) {
line 417
;416:		// get the goal flag this player should have been going for
;417:		if ( g_gametype.integer == GT_CTF ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $180
line 418
;418:			if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $183
line 419
;419:				classname = "team_CTF_blueflag";
ADDRLP4 4
ADDRGP4 $185
ASGNP4
line 420
;420:			}
ADDRGP4 $181
JUMPV
LABELV $183
line 421
;421:			else {
line 422
;422:				classname = "team_CTF_redflag";
ADDRLP4 4
ADDRGP4 $186
ASGNP4
line 423
;423:			}
line 424
;424:		}
ADDRGP4 $181
JUMPV
LABELV $180
line 425
;425:		else {
line 426
;426:			if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $187
line 427
;427:				classname = "team_CTF_redflag";
ADDRLP4 4
ADDRGP4 $186
ASGNP4
line 428
;428:			}
ADDRGP4 $188
JUMPV
LABELV $187
line 429
;429:			else {
line 430
;430:				classname = "team_CTF_blueflag";
ADDRLP4 4
ADDRGP4 $185
ASGNP4
line 431
;431:			}
LABELV $188
line 432
;432:		}
LABELV $181
line 433
;433:		ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
LABELV $189
line 435
;434:		do
;435:		{
line 436
;436:			ent = G_Find(ent, FOFS(classname), classname);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 532
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 437
;437:		} while (ent && (ent->flags & FL_DROPPED_ITEM));
LABELV $190
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $192
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $189
LABELV $192
line 439
;438:		// if we found the destination flag and it's not picked up
;439:		if (ent && !(ent->r.svFlags & SVF_NOCLIENT) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $193
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $193
line 441
;440:			// if the player was *very* close
;441:			VectorSubtract( self->client->ps.origin, ent->s.origin, dir );
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 36
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+8
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 442
;442:			if ( VectorLength(dir) < 200 ) {
ADDRLP4 8
ARGP4
ADDRLP4 44
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 44
INDIRF4
CNSTF4 1128792064
GEF4 $197
line 443
;443:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 268
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 444
;444:				if ( attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $199
line 445
;445:					attacker->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
ADDRLP4 52
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 268
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 446
;446:				}
LABELV $199
line 447
;447:			}
LABELV $197
line 448
;448:		}
LABELV $193
line 449
;449:	}
LABELV $176
line 450
;450:}
LABELV $175
endproc CheckAlmostCapture 56 12
export CheckAlmostScored
proc CheckAlmostScored 44 12
line 457
;451:
;452:/*
;453:==================
;454:CheckAlmostScored
;455:==================
;456:*/
;457:void CheckAlmostScored( gentity_t *self, gentity_t *attacker ) {
line 463
;458:	gentity_t	*ent;
;459:	vec3_t		dir;
;460:	char		*classname;
;461:
;462:	// if the player was carrying cubes
;463:	if ( self->client->ps.generic1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
CNSTI4 0
EQI4 $202
line 464
;464:		if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 2
NEI4 $204
line 465
;465:			classname = "team_redobelisk";
ADDRLP4 16
ADDRGP4 $206
ASGNP4
line 466
;466:		}
ADDRGP4 $205
JUMPV
LABELV $204
line 467
;467:		else {
line 468
;468:			classname = "team_blueobelisk";
ADDRLP4 16
ADDRGP4 $207
ASGNP4
line 469
;469:		}
LABELV $205
line 470
;470:		ent = G_Find(NULL, FOFS(classname), classname);
CNSTP4 0
ARGP4
CNSTI4 532
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 472
;471:		// if we found the destination obelisk
;472:		if ( ent ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $208
line 474
;473:			// if the player was *very* close
;474:			VectorSubtract( self->client->ps.origin, ent->s.origin, dir );
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ASGNP4
ADDRLP4 28
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 24
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 475
;475:			if ( VectorLength(dir) < 200 ) {
ADDRLP4 4
ARGP4
ADDRLP4 32
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 32
INDIRF4
CNSTF4 1128792064
GEF4 $212
line 476
;476:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 268
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 477
;477:				if ( attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $214
line 478
;478:					attacker->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
ADDRLP4 40
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 268
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 479
;479:				}
LABELV $214
line 480
;480:			}
LABELV $212
line 481
;481:		}
LABELV $208
line 482
;482:	}
LABELV $202
line 483
;483:}
LABELV $201
endproc CheckAlmostScored 44 12
bss
align 4
LABELV $217
skip 4
align 4
LABELV $363
skip 4
export player_die
code
proc player_die 120 28
line 494
;484:
;485:
;486:
;487:/*
;488:==================
;489:player_die
;490:==================
;491:*/
;492:extern int CountSurvivors();
;493:
;494:void player_die( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath ) {
line 511
;495:	gentity_t	*ent;
;496:	int			anim;
;497:	int			contents;
;498:	int			killer;
;499:	int			i;
;500:	char		*killerName, *obit;
;501:	// Shafe - Trep - For Arsenal
;502:	int			tmpW;
;503:	int			tmpCnt;
;504:	static		int deathNum;
;505:	//gentity_t	*xte;
;506:
;507:
;508:
;509:
;510:
;511:	if ( self->client->ps.pm_type == PM_DEAD ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $218
line 512
;512:		return;
ADDRGP4 $216
JUMPV
LABELV $218
line 515
;513:	}
;514:
;515:	if ( level.intermissiontime ) {
ADDRGP4 level+9140
INDIRI4
CNSTI4 0
EQI4 $220
line 516
;516:		return;
ADDRGP4 $216
JUMPV
LABELV $220
line 525
;517:	}
;518:
;519:
;520:
;521:
;522:
;523://unlagged - backward reconciliation #2
;524:	// make sure the body shows up in the client's current position
;525:	G_UnTimeShiftClient( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UnTimeShiftClient
CALLV
pop
line 529
;526://unlagged - backward reconciliation #2
;527:
;528:	// check for an almost capture
;529:	CheckAlmostCapture( self, attacker );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 CheckAlmostCapture
CALLV
pop
line 531
;530:	// check for a player that almost brought in cubes
;531:	CheckAlmostScored( self, attacker );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 CheckAlmostScored
CALLV
pop
line 534
;532:
;533:
;534:	if (self->client && self->client->hook)
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
CNSTU4 0
ASGNU4
ADDRLP4 36
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $223
ADDRLP4 36
INDIRP4
CNSTI4 2692
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $223
line 535
;535:		Weapon_HookFree(self->client->hook);
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2692
ADDP4
INDIRP4
ARGP4
ADDRGP4 Weapon_HookFree
CALLV
pop
LABELV $223
line 543
;536:#ifdef MISSIONPACK
;537:	if ((self->client->ps.eFlags & EF_TICKING) && self->activator) {
;538:		self->client->ps.eFlags &= ~EF_TICKING;
;539:		self->activator->think = G_FreeEntity;
;540:		self->activator->nextthink = level.time;
;541:	}
;542:#endif
;543:	self->client->ps.pm_type = PM_DEAD;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 546
;544:
;545:	// Shafe - Trep - Clear out the PDG
;546:	self->istelepoint = 0;
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
CNSTI4 0
ASGNI4
line 547
;547:	VectorClear( self->teleloc ); 
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
CNSTF4 0
ASGNF4
ADDRLP4 44
INDIRP4
CNSTI4 828
ADDP4
ADDRLP4 48
INDIRF4
ASGNF4
ADDRLP4 44
INDIRP4
CNSTI4 824
ADDP4
ADDRLP4 48
INDIRF4
ASGNF4
ADDRLP4 44
INDIRP4
CNSTI4 820
ADDP4
ADDRLP4 48
INDIRF4
ASGNF4
line 549
;548:
;549:	if ( attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $225
line 550
;550:		killer = attacker->s.number;
ADDRLP4 4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 551
;551:		if ( attacker->client ) {
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $227
line 552
;552:			killerName = attacker->client->pers.netname;
ADDRLP4 20
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ASGNP4
line 553
;553:		} else {
ADDRGP4 $226
JUMPV
LABELV $227
line 554
;554:			killerName = "<non-client>";
ADDRLP4 20
ADDRGP4 $229
ASGNP4
line 555
;555:		}
line 556
;556:	} else {
ADDRGP4 $226
JUMPV
LABELV $225
line 557
;557:		killer = ENTITYNUM_WORLD;
ADDRLP4 4
CNSTI4 1022
ASGNI4
line 558
;558:		killerName = "<world>";
ADDRLP4 20
ADDRGP4 $230
ASGNP4
line 559
;559:	}
LABELV $226
line 561
;560:
;561:	if ( killer < 0 || killer >= MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $233
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $231
LABELV $233
line 562
;562:		killer = ENTITYNUM_WORLD;
ADDRLP4 4
CNSTI4 1022
ASGNI4
line 563
;563:		killerName = "<world>";
ADDRLP4 20
ADDRGP4 $230
ASGNP4
line 564
;564:	}
LABELV $231
line 566
;565:
;566:	if ( meansOfDeath < 0 || meansOfDeath >= sizeof( modNames ) / sizeof( modNames[0] ) ) {
ADDRLP4 56
ADDRFP4 16
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
LTI4 $236
ADDRLP4 56
INDIRI4
CVIU4 4
CNSTU4 26
LTU4 $234
LABELV $236
line 567
;567:		obit = "<bad obituary>";
ADDRLP4 24
ADDRGP4 $237
ASGNP4
line 568
;568:	} else {
ADDRGP4 $235
JUMPV
LABELV $234
line 569
;569:		obit = modNames[ meansOfDeath ];
ADDRLP4 24
ADDRFP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 modNames
ADDP4
INDIRP4
ASGNP4
line 570
;570:	}
LABELV $235
line 572
;571:
;572:	G_LogPrintf("Kill: %i %i %i: %s killed %s by %s\n", 
ADDRGP4 $238
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 577
;573:		killer, self->s.number, meansOfDeath, killerName, 
;574:		self->client->pers.netname, obit );
;575:
;576:	// broadcast the death event to everyone
;577:	ent = G_TempEntity( self->r.currentOrigin, EV_OBITUARY );
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTI4 62
ARGI4
ADDRLP4 64
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 64
INDIRP4
ASGNP4
line 578
;578:	ent->s.eventParm = meansOfDeath;
ADDRLP4 8
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 16
INDIRI4
ASGNI4
line 579
;579:	ent->s.otherEntityNum = self->s.number;
ADDRLP4 8
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 580
;580:	ent->s.otherEntityNum2 = killer;
ADDRLP4 8
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 581
;581:	ent->r.svFlags = SVF_BROADCAST;	// send to everyone
ADDRLP4 8
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 32
ASGNI4
line 583
;582:
;583:	self->enemy = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 585
;584:
;585:	self->client->ps.persistant[PERS_KILLED]++;
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 280
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 587
;586:
;587:	if (attacker && attacker->client) {
ADDRLP4 72
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 76
CNSTU4 0
ASGNU4
ADDRLP4 72
INDIRP4
CVPU4 4
ADDRLP4 76
INDIRU4
EQU4 $239
ADDRLP4 72
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 76
INDIRU4
EQU4 $239
line 588
;588:		attacker->client->lastkilled_client = self->s.number;
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2652
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 590
;589:
;590:		if ( attacker == self || OnSameTeam (self, attacker ) ) {
ADDRLP4 80
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CVPU4 4
ADDRLP4 84
INDIRP4
CVPU4 4
EQU4 $243
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $241
LABELV $243
line 591
;591:			AddScore( attacker, self->r.currentOrigin, -1 );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 594
;592:			
;593:
;594:		} else {
ADDRGP4 $240
JUMPV
LABELV $241
line 595
;595:			AddScore( attacker, self->r.currentOrigin, 1 );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 597
;596:
;597:			if( meansOfDeath == MOD_GAUNTLET ) {
ADDRFP4 16
INDIRI4
CNSTI4 2
NEI4 $244
line 600
;598:				
;599:				// play humiliation on player
;600:				attacker->client->ps.persistant[PERS_GAUNTLET_FRAG_COUNT]++;
ADDRLP4 92
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 300
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 603
;601:
;602:				// add the sprite over the player's head
;603:				attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 96
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 604
;604:				attacker->client->ps.eFlags |= EF_AWARD_GAUNTLET;
ADDRLP4 100
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 605
;605:				attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2676
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 608
;606:
;607:				// also play humiliation on target
;608:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_GAUNTLETREWARD;
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 268
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRI4
CNSTI4 2
BXORI4
ASGNI4
line 609
;609:			}
LABELV $244
line 613
;610:
;611:			// check for two kills in a short amount of time
;612:			// if this is close enough to the last kill, give a reward sound
;613:			if ( level.time - attacker->client->lastKillTime < CARNAGE_REWARD_TIME ) {
ADDRGP4 level+32
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2684
ADDP4
INDIRI4
SUBI4
CNSTI4 3000
GEI4 $247
line 615
;614:				// play excellent on player
;615:				attacker->client->ps.persistant[PERS_EXCELLENT_COUNT]++;
ADDRLP4 92
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 288
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 618
;616:
;617:				// add the sprite over the player's head
;618:				attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 96
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 619
;619:				attacker->client->ps.eFlags |= EF_AWARD_EXCELLENT;
ADDRLP4 100
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 620
;620:				attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2676
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 621
;621:			}
LABELV $247
line 622
;622:			attacker->client->lastKillTime = level.time;
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2684
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 624
;623:
;624:		}
line 625
;625:	} else {
ADDRGP4 $240
JUMPV
LABELV $239
line 626
;626:		AddScore( self, self->r.currentOrigin, -1 );
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 627
;627:	}
LABELV $240
line 630
;628:
;629:	// Add team bonuses
;630:	Team_FragBonuses(self, inflictor, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Team_FragBonuses
CALLV
pop
line 633
;631:
;632:	// if I committed suicide, the flag does not fall, it returns.
;633:	if (meansOfDeath == MOD_SUICIDE) {
ADDRFP4 16
INDIRI4
CNSTI4 20
NEI4 $252
line 634
;634:		if ( self->client->ps.powerups[PW_NEUTRALFLAG] ) {		// only happens in One Flag CTF
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $254
line 635
;635:			Team_ReturnFlag( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 636
;636:			self->client->ps.powerups[PW_NEUTRALFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 348
ADDP4
CNSTI4 0
ASGNI4
line 637
;637:		}
ADDRGP4 $255
JUMPV
LABELV $254
line 638
;638:		else if ( self->client->ps.powerups[PW_REDFLAG] ) {		// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $256
line 639
;639:			Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 640
;640:			self->client->ps.powerups[PW_REDFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 641
;641:		}
ADDRGP4 $257
JUMPV
LABELV $256
line 642
;642:		else if ( self->client->ps.powerups[PW_BLUEFLAG] ) {	// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $258
line 643
;643:			Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 644
;644:			self->client->ps.powerups[PW_BLUEFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 344
ADDP4
CNSTI4 0
ASGNI4
line 645
;645:		}
LABELV $258
LABELV $257
LABELV $255
line 646
;646:	}
LABELV $252
line 649
;647:
;648:	// if client is in a nodrop area, don't drop anything (but return CTF flags!)
;649:	contents = trap_PointContents( self->r.currentOrigin, -1 );
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 80
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 80
INDIRI4
ASGNI4
line 650
;650:	if ( !( contents & CONTENTS_NODROP )) {
ADDRLP4 12
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
NEU4 $260
line 651
;651:		TossClientItems( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 TossClientItems
CALLV
pop
line 652
;652:	}
ADDRGP4 $261
JUMPV
LABELV $260
line 653
;653:	else {
line 654
;654:		if ( self->client->ps.powerups[PW_NEUTRALFLAG] ) {		// only happens in One Flag CTF
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $262
line 655
;655:			Team_ReturnFlag( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 656
;656:		}
ADDRGP4 $263
JUMPV
LABELV $262
line 657
;657:		else if ( self->client->ps.powerups[PW_REDFLAG] ) {		// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $264
line 658
;658:			Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 659
;659:		}
ADDRGP4 $265
JUMPV
LABELV $264
line 660
;660:		else if ( self->client->ps.powerups[PW_BLUEFLAG] ) {	// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $266
line 661
;661:			Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 662
;662:		}
LABELV $266
LABELV $265
LABELV $263
line 663
;663:	}
LABELV $261
line 672
;664:#ifdef MISSIONPACK
;665:	TossClientPersistantPowerups( self );
;666:	if( g_gametype.integer == GT_HARVESTER ) {
;667:		TossClientCubes( self );
;668:	}
;669:#endif
;670:
;671:	
;672:	if ((level.firstStrike == qfalse) && (!level.warmupTime))
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRGP4 level+9236
INDIRI4
ADDRLP4 84
INDIRI4
NEI4 $268
ADDRGP4 level+16
INDIRI4
ADDRLP4 84
INDIRI4
NEI4 $268
line 673
;673:	{
line 674
;674:		if (self != attacker)
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 8
INDIRP4
CVPU4 4
EQU4 $272
line 675
;675:		{
line 676
;676:			level.firstStrike = qtrue;
ADDRGP4 level+9236
CNSTI4 1
ASGNI4
line 677
;677:			BroadCastSound("sound/misc/laff02.wav");
ADDRGP4 $275
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 678
;678:			trap_SendServerCommand( -1, va("print \"%s Made First Strike!\n\"",attacker->client->pers.netname));
ADDRGP4 $276
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 679
;679:		}
LABELV $272
line 680
;680:	}
LABELV $268
line 682
;681:
;682:	if (level.warmupTime != 0)
ADDRGP4 level+16
INDIRI4
CNSTI4 0
EQI4 $277
line 683
;683:	{
line 684
;684:		level.firstStrike = qfalse;
ADDRGP4 level+9236
CNSTI4 0
ASGNI4
line 686
;685:		//trap_SendServerCommand( -1, va("print \"%s FS Is FALSE!!\n\"",attacker->client->pers.netname));	
;686:	} 
LABELV $277
line 690
;687:		
;688:	
;689:		// Shafe - Trep - Arsenal Stuff
;690:		if ( g_GameMode.integer > 0 && meansOfDeath != MOD_TELEFRAG && !level.warmupTime) 
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRGP4 g_GameMode+12
INDIRI4
ADDRLP4 88
INDIRI4
LEI4 $281
ADDRFP4 16
INDIRI4
CNSTI4 18
EQI4 $281
ADDRGP4 level+16
INDIRI4
ADDRLP4 88
INDIRI4
NEI4 $281
line 691
;691:		{
line 692
;692:			tmpW = self->s.weapon;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 694
;693:
;694:			if (g_GameMode.integer == 1)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
NEI4 $285
line 695
;695:			{
line 696
;696:				if (tmpW == 9) { self->client->pers.h_bfg = qfalse;  }
ADDRLP4 16
INDIRI4
CNSTI4 9
NEI4 $288
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2480
ADDP4
CNSTI4 0
ASGNI4
LABELV $288
line 697
;697:				if (tmpW == 8) { self->client->pers.h_plasma = qfalse;}
ADDRLP4 16
INDIRI4
CNSTI4 8
NEI4 $290
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2476
ADDP4
CNSTI4 0
ASGNI4
LABELV $290
line 698
;698:				if (tmpW == 7) { self->client->pers.h_gauss = qfalse; }
ADDRLP4 16
INDIRI4
CNSTI4 7
NEI4 $292
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2472
ADDP4
CNSTI4 0
ASGNI4
LABELV $292
line 699
;699:				if (tmpW == 6) { self->client->pers.h_flame = qfalse; }
ADDRLP4 16
INDIRI4
CNSTI4 6
NEI4 $294
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2468
ADDP4
CNSTI4 0
ASGNI4
LABELV $294
line 700
;700:				if (tmpW == 5) { self->client->pers.h_singcan = qfalse; }
ADDRLP4 16
INDIRI4
CNSTI4 5
NEI4 $296
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2464
ADDP4
CNSTI4 0
ASGNI4
LABELV $296
line 701
;701:				if (tmpW == 4) { self->client->pers.h_grenade = qfalse; }
ADDRLP4 16
INDIRI4
CNSTI4 4
NEI4 $298
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2460
ADDP4
CNSTI4 0
ASGNI4
LABELV $298
line 702
;702:				if (tmpW == 3) { self->client->pers.h_sg = qfalse; }
ADDRLP4 16
INDIRI4
CNSTI4 3
NEI4 $300
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2456
ADDP4
CNSTI4 0
ASGNI4
LABELV $300
line 703
;703:				if (tmpW == 2) { self->client->pers.h_mg = qfalse; }
ADDRLP4 16
INDIRI4
CNSTI4 2
NEI4 $302
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2452
ADDP4
CNSTI4 0
ASGNI4
LABELV $302
line 704
;704:				if (tmpW == 1) { self->client->pers.h_gauntlet = qfalse; }
ADDRLP4 16
INDIRI4
CNSTI4 1
NEI4 $304
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2448
ADDP4
CNSTI4 0
ASGNI4
LABELV $304
line 706
;705:
;706:			}
LABELV $285
line 709
;707:			
;708:			
;709:			if ((g_GameMode.integer == 2) || (IsOutOfWeapons(self)))
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
EQI4 $309
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 IsOutOfWeapons
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $306
LABELV $309
line 710
;710:			{
line 713
;711:				
;712:				// Arsenal Message
;713:				if (g_GameMode.integer == 1)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
NEI4 $310
line 714
;714:				{
line 715
;715:					trap_SendServerCommand( -1, va("print \"%s's Arsenal Is Empty!\n\"",self->client->pers.netname));
ADDRGP4 $313
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 96
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 716
;716:					trap_SendServerCommand( -1, va("cp \"%.15s" S_COLOR_WHITE "'s Arsenal is Empty.\n\"", self->client->pers.netname) );
ADDRGP4 $314
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 100
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 100
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 717
;717:				}
LABELV $310
line 720
;718:
;719:				// LMS Message
;720:				if (g_GameMode.integer == 2)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
NEI4 $315
line 721
;721:				{
line 722
;722:					trap_SendServerCommand( -1, va("print \"%s Has Been Eliminated!!\n\"",self->client->pers.netname));
ADDRGP4 $318
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 96
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 723
;723:					trap_SendServerCommand( -1, va("cp \"%.15s" S_COLOR_WHITE " Has Been Eliminated.\n\"", self->client->pers.netname) );
ADDRGP4 $319
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 100
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 100
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 724
;724:				}
LABELV $315
line 727
;725:				
;726:				// Send them to Spec
;727:				self->client->pers.TrueScore = self->client->ps.persistant[PERS_SCORE];
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 2488
ADDP4
ADDRLP4 96
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 728
;728:				self->client->pers.Eliminated = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2484
ADDP4
CNSTI4 1
ASGNI4
line 729
;729:				SetTeam(self, "s");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $320
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 731
;730:				// Set The Last Attacker In Case The Winner Blows Themself up on the winning shot
;731:				level.lastClient == attacker->client;
line 733
;732:
;733:				tmpCnt = (CountSurvivors());
ADDRLP4 100
ADDRGP4 CountSurvivors
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 100
INDIRI4
ASGNI4
line 736
;734:
;735:						
;736:				if (tmpCnt != level.levelSurvivors)
ADDRLP4 28
INDIRI4
ADDRGP4 level+9228
INDIRI4
EQI4 $322
line 737
;737:				{
line 739
;738:
;739:					level.levelSurvivors = tmpCnt;
ADDRGP4 level+9228
ADDRLP4 28
INDIRI4
ASGNI4
line 742
;740:			
;741:			
;742:					if (tmpCnt == 5) 
ADDRLP4 28
INDIRI4
CNSTI4 5
NEI4 $326
line 743
;743:					{
line 744
;744:						BroadCastSound("sound/misc/5.wav");
ADDRGP4 $328
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 745
;745:					}
LABELV $326
line 747
;746:					
;747:					if (tmpCnt == 4) 
ADDRLP4 28
INDIRI4
CNSTI4 4
NEI4 $329
line 748
;748:					{
line 749
;749:						BroadCastSound("sound/misc/4.wav");
ADDRGP4 $331
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 750
;750:					}
LABELV $329
line 752
;751:
;752:					if (tmpCnt == 3) 
ADDRLP4 28
INDIRI4
CNSTI4 3
NEI4 $332
line 753
;753:					{
line 754
;754:						BroadCastSound("sound/misc/3.wav");
ADDRGP4 $334
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 755
;755:					}
LABELV $332
line 757
;756:
;757:					if (tmpCnt == 2) 
ADDRLP4 28
INDIRI4
CNSTI4 2
NEI4 $335
line 758
;758:					{
line 760
;759:						
;760:						BroadCastSound("sound/misc/2.wav");
ADDRGP4 $337
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 761
;761:					}
LABELV $335
line 763
;762:
;763:					if (tmpCnt == 1) 
ADDRLP4 28
INDIRI4
CNSTI4 1
NEI4 $338
line 764
;764:					{
line 765
;765:						BroadCastSound("sound/misc/laff01.wav");
ADDRGP4 $340
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 767
;766:
;767:					}
LABELV $338
line 769
;768:				
;769:				}
LABELV $322
line 770
;770:			} 
LABELV $306
line 772
;771:
;772:		}
LABELV $281
line 775
;773:		// End Arsenal Stuff
;774:
;775:	Cmd_Score_f( self );		// show scores
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 778
;776:	// send updated scores to any clients that are following this one,
;777:	// or they would get stale scoreboards
;778:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $344
JUMPV
LABELV $341
line 781
;779:		gclient_t	*client;
;780:
;781:		client = &level.clients[i];
ADDRLP4 92
CNSTI4 3452
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 782
;782:		if ( client->pers.connected != CON_CONNECTED ) {
ADDRLP4 92
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $346
line 783
;783:			continue;
ADDRGP4 $342
JUMPV
LABELV $346
line 785
;784:		}
;785:		if ( client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 92
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
EQI4 $348
line 786
;786:			continue;
ADDRGP4 $342
JUMPV
LABELV $348
line 788
;787:		}
;788:		if ( client->sess.spectatorClient == self->s.number ) {
ADDRLP4 92
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $350
line 789
;789:			Cmd_Score_f( g_entities + i );
CNSTI4 876
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 790
;790:		}
LABELV $350
line 791
;791:	}
LABELV $342
line 778
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $344
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $341
line 793
;792:
;793:	self->takedamage = qtrue;	// can still be gibbed
ADDRFP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 1
ASGNI4
line 795
;794:
;795:	self->s.weapon = WP_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 796
;796:	self->s.powerups = 0;
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 797
;797:	self->r.contents = CONTENTS_CORPSE;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 67108864
ASGNI4
line 799
;798:
;799:	self->s.angles[0] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
CNSTF4 0
ASGNF4
line 800
;800:	self->s.angles[2] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
CNSTF4 0
ASGNF4
line 801
;801:	LookAtKiller (self, inflictor, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 LookAtKiller
CALLV
pop
line 803
;802:
;803:	VectorCopy( self->s.angles, self->client->ps.viewangles );
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ADDRLP4 92
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 805
;804:
;805:	self->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 807
;806:
;807:	self->r.maxs[2] = -8;
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
CNSTF4 3238002688
ASGNF4
line 811
;808:
;809:	// don't allow respawn until the death anim is done
;810:	// g_forcerespawn may force spawning at some later time
;811:	self->client->respawnTime = level.time + 1700;  // This is the real line
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2664
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1700
ADDI4
ASGNI4
line 816
;812:	
;813:
;814:
;815:	// remove powerups
;816:	memset( self->client->ps.powerups, 0, sizeof(self->client->ps.powerups) );
ADDRFP4 0
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
line 818
;817:
;818:	if (meansOfDeath == MOD_HEADSHOT)
ADDRFP4 16
INDIRI4
CNSTI4 23
NEI4 $353
line 819
;819:	{
line 820
;820:			BroadCastSound("sound/misc/headshot.wav");
ADDRGP4 $355
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 821
;821:	}
LABELV $353
line 826
;822:
;823:
;824:
;825:	// never gib in a nodrop
;826:	if ( (self->health <= GIB_HEALTH && !(contents & CONTENTS_NODROP) && g_blood.integer && meansOfDeath != MOD_HEADSHOT) || meansOfDeath == MOD_SUICIDE) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $362
ADDRLP4 12
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
NEU4 $362
ADDRGP4 g_blood+12
INDIRI4
CNSTI4 0
EQI4 $362
ADDRFP4 16
INDIRI4
CNSTI4 23
NEI4 $359
LABELV $362
ADDRFP4 16
INDIRI4
CNSTI4 20
NEI4 $356
LABELV $359
line 828
;827:		// gib death
;828:		GibEntity( self, killer );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 GibEntity
CALLV
pop
line 829
;829:	} else {
ADDRGP4 $357
JUMPV
LABELV $356
line 833
;830:		// normal death
;831:		static int i;
;832:
;833:		switch ( i ) {
ADDRLP4 96
ADDRGP4 $363
INDIRI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $366
ADDRLP4 96
INDIRI4
CNSTI4 1
EQI4 $367
ADDRLP4 96
INDIRI4
CNSTI4 2
EQI4 $368
ADDRGP4 $364
JUMPV
LABELV $366
line 835
;834:		case 0:
;835:			anim = BOTH_DEATH1;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 836
;836:			break;
ADDRGP4 $365
JUMPV
LABELV $367
line 838
;837:		case 1:
;838:			anim = BOTH_DEATH2;
ADDRLP4 32
CNSTI4 2
ASGNI4
line 839
;839:			break;
ADDRGP4 $365
JUMPV
LABELV $368
LABELV $364
line 842
;840:		case 2:
;841:		default:
;842:			anim = BOTH_DEATH3;
ADDRLP4 32
CNSTI4 4
ASGNI4
line 843
;843:			break;
LABELV $365
line 848
;844:		}
;845:
;846:		// for the no-blood option, we need to prevent the health
;847:		// from going to gib level
;848:		if ( self->health <= GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $369
line 849
;849:			self->health = GIB_HEALTH+1;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 -39
ASGNI4
line 850
;850:		}
LABELV $369
line 852
;851:
;852:		self->client->ps.legsAnim = 
ADDRLP4 100
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 104
CNSTI4 128
ASGNI4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
ADDRLP4 104
INDIRI4
BANDI4
ADDRLP4 104
INDIRI4
BXORI4
ADDRLP4 32
INDIRI4
BORI4
ASGNI4
line 854
;853:			( ( self->client->ps.legsAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
;854:		self->client->ps.torsoAnim = 
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 84
ADDP4
ASGNP4
ADDRLP4 112
CNSTI4 128
ASGNI4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
ADDRLP4 112
INDIRI4
BANDI4
ADDRLP4 112
INDIRI4
BXORI4
ADDRLP4 32
INDIRI4
BORI4
ASGNI4
line 857
;855:			( ( self->client->ps.torsoAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
;856:
;857:		G_AddEvent( self, EV_DEATH1 + i, killer );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $363
INDIRI4
CNSTI4 59
ADDI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 860
;858:
;859:		// Shafe - Trep Headshot //////////////////////////////////////////
;860:		if(meansOfDeath == MOD_HEADSHOT)
ADDRFP4 16
INDIRI4
CNSTI4 23
NEI4 $371
line 861
;861:			GibEntity_Headshot( self, killer );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 GibEntity_Headshot
CALLV
pop
ADDRGP4 $372
JUMPV
LABELV $371
line 863
;862:		else
;863:			self->client->noHead = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2708
ADDP4
CNSTI4 0
ASGNI4
LABELV $372
line 867
;864:		// Shafe - Trep - End Headshot /////////////////////////////
;865:
;866:		// the body can still be gibbed
;867:		self->die = body_die;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 body_die
ASGNP4
line 870
;868:
;869:		// globally cycle through the different death animations
;870:		i = ( i + 1 ) % 3;
ADDRLP4 116
ADDRGP4 $363
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 3
MODI4
ASGNI4
line 879
;871:
;872:
;873:
;874:#ifdef MISSIONPACK
;875:		if (self->s.eFlags & EF_KAMIKAZE) {
;876:			Kamikaze_DeathTimer( self );
;877:		}
;878:#endif
;879:	}
LABELV $357
line 884
;880:
;881:	
;882:
;883:
;884:	trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 886
;885:
;886:}
LABELV $216
endproc player_die 120 28
export CheckArmor
proc CheckArmor 20 4
line 895
;887:
;888:
;889:/*
;890:================
;891:CheckArmor
;892:================
;893:*/
;894:int CheckArmor (gentity_t *ent, int damage, int dflags)
;895:{
line 900
;896:	gclient_t	*client;
;897:	int			save;
;898:	int			count;
;899:
;900:	if (!damage)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $374
line 901
;901:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $373
JUMPV
LABELV $374
line 903
;902:
;903:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 905
;904:
;905:	if (!client)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $376
line 906
;906:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $373
JUMPV
LABELV $376
line 908
;907:
;908:	if (dflags & DAMAGE_NO_ARMOR)
ADDRFP4 8
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $378
line 909
;909:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $373
JUMPV
LABELV $378
line 912
;910:
;911:	// armor
;912:	count = client->ps.stats[STAT_ARMOR];
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
line 913
;913:	save = ceil( damage * ARMOR_PROTECTION );
CNSTF4 1059648963
ADDRFP4 4
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 12
ADDRGP4 ceil
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 914
;914:	if (save >= count)
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $380
line 915
;915:		save = count;
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
LABELV $380
line 917
;916:
;917:	if (!save)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $382
line 918
;918:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $373
JUMPV
LABELV $382
line 920
;919:
;920:	client->ps.stats[STAT_ARMOR] -= save;
ADDRLP4 16
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 922
;921:
;922:	return save;
ADDRLP4 0
INDIRI4
RETI4
LABELV $373
endproc CheckArmor 20 4
export RaySphereIntersections
proc RaySphereIntersections 96 4
line 930
;923:}
;924:
;925:/*
;926:================
;927:RaySphereIntersections
;928:================
;929:*/
;930:int RaySphereIntersections( vec3_t origin, float radius, vec3_t point, vec3_t dir, vec3_t intersections[2] ) {
line 939
;931:	float b, c, d, t;
;932:
;933:	//	| origin - (point + t * dir) | = radius
;934:	//	a = dir[0]^2 + dir[1]^2 + dir[2]^2;
;935:	//	b = 2 * (dir[0] * (point[0] - origin[0]) + dir[1] * (point[1] - origin[1]) + dir[2] * (point[2] - origin[2]));
;936:	//	c = (point[0] - origin[0])^2 + (point[1] - origin[1])^2 + (point[2] - origin[2])^2 - radius^2;
;937:
;938:	// normalize dir so a = 1
;939:	VectorNormalize(dir);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 940
;940:	b = 2 * (dir[0] * (point[0] - origin[0]) + dir[1] * (point[1] - origin[1]) + dir[2] * (point[2] - origin[2]));
ADDRLP4 16
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 20
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 4
ASGNI4
ADDRLP4 32
CNSTI4 8
ASGNI4
ADDRLP4 4
CNSTF4 1073741824
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 24
INDIRP4
INDIRF4
SUBF4
MULF4
ADDRLP4 16
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
SUBF4
MULF4
ADDF4
ADDRLP4 16
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
SUBF4
MULF4
ADDF4
MULF4
ASGNF4
line 941
;941:	c = (point[0] - origin[0]) * (point[0] - origin[0]) +
ADDRLP4 36
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 36
INDIRP4
INDIRF4
ADDRLP4 40
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48
CNSTI4 4
ASGNI4
ADDRLP4 52
ADDRLP4 36
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56
CNSTI4 8
ASGNI4
ADDRLP4 60
ADDRLP4 36
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 44
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ADDRLP4 52
INDIRF4
ADDRLP4 52
INDIRF4
MULF4
ADDF4
ADDRLP4 60
INDIRF4
ADDRLP4 60
INDIRF4
MULF4
ADDF4
ADDRLP4 64
INDIRF4
ADDRLP4 64
INDIRF4
MULF4
SUBF4
ASGNF4
line 946
;942:		(point[1] - origin[1]) * (point[1] - origin[1]) +
;943:		(point[2] - origin[2]) * (point[2] - origin[2]) -
;944:		radius * radius;
;945:
;946:	d = b * b - 4 * c;
ADDRLP4 8
ADDRLP4 4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
CNSTF4 1082130432
ADDRLP4 12
INDIRF4
MULF4
SUBF4
ASGNF4
line 947
;947:	if (d > 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
LEF4 $385
line 948
;948:		t = (- b + sqrt(d)) / 2;
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
NEGF4
ADDRLP4 72
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 949
;949:		VectorMA(point, t, dir, intersections[0]);
ADDRFP4 16
INDIRP4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRFP4 12
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 76
CNSTI4 4
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 80
CNSTI4 8
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 950
;950:		t = (- b - sqrt(d)) / 2;
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 84
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
NEGF4
ADDRLP4 84
INDIRF4
SUBF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 951
;951:		VectorMA(point, t, dir, intersections[1]);
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRFP4 12
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88
CNSTI4 4
ASGNI4
ADDRFP4 16
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 92
CNSTI4 8
ASGNI4
ADDRFP4 16
INDIRP4
CNSTI4 20
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 952
;952:		return 2;
CNSTI4 2
RETI4
ADDRGP4 $384
JUMPV
LABELV $385
line 954
;953:	}
;954:	else if (d == 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
NEF4 $387
line 955
;955:		t = (- b ) / 2;
ADDRLP4 0
ADDRLP4 4
INDIRF4
NEGF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 956
;956:		VectorMA(point, t, dir, intersections[0]);
ADDRFP4 16
INDIRP4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRFP4 12
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 72
CNSTI4 4
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 76
CNSTI4 8
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 957
;957:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $384
JUMPV
LABELV $387
line 959
;958:	}
;959:	return 0;
CNSTI4 0
RETI4
LABELV $384
endproc RaySphereIntersections 96 4
export G_Damage
proc G_Damage 96 24
line 1026
;960:}
;961:
;962:#ifdef MISSIONPACK
;963:/*
;964:================
;965:G_InvulnerabilityEffect
;966:================
;967:*/
;968:int G_InvulnerabilityEffect( gentity_t *targ, vec3_t dir, vec3_t point, vec3_t impactpoint, vec3_t bouncedir ) {
;969:	gentity_t	*impact;
;970:	vec3_t		intersections[2], vec;
;971:	int			n;
;972:
;973:	if ( !targ->client ) {
;974:		return qfalse;
;975:	}
;976:	VectorCopy(dir, vec);
;977:	VectorInverse(vec);
;978:	// sphere model radius = 42 units
;979:	n = RaySphereIntersections( targ->client->ps.origin, 42, point, vec, intersections);
;980:	if (n > 0) {
;981:		impact = G_TempEntity( targ->client->ps.origin, EV_INVUL_IMPACT );
;982:		VectorSubtract(intersections[0], targ->client->ps.origin, vec);
;983:		vectoangles(vec, impact->s.angles);
;984:		impact->s.angles[0] += 90;
;985:		if (impact->s.angles[0] > 360)
;986:			impact->s.angles[0] -= 360;
;987:		if ( impactpoint ) {
;988:			VectorCopy( intersections[0], impactpoint );
;989:		}
;990:		if ( bouncedir ) {
;991:			VectorCopy( vec, bouncedir );
;992:			VectorNormalize( bouncedir );
;993:		}
;994:		return qtrue;
;995:	}
;996:	else {
;997:		return qfalse;
;998:	}
;999:}
;1000:#endif
;1001:/*
;1002:============
;1003:T_Damage
;1004:
;1005:targ		entity that is being damaged
;1006:inflictor	entity that is causing the damage
;1007:attacker	entity that caused the inflictor to damage targ
;1008:	example: targ=monster, inflictor=rocket, attacker=player
;1009:
;1010:dir			direction of the attack for knockback
;1011:point		point at which the damage is being inflicted, used for headshots
;1012:damage		amount of damage being inflicted
;1013:knockback	force to be applied against targ as a result of the damage
;1014:
;1015:inflictor, attacker, dir, and point can be NULL for environmental effects
;1016:
;1017:dflags		these flags are used to control how T_Damage works
;1018:	DAMAGE_RADIUS			damage was indirect (from a nearby explosion)
;1019:	DAMAGE_NO_ARMOR			armor does not protect from this damage
;1020:	DAMAGE_NO_KNOCKBACK		do not affect velocity, just view angles
;1021:	DAMAGE_NO_PROTECTION	kills godmode, armor, everything
;1022:============
;1023:*/
;1024:
;1025:void G_Damage( gentity_t *targ, gentity_t *inflictor, gentity_t *attacker,
;1026:			   vec3_t dir, vec3_t point, int damage, int dflags, int mod ) {
line 1044
;1027:	gclient_t	*client;
;1028:	int			take;
;1029:	int			save;
;1030:	int			asave;
;1031:	int			knockback;
;1032:	int			max;
;1033:	// Shafe - Trep - Headshot
;1034:	float		z_ratio;
;1035:	float		z_rel;
;1036:	int			height;
;1037:	float		targ_maxs2;
;1038:	// Shafe - Trep - End Headshot
;1039:
;1040:#ifdef MISSIONPACK
;1041:	vec3_t		bouncedir, impactpoint;
;1042:#endif
;1043:
;1044:	if (!targ->takedamage) {
ADDRFP4 0
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
CNSTI4 0
NEI4 $390
line 1045
;1045:		return;
ADDRGP4 $389
JUMPV
LABELV $390
line 1050
;1046:	}
;1047:
;1048:	// the intermission has allready been qualified for, so don't
;1049:	// allow any extra scoring
;1050:	if ( level.intermissionQueued ) {
ADDRGP4 level+9136
INDIRI4
CNSTI4 0
EQI4 $392
line 1051
;1051:		return;
ADDRGP4 $389
JUMPV
LABELV $392
line 1055
;1052:	}
;1053:
;1054:	// Grapple hook cannot be used to damage a buildable
;1055:	if (targ->s.eType ==ET_TURRET && mod == MOD_GRAPPLE && g_GrappleMode.integer == 1)
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $395
ADDRFP4 28
INDIRI4
CNSTI4 25
NEI4 $395
ADDRGP4 g_GrappleMode+12
INDIRI4
CNSTI4 1
NEI4 $395
line 1056
;1056:	{
line 1057
;1057:		return;
ADDRGP4 $389
JUMPV
LABELV $395
line 1060
;1058:	}
;1059:
;1060:	if (targ->s.eType ==ET_TURRET && mod == MOD_GRAPPLE && g_GrappleMode.integer == 2)
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $398
ADDRFP4 28
INDIRI4
CNSTI4 25
NEI4 $398
ADDRGP4 g_GrappleMode+12
INDIRI4
CNSTI4 2
NEI4 $398
line 1061
;1061:	{
line 1063
;1062:		//targ->client->ps.speed = 0;
;1063:		targ->immobilized == qtrue;
line 1064
;1064:		return;
ADDRGP4 $389
JUMPV
LABELV $398
line 1077
;1065:	}
;1066:
;1067:#ifdef MISSIONPACK
;1068:	if ( targ->client && mod != MOD_JUICED) {
;1069:		if ( targ->client->invulnerabilityTime > level.time) {
;1070:			if ( dir && point ) {
;1071:				G_InvulnerabilityEffect( targ, dir, point, impactpoint, bouncedir );
;1072:			}
;1073:			return;
;1074:		}
;1075:	}
;1076:#endif
;1077:	if ( !inflictor ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $401
line 1078
;1078:		inflictor = &g_entities[ENTITYNUM_WORLD];
ADDRFP4 4
ADDRGP4 g_entities+895272
ASGNP4
line 1079
;1079:	}
LABELV $401
line 1080
;1080:	if ( !attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $404
line 1081
;1081:		attacker = &g_entities[ENTITYNUM_WORLD];
ADDRFP4 8
ADDRGP4 g_entities+895272
ASGNP4
line 1082
;1082:	}
LABELV $404
line 1087
;1083:
;1084:	
;1085:
;1086:	// shootable doors / buttons don't actually have any health
;1087:	if ( targ->s.eType == ET_MOVER ) {
ADDRLP4 40
CNSTI4 4
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
NEI4 $407
line 1088
;1088:		if ( targ->use && targ->moverState == MOVER_POS1 || targ->moverState == ROTATOR_POS1) {
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 724
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $412
ADDRLP4 44
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
CNSTI4 0
EQI4 $411
LABELV $412
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
CNSTI4 4
NEI4 $389
LABELV $411
line 1089
;1089:			targ->use( targ, inflictor, attacker );
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 48
INDIRP4
CNSTI4 724
ADDP4
INDIRP4
CALLV
pop
line 1090
;1090:		}
line 1091
;1091:		return;
ADDRGP4 $389
JUMPV
LABELV $407
line 1095
;1092:	}
;1093:
;1094:	// If we shot a breakable item subtract the damage from its health and try to break it
;1095: 	if ( targ->s.eType == ET_BREAKABLE ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 15
NEI4 $413
line 1096
;1096:         targ->health -= damage;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
ADDRFP4 20
INDIRI4
SUBI4
ASGNI4
line 1097
;1097: 		G_BreakGlass( targ, point, mod );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 28
INDIRI4
ARGI4
ADDRGP4 G_BreakGlass
CALLV
pop
line 1098
;1098: 		return;
ADDRGP4 $389
JUMPV
LABELV $413
line 1107
;1099: 	}
;1100:#ifdef MISSIONPACK
;1101:	if( g_gametype.integer == GT_OBELISK && CheckObeliskAttack( targ, attacker ) ) {
;1102:		return;
;1103:	}
;1104:#endif
;1105:	// reduce damage by the attacker's handicap value
;1106:	// unless they are rocket jumping
;1107:	if ( attacker->client && attacker != targ ) {
ADDRLP4 44
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $415
ADDRLP4 44
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $415
line 1108
;1108:		max = attacker->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 20
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ASGNI4
line 1114
;1109:#ifdef MISSIONPACK
;1110:		if( bg_itemlist[attacker->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;1111:			max /= 2;
;1112:		}
;1113:#endif
;1114:		damage = damage * max / 100;
ADDRFP4 20
ADDRFP4 20
INDIRI4
ADDRLP4 20
INDIRI4
MULI4
CNSTI4 100
DIVI4
ASGNI4
line 1115
;1115:	}
LABELV $415
line 1117
;1116:
;1117:	client = targ->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 1119
;1118:
;1119:	if ( client ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $417
line 1120
;1120:		if ( client->noclip ) {
ADDRLP4 0
INDIRP4
CNSTI4 2584
ADDP4
INDIRI4
CNSTI4 0
EQI4 $419
line 1121
;1121:			return;
ADDRGP4 $389
JUMPV
LABELV $419
line 1123
;1122:		}
;1123:	}
LABELV $417
line 1125
;1124:
;1125:	if ( !dir ) {
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $421
line 1126
;1126:		dflags |= DAMAGE_NO_KNOCKBACK;
ADDRFP4 24
ADDRFP4 24
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 1127
;1127:	} else {
ADDRGP4 $422
JUMPV
LABELV $421
line 1128
;1128:		VectorNormalize(dir);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1129
;1129:	}
LABELV $422
line 1131
;1130:
;1131:	knockback = damage;
ADDRLP4 4
ADDRFP4 20
INDIRI4
ASGNI4
line 1132
;1132:	if ( knockback > 200 ) {
ADDRLP4 4
INDIRI4
CNSTI4 200
LEI4 $423
line 1133
;1133:		knockback = 200;
ADDRLP4 4
CNSTI4 200
ASGNI4
line 1134
;1134:	}
LABELV $423
line 1135
;1135:	if ( targ->flags & FL_NO_KNOCKBACK ) {
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $425
line 1136
;1136:		knockback = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1137
;1137:	}
LABELV $425
line 1138
;1138:	if ( dflags & DAMAGE_NO_KNOCKBACK ) {
ADDRFP4 24
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $427
line 1139
;1139:		knockback = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1140
;1140:	}
LABELV $427
line 1143
;1141:
;1142:	// figure momentum add, even if the damage won't be taken
;1143:	if ( knockback && targ->client ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $429
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $429
line 1147
;1144:		vec3_t	kvel;
;1145:		float	mass;
;1146:
;1147:		mass = 200;
ADDRLP4 60
CNSTF4 1128792064
ASGNF4
line 1149
;1148:
;1149:		VectorScale (dir, g_knockback.value * (float)knockback / mass, kvel);
ADDRLP4 64
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 68
ADDRLP4 4
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 72
ADDRLP4 60
INDIRF4
ASGNF4
ADDRLP4 48
ADDRLP4 64
INDIRP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 68
INDIRF4
MULF4
ADDRLP4 72
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 48+4
ADDRLP4 64
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 68
INDIRF4
MULF4
ADDRLP4 72
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 48+8
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
ADDRLP4 60
INDIRF4
DIVF4
MULF4
ASGNF4
line 1150
;1150:		VectorAdd (targ->client->ps.velocity, kvel, targ->client->ps.velocity);
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRF4
ADDRLP4 48
INDIRF4
ADDF4
ASGNF4
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRF4
ADDRLP4 48+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRF4
ADDRLP4 48+8
INDIRF4
ADDF4
ASGNF4
line 1154
;1151:
;1152:		// set the timer so that the other client can't cancel
;1153:		// out the movement immediately
;1154:		if ( !targ->client->ps.pm_time ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
NEI4 $438
line 1157
;1155:			int		t;
;1156:
;1157:			t = knockback * 2;
ADDRLP4 88
ADDRLP4 4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 1158
;1158:			if ( t < 50 ) {
ADDRLP4 88
INDIRI4
CNSTI4 50
GEI4 $440
line 1159
;1159:				t = 50;
ADDRLP4 88
CNSTI4 50
ASGNI4
line 1160
;1160:			}
LABELV $440
line 1161
;1161:			if ( t > 200 ) {
ADDRLP4 88
INDIRI4
CNSTI4 200
LEI4 $442
line 1162
;1162:				t = 200;
ADDRLP4 88
CNSTI4 200
ASGNI4
line 1163
;1163:			}
LABELV $442
line 1164
;1164:			targ->client->ps.pm_time = t;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 88
INDIRI4
ASGNI4
line 1165
;1165:			targ->client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 1166
;1166:		}
LABELV $438
line 1167
;1167:	}
LABELV $429
line 1170
;1168:
;1169:	// check for completely getting out of the damage
;1170:	if ( !(dflags & DAMAGE_NO_PROTECTION) ) {
ADDRFP4 24
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $444
line 1177
;1171:
;1172:		// if TF_NO_FRIENDLY_FIRE is set, don't do damage to the target
;1173:		// if the attacker was on the same team
;1174:#ifdef MISSIONPACK
;1175:		if ( mod != MOD_JUICED && targ != attacker && !(dflags & DAMAGE_NO_TEAM_PROTECTION) && OnSameTeam (targ, attacker)  ) {
;1176:#else	
;1177:		if ( targ != attacker && OnSameTeam (targ, attacker)  ) {
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CVPU4 4
ADDRLP4 52
INDIRP4
CVPU4 4
EQU4 $446
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $446
line 1179
;1178:#endif
;1179:			if ( !g_friendlyFire.integer ) {
ADDRGP4 g_friendlyFire+12
INDIRI4
CNSTI4 0
NEI4 $448
line 1180
;1180:				return;
ADDRGP4 $389
JUMPV
LABELV $448
line 1182
;1181:			}
;1182:		}
LABELV $446
line 1195
;1183:#ifdef MISSIONPACK
;1184:		if (mod == MOD_PROXIMITY_MINE) {
;1185:			if (inflictor && inflictor->parent && OnSameTeam(targ, inflictor->parent)) {
;1186:				return;
;1187:			}
;1188:			if (targ == attacker) {
;1189:				return;
;1190:			}
;1191:		}
;1192:#endif
;1193:
;1194:		// check for godmode
;1195:		if ( targ->flags & FL_GODMODE ) {
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $451
line 1196
;1196:			return;
ADDRGP4 $389
JUMPV
LABELV $451
line 1198
;1197:		}
;1198:	}
LABELV $444
line 1202
;1199:
;1200:	// battlesuit protects from all radius damage (but takes knockback)
;1201:	// and protects 50% against all damage
;1202:	if ( client && client->ps.powerups[PW_BATTLESUIT] ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $453
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
INDIRI4
CNSTI4 0
EQI4 $453
line 1203
;1203:		G_AddEvent( targ, EV_POWERUP_BATTLESUIT, 0 );
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
line 1204
;1204:		if ( ( dflags & DAMAGE_RADIUS ) || ( mod == MOD_FALLING ) ) {
ADDRFP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $457
ADDRFP4 28
INDIRI4
CNSTI4 19
NEI4 $455
LABELV $457
line 1205
;1205:			return;
ADDRGP4 $389
JUMPV
LABELV $455
line 1207
;1206:		}
;1207:		damage *= 0.5;
ADDRFP4 20
CNSTF4 1056964608
ADDRFP4 20
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1208
;1208:	}
LABELV $453
line 1211
;1209:
;1210:	// add to the attacker's hit counter (if the target isn't a general entity like a prox mine)
;1211:	if ( attacker->client && targ != attacker && targ->health > 0
ADDRLP4 52
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $458
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CVPU4 4
ADDRLP4 52
INDIRP4
CVPU4 4
EQU4 $458
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
LEI4 $458
ADDRLP4 64
ADDRLP4 56
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 3
EQI4 $458
ADDRLP4 64
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $458
line 1213
;1212:			&& targ->s.eType != ET_MISSILE
;1213:			&& targ->s.eType != ET_GENERAL) {
line 1214
;1214:		if ( OnSameTeam( targ, attacker ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $460
line 1215
;1215:			attacker->client->ps.persistant[PERS_HITS]--;
ADDRLP4 72
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 252
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1216
;1216:		} else {
ADDRGP4 $461
JUMPV
LABELV $460
line 1217
;1217:			attacker->client->ps.persistant[PERS_HITS]++;
ADDRLP4 72
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 252
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1218
;1218:		}
LABELV $461
line 1219
;1219:		attacker->client->ps.persistant[PERS_ATTACKEE_ARMOR] = (targ->health<<8)|(client->ps.stats[STAT_ARMOR]);
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 276
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 8
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
BORI4
ASGNI4
line 1220
;1220:	}
LABELV $458
line 1224
;1221:
;1222:	// always give half damage if hurting self
;1223:	// calculated after knockback, so rocket jumping works
;1224:	if ( targ == attacker) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 8
INDIRP4
CVPU4 4
NEU4 $462
line 1225
;1225:		damage *= 0.5;
ADDRFP4 20
CNSTF4 1056964608
ADDRFP4 20
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1226
;1226:	}
LABELV $462
line 1228
;1227:
;1228:	if ( damage < 1 ) {
ADDRFP4 20
INDIRI4
CNSTI4 1
GEI4 $464
line 1229
;1229:		damage = 1;
ADDRFP4 20
CNSTI4 1
ASGNI4
line 1230
;1230:	}
LABELV $464
line 1231
;1231:	take = damage;
ADDRLP4 8
ADDRFP4 20
INDIRI4
ASGNI4
line 1232
;1232:	save = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1235
;1233:
;1234:	// save some from armor
;1235:	asave = CheckArmor (targ, take, dflags);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 CheckArmor
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 68
INDIRI4
ASGNI4
line 1236
;1236:	take -= asave;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
ASGNI4
line 1238
;1237:
;1238:	if ( g_debugDamage.integer ) {
ADDRGP4 g_debugDamage+12
INDIRI4
CNSTI4 0
EQI4 $466
line 1239
;1239:		G_Printf( "%i: client:%i health:%i damage:%i armor:%i\n", level.time, targ->s.number,
ADDRGP4 $469
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 1241
;1240:			targ->health, take, asave );
;1241:	}
LABELV $466
line 1246
;1242:
;1243:	// add to the damage inflicted on a player this frame
;1244:	// the total will be turned into screen blends and view angle kicks
;1245:	// at the end of the frame
;1246:	if ( client ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $471
line 1247
;1247:		if ( attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $473
line 1248
;1248:			client->ps.persistant[PERS_ATTACKER] = attacker->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 272
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 1249
;1249:		} else {
ADDRGP4 $474
JUMPV
LABELV $473
line 1250
;1250:			client->ps.persistant[PERS_ATTACKER] = ENTITYNUM_WORLD;
ADDRLP4 0
INDIRP4
CNSTI4 272
ADDP4
CNSTI4 1022
ASGNI4
line 1251
;1251:		}
LABELV $474
line 1252
;1252:		client->damage_armor += asave;
ADDRLP4 72
ADDRLP4 0
INDIRP4
CNSTI4 2612
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 1253
;1253:		client->damage_blood += take;
ADDRLP4 76
ADDRLP4 0
INDIRP4
CNSTI4 2616
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 1254
;1254:		client->damage_knockback += knockback;
ADDRLP4 80
ADDRLP4 0
INDIRP4
CNSTI4 2620
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 1255
;1255:		if ( dir ) {
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $475
line 1256
;1256:			VectorCopy ( dir, client->damage_from );
ADDRLP4 0
INDIRP4
CNSTI4 2624
ADDP4
ADDRFP4 12
INDIRP4
INDIRB
ASGNB 12
line 1257
;1257:			client->damage_fromWorld = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 2636
ADDP4
CNSTI4 0
ASGNI4
line 1258
;1258:		} else {
ADDRGP4 $476
JUMPV
LABELV $475
line 1259
;1259:			VectorCopy ( targ->r.currentOrigin, client->damage_from );
ADDRLP4 0
INDIRP4
CNSTI4 2624
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRB
ASGNB 12
line 1260
;1260:			client->damage_fromWorld = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 2636
ADDP4
CNSTI4 1
ASGNI4
line 1261
;1261:		}
LABELV $476
line 1262
;1262:	}
LABELV $471
line 1268
;1263:
;1264:	// See if it's the player hurting the emeny flag carrier
;1265:#ifdef MISSIONPACK
;1266:	if( g_gametype.integer == GT_CTF || g_gametype.integer == GT_1FCTF ) {
;1267:#else	
;1268:	if( g_gametype.integer == GT_CTF) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $477
line 1270
;1269:#endif
;1270:		Team_CheckHurtCarrier(targ, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Team_CheckHurtCarrier
CALLV
pop
line 1271
;1271:	}
LABELV $477
line 1273
;1272:
;1273:	if (targ->client) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $480
line 1275
;1274:		// set the last client who damaged the target
;1275:		targ->client->lasthurt_client = attacker->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2656
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 1276
;1276:		targ->client->lasthurt_mod = mod;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2660
ADDP4
ADDRFP4 28
INDIRI4
ASGNI4
line 1277
;1277:	}
LABELV $480
line 1280
;1278:
;1279:	// Shafe - Trep - Headshots
;1280:	if (targ->client && attacker->client && targ->health > 0)
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
CNSTI4 524
ASGNI4
ADDRLP4 80
CNSTU4 0
ASGNU4
ADDRLP4 72
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 80
INDIRU4
EQU4 $482
ADDRFP4 8
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 80
INDIRU4
EQU4 $482
ADDRLP4 72
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 0
LEI4 $482
line 1281
;1281:	{   
line 1283
;1282:		// let's say only railgun can do head shots
;1283:		if(inflictor->s.weapon==WP_RAILGUN){
ADDRFP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 7
NEI4 $484
line 1284
;1284:			targ_maxs2 = targ->r.maxs[2];
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRF4
ASGNF4
line 1287
;1285:	
;1286:			// handling crouching
;1287:			if(targ->client->ps.pm_flags & PMF_DUCKED){
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $486
line 1288
;1288:				height = (abs(targ->r.mins[2]) + targ_maxs2)*(0.75);
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 84
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 32
CNSTF4 1061158912
ADDRLP4 84
INDIRI4
CVIF4 4
ADDRLP4 36
INDIRF4
ADDF4
MULF4
CVFI4 4
ASGNI4
line 1289
;1289:			}
ADDRGP4 $487
JUMPV
LABELV $486
line 1291
;1290:			else
;1291:				height = abs(targ->r.mins[2]) + targ_maxs2; 
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 84
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 84
INDIRI4
CVIF4 4
ADDRLP4 36
INDIRF4
ADDF4
CVFI4 4
ASGNI4
LABELV $487
line 1296
;1292:				
;1293:			// project the z component of point 
;1294:			// onto the z component of the model's origin
;1295:			// this results in the z component from the origin at 0
;1296:			z_rel = point[2] - targ->r.currentOrigin[2] + abs(targ->r.mins[2]);
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 92
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 28
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 504
ADDP4
INDIRF4
SUBF4
ADDRLP4 92
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1297
;1297:			z_ratio = z_rel / height;
ADDRLP4 24
ADDRLP4 28
INDIRF4
ADDRLP4 32
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 1299
;1298:		
;1299:			if (z_ratio > 0.90){
ADDRLP4 24
INDIRF4
CNSTF4 1063675494
LEF4 $488
line 1300
;1300:				take=9999; // head shot is a sure kill
ADDRLP4 8
CNSTI4 9999
ASGNI4
line 1301
;1301:				mod=MOD_HEADSHOT;
ADDRFP4 28
CNSTI4 23
ASGNI4
line 1302
;1302:			}
LABELV $488
line 1303
;1303:		}
LABELV $484
line 1304
;1304:	}
LABELV $482
line 1309
;1305:	// Shafe - Trep - End Headshot Code
;1306:
;1307:
;1308:	// do the damage
;1309:	if (take) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $490
line 1310
;1310:		targ->health = targ->health - take;
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 1311
;1311:		if ( targ->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $492
line 1312
;1312:			targ->client->ps.stats[STAT_HEALTH] = targ->health;
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 88
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
ASGNI4
line 1313
;1313:		}
LABELV $492
line 1315
;1314:			
;1315:		if ( targ->health <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 0
GTI4 $494
line 1316
;1316:			if ( client )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $496
line 1317
;1317:				targ->flags |= FL_NO_KNOCKBACK;
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
LABELV $496
line 1319
;1318:
;1319:			if (targ->health < -999)
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 -999
GEI4 $498
line 1320
;1320:				targ->health = -999;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 -999
ASGNI4
LABELV $498
line 1322
;1321:
;1322:			targ->enemy = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 1323
;1323:			targ->die (targ, inflictor, attacker, take, mod);
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 92
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CALLV
pop
line 1324
;1324:			return;
ADDRGP4 $389
JUMPV
LABELV $494
line 1325
;1325:		} else if ( targ->pain ) {
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $500
line 1326
;1326:			targ->pain (targ, attacker, take);
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 88
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CALLV
pop
line 1327
;1327:		}
LABELV $500
line 1328
;1328:	}
LABELV $490
line 1330
;1329:
;1330:}
LABELV $389
endproc G_Damage 96 24
export CanDamage
proc CanDamage 112 28
line 1341
;1331:
;1332:
;1333:/*
;1334:============
;1335:CanDamage
;1336:
;1337:Returns qtrue if the inflictor can directly damage the target.  Used for
;1338:explosions and melee attacks.
;1339:============
;1340:*/
;1341:qboolean CanDamage (gentity_t *targ, vec3_t origin) {
line 1348
;1342:	vec3_t	dest;
;1343:	trace_t	tr;
;1344:	vec3_t	midpoint;
;1345:
;1346:	// use the midpoint of the bounds instead of the origin, because
;1347:	// bmodels may have their origin is 0,0,0
;1348:	VectorAdd (targ->r.absmin, targ->r.absmax, midpoint);
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 80
INDIRP4
CNSTI4 472
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 484
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 80
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12+8
ADDRLP4 84
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1349
;1349:	VectorScale (midpoint, 0.5, midpoint);
ADDRLP4 88
CNSTF4 1056964608
ASGNF4
ADDRLP4 12
ADDRLP4 88
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 88
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 12+8
CNSTF4 1056964608
ADDRLP4 12+8
INDIRF4
MULF4
ASGNF4
line 1351
;1350:
;1351:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1352
;1352:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1353
;1353:	if (tr.fraction == 1.0 || tr.entityNum == targ->s.number)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
EQF4 $513
ADDRLP4 24+52
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $509
LABELV $513
line 1354
;1354:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $502
JUMPV
LABELV $509
line 1358
;1355:
;1356:	// this should probably check in the plane of projection, 
;1357:	// rather than in world coordinate, and also include Z
;1358:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1359
;1359:	dest[0] += 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1360
;1360:	dest[1] += 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1361
;1361:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1362
;1362:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $515
line 1363
;1363:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $502
JUMPV
LABELV $515
line 1365
;1364:
;1365:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1366
;1366:	dest[0] += 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1367
;1367:	dest[1] -= 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1368
;1368:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1369
;1369:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $519
line 1370
;1370:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $502
JUMPV
LABELV $519
line 1372
;1371:
;1372:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1373
;1373:	dest[0] -= 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1374
;1374:	dest[1] += 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1375
;1375:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1376
;1376:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $523
line 1377
;1377:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $502
JUMPV
LABELV $523
line 1379
;1378:
;1379:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1380
;1380:	dest[0] -= 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1381
;1381:	dest[1] -= 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1382
;1382:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1383
;1383:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $527
line 1384
;1384:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $502
JUMPV
LABELV $527
line 1387
;1385:
;1386:
;1387:	return qfalse;
CNSTI4 0
RETI4
LABELV $502
endproc CanDamage 112 28
export G_RadiusDamage
proc G_RadiusDamage 4196 32
line 1397
;1388:}
;1389:
;1390:
;1391:/*
;1392:============
;1393:G_RadiusDamage
;1394:============
;1395:*/
;1396:qboolean G_RadiusDamage ( vec3_t origin, gentity_t *attacker, float damage, float radius,
;1397:					 gentity_t *ignore, int mod) {
line 1406
;1398:	float		points, dist;
;1399:	gentity_t	*ent;
;1400:	int			entityList[MAX_GENTITIES];
;1401:	int			numListedEntities;
;1402:	vec3_t		mins, maxs;
;1403:	vec3_t		v;
;1404:	vec3_t		dir;
;1405:	int			i, e;
;1406:	qboolean	hitClient = qfalse;
ADDRLP4 4168
CNSTI4 0
ASGNI4
line 1408
;1407:
;1408:	if ( radius < 1 ) {
ADDRFP4 12
INDIRF4
CNSTF4 1065353216
GEF4 $531
line 1409
;1409:		radius = 1;
ADDRFP4 12
CNSTF4 1065353216
ASGNF4
line 1410
;1410:	}
LABELV $531
line 1412
;1411:
;1412:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $533
line 1413
;1413:		mins[i] = origin[i] - radius;
ADDRLP4 4172
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4172
INDIRI4
ADDRLP4 4144
ADDP4
ADDRLP4 4172
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRFP4 12
INDIRF4
SUBF4
ASGNF4
line 1414
;1414:		maxs[i] = origin[i] + radius;
ADDRLP4 4176
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4176
INDIRI4
ADDRLP4 4156
ADDP4
ADDRLP4 4176
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ASGNF4
line 1415
;1415:	}
LABELV $534
line 1412
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $533
line 1417
;1416:
;1417:	numListedEntities = trap_EntitiesInBox( mins, maxs, entityList, MAX_GENTITIES );
ADDRLP4 4144
ARGP4
ADDRLP4 4156
ARGP4
ADDRLP4 44
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4172
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4140
ADDRLP4 4172
INDIRI4
ASGNI4
line 1419
;1418:
;1419:	for ( e = 0 ; e < numListedEntities ; e++ ) {
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 $540
JUMPV
LABELV $537
line 1420
;1420:		ent = &g_entities[entityList[ e ]];
ADDRLP4 4
CNSTI4 876
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 44
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1422
;1421:
;1422:		if (ent == ignore)
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRFP4 16
INDIRP4
CVPU4 4
NEU4 $541
line 1423
;1423:			continue;
ADDRGP4 $538
JUMPV
LABELV $541
line 1424
;1424:		if (!ent->takedamage)
ADDRLP4 4
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
CNSTI4 0
NEI4 $543
line 1425
;1425:			continue;
ADDRGP4 $538
JUMPV
LABELV $543
line 1428
;1426:
;1427:		// find the distance from the edge of the bounding box
;1428:		for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $545
line 1429
;1429:			if ( origin[i] < ent->r.absmin[i] ) {
ADDRLP4 4176
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4176
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4176
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 472
ADDP4
ADDP4
INDIRF4
GEF4 $549
line 1430
;1430:				v[i] = ent->r.absmin[i] - origin[i];
ADDRLP4 4180
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4180
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 4180
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 472
ADDP4
ADDP4
INDIRF4
ADDRLP4 4180
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1431
;1431:			} else if ( origin[i] > ent->r.absmax[i] ) {
ADDRGP4 $550
JUMPV
LABELV $549
ADDRLP4 4180
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4180
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4180
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 484
ADDP4
ADDP4
INDIRF4
LEF4 $551
line 1432
;1432:				v[i] = origin[i] - ent->r.absmax[i];
ADDRLP4 4184
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4184
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 4184
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4184
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 484
ADDP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1433
;1433:			} else {
ADDRGP4 $552
JUMPV
LABELV $551
line 1434
;1434:				v[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTF4 0
ASGNF4
line 1435
;1435:			}
LABELV $552
LABELV $550
line 1436
;1436:		}
LABELV $546
line 1428
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $545
line 1438
;1437:
;1438:		dist = VectorLength( v );
ADDRLP4 8
ARGP4
ADDRLP4 4176
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 4176
INDIRF4
ASGNF4
line 1439
;1439:		if ( dist >= radius ) {
ADDRLP4 24
INDIRF4
ADDRFP4 12
INDIRF4
LTF4 $553
line 1440
;1440:			continue;
ADDRGP4 $538
JUMPV
LABELV $553
line 1443
;1441:		}
;1442:
;1443:		points = damage * ( 1.0 - dist / radius );
ADDRLP4 40
ADDRFP4 8
INDIRF4
CNSTF4 1065353216
ADDRLP4 24
INDIRF4
ADDRFP4 12
INDIRF4
DIVF4
SUBF4
MULF4
ASGNF4
line 1445
;1444:
;1445:		if( CanDamage (ent, origin) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4180
ADDRGP4 CanDamage
CALLI4
ASGNI4
ADDRLP4 4180
INDIRI4
CNSTI4 0
EQI4 $555
line 1446
;1446:			if( LogAccuracyHit( ent, attacker ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4184
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 4184
INDIRI4
CNSTI4 0
EQI4 $557
line 1447
;1447:				hitClient = qtrue;
ADDRLP4 4168
CNSTI4 1
ASGNI4
line 1448
;1448:			}
LABELV $557
line 1449
;1449:			VectorSubtract (ent->r.currentOrigin, origin, dir);
ADDRLP4 4192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 4
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRLP4 4192
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 4
INDIRP4
CNSTI4 500
ADDP4
INDIRF4
ADDRLP4 4192
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28+8
ADDRLP4 4
INDIRP4
CNSTI4 504
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1452
;1450:			// push the center of mass higher than the origin so players
;1451:			// get knocked into the air more
;1452:			dir[2] += 24;
ADDRLP4 28+8
ADDRLP4 28+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 1453
;1453:			G_Damage (ent, NULL, attacker, dir, origin, (int)points, DAMAGE_RADIUS, mod);
ADDRLP4 4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
INDIRF4
CVFI4 4
ARGI4
CNSTI4 1
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1454
;1454:		}
LABELV $555
line 1455
;1455:	}
LABELV $538
line 1419
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $540
ADDRLP4 20
INDIRI4
ADDRLP4 4140
INDIRI4
LTI4 $537
line 1457
;1456:
;1457:	return hitClient;
ADDRLP4 4168
INDIRI4
RETI4
LABELV $530
endproc G_RadiusDamage 4196 32
import CountSurvivors
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
import G_InvulnerabilityEffect
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
LABELV $469
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 58
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $355
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
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $340
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
byte 1 108
byte 1 97
byte 1 102
byte 1 102
byte 1 48
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $337
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
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $334
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
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $331
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
byte 1 52
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $328
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
byte 1 53
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $320
byte 1 115
byte 1 0
align 1
LABELV $319
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 46
byte 1 49
byte 1 53
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 72
byte 1 97
byte 1 115
byte 1 32
byte 1 66
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 69
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $318
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 72
byte 1 97
byte 1 115
byte 1 32
byte 1 66
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 69
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 33
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
byte 1 37
byte 1 46
byte 1 49
byte 1 53
byte 1 115
byte 1 94
byte 1 55
byte 1 39
byte 1 115
byte 1 32
byte 1 65
byte 1 114
byte 1 115
byte 1 101
byte 1 110
byte 1 97
byte 1 108
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 69
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $313
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 39
byte 1 115
byte 1 32
byte 1 65
byte 1 114
byte 1 115
byte 1 101
byte 1 110
byte 1 97
byte 1 108
byte 1 32
byte 1 73
byte 1 115
byte 1 32
byte 1 69
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $276
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 77
byte 1 97
byte 1 100
byte 1 101
byte 1 32
byte 1 70
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 32
byte 1 83
byte 1 116
byte 1 114
byte 1 105
byte 1 107
byte 1 101
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $275
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
byte 1 108
byte 1 97
byte 1 102
byte 1 102
byte 1 48
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $238
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $237
byte 1 60
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 111
byte 1 98
byte 1 105
byte 1 116
byte 1 117
byte 1 97
byte 1 114
byte 1 121
byte 1 62
byte 1 0
align 1
LABELV $230
byte 1 60
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 62
byte 1 0
align 1
LABELV $229
byte 1 60
byte 1 110
byte 1 111
byte 1 110
byte 1 45
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 62
byte 1 0
align 1
LABELV $207
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $206
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $186
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $185
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $174
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 71
byte 1 82
byte 1 65
byte 1 80
byte 1 80
byte 1 76
byte 1 69
byte 1 0
align 1
LABELV $173
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 84
byte 1 85
byte 1 82
byte 1 82
byte 1 69
byte 1 84
byte 1 0
align 1
LABELV $172
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 72
byte 1 69
byte 1 65
byte 1 68
byte 1 83
byte 1 72
byte 1 79
byte 1 84
byte 1 0
align 1
LABELV $171
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 84
byte 1 82
byte 1 73
byte 1 71
byte 1 71
byte 1 69
byte 1 82
byte 1 95
byte 1 72
byte 1 85
byte 1 82
byte 1 84
byte 1 0
align 1
LABELV $170
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 84
byte 1 65
byte 1 82
byte 1 71
byte 1 69
byte 1 84
byte 1 95
byte 1 76
byte 1 65
byte 1 83
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $169
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 83
byte 1 85
byte 1 73
byte 1 67
byte 1 73
byte 1 68
byte 1 69
byte 1 0
align 1
LABELV $168
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 70
byte 1 65
byte 1 76
byte 1 76
byte 1 73
byte 1 78
byte 1 71
byte 1 0
align 1
LABELV $167
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 84
byte 1 69
byte 1 76
byte 1 69
byte 1 70
byte 1 82
byte 1 65
byte 1 71
byte 1 0
align 1
LABELV $166
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 67
byte 1 82
byte 1 85
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $165
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 76
byte 1 65
byte 1 86
byte 1 65
byte 1 0
align 1
LABELV $164
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 83
byte 1 76
byte 1 73
byte 1 77
byte 1 69
byte 1 0
align 1
LABELV $163
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $162
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 66
byte 1 70
byte 1 71
byte 1 95
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $161
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 66
byte 1 70
byte 1 71
byte 1 0
align 1
LABELV $160
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 76
byte 1 73
byte 1 71
byte 1 72
byte 1 84
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 0
align 1
LABELV $159
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 82
byte 1 65
byte 1 73
byte 1 76
byte 1 71
byte 1 85
byte 1 78
byte 1 0
align 1
LABELV $158
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 77
byte 1 65
byte 1 95
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $157
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 77
byte 1 65
byte 1 0
align 1
LABELV $156
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 82
byte 1 79
byte 1 67
byte 1 75
byte 1 69
byte 1 84
byte 1 95
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $155
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 82
byte 1 79
byte 1 67
byte 1 75
byte 1 69
byte 1 84
byte 1 0
align 1
LABELV $154
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 71
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 68
byte 1 69
byte 1 95
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $153
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 71
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 68
byte 1 69
byte 1 0
align 1
LABELV $152
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 77
byte 1 65
byte 1 67
byte 1 72
byte 1 73
byte 1 78
byte 1 69
byte 1 71
byte 1 85
byte 1 78
byte 1 0
align 1
LABELV $151
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 71
byte 1 65
byte 1 85
byte 1 78
byte 1 84
byte 1 76
byte 1 69
byte 1 84
byte 1 0
align 1
LABELV $150
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 83
byte 1 72
byte 1 79
byte 1 84
byte 1 71
byte 1 85
byte 1 78
byte 1 0
align 1
LABELV $149
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 85
byte 1 78
byte 1 75
byte 1 78
byte 1 79
byte 1 87
byte 1 78
byte 1 0
